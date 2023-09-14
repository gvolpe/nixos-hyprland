# nixos-hyprland

Playing around with a new NixOS configuration based on Wayland / Hyprland.

:warning: Currently failing to start Hyprland due to https://github.com/hyprwm/Hyprland/issues/3082 :warning:

## Virtual Machine (QEMU)

On NixOS:

```console
$ nixos-rebuild build-vm --flake .#machine
./result/bin/run-nixos-vm
```

With other distros:

```console
$ nix build .#nixosConfigurations.machine.config.virtualisation.vmVariant.system.build.vm
./result/bin/run-nixos-vm
```
