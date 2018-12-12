#!/usr/bin/perl

use lib '/home/l/lipyeow/perllib/lib';

use Date::Calc qw(Day_of_Year 
                  Day_of_Week
                  Add_Delta_Days
                  Date_to_Text
                  Month_to_Text
                  Day_of_Week_to_Text 
                  Day_of_Week_Abbreviation
 );

my @curdate=(2017,8, 21 );
my @enddate=(2017,12,6);
my @deltadays = (2,5);

my $classnum = 0;
while (Day_of_Year(@curdate) <= Day_of_Year( @enddate) )
{  
   print (int($classnum /2)+1);
   print ";";
   my $datestr = Date_to_Text( @curdate);
   my ($dayofweek, $datestr2) = split (/\ /, $datestr);
   my ($dayofmonth, $month, $year) = split (/-/, $datestr2);
   print "$dayofweek $month $dayofmonth";
   print "\n";

@curdate= Add_Delta_Days( @curdate, $deltadays[ ($classnum % 2)] );
$classnum++;
}

