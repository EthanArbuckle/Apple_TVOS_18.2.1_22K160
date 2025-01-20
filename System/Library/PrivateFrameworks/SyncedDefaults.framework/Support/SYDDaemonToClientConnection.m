@interface SYDDaemonToClientConnection
+ (BOOL)isXPCConnection:(id)a3 entitledForStoreConfiguration:(id)a4;
+ (id)changeDictionaryWithChangedKeys:(id)a3 reason:(int64_t)a4 changeToken:(id)a5;
+ (id)changedKeysForStoreIdentifier:(id)a3 sinceChangeTokenIfValid:(id)a4 inCoreDataStore:(id)a5 error:(id *)a6;
+ (id)errorForUnknownStore:(id)a3;
+ (id)errorNotEntitledForStoreConfiguration:(id)a3;
+ (id)valueForEntitlement:(id)a3 xpcConnection:(id)a4 storeConfiguration:(id)a5;
- (BOOL)didRefreshBundleMap;
- (BOOL)isCloudSyncEnablementEntitledForStoreIdentifier:(id)a3;
- (BOOL)isEntitledForStoreConfiguration:(id)a3;
- (BOOL)isKnownStore:(id)a3;
- (BOOL)isPerformingManualSync;
- (BOOL)shouldEnforceQuotaForStoreConfiguration:(id)a3;
- (NSMutableSet)entitledStoreIDs;
- (NSMutableSet)notEntitledStoreIDs;
- (NSMutableSet)registeredStoreIDs;
- (NSNumber)ignoreQuotaEntitlementValue;
- (NSString)applicationIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SYDDaemonToClientConnection)initWithXPCConnection:(id)a3 delegate:(id)a4;
- (SYDDaemonToClientConnectionDelegate)delegate;
- (id)changeTokenURLForStoreConfiguration:(id)a3 xpcConnection:(id)a4 error:(id *)a5;
- (id)client;
- (id)description;
- (unint64_t)manualSyncCount;
- (void)allStoreIdentifiersWithCompletionHandler:(id)a3;
- (void)changeDictionarySinceChangeToken:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5;
- (void)changeTokenForStoreWithConfiguration:(id)a3 reply:(id)a4;
- (void)daemonToClientConnectionDidChangeValues:(id)a3;
- (void)dealloc;
- (void)decrementManualSyncCount;
- (void)dictionaryRepresentationForStoreWithConfiguration:(id)a3 reply:(id)a4;
- (void)incrementManualSyncCount;
- (void)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)notifyAccountDidChangeFromAccountID:(id)a3 toAccountID:(id)a4 completionHandler:(id)a5;
- (void)notifyAccountDidChangeWithCompletionHandler:(id)a3;
- (void)objectForKey:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5;
- (void)processAccountChangesWithCompletionHandler:(id)a3;
- (void)registerForChangeNotificationsForStoreWithConfiguration:(id)a3 reply:(id)a4;
- (void)removeObjectForKey:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5;
- (void)resume;
- (void)saveChangeToken:(id)a3 forStoreWithConfiguration:(id)a4 reply:(id)a5;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDidRefreshBundleMap:(BOOL)a3;
- (void)setEntitledStoreIDs:(id)a3;
- (void)setIgnoreQuotaEntitlementValue:(id)a3;
- (void)setManualSyncCount:(unint64_t)a3;
- (void)setNotEntitledStoreIDs:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 inStoreWithConfiguration:(id)a5 reply:(id)a6;
- (void)setQueue:(id)a3;
- (void)setRegisteredStoreIDs:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)syncManagerDidChangeNotification:(id)a3;
- (void)synchronizeStoreWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 testConfiguration:(id)a5 completionHandler:(id)a6;
@end

@implementation SYDDaemonToClientConnection

- (SYDDaemonToClientConnection)initWithXPCConnection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SYDDaemonToClientConnection;
  v9 = -[SYDDaemonToClientConnection init](&v31, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    id v11 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"com.apple.kvs.daemon-to-client.%d", [v7 processIdentifier]));
    v12 = (const char *)[v11 UTF8String];
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create(v12, v14);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingString:@".callback"]);
    id v18 = v17;
    v19 = (const char *)[v18 UTF8String];
    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create(v19, v21);
    callbackQueue = v10->_callbackQueue;
    v10->_callbackQueue = (OS_dispatch_queue *)v22;

    dispatch_queue_set_specific((dispatch_queue_t)v10->_queue, &v10->_queue, (void *)1, 0LL);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    registeredStoreIDs = v10->_registeredStoreIDs;
    v10->_registeredStoreIDs = (NSMutableSet *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    entitledStoreIDs = v10->_entitledStoreIDs;
    v10->_entitledStoreIDs = (NSMutableSet *)v26;

    v10->_manualSyncCount = 0LL;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v28 addObserver:v10 selector:"syncManagerDidChangeNotification:" name:@"SYDSyncManagerNotificationValuesDidChange" object:0];

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 addObserver:v10 selector:"daemonToClientConnectionDidChangeValues:" name:@"SYDDaemonToClientConnectionNotificationChangedValues" object:0];

    -[SYDDaemonToClientConnection resume](v10, "resume");
  }

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p;",
                   v5,
                   self));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection registeredStoreIDs](self, "registeredStoreIDs"));
  id v8 = [v7 count];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection registeredStoreIDs](self, "registeredStoreIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", @", "));
    [v6 appendFormat:@" registeredStoreIDs=[%@]", v11];
  }

  xpcConnection = self->_xpcConnection;
  if (xpcConnection && -[NSXPCConnection processIdentifier](xpcConnection, "processIdentifier")) {
    objc_msgSend( v6,  "appendFormat:",  @" clientPID=%d",  -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  }
  [v6 appendString:@">"];
  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SYDDaemonToClientConnection;
  -[SYDDaemonToClientConnection dealloc](&v4, "dealloc");
}

- (NSString)applicationIdentifier
{
  if (!self->_applicationIdentifier)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));

    if (!v3)
    {
      id v4 = SYDGetConnectionLog();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_100030244();
      }
    }

    id v6 = SYDGetConnectionLog();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Looking up application identifier for %@",  buf,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
    v9 = v8;
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    v10 = SecTaskCreateWithAuditToken(0LL, &token);

    if (v10)
    {
      CFErrorRef error = 0LL;
      CFStringRef v11 = SecTaskCopySigningIdentifier(v10, &error);
      v12 = (SYDDaemonToClientConnection *)v11;
      CFErrorRef v13 = error;
      if (error)
      {
        id v14 = SYDGetConnectionLog();
        applicationIdentifier = (NSString *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled((os_log_t)applicationIdentifier, OS_LOG_TYPE_ERROR)) {
          sub_1000301E4();
        }
      }

      else
      {
        if (!v11)
        {
LABEL_23:
          CFRelease(v10);

          return self->_applicationIdentifier;
        }

        id v18 = SYDGetConnectionLog();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v12;
          __int16 v26 = 2112;
          v27 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Found application identifier %@ for %@",  buf,  0x16u);
        }

        dispatch_queue_attr_t v20 = v12;
        applicationIdentifier = self->_applicationIdentifier;
        self->_applicationIdentifier = v20;
      }

      goto LABEL_23;
    }

    id v16 = SYDGetConnectionLog();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000301B8();
    }
  }

  return self->_applicationIdentifier;
}

- (void)resume
{
  id v3 = SYDGetConnectionLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100030270(self, v4);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SYDClientToDaemonConnection daemonProtocolInterface]( &OBJC_CLASS___SYDClientToDaemonConnection,  "daemonProtocolInterface"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
  [v6 setExportedInterface:v5];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
  [v7 setExportedObject:self];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SYDClientToDaemonConnection clientProtocolInterface]( &OBJC_CLASS___SYDClientToDaemonConnection,  "clientProtocolInterface"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
  [v9 setRemoteObjectInterface:v8];

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000194D0;
  v15[3] = &unk_10004D2C0;
  objc_copyWeak(&v16, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
  [v10 setInterruptionHandler:v15];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001959C;
  v13[3] = &unk_10004D2C0;
  objc_copyWeak(&v14, &location);
  CFStringRef v11 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
  [v11 setInvalidationHandler:v13];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
  [v12 resume];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

+ (id)valueForEntitlement:(id)a3 xpcConnection:(id)a4 storeConfiguration:(id)a5
{
  return [a4 valueForEntitlement:a3];
}

- (BOOL)isEntitledForStoreConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  CFErrorRef v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection queue](self, "queue"));
  p_queue = &self->_queue;
  v9[0] = (void (*)(void))_NSConcreteStackBlock;
  v9[1] = (void (*)(void))3221225472LL;
  v9[2] = sub_100019784;
  v9[3] = (void (*)(void))&unk_10004D2E8;
  CFStringRef v11 = &v12;
  v9[4] = (void (*)(void))self;
  id v7 = v4;
  id v10 = v7;
  sub_10000ACE0(v5, p_queue, v9);

  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v5;
}

+ (BOOL)isXPCConnection:(id)a3 entitledForStoreConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SYDGetConnectionLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100030748();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 storeID]);
  CFStringRef v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  id v12 = [(id)objc_opt_class(a1) valueForEntitlement:@"com.apple.developer.ubiquity-kvstore-identifier" xpcConnection:v6 storeConfiguration:v7];
  CFErrorRef v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v13) & 1) == 0 || ![v13 isEqualToString:v11])
  {
    id v17 = [(id)objc_opt_class(a1) valueForEntitlement:@"com.apple.private.ubiquity-additional-kvstore-identifiers" xpcConnection:v6 storeConfiguration:v7];
    char v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v15) & 1) != 0 && [v15 containsObject:v11])
    {
      id v18 = SYDGetConnectionLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100030490();
      }
      BOOL v16 = 1;
      goto LABEL_44;
    }

    v37 = v10;
    id v20 = [(id)objc_opt_class(a1) valueForEntitlement:@"com.apple.private.ubiquity-kvstore-identifier-prefix" xpcConnection:v6 storeConfiguration:v7];
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v19) & 1) != 0 && [v11 hasPrefix:v19])
    {
      id v21 = SYDGetConnectionLog();
      dispatch_queue_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_100030504();
      }
      BOOL v16 = 1;
      goto LABEL_43;
    }

    id v23 = [(id)objc_opt_class(a1) valueForEntitlement:@"com.apple.private.ubiquity-kvstore-manage" xpcConnection:v6 storeConfiguration:v7];
    dispatch_queue_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v22) & 1) != 0 && -[os_log_s BOOLValue](v22, "BOOLValue"))
    {
      id v24 = SYDGetConnectionLog();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_100030578();
      }
      BOOL v16 = 1;
      goto LABEL_42;
    }

    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v6 valueForEntitlement:@"com.apple.private.trust-ubiquity-kvstore-identifier"]);
    objc_opt_class(&OBJC_CLASS___NSNumber);
    v36 = v25;
    if ((objc_opt_isKindOfClass(v25) & 1) != 0 && -[os_log_s BOOLValue](v25, "BOOLValue"))
    {
      id v26 = SYDGetConnectionLog();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        sub_1000305EC();
      }
      BOOL v16 = 1;
      goto LABEL_41;
    }

    id v27 = [(id)objc_opt_class(a1) valueForEntitlement:@"com.apple.private.ubiquity-kvstore-access" xpcConnection:v6 storeConfiguration:v7];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    objc_opt_class(&OBJC_CLASS___NSArray);
    v35 = (os_log_s *)v28;
    if ((objc_opt_isKindOfClass(v28) & 1) != 0)
    {
      id v29 = SYDGetConnectionLog();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      v25 = v36;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        sub_100030660();
      }
    }

    else
    {
      id v31 = [(id)objc_opt_class(a1) valueForEntitlement:@"com.apple.private.kvs.test" xpcConnection:v6 storeConfiguration:v7];
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v30) & 1) == 0)
      {
        BOOL v16 = 0;
        v25 = v36;
        goto LABEL_40;
      }

      v25 = v36;
      if (!-[os_log_s BOOLValue](v30, "BOOLValue")
        || ![v11 hasPrefix:@"com.apple.kvs.test"])
      {
        BOOL v16 = 0;
        goto LABEL_40;
      }

      id v32 = SYDGetConnectionLog();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        sub_1000306D4();
      }
    }

    BOOL v16 = 1;
LABEL_40:

LABEL_41:
LABEL_42:

LABEL_43:
    id v10 = v37;
LABEL_44:

    goto LABEL_45;
  }

  id v14 = SYDGetConnectionLog();
  char v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG)) {
    sub_10003041C();
  }
  BOOL v16 = 1;
LABEL_45:

  return v16;
}

+ (id)errorNotEntitledForStoreConfiguration:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 storeID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not entitled to access store %@",  v4));

  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  3333LL,  v6));

  return v7;
}

- (BOOL)shouldEnforceQuotaForStoreConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection ignoreQuotaEntitlementValue](self, "ignoreQuotaEntitlementValue"));

  if (!v5)
  {
    id v6 = (void *)objc_opt_class(self);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [v6 valueForEntitlement:@"com.apple.private.kvs.ignore-quota" xpcConnection:v7 storeConfiguration:v4]);
    -[SYDDaemonToClientConnection setIgnoreQuotaEntitlementValue:](self, "setIgnoreQuotaEntitlementValue:", v8);
  }

  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection ignoreQuotaEntitlementValue](self, "ignoreQuotaEntitlementValue"));
  char v10 = [v9 BOOLValue] ^ 1;

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4 inStoreWithConfiguration:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  CFErrorRef v13 = (void (**)(id, uint64_t))a6;
  if (!-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:](self, "isEntitledForStoreConfiguration:", v12))
  {
    id v29 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v12];
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
LABEL_13:
    id v32 = (void *)v30;
    v13[2](v13, v30);

    goto LABEL_14;
  }

  if (!-[SYDDaemonToClientConnection isKnownStore:](self, "isKnownStore:", v12))
  {
    id v31 = [(id)objc_opt_class(self) errorForUnknownStore:v12];
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v31);
    goto LABEL_13;
  }

  id v14 = SYDGetConnectionLog();
  char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_1000307D4();
  }

  char v35 = 0;
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection delegate](self, "delegate"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 storeID]);
  id v34 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 connection:self syncManagerForStoreID:v17 error:&v34]);
  id v19 = v34;

  if (v18)
  {
    if (!v19)
    {
      BOOL v20 = -[SYDDaemonToClientConnection shouldEnforceQuotaForStoreConfiguration:]( self,  "shouldEnforceQuotaForStoreConfiguration:",  v12);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 storeID]);
      dispatch_queue_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
      id v33 = 0LL;
      [v18 setObject:v10 forKey:v11 inStoreWithIdentifier:v22 excludeFromChangeTracking:1 enforceQuota:v20 didChangeValue:&v35 error:&v33];
      id v19 = v33;

      if (!v19)
      {
        if (v35)
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          id v36 = v11;
          v37[0] = @"changedKeys";
          id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v36,  1LL));
          v37[1] = @"storeID";
          v38[0] = v24;
          v25 = (void *)objc_claimAutoreleasedReturnValue([v12 storeID]);
          v38[1] = v25;
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  2LL));
          [v23 postNotificationName:@"SYDDaemonToClientConnectionNotificationChangedValues" object:self userInfo:v26];

          id v19 = 0LL;
        }
      }
    }
  }

  id v27 = sub_10000AD28(v19);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v13[2](v13, (uint64_t)v28);

LABEL_14:
}

- (void)objectForKey:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  if (!-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:](self, "isEntitledForStoreConfiguration:", v9))
  {
    id v22 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v9];
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
LABEL_11:
    v25 = (void *)v23;
    v10[2](v10, 0LL, v23);

    goto LABEL_12;
  }

  if (!-[SYDDaemonToClientConnection isKnownStore:](self, "isKnownStore:", v9))
  {
    id v24 = [(id)objc_opt_class(self) errorForUnknownStore:v9];
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_11;
  }

  id v11 = SYDGetConnectionLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100030834();
  }

  CFErrorRef v13 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection delegate](self, "delegate"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 storeID]);
  id v27 = 0LL;
  char v15 = (void *)objc_claimAutoreleasedReturnValue([v13 connection:self syncManagerForStoreID:v14 error:&v27]);
  id v16 = v27;

  id v17 = 0LL;
  if (v15 && !v16)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 storeID]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
    id v26 = 0LL;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v8 inStoreWithIdentifier:v19 error:&v26]);
    id v16 = v26;
  }

  id v20 = sub_10000AD28(v16);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  ((void (**)(id, void *, uint64_t))v10)[2](v10, v17, (uint64_t)v21);

LABEL_12:
}

- (void)removeObjectForKey:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  if (!-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:](self, "isEntitledForStoreConfiguration:", v9))
  {
    id v21 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v9];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
LABEL_11:
    id v24 = (void *)v22;
    v10[2](v10, v22);

    goto LABEL_12;
  }

  if (!-[SYDDaemonToClientConnection isKnownStore:](self, "isKnownStore:", v9))
  {
    id v23 = [(id)objc_opt_class(self) errorForUnknownStore:v9];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v23);
    goto LABEL_11;
  }

  id v11 = SYDGetConnectionLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100030894();
  }

  CFErrorRef v13 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection delegate](self, "delegate"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 storeID]);
  id v26 = 0LL;
  char v15 = (void *)objc_claimAutoreleasedReturnValue([v13 connection:self syncManagerForStoreID:v14 error:&v26]);
  id v16 = v26;

  if (v15 && !v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 storeID]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
    id v25 = 0LL;
    [v15 removeObjectForKey:v8 inStoreWithIdentifier:v18 excludeFromChangeTracking:1 error:&v25];
    id v16 = v25;
  }

  id v19 = sub_10000AD28(v16);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v10[2](v10, (uint64_t)v20);

LABEL_12:
}

- (void)synchronizeStoreWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if (!-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:](self, "isEntitledForStoreConfiguration:", v6))
  {
    id v16 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v6];
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
LABEL_9:
    id v19 = (void *)v17;
    v7[2](v7, v17);

    goto LABEL_16;
  }

  if (!-[SYDDaemonToClientConnection isKnownStore:](self, "isKnownStore:", v6))
  {
    id v18 = [(id)objc_opt_class(self) errorForUnknownStore:v6];
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_9;
  }

  id v8 = SYDGetConnectionLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100030954();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection delegate](self, "delegate"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 storeID]);
  id v31 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 connection:self syncManagerForStoreID:v11 error:&v31]);
  id v13 = v31;

  if (v12)
  {
    -[SYDDaemonToClientConnection incrementManualSyncCount](self, "incrementManualSyncCount");
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 storeID]);
    char v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10001A980;
    v28[3] = &unk_10004D338;
    v28[4] = self;
    id v29 = v6;
    uint64_t v30 = v7;
    [v12 synchronizeStoreWithIdentifier:v15 completionHandler:v28];
  }

  else
  {
    id v20 = SYDGetConnectionLog();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000308F4();
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 storeID]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No sync manager trying to sync store %@",  v23));

    if (!v13)
    {
      NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
      id v33 = v24;
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  1234LL,  v25));
    }

    id v26 = sub_10000AD28(v13);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v7[2](v7, (uint64_t)v27);
  }

LABEL_16:
}

- (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 testConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v40 = a5;
  id v39 = a6;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v46;
    while (2)
    {
      char v15 = 0LL;
      do
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [[SYDStoreID alloc] initWithIdentifier:*(void *)(*((void *)&v45 + 1) + 8 * (void)v15) type:a4];
        [v16 setTestConfiguration:v40];
        id v17 = [[SYDStoreConfiguration alloc] initWithStoreID:v16];
        if (!-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:]( self,  "isEntitledForStoreConfiguration:",  v17))
        {
          id v29 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v17];
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          uint64_t v28 = v39;
          (*((void (**)(id, void *))v39 + 2))(v39, v30);

          goto LABEL_24;
        }

        char v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v18 = [v11 count];
  id v19 = SYDGetConnectionLog();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = v20;
  if (v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100030AA4();
    }

    id v22 = objc_alloc(&OBJC_CLASS___SYDStoreID);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    id v24 = [v22 initWithIdentifier:v23 type:a4];

    [v24 setTestConfiguration:v40];
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection delegate](self, "delegate"));
    id v43 = 0LL;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 connection:self syncManagerForStoreID:v24 error:&v43]);
    id v27 = v43;

    if (v26)
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_10001AEE4;
      v41[3] = &unk_10004D158;
      v41[4] = self;
      uint64_t v28 = v39;
      id v42 = v39;
      [v26 synchronizeStoresWithIdentifiers:v11 completionHandler:v41];
    }

    else
    {
      id v31 = SYDGetConnectionLog();
      NSErrorUserInfoKey v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_100030A1C(a4, v32);
      }

      id v33 = sub_10000B838(a4);
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      char v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No sync manager trying to sync stores with type %@",  v34));

      if (!v27)
      {
        NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
        v50 = v35;
        id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
        id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  1234LL,  v36));
      }

      id v37 = sub_10000AD28(v27);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      uint64_t v28 = v39;
      (*((void (**)(id, void *))v39 + 2))(v39, v38);
    }
  }

  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Asked to sync zero stores", buf, 2u);
    }

    uint64_t v28 = v39;
    (*((void (**)(id, void))v39 + 2))(v39, 0LL);
  }

- (void)dictionaryRepresentationForStoreWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  if (-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:](self, "isEntitledForStoreConfiguration:", v6))
  {
    id v8 = SYDGetConnectionLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100030B40();
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection delegate](self, "delegate"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 storeID]);
    id v23 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 connection:self syncManagerForStoreID:v11 error:&v23]);
    id v13 = v23;

    uint64_t v14 = 0LL;
    if (v12 && !v13)
    {
      char v15 = (void *)objc_claimAutoreleasedReturnValue([v12 coreDataStore]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 storeID]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
      id v22 = 0LL;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v15 dictionaryRepresentationForStoreWithIdentifier:v17 error:&v22]);
      id v13 = v22;
    }

    id v18 = sub_10000AD28(v13);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v7[2](v7, v14, v19);
  }

  else
  {
    id v20 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v6];
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v7[2](v7, 0LL, v21);
  }
}

- (void)allStoreIdentifiersWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  id v5 = SYDGetConnectionLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100030BA0();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.private.ubiquity-kvsutil-access"]);

  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8) & 1) != 0 && [v8 BOOLValue])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection delegate](self, "delegate"));
    id v14 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allStoreIdentifiersWithError:&v14]);
    id v11 = v14;

    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  if (qword_100057A20 != -1)
  {
    dispatch_once(&qword_100057A20, &stru_10004D380);
    id v11 = 0LL;
    id v10 = 0LL;
    if (!v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  id v11 = 0LL;
  id v10 = 0LL;
  if (v4)
  {
LABEL_9:
    id v12 = sub_10000AD28(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v4[2](v4, v10, v13);
  }

- (BOOL)isCloudSyncEnablementEntitledForStoreIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 valueForEntitlement:@"com.apple.private.kvs.allow-sync-enablement-modifications"]);

  objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v6) & 1) != 0 && ([v6 BOOLValue])
  {
    BOOL v7 = 1;
  }

  else
  {
    id v8 = SYDGetConnectionLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100030BF8();
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  if (-[SYDDaemonToClientConnection isCloudSyncEnablementEntitledForStoreIdentifier:]( self,  "isCloudSyncEnablementEntitledForStoreIdentifier:",  v9))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[SYDStoreBundleMap sharedInstance](&OBJC_CLASS___SYDStoreBundleMap, "sharedInstance"));
    uint64_t v8 = (uint64_t)[v7 isCloudSyncUserDefaultEnabledForStoreIdentifier:v9];
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  v6[2](v6, v8);
}

- (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (-[SYDDaemonToClientConnection isCloudSyncEnablementEntitledForStoreIdentifier:]( self,  "isCloudSyncEnablementEntitledForStoreIdentifier:"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SYDStoreBundleMap sharedInstance](&OBJC_CLASS___SYDStoreBundleMap, "sharedInstance"));
    [v6 setCloudSyncUserDefaultEnabled:v4 storeIdentifier:v7];
  }
}

- (void)registerForChangeNotificationsForStoreWithConfiguration:(id)a3 reply:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void))a4;
  if (-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:](self, "isEntitledForStoreConfiguration:", v10))
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001B5F4;
    block[3] = &unk_10004CA88;
    id v12 = v10;
    id v13 = self;
    dispatch_sync(v7, block);

    v6[2](v6, 0LL);
    uint64_t v8 = v12;
  }

  else
  {
    id v9 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v10];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    ((void (**)(id, void *))v6)[2](v6, v8);
  }
}

- (void)changeDictionarySinceChangeToken:(id)a3 inStoreWithConfiguration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *))a5;
  if (-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:](self, "isEntitledForStoreConfiguration:", v9))
  {
    id v11 = SYDGetConnectionLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v9;
      __int16 v41 = 2112;
      id v42 = self;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Generating change dictionary for token %@ in store (%@) for %@",  buf,  0x20u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection delegate](self, "delegate"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 storeID]);
    id v36 = 0LL;
    char v15 = (void *)objc_claimAutoreleasedReturnValue([v13 connection:self syncManagerForStoreID:v14 error:&v36]);
    id v16 = v36;

    id v17 = 0LL;
    if (v15 && !v16)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 storeID]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 coreDataStore]);
      id v35 = 0LL;
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentChangeTokenForStoreIdentifier:v19 error:&v35]);
      id v16 = v35;

      if (v16)
      {
        id v22 = SYDGetConnectionLog();
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100030DEC();
        }
        id v17 = 0LL;
      }

      else
      {
        id v26 = (void *)objc_opt_class(self);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v15 coreDataStore]);
        id v34 = 0LL;
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v26 changedKeysForStoreIdentifier:v19 sinceChangeTokenIfValid:v8 inCoreDataStore:v27 error:&v34]);
        id v16 = v34;

        if (v16)
        {
          id v28 = SYDGetConnectionLog();
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_100030D8C();
          }
          id v17 = 0LL;
        }

        else
        {
          id v30 = [(id)objc_opt_class(self) changeDictionaryWithChangedKeys:v23 reason:0 changeToken:v21];
          id v17 = (void *)objc_claimAutoreleasedReturnValue(v30);
          id v31 = SYDGetConnectionLog();
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            sub_100030D18(v23, v29);
          }
        }
      }
    }

    id v32 = sub_10000AD28(v16);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v10[2](v10, v17, v33);
  }

  else
  {
    id v24 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v9];
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v10[2](v10, 0LL, v25);
  }
}

- (void)changeTokenForStoreWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  if (-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:](self, "isEntitledForStoreConfiguration:", v6))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
    id v36 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SYDDaemonToClientConnection changeTokenURLForStoreConfiguration:xpcConnection:error:]( self,  "changeTokenURLForStoreConfiguration:xpcConnection:error:",  v6,  v8,  &v36));
    id v10 = v36;

    if (v9)
    {
      id v35 = 0LL;
      id v34 = 0LL;
      unsigned __int8 v11 = [v9 getResourceValue:&v35 forKey:NSURLFileResourceTypeKey error:&v34];
      id v12 = v35;
      id v13 = v34;

      if ((v11 & 1) != 0)
      {
        if ([v12 isEqual:NSURLFileResourceTypeSymbolicLink])
        {
          id v14 = SYDGetConnectionLog();
          char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            sub_100030E78(v6, v15);
          }

          NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
          id v38 = @"Change token should not be a symbolic link";
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
          uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  1040LL,  v16));

          id v18 = 0LL;
          id v13 = (id)v17;
          goto LABEL_32;
        }

        id v33 = v13;
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v9,  0LL,  &v33));
        id v10 = v33;

        if (!v10) {
          goto LABEL_20;
        }
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
        if ([v25 isEqualToString:NSCocoaErrorDomain])
        {
          id v26 = [v10 code];

          if (v26 == (id)260)
          {

            goto LABEL_20;
          }
        }

        else
        {
        }

        id v29 = SYDGetConnectionLog();
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_100030F1C();
        }

LABEL_31:
        id v13 = v10;
        goto LABEL_32;
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
      if ([v23 isEqualToString:NSCocoaErrorDomain])
      {
        id v24 = [v13 code];

        if (v24 == (id)260)
        {

          id v18 = 0LL;
LABEL_20:
          id v13 = 0LL;
LABEL_32:
          id v31 = sub_10000AD28(v13);
          id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v7[2](v7, v18, v32);

          goto LABEL_33;
        }
      }

      else
      {
      }

      id v27 = SYDGetConnectionLog();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100030F7C();
      }
    }

    else
    {
      id v21 = SYDGetConnectionLog();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100030E4C();
      }

      if (v10)
      {
        id v12 = 0LL;
        id v18 = 0LL;
        goto LABEL_31;
      }

      id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  260LL,  0LL));
      id v12 = 0LL;
    }

    id v18 = 0LL;
    goto LABEL_32;
  }

  id v19 = [(id)objc_opt_class(self) errorNotEntitledForStoreConfiguration:v6];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v7[2](v7, 0LL, v20);

LABEL_33:
}

- (void)saveChangeToken:(id)a3 forStoreWithConfiguration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[SYDDaemonToClientConnection isEntitledForStoreConfiguration:](self, "isEntitledForStoreConfiguration:", v9))
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
    id v48 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SYDDaemonToClientConnection changeTokenURLForStoreConfiguration:xpcConnection:error:]( self,  "changeTokenURLForStoreConfiguration:xpcConnection:error:",  v9,  v11,  &v48));
    id v13 = (os_log_s *)v48;

    if (!v12)
    {
      id v23 = SYDGetConnectionLog();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100030FDC();
      }
      goto LABEL_46;
    }

    id v14 = SYDGetConnectionLog();
    char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (!v8)
    {
      if (v16) {
        sub_10003109C();
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      __int128 v47 = v13;
      unsigned __int8 v25 = [v24 removeItemAtURL:v12 error:&v47];
      id v26 = v47;

      if ((v25 & 1) != 0) {
        goto LABEL_47;
      }
      if (sub_10000B7C4(v26))
      {
        id v13 = 0LL;
        id v19 = v26;
      }

      else
      {
        id v27 = SYDGetConnectionLog();
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10003103C();
        }
        id v13 = v26;
      }

+ (id)changedKeysForStoreIdentifier:(id)a3 sinceChangeTokenIfValid:(id)a4 inCoreDataStore:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v19 = 0LL;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 changedKeysForStoreIdentifier:v9 sinceChangeToken:a4 error:&v19]);
  id v12 = v19;
  if (v12 && +[SYDCoreDataStore isInvalidTokenError:](&OBJC_CLASS___SYDCoreDataStore, "isInvalidTokenError:", v12))
  {
    id v13 = SYDGetCoreDataLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Received error about a bad persistent history token. Throwing it away and trying again.",  buf,  2u);
    }

    id v17 = 0LL;
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 changedKeysForStoreIdentifier:v9 sinceChangeToken:0 error:&v17]);
    id v12 = v17;

    unsigned __int8 v11 = (void *)v15;
  }

  if (a6) {
    *a6 = v12;
  }

  return v11;
}

+ (id)changeDictionaryWithChangedKeys:(id)a3 reason:(int64_t)a4 changeToken:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  if ([v7 count])
  {
    v13[0] = NSUbiquitousKeyValueStoreChangeReasonKey;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    v13[1] = NSUbiquitousKeyValueStoreChangedKeysKey;
    v14[0] = v10;
    v14[1] = v7;
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

    [v9 setObject:v11 forKeyedSubscript:@"NSUbiquitousKeyValueStoreDidChangeExternallyNotificationUserInfo"];
  }

  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:@"ChangeToken"];
  }

  return v9;
}

- (void)processAccountChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C764;
  block[3] = &unk_10004D360;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)syncManagerDidChangeNotification:(id)a3
{
  id v4 = a3;
  if (!-[SYDDaemonToClientConnection isPerformingManualSync](self, "isPerformingManualSync"))
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection queue](self, "queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10001C8E0;
    v6[3] = &unk_10004CA88;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)notifyAccountDidChangeWithCompletionHandler:(id)a3
{
}

- (void)notifyAccountDidChangeFromAccountID:(id)a3 toAccountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = _os_activity_create( (void *)&_mh_execute_header,  "kvs/notify-account-change",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection queue](self, "queue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10001CEF0;
  v16[3] = &unk_10004D3F8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);

  os_activity_scope_leave(&state);
}

- (void)daemonToClientConnectionDidChangeValues:(id)a3
{
  id v4 = a3;
  id v5 = (SYDDaemonToClientConnection *)objc_claimAutoreleasedReturnValue([v4 object]);

  if (v5 != self)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"storeID"]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"changedKeys"]);

    if (v7 && [v9 count])
    {
      uint64_t v39 = 0LL;
      id v40 = &v39;
      uint64_t v41 = 0x2020000000LL;
      char v42 = 0;
      id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001D76C;
      block[3] = &unk_10004D2E8;
      id v38 = &v39;
      void block[4] = self;
      id v11 = v7;
      id v37 = v11;
      dispatch_sync(v10, block);

      if (*((_BYTE *)v40 + 24))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection delegate](self, "delegate"));
        id v35 = 0LL;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 connection:self syncManagerForStoreID:v11 error:&v35]);
        id v14 = v35;

        if (!v13 || v14)
        {
          id v22 = SYDGetConnectionLog();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_1000315B8();
          }
        }

        else
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 coreDataStore]);
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
          id v34 = 0LL;
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 currentChangeTokenForStoreIdentifier:v16 error:&v34]);
          id v14 = v34;

          if (v14)
          {
            id v18 = SYDGetConnectionLog();
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_100031618();
            }
          }

          else
          {
            id v23 = [(id)objc_opt_class(self) changeDictionaryWithChangedKeys:v9 reason:0 changeToken:v17];
            id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            id v25 = SYDGetConnectionLog();
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              id v30 = v24;
              unsigned int v29 = [v9 count];
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
              *(_DWORD *)buf = 67109378;
              unsigned int v44 = v29;
              __int16 v45 = 2112;
              __int128 v46 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Sending notification about %d changed keys for store <(%@)>",  buf,  0x12u);

              id v24 = v30;
            }

            unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue([v11 personaUniqueString]);
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472LL;
            v31[2] = sub_10001D7B8;
            v31[3] = &unk_10004CB78;
            v31[4] = self;
            id v32 = v11;
            id v19 = v24;
            id v33 = v19;
            sub_10000D00C(v28, v31);
          }
        }
      }

      _Block_object_dispose(&v39, 8);
    }

    else
    {
      id v20 = SYDGetConnectionLog();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100031558();
      }
    }
  }
}

- (id)client
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SYDDaemonToClientConnection xpcConnection](self, "xpcConnection"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _unboostingRemoteObjectProxy]);

  return v3;
}

- (id)changeTokenURLForStoreConfiguration:(id)a3 xpcConnection:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8) {
    [v8 auditToken];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  if (!sandbox_container_path_for_audit_token(v19, v20, 1024LL))
  {
    if (v20[0])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v10,  1LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"Library" isDirectory:1]);

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByAppendingPathComponent:@"SyncedPreferences" isDirectory:1]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:@"com.apple.kvs" isDirectory:1]);

      if (v14) {
        goto LABEL_8;
      }
    }
  }

  id v15 = sub_10000BAB0(a5);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v14)
  {
LABEL_8:
    id v16 = sub_10000B85C(v7, v14);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (BOOL)isKnownStore:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 storeID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.sbd3",  @"com.apple.security.cloudkeychainproxy3",  0LL));
  unsigned int v7 = [v6 containsObject:v5];

  if (v7)
  {
    id v8 = SYDGetConnectionLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100031678();
    }
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SYDStoreBundleMap sharedInstance](&OBJC_CLASS___SYDStoreBundleMap, "sharedInstance"));
  if ((-[os_log_s isStoreIdentifierUsedOnThisDevice:](v9, "isStoreIdentifierUsedOnThisDevice:", v5) & 1) != 0)
  {
    BOOL v10 = 1;
  }

  else
  {
    if (-[SYDDaemonToClientConnection didRefreshBundleMap](self, "didRefreshBundleMap")) {
      goto LABEL_10;
    }
    id v11 = SYDGetConnectionLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100031738();
    }

    -[os_log_s clearCachedStoreBundleMap](v9, "clearCachedStoreBundleMap");
    BOOL v10 = 1;
    -[SYDDaemonToClientConnection setDidRefreshBundleMap:](self, "setDidRefreshBundleMap:", 1LL);
    if ((-[os_log_s isStoreIdentifierUsedOnThisDevice:](v9, "isStoreIdentifierUsedOnThisDevice:", v5) & 1) == 0)
    {
LABEL_10:
      id v13 = SYDGetConnectionLog();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_1000316D8();
      }

      goto LABEL_13;
    }
  }

+ (id)errorForUnknownStore:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 storeID]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Tried to access unknown store %@",  v4));

  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  BOOL v10 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  101010LL,  v6));

  return v7;
}

- (void)incrementManualSyncCount
{
  v2 = self;
  objc_sync_enter(v2);
  -[SYDDaemonToClientConnection setManualSyncCount:]( v2,  "setManualSyncCount:",  (char *)-[SYDDaemonToClientConnection manualSyncCount](v2, "manualSyncCount") + 1);
  id v3 = SYDGetConnectionLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100031764((uint64_t)v2, (uint64_t)&v5, -[SYDDaemonToClientConnection manualSyncCount](v2, "manualSyncCount"));
  }

  objc_sync_exit(v2);
}

- (void)decrementManualSyncCount
{
  v2 = self;
  objc_sync_enter(v2);
  -[SYDDaemonToClientConnection setManualSyncCount:]( v2,  "setManualSyncCount:",  (char *)-[SYDDaemonToClientConnection manualSyncCount](v2, "manualSyncCount") - 1);
  id v3 = SYDGetConnectionLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000317A0((uint64_t)v2, (uint64_t)&v5, -[SYDDaemonToClientConnection manualSyncCount](v2, "manualSyncCount"));
  }

  objc_sync_exit(v2);
}

- (BOOL)isPerformingManualSync
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = -[SYDDaemonToClientConnection manualSyncCount](v2, "manualSyncCount") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (SYDDaemonToClientConnectionDelegate)delegate
{
  return (SYDDaemonToClientConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)registeredStoreIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRegisteredStoreIDs:(id)a3
{
}

- (NSMutableSet)entitledStoreIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setEntitledStoreIDs:(id)a3
{
}

- (NSMutableSet)notEntitledStoreIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setNotEntitledStoreIDs:(id)a3
{
}

- (NSNumber)ignoreQuotaEntitlementValue
{
  return self->_ignoreQuotaEntitlementValue;
}

- (void)setIgnoreQuotaEntitlementValue:(id)a3
{
}

- (unint64_t)manualSyncCount
{
  return self->_manualSyncCount;
}

- (void)setManualSyncCount:(unint64_t)a3
{
  self->_manualSyncCount = a3;
}

- (BOOL)didRefreshBundleMap
{
  return self->_didRefreshBundleMap;
}

- (void)setDidRefreshBundleMap:(BOOL)a3
{
  self->_didRefreshBundleMap = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end