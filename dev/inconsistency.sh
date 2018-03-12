TMPDIR=/tmp

if [[ $1 = "ita-cat" ]]; then

lt-expand ../../../languages/apertium-ita/apertium-ita.ita.dix | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-cat-ita.ita-cat.t1x  ../ita-cat.t1x.bin  ../ita-cat.autobil.bin |
        apertium-interchunk ../apertium-cat-ita.ita-cat.t2x  ../ita-cat.t2x.bin |
        apertium-postchunk ../apertium-cat-ita.ita-cat.t3x  ../ita-cat.t3x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../ita-cat.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | grep -v '/@' | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'

elif [[ $1 = "cat-ita" ]]; then

lt-expand ../apertium-cat-ita.ca.dix | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-cat-ita.cat-ita.t1x  ../cat-ita.t1x.bin  ../cat-ita.autobil.bin |
        apertium-interchunk ../apertium-cat-ita.cat-ita.t2x  ../cat-ita.t2x.bin |
        apertium-postchunk ../apertium-cat-ita.cat-ita.t3x  ../cat-ita.t3x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../cat-ita.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'


else
	echo "sh inconsistency.sh <direction>";
fi
