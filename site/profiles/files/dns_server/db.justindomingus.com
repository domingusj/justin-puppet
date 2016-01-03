;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	core1.justindomingus.com. admin.justindomingus.com. (
			 010320161	; Serial
			 604800		  ; Refresh
			 86400		  ; Retry
			 2419200		; Expire
			 604800 )	  ; Negative Cache TTL
;
@	IN	NS	localhost.
@	IN	A	127.0.0.1
@	IN	AAAA	::1

; name servers - NS records
    IN      NS      core1.justindomingus.com.
    IN      NS      core2.justindomingus.com.

; name servers - A records
core1.justindomingus.com.          IN      A       192.168.2.100
core2.justindomingus.com.          IN      A       192.168.2.200

; 192.168.2.0/24 - A records
menacat1.justindomingus.com.    IN      A      192.168.2.101
puppet1.justindomingus.com.     IN      A      192.168.2.102
icinga1.justindomingus.com.     IN      A      192.168.2.103
graphite1.justindomingus.com.   IN      A      192.168.2.104
nagios1.justindomingus.com.     IN      A      192.168.2.105
