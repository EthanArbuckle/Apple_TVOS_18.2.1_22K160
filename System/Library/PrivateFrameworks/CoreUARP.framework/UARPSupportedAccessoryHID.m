@interface UARPSupportedAccessoryHID
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryHID)init;
@end

@implementation UARPSupportedAccessoryHID

- (UARPSupportedAccessoryHID)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryHID;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", @"Apple Inc.");
    -[UARPSupportedAccessory setUpdaterName:](v3, "setUpdaterName:", @"com.apple.UARPUpdaterServiceHID");
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1LL);
    -[UARPSupportedAccessory setUploaderResponseTimeout:](v3, "setUploaderResponseTimeout:", 10000LL);
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