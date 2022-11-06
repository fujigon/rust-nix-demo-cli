# rust-nix-demo-cli

## How to build

In a development shell by nix,

```shell
$ nix develop . # opens a new shell that is provisioned by nix to have rust toolchains, see flake.nix
$ cargo build
$ cargo run --bin rust-nix-demo-cli
```

Build it on top of nix,

```
$ nix build `.#rust-nix-demo-cli`
```
