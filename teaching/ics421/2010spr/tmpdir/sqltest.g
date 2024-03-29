grammar sqltest;

options {output=AST;}
// Lexer Rules

tokens {
COMMA 	=	',';
LPAR	=	'(';
RPAR  	=	')';
TERMINATOR    = ';';

}


SQLCHAR :	'char' | 'CHAR';

SQLINT  :	'int' | 'INT' |'Int' | 'integer' | 'INTEGER' | 'Integer';

CREATE 	:	'create' | 'CREATE';

TABLE 	:	'table' | 'TABLE';


ID  :	(('a'..'z'|'A'..'Z' | '_') ((DIGIT)*))+;


INT :	'0'..'9'+
    ;

FLOAT
    :   ('0'..'9')+ '.' ('0'..'9')* EXPONENT?
    |   '.' ('0'..'9')+ EXPONENT?
    |   ('0'..'9')+ EXPONENT
    ;

COMMENT
    :   '--' ~('\n'|'\r')* '\r'? '\n' {$channel=HIDDEN;}
    |   '/*' ( options {greedy=false;} : . )* '*/' {$channel=HIDDEN;}
    ;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

STRING
    :  '"' ( ESC_SEQ | ~('\\'|'"') )* '"'
    ;

CHAR:  '\'' ( ESC_SEQ | ~('\''|'\\') ) '\''
    ;

fragment
EXPONENT : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;

fragment
HEX_DIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   UNICODE_ESC
    |   OCTAL_ESC
    ;

fragment
OCTAL_ESC
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UNICODE_ESC
    :   '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
    ;

fragment DIGIT :   '0'..'9' ;

// Parser rules
colconstraint
	:	'not' 'null' | 'primary' 'key';

coltype :	SQLINT | SQLCHAR LPAR INT RPAR;

colname	:	ID;

colspec :	colname coltype (colconstraint)*;

colspeclist 
	:	colspec (COMMA colspec)*;

createtablestmt 
	:	CREATE TABLE ID LPAR colspeclist RPAR;
