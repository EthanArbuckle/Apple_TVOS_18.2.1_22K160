@interface MobileAssetKeyManager
- (BOOL)isWellFormedTokenFileName:(id)a3;
- (MAKeyManagerDownloadSessionDelegate)downloadSessionDelegate;
- (MobileAssetKeyManager)init;
- (NSURLSession)knoxSession;
- (NSURLSessionConfiguration)knoxSessionConfig;
- (OS_dispatch_queue)keyManagerQueue;
- (OS_dispatch_queue)ssoQueue;
- (SUCoreLog)logger;
- (id)base64EncodedStringFromString:(id)a3;
- (id)buildKeyManagerError:(int64_t)a3 underlying:(id)a4 description:(id)a5;
- (id)copyDawToken:(BOOL)a3 useAppleConnect:(BOOL)a4 error:(id *)a5;
- (id)copyDawTokenFileName;
- (id)copyDawTokenFromOverrides;
- (id)copyDawTokenInternal:(BOOL)a3 useAppleConnect:(BOOL)a4 error:(id *)a5;
- (id)copyPersonalizationSSOToken:(BOOL)a3 error:(id *)a4;
- (id)copyPersonalizationSSOTokenInternal:(BOOL)a3 error:(id *)a4;
- (id)copyPreferencesValue:(id)a3;
- (id)createGetDecryptionKeyRequestForKnox:(id)a3 authData:(id)a4 keyFetchBaseURLString:(id)a5 apTicket:(id)a6 assetAttributes:(id)a7 error:(id *)a8;
- (id)fetchDSMEKey;
- (id)getDecryptionKey:(id)a3 downloadOptions:(id)a4 apTicket:(id)a5 skipKnoxLookup:(BOOL)a6 disableUI:(BOOL)a7 error:(id *)a8;
- (id)getDecryptionKeyFromAssetMetadataOrDownloadOptions:(id)a3 downloadOptions:(id)a4 error:(id *)a5;
- (id)getDecryptionKeyFromAssetMetadataOrDownloadOptionsInternal:(id)a3 downloadOptions:(id)a4 error:(id *)a5;
- (id)getDecryptionKeyFromKnoxUsingAssetAttributes:(id)a3 downloadOptions:(id)a4 apTicket:(id)a5 disableUI:(BOOL)a6 error:(id *)a7;
- (id)getDecryptionKeyFromKnoxUsingAssetAttributesInternal:(id)a3 downloadOptions:(id)a4 apTicket:(id)a5 disableUI:(BOOL)a6 error:(id *)a7;
- (id)normalizedAuthToken:(id)a3 source:(id)a4;
- (id)requestServerForDecryptionKey:(id)a3 recipientPrivateKey:(__SecKey *)a4 downloadOptions:(id)a5 disableUI:(BOOL)a6 err:(id *)a7;
- (int)decryptFileAtURL:(id)a3 iv:(id)a4 tag:(id)a5 cryptor:(_CCCryptor *)a6;
- (int64_t)decryptContentEncryptedAssetAtURL:(id)a3 assetAttributes:(id)a4 error:(id *)a5;
- (void)appendPEMEncodedCertificate:(__SecCertificate *)a3 toString:(id)a4;
- (void)appendPEMEncodedData:(id)a3 type:(id)a4 toString:(id)a5;
- (void)copyDawTokenFromOverrides;
- (void)dealloc;
- (void)setDownloadSessionDelegate:(id)a3;
- (void)setKnoxSession:(id)a3;
- (void)setKnoxSessionConfig:(id)a3;
@end

@implementation MobileAssetKeyManager

- (MobileAssetKeyManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MobileAssetKeyManager;
  v2 = -[MobileAssetKeyManager init](&v25, "init");
  if (v2)
  {
    v3 = -[SUCoreLog initWithCategory:]( objc_alloc(&OBJC_CLASS___SUCoreLog),  "initWithCategory:",  @"MA-KEY-MANAGER");
    logger = v2->_logger;
    v2->_logger = v3;

    v5 = (const char *)[@"com.apple.MobileAsset.keyManagerQueue" UTF8String];
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(v5, v7);
    keyManagerQueue = v2->_keyManagerQueue;
    v2->_keyManagerQueue = (OS_dispatch_queue *)v8;

    v10 = (const char *)[@"com.apple.MobileAsset.KeyManager.SSOQueue" UTF8String];
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create(v10, v12);
    ssoQueue = v2->_ssoQueue;
    v2->_ssoQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    knoxSessionConfig = v2->_knoxSessionConfig;
    v2->_knoxSessionConfig = (NSURLSessionConfiguration *)v15;

    -[NSURLSessionConfiguration setTimeoutIntervalForRequest:]( v2->_knoxSessionConfig,  "setTimeoutIntervalForRequest:",  90.0);
    -[NSURLSessionConfiguration setTimeoutIntervalForResource:]( v2->_knoxSessionConfig,  "setTimeoutIntervalForResource:",  90.0);
    -[NSURLSessionConfiguration setAllowsCellularAccess:](v2->_knoxSessionConfig, "setAllowsCellularAccess:", 1LL);
    -[NSURLSessionConfiguration setWaitsForConnectivity:](v2->_knoxSessionConfig, "setWaitsForConnectivity:", 1LL);
    -[NSURLSessionConfiguration set_downloadFileProtectionType:]( v2->_knoxSessionConfig,  "set_downloadFileProtectionType:",  NSFileProtectionNone);
    v17 = -[MAKeyManagerDownloadSessionDelegate initWithName:]( objc_alloc(&OBJC_CLASS___MAKeyManagerDownloadSessionDelegate),  "initWithName:",  @"KeyManagerSession");
    downloadSessionDelegate = v2->_downloadSessionDelegate;
    v2->_downloadSessionDelegate = v17;

    v19 = v2->_knoxSessionConfig;
    v20 = v2->_downloadSessionDelegate;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MAKeyManagerDownloadSessionDelegate queue](v20, "queue"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v19,  v20,  v21));
    knoxSession = v2->_knoxSession;
    v2->_knoxSession = (NSURLSession *)v22;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MobileAssetKeyManager;
  -[MobileAssetKeyManager dealloc](&v3, "dealloc");
}

- (id)buildKeyManagerError:(int64_t)a3 underlying:(id)a4 description:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  unsigned int v10 = [v9 isEqualToString:@"MAKeyManagerErrorDomain"];

  if (v10)
  {
    id v11 = v7;
  }

  else
  {
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setSafeObject:forKey:](v12, "setSafeObject:forKey:", v8, NSLocalizedDescriptionKey);
    -[NSMutableDictionary setSafeObject:forKey:](v12, "setSafeObject:forKey:", v7, NSUnderlyingErrorKey);
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MAKeyManagerErrorDomain",  a3,  v12));
  }

  return v11;
}

- (BOOL)isWellFormedTokenFileName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (isWellFormedTokenFileName__once == -1)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_18:
    dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager isWellFormedTokenFileName:].cold.1();
    }
    goto LABEL_20;
  }

  dispatch_once(&isWellFormedTokenFileName__once, &__block_literal_global_31);
  if (!v5) {
    goto LABEL_18;
  }
LABEL_3:
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager isWellFormedTokenFileName:].cold.5();
    }
    goto LABEL_20;
  }

  if ((unint64_t)[v5 length] < 5 || (unint64_t)objc_msgSend(v5, "length") >= 0x81)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager isWellFormedTokenFileName:].cold.2();
    }
LABEL_20:

    BOOL v10 = 0;
    goto LABEL_21;
  }

  if ([v5 rangeOfCharacterFromSet:isWellFormedTokenFileName__disallowedSet] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager isWellFormedTokenFileName:].cold.4();
    }
    goto LABEL_20;
  }

  if (([v5 hasSuffix:@".tok"] & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager isWellFormedTokenFileName:].cold.3();
    }
    goto LABEL_20;
  }

  BOOL v10 = 1;
LABEL_21:

  return v10;
}

void __51__MobileAssetKeyManager_isWellFormedTokenFileName___block_invoke(id a1)
{
  v1 = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"0123456789.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-/"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 invertedSet]);
  id v4 = (void *)isWellFormedTokenFileName__disallowedSet;
  isWellFormedTokenFileName__disallowedSet = v3;

  objc_autoreleasePoolPop(v1);
}

- (id)copyPreferencesValue:(id)a3
{
  return (id)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.MobileAsset");
}

- (id)copyDawTokenFileName
{
  id v3 = -[MobileAssetKeyManager copyPreferencesValue:](self, "copyPreferencesValue:", @"MobileAssetTokenFile");
  if (v3 && -[MobileAssetKeyManager isWellFormedTokenFileName:](self, "isWellFormedTokenFileName:", v3))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 oslog]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      dispatch_queue_t v13 = "-[MobileAssetKeyManager copyDawTokenFileName]";
      __int16 v14 = 2112;
      uint64_t v15 = (uint64_t)v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: Using token file name from preferences (%@)", buf, 0x16u);
    }

    id v6 = v3;
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __45__MobileAssetKeyManager_copyDawTokenFileName__block_invoke;
    block[3] = &unk_34DBC0;
    block[4] = self;
    if (copyDawTokenFileName_readDawTokenFileNameFromNVRAMOnce[0] != -1) {
      dispatch_once(copyDawTokenFileName_readDawTokenFileNameFromNVRAMOnce, block);
    }
    if (!copyDawTokenFileName_nvramTokenFileName)
    {
      v9 = 0LL;
      goto LABEL_14;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      dispatch_queue_t v13 = "-[MobileAssetKeyManager copyDawTokenFileName]";
      __int16 v14 = 2112;
      uint64_t v15 = copyDawTokenFileName_nvramTokenFileName;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s: Using token file name from NVRAM (%@)", buf, 0x16u);
    }

    id v6 = (id)copyDawTokenFileName_nvramTokenFileName;
  }

  v9 = v6;
LABEL_14:

  return v9;
}

void __45__MobileAssetKeyManager_copyDawTokenFileName__block_invoke(uint64_t a1)
{
  kern_return_t v4;
  int v5;
  void *v6;
  os_log_s *v7;
  io_registry_entry_t v8;
  CFTypeRef CFProperty;
  void *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  os_log_s *v24;
  os_log_s *v25;
  void *v26;
  uint64_t v27;
  CFStringRef v28;
  unsigned int v29;
  CFStringRef v30;
  mach_port_t mainPort;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  CFStringRef v35;
  __int16 v36;
  CFStringRef v37;
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[MobileAssetKeyManager copyDawTokenFileName]_block_invoke";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s: Attempting to read daw token file name from nvram", buf, 0xCu);
  }

  id v4 = IOMasterPort(bootstrap_port, &mainPort);
  if (v4)
  {
    v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__MobileAssetKeyManager_copyDawTokenFileName__block_invoke_cold_2(v5, v7);
    }
    goto LABEL_6;
  }

  id v8 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (v8)
  {
    CFProperty = IORegistryEntryCreateCFProperty(v8, @"ma-token-file", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      BOOL v10 = (void *)CFProperty;
      id v11 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        v12 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v10, 4LL);
      }

      else
      {
        uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v10, v22) & 1) == 0)
        {
          id v7 = 0LL;
LABEL_19:
          v23 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v7, v23) & 1) != 0
            && [*(id *)(a1 + 32) isWellFormedTokenFileName:v7])
          {
            v24 = v7;
            objc_super v25 = (os_log_s *)copyDawTokenFileName_nvramTokenFileName;
            copyDawTokenFileName_nvramTokenFileName = (uint64_t)v24;
          }

          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
            objc_super v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 oslog]);

            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v27 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v7, v27) & 1) != 0) {
                v28 = @"YES";
              }
              else {
                v28 = @"NO";
              }
              v29 = [*(id *)(a1 + 32) isWellFormedTokenFileName:v7];
              *(_DWORD *)buf = 136315650;
              v33 = "-[MobileAssetKeyManager copyDawTokenFileName]_block_invoke";
              if (v29) {
                v30 = @"YES";
              }
              else {
                v30 = @"NO";
              }
              v34 = 2112;
              v35 = v28;
              v36 = 2112;
              v37 = v30;
              _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: Value read from nvram is invalid. Valid Class: %@ WellFormedName:%@",  buf,  0x20u);
            }
          }

          goto LABEL_6;
        }

        v12 = (NSString *)[v10 copy];
      }

      id v7 = (os_log_s *)v12;
      goto LABEL_19;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[MobileAssetKeyManager copyDawTokenFileName]_block_invoke";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s: No token file name set in nvram", buf, 0xCu);
    }
  }

  else
  {
    dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__MobileAssetKeyManager_copyDawTokenFileName__block_invoke_cold_1(v7, v14, v15, v16, v17, v18, v19, v20);
    }
  }

- (id)normalizedAuthToken:(id)a3 source:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByTrimmingCharactersInSet:v8]);

  BOOL v10 = (char *)[v9 rangeOfString:@" "];
  if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    dispatch_queue_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      id v21 = v6;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "Read stashed token from %{public}@ (raw)",  (uint8_t *)&v20,  0xCu);
    }
  }

  else
  {
    __int16 v14 = v10;
    uint64_t v15 = v11;
    dispatch_queue_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 substringToIndex:v10]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 substringFromIndex:&v14[v15]]);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543618;
      id v21 = v6;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "Read stashed token from %{public}@ (Authorization: %{public}@)",  (uint8_t *)&v20,  0x16u);
    }

    v9 = (void *)v16;
  }

  return v9;
}

- (id)copyDawTokenFromOverrides
{
  id v3 = -[MobileAssetKeyManager copyPreferencesValue:](self, "copyPreferencesValue:", @"MobileAssetTokenOverride");
  if (!v3 || (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    id v6 = -[MobileAssetKeyManager copyDawTokenFileName](self, "copyDawTokenFileName");
    if (!v6) {
      goto LABEL_17;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/private/var/MobileSoftwareUpdate/MobileAsset/",  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  v6,  0LL,  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteURL]);

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Attempting to read stashed token from %@", buf, 0xCu);
    }

    id v21 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  v9,  &v21));
    id v13 = v21;
    if (v12)
    {
      id v20 = 0LL;
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 readDataUpToLength:2048 error:&v20]);
      uint64_t v15 = (os_log_s *)v20;
      if (v14)
      {
        uint64_t v16 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v14, 4LL);

        v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager normalizedAuthToken:source:]( self,  "normalizedAuthToken:source:",  v16,  @"file"));
        int v17 = 0;
        id v3 = v16;
        goto LABEL_16;
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[MobileAssetKeyManager copyDawTokenFromOverrides].cold.2();
      }
    }

    else
    {
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s oslog](v5, "oslog"));

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MobileAssetKeyManager copyDawTokenFromOverrides].cold.1();
      }
    }

    int v17 = 1;
LABEL_16:

    if (!v17) {
      goto LABEL_18;
    }
LABEL_17:
    v5 = 0LL;
    goto LABEL_18;
  }

  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager normalizedAuthToken:source:]( self,  "normalizedAuthToken:source:",  v3,  @"defaults"));
  id v6 = 0LL;
LABEL_18:

  return v5;
}

- (id)copyDawTokenInternal:(BOOL)a3 useAppleConnect:(BOOL)a4 error:(id *)a5
{
  id v7 = -[MobileAssetKeyManager copyDawTokenFromOverrides](self, "copyDawTokenFromOverrides");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      __int16 v16 = 0;
      uint64_t v11 = "Using DAW token set via override.";
      v12 = (uint8_t *)&v16;
LABEL_9:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
  }

  else if (a4)
  {
    if (v10)
    {
      __int16 v14 = 0;
      uint64_t v11 = "Collection of AppleConnect token not supported here";
      v12 = (uint8_t *)&v14;
      goto LABEL_9;
    }
  }

  else if (v10)
  {
    *(_WORD *)buf = 0;
    uint64_t v11 = "Not querying AppleConnect for token";
    v12 = buf;
    goto LABEL_9;
  }

  return v7;
}

- (id)copyPersonalizationSSOTokenInternal:(BOOL)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = @"Collection of AppleConnect token not supported here";
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v11, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager buildKeyManagerError:underlying:description:]( self,  "buildKeyManagerError:underlying:description:",  30025LL,  0LL,  @"Collection of AppleConnect token not supported here"));
  v9 = v8;
  if (a4 && v8) {
    *a4 = v8;
  }

  return 0LL;
}

- (void)appendPEMEncodedData:(id)a3 type:(id)a4 toString:(id)a5
{
  id v7 = a5;
  id v10 = a4;
  id v8 = a3;
  [v7 appendFormat:@"-----BEGIN %@-----\n", v10];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 base64EncodedStringWithOptions:33]);

  [v7 appendString:v9];
  [v7 appendFormat:@"\n-----END %@-----\n", v10];
}

- (void)appendPEMEncodedCertificate:(__SecCertificate *)a3 toString:(id)a4
{
  id v6 = a4;
  CFDataRef v7 = SecCertificateCopyData(a3);
  -[MobileAssetKeyManager appendPEMEncodedData:type:toString:]( self,  "appendPEMEncodedData:type:toString:",  v7,  @"CERTIFICATE",  v6);
}

- (id)base64EncodedStringFromString:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);

  return v4;
}

- (id)createGetDecryptionKeyRequestForKnox:(id)a3 authData:(id)a4 keyFetchBaseURLString:(id)a5 apTicket:(id)a6 assetAttributes:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v47 = a4;
  id v14 = a5;
  id v46 = a6;
  id v15 = a7;
  __int16 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager keyManagerQueue](self, "keyManagerQueue"));
  dispatch_assert_queue_V2(v16);

  v44 = v14;
  v41 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingString:@"/keys/fetch"]);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:"));
  int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:"));
  v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v19 = (__CFString *)MGCopyAnswer(@"BuildVersion", 0LL);
  v43 = v15;
  id v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"AssetType"]);
  id v21 = @"unknownAssetType";
  if (v20) {
    id v21 = v20;
  }
  __int16 v22 = @"unknownBuildVersion";
  if (v19) {
    __int16 v22 = v19;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MobileAsset/%s MAAssetType/%@ BuildVersion/%@",  "1",  v21,  v22));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v24 = v13;
  id v25 = [v24 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(v24);
        }
        -[MobileAssetKeyManager appendPEMEncodedCertificate:toString:]( self,  "appendPEMEncodedCertificate:toString:",  *(void *)(*((void *)&v49 + 1) + 8LL * (void)i),  v23);
      }

      id v26 = [v24 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }

    while (v26);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager base64EncodedStringFromString:](self, "base64EncodedStringFromString:", v23));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v29, @"cert-chain");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v47, @"auth-data");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v46, @"ap-ticket");
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v18))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v18;
      _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "[KnoxDecryptionKeyRequest]: Params for knox request are : %{public}@",  buf,  0xCu);
    }

    id v48 = 0LL;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v18,  1LL,  &v48));
    id v33 = v48;
    if (v32)
    {
      [v17 setHTTPBody:v32];
      [v17 setValue:v45 forHTTPHeaderField:@"User-Agent"];
      [v17 setCachePolicy:4];
      [v17 setHTTPMethod:@"POST"];
      [v17 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      [v17 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
      id v34 = 0LL;
      goto LABEL_26;
    }

    id v34 = (id)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager buildKeyManagerError:underlying:description:]( self,  "buildKeyManagerError:underlying:description:",  30011LL,  0LL,  @"Failed to convert valid server params to json"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 oslog]);

    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager createGetDecryptionKeyRequestForKnox:authData:keyFetchBaseURLString:apTicket:assetAttributes:error:].cold.1();
    }
  }

  else
  {
    id v34 = (id)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager buildKeyManagerError:underlying:description:]( self,  "buildKeyManagerError:underlying:description:",  30011LL,  0LL,  @"Server params cannot be converted to json"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 oslog]);

    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager createGetDecryptionKeyRequestForKnox:authData:keyFetchBaseURLString:apTicket:assetAttributes:error:].cold.2();
    }
    id v33 = 0LL;
  }

  int v17 = 0LL;
  if (a8 && v34)
  {
    id v34 = v34;
    int v17 = 0LL;
    v32 = 0LL;
    *a8 = v34;
  }

  else
  {
    v32 = 0LL;
  }

- (id)requestServerForDecryptionKey:(id)a3 recipientPrivateKey:(__SecKey *)a4 downloadOptions:(id)a5 disableUI:(BOOL)a6 err:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keyManagerQueue);
  uint64_t v52 = 0LL;
  v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  v55 = __Block_byref_object_copy__18;
  v56 = __Block_byref_object_dispose__18;
  id v57 = 0LL;
  uint64_t v46 = 0LL;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  __int128 v49 = __Block_byref_object_copy__18;
  __int128 v50 = __Block_byref_object_dispose__18;
  id v51 = 0LL;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke;
  v41[3] = &unk_350F58;
  v41[4] = self;
  v43 = &v46;
  v44 = &v52;
  v45 = a4;
  id v13 = dispatch_semaphore_create(0LL);
  v42 = v13;
  id v14 = objc_retainBlock(v41);
  id v15 = -[MABAACertManager initWithCertType:](objc_alloc(&OBJC_CLASS___MABAACertManager), "initWithCertType:", 1LL);
  uint64_t v40 = 0LL;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager issueAndCopyCerts:](v15, "issueAndCopyCerts:", &v40));
  if (v16)
  {
    -[MAKeyManagerDownloadSessionDelegate setCertArray:](self->_downloadSessionDelegate, "setCertArray:", v16);
    -[MAKeyManagerDownloadSessionDelegate setRefKey:](self->_downloadSessionDelegate, "setRefKey:", v40);
  }

  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_712;
  v27[3] = &unk_350F80;
  id v17 = v12;
  id v28 = v17;
  v29 = self;
  id v33 = &v36;
  id v18 = v11;
  id v30 = v18;
  v19 = v14;
  id v32 = v19;
  id v20 = v13;
  v31 = v20;
  id v34 = &v52;
  v35 = &v46;
  id v21 = objc_retainBlock(v27);
  ((void (*)(void *, uint64_t))v21[2])(v21, 1LL);
  __int16 v22 = (void *)v53[5];
  if (!v22)
  {
    if (*((_BYTE *)v37 + 24)
      || a6
      || (((void (*)(void *, void))v21[2])(v21, 0LL), (__int16 v22 = (void *)v53[5]) == 0LL))
    {
      __int16 v22 = 0LL;
      if (a7)
      {
        id v25 = (void *)v47[5];
        if (v25)
        {
          *a7 = v25;
          __int16 v22 = (void *)v53[5];
        }
      }
    }
  }

  id v23 = v22;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  return v23;
}

void __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[KnoxServerResponse]: Running knoxKeyReadTask callback", buf, 2u);
  }

  v86 = v8;
  if (v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Got networking error from Knox key read request: %@",  v12));

    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_6();
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buildKeyManagerError:30018 underlying:v9 description:v13]);
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    v19 = 0LL;
    id v20 = 0LL;
    id v21 = 0LL;
    id v22 = 0LL;
    id v23 = 0LL;
    id v24 = 0LL;
    v85 = 0LL;
    goto LABEL_37;
  }

  id v24 = v8;
  id v25 = (char *)[v24 statusCode];
  uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSHTTPURLResponse localizedStringForStatusCode:]( &OBJC_CLASS___NSHTTPURLResponse,  "localizedStringForStatusCode:",  v25));
  v85 = (void *)v26;
  if (v25 != stru_B8.segname)
  {
    char v39 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](v39, "stringByTrimmingCharactersInSet:", v40));

    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld %@: %@",  v25,  v26,  v13));
    v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 oslog]);

    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_5();
    }

    uint64_t v44 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buildKeyManagerError:30019 underlying:0 description:v41]);
    uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = v44;

    v19 = 0LL;
    id v20 = 0LL;
    id v21 = 0LL;
    id v22 = 0LL;
    id v23 = 0LL;
    goto LABEL_37;
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = [v7 length];
    *(_DWORD *)buf = 134218498;
    uint64_t v90 = 200LL;
    __int16 v91 = 2114;
    uint64_t v92 = v26;
    __int16 v93 = 2048;
    id v94 = v29;
    _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "[KnoxServerResponse]: Request succeeded: %ld %{public}@ (%lu bytes)",  buf,  0x20u);
  }

  if (!v7)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue([v56 oslog]);

    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_1( v57,  v58,  v59,  v60,  v61,  v62,  v63,  v64);
    }

    uint64_t v65 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) buildKeyManagerError:30020 underlying:0 description:@"No data in response from Knox"]);
    v19 = 0LL;
    id v20 = 0LL;
    id v21 = 0LL;
    id v22 = 0LL;
    id v23 = 0LL;
    goto LABEL_36;
  }

  id v88 = 0LL;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v88));
  id v22 = v88;
  if (v22 || !v23 || (uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v23, v30) & 1) == 0))
  {
    id v84 = v7;
    id v47 = (void *)objc_claimAutoreleasedReturnValue([v22 description]);
    if (v23) {
      uint64_t v48 = @"YES";
    }
    else {
      uint64_t v48 = @"NO";
    }
    uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v23, v49) & 1) != 0) {
      __int128 v50 = @"YES";
    }
    else {
      __int128 v50 = @"NO";
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Response data from Knox invalid Error:%@ responseDictPresent: %@ responseDictTypeValid: %@",  v47,  v48,  v50));

    id v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue([v51 oslog]);

    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_4();
    }

    uint64_t v53 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buildKeyManagerError:30021 underlying:v22 description:v13]);
    uint64_t v54 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v55 = *(void **)(v54 + 40);
    *(void *)(v54 + 40) = v53;

    v19 = 0LL;
    id v20 = 0LL;
    id v21 = 0LL;
    id v7 = v84;
    goto LABEL_37;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"enc-request"]);
  uint64_t v31 = objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"wrapped-key"]);
  v19 = (void *)v31;
  if (!v20 || !v31)
  {
    v67 = @"Absent";
    if (v31) {
      v68 = @"Present";
    }
    else {
      v68 = @"Absent";
    }
    if (v20) {
      v67 = @"Present";
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Knox did not return expected info. enc-request: %@ wrapped-key:%@",  v68,  v67));
    v69 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue([v69 oslog]);

    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_3();
    }

    uint64_t v71 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buildKeyManagerError:30021 underlying:0 description:v13]);
    uint64_t v72 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v73 = *(void **)(v72 + 40);
    *(void *)(v72 + 40) = v71;

    id v21 = 0LL;
    id v22 = 0LL;
    goto LABEL_37;
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEFAULT,  "[KnoxServerResponse]: Server returned valid objects. Proceeding to unwrap key",  buf,  2u);
  }

  v83 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v19,  0LL);
  id v34 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v20,  0LL);
  uint64_t v35 = *(void *)(a1 + 64);
  id v87 = 0LL;
  uint64_t v36 = objc_claimAutoreleasedReturnValue( +[CryptoKitWrapper decryptKnoxKeyWithEncData:encapsulatedKey:recipientPrivateKey:error:]( &OBJC_CLASS____TtC21MobileAssetKeyManager16CryptoKitWrapper,  "decryptKnoxKeyWithEncData:encapsulatedKey:recipientPrivateKey:error:",  v83,  v34,  v35,  &v87));
  id v21 = v87;
  uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v38 = *(void **)(v37 + 40);
  *(void *)(v37 + 40) = v36;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) || v21)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue([v74 oslog]);

    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_2( v75,  v76,  v77,  v78,  v79,  v80,  v81,  v82);
    }

    uint64_t v65 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) buildKeyManagerError:30023 underlying:v21 description:@"Failed to unwrap decryption key"]);
    id v22 = 0LL;
LABEL_36:
    uint64_t v66 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v13 = *(void **)(v66 + 40);
    *(void *)(v66 + 40) = v65;
LABEL_37:

    goto LABEL_38;
  }

  id v22 = 0LL;
LABEL_38:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_712( uint64_t a1,  uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadAuthorizationHeader]);
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[KnoxServerAuth] Using downloadAuthorizationHeader", buf, 2u);
    }

    id v7 = v4;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
  }

  else
  {
    id v7 = 0LL;
  }

  if (![v7 length])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = "enabled";
      if ((_DWORD)a2) {
        id v10 = "disabled";
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v27 = v10;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "[KnoxServerAuth] Attempting to fetch DAW token with UI %s",  buf,  0xCu);
    }

    id v11 = *(void **)(a1 + 40);
    id v25 = 0LL;
    id v12 = [v11 copyDawToken:a2 useAppleConnect:1 error:&v25];
    id v13 = (char *)v25;
    id v14 = [v12 length];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "[KnoxServerAuth] Using fetched DAW token", buf, 2u);
      }

      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Bearer %@", v12));
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
      id v7 = (id)v18;
    }

    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v13;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "[KnoxServerAuth] Failed to fetch DAW token: %@", buf, 0xCu);
      }
    }
  }

  id v19 = [*(id *)(a1 + 48) mutableCopy];
  if ([v7 length])
  {
    [v19 setValue:v7 forHTTPHeaderField:@"Authorization"];
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "[KnoxServerAuth] Proceeding without Authorization header",  buf,  2u);
    }
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 40) + 32) dataTaskWithRequest:v19 completionHandler:*(void *)(a1 + 64)]);
  [v22 resume];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL))
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 88) + 8LL);
    id v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = 0LL;
  }
}

- (id)getDecryptionKeyFromKnoxUsingAssetAttributesInternal:(id)a3 downloadOptions:(id)a4 apTicket:(id)a5 disableUI:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager keyManagerQueue](self, "keyManagerQueue"));
  dispatch_assert_queue_V2(v15);

  CFTypeRef cf = 0LL;
  uint64_t v16 = objc_autoreleasePoolPush();
  if (!v12)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing AssetAttributes"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager getDecryptionKeyFromKnoxUsingAssetAttributesInternal:downloadOptions:apTicket:disableUI:error:].cold.1();
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager buildKeyManagerError:underlying:description:]( self,  "buildKeyManagerError:underlying:description:",  30001LL,  0LL,  v26));
    goto LABEL_14;
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"__WKMSAuthData"]);
  if (!v17)
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v74 = @"Asset attributes do not contain KnoxWKMSAuthData";
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "[KnoxKeyRead]: %{public}@", buf, 0xCu);
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager buildKeyManagerError:underlying:description:]( self,  "buildKeyManagerError:underlying:description:",  30003LL,  0LL,  @"Asset attributes do not contain KnoxWKMSAuthData"));
LABEL_14:
    id v32 = 0LL;
    goto LABEL_41;
  }

  uint64_t v18 = (void *)v17;
  v68 = a7;
  id v19 = v16;
  id v20 = v14;
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"__WKMSURL"]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

  v69 = (void *)v21;
  if (v21)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "[KnoxKeyRead]: Attempting to generate BAA cert", buf, 2u);
    }

    id v14 = v20;
    id v67 = v13;
    if (os_variant_has_internal_content("com.apple.MobileAsset"))
    {
      id v24 = -[MobileAssetKeyManager copyPreferencesValue:](self, "copyPreferencesValue:", @"DisableBAAForWKMS");
      unsigned __int8 v25 = [v24 BOOLValue];
    }

    else
    {
      unsigned __int8 v25 = 0;
    }

    uint64_t v16 = v19;
    uint64_t v40 = -[MABAACertManager initWithCertType:](objc_alloc(&OBJC_CLASS___MABAACertManager), "initWithCertType:", 1LL);
    v41 = 0LL;
    a7 = v68;
    if (![0 count] && (v25 & 1) == 0) {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager issueAndCopyCerts:](v40, "issueAndCopyCerts:", &cf));
    }
    if (![v41 count])
    {
      uint64_t v42 = objc_claimAutoreleasedReturnValue(-[MABAACertManager issueAndCopySelfSignedCert:](v40, "issueAndCopySelfSignedCert:", &cf));

      v41 = (void *)v42;
    }

    if ([v41 count])
    {
      id v71 = 0LL;
      uint64_t v43 = objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager createGetDecryptionKeyRequestForKnox:authData:keyFetchBaseURLString:apTicket:assetAttributes:error:]( self,  "createGetDecryptionKeyRequestForKnox:authData:keyFetchBaseURLString:apTicket:assetAttributes:error:",  v41,  v18,  v69,  v14,  v12,  &v71));
      id v44 = v71;
      uint64_t v65 = v44;
      uint64_t v66 = v40;
      uint64_t v64 = (void *)v43;
      if (!v43 || v44)
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager buildKeyManagerError:underlying:description:]( self,  "buildKeyManagerError:underlying:description:",  30009LL,  v44,  @"Failed to create decryptionKeyRequest for knox"));
        id v57 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
        uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v57 oslog]);

        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          -[MobileAssetKeyManager getDecryptionKeyFromKnoxUsingAssetAttributesInternal:downloadOptions:apTicket:disableUI:error:].cold.4();
        }
        id v32 = 0LL;
      }

      else
      {
        id v70 = 0LL;
        id v32 = (void *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager requestServerForDecryptionKey:recipientPrivateKey:downloadOptions:disableUI:err:]( self,  "requestServerForDecryptionKey:recipientPrivateKey:downloadOptions:disableUI:err:",  v43,  cf,  v67,  v8,  &v70));
        uint64_t v45 = (os_log_s *)v70;
        uint64_t v46 = v45;
        if (!v32 || v45)
        {
          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger", v18, v64, v65, v66));
          uint64_t v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v58 oslog]);

          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v74 = @"Request to knox for decryption key returned failure";
            _os_log_impl(&dword_0, v59, OS_LOG_TYPE_DEFAULT, "[KnoxKeyRead]: %@", buf, 0xCu);
          }

          id v29 = (void *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager buildKeyManagerError:underlying:description:]( self,  "buildKeyManagerError:underlying:description:",  30010LL,  v46,  @"Request to knox for decryption key returned failure"));
          uint64_t v18 = v63;
        }

        else
        {
          id v29 = 0LL;
        }
      }
    }

    else
    {
      uint64_t v62 = v18;
      id v47 = v40;
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
      uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 oslog]);

      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        -[MobileAssetKeyManager getDecryptionKeyFromKnoxUsingAssetAttributesInternal:downloadOptions:apTicket:disableUI:error:].cold.3( v49,  v50,  v51,  v52,  v53,  v54,  v55,  v56);
      }

      id v29 = (void *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager buildKeyManagerError:underlying:description:]( self,  "buildKeyManagerError:underlying:description:",  30007LL,  0LL,  @"Failed to generate cert for knox request"));
      id v32 = 0LL;
    }

    id v13 = v67;
  }

  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager getDecryptionKeyFromKnoxUsingAssetAttributesInternal:downloadOptions:apTicket:disableUI:error:].cold.2( v23,  v33,  v34,  v35,  v36,  v37,  v38,  v39);
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue( -[MobileAssetKeyManager buildKeyManagerError:underlying:description:]( self,  "buildKeyManagerError:underlying:description:",  30024LL,  0LL,  @"Asset attributes do not contain KnoxWKMSURL"));
    id v32 = 0LL;
    id v14 = v20;
    uint64_t v16 = v19;
    a7 = v68;
  }

- (id)getDecryptionKeyFromAssetMetadataOrDownloadOptionsInternal:(id)a3 downloadOptions:(id)a4 error:(id *)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager keyManagerQueue](self, "keyManagerQueue"));
  dispatch_assert_queue_V2(v10);

  id v11 = objc_autoreleasePoolPush();
  if (v8 | v9)
  {
    if (v8)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v8 objectForKeyedSubscript:@"ArchiveDecryptionKey"]);
      if (v12 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
      {
        id v14 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v12,  0LL);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "[KeyFromMetaDataOrOptions]: Decryption key found in asset attributes dict. Returning key from attributes.",  buf,  2u);
        }
      }

      else
      {
        id v14 = 0LL;
      }

      if (!v9) {
        goto LABEL_20;
      }
    }

    else
    {
      id v14 = 0LL;
      if (!v9) {
        goto LABEL_20;
      }
    }

    if (!v14)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 decryptionKey]);

      if (!v27)
      {
        id v14 = 0LL;
        if (!v8) {
          goto LABEL_52;
        }
LABEL_21:
        if (!v14)
        {
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v8 objectForKey:@"ArchiveDecryptionKeyFile"]);
          uint64_t v31 = v30;
          if (v30 && [v30 hasPrefix:@"com.apple.MobileAsset.DecryptionKey."])
          {
            uint64_t v62 = a5;
            unint64_t v63 = v9;
            unint64_t v64 = v8;
            id v32 = objc_alloc(&OBJC_CLASS___NSMutableArray);
            uint64_t v65 = v31;
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( [@"/var/MobileAsset/AssetsV2/DecryptionKeys" stringByAppendingPathComponent:v31]);
            uint64_t v78 = v33;
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v78,  1LL));
            uint64_t v35 = -[NSMutableArray initWithArray:](v32, "initWithArray:", v34);

            if (os_variant_has_internal_content("com.apple.MobileAsset"))
            {
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( [@"/AppleInternal/System/Library/AssetsV2/DecryptionKeys" stringByAppendingPathComponent:v65]);
              -[NSMutableArray insertObject:atIndex:](v35, "insertObject:atIndex:", v36, 0LL);
            }

            __int128 v71 = 0u;
            __int128 v72 = 0u;
            __int128 v69 = 0u;
            __int128 v70 = 0u;
            uint64_t v37 = v35;
            id v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v69,  v77,  16LL);
            if (v38)
            {
              id v39 = v38;
              uint64_t v40 = *(void *)v70;
              uint64_t v66 = v37;
LABEL_28:
              uint64_t v41 = 0LL;
              id v67 = v39;
              while (1)
              {
                if (*(void *)v70 != v40) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v42 = *(os_log_s **)(*((void *)&v69 + 1) + 8 * v41);
                uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                unsigned __int8 v44 = [v43 fileExistsAtPath:v42];

                if ((v44 & 1) == 0)
                {
                  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
                  id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue([v52 oslog]);

                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    NSUInteger v74 = (NSUInteger)v42;
                    _os_log_impl( &dword_0,  v47,  OS_LOG_TYPE_DEFAULT,  "[KeyFromMetaDataOrOptions]: Found decryption key path in attributes, but file does not exist at path: %{public}@",  buf,  0xCu);
                  }

                  goto LABEL_47;
                }

                uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                id v68 = 0LL;
                uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 attributesOfItemAtPath:v42 error:&v68]);
                id v47 = (os_log_s *)v68;

                if ([v46 fileSize])
                {
                  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                  id v14 = (NSData *)objc_claimAutoreleasedReturnValue([v48 contentsAtPath:v42]);

                  if (v14)
                  {
                    if ((char *)-[NSData length](v14, "length") == (char *)&stru_20.nsects + 1
                      || (segment_command_64 *)-[NSData length](v14, "length") == &stru_20)
                    {
                      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
                      id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue([v59 oslog]);

                      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543362;
                        NSUInteger v74 = (NSUInteger)v42;
                        _os_log_impl( &dword_0,  v60,  OS_LOG_TYPE_DEFAULT,  "[KeyFromMetaDataOrOptions]: Found and successfully loaded decryption key via file path: %{public}@",  buf,  0xCu);
                      }

                      uint64_t v58 = v66;
                      id v26 = 0LL;
                      unint64_t v8 = v64;
                      goto LABEL_56;
                    }

                    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
                    uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 oslog]);

                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                    {
                      NSUInteger v51 = -[NSData length](v14, "length");
                      *(_DWORD *)buf = 134218242;
                      NSUInteger v74 = v51;
                      __int16 v75 = 2114;
                      uint64_t v76 = v42;
                      _os_log_impl( &dword_0,  v50,  OS_LOG_TYPE_DEFAULT,  "[KeyFromMetaDataOrOptions]: Invalid decryption key length: %lu (should be 32 or 97 bytes) for path: %{public}@",  buf,  0x16u);
                    }

                    uint64_t v37 = v66;
                    goto LABEL_46;
                  }

                  id v57 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
                  id v14 = (NSData *)objc_claimAutoreleasedReturnValue([v57 oslog]);

                  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    NSUInteger v74 = (NSUInteger)v42;
                    uint64_t v54 = (os_log_s *)v14;
                    uint64_t v55 = "[KeyFromMetaDataOrOptions]: Found decryption key path in attributes, but no key was loaded fro"
                          "m path: %{public}@";
                    uint32_t v56 = 12;
                    goto LABEL_45;
                  }
                }

                else
                {
                  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
                  id v14 = (NSData *)objc_claimAutoreleasedReturnValue([v53 oslog]);

                  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    NSUInteger v74 = (NSUInteger)v42;
                    __int16 v75 = 2114;
                    uint64_t v76 = v47;
                    uint64_t v54 = (os_log_s *)v14;
                    uint64_t v55 = "[KeyFromMetaDataOrOptions]: Found decryption key path in attributes, but file does not have an"
                          "y contents at path: %{public}@, error: %{public}@";
                    uint32_t v56 = 22;
LABEL_45:
                    _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, v55, buf, v56);
                  }
                }

- (id)fetchDSMEKey
{
  if (!__isPlatformVersionAtLeast(3, 18, 0, 0))
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v7 = "Fetching of dsme key not supported here";
LABEL_10:
    unint64_t v8 = buf;
    goto LABEL_11;
  }

  if (!aks_get_dsme_key)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v7 = "Fetching of dsme key not supported here";
    goto LABEL_10;
  }

  size_t v14 = 0LL;
  *(void *)buf = 0LL;
  int dsme_key = aks_get_dsme_key(buf, &v14);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 oslog]);

  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (dsme_key)
  {
    if (v6)
    {
      *(_WORD *)uint64_t v13 = 0;
      id v7 = "Failed to fetch dsme key";
      unint64_t v8 = v13;
LABEL_11:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }

- (int)decryptFileAtURL:(id)a3 iv:(id)a4 tag:(id)a5 cryptor:(_CCCryptor *)a6
{
  id v10 = a3;
  id v47 = a4;
  id v11 = a5;
  id v46 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData, "dataWithLength:", 0x40000LL));
  id v12 = (char *)[v46 mutableBytes];
  id v13 = v10;
  int v14 = open((const char *)[v13 fileSystemRepresentation], 2);
  if (v14 != -1)
  {
    int v15 = v14;
    if (CCCryptorGCMReset(a6))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MobileAssetKeyManager decryptFileAtURL:iv:tag:cryptor:].cold.9();
      }
    }

    else
    {
      if (!v47
        || (id v24 = v47,
            !CCCryptorGCMSetIV(a6, [v24 bytes], objc_msgSend(v24, "length"))))
      {
        off_t v26 = 0LL;
        id v45 = v13;
        while (2)
        {
          ssize_t v27 = pread(v15, v12, 0x40000uLL, v26);
          ssize_t v28 = v27;
          if (v27)
          {
            if (v27 == -1)
            {
              int v18 = *__error();
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
              uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v41 oslog]);

              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                id v42 = [v13 fileSystemRepresentation];
                uint64_t v43 = strerror(v18);
                -[MobileAssetKeyManager decryptFileAtURL:iv:tag:cryptor:].cold.6( (uint64_t)v42,  (uint64_t)v43,  (uint64_t)v48);
              }
            }

            else
            {
              id v29 = v11;
              uint64_t v30 = v12;
              size_t v31 = v27;
              off_t v32 = v26;
              if (CCCryptorGCMDecrypt(a6, v12, v27, v12))
              {
                unsigned __int8 v44 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
                uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 oslog]);

                id v11 = v29;
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  -[MobileAssetKeyManager decryptFileAtURL:iv:tag:cryptor:].cold.5();
                  id v13 = v45;
                  int v18 = 92;
                }

                else
                {
                  int v18 = 92;
                  id v13 = v45;
                }
              }

              else
              {
                do
                {
                  ssize_t v33 = pwrite(v15, v30, v31, v32);
                  if (v33 == -1)
                  {
                    int v18 = *__error();
                    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
                    id v11 = v29;
                    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 oslog]);

                    id v13 = v45;
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                    {
                      id v37 = [v45 fileSystemRepresentation];
                      id v38 = strerror(v18);
                      -[MobileAssetKeyManager decryptFileAtURL:iv:tag:cryptor:].cold.3( (uint64_t)v37,  (uint64_t)v38,  (uint64_t)v48);
                    }

                    goto LABEL_6;
                  }

                  v30 += v33;
                  v32 += v33;
                  v31 -= v33;
                }

                while (v31);
                BOOL v34 = __OFADD__(v26, v28);
                v26 += v28;
                id v11 = v29;
                id v13 = v45;
                if (!v34) {
                  continue;
                }
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
                uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 oslog]);

                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                  -[MobileAssetKeyManager decryptFileAtURL:iv:tag:cryptor:].cold.4();
                }
                int v18 = 27;
              }
            }
          }

          else
          {
            id v39 = v11;
            if (!CCCryptorGCMFinalize(a6, [v39 bytes], objc_msgSend(v39, "length")))
            {
              int v18 = 0;
LABEL_7:
              if (close(v15) == -1) {
                -[MobileAssetKeyManager decryptFileAtURL:iv:tag:cryptor:].cold.2();
              }
              goto LABEL_12;
            }

            uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
            uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 oslog]);

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[MobileAssetKeyManager decryptFileAtURL:iv:tag:cryptor:].cold.7();
            }
            int v18 = 80;
          }

          break;
        }

- (id)copyDawToken:(BOOL)a3 useAppleConnect:(BOOL)a4 error:(id *)a5
{
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  off_t v26 = __Block_byref_object_copy__18;
  ssize_t v27 = __Block_byref_object_dispose__18;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy__18;
  id v21 = __Block_byref_object_dispose__18;
  id v22 = 0LL;
  unint64_t v9 = objc_autoreleasePoolPush();
  ssoQueue = (dispatch_queue_s *)self->_ssoQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __60__MobileAssetKeyManager_copyDawToken_useAppleConnect_error___block_invoke;
  v14[3] = &unk_350FA8;
  v14[4] = self;
  v14[5] = &v23;
  BOOL v15 = a3;
  BOOL v16 = a4;
  v14[6] = &v17;
  dispatch_sync(ssoQueue, v14);
  objc_autoreleasePoolPop(v9);
  if (a5)
  {
    id v11 = (void *)v18[5];
    if (v11) {
      *a5 = v11;
    }
  }

  id v12 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v12;
}

void __60__MobileAssetKeyManager_copyDawToken_useAppleConnect_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v5 + 40);
  id v6 = [v2 copyDawTokenInternal:v3 useAppleConnect:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)copyPersonalizationSSOToken:(BOOL)a3 error:(id *)a4
{
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = __Block_byref_object_copy__18;
  id v24 = __Block_byref_object_dispose__18;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = __Block_byref_object_copy__18;
  int v18 = __Block_byref_object_dispose__18;
  id v19 = 0LL;
  uint64_t v7 = objc_autoreleasePoolPush();
  ssoQueue = (dispatch_queue_s *)self->_ssoQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __59__MobileAssetKeyManager_copyPersonalizationSSOToken_error___block_invoke;
  v12[3] = &unk_350FD0;
  v12[4] = self;
  v12[5] = &v20;
  BOOL v13 = a3;
  v12[6] = &v14;
  dispatch_sync(ssoQueue, v12);
  objc_autoreleasePoolPop(v7);
  if (a4)
  {
    unint64_t v9 = (void *)v15[5];
    if (v9) {
      *a4 = v9;
    }
  }

  id v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __59__MobileAssetKeyManager_copyPersonalizationSSOToken_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 copyPersonalizationSSOTokenInternal:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getDecryptionKeyFromAssetMetadataOrDownloadOptions:(id)a3 downloadOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = __Block_byref_object_copy__18;
  size_t v31 = __Block_byref_object_dispose__18;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = __Block_byref_object_copy__18;
  id v25 = __Block_byref_object_dispose__18;
  id v26 = 0LL;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager keyManagerQueue](self, "keyManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __98__MobileAssetKeyManager_getDecryptionKeyFromAssetMetadataOrDownloadOptions_downloadOptions_error___block_invoke;
  block[3] = &unk_350FF8;
  id v19 = &v27;
  block[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  uint64_t v20 = &v21;
  dispatch_sync(v10, block);

  if (a5)
  {
    BOOL v13 = (void *)v22[5];
    if (v13) {
      *a5 = v13;
    }
  }

  id v14 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __98__MobileAssetKeyManager_getDecryptionKeyFromAssetMetadataOrDownloadOptions_downloadOptions_error___block_invoke( void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8LL);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = objc_claimAutoreleasedReturnValue( [v2 getDecryptionKeyFromAssetMetadataOrDownloadOptionsInternal:v3 downloadOptions:v4 error:&obj]);
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[7] + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)getDecryptionKeyFromKnoxUsingAssetAttributes:(id)a3 downloadOptions:(id)a4 apTicket:(id)a5 disableUI:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  id v38 = __Block_byref_object_copy__18;
  id v39 = __Block_byref_object_dispose__18;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = __Block_byref_object_copy__18;
  ssize_t v33 = __Block_byref_object_dispose__18;
  id v34 = 0LL;
  BOOL v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager keyManagerQueue](self, "keyManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __111__MobileAssetKeyManager_getDecryptionKeyFromKnoxUsingAssetAttributes_downloadOptions_apTicket_disableUI_error___block_invoke;
  block[3] = &unk_351020;
  id v26 = &v35;
  block[4] = self;
  id v16 = v12;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  id v18 = v14;
  BOOL v28 = a6;
  id v25 = v18;
  uint64_t v27 = &v29;
  dispatch_sync(v15, block);

  if (a7)
  {
    id v19 = (void *)v30[5];
    if (v19) {
      *a7 = v19;
    }
  }

  id v20 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

void __111__MobileAssetKeyManager_getDecryptionKeyFromKnoxUsingAssetAttributes_downloadOptions_apTicket_disableUI_error___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = objc_claimAutoreleasedReturnValue( [v2 getDecryptionKeyFromKnoxUsingAssetAttributesInternal:v3 downloadOptions:v4 apTicket:v5 disableUI:v6 error:&obj]);
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)getDecryptionKey:(id)a3 downloadOptions:(id)a4 apTicket:(id)a5 skipKnoxLookup:(BOOL)a6 disableUI:(BOOL)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v50 = 0LL;
  NSUInteger v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  uint64_t v53 = __Block_byref_object_copy__18;
  uint64_t v54 = __Block_byref_object_dispose__18;
  id v55 = 0LL;
  uint64_t v47 = 0LL;
  v48[0] = &v47;
  v48[1] = 0x3032000000LL;
  v48[2] = __Block_byref_object_copy__18;
  v48[3] = __Block_byref_object_dispose__18;
  id v49 = 0LL;
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager keyManagerQueue](self, "keyManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __98__MobileAssetKeyManager_getDecryptionKey_downloadOptions_apTicket_skipKnoxLookup_disableUI_error___block_invoke;
  block[3] = &unk_351048;
  uint64_t v43 = &v50;
  block[4] = self;
  id v18 = v14;
  id v40 = v18;
  id v19 = v15;
  id v41 = v19;
  unsigned __int8 v44 = &v47;
  BOOL v45 = a6;
  id v20 = v16;
  id v42 = v20;
  BOOL v46 = a7;
  dispatch_sync(v17, block);

  if (a8)
  {
    uint64_t v21 = *(void **)(v48[0] + 40LL);
    if (v21) {
      *a8 = v21;
    }
  }

  uint64_t v22 = (void *)v51[5];
  if (v22)
  {
    if ([v22 length] == (char *)&stru_20.nsects + 1 || objc_msgSend((id)v51[5], "length") == &stru_20)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v25 = "[GetDecryptionKey]: Successfully obtained decryption key";
        id v26 = v24;
        uint32_t v27 = 2;
LABEL_13:
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }

    else
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 oslog]);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = [(id)v51[5] length];
        *(_DWORD *)buf = 134217984;
        id v57 = v36;
        id v25 = "[GetDecryptionKey]: Length of decryption key(%lu) is invalid";
        id v26 = v24;
        uint32_t v27 = 12;
        goto LABEL_13;
      }
    }
  }

  else
  {
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager logger](self, "logger"));
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MobileAssetKeyManager getDecryptionKey:downloadOptions:apTicket:skipKnoxLookup:disableUI:error:].cold.1( (uint64_t)v48,  v24,  v29,  v30,  v31,  v32,  v33,  v34);
    }
  }

  id v37 = (id)v51[5];
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v50, 8);
  return v37;
}

void __98__MobileAssetKeyManager_getDecryptionKey_downloadOptions_apTicket_skipKnoxLookup_disableUI_error___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = objc_claimAutoreleasedReturnValue( [v2 getDecryptionKeyFromAssetMetadataOrDownloadOptionsInternal:v3 downloadOptions:v4 error:&obj]);
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)
    || *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL))
  {
    int v9 = *(unsigned __int8 *)(a1 + 80);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "[GetDecryptionKey]: Decryption key not found in asset metadata or download options and Knox lookup is disabled. Returning",  buf,  2u);
      }
    }

    else
    {
      if (v12)
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8LL);
        uint64_t v14 = *(void *)(v13 + 40);
        if (v14) {
          id v15 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(v13 + 40) description]);
        }
        else {
          id v15 = @"None";
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v15;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "[GetDecryptionKey]: Unable to obtain key from asset metadata (err: %{public}@). Attempting to query Knox",  buf,  0xCu);
        if (v14) {
      }
        }

      uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8LL);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = 0LL;

      id v18 = *(void **)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = *(void *)(a1 + 56);
      uint64_t v22 = *(unsigned __int8 *)(a1 + 81);
      uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8LL);
      id v26 = *(id *)(v23 + 40);
      uint64_t v24 = objc_claimAutoreleasedReturnValue( [v18 getDecryptionKeyFromKnoxUsingAssetAttributesInternal:v19 downloadOptions:v20 apTicket:v21 disableUI:v22 error:&v26]);
      objc_storeStrong((id *)(v23 + 40), v26);
      uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8LL);
      id v11 = *(os_log_s **)(v25 + 40);
      *(void *)(v25 + 40) = v24;
    }
  }

- (int64_t)decryptContentEncryptedAssetAtURL:(id)a3 assetAttributes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  uint64_t v31 = 30000LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__18;
  id v26 = __Block_byref_object_dispose__18;
  id v27 = 0LL;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MobileAssetKeyManager keyManagerQueue](self, "keyManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke;
  block[3] = &unk_351070;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  uint64_t v19 = self;
  uint64_t v20 = &v28;
  uint64_t v21 = &v22;
  dispatch_sync(v10, block);

  if (a5)
  {
    uint64_t v13 = (void *)v23[5];
    if (v13) {
      *a5 = v13;
    }
  }

  int64_t v14 = v29[3];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

void __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke( uint64_t a1)
{
  CCCryptorRef cryptorRef = 0LL;
  if (!*(void *)(a1 + 32) || (v2 = *(void **)(a1 + 40)) == 0LL)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_1( v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 30001LL;
    id v12 = @"Invalid arguments passed to decrypt content encrypted asset function";
    uint64_t v27 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) buildKeyManagerError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) underlying:0 description:@"Invalid arguments passed to decrypt content encrypted asset function"]);
    uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v3 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;
    goto LABEL_20;
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"_ContentEncryption"]);
  if (!v3
    || (p_ivars = &MobileAssetKeyManager__metaData.ivars,
        uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString),
        (objc_opt_isKindOfClass(v3, v5) & 1) == 0))
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_2( v30,  v31,  v32,  v33,  v34,  v35,  v36,  v37);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 30001LL;
    id v38 = *(void **)(a1 + 48);
    uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    id v12 = @"Asset does not support content encryption";
    goto LABEL_19;
  }

  if (([v3 isEqualToString:@"DSME"] & 1) == 0)
  {
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ContentEncryptionType %@ is unsupported",  v3));
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
    unsigned __int8 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 oslog]);

    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_5();
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 30001LL;
    id v38 = *(void **)(a1 + 48);
    uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
LABEL_19:
    uint64_t v40 = objc_claimAutoreleasedReturnValue([v38 buildKeyManagerError:v39 underlying:0 description:v12]);
    uint64_t v41 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;

    goto LABEL_20;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) URLByAppendingPathComponent:@"ContentProtection.plist" isDirectory:0]);
  id v111 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v6,  &v111));
  id v8 = v111;
  id v9 = *(void **)(a1 + 48);
  if (!v7 || v8)
  {
    BOOL v45 = (void *)objc_claimAutoreleasedReturnValue([v9 logger]);
    BOOL v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 oslog]);

    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_3( (uint64_t)v8,  v46,  v47);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 30027LL;
    id v12 = @"Failed to read content encrypted asset manifest";
    uint64_t v48 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) buildKeyManagerError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) underlying:0 description:@"Failed to read content encrypted asset manifest"]);
    uint64_t v49 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v50 = *(void **)(v49 + 40);
    *(void *)(v49 + 40) = v48;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fetchDSMEKey]);
    if (v10)
    {
      id v98 = v10;
      uint64_t v11 = CCCryptorCreateWithMode( 1u,  0xBu,  0,  0,  0,  [v98 bytes],  (size_t)objc_msgSend(v98, "length"),  0,  0,  0,  0,  &cryptorRef);
      if ((_DWORD)v11)
      {
        id v12 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create Cryptor object: %d",  v11));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
        int64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_5();
        }

        *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 30028LL;
        uint64_t v15 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) buildKeyManagerError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) underlying:0 description:v12]);
        uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8LL);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }

      else
      {
        v96 = v7;
        v97 = v6;
        __int128 v109 = 0u;
        __int128 v110 = 0u;
        __int128 v107 = 0u;
        __int128 v108 = 0u;
        id obj = v7;
        id v104 = [obj countByEnumeratingWithState:&v107 objects:v115 count:16];
        id v12 = 0LL;
        if (v104)
        {
          uint64_t v103 = *(void *)v108;
          do
          {
            unint64_t v63 = 0LL;
            unint64_t v64 = v12;
            do
            {
              if (*(void *)v108 != v103) {
                objc_enumerationMutation(obj);
              }
              uint64_t v65 = *(__CFString **)(*((void *)&v107 + 1) + 8LL * (void)v63);
              v106 = objc_autoreleasePoolPush();
              uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v65]);
              id v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:@"tag"]);
              id v68 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:@"nonce"]);
              if (v67
                && (uint64_t v69 = objc_opt_class(p_ivars[137]), (objc_opt_isKindOfClass(v67, v69) & 1) != 0)
                && v68
                && (uint64_t v70 = objc_opt_class(p_ivars[137]), (objc_opt_isKindOfClass(v68, v70) & 1) != 0))
              {
                __int128 v71 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v67,  0LL);
                v99 = v68;
                __int128 v72 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v68,  0LL);
                v73 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) URLByAppendingPathComponent:v65 isDirectory:0]);
                v101 = v72;
                v102 = v71;
                id v74 = [*(id *)(a1 + 48) decryptFileAtURL:v73 iv:v72 tag:v71 cryptor:cryptorRef];
                v100 = v73;
                if ((_DWORD)v74)
                {
                  id v75 = v74;
                  uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v73 path]);
                  uint64_t v77 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to decrypt %@: %d (%s)",  v76,  v75,  strerror((int)v75));
                  id v12 = (__CFString *)objc_claimAutoreleasedReturnValue(v77);

                  uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
                  uint64_t v79 = (os_log_s *)objc_claimAutoreleasedReturnValue([v78 oslog]);

                  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v114 = v12;
                    _os_log_error_impl( &dword_0,  v79,  OS_LOG_TYPE_ERROR,  "[DecryptContentEncryptedAsset]: %@",  buf,  0xCu);
                  }

                  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 30029LL;
                  uint64_t v80 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) buildKeyManagerError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) underlying:0 description:v12]);
                  uint64_t v81 = *(void *)(*(void *)(a1 + 64) + 8LL);
                  uint64_t v82 = *(void **)(v81 + 40);
                  *(void *)(v81 + 40) = v80;

                  CCCryptorRelease(cryptorRef);
                  int v83 = 1;
                }

                else
                {
                  uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
                  __int16 v91 = (os_log_s *)objc_claimAutoreleasedReturnValue([v90 oslog]);

                  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v114 = v65;
                    _os_log_impl( &dword_0,  v91,  OS_LOG_TYPE_DEFAULT,  "[DecryptContentEncryptedAsset]: Successfully decrypted %@",  buf,  0xCu);
                  }

                  int v83 = 0;
                  id v12 = v64;
                }

                v89 = v106;
                id v68 = v99;

                p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
              }

              else
              {
                id v12 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__objc2_ivar_list stringWithFormat:]( p_ivars[137],  "stringWithFormat:",  @"ContentProtection.plist entry for %@ does not contain a valid tag/iv",  v65));

                id v84 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
                v85 = (os_log_s *)objc_claimAutoreleasedReturnValue([v84 oslog]);

                if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v114 = v12;
                  _os_log_error_impl(&dword_0, v85, OS_LOG_TYPE_ERROR, "[DecryptContentEncryptedAsset]: %@", buf, 0xCu);
                }

                *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 30029LL;
                uint64_t v86 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) buildKeyManagerError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) underlying:0 description:v12]);
                uint64_t v87 = *(void *)(*(void *)(a1 + 64) + 8LL);
                id v88 = *(void **)(v87 + 40);
                *(void *)(v87 + 40) = v86;

                CCCryptorRelease(cryptorRef);
                int v83 = 1;
                p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
                v89 = v106;
              }

              objc_autoreleasePoolPop(v89);
              if (v83)
              {

                goto LABEL_58;
              }

              unint64_t v63 = (char *)v63 + 1;
              unint64_t v64 = v12;
            }

            while (v104 != v63);
            id v92 = [obj countByEnumeratingWithState:&v107 objects:v115 count:16];
            id v104 = v92;
          }

          while (v92);
        }

        __int16 v93 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
        id v94 = (os_log_s *)objc_claimAutoreleasedReturnValue([v93 oslog]);

        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          v95 = *(__CFString **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v114 = v95;
          _os_log_impl( &dword_0,  v94,  OS_LOG_TYPE_DEFAULT,  "[DecryptContentEncryptedAsset]: Successfully decrypted all files under %@",  buf,  0xCu);
        }

        *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 30000LL;
        CCCryptorRelease(cryptorRef);
LABEL_58:
        uint64_t v7 = v96;
        uint64_t v6 = v97;
        id v8 = 0LL;
      }

      uint64_t v50 = v98;
    }

    else
    {
      uint64_t v50 = 0LL;
      NSUInteger v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) logger]);
      uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue([v51 oslog]);

      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_4( v52,  v53,  v54,  v55,  v56,  v57,  v58,  v59);
      }

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 30026LL;
      id v12 = @"Failed to fetch dsme key for content encrypted asset";
      uint64_t v60 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) buildKeyManagerError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) underlying:0 description:@"Failed to fetch dsme key for content encrypted asset"]);
      uint64_t v61 = *(void *)(*(void *)(a1 + 64) + 8LL);
      uint64_t v62 = *(void **)(v61 + 40);
      *(void *)(v61 + 40) = v60;
    }
  }

LABEL_20:
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)keyManagerQueue
{
  return self->_keyManagerQueue;
}

- (OS_dispatch_queue)ssoQueue
{
  return self->_ssoQueue;
}

- (NSURLSession)knoxSession
{
  return self->_knoxSession;
}

- (void)setKnoxSession:(id)a3
{
}

- (NSURLSessionConfiguration)knoxSessionConfig
{
  return self->_knoxSessionConfig;
}

- (void)setKnoxSessionConfig:(id)a3
{
}

- (MAKeyManagerDownloadSessionDelegate)downloadSessionDelegate
{
  return self->_downloadSessionDelegate;
}

- (void)setDownloadSessionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)isWellFormedTokenFileName:.cold.1()
{
}

- (void)isWellFormedTokenFileName:.cold.2()
{
}

- (void)isWellFormedTokenFileName:.cold.3()
{
}

- (void)isWellFormedTokenFileName:.cold.4()
{
}

- (void)isWellFormedTokenFileName:.cold.5()
{
}

void __45__MobileAssetKeyManager_copyDawTokenFileName__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __45__MobileAssetKeyManager_copyDawTokenFileName__block_invoke_cold_2(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MobileAssetKeyManager copyDawTokenFileName]_block_invoke";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "%s: Unable to get token file path from NVRAM (Could not get main port [%d])",  (uint8_t *)&v2,  0x12u);
  OUTLINED_FUNCTION_12();
}

- (void)copyDawTokenFromOverrides
{
}

- (void)createGetDecryptionKeyRequestForKnox:authData:keyFetchBaseURLString:apTicket:assetAttributes:error:.cold.1()
{
  v3[0] = 138543874;
  OUTLINED_FUNCTION_9_2();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl( &dword_0,  v2,  OS_LOG_TYPE_ERROR,  "[KnoxDecryptionKeyRequest]: %{public}@ : Params: %{public}@, Error: %{public}@",  (uint8_t *)v3,  0x20u);
}

- (void)createGetDecryptionKeyRequestForKnox:authData:keyFetchBaseURLString:apTicket:assetAttributes:error:.cold.2()
{
  v2[0] = 138543618;
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_3_1(&dword_0, v0, v1, "[KnoxDecryptionKeyRequest]: %{public}@ : Params: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_12();
}

void __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_3()
{
}

void __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_4()
{
}

void __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_5()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_3_1( &dword_0,  v1,  (uint64_t)v1,  "[KnoxServerResponse]: Request failed with HTTP error: %{public}@\n%{public}@",  v2);
  OUTLINED_FUNCTION_12();
}

void __105__MobileAssetKeyManager_requestServerForDecryptionKey_recipientPrivateKey_downloadOptions_disableUI_err___block_invoke_cold_6()
{
}

- (void)getDecryptionKeyFromKnoxUsingAssetAttributesInternal:downloadOptions:apTicket:disableUI:error:.cold.1()
{
}

- (void)getDecryptionKeyFromKnoxUsingAssetAttributesInternal:(uint64_t)a3 downloadOptions:(uint64_t)a4 apTicket:(uint64_t)a5 disableUI:(uint64_t)a6 error:(uint64_t)a7 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getDecryptionKeyFromKnoxUsingAssetAttributesInternal:(uint64_t)a3 downloadOptions:(uint64_t)a4 apTicket:(uint64_t)a5 disableUI:(uint64_t)a6 error:(uint64_t)a7 .cold.3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getDecryptionKeyFromKnoxUsingAssetAttributesInternal:downloadOptions:apTicket:disableUI:error:.cold.4()
{
}

- (void)getDecryptionKeyFromAssetMetadataOrDownloadOptionsInternal:(uint64_t)a3 downloadOptions:(uint64_t)a4 error:(uint64_t)a5 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)decryptFileAtURL:(uint64_t)a3 iv:tag:cryptor:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)decryptFileAtURL:iv:tag:cryptor:.cold.2()
{
  uint64_t v0 = __error();
  uint64_t v1 = _os_assert_log(*v0);
  _os_crash(v1);
  __break(1u);
}

- (void)decryptFileAtURL:(uint64_t)a3 iv:tag:cryptor:.cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)decryptFileAtURL:iv:tag:cryptor:.cold.4()
{
}

- (void)decryptFileAtURL:iv:tag:cryptor:.cold.5()
{
}

- (void)decryptFileAtURL:(uint64_t)a3 iv:tag:cryptor:.cold.6(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)decryptFileAtURL:iv:tag:cryptor:.cold.7()
{
}

- (void)decryptFileAtURL:iv:tag:cryptor:.cold.8()
{
}

- (void)decryptFileAtURL:iv:tag:cryptor:.cold.9()
{
}

- (void)getDecryptionKey:(uint64_t)a3 downloadOptions:(uint64_t)a4 apTicket:(uint64_t)a5 skipKnoxLookup:(uint64_t)a6 disableUI:(uint64_t)a7 error:(uint64_t)a8 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_3( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  int v3 = 138412546;
  uint64_t v4 = @"Failed to read content encrypted asset manifest";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_3_1(&dword_0, a2, a3, "[DecryptContentEncryptedAsset]: %@ : %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_12();
}

void __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_4( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __81__MobileAssetKeyManager_decryptContentEncryptedAssetAtURL_assetAttributes_error___block_invoke_cold_5()
{
}

@end