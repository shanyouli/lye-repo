# Copyright 1999-2020 Gentoo Authors Lye

EAPI="6"

inherit font versionator
DESCRIPTION="Nerd Font"
HOMEPAGE="https://www.nerdfonts.com"
SRC_URI="https://github.com/shanyouli/Adobe-chinese-fonts/archive/v${PV}.zip -> ${P}.zip"
LICENESE="unknown"
SLOT="0"
KEYWORDS="x86 amd64"
DEPEND="app-arch/unzip"
S="${WORKDIR}/Adobe-chinese-fonts-${PV}"
FONT_SUFFIX="otf"
