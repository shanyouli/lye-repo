# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit font

DESCRIPTION="Serif typeface for setting text. Designed to complement Source Sans Pro"
HOMEPAGE="https://github.com/adobe-fonts/source-serif-pro"
SRC_URI="${HOMEPAGE}/releases/download/${PV}R/${P}R.zip -> ${P}.zip"
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-arch/unzip"

S="${WORKDIR}/${P}R/OTF"
FONT_S="${S}"
FONT_SUFFIX="otf"
