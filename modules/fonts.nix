{ pkgs }:

{
  fontDir.enable = true;
  enableDefaultPackages = true;

  packages = with pkgs; [
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    fira-mono fira-code fira
    roboto roboto-serif
    noto-fonts-color-emoji
    ubuntu_font_family
    emacs-all-the-icons-fonts
    fantasque-sans-mono
    jetbrains-mono
    cascadia-code
    terminus_font
    iosevka
  ];

  fontconfig = {

    enable = true;
    antialias = true;
    hinting.enable = true;
    hinting.style = "slight";

    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      serif = [ "Roboto Serif" ];
      sansSerif = [ "Roboto Condensed" ];
      monospace = [ "JetBrains Mono" ];
    };

  };

}