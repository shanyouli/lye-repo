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
DEPEND="net-libs/nodenv
		net-libs/node-build"

src_prepare() {
	if [[ ${PV##.} = 9999 ]]; then
		einfo "Node-build Branch: ${EGIT_BRANCH}"
		einfo "COmmit: ${EGIT_VERSION}"
	fi
	eapply_user
}

src_compile() {
	:;
}

src_install() {
	local PREFIX=/usr/local/
	local DOC_DIR="$PREFIX/share/doc/$PN"
	local ECT_DIR="$PREFIX/etc"

	insinto $DOC_DIR
	doins  LICENSE || die

	into "${PREFIX}"
	dobin bin/* || die

	exeinto "${ECT_DIR}"
	doexe etc/* || die
}

pkg_postinst() {
	ewarn "
Run 'nodenv commands' to see if there alias, if present,
the installation was successful
"
}
