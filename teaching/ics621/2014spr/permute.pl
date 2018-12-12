#!/usr/bin/perl

use strict;

my $fname = "classlist";

open(FIN, "<$fname") or die "Cannot open file $fname";

my @names = <FIN>;

#print @names;
my $len = scalar ( @names);

for (my $i=0; $i<$len; $i++)
{
   my $j = int( rand( $len ) );

   my $tmp = $names[$i];
   $names[$i] = $names[ $j ];
   $names[$j] = $tmp; 
}

for (my $i=0; $i<$len; $i++)
{
   if ( $i!=$len-1 && ( $i % 3 ) == 0 )
   {
      print "----------------------------\n";
   }
   print $names[$i];
}
print "----------------------------\n";
