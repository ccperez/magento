<?php
class Practice_Todo_Block_Todo extends Mage_Core_Block_Template {
	public function getPostActionUrl() {
		return $this->helper('todo')->getTodoUrl('create');
	}
	
	public function getEditActionUrl()	{
		return $this->helper('todo')->getTodoEditUrl();
	}
	
}
