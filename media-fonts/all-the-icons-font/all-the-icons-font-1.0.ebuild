EAPI=6
inherit font
DESCRIPTION="emacs-all-the-icons package requires font."
HOMEPAGE="https://github.com/domtronn/all-the-icons.el"
_gitver='95fb147' #95fb14713ce8403919b0b75721feb4a6134d19ea
_download_prefix="${HOMEPAGE}/raw/${_gitver}/fonts"
SRC_URI="${_download_prefix}/all-the-icons.ttf
		${_download_prefix}/file-icons.ttf
		${_download_prefix}/fontawesome.ttf
		${_download_prefix}/material-design-icons.ttf
		${_download_prefix}/octicons.ttf
		${_download_prefix}/weathericons.ttf
"
LICENSE="UNKOWN"
SLOT="0"
KEYWORDS="amd64 x86"
S="${WORKDIR}/${PN}"
FONT_SUFFIX="ttf"
src_unpack() {
	mkdir -p ${PN}
	for i in ${DISTDIR}/* ; do
		cp $i ${PN}
	done
}
