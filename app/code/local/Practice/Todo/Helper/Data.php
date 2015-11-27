<?php
class Practice_Todo_Helper_Data 
	extends Mage_Core_Helper_Abstract {

	const REFERER_QUERY_PARAM_NAME = 'referer';
	
	public function getTodoUrl($event, $id=null) {
		$url = 'todo/index/'.$event;
		$params = $id ? array('id' => $id) : $this->get_request();
		return $this->_getUrl($url, $params);
	}

	// * Private function
	private function get_request() {
		$params = array();
		if ($this->_getRequest()->getParam(self::REFERER_QUERY_PARAM_NAME)) {
			$params = array(self::REFERER_QUERY_PARAM_NAME => $this->_getRequest()->getParam(self::REFERER_QUERY_PARAM_NAME));
		}
		return $params;
	}
}