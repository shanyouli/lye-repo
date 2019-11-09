# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{3,4,5,6,7} )
inherit distutils-r1

DESCRIPTION="Command line interface to the freedesktop.org trashcan."
HOMEPAGE="https://github.com/andreafrancia/${PN}"
SRC_URI="https://github.com/andreafrancia/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
