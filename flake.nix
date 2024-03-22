{
  description = "a massive clusterfuck i like to call my system, which i copied from Liv";

  inputs = {
    #stable.url = "github:nixos/nixpkgs";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = { nixpkgs.follows = "unstable"; };
    };

    hyprland = {
    	url = "github:hyprwm/hyprland";
    };

  };

  outputs = { self, unstable, hyprland, home-manager, flake-utils, emacs-overlay }@inputs:
    let
      system = flake-utils.lib.system.x86_64-linux;
      machines = [ "hyprdesktop" ];
      pkgs = import unstable {
        inherit system overlays;
        config.allowUnfree = true;
      };
      overlays = [
        emacs-overlay.overlay
        # hyprland.overlays.default
      ];
    in with unstable.lib; {
      nixosConfigurations = genAttrs machines (machine:
        nixosSystem {
          inherit pkgs system;

          specialArgs = { inherit inputs; };

          modules = [
            # stuff from inputs
            # hyprland.nixosModules.default

            # system configurations
            ./modules/system/generic.nix
            ./modules/system/${machine}/config.nix
            ./modules/system/${machine}/hardware-configuration.nix

            # home configurations
            home-manager.nixosModule
            {
              home-manager = {
                extraSpecialArgs = { inherit system inputs; };
                useGlobalPkgs = true;
                useUserPackages = true;
                users.zoe = import ./modules/home/${machine}/home.nix;
              };
            }
          ];
        });

      templates = {
        full = {
          path = ./.;
          description = "a massive clusterfuck i like to call my system";
        };
      } // import ./modules/templates;

      devShells."${system}".default = import ./shell.nix { inherit pkgs; };
    };
}
