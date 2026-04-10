{ pkgs, lib, ... }: {
  flake.modules.nixos.zimablade = {

  fileSystems."/mnt/storage" = {
    device = "UUID=e5c7d7a9-7340-437f-84bd-2a31851263fe";
    fsType = "btrfs";
    options = [ "compress=zstd" "noatime" ];
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/36ff947a-b2c9-4a6a-a1a8-b79ec857e0e9";
      fsType = "ext4";
    };

  swapDevices = [ ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
#  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
