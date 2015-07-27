<?php

class Application_Model_Usuario
{
   public function select($where = null, $order = null, $limit = null)
   {
      $dao = new Application_Model_DbTable_Usuario();
      $select = $dao->select()->from($dao)->order($order)->limit($limit);
      if(!is_null($where)){
         $select->where($where);
      }
      return $dao->fetchAll($select)->toArray();
   }
   public function find($id_usuario)
   {
      $dao = new Application_Model_DbTable_Usuario();
      $arr = $dao->find($id_usuario)->toArray();
      return $arr[0];
   }
   
    public function insert(array $request)
    {
        $dao = new Application_Model_DbTable_Usuario();
        $senha = md5($request['senha']);
        $dados = [
            'login' => $request['login'],
            'senha' => $senha,
            'nome' => $request['nome'],
            'sobrenome' => $request['sobrenome'],
            'email' => $request['email'],
            'dt_nasc' => $request['dt_nasc'],
            'instituicao' => $request['instituicao']
            ];
        return $dao->insert($dados);
    }
    
    
}