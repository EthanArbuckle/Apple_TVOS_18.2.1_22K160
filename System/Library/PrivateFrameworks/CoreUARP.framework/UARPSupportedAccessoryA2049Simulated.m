@interface UARPSupportedAccessoryA2049Simulated
+ (id)appleModelNumber;
+ (id)modelName;
+ (unsigned)productID;
+ (unsigned)vendorID;
- (UARPSupportedAccessoryA2049Simulated)init;
@end

@implementation UARPSupportedAccessoryA2049Simulated

- (UARPSupportedAccessoryA2049Simulated)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2049Simulated;
  v2 = -[UARPSupportedAccessoryUSB init](&v9, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2049Simulated appleModelNumber]( &OBJC_CLASS___UARPSupportedAccessoryA2049Simulated,  "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);
    v4 = +[UARPSupportedAccessoryA2049Simulated modelName](&OBJC_CLASS___UARPSupportedAccessoryA2049Simulated, "modelName");
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    -[UARPSupportedAccessory setIsSimulator:](v2, "setIsSimulator:", 1LL);
    v5 = +[UARPSupportedAccessoryA2049 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2049, "appleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v5);

    v6 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryA2049Simulated vendorID]( &OBJC_CLASS___UARPSupportedAccessoryA2049Simulated,  "vendorID"),  +[UARPSupportedAccessoryA2049Simulated productID]( &OBJC_CLASS___UARPSupportedAccessoryA2049Simulated,  "productID"));
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
  [v2 stringWithFormat:@"%@-SIM", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unsigned)vendorID
{
  return 1093;
}

+ (unsigned)productID
{
  return +[UARPSupportedAccessoryA2049 productID](&OBJC_CLASS___UARPSupportedAccessoryA2049, "productID");
}

+ (id)modelName
{
  v2 = (void *)NSString;
  v3 = +[UARPSupportedAccessoryA2049 modelName](&OBJC_CLASS___UARPSupportedAccessoryA2049, "modelName");
  [v2 stringWithFormat:@"%@ [Simulator]", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
}

@end