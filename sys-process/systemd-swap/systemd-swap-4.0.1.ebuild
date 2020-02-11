# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils systemd autotools

DESCRIPTION="Script for creating hybrid swap space from zram swaps, swap files and swap partitions. "
HOMEPAGE="https://github.com/Nefelim4ag/systemd-swap"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL3"
SLOT="0"
KEYWORDS="amd64 x86"
# Need use zram in kernel.
RDEPEND=">=sys-apps/systemd-217
		app-shells/bash
"

# DEPEND="
	# ${RDEPEND}
	# virtual/pkgconfig
	# x11-misc/xclip
	# x11-misc/dmenu
	# x11-base/xorg-proto
	# media-fonts/fantasque-sans-mono
# "

# src_prepare() {
#	default

#	sed -i \
#		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
#		-e '/^STLDFLAGS/s|= .*|= $(LDFLAGS) $(LIBS)|g' \
#		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
#		config.mk || die
#	sed -i \
#		-e '/tic/d' \
#		Makefile || die

#	sed -i \
#		-e "s|pkg-config|$(tc-getPKG_CONFIG)|g" \
#		config.mk || die

#	sed "s/VERSION/${PV}/g" "st.1" || die

#	tc-export CC
# }

src_compile() {
	emake
}

src_install() {
	dobin "systemd-swap"
	systemd_dounit systemd-swap.service

	insinto /etc/systemd
	doins swap.conf
	local d
	for d in README* LICENSE ; do
		[[ -s $d ]] && dodoc $d
	done
}
