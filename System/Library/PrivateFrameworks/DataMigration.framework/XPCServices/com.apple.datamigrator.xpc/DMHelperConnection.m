@interface DMHelperConnection
- (DMHelperConnection)init;
- (DMXPCConnection)connection;
- (void)invalidate;
- (void)panicWithMessage:(id)a3;
- (void)performLoggingWork;
- (void)reboot;
- (void)resume;
- (void)setConnection:(id)a3;
@end

@implementation DMHelperConnection

- (DMHelperConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DMHelperConnection;
  v2 = -[DMHelperConnection init](&v5, "init");
  if (v2)
  {
    v3 = -[DMXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___DMXPCConnection),  "initWithServiceName:",  @"com.apple.datamigratorhelper");
    -[DMHelperConnection setConnection:](v2, "setConnection:", v3);
  }

  return v2;
}

- (void)resume
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DMHelperConnection connection](self, "connection"));
  [v2 resume];
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DMHelperConnection connection](self, "connection"));
  [v2 invalidate];
}

- (void)panicWithMessage:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(xdict, "eventID", 1LL);
  id v5 = v4;
  v6 = (const char *)[v5 UTF8String];

  xpc_dictionary_set_string(xdict, "message", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMHelperConnection connection](self, "connection"));
  id v8 = [v7 sendMessageSync:xdict];
}

- (void)reboot
{
  id v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v5, "eventID", 2LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMHelperConnection connection](self, "connection"));
  id v4 = [v3 sendMessageSync:v5];
}

- (void)performLoggingWork
{
  id v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v5, "eventID", 3LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMHelperConnection connection](self, "connection"));
  id v4 = [v3 sendMessageSync:v5];
}

- (DMXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end