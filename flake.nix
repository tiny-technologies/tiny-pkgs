{
  description = "a collection of tiny packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: with nixpkgs.legacyPackages.${system};
    {
      packages = {
        tiny-shell = rustPlatform.buildRustPackage rec {
          pname = "tiny-shell";
          version = "0.1.0";

          src = fetchFromGitHub {
            owner = "tiny-technologies";
            repo = pname;
            rev = "15b902ca3b1d8c1af6260c5e9115cae4bce6373f";
            sha256 = "sha256-VzhsTWT2heuQD78NGkIXzcKPe16UFDr1YSc5InaMkzw=";
          };

          cargoSha256 = "sha256-4XxijeCyu27WqS+hS+eoFD9PYommj5BmvCJmADMgMgA=";
        };
        supersort = stdenv.mkDerivation rec {
          pname = "supersort";
          version = "0.1.0";

          src = fetchFromGitHub {
            owner = "tiny-technologies";
            repo = pname;
            rev = "f26765885d59da96bbeb82df3a387735d64adc07";
            sha256 = "sha256-PNFkEqGbwbdU+t3g08waVGnHQ+IDVap+V3K7Sqfj/28=";
          };

          buildPhase = "make";
          installPhase = "mkdir -p $out/bin; cp build/supersort $out/bin";
        };
      };
    });
}
