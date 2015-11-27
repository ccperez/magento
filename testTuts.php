<?php

require_once 'app/Mage.php';
Mage::app();

/*

	//	+ Direct Instant
	//		magentoRoot/lib/Varien/Autoload.php
	//		+	function autoload($class)
	//		* str_replace(' ', DIRECTORY_SEPARATOR, ucwords(str_replace('_', ' ', $class)));
	//		- replace '_' to ' ', upper case each words, replace ' ' DIRECTORY_SEPARATOR
	//		= TutsPlus/Demo/Model/Product

	$product = new TutsPlus_Demo_Model_Product;
	$product->sayHello();
	$customer1 = new Mage_Customer_Model_Session;

	//	+ Class Instant - FactoryPattern
	//		appRoot/code/code-local/Namespace/modules/etc/config.xml
	//		- models>customer>class - Mage_Customer_Model + classfilename
	//		= Mage_Customer_Model_Session

	$customer2 = Mage::getModel('customer/session');
	echo "<hr>"; 
	echo get_class($customer2);

	$product = Mage::getModel('demo/product');
	echo "<hr>"; 
	$product->sayHello();
	echo "<br>" .get_class($product);

	// Helper
	$helperCustomer = Mage::helper('demo/customer');
	echo "<hr>";
	$helperCustomer->sayHi();

	// Only for Helper
	$helperCustomer = Mage::helper('demo');
	echo "<hr>";
	$helperCustomer->sayHi();


	// Class Rewriting - refer to TutsPlus_Catalog
	echo "<hr>";
	$category = Mage::getModel("catalog/category")->load(2);
	var_dump($category->getChildren());

*/

$products = Mage::getModel('catalog/product')->getCollection()
						->addAttributeToSelect(array('name', 'price'))
						->addFieldToFilter('price', array("gt" => 50));

foreach($products as $product) {
	echo $product."<br>";
}