@interface UARPSupportedAccessoryA3046DFU
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3046DFU)init;
@end

@implementation UARPSupportedAccessoryA3046DFU

- (UARPSupportedAccessoryA3046DFU)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3046DFU;
  v2 = -[UARPSupportedAccessoryUSB init](&v9, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3046DFU appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3046DFU, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);
    v4 = +[UARPSupportedAccessoryA3046DFU modelName](&OBJC_CLASS___UARPSupportedAccessoryA3046DFU, "modelName");
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    -[UARPSupportedAccessory setDfuMode:](v2, "setDfuMode:", 1LL);
    v5 = +[UARPSupportedAccessoryA3046 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3046, "appleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v5);

    v6 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryUSB vendorID](&OBJC_CLASS___UARPSupportedAccessoryUSB, "vendorID"),  +[UARPSupportedAccessoryA3046DFU productID](&OBJC_CLASS___UARPSupportedAccessoryA3046DFU, "productID"));
    hwID = v2->hwID;
    v2->hwID = v6;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  v2 = (void *)NSString;
  v3 = +[UARPSupportedAccessoryA3046 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3046, "appleModelNumber");
  [v2 stringWithFormat:@"%@-DFU", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unsigned)productID
{
  return -4074;
}

+ (id)modelName
{
  v2 = (void *)NSString;
  v3 = +[UARPSupportedAccessoryA3046 modelName](&OBJC_CLASS___UARPSupportedAccessoryA3046, "modelName");
  [v2 stringWithFormat:@"%@ (DFU)", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
}

@end