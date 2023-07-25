{
  description = "dmenu rice";

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    rec {
      packages.default = nixpkgs.legacyPackages.${system}.dmenu.overrideAttrs (old: { src = ./.; });
      apps.run = { type = "app"; program = "${packages.default}/bin/dmenu_run"; };
    });
}
