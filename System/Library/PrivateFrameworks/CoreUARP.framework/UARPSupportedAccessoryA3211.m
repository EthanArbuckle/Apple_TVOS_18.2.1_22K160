@interface UARPSupportedAccessoryA3211
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA3211)init;
@end

@implementation UARPSupportedAccessoryA3211

- (UARPSupportedAccessoryA3211)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA3211;
  v2 = -[UARPSupportedAccessoryBeatsBluetooth init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA3211 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA3211, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Speaker");
    -[UARPSupportedAccessory setSupportsHeySiriCompact:](v2, "setSupportsHeySiriCompact:", 0LL);
    v4 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareBluetooth),  "initWithVendorIDSource:vendorID:productID:productVersion:",  1LL,  +[UARPSupportedAccessoryBeatsBluetooth vendorID]( &OBJC_CLASS___UARPSupportedAccessoryBeatsBluetooth,  "vendorID"),  +[UARPSupportedAccessoryA3211 productID](&OBJC_CLASS___UARPSupportedAccessoryA3211, "productID"),  1LL);
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A3211";
}

+ (unsigned)productID
{
  return 8218;
}

- (void).cxx_destruct
{
}

@end