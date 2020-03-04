# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font git-r3 versionator

DESCRIPTION="URW++ base 35 font set"
HOMEPAGE="https://github.com/ArtifexSoftware/urw-base35-fonts"
EGIT_REPO_URI="https://github.com/ArtifexSoftware/urw-base35-fonts.git"

LICENSE="AGPL3"
SLOT="0"

KEYWORDS=""
WORKDIR="${WORKDIR}/gsfonts-9999/"
S="${WORKDIR}"
FONT_S="${S}/fonts"
FONT_SUFFIX="otf"
DOCS="README.md"
FONT_CONF=()
src_install() {
	for font_c in ${S}/fontconfig/*.conf ; do
		mv $font_c ${S}/fontconfig/69-${font_c##*/}
	done
	for font_c in ${S}/fontconfig/*.conf ; do
		FONT_CONF+=( "${font_c}" )
	done

	local metainfo="${ED}/usr/share/metainfo"
	if [[ ! -d ${metainfo} ]]; then
		mkdir -p ${metainfo} || die
	fi
	for f in ${S}/appstream/*.xml ; do
		mv ${f} ${metainfo} || die
	done
	font_src_install
}
