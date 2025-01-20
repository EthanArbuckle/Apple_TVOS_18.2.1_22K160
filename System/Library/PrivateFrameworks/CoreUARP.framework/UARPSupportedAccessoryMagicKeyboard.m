@interface UARPSupportedAccessoryMagicKeyboard
- (UARPSupportedAccessoryMagicKeyboard)init;
@end

@implementation UARPSupportedAccessoryMagicKeyboard

- (UARPSupportedAccessoryMagicKeyboard)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___UARPSupportedAccessoryMagicKeyboard;
  v2 = -[UARPSupportedAccessoryHID init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    -[UARPSupportedAccessory setUploaderResponseTimeout:](v2, "setUploaderResponseTimeout:", 5000LL);
  }
  return v3;
}

@end