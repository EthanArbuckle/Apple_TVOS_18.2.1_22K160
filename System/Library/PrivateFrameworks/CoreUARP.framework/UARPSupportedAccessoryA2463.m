@interface UARPSupportedAccessoryA2463
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2463)init;
@end

@implementation UARPSupportedAccessoryA2463

- (UARPSupportedAccessoryA2463)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2463;
  v2 = -[UARPSupportedAccessoryMagSafe init](&v12, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2463 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2463, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"MagSafe Charger (MFi Module)");
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID"),  +[UARPSupportedAccessoryA2463 productID](&OBJC_CLASS___UARPSupportedAccessoryA2463, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    v6 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHIDPersonality),  "initWithVendorID:productID:",  11145LL,  50652LL);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v6);
    v7 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHIDPersonality),  "initWithVendorID:productID:",  11145LL,  24790LL);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v7);
    v8 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHIDPersonality),  "initWithVendorID:productID:",  11145LL,  40119LL);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v8);
    v9 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHIDPersonality),  "initWithVendorID:productID:",  11145LL,  15125LL);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v9);
    v10 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHIDPersonality),  "initWithVendorID:productID:",  11145LL,  15126LL);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v10);
    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2463";
}

+ (unsigned)productID
{
  return 1281;
}

- (void).cxx_destruct
{
}

@end