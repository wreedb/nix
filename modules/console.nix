{ config, lib, pkgs, ... }:

{
    console = {
        packages = with pkgs; [ tamsyn ];
        font = "${pkgs.tamsyn}/share/consolefonts/Tamsyn10x20b.psf.gz";
        useXkbConfig = true;
        colors = [
            "1A1D27"
            "FB7DA7"
            "76C5A4"
            "FDAD5D"
            "80B0E0"
            "AF98E6"
            "51C7DA"
            "D7D7D7"
            
            "494C59"
            "FB83AB"
            "7DC8A9"
            "E3CF67"
            "86B4E2"
            "B39DE7"
            "5ACADC"
            "ECECEC"
        ];
    };
}
