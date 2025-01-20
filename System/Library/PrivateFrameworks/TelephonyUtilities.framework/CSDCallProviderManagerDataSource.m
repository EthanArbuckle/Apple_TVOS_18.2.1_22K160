@interface CSDCallProviderManagerDataSource
+ (id)dataForProviders:(id)a3;
- (BOOL)_saveProviders:(id)a3 forKeychainItem:(id)a4 error:(id *)a5;
- (BOOL)isDevicePasscodeLocked;
- (BOOL)isProviderInstalled:(id)a3;
- (BOOL)isRelayCallingGuaranteed;
- (BOOL)isSymbolicLinkAtURL:(id)a3;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDCallProviderManagerDataSource)initWithSerialQueue:(id)a3;
- (CSDCallProviderManagerDataSource)initWithSerialQueue:(id)a3 localKeychainItem:(id)a4 pairedHostKeychainItem:(id)a5;
- (CSDCallProviderManagerDataSourceDelegate)delegate;
- (CSDKeychainPersistentStoreProtocol)keychainItem;
- (CSDKeychainPersistentStoreProtocol)pairedHostKeychainItem;
- (CSDSandboxExtensionDirectory)ringtonesSandboxExtensionDirectory;
- (NSDictionary)registeredLocalProvidersByIdentifier;
- (NSDictionary)registeredPairedHostDeviceProvidersByIdentifier;
- (NSSet)providerIdentifiersForExistingCalls;
- (OS_dispatch_queue)queue;
- (id)_providersForKeychainItem:(id)a3;
- (id)_providersForPreferenceKey:(id)a3;
- (id)createLinkIfNecessaryWithFilename:(id)a3 toURL:(id)a4;
- (id)dialAssistedDialRequestForDialRequest:(id)a3;
- (id)preferencesForKeyBlock;
- (void)callsChangedForCallCenterObserver:(id)a3;
- (void)dealloc;
- (void)didChangeRelayCallingAvailability;
- (void)handleApplicationUnregisteredNotification:(id)a3;
- (void)moveExistingPreferencesToKeychain;
- (void)openUserActivity:(id)a3 usingApplicationWithBundleIdentifier:(id)a4 frontBoardOptions:(id)a5 completion:(id)a6;
- (void)removeLinksForFilenamesNotInArray:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferencesForKeyBlock:(id)a3;
- (void)setProviderIdentifiersForExistingCalls:(id)a3;
- (void)setRegisteredLocalProvidersByIdentifier:(id)a3;
- (void)setRegisteredPairedHostDeviceProvidersByIdentifier:(id)a3;
@end

@implementation CSDCallProviderManagerDataSource

- (CSDCallProviderManagerDataSource)initWithSerialQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___CSDKeychainPasswordItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDKeychainPasswordItem serviceName](&OBJC_CLASS___CSDKeychainPasswordItem, "serviceName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSDKeychainPasswordItem accessGroupName](&OBJC_CLASS___CSDKeychainPasswordItem, "accessGroupName"));
  v8 = -[CSDKeychainPasswordItem initWithService:account:accessGroup:]( v5,  "initWithService:account:accessGroup:",  v6,  @"registeredProviders",  v7);

  v9 = objc_alloc(&OBJC_CLASS___CSDKeychainPasswordItem);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSDKeychainPasswordItem serviceName](&OBJC_CLASS___CSDKeychainPasswordItem, "serviceName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSDKeychainPasswordItem accessGroupName](&OBJC_CLASS___CSDKeychainPasswordItem, "accessGroupName"));
  v12 = -[CSDKeychainPasswordItem initWithService:account:accessGroup:]( v9,  "initWithService:account:accessGroup:",  v10,  @"registeredRelayProviders",  v11);

  v13 = -[CSDCallProviderManagerDataSource initWithSerialQueue:localKeychainItem:pairedHostKeychainItem:]( self,  "initWithSerialQueue:localKeychainItem:pairedHostKeychainItem:",  v4,  v8,  v12);
  return v13;
}

- (CSDCallProviderManagerDataSource)initWithSerialQueue:(id)a3 localKeychainItem:(id)a4 pairedHostKeychainItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CSDCallProviderManagerDataSource;
  v12 = -[CSDCallProviderManagerDataSource init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](v13, "queue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001554B8;
    v16[3] = &unk_1003D7B28;
    v17 = v13;
    id v18 = v10;
    id v19 = v11;
    id v20 = v9;
    dispatch_async(v14, v16);
  }

  return v13;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDCallProviderManagerDataSource;
  -[CSDCallProviderManagerDataSource dealloc](&v4, "dealloc");
}

- (BOOL)isRelayCallingGuaranteed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSDCallCapabilities sharedInstance](&OBJC_CLASS___CSDCallCapabilities, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 callCapabilitiesState]);
  BOOL v4 = [v3 relayCallingAvailability] == 2;

  return v4;
}

- (NSDictionary)registeredLocalProvidersByIdentifier
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallProviderManager defaultProviders](&OBJC_CLASS___TUCallProviderManager, "defaultProviders"));
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }

      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }

    while (v7);
  }

  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"registeredProvidersVersion",  TUBundleIdentifierTelephonyUtilitiesFramework,  0LL);
  if (AppIntegerValue < 1)
  {
    CFIndex v17 = AppIntegerValue;
    id v18 = sub_1001704C4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      CFIndex v40 = v17;
      __int16 v41 = 1024;
      int v42 = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not loading registered providers because current registered providers version is %ld and minimum version is %d",  buf,  0x12u);
    }
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource keychainItem](self, "keychainItem"));
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerDataSource _providersForKeychainItem:]( self,  "_providersForKeychainItem:",  v13));

    if (-[os_log_s count](v14, "count"))
    {
      id v15 = sub_1001704C4();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Found local providers from keychain",  buf,  2u);
      }
    }

    else
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerDataSource _providersForPreferenceKey:]( self,  "_providersForPreferenceKey:",  @"registeredProviders"));
      v16 = v14;
      v14 = (os_log_s *)v20;
    }

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v19 = v14;
    id v21 = -[os_log_s countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v31,  v43,  16LL);
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (j = 0LL; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v19);
          }
          v25 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier", (void)v31));
          [v4 setObject:v25 forKeyedSubscript:v26];
        }

        id v22 = -[os_log_s countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v31,  v43,  16LL);
      }

      while (v22);
    }
  }

  id v27 = sub_1001704C4();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFIndex v40 = (CFIndex)v4;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "registeredLocalProvidersByIdentifier: %@",  buf,  0xCu);
  }

  id v29 = [v4 copy];
  return (NSDictionary *)v29;
}

- (void)setRegisteredLocalProvidersByIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "registeredLocalProvidersByIdentifier: %@",  buf,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource keychainItem](self, "keychainItem"));
  id v14 = 0LL;
  -[CSDCallProviderManagerDataSource _saveProviders:forKeychainItem:error:]( self,  "_saveProviders:forKeychainItem:error:",  v8,  v9,  &v14);
  id v10 = v14;

  if (v10)
  {
    id v11 = sub_1001704C4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B8638();
    }
  }

  v13 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  CFPreferencesSetAppValue( @"registeredProvidersVersion",  &off_1003F17C8,  TUBundleIdentifierTelephonyUtilitiesFramework);
  CFPreferencesAppSynchronize(v13);
}

- (NSDictionary)registeredPairedHostDeviceProvidersByIdentifier
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource pairedHostKeychainItem](self, "pairedHostKeychainItem"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource _providersForKeychainItem:](self, "_providersForKeychainItem:", v5));

  if ([v6 count])
  {
    id v7 = sub_1001704C4();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Found paired host providers from keychain",  buf,  2u);
    }
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerDataSource _providersForPreferenceKey:]( self,  "_providersForPreferenceKey:",  @"registeredRelayProviders"));

    id v6 = (void *)v9;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier", (void)v21));
        [v4 setObject:v15 forKeyedSubscript:v16];
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v12);
  }

  id v17 = sub_1001704C4();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "registeredPairedHostDeviceProvidersByIdentifier: %@",  buf,  0xCu);
  }

  id v19 = [v4 copy];
  return (NSDictionary *)v19;
}

- (void)setRegisteredPairedHostDeviceProvidersByIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "registeredPairedHostDeviceProvidersByIdentifier: %@",  buf,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource pairedHostKeychainItem](self, "pairedHostKeychainItem"));
  id v13 = 0LL;
  -[CSDCallProviderManagerDataSource _saveProviders:forKeychainItem:error:]( self,  "_saveProviders:forKeychainItem:error:",  v8,  v9,  &v13);
  id v10 = v13;

  if (v10)
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B8638();
    }
  }
}

- (id)dialAssistedDialRequestForDialRequest:(id)a3
{
  return (id)TUDialAssistedDialRequest(a3, a2);
}

- (BOOL)isDevicePasscodeLocked
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  int v3 = MKBGetDeviceLockState(0LL);
  if (v3 != 1) {
    LOBYTE(v3) = MKBGetDeviceLockState(0LL) == 2;
  }
  return v3;
}

- (NSSet)providerIdentifiersForExistingCalls
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_providerIdentifiersForExistingCalls;
}

- (void)openUserActivity:(id)a3 usingApplicationWithBundleIdentifier:(id)a4 frontBoardOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id v15 = sub_1001704C4();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412802;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Opening user activity %@ for bundle identifier %@ with options %@",  (uint8_t *)&v22,  0x20u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord csd_applicationRecordForBundleIdentifier:]( &OBJC_CLASS___LSApplicationRecord,  "csd_applicationRecordForBundleIdentifier:",  v11));
  id v18 = objc_alloc_init(&OBJC_CLASS____LSOpenConfiguration);
  [v18 setFrontBoardOptions:v12];
  if (v17)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v19 openUserActivity:v10 usingApplicationRecord:v17 configuration:v18 completionHandler:v13];
  }

  else
  {
    id v20 = sub_1001704C4();
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1002B8698();
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TUBundleIdentifierTelephonyUtilitiesFramework,  1LL,  0LL));
    v13[2](v13, 0LL, v19);
  }
}

- (BOOL)isSymbolicLinkAtURL:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);

  id v14 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 attributesOfItemAtPath:v7 error:&v14]);
  id v9 = v14;

  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSFileType]);
    unsigned __int8 v11 = [v10 isEqual:NSFileTypeSymbolicLink];
  }

  else
  {
    id v12 = sub_1001704C4();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_1002B86F8();
    }
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)createLinkIfNecessaryWithFilename:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerDataSource ringtonesSandboxExtensionDirectory]( self,  "ringtonesSandboxExtensionDirectory"));
  id v15 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 createLinkIfNecessaryWithFilename:v6 toURL:v7 error:&v15]);
  id v11 = v15;

  if (!v10)
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Error creating link to source URL '%@' with filename '%@': %@",  buf,  0x20u);
    }
  }

  return v10;
}

- (void)removeLinksForFilenamesNotInArray:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerDataSource ringtonesSandboxExtensionDirectory]( self,  "ringtonesSandboxExtensionDirectory"));
  id v11 = 0LL;
  unsigned __int8 v7 = [v6 removeLinksForFilenamesNotInArray:v4 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0)
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002B8758((uint64_t)v4, (uint64_t)v8, v10);
    }
  }
}

- (BOOL)isProviderInstalled:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  if (v6) {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord csd_applicationRecordForBundleIdentifier:]( &OBJC_CLASS___LSApplicationRecord,  "csd_applicationRecordForBundleIdentifier:",  v6));
  }
  else {
    unsigned __int8 v7 = 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationState]);
  unsigned __int8 v9 = [v8 isInstalled];

  return v9;
}

- (void)moveExistingPreferencesToKeychain
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerDataSource _providersForPreferenceKey:]( self,  "_providersForPreferenceKey:",  @"registeredProviders"));
  if ([v4 count])
  {
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Found local provider data to move into keychain",  buf,  2u);
    }

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource keychainItem](self, "keychainItem"));
    id v21 = 0LL;
    -[CSDCallProviderManagerDataSource _saveProviders:forKeychainItem:error:]( self,  "_saveProviders:forKeychainItem:error:",  v4,  v7,  &v21);
    id v8 = v21;

    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1002B8638();
      }
    }

    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Removing preferences for local registered providers",  buf,  2u);
      }

      CFPreferencesSetAppValue(@"registeredProviders", 0LL, TUBundleIdentifierTelephonyUtilitiesFramework);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerDataSource _providersForPreferenceKey:]( self,  "_providersForPreferenceKey:",  @"registeredRelayProviders"));
  if ([v12 count])
  {
    id v13 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found paired host provider data to move into keychain",  buf,  2u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource pairedHostKeychainItem](self, "pairedHostKeychainItem"));
    id v20 = 0LL;
    -[CSDCallProviderManagerDataSource _saveProviders:forKeychainItem:error:]( self,  "_saveProviders:forKeychainItem:error:",  v12,  v15,  &v20);
    id v16 = v20;

    id v17 = sub_1001704C4();
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1002B8638();
      }
    }

    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Removing preferences for paired host registered providers",  buf,  2u);
      }

      CFPreferencesSetAppValue(@"registeredRelayProviders", 0LL, TUBundleIdentifierTelephonyUtilitiesFramework);
    }
  }
}

+ (id)dataForProviders:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[CSDMessagingCallProvider initWithProvider:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallProvider),  "initWithProvider:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i));
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider data](v10, "data"));
        [v4 addObject:v11];
      }

      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }

  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  200LL,  0LL,  &v18));
  id v13 = v18;
  if (v13)
  {
    id v14 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B87D0();
    }

    id v16 = 0LL;
  }

  else
  {
    id v16 = v12;
  }

  return v16;
}

- (BOOL)_saveProviders:(id)a3 forKeychainItem:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v11 = [v8 mutableCopy];
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  id v13 = v11;
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v23;
LABEL_3:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(void **)(*((void *)&v22 + 1) + 8 * v16);
      if (v14 == (id)++v16)
      {
        id v14 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          goto LABEL_3;
        }
        id v13 = v11;
        goto LABEL_12;
      }
    }

    id v13 = v17;

    if (!v13) {
      goto LABEL_13;
    }
    [v11 removeObject:v13];
  }

- (id)_providersForKeychainItem:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v46 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 readDataAndReturnError:&v46]);
  id v8 = v46;
  if (v8)
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002B88B0();
    }
  }

  if (v7)
  {
    id v45 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v7,  0LL,  0LL,  &v45));
    id v12 = v45;

    if (v11)
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray, v13);
      if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
      {
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v15 = v11;
        id v16 = [v15 countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (!v16) {
          goto LABEL_28;
        }
        id v18 = v16;
        id v37 = v12;
        __int128 v38 = v11;
        v39 = v7;
        id v40 = v4;
        uint64_t v19 = *(void *)v42;
        while (1)
        {
          __int128 v20 = 0LL;
          do
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)v20);
            uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSData, v17);
            if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
            {
              __int128 v23 = -[CSDMessagingCallProvider initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallProvider),  "initWithData:",  v21);
              __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider provider](v23, "provider"));

              if (v24)
              {
                [v6 addObject:v24];
                goto LABEL_20;
              }

              id v32 = sub_1001704C4();
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                goto LABEL_19;
              }
              *(_DWORD *)buf = 138412290;
              id v48 = v15;
              id v29 = v28;
              v30 = "Could not deserialize data to TUCallProvider instance: %@";
              uint32_t v31 = 12;
            }

            else
            {
              id v25 = sub_1001704C4();
              __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                goto LABEL_20;
              }
              id v27 = (void *)objc_opt_class(v15, v26);
              *(_DWORD *)buf = 138412546;
              id v48 = v27;
              __int16 v49 = 2112;
              id v50 = v15;
              v28 = v27;
              id v29 = v24;
              v30 = "Archived object was of unexpected class %@: %@";
              uint32_t v31 = 22;
            }

            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v30, buf, v31);
LABEL_19:

LABEL_20:
            __int128 v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v33 = [v15 countByEnumeratingWithState:&v41 objects:v51 count:16];
          id v18 = v33;
          if (!v33)
          {
            id v4 = v40;
            id v12 = v37;
            goto LABEL_28;
          }
        }
      }
    }

    id v34 = sub_1001704C4();
    id v15 = (id)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B8830((uint64_t)v11, (os_log_s *)v15);
    }
LABEL_28:

    id v8 = v12;
  }

  id v35 = objc_msgSend(v6, "copy", v37, v38, v39, v40);

  return v35;
}

- (id)_providersForPreferenceKey:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDCallProviderManagerDataSource preferencesForKeyBlock]( self,  "preferencesForKeyBlock"));
  uint64_t v8 = ((uint64_t (**)(void, id))v7)[2](v7, v4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (!v13) {
        goto LABEL_23;
      }
      id v15 = v13;
      id v34 = v9;
      id v35 = v4;
      uint64_t v16 = *(void *)v37;
      while (1)
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)v17);
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSData, v14);
          if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
          {
            __int128 v20 = -[CSDMessagingCallProvider initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallProvider),  "initWithData:",  v18);
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallProvider provider](v20, "provider"));

            if (v21)
            {
              [v6 addObject:v21];
              goto LABEL_15;
            }

            id v29 = sub_1001704C4();
            id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              goto LABEL_14;
            }
            *(_DWORD *)buf = 138412290;
            id v41 = v12;
            uint64_t v26 = v25;
            id v27 = "Could not deserialize data to TUCallProvider instance: %@";
            uint32_t v28 = 12;
          }

          else
          {
            id v22 = sub_1001704C4();
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              goto LABEL_15;
            }
            __int128 v24 = (void *)objc_opt_class(v12, v23);
            *(_DWORD *)buf = 138412546;
            id v41 = v24;
            __int16 v42 = 2112;
            id v43 = v12;
            id v25 = v24;
            uint64_t v26 = v21;
            id v27 = "Archived object was of unexpected class %@: %@";
            uint32_t v28 = 22;
          }

          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
LABEL_14:

LABEL_15:
          uint64_t v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v30 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
        id v15 = v30;
        if (!v30) {
          goto LABEL_23;
        }
      }
    }

    id v31 = sub_1001704C4();
    id v12 = (id)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B8830((uint64_t)v9, (os_log_s *)v12);
    }
LABEL_23:
  }

  id v32 = objc_msgSend(v6, "copy", v34, v35);

  return v32;
}

- (void)handleApplicationUnregisteredNotification:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001572A4;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)callsChangedForCallCenterObserver:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource callCenterObserver](self, "callCenterObserver", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 callContainer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAudioAndVideoCalls]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v6 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)v12) provider]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);

        if ([v14 length]) {
          [v7 addObject:v14];
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v10);
  }

  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001574C8;
  v17[3] = &unk_1003D7758;
  v17[4] = self;
  id v18 = v7;
  id v16 = v7;
  dispatch_async(v15, v17);
}

- (void)didChangeRelayCallingAvailability
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallProviderManagerDataSource delegate](self, "delegate"));
  [v4 relayCallingStateChangedForDataSource:self];
}

- (CSDCallProviderManagerDataSourceDelegate)delegate
{
  return (CSDCallProviderManagerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (id)preferencesForKeyBlock
{
  return self->_preferencesForKeyBlock;
}

- (void)setPreferencesForKeyBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDSandboxExtensionDirectory)ringtonesSandboxExtensionDirectory
{
  return self->_ringtonesSandboxExtensionDirectory;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (void)setProviderIdentifiersForExistingCalls:(id)a3
{
}

- (CSDKeychainPersistentStoreProtocol)keychainItem
{
  return self->_keychainItem;
}

- (CSDKeychainPersistentStoreProtocol)pairedHostKeychainItem
{
  return self->_pairedHostKeychainItem;
}

- (void).cxx_destruct
{
}

@end