EAPI=6

inherit font

DESCRIPTION="JetBrains Mono – the free and open-source typeface for developers"
HOMEPAGE="https://jetbrains.com/mono"
SRC_URI="https://github.com/JetBrains/${PN}/releases/download/v${PV}/${P}.zip"
LICENSE="APL"
SLOT="0"
KEYWORDS="amd64 x86"
S="${WORKDIR}/${P}"
FONT_S="${S}/ttf"
FONT_SUFFIX="ttf"
