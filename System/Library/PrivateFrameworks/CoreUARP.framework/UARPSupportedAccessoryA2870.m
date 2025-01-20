@interface UARPSupportedAccessoryA2870
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2870)init;
@end

@implementation UARPSupportedAccessoryA2870

- (UARPSupportedAccessoryA2870)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2870;
  v2 = -[UARPSupportedAccessoryBeatsUSB init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2870 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2870, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Studio Case");
    v4 = -[UARPAccessoryHardwareB2PHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareB2PHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryBeatsUSB vendorID](&OBJC_CLASS___UARPSupportedAccessoryBeatsUSB, "vendorID"),  +[UARPSupportedAccessoryA2870 productID](&OBJC_CLASS___UARPSupportedAccessoryA2870, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2870";
}

+ (unsigned)productID
{
  return 16432;
}

- (void).cxx_destruct
{
}

@end