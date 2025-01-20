@interface DMDTaskServerDelegate
+ (id)_specialCasedRequestNamesToOperationNames;
- (CATOperationQueue)concurrentOperationQueue;
- (Class)operationClassForRequest:(id)a3 error:(id *)a4;
- (DMDConfigurationEngine)configurationEngine;
- (DMDDeviceStateObserver)deviceStateObserver;
- (DMDTaskServerDelegate)initWithPolicyPersistence:(id)a3 activationManager:(id)a4;
- (DMFOSStateHandler)stateHandler;
- (NSDictionary)serialOperationQueuesByGroup;
- (NSString)description;
- (id)_nameForOperationGroup:(unint64_t)a3;
- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7;
- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6;
- (void)_currentLocaleDidChange:(id)a3;
- (void)configurationEngineDidResume:(id)a3;
- (void)configurationEngineWillSuspend:(id)a3;
- (void)prepareToRunOperation:(id)a3 withContext:(id)a4 withDatabase:(id)a5;
- (void)run;
- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5;
- (void)server:(id)a3 clientSession:(id)a4 didReceiveNotificationWithName:(id)a5 userInfo:(id)a6;
- (void)server:(id)a3 clientSession:(id)a4 enqueueOperation:(id)a5;
- (void)server:(id)a3 clientSessionDidConnect:(id)a4;
- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4;
- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4;
@end

@implementation DMDTaskServerDelegate

- (DMDTaskServerDelegate)initWithPolicyPersistence:(id)a3 activationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___DMDTaskServerDelegate;
  v8 = -[DMDTaskServerDelegate init](&v43, "init");
  if (v8)
  {
    id v39 = v7;
    v9 = objc_opt_new(&OBJC_CLASS___CATOperationQueue);
    concurrentOperationQueue = v8->_concurrentOperationQueue;
    v8->_concurrentOperationQueue = v9;

    v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%p.concurrent",  objc_opt_class(v8),  v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[CATOperationQueue setName:](v8->_concurrentOperationQueue, "setName:", v12);

    char v13 = 1;
    -[CATOperationQueue setSuspended:](v8->_concurrentOperationQueue, "setSuspended:", 1LL);
    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v15 = 0LL;
    do
    {
      char v16 = v13;
      v17 = objc_opt_new(&OBJC_CLASS___CATSerialOperationQueue);
      v18 = v14;
      uint64_t v19 = objc_opt_class(v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate _nameForOperationGroup:](v8, "_nameForOperationGroup:", v15));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%p.serial.%@",  v19,  v8,  v20));
      -[CATSerialOperationQueue setName:](v17, "setName:", v21);

      v14 = v18;
      -[CATSerialOperationQueue setSuspended:](v17, "setSuspended:", 1LL);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v22);

      char v13 = 0;
      uint64_t v15 = 1LL;
    }

    while ((v16 & 1) != 0);
    v23 = (NSDictionary *)-[NSMutableDictionary copy](v18, "copy");
    serialOperationQueuesByGroup = v8->_serialOperationQueuesByGroup;
    v8->_serialOperationQueuesByGroup = v23;

    v25 = objc_opt_new(&OBJC_CLASS___DMDDeviceStateObserver);
    deviceStateObserver = v8->_deviceStateObserver;
    v8->_deviceStateObserver = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](&OBJC_CLASS___DMDDeviceController, "shared"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 isAppleInternal]);
    unsigned __int8 v29 = [v28 BOOLValue];

    id v7 = v39;
    if ((v29 & 1) != 0)
    {
      id v30 = +[DMDConfigurationDatabase newUserDatabase](&OBJC_CLASS___DMDConfigurationDatabase, "newUserDatabase");
      v31 = -[DMDConfigurationEngine initWithDatabase:policyPersistence:activationManager:]( objc_alloc(&OBJC_CLASS___DMDConfigurationEngine),  "initWithDatabase:policyPersistence:activationManager:",  v30,  v6,  v39);
      configurationEngine = v8->_configurationEngine;
      v8->_configurationEngine = v31;

      -[DMDConfigurationEngine setDelegate:](v8->_configurationEngine, "setDelegate:", v8);
      -[DMDConfigurationEngine setDeviceStateProvider:]( v8->_configurationEngine,  "setDeviceStateProvider:",  v8->_deviceStateObserver);
      -[DMDConfigurationEngine setTaskOperationProvider:](v8->_configurationEngine, "setTaskOperationProvider:", v8);
    }

    -[DMDDeviceStateObserver startObservingChanges](v8->_deviceStateObserver, "startObservingChanges");
    objc_initWeak(&location, v8);
    v33 = objc_alloc(&OBJC_CLASS___DMFOSStateHandler);
    uint64_t v34 = CATGetCatalystQueue();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100059D0C;
    v40[3] = &unk_10009D990;
    objc_copyWeak(&v41, &location);
    v36 = -[DMFOSStateHandler initWithQueue:name:stateHandlerBlock:]( v33,  "initWithQueue:name:stateHandlerBlock:",  v35,  @"DMD",  v40);
    stateHandler = v8->_stateHandler;
    v8->_stateHandler = v36;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)run
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting…", v7, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_currentLocaleDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate concurrentOperationQueue](self, "concurrentOperationQueue"));
  [v4 setSuspended:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate serialOperationQueuesByGroup](self, "serialOperationQueuesByGroup"));
  [v5 enumerateKeysAndObjectsUsingBlock:&stru_10009F3E0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate configurationEngine](self, "configurationEngine"));
  [v6 resume];
}

- (NSString)description
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate serialOperationQueuesByGroup](self, "serialOperationQueuesByGroup"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100059F58;
  v13[3] = &unk_10009F408;
  v13[4] = self;
  v14 = v3;
  v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v13];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate deviceStateObserver](self, "deviceStateObserver"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate concurrentOperationQueue](self, "concurrentOperationQueue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 operations]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate configurationEngine](self, "configurationEngine"));
  uint64_t v8 = DMFObjectDescription( self,  @"\nDevice state:\n%@\nDMD serial operations:%@\nDMD concurrent operations:\n%@\nConfiguration engine:\n%@");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (NSString *)v9;
}

- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a6;
  v12 = -[DMDTaskServerDelegate operationClassForRequest:error:](self, "operationClassForRequest:error:", v10, a7);
  if (v12)
  {
    char v13 = v12;
    v14 = objc_opt_new(&OBJC_CLASS___DMDTaskOperationContext);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___CATXPCTransport);
    if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
    {
      v33 = v14;
      id v34 = v11;
      id v16 = v11;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class requiredEntitlements](v13, "requiredEntitlements"));
      id v18 = [v17 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v36;
        while (2)
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
            if (([v16 BOOLValueForEntitlement:v22] & 1) == 0)
            {
              v25 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___DMFConnection));
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue( [v26 localizedStringForKey:@"Process is missing entitlement “%@”" value:&stru_10009F768 table:@"DMFServerErrors"]);

              uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v27, v22));
              unsigned __int8 v29 = (void *)v28;
              if (a7)
              {
                NSErrorUserInfoKey v39 = NSLocalizedFailureReasonErrorKey;
                uint64_t v40 = v28;
                id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
                uint64_t v31 = DMFErrorWithCodeAndUserInfo(5LL, v30);
                *a7 = (id)objc_claimAutoreleasedReturnValue(v31);
              }

              id v24 = 0LL;
              v14 = v33;
              id v11 = v34;
              goto LABEL_21;
            }
          }

          id v19 = [v17 countByEnumeratingWithState:&v35 objects:v41 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue([v16 valueForEntitlement:DMFEntitlementsApplicationIdentifierKey]);
      v14 = v33;
      -[DMDTaskOperationContext setClientBundleIdentifier:](v33, "setClientBundleIdentifier:", v23);

      -[DMDTaskOperationContext setUid:](v33, "setUid:", [v16 effectiveUserIdentifier]);
      id v11 = v34;
    }

    if (-[objc_class validateRequest:error:](v13, "validateRequest:error:", v10, a7))
    {
      id v24 = [[v13 alloc] initWithRequest:v10];
      -[DMDTaskServerDelegate prepareToRunOperation:withContext:withDatabase:]( self,  "prepareToRunOperation:withContext:withDatabase:",  v24,  v14,  0LL);
    }

    else
    {
      id v24 = 0LL;
    }

- (Class)operationClassForRequest:(id)a3 error:(id *)a4
{
  id v7 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005A50C;
  block[3] = &unk_10009E048;
  block[4] = self;
  block[5] = a2;
  if (qword_1000CCE68 != -1) {
    dispatch_once(&qword_1000CCE68, block);
  }
  uint64_t v8 = (objc_class *)objc_opt_class(v7);
  v9 = NSStringFromClass(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)qword_1000CCE60,  "firstMatchInString:options:range:",  v10,  0,  0,  objc_msgSend(v10, "length")));
  v12 = v11;
  if (!v11)
  {
    Class v23 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  id v13 = [v11 rangeAtIndex:1];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v13, v14));
  id v16 = [(id)objc_opt_class(self) _specialCasedRequestNamesToOperationNames];
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v15]);
  id v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = (void *)v18;
  }
  else {
    uint64_t v20 = v15;
  }
  id v21 = v20;

  uint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DMD%@Operation",  v21));
  Class v23 = NSClassFromString(v22);
  if (!-[objc_class isSubclassOfClass:]( v23,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___DMDTaskOperation))) {
    Class v23 = 0LL;
  }

  if (a4)
  {
LABEL_12:
    if (!v23)
    {
      uint64_t v24 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
      *a4 = (id)objc_claimAutoreleasedReturnValue(v24);
    }
  }

- (void)prepareToRunOperation:(id)a3 withContext:(id)a4 withDatabase:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___DMDTaskOperation);
  if ((objc_opt_isKindOfClass(v14, v10) & 1) != 0)
  {
    id v11 = v14;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate configurationEngine](self, "configurationEngine"));
    [v11 setConfigurationEngine:v12];

    [v11 setContext:v8];
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___DMDEngineDatabaseOperation);
  if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
    [v14 setDatabase:v9];
  }
}

- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138543618;
    id v29 = v12;
    __int16 v30 = 2114;
    id v31 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received request: %{public}@, from client: %{public}@",  (uint8_t *)&v28,  0x16u);
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___DMFTaskRequest);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
    && ([(id)objc_opt_class(v12) isPermittedOnCurrentPlatform] & 1) != 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 clientUserInfo]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 transport]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___CATXPCTransport);
    char isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 transport]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:DMFConnectionSenderPIDKey]);
      unsigned int v20 = [v19 intValue];

      if (v20 && v20 != [v18 processIdentifier])
      {
        if (a6)
        {
          uint64_t v27 = DMFErrorWithCodeAndUserInfo(5LL, 0LL);
          uint64_t v24 = 0LL;
          *a6 = (id)objc_claimAutoreleasedReturnValue(v27);
        }

        else
        {
          uint64_t v24 = 0LL;
        }

        goto LABEL_10;
      }
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:DMFConnectionTargetUIDKey]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:DMFConnectionAppleIDKey]);
    id v22 = [v18 intValue];
    Class v23 = (void *)objc_claimAutoreleasedReturnValue([v11 transport]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[DMDTaskServerDelegate operationForRequest:targetUID:appleID:transport:error:]( self,  "operationForRequest:targetUID:appleID:transport:error:",  v12,  v22,  v21,  v23,  a6));

LABEL_10:
    goto LABEL_14;
  }

  if (a6)
  {
    uint64_t v25 = DMFErrorWithCodeAndUserInfo(4LL, 0LL);
    uint64_t v24 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v25);
  }

  else
  {
    uint64_t v24 = 0LL;
  }

- (void)server:(id)a3 clientSessionDidConnect:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Connected %{public}@",  (uint8_t *)&v5,  0xCu);
  }

- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Disconnected %{public}@",  (uint8_t *)&v5,  0xCu);
  }

- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalidated %{public}@",  (uint8_t *)&v5,  0xCu);
  }

- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5
{
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a5 verboseDescription]);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Interrupted %{public}@: %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  [v6 invalidate];
}

- (void)server:(id)a3 clientSession:(id)a4 didReceiveNotificationWithName:(id)a5 userInfo:(id)a6
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    id v10 = a4;
    __int16 v11 = 2114;
    id v12 = a5;
    __int16 v13 = 2114;
    id v14 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Notification %{public}@: %{public}@ %{public}@",  (uint8_t *)&v9,  0x20u);
  }

- (void)server:(id)a3 clientSession:(id)a4 enqueueOperation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Add operation: %{public}@",  buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate serialOperationQueuesByGroup](self, "serialOperationQueuesByGroup"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:&off_1000A6078]);

  if ([v11 conformsToProtocol:&OBJC_PROTOCOL___DMDTaskOperationProtocol])
  {
    id v14 = v11;
    if ([v14 runConcurrently])
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate concurrentOperationQueue](self, "concurrentOperationQueue"));
    }

    else
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskServerDelegate serialOperationQueuesByGroup](self, "serialOperationQueuesByGroup"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v14 queueGroup]));
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

      __int16 v13 = v16;
    }

    __int16 v13 = (void *)v15;
  }

  if (!v13)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v18 handleFailureInMethod:a2, self, @"DMDTaskServerDelegate.m", 295, @"Queue must not be nil for operation: %@", v11 object file lineNumber description];
  }

  [v13 addOperation:v11];
}

- (void)configurationEngineDidResume:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Declaration engine did resume",  v3,  2u);
  }

- (void)configurationEngineWillSuspend:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Declaration engine did suspend",  v3,  2u);
  }

+ (id)_specialCasedRequestNamesToOperationNames
{
  if (qword_1000CCE78 != -1) {
    dispatch_once(&qword_1000CCE78, &stru_10009F428);
  }
  return (id)qword_1000CCE70;
}

- (void)_currentLocaleDidChange:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Notified of locale change. Exiting when clean.",  v3,  2u);
  }

  xpc_transaction_exit_clean();
}

- (id)_nameForOperationGroup:(unint64_t)a3
{
  if (a3 == 1) {
    return @"declaration";
  }
  else {
    return @"unspecified";
  }
}

- (CATOperationQueue)concurrentOperationQueue
{
  return self->_concurrentOperationQueue;
}

- (NSDictionary)serialOperationQueuesByGroup
{
  return self->_serialOperationQueuesByGroup;
}

- (DMDDeviceStateObserver)deviceStateObserver
{
  return self->_deviceStateObserver;
}

- (DMDConfigurationEngine)configurationEngine
{
  return self->_configurationEngine;
}

- (DMFOSStateHandler)stateHandler
{
  return self->_stateHandler;
}

- (void).cxx_destruct
{
}

@end