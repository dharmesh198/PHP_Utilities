<?php

class Car {
	// The code goes here
	public $comp;
	public $color = 'grey';
	public $hasSunRoof =  true;
	
}

$objCar = new Car();

class Dragonball {
	public $ballCount  = 0;
	private $data = array();
	
	public function iFoundaBall() {
		
		$this->ballCount++;
		
		if($this->ballCount == 7){
			echo 'You can ask your wish';
			$this->ballCount=0;
		}
	}
	
	public function __set($name, $value){
		echo "<br>Setting {$value} to {$name}<br>";
		$this->data[$name] = $value;
	}
	
	public function __get($name){
		echo "<br><br>Getting variable $name";
		return $this->data[$name];
	}
}

$objDragonBall = new Dragonball();
$objDragonBall->ballColor = 'Red';
echo $objDragonBall->ballColor;
//800 772 7117

//AOM - 516 342 2720 - Insurance provider
?>

