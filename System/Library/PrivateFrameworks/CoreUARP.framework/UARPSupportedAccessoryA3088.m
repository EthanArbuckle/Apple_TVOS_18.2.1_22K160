@interface UARPSupportedAccessoryA3088
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3088)init;
@end

@implementation UARPSupportedAccessoryA3088

- (UARPSupportedAccessoryA3088)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3088;
  v2 = -[UARPSupportedAccessoryMagSafe init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3088 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3088, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"MagSafe Charger (MFi Module)");
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID"),  +[UARPSupportedAccessoryA3088 productID](&OBJC_CLASS___UARPSupportedAccessoryA3088, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A3088";
}

+ (unsigned)productID
{
  return 1288;
}

- (void).cxx_destruct
{
}

@end