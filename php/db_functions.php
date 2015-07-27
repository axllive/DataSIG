<?php
 
class DB_Functions {
 
    private $db;
 
    //put your code here
    // constructor
    function __construct() {
        include_once './db_connect.php';
        // connecting to database
        $this->db = new DB_Connect();
        $this->db->connect();
    }
 
    // destructor
    function __destruct() {
 
    }
 
    /**
     * Storing new user
     * returns user details
     */
    public function storeUser($Id, $Valor, $Label, $Coord) {
        // Insert user into database
        $result = mysql_query("INSERT INTO coleta(valor,coord) VALUES('$Valor','$Coord')");
        $idColeta = mysql_insert_id();
 		
 		$Etiqueta = 0;
        if (!(strcmp($Label, "PH"))){
        	$Etiqueta = 17;
        }
        else if (!(strcmp($Label, "coliformes"))){
        	$Etiqueta = 16;
        }
		else if (!(strcmp($Label, "H2O"))){
        	$Etiqueta = 1;
        }
		else if (!(strcmp($Label, "CO2"))){
        	$Etiqueta = 2;
        }
		else if (!(strcmp($Label, "TamCaule"))){
        	$Etiqueta = 18;
        }
		else if (!(strcmp($Label, "CorFlor"))){
        	$Etiqueta = 19;
        }
		else if (!(strcmp($Label, "numPetalas"))){
        	$Etiqueta = 20;
        }
        $result2 = mysql_query("INSERT INTO coleta_etiqueta(fk_id_etiqueta,fk_id_coleta) VALUES('$Etiqueta','$idColeta')");
		
		if ($result2) {
            return true;
        } else {
            if( mysql_errno() == 1062) {
                // Duplicate key - Primary Key Violation
                return true;
            } else {
                // For other errors
                return false;
            }            
        }
    }
     /**
     * Getting all users
     */
    public function getAllUsers() {
        $result = mysql_query("select * FROM coleta");
        return $result;
    }
	public function loginAuth($Senha){
		$sql = "SELECT `login` FROM `usuario` WHERE `senha` = '$Senha'";
		$query = mysql_query($sql);
		$result = mysql_fetch_assoc($query);
		return $result;
	}
	
	public function getUserId($login){
		$sql = "SELECT `id_usuario` FROM `usuario` WHERE `login` = '$login' LIMIT 1";
		$query = mysql_query($sql);
		$result = mysql_fetch_assoc($query);
		return $result;
	}
	public function getUserProj($login){
		$sql = "SELECT id_projeto,nome_projeto FROM `v_usuario_projeto` WHERE `id_usuario` = (SELECT `id_usuario` FROM `usuario` WHERE `login` = '$login' LIMIT 1)";
		$query = mysql_query($sql);
		$resultado = array();
		while ($result = mysql_fetch_assoc($query)){
			$resultado[] = $result;
		}
		
		return $resultado;
	}
}
 
?>