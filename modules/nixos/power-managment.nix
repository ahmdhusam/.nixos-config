{ config, pkgs, ... }:
{
  services = {
    thermald.enable = true;

    # Better scheduling for CPU cycles - thanks System76!!!
    system76-scheduler.settings.cfsProfiles.enable = true;

    # # default performance balance_performance balance_power power 
    # auto-cpufreq = {
    #   enable = true;
    #   settings = {
    #     battery = {
    #       # performance, powersave

    #       governor = "powersave";
    #       turbo = "never";
    #     };
    #     charger = {
    #       # performance, powersave
    #       governor = "powersave";
    #       turbo = "never";
    #     };
    #   };
    # };

    # battery
    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 10;
      percentageAction = 5;
      criticalPowerAction = "PowerOff";
    };

    power-profiles-daemon.enable = false;

  };

  powerManagement = {
    enable = true;
    # cpuFreqGovernor = "powersave";
    powertop.enable = true;

  };

  # powerManagement.cpufreq.max = 800000;

  services.tlp = {
    enable = true;
    settings = {
      # CPU_DRIVER_OPMODE_ON_AC = "active";
      # CPU_DRIVER_OPMODE_ON_BAT = "active";

      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_SCALING_MIN_FREQ_ON_AC = 0;
      CPU_SCALING_MAX_FREQ_ON_AC = 800000;
      CPU_SCALING_MIN_FREQ_ON_BAT = 0;
      CPU_SCALING_MAX_FREQ_ON_BAT = 800000;

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "power";

      # CPU_MIN_PERF_ON_AC = 0;
      # CPU_MAX_PERF_ON_AC = 15;
      # CPU_MIN_PERF_ON_BAT = 0;
      # CPU_MAX_PERF_ON_BAT = 10;

      # WIFI_PWR_ON_AC = "on";
      # WIFI_PWR_ON_BAT = "on";
      # RUNTIME_PM_ON_AC = "auto";
      # RUNTIME_PM_ON_BAT = "auto";

      CPU_BOOST_ON_AC = 0;
      CPU_BOOST_ON_BAT = 0;

      CPU_HWP_DYN_BOOST_ON_AC = 0;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;

      # START_CHARGE_THRESH_BAT0 = 75;
      # STOP_CHARGE_THRESH_BAT0 = 80;

      MEM_SLEEP_ON_AC = "deep";
      MEM_SLEEP_ON_BAT = "deep";

      # PLATFORM_PROFILE_ON_AC = "performance";
      # PLATFORM_PROFILE_ON_BAT = "low-power";

      # # for amd cards
      # RADEON_DPM_STATE_ON_AC = "performance";
      # RADEON_DPM_STATE_ON_BAT = "battery";
      # RADEON_POWER_PROFILE_ON_AC = "high";
      # RADEON_POWER_PROFILE_ON_BAT = "low";

      # INTEL_GPU_MIN_FREQ_ON_AC = 600;
      # INTEL_GPU_MIN_FREQ_ON_BAT = 600;
    };
  };

}

### uto-cpufreq Docs
# # settings for when connected to a power source
# [charger]
# # see available governors by running: cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
# # preferred governor.
# governor = performance

# # EPP: see available preferences by running: cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences
# energy_performance_preference = performance

# # EPB (Energy Performance Bias) for the intel_pstate driver
# # see conversion info: https://www.kernel.org/doc/html/latest/admin-guide/pm/intel_epb.html
# # available EPB options include a numeric value between 0-15
# # (where 0 = maximum performance and 15 = maximum power saving),
# # or one of the following strings:
# # performance (0), balance_performance (4), default (6), balance_power (8), or power (15)
# # if the parameter is missing in the config and the hardware supports this setting, the default value will be used
# # the default value is `balance_performance` (for charger)
# # energy_perf_bias = balance_performance

# # Platform Profiles
# # https://www.kernel.org/doc/html/latest/userspace-api/sysfs-platform_profile.html
# # See available options by running:
# # cat /sys/firmware/acpi/platform_profile_choices
# # platform_profile = performance

# # minimum cpu frequency (in kHz)
# # example: for 800 MHz = 800000 kHz --> scaling_min_freq = 800000
# # see conversion info: https://www.rapidtables.com/convert/frequency/mhz-to-hz.html
# # to use this feature, uncomment the following line and set the value accordingly
# # scaling_min_freq = 800000

# # maximum cpu frequency (in kHz)
# # example: for 1GHz = 1000 MHz = 1000000 kHz -> scaling_max_freq = 1000000
# # see conversion info: https://www.rapidtables.com/convert/frequency/mhz-to-hz.html
# # to use this feature, uncomment the following line and set the value accordingly
# # scaling_max_freq = 1000000

# # turbo boost setting. possible values: always, auto, never
# turbo = auto

# # this is for ignoring controllers and other connected devices battery from affecting 
# # laptop preformence
# # [power_supply_ignore_list]

# # name1 = this
# # name2 = is
# # name3 = an
# # name4 = example

# # settings for when using battery power
# [battery]
# # see available governors by running: cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
# # preferred governor
# governor = powersave

# # EPP: see available preferences by running: cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_available_preferences
# energy_performance_preference = power

# # EPB (Energy Performance Bias) for the intel_pstate driver
# # see conversion info: https://www.kernel.org/doc/html/latest/admin-guide/pm/intel_epb.html
# # available EPB options include a numeric value between 0-15
# # (where 0 = maximum performance and 15 = maximum power saving),
# # or one of the following strings:
# # performance (0), balance_performance (4), default (6), balance_power (8), or power (15)
# # if the parameter is missing in the config and the hardware supports this setting, the default value will be used
# # the default value is `balance_power` (for battery)
# # energy_perf_bias = balance_power

# # Platform Profiles
# # https://www.kernel.org/doc/html/latest/userspace-api/sysfs-platform_profile.html
# # See available options by running:
# # cat /sys/firmware/acpi/platform_profile_choices
# # platform_profile = low-power

# # minimum cpu frequency (in kHz)
# # example: for 800 MHz = 800000 kHz --> scaling_min_freq = 800000
# # see conversion info: https://www.rapidtables.com/convert/frequency/mhz-to-hz.html
# # to use this feature, uncomment the following line and set the value accordingly
# # scaling_min_freq = 800000

# # maximum cpu frequency (in kHz)
# # see conversion info: https://www.rapidtables.com/convert/frequency/mhz-to-hz.html
# # example: for 1GHz = 1000 MHz = 1000000 kHz -> scaling_max_freq = 1000000
# # to use this feature, uncomment the following line and set the value accordingly
# # scaling_max_freq = 1000000

# # turbo boost setting. possible values: always, auto, never
# turbo = auto

# # experimental 

# # Add battery charging threshold (currently only available to Lenovo)
# # checkout README.md for more info

# # enable thresholds true or false
# #enable_thresholds = true
# #
# # start threshold (0 is off ) can be 0-99
# #start_threshold = 0
# #
# # stop threshold (100 is off) can be 1-100
# #stop_threshold = 100
