{
   description = "shadowmoon system configuration";

   inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
      home-manager = {
         url = "github:nix-community/home-manager/release-26.05"; #Make sure to keep nixpkgs url and home manager url as the same version
         inputs.nixpkgs.follows = "nixpkgs";
      };
   };

   outputs = { self, nixpkgs, home-manager, ... }:{
      nixosConfigurations.shadowmoon = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
            ./configuration.nix
            { nix.nixPath = [ "nixpkgs=${nixpkgs}" ]; }#sets $NIX_PATH for nixd, nix-shell
            home-manager.nixosModules.home-manager {
               home-manager.useGlobalPkgs = true; #I think I want to change this to pass pkgs, just seems cleaner to me
               home-manager.useUserPackages = true;
               home-manager.users.jjd = import ./home.nix;
            }
         ];
      }; 
   };
}
