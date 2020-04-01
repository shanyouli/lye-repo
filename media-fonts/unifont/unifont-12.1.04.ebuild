EAPI=6
inherit font
DESCRIPTION="TrueType version of the GNU Unifont"
HOMEPAGE="http://www.unifont.org/new/"
SRC_URI="https://ftp.gnu.org/gnu/${PN}/unifont-${PV}/unifont-${PV}.ttf
	https://ftp.gnu.org/gnu/${PN}/unifont-${PV}/unifont_csur-${PV}.ttf
	https://ftp.gnu.org/gnu/${PN}/unifont-${PV}/unifont_jp-${PV}.ttf
	https://ftp.gnu.org/gnu/${PN}/unifont-${PV}/unifont_upper-${PV}.ttf
"
LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
S="${WORKDIR}/${P}"
FONT_SUFFIX="ttf"
src_unpack() {
	mkdir -p ${P}
	cp -rv ${DISTDIR}/* ${P}
}
