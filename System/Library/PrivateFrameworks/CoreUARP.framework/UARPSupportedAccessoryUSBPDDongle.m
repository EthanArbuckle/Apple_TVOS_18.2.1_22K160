@interface UARPSupportedAccessoryUSBPDDongle
+ (int64_t)deviceClass;
- (UARPSupportedAccessoryUSBPDDongle)init;
@end

@implementation UARPSupportedAccessoryUSBPDDongle

- (UARPSupportedAccessoryUSBPDDongle)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryUSBPDDongle;
  return -[UARPSupportedAccessoryUSBPD init](&v3, sel_init);
}

+ (int64_t)deviceClass
{
  return 2LL;
}

@end