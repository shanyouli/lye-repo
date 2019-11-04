# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6,7} )
inherit distutils-r1 git-r3

DESCRIPTION="Yet another keyboard remapping tool for X environment."
HOMEPAGE="https://github.com/mooz/${PN}"
EGIT_REPO_URI="https://github.com/mooz/${PN}.git"


LICENSE="GPL"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/python-evdev-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/python-xlib-0.25[${PYTHON_USEDEP}]
		>=dev-python/inotify_simple-1.1.8[${PYTHON_USEDEP}]
"
