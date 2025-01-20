@interface UARPSupportedAccessoryA3058USB
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3058USB)init;
@end

@implementation UARPSupportedAccessoryA3058USB

- (UARPSupportedAccessoryA3058USB)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3058USB;
  v2 = -[UARPSupportedAccessoryAirPodsCaseUSB init](&v8, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3058USB appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3058USB, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"AirPods Pro 2 Case");
    v4 = +[UARPSupportedAccessoryAirPodsBud mobileAssetAppleModelNumber]( &OBJC_CLASS___UARPSupportedAccessoryA3053,  "mobileAssetAppleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryAirPodsCaseUSB vendorID]( &OBJC_CLASS___UARPSupportedAccessoryAirPodsCaseUSB,  "vendorID"),  +[UARPSupportedAccessoryA3058USB productID](&OBJC_CLASS___UARPSupportedAccessoryA3058USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A3058";
}

+ (unsigned)productID
{
  return 5023;
}

- (void).cxx_destruct
{
}

@end