<?php
$servername = "localhost";
$username   = "root";
$password   = "";
$dbname     = "kbndatabase";

$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if (isset($_GET['MN']) && isset($_GET['CN']) && isset($_GET['S'])) {
    $MaterialName = $_GET['MN'];
    $CodeName = $_GET['CN'];
    $Supplier = $_GET['S'];
    $datetoday = date_create($_GET['date']);
    $dt = $datetoday->format('Y-m-d');
} else {
    $MaterialName = 0;
    $CodeName = 0;
    $Supplier = 0;
    $datetoday = date_create("2022-01-01");
    $dt = $datetoday->format('Y-m-d');
}

if (isset($_POST['submit']) && isset($_POST['dateToday']) && isset($_POST['relVolume'])) {
    $MatsName = $_POST['itemName'];
    $CodeName = $_POST['itemCode'];
    $Suppl = $_POST['itemSupplier'];
    $dateNow = date('Y-m-d', strtotime($_POST['dateToday']));
    $Vol = $_POST['relVolume'];

    try {
        $sql = "SELECT * FROM tblcurrentmonth WHERE MATERIAL_NAME = '" . $MaterialName . "' AND CODE_NAME = '" . $CodeName . "' AND SUPPLIER = '" . $Supplier . "' AND DATE_TODAY = '" . $dateNow . "'";
        $stmt = $conn->prepare($sql);
        $stmt->execute();

        if ($stmt->rowCount() == 0) {
            $sql = "INSERT INTO tblcurrentmonth(MATERIAL_NAME, CODE_NAME, SUPPLIER, todayCurrentVolume, RECEIVED_VOLUME, APPEARANCE, RELEASED_VOLUME, REJECT_VOLUME, HOLD_VOLUME, PROD_RETURN, DATE_TODAY, CATEGORIES) SELECT MATERIAL_NAME, CODE_NAME, SUPPLIER, todayCurrentVolume, RECEIVED_VOLUME, APPEARANCE, RELEASED_VOLUME, REJECT_VOLUME, HOLD_VOLUME, PROD_RETURN, '" . $dateNow . "', CATEGORIES FROM tblcurrentmonth WHERE MATERIAL_NAME = '" . $MaterialName . "' AND CODE_NAME = '" . $CodeName . "' AND SUPPLIER = '" . $Supplier . "' ORDER BY DATE_TODAY DESC LIMIT 1; ";

            $stmt = $conn->prepare($sql);
            $stmt->execute();

            echo $stmt->rowCount() . " new data successfully added </br>";

            $sql = "UPDATE tblcurrentmonth SET todayCurrentVolume = todayCurrentVolume - " . $Vol . " WHERE MATERIAL_NAME = '" . $MaterialName . "' AND CODE_NAME = '" . $CodeName . "' AND SUPPLIER = '" . $Supplier . "' AND DATE_TODAY >= '" . $dateNow . "';" .
                "UPDATE tblcurrentmonth SET RELEASED_VOLUME = RELEASED_VOLUME + " . $Vol . " WHERE MATERIAL_NAME = '" . $MaterialName . "' AND CODE_NAME = '" . $CodeName . "' AND SUPPLIER = '" . $Supplier . "' AND DATE_TODAY = '" . $dateNow . "';";

            $stmt = $conn->prepare($sql);
            $stmt->execute();

            echo $stmt->rowCount() . " records UPDATED successfully </br>";

            echo $sql;
        } else {
            $sql = "UPDATE tblcurrentmonth SET todayCurrentVolume = todayCurrentVolume - " . $Vol . " WHERE MATERIAL_NAME = '" . $MaterialName . "' AND CODE_NAME = '" . $CodeName . "' AND SUPPLIER = '" . $Supplier . "' AND DATE_TODAY >= '" . $dateNow . "';" .
                "UPDATE tblcurrentmonth SET RELEASED_VOLUME = RELEASED_VOLUME + " . $Vol . " WHERE MATERIAL_NAME = '" . $MaterialName . "' AND CODE_NAME = '" . $CodeName . "' AND SUPPLIER = '" . $Supplier . "' AND DATE_TODAY = '" . $dateNow . "';";

            $stmt = $conn->prepare($sql);
            $stmt->execute();

            echo $stmt->rowCount() . " records UPDATED successfully </br>";

            echo $sql . "</br>";
        }
    } catch (PDOException $e) {
        echo $sql . "<br>" . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>KBN RELEASING PRODUCT</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Onest">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }

        .form-container h2 {
            text-align: center;
        }

        .form-container p {
            margin-bottom: 15px;
        }

        .form-container input[type="text"],
        .form-container input[type="date"],
        .form-container input[type="number"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-container input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>KBN RELEASING PRODUCT</h2>
        <form method="POST">
            <p>
                Material Name:
                <?php
                    echo '<input type="text" name="itemName" id="itemIDD" value="' . $MaterialName . '" readonly />';
                ?>
            </p>

            <p>
                Code Name:
                <?php
                    echo '<input type="text" name="itemCode" id="itemIDD" value="' . $CodeName . '" readonly />';
                ?>
            </p>

            <p>
                Supplier:
                <?php
                    echo '<input type="text" name="itemSupplier" id="itemIDD" value="' . $Supplier . '" readonly />';
                ?>
            </p>

            <p>
                Date of Released
                <?php
                    echo '<input type="date" name="dateToday" id="dateToday" value="' . $dt . '" />';
                ?>
            </p>

            <p>
                Released Volume
                <input type="number" name="relVolume" id="relVolume" min="0" value="0">
            </p>
            <input type="submit" name="submit" value="Submit">
        </form>
    </div>
</body>
</html>
