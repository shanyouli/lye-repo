EAPI=6

inherit font

DESCRIPTION="Monospace font for pretty code listings and for the terminal"
HOMEPAGE="https://www.google.com/fonts/specimen/Inconsolata"
_gitver='efcbdc5d' #93ada0d4f9fa83389aba7cdbc797606f'
SRC_URI="https://raw.githubusercontent.com/google/fonts/${_gitver}/ofl/inconsolata/Inconsolata-Bold.ttf
https://raw.githubusercontent.com/google/fonts/${_gitver}/ofl/inconsolata/Inconsolata-Regular.ttf
https://raw.githubusercontent.com/google/fonts/${_gitver}/ofl/inconsolata/OFL.txt
https://raw.githubusercontent.com/google/fonts/${_gitver}/ofl/inconsolata/FONTLOG.txt"
LICENSE="OFL"
SLOT="0"
KEYWORDS="amd64 x86"
DOCS="OFL.txt FONTLOG.txt"
S="${WORKDIR}/${PN}"
FONT_SUFFIX="ttf"
src_unpack() {
	mkdir ${PN}
	for i in ${DISTDIR}/* ; do
		cp $i ${PN}
	done
}
