# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="a terminal file manager written in Go"
HOMEPAGE="https://github.com/gokcehan/lf"
SRC_URI="https://github.com/gokcehan/lf/archive/r${PV}.tar.gz -> ${P}.tar.gz
		 https://github.com/gokcehan/lf/releases/download/r${PV}/lf-linux-amd64.tar.gz -> ${P}-bin.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="fish-completion vim neovim"

DEPEND="dev-lang/go"
RDEPEND=""
S="${WORKDIR}/${PN}-r${PV}"
DOCS="LICENSE README.md etc/lfrc.example"

src_unpack() {
	unpack ${P}.tar.gz
	unpack ${P}-bin.tar.gz
	mv lf "${S}"
}

src_install() {
	dobin lf || die "error lf"
	einstalldocs

	doman lf.1

	if use fish-completion ; then
		insinto /usr/share/fish/vendor_completions.d
		doins etc/lf.fish
		insinto /usr/share/fish/vendor_functions.d
		doins etc/lfcd.fish
	fi
	insinto /usr/share/lf
	for i in "etc/lf.zsh" "etc/lfcd.zsh" "etc/lfcd.sh"; do
		if [[  -f $i ]]; then
			doins $i
		fi
	done
	if use neovim; then
		insinto /usr/share/nvim/runtime/plugin
		doins etc/lf.vim
	fi
	if use vim; then
		insinto /usr/share/vim/vimfiles/plugin
		doins etc/lf.vim
	fi
}
