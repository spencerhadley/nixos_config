{ inputs, ... }@flakeContext:
let
  homeModule = { config, lib, pkgs, ... }: {
    config = {
      home = {
        packages = [
          pkgs.digikam
          pkgs.kate
          pkgs.audacity
          pkgs.arandr
          pkgs.calibre
          pkgs.dconf2nix
          pkgs.dmenu
          pkgs.drawio
          pkgs.duf
          pkgs.emacs
          pkgs.evince
          pkgs.firefox
          pkgs.fish
          pkgs.gimp-with-plugins
          pkgs.git
          pkgs.glow
          pkgs.gparted
          pkgs.gramps
          pkgs.htop
          pkgs.jitsi-meet-electron
          pkgs.keepassxc
          pkgs.killall
          pkgs.mupdf
          pkgs.organicmaps
          pkgs.neofetch
          pkgs.pavucontrol
          pkgs.paprefs
          pkgs.pcmanfm
          pkgs.qdirstat
          pkgs.qutebrowser
          pkgs.resilio-sync
          pkgs.signal-desktop
          pkgs.gnome.simple-scan
          pkgs.transmission
          pkgs.tree
          pkgs.ventoy-bin
          pkgs.vlc
          pkgs.waybar
          pkgs.wire-desktop
          pkgs.zrythm
          pkgs.emacsPackages.nix-mode
          pkgs.emacsPackages.magit
        ];
        stateVersion = "22.11";
      };
      programs = {
        htop = {
          enable = true;
        };
      };
    };
  };
  nixosModule = { ... }: {
    home-manager.users.spencer = homeModule;
  };
in
(
  (
    inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        homeModule
      ];
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    }
  ) // { inherit nixosModule; }
)
