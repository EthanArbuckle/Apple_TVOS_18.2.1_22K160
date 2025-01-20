@interface SecSOSStatus
- (NSXPCConnection)connection;
- (SecSOSStatus)init;
- (void)setConnection:(id)a3;
@end

@implementation SecSOSStatus

- (SecSOSStatus)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SecSOSStatus;
  v2 = -[SecSOSStatus init](&v9, sel_init);
  if (v2)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C541330];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _SOSControlSetupInterface(v3);
    v4 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.securityd.sos" options:0];
    -[SecSOSStatus setConnection:](v2, "setConnection:", v4);

    -[SecSOSStatus connection](v2, "connection");
    v5 = (SecSOSStatus *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[SecSOSStatus connection](v2, "connection");
      [v6 setRemoteObjectInterface:v3];
      v7 = -[SecSOSStatus connection](v2, "connection");
      [v7 resume];

      v5 = v2;
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end