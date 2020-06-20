# @see https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/fcitx5-material-color
EAPI=7
inherit git-r3
DESCRIPTION="Use of a Material-color skin fcitx5."
HOMEPAGE="https://github.com/hosxy/Fcitx5-Material-Color"

EGIT_REPO_URI="${HOMEPAGE}"
EGIT_CLONE_TYPE="shallow"
EGIT_CHECKOUT_DIR="${WORKDIR}/Fcitx5-Material-Color"
S="${EGIT_CHECKOUT_DIR}"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="app-i18n/fcitx5"
_colors=( blue brown deepPurple indigo pink red teal )
src_prepare() {
	default
	local themes=build
	mkdir -p build
	for _color in ${_colors[@]}; do
		_theme_name=Material-Color-${_color^}
		_theme_dir=${themes}/${_theme_name}
		mkdir -p ${_theme_dir}
		cp -rv highlight-$_color.png ${_theme_dir}/highlight.png
		cp -rv panel-${_color}.png ${_theme_dir}/panel.png
		cp -rv theme.conf ${_theme_dir}
		cp -rv arrow.png ${_theme_dir}
		cp -rv radio.png ${_theme_dir}
		sed -i -e "s/^Name=.*/Name=$_theme_name/" ${_theme_dir}/theme.conf
	done
}

src_install() {
	local _fcitx5_dir=/usr/share/fcitx5/themes
	insinto ${_fcitx5_dir}
	for _dir in build/*; do
		doins -r ${_dir}
	done
}
