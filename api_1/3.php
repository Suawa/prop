<?php

header('Content-Type: application/json');

$date = $_GET['date'];
$result = date("w", $date);

echo json_encode($result, JSON_UNESCAPED_UNICODE);
require_once "save.php";
Save("all_results.json", $result);
?>