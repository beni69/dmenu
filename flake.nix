# https://github.com/NixOS/nixpkgs/blob/nixos-22.11/pkgs/applications/misc/dmenu/default.nix
{
  description = "dmenu rice";

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let pkgs = import nixpkgs { inherit system; }; in rec {
      packages.default = pkgs.callPackage ./default.nix { };
      apps.run = { type = "app"; program = "${packages.default}/bin/dmenu_run"; };
    });
}
