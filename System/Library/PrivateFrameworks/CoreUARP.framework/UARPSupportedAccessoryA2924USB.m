@interface UARPSupportedAccessoryA2924USB
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2924USB)init;
@end

@implementation UARPSupportedAccessoryA2924USB

- (UARPSupportedAccessoryA2924USB)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2924USB;
  v2 = -[UARPSupportedAccessoryBeatsUSB init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2924USB appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2924USB, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Headset");
    v4 = -[UARPAccessoryHardwareB2PHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareB2PHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryBeatsUSB vendorID](&OBJC_CLASS___UARPSupportedAccessoryBeatsUSB, "vendorID"),  +[UARPSupportedAccessoryA2924USB productID](&OBJC_CLASS___UARPSupportedAccessoryA2924USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA2924 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2924, "appleModelNumber");
}

+ (unsigned)productID
{
  return 2304;
}

- (void).cxx_destruct
{
}

@end