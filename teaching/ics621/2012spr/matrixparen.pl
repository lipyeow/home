#!/usr/bin/perl
# for ICS 621 Spr 2012
# author : Lipyeow Lim
# date   : Feb 14 2012
#
# prereq : (1) download and install GraphViz
#          (2) use cpan to install GraphViz perl package
#              (cpan install GraphViz)
# by default this program generates two graphs in postscript
# 1. a trace of the recursion tree
# 2. the dependency DAG (graphviz automatically does a
# topological sort. 

use strict;

use GraphViz;

# matrix dimensions for a sequence of 4 matrices
my @dim = (10,100,50,20,70);

# g stores the recursion call tree
my $g = GraphViz->new(width=>6.5,height=>4.5,pagewidth=>8.5,pageheight=>11);
# tg stores the dependency DAG
my $tg = GraphViz->new(width=>6.5,height=>4.5,pagewidth=>8.5,pageheight=>11);
# nid tracks the unique node IDS in the recursion call tree
my $nid=0;
# done tracks if a call has been executed before. You can
# extend done to do Memoization.
my %done=();

print "m(1,4)=", matrixparen(\@dim,1,4), "\n";

# output the trace of recursion tree into a file
$g->as_ps("trace.ps");

# output the DAG into a file
$tg->as_ps("dag.ps");

# Find the optimal way of parenthesizing a subsequence of
# matrix products from A_i to A_j.
# $i and $j start at 1
# $dim is a an array ref to matrix dimensions
sub matrixparen {

   my ($dim, $i,$j, 
       $parent,   # used for plotting graphs only 
       $parentlabel # used for plotting graphs only
      ) = @_;

   my $myid="$nid";
   my $mylabel="m($i,$j)";
   $nid++; # global var

   # for plotting graphs using graphviz
   # done is a global hash, $g and $tg are both global
   if( exists $done{$mylabel} )
   {
      $g->add_node($myid, label=>$mylabel, style=>'filled',
fillcolor=>'grey');
   } else {
      $g->add_node($myid, label=>$mylabel);
      $done{$mylabel}=1;
   }
   $tg->add_node($mylabel);
   if ( defined $parent )
   {
      $g->add_edge($parent => $myid);
   }
   if ( defined $parentlabel )
   {
      $tg->add_edge($parentlabel => $mylabel);
   }
   # done plotting graphs using graphviz

   if ( $i == $j )
   {
      return 0;
   }
   my $mincost = 0xffffffff;
   for(my $k=$i; $k<$j; $k++)
   {
      my $cost = matrixparen($dim, $i, $k, $myid, $mylabel) 
                  + matrixparen($dim, $k+1, $j, $myid,
                                 $mylabel) 
                  + $dim->[$i-1] * $dim->[$k] * $dim->[$j]; 

      if ($cost < $mincost)
      {
         $mincost = $cost;
      }
   }
   return $mincost;
}
