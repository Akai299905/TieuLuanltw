<?php
session_start();
require_once __DIR__ . '/../libraries/Database.php';
require_once __DIR__ . '/../libraries/Function.php';

$db = new Database;

define("ROOT", $_SERVER['DOCUMENT_ROOT'] . "/GiaDungShop/public/uploads");
$categories = $db->fetchsql("SELECT * FROM category WHERE status = 1 ORDER BY id ASC");
