@interface UARPSupportedAccessoryAirPodsCase
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryAirPodsCase)init;
@end

@implementation UARPSupportedAccessoryAirPodsCase

- (UARPSupportedAccessoryAirPodsCase)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryAirPodsCase;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", @"Apple Inc.");
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1LL);
    -[UARPSupportedAccessory setSupportsDeveloperSettings:](v3, "setSupportsDeveloperSettings:", 1LL);
    -[UARPSupportedAccessory setAllowDownloadOnCellular:](v3, "setAllowDownloadOnCellular:", 1LL);
    -[UARPSupportedAccessory setUpdaterName:](v3, "setUpdaterName:", @"BTLEServer");
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
  return 76;
}

+ (unsigned)productID
{
  return 0;
}

@end