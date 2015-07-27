<?php

class IndexController extends Zend_Controller_Action
{
    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('autenticacao/index');
        }
        
        $auth = Zend_Auth::getInstance();
        if ( $auth->hasIdentity() ){
        $identity = $auth->getIdentity();
        $ArrayIdentity = get_object_vars($identity);}
          
        $this->view->login = $data->nome;
        $this->view->sobre = $data->sobrenome;
        $this->view->id = $data->id_usuario;
        
        $this->modelProjeto = new Application_Model_UsuarioProjeto();
        $this->projeto = $this->modelProjeto->selectView('id_usuario = '.$ArrayIdentity['id_usuario']);
        $this->view->assign("projetos",$this->projeto); 
    }
}