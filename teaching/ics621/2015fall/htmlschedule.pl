#!/usr/bin/perl

use strict;
use Data::Dumper;

my $topicfile="ics621topics.csv";
my $videofile="videos.csv";
my $schedulefile="f15ics621";

open(TOP,"<$topicfile") or die "Cannot open topics file $topicfile\n";
my %topics=();
while (<TOP>)
{
   chomp;
   my ($id,$ch,$topicname) = split(/\|/);
   $topics{$id}="$topicname;$ch;";
}
close TOP;


open(TOP,"<$videofile") or die "Cannot open videos file $videofile\n";
my %videos=();
while (<TOP>)
{
   chomp;
   my ($id,$url,$title) = split(/\|/);

   if ( $url =~ /http/ )
   {

   }
   else
   {
      $url = "https://www.educreations.com\/lesson\/view/$url";
   }

   $videos{$id}="<a href=\"$url\">$title</a><br/>";
}
close TOP;
#print Dumper(\%videos); exit;

open(CSV,"<$schedulefile") or die "Cannot open $schedulefile\n";
my @csvdata=<CSV>;
close CSV;

my $ncols=5;
foreach my $row (@csvdata)
{
  chomp $row;
  my ($week,$date,$topic,$readings,$vids, $remarks) = split (/;/, $row );
  print "<!-- ------------------------------------ -->\n";
  print "<tr>\n";

  my $col;
  foreach $col ($week,$date)
  {
     if( length($col) == 0)
     {
         $col="&nbsp";
     }
     print "   <td>\n      $col\n   </td>\n";
  }
  if( exists $topics{$topic} )
  {
     my ($topicname, $defaultreadings) = split(/\;/, $topics{$topic}); 

     print "   <td>\n      $topicname\n   </td>\n";

     if( length($readings) == 0)
     {
        print "   <td>\n      $defaultreadings\n   </td>\n";
     }
     else
     {
        print "   <td>\n      $readings\n   </td>\n";
     }
  }
  else
  {
     print "   <td>\n      $topic\n   </td>\n";
     print "   <td>\n      $readings\n   </td>\n";
  }
  while( $vids =~ /vid:[\-\w\d]*\./ )
  {
      my $viditem = $&;
      #print "\n matched = $&\n";
      my ($label,$vidid) = split(/:/,$&);

      $vidid =~ s/\.//;
      #print "\n key = $vidid\n";
      my $tgt="undefined!";
      if( exists $videos{$vidid} )
      {
         $tgt=$videos{$vidid};
      }
      #print "\n tgt = $tgt\n";
      $vids =~ s/$viditem/$tgt/;
      #print "\n vids = $vids\n";
  }
  print "   <td>\n      $vids\n   </td>\n";

  while( $remarks =~ /slides:ics321-\d\d-\w*/ )
  {
      #print "\n matched = $&\n";
      my ($label,$pdffile) = split(/:/,$&);
      my $tgt="<a href=\"$pdffile.pdf\">$label (pdf)</a>";
      $remarks =~ s/$&/$tgt/;
  }
  while( $remarks =~ /link:[\-.\/\w]*:[\-\w\s\(\)]*\./ )
  {
      #print "\n MATCHED = $&\n";
      my $src=$&;
      $src =~ s/\.$//;
      my ($tag, $url, $label) = split(/:/,$src);
      my $tgt="<a href=\"$url\">$label</a>";
      #print "\n REPLACE $src WITH $tgt\n\n";
      $src=~ s/\(/\\\(/g;
      $src=~ s/\)/\\\)/g;
      $remarks =~ s/$src/$tgt/g;
  }
  while( $remarks =~ /ex:\d+-\w*/ )
  {
      #print "\n remarks = $remarks\n";
      #print "\n matched = $&\n";
      my $matched = $&;
      my $pdffile = $&;
      $pdffile =~ s/://;
      #print "\n pdffile = $pdffile\n";
      my ($label) = split(/\-/,$matched);
      #print "\n label = $label\n";
      $label =~ s/ex\:/Exercise\ /;
      #print "\n label = $label\n";
      my $tgt="<a href=\"$pdffile.pdf\">$label (pdf)</a>";
      $remarks =~ s/$matched/$tgt/;
  }



  $col = $remarks;
  if( length($col) == 0)
  {
     $col="&nbsp";
  }
  print "   <td>\n      $col\n   </td>\n";
 
  print "</tr>\n";
}

print "<!-- ------------------------------------ -->\n";


