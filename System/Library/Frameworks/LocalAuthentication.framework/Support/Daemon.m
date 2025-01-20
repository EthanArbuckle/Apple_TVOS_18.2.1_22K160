@interface Daemon
+ (id)sharedInstance;
- (Daemon)init;
- (NSHashTable)notifications;
- (id)_proxyWithContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 request:(id)a6;
- (void)_clearNotification:(id)a3 fromPendingNotifications:(id)a4 finally:(id)a5;
- (void)_connectToExistingContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 processId:(int)a6 userId:(unsigned int)a7 auditSessionId:(int)a8 auditToken:(id *)a9 cApiOrigin:(BOOL)a10 checkEntitlementBlock:(id)a11 invalidationBlock:(id)a12 connectionHash:(unint64_t)a13 reply:(id)a14;
- (void)addNotificationObserver:(id)a3 className:(id)a4 completionHandler:(id)a5;
- (void)bootstrapSessionServiceType:(id)a3 serviceClientID:(id)a4 completionHandler:(id)a5;
- (void)connectToContextWithUUID:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 token:(id)a6 senderAuditTokenData:(id)a7 reply:(id)a8;
- (void)connectToExistingContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 reply:(id)a6;
- (void)connectToExistingContext:(id)a3 userId:(unsigned int)a4 connection:(id)a5 checkEntitlementBlock:(id)a6 callback:(id)a7 clientId:(unint64_t)a8 reply:(id)a9;
- (void)createContextWithCompletion:(id)a3;
- (void)dumpStatusWithCompletion:(id)a3;
- (void)notifyEvent:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)postNotificationOfClassNamed:(id)a3 newValue:(id)a4 oldValue:(id)a5 completionHandler:(id)a6;
- (void)prearmTouchIdWithReply:(id)a3;
@end

@implementation Daemon

+ (id)sharedInstance
{
  if (qword_10003E200 != -1) {
    dispatch_once(&qword_10003E200, &stru_100030E58);
  }
  return (id)qword_10003E1F8;
}

- (Daemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___Daemon;
  v2 = -[Daemon init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[DaemonServiceManagerFactory build](&OBJC_CLASS___DaemonServiceManagerFactory, "build"));
    serviceManager = v2->_serviceManager;
    v2->_serviceManager = (LAServiceManager *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    notifications = v2->_notifications;
    v2->_notifications = (NSHashTable *)v5;

    +[RemoteUIActivator setDaemon:](&OBJC_CLASS___RemoteUIActivator, "setDaemon:", v2);
  }

  return v2;
}

- (void)createContextWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = getuid();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = [[LAWeakBox alloc] initWithReceiver:self];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000B6C0;
  v9[3] = &unk_100030EC0;
  id v10 = v4;
  id v8 = v4;
  -[Daemon connectToExistingContext:userId:connection:checkEntitlementBlock:callback:clientId:reply:]( self,  "connectToExistingContext:userId:connection:checkEntitlementBlock:callback:clientId:reply:",  0LL,  v5,  v6,  &stru_100030E98,  v7,  0LL,  v9);
}

- (void)_connectToExistingContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 processId:(int)a6 userId:(unsigned int)a7 auditSessionId:(int)a8 auditToken:(id *)a9 cApiOrigin:(BOOL)a10 checkEntitlementBlock:(id)a11 invalidationBlock:(id)a12 connectionHash:(unint64_t)a13 reply:(id)a14
{
  uint64_t v14 = *(void *)&a7;
  uint64_t v15 = *(void *)&a6;
  id v38 = a3;
  id v34 = a4;
  id v17 = a11;
  id v18 = a12;
  id v19 = a14;
  id v20 = sub_10000BA18();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110144;
    unsigned int v58 = objc_msgSend(v38, "hash", v34);
    __int16 v59 = 1024;
    int v60 = v15;
    __int16 v61 = 1024;
    int v62 = v14;
    __int16 v63 = 1024;
    BOOL v64 = a10;
    __int16 v65 = 1024;
    int v66 = a13;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "connectToExistingContext:%x, pid:%d, uid:%u, cAPI:%d, connection:%x",  buf,  0x20u);
  }

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10000BA58;
  v54[3] = &unk_100030EE8;
  unint64_t v56 = a13;
  id v36 = v19;
  id v55 = v36;
  v22 = objc_retainBlock(v54);
  __int128 v23 = *(_OWORD *)&a9->var0[4];
  __int128 v51 = *(_OWORD *)a9->var0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10000BB9C;
  v42[3] = &unk_100030F10;
  uint64_t v24 = v15;
  int v48 = v15;
  int v49 = v14;
  uint64_t v25 = a8;
  int v50 = a8;
  __int128 v52 = v23;
  BOOL v53 = a10;
  id v26 = v17;
  id v44 = v26;
  id v27 = v18;
  id v45 = v27;
  id v28 = v34;
  id v43 = v28;
  unint64_t v47 = a5;
  v29 = v22;
  id v46 = v29;
  v30 = objc_retainBlock(v42);
  v31 = v38;
  if (v38
    && (v32 = (void *)objc_claimAutoreleasedReturnValue(+[ContextManager sharedInstance](&OBJC_CLASS___ContextManager, "sharedInstance")),
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 findContextForExternalizedContext:v38]),
        v32,
        v31 = v38,
        uint64_t v25 = a8,
        v33))
  {
    ((void (*)(void *, void *))v30[2])(v30, v33);
  }

  else
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10000BC8C;
    v39[3] = &unk_100030F38;
    v40 = v30;
    v41 = v29;
    +[Context managedContextWithExternalizedContext:processId:userId:auditSessionId:reply:]( &OBJC_CLASS___Context,  "managedContextWithExternalizedContext:processId:userId:auditSessionId:reply:",  v31,  v24,  v14,  v25,  v39);

    v33 = v40;
  }
}

- (void)connectToExistingContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = sub_10000BE24;
  id v20 = &unk_100030F60;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v13 = v21;
  uint64_t v14 = objc_retainBlock(&v17);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v16 = [v15 effectiveUserIdentifier];
  -[Daemon connectToExistingContext:userId:connection:checkEntitlementBlock:callback:clientId:reply:]( self,  "connectToExistingContext:userId:connection:checkEntitlementBlock:callback:clientId:reply:",  v12,  v16,  v13,  v14,  v11,  a5,  v10,  v17,  v18,  v19,  v20);
}

- (void)connectToExistingContext:(id)a3 userId:(unsigned int)a4 connection:(id)a5 checkEntitlementBlock:(id)a6 callback:(id)a7 clientId:(unint64_t)a8 reply:(id)a9
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  id v18 = [v14 processIdentifier];
  objc_initWeak(location, v16);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000BFF4;
  v25[3] = &unk_100030F88;
  int v27 = (int)v18;
  objc_copyWeak(&v26, location);
  id v19 = objc_retainBlock(v25);
  id v20 = [v14 auditSessionIdentifier];
  if (v14) {
    [v14 auditToken];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  LOBYTE(v21) = 0;
  -[Daemon _connectToExistingContext:callback:clientId:processId:userId:auditSessionId:auditToken:cApiOrigin:checkEntitlementBlock:invalidationBlock:connectionHash:reply:]( self,  "_connectToExistingContext:callback:clientId:processId:userId:auditSessionId:auditToken:cApiOrigin:checkEntitlementBl ock:invalidationBlock:connectionHash:reply:",  v13,  v16,  a8,  v18,  a4,  v20,  v24,  v21,  v15,  v19,  [v14 hash],  v17);

  objc_destroyWeak(&v26);
  objc_destroyWeak(location);
}

- (void)connectToContextWithUUID:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 token:(id)a6 senderAuditTokenData:(id)a7 reply:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[ContextManager sharedInstance](&OBJC_CLASS___ContextManager, "sharedInstance"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 contextForUUID:v18]);

  if (v20)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[Request requestFromCurrentConnection](&OBJC_CLASS___Request, "requestFromCurrentConnection"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 caller]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    _OWORD v24[2] = sub_10000C24C;
    v24[3] = &unk_100030FB0;
    id v29 = v17;
    v24[4] = self;
    id v25 = v20;
    unint64_t v30 = a5;
    id v26 = v14;
    id v27 = v21;
    id v28 = v19;
    id v23 = v21;
    [v25 connectFromCaller:v22 token:v15 senderAuditTokenData:v16 reply:v24];
  }

  else
  {
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -10LL,  @"Context not found."));
    (*((void (**)(id, void, void, id))v17 + 2))(v17, 0LL, 0LL, v23);
  }
}

- (id)_proxyWithContext:(id)a3 callback:(id)a4 clientId:(unint64_t)a5 request:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10000C4B0;
  v29[3] = &unk_100030F60;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 caller]);
  id v30 = v11;
  id v12 = objc_retainBlock(v29);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000C4BC;
  v25[3] = &unk_100030AB8;
  id v13 = v10;
  id v26 = v13;
  id v14 = v11;
  id v27 = v14;
  id v15 = v9;
  id v28 = v15;
  id v16 = objc_retainBlock(v25);
  id v17 = objc_alloc(&OBJC_CLASS___ContextProxy);
  id v18 = [v14 pid];
  id v19 = [v14 euid];
  id v20 = [v14 asid];
  if (v14) {
    [v14 auditToken];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  uint64_t v21 = -[ContextProxy initWithContext:processId:userId:auditSessionId:auditToken:cApiOrigin:checkEntitlementBlock:invalidationBlock:callback:clientId:]( v17,  "initWithContext:processId:userId:auditSessionId:auditToken:cApiOrigin:checkEntitlementBlock:invalidationBlock: callback:clientId:",  v8,  v18,  v19,  v20,  v24,  0LL,  v12,  v16,  v15,  a5);

  return v21;
}

- (void)bootstrapSessionServiceType:(id)a3 serviceClientID:(id)a4 completionHandler:(id)a5
{
}

- (void)prearmTouchIdWithReply:(id)a3
{
  uint64_t v3 = (void (**)(id, void, uint64_t))a3;
  id v4 = sub_10000BA18();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "prearmTouchIdWithReply", v11, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.private.CoreAuthentication.SPI"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  @"Touch ID not available."));
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.CoreAuthentication.SPI"));
  }
  id v10 = (void *)v9;
  v3[2](v3, 0LL, v9);
}

- (void)notifyEvent:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  int v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void (**)(id, void, uint64_t))a5;
  id v9 = sub_10000BA18();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109378;
    v16[1] = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "notifyEvent: %d, options: %@",  (uint8_t *)v16,  0x12u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForEntitlement:@"com.apple.private.CoreAuthentication.SPI"]);
  unsigned __int8 v13 = [v12 BOOLValue];

  if ((v13 & 1) != 0) {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorPlatformDoesNotSupportAction:]( &OBJC_CLASS___LAErrorHelper,  "errorPlatformDoesNotSupportAction:",  @"Event notification"));
  }
  else {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.CoreAuthentication.SPI"));
  }
  id v15 = (void *)v14;
  v8[2](v8, 0LL, v14);
}

- (void)addNotificationObserver:(id)a3 className:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, Notification *, void))a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v12 = [v11 processIdentifier];

  id v13 = sub_10000C8FC();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109378;
    v17[1] = (_DWORD)v12;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Added notification observer from PID %d for notification class %{public}@",  (uint8_t *)v17,  0x12u);
  }

  id v15 = -[Notification initWithObserver:observerPid:className:]( objc_alloc(&OBJC_CLASS___Notification),  "initWithObserver:observerPid:className:",  v10,  v12,  v8);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon notifications](self, "notifications"));
  [v16 addObject:v15];

  v9[2](v9, v15, 0LL);
}

- (void)postNotificationOfClassNamed:(id)a3 newValue:(id)a4 oldValue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10000CDC8;
  v48[3] = &unk_100030FD8;
  id v36 = v10;
  id v49 = v36;
  id v35 = v11;
  id v50 = v35;
  id v34 = v12;
  id v51 = v34;
  id v32 = v13;
  id v52 = v32;
  uint64_t v14 = objc_retainBlock(v48);
  id v15 = sub_10000C8FC();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v55 = v36;
    __int16 v56 = 2114;
    id v57 = v35;
    __int16 v58 = 2114;
    id v59 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Posting notification %{public}@, newValue: %{public}@, oldValue: %{public}@",  buf,  0x20u);
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon notifications](self, "notifications"));
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100031018));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v18 filteredArrayUsingPredicate:v19]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v33));
  objc_initWeak((id *)buf, self);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon notifications](self, "notifications"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allObjects]);

  id v23 = [v22 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v22);
        }
        id v26 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 className]);
        unsigned int v28 = [v27 isEqualToString:v36];

        if (v28)
        {
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472LL;
          v40[2] = sub_10000CEAC;
          v40[3] = &unk_100031040;
          objc_copyWeak(&v43, (id *)buf);
          v40[4] = v26;
          id v41 = v20;
          v42 = v14;
          [v26 newValue:v35 oldValue:v34 completionHandler:v40];

          objc_destroyWeak(&v43);
        }

        else
        {
          id WeakRetained = objc_loadWeakRetained((id *)buf);
          [WeakRetained _clearNotification:v26 fromPendingNotifications:v20 finally:v14];
        }
      }

      id v23 = [v22 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }

    while (v23);
  }

  if ([v20 count])
  {
    dispatch_time_t v30 = dispatch_time(0LL, 100000000LL);
    v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[DaemonUtils queue](&OBJC_CLASS___DaemonUtils, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CFB0;
    block[3] = &unk_100030DE8;
    id v38 = v20;
    v39 = v14;
    dispatch_after(v30, v31, block);
  }

  else
  {
    ((void (*)(void *))v14[2])(v14);
  }

  objc_destroyWeak((id *)buf);
}

- (void)_clearNotification:(id)a3 fromPendingNotifications:(id)a4 finally:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if ([v8 containsObject:v7])
  {
    [v8 removeObject:v7];
    if (![v8 count]) {
      v9[2](v9);
    }
  }

  else
  {
    id v10 = sub_10000C8FC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000212AC((uint64_t)v7, (uint64_t)v8, v11);
    }
  }
}

- (void)dumpStatusWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, void, uint64_t))a3;
  id v4 = sub_10000BA18();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    pid_t v21 = getpid();
    __int16 v22 = 1024;
    uid_t v23 = geteuid();
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Dumping status information for coreauthd[%u] (user %u)...",  buf,  0xEu);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.private.LocalAuthentication.StatusDump"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper missingEntitlementError:]( &OBJC_CLASS___LAErrorHelper,  "missingEntitlementError:",  @"com.apple.private.LocalAuthentication.StatusDump"));
LABEL_8:
    id v10 = (void *)v17;
    v3[2](v3, 0LL, v17);
    goto LABEL_9;
  }

  if ((os_variant_allows_internal_security_policies(LACLogSubsystem) & 1) == 0)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  @"Status dump not allowed on production builds"));
    goto LABEL_8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ContextManager sharedInstance](&OBJC_CLASS___ContextManager, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dumpStatus]);

  v18[0] = @"environment";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[EnvironmentManager sharedInstance](&OBJC_CLASS___EnvironmentManager, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dumpStatus]);
  v19[0] = v12;
  v19[1] = v10;
  v18[1] = @"contexts";
  v18[2] = @"context#";
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 count]));
  v19[2] = v13;
  v18[3] = @"process";
  uint64_t v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"coreauthd[%u]", getpid());
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v19[3] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));

  ((void (**)(id, void *, uint64_t))v3)[2](v3, v16, 0LL);
LABEL_9:
}

- (NSHashTable)notifications
{
  return self->_notifications;
}

- (void).cxx_destruct
{
}

@end