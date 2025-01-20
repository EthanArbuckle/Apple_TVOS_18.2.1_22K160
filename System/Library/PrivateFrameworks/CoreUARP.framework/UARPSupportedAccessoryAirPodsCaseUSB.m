@interface UARPSupportedAccessoryAirPodsCaseUSB
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryAirPodsCaseUSB)init;
@end

@implementation UARPSupportedAccessoryAirPodsCaseUSB

- (UARPSupportedAccessoryAirPodsCaseUSB)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryAirPodsCaseUSB;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", @"Apple Inc.");
    -[UARPSupportedAccessory setSupportsLogs:](v3, "setSupportsLogs:", 1LL);
    -[UARPSupportedAccessory setSupportsAnalytics:](v3, "setSupportsAnalytics:", 1LL);
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1LL);
    -[UARPSupportedAccessory setSupportsDeveloperSettings:](v3, "setSupportsDeveloperSettings:", 1LL);
    -[UARPSupportedAccessory setAllowDownloadOnCellular:](v3, "setAllowDownloadOnCellular:", 1LL);
    -[UARPSupportedAccessory setTtrSolicitLogs:](v3, "setTtrSolicitLogs:", 1LL);
  }

  return v3;
}

+ (id)appleModelNumber
{
  return @"Unknown";
}

+ (unsigned)vendorID
{
  return 1452;
}

+ (unsigned)productID
{
  return 0;
}

@end