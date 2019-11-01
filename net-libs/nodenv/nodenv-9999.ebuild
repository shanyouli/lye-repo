# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://github.com/nodenv/${PN}.git"
EGIT_BRANCH='master'
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
S="${EGIT_CHECKOUT_DIR}"

DESCRIPTION="Manage multiple NodeJS versions. "
HOMEPAGE="https://github.com/nodenv/nodenv"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
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
	local PREFIX=/usr/local/
	local PKG_HOME="$PREFIX/$PN"
	local DOC_DIR=$PREFIX/share/doc/$PN

	insinto "$PKG_HOME"
	doins -r completions || die

	insinto $DOC_DIR
	doins  LICENSE || die

	exeinto "$PKG_HOME/libexec"
	doexe libexec/* || die
	dosym "$PKG_HOME/libexec/$PN" "/usr/bin/$PN"

	insinto "/etc/portage/profile/bashrc"
	newins "${FILESDIR}/${PN}.conf" ${PN}.conf

}

pkg_postinst() {
	ewarn "
You may need to set NODENV_ROOT
You may need to run 'nodenv install 12.13.0' to install the default, and
You may need to run 'nodenv global 12.13.0' to set default nodejs version
"
	ewarn "
If the installation requires the use of nodejs compiled program,
please add the following format to /etc/portage/profile/package.bashrc

  'www-client/firefox nodejs.conf'
"
}
