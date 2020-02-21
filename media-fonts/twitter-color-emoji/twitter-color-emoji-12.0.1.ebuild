# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="A color and B&W emoji SVG-in-OpenType font with support for ZWJ, skin tone modifiers and country flags."
HOMEPAGE="https://github.com/eosrei/twemoji-color-font"
SRC_URI="${HOMEPAGE}/releases/download/v${PV//_/-}/TwitterColorEmoji-SVGinOT-Linux-${PV//_/-}.tar.gz"
KEYWORDS="amd64 x86"
LICENSE="MIT"
SLOT="0"
IUSE="simple"
DEPEND="
	simple? ( media-fonts/ttf-bitstream-vera )
"
RDEPEND="${DEPEND}"

FONT_SUFFIX="ttf"
DOCS="README.md LICENSE*"
S="${WORKDIR}/TwitterColorEmoji-SVGinOT-Linux-${PV//_/-}"
FONT_S="${S}"
src_install() {
	if use simple ; then
		FONT_CONF=( fontconfig/56-twemoji-color.conf )
	fi
	font_src_install
}
