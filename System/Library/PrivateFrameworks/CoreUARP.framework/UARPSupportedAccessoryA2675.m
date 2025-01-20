@interface UARPSupportedAccessoryA2675
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2675)init;
@end

@implementation UARPSupportedAccessoryA2675

- (UARPSupportedAccessoryA2675)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2675;
  v2 = -[UARPSupportedAccessoryWatchPuck init](&v8, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2675 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2675, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Watch Puck Charger (MFi Module)");
    v4 = +[UARPSupportedAccessoryA2755 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2755, "appleModelNumber");
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID"),  +[UARPSupportedAccessoryA2675 productID](&OBJC_CLASS___UARPSupportedAccessoryA2675, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2675";
}

+ (unsigned)productID
{
  return 1285;
}

- (void).cxx_destruct
{
}

@end