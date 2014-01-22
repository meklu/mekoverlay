# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils git-2 toolchain-funcs

DESCRIPTION="sophisticated graphical program which corrects your miss typing"
HOMEPAGE="http://www.tkl.iis.u-tokyo.ac.jp/~toyoda/index_e.html http://www.izumix.org.uk/sl/"
EGIT_REPO_URI="git://github.com/mtoyoda/sl.git"

LICENSE="freedist"
SLOT="0"
KEYWORDS="alpha amd64 hppa ppc ppc64 sparc x86 ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos"
IUSE="debug linguas_ja"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

pkg_setup() {
	tc-export CC
	use debug && append-cppflags -DDEBUG
}

src_install() {
	dobin sl

	dodoc README.md
	newman sl.1 sl.1

	if use linguas_ja ; then
		dodoc README.ja.md
		insinto /usr/share/man/ja/man1
		newins sl.1.ja sl.1
	fi
}
