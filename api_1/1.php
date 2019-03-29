<?php

header('Content-Type: application/json; charset=utf-8');

$number = basename($_SERVER['REQUEST_URI']);
$result = (new \MessageFormatter('ru-RU', '{n, spellout}'))->format(['n' => $number]);

echo json_encode($result, JSON_UNESCAPED_UNICODE);
require_once "save.php";
Save("all_results.json", $result);
?>