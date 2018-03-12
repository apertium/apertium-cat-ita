#echo "==Catalan->Italian============================";
#sh inconsistency.sh ca-it > /tmp/ca-it.testvoc; sh inconsistency-summary.sh /tmp/ca-it.testvoc ca-it
#echo ""
echo "==Italian->Catalan=============================";
bash inconsistency.sh ita-cat > /tmp/ita-cat.testvoc; bash inconsistency-summary.sh /tmp/ita-cat.testvoc ita-cat
