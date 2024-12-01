<?php

function openConnection()
{
    $dbConn = new mysqli('database.cc.localhost', 'test_user', 'test_password', 'course_catalog') or die("Connect failed: %s\n" . $dbConn->error);
    $dbConn->set_charset('utf8');

    return $dbConn;
}

function closeConnection($dbConn)
{
    $dbConn->close();
}