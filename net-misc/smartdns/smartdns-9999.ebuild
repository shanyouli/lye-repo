EAPI=7
inherit git-r3 eutils systemd user

DESCRIPTION="A local DNS server to obtain the fastest website IP for the best Internet experience."
HOMEPAGE="https://github.com/pymumu/smartdns"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL V3"
SLOT="0"
KEYWORDS=""

src_compile() {
	emake clean
	emake SBINDIR=/usr/bin RUNSTATEDIR=/run
}

src_install() {
	dobin src/smartdns || die "Not find smartdns"
	insinto /etc/smartdns
	newins etc/smartdns/smartdns.conf smartdns.conf || die
	systemd_dounit systemd/smartdns.service || die
	insinto /etc/default
	newins etc/default/smartdns smartdns || die
}

pkg_postinst() {
	elog "For information on how to configure SMARTDNS please refer to the guide:"
	elog "    ${HOMEPAGE}"
}
