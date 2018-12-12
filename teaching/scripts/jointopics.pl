#!/usr/bin/perl

my $topicfile="ics321topics.csv";

open(TOP,"<$topicfile") or die "Cannot open topics file $topicfile\n";
my %topics=();
while (<TOP>)
{
   chomp;
   my ($id,$ch,$topicname) = split(/\|/);
   $topics{$id}="$topicname;$ch;";
}
close TOP;

@csvdata=<STDIN>;

print shift @csvdata;
foreach my $row (@csvdata)
{
  chomp $row;
  my ($week,$date,$topic,$readings,$remarks) = split (/;/, $row );

  if( exists $topics{$topic} )
  {
     print "$week;$date;", $topics{$topic}, "$remarks";
  }
  else
  {
     print $row;
  }

  print "\n";
}

