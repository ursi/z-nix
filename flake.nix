{ inputs =
    { nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      utils.url = "github:ursi/flake-utils";
    };

  outputs = { utils, ... }@inputs:
    utils.default-systems
      ({ pkgs, ... }: { defaultPackage = pkgs.callPackage ./. {}; })
      inputs
    // { nixosModule = ./module.nix;
         overlay = (final: prev: { z = final.callPackage ./. {}; });
       };
}
