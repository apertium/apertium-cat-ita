echo "==Catalan->Italian==========================";
bash inconsistency.sh cat-ita ../../../apertium-cat/apertium-cat.cat.dix > /tmp/cat-ita.testvoc; bash inconsistency-summary.sh /tmp/cat-ita.testvoc cat-ita; grep ' #' /tmp/cat-ita.testvoc > ./testvoc-errors.cat-ita.txt; grep '@' /tmp/cat-ita.testvoc >> ./testvoc-errors.cat-ita.txt
echo ""
echo "==Italian->Catalan==========================";
bash inconsistency.sh ita-cat ../../../apertium-ita/apertium-ita.ita.dix > /tmp/ita-cat.testvoc; bash inconsistency-summary.sh /tmp/ita-cat.testvoc ita-cat; grep ' #' /tmp/ita-cat.testvoc > ./testvoc-errors.ita-cat.txt; grep '@' /tmp/ita-cat.testvoc >> ./testvoc-errors.ita-cat.txt
