<?php

$foo = 'dharmesh is fool';
echo  "<br> ------ ";
echo strrpos($foo, ' ', -3);  // Starts looking backwards five positions
echo  "<br> ------ ";
echo strchr($foo, ' ');
echo  "<br> ------ ";
exit;
$str1 = 'yabadabadoo';
$str2 = 'yabax';
$pos = strpos($str1,$str2);
echo "<br> String position : $pos <br>";
if ($pos !== false) {
    echo "\"" . $str1 . "\" contains \"" . $str2 . "\"";
} else {
    echo "\"" . $str1 . "\" does not contain \"" . $str2 . "\"";
}
echo  "<br> ------ ";
$v = 1;
$m = 2;
$l = 3;

if($l > $m){
    echo "yes";
}else{
    echo "no";
}
echo  "<br> ------ ";

$var = null;

if(empty($var)){ echo "<br>Empty"; }else { echo "<br>Not empty"; };
if(isset($var)){ echo "<br>Isset"; }else { echo "<br>Not set"; };
if($var === false){ echo "<br>false"; }else { echo "<br>Not false"; };

echo "<br>--------------------<br>";
$strWithParentheses = '()(open(close)))';

function checkParentheses($strWithParentheses){
    
    $strLength = strlen($strWithParentheses);
    
    $openCount = 0;
    $closeCount = 0;
    
    for($i=0; $i< $strLength; $i++){
        
        $chr = $strWithParentheses[$i];
        
        if($chr == '('){
            $openCount++;
        }
        
        if($chr == ')'){
            $openCount--;
        }
        
        if($openCount<0){
            echo "<br>Error";
            break;
        }
        
    } // End of For
    
    return $openCount;
}
echo "<br> Open Count: ".checkParentheses($strWithParentheses);
echo "<br>--------------------<br>";

// Get all defined variables
print_r((get_defined_vars()));
?>


