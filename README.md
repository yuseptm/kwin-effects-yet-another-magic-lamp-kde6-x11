# Yet Another Magic Lamp for KWin X11

Yet Another Magic Lamp is a configurable window minimize animation for KWin. This repository is the **X11-only** Plasma 6 build, derived from the original [Yet Another Magic Lamp](https://github.com/zzag/kwin-effects-yet-another-magic-lamp).

For the Wayland build, use [kwin-effects-yet-another-magic-lamp-reloaded](https://github.com/koryboc/kwin-effects-yet-another-magic-lamp-reloaded).

This build uses KWin's X11 effect API and installs its plugin under `kwin-x11/effects/plugins`. It requires KWin X11 development files. KDE's standalone Plasma X11 session ended with Plasma 6.7; KWin X11 forks may continue to provide the required API on later releases.

## Tested environment

This X11 fork has been tested on CachyOS Linux (rolling) with Sonic DE 6.8.2.

## Build on Arch Linux

Install the build dependencies and create the package from this checkout:

```sh
sudo pacman -S --needed base-devel cmake extra-cmake-modules kwin-x11 \
    kconfig kconfigwidgets kcoreaddons kcmutils kwindowsystem qt6-base qt6-tools
./make-arch-package.sh
```

The package is defined in [PKGBUILD](PKGBUILD). The helper builds it in a separate directory so makepkg's cleanup cannot overlap the repository's `src/` directory. Install the resulting package with:

```sh
sudo pacman -U kwin-effects-yet-another-magic-lamp-x11-6.8.2-3-$(uname -m).pkg.tar.zst
```

A prebuilt x86_64 package is available at [dist/kwin-effects-yet-another-magic-lamp-x11-6.8.2-3-x86_64.pkg.tar.zst](dist/kwin-effects-yet-another-magic-lamp-x11-6.8.2-3-x86_64.pkg.tar.zst).

## Build from source

Install CMake, a C++20 compiler, ECM, Qt 6 (Core, DBus, Gui, Widgets), the KDE Frameworks 6 modules listed above, and the development package for your KWin X11 implementation. Then run:

```sh
cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
cmake --build build --parallel
sudo cmake --install build
```

KWin X11 is required at both build and runtime. The plugin cannot be loaded by KWin Wayland.

## Configure the effect

Open **System Settings → Animations → Window minimize**, select **Yet Another Magic Lamp**, and apply. Use the configure button to choose a preset or adjust the animation.

## License

GPL-2.0-or-later. See [LICENSE](LICENSE).
