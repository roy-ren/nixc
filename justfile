# Like GNU `make`, but `just` rustier.
# https://just.systems/
# run `just` from this directory to see available commands

# Default command when 'just' is run without arguments
default:
  @just --list

# Update nix flake
[group('Main')]
update:
  nix flake update

# Lint nix files
[group('dev')]
lint:
  nix fmt

# Check nix flake
[group('dev')]
check:
  nix flake check --all-systems --show-trace

# Manually enter dev shell
[group('dev')]
dev:
  nix develop

# Show flake output
[group('dev')]
show:
  nix flake show

# Show flake output all systems
[group('dev')]
show-all:
  nix flake show --all-systems

#lagoon darwin-rebuild switch --flake ./#lagoon --show-trace
[group('Main')]
l:
  darwin-rebuild switch --flake ./#lagoon --show-trace

# nixos-rebuild switch --flake ./#nixpad --show-trace
[group('Main')]
p:
  sudo nixos-rebuild switch --flake ./#nixpad --show-trace
