@interface UARPSupportedAccessoryA2924
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2924)init;
@end

@implementation UARPSupportedAccessoryA2924

- (UARPSupportedAccessoryA2924)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2924;
  v2 = -[UARPSupportedAccessoryBeatsBluetooth init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2924 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2924, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Headset");
    v4 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareBluetooth),  "initWithVendorIDSource:vendorID:productID:productVersion:",  1LL,  +[UARPSupportedAccessoryBeatsBluetooth vendorID]( &OBJC_CLASS___UARPSupportedAccessoryBeatsBluetooth,  "vendorID"),  +[UARPSupportedAccessoryA2924 productID](&OBJC_CLASS___UARPSupportedAccessoryA2924, "productID"),  1LL);
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2924";
}

+ (unsigned)productID
{
  return 8215;
}

- (void).cxx_destruct
{
}

@end