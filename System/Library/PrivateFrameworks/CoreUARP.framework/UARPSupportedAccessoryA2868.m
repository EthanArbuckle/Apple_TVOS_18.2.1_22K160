@interface UARPSupportedAccessoryA2868
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2868)init;
@end

@implementation UARPSupportedAccessoryA2868

- (UARPSupportedAccessoryA2868)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2868;
  v2 = -[UARPSupportedAccessoryUSBPDDongle init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2868 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2868, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Lightning to USB-C Adapter");
    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v2, "setUpdateRequiresPowerAssertion:", 1LL);
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSBPD),  "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:",  +[UARPSupportedAccessoryUSBPD vendorID](&OBJC_CLASS___UARPSupportedAccessoryUSBPD, "vendorID"),  +[UARPSupportedAccessoryA2868 productID](&OBJC_CLASS___UARPSupportedAccessoryA2868, "productID"),  +[UARPSupportedAccessoryUSBPDDongle deviceClass]( &OBJC_CLASS___UARPSupportedAccessoryUSBPDDongle,  "deviceClass"),  +[UARPSupportedAccessoryUSBPD locationType](&OBJC_CLASS___UARPSupportedAccessoryUSBPD, "locationType"),  -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2868";
}

+ (unsigned)productID
{
  return 5904;
}

- (void).cxx_destruct
{
}

@end