@interface UARPSupportedAccessoryA2776
+ (id)appleModelNumber;
- (UARPSupportedAccessoryA2776)init;
@end

@implementation UARPSupportedAccessoryA2776

- (UARPSupportedAccessoryA2776)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryA2776;
  v2 = -[UARPSupportedAccessory init](&v7, sel_init);
  if (v2)
  {
    v3 = +[UARPSupportedAccessoryA2776 appleModelNumber](&OBJC_CLASS___UARPSupportedAccessoryA2776, "appleModelNumber");
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", @"Agnes");
    -[UARPSupportedAccessory setSupportsInternalSettings:](v2, "setSupportsInternalSettings:", 1LL);
    -[UARPSupportedAccessory addServiceBSDNotificationName:]( v2,  "addServiceBSDNotificationName:",  @"com.apple.accessoryUpdater.uarp.fwUpdateNow.");
    v4 = objc_alloc_init(&OBJC_CLASS___UARPAccessoryHardwareIIC);
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }

  return v2;
}

+ (id)appleModelNumber
{
  return @"A2776";
}

- (void).cxx_destruct
{
}

@end