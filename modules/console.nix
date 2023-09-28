{ pkgs }: {
  keyMap = "us";
  earlySetup = true;
  packages = [ pkgs.terminus_font ];
  font = "${pkgs.terminus_font}/share/consolefonts/ter-124b.psf.gz";
}