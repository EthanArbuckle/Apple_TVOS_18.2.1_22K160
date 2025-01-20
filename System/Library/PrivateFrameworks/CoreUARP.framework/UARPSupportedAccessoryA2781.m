@interface UARPSupportedAccessoryA2781
+ (id)appleModelNumber;
+ (unsigned)productID;
- (UARPSupportedAccessoryA2781)init;
@end

@implementation UARPSupportedAccessoryA2781

- (UARPSupportedAccessoryA2781)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2781;
  v2 = -[UARPSupportedAccessoryMagSafe init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2781 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2781, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Apple Vision Pro Battery");
    -[UARPSupportedAccessory setSupportsAnalytics:](v2, "setSupportsAnalytics:", 1LL);
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]( objc_alloc(&OBJC_CLASS___UARPAccessoryHardwareHID),  "initWithVendorID:productID:",  +[UARPSupportedAccessoryHID vendorID](&OBJC_CLASS___UARPSupportedAccessoryHID, "vendorID"),  +[UARPSupportedAccessoryA2781 productID](&OBJC_CLASS___UARPSupportedAccessoryA2781, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2781";
}

+ (unsigned)productID
{
  return 30723;
}

- (void).cxx_destruct
{
}

@end