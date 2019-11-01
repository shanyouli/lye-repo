# Copyright 2019

EAPI=6
inherit bash-completion-r1
DESCRIPTION="The Rust toolchain installer"
HOMEPAGE="https://www.rust-lang.org/"
# SRC_URI="${SRC_URI}
#	amd64? ( https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init -> ${PN} )

# x86? ( https://static.rust-lang.org/rustup/dist/i686-unknown-linux-gnu/rustup-init -> ${PN} )"
RESTRICT="network-sandbox"
LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+bash-completion zsh-completion"
SRC_URI="${SRC_URI}
		amd64? ( https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init -> rustup_64 )
		x86? ( https://static.rust-lang.org/rustup/dist/i686-unknown-linux-gnu/rustup-init -> rustup_86 )"
RDEPEND="!dev-lang/rust
		 !virtual/cargo
		 !virtual/rust"

DEPEND="${RDEPEND}
		net-misc/wget
		bash-completion? ( app-shells/bash-completion )
		zsh-completion? ( app-shells/zsh-completions )"

S="${WORKDIR}"

_binlinks=('cargo' 'rustc' 'rustdoc' 'rust-gdb' 'rust-lldb' 'rls' 'rustfmt' 'cargo-fmt' 'cargo-clippy' 'clippy-driver')

# src_compile() {
#	insinto "$WORKDIR"
#	# bash-completion, zsh-completion, fish-completion
#	use bash-completion && {
#		./rustup completions bash > bash_completion || die
#	}
#	use zsh-completion && {
#		./rustup completions zsh > zsh_completion || die
#	}
#	command -v fish && {
#		./rustup completions fish > fish_completion || die
#	}
# }


src_install() {
	local PREFIX=/usr/local
	local PKG_HOME=/usr/local/$PN
	local PKG_BIN="/usr/local/bin/${PN}"

	einfo "Start the installation rustup"

	into "${PREFIX}"
	dobin "$DISTDIR/$A" || die
	mv ${ED}/usr/local/bin/$A ${ED}${PKG_BIN} || die
	for link in "${_binlinks[@]}"; do
		dosym $PKG_BIN "$PREFIX/sbin/${link}" || die
	done
	# bash-completion, zsh-completion, fish-completion
	use bash-completion && {
		${PKG_BIN} completions bash > rustup.bash || die
	}
	use zsh-completion && {
		${PKG_BIN} completions zsh > rustup.zsh || die
	}
	command -v fish && {
		${PKG_BIN} completions fish > rustup.fish || die
	}

	local SHARE_DIR="$PREFIX/share/$PN"
	insinto "${SHARE_DIR}/completions"
	for completion in rustup.* ; do
		[[ -f ${completion} ]] && doins ${completion}
	done

	insinto "${SHARE_DIR}"
	doins "${FILESDIR}"/init-rust.sh

	insinto "/etc/portage/profile/bashrc"
	newins "${FILESDIR}/rustup.conf" rustup.conf

}

# pkg_prerm() {
#	# Clean rustup temp files
#	rm -rf "/usr/bin/rustup"
#	for link in "${_binlinks[@]}"; do
#		rm -rf  "/usr/sbin/${link}"
#	done
#	rm -rf /usr/share/rustup
# }

pkg_postinst() {
	ewarn "You may need to set RUSTUP_HOME and CARGO_HOME"
	ewarn "
You need to source rustup before you can use it. Do one of the following
or similar depending on your shell (and then restart your shell):

  echo 'source /usr/local/share/rustup/init-rust.sh' >> ~/.bashrc
  echo 'source /usr/local/share/rustup/init-rust.sh' >> ~/.zshrc

You may need to run 'rustup default stable' to install the default, or
You may need to run 'rustup toolchain install stable' to install the default
toolchain, if upgrading, you may need to run 'rustup self upgrade-data'.
"
	ewarn "
If the installation requires the use of rust compiled program,
please add the following format to /etc/portage/profile/package.bashrc

  'sys-apps/fd rustup.conf'
"
}
