<?php
class Practice_Todo_IndexController 
	extends Mage_Core_Controller_Front_Action {

	private $_model = "todo/todo";

	// form
	public function indexAction() {
		$todos = Mage::getModel($this->_model)->getCollection();
		$this->set_template('todo_list.phtml', 'todos', $todos);
    }

    public function addAction() {
    	$this->set_template('todo_form.phtml');
    }

    public function editAction() {
    	$id = $this->getRequest()->getParam('id');
    	$todo = Mage::getModel($this->_model)->load($id);
    	$this->set_template('todo_form.phtml', 'todo', $todo);
    }
	
	// process
	public function createAction() {
		if($this->getRequest()->isPost()) {
			$param = $this->getRequest()->getPost('todo');
			
			// if(!empty($param['title']) && !empty($param['description'])) {
			if ($this->not_empty($param)) {
				/*
					$data = array(
						'title'       => $param['title'],
						'description' => $param['description'],
						'date'        => now()
					);
				*/			
				$data = $this->get_post_value($param);
				
				/*
					$todo = Mage::getModel('todo/todo');
					$todo->setTitle($param['title']);
					$todo->setDescription($param['description']);
					$todo->save();
				*/
				$todo = Mage::getModel($this->_model)->setData($data)->save();

				$this->_redirect('*/');
			}
		}
	}
	public function updateAction() {
		if($this->getRequest()->isPost()) {
			$param = $this->getRequest()->getPost('todo');
			if ($this->not_empty($param)) {
				$data = $this->get_post_value($param);
				$id = $param['id'];
				$todo = Mage::getModel($this->_model)->load($id)->addData($data)->setId($id)->save();

				$this->_redirect('*/');
			}
		}		
	}

	public function saveAction() {
		if($this->getRequest()->isPost()) {
			$param = $this->getRequest()->getPost('todo');
			if ($this->not_empty($param)) {
				$data = $this->get_post_value($param);
				
				$id = $param['id'];
				$todo = empty($id) ? 
					Mage::getModel($this->_model)->setData($data)->save() : 
					Mage::getModel($this->_model)->load($id)->addData($data)->setId($id)->save();

				$this->_redirect('*/');
			}
		}		
	}

	public function deleteAction() {
		$id = $this->getRequest()->getParam('id');
		$todo = Mage::getModel($this->_model)->load($id)->delete();
		$this->_redirect('*/');
	}

	public function showAllTodosAction() {
		$todos = Mage::getModel('todo/todo')->getCollection();

		foreach($todos as $todo){
			echo '<h3>'.$todo->getTitle().'</h3>';
			echo $todo->getDescription();
		}
	}
	
	// Private function
	private function not_empty($arData) {
		$notEmpty = true;
		foreach(array_keys($arData) as $key) {
			if($key != 'id') {
				$notEmpty = (!empty($arData[$key]) && $notEmpty) == true ? true : false; 
			}
		}
		return $notEmpty;
	}
	
	private function get_post_value($arPost) {
		$post = [];
		foreach(array_keys($arPost) as $key) {
			if($key != 'id') $post[$key] = $arPost[$key];
		}
		$post['date'] = now();
		return $post;
	}

	private function set_template($formTemplate, $objData='', $data=null, $pageTemplate='page/1column.phtml') {
		$this->loadLayout();
        $block = $this->getLayout()->createBlock(
            'Mage_Core_Block_Template', 'todo',
            array('template' => 'local/todo/'.$formTemplate)
        );

        if($data) $block->assign($objData, $data);

        // $this->getLayout()->getBlock('root')->setTemplate($pageTemplate);
        $this->getLayout()->getBlock('content')->append($block);
        // $this->_initLayoutMessages('core/session'); 
        $this->renderLayout();		
	}
	
	private function print_var($var) {
		echo "<pre>";print_r($var);echo "</pre>";
		die();	
	}
}