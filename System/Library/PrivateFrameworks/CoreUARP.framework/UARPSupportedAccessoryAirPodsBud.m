@interface UARPSupportedAccessoryAirPodsBud
+ (id)appleModelNumber;
+ (id)mobileAssetAppleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryAirPodsBud)init;
@end

@implementation UARPSupportedAccessoryAirPodsBud

- (UARPSupportedAccessoryAirPodsBud)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryAirPodsBud;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", @"Apple Inc.");
    -[UARPSupportedAccessory setSupportsHeySiriCompact:](v3, "setSupportsHeySiriCompact:", 1LL);
    -[UARPSupportedAccessory setReofferFirmwareOnSync:](v3, "setReofferFirmwareOnSync:", 1LL);
    -[UARPSupportedAccessory setSupportsFriendlyName:](v3, "setSupportsFriendlyName:", 1LL);
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1LL);
    -[UARPSupportedAccessory setSupportsDeveloperSettings:](v3, "setSupportsDeveloperSettings:", 1LL);
    -[UARPSupportedAccessory setSupportsVersions:](v3, "setSupportsVersions:", 1LL);
    -[UARPSupportedAccessory setAllowDownloadOnCellular:](v3, "setAllowDownloadOnCellular:", 1LL);
    -[UARPSupportedAccessory setUpdaterName:](v3, "setUpdaterName:", @"BTLEServer");
    -[UARPSupportedAccessory addBSDNotificationName:]( v3,  "addBSDNotificationName:",  @"com.apple.corespeech.voicetriggerassetchange");
  }

  return v3;
}

+ (id)appleModelNumber
{
  return @"Unknown";
}

+ (id)mobileAssetAppleModelNumber
{
  return @"Unknown";
}

+ (unsigned)vendorID
{
  return 76;
}

+ (unsigned)productID
{
  return 0;
}

@end