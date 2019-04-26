<?php

header('Content-Type: application/json; charset=utf-8');

$n  = basename($_SERVER['REQUEST_URI']);
$regions = json_decode(file_get_contents("regions.json"));
$result = $regions->$n;

echo json_encode($result, JSON_UNESCAPED_UNICODE);
require_once "save.php";
Save("all_results.json", $result);
?>