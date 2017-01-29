<?php

interface PaydateCalculatorInterface {

    public function calculateNext10PayDates($payDate, $payDateModel);
}

class MyPaydateCalculator implements PaydateCalculatorInterface {

    private $holidayList = array();
    private $today = '';
    private $arrLastDay = array();

    public function __construct() {
        $this->today = date('d-m-Y');
        echo 'Today is ' . $this->today;

        // Set last day of every month in array
        $this->setLastDateofMonth();
    }

    private function setLastDateofMonth() {

        $monthLastDay = array();
        $monthLastDay['1'] = 31;
        $monthLastDay['2'] = $this->isLeapYear(date('Y-m-d')) ? 29 : 28;
        $monthLastDay['3'] = 30;
        $monthLastDay['4'] = 31;
        $monthLastDay['5'] = 30;
        $monthLastDay['6'] = 31;
        $monthLastDay['7'] = 30;
        $monthLastDay['8'] = 31;
        $monthLastDay['9'] = 30;
        $monthLastDay['10'] = 31;
        $monthLastDay['11'] = 30;
        $monthLastDay['12'] = 31;

        print_r($monthLastDay);
        return $this->arrLastDay = $monthLastDay;
    }

    public function findNextLastDay($payDate) {

        list($day, $month, $year) = explode('-', $payDate);
        $month = (int) $month;
        // Check if date falls on the last day of month
        if ($this->arrLastDay[$month] == $day) {
            // last day of month

            if ($month == 12) {
                $month = 1;
                $year = $year + 1;
            } else {

                $month = $month + 1;
            }
            $nextDay = $this->arrLastDay[$month];

            return $nextDay . '-' . $month . '-' . $year;
        } else {
            return 0;
        }
    }

    public function setHolidays($arrHolidays) {

        // Check if valid array is passed
        if (!is_array($arrHolidays)) {
            echo "<br> Please pass holiday list in array format";
            return false;
        }

        $this->holidayList = $arrHolidays;
        echo 'Holidays are set';
        echo "<pre>";
        print_r($this->holidayList);
        echo "</pre>";
        return true;
    }

    public function calculateNext10PayDates($payDate, $payDateModel = 'MONTHLY') {

        $payDateModel = strtoupper($payDateModel);

        $arrNext10Days = array();

        // If PayDate is today then skip and find next
        if ($payDate == $this->today) {
            $nextPayDay = $this->findNext($payDate, $payDateModel);
        } else {
            $nextPayDay = $this->getValidPayDay($payDate);
        }
        $arrNext10Days[] = $nextPayDay;

        for ($i = 0; $i < 9; $i++) {
            $nextPayDay = $this->findNext($nextPayDay, $payDateModel);
            // Check if holiday
            $nextPayDay = $this->getValidPayDay($nextPayDay);
            $arrNext10Days[] = $nextPayDay;
        }


        return $arrNext10Days;
    }

    private function getValidPayDay($payDate) {
        //echo "<br> Get valid pay day";
        //echo "<br> Day = $payDate";
        // If holiday 
        $newDate = $this->isHoliday($payDate);
        $newDate = $this->isWeekend($newDate);
        //echo "<br>returning $newDate";
        return $newDate;
    }

    public function isHoliday($payDate) {

        if (in_array($payDate, $this->holidayList)) {

            $date = new DateTime($payDate);
            $newDate = $date->sub(new DateInterval('P1D'));
            $payDate = $newDate->format('d-m-Y');

            $this->isHoliday($payDate);
        }
        return $payDate;
    }

    public function isWeekend($payDate) {
        // If today then 
        list($day, $month, $year) = explode('-', $payDate);


        $time = mktime(0, 0, 0, $month, $day, $year);
        $weekday = date('w', $time);
        if ($weekday == 0 || $weekday == 6) {
            $date = new DateTime($payDate);
            $newDate = $date->add(new DateInterval('P1D'));
            //return $newDate->format('d-m-Y');

            $payDate = $newDate->format('d-m-Y');

            $this->isHoliday($payDate);
        }

        return $payDate;
    }

    public function findNext($payDate, $payDateModel = 'MONTHLY') {

        $date = new DateTime($payDate);

        switch ($payDateModel) {
            case 'MONTHLY':
                $nextDate = $this->findNextLastDay($payDate);
                if ($nextDate == 0) {
                    $nextDate = $date->add(new DateInterval('P1M'));
                } else {
                    return $nextDate;
                }
                break;

            case 'BIWEEKLY':
                $nextDate = $date->add(new DateInterval('P14D'));
                break;

            case 'WEEKLY':
                $nextDate = $date->add(new DateInterval('P7D'));
                break;
        }

        return $nextDate->format('d-m-Y');
    }

    private function isLeapYear($date) {

        $timestamp = strtotime($date);
        $isLeapYear = date("L", $timestamp);
        return ($isLeapYear == 1) ? 1 : 0;
    }

}

$arrHolidays = array('01-01-2014', '20-01-2014', '17-02-2014', '26-05-2014', '04-07-2014', '01-09-2014', '13-10-2014', '11-11-2014', '27-11-2014', '25-12-2014', '01-01-2015', '19-01-2015', '16-02-2015', '25-05-2015', '03-07-2015', '07-09-2015', '12-10-2015', '11-11-2015', '26-11-2015', '25-12-2015');


$objPayDay = new MyPaydateCalculator();
$objPayDay->setHolidays($arrHolidays);

//echo "<br><br>Next pay date: ".$nextDate = $objPayDay->findNext('31-01-2017', $payDateModel='MONTHLY');
// echo  date("d-m-Y", strtotime('2017-01-31')); exit;
//echo $objPayDay->findNextLastDay('31-01-2017');
$arrNext10Days = $objPayDay->calculateNext10PayDates('01-01-2014', 'WEEKLY');

echo "<br>WEEKLY: Next 10 pay days are..";
echo "<pre>";
print_r($arrNext10Days);
echo "</pre>";

$arrNext10Days = $objPayDay->calculateNext10PayDates('01-01-2014', 'BIWEEKLY');

echo "<br>BIWEEKLY: Next 10 pay days are..";
echo "<pre>";
print_r($arrNext10Days);
echo "</pre>";

$arrNext10Days = $objPayDay->calculateNext10PayDates('01-01-2014', 'MONTHLY');

echo "<br>MONTHLY: Next 10 pay days are..";
echo "<pre>";
print_r($arrNext10Days);
echo "</pre>";
?>

