<?php
$arr_existing_ips = array('174.34.156.130','178.255.155.2','184.75.210.186','188.138.118.184','208.43.68.59','50.23.94.74','76.164.194.74','82.103.128.63','85.17.156.99','94.46.4.1','208.79.252.0/22','207.250.191.254','67.216.234.254','46.20.45.18','46.165.195.139','64.120.6.122','64.141.100.136','64.237.55.3','67.205.67.76','67.228.213.178','69.59.28.19','69.64.56.47','70.32.40.2','72.46.130.42','72.46.140.106','72.46.140.186','72.46.153.26','76.72.167.90','76.72.171.180','76.72.172.208','78.31.69.179','78.40.124.16','83.170.113.210','85.17.156.11','85.17.156.76','85.25.176.167','91.109.115.41','94.46.240.121','94.247.174.83','95.141.32.46','95.211.87.85','95.211.198.87','95.211.217.68','96.31.66.245','108.62.115.226','158.58.173.160','173.204.85.217','173.248.147.18','174.34.162.242','174.34.224.167','176.31.228.137','178.255.152.2','178.255.153.2','178.255.154.2','184.75.208.210','184.75.209.18','184.75.210.90','184.75.210.226','188.138.118.144','188.138.124.110','199.87.228.66','204.152.200.42','208.64.28.194','212.84.74.156','208.79.252.0/22','10.46.2.0/24','10.46.3.0/24','10.46.4.0/24','10.46.5.0/24','10.46.6.0/24','10.46.7.0/24','10.46.8.0/24','209.126.120.29','209.126.117.87','173.254.206.242','184.75.214.66','162.218.67.34','89.163.146.247','95.211.228.65','23.111.152.74','185.39.146.214','37.252.231.50','82.103.139.165','109.123.101.103','85.93.93.133','85.93.93.124','85.93.93.123','64.237.49.203','89.163.242.206','185.39.146.215','168.1.92.58','43.229.84.12','103.47.211.210','175.45.132.20','211.44.63.35','43.225.198.122','27.122.14.7','5.178.78.77','207.244.80.239','159.8.146.132','50.22.90.227','69.64.56.153','188.138.40.20');

$xml = simplexml_load_file('pingdom.xml');
 foreach ($xml->channel->item as $items) {
   
   $str_ip =  $items->ip;
   if(!in_array($str_ip, $arr_existing_ips)){
	   echo $str_ip."<br>";
   }
}


	exit;
	
$string = <<<XML
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:atom="http://www.w3.org/2005/Atom" xmlns:pingdom="http://www.pingdom.com/ns/PingdomRSSNamespace" version="2.0">
   <channel>
      <item>
         <guid isPermaLink="false">pingdom-probe-120</guid>
         <title>Portland 2, OR</title>
         <description>IP: 162.218.67.34; Hostname: s4015.pingdom.com; State: Inactive; Country: United States; City: Portland</description>
         <ip>162.218.67.34</ip>
         <hostname>s4015.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Portland</city>
         <state>Inactive</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-119</guid>
         <title>London 2, UK</title>
         <description>IP: 109.123.101.103; Hostname: s4014.pingdom.com; State: Active; Country: United Kingdom; City: London</description>
         <ip>109.123.101.103</ip>
         <ipv6>2A02:2498:1:229:6d:7b:65:67</ipv6>
         <hostname>s4014.pingdom.com</hostname>
         <country code="GB">United Kingdom</country>
         <city>London</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-118</guid>
         <title>Strasbourg 7, France</title>
         <description>IP: 85.93.93.133; Hostname: s4013.pingdom.com; State: Inactive; Country: France; City: Strasbourg</description>
         <ip>85.93.93.133</ip>
         <hostname>s4013.pingdom.com</hostname>
         <country code="FR">France</country>
         <city>Strasbourg</city>
         <state>Inactive</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-117</guid>
         <title>Strasbourg 6, France</title>
         <description>IP: 85.93.93.124; Hostname: s4012.pingdom.com; State: Inactive; Country: France; City: Strasbourg</description>
         <ip>85.93.93.124</ip>
         <hostname>s4012.pingdom.com</hostname>
         <country code="FR">France</country>
         <city>Strasbourg</city>
         <state>Inactive</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-116</guid>
         <title>Strasbourg 5, France</title>
         <description>IP: 85.93.93.123; Hostname: s4011.pingdom.com; State: Inactive; Country: France; City: Strasbourg</description>
         <ip>85.93.93.123</ip>
         <hostname>s4011.pingdom.com</hostname>
         <country code="FR">France</country>
         <city>Strasbourg</city>
         <state>Inactive</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-115</guid>
         <title>Los Angeles 2, CA</title>
         <description>IP: 173.254.206.242; Hostname: s4010.pingdom.com; State: Active; Country: United States; City: Los Angeles</description>
         <ip>173.254.206.242</ip>
         <ipv6>2607:fcd0:100:8d01::4010</ipv6>
         <hostname>s4010.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Los Angeles</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-114</guid>
         <title>Matawan, NJ</title>
         <description>IP: 64.237.49.203; Hostname: s4009.pingdom.com; State: Active; Country: United States; City: Matawan</description>
         <ip>64.237.49.203</ip>
         <ipv6>2001:19f0:200:40cf:225:90ff:fed5:9aea</ipv6>
         <hostname>s4009.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Matawan</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-113</guid>
         <title>St. Louis 3, MO</title>
         <description>IP: 209.126.120.29; Hostname: s4008.pingdom.com; State: Active; Country: United States; City: St. Louis</description>
         <ip>209.126.120.29</ip>
         <hostname>s4008.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>St. Louis</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-112</guid>
         <title>St. Louis 2, MO</title>
         <description>IP: 209.126.117.87; Hostname: s4007.pingdom.com; State: Active; Country: United States; City: St. Louis</description>
         <ip>209.126.117.87</ip>
         <hostname>s4007.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>St. Louis</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-111</guid>
         <title>Copenhagen 2, Denmark</title>
         <description>IP: 82.103.139.165; Hostname: s4006.pingdom.com; State: Active; Country: Denmark; City: Copenhagen</description>
         <ip>82.103.139.165</ip>
         <ipv6>2a00:9080:1:125::1</ipv6>
         <hostname>s4006.pingdom.com</hostname>
         <country code="DK">Denmark</country>
         <city>Copenhagen</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-110</guid>
         <title>Tampa 2, FL</title>
         <description>IP: 23.111.152.74; Hostname: s4005.pingdom.com; State: Active; Country: United States; City: Tampa</description>
         <ip>23.111.152.74</ip>
         <ipv6>2604:4500:5:a::4005</ipv6>
         <hostname>s4005.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Tampa</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-109</guid>
         <title>Dusseldorf 3, Germany</title>
         <description>IP: 89.163.242.206; Hostname: s4004.pingdom.com; State: Active; Country: Germany; City: Düsseldorf</description>
         <ip>89.163.242.206</ip>
         <ipv6>2001:4ba0:ffa5:01d5::4004</ipv6>
         <hostname>s4004.pingdom.com</hostname>
         <country code="DE">Germany</country>
         <city>Düsseldorf</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-108</guid>
         <title>Dusseldorf 2, Germany</title>
         <description>IP: 89.163.146.247; Hostname: s4003.pingdom.com; State: Active; Country: Germany; City: Düsseldorf</description>
         <ip>89.163.146.247</ip>
         <ipv6>2001:4ba0:ffa5:00ed::4003</ipv6>
         <hostname>s4003.pingdom.com</hostname>
         <country code="DE">Germany</country>
         <city>Düsseldorf</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-107</guid>
         <title>Stockholm 2, Sweden</title>
         <description>IP: 185.39.146.214; Hostname: s4002.pingdom.com; State: Active; Country: Sweden; City: Stockholm</description>
         <ip>185.39.146.214</ip>
         <ipv6>2a02:752:100:e::4002</ipv6>
         <hostname>s4002.pingdom.com</hostname>
         <country code="SE">Sweden</country>
         <city>Stockholm</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-106</guid>
         <title>Stockholm, Sweden</title>
         <description>IP: 185.39.146.215; Hostname: s4001.pingdom.com; State: Active; Country: Sweden; City: Stockholm</description>
         <ip>185.39.146.215</ip>
         <ipv6>2a02:752:100:e::4001</ipv6>
         <hostname>s4001.pingdom.com</hostname>
         <country code="SE">Sweden</country>
         <city>Stockholm</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-95</guid>
         <title>Amsterdam 2, Netherlands</title>
         <description>IP: 95.211.228.65; Hostname: s498.pingdom.com; State: Active; Country: Netherlands; City: Amsterdam</description>
         <ip>95.211.228.65</ip>
         <ipv6>2001:1AF8:4020:A04B:0001::498</ipv6>
         <hostname>s498.pingdom.com</hostname>
         <country code="NL">Netherlands</country>
         <city>Amsterdam</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-94</guid>
         <title>Melbourne, Australia</title>
         <description>IP: 168.1.92.58; Hostname: s497.pingdom.com; State: Active; Country: Australia; City: Melbourne</description>
         <ip>168.1.92.58</ip>
         <ipv6>2401:c900:1301:78::5</ipv6>
         <hostname>s497.pingdom.com</hostname>
         <country code="AU">Australia</country>
         <city>Melbourne</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-93</guid>
         <title>Singapore 2</title>
         <description>IP: 43.229.84.12; Hostname: s490.pingdom.com; State: Active; Country: Singapore; City: Singapore</description>
         <ip>43.229.84.12</ip>
         <hostname>s490.pingdom.com</hostname>
         <country code="SG">Singapore</country>
         <city>Singapore</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-92</guid>
         <title>Dublin, Ireland</title>
         <description>IP: 37.252.231.50; Hostname: s496.pingdom.com; State: Active; Country: Ireland; City: Dublin</description>
         <ip>37.252.231.50</ip>
         <ipv6>2a00:11c0:9::496</ipv6>
         <hostname>s496.pingdom.com</hostname>
         <country code="IE">Ireland</country>
         <city>Dublin</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-91</guid>
         <title>Singapore</title>
         <description>IP: 103.47.211.210; Hostname: s495.pingdom.com; State: Active; Country: Singapore; City: Singapore</description>
         <ip>103.47.211.210</ip>
         <ipv6>2401:e780:1:91::495</ipv6>
         <hostname>s495.pingdom.com</hostname>
         <country code="SG">Singapore</country>
         <city>Singapore</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-90</guid>
         <title>Sydney, Australia</title>
         <description>IP: 175.45.132.20; Hostname: s494.pingdom.com; State: Active; Country: Australia; City: Sydney</description>
         <ip>175.45.132.20</ip>
         <ipv6>2403:f000:1:100:4096:597:1:100</ipv6>
         <hostname>s494.pingdom.com</hostname>
         <country code="AU">Australia</country>
         <city>Sydney</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-89</guid>
         <title>Seoul, South Korea</title>
         <description>IP: 211.44.63.35; Hostname: s493.pingdom.com; State: Active; Country: South Korea; City: Seoul</description>
         <ip>211.44.63.35</ip>
         <hostname>s493.pingdom.com</hostname>
         <country code="KR">South Korea</country>
         <city>Seoul</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-88</guid>
         <title>Hong Kong 2</title>
         <description>IP: 43.225.198.122; Hostname: s492.pingdom.com; State: Active; Country: Hong Kong; City: Hong Kong</description>
         <ip>43.225.198.122</ip>
         <hostname>s492.pingdom.com</hostname>
         <country code="HK">Hong Kong</country>
         <city>Hong Kong</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-87</guid>
         <title>Hong Kong</title>
         <description>IP: 27.122.14.7; Hostname: s491.pingdom.com; State: Active; Country: Hong Kong; City: Hong Kong</description>
         <ip>27.122.14.7</ip>
         <ipv6>2001:df0:a6:7::491</ipv6>
         <hostname>s491.pingdom.com</hostname>
         <country code="HK">Hong Kong</country>
         <city>Hong Kong</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-86</guid>
         <title>Milan 2, Italy</title>
         <description>IP: 95.141.32.46; Hostname: s470.pingdom.com; State: Active; Country: Italy; City: Milan</description>
         <ip>95.141.32.46</ip>
         <ipv6>2a02:29e0:1:220::470</ipv6>
         <hostname>s470.pingdom.com</hostname>
         <country code="IT">Italy</country>
         <city>Milan</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-85</guid>
         <title>Amsterdam, Netherlands</title>
         <description>IP: 95.211.217.68; Hostname: s469.pingdom.com; State: Active; Country: Netherlands; City: Amsterdam</description>
         <ip>95.211.217.68</ip>
         <ipv6>2001:1af8:4500:a03a::469</ipv6>
         <hostname>s469.pingdom.com</hostname>
         <country code="NL">Netherlands</country>
         <city>Amsterdam</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-83</guid>
         <title>London, UK</title>
         <description>IP: 83.170.113.210; Hostname: s466.pingdom.com; State: Active; Country: United Kingdom; City: London</description>
         <ip>83.170.113.210</ip>
         <ipv6>2a02:2498:1:71:53:aa:71:d2</ipv6>
         <hostname>s466.pingdom.com</hostname>
         <country code="GB">United Kingdom</country>
         <city>London</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-82</guid>
         <title>Strasbourg 4, France</title>
         <description>IP: 188.138.118.144; Hostname: s465.pingdom.com; State: Active; Country: France; City: Strasbourg</description>
         <ip>188.138.118.144</ip>
         <hostname>s465.pingdom.com</hostname>
         <country code="FR">France</country>
         <city>Strasbourg</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-81</guid>
         <title>Charlotte 2, NC</title>
         <description>IP: 174.34.224.167; Hostname: s464.pingdom.com; State: Active; Country: United States; City: Charlotte</description>
         <ip>174.34.224.167</ip>
         <hostname>s464.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Charlotte</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-80</guid>
         <title>Las Vegas 5, NV</title>
         <description>IP: 72.46.140.106; Hostname: s462.pingdom.com; State: Active; Country: United States; City: Las Vegas</description>
         <ip>72.46.140.106</ip>
         <ipv6>2605:6f80:0:f::462</ipv6>
         <hostname>s462.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Las Vegas</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-79</guid>
         <title>Philadelphia 2, PA</title>
         <description>IP: 76.72.172.208; Hostname: s460.pingdom.com; State: Active; Country: United States; City: Philadelphia</description>
         <ip>76.72.172.208</ip>
         <hostname>s460.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Philadelphia</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-78</guid>
         <title>Toronto 5, Canada</title>
         <description>IP: 184.75.210.226; Hostname: s459.pingdom.com; State: Active; Country: Canada; City: Toronto</description>
         <ip>184.75.210.226</ip>
         <ipv6>2606:6080:1001:1::459</ipv6>
         <hostname>s459.pingdom.com</hostname>
         <country code="CA">Canada</country>
         <city>Toronto</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-75</guid>
         <title>Strasbourg 2, France</title>
         <description>IP: 188.138.118.184; Hostname: s456.pingdom.com; State: Active; Country: France; City: Strasbourg</description>
         <ip>188.138.118.184</ip>
         <hostname>s456.pingdom.com</hostname>
         <country code="FR">France</country>
         <city>Strasbourg</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-74</guid>
         <title>Strasbourg 3, France</title>
         <description>IP: 188.138.124.110; Hostname: s455.pingdom.com; State: Active; Country: France; City: Strasbourg</description>
         <ip>188.138.124.110</ip>
         <hostname>s455.pingdom.com</hostname>
         <country code="FR">France</country>
         <city>Strasbourg</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-73</guid>
         <title>Amsterdam 5, Netherlands</title>
         <description>IP: 85.17.156.99; Hostname: s454.pingdom.com; State: Inactive; Country: Netherlands; City: Amsterdam</description>
         <ip>85.17.156.99</ip>
         <ipv6>2001:1af8:4100:a09b::454</ipv6>
         <hostname>s454.pingdom.com</hostname>
         <country code="NL">Netherlands</country>
         <city>Amsterdam</city>
         <state>Inactive</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-72</guid>
         <title>Amsterdam 4, Netherlands</title>
         <description>IP: 85.17.156.11; Hostname: s453.pingdom.com; State: Active; Country: Netherlands; City: Amsterdam</description>
         <ip>85.17.156.11</ip>
         <ipv6>2001:1af8:4100:a09a::453</ipv6>
         <hostname>s453.pingdom.com</hostname>
         <country code="NL">Netherlands</country>
         <city>Amsterdam</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-71</guid>
         <title>Amsterdam 3, Netherlands</title>
         <description>IP: 85.17.156.76; Hostname: s452.pingdom.com; State: Active; Country: Netherlands; City: Amsterdam</description>
         <ip>85.17.156.76</ip>
         <ipv6>2001:1af8:4100:a09c::452</ipv6>
         <hostname>s452.pingdom.com</hostname>
         <country code="NL">Netherlands</country>
         <city>Amsterdam</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-70</guid>
         <title>Las Vegas 4, NV</title>
         <description>IP: 72.46.153.26; Hostname: s451.pingdom.com; State: Active; Country: United States; City: Las Vegas</description>
         <ip>72.46.153.26</ip>
         <ipv6>2605:6f80:0:e::451</ipv6>
         <hostname>s451.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Las Vegas</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-69</guid>
         <title>Las Vegas 3, NV</title>
         <description>IP: 208.64.28.194; Hostname: s450.pingdom.com; State: Active; Country: United States; City: Las Vegas</description>
         <ip>208.64.28.194</ip>
         <ipv6>2605:6f80:0:d::450</ipv6>
         <hostname>s450.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Las Vegas</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-68</guid>
         <title>Las Vegas 2, NV</title>
         <description>IP: 76.164.194.74; Hostname: s449.pingdom.com; State: Active; Country: United States; City: Las Vegas</description>
         <ip>76.164.194.74</ip>
         <ipv6>2605:6f80:0:c::449</ipv6>
         <hostname>s449.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Las Vegas</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-67</guid>
         <title>Toronto 4, Canada</title>
         <description>IP: 184.75.210.90; Hostname: s448.pingdom.com; State: Active; Country: Canada; City: Toronto</description>
         <ip>184.75.210.90</ip>
         <ipv6>2606:6080:1001:4::448</ipv6>
         <hostname>s448.pingdom.com</hostname>
         <country code="CA">Canada</country>
         <city>Toronto</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-66</guid>
         <title>Toronto 3, Canada</title>
         <description>IP: 184.75.208.210; Hostname: s447.pingdom.com; State: Active; Country: Canada; City: Toronto</description>
         <ip>184.75.208.210</ip>
         <ipv6>2606:6080:1001:3::447</ipv6>
         <hostname>s447.pingdom.com</hostname>
         <country code="CA">Canada</country>
         <city>Toronto</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-65</guid>
         <title>Toronto 2, Canada</title>
         <description>IP: 184.75.209.18; Hostname: s446.pingdom.com; State: Active; Country: Canada; City: Toronto</description>
         <ip>184.75.209.18</ip>
         <ipv6>2606:6080:1001:2::446</ipv6>
         <hostname>s446.pingdom.com</hostname>
         <country code="CA">Canada</country>
         <city>Toronto</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-64</guid>
         <title>Frankfurt 2, Germany</title>
         <description>IP: 46.165.195.139; Hostname: s445.pingdom.com; State: Active; Country: Germany; City: Frankfurt</description>
         <ip>46.165.195.139</ip>
         <ipv6>2a00:c98:2100:a00b::445</ipv6>
         <hostname>s445.pingdom.com</hostname>
         <country code="DE">Germany</country>
         <city>Frankfurt</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-63</guid>
         <title>Portland, OR</title>
         <description>IP: 199.87.228.66; Hostname: s444.pingdom.com; State: Active; Country: United States; City: Portland</description>
         <ip>199.87.228.66</ip>
         <hostname>s444.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Portland</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-62</guid>
         <title>Philadelphia, PA</title>
         <description>IP: 76.72.167.90; Hostname: s443.pingdom.com; State: Active; Country: United States; City: Philadelphia</description>
         <ip>76.72.167.90</ip>
         <ipv6>2607:2200:0:2361::443</ipv6>
         <hostname>s443.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Philadelphia</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-61</guid>
         <title>Falkenberg, Sweden</title>
         <description>IP: 94.247.174.83; Hostname: s442.pingdom.com; State: Active; Country: Sweden; City: Falkenberg</description>
         <ip>94.247.174.83</ip>
         <ipv6>2a02:750:11:284::442</ipv6>
         <hostname>s442.pingdom.com</hostname>
         <country code="SE">Sweden</country>
         <city>Falkenberg</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-60</guid>
         <title>St. Louis, MO</title>
         <description>IP: 69.64.56.47; Hostname: s441.pingdom.com; State: Active; Country: United States; City: St. Louis</description>
         <ip>69.64.56.47</ip>
         <hostname>s441.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>St. Louis</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-58</guid>
         <title>Toronto, Canada</title>
         <description>IP: 184.75.214.66; Hostname: s439.pingdom.com; State: Active; Country: Canada; City: Toronto</description>
         <ip>184.75.214.66</ip>
         <ipv6>2606:6080:1001::439</ipv6>
         <hostname>s439.pingdom.com</hostname>
         <country code="CA">Canada</country>
         <city>Toronto</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-57</guid>
         <title>Phoenix, AZ</title>
         <description>IP: 108.62.115.226; Hostname: s435.pingdom.com; State: Active; Country: United States; City: Phoenix</description>
         <ip>108.62.115.226</ip>
         <hostname>s435.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Phoenix</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-55</guid>
         <title>Dusseldorf, Germany</title>
         <description>IP: 46.20.45.18; Hostname: s433.pingdom.com; State: Active; Country: Germany; City: Düsseldorf</description>
         <ip>46.20.45.18</ip>
         <ipv6>2001:4ba0:ffe2:22::1</ipv6>
         <hostname>s433.pingdom.com</hostname>
         <country code="DE">Germany</country>
         <city>Düsseldorf</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-54</guid>
         <title>San Jose, CA</title>
         <description>IP: 50.23.94.74; Hostname: s432.pingdom.com; State: Active; Country: United States; City: San Jose</description>
         <ip>50.23.94.74</ip>
         <ipv6>2607:f0d0:2101:2::432</ipv6>
         <hostname>s432.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>San Jose</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-52</guid>
         <title>Charlotte, NC</title>
         <description>IP: 69.59.28.19; Hostname: s430.pingdom.com; State: Active; Country: United States; City: Charlotte</description>
         <ip>69.59.28.19</ip>
         <hostname>s430.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Charlotte</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-51</guid>
         <title>Prague, Czech Republic</title>
         <description>IP: 178.255.154.2; Hostname: s429.pingdom.com; State: Active; Country: Czech Republic; City: Prague</description>
         <ip>178.255.154.2</ip>
         <ipv6>2a00:11c0:4:1::429</ipv6>
         <hostname>s429.pingdom.com</hostname>
         <country code="CZ">Czech Republic</country>
         <city>Prague</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-50</guid>
         <title>Zurich, Switzerland</title>
         <description>IP: 178.255.153.2; Hostname: s428.pingdom.com; State: Active; Country: Switzerland; City: Zurich</description>
         <ip>178.255.153.2</ip>
         <hostname>s428.pingdom.com</hostname>
         <country code="CH">Switzerland</country>
         <city>Zurich</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-49</guid>
         <title>Milan, Italy</title>
         <description>IP: 178.255.155.2; Hostname: s427.pingdom.com; State: Active; Country: Italy; City: Milan</description>
         <ip>178.255.155.2</ip>
         <ipv6>2a00:11c0:b:1::427</ipv6>
         <hostname>s427.pingdom.com</hostname>
         <country code="IT">Italy</country>
         <city>Milan</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-48</guid>
         <title>Newark, NJ</title>
         <description>IP: 64.237.55.3; Hostname: s426.pingdom.com; State: Active; Country: United States; City: Newark</description>
         <ip>64.237.55.3</ip>
         <ipv6>2001:19f0:200:125d::426</ipv6>
         <hostname>s426.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Newark</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-47</guid>
         <title>Vienna, Austria</title>
         <description>IP: 178.255.152.2; Hostname: s425.pingdom.com; State: Active; Country: Austria; City: Vienna</description>
         <ip>178.255.152.2</ip>
         <ipv6>2a00:11c0:d:3::425</ipv6>
         <hostname>s425.pingdom.com</hostname>
         <country code="AT">Austria</country>
         <city>Vienna</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-43</guid>
         <title>Denver, CO</title>
         <description>IP: 173.248.147.18; Hostname: s421.pingdom.com; State: Inactive; Country: United States; City: Denver</description>
         <ip>173.248.147.18</ip>
         <ipv6>2607:fc88:100:26::421</ipv6>
         <hostname>s421.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Denver</city>
         <state>Inactive</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-42</guid>
         <title>Las Vegas, NV</title>
         <description>IP: 72.46.130.42; Hostname: s420.pingdom.com; State: Active; Country: United States; City: Las Vegas</description>
         <ip>72.46.130.42</ip>
         <ipv6>2605:6f80:0:b:21c::1</ipv6>
         <hostname>s420.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Las Vegas</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-40</guid>
         <title>Washington, DC</title>
         <description>IP: 208.43.68.59; Hostname: s418.pingdom.com; State: Active; Country: United States; City: Washington</description>
         <ip>208.43.68.59</ip>
         <ipv6>2607:f0d0:3001:4::418</ipv6>
         <hostname>s418.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Washington</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-39</guid>
         <title>Seattle, WA</title>
         <description>IP: 67.228.213.178; Hostname: s417.pingdom.com; State: Active; Country: United States; City: Seattle</description>
         <ip>67.228.213.178</ip>
         <ipv6>2607:f0d0:2001:1::417</ipv6>
         <hostname>s417.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Seattle</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-38</guid>
         <title>Tampa, FL</title>
         <description>IP: 96.31.66.245; Hostname: s415.pingdom.com; State: Active; Country: United States; City: Tampa</description>
         <ip>96.31.66.245</ip>
         <ipv6>2604:4500::f82</ipv6>
         <hostname>s415.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Tampa</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-37</guid>
         <title>Copenhagen, Denmark</title>
         <description>IP: 82.103.128.63; Hostname: s416.pingdom.com; State: Active; Country: Denmark; City: Copenhagen</description>
         <ip>82.103.128.63</ip>
         <ipv6>2a00:9080:1:1cd::1</ipv6>
         <hostname>s416.pingdom.com</hostname>
         <country code="DK">Denmark</country>
         <city>Copenhagen</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-36</guid>
         <title>Chicago, IL</title>
         <description>IP: 174.34.156.130; Hostname: s414.pingdom.com; State: Active; Country: United States; City: Chicago</description>
         <ip>174.34.156.130</ip>
         <hostname>s414.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Chicago</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-35</guid>
         <title>New York, NY</title>
         <description>IP: 70.32.40.2; Hostname: s413.pingdom.com; State: Inactive; Country: United States; City: New York</description>
         <ip>70.32.40.2</ip>
         <hostname>s413.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>New York</city>
         <state>Inactive</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-34</guid>
         <title>Atlanta, GA</title>
         <description>IP: 174.34.162.242; Hostname: s412.pingdom.com; State: Active; Country: United States; City: Atlanta</description>
         <ip>174.34.162.242</ip>
         <hostname>s412.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Atlanta</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-33</guid>
         <title>Strasbourg, France</title>
         <description>IP: 85.25.176.167; Hostname: s411.pingdom.com; State: Active; Country: France; City: Strasbourg</description>
         <ip>85.25.176.167</ip>
         <hostname>s411.pingdom.com</hostname>
         <country code="FR">France</country>
         <city>Strasbourg</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-32</guid>
         <title>Los Angeles, CA</title>
         <description>IP: 204.152.200.42; Hostname: s410.pingdom.com; State: Active; Country: United States; City: Los Angeles</description>
         <ip>204.152.200.42</ip>
         <ipv6>2607:fcd0:100:8d00::410</ipv6>
         <hostname>s410.pingdom.com</hostname>
         <country code="US">United States</country>
         <city>Los Angeles</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-13</guid>
         <title>Stockholm</title>
         <description>IP: 5.178.78.77; Hostname: s486.pingdom.com; State: Active; Country: Sweden; City: Stockholm</description>
         <ip>5.178.78.77</ip>
         <hostname>s486.pingdom.com</hostname>
         <country code="SE">Sweden</country>
         <city>Stockholm</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-12</guid>
         <title>Washington</title>
         <description>IP: 207.244.80.239; Hostname: s485.pingdom.com; State: Active; Country: USA; City: Washington</description>
         <ip>207.244.80.239</ip>
         <hostname>s485.pingdom.com</hostname>
         <country code="US">USA</country>
         <city>Washington</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-11</guid>
         <title>London</title>
         <description>IP: 159.8.146.132; Hostname: s484.pingdom.com; State: Active; Country: United Kingdom; City: London</description>
         <ip>159.8.146.132</ip>
         <hostname>s484.pingdom.com</hostname>
         <country code="UK">United Kingdom</country>
         <city>London</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-10</guid>
         <title>Dallas</title>
         <description>IP: 50.22.90.227; Hostname: s483.pingdom.com; State: Active; Country: USA; City: Dallas</description>
         <ip>50.22.90.227</ip>
         <hostname>s483.pingdom.com</hostname>
         <country code="US">USA</country>
         <city>Dallas</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-9</guid>
         <title>St Louis</title>
         <description>IP: 69.64.56.153; Hostname: s482.pingdom.com; State: Active; Country: USA; City: St Louis</description>
         <ip>69.64.56.153</ip>
         <hostname>s482.pingdom.com</hostname>
         <country code="US">USA</country>
         <city>St Louis</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-8</guid>
         <title>Frankfurt</title>
         <description>IP: 188.138.40.20; Hostname: s481.pingdom.com; State: Active; Country: Germany; City: Frankfurt</description>
         <ip>188.138.40.20</ip>
         <hostname>s481.pingdom.com</hostname>
         <country code="DE">Germany</country>
         <city>Frankfurt</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-6</guid>
         <title>Seattle</title>
         <description>IP: 64.120.6.122; Hostname: s461.pingdom.com; State: Inactive; Country: USA; City: Seattle</description>
         <ip>64.120.6.122</ip>
         <hostname>s461.pingdom.com</hostname>
         <country code="US">USA</country>
         <city>Seattle</city>
         <state>Inactive</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-5</guid>
         <title>Milan</title>
         <description>IP: 158.58.173.160; Hostname: s471.pingdom.com; State: Inactive; Country: Italy; City: Milan</description>
         <ip>158.58.173.160</ip>
         <hostname>s471.pingdom.com</hostname>
         <country code="IT">Italy</country>
         <city>Milan</city>
         <state>Inactive</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-4</guid>
         <title>Philadelphia</title>
         <description>IP: 76.72.171.180; Hostname: s477.pingdom.com; State: Active; Country: USA; City: Philadelphia</description>
         <ip>76.72.171.180</ip>
         <hostname>s477.pingdom.com</hostname>
         <country code="US">USA</country>
         <city>Philadelphia</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-3</guid>
         <title>Las Vegas</title>
         <description>IP: 72.46.140.186; Hostname: s476.pingdom.com; State: Active; Country: USA; City: Las Vegas</description>
         <ip>72.46.140.186</ip>
         <hostname>s476.pingdom.com</hostname>
         <country code="US">USA</country>
         <city>Las Vegas</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-2</guid>
         <title>Düsseldorf</title>
         <description>IP: 78.31.69.179; Hostname: s475.pingdom.com; State: Active; Country: Germany; City: Düsseldorf</description>
         <ip>78.31.69.179</ip>
         <hostname>s475.pingdom.com</hostname>
         <country code="DE">Germany</country>
         <city>Düsseldorf</city>
         <state>Active</state>
      </item>
      <item>
         <guid isPermaLink="false">pingdom-probe-1</guid>
         <title>Amsterdam</title>
         <description>IP: 95.211.198.87; Hostname: s474.pingdom.com; State: Active; Country: Netherlands; City: Amsterdam</description>
         <ip>95.211.198.87</ip>
         <hostname>s474.pingdom.com</hostname>
         <country code="NL">Netherlands</country>
         <city>Amsterdam</city>
         <state>Active</state>
      </item>
   </channel>
</rss>
XML;

//$pingdom = new SimpleXMLElement($xmlstr);
$xml = simplexml_load_string($string);

//print_r($xml);

/* For each <character> node, we echo a separate <name>. */
foreach ($xml->channel->item as $items) {
   echo $items->ip."<br>";
}

?>