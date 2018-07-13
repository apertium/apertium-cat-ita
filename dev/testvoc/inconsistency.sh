TMPDIR=/tmp

if [[ $1 = "ita-cat" ]]; then

lt-expand $2 | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1-$1.txt |
        apertium-pretransfer|\
        lt-proc -b ../../ita-cat.autobil.bin |\
        apertium-transfer -b ../../apertium-cat-ita.ita-cat.t1x  ../../ita-cat.t1x.bin | apertium-interchunk ../../apertium-cat-ita.ita-cat.t2x  ../../ita-cat.t2x.bin | apertium-postchunk ../../apertium-cat-ita.ita-cat.t3x  ../../ita-cat.t3x.bin | tee $TMPDIR/tmp_testvoc2-$1.txt |\
        lt-proc -d ../../ita-cat.autogen.bin > $TMPDIR/tmp_testvoc3-$1.txt
paste -d _ $TMPDIR/tmp_testvoc1-$1.txt $TMPDIR/tmp_testvoc2-$1.txt $TMPDIR/tmp_testvoc3-$1.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g' | grep -v '@'
rm $TMPDIR/tmp_testvoc1-$1.txt
rm $TMPDIR/tmp_testvoc2-$1.txt
rm $TMPDIR/tmp_testvoc3-$1.txt

elif [[ $1 = "cat-ita" ]]; then

lt-expand $2 | grep -v REGEX | grep -v '<prn><enc>' | sed 's/:>:/%/g' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1-$1.txt |
        apertium-pretransfer|\
        lt-proc -b ../../cat-ita.autobil.bin |\
        apertium-transfer -b ../../apertium-cat-ita.cat-ita.t1x  ../../cat-ita.t1x.bin | apertium-interchunk ../../apertium-cat-ita.cat-ita.t2x  ../../cat-ita.t2x.bin | apertium-postchunk ../../apertium-cat-ita.cat-ita.t3x  ../../cat-ita.t3x.bin | tee $TMPDIR/tmp_testvoc2-$1.txt |\
        lt-proc -d ../../cat-ita.autogen.bin > $TMPDIR/tmp_testvoc3-$1.txt
paste -d _ $TMPDIR/tmp_testvoc1-$1.txt $TMPDIR/tmp_testvoc2-$1.txt $TMPDIR/tmp_testvoc3-$1.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g' | grep -v '@'
rm $TMPDIR/tmp_testvoc1-$1.txt
rm $TMPDIR/tmp_testvoc2-$1.txt
rm $TMPDIR/tmp_testvoc3-$1.txt

else
	echo "sh inconsistency.sh <direction>";
fi
