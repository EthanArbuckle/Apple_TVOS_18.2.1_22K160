@interface UARPSupportedAccessoryUSBPDMagSafe
+ (int64_t)deviceClass;
+ (int64_t)locationType;
- (UARPSupportedAccessoryUSBPDMagSafe)init;
@end

@implementation UARPSupportedAccessoryUSBPDMagSafe

- (UARPSupportedAccessoryUSBPDMagSafe)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryUSBPDMagSafe;
  return -[UARPSupportedAccessoryUSBPD init](&v3, sel_init);
}

+ (int64_t)deviceClass
{
  return 0LL;
}

+ (int64_t)locationType
{
  return 1LL;
}

@end