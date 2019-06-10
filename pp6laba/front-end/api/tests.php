<?php
if (isset($_POST['name']))
{
	require_once "db.php";

	$test_name = $_POST['name'];
	
	$query = "INSERT INTO Test(test_name) VALUES ('$test_name');";
	mysqli_query($db, $query);
	echo $db->insert_id;
	mysqli_close($db);
}

?>