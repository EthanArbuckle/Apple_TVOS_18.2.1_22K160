@interface ACCTransportClientInfo
- (ACCTransportClientInfo)initWithXPCConnection:(id)a3;
- (NSMutableSet)connectionUUIDs;
- (void)setConnectionUUIDs:(id)a3;
@end

@implementation ACCTransportClientInfo

- (ACCTransportClientInfo)initWithXPCConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCTransportClientInfo;
  v3 = -[XPCConnectionInfo initWithXPCConnection:](&v7, "initWithXPCConnection:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    connectionUUIDs = v3->_connectionUUIDs;
    v3->_connectionUUIDs = v4;
  }

  return v3;
}

- (NSMutableSet)connectionUUIDs
{
  return self->_connectionUUIDs;
}

- (void)setConnectionUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end