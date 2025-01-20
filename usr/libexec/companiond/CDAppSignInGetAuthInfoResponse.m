@interface CDAppSignInGetAuthInfoResponse
- (AKAuthorizationRequest)appleIDRequest;
- (AKPasswordRequest)passwordRequest;
- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions;
- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialRegistrationOptions;
- (CDAppSignInGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (CPSWebRequest)webRequest;
- (NSArray)appDomains;
- (NSData)appIconData;
- (NSNumber)appIconScale;
- (NSString)appBundleIdentifier;
- (NSString)appIdentifier;
- (NSString)appName;
- (NSString)appTeamIdentifier;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAppDomains:(id)a3;
- (void)setAppIconData:(id)a3;
- (void)setAppIconScale:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppTeamIdentifier:(id)a3;
- (void)setAppleIDRequest:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setPasswordRequest:(id)a3;
- (void)setPlatformKeyCredentialAssertionOptions:(id)a3;
- (void)setPlatformKeyCredentialRegistrationOptions:(id)a3;
- (void)setWebRequest:(id)a3;
@end

@implementation CDAppSignInGetAuthInfoResponse

- (CDAppSignInGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___CDAppSignInGetAuthInfoResponse;
  v5 = -[CDAppSignInGetAuthInfoResponse init](&v63, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___AKAuthorizationRequest);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = sub_10001AD0C(v4, @"appleIDRequest", (uint64_t)v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    appleIDRequest = v5->_appleIDRequest;
    v5->_appleIDRequest = (AKAuthorizationRequest *)v9;

    uint64_t v11 = objc_opt_self(&OBJC_CLASS___AKPasswordRequest);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = sub_10001AD0C(v4, @"passwordRequest", (uint64_t)v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    passwordRequest = v5->_passwordRequest;
    v5->_passwordRequest = (AKPasswordRequest *)v14;

    uint64_t v16 = objc_opt_self(&OBJC_CLASS___CPSWebRequest);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = sub_10001AD0C(v4, @"webRequest", (uint64_t)v17);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    webRequest = v5->_webRequest;
    v5->_webRequest = (CPSWebRequest *)v19;

    uint64_t v21 = objc_opt_self(&OBJC_CLASS___ASCPublicKeyCredentialAssertionOptions);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = sub_10001AD0C(v4, @"platformKeyCredentialAssertionOptions", (uint64_t)v22);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    platformKeyCredentialAssertionOptions = v5->_platformKeyCredentialAssertionOptions;
    v5->_platformKeyCredentialAssertionOptions = (ASCPublicKeyCredentialAssertionOptions *)v24;

    uint64_t v26 = objc_opt_self(&OBJC_CLASS___ASCPublicKeyCredentialCreationOptions);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v28 = sub_10001AD0C(v4, @"platformKeyCredentialRegistrationOptions", (uint64_t)v27);
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    platformKeyCredentialRegistrationOptions = v5->_platformKeyCredentialRegistrationOptions;
    v5->_platformKeyCredentialRegistrationOptions = (ASCPublicKeyCredentialCreationOptions *)v29;

    CFTypeID TypeID = CFStringGetTypeID();
    v32 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"appID", TypeID, 0), "copy");
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = v32;

    CFTypeID v34 = CFStringGetTypeID();
    v35 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"appBundleID", v34, 0), "copy");
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = v35;

    CFTypeID v37 = CFStringGetTypeID();
    v38 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"appTeamID", v37, 0), "copy");
    appTeamIdentifier = v5->_appTeamIdentifier;
    v5->_appTeamIdentifier = v38;

    CFTypeID v40 = CFStringGetTypeID();
    v41 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"appName", v40, 0), "copy");
    appName = v5->_appName;
    v5->_appName = v41;

    CFTypeID v43 = CFDataGetTypeID();
    v44 = (NSData *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"appIconData", v43, 0), "copy");
    appIconData = v5->_appIconData;
    v5->_appIconData = v44;

    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"appIconScale", 0LL);
    v47 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v48 = (NSNumber *)[v47 copy];
    appIconScale = v5->_appIconScale;
    v5->_appIconScale = v48;

    uint64_t v50 = objc_opt_self(&OBJC_CLASS___NSString);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    uint64_t NSArrayOfClass = NSDictionaryGetNSArrayOfClass(v4, @"appDomains", v51, 0LL);
    v53 = (void *)objc_claimAutoreleasedReturnValue(NSArrayOfClass);
    v54 = (NSArray *)[v53 copy];
    appDomains = v5->_appDomains;
    v5->_appDomains = v54;

    CFTypeID v56 = CFStringGetTypeID();
    v57 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceClass", v56, 0), "copy");
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = v57;

    CFTypeID v59 = CFStringGetTypeID();
    v60 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceName", v59, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v60;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = sub_10001AFE4((uint64_t)self->_appleIDRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKeyedSubscript:@"appleIDRequest"];

  id v6 = sub_10001AFE4((uint64_t)self->_passwordRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 setObject:v7 forKeyedSubscript:@"passwordRequest"];

  id v8 = sub_10001AFE4((uint64_t)self->_webRequest);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v3 setObject:v9 forKeyedSubscript:@"webRequest"];

  id v10 = sub_10001AFE4((uint64_t)self->_platformKeyCredentialAssertionOptions);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v3 setObject:v11 forKeyedSubscript:@"platformKeyCredentialAssertionOptions"];

  id v12 = sub_10001AFE4((uint64_t)self->_platformKeyCredentialRegistrationOptions);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v3 setObject:v13 forKeyedSubscript:@"platformKeyCredentialRegistrationOptions"];

  [v3 setObject:self->_appIdentifier forKeyedSubscript:@"appID"];
  [v3 setObject:self->_appBundleIdentifier forKeyedSubscript:@"appBundleID"];
  [v3 setObject:self->_appTeamIdentifier forKeyedSubscript:@"appTeamID"];
  [v3 setObject:self->_appName forKeyedSubscript:@"appName"];
  [v3 setObject:self->_appIconData forKeyedSubscript:@"appIconData"];
  [v3 setObject:self->_appIconScale forKeyedSubscript:@"appIconScale"];
  [v3 setObject:self->_appDomains forKeyedSubscript:@"appDomains"];
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v14 = [v3 copy];

  return v14;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_appleIDRequest withName:@"appleIDRequest" skipIfNil:1];
  id v5 = [v3 appendObject:self->_passwordRequest withName:@"passwordRequest" skipIfNil:1];
  id v6 = [v3 appendObject:self->_webRequest withName:@"webRequest" skipIfNil:1];
  id v7 =  [v3 appendObject:self->_platformKeyCredentialAssertionOptions withName:@"platformKeyCredentialAssertionOptions" skipIfNil:1];
  id v8 =  [v3 appendObject:self->_platformKeyCredentialRegistrationOptions withName:@"platformKeyCredentialRegistrationOptions" skipIfNil:1];
  [v3 appendString:self->_appIdentifier withName:@"appIdentifier" skipIfEmpty:1];
  [v3 appendString:self->_appBundleIdentifier withName:@"appBundleIdentifier" skipIfEmpty:1];
  [v3 appendString:self->_appTeamIdentifier withName:@"appTeamIdentifier" skipIfEmpty:1];
  [v3 appendString:self->_appName withName:@"appName" skipIfEmpty:1];
  id v9 = [v3 appendObject:self->_appIconData withName:@"appIconData" skipIfNil:1];
  id v10 = [v3 appendObject:self->_appIconScale withName:@"appIconScale" skipIfNil:1];
  id v11 = [v3 appendObject:self->_appDomains withName:@"appDomains" skipIfNil:1];
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v12;
}

- (AKAuthorizationRequest)appleIDRequest
{
  return self->_appleIDRequest;
}

- (void)setAppleIDRequest:(id)a3
{
}

- (AKPasswordRequest)passwordRequest
{
  return self->_passwordRequest;
}

- (void)setPasswordRequest:(id)a3
{
}

- (CPSWebRequest)webRequest
{
  return self->_webRequest;
}

- (void)setWebRequest:(id)a3
{
}

- (ASCPublicKeyCredentialAssertionOptions)platformKeyCredentialAssertionOptions
{
  return self->_platformKeyCredentialAssertionOptions;
}

- (void)setPlatformKeyCredentialAssertionOptions:(id)a3
{
}

- (ASCPublicKeyCredentialCreationOptions)platformKeyCredentialRegistrationOptions
{
  return self->_platformKeyCredentialRegistrationOptions;
}

- (void)setPlatformKeyCredentialRegistrationOptions:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
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

- (NSArray)appDomains
{
  return self->_appDomains;
}

- (void)setAppDomains:(id)a3
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

- (void).cxx_destruct
{
}

@end