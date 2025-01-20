@interface UARPSupportedAccessoryUSB
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryUSB)init;
@end

@implementation UARPSupportedAccessoryUSB

- (UARPSupportedAccessoryUSB)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryUSB;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", @"Apple Inc.");
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1LL);
    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v3, "setUpdateRequiresPowerAssertion:", 1LL);
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