@interface UARPSupportedAccessoryA2676
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2676)init;
@end

@implementation UARPSupportedAccessoryA2676

- (UARPSupportedAccessoryA2676)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2676;
  v2 = -[UARPSupportedAccessoryUSBPDPowerAdapter init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2676 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2676, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Power Adapter");
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSBPD),  "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:",  +[UARPSupportedAccessoryUSBPD vendorID](&OBJC_CLASS___UARPSupportedAccessoryUSBPD, "vendorID"),  +[UARPSupportedAccessoryA2676 productID](&OBJC_CLASS___UARPSupportedAccessoryA2676, "productID"),  +[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass]( &OBJC_CLASS___UARPSupportedAccessoryUSBPDPowerAdapter,  "deviceClass"),  +[UARPSupportedAccessoryUSBPD locationType](&OBJC_CLASS___UARPSupportedAccessoryUSBPD, "locationType"),  -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2676";
}

+ (unsigned)productID
{
  return 28699;
}

- (void).cxx_destruct
{
}

@end