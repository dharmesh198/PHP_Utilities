<?php

$str = 'a:6:{s:8:"xml_data";a:1:{s:3:"url";s:41:"http://www.littleremedies.com/blog/feeds/";}s:19:"notification_emails";s:55:"mkarlan@prestigebrands.com
sauguste@prestigebrands.com";s:14:"xml_date_nodes";a:1:{s:25:".rss.channel.item.pubDate";s:1:"1";}s:5:"rules";s:17:"specific_new_data";s:14:"default_action";s:1:"3";s:28:"lastCheckForContentFreshness";i:1481560201;}';

$unser_str = unserialize($str);

echo "<pre>";
print_r($unser_str);
echo "</pre>";



?>