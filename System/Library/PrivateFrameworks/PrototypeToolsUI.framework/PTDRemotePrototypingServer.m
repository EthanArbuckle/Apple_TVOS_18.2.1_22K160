@interface PTDRemotePrototypingServer
- (BOOL)isEnabled;
- (PTDRemotePrototypingServer)initWithDomainServer:(id)a3 queue:(id)a4;
- (PTDomainServer)domainServer;
@end

@implementation PTDRemotePrototypingServer

- (PTDRemotePrototypingServer)initWithDomainServer:(id)a3 queue:(id)a4
{
  return 0LL;
}

- (BOOL)isEnabled
{
  return 0;
}

- (PTDomainServer)domainServer
{
  return self->_domainServer;
}

- (void).cxx_destruct
{
}

@end