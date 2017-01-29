<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// Dependency inhjection is a design pattern that allows avoiding hard coding dependecies 
// and makes possible to change the dependencies both at runtime and compile time
// 
// The intent behind dependency injection is to decouple objects to the extent 
// that no client code has to be changed simply because an object it depends on needs to be changed to a different one.

/************************************************
 * Example 1 - START
 ***********************************************/
class StockItem {

    private $quantity;
    private $status;

    public function __construct($quantity, $status) {

        $this->quantity = $quantity;
        $this->status = $status;
    }

    public function getStatus() {
        return $this->status;
    }

    public function getQuantity() {
        return $this->quantity;
    }

}

class Product {

    private $objStockItem;
    private $sku;

    public function __construct($sku, $quantity, $status) {

        $this->objStockItem = new StockItem($quantity, $status);
        $this->sku = $sku;
    }

    public function getStockItem() {
        return $this->objStockItem;
    }

    public function getSku() {
        return $this->sku;
    }

}

// In above code Product class is tightly coupoled with StockItem class 
// This can be solved using dependengy injection pattern

// Below is callde Constructor Injection

class Product_CI {

    private $objStockItem;
    private $sku;

    public function __construct($sku, StockItem $objStockItem) {

        $this->objStockItem = $objStockItem;
        $this->sku = $sku;
    }

    public function getStockItem() {
        return $this->objStockItem;
    }

    public function getSku() {
        return $this->sku;
    }

}

// Below is called Setter Injection

class Product_SetterInj {

    private $objStockItem;
    private $sku;

    public function __construct($sku) {

        $this->sku = $sku;
    }

    public function getStockItem() {
        return $this->objStockItem;
    }

    public function getSku() {
        return $this->sku;
    }
    
    public function setStockItem(StockItem $objStockItem){
        $this->objStockItem = $objStockItem;
    }

}

/************************************************
 * Example 1 - END
 ***********************************************/

/************************************************
 * Example 2 - START
 ***********************************************/
interface GeoLocationService {
    public function getCoordinatesFromAddress($address);
}

class GoogleMaps implements GeoLocationService {
    
    public function getCoordinatesFromAddress($address){
        
    }
}

class AppleMaps implements GeoLocationService {
    
    public function getCoordinatesFromAddress($address){
        
    }
}

class StoreService {
    
    private $objGeoLocationService;
    
    public function __construct(GeoLocationService $objGeoLocationService) {
        $this->objGeoLocationService = $objGeoLocationService;
    }
    
    public function getStoreCoordinates($address){
        $this->objGeoLocationService->getCoordinatesFromAddress($address);
    }
}
/************************************************
 * Example 2 - END
 ***********************************************/