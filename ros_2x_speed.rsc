# Скрипт удвоения скоростей при помощи параметра rate-limit
# на dhcp сервере РоутерОС

:foreach lease in=[/ip dhcp-server lease find] do={
	:local rate [/ip dhcp-server lease get $lease rate-limit];
	:if ($rate != "") do={
		:local pos ([:len $rate]-1);
    :local newrate [:pick $rate 0 $pos];
    :set $rate (($newrate*2) . "K");
		/ip dhcp-server lease set $lease rate-limit=$rate
	}
}
