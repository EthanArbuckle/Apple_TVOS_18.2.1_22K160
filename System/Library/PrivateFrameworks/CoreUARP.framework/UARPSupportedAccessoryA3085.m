@interface UARPSupportedAccessoryA3085
+ (id)appleModelNumber;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryA3085)init;
@end

@implementation UARPSupportedAccessoryA3085

- (UARPSupportedAccessoryA3085)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3085;
  v2 = -[UARPSupportedAccessoryPencil init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3085 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3085, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v2, "setUpdateRequiresPowerAssertion:", 1LL);
    -[UARPSupportedAccessory setAutoAppliesStagedFirmware:](v2, "setAutoAppliesStagedFirmware:", 1LL);
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryA3085 vendorID](&OBJC_CLASS___UARPSupportedAccessoryA3085, "vendorID"),  +[UARPSupportedAccessoryA3085 productID](&OBJC_CLASS___UARPSupportedAccessoryA3085, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A3085";
}

+ (unsigned)vendorID
{
  return +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID");
}

+ (unsigned)productID
{
  return 1057;
}

- (void).cxx_destruct
{
}

@end