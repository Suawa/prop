<?php
function Save($filename,$response)
{
	$url = $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
	$result = array('url'=>$url,'response'=>$response,'method'=>$_SERVER['REQUEST_METHOD']);
	$json = json_encode($result,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
	file_put_contents($filename, $json . "\n", FILE_APPEND|LOCK_EX);
}
?>