import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class TestSQL {
    public static void main(String[] args) throws Exception {
        CharStream input = null;
        if ( args.length>0 ) {
            input = new ANTLRFileStream(args[0]);
        }
        else {
            input = new ANTLRInputStream(System.in);
        }

        // BUILD AST
        sqltestLexer lex = new sqltestLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lex);
        sqltestParser parser = new sqltestParser(tokens);
        sqltestParser.createtablestmt_return r = parser.createtablestmt();

        if( r==null)
        {
           System.out.println("Syntax Error");
        } else {
            System.out.println("tablename ="+((Tree)r.tree).getChild(2).toString());
            System.out.println("tree="+((Tree)r.tree).toStringTree());
        }
   }
}
