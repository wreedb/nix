{ pkgs }: {

    opengl.enable = true;

    opengl.extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      intel-ocl
    ];

    enableAllFirmware = true;
    bluetooth.enable = true;
    cpu.intel.updateMicrocode = true;
    logitech.wireless.enable = true;
    enableRedistributableFirmware = true;
    wirelessRegulatoryDatabase = true;

}
