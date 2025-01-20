@interface UARPSupportedAccessoryA2975
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2975)init;
@end

@implementation UARPSupportedAccessoryA2975

- (UARPSupportedAccessoryA2975)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2975;
  v2 = -[UARPSupportedAccessoryMagicKeyboard init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2975 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2975, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Magic Keyboard");
    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v2, "setUpdateRequiresPowerAssertion:", 1LL);
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryMagicKeyboard, "vendorID"),  +[UARPSupportedAccessoryA2975 productID](&OBJC_CLASS___UARPSupportedAccessoryA2975, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2975";
}

+ (unsigned)productID
{
  return 1108;
}

- (void).cxx_destruct
{
}

@end