<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//  the factory method pattern is a creational pattern that uses factory methods to deal with the problem of creating objects 
//  without having to specify the exact class of the object that will be created. 
//  This is done by creating objects by calling a factory method

// Define an interface for creating an object, but let subclasses decide which class to instantiate. 
// The Factory method lets a class defer instantiation it uses to subclasses

class ProductFactory
{
    public static function build($type) {
        // assumes the use of an autoloader
        $product = "Product_" . $type;
        if (class_exists($product)) {
            return new $product();
        }
        else {
            throw new Exception("Invalid product type given.");
        }
    } 
}

//By defining build() as a factory method, you now have an interface through which you can create different products on the fly.

$objComputer = ProductFactory::build('computer');
$objTable = ProductFactory::build('tablet');

//The Factory Method pattern is useful when you need to abstract the creation of an object away from its actual implementation. 
//  Let’s say the factory will be building a “MobileDevice” product type. A mobile device could be made up of any number of components, some of which can and will change later, depending on advances in technology.

class Product_MobileDevice
{
    private $components;

    public function __construct() {
        // this device uses a 7" LCD
        $this->addComponent(ProductFactory::build("LCD", 7));
        // and features an 1GHz ARM processor  
        $this->addComponent(ProductFactory::build("CPU_ARM", 1));
    }

}

// build a new Product_MobileDevice type
$myDevice = ProductFactory::build("MobileDevice");
$myDevice->use();