#!/usr/bin/perl

$/ = undef;
my $stages = <STDIN>;

#print $stages;

my @toc = [];

while ($stages =~ /.*?\n### ([^\n]+)\s*(.*?)---/gs) {
  my ($name, $details) = ($1, $2);

  my $filename = $name;
  $filename =~ s/[ ()]//g;

  open(OUT, ">reference/$filename.md");
  print OUT "# $name\n\n";
  
  $details =~ /([^.]*\.).*/gs;
  my $firstLine = $1;

  my $without;
  my $with;
  if ($details =~ /(.*?)\n(\*\*.*)/s) {
    $without = $1;
    $with = $2;
  } 

  print OUT $firstLine;
  print OUT "\n\n## Signature\n\n## Description\n\n$without\n\n";
  print OUT "\@\@\@div { .callout }\n\n$with\@\@\@\n\n";
  print OUT "## Example\n\n";

  close(OUT);
 
  print("* [$name](reference/$filename.md)\n");
}
