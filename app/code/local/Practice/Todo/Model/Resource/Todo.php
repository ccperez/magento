<?php
class Practice_Todo_Model_Resource_Todo 
	extends Mage_Core_Model_Resource_Db_Abstract {

 	protected function _construct() {
        $this->_init('todo/todo', 'id');
    }

}