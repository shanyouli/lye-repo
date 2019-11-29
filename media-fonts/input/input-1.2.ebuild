# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font versionator

DESCRIPTION="Fonts for code from DJR & Font Bureau"
HOMEPAGE="https://input.fontbureau.com/"
SRC_URI="https://github.com/shanyouli/common-font/raw/master/input-1.2.tar.xz"

LICENSE="FONT SOFTWARE LICENSE AGREEMENT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+base +compressed +condensed +narrow"
S="${WORKDIR}/Input"

FONT_SUFFIX="ttf"
src_install() {
	FONT_CONFIG=()
	local font_s=()
	use base && {
		FONT_CONF+=(
			"${FILESDIR}/66-input-mono.conf"
			"${FILESDIR}/66-input-sans.conf"
			"${FILESDIR}/66-input-serif.conf"
		)
		font_s+=(
			"${S}"/Input_Fonts/InputMono/InputMono
			"${S}"/Input_Fonts/InputSans/InputSans
			"${S}"/Input_Fonts/InputSerif/InputSerif
		)
	}
	use compressed && {
		FONT_CONF+=(
			"${FILESDIR}/66-input-mono-compressed.conf"
			"${FILESDIR}/66-input-sans-compressed.conf"
			"${FILESDIR}/66-input-serif-compressed.conf"
		)
		font_s+=(
			"${S}"/Input_Fonts/InputMono/InputMonoCompressed/
			"${S}"/Input_Fonts/InputSans/InputSansCompressed/
			"${S}"/Input_Fonts/InputSerif/InputSerifCompressed/
		)
	}
	use condensed && {
		FONT_CONF+=(
			"${FILESDIR}/66-input-mono-condensed.conf"
			"${FILESDIR}/66-input-sans-condensed.conf"
			"${FILESDIR}/66-input-serif-condensed.conf"
		)
		font_s+=(
			"${S}"/Input_Fonts/InputMono/InputMonoCondensed
			"${S}"/Input_Fonts/InputSans/InputSansCondensed
			"${S}"/Input_Fonts/InputSerif/InputSerifCondensed
		)
	}
	use narrow && {
		FONT_CONF+=(
			"${FILESDIR}/66-input-mono-narrow.conf"
			"${FILESDIR}/66-input-sans-narrow.conf"
			"${FILESDIR}/66-input-serif-narrow.conf"
		)
		font_s+=(
			"${S}"/Input_Fonts/InputMono/InputMonoNarrow
			"${S}"/Input_Fonts/InputSans/InputSansNarrow
			"${S}"/Input_Fonts/InputSerif/InputSerifNarrow
		)
	}
	dodoc LICENSE.txt
	dodoc README.txt

	for f in "${font_s[@]}"; do
		FONT_S="${f}/" font_src_install
	done
}
