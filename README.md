#BlizzardChallenge2015

This repository has the context generator and question files for Blizzard Challenge 2015 
which built Text-to-speech synthesizer for Indian languages.

# Toolkits required
* Festival (> 2.7) ... for text analysis of Indian languages
* HTS (> 2.1) ... for using the question file

# Context generator (scripts/)
1. run an analysis recipe of Festival to extract utt files (see <http://festvox.org/festvox/x3528.html>).
2. fix scripts/extra_feats.scm to load the voice definition file (festvox/cmu_indic_ss_clunits.scm) of Festival.
3. fix scripts/mk_hts_full.pl
Please change $dumpfeat, $promptdir, $fulldir, and $opt to fit your environment.
4. extract contextual features
    perl scripts/mk_hts_full.pl etc/txt.done.data(text file for Festival)

# Question file
please load question files for training with HTS.
