@interface UARPSupportedAccessoryUSBPD
+ (id)appleModelNumber;
+ (int64_t)deviceClass;
+ (int64_t)locationType;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryUSBPD)init;
@end

@implementation UARPSupportedAccessoryUSBPD

- (UARPSupportedAccessoryUSBPD)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryUSBPD;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", @"Apple Inc.");
    -[UARPSupportedAccessory setUpdaterName:](v3, "setUpdaterName:", @"com.apple.UARPUpdaterServiceUSBPD");
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1LL);
    -[UARPSupportedAccessory setSupportsAccMode7:](v3, "setSupportsAccMode7:", 1LL);
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

+ (int64_t)deviceClass
{
  return 3LL;
}

+ (int64_t)locationType
{
  return 0LL;
}

@end