
# context generator for Indian language
#  Shinnosuke Takamichi, NAIST, Japan

$dumpfeats = "~/Research/HTS/festival/examples/dumpfeats"; # dumpfeats of Festival
$promptdir = "prompt-utt"; # dir to find utt files of Festival
$fulldir = "HTS/labels/full"; # dir to save label files of HTS
$opt = "-eval scripts/extra_feats.scm -relation Segment -feats scripts/label.feats"; #option for dumpfeats

open(TXT, $ARGV[0]); # ARGV[0] = text file
system("mkdir -p $fulldir");

while (<TXT>) {
   $line = $_; chomp($line);
   if ($line =~ /\( (.+) \".+\" \)/) {
      $base = $1;
      print "$base\n";
      system("$dumpfeats $opt -output $fulldir/$base.tmp $promptdir/$base.utt");
      system("awk -f scripts/label-full.awk $fulldir/$base.tmp | awk -F' ' '{print \$3}' | sed 's/c}/cc/g' > $fulldir/$base.lab");
      system("rm $fulldir/$base.tmp");
   }
}

