{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    supportedSystems = [ "x86_64-linux" "aarch64-linux" ];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
  in {
    devShells = forAllSystems (system:
      let pkgs = nixpkgsFor.${system};
      in {
        default = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.cargo
            pkgs.clang
            pkgs.rustc
            pkgs.sqlx-cli
          ];
        };
      });
  };
}
