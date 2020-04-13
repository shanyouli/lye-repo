EAPI=6
inherit font versionator git-r3

DESCRIPTION="Use any fonts in the terminal without replacing or patching"
HOMEPAGE="https://github.com/sebastiencs/icons-in-terminal"
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
S="${EGIT_CHECKOUT_DIR}"

LICENSE="MIT"
SLOT="0"
FONT_SUFFIX="ttf"

KEYWORDS="amd64 x86"

FONT_S="${S}/build"
src_prepare() {
	default
	sed -i 's filename="./build/mapping.txt" filename="/usr/share/icons-in-terminal/mapping.txt" ' print_icons.sh
	./scripts/generate_fontconfig.sh > "30-${PN}.conf"
	FONT_CONF=( "30-${PN}".conf )
}
src_install() {
	dobin "print_icons.sh"
	dodoc "README.md"
	dodoc "LICENSE"
	font_src_install
	insinto "/usr/share/icons-in-terminal"
	for f in "${S}"/build/* ; do
		if ! [[ ${f} == *.ttf ]]; then
			doins "${f}"
		fi
	done
}
