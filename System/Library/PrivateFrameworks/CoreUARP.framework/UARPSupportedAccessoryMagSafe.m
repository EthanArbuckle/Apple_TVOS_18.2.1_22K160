@interface UARPSupportedAccessoryMagSafe
- (UARPSupportedAccessoryMagSafe)init;
@end

@implementation UARPSupportedAccessoryMagSafe

- (UARPSupportedAccessoryMagSafe)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryMagSafe;
  v2 = -[UARPSupportedAccessoryHID init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setSupportsPowerLogging:](v2, "setSupportsPowerLogging:", 1LL);
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1LL);
    -[UARPSupportedAccessory setCapabilities:](v3, "setCapabilities:", 1LL);
    -[UARPSupportedAccessory setPostStagingNotifications:](v3, "setPostStagingNotifications:", 1LL);
  }

  return v3;
}

@end