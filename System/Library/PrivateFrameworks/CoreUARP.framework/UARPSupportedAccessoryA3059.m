@interface UARPSupportedAccessoryA3059
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3059)init;
@end

@implementation UARPSupportedAccessoryA3059

- (UARPSupportedAccessoryA3059)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3059;
  v2 = -[UARPSupportedAccessoryAirPodsCase init](&v8, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3059 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3059, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"AirPods Pro 2 Case");
    v4 = +[UARPSupportedAccessoryAirPodsBud mobileAssetAppleModelNumber]( &OBJC_CLASS___UARPSupportedAccessoryA3056,  "mobileAssetAppleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareBluetooth),  "initWithVendorIDSource:vendorID:productID:productVersion:",  1LL,  +[UARPSupportedAccessoryAirPodsCase vendorID](&OBJC_CLASS___UARPSupportedAccessoryAirPodsCase, "vendorID"),  +[UARPSupportedAccessoryA3059 productID](&OBJC_CLASS___UARPSupportedAccessoryA3059, "productID"),  1LL);
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A3059";
}

+ (unsigned)productID
{
  return 8220;
}

- (void).cxx_destruct
{
}

@end