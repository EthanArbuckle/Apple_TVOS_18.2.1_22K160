@interface UARPSupportedAccessoryUSBPDPowerAdapter
+ (int64_t)deviceClass;
- (UARPSupportedAccessoryUSBPDPowerAdapter)init;
@end

@implementation UARPSupportedAccessoryUSBPDPowerAdapter

- (UARPSupportedAccessoryUSBPDPowerAdapter)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryUSBPDPowerAdapter;
  v2 = -[UARPSupportedAccessoryUSBPD init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory addServiceBSDNotificationName:]( v2,  "addServiceBSDNotificationName:",  @"com.apple.system.powermanagement.poweradapter");
    -[UARPSupportedAccessory setCapabilities:](v3, "setCapabilities:", 1LL);
  }

  return v3;
}

+ (int64_t)deviceClass
{
  return 1LL;
}

@end