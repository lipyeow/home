
classpath="/Applications/ANTLRWorks.app/Contents/Resources/Java/antlrworks.jar"

java -cp $classpath org.antlr.Tool sqltest.g

javafiles="sqltestLexer.java sqltestParser.java TestSQL.java" 

javac -cp $classpath $javafiles
