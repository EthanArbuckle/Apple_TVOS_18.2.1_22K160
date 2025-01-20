@interface SOSClientRemote
- (BOOL)checkEntitlement:(id)a3;
- (NSXPCConnection)connection;
- (id)initSOSConnectionWithConnection:(id)a3 account:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation SOSClientRemote

- (id)initSOSConnectionWithConnection:(id)a3 account:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SOSClientRemote;
  id v7 = -[SOSClient initSOSClientWithAccount:](&v10, "initSOSClientWithAccount:", a4);
  v8 = v7;
  if (v7) {
    [v7 setConnection:v6];
  }

  return v8;
}

- (BOOL)checkEntitlement:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained valueForEntitlement:v4]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v6, v7) & 1) != 0 && ([v6 BOOLValue])
  {
    BOOL v8 = 1;
  }

  else
  {
    v9 = sub_10001267C("SecError");
    objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109378;
      v12[1] = [WeakRetained processIdentifier];
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "sos: Client pid: %d doesn't have entitlement: %@",  (uint8_t *)v12,  0x12u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end