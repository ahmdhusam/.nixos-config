{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zig.url = "github:mitchellh/zig-overlay";

  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      nixosVersion = "24.05";

      rootUser = "ahmed";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      unstable = import nixpkgs-unstable { inherit system; };

    in
    {
      nixosConfigurations = {

        # to apply run it with ".#nixos" or "." if the networking.hostName = "nixos";
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              system
              unstable
              nixosVersion
              rootUser
              ;
          };

          inherit system;

          modules = [
            { nixpkgs.overlays = [ inputs.zig.overlays.default ]; }

            ./hosts/laptop/configuration.nix

            inputs.auto-cpufreq.nixosModules.default

            # inputs.home-manager.nixosModules.default

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.${rootUser} = import ./hosts/laptop/home.nix;
              home-manager.extraSpecialArgs = {
                inherit nixosVersion rootUser;
              };
            }

            # We expose some extra arguments so that our modules can parameterize
            # better based on these values.
            {
              config._module.args = {
                inherit system nixosVersion rootUser;
              };
            }

          ];
        };

        # # run it with .#default
        # default = nixpkgs.lib.nixosSystem {
        #   specialArgs = {
        #     inherit inputs;
        #   };

        #   modules = [
        #     ./configuration.nix
        #     inputs.home-manager.nixosModules.default
        #     inputs.auto-cpufreq.nixosModules.default
        #   ];
        # };
      };

      # access it with "nix develop" command
      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
      devShells.${system}.development = import ./shell-dev.nix { inherit pkgs; };

      # homeConfigurations = {

      #   "ahmed" = inputs.home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs;

      #     # Specify your home configuration modules here, for example,
      #     # the path to your home.nix.
      #     modules = [ ./home.nix ];

      #     # Optionally use extraSpecialArgs
      #     # to pass through arguments to home.nix
      #   };
      # };

    };

}
