@interface SKAuthenticationRequestEvent
- (SKAuthenticationRequestEvent)initWithPasswordType:(int)a3 pairingFlags:(unsigned int)a4 throttleSeconds:(int)a5;
- (id)descriptionWithLevel:(int)a3;
- (int)passwordType;
- (int)throttleSeconds;
- (unsigned)pairingFlags;
@end

@implementation SKAuthenticationRequestEvent

- (SKAuthenticationRequestEvent)initWithPasswordType:(int)a3 pairingFlags:(unsigned int)a4 throttleSeconds:(int)a5
{
  v8 = -[SKEvent initWithEventType:](self, "initWithEventType:", 120LL);
  v9 = v8;
  if (v8)
  {
    v8->_passwordType = a3;
    v8->_pairingFlags = a4;
    v8->_throttleSeconds = a5;
    v10 = v8;
  }

  return v9;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0LL;
  }

  else
  {
    [(id)objc_opt_class() description];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    id v4 = 0LL;
  }

  CUAppendF();
  v5 = (__CFString *)v4;

  if (self->_pairingFlags)
  {
    CUPrintFlags32();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v6 = v5;

    v5 = v6;
  }

  if (self->_throttleSeconds >= 1)
  {
    CUAppendF();
    v7 = v5;

    v5 = v7;
  }

  v8 = &stru_18A2823D0;
  if (v5) {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

- (unsigned)pairingFlags
{
  return self->_pairingFlags;
}

- (int)passwordType
{
  return self->_passwordType;
}

- (int)throttleSeconds
{
  return self->_throttleSeconds;
}

@end