@interface DIController2IO_XPCHandlerBase
- (DIBaseParams)params;
- (DIController2IO_XPCHandlerBase)initWithParams:(id)a3;
- (id)remoteObjectInterface;
- (id)serviceName;
- (void)setConnectionMode;
@end

@implementation DIController2IO_XPCHandlerBase

- (DIController2IO_XPCHandlerBase)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIController2IO_XPCHandlerBase;
  v6 = -[DIBaseXPCHandler init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_params, a3);
    -[DIBaseXPCHandler setIsPrivileged:](v7, "setIsPrivileged:", 1LL);
  }

  return v7;
}

- (id)serviceName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerBase params](self, "params"));
  unsigned __int8 v4 = [v3 requiresRootDaemon];

  if ((v4 & 1) != 0) {
    return @"com.apple.diskimagesiod.spb";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerBase params](self, "params"));
  unsigned int v7 = [v6 RAMdisk];

  if (v7) {
    return @"com.apple.diskimagesiod.ram";
  }
  else {
    return @"com.apple.diskimagesiod";
  }
}

- (void)setConnectionMode
{
  int v3 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v15 = 0LL;
    uint64_t v4 = sub_1000BE278();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v6 = 3LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v17 = 51;
    __int16 v18 = 2080;
    v19 = "-[DIController2IO_XPCHandlerBase setConnectionMode]";
    LODWORD(v14) = 18;
    unsigned int v7 = (char *)_os_log_send_and_compose_impl( v6,  &v15,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "%.*s: Setting oneshot XPC instance",  (int)buf,  v14);

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }

  else
  {
    uint64_t v8 = sub_1000BE278();
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v17 = 51;
      __int16 v18 = 2080;
      v19 = "-[DIController2IO_XPCHandlerBase setConnectionMode]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%.*s: Setting oneshot XPC instance",  buf,  0x12u);
    }
  }

  *__error() = v3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _xpcConnection]);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIController2IO_XPCHandlerBase params](self, "params"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 instanceID]);
  [v13 getUUIDBytes:buf];

  xpc_connection_set_oneshot_instance(v11, buf);
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DIIODaemonProtocol);
}

- (DIBaseParams)params
{
  return self->_params;
}

- (void).cxx_destruct
{
}

@end