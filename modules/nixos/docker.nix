{ ... }:
{
  # Virtualization settings

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    # storageDriver = storageDriver;
    # autoPrune.enable = true;
    # enableNvidia = true;
  };

  # environment.persist.directories = [
  #   "/var/lib/docker"
  # ];

}
