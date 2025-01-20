@interface UARPAccessoryHardwareIIC
- (UARPAccessoryHardwareIIC)init;
- (id)description;
@end

@implementation UARPAccessoryHardwareIIC

- (UARPAccessoryHardwareIIC)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPAccessoryHardwareIIC;
  return -[UARPAccessoryHardwareID initWithTransport:](&v3, sel_initWithTransport_, 10LL);
}

- (id)description
{
  return @"IIC";
}

@end