@interface UARPSupportedAccessoryA2968
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2968)init;
@end

@implementation UARPSupportedAccessoryA2968

- (UARPSupportedAccessoryA2968)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2968;
  v2 = -[UARPSupportedAccessoryAirPodsCase init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2968 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2968, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"AirPods Pro 2 Case (USB-C)");
    -[UARPSupportedAccessory setPersonalizationNotification:]( v2,  "setPersonalizationNotification:",  @"com.apple.uarp.BTLEServer.personalizationNeeded");
    v4 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareBluetooth),  "initWithVendorIDSource:vendorID:productID:productVersion:",  1LL,  +[UARPSupportedAccessoryAirPodsCase vendorID](&OBJC_CLASS___UARPSupportedAccessoryAirPodsCase, "vendorID"),  +[UARPSupportedAccessoryA2968 productID](&OBJC_CLASS___UARPSupportedAccessoryA2968, "productID"),  1LL);
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2968";
}

+ (unsigned)productID
{
  return 8216;
}

- (void).cxx_destruct
{
}

@end