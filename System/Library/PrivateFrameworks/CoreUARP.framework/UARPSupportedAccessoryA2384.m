@interface UARPSupportedAccessoryA2384
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2384)init;
@end

@implementation UARPSupportedAccessoryA2384

- (UARPSupportedAccessoryA2384)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2384;
  v2 = -[UARPSupportedAccessoryMagSafe init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2384 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2384, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"MagSafe Battery Pack");
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID"),  +[UARPSupportedAccessoryA2384 productID](&OBJC_CLASS___UARPSupportedAccessoryA2384, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2384";
}

+ (unsigned)productID
{
  return 5017;
}

- (void).cxx_destruct
{
}

@end