# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6,7} )
inherit distutils-r1

DESCRIPTION="Yet another keyboard remapping tool for X environment."
HOMEPAGE="https://github.com/chrisjbillington/${PN}"
SRC_URI="https://github.com/chrisjbillington/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
