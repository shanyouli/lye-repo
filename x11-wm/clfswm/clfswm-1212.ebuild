#Copyright open-overlay 2015 by Alex

EAPI=5

inherit eutils multilib common-lisp-3

DESCRIPTION="100% Common Lisp X11 window manager (based on Tinywm and Stumpwm)"
HOMEPAGE="http://common-lisp.net/project/clfswm"
SRC_URI="http://common-lisp.net/project/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

RDEPEND="dev-lisp/sbcl"
DEPEND="dev-lisp/clx
		${RDEPEND}"

src_prepare() {
	rm load.lisp
	cp ${FILESDIR}/${PV}-load.lisp load.lisp
}
src_compile() {
	emake DESTDIR="${ED}"/usr clfswm
}

src_install() {
	common-lisp-install *.asd src
	common-lisp-symlink-asdf

	dobin clfswm

	dodir /usr/lib/clfswm
	insinto /usr/lib/clfswm
	doins -r contrib

	insinto /usr/share/xsessions
	doins clfswm-session.desktop


	doman clfswm.1
	dohtml doc/*.html
	rm src/*.html
	dodoc README COPYING AUTHORS src/*
}

pkg_postinst() {
	elog "Clfswm will compile itself into \$XDG_CACHE_HOME!"
	elog "Make sure the variable is set."
	elog ""
	elog "The current lisp-implementation clfswm used is sbcl"
	elog "If you want to use different lisp-implementations"
	elog "change the script '/usr/bin/clfswm'."
		elog "Thanks open-overlay 2015 by Alex"
}
