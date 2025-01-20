@interface NWRemoteConnectionWrapper
- (NSUUID)clientID;
- (NWConnection)connection;
- (void)setClientID:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation NWRemoteConnectionWrapper

- (NSUUID)clientID
{
  return (NSUUID *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setClientID:(id)a3
{
}

- (NWConnection)connection
{
  return (NWConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end