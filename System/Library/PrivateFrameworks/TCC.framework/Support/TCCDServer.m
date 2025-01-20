@interface TCCDServer
+ (id)newErrorWithCode:(int64_t)a3 format:(id)a4;
+ (id)newErrorWithCode:(int64_t)a3 format:(id)a4 arguments:(char *)a5;
- (BOOL)allowsInternalSecurityPolicies;
- (BOOL)canProcess:(id)a3 callFunction:(id)a4 forService:(id)a5 withAccessIdentity:(id)a6;
- (BOOL)canProcess:(id)a3 manageESClientServiceWith:(id)a4;
- (BOOL)evaluateAccessToService:(id)a3 defaultAccessAllowed:(BOOL)a4 by:(id)a5 checkCodeRequirements:(BOOL)a6 authorizationResult:(unint64_t *)a7 authorizationReason:(unint64_t *)a8 flags:(int *)a9 subjectCodeIdentityDataResult:(id *)a10;
- (BOOL)evaluateComposedAuthorizationToService:(id)a3 andAccessSubject:(id)a4 withRelation:(int64_t)a5 authorizationResult:(unint64_t *)a6 authorizationReason:(unint64_t *)a7 subjectCodeIdentityDataResult:(id *)a8;
- (BOOL)generateBacktraceOnPrompt;
- (BOOL)internalPreferenceBoolValueForName:(id)a3;
- (BOOL)internalPreferenceBoolValueForName:(id)a3 present:(BOOL *)a4;
- (BOOL)isAccessEntryWithAge:(int)a3 authorizationValue:(unint64_t)a4 expiredForService:(id)a5;
- (BOOL)isProcessServiceCompositionManager:(id)a3;
- (BOOL)macos_isSystemServer;
- (BOOL)sendRecordMetricsForService:(const char *)a3;
- (BOOL)targetAuditToken:(id *)a3 fromMessage:(id)a4 error:(id *)a5;
- (BOOL)testDoComposition;
- (BOOL)updateAccessRecord:(id)a3 replaceOnly:(BOOL)a4 doCompositionWithChildService:(BOOL)a5 withRequestingProcess:(id)a6 function:(id)a7 accessIdentity:(id)a8;
- (BOOL)updateAuthorizationRecordFromContext:(id)a3 forResult:(id)a4 syncedUpdate:(BOOL *)a5;
- (NSString)cacheDirectory;
- (NSString)stateDirectory;
- (NSString)temporaryDirectory;
- (NSString)userHomeDirectory;
- (OS_dispatch_source)macos_compatibilityFileVnodeSource;
- (OS_os_log)logHandle;
- (TCCDEventPublisher)eventPublisher;
- (TCCDPlatform)platform;
- (TCCDReminderMonitor)reminderMonitor;
- (TCCDServer)init;
- (id)_descriptionForXPCDictionary:(id)a3 depth:(int)a4;
- (id)_descriptionForXPCObject:(id)a3 depth:(int)a4;
- (id)_evaluateForProcess:(id)a3 entitlementName:(id)a4 containsService:(id)a5 options:(unint64_t)a6;
- (id)_indentForDepth:(int)a3;
- (id)accessRecordFromStep:(sqlite3_stmt *)a3;
- (id)descriptionDictionariesForAllAccessRecords;
- (id)descriptionForMessage:(id)a3;
- (id)evaluateUserIndependentEntitlementsForAccessByAttributionChain:(id)a3 forFunction:(id)a4 toService:(id)a5 error:(id *)a6;
- (id)fetchAllAccessRecords;
- (id)fetchAllActivePolicies;
- (id)fetchAllOverriddenServiceNames;
- (id)fetchAllPolicies;
- (id)recordFromMessage:(id)a3 accessIdentity:(id *)a4 indirectObjectIdentity:(id *)a5 error:(id *)a6;
- (id)serviceFromMessage:(id)a3 error:(id *)a4;
- (id)setupTemporaryDirectoryForName:(int)a3;
- (id)stateDumpDictionary;
- (id)stringFromErrorCode:(int64_t)a3;
- (id)translateAllFilesToEndpointSecurity:(id)a3 withClient:(id)a4 clientType:(int)a5 requestingProcess:(id)a6 function:(id)a7 attributionChain:(id)a8 executablePath:(id)a9;
- (unint64_t)numberOfRecordsForService:(id)a3;
- (unint64_t)numberOfRecordsForService:(id)a3 withAuthorizationValue:(unint64_t)a4;
- (void)buildErrorString:(id)a3 forError:(id)a4 contextString:(id)a5;
- (void)createStateHandler;
- (void)makeError:(id *)a3 withCode:(int64_t)a4 infoText:(id)a5;
- (void)publishAccessChangedEvent:(unint64_t)a3 forService:(id)a4 client:(id)a5 clientType:(int)a6 authValue:(unint64_t)a7 andKillClient:(BOOL)a8;
- (void)purgeAllExpiredAccessEntries;
- (void)purgeExpiredAccessEntriesForService:(id)a3;
- (void)scheduleAccessEntryExpiryCheckForService:(id)a3;
- (void)sendAnalyticsForEntitlement:(id)a3 withProcess:(id)a4 service:(id)a5 function:(id)a6;
- (void)sendAnalyticsIfMigrationPluginForProcess:(id)a3 withService:(id)a4 API:(id)a5;
- (void)setAllowsInternalSecurityPolicies:(BOOL)a3;
- (void)setEventPublisher:(id)a3;
- (void)setGenerateBacktraceOnPrompt:(BOOL)a3;
- (void)setLogHandle:(id)a3;
- (void)setMacos_compatibilityFileVnodeSource:(id)a3;
- (void)setMacos_isSystemServer:(BOOL)a3;
- (void)setPlatform:(id)a3;
- (void)setTestDoComposition:(BOOL)a3;
- (void)setupTemporaryDirectories;
- (void)updateClient:(id)a3 client:(const char *)a4 clientType:(int)a5;
@end

@implementation TCCDServer

+ (id)newErrorWithCode:(int64_t)a3 format:(id)a4
{
  return [a1 newErrorWithCode:a3 format:a4 arguments:&v5];
}

+ (id)newErrorWithCode:(int64_t)a3 format:(id)a4 arguments:(char *)a5
{
  if (a4)
  {
    id v7 = a4;
    v8 = -[NSString initWithFormat:locale:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:locale:arguments:",  v7,  0LL,  a5);

    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    v13 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  }

  else
  {
    v9 = 0LL;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kTCCErrorDomain",  a3,  v9));

  return v10;
}

- (void)updateClient:(id)a3 client:(const char *)a4 clientType:(int)a5
{
  id v37 = a3;
  unsigned __int8 v7 = [v37 isRevocable];
  if (!a5 && (v7 & 1) == 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a4));
    if (v36)
    {
      if (&_SBSProcessIDForDisplayIdentifier && SBSProcessIDForDisplayIdentifier(v36, &v45))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v37 name]);
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Access to service %@ changed.",  v8));

        uint64_t v10 = v45;
        id v11 = v9;
        int v12 = terminate_with_reason(v10, 11, 0, [v11 UTF8String], 129);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            unsigned int v15 = v45;
            int v16 = *__error();
            v17 = __error();
            v18 = strerror(*v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue([v37 name]);
            *(_DWORD *)buf = 136447234;
            v48 = a4;
            __int16 v49 = 1024;
            unsigned int v50 = v15;
            __int16 v51 = 1024;
            *(_DWORD *)v52 = v16;
            *(_WORD *)&v52[4] = 2082;
            *(void *)&v52[6] = v18;
            __int16 v53 = 2114;
            v54 = v19;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Unable to terminate_with_reason() %{public}s[%d]: %d (%{public}s) for service %{public}@",  buf,  0x2Cu);
          }
        }

        else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v20 = v45;
          v21 = (void *)objc_claimAutoreleasedReturnValue([v37 name]);
          *(_DWORD *)buf = 136446722;
          v48 = a4;
          __int16 v49 = 1024;
          unsigned int v50 = v20;
          __int16 v51 = 2114;
          *(void *)v52 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Terminating %{public}s[%d] because access to the %{public}@ service changed.",  buf,  0x1Cu);
        }
      }

      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v36));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 plugInKitPlugins]);

      id v24 = [v23 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v42;
        do
        {
          for (i = 0LL; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
            id v29 = objc_claimAutoreleasedReturnValue([v28 bundleIdentifier]);
            id v30 = [v29 UTF8String];

            id v31 = objc_claimAutoreleasedReturnValue([v28 bundleVersion]);
            id v32 = [v31 UTF8String];

            dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
            v34 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472LL;
            v38[2] = sub_10001C470;
            v38[3] = &unk_1000655F0;
            v38[4] = self;
            v38[5] = v28;
            id v39 = v36;
            id v40 = v37;
            launch_remove_external_service(v30, v32, v34, v38);
          }

          id v25 = [v23 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }

        while (v25);
      }
    }
  }
}

- (void)publishAccessChangedEvent:(unint64_t)a3 forService:(id)a4 client:(id)a5 clientType:(int)a6 authValue:(unint64_t)a7 andKillClient:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v10 = *(void *)&a6;
  id v14 = a4;
  id v15 = a5;
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)name = 136316674;
    v27 = "-[TCCDServer publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:]";
    __int16 v28 = 2048;
    unint64_t v29 = a3;
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2112;
    id v33 = v15;
    __int16 v34 = 1024;
    int v35 = v10;
    __int16 v36 = 2048;
    unint64_t v37 = a7;
    __int16 v38 = 1024;
    BOOL v39 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s: event_type=%lld, service=%@, client=%@, client_type=%d, auth_value=%lld, kill_client=%d",  (uint8_t *)name,  0x40u);
  }

  if (v14)
  {
    if (v8) {
      -[TCCDServer updateClient:client:clientType:]( self, "updateClient:client:clientType:", v14, [v15 UTF8String], v10);
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      uint64_t v18 = tcc_service_singleton_for_CF_name();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      tcc_authorization_changed_for_service_notification_name(v19, name, 128LL);

      LODWORD(v19) = notify_post(name);
      unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
      v21 = v20;
      if ((_DWORD)v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100022FC0();
        }
      }

      else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136315138;
        id v25 = name;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Posted notification: %s",  (uint8_t *)&v24,  0xCu);
      }
    }

    v22 = -[TCCDEvent initWithEventType:service:subjectIdentifierType:subjectIdentifier:authValue:]( objc_alloc(&OBJC_CLASS___TCCDEvent),  "initWithEventType:service:subjectIdentifierType:subjectIdentifier:authValue:",  a3,  v14,  (int)v10,  v15,  a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer eventPublisher](self, "eventPublisher"));
    [v23 publish:v22];
  }

  else
  {
    v22 = (TCCDEvent *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
      sub_100022F40(v15, (os_log_s *)v22);
    }
  }
}

- (id)setupTemporaryDirectoryForName:(int)a3
{
  if (!confstr(a3, v8, 0x400uLL)) {
    sub_10002302C();
  }
  if (mkdir(v8, 0x1C0u) && *__error() != 17) {
    sub_10002305C();
  }
  v4 = realpath_DARWIN_EXTSN(v8, 0LL);
  if (!v4) {
    sub_100023044();
  }
  uint64_t v5 = v4;
  v6 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v4);
  free(v5);
  return v6;
}

- (void)setupTemporaryDirectories
{
  if ((_set_user_dir_suffix("com.apple.tccd", a2) & 1) == 0) {
    sub_100023074();
  }
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[TCCDServer setupTemporaryDirectoryForName:](self, "setupTemporaryDirectoryForName:", 65537LL));
  temporaryDirectory = self->_temporaryDirectory;
  self->_temporaryDirectory = v3;
}

- (TCCDServer)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TCCDServer;
  v2 = -[TCCDServer init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    -[TCCDServer setupTemporaryDirectories](v2, "setupTemporaryDirectories");
    -[TCCDServer createStateHandler](v3, "createStateHandler");
    v4 = objc_alloc_init(&OBJC_CLASS___TCCDReminderMonitor);
    reminderMonitor = v3->_reminderMonitor;
    v3->_reminderMonitor = v4;

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    unsigned __int8 v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v7);
    authAnalyticsTimer = v3->_authAnalyticsTimer;
    v3->_authAnalyticsTimer = (OS_dispatch_source *)v8;

    dispatch_time_t v10 = dispatch_time(0LL, 86400000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v3->_authAnalyticsTimer, v10, 0x4E94914F0000uLL, 0x34630B8A000uLL);
    id v11 = (dispatch_source_s *)v3->_authAnalyticsTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10001CA7C;
    handler[3] = &unk_100064D50;
    id v14 = v3;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate((dispatch_object_t)v3->_authAnalyticsTimer);
  }

  return v3;
}

- (NSString)userHomeDirectory
{
  v2 = self;
  if (self->_userHomeDirectory) {
    return v2->_userHomeDirectory;
  }
  if (-[TCCDServer macos_isSystemServer](self, "macos_isSystemServer"))
  {
    userHomeDirectory = v2->_userHomeDirectory;
    v2->_userHomeDirectory = (NSString *)@"/";

    return v2->_userHomeDirectory;
  }

  uid_t v4 = getuid();
  uint64_t v5 = getpwuid(v4);
  if (!v5)
  {
    v2 = (TCCDServer *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](v2, "logHandle"));
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR)) {
      sub_10002308C((os_log_s *)v2);
    }

    _os_crash("getpwuid(3) failed");
    __break(1u);
    goto LABEL_12;
  }

  pw_dir = v5->pw_dir;
  if (!pw_dir)
  {
LABEL_12:
    v2 = (TCCDServer *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](v2, "logHandle"));
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR)) {
      sub_100023104((os_log_s *)v2);
    }

    _os_crash("passwd entry missing home directory");
    __break(1u);
    goto LABEL_15;
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", pw_dir));
  id v13 = 0LL;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 stringByResolvingRealPathWithError:&v13]);
  id v9 = v13;

  if (v8)
  {
    dispatch_time_t v10 = v2->_userHomeDirectory;
    v2->_userHomeDirectory = (NSString *)v8;

    return v2->_userHomeDirectory;
  }

- (NSString)stateDirectory
{
  stateDirectory = self->_stateDirectory;
  if (!stateDirectory)
  {
    uid_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer userHomeDirectory](self, "userHomeDirectory"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer platform](self, "platform"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 homeRelativePathToStateDirectory]);
    unsigned __int8 v7 = (NSString *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v6]);
    uint64_t v8 = self->_stateDirectory;
    self->_stateDirectory = v7;

    stateDirectory = self->_stateDirectory;
  }

  return stateDirectory;
}

- (BOOL)internalPreferenceBoolValueForName:(id)a3
{
  uid_t v4 = (__CFString *)a3;
  if (-[TCCDServer allowsInternalSecurityPolicies](self, "allowsInternalSecurityPolicies")
    && (uint64_t v5 = (const __CFBoolean *)CFPreferencesCopyValue( v4,  @"com.apple.tccd",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost)) != 0LL)
  {
    v6 = v5;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v6))
    {
      BOOL v8 = CFBooleanGetValue(v6) != 0;
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000231E4();
      }
    }

    else
    {
      BOOL v8 = 0;
    }

    CFRelease(v6);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)internalPreferenceBoolValueForName:(id)a3 present:(BOOL *)a4
{
  v6 = (__CFString *)a3;
  *a4 = 0;
  BOOL v7 = 0;
  if (-[TCCDServer allowsInternalSecurityPolicies](self, "allowsInternalSecurityPolicies"))
  {
    BOOL v8 = (const __CFBoolean *)CFPreferencesCopyValue( v6,  @"com.apple.tccd",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
    if (v8)
    {
      id v9 = v8;
      *a4 = 1;
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (TypeID == CFGetTypeID(v9))
      {
        BOOL v7 = CFBooleanGetValue(v9) != 0;
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_1000231E4();
        }
      }

      else
      {
        BOOL v7 = 0;
      }

      CFRelease(v9);
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)stringFromErrorCode:(int64_t)a3
{
  else {
    return (id)*((void *)&off_100065798 + a3);
  }
}

- (void)setPlatform:(id)a3
{
  id v5 = a3;
  -[TCCDPlatform setServer:](self->_platform, "setServer:", self);
}

- (void)makeError:(id *)a3 withCode:(int64_t)a4 infoText:(id)a5
{
  id v7 = a5;
  BOOL v8 = v7;
  if (a3)
  {
    if (v7)
    {
      NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
      id v11 = v7;
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    }

    else
    {
      id v9 = 0LL;
    }

    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.tccd",  a4,  v9));
  }
}

- (void)buildErrorString:(id)a3 forError:(id)a4 contextString:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  NSErrorUserInfoKey v10 = v9;
  if (v9) {
    [v13 appendFormat:@"%@, ", v9];
  }
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
    [v13 appendFormat:@"%@", v11];

    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer stringFromErrorCode:](self, "stringFromErrorCode:", [v8 code]));
    [v13 appendFormat:@"(%@) ", v12];
  }
}

- (id)_indentForDepth:(int)a3
{
  uid_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  if (a3 >= 1)
  {
    do
    {
      -[NSMutableString appendString:](v4, "appendString:", @"\t");
      --a3;
    }

    while (a3);
  }

  id v5 = -[NSMutableString copy](v4, "copy");

  return v5;
}

- (id)_descriptionForXPCDictionary:(id)a3 depth:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendString:](v7, "appendString:", @"{\n");
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_10001D264;
  applier[3] = &unk_100065618;
  id v13 = v7;
  id v14 = self;
  int v15 = v4;
  id v8 = v7;
  xpc_dictionary_apply(v6, applier);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer _indentForDepth:](self, "_indentForDepth:", v4));
  -[NSMutableString appendString:](v8, "appendString:", v9);

  -[NSMutableString appendString:](v8, "appendString:", @"}");
  id v10 = -[NSMutableString copy](v8, "copy");

  return v10;
}

- (id)_descriptionForXPCObject:(id)a3 depth:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_string)
  {
    -[NSMutableString appendFormat:](v7, "appendFormat:", @"\"%s\"", xpc_string_get_string_ptr(v6), v18);
    goto LABEL_19;
  }

  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_BOOL)
  {
    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_uint64)
    {
      uint64_t value = xpc_uint64_get_value(v6);
      -[NSMutableString appendFormat:](v7, "appendFormat:", @"%llu (0x%llx)", value, xpc_uint64_get_value(v6));
      goto LABEL_19;
    }

    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_int64)
    {
      int64_t v12 = xpc_int64_get_value(v6);
      -[NSMutableString appendFormat:](v7, "appendFormat:", @"%lld (0x%llx)", v12, xpc_int64_get_value(v6));
      goto LABEL_19;
    }

    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[TCCDServer _descriptionForXPCDictionary:depth:](self, "_descriptionForXPCDictionary:depth:", v6, v4));
      -[NSMutableString appendFormat:](v7, "appendFormat:", @"%@", v13);
    }

    else
    {
      if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_array)
      {
        if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_null)
        {
          -[NSMutableString appendFormat:](v7, "appendFormat:", @"<xpc_null>", v17, v18);
        }

        else
        {
          id v8 = xpc_copy_description(v6);
          -[NSMutableString appendFormat:](v7, "appendFormat:", @"%s", v8);
          free(v8);
        }

        goto LABEL_19;
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer _indentForDepth:](self, "_indentForDepth:", v4));
      -[NSMutableString appendFormat:](v7, "appendFormat:", @"\n");
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472LL;
      applier[2] = sub_10001D70C;
      applier[3] = &unk_100065640;
      void applier[4] = self;
      int v22 = v4;
      unsigned int v20 = v7;
      id v21 = v14;
      id v13 = v14;
      xpc_array_apply(v6, applier);
    }

    goto LABEL_19;
  }

  BOOL v9 = xpc_BOOL_get_value(v6);
  id v10 = "false";
  if (v9) {
    id v10 = "true";
  }
  -[NSMutableString appendFormat:](v7, "appendFormat:", @"%s", v10, v18);
LABEL_19:
  id v15 = -[NSMutableString copy](v7, "copy");

  return v15;
}

- (id)descriptionForMessage:(id)a3
{
  return -[TCCDServer _descriptionForXPCDictionary:depth:](self, "_descriptionForXPCDictionary:depth:", a3, 0LL);
}

- (BOOL)targetAuditToken:(id *)a3 fromMessage:(id)a4 error:(id *)a5
{
  data = xpc_dictionary_get_data(a4, "target_token", &length);
  if (data)
  {
    if (length == 32)
    {
      __int128 v9 = data[1];
      *(_OWORD *)a3->var0 = *data;
      *(_OWORD *)&a3->var0[4] = v9;
      return 1;
    }

    id v11 = @"invalid size for target audit token";
    int64_t v12 = self;
    id v13 = a5;
    uint64_t v14 = 4LL;
  }

  else
  {
    id v11 = @"missing target audit token";
    int64_t v12 = self;
    id v13 = a5;
    uint64_t v14 = 3LL;
  }

  -[TCCDServer makeError:withCode:infoText:](v12, "makeError:withCode:infoText:", v13, v14, v11);
  return 0;
}

- (void)sendAnalyticsIfMigrationPluginForProcess:(id)a3 withService:(id)a4 API:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (-[TCCDServer allowsInternalSecurityPolicies](self, "allowsInternalSecurityPolicies"))
  {
    if ([v15 isPlatformBinary])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 binaryPath]);
      unsigned int v11 = [v10 hasSuffix:@"com.apple.migrationpluginwrapper"];

      if (v11)
      {
        int64_t v12 = (void *)DMCopyMigrationPhaseDescription();
        if ([v12 hasPrefix:@"Running plugin "])
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringFromIndex:", objc_msgSend(@"Running plugin ", "length")));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer platform](self, "platform"));
          [v14 sendAnalyticsForPlugin:v13 service:v8 API:v9];
        }
      }
    }
  }
}

- (void)sendAnalyticsForEntitlement:(id)a3 withProcess:(id)a4 service:(id)a5 function:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[TCCDServer platform](self, "platform"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);

  [v15 sendAnalyticsForEntitlement:v13 withIdentifier:v14 service:v11 function:v10];
}

- (BOOL)canProcess:(id)a3 manageESClientServiceWith:(id)a4
{
  return 0;
}

- (BOOL)canProcess:(id)a3 callFunction:(id)a4 forService:(id)a5 withAccessIdentity:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    BOOL v15 = 0;
    goto LABEL_22;
  }

  if (![v10 BOOLValueForEntitlement:@"com.apple.private.tcc.manager"])
  {
    BOOL v15 = 0;
    if (!v11 || !v12) {
      goto LABEL_22;
    }
    id v16 = v11;
    if (([v16 isEqualToString:@"TCCAccessSetOverride"] & 1) != 0
      || ([v16 isEqualToString:@"TCCAccessOverride"] & 1) != 0)
    {
      uint64_t v17 = @"modify";
      uint64_t v18 = @"service-override";
      goto LABEL_12;
    }

    if ([v16 hasPrefix:@"TCCExpirationCopy"])
    {
      uint64_t v17 = @"read";
    }

    else
    {
      if (([v16 hasPrefix:@"TCCExpirationReset"] & 1) == 0)
      {
        if ([v16 hasPrefix:@"TCCAccessCopy"])
        {
          uint64_t v17 = @"read";
        }

        else if (([v16 hasPrefix:@"TCCAccessSet"] & 1) != 0 {
               || ([v16 hasPrefix:@"TCCAccessSetWithPrompt"] & 1) != 0)
        }
        {
          uint64_t v17 = @"modify";
        }

        else if ([v16 hasPrefix:@"TCCAccessReset"])
        {
          uint64_t v17 = @"delete";
        }

        else
        {
          if (![v16 hasPrefix:@"TCCReportUse"])
          {
            if (([v16 isEqualToString:@"TCCAccessRequest"] & 1) == 0)
            {

              unsigned int v20 = 0LL;
              goto LABEL_20;
            }

            goto LABEL_13;
          }

          uint64_t v17 = @"report";
        }

        uint64_t v18 = @"access";
LABEL_12:
        if (([v16 isEqualToString:@"TCCAccessRequest"] & 1) == 0)
        {
          v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.private.tcc.manager",  v18,  v17);
LABEL_15:
          unsigned int v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);

          if (v20)
          {
            BOOL v15 = 1;
            if ([v10 hasEntitlement:v20 containsServiceAllOrService:v12 options:1])
            {
LABEL_21:

              goto LABEL_22;
            }

            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138544130;
              id v25 = v10;
              __int16 v26 = 2114;
              id v27 = v16;
              __int16 v28 = 2114;
              id v29 = v12;
              __int16 v30 = 2114;
              id v31 = v20;
              _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}@ attempted to call %{public}@ for %{public}@ without the recommended %{public}@ entitlement",  buf,  0x2Au);
            }
          }

- (BOOL)generateBacktraceOnPrompt
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DE10;
  block[3] = &unk_100064D50;
  block[4] = self;
  if (qword_100078308 != -1) {
    dispatch_once(&qword_100078308, block);
  }
  return self->_generateBacktraceOnPrompt;
}

- (void)setGenerateBacktraceOnPrompt:(BOOL)a3
{
  self->_generateBacktraceOnPrompt = a3;
}

- (BOOL)isProcessServiceCompositionManager:(id)a3
{
  id v4 = a3;
  if (([v4 BOOLValueForEntitlement:@"com.apple.private.tcc.manager.service-composition"] & 1) != 0 || -[TCCDServer testDoComposition](self, "testDoComposition")
    && [v4 BOOLValueForEntitlement:@"com.apple.private.tcc.test-manager.service-composition"])
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002324C(v4, v5);
    }

    BOOL v6 = 1;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)serviceFromMessage:(id)a3 error:(id *)a4
{
  string = xpc_dictionary_get_string(a3, "service");
  if (string)
  {
    id v7 = string;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer platform](self, "platform"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceByName:v8]);

    if (!v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid Service Name: %s",  v7));
      -[TCCDServer makeError:withCode:infoText:](self, "makeError:withCode:infoText:", a4, 2LL, v11);
    }
  }

  else
  {
    -[TCCDServer makeError:withCode:infoText:](self, "makeError:withCode:infoText:", a4, 1LL, 0LL);
    id v10 = 0LL;
  }

  return v10;
}

- (id)recordFromMessage:(id)a3 accessIdentity:(id *)a4 indirectObjectIdentity:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer serviceFromMessage:error:](self, "serviceFromMessage:error:", v10, a6));
  if (v11)
  {
    id v12 = -[TCCDAccessIdentity initWithMessage:](objc_alloc(&OBJC_CLASS___TCCDAccessIdentity), "initWithMessage:", v10);
    id v13 = v12;
    if (!v12)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid Access Identity from message"));
      -[TCCDServer makeError:withCode:infoText:](self, "makeError:withCode:infoText:", a6, 6LL, v21);

      unsigned int v20 = 0LL;
LABEL_29:

      goto LABEL_30;
    }

    if (a4) {
      *a4 = v12;
    }
    uint64_t v14 = objc_alloc(&OBJC_CLASS___TCCDCodeIdentity);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity identifier](v13, "identifier"));
    id v40 = -[TCCDCodeIdentity initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:]( v14,  "initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:",  v15,  -[TCCDAccessIdentity client_type](v13, "client_type"),  0LL,  0LL,  0LL);

    int int64 = xpc_dictionary_get_int64(v10, "indirect_object_type");
    string = xpc_dictionary_get_string(v10, "indirect_object_identifier");
    if (string)
    {
      uint64_t v18 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", string);
      if (int64 == 3)
      {
        v19 = -[TCCDAccessFileProviderDomainIndirectObject initWithFileProviderDomainID:]( objc_alloc(&OBJC_CLASS___TCCDAccessFileProviderDomainIndirectObject),  "initWithFileProviderDomainID:",  v18);
      }

      else
      {
        size_t length = 0LL;
        data = xpc_dictionary_get_data(v10, "indirect_object_code_requirement", &length);
        uint64_t v23 = 0LL;
        if (data && length)
        {
          int v24 = data;
          id v25 = objc_alloc(&OBJC_CLASS___NSData);
          uint64_t v23 = -[NSData initWithBytes:length:](v25, "initWithBytes:length:", v24, length);
        }

        __int16 v26 = -[TCCDCodeIdentity initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:]( objc_alloc(&OBJC_CLASS___TCCDCodeIdentity),  "initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:",  v18,  int64,  0LL,  v23 != 0LL,  v23);
        BOOL v39 = -[TCCDAccessCodeIndirectObject initWithCodeIdentity:]( objc_alloc(&OBJC_CLASS___TCCDAccessCodeIndirectObject),  "initWithCodeIdentity:",  v26);
        id v27 = -[TCCDAccessIdentity initWithBundleIdentifier:isWK2Proxy:]( objc_alloc(&OBJC_CLASS___TCCDAccessIdentity),  "initWithBundleIdentifier:isWK2Proxy:",  v18,  0LL);
        if (!v27)
        {
          unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid indirect object identity from message"));
          -[TCCDServer makeError:withCode:infoText:](self, "makeError:withCode:infoText:", a6, 6LL, v37);

          unsigned int v20 = 0LL;
          v19 = (TCCDAccessFileProviderDomainIndirectObject *)v39;
          int v35 = v40;
LABEL_28:

          goto LABEL_29;
        }

        __int16 v28 = v27;
        if (a5) {
          *a5 = v27;
        }

        v19 = (TCCDAccessFileProviderDomainIndirectObject *)v39;
      }
    }

    else
    {
      v19 = (TCCDAccessFileProviderDomainIndirectObject *)objc_claimAutoreleasedReturnValue( +[TCCDAccessIndirectObject unusedIndirectObject]( &OBJC_CLASS___TCCDAccessIndirectObject,  "unusedIndirectObject"));
    }

    uint64_t v18 = -[TCCDAccessObject initWithService:indirectObject:]( objc_alloc(&OBJC_CLASS___TCCDAccessObject),  "initWithService:indirectObject:",  v11,  v19);
    if (xpc_dictionary_get_BOOL(v10, "granted")) {
      uint int64 = 2LL;
    }
    else {
      uint int64 = 0LL;
    }
    xpc_object_t value = xpc_dictionary_get_value(v10, "auth_value");
    id v31 = (void *)objc_claimAutoreleasedReturnValue(value);

    if (v31)
    {
      uint int64 = xpc_dictionary_get_uint64(v10, "auth_value");
      uint64_t v32 = (uint64_t)[v11 authorizationVersionNumber];
    }

    else
    {
      uint64_t v32 = 1LL;
    }

    uint64_t v23 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.0));
    int64_t v33 = xpc_dictionary_get_int64(v10, "modDate");
    if (v33)
    {
      __int16 v34 = -[NSDate initWithTimeIntervalSince1970:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSince1970:",  (double)v33);

      uint64_t v23 = (NSData *)v34;
    }

    int v35 = v40;
    LOBYTE(v38) = 0;
    unsigned int v20 = -[TCCDAccessRecord initWithSubject:object:authorizationValue:authorizationReason:authorizationVersion:lastModified:flags:replaceStoredCodeRequirement:]( objc_alloc(&OBJC_CLASS___TCCDAccessRecord),  "initWithSubject:object:authorizationValue:authorizationReason:authorizationVersion:lastModified:flags:replac eStoredCodeRequirement:",  v40,  v18,  uint64,  4LL,  v32,  v23,  0LL,  v38);
    goto LABEL_28;
  }

  unsigned int v20 = 0LL;
LABEL_30:

  return v20;
}

- (void)purgeExpiredAccessEntriesForService:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 expirySeconds]);

  if (v5)
  {
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 expirySeconds]);
      *(_DWORD *)buf = 136446722;
      id v13 = "-[TCCDServer purgeExpiredAccessEntriesForService:]";
      __int16 v14 = 2114;
      BOOL v15 = v7;
      __int16 v16 = 1024;
      unsigned int v17 = [v8 intValue];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}s: invoked for %{public}@; expiry: %d",
        buf,
        0x1Cu);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001E544;
    v9[3] = &unk_100065688;
    id v10 = v4;
    id v11 = self;
    db_transaction(v9);
  }
}

- (void)purgeAllExpiredAccessEntries
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDService allServices](&OBJC_CLASS___TCCDService, "allServices", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[TCCDServer purgeExpiredAccessEntriesForService:]( self,  "purgeExpiredAccessEntriesForService:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (void)scheduleAccessEntryExpiryCheckForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 expirySeconds]);
  if (v5)
  {
    uint64_t v6 = (dispatch_queue_s *)v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 expirySeconds]);
    if (((unint64_t)[v7 integerValue] & 0x8000000000000000) != 0)
    {

      goto LABEL_6;
    }

    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 expirySeconds]);
    uint64_t v9 = (uint64_t)[v8 integerValue];

    if (v9 <= 604800)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
      uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 expirySeconds]);
      dispatch_time_t v12 = dispatch_time(0, 1000000000 * (void)[v11 integerValue] + 1000000000);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10001EC8C;
      v13[3] = &unk_1000656B0;
      v13[4] = self;
      id v14 = v4;
      dispatch_after(v12, v6, v13);

LABEL_6:
    }
  }
}

- (BOOL)isAccessEntryWithAge:(int)a3 authorizationValue:(unint64_t)a4 expiredForService:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 expirySeconds]);
  if (!v9) {
    goto LABEL_7;
  }
  __int128 v10 = (void *)v9;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 expirySeconds]);
  if ((int)[v11 intValue] >= a3)
  {

    goto LABEL_7;
  }

  if ([v8 expireOnlyAllowedEntries])
  {
    unsigned __int8 v12 = [v8 isAuthorizationValue:a4 equalToRight:0];

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_12;
  }

LABEL_9:
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 expirySeconds]);
    *(_DWORD *)buf = 136446978;
    uint64_t v23 = "-[TCCDServer isAccessEntryWithAge:authorizationValue:expiredForService:]";
    __int16 v24 = 2114;
    id v25 = v15;
    __int16 v26 = 1024;
    unsigned int v27 = [v16 intValue];
    __int16 v28 = 1024;
    int v29 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%{public}s for %{public}@ expiry time: %d, client age = %d",  buf,  0x22u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10001EE94;
  v20[3] = &unk_1000656B0;
  v20[4] = self;
  id v21 = v8;
  dispatch_async(v18, v20);

  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (id)_evaluateForProcess:(id)a3 entitlementName:(id)a4 containsService:(id)a5 options:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 authorizationRightStateForValue:1 reason:0]);
  if (v12)
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v9 arrayValueForEntitlement:v10]);

    if (v13)
    {
      if (![v9 hasEntitlement:v10 containsService:v11 options:a6])
      {
LABEL_7:
        id v16 = v12;
        goto LABEL_8;
      }

      uint64_t v14 = 11LL;
      uint64_t v15 = 2LL;
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v14 = 1LL;
    }

    [v12 setRight:v15];
    [v12 setReason:v14];
    goto LABEL_7;
  }

- (id)evaluateUserIndependentEntitlementsForAccessByAttributionChain:(id)a3 forFunction:(id)a4 toService:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 authorizationRightStateForValue:1 reason:0]);
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 requestingProcess]);
    if (!v15)
    {
      -[TCCDServer makeError:withCode:infoText:](self, "makeError:withCode:infoText:", a6, 5LL, 0LL);
      [v14 setRight:0];
      [v14 setReason:1];
LABEL_44:
      id v18 = v14;

      goto LABEL_45;
    }

    id v49 = v11;
    if ([v10 accessingProcessSpecified])
    {
      if (-[TCCDServer canProcess:callFunction:forService:withAccessIdentity:]( self,  "canProcess:callFunction:forService:withAccessIdentity:",  v15,  v11,  v12,  0LL))
      {
        char v16 = 0;
        unsigned int v17 = @"IsTCCManager";
      }

      else if ([v12 shouldAllowUnrestrictedCheckAuditToken])
      {
        char v16 = 0;
        unsigned int v17 = @"ServiceAllowsUnrestrictedCheck";
      }

      else if ([v15 euid])
      {
        if ([v15 hasEntitlement:@"com.apple.private.tcc.manager.check-by-audit-token" containsServiceAllOrService:v12 options:0])
        {
          char v16 = 0;
          unsigned int v17 = @"IsEntitledToCheckByAuditToken";
        }

        else
        {
          id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v10 accessingProcess]);
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 description]);
            BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
            v48 = a6;
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
            *(_DWORD *)buf = 138543874;
            __int16 v51 = v38;
            __int16 v52 = 2114;
            __int16 v53 = v39;
            __int16 v54 = 2114;
            v55 = v40;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Request message contains a target_token to accessing_process (%{public}@) but %{public}@ is not a TCC mana ger for service: %{public}@.",  buf,  0x20u);

            a6 = v48;
          }

          [v14 setRight:0];
          char v16 = 1;
          [v14 setReason:1];
          unsigned int v17 = 0LL;
        }
      }

      else
      {
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
          *(_DWORD *)buf = 138543362;
          __int16 v51 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "WARNING: allowing root %{public}@ to check entitlments without being a TCC manager.",  buf,  0xCu);
        }

        char v16 = 0;
        unsigned int v17 = @"IsRoot";
      }

      if ([v14 right] == (id)1 && (objc_msgSend(v10, "accessingProcessIsValid") & 1) == 0)
      {
        [v14 setRight:0];
        [v14 setReason:1];
      }

      if ((v16 & 1) != 0)
      {
        int v22 = v14;
        goto LABEL_29;
      }
    }

    else
    {
      unsigned int v17 = @"IsRequestor";
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 accessingProcess]);
    int v22 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDServer _evaluateForProcess:entitlementName:containsService:options:]( self,  "_evaluateForProcess:entitlementName:containsService:options:",  v23,  @"com.apple.private.tcc.allow",  v12,  1LL));

    if ([v22 right] != (id)1)
    {
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v22 description]);
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v10 accessingProcess]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v44 description]);
        v46 = a6;
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
        *(_DWORD *)buf = 138544386;
        __int16 v51 = v42;
        __int16 v52 = 2114;
        __int16 v53 = v41;
        __int16 v54 = 2114;
        v55 = v25;
        __int16 v56 = 2114;
        v57 = v26;
        __int16 v58 = 2114;
        v59 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Auth:%{public}@ to %{public}@ for %{public}@; checked by %{public}@ because: %{public}@",
          buf,
          0x34u);

        a6 = v46;
      }
    }

- (BOOL)evaluateAccessToService:(id)a3 defaultAccessAllowed:(BOOL)a4 by:(id)a5 checkCodeRequirements:(BOOL)a6 authorizationResult:(unint64_t *)a7 authorizationReason:(unint64_t *)a8 flags:(int *)a9 subjectCodeIdentityDataResult:(id *)a10
{
  id v14 = a3;
  id v15 = a5;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x3032000000LL;
  v34[3] = sub_10001F874;
  v34[4] = sub_10001F884;
  id v35 = 0LL;
  if (a10) {
    *a10 = 0LL;
  }
  *a7 = 1LL;
  *a8 = 0LL;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10001F88C;
  v31[3] = &unk_100064CD8;
  id v32 = v14;
  id v33 = v15;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001F964;
  v24[3] = &unk_1000656D8;
  int v29 = a8;
  __int16 v30 = a9;
  __int16 v28 = a7;
  v24[4] = self;
  id v16 = v32;
  id v25 = v16;
  unsigned int v27 = v34;
  id v17 = v33;
  id v26 = v17;
  int v18 = db_eval( (uint64_t)"SELECT auth_value, auth_reason, csreq, strftime('%s','now') - last_modified AS age, flags FROM access WHERE service = ? AND client = ? AND client_type = ?",  v31,  v24);
  if (v18)
  {
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
      *(_DWORD *)buf = 67109634;
      int v37 = v18;
      __int16 v38 = 2114;
      BOOL v39 = v22;
      __int16 v40 = 2114;
      __int128 v41 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Query for current DB state returns error: %d; Service: %{public}@), client: %{public}@",
        buf,
        0x1Cu);
    }

    BOOL v20 = 0;
    *a7 = 0LL;
    *a8 = 1LL;
  }

  else
  {
    BOOL v20 = *a8 != 1;
  }

  _Block_object_dispose(v34, 8);
  return v20;
}

- (id)translateAllFilesToEndpointSecurity:(id)a3 withClient:(id)a4 clientType:(int)a5 requestingProcess:(id)a6 function:(id)a7 attributionChain:(id)a8 executablePath:(id)a9
{
  return a3;
}

- (BOOL)updateAccessRecord:(id)a3 replaceOnly:(BOOL)a4 doCompositionWithChildService:(BOOL)a5 withRequestingProcess:(id)a6 function:(id)a7 accessIdentity:(id)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v14 subjectIdentity]);
  id v19 = [v18 identityType];

  if (!v19)
  {
    v82 = self;
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v14 subjectIdentity]);
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v14 accessObject]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 serviceObject]);
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "macos_compositionChildService"));

    id v80 = v15;
    id v81 = v16;
    if (v11 && v83)
    {
      __int16 v24 = objc_alloc(&OBJC_CLASS___TCCDAccessObject);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 accessObject]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 indirectObject]);
      unsigned int v27 = -[TCCDAccessObject initWithService:indirectObject:](v24, "initWithService:indirectObject:", v83, v26);

      id v28 = [v14 copy];
      [v28 setAccessObject:v27];
      int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v83 name]);
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v14 accessObject]);
        id v32 = v17;
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v31 serviceObject]);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v30;
        __int16 v94 = 2114;
        v95 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Update Access Record: checking child service %{public}@ of %{public}@",  buf,  0x16u);

        id v17 = v32;
        id v16 = v81;

        id v15 = v80;
      }

      -[TCCDServer updateAccessRecord:replaceOnly:doCompositionWithChildService:withRequestingProcess:function:accessIdentity:]( v82,  "updateAccessRecord:replaceOnly:doCompositionWithChildService:withRequestingProcess:function:accessIdentity:",  v28,  1LL,  1LL,  v15,  v16,  v17);
    }

    v79 = v17;
    if (v12)
    {
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v14 accessObject]);
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 serviceObject]);

      uint64_t v92 = 0LL;
      *(void *)buf = 1LL;
      id v36 = [v35 isAccessAllowedByDefault];
      int v37 = (void *)objc_claimAutoreleasedReturnValue([v20 accessIdentity]);
      LODWORD(v36) = -[TCCDServer evaluateAccessToService:defaultAccessAllowed:by:checkCodeRequirements:authorizationResult:authorizationReason:flags:subjectCodeIdentityDataResult:]( v82,  "evaluateAccessToService:defaultAccessAllowed:by:checkCodeRequirements:authorizationResult:authori zationReason:flags:subjectCodeIdentityDataResult:",  v35,  v36,  v37,  1LL,  buf,  &v92,  0LL,  0LL);

      uint64_t v38 = *(void *)buf;
      id v16 = v81;
      if ((_DWORD)v36)
      {
        if (v38 == 1)
        {
          BOOL v21 = 0;
          id v17 = v79;
          id v15 = v80;
LABEL_64:

          goto LABEL_65;
        }
      }
    }

    BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v14 accessObject]);
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 serviceObject]);

    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v14 lastModifiedDate]);
    [v41 timeIntervalSince1970];
    double v43 = v42;

    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v14 accessObject]);
    unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue([v44 indirectObject]);

    if (v45 && [v45 type] && objc_msgSend(v45, "type") != (id)1 && objc_msgSend(v45, "type") != (id)2)
    {
      __int16 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](v82, "logHandle"));
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_10002338C(v45, v14, v56);
      }
      BOOL v21 = 0;
      id v17 = v79;
      id v15 = v80;
      goto LABEL_63;
    }

    uint64_t v76 = (uint64_t)v43;
    if ([v45 type] == (id)1)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue([v14 accessObject]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 indirectObject]);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v47 codeIdentity]);

      id v49 = 0LL;
    }

    else
    {
      if ([v45 type] == (id)2) {
        id v49 = (void *)objc_claimAutoreleasedReturnValue([v45 fileProviderDomainID]);
      }
      else {
        id v49 = 0LL;
      }
      v48 = 0LL;
    }

    v78 = v40;
    unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue([v40 name]);
    __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
    id v52 = [v20 identifierAuthority];
    __int16 v53 = (void *)objc_claimAutoreleasedReturnValue([v79 attributionPath]);
    __int16 v54 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDServer translateAllFilesToEndpointSecurity:withClient:clientType:requestingProcess:function:attributionChain:executablePath:]( v82,  "translateAllFilesToEndpointSecurity:withClient:clientType:requestingProcess:function:attributionCh ain:executablePath:",  v50,  v51,  v52,  v80,  v81,  0LL,  v53));

    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472LL;
    v84[2] = sub_1000203EC;
    v84[3] = &unk_100065700;
    id v77 = v54;
    id v85 = v77;
    id v75 = v20;
    id v86 = v75;
    id v55 = v14;
    id v87 = v55;
    uint64_t v91 = (uint64_t)v43;
    id v74 = v45;
    id v88 = v74;
    __int16 v56 = v48;
    v89 = v56;
    id v57 = v49;
    id v90 = v57;
    int v58 = db_eval( (uint64_t)"INSERT OR REPLACE INTO access   (service, client, client_type, auth_value, auth_reason, auth_versio n, csreq, indirect_object_identifier_type, indirect_object_identifier, indirect_object_code_identit y, flags, last_modified) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",  v84,  0LL);
    BOOL v21 = v58 == 0;
    if (v58
      || (id v73 = v57,
          v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](v82, "logHandle")),
          BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_INFO),
          v59,
          id v57 = v73,
          !v60))
    {
LABEL_62:

      id v15 = v80;
      id v16 = v81;
      __int16 v40 = v78;
      id v17 = v79;
LABEL_63:

      goto LABEL_64;
    }

    v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v76));
    v72 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    v62 = (void *)objc_claimAutoreleasedReturnValue([v75 identifier]);
    v63 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v78,  "descriptionForAuthorizationValue:reason:",  objc_msgSend(v55, "authorizationValue"),  objc_msgSend(v55, "authorizationReason")));
    -[NSMutableString appendFormat:]( v72,  "appendFormat:",  @"Update Access Record: %@ for %@ to %@ (v%llu) at %lld (%@)",  v77,  v62,  v63,  [v55 authorizationVersion],  v76,  v61);

    if (![v55 flags])
    {
LABEL_54:
      v66 = v56;
      v67 = (void *)objc_claimAutoreleasedReturnValue([v75 verifierDescription]);
      -[NSMutableString appendFormat:](v72, "appendFormat:", @"\n\t CodeReq: %@", v67);

      if (v45)
      {
        if (v56)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s identifier](v56, "identifier"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s verifierDescription](v66, "verifierDescription"));
          -[NSMutableString appendFormat:](v72, "appendFormat:", @"\n\t Indirect %@ : %@", v68, v69);
        }

        else
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue([v74 description]);
          -[NSMutableString appendFormat:](v72, "appendFormat:", @"\n\t Indirect : %@", v68);
        }
      }

      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](v82, "logHandle"));
      id v57 = v73;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v72;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
      }

      __int16 v56 = v66;
      goto LABEL_62;
    }

    -[NSMutableString appendFormat:](v72, "appendFormat:", @" {");
    if ([v55 flags])
    {
      -[NSMutableString appendFormat:](v72, "appendFormat:", @"Timeout");
      if (([v55 flags] & 2) == 0)
      {
        int v64 = 1;
        goto LABEL_38;
      }

      -[NSMutableString appendFormat:](v72, "appendFormat:", @" | ");
      int v64 = 2;
    }

    else
    {
      if (([v55 flags] & 2) == 0)
      {
        int v64 = 0;
        goto LABEL_38;
      }

      int v64 = 1;
    }

    -[NSMutableString appendFormat:](v72, "appendFormat:", @"SB Ext");
LABEL_38:
    if (([v55 flags] & 4) != 0)
    {
      if (v64) {
        -[NSMutableString appendFormat:](v72, "appendFormat:", @" | ");
      }
      -[NSMutableString appendFormat:](v72, "appendFormat:", @"Allow Standard User to Set System Service");
      ++v64;
    }

    if (([v55 flags] & 8) != 0)
    {
      if (v64) {
        -[NSMutableString appendFormat:](v72, "appendFormat:", @" | ");
      }
      -[NSMutableString appendFormat:](v72, "appendFormat:", @"Next Request Should Prompt");
      int v64 = 1;
    }

    if (([v55 flags] & 0x10) != 0)
    {
      if (v64) {
        -[NSMutableString appendFormat:](v72, "appendFormat:", @" | ");
      }
      v65 = @"Has Prompted For Allow";
    }

    else
    {
      if (v64)
      {
LABEL_53:
        -[NSMutableString appendFormat:](v72, "appendFormat:", @"}");
        goto LABEL_54;
      }

      v65 = @"Default";
    }

    -[NSMutableString appendFormat:](v72, "appendFormat:", v65);
    goto LABEL_53;
  }

  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
    sub_100023428(v14, (os_log_s *)v20);
  }
  BOOL v21 = 0;
LABEL_65:

  return v21;
}

- (BOOL)evaluateComposedAuthorizationToService:(id)a3 andAccessSubject:(id)a4 withRelation:(int64_t)a5 authorizationResult:(unint64_t *)a6 authorizationReason:(unint64_t *)a7 subjectCodeIdentityDataResult:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  if (a5)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "macos_compositionChildService"));
    id v17 = "child";
    if (v16) {
      goto LABEL_3;
    }
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "macos_compositionParentService"));
    id v17 = "parent";
    if (v16)
    {
LABEL_3:
      int v37 = a7;
      id v38 = v15;
      unsigned int v18 = -[TCCDServer evaluateAccessToService:defaultAccessAllowed:by:checkCodeRequirements:authorizationResult:authorizationReason:flags:subjectCodeIdentityDataResult:]( self,  "evaluateAccessToService:defaultAccessAllowed:by:checkCodeRequirements:authorizationResult:authorizationRea son:flags:subjectCodeIdentityDataResult:",  v16,  [v16 isAccessAllowedByDefault],  v15,  1,  a6,  a7,  0,  a8);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
      BOOL v20 = v19;
      if (v18)
      {
        if (*a6 == 1) {
          os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
        }
        else {
          os_log_type_t v21 = OS_LOG_TYPE_INFO;
        }
        if (os_log_type_enabled(v19, v21))
        {
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v16 descriptionForAuthorizationValue:*a6 reason:*v37]);
          *(_DWORD *)buf = 138544130;
          __int128 v41 = v36;
          __int16 v42 = 2082;
          double v43 = v17;
          __int16 v44 = 2114;
          unsigned int v45 = v35;
          __int16 v46 = 2114;
          uint64_t v47 = v22;
          uint64_t v23 = (void *)v22;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "Evaluated composed authorization from %{public}@ to %{public}s service %{public}@: Auth:%{public}@",  buf,  0x2Au);
        }

        BOOL v24 = 1;
        if (!a5)
        {
          id v15 = v38;
          if (*a6 == 1)
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "macos_compositionParentService"));

            if (v25) {
              BOOL v24 = -[TCCDServer evaluateComposedAuthorizationToService:andAccessSubject:withRelation:authorizationResult:authorizationReason:subjectCodeIdentityDataResult:]( self,  "evaluateComposedAuthorizationToService:andAccessSubject:withRelation:authorizationResult:authoriza tionReason:subjectCodeIdentityDataResult:",  v16,  v38,  0LL,  a6,  v37,  a8);
            }
          }

          goto LABEL_21;
        }
      }

      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
          *(_DWORD *)buf = 138543874;
          __int128 v41 = v33;
          __int16 v42 = 2082;
          double v43 = v17;
          __int16 v44 = 2114;
          unsigned int v45 = v34;
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to evaluate composed authorization from %{public}@ to %{public}s service %{public}@",  buf,  0x20u);
        }

        BOOL v24 = 0;
      }

      id v15 = v38;
      goto LABEL_21;
    }
  }

  id v26 = a7;
  id v39 = 0LL;
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Service: %@ has an invalid %s composed service.",  v27,  v17));
  -[TCCDServer makeError:withCode:infoText:](self, "makeError:withCode:infoText:", &v39, 2LL, v28);
  id v29 = v39;

  __int16 v30 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  -[TCCDServer buildErrorString:forError:contextString:]( self,  "buildErrorString:forError:contextString:",  v30,  v29,  0LL);
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_1000234D4();
  }

  *a6 = 0LL;
  *id v26 = 1LL;

  BOOL v24 = 0;
LABEL_21:

  return v24;
}

- (unint64_t)numberOfRecordsForService:(id)a3 withAuthorizationValue:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  if (a4 == 1) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT COUNT(*) FROM access WHERE service = '%@'",  v7));
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELECT COUNT(*) FROM access WHERE service = '%@' AND auth_value = %lld",  v7,  a4));
  }
  id v9 = (void *)v8;

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000210C0;
    v13[3] = &unk_100064C68;
    v13[4] = &v14;
    if (db_eval((uint64_t)[v9 UTF8String], 0, v13))
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100023548();
      }

      _db_error(0);
    }
  }

  unint64_t v11 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v11;
}

- (unint64_t)numberOfRecordsForService:(id)a3
{
  return -[TCCDServer numberOfRecordsForService:withAuthorizationValue:]( self,  "numberOfRecordsForService:withAuthorizationValue:",  a3,  1LL);
}

- (id)accessRecordFromStep:(sqlite3_stmt *)a3
{
  uint64_t v5 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  sqlite3_column_text(a3, 0));
  id v6 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  sqlite3_column_text(a3, 1));
  uint64_t v7 = sqlite3_column_int(a3, 2);
  sqlite3_int64 v31 = sqlite3_column_int64(a3, 3);
  sqlite3_int64 v30 = sqlite3_column_int64(a3, 4);
  sqlite3_int64 v29 = sqlite3_column_int64(a3, 5);
  if (sqlite3_column_type(a3, 6) == 5)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    id v9 = sqlite3_column_blob(a3, 6);
    uint64_t v8 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v9,  sqlite3_column_bytes(a3, 6));
  }

  int v10 = sqlite3_column_int(a3, 7);
  int v28 = sqlite3_column_int(a3, 11);
  HIDWORD(v27) = sqlite3_column_int(a3, 12);
  unint64_t v11 = -[TCCDCodeIdentity initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:]( objc_alloc(&OBJC_CLASS___TCCDCodeIdentity),  "initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:",  v6,  v7,  v10,  v8 != 0LL,  v8);
  int v12 = sqlite3_column_int(a3, 8);
  uint64_t v13 = sqlite3_column_text(a3, 9);
  if (v13)
  {
    uint64_t v14 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v13);
  }

  else
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100023620();
    }

    uint64_t v14 = @"UNUSED";
  }

  if (-[__CFString isEqualToString:](v14, "isEqualToString:", @"UNUSED"))
  {
    uint64_t v16 = (TCCDAccessFileProviderDomainIndirectObject *)objc_claimAutoreleasedReturnValue( +[TCCDAccessIndirectObject unusedIndirectObject]( &OBJC_CLASS___TCCDAccessIndirectObject,  "unusedIndirectObject"));
LABEL_13:
    uint64_t v17 = (TCCDAccessCodeIndirectObject *)v16;
    goto LABEL_18;
  }

  if (v12 == 3)
  {
    uint64_t v16 = -[TCCDAccessFileProviderDomainIndirectObject initWithFileProviderDomainID:]( objc_alloc(&OBJC_CLASS___TCCDAccessFileProviderDomainIndirectObject),  "initWithFileProviderDomainID:",  v14);
    goto LABEL_13;
  }

  if (sqlite3_column_type(a3, 10) == 5)
  {
    unsigned int v18 = 0LL;
  }

  else
  {
    id v19 = sqlite3_column_blob(a3, 10);
    unsigned int v18 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v19,  sqlite3_column_bytes(a3, 10));
  }

  BOOL v20 = -[TCCDCodeIdentity initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:]( objc_alloc(&OBJC_CLASS___TCCDCodeIdentity),  "initWithIdentifier:authority:displayNamePolicyIdentifier:verifierType:verifierData:",  v14,  v12,  0LL,  v18 != 0LL,  v18);
  uint64_t v17 = -[TCCDAccessCodeIndirectObject initWithCodeIdentity:]( objc_alloc(&OBJC_CLASS___TCCDAccessCodeIndirectObject),  "initWithCodeIdentity:",  v20);

LABEL_18:
  os_log_type_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer platform](self, "platform"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 serviceByName:v5]);

  if (v22)
  {
    uint64_t v23 = -[TCCDAccessObject initWithService:indirectObject:]( objc_alloc(&OBJC_CLASS___TCCDAccessObject),  "initWithService:indirectObject:",  v22,  v17);
    BOOL v24 = -[NSDate initWithTimeIntervalSince1970:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSince1970:",  (double)SHIDWORD(v27));
    LOBYTE(v27) = 0;
    id v25 = -[TCCDAccessRecord initWithSubject:object:authorizationValue:authorizationReason:authorizationVersion:lastModified:flags:replaceStoredCodeRequirement:]( objc_alloc(&OBJC_CLASS___TCCDAccessRecord),  "initWithSubject:object:authorizationValue:authorizationReason:authorizationVersion:lastModified:flags:replac eStoredCodeRequirement:",  v11,  v23,  v31,  v30,  v29,  v24,  v28,  v27);
  }

  else
  {
    uint64_t v23 = (TCCDAccessObject *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
      sub_1000235BC();
    }
    id v25 = 0LL;
  }

  return v25;
}

- (id)fetchAllAccessRecords
{
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_1000215BC;
  int v10 = &unk_100064CD8;
  unint64_t v11 = self;
  int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = v12;
  if (db_eval((uint64_t)"SELECT * FROM access", 0LL, &v7))
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle", v7, v8, v9, v10, v11, v12));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100023688();
    }
  }

  id v5 = -[NSMutableArray copy](v3, "copy", v7, v8, v9, v10, v11);

  return v5;
}

- (id)descriptionDictionariesForAllAccessRecords
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer fetchAllAccessRecords](self, "fetchAllAccessRecords"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000216BC;
  v8[3] = &unk_100065728;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v8];
  id v6 = -[NSMutableArray copy](v5, "copy");

  return v6;
}

- (id)fetchAllOverriddenServiceNames
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000217EC;
  v7[3] = &unk_100064D00;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = v8;
  if (db_eval((uint64_t)"SELECT service FROM access_overrides", 0LL, v7))
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000236EC();
    }

    _db_error(0);
  }

  id v5 = -[NSMutableArray copy](v3, "copy");

  return v5;
}

- (id)fetchAllPolicies
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021940;
  v7[3] = &unk_100064D00;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = v8;
  if (db_eval((uint64_t)"SELECT * FROM policies", 0LL, v7))
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100023760();
    }

    _db_error(0);
  }

  id v5 = -[NSMutableArray copy](v3, "copy");

  return v5;
}

- (id)fetchAllActivePolicies
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100021BA0;
  v7[3] = &unk_100064D00;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = v8;
  if (db_eval((uint64_t)"SELECT * FROM active_policy", 0LL, v7))
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000237D4();
    }

    _db_error(0);
  }

  id v5 = -[NSMutableArray copy](v3, "copy");

  return v5;
}

- (id)stateDumpDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"PID");

  id v6 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", geteuid());
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"UID");

  uint64_t database_error_code = db_get_database_error_code();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", database_error_code));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"STATUS");

  if (!(_DWORD)database_error_code)
  {
    int v10 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", db_get_current_version());
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"VERS");

    filename = db_get_filename();
    if (filename)
    {
      id file_metadata = db_get_file_metadata(filename);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(file_metadata);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v14,  @"DB_FILE_METADATA");
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDServer descriptionDictionariesForAllAccessRecords]( self,  "descriptionDictionariesForAllAccessRecords"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, @"RECORDS");

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer fetchAllOverriddenServiceNames](self, "fetchAllOverriddenServiceNames"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, @"OVERRIDES");

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer fetchAllPolicies](self, "fetchAllPolicies"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v17, @"POLICIES");

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer fetchAllActivePolicies](self, "fetchAllActivePolicies"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, @"ACTIVE_POLICIES");

  id v19 = -[NSMutableDictionary copy](v3, "copy");
  return v19;
}

- (void)createStateHandler
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100021F08;
  v5[3] = &unk_100065750;
  v5[4] = self;
  os_state_add_handler(v4, v5);
}

- (BOOL)updateAuthorizationRecordFromContext:(id)a3 forResult:(id)a4 syncedUpdate:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);
  unsigned int v11 = [v9 databaseFlags];
  uint64_t v12 = (uint64_t)[v9 authorizationValue];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  if (![v13 isEqualToString:@"kTCCServicePhotos"])
  {
LABEL_8:

    goto LABEL_9;
  }

  id v14 = [v9 promptType];

  if (v14 == (id)2)
  {
    if ([v9 authorizationValue] == (id)4)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 serviceByName:@"kTCCServicePhotosAdd"]);

      uint64_t v17 = 2LL;
      uint64_t v12 = 2LL;
      int v10 = (void *)v16;
      goto LABEL_10;
    }

    if (![v9 authorizationValue])
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
        sub_10002394C(v8, (os_log_s *)v13);
      }
      goto LABEL_8;
    }
  }

- (BOOL)sendRecordMetricsForService:(const char *)a3
{
  v3 = a3;
  if (a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer platform](self, "platform"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceByName:v6]);

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDServer logHandle](self, "logHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[TCCDServer sendRecordMetricsForService:]";
      *(_WORD *)&_BYTE buf[12] = 2082;
      *(void *)&buf[14] = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}s: invoked for %{public}s;", buf, 0x16u);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    uint64_t v27 = sub_10001F874;
    uint64_t v28 = sub_10001F884;
    id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100022A28;
    v24[3] = &unk_100064C68;
    v24[4] = buf;
    unsigned int v18 = objc_retainBlock(v24);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100022CC0;
    v23[3] = &unk_100064FF8;
    v23[4] = v3;
    id v9 = v18;
    int v10 = db_eval( (uint64_t)"SELECT client, client_type, auth_value, csreq, last_modified, strftime('%s','now') - last_modified AS age, indirect_object_identifier, indirect_object_identifier_type, indirect_object_code_identity, auth_reason, auth_version, flags, pid, pid_version, boot_uuid FROM access WHERE service = ?",  v23,  v18);
    LOBYTE(v3) = v10 == 0;
    if (!v10)
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v11 = *(id *)(*(void *)&buf[8] + 40LL);
      id v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v20;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v11);
            }
            id v15 = (void *)objc_claimAutoreleasedReturnValue( [v7 populateRecordMetricWithFields:*(void *)(*((void *)&v19 + 1) + 8 * (void)i)]);
            if (v15)
            {
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDServer platform](self, "platform"));
              [v16 sendAnalyticsWithEventName:@"com.apple.TCC.authorization_audit" fields:v15];
            }
          }

          id v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }

        while (v12);
      }

      id v9 = v18;
    }

    _Block_object_dispose(buf, 8);
  }

  return (char)v3;
}

- (TCCDPlatform)platform
{
  return self->_platform;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void)setLogHandle:(id)a3
{
}

- (BOOL)macos_isSystemServer
{
  return self->_macos_isSystemServer;
}

- (void)setMacos_isSystemServer:(BOOL)a3
{
  self->_macos_isSystemServer = a3;
}

- (NSString)temporaryDirectory
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)cacheDirectory
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (BOOL)allowsInternalSecurityPolicies
{
  return self->_allowsInternalSecurityPolicies;
}

- (void)setAllowsInternalSecurityPolicies:(BOOL)a3
{
  self->_allowsInternalSecurityPolicies = a3;
}

- (OS_dispatch_source)macos_compatibilityFileVnodeSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setMacos_compatibilityFileVnodeSource:(id)a3
{
}

- (BOOL)testDoComposition
{
  return self->_testDoComposition;
}

- (void)setTestDoComposition:(BOOL)a3
{
  self->_testDoComposition = a3;
}

- (TCCDEventPublisher)eventPublisher
{
  return (TCCDEventPublisher *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setEventPublisher:(id)a3
{
}

- (TCCDReminderMonitor)reminderMonitor
{
  return (TCCDReminderMonitor *)objc_getProperty(self, a2, 96LL, 1);
}

- (void).cxx_destruct
{
}

@end