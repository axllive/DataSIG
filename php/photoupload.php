<?php
include_once './db_functions.php';
//Create Object for DB_Functions clas
$db = new DB_Functions(); 
//Get JSON posted by Android Application

$base = $_POST["usersJSON"];

if (get_magic_quotes_gpc()){
$base = stripslashes($base);
}
//Decode JSON into an Array
$data = json_decode($base);
for($i=0; $i<count($data) ; $i++)
{
//Store User into MySQL DB
$finaldata = $data[$i]->foto;
}

        if (isset($finaldata)) {

            $url = "http://192.168.2.10/datasig/files/photos";
            $image_name = "img_"."_".date("Y-m-d-H-m-s").".jpg";
            $path = $url."".$image_name; // path of saved image 

            // base64 encoded utf-8 string
            $binary = base64_decode($finaldata);

            // binary, utf-8 bytes
            header("Content-Type: bitmap; charset=utf-8");

            $file = fopen("../files/photos//" . $image_name, "wb"); // 
            $filepath = $image_name; 
            fwrite($file, $binary);

            fclose($file);          

            //$result = mysql_query("INSERT INTO `users` (path) VALUES ('$path', now())");


        }
		$return = "1";
		echo json_encode($return);
?>