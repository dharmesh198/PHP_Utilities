<?php
error_reporting(E_ALL);
ini_set('display_errors',1);

function calcSum(array $a){
    
    return $a[0] + $a[1];
}

$arr = array(10,4);
echo "<br> Sum of two values:".calcSum($arr);

class car {
  protected $model;
  protected $hasSunRoof;
  protected $numberOfDoors;
  protected $price;

  // string type hinting
  public function setModel(string $model)
  {
    $this->model = $model;
  }

  // string type hinting
  public function getModel()
  {
    return $this->model;
  }
  // boolean type hinting
  public function setHasSunRoof(bool $value)
  {
    $this->hasSunRoof = $value;
  }

  // integer type hinting
  public function setNumberOfDoors(int $value)
  {
    $this->numberOfDoors = $value;
  }

  // float type hinting
  public function setPrice(float $value)
  {
    $this->price = $value;
  }        
}

$mercedes = new Car();
$mercedes->setModel('Mercedes');
echo $mercedes->getModel();

?>