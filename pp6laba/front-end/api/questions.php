<?php

if (isset($_POST['test_id'])&&isset($_POST['questions']))
{
	require_once "db.php";

	$test_id =  $_POST['test_id'];
	$questions_id = array();
	foreach ($_POST['questions'] as $question)
	{
		$question_text = $question['text'];
		$query = "INSERT INTO Question(question_text, test_id) VALUES ('$question_text', '$test_id');";
		mysqli_query($db, $query);
		$questions_id[]=$db->insert_id;
	}
	mysqli_close($db);
	echo json_encode($questions_id);
}
?>