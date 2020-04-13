# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit font

DESCRIPTION="Nerd Font"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/AnonymousPro.zip -> ${P}.zip"
#https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/AnonymousPro.zip
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_SUFFIX="ttf"
