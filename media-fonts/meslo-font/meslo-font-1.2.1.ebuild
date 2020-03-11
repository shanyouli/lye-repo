EAPI=6

inherit font

DESCRIPTION="Monospace font for pretty code listings and for the terminal"
HOMEPAGE="https://www.google.com/fonts/specimen/Inconsolata"
_gitver="c7ee3ce" #c7ee3ce8fa43de2a9c99e94677ea9d1c46e56f26

SRC_URI="https://github.com/andreberg/Meslo-Font/raw/${_gitver}/dist/v1.2.1/Meslo%20LG%20DZ%20v1.2.1.zip -> ${PN}-DZ.zip
https://github.com/andreberg/Meslo-Font/raw/${_gitver}/dist/v1.2.1/Meslo%20LG%20v1.2.1.zip -> ${PN}.zip"
# LICENSE="OFL"
SLOT="0"
KEYWORDS="amd64 x86"
S="${WORKDIR}/${P}"
# FONT_S=${S}
FONT_SUFFIX="ttf"
src_unpack() {
	mkdir -p ${P}
	unpack ${PN}.zip
	unpack ${PN}-DZ.zip
	mv -vf "Meslo LG DZ v${PV}"/*  ${P}
	mv -vf "Meslo LG v${PV}"/*  ${P}
}
