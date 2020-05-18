# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://github.com/nodenv/${PN}.git"
EGIT_BRANCH='master'
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
EGIT_CLONE_TYPE="shallow"
S="${EGIT_CHECKOUT_DIR}"

DESCRIPTION="Manage multiple NodeJS versions. "
HOMEPAGE="https://github.com/nodenv/nodenv"

LICENSE="MIT"
SLOT="0"

DEPEND="net-libs/node-build"

src_prepare() {
	if [[ ${PV##.} = 9999 ]]; then
		einfo "Node-build Branch: ${EGIT_BRANCH}"
		einfo "COmmit: ${EGIT_VERSION}"
	fi
	eapply_user
}
src_configure() {
	./src/configure || die
}
src_compile() {
	make -C src
}

src_install() {
	local PKG_HOME="/usr/share/$PN"

	insinto "$PKG_HOME"
	doins -r completions || die
	doins  LICENSE || die

	exeinto "$PKG_HOME/libexec"
	doexe libexec/* || die
	dosym "$PKG_HOME/libexec/$PN" "/usr/bin/$PN"
}

pkg_postinst() {
	ewarn "
You may need to set NODENV_ROOT
You may need to run 'nodenv install 12.13.0' to install the default, and
You may need to run 'nodenv global 12.13.0' to set default nodejs version
"
}
