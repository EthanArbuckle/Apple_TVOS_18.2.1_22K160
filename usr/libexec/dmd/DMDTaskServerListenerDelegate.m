@interface DMDTaskServerListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CATTaskServer)taskServer;
- (DMDTaskServerListenerDelegate)initWithTaskServer:(id)a3;
@end

@implementation DMDTaskServerListenerDelegate

- (DMDTaskServerListenerDelegate)initWithTaskServer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DMDTaskServerListenerDelegate;
  v6 = -[DMDTaskServerListenerDelegate init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taskServer, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.dmd-access"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && [v6 BOOLValue])
  {
    id v8 = [[CATXPCTransport alloc] initWithXPCConnection:v5];
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerListenerDelegate taskServer](self, "taskServer"));
    [v9 connectWithClientTransport:v8];

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (CATTaskServer)taskServer
{
  return self->_taskServer;
}

- (void).cxx_destruct
{
}

@end