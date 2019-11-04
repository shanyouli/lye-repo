# Copyright 1999-2019 Gentoo Authors Lye

EAPI="6"

inherit font versionator
DESCRIPTION="A free Japanese kanji font, which contains about 78,685 characters (and 2 SPACEs) defined in ISO/IEC 10646 standard / the Unicode standard."
HOMEPAGE="https://osdn.net/projects/hanazono-font/"
SRC_URI="https://osdn.net/projects/hanazono-font/downloads/68253/${P}.zip"
LICENESE="unknown"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_SUFFIX="ttf"
