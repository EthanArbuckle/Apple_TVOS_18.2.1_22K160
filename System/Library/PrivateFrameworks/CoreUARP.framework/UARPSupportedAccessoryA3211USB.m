@interface UARPSupportedAccessoryA3211USB
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3211USB)init;
@end

@implementation UARPSupportedAccessoryA3211USB

- (UARPSupportedAccessoryA3211USB)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3211USB;
  v2 = -[UARPSupportedAccessoryBeatsUSB init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3211USB appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3211USB, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Speaker");
    v4 = -[UARPAccessoryHardwareB2PHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareB2PHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryBeatsUSB vendorID](&OBJC_CLASS___UARPSupportedAccessoryBeatsUSB, "vendorID"),  +[UARPSupportedAccessoryA3211USB productID](&OBJC_CLASS___UARPSupportedAccessoryA3211USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA3211 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3211, "appleModelNumber");
}

+ (unsigned)productID
{
  return 9984;
}

- (void).cxx_destruct
{
}

@end