# Copyright 1999-2019 Gentoo Authors Lye

EAPI="6"

inherit font versionator
DESCRIPTION="Nerd Font"
HOMEPAGE="https://www.nerdfonts.com"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DejaVuSansMono.zip"
LICENESE="unknown"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_SUFFIX="ttf"
