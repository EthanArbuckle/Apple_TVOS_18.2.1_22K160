@interface UARPSupportedAccessoryA3054
+ (id)appleModelNumber;
+ (id)mobileAssetAppleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3054)init;
@end

@implementation UARPSupportedAccessoryA3054

- (UARPSupportedAccessoryA3054)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3054;
  v2 = -[UARPSupportedAccessoryAirPodsBud init](&v8, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3054 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3054, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"AirPods Pro 2");
    v4 = +[UARPSupportedAccessoryA3054 mobileAssetAppleModelNumber]( &OBJC_CLASS___UARPSupportedAccessoryA3054,  "mobileAssetAppleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareBluetooth),  "initWithVendorIDSource:vendorID:productID:productVersion:",  1LL,  +[UARPSupportedAccessoryAirPodsBud vendorID](&OBJC_CLASS___UARPSupportedAccessoryAirPodsBud, "vendorID"),  +[UARPSupportedAccessoryA3054 productID](&OBJC_CLASS___UARPSupportedAccessoryA3054, "productID"),  1LL);
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A3054";
}

+ (id)mobileAssetAppleModelNumber
{
  return +[UARPSupportedAccessoryA3053 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3053, "appleModelNumber");
}

+ (unsigned)productID
{
  return 8222;
}

- (void).cxx_destruct
{
}

@end