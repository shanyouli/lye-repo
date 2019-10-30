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

RDEPEND="!dev-lang/rust
		 !virtual/cargo
		 !virtual/rust"

DEPEND="${RDEPEND}
		net-misc/wget
		bash-completion? ( app-shells/bash-completion )
		zsh-completion? ( app-shells/zsh-completions )"

S="${WORKDIR}"

_binlinks=('cargo' 'rustc' 'rustdoc' 'rust-gdb' 'rust-lldb' 'rls' 'rustfmt' 'cargo-fmt' 'cargo-clippy' 'clippy-driver')

src_compile() {
	local URL
	local APACHE_URL="https://github.com/rust-lang/rustup.rs/raw/master/LICENSE-APACHE"
	local MIT_URL="https://github.com/rust-lang/rustup.rs/raw/master/LICENSE-MIT"
	use x86 && URL="https://static.rust-lang.org/rustup/dist/i686-unknown-linux-gnu/rustup-init"
	use amd64 && URL="https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init"

	wget ${URL} -O ${PN} || die
	chmod +x ${PN} || die
	# LICENSE
	wget ${APACHE_URL} -O LICENSE-APACHE || die
	wget ${MIT_URL} -O LICENSE-MIT || die

	# bash-completion, zsh-completion, fish-completion
	use bash-completion && {
		./rustup completions bash > bash_completion || die
	}
	use zsh-completion && {
		./rustup completions zsh > zsh_completion || die
	}
	command -v fish && {
		./rustup completions fish > fish_completion || die
	}
}

src_install() {
	einfo "Start the installation rustup"
	dobin ${PN} || die
	for link in "${_binlinks[@]}"; do
		dosym /usr/bin/rustup "/usr/sbin/${link}" || die
	done

	local RUSTUP_DIRS="/usr/share/rustup"
	insinto "${RUSTUP_DIRS}"
	for completion in 'bash_completion' 'zsh_completion' 'fish_completion'; do
		[[ -f ${completion} ]] && doins ${completion}
	done
	doins LICENSE-APACHE
	doins LICENSE-MIT
	doins "${FILESDIR}"/init-rust.sh

	[[ -f /etc/portage/profile/bashrc/rustup.conf ]] || {
		insinto "/etc/profile/bashrc"
		newins "${FILESDIR}/rustup.conf"
	}

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

  echo 'source /usr/share/rustup/init-rust.sh' >> ~/.bashrc
  echo 'source /usr/share/rustup/init-rust.sh' >> ~/.zshrc

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
