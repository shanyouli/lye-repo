# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font versionator

DESCRIPTION="Fonts for code from DJR & Font Bureau"
HOMEPAGE="https://input.fontbureau.com/"
SRC_URI="https://github.com/shanyouli/Input/archive/v1.2.zip -> ${P}.zip"
LICENSE="FONT SOFTWARE LICENSE AGREEMENT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+base +compressed +condensed +narrow"
DEPEND="app-arch/unzip"
S="${WORKDIR}/Input-${PV}"

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
			"${S}"/InputMono/
			"${S}"/InputSans/
			"${S}"/InputSerif/
		)
	}
	use compressed && {
		FONT_CONF+=(
			"${FILESDIR}/66-input-mono-compressed.conf"
			"${FILESDIR}/66-input-sans-compressed.conf"
			"${FILESDIR}/66-input-serif-compressed.conf"
		)
		font_s+=(
			"${S}"/InputMonoCompressed/
			"${S}"/InputSansCompressed/
			"${S}"/InputSerifCompressed/
		)
	}
	use condensed && {
		FONT_CONF+=(
			"${FILESDIR}/66-input-mono-condensed.conf"
			"${FILESDIR}/66-input-sans-condensed.conf"
			"${FILESDIR}/66-input-serif-condensed.conf"
		)
		font_s+=(
			"${S}"/InputMonoCondensed/
			"${S}"/InputSansCondensed/
			"${S}"/InputSerifCondensed/
		)
	}
	use narrow && {
		FONT_CONF+=(
			"${FILESDIR}/66-input-mono-narrow.conf"
			"${FILESDIR}/66-input-sans-narrow.conf"
			"${FILESDIR}/66-input-serif-narrow.conf"
		)
		font_s+=(
			"${S}"/InputMonoNarrow/
			"${S}"/InputSansNarrow/
			"${S}"/InputSerifNarrow/
		)
	}
	dodoc *.txt

	for f in "${font_s[@]}"; do
		FONT_S="${f}/" font_src_install
	done
}
