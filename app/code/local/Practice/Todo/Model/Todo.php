<?php
class Practice_Todo_Model_Todo 
	extends Mage_Core_Model_Abstract {

    protected function _construct() {
        $this->_init('todo/todo');
    }

}