@interface UARPSupportedAccessoryA2388
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2388)init;
@end

@implementation UARPSupportedAccessoryA2388

- (UARPSupportedAccessoryA2388)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2388;
  v2 = -[UARPSupportedAccessoryUSBPDPowerAdapterLegacy init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2388 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2388, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Power Adapter (Legacy)");
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSBPD),  "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:",  +[UARPSupportedAccessoryUSBPD vendorID](&OBJC_CLASS___UARPSupportedAccessoryUSBPD, "vendorID"),  +[UARPSupportedAccessoryA2388 productID](&OBJC_CLASS___UARPSupportedAccessoryA2388, "productID"),  +[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass]( &OBJC_CLASS___UARPSupportedAccessoryUSBPDPowerAdapterLegacy,  "deviceClass"),  +[UARPSupportedAccessoryUSBPD locationType](&OBJC_CLASS___UARPSupportedAccessoryUSBPD, "locationType"),  -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2388";
}

+ (unsigned)productID
{
  return 28696;
}

- (void).cxx_destruct
{
}

@end