TMPDIR=/tmp
lt-expand ../apertium-ca-it.it.dix | grep -v '<prn><enc>' | grep -e ':<:' -e '\w:\w' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-ca-it.it-ca.t1x  ../it-ca.t1x.bin  ../it-ca.autobil.bin |
        apertium-interchunk ../apertium-ca-it.it-ca.t2x  ../it-ca.t2x.bin |
        apertium-postchunk ../apertium-ca-it.it-ca.t3x  ../it-ca.t3x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../it-ca.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'
