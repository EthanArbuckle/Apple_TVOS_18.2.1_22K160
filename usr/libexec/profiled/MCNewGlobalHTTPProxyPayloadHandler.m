@interface MCNewGlobalHTTPProxyPayloadHandler
- (BOOL)_install;
- (BOOL)_remove;
- (BOOL)_sendSystemConfigurationProxyChangeNotification;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (id)userInputFields;
- (void)_applyProxyCredential:(id)a3;
- (void)_recoverProxyCredential;
- (void)_removeProxyCredential;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNewGlobalHTTPProxyPayloadHandler

- (id)userInputFields
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 proxyUsername]);
  if (![v5 length]) {
    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 proxyPassword]);
  id v7 = [v6 length];

  if (!v7)
  {
    uint64_t v8 = MCLocalizedFormat(@"PASSWORD_PROMPT_TITLE");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v9 = MCLocalizedFormat(@"GLOBAL_PROXY_PASSWORD_PROMPT");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue :minimumLength:fieldType:flags:",  @"password",  v5,  v10,  0LL,  0LL,  0LL,  0LL,  0LL,  0x100000003LL));
    [v3 addObject:v11];

LABEL_4:
  }

  return v3;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v29 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v32;
    uint64_t v12 = kMCIDUUIDKey;
    uint64_t v13 = kMCIDResponseKey;
    *(void *)&__int128 v9 = 138543618LL;
    __int128 v28 = v9;
    do
    {
      v14 = 0LL;
      id v30 = v10;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v7);
        }
        v15 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v12, v28));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v13]);
        if ([v16 isEqualToString:@"password"])
        {
          [v6 setProxyPassword:v17];
        }

        else
        {
          os_log_t v18 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            v19 = v18;
            v20 = (void *)objc_opt_class(v29);
            *(_DWORD *)buf = v28;
            v36 = v20;
            __int16 v37 = 2114;
            v38 = v16;
            uint64_t v21 = v13;
            uint64_t v22 = v12;
            uint64_t v23 = v11;
            id v24 = v7;
            v25 = v6;
            id v26 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ didn't ask for user input for key %{public}@",  buf,  0x16u);

            v6 = v25;
            id v7 = v24;
            uint64_t v11 = v23;
            uint64_t v12 = v22;
            uint64_t v13 = v21;
            id v10 = v30;
          }
        }

        v14 = (char *)v14 + 1;
      }

      while (v10 != v14);
      id v10 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v10);
  }

  return 1;
}

- (BOOL)_install
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v3 proxyType] == 1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServer]);

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServer]);
      [v4 setObject:v6 forKey:kSCPropNetProxiesHTTPProxy];

      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServer]);
      [v4 setObject:v7 forKey:kSCPropNetProxiesHTTPSProxy];
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServerPort]);
    if (v8)
    {
      [v4 setObject:v8 forKey:kSCPropNetProxiesHTTPPort];
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 80LL));
      [v4 setObject:v17 forKey:kSCPropNetProxiesHTTPPort];
    }

    __int128 v28 = v2;

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServerPort]);
    if (v12)
    {
      [v4 setObject:v12 forKey:kSCPropNetProxiesHTTPSPort];
    }

    else
    {
      os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 80LL));
      [v4 setObject:v18 forKey:kSCPropNetProxiesHTTPSPort];
    }

    v15 = &kSCPropNetProxiesHTTPSEnable;
    v16 = &kSCPropNetProxiesHTTPEnable;
    uint64_t v13 = 1LL;
    uint64_t v14 = 1LL;
  }

  else
  {
    __int128 v28 = v2;
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyPACURLString]);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyPACURLString]);
      [v4 setObject:v10 forKey:kSCPropNetProxiesProxyAutoConfigURLString];
    }

    else {
      uint64_t v11 = &off_1000CC0A0;
    }
    [v4 setObject:v11 forKeyedSubscript:kSCPropNetProxiesFallBackAllowed];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
    [v4 setObject:v12 forKey:kSCPropNetProxiesHTTPEnable];
    uint64_t v13 = 0LL;
    uint64_t v14 = 2LL;
    v15 = &kSCPropNetProxiesProxyAutoConfigEnable;
    v16 = &kSCPropNetProxiesHTTPSEnable;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
  [v4 setObject:v19 forKey:*v16];

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  [v4 setObject:v20 forKey:*v15];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14));
  [v4 setObject:v21 forKey:@"HTTPProxyType"];

  v2 = v28;
LABEL_19:
  else {
    uint64_t v22 = &off_1000CC0A0;
  }
  [v4 setObject:v22 forKeyedSubscript:kSCPropNetProxiesBypassAllowed];
  id v30 = @"Proxies";
  __int128 v31 = v4;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  unsigned __int8 v24 = +[MCManagedPreferencesManager setManagedPreferences:forDomain:]( &OBJC_CLASS___MCManagedPreferencesManager,  "setManagedPreferences:forDomain:",  v23,  @"com.apple.SystemConfiguration");

  if ((v24 & 1) != 0)
  {
    unsigned __int8 v25 = -[MCNewGlobalHTTPProxyPayloadHandler _sendSystemConfigurationProxyChangeNotification]( v2,  "_sendSystemConfigurationProxyChangeNotification");
  }

  else
  {
    id v26 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "MCNewGlobalHTTPProxyPayloadHandler cannot install proxy settings.",  buf,  2u);
    }

    unsigned __int8 v25 = 0;
  }

  return v25;
}

- (BOOL)_remove
{
  if ((+[MCManagedPreferencesManager setManagedPreferences:forDomain:]( &OBJC_CLASS___MCManagedPreferencesManager,  "setManagedPreferences:forDomain:",  &__NSDictionary0__struct,  @"com.apple.SystemConfiguration") & 1) != 0) {
    return -[MCNewGlobalHTTPProxyPayloadHandler _sendSystemConfigurationProxyChangeNotification]( self,  "_sendSystemConfigurationProxyChangeNotification");
  }
  v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "MCNewGlobalHTTPProxyPayloadHandler cannot remove proxy settings.",  v5,  2u);
  }

  return 0;
}

- (void)_applyProxyCredential:(id)a3
{
  id v4 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredentialStorage sharedCredentialStorage]( &OBJC_CLASS___NSURLCredentialStorage,  "sharedCredentialStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
  objc_msgSend(v5, "set_useSystemKeychain:", objc_msgSend(v7, "isInstalledForSystem"));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v17 proxyServerPort]);
  if (v8)
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v17 proxyServerPort]);
    uint64_t v10 = (uint64_t)[v9 integerValue];
  }

  else
  {
    uint64_t v10 = 80LL;
  }

  uint64_t v11 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v17 proxyServer]);
  uint64_t v13 = -[NSURLProtectionSpace initWithProxyHost:port:type:realm:authenticationMethod:]( v11,  "initWithProxyHost:port:type:realm:authenticationMethod:",  v12,  v10,  NSURLProtectionSpaceHTTP,  0LL,  NSURLAuthenticationMethodDefault);

  uint64_t v14 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v17 proxyServer]);
  v16 = -[NSURLProtectionSpace initWithProxyHost:port:type:realm:authenticationMethod:]( v14,  "initWithProxyHost:port:type:realm:authenticationMethod:",  v15,  v10,  NSURLProtectionSpaceHTTPS,  0LL,  NSURLAuthenticationMethodDefault);

  [v5 setDefaultCredential:v4 forProtectionSpace:v13];
  [v5 setDefaultCredential:v4 forProtectionSpace:v16];
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  if ([v8 proxyType] == 1)
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 proxyUsername]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 proxyPassword]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialWithUser:password:persistence:]( &OBJC_CLASS___NSURLCredential,  "credentialWithUser:password:persistence:",  v9,  v10,  2LL));

    -[MCNewGlobalHTTPProxyPayloadHandler _applyProxyCredential:](self, "_applyProxyCredential:", v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 proxyUsername]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 proxyPassword]);
    uint64_t v14 = (const void *)CFURLCredentialCreate(0LL, v12, v13, 0LL, 3LL);

    if (v14)
    {
      Archive = (const void *)_CFURLCredentialCreateArchive(0LL, v14);
      if (Archive)
      {
        v16 = Archive;
        CFDataRef Data = CFPropertyListCreateData(0LL, Archive, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
        if (Data)
        {
          os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](&OBJC_CLASS___NSString, "MCMakeUUID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 profile]);
          +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:]( MCKeychain,  "setData:forService:account:label:description:useSystemKeychain:outError:",  Data,  @"MCGlobalProxy",  v18,  0,  0,  [v20 isInstalledForSystem],  0);

          [v8 setCredentialUUID:v18];
        }

        CFRelease(v16);

        CFRelease(v14);
LABEL_10:

        goto LABEL_11;
      }

      CFRelease(v14);
    }

    uint64_t v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Cannot serialize credential. Ignoring.",  buf,  2u);
    }

    goto LABEL_10;
  }

- (void)_removeProxyCredential
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if ([v3 proxyType] == 1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServerPort]);
    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServerPort]);
      uint64_t v6 = (int)[v5 intValue];
    }

    else
    {
      uint64_t v6 = 80LL;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredentialStorage sharedCredentialStorage]( &OBJC_CLASS___NSURLCredentialStorage,  "sharedCredentialStorage"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 profile]);
    objc_msgSend(v7, "set_useSystemKeychain:", objc_msgSend(v9, "isInstalledForSystem"));

    uint64_t v10 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServer]);
    uint64_t v12 = -[NSURLProtectionSpace initWithProxyHost:port:type:realm:authenticationMethod:]( v10,  "initWithProxyHost:port:type:realm:authenticationMethod:",  v11,  v6,  NSURLProtectionSpaceHTTP,  0LL,  NSURLAuthenticationMethodDefault);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 defaultCredentialForProtectionSpace:v12]);
    if (v13)
    {
      id v22 = NSURLCredentialStorageRemoveSynchronizableCredentials;
      BOOL v23 = &__kCFBooleanTrue;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      [v7 removeCredential:v13 forProtectionSpace:v12 options:v14];
    }

    v15 = objc_alloc(&OBJC_CLASS___NSURLProtectionSpace);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v3 proxyServer]);
    id v17 = -[NSURLProtectionSpace initWithProxyHost:port:type:realm:authenticationMethod:]( v15,  "initWithProxyHost:port:type:realm:authenticationMethod:",  v16,  v6,  NSURLProtectionSpaceHTTPS,  0LL,  NSURLAuthenticationMethodDefault);

    os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 defaultCredentialForProtectionSpace:v17]);
    if (v18)
    {
      v20 = NSURLCredentialStorageRemoveSynchronizableCredentials;
      uint64_t v21 = &__kCFBooleanTrue;
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      [v7 removeCredential:v18 forProtectionSpace:v17 options:v19];
    }
  }
}

- (void)_recoverProxyCredential
{
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  BOOL v3 = [v17 proxyType] == 1;
  id v4 = v17;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v17 credentialUUID]);
    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
      id v8 = (const __CFData *)objc_claimAutoreleasedReturnValue( +[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:]( MCKeychain,  "dataFromService:account:label:description:useSystemKeychain:outError:",  @"MCGlobalProxy",  v5,  0,  0,  [v7 isInstalledForSystem],  0));

      if (v8)
      {
        CFPropertyListRef v9 = CFPropertyListCreateWithData(0LL, v8, 0LL, 0LL, 0LL);
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = _CFURLCredentialCreateFromArchive(0LL, v9);
          if (v11)
          {
            uint64_t v12 = (const void *)v11;
            uint64_t Username = CFURLCredentialGetUsername();
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(Username);
            v15 = (void *)CFURLCredentialCopyPassword(v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialWithUser:password:persistence:]( &OBJC_CLASS___NSURLCredential,  "credentialWithUser:password:persistence:",  v14,  v15,  2LL));
            -[MCNewGlobalHTTPProxyPayloadHandler _applyProxyCredential:](self, "_applyProxyCredential:", v16);
            CFRelease(v12);
          }

          CFRelease(v10);
        }
      }
    }

    id v4 = v17;
  }
}

- (void)setAside
{
}

- (void)unsetAside
{
}

- (void)remove
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    -[MCNewGlobalHTTPProxyPayloadHandler _remove](self, "_remove");
    -[MCNewGlobalHTTPProxyPayloadHandler _removeProxyCredential](self, "_removeProxyCredential");
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 credentialUUID]);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 profile]);
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:]( MCKeychain,  "removeItemForService:account:label:description:useSystemKeychain:group:",  @"MCGlobalProxy",  v5,  0,  0,  [v7 isInstalledForSystem],  0);
  }
}

- (BOOL)_sendSystemConfigurationProxyChangeNotification
{
  SCDynamicStoreRef v2 = SCDynamicStoreCreate(0LL, @"ManagedConfiguration", 0LL, 0LL);
  if (v2)
  {
    BOOL v3 = v2;
    CFStringRef Proxies = SCDynamicStoreKeyCreateProxies(0LL);
    BOOL v5 = Proxies != 0LL;
    uint64_t v6 = _MCLogObjects[0];
    if (Proxies)
    {
      id v7 = Proxies;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending proxy change notification.",  v11,  2u);
      }

      uint64_t v12 = @"com.apple.SystemConfiguration";
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
      +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:]( &OBJC_CLASS___MCManagedPreferencesManager,  "sendManagedPreferencesChangedNotificationForDomains:",  v8);

      SCDynamicStoreNotifyValue(v3, v7);
      CFRelease(v7);
    }

    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Cannot create System Configuration proxy key.",  v11,  2u);
    }

    CFRelease(v3);
  }

  else
  {
    CFPropertyListRef v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Cannot create System Configuration dynamic store reference.",  v11,  2u);
    }

    return 0;
  }

  return v5;
}

@end