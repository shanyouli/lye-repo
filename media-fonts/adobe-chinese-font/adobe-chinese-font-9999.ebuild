# Copyright 1999-2019 Gentoo Authors Lye

EAPI="6"

inherit font versionator
DESCRIPTION="Nerd Font"
HOMEPAGE="https://www.nerdfonts.com"
SRC_URI="https://github.com/shanyouli/common-font/raw/master/Adobe-Simple-Chinese.tar.xz -> ${P}.tar.xz"
LICENESE="unknown"
SLOT="0"
KEYWORDS="x86 amd64"

S="${WORKDIR}/Adobe-Simple-Chinese-Fonts"
FONT_SUFFIX="otf"
