EAPI=6

inherit font

DESCRIPTION="Monospace font for pretty code listings and for the terminal"
HOMEPAGE="https://www.google.com/fonts/specimen/Inconsolata"
_gitver='8f97561' #8f9756108bfbbdf625e24e6b869ed02465b2a7af

SRC_URI="https://github.com/google/fonts/raw/${_gitver}/apache/tinos/Tinos-Bold.ttf
https://github.com/google/fonts/raw/${_gitver}/apache/tinos/Tinos-BoldItalic.ttf
https://github.com/google/fonts/raw/${_gitver}/apache/tinos/Tinos-Italic.ttf
https://github.com/google/fonts/raw/${_gitver}/apache/tinos/Tinos-Regular.ttf
https://github.com/google/fonts/raw/${_gitver}/apache/tinos/LICENSE.txt"
LICENSE="OFL"
SLOT="0"
KEYWORDS="amd64 x86"
DOCS="LICENSE.txt"
S="${WORKDIR}/${PN}"
FONT_SUFFIX="ttf"
src_unpack() {
	mkdir ${PN}
	for i in ${DISTDIR}/* ; do
		cp $i ${PN}
	done
}
