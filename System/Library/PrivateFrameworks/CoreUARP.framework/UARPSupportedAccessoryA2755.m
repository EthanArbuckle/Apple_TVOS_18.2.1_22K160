@interface UARPSupportedAccessoryA2755
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2755)init;
@end

@implementation UARPSupportedAccessoryA2755

- (UARPSupportedAccessoryA2755)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2755;
  v2 = -[UARPSupportedAccessoryWatchPuck init](&v9, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2755 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2755, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Watch Puck Charger (MFi Module)");
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID"),  +[UARPSupportedAccessoryA2755 productID](&OBJC_CLASS___UARPSupportedAccessoryA2755, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
    v6 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHIDPersonality),  "initWithVendorID:productID:",  1293LL,  346LL);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v6);
    v7 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHIDPersonality),  "initWithVendorID:productID:",  12907LL,  289LL);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v7);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2755";
}

+ (unsigned)productID
{
  return 1284;
}

- (void).cxx_destruct
{
}

@end