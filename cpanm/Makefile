define $(d)template
$(eval include download.mk)
$(eval include helpdoc.mk)

$(call helpdoc,$(d)cpanm.pl,App::cpanminus Perl Package Manager. To install in your home directory run "perl $(d)cpanm.pl App::cpanminus". To install system-wide run "perl $(d)cpanm.pl --sudo App::cpanminus". For more details see http://search.cpan.org/~miyagawa/App-cpanminus/lib/App/cpanminus.pm)
$(d)cpanm.pl:
	$(call download,https://cpanmin.us,$$@)

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean:
	rm -f $(d)cpanm*

$(eval .DEFAULT_GOAL := help)
endef

$(eval $($(d)template))
$(eval $(d)template :=)
