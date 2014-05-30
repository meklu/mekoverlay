# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit python eutils

DESCRIPTION="Submission tools for IRC notifications"
HOMEPAGE="http://www.catb.org/esr/irker/"
SRC_URI="http://www.catb.org/esr/${PN}/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bindall"
DEPEND="app-text/docbook-xml-dtd:4.1.2
	app-text/xmlto"
RDEPEND="=dev-lang/python-2*
	dev-python/simplejson"

src_prepare() {
	# allow e.g. configuration changes via epatch_user
	epatch_user
}

src_install() {
	python_convert_shebangs 2 irkerd irkerhook.py
	emake DESTDIR="${D}" install
	# the irkerhook.py is not installed with the default makefile
	dobin irkerhook.py
	newinitd "${FILESDIR}/irker.init" irkerd
	newconfd "${FILESDIR}/irker.conf.d" irkerd
}
