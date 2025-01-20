@interface SBDDomainServiceHandler
- (SBCPlaybackPositionDomain)domain;
- (SBDDomainServiceHandler)init;
- (SBDDomainServiceHandler)initWithDomain:(id)a3;
@end

@implementation SBDDomainServiceHandler

- (SBDDomainServiceHandler)initWithDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SBDDomainServiceHandler;
  v6 = -[SBDDomainServiceHandler init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_domain, a3);
  }

  return v7;
}

- (SBDDomainServiceHandler)init
{
  return -[SBDDomainServiceHandler initWithDomain:](self, "initWithDomain:", 0LL);
}

- (SBCPlaybackPositionDomain)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
}

@end