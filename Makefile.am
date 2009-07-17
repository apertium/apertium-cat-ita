VERSION=0.1
LANG1=ca
LANG2=it
PREFIX1=$(LANG1)-$(LANG2)
PREFIX2=$(LANG2)-$(LANG1)

BASENAME=apertium-$(PREFIX1)

VAR1=std
VAR2=val-
PREFVAR1=#dejar en blanco
PREFVAR2=val-
TARGETS_COMMON = \
     $(PREFIX1).automorf.bin $(PREFIX1).autobil.bin $(PREFIX1).autogen.bin \
     $(PREFIX1).autopgen.bin $(PREFIX2).automorf.bin $(PREFIX2).autobil.bin \
     $(PREFIX2).autogen.bin \
     $(PREFIX2).autopgen.bin \
     $(PREFIX1).t1x.bin $(PREFIX1).t2x.bin $(PREFIX1).t3x.bin \
     $(PREFIX2).t1x.bin $(PREFIX2).t2x.bin $(PREFIX2).t3x.bin $(PREFIX1).mode $(PREFIX2).mode



.deps/$(PREFVAR1)$(LANG1).dix: $(BASENAME).$(LANG1).dix
	xsltproc translate-to-default-equivalent.xsl $< | xsltproc --stringparam lang cat --stringparam side left filter.xsl - | xsltproc --stringparam alt std alt.xsl - >$@

.deps/$(PREFVAR2)$(LANG1).dix: $(BASENAME).$(LANG1).dix
	xsltproc translate-to-default-equivalent.xsl $< | xsltproc --stringparam lang val --stringparam side left filter.xsl - | xsltproc --stringparam alt std alt.xsl - >$@

.deps/$(PREFVAR1)$(LANG2).dix: $(BASENAME).$(LANG2).dix
	xsltproc translate-to-default-equivalent.xsl $< | xsltproc --stringparam lang cat --stringparam side left filter.xsl - | xsltproc --stringparam alt std alt.xsl - >$@

.deps/$(PREFVAR2)$(LANG2).dix: $(BASENAME).$(LANG2).dix
	xsltproc translate-to-default-equivalent.xsl $< | xsltproc --stringparam lang val --stringparam side left filter.xsl - | xsltproc --stringparam alt std alt.xsl - >$@

.deps/$(PREFVAR1)$(PREFIX1).dix: $(BASENAME).$(PREFIX1).dix
	xsltproc translate-to-default-equivalent.xsl $< | xsltproc --stringparam lang cat --stringparam side right filter.xsl - | xsltproc --stringparam alt std alt.xsl - >$@

.deps/$(PREFVAR2)$(PREFIX1).dix: $(BASENAME).$(PREFIX1).dix
	xsltproc translate-to-default-equivalent.xsl $< | xsltproc --stringparam lang val --stringparam side right filter.xsl - | xsltproc --stringparam alt std alt.xsl - >$@


$(PREFVAR1)$(PREFIX1).automorf.bin: .deps/$(PREFVAR1)$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp lr $(BASENAME).$(LANG1).dix $@

$(PREFVAR1)$(PREFIX1).autobil.bin: .deps/$(PREFVAR1)$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

$(PREFVAR1)$(PREFIX1).autogen.bin: .deps/$(PREFVAR1)$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFIX1).autopgen.bin: $(BASENAME).post-$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

$(PREFVAR1)$(PREFIX2).automorf.bin: .deps/$(PREFVAR1)$(LANG2).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

$(PREFVAR1)$(PREFIX2).autobil.bin: .deps/$(PREFVAR1)$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFVAR1)$(PREFIX2).autogen.bin: .deps/$(PREFVAR1)$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(PREFVAR1)$(PREFIX2).autopgen.bin: $(BASENAME).post-$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@


$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX1).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t1x $@

$(PREFIX1).t2x.bin: $(BASENAME).$(PREFIX1).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX1).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t2x $@

$(PREFIX1).t3x.bin: $(BASENAME).$(PREFIX1).t3x
	apertium-validate-postchunk $(BASENAME).$(PREFIX1).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX1).t3x $@

$(PREFIX2).t1x.bin: $(BASENAME).$(PREFIX2).t1x
	apertium-validate-transfer $(BASENAME).$(PREFIX2).t1x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t1x $@

$(PREFIX2).t2x.bin: $(BASENAME).$(PREFIX2).t2x
	apertium-validate-interchunk $(BASENAME).$(PREFIX2).t2x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t2x $@

$(PREFIX2).t3x.bin: $(BASENAME).$(PREFIX2).t3x
	apertium-validate-postchunk $(BASENAME).$(PREFIX2).t3x
	apertium-preprocess-transfer $(BASENAME).$(PREFIX2).t3x $@


EXTRA_DIST = $(BASENAME).post-$(LANG1).dix $(BASENAME).post-$(LANG2).dix \
           $(BASENAME).$(PREFIX1).t1x $(BASENAME).$(PREFIX1).t2x \
           $(BASENAME).$(PREFIX1).t3x $(BASENAME).$(PREFIX2).t1x \
           $(BASENAME).$(PREFIX2).t2x $(BASENAME).$(PREFIX2).t3x \
           modes.xml

#           $(LANG1)-tagger-data/README $(LANG2)-tagger-data/README 
#           $(BASENAME).$(LANG1).tsx 
#           $(BASENAME).$(LANG2).tsx  
#           $(PREFIX1).prob $(PREFIX2).prob

apertium_es_itdir=$(prefix)/share/apertium/apertium-$(PREFIX1)/
apertium_es_modesdir=$(prefix)/share/apertium/modes/

$(PREFIX1).mode: modes.xml 
	apertium-gen-modes modes.xml
	cp *.mode modes/

$(PREFIX2).mode: modes.xml
	apertium-gen-modes modes.xml
	cp *.mode modes/

apertium_es_it_DATA=$(PREFIX1).automorf.bin $(PREFIX2).automorf.bin \
                    $(PREFIX1).autobil.bin $(PREFIX2).autobil.bin \
                    $(PREFIX1).autogen.bin $(PREFIX2).autogen.bin \
                    $(PREFIX1).autopgen.bin \
                    $(PREFIX2).autopgen.bin \
		    $(PREFIX1).t1x.bin $(PREFIX1).t2x.bin $(PREFIX1).t3x.bin \
		    $(PREFIX2).t1x.bin $(PREFIX2).t2x.bin $(PREFIX2).t3x.bin \
		    $(PREFIX1).mode $(PREFIX2).mode \
		    $(PREFIX1).prob $(PREFIX2).prob 
		  
install-data-local: 
	$(INSTALL_DATA) $(PREFIX1).mode $(apertium_ca_modesdir)
	$(INSTALL_DATA) $(PREFIX2).mode $(apertium_ca_modesdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t1x $(BASENAME).$(PREFIX1).t2x $(apertium_ca_itdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX1).t3x $(BASENAME).$(PREFIX2).t1x $(apertium_ca_itdir)
	$(INSTALL_DATA) $(BASENAME).$(PREFIX2).t2x $(BASENAME).$(PREFIX2).t3x $(apertium_ca_itdir)

CLEANFILES = -rf $(TARGETS_COMMON) modes
