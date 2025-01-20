@interface TKTokenConnection
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMapTable)sessions;
- (NSXPCListener)listener;
- (TKToken)token;
- (TKTokenConnection)initWithToken:(id)a3;
- (id)initialKeepAlive;
- (void)dealloc;
- (void)invalidate;
- (void)setInitialKeepAlive:(id)a3;
@end

@implementation TKTokenConnection

- (TKTokenConnection)initWithToken:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TKTokenConnection;
  v6 = -[TKTokenConnection init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, a3);
    uint64_t v8 = [MEMORY[0x189607920] strongToWeakObjectsMapTable];
    sessions = v7->_sessions;
    v7->_sessions = (NSMapTable *)v8;
    v10 = -[TKTokenConnection token](v7, "token");
    [v10 tokenDriver];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 keepAlive];
    id initialKeepAlive = v7->_initialKeepAlive;
    v7->_id initialKeepAlive = (id)v12;

    uint64_t v14 = [MEMORY[0x189607B50] anonymousListener];
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v14;

    -[NSXPCListener setDelegate:](v7->_listener, "setDelegate:", v7);
    -[NSXPCListener resume](v7->_listener, "resume");
  }

  return v7;
}

- (void)invalidate
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = (void *)MEMORY[0x189607B48];
  id v6 = a4;
  [v5 interfaceWithProtocol:&unk_18C6B55E0];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setExportedInterface:v7];

  uint64_t v8 = -[TKTokenSessionConnection initWithTokenConnection:]( objc_alloc(&OBJC_CLASS___TKTokenSessionConnection),  "initWithTokenConnection:",  self);
  [v6 setExportedObject:v8];

  [v6 resume];
  return 1;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 terminate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TKTokenConnection;
  -[TKTokenConnection dealloc](&v4, sel_dealloc);
}

- (TKToken)token
{
  return self->_token;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSMapTable)sessions
{
  return self->_sessions;
}

- (id)initialKeepAlive
{
  return self->_initialKeepAlive;
}

- (void)setInitialKeepAlive:(id)a3
{
}

- (void).cxx_destruct
{
}

@end