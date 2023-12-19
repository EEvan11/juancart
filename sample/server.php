<?php
    if(session_status() == PHP_SESSION_NONE)
        session_start();
    else
        session_destroy();
?>

<html>
    <body>
        <h1>SERVER MAINTENANCE</h1>
        <a href="homepage/"><h2>Reconnect</h2></a>
    </body>
</html>