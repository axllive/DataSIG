<?php

class DB_Connect {

	//
	function __construct(){

	}

	//
	function __destruct(){
		//
	}

	//
	public function connect(){
		require_once 'config.php';
		//
		$con = mysql_connect(DB_HOST, DB_USER);
		//
		mysql_select_db(DB_DATABASE);

			//
		return $con;
	}

	//
	public function close(){
		mysql_close();
	}

}

?>