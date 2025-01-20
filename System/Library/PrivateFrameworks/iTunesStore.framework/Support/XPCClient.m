@interface XPCClient
- (BOOL)_isAdHocCodeSigned;
- (BOOL)_isBetaApp;
- (BOOL)_isNewsstandApp;
- (BOOL)canReceiveMessages;
- (BOOL)hasEntitlements;
- (BOOL)isAdHocCodeSigned;
- (BOOL)isAppleSigned;
- (BOOL)isBetaApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewsstandApp;
- (NSData)auditTokenData;
- (NSString)clientIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)clientVersion;
- (NSString)userAgent;
- (SSXPCConnection)outputConnection;
- (XPCClient)init;
- (XPCClient)initWithApplicationIdentifier:(id)a3 isAppleSigned:(BOOL)a4;
- (XPCClient)initWithInputConnection:(id)a3;
- (id)_applicationBackgroundModes;
- (id)_initCommon;
- (id)beginBackgroundTaskWithReason:(unsigned int)a3 expirationBlock:(id)a4;
- (id)copyApplicationBackgroundModes;
- (id)copyInputConnection;
- (id)description;
- (id)valueForEntitlement:(id)a3;
- (int)processIdentifier;
- (int64_t)_clientType;
- (int64_t)clientType;
- (unint64_t)hash;
- (unsigned)_applicationState;
- (unsigned)applicationState;
- (void)_applicationStateChanged:(id)a3;
- (void)_handleOutputConnectionDisconnect;
- (void)_invalidateBackgroundTaskAssertion:(id)a3;
- (void)dealloc;
- (void)endBackgroundTaskWithIdentifier:(id)a3;
- (void)loadSpringBoardStateWithCompletionBlock:(id)a3;
- (void)sendCoalescedMessageWithIdentifier:(unint64_t)a3;
- (void)setOutputConnectionWithConnection:(id)a3;
@end

@implementation XPCClient

- (id)_initCommon
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___XPCClient;
  v2 = -[XPCClient init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.XPCClient", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_appleSigned = -1;
    v2->_applicationState = -1;
    *(_WORD *)&v2->_isNewsstandApp = -1;
    v2->_isAdHocCodeSigned = -1;
  }

  return v2;
}

- (XPCClient)init
{
  return -[XPCClient initWithInputConnection:](self, "initWithInputConnection:", 0LL);
}

- (XPCClient)initWithInputConnection:(id)a3
{
  v5 = (_xpc_connection_s *)a3;
  objc_super v6 = -[XPCClient _initCommon](self, "_initCommon");
  if (v6)
  {
    if (v5)
    {
      v7 = (__CFString *)SSXPCConnectionCopyExecutablePath(v5);
      if (v7)
      {
        CFURLRef v8 = CFURLCreateWithFileSystemPath(0LL, v7, kCFURLPOSIXPathStyle, 0);
        if (v8)
        {
          CFURLRef v9 = v8;
          v10 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
          if (v10)
          {
            v11 = v10;
            v12 = CFBundleCreate(0LL, v10);
            if (v12)
            {
              v13 = v12;
              CFStringRef Identifier = CFBundleGetIdentifier(v12);
              uint64_t v15 = objc_claimAutoreleasedReturnValue(Identifier);
              clientCFStringRef Identifier = v6->_clientIdentifier;
              v6->_clientCFStringRef Identifier = (NSString *)v15;

              CFTypeRef ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(v13, _kCFBundleShortVersionStringKey);
              v18 = (void *)objc_claimAutoreleasedReturnValue(ValueForInfoDictionaryKey);
              if (!v18)
              {
                CFTypeRef v19 = CFBundleGetValueForInfoDictionaryKey(v13, kCFBundleVersionKey);
                v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
              }

              objc_storeStrong((id *)&v6->_clientVersion, v18);
              CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue(InfoDictionary);
              if ([v21 count])
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
                uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 userAgentWithBundleRef:v13 isCachable:0]);
                userAgent = v6->_userAgent;
                v6->_userAgent = (NSString *)v23;
              }

              CFRelease(v13);
            }

            CFRelease(v11);
          }

          CFRelease(v9);
        }

        if (v6->_clientIdentifier)
        {
          int v25 = 0;
        }

        else
        {
          uint64_t v26 = objc_claimAutoreleasedReturnValue(-[__CFString lastPathComponent](v7, "lastPathComponent"));
          v27 = v6->_clientIdentifier;
          v6->_clientCFStringRef Identifier = (NSString *)v26;

          clientVersion = v6->_clientVersion;
          v6->_clientVersion = (NSString *)@"1.0";

          int v25 = 1;
        }

        if (!v6->_userAgent)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
          uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 userAgentWithClientName:v6->_clientIdentifier version:v6->_clientVersion]);
          v31 = v6->_userAgent;
          v6->_userAgent = (NSString *)v30;
        }
      }

      else
      {
        int v25 = 0;
      }

      xpc_connection_get_audit_token(v5, location);
      v32 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", location, 32LL);
      auditTokenData = v6->_auditTokenData;
      v6->_auditTokenData = v32;

      objc_storeStrong((id *)&v6->_inputConnection, a3);
      v6->_pid = xpc_connection_get_pid(v5);
      v34 = (void *)SSXPCConnectionCopyValueForEntitlement(v5, @"com.apple.itunesstored.private");
      uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
      {
        objc_storeStrong((id *)&v6->_entitlements, v34);
      }

      else if ((objc_opt_respondsToSelector(v34, "BOOLValue") & 1) != 0)
      {
        v36 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
        entitlements = v6->_entitlements;
        v6->_entitlements = v36;

        v6->_legacyEntitlements = 1;
      }
    }

    else
    {
      int v25 = 0;
    }

    if (-[NSString isEqualToString:](v6->_clientIdentifier, "isEqualToString:", @"com.apple.springboard"))
    {
      uint64_t v38 = 3LL;
LABEL_32:
      v6->_clientType = v38;
      goto LABEL_33;
    }

    if (-[NSString isEqualToString:](v6->_clientIdentifier, "isEqualToString:", @"com.apple.lowtide"))
    {
      v6->_clientType = 0LL;
    }

    else
    {
      if (v25)
      {
        uint64_t v38 = 2LL;
        goto LABEL_32;
      }

      v6->_clientType = -1LL;
      if (v6->_clientIdentifier)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        objc_initWeak(location, v6);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_100083EC0;
        v45[3] = &unk_10034CA18;
        objc_copyWeak(&v46, location);
        uint64_t v41 = objc_claimAutoreleasedReturnValue( [v40 addObserverForName:@"SpringBoardUtilityApplicationStateChangeNotification" object:0 queue:0 usingBlock:v45]);
        id stateChangeObserver = v6->_stateChangeObserver;
        v6->_id stateChangeObserver = (id)v41;

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v6->_clientIdentifier));
        [v43 beginGeneratingStateChangeNotificationsForIdentifiers:v44];

        objc_destroyWeak(&v46);
        objc_destroyWeak(location);
      }
    }
  }

- (XPCClient)initWithApplicationIdentifier:(id)a3 isAppleSigned:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___XPCClient;
  v7 = -[XPCClient init](&v12, "init");
  CFURLRef v8 = v7;
  if (v7)
  {
    v7->_appleSigned = a4;
    CFURLRef v9 = (NSString *)[v6 copy];
    clientCFStringRef Identifier = v8->_clientIdentifier;
    v8->_clientCFStringRef Identifier = v9;

    v8->_clientType = 1LL;
  }

  return v8;
}

- (void)dealloc
{
  if (self->_stateChangeObserver)
  {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self->_stateChangeObserver];
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->_backgroundTasks;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      CFURLRef v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        CFURLRef v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_backgroundTasks,  "objectForKey:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v8)));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 processAssertion]);
        [v10 setInvalidationHandler:0];

        CFURLRef v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v6);
  }

  if (self->_clientIdentifier)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", self->_clientIdentifier));
    [v11 endGeneratingStateChangeNotificationsForIdentifiers:v12];
  }

  -[SSXPCConnection setDisconnectBlock:](self->_outputConnection, "setDisconnectBlock:", 0LL);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___XPCClient;
  -[XPCClient dealloc](&v13, "dealloc");
}

- (unsigned)applicationState
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000841D0;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)beginBackgroundTaskWithReason:(unsigned int)a3 expirationBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ((id)-[XPCClient clientType](self, "clientType") == (id)1)
  {
    uint64_t v7 = -[BKSProcessAssertion initWithPID:flags:reason:name:]( objc_alloc(&OBJC_CLASS___BKSProcessAssertion),  "initWithPID:flags:reason:name:",  self->_pid,  1LL,  v4,  @"com.apple.itunesstored.xpcclient");
    if (-[BKSProcessAssertion valid](v7, "valid"))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000843CC;
      block[3] = &unk_10034CA40;
      v11 = v7;
      v18 = v11;
      id v21 = v6;
      CFTypeRef v19 = self;
      int v22 = v4;
      id v12 = v9;
      id v20 = v12;
      dispatch_sync(dispatchQueue, block);
      objc_initWeak(&location, v11);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1000845D0;
      v14[3] = &unk_10034C920;
      v14[4] = self;
      objc_copyWeak(&v15, &location);
      -[BKSProcessAssertion setInvalidationHandler:](v11, "setInvalidationHandler:", v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (BOOL)canReceiveMessages
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000846A4;
  v5[3] = &unk_10034CA68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)clientIdentifierHeader
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient clientIdentifier](self, "clientIdentifier"));
  uint64_t v3 = ISClientIdentifierForBundleIdentifier(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSString *)v4;
}

- (int64_t)clientType
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 2LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000847E0;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)copyApplicationBackgroundModes
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000848C4;
  v10 = sub_1000848D4;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000848DC;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)copyInputConnection
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000848C4;
  v10 = sub_1000848D4;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000849C8;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)endBackgroundTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[1] = 3221225472LL;
    block[2] = sub_100084A5C;
    block[3] = &unk_10034AD58;
    void block[4] = self;
    id v6 = v4;
    block[0] = _NSConcreteStackBlock;
    id v8 = v4;
    dispatch_sync(dispatchQueue, block);

    id v4 = v6;
  }
}

- (BOOL)hasEntitlements
{
  return self->_entitlements != 0LL;
}

- (BOOL)isAppleSigned
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100084CC8;
  v5[3] = &unk_10034CA68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isNewsstandApp
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100084EA4;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBetaApp
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100084F64;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAdHocCodeSigned
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100085024;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)loadSpringBoardStateWithCompletionBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000850D0;
  v7[3] = &unk_10034ACE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (SSXPCConnection)outputConnection
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  char v9 = sub_1000848C4;
  v10 = sub_1000848D4;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100085210;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSXPCConnection *)v3;
}

- (int)processIdentifier
{
  return self->_pid;
}

- (void)sendCoalescedMessageWithIdentifier:(unint64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100085284;
  v4[3] = &unk_10034CA90;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)setOutputConnectionWithConnection:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008543C;
  block[3] = &unk_10034AD58;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

- (NSString)userAgent
{
  else {
    id v3 = self->_userAgent;
  }
  return v3;
}

- (id)valueForEntitlement:(id)a3
{
  return -[NSDictionary objectForKey:](self->_entitlements, "objectForKey:", a3);
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___XPCClient;
  id v3 = -[XPCClient description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@",  v4,  self->_clientIdentifier));

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_clientIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if (v5 == objc_opt_class(v4))
  {
    clientCFStringRef Identifier = self->_clientIdentifier;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 clientIdentifier]);
    unsigned __int8 v6 = -[NSString isEqual:](clientIdentifier, "isEqual:", v8);
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_applicationStateChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100085740;
  v7[3] = &unk_10034AD58;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (id)_applicationBackgroundModes
{
  if (!self->_backgroundModes && (id)-[XPCClient _clientType](self, "_clientType") == (id)1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
    id v4 = [v3 copyBundleInfoValueForKey:@"UIBackgroundModes" PID:self->_pid];

    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
      id v6 = (NSArray *)[v4 copy];
    }
    else {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSArray);
    }
    backgroundModes = self->_backgroundModes;
    self->_backgroundModes = v6;
  }

  return self->_backgroundModes;
}

- (unsigned)_applicationState
{
  if ((id)-[XPCClient _clientType](self, "_clientType") != (id)1) {
    return 0;
  }
  unsigned int result = self->_applicationState;
  if (result == -1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
    self->_applicationState = [v4 applicationStateForIdentifier:self->_clientIdentifier];

    return self->_applicationState;
  }

  return result;
}

- (int64_t)_clientType
{
  int64_t result = self->_clientType;
  if (result == -1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
    unsigned int v5 = [v4 mostElevatedApplicationStateForPID:self->_pid];

    if (v5)
    {
      if (v5 == 16) {
        int64_t result = 2LL;
      }
      else {
        int64_t result = 1LL;
      }
      self->_clientType = result;
    }

    else
    {
      if (self->_clientIdentifier) {
        id v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:"));
      }
      else {
        id v6 = 0LL;
      }
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationType]);

      int64_t v8 = 1LL;
      if (!v7) {
        int64_t v8 = 2LL;
      }
      self->_clientType = v8;

      return self->_clientType;
    }
  }

  return result;
}

- (void)_handleOutputConnectionDisconnect
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085C54;
  block[3] = &unk_10034AC30;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateBackgroundTaskAssertion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100085DA0;
  v7[3] = &unk_10034AD58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)_isNewsstandApp
{
  int isNewsstandApp = self->_isNewsstandApp;
  if (isNewsstandApp == 255)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
    id v5 = [v4 copyBundleInfoValueForKey:@"UINewsstandApp" PID:self->_pid];

    if ((objc_opt_respondsToSelector(v5, "BOOLValue") & 1) != 0) {
      char v6 = [v5 BOOLValue];
    }
    else {
      char v6 = 0;
    }
    self->_int isNewsstandApp = v6;

    int isNewsstandApp = self->_isNewsstandApp;
  }

  return isNewsstandApp != 0;
}

- (BOOL)_isBetaApp
{
  if (self->_isBetaApp == 255)
  {
    self->_isBetaApp = 0;
    int64_t v3 = -[XPCClient _clientType](self, "_clientType");
    switch(v3)
    {
      case 3LL:
LABEL_5:
        self->_isBetaApp = 0;
        return self->_isBetaApp != 0;
      case 1LL:
        if (self->_clientIdentifier)
        {
          id v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:"));
          id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appState]);
          unsigned int v6 = [v5 isValid];

          if (v6) {
            self->_isBetaApp = [v4 isBetaApp];
          }
        }

        break;
      case 0LL:
        goto LABEL_5;
    }
  }

  return self->_isBetaApp != 0;
}

- (BOOL)_isAdHocCodeSigned
{
  if (self->_isAdHocCodeSigned == 255)
  {
    self->_isAdHocCodeSigned = 0;
    int64_t v3 = -[XPCClient _clientType](self, "_clientType");
    switch(v3)
    {
      case 3LL:
LABEL_5:
        self->_isAdHocCodeSigned = 0;
        return self->_isAdHocCodeSigned != 0;
      case 1LL:
        if (self->_clientIdentifier)
        {
          id v4 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:"));
          id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 appState]);
          unsigned int v6 = [v5 isValid];

          if (v6) {
            self->_isAdHocCodeSigned = [v4 isAdHocCodeSigned];
          }
        }

        break;
      case 0LL:
        goto LABEL_5;
    }
  }

  return self->_isAdHocCodeSigned != 0;
}

- (NSData)auditTokenData
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end