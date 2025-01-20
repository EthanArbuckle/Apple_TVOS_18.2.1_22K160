@interface UARPSupportedAccessoryBeatsUSB
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryBeatsUSB)init;
@end

@implementation UARPSupportedAccessoryBeatsUSB

- (UARPSupportedAccessoryBeatsUSB)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryBeatsUSB;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", @"Beats by Dre");
  }
  return v3;
}

+ (id)appleModelNumber
{
  return @"Unknown";
}

+ (unsigned)vendorID
{
  return 10507;
}

+ (unsigned)productID
{
  return 0;
}

@end