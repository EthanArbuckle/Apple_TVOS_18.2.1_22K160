@interface TKSmartCardSessionRequest
- (NSDictionary)parameters;
- (NSXPCConnection)connection;
- (id)reply;
- (void)setConnection:(id)a3;
- (void)setParameters:(id)a3;
- (void)setReply:(id)a3;
@end

@implementation TKSmartCardSessionRequest

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setParameters:(id)a3
{
}

- (id)reply
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setReply:(id)a3
{
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