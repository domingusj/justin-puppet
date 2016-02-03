;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	core1.dev.justindomingus.com. admin.justindomingus.com. (
			 012420161	; Serial
			 604800		  ; Refresh
			 86400		  ; Retry
			 2419200		; Expire
			 604800 )	  ; Negative Cache TTL
;
@	IN	NS	localhost.
@	IN	A	127.0.0.1
@	IN	AAAA	::1

; name servers - NS records
    IN      NS      core1.dev.justindomingus.com.
    IN      NS      core2.dev.justindomingus.com.

; name servers - A records
core1.dev.justindomingus.com.          IN      A       10.2.0.5
core2.dev.justindomingus.com.          IN      A       10.2.0.6

; 10.2.0.0/24 - A records

puppet1.dev.justindomingus.com.     IN      A      10.2.0.10
