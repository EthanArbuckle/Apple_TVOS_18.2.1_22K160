@interface MAPushNotificationClient
- (MAPushNotificationClient)initWithConnection:(id)a3;
- (NSString)name;
- (NSString)path;
- (NSXPCConnection)connection;
- (id)description;
- (int)pid;
- (unsigned)uid;
- (void)didReceivePushNotificationWithInfo:(id)a3;
- (void)setConnection:(id)a3;
- (void)setName:(id)a3;
- (void)setPath:(id)a3;
- (void)setPid:(int)a3;
- (void)setUid:(unsigned int)a3;
@end

@implementation MAPushNotificationClient

- (MAPushNotificationClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MAPushNotificationClient;
  v6 = -[MAPushNotificationClient init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_pid = [v5 processIdentifier];
    v7->_uid = [v5 effectiveUserIdentifier];
    if (proc_name(v7->_pid, v15, 0xFFu) >= 1)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
      name = v7->_name;
      v7->_name = (NSString *)v8;
    }

    if (proc_pidpath(v7->_pid, buffer, 0x1000u) >= 1)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
      path = v7->_path;
      v7->_path = (NSString *)v10;
    }
  }

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationClient name](self, "name"));
  uint64_t v4 = -[MAPushNotificationClient pid](self, "pid");
  uint64_t v5 = -[MAPushNotificationClient uid](self, "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationClient path](self, "path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationClient connection](self, "connection"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObjectInterface]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationClient connection](self, "connection"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 exportedInterface]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushNotificationClient connection](self, "connection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteObjectProxy]);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (pid = %d, uid = %d, path = %@, connection remote object interface = %@, exported interface = %@, remote object proxy = %@)",  v3,  v4,  v5,  v6,  v8,  v10,  v12));

  return v13;
}

- (void)didReceivePushNotificationWithInfo:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MAPushNotificationClient connection](self, "connection"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_26]);
  [v5 didReceivePushNotificationWithInfo:v4];
}

void __63__MAPushNotificationClient_didReceivePushNotificationWithInfo___block_invoke(id a1, NSError *a2)
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPath:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void).cxx_destruct
{
}

@end