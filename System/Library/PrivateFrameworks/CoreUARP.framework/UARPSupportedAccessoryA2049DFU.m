@interface UARPSupportedAccessoryA2049DFU
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2049DFU)init;
@end

@implementation UARPSupportedAccessoryA2049DFU

- (UARPSupportedAccessoryA2049DFU)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2049DFU;
  v2 = -[UARPSupportedAccessoryUSB init](&v9, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2049DFU appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2049DFU, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);
    v4 = +[UARPSupportedAccessoryA2049DFU modelName](&OBJC_CLASS___UARPSupportedAccessoryA2049DFU, "modelName");
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    -[UARPSupportedAccessory setDfuMode:](v2, "setDfuMode:", 1LL);
    v5 = +[UARPSupportedAccessoryA2049 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2049, "appleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v5);

    v6 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryUSB vendorID](&OBJC_CLASS___UARPSupportedAccessoryUSB, "vendorID"),  +[UARPSupportedAccessoryA2049DFU productID](&OBJC_CLASS___UARPSupportedAccessoryA2049DFU, "productID"));
    hwID = v2->hwID;
    v2->hwID = v6;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  v2 = (void *)NSString;
  v3 = +[UARPSupportedAccessoryA2049 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2049, "appleModelNumber");
  [v2 stringWithFormat:@"%@-DFU", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unsigned)productID
{
  return -4070;
}

+ (id)modelName
{
  v2 = (void *)NSString;
  v3 = +[UARPSupportedAccessoryA2049 modelName](&OBJC_CLASS___UARPSupportedAccessoryA2049, "modelName");
  [v2 stringWithFormat:@"%@ (DFU)", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
}

@end