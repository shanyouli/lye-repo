# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1

DESCRIPTION=" Python bindings for MuPDF's rendering library. "
HOMEPAGE="https://github.com/pymupdf/PyMuPDF"
SRC_URI="https://github.com/pymupdf/PyMuPDF/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
S="${WORKDIR}/PyMuPDF-${PV}"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	media-libs/freetype:2
	media-libs/openjpeg:2
	media-libs/jbig2dec
	media-libs/libjpeg-turbo
	app-text/mupdf:=
"
src_prepare() {
	sed -i "s:# 'jbig2dec', 'openjp2', 'jpeg', 'freetype',:'jbig2dec', 'openjp2', 'jpeg', 'freetype',:g" setup.py || die "error"
	sed -i -e "/mupdf-third/d" setup.py || die "sed failed"
	default
}
