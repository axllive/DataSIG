<?php

class Application_Model_Etiqueta
{

public function select($where = null, $order = null, $limit = null)
   {
      $dao = new Application_Model_DbTable_Etiqueta();
      $select = $dao->select()->from($dao)->order($order)->limit($limit);
      if(!is_null($where)){
         $select->where($where);
      }
      return $dao->fetchAll($select)->toArray();
   }
   
   public function selectView($where = null, $order = null, $limit = null)
   {
      $dao = new Application_Model_DbTable_VColetaEtiqueta();
      $select = $dao->select()->from($dao)->order($order)->limit($limit);
      if(!is_null($where)){
         $select->where($where);
      }
      return $dao->fetchAll($select)->toArray();
   }
   
   public function insert(array $request)
    {
        $dao = new Application_Model_DbTable_Etiqueta();
        $dados = [
            //'admin_projeto' => $request['admin_projeto'],
            'nome_etiqueta' => $request['nome_etiqueta'],
            'fk_id_projeto' => $request['id_projeto']
            ];
        $this->idEtiqueta = $dao->insert($dados);
        
        return $this->idEtiqueta;
    }
}

