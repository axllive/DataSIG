<?php
include_once './db_functions.php';
//Create Object for DB_Functions clas
$db = new DB_Functions(); 
//Get JSON posted by Android Application
$json = $_POST["usersJSON"];
//Remove Slashes
if (get_magic_quotes_gpc()){
$json = stripslashes($json);
}
//Decode JSON into an Array
$data = json_decode($json);

$return= array();
for($i=0; $i<count($data) ; $i++)
{
//Store User into MySQL DB
$return = $db->getUserProj($data[$i]->login);
}
//Post JSON response back to Android Application
echo json_encode($return);
?>