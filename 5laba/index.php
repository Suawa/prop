<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
<fieldset class="field">
    <legend>Клиенты</legend>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Клиенты" name="client_select">
        </fieldset>
    </form>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Добавить" name="client_add">
            <label>Имя</label><input type="text" name="client_name">
        </fieldset>
    </form>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Обновить" name="client_update">
            <label>ID клиента</label><input type="text" name="client_id">
            <label>Имя</label><input type="text" name="client_name">
        </fieldset>
    </form>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Удалить" name="client_delete">
            <label>ID клиента</label><input type="text" name="client_id">
        </fieldset>
    </form>
</fieldset>


<fieldset class="field">
    <legend>Заявки</legend>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Заявки" name="request_select">
        </fieldset>
    </form>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Добавить" name="request_add">
            <label>ID клиента</label><input type="text" name="client_id">
            <label>ID услуги</label><input type="text" name="service_id">
            <label>Количество</label><input type="text" name="count">
        </fieldset>
    </form>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Обновить" name="request_update">
            <label>ID заявки</label><input type="text" name="request_id">
            <label>Количество</label><input type="text" name="count">
        </fieldset>
    </form>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Удалить" name="request_delete">
            <label>ID заявки</label><input type="text" name="request_id">
        </fieldset>
    </form>
</fieldset>


<fieldset class="field">
    <legend>Услуги</legend>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Услуги" name="service_select">
        </fieldset>
    </form>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Добавить" name="service_add">
            <label>Название</label><input type="text" name="service_name">
            <label>Цена</label><input type="text" name="price">
        </fieldset>
    </form>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Обновить" name="service_update">
            <label>ID услуги</label><input type="text" name="service_id">
            <label>Название</label><input type="text" name="service_name">
            <label>Цена</label><input type="text" name="price">
        </fieldset>
    </form>
    <form action="index.php" method="get">
        <fieldset>
            <input type="submit" value="Удалить" name="service_delete">
            <label>ID услуги</label><input type="text" name="service_id">
        </fieldset>
    </form>
</fieldset>

<?php
///////////////////////////////////////////////////////////////////////////////////////////////
if (isset($_GET["client_select"])) {
    $api = 'http://localhost/5laba/pp2laba/client?method=sel';
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}
if (isset($_GET["service_select"])) {
    $api = 'http://localhost/5laba/pp2laba/service?method=sel';
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}
if (isset($_GET["request_select"])) {
    $api = 'http://localhost/5laba/pp2laba/request?method=sel';
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}


///////////////////////////////////////////////////////////////////////////////////////////////
if (isset($_GET["client_add"])){
   $api = 'http://localhost/5laba/pp2laba/client?method=add&name='.$_GET["client_name"];
   $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}
if (isset($_GET["request_add"])){
    $api = 'http://localhost/5laba/pp2laba/request?method=add&clientid='.$_GET["client_id"].'&serviceid='.$_GET["service_id"].'&count='.$_GET["count"];
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}
if (isset($_GET["service_add"])){
    $api = 'http://localhost/5laba/pp2laba/service?method=add&name='.$_GET["service_name"].'&price='.$_GET["price"];
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}


///////////////////////////////////////////////////////////////////////////////////////////////
if (isset($_GET["client_update"])){
    $api = 'http://localhost/5laba/pp2laba/client?method=ch&id='.$_GET["client_id"].'&name='.$_GET["client_name"];
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}
if (isset($_GET["request_update"])){
    $api = 'http://localhost/5laba/pp2laba/request?method=ch&id='.$_GET["request_id"].'&count='.$_GET["count"];
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}
if (isset($_GET["service_update"])){
    $api = 'http://localhost/5laba/pp2laba/service?method=ch&name='.$_GET["service_name"].'&price='.$_GET["price"].'&id='.$_GET["service_id"];
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}


///////////////////////////////////////////////////////////////////////////////////////////////
if (isset($_GET["client_delete"])){
    $api = 'http://localhost/5laba/pp2laba/client?method=del&id='.$_GET["client_id"];
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}
if (isset($_GET["request_delete"])){
    $api = 'http://localhost/5laba/pp2laba/request?method=del&id='.$_GET["request_id"];
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}
if (isset($_GET["service_delete"])){
    $api = 'http://localhost/5laba/pp2laba/service?method=del&id='.$_GET["service_id"];
    $ur = file_get_contents($api, $_SERVER['REQUEST_METHOD']);
}
?>