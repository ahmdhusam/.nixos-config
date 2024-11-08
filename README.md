# NixOS Configuration

This repository contains a NixOS configuration for setting up a personal laptop environment. It includes configurations for system packages, user environments, and various services.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [License](#license)

## Prerequisites

Before you begin, ensure you have the following installed:

- [Nix](https://nixos.org/download.html) - The package manager for NixOS.
- A compatible NixOS installation.

## Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/ahmdhusam/nixos-config.git
   cd nixos-config
   ```

2. Build and switch to the new configuration:

   ```bash
   sudo nixos-rebuild switch --flake .#nixos
   ```

   This command will apply the configuration defined in the `flake.nix` file.

## Configuration

You can customize your NixOS configuration by editing the following files:

- `flake.nix`: Main entry point for the NixOS configuration.
- `hosts/laptop/configuration.nix`: System-wide configuration settings.
- `hosts/laptop/home.nix`: User-specific configurations managed by Home Manager.
- `modules/`: Contains various modules for additional configurations (e.g., sound, networking, desktop environment).

### Example Customization

To add a new package to your user environment, edit the `hosts/laptop/home.nix` file and add it to the `home.packages` list:

```nix
home.packages = with pkgs; [
  pkgs.your-package
];
```

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for more details.