@interface AKOwnerProxyClient
- (AKOwnerProxyClient)initWithCredentialRequest:(id)a3;
- (AKOwnerProxyClient)initWithCredentialRequest:(id)a3 connection:(id)a4;
- (BOOL)hasInternalAccess;
- (BOOL)hasOwnerAccess;
- (BOOL)hasPrivateAccess;
- (BOOL)hasPrivateSignedAccess;
- (BOOL)hasPublicAccess;
- (BOOL)hasWriteAccess;
- (id)appID;
- (id)bundleID;
- (id)description;
- (id)localizedAppName;
- (id)name;
- (id)teamID;
@end

@implementation AKOwnerProxyClient

- (AKOwnerProxyClient)initWithCredentialRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKOwnerProxyClient;
  v6 = -[AKClient initWithConnection:](&v9, "initWithConnection:", 0LL);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_credentialRequest, a3);
  }

  return v7;
}

- (AKOwnerProxyClient)initWithCredentialRequest:(id)a3 connection:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___AKOwnerProxyClient;
  v8 = -[AKClient initWithConnection:](&v11, "initWithConnection:", a4);
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_credentialRequest, a3);
  }

  return v9;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKOwnerProxyClient name](self, "name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AKOwnerProxyClient: %@",  v2));

  return v3;
}

- (BOOL)hasInternalAccess
{
  return 1;
}

- (BOOL)hasPrivateAccess
{
  return 1;
}

- (BOOL)hasPrivateSignedAccess
{
  return 1;
}

- (BOOL)hasPublicAccess
{
  return 0;
}

- (BOOL)hasWriteAccess
{
  return 1;
}

- (BOOL)hasOwnerAccess
{
  return 1;
}

- (id)name
{
  if ((-[AKCredentialRequestContext _clientShouldAuthenticateExternally]( self->_credentialRequest,  "_clientShouldAuthenticateExternally") & 1) != 0 || -[AKCredentialRequestContext _shouldUseProxiedClientBundleIDForSRP]( self->_credentialRequest,  "_shouldUseProxiedClientBundleIDForSRP"))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___AKOwnerProxyClient;
    v3 = -[AKClient name](&v7, "name");
    return (id)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKOwnerProxyClient localizedAppName](self, "localizedAppName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"akd [on behalf of %@]",  v5));

    return v6;
  }

- (id)localizedAppName
{
  return -[AKCredentialRequestContext _proxiedClientAppName](self->_credentialRequest, "_proxiedClientAppName");
}

- (id)bundleID
{
  return -[AKCredentialRequestContext _proxiedClientBundleID](self->_credentialRequest, "_proxiedClientBundleID");
}

- (id)appID
{
  return -[AKCredentialRequestContext _proxiedClientAppID](self->_credentialRequest, "_proxiedClientAppID");
}

- (id)teamID
{
  return -[AKCredentialRequestContext _proxiedClientTeamID](self->_credentialRequest, "_proxiedClientTeamID");
}

- (void).cxx_destruct
{
}

@end