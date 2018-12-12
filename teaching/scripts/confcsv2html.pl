#!/usr/bin/perl

@confdata=<STDIN>;

@sorted = sort byAbstract @confdata;

print "<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n";

my $header = pop @sorted;
foreach my $conf (@sorted)
{
  my ( $name, $abst, $pape, $noti, $crc, $dates, $venue, $url ) = split (/;/, $conf);
  chomp $url;
  print "<tr>\n";
  print "<td><a href=\"$url\">$name</a></td>\n";


  foreach my $item ($abst, $pape, $noti, $crc, $dates, $venue)
  {
     if (  $item =~ /(20\d\d)([01]\d)([0-3]\d)-(20\d\d)([01]\d)([0-3]\d)/  )
     {
	my ($src1,$tgt1) = ( "$1$2$3", "$1/$2/$3");
	my ($src2,$tgt2) = ( "$4$5$6", "$4/$5/$6");

        $item =~ s/$src1/$tgt1/;
        $item =~ s/$src2/$tgt2/;
     }
     elsif (  $item =~ /(20\d\d)([01]\d)([0-3]\d)/  )
     {
	my ($src1,$tgt1) = ( "$1$2$3", "$1/$2/$3");
        $item =~ s/$src1/$tgt1/;
     }
     print "<td> $item </td>\n";
  }
  print "</tr>\n";
}

print "</table>\n";

sub byAbstract
{
  my @afields=split(/;/, $a);
  my @bfields=split(/;/, $b);

  $afields[1] cmp $bfields[1];
}

