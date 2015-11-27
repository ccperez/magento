<?php 

require_once(Mage::getModuleDir('controllers','Mage_Catalog').DS.'ProductController.php');

class TutsPlus_demo_ProductController
	extends Mage_Catalog_ProductController {

	public function viewAction() {
		echo 'say hi - from Demo modules';
	}

}