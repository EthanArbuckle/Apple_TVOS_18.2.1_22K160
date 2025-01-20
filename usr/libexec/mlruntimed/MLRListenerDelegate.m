@interface MLRListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MLRListenerDelegate)initWithXPCActivityManager:(id)a3;
@end

@implementation MLRListenerDelegate

- (MLRListenerDelegate)initWithXPCActivityManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___MLRListenerDelegate;
    v6 = -[MLRListenerDelegate init](&v10, "init");
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_XPCActivityManager, a3);
    }
    self = v7;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  XPCActivityManager = self->_XPCActivityManager;
  id v5 = a4;
  -[MLRXPCActivityManager registerIfNeeded](XPCActivityManager, "registerIfNeeded");
  v6 = -[MLRServiceConnection initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___MLRServiceConnection),  "initWithXPCConnection:",  v5);
  uint64_t XPCInterface = DESServiceGetXPCInterface(1LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
  [v5 setExportedInterface:v8];

  [v5 setExportedObject:v6];
  [v5 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end