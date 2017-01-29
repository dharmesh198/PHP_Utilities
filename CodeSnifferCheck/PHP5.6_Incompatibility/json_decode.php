<?php

$json = '{"a":1,"b":2,"c":3,"d":4,"e":5,ef,test}'; // Invalid json string

$str = json_decode($json, TRUE);

?>