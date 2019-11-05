# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://github.com/nodenv/${PN}.git"
EGIT_BRANCH='master'
EGIT_CHECKOUT_DIR="${WORKDIR}/node-build"
S="${EGIT_CHECKOUT_DIR}"

DESCRIPTION="node-build is a command-line utility that makes it easy to install virtually any version of Node"
HOMEPAGE="https://github.com/nodenv/node-build"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
DEPEND="sys-devel/autoconf
		>=dev-libs/openssl-1.1.1d-r2
		dev-util/pkgconfig
		dev-libs/libyaml
		dev-libs/libffi
		sys-libs/zlib"

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
	local SHARE_PATH="/usr/share/node-build"
	local ETC_PATH="/usr/share/nodenv/etc"
	insinto "$SHARE_PATH"
	doins -r share/node-build/* || die

	insinto "$ETC_PATH"
	doins -r etc/* || die

	dobin bin/* || die
}
