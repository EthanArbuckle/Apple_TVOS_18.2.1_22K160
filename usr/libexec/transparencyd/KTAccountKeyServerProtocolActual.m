@interface KTAccountKeyServerProtocolActual
- (BOOL)verifyData:(id)a3 signature:(id)a4 accountPublicKeyInfo:(id)a5 error:(id *)a6;
- (KTAccountKeyServerProtocolActual)initWithSettings:(id)a3;
- (TransparencySettingsProtocol)settings;
- (id)accountKeyService:(id)a3;
- (id)copyCachedPCSIdentityForApplication:(id)a3;
- (void)clearCachedPCSIdentities;
- (void)setSettings:(id)a3;
@end

@implementation KTAccountKeyServerProtocolActual

- (KTAccountKeyServerProtocolActual)initWithSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KTAccountKeyServerProtocolActual;
  v5 = -[KTAccountKeyServerProtocolActual init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[KTAccountKeyServerProtocolActual setSettings:](v5, "setSettings:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)accountKeyService:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServerProtocolActual settings](self, "settings"));
  unsigned int v6 = [v5 allowsInternalSecurityPolicies];

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServerProtocolActual settings](self, "settings")),
        unsigned __int8 v8 = [v7 getBool:@"noAccountKey"],
        v7,
        (v8 & 1) != 0))
  {
    objc_super v9 = 0LL;
  }

  else
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[KTAccountKeyServer sharedKeyServiceForApplication:]( &OBJC_CLASS___KTAccountKeyServer,  "sharedKeyServiceForApplication:",  v4));
  }

  return v9;
}

- (BOOL)verifyData:(id)a3 signature:(id)a4 accountPublicKeyInfo:(id)a5 error:(id *)a6
{
  return +[KTAccountKeyServer verifyData:signature:accountPublicKeyInfo:error:]( &OBJC_CLASS___KTAccountKeyServer,  "verifyData:signature:accountPublicKeyInfo:error:",  a3,  a4,  a5,  a6);
}

- (void)clearCachedPCSIdentities
{
}

- (id)copyCachedPCSIdentityForApplication:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServerProtocolActual accountKeyService:](self, "accountKeyService:", a3));
  id v4 = [v3 copyCachedPCSIdentity];

  return v4;
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end