@interface SoftwareUpdateSSO
- (BOOL)callerHasRequiredEntitlements;
- (BOOL)ssoIsSupported;
- (NSDictionary)defaultAuthParameters;
- (NSString)appIdentifier;
- (NSString)dawToken;
- (NSString)envIdentifier;
- (NSString)interactivityLevel;
- (NSString)personID;
- (NSString)userName;
- (SoftwareUpdateExtensibleSSOAuthenticator)authenticator;
- (SoftwareUpdateSSO)initWithOptions:(id)a3;
- (id)buildSSOError:(int)a3 underlying:(id)a4 description:(id)a5;
- (id)copyUserInfo;
- (id)getDawToken;
- (id)resultCallBack;
- (void)authenticator:(id)a3 didCompleteWithError:(id)a4;
- (void)authenticator:(id)a3 didCompleteWithResult:(id)a4;
- (void)copyTokenFromAuthenticatorResponse:(id)a3 error:(id)a4;
- (void)setAppIdentifier:(id)a3;
- (void)setAuthenticator:(id)a3;
- (void)setDawToken:(id)a3;
- (void)setDefaultAuthParameters:(id)a3;
- (void)setEnvIdentifier:(id)a3;
- (void)setInteractivityLevel:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setResultCallBack:(id)a3;
- (void)setUserName:(id)a3;
- (void)setupAuthenticator;
@end

@implementation SoftwareUpdateSSO

- (id)buildSSOError:(int)a3 underlying:(id)a4 description:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v10 = v9;
  if (v9)
  {
    if (v8) {
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v8, NSLocalizedDescriptionKey);
    }
    if (v7) {
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v7, NSUnderlyingErrorKey);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SoftwareUpdateSSOError",  a3,  v10));

  return v11;
}

- (SoftwareUpdateSSO)initWithOptions:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SoftwareUpdateSSO;
  v5 = -[SoftwareUpdateSSO init](&v21, "init");
  if (v5)
  {
    v6 = objc_opt_new(&OBJC_CLASS___SoftwareUpdateExtensibleSSOAuthenticator);
    -[SoftwareUpdateSSO setAuthenticator:](v5, "setAuthenticator:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO authenticator](v5, "authenticator"));
    [v7 setDelegate:v5];

    -[SoftwareUpdateSSO setDawToken:](v5, "setDawToken:", 0LL);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
    SoftwareUpdateSSOCompletionSemaphore = v5->SoftwareUpdateSSOCompletionSemaphore;
    v5->SoftwareUpdateSSOCompletionSemaphore = (OS_dispatch_semaphore *)v8;

    if (ssoControllerQueueOnce == -1)
    {
      if (!v4) {
        goto LABEL_14;
      }
    }

    else
    {
      dispatch_once(&ssoControllerQueueOnce, &__block_literal_global_1);
      if (!v4) {
        goto LABEL_14;
      }
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"applicationIdentifier"]);
    -[SoftwareUpdateSSO setAppIdentifier:](v5, "setAppIdentifier:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"environmentIdentifier"]);
    -[SoftwareUpdateSSO setEnvIdentifier:](v5, "setEnvIdentifier:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"username"]);
    -[SoftwareUpdateSSO setUserName:](v5, "setUserName:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"interactivity"]);
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"interactivity"]);
      if (([v14 isEqualToString:@"0"] & 1) != 0
        || ([v14 isEqualToString:@"1"] & 1) != 0
        || [v14 isEqualToString:@"2"])
      {
        -[SoftwareUpdateSSO setInteractivityLevel:](v5, "setInteractivityLevel:", v14);
      }

      else
      {
        id updated = SoftwareUpdateSSOlogError();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v14;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Invalid interactivity level was passed in: %@\n", buf, 0xCu);
        }
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO interactivityLevel](v5, "interactivityLevel"));

    if (!v15)
    {
      id v16 = SoftwareUpdateSSOlogInfo();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Using default interactivity level(0)\n", buf, 2u);
      }

      -[SoftwareUpdateSSO setInteractivityLevel:](v5, "setInteractivityLevel:", @"0");
    }
  }

void __37__SoftwareUpdateSSO_initWithOptions___block_invoke(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.MobileSoftwareUpdate.SoftwareUpdateSSO", v4);
  v3 = (void *)ssoControllerQueue;
  ssoControllerQueue = (uint64_t)v2;
}

- (void)setupAuthenticator
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO authenticator](self, "authenticator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO appIdentifier](self, "appIdentifier"));
  [v7 setAppIdentifier:v3];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO envIdentifier](self, "envIdentifier"));
  [v7 setEnvIdentifier:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO userName](self, "userName"));
  [v7 setUsername:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO interactivityLevel](self, "interactivityLevel"));
  [v7 setInteractivity:v6];

  [v7 setOtherParameters:0];
}

- (void)copyTokenFromAuthenticatorResponse:(id)a3 error:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = [a3 mutableCopy];
    id updated = SoftwareUpdateSSOlogInfo();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Successfully retrieved response from authenticator\n", buf, 2u);
    }

    v10 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"otherInfo"]);
    -[NSURLComponents setQuery:](v10, "setQuery:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v10, "queryItems"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = __62__SoftwareUpdateSSO_copyTokenFromAuthenticatorResponse_error___block_invoke;
    v40[3] = &unk_34DB20;
    id v13 = v7;
    id v41 = v13;
    [v12 enumerateObjectsUsingBlock:v40];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO authenticator](self, "authenticator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 otherParameters]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"DAWRequest"]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([&__kCFBooleanTrue stringValue]);
    unsigned int v18 = [v16 isEqualToString:v17];

    id v19 = SoftwareUpdateSSOlogInfo();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Attempt to extract DAW token from response\n", buf, 2u);
      }

      v22 = @"dawToken";
    }

    else
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Attempting to extract ACMToken from response\n", buf, 2u);
      }

      v22 = @"token";
    }

    v27 = (NSString *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v22]);
    dawToken = self->_dawToken;
    self->_dawToken = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO userName](self, "userName"));
    if (!v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"username"]);
      -[SoftwareUpdateSSO setUserName:](self, "setUserName:", v30);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO personID](self, "personID"));

    if (!v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"personId"]);
      -[SoftwareUpdateSSO setPersonID:](self, "setPersonID:", v32);
    }

    id v33 = SoftwareUpdateSSOlogError();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO userName](self, "userName"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO personID](self, "personID"));
      if (v36) {
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO personID](self, "personID"));
      }
      else {
        v37 = @"Unknown";
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SoftwareUpdateSSO dawToken](self, "dawToken"));
      v39 = @"Valid";
      *(_DWORD *)buf = 138412802;
      v43 = v35;
      __int16 v44 = 2112;
      if (!v38) {
        v39 = @"Not present";
      }
      v45 = v37;
      __int16 v46 = 2112;
      v47 = v39;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Username :%@ personID: %@ token:%@", buf, 0x20u);

      if (v36) {
    }
      }

    v25 = v41;
LABEL_28:

    goto LABEL_29;
  }

  v23 = self->_dawToken;
  self->_dawToken = 0LL;

  if (v6)
  {
    id v24 = SoftwareUpdateSSOlogError();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
      *(_DWORD *)buf = 138412290;
      v43 = v26;
      _os_log_impl(&dword_0, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, "Failed to retrieve SSO token: %@\n", buf, 0xCu);
    }

    goto LABEL_28;
  }

void __62__SoftwareUpdateSSO_copyTokenFromAuthenticatorResponse_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 value]);
  id v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (BOOL)callerHasRequiredEntitlements
{
  dispatch_queue_t v2 = SecTaskCreateFromSelf(kCFAllocatorDefault);
  if (v2)
  {
    id v3 = v2;
    id v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement( v2,  @"com.apple.softwareupdatesso.tokenaccessallowed",  0LL);
    if (v4)
    {
      v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
      CFRelease(v5);
    }

    else
    {
      BOOL v7 = 0;
    }

    CFRelease(v3);
  }

  else
  {
    id updated = SoftwareUpdateSSOlogError();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Unable to create taskref for permission check\n", v11, 2u);
    }

    return 0;
  }

  return v7;
}

- (id)copyUserInfo
{
  id updated = SoftwareUpdateSSOlogInfo();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "SofwareUpdateSSO not supported on this target. Not attempting to get token\n",  v5,  2u);
  }

  return 0LL;
}

- (id)getDawToken
{
  id updated = SoftwareUpdateSSOlogInfo();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "SofwareUpdateSSO not supported on this target. Not attempting to get token\n",  v5,  2u);
  }

  return 0LL;
}

- (BOOL)ssoIsSupported
{
  id updated = SoftwareUpdateSSOlogInfo();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "SofwareUpdateSSO not supported on this target\n", v5, 2u);
  }

  return 0;
}

- (void)authenticator:(id)a3 didCompleteWithResult:(id)a4
{
  id v5 = a4;
  id updated = SoftwareUpdateSSOlogInfo();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v8 = 0;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "INFO: ExtensibleSSOAuthentication callback returned success\n",  v8,  2u);
  }

  -[SoftwareUpdateSSO copyTokenFromAuthenticatorResponse:error:]( self,  "copyTokenFromAuthenticatorResponse:error:",  v5,  0LL);
}

- (void)authenticator:(id)a3 didCompleteWithError:(id)a4
{
  id v5 = a4;
  id updated = SoftwareUpdateSSOlogError();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_semaphore_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    int v10 = 138412290;
    v11 = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "ExtensibleSSOAuthentication callback returned error: %@\n",  (uint8_t *)&v10,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[SoftwareUpdateSSO buildSSOError:underlying:description:]( self,  "buildSSOError:underlying:description:",  1LL,  v5,  @"Call to SSOAuthenticator Authenticate failed"));
  -[SoftwareUpdateSSO copyTokenFromAuthenticatorResponse:error:]( self,  "copyTokenFromAuthenticatorResponse:error:",  0LL,  v9);
}

- (SoftwareUpdateExtensibleSSOAuthenticator)authenticator
{
  return (SoftwareUpdateExtensibleSSOAuthenticator *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAuthenticator:(id)a3
{
}

- (NSDictionary)defaultAuthParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDefaultAuthParameters:(id)a3
{
}

- (NSString)appIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setUserName:(id)a3
{
}

- (NSString)personID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPersonID:(id)a3
{
}

- (NSString)envIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setEnvIdentifier:(id)a3
{
}

- (NSString)dawToken
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDawToken:(id)a3
{
}

- (NSString)interactivityLevel
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setInteractivityLevel:(id)a3
{
}

- (id)resultCallBack
{
  return self->_resultCallBack;
}

- (void)setResultCallBack:(id)a3
{
}

- (void).cxx_destruct
{
}

@end