# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6,7} )
inherit distutils-r1 git-r3 systemd user

DESCRIPTION="Yet another keyboard remapping tool for X environment."
HOMEPAGE="https://github.com/mooz/${PN}"
EGIT_REPO_URI="https://github.com/mooz/xkeysnail"
# EGIT_REPO_URI="https://github.com/nlfiasel/xkeysnail"


LICENSE="GPL"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+udev"
DOC="${FILESDIR}/config.py"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/python-evdev-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/python-xlib-0.25[${PYTHON_USEDEP}]
		>=dev-python/inotify_simple-1.1.8[${PYTHON_USEDEP}]
		udev? ( virtual/libudev:= )
		acct-group/input
		acct-group/uinput"
# src_install() {
#	distutils-r1_src_install
#	insinto /etc/xkeysnail
#	newins ${FILESDIR}/config.py config.py || die
#	systemd_dounit ${FILESDIR}/xkeysnail.service || die
#	insinto /lib/udev/rules.d
#	doins ${FILESDIR}/30-input.rules
#	doins ${FILESDIR}/30-uinput.rules
# }

pkg_postinst() {
	elog "add input, uinput group"
	elog "usermod -a -G input,uinput $USER"
}
