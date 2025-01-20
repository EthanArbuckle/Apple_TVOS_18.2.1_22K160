@interface UARPSupportedAccessoryA2049
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2049)init;
@end

@implementation UARPSupportedAccessoryA2049

- (UARPSupportedAccessoryA2049)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2049;
  v2 = -[UARPSupportedAccessoryUSB init](&v8, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2049 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2049, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);
    v4 = +[UARPSupportedAccessoryA2049 modelName](&OBJC_CLASS___UARPSupportedAccessoryA2049, "modelName");
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    v5 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryUSB vendorID](&OBJC_CLASS___UARPSupportedAccessoryUSB, "vendorID"),  +[UARPSupportedAccessoryA2049 productID](&OBJC_CLASS___UARPSupportedAccessoryA2049, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2049";
}

+ (unsigned)productID
{
  return 4362;
}

+ (id)modelName
{
  return @"USB-C to 3.5 mm Headphone Jack Adapter";
}

- (void).cxx_destruct
{
}

@end