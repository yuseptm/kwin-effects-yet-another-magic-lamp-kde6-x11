# Maintainer: Local package built from this checkout
pkgname=kwin-effects-yet-another-magic-lamp-x11
pkgver=6.8.2
pkgrel=3
pkgdesc='Curvy KWin window minimize animation effect for the Plasma X11 session'
arch=('x86_64' 'aarch64')
url='https://github.com/koryboc/kwin-effects-yet-another-magic-lamp-reloaded'
license=('GPL-2.0-or-later')
depends=(
    'kwin-x11'
    'qt6-base'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kcmutils'
    'kwindowsystem'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qt6-tools'
)
source=()
sha256sums=()

prepare() {
    local snapshot
    snapshot="$(mktemp -d)"
    cp -a "$startdir/." "$snapshot/"
    rm -rf "$snapshot/.git" "$snapshot/.makepkg" "$snapshot/build" "$snapshot/build-x11" \
        "$snapshot/pkg" "$snapshot/src/project" "$snapshot/src/project-build" \
        "$snapshot/$pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst" \
        "$snapshot/$pkgname-$pkgver-$pkgrel-aarch64.pkg.tar.zst"
    rm -rf "$srcdir/project" "$srcdir/project-build"
    mv "$snapshot" "$srcdir/project"
}

build() {
    cmake -S "$srcdir/project" -B "$srcdir/project-build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "$srcdir/project-build" --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/project-build"
    install -Dm644 "$srcdir/project/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
