<?php

class CadastroController extends Zend_Controller_Action
{

    public function init()
    {
         ///verifica se o usuário está logado
        if(Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }

        //verifica os dados do usuário
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
          $identity = $auth->getIdentity();
          $ArrayIdentity = get_object_vars($identity);
        }
  
    }
    
    public function indexAction()
    {
        $this->_helper->layout->disableLayout();
    }

    public function viewAction()
    {
    }
    
    public function perfilAction()
    {
        $idUsuario = $this->_getParam('id');
        $this->view->assign('user',$idUsuario);
    }
 
    public function createAction(){        
        $model = new Application_Model_Usuario;
        $model->insert($this->_getAllParams());
        $this->_redirect('index');
        
    }

}

