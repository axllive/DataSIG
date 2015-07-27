<?php
    

class Application_Model_Projeto
{
    
   public $dbTableUsuarioProjeto; 
   public $idProjeto;
   
   public function lista($where = null, $order = null, $limit = null)
   {
       $dao = new Application_Model_DbTable_VListaProjeto();
       $select = $dao->select()->from($dao)->order($order)->limit($limit);
       if(!is_null($where)){
           $select->where($where);
       }
       return $dao->fetchAll($select)->toArray();
   }
   
   
   
   public function select($where = null, $order = null, $limit = null)
   {
      $dao = new Application_Model_DbTable_Projeto();
      $select = $dao->select()->from($dao)->order($order)->limit($limit);
      if(!is_null($where)){
         $select->where($where);
      }
      return $dao->fetchAll($select)->toArray();
   }
   public function find($id_projeto)
   {
      $dao = new Application_Model_DbTable_Projeto();
      $arr = $dao->find($id_projeto)->toArray();
      return $arr[0];
   }   
   
    public function insert(array $request)
    {
        $dao2 = new Application_Model_DbTable_UsuarioProjeto();
        $dao = new Application_Model_DbTable_Projeto();
        $dados = [
            //'admin_projeto' => $request['admin_projeto'],
            'nome_projeto' => $request['nome_projeto'],
            'descricao_projeto' => $request['descricao_projeto']
            ];
        $this->idProjeto = $dao->insert($dados);
        
        $dados2 = [
            'fk_id_usuario' => $request['admin_projeto'],
            'fk_id_projeto' => $this->idProjeto,
            'tipo_usuario' => 1
        ];
        $dao2->insert($dados2);
        return $this->idProjeto;
    }
    public function participar($idProjeto, $idUsuario)
    {
        $dao2 = new Application_Model_DbTable_UsuarioProjeto();

        $dados2 = [
            'fk_id_usuario' => $idUsuario,
            'fk_id_projeto' => $idProjeto,
            'tipo_usuario' => 2
        ];
        $dao2->insert($dados2);
        return $this->idProjeto;
    }
}