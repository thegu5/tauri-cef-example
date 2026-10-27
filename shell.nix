{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer

    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = with pkgs; [
    glib
    gtk4
    librsvg
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${
      pkgs.lib.makeLibraryPath (
        with pkgs;
        [
          nss
          alsa-lib
          at-spi2-atk
          at-spi2-core
          dbus
          udev
          nspr
          libxcomposite
          libgbm
          expat
          libGL
        ]
      )
    }"
  '';
}
