# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit font

DESCRIPTION="Noto Emoji fonts"
HOMEPAGE="https://github.com/googlefonts/noto-emoji"
SRC_URI="https://github.com/googlefonts/noto-emoji/archive/v2020-04-08-unicode12_1.zip -> ${P}.zip"
LICENSE="APL-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="app-arch/unzip
	!media-fonts/noto-emoji"
DEPEND="${RDEPEND}"
S="${WORKDIR}/noto-emoji-2019-04-08-unicode12_1/fonts"
FONT_S="${S}"
FONT_SUFFIX="ttf"
FONT_CONF=( "${FILESDIR}/66-noto-color-emoji.conf" )
