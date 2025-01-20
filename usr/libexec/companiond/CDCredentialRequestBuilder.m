@interface CDCredentialRequestBuilder
- (ACAccount)authKitAccount;
- (AKAuthorizationRequest)baseAppleIDRequest;
- (BOOL)isRapportLogin;
- (NSData)appIconData;
- (NSNumber)appIconScale;
- (NSString)appBundleIdentifier;
- (NSString)appIdentifier;
- (NSString)appName;
- (NSString)appTeamIdentifier;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)_appleIDRequest;
- (id)_clientContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credentialRequest;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAppIconData:(id)a3;
- (void)setAppIconScale:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppTeamIdentifier:(id)a3;
- (void)setAuthKitAccount:(id)a3;
- (void)setBaseAppleIDRequest:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setIsRapportLogin:(BOOL)a3;
@end

@implementation CDCredentialRequestBuilder

- (id)credentialRequest
{
  v3 = objc_alloc(&OBJC_CLASS___AKCredentialRequestContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CDCredentialRequestBuilder _clientContext](self, "_clientContext"));
  v5 = -[AKCredentialRequestContext initWithProxiedClientContext:](v3, "initWithProxiedClientContext:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDCredentialRequestBuilder _appleIDRequest](self, "_appleIDRequest"));
  -[AKCredentialRequestContext setAuthorizationRequest:](v5, "setAuthorizationRequest:", v6);

  -[AKCredentialRequestContext set_iconData:](v5, "set_iconData:", self->_appIconData);
  -[AKCredentialRequestContext set_iconScale:](v5, "set_iconScale:", self->_appIconScale);
  return v5;
}

- (id)_clientContext
{
  id v3 = objc_alloc_init(&OBJC_CLASS___AKProxiedClientContext);
  [v3 setBundleID:self->_appBundleIdentifier];
  [v3 setTeamID:self->_appTeamIdentifier];
  [v3 setAppID:self->_appIdentifier];
  [v3 setAppName:self->_appName];
  [v3 setDeviceClass:self->_deviceClass];
  [v3 setDeviceName:self->_deviceName];
  [v3 setIsRapportLogin:self->_isRapportLogin];
  return v3;
}

- (id)_appleIDRequest
{
  if (self->_baseAppleIDRequest)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSIDForAccount:self->_authKitAccount]);

    v5 = -[AKAuthorizationRequest initWithAltDSID:]( objc_alloc(&OBJC_CLASS___AKAuthorizationRequest),  "initWithAltDSID:",  v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRequest userIdentifier](self->_baseAppleIDRequest, "userIdentifier"));
    -[AKAuthorizationRequest setUserIdentifier:](v5, "setUserIdentifier:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRequest state](self->_baseAppleIDRequest, "state"));
    -[AKAuthorizationRequest setState:](v5, "setState:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRequest nonce](self->_baseAppleIDRequest, "nonce"));
    -[AKAuthorizationRequest setNonce:](v5, "setNonce:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationRequest requestedScopes](self->_baseAppleIDRequest, "requestedScopes"));
    -[AKAuthorizationRequest setRequestedScopes:](v5, "setRequestedScopes:", v9);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___CDCredentialRequestBuilder);
  -[CDCredentialRequestBuilder setAuthKitAccount:](v4, "setAuthKitAccount:", self->_authKitAccount);
  -[CDCredentialRequestBuilder setAppBundleIdentifier:](v4, "setAppBundleIdentifier:", self->_appBundleIdentifier);
  -[CDCredentialRequestBuilder setAppTeamIdentifier:](v4, "setAppTeamIdentifier:", self->_appTeamIdentifier);
  -[CDCredentialRequestBuilder setAppIdentifier:](v4, "setAppIdentifier:", self->_appIdentifier);
  -[CDCredentialRequestBuilder setAppName:](v4, "setAppName:", self->_appName);
  -[CDCredentialRequestBuilder setAppIconData:](v4, "setAppIconData:", self->_appIconData);
  -[CDCredentialRequestBuilder setAppIconScale:](v4, "setAppIconScale:", self->_appIconScale);
  -[CDCredentialRequestBuilder setDeviceClass:](v4, "setDeviceClass:", self->_deviceClass);
  -[CDCredentialRequestBuilder setDeviceName:](v4, "setDeviceName:", self->_deviceName);
  -[CDCredentialRequestBuilder setBaseAppleIDRequest:](v4, "setBaseAppleIDRequest:", self->_baseAppleIDRequest);
  -[CDCredentialRequestBuilder setIsRapportLogin:](v4, "setIsRapportLogin:", self->_isRapportLogin);
  return v4;
}

- (ACAccount)authKitAccount
{
  return self->_authKitAccount;
}

- (void)setAuthKitAccount:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)appTeamIdentifier
{
  return self->_appTeamIdentifier;
}

- (void)setAppTeamIdentifier:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSData)appIconData
{
  return self->_appIconData;
}

- (void)setAppIconData:(id)a3
{
}

- (NSNumber)appIconScale
{
  return self->_appIconScale;
}

- (void)setAppIconScale:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (AKAuthorizationRequest)baseAppleIDRequest
{
  return self->_baseAppleIDRequest;
}

- (void)setBaseAppleIDRequest:(id)a3
{
}

- (BOOL)isRapportLogin
{
  return self->_isRapportLogin;
}

- (void)setIsRapportLogin:(BOOL)a3
{
  self->_isRapportLogin = a3;
}

- (void).cxx_destruct
{
}

@end