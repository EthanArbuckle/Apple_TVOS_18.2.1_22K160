@interface UARPSupportedAccessoryA2049DFUSimulated
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2049DFUSimulated)init;
@end

@implementation UARPSupportedAccessoryA2049DFUSimulated

- (UARPSupportedAccessoryA2049DFUSimulated)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2049DFUSimulated;
  v2 = -[UARPSupportedAccessoryUSB init](&v9, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2049DFUSimulated appleModelNumber]( &OBJC_CLASS___UARPSupportedAccessoryA2049DFUSimulated,  "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);
    v4 = +[UARPSupportedAccessoryA2049DFUSimulated modelName]( &OBJC_CLASS___UARPSupportedAccessoryA2049DFUSimulated,  "modelName");
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    -[UARPSupportedAccessory setDfuMode:](v2, "setDfuMode:", 1LL);
    -[UARPSupportedAccessory setIsSimulator:](v2, "setIsSimulator:", 1LL);
    v5 = +[UARPSupportedAccessoryA2049 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2049, "appleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v5);

    v6 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryA2049Simulated vendorID]( &OBJC_CLASS___UARPSupportedAccessoryA2049Simulated,  "vendorID"),  +[UARPSupportedAccessoryA2049DFUSimulated productID]( &OBJC_CLASS___UARPSupportedAccessoryA2049DFUSimulated,  "productID"));
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
  [v2 stringWithFormat:@"%@-DFUSIM", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unsigned)productID
{
  return +[UARPSupportedAccessoryA2049DFU productID](&OBJC_CLASS___UARPSupportedAccessoryA2049DFU, "productID");
}

+ (id)modelName
{
  v2 = (void *)NSString;
  v3 = +[UARPSupportedAccessoryA2049DFU modelName](&OBJC_CLASS___UARPSupportedAccessoryA2049DFU, "modelName");
  [v2 stringWithFormat:@"%@ [Simulator]", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
}

@end