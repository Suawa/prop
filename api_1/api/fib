<?php

header('Content-Type: application/json');

$n = basename($_SERVER['REQUEST_URI']);
function fibo($n)
{
    if ($n == 1 || $n == 2) {
        return 1;
    } else {
        return fibo($n - 1) + fibo($n - 2);
    }
}
$result = fibo($n);

echo json_encode($result, JSON_UNESCAPED_UNICODE);
require_once "save.php";
Save("all_results.json", $result);
?>