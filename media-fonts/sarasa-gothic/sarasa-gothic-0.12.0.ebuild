# Copyright 1999-2020 Gentoo Authors Lye

EAPI="6"

inherit font versionator
DESCRIPTION="This is SARASA GOTHIC, a CJK programming font based on Iosevka and Source Han Sans."
HOMEPAGE="https://github.com/be5invis/Sarasa-Gothic"
SRC_URI="https://github.com/be5invis/Sarasa-Gothic/releases/download/v${PV}/${PN}-ttc-${PV}.7z -> ${P}.7z"
LICENESE="SIL Open Font License v1.1"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="app-arch/p7zip"

S="${WORKDIR}"
FONT_SUFFIX="ttc"
