# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop multilib  toolchain-funcs

DESCRIPTION="simple terminal implementation for X"
HOMEPAGE="https://github.com/shanyouli/syl-st"
SRC_URI="https://github.com/shanyouli/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	!x11-terms/st
	>=sys-libs/ncurses-6.0:0=
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXft
"

DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-misc/xclip
	x11-misc/dmenu
	x11-base/xorg-proto
	media-fonts/fantasque-sans-mono
"

src_prepare() {
	default

	sed -i \
		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
		-e '/^STLDFLAGS/s|= .*|= $(LDFLAGS) $(LIBS)|g' \
		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
		config.mk || die
	sed -i \
		-e '/tic/d' \
		Makefile || die

	sed -i \
		-e "s|pkg-config|$(tc-getPKG_CONFIG)|g" \
		config.mk || die

	sed "s/VERSION/${PV}/g" "st.1" || die

	tc-export CC
}

src_compile() {
	emake
}

src_install() {
	dobin "st"
	dobin st-copyout
	domenu st.desktop
	doman st.1

	# dodoc TODO

	make_desktop_entry ${PN} simpleterm utilities-terminal 'System;TerminalEmulator;' ''
	local ST_DIR=/usr/share/doc/${PN}
	insinto "${ST_DIR}"
	if [[ -f README ]]; then
		doins README
	elif [[ -f README.md ]]; then
		doins README.md
	elif [[ -f Readme.org ]]; then
		doins Readme.org
	fi
	doins LICENSE
}
