@interface PairingNotification
- (PairingNotification)initWithType:(int)a3 passkey:(unint64_t)a4 device:(id)a5;
- (int)pairingType;
- (unint64_t)passkey;
- (void)setPairingType:(int)a3;
- (void)setPasskey:(unint64_t)a3;
@end

@implementation PairingNotification

- (PairingNotification)initWithType:(int)a3 passkey:(unint64_t)a4 device:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PairingNotification;
  result = -[UserNotification initWithType:device:bundleID:](&v8, "initWithType:device:bundleID:", 4LL, a5, 0LL);
  if (result)
  {
    result->_pairingType = a3;
    result->_passkey = a4;
  }

  return result;
}

- (int)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int)a3
{
  self->_pairingType = a3;
}

- (unint64_t)passkey
{
  return self->_passkey;
}

- (void)setPasskey:(unint64_t)a3
{
  self->_passkey = a3;
}

@end