@interface IXSAppInstallObserverManager
+ (id)sharedInstance;
- (IXSAppInstallObserverManager)init;
- (NSHashTable)clientConnections;
- (NSMutableDictionary)clientToObserverEndpointMap;
- (NSMutableDictionary)clientToObserverServiceNameMap;
- (NSMutableDictionary)listenerRespondsToMap;
- (NSMutableDictionary)serviceRespondsToMap;
- (NSMutableDictionary)serviceToConnectionMap;
- (NSURL)saveURL;
- (OS_dispatch_queue)internalQueue;
- (id)_onQueue_connectionForObserverEndpoint:(id)a3;
- (id)_onQueue_connectionForServiceName:(id)a3;
- (void)_callHandlerForClientConnections:(id)a3;
- (void)_messageInterestedServicesForClientIDs:(id)a3 forMethod:(unint64_t)a4 callMethodOnProxy:(id)a5;
- (void)_onQueue_callRemoteObjectProxyForServiceEndpoint:(id)a3 errorHandler:(id)a4 callHandler:(id)a5;
- (void)_onQueue_callRemoteObjectProxyForServiceName:(id)a3 errorHandler:(id)a4 callHandler:(id)a5;
- (void)_saveMapping;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinator:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4;
- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forRecordPromise:(id)a4;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forRecordPromise:(id)a4;
- (void)coordinatorShouldBeginPostProcessing:(id)a3 forRecordPromise:(id)a4;
- (void)coordinatorShouldBeginRestoringUserData:(id)a3;
- (void)coordinatorShouldPause:(id)a3;
- (void)coordinatorShouldPrioritize:(id)a3;
- (void)coordinatorShouldResume:(id)a3;
- (void)promise:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)promiseDidCompleteSuccessfully:(id)a3;
- (void)registerClientConnection:(id)a3;
- (void)registerListenerEndpoint:(id)a3 forClientIDs:(id)a4 respondingToSelectors:(unint64_t)a5;
- (void)registerMachServiceName:(id)a3 forClientIDs:(id)a4 respondingToSelectors:(unint64_t)a5;
- (void)shouldPrioritizeAppWithIdentity:(id)a3 forClientIDs:(id)a4;
- (void)unregisterClientConnection:(id)a3;
@end

@implementation IXSAppInstallObserverManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000247A0;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8EA0 != -1) {
    dispatch_once(&qword_1000E8EA0, block);
  }
  return (id)qword_1000E8E98;
}

- (NSURL)saveURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataDirectoryAbortingOnError]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"ObserverRegistry.plist" isDirectory:0]);
  return (NSURL *)v4;
}

- (IXSAppInstallObserverManager)init
{
  v91.receiver = self;
  v91.super_class = (Class)&OBJC_CLASS___IXSAppInstallObserverManager;
  v2 = -[IXSAppInstallObserverManager init](&v91, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.installcoordinationd.AppInstallObserverManager", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager saveURL](v2, "saveURL"));
    id v90 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v7,  3LL,  &v90));
    id v9 = v90;

    v10 = &APP_SANDBOX_READ_WRITE_ptr;
    if (!v8)
    {
      v19 = 0LL;
      v29 = 0LL;
      goto LABEL_29;
    }

    id v89 = v9;
    v11 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v8,  &v89);
    id v12 = v89;

    if (!v11)
    {
      v42 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10007C5F0(v2);
      }
      v17 = 0LL;
      v19 = 0LL;
      goto LABEL_24;
    }

    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSSet);
    v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v13,  v14,  v15,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v11,  "decodeObjectOfClasses:forKey:",  v17,  @"ClientObserverMap"));
    if (v18)
    {
      v19 = (void *)v18;
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      {
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
        uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSSet);
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((sub_100072A98(v19, v21, v22, v23, 0LL) & 1) != 0)
        {
          uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
          v26 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v24,  v25,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

          uint64_t v28 = objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v11,  "decodeObjectOfClasses:forKey:",  v27,  @"RespondsToMap"));
          if (v28)
          {
            v29 = (os_log_s *)v28;
            uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            v10 = &APP_SANDBOX_READ_WRITE_ptr;
            if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
            {
              uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString);
              uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSNumber);
              if ((sub_100072CA4(v29, v31, v32) & 1) != 0) {
                goto LABEL_25;
              }
              v33 = sub_1000047B4((uint64_t)off_1000E8CA0);
              v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                sub_10007C7C4(v34, v35, v36, v37, v38, v39, v40, v41);
              }
            }

            else
            {
              v81 = sub_1000047B4((uint64_t)off_1000E8CA0);
              v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                sub_10007C834(v34, v82, v83, v84, v85, v86, v87, v88);
              }
            }
          }

          else
          {
            v80 = sub_1000047B4((uint64_t)off_1000E8CA0);
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
            v10 = &APP_SANDBOX_READ_WRITE_ptr;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_10007C724(v2, v11);
            }
          }

          v17 = v27;
LABEL_24:

          v29 = 0LL;
          v27 = v17;
LABEL_25:
          -[NSKeyedUnarchiver finishDecoding](v11, "finishDecoding");

          if (v19 && v29)
          {
            v61 = (NSMutableDictionary *)[v19 mutableCopy];
            clientToObserverServiceNameMap = v2->_clientToObserverServiceNameMap;
            v2->_clientToObserverServiceNameMap = v61;

            v63 = (NSMutableDictionary *)-[os_log_s mutableCopy](v29, "mutableCopy");
            serviceRespondsToMap = v2->_serviceRespondsToMap;
            v2->_serviceRespondsToMap = v63;

            -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( v2->_clientToObserverServiceNameMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1000CD488);
            -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( v2->_serviceRespondsToMap,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1000CD4C8);
LABEL_30:
            uint64_t v71 = objc_opt_new(v10[92]);
            serviceToConnectionMap = v2->_serviceToConnectionMap;
            v2->_serviceToConnectionMap = (NSMutableDictionary *)v71;

            uint64_t v73 = objc_opt_new(v10[92]);
            clientToObserverEndpointMap = v2->_clientToObserverEndpointMap;
            v2->_clientToObserverEndpointMap = (NSMutableDictionary *)v73;

            uint64_t v75 = objc_opt_new(v10[92]);
            listenerRespondsToMap = v2->_listenerRespondsToMap;
            v2->_listenerRespondsToMap = (NSMutableDictionary *)v75;

            uint64_t v77 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
            clientConnections = v2->_clientConnections;
            v2->_clientConnections = (NSHashTable *)v77;

            return v2;
          }

          id v9 = v12;
LABEL_29:
          uint64_t v65 = objc_opt_new(v10[92]);
          v66 = v2->_clientToObserverServiceNameMap;
          v2->_clientToObserverServiceNameMap = (NSMutableDictionary *)v65;

          uint64_t v67 = objc_opt_new(v10[92]);
          v68 = v2->_serviceRespondsToMap;
          v2->_serviceRespondsToMap = (NSMutableDictionary *)v67;

          v69 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager saveURL](v2, "saveURL"));
          [v69 removeItemAtURL:v70 error:0];

          id v12 = v9;
          goto LABEL_30;
        }

        v53 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_10007C8A4(v45, v54, v55, v56, v57, v58, v59, v60);
        }
      }

      else
      {
        v44 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_10007C914(v45, v46, v47, v48, v49, v50, v51, v52);
        }
      }

      v29 = (os_log_s *)v19;
    }

    else
    {
      v43 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10007C684(v2, v11);
      }
    }

    v19 = 0LL;
    v10 = &APP_SANDBOX_READ_WRITE_ptr;
    goto LABEL_24;
  }

  return v2;
}

- (void)_saveMapping
{
  dispatch_queue_attr_t v3 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager clientToObserverServiceNameMap](self, "clientToObserverServiceNameMap"));
  -[NSKeyedArchiver encodeObject:forKey:](v3, "encodeObject:forKey:", v4, @"ClientObserverMap");

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager serviceRespondsToMap](self, "serviceRespondsToMap"));
  -[NSKeyedArchiver encodeObject:forKey:](v3, "encodeObject:forKey:", v5, @"RespondsToMap");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v3, "encodedData"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager saveURL](self, "saveURL"));
    id v14 = 0LL;
    unsigned __int8 v8 = [v6 writeToURL:v7 options:268435457 error:&v14];
    id v9 = v14;

    if ((v8 & 1) == 0)
    {
      v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager saveURL](self, "saveURL"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
        *(_DWORD *)buf = 136315650;
        v16 = "-[IXSAppInstallObserverManager _saveMapping]";
        __int16 v17 = 2112;
        uint64_t v18 = v13;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to write observer map to %@ : %@",  buf,  0x20u);
      }
    }
  }

- (void)registerMachServiceName:(id)a3 forClientIDs:(id)a4 respondingToSelectors:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000255AC;
  block[3] = &unk_1000CD1C8;
  id v14 = v9;
  uint64_t v15 = self;
  id v16 = v8;
  unint64_t v17 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, block);
}

- (void)registerListenerEndpoint:(id)a3 forClientIDs:(id)a4 respondingToSelectors:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000258A0;
  block[3] = &unk_1000CD1C8;
  id v14 = v9;
  uint64_t v15 = self;
  id v16 = v8;
  unint64_t v17 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, block);
}

- (void)registerClientConnection:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025B20;
  block[3] = &unk_1000CCCB8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)unregisterClientConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager internalQueue](self, "internalQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100025C98;
    v6[3] = &unk_1000CCCB8;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

- (id)_onQueue_connectionForServiceName:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager serviceToConnectionMap](self, "serviceToConnectionMap"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (!v6)
  {
    id v7 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  v4,  4096LL);
    if (v7)
    {
      id v8 = v7;
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IXAppInstallObserverProtocolInterface interface]( &OBJC_CLASS___IXAppInstallObserverProtocolInterface,  "interface"));
      -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

      objc_initWeak((id *)location, v8);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100026030;
      v20[3] = &unk_1000CD4F0;
      id v10 = v4;
      id v21 = v10;
      objc_copyWeak(&v22, (id *)location);
      -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v20);
      objc_initWeak(&from, self);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100026108;
      v16[3] = &unk_1000CD4F0;
      id v11 = v10;
      id v17 = v11;
      objc_copyWeak(&v18, &from);
      -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v16);
      -[NSXPCConnection resume](v8, "resume");
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager serviceToConnectionMap](self, "serviceToConnectionMap"));
      [v12 setObject:v8 forKeyedSubscript:v11];

      uint64_t v13 = v8;
      objc_destroyWeak(&v18);

      objc_destroyWeak(&from);
      objc_destroyWeak(&v22);

      objc_destroyWeak((id *)location);
      id v6 = v13;
    }

    else
    {
      id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = "-[IXSAppInstallObserverManager _onQueue_connectionForServiceName:]";
        __int16 v24 = 2112;
        id v25 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create NSXPCConnection for service %@",  location,  0x16u);
      }

      id v6 = 0LL;
    }
  }

  return v6;
}

- (void)_onQueue_callRemoteObjectProxyForServiceName:(id)a3 errorHandler:(id)a4 callHandler:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppInstallObserverManager _onQueue_connectionForServiceName:]( self,  "_onQueue_connectionForServiceName:",  a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObjectProxyWithErrorHandler:v9]);

  if (v11)
  {
    v8[2](v8, v11);
  }

  else
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[IXSAppInstallObserverManager _onQueue_callRemoteObjectProxyForServiceName:errorHandler:callHandler:]";
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get proxy for connection %@",  (uint8_t *)&v14,  0x16u);
    }
  }
}

- (id)_onQueue_connectionForObserverEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  v3);
  if (v4)
  {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IXAppInstallObserverProtocolInterface interface]( &OBJC_CLASS___IXAppInstallObserverProtocolInterface,  "interface"));
    -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", v5);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100026570;
    v16[3] = &unk_1000CCE58;
    id v6 = (os_log_s *)v3;
    id v17 = v6;
    -[NSXPCConnection setInterruptionHandler:](v4, "setInterruptionHandler:", v16);
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = sub_100026634;
    int v14 = &unk_1000CCE58;
    uint64_t v15 = v6;
    -[NSXPCConnection setInvalidationHandler:](v4, "setInvalidationHandler:", &v11);
    -[NSXPCConnection resume](v4, "resume", v11, v12, v13, v14);
    id v7 = v4;

    id v8 = v17;
  }

  else
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "-[IXSAppInstallObserverManager _onQueue_connectionForObserverEndpoint:]";
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create NSXPCConnection for endpoint %@",  buf,  0x16u);
    }
  }

  return v4;
}

- (void)_onQueue_callRemoteObjectProxyForServiceEndpoint:(id)a3 errorHandler:(id)a4 callHandler:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppInstallObserverManager _onQueue_connectionForObserverEndpoint:]( self,  "_onQueue_connectionForObserverEndpoint:",  a3));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObjectProxyWithErrorHandler:v9]);

  if (v11)
  {
    v8[2](v8, v11);
  }

  else
  {
    uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[IXSAppInstallObserverManager _onQueue_callRemoteObjectProxyForServiceEndpoint:errorHandler:callHandler:]";
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get proxy for connection %@",  (uint8_t *)&v14,  0x16u);
    }
  }

  [v10 invalidate];
}

- (void)_messageInterestedServicesForClientIDs:(id)a3 forMethod:(unint64_t)a4 callMethodOnProxy:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002688C;
  block[3] = &unk_1000CD540;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, block);
}

- (void)_callHandlerForClientConnections:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppInstallObserverManager internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000270B0;
  block[3] = &unk_1000CD568;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)coordinatorShouldPrioritize:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 creator]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 appAssetPromiseDRI]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v5, v6, 0LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000272FC;
  v12[3] = &unk_1000CD590;
  id v13 = v4;
  id v8 = v4;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v7,  1LL,  v12);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002734C;
  v10[3] = &unk_1000CD5B8;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
  id v9 = v11;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v10);
}

- (void)shouldPrioritizeAppWithIdentity:(id)a3 forClientIDs:(id)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002743C;
  v11[3] = &unk_1000CD590;
  id v6 = a3;
  id v12 = v6;
  id v7 = a4;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v7,  128LL,  v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002748C;
  v9[3] = &unk_1000CD590;
  id v10 = v6;
  id v8 = v6;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v7,  0x2000LL,  v9);
}

- (void)coordinatorShouldResume:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 creator]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 appAssetPromiseDRI]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v5, v6, 0LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000275EC;
  v12[3] = &unk_1000CD590;
  id v13 = v4;
  id v8 = v4;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v7,  2LL,  v12);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002763C;
  v10[3] = &unk_1000CD5B8;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
  id v9 = v11;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v10);
}

- (void)coordinatorShouldPause:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 creator]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 appAssetPromiseDRI]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v5, v6, 0LL));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002779C;
  v12[3] = &unk_1000CD590;
  id v13 = v4;
  id v8 = v4;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v7,  4LL,  v12);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000277EC;
  v10[3] = &unk_1000CD5B8;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
  id v9 = v11;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v10);
}

- (void)coordinator:(id)a3 configuredPromiseDidBeginFulfillment:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 creator]));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 appAssetPromiseDRI]));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v7, v8, 0LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100027958;
  v15[3] = &unk_1000CD5E0;
  id v16 = v6;
  unint64_t v17 = a4;
  id v10 = v6;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v9,  8LL,  v15);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000279B8;
  v12[3] = &unk_1000CD608;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
  unint64_t v14 = a4;
  id v11 = v13;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v12);
}

- (void)coordinatorShouldBeginRestoringUserData:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 creator]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_1000D6CF0, v5, 0LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100027AF8;
  v11[3] = &unk_1000CD590;
  id v12 = v4;
  id v7 = v4;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v6,  256LL,  v11);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100027B48;
  v9[3] = &unk_1000CD5B8;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  id v8 = v10;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v9);
}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 creator]));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 appAssetPromiseDRI]));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v8, v9, 0LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100027CEC;
  v18[3] = &unk_1000CD630;
  id v19 = v6;
  id v11 = v7;
  id v20 = v11;
  id v12 = v6;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v10,  2064LL,  v18);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100027D4C;
  v15[3] = &unk_1000CD658;
  id v16 = (id)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);
  id v17 = v11;
  id v13 = v11;
  id v14 = v16;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v15);
}

- (void)coordinatorShouldBeginPostProcessing:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 creator]));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v8, &off_1000D6D08, 0LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100027ED4;
  v17[3] = &unk_1000CD630;
  id v18 = v6;
  id v10 = v7;
  id v19 = v10;
  id v11 = v6;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v9,  0x4000LL,  v17);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100027F34;
  v14[3] = &unk_1000CD658;
  id v15 = (id)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
  id v16 = v10;
  id v12 = v10;
  id v13 = v15;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v14);
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forRecordPromise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 creator]));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 appAssetPromiseDRI]));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v8, v9, 0LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000280D8;
  v18[3] = &unk_1000CD630;
  id v19 = v6;
  id v11 = v7;
  id v20 = v11;
  id v12 = v6;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v10,  4128LL,  v18);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100028138;
  v15[3] = &unk_1000CD658;
  id v16 = (id)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);
  id v17 = v11;
  id v13 = v11;
  id v14 = v16;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v15);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 creator]));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 appAssetPromiseDRI]));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v10, v11, 0LL));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000282E4;
  v21[3] = &unk_1000CD680;
  id v22 = v8;
  id v13 = v9;
  id v23 = v13;
  unint64_t v24 = a5;
  id v14 = v8;
  -[IXSAppInstallObserverManager _messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:]( self,  "_messageInterestedServicesForClientIDs:forMethod:callMethodOnProxy:",  v12,  64LL,  v21);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100028344;
  v17[3] = &unk_1000CD6A8;
  id v18 = (id)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
  id v19 = v13;
  unint64_t v20 = a5;
  id v15 = v13;
  id v16 = v18;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v17);
}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000283F4;
  v11[3] = &unk_1000CD6D0;
  id v12 = (id)objc_claimAutoreleasedReturnValue([a3 uniqueIdentifier]);
  double v13 = a4;
  unint64_t v14 = a5;
  double v15 = a6;
  id v10 = v12;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v11);
}

- (void)promiseDidCompleteSuccessfully:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002848C;
  v5[3] = &unk_1000CD5B8;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 uniqueIdentifier]);
  id v4 = v6;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v5);
}

- (void)promise:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002854C;
  v11[3] = &unk_1000CD6A8;
  id v12 = (id)objc_claimAutoreleasedReturnValue([a3 uniqueIdentifier]);
  id v13 = v8;
  unint64_t v14 = a5;
  id v9 = v8;
  id v10 = v12;
  -[IXSAppInstallObserverManager _callHandlerForClientConnections:](self, "_callHandlerForClientConnections:", v11);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)clientToObserverServiceNameMap
{
  return self->_clientToObserverServiceNameMap;
}

- (NSMutableDictionary)serviceRespondsToMap
{
  return self->_serviceRespondsToMap;
}

- (NSMutableDictionary)serviceToConnectionMap
{
  return self->_serviceToConnectionMap;
}

- (NSMutableDictionary)clientToObserverEndpointMap
{
  return self->_clientToObserverEndpointMap;
}

- (NSMutableDictionary)listenerRespondsToMap
{
  return self->_listenerRespondsToMap;
}

- (NSHashTable)clientConnections
{
  return self->_clientConnections;
}

- (void).cxx_destruct
{
}

@end