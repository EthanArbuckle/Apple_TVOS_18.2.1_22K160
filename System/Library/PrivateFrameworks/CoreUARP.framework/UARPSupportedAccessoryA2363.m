@interface UARPSupportedAccessoryA2363
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2363)init;
@end

@implementation UARPSupportedAccessoryA2363

- (UARPSupportedAccessoryA2363)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2363;
  v2 = -[UARPSupportedAccessoryUSBPDMagSafe init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2363 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2363, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"MagSafe Charge Cable");
    -[UARPSupportedAccessory setSupportsLogs:](v2, "setSupportsLogs:", 1LL);
    -[UARPSupportedAccessory setSupportsAnalytics:](v2, "setSupportsAnalytics:", 1LL);
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareUSBPD),  "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:",  +[UARPSupportedAccessoryUSBPD vendorID](&OBJC_CLASS___UARPSupportedAccessoryUSBPD, "vendorID"),  +[UARPSupportedAccessoryA2363 productID](&OBJC_CLASS___UARPSupportedAccessoryA2363, "productID"),  +[UARPSupportedAccessoryUSBPDMagSafe deviceClass]( &OBJC_CLASS___UARPSupportedAccessoryUSBPDMagSafe,  "deviceClass"),  +[UARPSupportedAccessoryUSBPDMagSafe locationType]( &OBJC_CLASS___UARPSupportedAccessoryUSBPDMagSafe,  "locationType"),  -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2363";
}

+ (unsigned)productID
{
  return 30720;
}

- (void).cxx_destruct
{
}

@end