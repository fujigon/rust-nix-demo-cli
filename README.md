# rust-nix-demo-cli

## How to just use

Execute it for oneshot,

```bash
nix run 'git+https://github.com/fujigon/rust-nix-demo-cli#rust-nix-demo-cli'
```

Open it for oneshot shell,

```bash
nix shell 'git+https://github.com/fujigon/rust-nix-demo-cli#rust-nix-demo-cli'
rust-nix-demo-cli
exit
```

Permanently,

```bash
nix profile 'git+https://github.com/fujigon/rust-nix-demo-cli#rust-nix-demo-cli'
```

## How to build

First, clone this repository.

In a development shell by nix,

```bash
nix develop . # opens a new shell that is provisioned by nix to have rust toolchains, see flake.nix
cargo build
cargo run --bin rust-nix-demo-cli
```

Build it on top of nix,

```bash
nix build '.#rust-nix-demo-cli'
```
