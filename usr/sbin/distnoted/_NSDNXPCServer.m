@interface _NSDNXPCServer
- (NSString)serviceName;
- (_NSDNXPCServer)initWithConfiguration:(distnoted_configuration *)a3;
- (id)__invalidate;
- (id)allClients;
- (id)createEndpoint;
- (id)makeNewClient;
- (void)addInvalidationHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setMakeNewClient:(id)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)setServiceName:(id)a3;
- (void)start:(id)a3;
@end

@implementation _NSDNXPCServer

- (_NSDNXPCServer)initWithConfiguration:(distnoted_configuration *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSDNXPCServer;
  v3 = -[_NSDNXPCServer init](&v6, "init", a3);
  v3->_invalidHandlers = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v3->_clients = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v4 = v3;
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSDNXPCServer;
  -[_NSDNXPCServer dealloc](&v3, "dealloc");
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  if (self->_started)
  {
    objc_super v3 = @"Error: Service name set but already started. Ignoring.";
LABEL_5:
    CFLog(3LL, v3);
    return;
  }

  if (self->_invalid)
  {
    objc_super v3 = @"Error: Service name set but connection is invalid. Ignoring.";
    goto LABEL_5;
  }

  v5 = (NSString *)[a3 copy];
  serviceName = self->_serviceName;
  self->_serviceName = v5;
}

- (id)makeNewClient
{
  return self->_makeNewClient;
}

- (void)setMakeNewClient:(id)a3
{
  if (self->_started)
  {
    objc_super v3 = @"Error: Setting new client handler set but already started. Ignoring.";
LABEL_5:
    CFLog(3LL, v3);
    return;
  }

  if (self->_invalid)
  {
    objc_super v3 = @"Error: Setting new client handler set but connection is invalid. Ignoring.";
    goto LABEL_5;
  }

  id v5 = [a3 copy];
  id makeNewClient = self->_makeNewClient;
  self->_id makeNewClient = v5;
}

- (void)setPrivileged:(BOOL)a3
{
  self->_priv = a3;
}

- (id)__invalidate
{
  id makeNewClient = self->_makeNewClient;
  self->_id makeNewClient = 0LL;
  invalidHandlers = self->_invalidHandlers;
  self->_invalidHandlers = 0LL;

  return invalidHandlers;
}

- (void)invalidate
{
  int invalid = self->_invalid;
  self->_int invalid = invalid + 1;
  if (invalid) {
    goto LABEL_4;
  }
  if (self->_conn)
  {
    xpc_connection_cancel(self->_conn);
LABEL_4:
    id v3 = 0LL;
    goto LABEL_5;
  }

  id v3 = -[_NSDNXPCServer __invalidate](self, "__invalidate");
LABEL_5:
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8LL * (void)i) + 16LL))();
      }

      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (void)addInvalidationHandler:(id)a3
{
  id v5 = [a3 copy];
  invalidHandlers = self->_invalidHandlers;
  id v7 = v5;
  -[NSMutableArray addObject:](invalidHandlers, "addObject:");
  if (!invalidHandlers) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)start:(id)a3
{
  if (!self->_invalid)
  {
    if (self->_makeNewClient)
    {
      int started = self->_started;
      self->_int started = started + 1;
      if (!started)
      {
        serviceName = (const __CFString *)self->_serviceName;
        if (serviceName)
        {
          maxBufLen[0] = 0LL;
          v11.length = CFStringGetLength(serviceName);
          v11.location = 0LL;
          CFStringGetBytes(serviceName, v11, 0x8000100u, 0, 0, 0LL, 0LL, maxBufLen);
          id v7 = (UInt8 *)malloc(maxBufLen[0] + 1);
          v12.length = CFStringGetLength(serviceName);
          v12.location = 0LL;
          CFStringGetBytes(serviceName, v12, 0x8000100u, 0, 0, v7, maxBufLen[0], 0LL);
          v7[maxBufLen[0]] = 0;
          if (self->_priv) {
            uint64_t v8 = 3LL;
          }
          else {
            uint64_t v8 = 1LL;
          }
          mach_service = xpc_connection_create_mach_service((const char *)v7, (dispatch_queue_t)a3, v8);
        }

        else
        {
          mach_service = xpc_connection_create(0LL, (dispatch_queue_t)a3);
          id v7 = 0LL;
        }

        self->_conn = mach_service;
        maxBufLen[0] = (CFIndex)_NSConcreteStackBlock;
        maxBufLen[1] = 3221225472LL;
        maxBufLen[2] = (CFIndex)sub_100003FF4;
        maxBufLen[3] = (CFIndex)&unk_100008540;
        maxBufLen[4] = (CFIndex)self;
        maxBufLen[5] = (CFIndex)a3;
        xpc_connection_set_event_handler(mach_service, maxBufLen);
        xpc_connection_activate(self->_conn);
        if (serviceName) {
          free(v7);
        }
      }
    }

    else
    {
      CFLog(3LL, @"Error: Starting before make new client is set");
    }
  }

- (id)allClients
{
  return -[NSMutableArray copy](self->_clients, "copy");
}

- (id)createEndpoint
{
  if (self->_serviceName) {
    return 0LL;
  }
  else {
    return xpc_endpoint_create(self->_conn);
  }
}

@end