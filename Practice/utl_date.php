<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
echo "-----Date utility----";
$msg = strtotime("Month abbreviation, day and year");
echoOnScreen($msg);

$msg = strtotime("next Thursday");
echoOnScreen($msg);

*/

$arrTest = [1,2,3,'ghh','jkl'];

function findDaysofMonth($month, $year){
    
    // Date format Y-m-d
    $d_daysinmonth = date('t', mktime(0,0,0,$month,1,$year)); // days in month
    echoOnScreen("# of days in a month is: $d_daysinmonth");
    return $d_daysinmonth;
}

function findNextMonth($month, $year){
    
    // Date format Y-m-d
    $next_month_year = date('Y-m', mktime(0,0,0,$month+1,1,$year)); // days in month
    echoOnScreen("Next month year: $next_month_year");
    return $next_month_year;
}


function findNextDateIfLastDay($year, $month, $day){
    
    for($i=0; $i<12; $i++){
        // Find next month
        $next_month_year = findNextMonth($month, $year);
        list($next_year, $next_month) = explode('-', $next_month_year);

        // Find number of days in next month
        $days = findDaysofMonth($next_month, $next_year);

        // Add that many days to find new date
        $next_day = date('Y-m-d', mktime(0,0,0,$next_month,$days,$next_year));
        echoOnScreen($next_day);
        
        //reset variables to loop through
        $year = $next_year;
        $month = $next_month;
    }
}
echo "<br>--";echo "<br>--";
findNextDateIfLastDay(2016, 5, 31);
        
function echoOnScreen($msg){
    echo "<br>--";
    echo $msg;
}


?>

