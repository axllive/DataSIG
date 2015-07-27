<?php

class Application_Model_UsuarioProjeto
{
    public function select($where=null, $order=null, $limit=null)
    {
      $dao = new Application_Model_DbTable_Usuario();
      $select = $dao->select()->from($dao)->order($order)->limit($limit);
      if(!is_null($where)){
         $select->where($where);
      }
      return $dao->fetchAll($select)->toArray();
    }
    
    public function selectView($where=null, $order=null, $limit=null)
    {
      $dao = new Application_Model_DbTable_VListaProjeto();
      $select = $dao->select()->from($dao)->order($order)->limit($limit);
      if(!is_null($where)){
         $select->where($where);
      }
      return $dao->fetchAll($select)->toArray();
    }
    
    public function insert_adm()
       {
        $dao = new Application_Model_DbTable_UsuarioProjeto();
        $dados = [
            'fk_id_usuario' => $request['login'],
            'fk_id_projeto' => $request[''],
            'tipo_usuario' => 1
            ];
        return $dao->insert($dados);
    }
    
        public function insert_usr()
       {
        $dao = new Application_Model_DbTable_UsuarioProjeto();
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
