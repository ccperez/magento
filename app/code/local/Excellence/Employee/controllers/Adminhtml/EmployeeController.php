<?php

class Excellence_Employee_Adminhtml_EmployeeController 
	extends Mage_Adminhtml_Controller_action {
 
    protected function _initAction()
    {
        $this->loadLayout()
            ->_setActiveMenu('employee/items')
            ->_addBreadcrumb(Mage::helper('adminhtml')->__('EmployeeManager'), Mage::helper('adminhtml')->__('Item Manager'));
        return $this;
    }  
    
    public function indexAction() {
        $this->_initAction();      
        $this->_addContent($this->getLayout()->createBlock('employee/adminhtml_employee'));
        $this->renderLayout();
    }    
}