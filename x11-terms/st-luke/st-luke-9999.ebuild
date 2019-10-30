# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop git-r3 multilib savedconfig toolchain-funcs

DESCRIPTION="simple terminal implementation for X"
HOMEPAGE="https://github.com/LukeSmithxyz/st"
EGIT_REPO_URI="https://github.com/LukeSmithxyz/st.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

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
	x11-base/xorg-proto
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
}

src_configure() {
	sed -i \
		-e "s|pkg-config|$(tc-getPKG_CONFIG)|g" \
		config.mk || die

	tc-export CC
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

	# dodoc TODO

	make_desktop_entry ${PN/-*} simpleterm utilities-terminal 'System;TerminalEmulator;' ''
	local ST_DIR=/usr/share/doc/${PN/-*}
	insinto "${ST_DIR}"
	doins README.md
	doins LICENSE
}

pkg_postinst() {
	if ! [[ "${REPLACING_VERSIONS}" ]]; then
		elog "Please ensure a usable font is installed, like"
		elog "    media-fonts/corefonts"
		elog "    media-fonts/dejavu"
		elog "    media-fonts/urw-fonts"
	fi
}
