
basedir="/Users/lipyeow/sqllib"
java -classpath $basedir/java/db2jcc.jar:$basedir/java/db2jcc_javax.jar:$basedir/java/db2jcc_license_cisuz.jar:$basedir/java/db2jcc_license_cu.jar:. runquery -q $1
