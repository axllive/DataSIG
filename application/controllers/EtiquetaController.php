<?php

class EtiquetaController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
         $identity = $auth->getIdentity();
         $ArrayIdentity = get_object_vars($identity);}  
        $this->modelProjeto = new Application_Model_UsuarioProjeto();
        $this->projetos = $this->modelProjeto->selectView('id_usuario = '.$ArrayIdentity['id_usuario']);
        $this->view->assign("projetos",$this->projetos);
        
        $modelEtiqueta = new Application_Model_Etiqueta;
        $idProjeto = $this->getParam('id');
        $this->view->assign('idprojeto',$idProjeto);
        
        $etiquetas = $modelEtiqueta->select('fk_id_projeto = '.$idProjeto);
        
        $this->view->assign('etiquetas', $etiquetas);
    }
    
    public function criarAction(){
        
        $auth = Zend_Auth::getInstance();
         if ( $auth->hasIdentity() ){
         $identity = $auth->getIdentity();
         $ArrayIdentity = get_object_vars($identity);}  
        $this->modelProjeto = new Application_Model_UsuarioProjeto();
        $this->projetos = $this->modelProjeto->selectView('id_usuario = '.$ArrayIdentity['id_usuario']);
        $this->view->assign("projetos",$this->projetos);
        
        $modelEtiqueta = new Application_Model_Etiqueta;
        $etiqueta = $this->getAllParams();
        
        $modelEtiqueta->insert($etiqueta);
        $this->redirect('etiqueta/index/id/'.$etiqueta['id_projeto']);
        
        $this->view->assign('idprojeto', $etiqueta['id_projeto'] );
        
    }

}

