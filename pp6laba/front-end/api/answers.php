<?php

if (isset($_POST['questions']) && isset($_POST['questions_id']))
{
	require_once "db.php";

	for ($i=0;$i<count($_POST['questions']);$i++)
	{
		$current_q_id = $_POST['questions_id'][$i];
		array_pop($_POST['questions'][$i]['answers']);
		foreach ($_POST['questions'][$i]['answers'] as $answer)
		{
			$text = $answer['text'];
			if ($answer['correct']=="true")
				$correct = 1;
			else
				$correct = 0;
			$query = "INSERT INTO Answer(answer_text, question_id, correct) VALUES ('$text', '$current_q_id', '$correct');";
			mysqli_query($db, $query);
		}
	}
	mysqli_close($db);
	print_r($_POST);
}

?>