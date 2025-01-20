@interface SKCaptiveContext
- (SKSetupCaptiveNetworkJoinServer)server;
- (id)responseHandler;
- (void)setResponseHandler:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation SKCaptiveContext

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (SKSetupCaptiveNetworkJoinServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end