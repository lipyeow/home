#!/usr/bin/perl

$week=1;
while(<>)
{
   chomp;
   print "<tr>\n";
   if ( /Tues/ )
   {
      print "<td rowspan=2>$week</td>\n";
      $week++;
   }
   print "<td>$_</td>\n<td></td>\n<td></td>\n";
   print "</tr>\n<!-- --------------------- -->\n";
}
