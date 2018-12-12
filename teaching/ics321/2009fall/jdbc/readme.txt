To get the port number that DB2 is listening on.
-----------------------------------------------

on most unixes:

db2 get dbm cfg
look for SVCENAME to get the service name.

grep the service name from the /etc/services file to get the port number

on windows:

find the services file in %SystemRoot%\system32\drivers\etc

For info on how to configure the DB2 instance port number
---------------------------------------------------------

go to DB2 Info Center and search for:

Configuring TCP/IP communications for a DB2 instance
