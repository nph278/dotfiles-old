{ config, pkgs, ... }:

{
  imports = 
    [
      ./hardware-configuration.nix
    ];

  # Use GRUB Bootloader
  boot.loader.systemd-boot = {
    enable = true;
    editor = true;
  };

  boot.initrd.luks.devices = {
    btrfs = {
      name = "btrfs";
      device = "/dev/disk/by-partlabel/crypt-btrfs";
      preLVM = true;
    };
    swap = {
      name = "swap";
      device = "/dev/disk/by-partlabel/crypt-swap";
      preLVM = true;
    };
  ];

  # Time Zone
  time.timeZone = "America/New_York";

  # Networking
  networking = {
    hostName = "%%HOSTNAME%%";
    wireless.enable = %%WIRELESS%%;
    useDHCP = false;
    interfaces.%%INTERFACE%%.useDHCP = true;
    firewall.enable = false;
  };

  # i18n
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Printing
  services.printing.enable = true;

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Carl User
  users.users.carl = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    neovim
    wget
    killall
    firefox
    alacritty
    bemenu
    mpv
    feh
    fira-mono
    waybar
    zsh
    git
  ];

  # SUID Wrappers
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # SwayWM
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # Version
  system.stateVersion = "21.05";
}
