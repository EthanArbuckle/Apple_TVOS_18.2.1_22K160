@interface RPWirelessPairingSession
- (BOOL)invalidated;
- (RPWirelessPairingSession)initWithUnderlyingObject:(id)a3;
- (RPWirelessPairingSession_Internal)underlyingObject;
- (void)endSession;
- (void)registerInvalidationHandlerOnQueue:(id)a3 handler:(id)a4;
@end

@implementation RPWirelessPairingSession

- (RPWirelessPairingSession)initWithUnderlyingObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPWirelessPairingSession;
  v6 = -[RPWirelessPairingSession init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingObject, a3);
  }

  return v7;
}

- (void)registerInvalidationHandlerOnQueue:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[RPWirelessPairingSession underlyingObject](self, "underlyingObject");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 registerInvalidationHandlerWithInvokingOnQueue:v7 handler:v6];
}

- (void)endSession
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 endSession];
}

- (BOOL)invalidated
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 invalidated];

  return v3;
}

- (RPWirelessPairingSession_Internal)underlyingObject
{
  return self->_underlyingObject;
}

- (void).cxx_destruct
{
}

@end