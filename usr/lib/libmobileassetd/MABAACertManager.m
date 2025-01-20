@interface MABAACertManager
+ (BOOL)isSupported;
+ (id)certificateParameters;
+ (id)certificateSubject;
+ (id)keyParameters;
- (BOOL)shouldInvalidateExistingCertificateIfAny;
- (MABAACertManager)initWithCertType:(int)a3;
- (OS_dispatch_queue)certManagerQueue;
- (OS_dispatch_queue)deviceIdentityQueue;
- (SUCoreLog)logger;
- (id)copyBase64EncodedCertificateChain:(BOOL)a3 referenceKey:(__SecKey *)a4;
- (id)copyCurrentBootManifestHash;
- (id)copyDeviceIdentityOptionsForCertAndRequestType:(int)a3 skipNetworkRequest:(BOOL)a4 invalidateExistingCert:(BOOL)a5;
- (id)copyPreviouslyCreatedCertsIfPresent:(__SecKey *)a3;
- (id)issueAndCopyCerts:(__SecKey *)a3;
- (id)issueAndCopyCertsInternal:(__SecKey *)a3;
- (id)issueAndCopySelfSignedCert:(__SecKey *)a3;
- (id)issueSelfSignedCertInternal:(__SecKey *)a3;
- (int)certType;
- (void)setCertType:(int)a3;
@end

@implementation MABAACertManager

- (MABAACertManager)initWithCertType:(int)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MABAACertManager;
  v4 = -[MABAACertManager init](&v18, "init");
  if (v4)
  {
    v5 = -[SUCoreLog initWithCategory:]( objc_alloc(&OBJC_CLASS___SUCoreLog),  "initWithCategory:",  @"MA-BAA-CERT-MANAGER");
    logger = v4->_logger;
    v4->_logger = v5;

    v7 = (const char *)[@"com.apple.MobileAsset.daemon.baacertmanagerQueue" UTF8String];
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create(v7, v9);
    certManagerQueue = v4->_certManagerQueue;
    v4->_certManagerQueue = (OS_dispatch_queue *)v10;

    v12 = (const char *)[@"com.apple.MobileAsset.daemon.deviceIdentityQueue" UTF8String];
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create(v12, v14);
    deviceIdentityQueue = v4->_deviceIdentityQueue;
    v4->_deviceIdentityQueue = (OS_dispatch_queue *)v15;

    v4->_certType = a3;
  }

  return v4;
}

+ (BOOL)isSupported
{
  if (__isPlatformVersionAtLeast(3, 17, 4, 0))
  {
    if (&_DeviceIdentityIssueClientCertificateWithCompletion) {
      BOOL v2 = &_DeviceIdentityIsSupported == 0LL;
    }
    else {
      BOOL v2 = 1;
    }
    if (!v2 && kMAOptionsBAAAccessControls && kMAOptionsBAAValidity && kMAOptionsBAAOIDSToInclude) {
      int IsSupported = DeviceIdentityIsSupported();
    }
    else {
      int IsSupported = 0;
    }
    if (&_os_variant_is_recovery) {
      return IsSupported & ~os_variant_is_recovery("com.apple.MobileAsset");
    }
  }

  else
  {
    LOBYTE(IsSupported) = 0;
  }

  return IsSupported;
}

- (id)issueAndCopyCerts:(__SecKey *)a3
{
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = __Block_byref_object_copy__17;
  dispatch_queue_t v15 = __Block_byref_object_dispose__17;
  id v16 = 0LL;
  if (+[MABAACertManager isSupported](&OBJC_CLASS___MABAACertManager, "isSupported"))
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABAACertManager certManagerQueue](self, "certManagerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __38__MABAACertManager_issueAndCopyCerts___block_invoke;
    block[3] = &unk_350E48;
    block[4] = self;
    block[5] = &v11;
    block[6] = a3;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
    dispatch_queue_attr_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MABAACertManager issueAndCopyCerts:].cold.1();
    }

    id v6 = 0LL;
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __38__MABAACertManager_issueAndCopyCerts___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) issueAndCopyCertsInternal:*(void *)(a1 + 48)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)issueAndCopySelfSignedCert:(__SecKey *)a3
{
  uint64_t v9 = 0LL;
  dispatch_queue_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = __Block_byref_object_copy__17;
  uint64_t v13 = __Block_byref_object_dispose__17;
  id v14 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABAACertManager certManagerQueue](self, "certManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __47__MABAACertManager_issueAndCopySelfSignedCert___block_invoke;
  block[3] = &unk_350E70;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __47__MABAACertManager_issueAndCopySelfSignedCert___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Attempting to generate self signed cert", v9, 2u);
  }

  uint64_t v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) issueSelfSignedCertInternal:*(void *)(a1 + 48)]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    dispatch_queue_attr_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __47__MABAACertManager_issueAndCopySelfSignedCert___block_invoke_cold_1();
    }
  }

- (id)copyBase64EncodedCertificateChain:(BOOL)a3 referenceKey:(__SecKey *)a4
{
  uint64_t v14 = 0LL;
  dispatch_queue_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = __Block_byref_object_copy__17;
  objc_super v18 = __Block_byref_object_dispose__17;
  id v19 = 0LL;
  if (+[MABAACertManager isSupported](&OBJC_CLASS___MABAACertManager, "isSupported"))
  {
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABAACertManager certManagerQueue](self, "certManagerQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = __67__MABAACertManager_copyBase64EncodedCertificateChain_referenceKey___block_invoke;
    v12[3] = &unk_350E98;
    v12[4] = self;
    v12[5] = &v14;
    v12[6] = a4;
    BOOL v13 = a3;
    dispatch_sync(v7, v12);

    id v8 = (id)v15[5];
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
    dispatch_queue_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MABAACertManager issueAndCopyCerts:].cold.1();
    }

    id v8 = 0LL;
  }

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __67__MABAACertManager_copyBase64EncodedCertificateChain_referenceKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) issueAndCopyCertsInternal:*(void *)(a1 + 48)]);
  if (v2)
  {
    context = objc_autoreleasePoolPush();
    v27 = v2;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v3 = v2;
    id v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(v3);
          }
          CFDataRef v8 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v28 + 1) + 8LL * (void)i));
          uint64_t v9 = objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v8, "base64EncodedStringWithOptions:", 0LL, context));
          if (!v9)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
            objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "Failed to create base64 encoded certificate string for one of the certs in the chain",  buf,  2u);
            }

            uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8LL);
            v20 = *(void **)(v19 + 40);
            *(void *)(v19 + 40) = 0LL;

            v21 = *(void **)(a1 + 48);
            if (v21 && *v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
              v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Clearing out generated key", buf, 2u);
              }

              **(void **)(a1 + 48) = 0LL;
            }

            goto LABEL_23;
          }

          dispatch_queue_t v10 = (void *)v9;
          if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
          {
            uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
            BOOL v13 = *(void **)(v12 + 40);
            *(void *)(v12 + 40) = v11;
          }

          if (*(_BYTE *)(a1 + 56))
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v10 stringByReplacingOccurrencesOfString:@"/" withString:@"_"]);
            dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 stringByReplacingOccurrencesOfString:@"+" withString:@"-"]);

            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"="));
            dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByTrimmingCharactersInSet:v16]);
          }

          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
        }

        id v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (id)copyCurrentBootManifestHash
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __47__MABAACertManager_copyCurrentBootManifestHash__block_invoke;
  block[3] = &unk_34DBC0;
  block[4] = self;
  if (copyCurrentBootManifestHash_readBootManifestHashDispatchOnce != -1) {
    dispatch_once(&copyCurrentBootManifestHash_readBootManifestHashDispatchOnce, block);
  }
  return (id)copyCurrentBootManifestHash_currentBootManifestHash;
}

void __47__MABAACertManager_copyCurrentBootManifestHash__block_invoke(uint64_t a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (v2)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, @"boot-manifest-hash", kCFAllocatorDefault, 0);
    id v4 = (void *)copyCurrentBootManifestHash_currentBootManifestHash;
    copyCurrentBootManifestHash_currentBootManifestHash = (uint64_t)CFProperty;

    uint64_t v5 = copyCurrentBootManifestHash_currentBootManifestHash;
    if (copyCurrentBootManifestHash_currentBootManifestHash
      && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
      CFDataRef v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        uint64_t v9 = "Successfully read current boot-manifest-hash";
        dispatch_queue_t v10 = (uint8_t *)&v14;
LABEL_11:
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "Value read from chosen node is invalid. Could not obtain boot-manifest-hash",  buf,  2u);
      }

      CFDataRef v8 = (os_log_s *)copyCurrentBootManifestHash_currentBootManifestHash;
      copyCurrentBootManifestHash_currentBootManifestHash = 0LL;
    }
  }

  else
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    CFDataRef v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      uint64_t v9 = "Unable to get entry for chosen device tree node. Could not obtain boot-manifest-hash";
      dispatch_queue_t v10 = v16;
      goto LABEL_11;
    }
  }
}

- (BOOL)shouldInvalidateExistingCertificateIfAny
{
  id v3 = -[MABAACertManager copyCurrentBootManifestHash](self, "copyCurrentBootManifestHash");
  id v4 = _MAPreferencesCopyNSDataValue(@"BootManifestHashForLastCert");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  BOOL v7 = v3 && ![v5 isEqual:v3];
  CFDataRef v8 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v10 = @"does not need";
    if (v7) {
      dispatch_queue_t v10 = @"needs";
    }
    uint64_t v11 = @"Exists";
    if (v3) {
      uint64_t v12 = @"Exists";
    }
    else {
      uint64_t v12 = @"Does not exist";
    }
    int v14 = 138412802;
    dispatch_queue_t v15 = v10;
    __int16 v16 = 2112;
    v17 = v12;
    if (!v6) {
      uint64_t v11 = @"Does not exist";
    }
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Existing cert(if any) %@ to be invalidated: Current manifesthash: %@ previousManifestHash: %@",  (uint8_t *)&v14,  0x20u);
  }

  return v7;
}

- (id)copyDeviceIdentityOptionsForCertAndRequestType:(int)a3 skipNetworkRequest:(BOOL)a4 invalidateExistingCert:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v10 = kMAOptionsBAAOIDHardwareProperties;
  uint64_t v11 = kMAOptionsBAAOIDDeviceOSInformation;
  v34[0] = kMAOptionsBAAOIDHardwareProperties;
  v34[1] = kMAOptionsBAAOIDDeviceOSInformation;
  uint64_t v12 = kMAOptionsBAAOIDProductType;
  v34[2] = kMAOptionsBAAOIDProductType;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 3LL));
  v33[0] = v10;
  v33[1] = v11;
  v33[2] = v12;
  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 3LL));
  CFErrorRef error = 0LL;
  SecAccessControlRef v15 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0x40000000uLL, &error);
  __int16 v16 = (NSMutableDictionary *)v15;
  if (error || !v15)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MABAACertManager copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:].cold.3( (uint64_t *)&error,  v20,  v21);
    }

    if (v16) {
      goto LABEL_14;
    }
  }

  else
  {
    if (!v9)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MABAACertManager copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:].cold.1();
      }
      goto LABEL_13;
    }

    if (a3 >= 2)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MABAACertManager copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:].cold.2();
      }
LABEL_13:

LABEL_14:
      CFRelease(v16);
      __int16 v16 = 0LL;
      goto LABEL_15;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  @"com.apple.mobileassetd",  kMAOptionsBAAKeychainAccessGroup);
    if (a3) {
      v24 = @"com.apple.mobileassetd.downloadcert";
    }
    else {
      v24 = @"com.apple.mobileassetd.scancert";
    }
    if (a3) {
      v25 = v14;
    }
    else {
      v25 = v13;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v24,  kMAOptionsBAAKeychainLabel);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v25,  kMAOptionsBAAOIDSToInclude);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  &off_38F0D0,  kMAOptionsBAAValidity);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kMAOptionsBAASCRTAttestation);
    v26 = &kMAOptionsBAANetworkTimeoutInterval;
    if (v6)
    {
      v26 = &kMAOptionsBAASkipNetworkRequest;
      v27 = (_UNKNOWN **)&__kCFBooleanTrue;
    }

    else
    {
      v27 = &off_38F0E8;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v27, *v26);
    if (v5) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kMAOptionsBAADeleteExistingKeysAndCerts);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v16,  kMAOptionsBAAAccessControls);
    CFRelease(v16);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
    __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Options for DeviceIdentity call are: %@", buf, 0xCu);
    }

    __int16 v16 = v9;
  }

- (id)copyPreviouslyCreatedCertsIfPresent:(__SecKey *)a3
{
  if (+[MABAACertManager isSupported](&OBJC_CLASS___MABAACertManager, "isSupported"))
  {
    BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABAACertManager certManagerQueue](self, "certManagerQueue"));
    dispatch_assert_queue_V2(v5);

    uint64_t v49 = 0LL;
    v50 = &v49;
    uint64_t v51 = 0x3032000000LL;
    v52 = __Block_byref_object_copy__17;
    v53 = __Block_byref_object_dispose__17;
    id v54 = 0LL;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    uint64_t v43 = 0LL;
    v44 = &v43;
    uint64_t v45 = 0x3032000000LL;
    v46 = __Block_byref_object_copy__17;
    v47 = __Block_byref_object_dispose__17;
    id v48 = 0LL;
    uint64_t v39 = 0LL;
    v40 = &v39;
    uint64_t v41 = 0x2020000000LL;
    uint64_t v42 = 0LL;
    BOOL v7 = -[MABAACertManager shouldInvalidateExistingCertificateIfAny](self, "shouldInvalidateExistingCertificateIfAny");
    id v8 = -[MABAACertManager copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:]( self,  "copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:",  self->_certType,  1LL,  v7);
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager deviceIdentityQueue](self, "deviceIdentityQueue"));
      __int128 v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472LL;
      __int128 v31 = __56__MABAACertManager_copyPreviouslyCreatedCertsIfPresent___block_invoke;
      v32 = &unk_350EC0;
      BOOL v38 = v7;
      v33 = self;
      v35 = &v49;
      v36 = &v39;
      v37 = &v43;
      uint64_t v10 = v6;
      v34 = v10;
      DeviceIdentityIssueClientCertificateWithCompletion(v9, v8, &v29);

      dispatch_time_t v11 = dispatch_time(0LL, 4000000000LL);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger", v29, v30, v31, v32, v33));
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "Waiting for DeviceIdentity to return stashed certificate",  buf,  2u);
      }

      if (dispatch_semaphore_wait(v10, v11))
      {
        int v14 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
        SecAccessControlRef v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[MABAACertManager copyPreviouslyCreatedCertsIfPresent:].cold.2();
        }

        id v16 = 0LL;
      }

      else
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = v44[5];
          v24 = v23 ? @"Failure" : @"Success";
          v25 = v7 ? @"invalidating" : @"reading back";
          v26 = v23
              ? (__CFString *)objc_claimAutoreleasedReturnValue([(id)v44[5] description])
              : &stru_355768;
          *(_DWORD *)buf = 138412802;
          v56 = v24;
          __int16 v57 = 2112;
          v58 = v25;
          __int16 v59 = 2112;
          v60 = v26;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%@ %@ stashed certificate %@", buf, 0x20u);
          if (v23) {
        }
          }

        if (!v44[5])
        {
          if (a3)
          {
            v27 = (__SecKey *)v40[3];
            if (v27) {
              *a3 = v27;
            }
          }
        }

        id v16 = (id)v50[5];
      }
    }

    else
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MABAACertManager copyPreviouslyCreatedCertsIfPresent:].cold.1();
      }

      id v16 = 0LL;
    }

    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v49, 8);
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MABAACertManager issueAndCopyCerts:].cold.1();
    }

    return 0LL;
  }

  return v16;
}

void __56__MABAACertManager_copyPreviouslyCreatedCertsIfPresent___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Read stashed cert callback running", buf, 2u);
  }

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), a4);
    dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __56__MABAACertManager_copyPreviouslyCreatedCertsIfPresent___block_invoke_cold_2(a1, (uint64_t)v8, v12);
    }
LABEL_6:

    goto LABEL_7;
  }

  if (*(_BYTE *)(a1 + 72))
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Previously generated certs invalidated successfully", v22, 2u);
    }

    goto LABEL_6;
  }

  int v14 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v7);
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  v17 = (char *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

  if (v17 == (_BYTE *)&dword_0 + 2)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Saving reference key", v23, 2u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = a2;
  }

  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __56__MABAACertManager_copyPreviouslyCreatedCertsIfPresent___block_invoke_cold_1(a1 + 48, v19);
    }

    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = 0LL;
  }

- (id)issueAndCopyCertsInternal:(__SecKey *)a3
{
  if (+[MABAACertManager isSupported](&OBJC_CLASS___MABAACertManager, "isSupported"))
  {
    BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABAACertManager certManagerQueue](self, "certManagerQueue"));
    dispatch_assert_queue_V2(v5);

    uint64_t v47 = 0LL;
    id v48 = &v47;
    uint64_t v49 = 0x3032000000LL;
    v50 = __Block_byref_object_copy__17;
    uint64_t v51 = __Block_byref_object_dispose__17;
    id v52 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x3032000000LL;
    v44 = __Block_byref_object_copy__17;
    uint64_t v45 = __Block_byref_object_dispose__17;
    id v46 = 0LL;
    uint64_t v37 = 0LL;
    BOOL v38 = &v37;
    uint64_t v39 = 0x2020000000LL;
    uint64_t v40 = 0LL;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    id v7 = -[MABAACertManager copyPreviouslyCreatedCertsIfPresent:](self, "copyPreviouslyCreatedCertsIfPresent:", a3);
    id v8 = (void *)v48[5];
    v48[5] = (uint64_t)v7;

    if (v48[5])
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Found previoulsy generated certs. Returning those", buf, 2u);
      }
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Attempting to generate certificate via network", buf, 2u);
      }

      id v17 = -[MABAACertManager copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:]( self,  "copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:",  self->_certType,  0LL,  0LL);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager deviceIdentityQueue](self, "deviceIdentityQueue"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = __46__MABAACertManager_issueAndCopyCertsInternal___block_invoke;
      v32[3] = &unk_350EE8;
      v32[4] = self;
      v34 = &v47;
      v35 = &v37;
      v36 = &v41;
      uint64_t v19 = v6;
      v33 = v19;
      DeviceIdentityIssueClientCertificateWithCompletion(v18, v17, v32);

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Waiting for cert generation to complete", buf, 2u);
      }

      dispatch_time_t v22 = dispatch_time(0LL, 60000000000LL);
      uint64_t v23 = dispatch_semaphore_wait(v19, v22);
      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[MABAACertManager issueAndCopyCertsInternal:].cold.1();
        }
      }

      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 oslog]);

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = v42[5];
          __int128 v29 = v28 ? @"Failed to generate" : @"Successfully generated";
          uint64_t v30 = v28
              ? (__CFString *)objc_claimAutoreleasedReturnValue([(id)v42[5] description])
              : &stru_355768;
          *(_DWORD *)buf = 138412546;
          id v54 = v29;
          __int16 v55 = 2112;
          v56 = v30;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%@ certificate over network %@", buf, 0x16u);
          if (v28) {
        }
          }

        if (!v42[5])
        {
          if (a3)
          {
            __int128 v31 = (__SecKey *)v38[3];
            if (v31) {
              *a3 = v31;
            }
          }
        }
      }

      if (v23)
      {
        id v11 = 0LL;
        goto LABEL_33;
      }
    }

    id v11 = (id)v48[5];
LABEL_33:

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&v47, 8);
    return v11;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
  BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[MABAACertManager issueAndCopyCerts:].cold.1();
  }

  return 0LL;
}

void __46__MABAACertManager_issueAndCopyCertsInternal___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), a4);
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v21 = [v7 count];
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "No error in callback..Num certificates is %lu", buf, 0xCu);
    }

    id v11 = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", v7);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
    BOOL v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    int v14 = (char *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (v14 == (_BYTE *)&dword_0 + 2)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Saving reference key", buf, 2u);
      }

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = a2;
    }

    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __46__MABAACertManager_issueAndCopyCertsInternal___block_invoke_cold_1();
      }

      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8LL);
      __int16 v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = 0LL;
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __46__MABAACertManager_issueAndCopyCertsInternal___block_invoke_237;
      block[3] = &unk_34DBC0;
      block[4] = *(void *)(a1 + 32);
      if (kMADeviceIdentityQueue_block_invoke_storeBootManifestHashDispatchOnce != -1) {
        dispatch_once(&kMADeviceIdentityQueue_block_invoke_storeBootManifestHashDispatchOnce, block);
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __46__MABAACertManager_issueAndCopyCertsInternal___block_invoke_237(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) copyCurrentBootManifestHash];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Storing BootManifestHash(%@) present during cert generation",  (uint8_t *)&v5,  0xCu);
  }

  _MAPreferencesSetDataValue( @"BootManifestHashForLastCert",  v2,  @"MABAACertManager",  @"BAA Certificate regenerated");
}

+ (id)keyParameters
{
  v3[0] = kSecAttrKeyType;
  v3[1] = kSecAttrKeySizeInBits;
  v4[0] = kSecAttrKeyTypeECSECPrimeRandom;
  v4[1] = &off_38F100;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

+ (id)certificateSubject
{
  v14[0] = kSecOidCommonName;
  v14[1] = @"com.apple.mobileassetd.InternalKeyWrappingCertificate";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  uint64_t v15 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  v16[0] = v3;
  v12[0] = kSecOidCountryName;
  v12[1] = @"US";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  BOOL v13 = v4;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  v16[1] = v5;
  v10[0] = kSecOidOrganization;
  v10[1] = @"Apple Inc";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  id v11 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  uint8_t v16[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));

  return v8;
}

+ (id)certificateParameters
{
  uint64_t v3 = kSecCertificateLifetime;
  id v4 = &off_38F118;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (id)issueSelfSignedCertInternal:(__SecKey *)a3
{
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABAACertManager certManagerQueue](self, "certManagerQueue"));
  dispatch_assert_queue_V2(v5);

  CFErrorRef v21 = 0LL;
  id v6 = [(id)objc_opt_class(self) keyParameters];
  id v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = SecKeyCreateRandomKey(v7, &v21);

  if (v8)
  {
    SecKeyRef v9 = SecKeyCopyPublicKey(v8);
    id v10 = [(id)objc_opt_class(self) certificateSubject];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = [(id)objc_opt_class(self) certificateParameters];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    SelfSignedCertificate = (const void *)SecGenerateSelfSignedCertificate(v11, v13, v9, v8);

    if (SelfSignedCertificate)
    {
      dispatch_time_t v22 = SelfSignedCertificate;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
      if (a3) {
        *a3 = (__SecKey *)CFRetain(v8);
      }
      CFRelease(SelfSignedCertificate);
      if (!v9) {
        goto LABEL_7;
      }
    }

    else
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "[issueSelfSignedCert]: Failed to obtain self signed certificate",  buf,  2u);
      }

      uint64_t v15 = 0LL;
      if (!v9) {
        goto LABEL_7;
      }
    }

    CFRelease(v9);
LABEL_7:
    CFRelease(v8);
    return v15;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MABAACertManager logger](self, "logger"));
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFErrorRef v24 = v21;
    _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "[issueSelfSignedCert]: Failed to create wrapping key for self signed cert: %@",  buf,  0xCu);
  }

  uint64_t v15 = 0LL;
  return v15;
}

- (int)certType
{
  return self->_certType;
}

- (void)setCertType:(int)a3
{
  self->_certType = a3;
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)certManagerQueue
{
  return self->_certManagerQueue;
}

- (OS_dispatch_queue)deviceIdentityQueue
{
  return self->_deviceIdentityQueue;
}

- (void).cxx_destruct
{
}

- (void)issueAndCopyCerts:.cold.1()
{
}

void __47__MABAACertManager_issueAndCopySelfSignedCert___block_invoke_cold_1()
{
}

- (void)copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:.cold.1()
{
}

- (void)copyDeviceIdentityOptionsForCertAndRequestType:skipNetworkRequest:invalidateExistingCert:.cold.2()
{
}

- (void)copyDeviceIdentityOptionsForCertAndRequestType:(uint64_t *)a1 skipNetworkRequest:(os_log_s *)a2 invalidateExistingCert:(uint64_t)a3 .cold.3( uint64_t *a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_7_0(&dword_0, a2, a3, "Failed to create accessControl struct. Bailing : %@", (uint8_t *)&v4);
}

- (void)copyPreviouslyCreatedCertsIfPresent:.cold.1()
{
}

- (void)copyPreviouslyCreatedCertsIfPresent:.cold.2()
{
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Timed out waiting for stashed certs to be returned", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __56__MABAACertManager_copyPreviouslyCreatedCertsIfPresent___block_invoke_cold_1( uint64_t a1,  os_log_s *a2)
{
  id v3 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) count];
  int v5 = 134217984;
  id v6 = v3;
  OUTLINED_FUNCTION_7_0(&dword_0, a2, v4, "Got back a unexpected number of certificates :%lu", (uint8_t *)&v5);
}

void __56__MABAACertManager_copyPreviouslyCreatedCertsIfPresent___block_invoke_cold_2( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  id v3 = @"invalidate";
  if (!*(_BYTE *)(a1 + 72)) {
    id v3 = @"read back";
  }
  int v4 = 138412546;
  int v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to %@ certificates: %@", (uint8_t *)&v4, 0x16u);
}

- (void)issueAndCopyCertsInternal:.cold.1()
{
}

void __46__MABAACertManager_issueAndCopyCertsInternal___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0( &dword_0,  v0,  v1,  "DeviceIdentity returned a unexpected number of certs. Skipping returning certs to user",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

@end