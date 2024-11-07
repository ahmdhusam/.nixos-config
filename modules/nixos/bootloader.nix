{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelParams = [
    "workqueue.power_efficient=y"
    "intel_pstate=passive"
  ];
  boot.loader.systemd-boot.configurationLimit = 5;
}
