@interface UARPSupportedAccessoryA3046
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3046)init;
@end

@implementation UARPSupportedAccessoryA3046

- (UARPSupportedAccessoryA3046)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3046;
  v2 = -[UARPSupportedAccessoryUSB init](&v8, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3046 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3046, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);
    v4 = +[UARPSupportedAccessoryA3046 modelName](&OBJC_CLASS___UARPSupportedAccessoryA3046, "modelName");
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    v5 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryUSB vendorID](&OBJC_CLASS___UARPSupportedAccessoryUSB, "vendorID"),  +[UARPSupportedAccessoryA3046 productID](&OBJC_CLASS___UARPSupportedAccessoryA3046, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A3046";
}

+ (unsigned)productID
{
  return 4363;
}

+ (id)modelName
{
  return @"USB-C to 3.5 mm Headphone Jack Adapter";
}

- (void).cxx_destruct
{
}

@end