@interface UARPSupportedAccessoryA2538
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2538)init;
@end

@implementation UARPSupportedAccessoryA2538

- (UARPSupportedAccessoryA2538)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2538;
  v2 = -[UARPSupportedAccessoryPencil init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2538 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2538, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v2, "setUpdateRequiresPowerAssertion:", 1LL);
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryPencil vendorID](&OBJC_CLASS___UARPSupportedAccessoryPencil, "vendorID"),  +[UARPSupportedAccessoryA2538 productID](&OBJC_CLASS___UARPSupportedAccessoryA2538, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2538";
}

+ (unsigned)productID
{
  return 1106;
}

- (void).cxx_destruct
{
}

@end