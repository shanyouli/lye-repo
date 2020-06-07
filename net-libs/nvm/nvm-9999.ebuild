# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://github.com/nvm-sh/nvm.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/nvm"
S="${EGIT_CHECKOUT_DIR}"
EGIT_CLONE_TYPE="shallow"
DESCRIPTION="A simple bash script to manage multiple active node.js versions"
HOMEPAGE="https://github.com/nvm-sh/nvm"

RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+bash-completion"

# RDEPEND=""
DEPEND="app-shells/bash
		dev-libs/libuv
		net-dns/c-ares
		net-libs/http-parser
		net-libs/nghttp2
		sys-libs/zlib
		dev-libs/icu
		dev-libs/openssl
		bash-completion? ( app-shells/bash-completion )"

src_prepare() {
	if [[ ${PV##*.} = 9999 ]]; then
		einfo "Nvm branch: ${EGIT_BRANCH}"
		einfo "Commit: ${EGIT_VERSION}"
	fi
	eapply_user
}

src_compile() {
	:;
}

src_install() {
	local NVM_HOME="/usr/share/nvm"
	exeinto "${NVM_HOME}"
	doexe nvm-exec

	insinto "${NVM_HOME}"
	doins nvm.sh
	doins LICENSE.md
	if use bash-completion ; then
		doins bash_completion || die
		dosym ${NVM_HOME}/bash_completion /usr/share/bash-completion/completions/nvm
	fi
	doins "${FILESDIR}"/init-nvm.sh
}

pkg_prerm() {
	echo "
Don't forget to clean up any lines added to your shell's startup script!

For example, from your .bashrc (or .zshrc etc.), delete the line:

	source /usr/share/nvm/init-nvm.sh
	_install_nvm_exec
"
}

pkg_postinst() {

	ewarn "You may need to set 'NVM_DIR'"
	ewarn "
You need to source nvm before you can use it. Do one of the following
or similar depending on your shell (and then restart your shell):

  echo 'source /usr/share/nvm/init-nvm.sh && _install_nvm_exec' >> ~/.bashrc
  echo 'source /usr/share/nvm/init-nvm.sh && _install_nvm_exec' >> ~/.zshrc

You can now install node.js versions (e.g. nvm install 10) and
activate them (e.g. nvm use 10).

init-nvm.sh is a convenience script which does the following:
"
	ewarn "
You may need to run 'nvm install lts/*' to install nodejs versions, and
you may need to run 'nvm use lts/*'
"
}
