@interface NSPPrivateAccessTokenClientState
- (NSPPrivateAccessTokenClientState)init;
- (void)dealloc;
@end

@implementation NSPPrivateAccessTokenClientState

- (NSPPrivateAccessTokenClientState)init
{
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___NSPPrivateAccessTokenClientState;
  v4 = -[NSPPrivateAccessTokenClientState init](&v52, "init");
  if (v4)
  {
    v5 = (__SecKey *)+[NPUtilities copyKeyFromKeychainWithIdentifier:]( &OBJC_CLASS___NPUtilities,  "copyKeyFromKeychainWithIdentifier:",  @"com.apple.NetworkServiceProxy.PrivateAccessTokens.ClientKey");
    if (v5)
    {
      v8 = v5;
      uint64_t v9 = nplog_obj(v5, v6, v7);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v56 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Found client key in keychain", v56, 2u);
      }

      v4->_clientKey = v8;
    }

    else if (!v4->_clientKey)
    {
      *(void *)v54 = kSecAttrKeyType;
      CFStringRef v55 = kSecAttrKeySizeInBits;
      *(void *)v56 = kSecAttrKeyTypeECSECPrimeRandom;
      v57 = &off_100103980;
      v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v54,  2LL));
      SecKeyRef RandomKey = SecKeyCreateRandomKey(v11, 0LL);
      if (RandomKey)
      {
        v4->_clientKey = RandomKey;
        id v15 = +[NPUtilities saveKeyToKeychain:withIdentifier:]( &OBJC_CLASS___NPUtilities,  "saveKeyToKeychain:withIdentifier:",  RandomKey,  @"com.apple.NetworkServiceProxy.PrivateAccessTokens.ClientKey");
        uint64_t v18 = nplog_obj(v15, v16, v17);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Generated new client key", buf, 2u);
        }
      }

      else
      {
        uint64_t v20 = nplog_obj(0LL, v13, v14);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "SecKeyCreateRandomKey failed to generate client key",  buf,  2u);
        }
      }
    }

    id v21 = +[NPUtilities copyDataFromKeychainWithIdentifier:accountName:]( &OBJC_CLASS___NPUtilities,  "copyDataFromKeychainWithIdentifier:accountName:",  @"com.apple.NetworkServiceProxy.PrivateAccessTokens.Secret",  @"client-tokens");
    v24 = v21;
    if (v21)
    {
      uint64_t v25 = nplog_obj(v21, v22, v23);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v56 = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Found client secret in keychain",  v56,  2u);
      }

      objc_setProperty_atomic(v4, v27, v24, 16LL);
      goto LABEL_28;
    }

    if (objc_getProperty(v4, v22, 16LL, 1))
    {
LABEL_28:
      v49 = v4;
      goto LABEL_29;
    }

    *(_DWORD *)v56 = 0;
    uint64_t v28 = ccrng(v56);
    if (*(_DWORD *)v56)
    {
      uint64_t v31 = nplog_obj(v28, v29, v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        v33 = "Failed to generate random";
LABEL_24:
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, v54, 2u);
      }
    }

    else
    {
      uint64_t v34 = v28;
      v35 = (void *)ccec_cp_384();
      size_t v36 = (32LL * *v35) | 0x10;
      v37 = calloc(1uLL, v36);
      uint64_t key = ccec_generate_key(v35, v34, v37);
      if (!(_DWORD)key)
      {
        v42 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v37, v36);
        objc_setProperty_atomic(v4, v43, v42, 16LL);

        free(v37);
        id v45 = +[NPUtilities saveDataToKeychain:withIdentifier:accountName:]( &OBJC_CLASS___NPUtilities,  "saveDataToKeychain:withIdentifier:accountName:",  objc_getProperty(v4, v44, 16LL, 1),  @"com.apple.NetworkServiceProxy.PrivateAccessTokens.Secret",  @"client-tokens");
        uint64_t v48 = nplog_obj(v45, v46, v47);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v54 = 0;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Generated new client secret",  v54,  2u);
        }

        goto LABEL_27;
      }

      uint64_t v41 = nplog_obj(key, v39, v40);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        v33 = "Failed to generate key";
        goto LABEL_24;
      }
    }

- (void)dealloc
{
  if (self)
  {
    clientKey = self->_clientKey;
    if (clientKey)
    {
      CFRelease(clientKey);
      self->_clientKey = 0LL;
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSPPrivateAccessTokenClientState;
  -[NSPPrivateAccessTokenClientState dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end