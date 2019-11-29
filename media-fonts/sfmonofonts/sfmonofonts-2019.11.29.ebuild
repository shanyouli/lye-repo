# Copyright 1999-2019 Gentoo Authors Lye

EAPI="6"

inherit font versionator
DESCRIPTION="The system font for macOS, iOS, watchOS and tvOS"
HOMEPAGE="https://developer.apple.com/fonts/"
SRC_URI="https://github.com/shanyouli/common-font/raw/master/SFMonoFonts-2019-11-29.tar.xz -> ${P}.tar.xz"
LICENESE="APSL-2"
SLOT="0"
KEYWORDS="x86 amd64"

S="${WORKDIR}/SFMonoFonts"
FONT_SUFFIX="otf"
