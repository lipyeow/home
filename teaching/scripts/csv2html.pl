#!/usr/bin/perl

@csvdata=<STDIN>;

print "<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\" width=\"100%\">\n";

@sorted = @csvdata;

my $header = shift @sorted;
print "<tr>\n";
foreach my $col (split(/;/, $header))
{
   print "   <th width=\"10%\">$col</th>\n";
}
print "</tr>\n";

my $ncols = scalar( split(/;/, $header));

foreach my $row (@sorted)
{
  chomp $row;
  my @cols = split (/;/, $row );
  print "<!-- ------------------------------------ -->\n";
  print "<tr>\n";

  my $colid = 0;
  foreach my $col (@cols)
  {
     if( length($col) == 0)
     {
         $col="&nbsp";
     }
     print "   <td>\n      $col\n   </td>\n";
     $colid++;
  }
  for(; $colid < $ncols; $colid++)
  {
     print "   <td>\n   &nbsp\n   </td>\n";
  }
  print "</tr>\n";
}

print "<!-- ------------------------------------ -->\n";
print "</table>\n";

sub byAbstract
{
  my @afields=split(/;/, $a);
  my @bfields=split(/;/, $b);

  $afields[1] cmp $bfields[1];
}

