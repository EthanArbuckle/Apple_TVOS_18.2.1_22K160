@interface UARPSupportedAccessoryA2728
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2728)init;
@end

@implementation UARPSupportedAccessoryA2728

- (UARPSupportedAccessoryA2728)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2728;
  v2 = -[UARPSupportedAccessoryMagSafe init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2728 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2728, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"MagSafe Charger (MFi Module)");
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID"),  +[UARPSupportedAccessoryA2728 productID](&OBJC_CLASS___UARPSupportedAccessoryA2728, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2728";
}

+ (unsigned)productID
{
  return 5019;
}

- (void).cxx_destruct
{
}

@end