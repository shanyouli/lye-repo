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
RDEPEND="sys-apps/systemd
		app-shells/bash
		>=sys-apps/util-linux-2.26
"

DEPEND="${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	dobin "systemd-swap"
	systemd_dounit systemd-swap.service

	insinto /etc/systemd
	if [[ -f /etc/systemd/swap.conf ]]; then
		newins /etc/systemd/swap.conf swap.conf
	else
		doins swap.conf
	fi

	local d
	for d in README* LICENSE ; do
		[[ -s $d ]] && dodoc $d
	done
}
