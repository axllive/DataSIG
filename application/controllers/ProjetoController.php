<?php

class ProjetoController extends Zend_Controller_Action
{
    public function init()
    {
         ///verifica se o usuário está logado
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        ///Caso logado, envia ele para a tela principal da tela "admin"
        //verifica os dados do usuário
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
          $identity = $auth->getIdentity();
          $ArrayIdentity = get_object_vars($identity); }
                    
         $this->view->login = $ArrayIdentity['nome'];
        $this->view->sobre = $ArrayIdentity['sobrenome'];
        $this->view->id = $ArrayIdentity['id_usuario'];
        
        $this->modelProjeto = new Application_Model_Projeto();
        $this->usuario = $this->modelProjeto->select($ArrayIdentity['id_usuario']);
        $this->view->assign("usuario",$this->usuario);   
    }

    public function indexAction()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
        $this->_redirect('index');
        }
        ///Caso logado, envia ele para a tela principal da tela "admin"
        //verifica os dados do usuário
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
          $identity = $auth->getIdentity();
          $ArrayIdentity = get_object_vars($identity); }        
        
          $this->modelProjeto = new Application_Model_UsuarioProjeto();
          $usuarioProjeto = $this->modelProjeto->selectView();
          //print_r($usuarioProjeto);
    }
    
    public function criarAction()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
         //verifica os dados do usuário
         $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
         $identity = $auth->getIdentity();
         $ArrayIdentity = get_object_vars($identity);}   
       
        $this->modelProjeto = new Application_Model_UsuarioProjeto();
        $this->projetos = $this->modelProjeto->selectView('id_usuario = '.$ArrayIdentity['id_usuario']);
        $this->view->assign("projetos",$this->projetos);
    }
    
    public function novoAction()
    {
        $model = new Application_Model_Projeto;
        $model->insert($this->_getAllParams());
        $this->_redirect('index');
        
        //$this->modelProjeto = new Application_Model_UsuarioProjeto();
        //$this->projetos = $this->modelProjeto->selectView('id_usuario = '.$ArrayIdentity['id_usuario']);
        //$this->view->assign("projetos",$this->projetos);
        
    }
    
    public function buscasAction(){

        $busca_projeto = $this->_getAllParams();
        
        if(empty($busca_projeto['busca'])){
            $busca_projeto = $this->modelProjeto->select();
        }
        else{
        $busca_projeto = $this->modelProjeto->select("nome_projeto ='".$busca_projeto['busca']."'");
        }
        $this->view->assign("busca_projetos",$busca_projeto);
        
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
         $identity = $auth->getIdentity();
         $ArrayIdentity = get_object_vars($identity);}  
        $this->modelProjeto = new Application_Model_UsuarioProjeto();
        $this->projetos = $this->modelProjeto->selectView('id_usuario = '.$ArrayIdentity['id_usuario']);
        $this->view->assign("projetos",$this->projetos);
        
    }
    
    public function participarAction(){
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
         $identity = $auth->getIdentity();
         $ArrayIdentity = get_object_vars($identity);}  
         
         $model = new Application_Model_Projeto;
         
        $idProjeto = $this->getParam('id');
        $idUsuario = $ArrayIdentity['id_usuario'];
        
        $model->participar($idProjeto, $idUsuario);
        $this->_redirect('index');
        
    }
    
    public function visualizarAction(){
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
         $identity = $auth->getIdentity();
         $ArrayIdentity = get_object_vars($identity);}  
        $this->modelProjeto = new Application_Model_UsuarioProjeto();
        $this->projetos = $this->modelProjeto->selectView('id_usuario = '.$ArrayIdentity['id_usuario']);
        $this->view->assign("projetos",$this->projetos);
        
        $idProjeto = $this->getParam('id');
        $model = new Application_Model_Etiqueta();
        
        $etiquetas = $model->selectView("fk_id_projeto = ".$idProjeto);
        $this->view->assign("etiquetas",$etiquetas);
        
        $this->view->assign('idprojeto', $idProjeto);
        
    }
    
}
