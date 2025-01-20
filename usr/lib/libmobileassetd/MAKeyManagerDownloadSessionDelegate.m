@interface MAKeyManagerDownloadSessionDelegate
- (MAKeyManagerDownloadSessionDelegate)initWithName:(id)a3;
- (NSArray)certArray;
- (NSOperationQueue)queue;
- (SUCoreLog)logger;
- (__SecKey)refKey;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)setCertArray:(id)a3;
- (void)setRefKey:(__SecKey *)a3;
@end

@implementation MAKeyManagerDownloadSessionDelegate

- (MAKeyManagerDownloadSessionDelegate)initWithName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MAKeyManagerDownloadSessionDelegate;
  v5 = -[MAKeyManagerDownloadSessionDelegate init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MAKeyManagerDownloadSessionDelegate:%@",  v4));
    v7 = -[SUCoreLog initWithCategory:](objc_alloc(&OBJC_CLASS___SUCoreLog), "initWithCategory:", v6);
    logger = v5->_logger;
    v5->_logger = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    queue = v5->_queue;
    v5->_queue = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@Queue",  @"com.apple.MobileAsset.KeyManagerDownloadSessionDelegate.",  v4));
    -[NSOperationQueue setName:](v5->_queue, "setName:", v11);
  }

  return v5;
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate logger](self, "logger"));
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "DownloadTask for session %@ did complete", (uint8_t *)&v11, 0xCu);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, void, void *))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate logger](self, "logger"));
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "[MAKeyManagerDownloadSessionDelegate]: Challange handler running",  buf,  2u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 protectionSpace]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 authenticationMethod]);

  if ([v12 isEqualToString:NSURLAuthenticationMethodClientCertificate])
  {
    if (os_variant_has_internal_content("com.apple.mobileassetd")
      && CFPreferencesGetAppBooleanValue(@"DisableMTLSForWKMS", @"com.apple.MobileAsset", 0LL))
    {
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate logger](self, "logger"));
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = @"DisableMTLSForWKMS";
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "[MAKeyManagerDownloadSessionDelegate]: Disabling mTLS - %@=YES",  buf,  0xCu);
      }
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v7 protectionSpace]);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 distinguishedNames]);

      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate certArray](self, "certArray", 0LL));
      id v23 = [v22 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v45;
        while (2)
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v45 != v25) {
              objc_enumerationMutation(v22);
            }
            CFDataRef v27 = SecCertificateCopyNormalizedIssuerSequence(*(SecCertificateRef *)(*((void *)&v44 + 1)
                                                                                  + 8LL * (void)i));
            if (v27 && -[os_log_s containsObject:](v14, "containsObject:", v27))
            {

              v36 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate certArray](self, "certArray"));
              id v37 = [v36 objectAtIndex:0];

              v38 = (const void *)SecIdentityCreate( 0LL,  v37,  -[MAKeyManagerDownloadSessionDelegate refKey](self, "refKey"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate certArray](self, "certArray"));
              id v40 = [v39 mutableCopy];

              [v40 removeObjectAtIndex:0];
              v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialWithIdentity:certificates:persistence:]( &OBJC_CLASS___NSURLCredential,  "credentialWithIdentity:certificates:persistence:",  v38,  v40,  1LL));
              CFRelease(v38);
              v42 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate logger](self, "logger"));
              v43 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 oslog]);

              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( &dword_0,  v43,  OS_LOG_TYPE_DEFAULT,  "[MAKeyManagerDownloadSessionDelegate]: Using credential created with BAA cert for challenge handling",  buf,  2u);
              }

              v8[2](v8, 0LL, v41);
              goto LABEL_32;
            }
          }

          id v24 = [v22 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate logger](self, "logger"));
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate certArray](self, "certArray"));
        v31 = (const __CFString *)[v30 count];
        *(_DWORD *)buf = 134217984;
        v50 = v31;
        _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "[MAKeyManagerDownloadSessionDelegate]: Disabling mTLS - server does not trust our certificates (checked %lu).",  buf,  0xCu);
      }
    }

    goto LABEL_26;
  }

  if (![v12 isEqualToString:NSURLAuthenticationMethodServerTrust]
    || (id v15 = MAInternalServerTrustCredential(v7), (v16 = objc_claimAutoreleasedReturnValue(v15)) == 0))
  {
LABEL_26:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate logger](self, "logger"));
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([v7 protectionSpace]);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue([v34 authenticationMethod]);
      *(_DWORD *)buf = 138412290;
      v50 = v35;
      _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEFAULT,  "[MAKeyManagerDownloadSessionDelegate]: AuthenticationMethod is %@. Using default challenge handling",  buf,  0xCu);
    }

    v8[2](v8, 1LL, 0LL);
    goto LABEL_33;
  }

  v14 = (os_log_s *)v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate logger](self, "logger"));
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 protectionSpace]);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 host]);
    *(_DWORD *)buf = 138412290;
    v50 = v20;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "[MAKeyManagerDownloadSessionDelegate]: Using internal server trust for %@",  buf,  0xCu);
  }

  v8[2](v8, 0LL, v14);
LABEL_32:

LABEL_33:
}

- (NSArray)certArray
{
  return self->_certArray;
}

- (void)setCertArray:(id)a3
{
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (__SecKey)refKey
{
  return self->_refKey;
}

- (void)setRefKey:(__SecKey *)a3
{
  self->_refKey = a3;
}

- (void).cxx_destruct
{
}

@end