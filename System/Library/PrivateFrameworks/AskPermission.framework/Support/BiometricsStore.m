@interface BiometricsStore
+ (__CFDictionary)_copyKeychainQuery;
+ (id)retreiveTokenWithAction:(int64_t)a3 error:(id *)a4;
+ (void)removeToken;
+ (void)storeToken:(id)a3;
@end

@implementation BiometricsStore

+ (void)removeToken
{
  v3 = (const __CFDictionary *)[a1 _copyKeychainQuery];
  uint64_t v4 = SecItemDelete(v3);
  if ((_DWORD)v4 == -25303 || (_DWORD)v4 == -25300 || (_DWORD)v4 == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class(a1);
      id v9 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Removed biometrics token data from keychain",  (uint8_t *)&v15,  0xCu);
    }
  }

  else
  {
    uint64_t v10 = v4;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    v7 = (void *)v11;
    if (!v11) {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class(a1);
      id v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
      int v15 = 138543618;
      id v16 = v12;
      __int16 v17 = 2114;
      v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to remove biometrics token data from keychain. Status: %{public}@",  (uint8_t *)&v15,  0x16u);
    }
  }

  CFRelease(v3);
}

+ (id)retreiveTokenWithAction:(int64_t)a3 error:(id *)a4
{
  v6 = (__CFDictionary *)objc_msgSend(a1, "_copyKeychainQuery", a3);
  CFDictionaryAddValue(v6, kSecReturnData, kCFBooleanTrue);
  CFTypeRef result = 0LL;
  uint64_t v7 = SecItemCopyMatching(v6, &result);
  v8 = (void *)result;
  if (result) {
    BOOL v9 = (_DWORD)v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v23 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  result,  134217984LL);

    CFRelease(v6);
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
      if (!v24) {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
      }
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 OSLogObject]);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_opt_class(a1);
        *(_DWORD *)buf = 138543362;
        v30 = v26;
        id v27 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Retrieved biometrics token data from keychain",  buf,  0xCu);
      }
    }

    return v23;
  }

  else
  {
    uint64_t v10 = v7;
    uint64_t v11 = (__CFString *)SecCopyErrorMessageString(v7, 0LL);
    uint64_t v12 = APErrorDomain;
    uint64_t v33 = APKeychainErrorCodeUserInfoKey;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
    v34 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    uint64_t v15 = APCustomError(v12, 600LL, @"Keychain Error", v11, v14, 0LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v17) {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class(a1);
      id v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
      *(_DWORD *)buf = 138543618;
      v30 = v19;
      __int16 v31 = 2114;
      v32 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to retrieve biometrics token data from keychain. Status: %{public}@",  buf,  0x16u);
    }

    if (a4) {
      *a4 = v16;
    }

    CFRelease(v6);
    return 0LL;
  }

+ (void)storeToken:(id)a3
{
  id v4 = a3;
  [a1 removeToken];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);

  v6 = (__CFDictionary *)[a1 _copyKeychainQuery];
  CFDictionaryAddValue(v6, kSecValueData, v5);
  uint64_t v7 = SecItemAdd(v6, 0LL);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  BOOL v9 = (void *)v8;
  if ((_DWORD)v7)
  {
    if (!v8) {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = (void *)objc_opt_class(a1);
      id v12 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
      int v15 = 138543618;
      id v16 = v11;
      __int16 v17 = 2114;
      v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to save biometrics token data to keychain. Status: %{public}@",  (uint8_t *)&v15,  0x16u);
    }
  }

  else
  {
    if (!v8) {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class(a1);
      id v14 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Saved biometrics token data to keychain",  (uint8_t *)&v15,  0xCu);
    }
  }

  CFRelease(v6);
}

+ (__CFDictionary)_copyKeychainQuery
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecAttrService, @"com.apple.AskPermission.biometricsToken");
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  SecAccessControlRef v3 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, 2uLL, 0LL);
  CFDictionaryAddValue(Mutable, kSecAttrAccessControl, v3);
  CFRelease(v3);
  return Mutable;
}

@end