@interface SASBoardServicesConfiguration
+ (id)configuration;
+ (id)new;
- (NSString)machServiceIdentifier;
- (NSString)presentationDomain;
- (NSString)presentationIdentifier;
- (NSString)signalDomain;
- (NSString)signalIdentifier;
- (SASBoardServicesConfiguration)init;
- (id)_init;
- (id)domainForService:(int64_t)a3;
- (id)identifierForService:(int64_t)a3;
- (void)setMachServiceIdentifier:(id)a3;
- (void)setPresentationDomain:(id)a3;
- (void)setPresentationIdentifier:(id)a3;
- (void)setSignalDomain:(id)a3;
- (void)setSignalIdentifier:(id)a3;
@end

@implementation SASBoardServicesConfiguration

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SASBoardServicesConfiguration;
  v2 = -[SASBoardServicesConfiguration init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[SASBoardServicesConfiguration setMachServiceIdentifier:]( v2,  "setMachServiceIdentifier:",  @"com.apple.siri.activation.service");
    -[SASBoardServicesConfiguration setPresentationDomain:]( v3,  "setPresentationDomain:",  @"com.apple.siri.activation");
    -[SASBoardServicesConfiguration setPresentationIdentifier:]( v3,  "setPresentationIdentifier:",  @"com.apple.siri.activation.presentation");
    -[SASBoardServicesConfiguration setSignalDomain:](v3, "setSignalDomain:", @"com.apple.siri.activation");
    -[SASBoardServicesConfiguration setSignalIdentifier:]( v3,  "setSignalIdentifier:",  @"com.apple.siri.activation.signal");
  }

  return v3;
}

- (SASBoardServicesConfiguration)init
{
  return 0LL;
}

+ (id)new
{
  return 0LL;
}

+ (id)configuration
{
  if (qword_1000D9B40 != -1) {
    dispatch_once(&qword_1000D9B40, &stru_1000BB0A0);
  }
  return (id)qword_1000D9B38;
}

- (id)domainForService:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SASBoardServicesConfiguration signalDomain](self, "signalDomain"));
    goto LABEL_5;
  }

  if (!a3)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SASBoardServicesConfiguration presentationDomain](self, "presentationDomain"));
LABEL_5:
    a2 = v3;
  }

  return (id)(id)a2;
}

- (id)identifierForService:(int64_t)a3
{
  if (a3 == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SASBoardServicesConfiguration signalIdentifier](self, "signalIdentifier"));
    goto LABEL_5;
  }

  if (!a3)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SASBoardServicesConfiguration presentationIdentifier](self, "presentationIdentifier"));
LABEL_5:
    a2 = v3;
  }

  return (id)(id)a2;
}

- (NSString)machServiceIdentifier
{
  return self->_machServiceIdentifier;
}

- (void)setMachServiceIdentifier:(id)a3
{
}

- (NSString)presentationDomain
{
  return self->_presentationDomain;
}

- (void)setPresentationDomain:(id)a3
{
}

- (NSString)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void)setPresentationIdentifier:(id)a3
{
}

- (NSString)signalDomain
{
  return self->_signalDomain;
}

- (void)setSignalDomain:(id)a3
{
}

- (NSString)signalIdentifier
{
  return self->_signalIdentifier;
}

- (void)setSignalIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end