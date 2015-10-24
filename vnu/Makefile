define $(d)template
$(eval include download.mk)
$(eval include helpdoc.mk)
$(eval include recv_key.mk)
$(eval include verify_sig.mk)

$(d)BC3A4B95:
	$(call recv_key,$$(notdir $$@),$$@)

$(d)vnu-v15.6.29-UNVERIFIED.zip:
	$(call download,https://github.com/validator/validator/releases/download/15.6.29/vnu.jar_15.6.29.zip,$$@)

$(d)vnu-v15.6.29.zip.asc:
	$(call download,https://github.com/validator/validator/releases/download/15.6.29/vnu.jar_15.6.29.zip.asc,$$@)

$(d)vnu-v15.6.29.zip: $(d)vnu-v15.6.29.zip.asc $(d)vnu-v15.6.29-UNVERIFIED.zip | $(d)BC3A4B95
	$(call verify_sig,$$(firstword $$^),$$(lastword $$^))
	cp $$(lastword $$^) $$@

$(d)vnu-v15.6.29.jar: $(d)vnu-v15.6.29.zip
	unzip -p $$< dist/vnu.jar > $$@

$(call helpdoc,$(d)vnu.jar,Latest stable v.Nu HTML validator JAR file. For details see https://validator.github.io/validator/)
$(d)vnu.jar: $(d)vnu-v15.6.29.jar
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean:
	rm -f $(d)vnu* $(d)BC3A4B95

$(eval .DEFAULT_GOAL := help)
endef

$(eval $($(d)template))
$(eval $(d)temlpate :=)
