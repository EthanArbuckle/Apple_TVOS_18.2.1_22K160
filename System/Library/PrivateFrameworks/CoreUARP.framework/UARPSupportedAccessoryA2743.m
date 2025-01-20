@interface UARPSupportedAccessoryA2743
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2743)init;
@end

@implementation UARPSupportedAccessoryA2743

- (UARPSupportedAccessoryA2743)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2743;
  v2 = -[UARPSupportedAccessoryUSBPDPowerAdapter init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2743 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2743, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Power Adapter");
    -[UARPSupportedAccessory setSupportsAnalytics:](v2, "setSupportsAnalytics:", 1LL);
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSBPD),  "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:",  +[UARPSupportedAccessoryUSBPD vendorID](&OBJC_CLASS___UARPSupportedAccessoryUSBPD, "vendorID"),  +[UARPSupportedAccessoryA2743 productID](&OBJC_CLASS___UARPSupportedAccessoryA2743, "productID"),  +[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass]( &OBJC_CLASS___UARPSupportedAccessoryUSBPDPowerAdapter,  "deviceClass"),  +[UARPSupportedAccessoryUSBPD locationType](&OBJC_CLASS___UARPSupportedAccessoryUSBPD, "locationType"),  -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2743";
}

+ (unsigned)productID
{
  return 28700;
}

- (void).cxx_destruct
{
}

@end