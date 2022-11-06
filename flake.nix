{
  inputs = {
    nixpkgs.url = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
    # Documentation and examples:
    # https://github.com/yusdacra/rust-nix-templater/blob/master/template/flake.nix

    # The latest NCI has a problem of reflecting the default-crate-overrides
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/rust/default-crate-overrides.nix
    # Thus let's specify the version that was working.
    nci.url = "github:yusdacra/nix-cargo-integration?rev=29020fc60aaae3f28f5aac441508d2de703d2f67";
    nci.inputs.nixpkgs.follows = "nixpkgs";
    nci.inputs.rust-overlay.follows = "rust-overlay";
  };

  outputs = inputs:
    inputs.nci.lib.makeOutputs {
      root = ./.;
      # The default buidler (crane) doesn't detect pkg-config
      builder = "build-rust-package";
    };
}
