{ config, pkgs, ... }:

{
  imports = 
    [
      ./hardware-configuration.nix
    ];

  # Use GRUB Bootloader
  boot.loader.grub = {
    enable = true;
    enableCryptodisk = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    version = 2;
  };

  # Time Zone
  time.timeZone = "America/New_York";

  # Networking
  networking = {
    hostname = "%%HOSTNAME%%";
    wireless.enable = %%WIRELESS%%;
    useDHCP = false;
    intrerfaces.%%INTERFACE%%.useDHCP = true;
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
    name = "Carl";
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
    minecraft
    zsh
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
