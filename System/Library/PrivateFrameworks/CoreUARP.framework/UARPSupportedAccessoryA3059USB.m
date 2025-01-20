@interface UARPSupportedAccessoryA3059USB
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3059USB)init;
@end

@implementation UARPSupportedAccessoryA3059USB

- (UARPSupportedAccessoryA3059USB)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3059USB;
  v2 = -[UARPSupportedAccessoryAirPodsCaseUSB init](&v8, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3059USB appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3059USB, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"AirPods Pro 2 Case");
    v4 = +[UARPSupportedAccessoryAirPodsBud mobileAssetAppleModelNumber]( &OBJC_CLASS___UARPSupportedAccessoryA3056,  "mobileAssetAppleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryAirPodsCaseUSB vendorID]( &OBJC_CLASS___UARPSupportedAccessoryAirPodsCaseUSB,  "vendorID"),  +[UARPSupportedAccessoryA3059USB productID](&OBJC_CLASS___UARPSupportedAccessoryA3059USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA3059 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3059, "appleModelNumber");
}

+ (unsigned)productID
{
  return 5024;
}

- (void).cxx_destruct
{
}

@end