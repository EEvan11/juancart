DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `CheckAndMoveExpiredOrders` ON SCHEDULE EVERY 10 SECOND STARTS '2023-10-31 12:00:24' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
#auto add ExpirationTime

  INSERT INTO tblorderexpirationtime (OrderRefNumber, Expiration)
  SELECT o.OrderRefNumber, DATE_ADD(NOW(), INTERVAL 5 DAY) AS ExpirationTime
  FROM tblorderstatus o
  LEFT JOIN tblorderexpirationtime e ON o.OrderRefNumber = e.OrderRefNumber
  WHERE o.Status = 'toPay'
  AND e.OrderRefNumber IS NULL;

  -- checker

  -- insert to archive
  INSERT INTO tblorderarchive (OrderNumber, OrderRefNumber, OrderDate, UserID, address, contact, email)
  SELECT b.OrderNumber, b.OrderRefNumber, b.OrderDate , b.UserID, b.address, b.contact, b.email
  FROM tblorderexpirationtime AS a
  JOIN tblordercheckout AS b ON b.OrderRefNumber = a.OrderRefNumber
  WHERE a.Expiration <= NOW() AND b.OrderRefNumber NOT IN (SELECT OrderRefNumber FROM tblorderarchive);

  INSERT INTO tblorderarchive (OrderNumber, OrderRefNumber, OrderDate, UserID, address, contact, email)
  SELECT b.OrderNumber, b.OrderRefNumber, b.OrderDate , b.UserID, b.address, b.contact, b.email
  FROM tblcancelledorder AS a
  JOIN tblordercheckout AS b ON b.OrderRefNumber = a.OrderRefNumber
  WHERE b.OrderRefNumber NOT IN(SELECT OrderRefNumber FROM tblorderarchive);

  -- for keep tracking data
  INSERT INTO tblordercheckoutdataarchive (OrderRefNumber, ProductName, volume, Quantity, Price)
  SELECT b.OrderRefNumber, b.ProductName, b.volume, b.Quantity, b.Price
  FROM tblorderarchive AS a
  JOIN tblordercheckoutdata AS b ON a.OrderRefNumber = b.OrderRefNumber
  WHERE b.OrderRefNumber NOT IN (SELECT OrderRefNumber FROM tblordercheckoutdataarchive);
  

  -- bring back the Quantity of Expired order
  UPDATE tblproducts AS a
  JOIN tblordercheckoutdataarchive AS b ON a.prodName = b.ProductName AND a.prodVolume = b.volume
  SET a.Quantity = a.Quantity + b.Quantity,
  a.Sold = a.Sold - b.Quantity,
  b.checker = 'Added'
  WHERE b.checker IS NULL;

  UPDATE tblrebrandingproducts AS a
  JOIN tblordercheckoutdataarchive AS b ON a.prodName = b.ProductName AND a.prodVolume = b.volume
  JOIN tblorderarchive AS c ON c.UserID = a.userID
  SET a.Sold = a.Sold - b.Quantity,
  b.checker = 'Added'
  WHERE b.checker IS NULL;

  -- delete

  -- Delete if already archive
    DELETE a
    FROM tblorderexpirationtime AS a
    JOIN tblorderstatus AS b ON a.OrderRefNumber = b.OrderRefNumber
    WHERE a.Expiration < NOW() || b.Status != 'toPay';

  -- Delete from toPay order
  DELETE a FROM tblordercheckout AS a
  JOIN tblorderarchive AS b
  WHERE a.OrderRefNumber = b.OrderRefNumber;

  -- Delete data
  DELETE a FROM tblordercheckoutdata AS a
  JOIN tblorderarchive AS b
  WHERE a.OrderRefNumber = b.OrderRefNumber;

  -- Update status

  UPDATE tblorderstatus AS a
  JOIN tblcancelledorder AS b ON a.OrderRefNumber = b.OrderRefNumber
  SET a.status = 'Cancelled'
  WHERE a.status != 'Expired' AND a.status != 'Cancelled';

  -- Expired
  UPDATE tblorderstatus AS a
  JOIN tblorderarchive AS b ON a.OrderRefNumber = b.OrderRefNumber
  SET a.status = 'Expired'
  WHERE b.OrderRefNumber NOT IN (SELECT OrderRefNumber FROM tblcancelledorder);
  
    -- Expired add to Cancel Table
    INSERT INTO tblcancelledorder (OrderRefNumber, CancelDate, Reason)
  SELECT a.OrderRefNumber, NOW(), 'Expired'
  FROM tblorderstatus AS a
  WHERE a.OrderRefNumber NOT IN (SELECT OrderRefNumber FROM tblcancelledorder)
  AND (a.Status = 'Cancelled' OR a.Status = 'Expired');
  
END$$

DELIMITER ;
COMMIT;



-- Expiration code
DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `verification` ON SCHEDULE EVERY 10 SECOND STARTS '2023-10-31 12:00:24' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

    -- DELETE Expired CODE
    DECLARE emailVar VARCHAR(255);
    DECLARE done INT DEFAULT 0;
    DECLARE cur CURSOR FOR
        SELECT email FROM tblprocedurestorage WHERE NOW() > expiration;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    
    event_loop: LOOP
        FETCH cur INTO emailVar;
        IF done = 1 THEN
            LEAVE event_loop;
        END IF;
        
        -- Store the email in a user-defined variable, e.g., @email_list
        SET @email_list = CONCAT_WS(',', @email_list, emailVar);
    END LOOP;
    
    CLOSE cur;
    
    -- Execute the DROP PROCEDURE statement for each email in the list
    SET @sql = CONCAT('DROP PROCEDURE IF EXISTS ', @email_list);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    -- Clear the email list variable
    SET @email_list = NULL;

    DELETE FROM tblprocedurestorage WHERE NOW() > expiration;
    
END$$


DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `deleteVerificationCode` ON SCHEDULE EVERY 10 SECOND STARTS '2023-10-31 12:00:24' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DELETE FROM tblverificationcode WHERE NOW() > Expiration;
END$$