@interface UARPSupportedAccessoryA2515
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2515)init;
@end

@implementation UARPSupportedAccessoryA2515

- (UARPSupportedAccessoryA2515)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2515;
  v2 = -[UARPSupportedAccessoryWatchPuck init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2515 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2515, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Watch Puck Charger");
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID"),  +[UARPSupportedAccessoryA2515 productID](&OBJC_CLASS___UARPSupportedAccessoryA2515, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2515";
}

+ (unsigned)productID
{
  return 1283;
}

- (void).cxx_destruct
{
}

@end