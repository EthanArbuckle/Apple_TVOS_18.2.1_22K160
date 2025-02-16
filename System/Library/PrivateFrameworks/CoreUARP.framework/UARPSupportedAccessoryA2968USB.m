@interface UARPSupportedAccessoryA2968USB
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2968USB)init;
@end

@implementation UARPSupportedAccessoryA2968USB

- (UARPSupportedAccessoryA2968USB)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2968USB;
  v2 = -[UARPSupportedAccessoryAirPodsCaseUSB init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2968USB appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2968USB, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"AirPods Pro 2 Case");
    -[UARPSupportedAccessory setPersonalizationNotification:]( v2,  "setPersonalizationNotification:",  @"com.apple.uarp.BTLEServer.personalizationNeeded");
    v4 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSB),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryAirPodsCaseUSB vendorID]( &OBJC_CLASS___UARPSupportedAccessoryAirPodsCaseUSB,  "vendorID"),  +[UARPSupportedAccessoryA2968USB productID](&OBJC_CLASS___UARPSupportedAccessoryA2968USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA2968 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2968, "appleModelNumber");
}

+ (unsigned)productID
{
  return 5022;
}

- (void).cxx_destruct
{
}

@end