@interface UARPUpdaterServiceInstance
- (BOOL)consentDisabledForService;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5;
- (BOOL)isTrackingIONotificationPortForRegistryEntryID:(id)a3;
- (BOOL)queryIsServiceBusy;
- (BOOL)queryIsServiceBusyInternal;
- (NSArray)accessoriesNeedingConsent;
- (NSString)serviceName;
- (UARPUpdaterServiceInstance)initWithServiceBundle:(id)a3 delegate:(id)a4;
- (id)description;
- (id)findAndReleaseAllIONotificationPorts;
- (id)findAndReleaseIONotificationPortForRegistryEntryID:(id)a3;
- (id)queryPendingTssRequests;
- (void)bsdNotificationReceived:(id)a3;
- (void)checkinDASActivities;
- (void)consentReceived:(id)a3;
- (void)consentReceivedPostLogoutMode:(id)a3;
- (void)dasActivityReceived:(id)a3;
- (void)dealloc;
- (void)disabledProductIdentifiers:(id)a3;
- (void)eaRuleMatched:(id)a3;
- (void)initializeUpdaterServiceConnection;
- (void)ioKitRuleMatched:(id)a3;
- (void)queryBSDNotificationRules;
- (void)queryDASActivityRules;
- (void)queryLaunchRules;
- (void)queryMatchingRules;
- (void)releaseXPCConnection;
- (void)storeIONotificationPort:(id)a3 forRegistryEntryID:(id)a4;
- (void)tssResponse:(id)a3;
@end

@implementation UARPUpdaterServiceInstance

- (UARPUpdaterServiceInstance)initWithServiceBundle:(id)a3 delegate:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPUpdaterServiceInstance;
  v6 = -[UARPUpdaterServiceInstance init](&v12, "init");
  if (v6)
  {
    v6->_log = os_log_create("com.apple.accessoryupdater.uarp", "updaterManager");
    v7 = (NSString *)objc_msgSend(objc_msgSend(a3, "bundleIdentifier"), "copy");
    v6->_serviceName = v7;
    v6->_delegate = (UARPUpdaterServiceInstanceDelegate *)a4;
    v6->_queue = (OS_dispatch_queue *)dispatch_queue_create(-[NSString UTF8String](v7, "UTF8String"), 0LL);
    v6->_regEntryIDToIONotificationPorts = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v8 = [a3 infoDictionary];
    id v9 = [v8 objectForKeyedSubscript:@"AccessoriesNeedingConsent"];
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
      v6->_accessoriesNeedingConsent = (NSArray *)[v9 copy];
    }
    if (objc_msgSend( objc_msgSend( objc_msgSend(v8, "objectForKeyedSubscript:", @"XPCService"),  "objectForKeyedSubscript:",  @"ServiceType"),  "isEqualToString:",  @"Application")) {
      v6->_serviceTypeApplication = 1;
    }
  }

  return v6;
}

- (void)dealloc
{
  -[UARPUpdaterServiceInstance releaseXPCConnection](self, "releaseXPCConnection");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPUpdaterServiceInstance;
  -[UARPUpdaterServiceInstance dealloc](&v3, "dealloc");
}

- (void)initializeUpdaterServiceConnection
{
  self->_xpcConnection = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  self->_serviceName);
  objc_super v3 = +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UARPUpdaterService);
  v5[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v5[1] = objc_opt_class(&OBJC_CLASS___UARPServiceUpdaterAccessoryMatchingRule);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v3,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithArray:]( &OBJC_CLASS___NSSet,  "setWithArray:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL)),  "getMatchingServicesListWithReply:",  0LL,  1LL);
  v4[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v4[1] = objc_opt_class(&OBJC_CLASS___UARPServiceUpdaterDASMatchingRule);
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v3,  "setClasses:forSelector:argumentIndex:ofReply:",  +[NSSet setWithArray:]( &OBJC_CLASS___NSSet,  "setWithArray:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, 2LL)),  "getDASActivityListWithReply:",  0LL,  1LL);
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v3);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
}

- (void)releaseXPCConnection
{
  self->_xpcConnection = 0LL;
}

- (BOOL)consentDisabledForService
{
  objc_super v3 = (void *)CFPreferencesCopyAppValue( @"disabledConsentUARPServices",  @"com.apple.mobileaccessoryupdater");
  LOBYTE(self) = objc_msgSend( objc_msgSend( v3,  "objectForKeyedSubscript:",  -[UARPUpdaterServiceInstance serviceName](self, "serviceName")),  "BOOLValue");

  return (char)self;
}

- (void)queryMatchingRules
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3052000000LL;
  v18 = sub_10001E944;
  v19 = sub_10001E954;
  uint64_t v20 = 0LL;
  xpcConnection = self->_xpcConnection;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001E960;
  v14[3] = &unk_100075808;
  v14[4] = &v15;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  v11 = sub_10001E944;
  objc_super v12 = sub_10001E954;
  uint64_t v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E98C;
  v7[3] = &unk_100075260;
  v7[4] = &v8;
  objc_msgSend( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v14),  "getMatchingServicesListWithReply:",  v7);
  v4 = (void *)v16[5];
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412546;
      v22 = serviceName;
      __int16 v23 = 2112;
      v24 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to query services for %@ (%@)",  buf,  0x16u);
      v4 = (void *)v16[5];
    }
  }

  else
  {
    -[UARPUpdaterServiceInstanceDelegate matchingRulesChangedForUpdaterServiceInstance:matchingRules:]( self->_delegate,  "matchingRulesChangedForUpdaterServiceInstance:matchingRules:",  self,  v9[5]);
  }

  -[UARPUpdaterServiceInstance releaseXPCConnection](self, "releaseXPCConnection");
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v15, 8);
}

- (void)queryBSDNotificationRules
{
  if (-[UARPUpdaterServiceInstance consentDisabledForService](self, "consentDisabledForService"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_100049824((uint64_t)self, log, v4, v5, v6, v7, v8, v9);
    }
  }

  else
  {
    -[UARPUpdaterServiceInstance initializeUpdaterServiceConnection](self, "initializeUpdaterServiceConnection");
    uint64_t v22 = 0LL;
    __int16 v23 = &v22;
    uint64_t v24 = 0x3052000000LL;
    v25 = sub_10001E944;
    v26 = sub_10001E954;
    uint64_t v27 = 0LL;
    xpcConnection = self->_xpcConnection;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10001EBEC;
    v21[3] = &unk_100075808;
    v21[4] = &v22;
    uint64_t v15 = 0LL;
    v16 = &v15;
    uint64_t v17 = 0x3052000000LL;
    v18 = sub_10001E944;
    v19 = sub_10001E954;
    uint64_t v20 = 0LL;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10001EC18;
    v14[3] = &unk_100075260;
    v14[4] = &v15;
    objc_msgSend( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v21),  "getBSDNotificationsListWithReply:",  v14);
    v11 = (void *)v23[5];
    if (v11)
    {
      objc_super v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        serviceName = self->_serviceName;
        *(_DWORD *)buf = 138412546;
        v29 = serviceName;
        __int16 v30 = 2112;
        v31 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unable to query BSD notifications for %@ (%@)",  buf,  0x16u);
        v11 = (void *)v23[5];
      }
    }

    else
    {
      -[UARPUpdaterServiceInstanceDelegate bsdNotificationRulesChangedForUpdaterServiceInstance:notificationNames:]( self->_delegate,  "bsdNotificationRulesChangedForUpdaterServiceInstance:notificationNames:",  self,  v16[5]);
    }

    -[UARPUpdaterServiceInstance releaseXPCConnection](self, "releaseXPCConnection");
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v22, 8);
  }

- (void)queryDASActivityRules
{
  if (-[UARPUpdaterServiceInstance consentDisabledForService](self, "consentDisabledForService"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_100049890((uint64_t)self, log, v4, v5, v6, v7, v8, v9);
    }
  }

  else
  {
    objc_msgSend( +[UARPDatabase sharedDatabase](UARPDatabase, "sharedDatabase"),  "removeDASActivitiesForServiceName:",  self->_serviceName);
    -[UARPUpdaterServiceInstance initializeUpdaterServiceConnection](self, "initializeUpdaterServiceConnection");
    uint64_t v26 = 0LL;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3052000000LL;
    v29 = sub_10001E944;
    __int16 v30 = sub_10001E954;
    uint64_t v31 = 0LL;
    xpcConnection = self->_xpcConnection;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10001EF14;
    v25[3] = &unk_100075808;
    v25[4] = &v26;
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3052000000LL;
    uint64_t v22 = sub_10001E944;
    __int16 v23 = sub_10001E954;
    uint64_t v24 = 0LL;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10001EF40;
    v18[3] = &unk_100075260;
    v18[4] = &v19;
    objc_msgSend( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v25),  "getDASActivityListWithReply:",  v18);
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      uint64_t v13 = (void *)v20[5];
      *(_DWORD *)buf = 138412546;
      v33 = serviceName;
      __int16 v34 = 2112;
      v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DAS activities from %@ (%@)", buf, 0x16u);
    }

    v14 = (void *)v27[5];
    if (v14)
    {
      uint64_t v15 = self->_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = self->_serviceName;
        *(_DWORD *)buf = 138412546;
        v33 = v17;
        __int16 v34 = 2112;
        v35 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unable to query DAS notifications for %@ (%@)",  buf,  0x16u);
        v14 = (void *)v27[5];
      }
    }

    else
    {
      -[UARPUpdaterServiceInstanceDelegate dasActivityRulesChangedForUpdaterServiceInstance:dasActivities:]( self->_delegate,  "dasActivityRulesChangedForUpdaterServiceInstance:dasActivities:",  self,  v20[5]);
      if ([(id)v20[5] count])
      {
        id v16 = +[UARPDatabase sharedDatabase](&OBJC_CLASS___UARPDatabase, "sharedDatabase");
        [v16 addDASActivities:v20[5] serviceName:self->_serviceName];
      }
    }

    -[UARPUpdaterServiceInstance releaseXPCConnection](self, "releaseXPCConnection");
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v26, 8);
  }

- (void)queryLaunchRules
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001EFC8;
  block[3] = &unk_100074F50;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)checkinDASActivities
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F050;
  block[3] = &unk_100074F50;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)ioKitRuleMatched:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10001F1AC;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)bsdNotificationReceived:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10001F320;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)dasActivityReceived:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10001F454;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)consentReceived:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10001F58C;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)consentReceivedPostLogoutMode:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10001F6C0;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)disabledProductIdentifiers:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10001F7F4;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)eaRuleMatched:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10001F928;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (BOOL)queryIsServiceBusyInternal
{
  if (!self->_serviceTypeApplication) {
    return 0;
  }
  -[UARPUpdaterServiceInstance initializeUpdaterServiceConnection](self, "initializeUpdaterServiceConnection");
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3052000000LL;
  uint64_t v20 = sub_10001E944;
  uint64_t v21 = sub_10001E954;
  uint64_t v22 = 0LL;
  xpcConnection = self->_xpcConnection;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10001FC60;
  v16[3] = &unk_100075808;
  v16[4] = &v17;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001FC8C;
  v11[3] = &unk_100075830;
  v11[4] = &v12;
  objc_msgSend( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v16),  "getIsBusyStatusWithReply:",  v11);
  uint64_t v4 = (void *)v18[5];
  log = self->_log;
  if (v4)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = serviceName;
      __int16 v25 = 2112;
      uint64_t v26 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to query isServiceBusy for %@ (%@)",  buf,  0x16u);
      uint64_t v4 = (void *)v18[5];
    }
  }

  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = self->_serviceName;
    int v8 = *((unsigned __int8 *)v13 + 24);
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v7;
    __int16 v25 = 1024;
    LODWORD(v26) = v8;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%@ isServiceBusy (%d)", buf, 0x12u);
  }

  -[UARPUpdaterServiceInstance releaseXPCConnection](self, "releaseXPCConnection");
  BOOL v6 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v17, 8);
  return v6;
}

- (BOOL)queryIsServiceBusy
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  void v5[2] = sub_10001FD28;
  v5[3] = &unk_1000751E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isTrackingIONotificationPortForRegistryEntryID:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001FDEC;
  block[3] = &unk_100075858;
  void block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)storeIONotificationPort:(id)a3 forRegistryEntryID:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001FE84;
  block[3] = &unk_1000754F8;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

- (id)findAndReleaseIONotificationPortForRegistryEntryID:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  char v10 = sub_10001E944;
  v11 = sub_10001E954;
  uint64_t v12 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001FF40;
  block[3] = &unk_100075548;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(queue, block);
  char v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)findAndReleaseAllIONotificationPorts
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = sub_10001E944;
  char v10 = sub_10001E954;
  uint64_t v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  void v5[2] = sub_100020088;
  v5[3] = &unk_100075880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  objc_msgSend((id)v7[5], "removeObjectIdenticalTo:", +[NSNull null](NSNull, "null"));
  char v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5
{
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  uint64_t v26 = sub_10001E944;
  uint64_t v27 = sub_10001E954;
  uint64_t v28 = 0LL;
  xpcConnection = self->_xpcConnection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100020364;
  v22[3] = &unk_100075808;
  v22[4] = &v23;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100020390;
  v17[3] = &unk_100075830;
  v17[4] = &v18;
  objc_msgSend( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v22),  "standaloneDynamicAssetSolicitation:modelNumber:notifyService:reply:",  a3,  a4,  a5,  v17);
  char v10 = (void *)v24[5];
  log = self->_log;
  if (v10)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 136315650;
      __int16 v30 = "-[UARPUpdaterServiceInstance dynamicAssetSolicitation:modelNumber:notifyService:]";
      __int16 v31 = 2112;
      v32 = serviceName;
      __int16 v33 = 2112;
      __int16 v34 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s Unable to query isSolicitSuccess for %@ (%@)",  buf,  0x20u);
      char v10 = (void *)v24[5];
    }
  }

  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = self->_serviceName;
    int v13 = *((unsigned __int8 *)v19 + 24);
    *(_DWORD *)buf = 136315650;
    __int16 v30 = "-[UARPUpdaterServiceInstance dynamicAssetSolicitation:modelNumber:notifyService:]";
    __int16 v31 = 2112;
    v32 = v12;
    __int16 v33 = 1024;
    LODWORD(v34) = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s %@ solicitSuccess (%d)", buf, 0x1Cu);
  }

  -[UARPUpdaterServiceInstance releaseXPCConnection](self, "releaseXPCConnection");
  char v14 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5
{
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  uint64_t v26 = sub_10001E944;
  uint64_t v27 = sub_10001E954;
  uint64_t v28 = 0LL;
  xpcConnection = self->_xpcConnection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100020620;
  v22[3] = &unk_100075808;
  v22[4] = &v23;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002064C;
  v17[3] = &unk_100075830;
  v17[4] = &v18;
  objc_msgSend( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v22),  "standaloneDynamicAssetSolicitation:modelNumbers:notifyService:reply:",  a3,  a4,  a5,  v17);
  char v10 = (void *)v24[5];
  log = self->_log;
  if (v10)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 136315650;
      __int16 v30 = "-[UARPUpdaterServiceInstance dynamicAssetSolicitation:modelNumbers:notifyService:]";
      __int16 v31 = 2112;
      v32 = serviceName;
      __int16 v33 = 2112;
      __int16 v34 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s Unable to query isSolicitSuccess for %@ (%@)",  buf,  0x20u);
      char v10 = (void *)v24[5];
    }
  }

  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = self->_serviceName;
    int v13 = *((unsigned __int8 *)v19 + 24);
    *(_DWORD *)buf = 136315650;
    __int16 v30 = "-[UARPUpdaterServiceInstance dynamicAssetSolicitation:modelNumbers:notifyService:]";
    __int16 v31 = 2112;
    v32 = v12;
    __int16 v33 = 1024;
    LODWORD(v34) = v13;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s %@ solicitSuccess (%d)", buf, 0x1Cu);
  }

  -[UARPUpdaterServiceInstance releaseXPCConnection](self, "releaseXPCConnection");
  char v14 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

- (id)description
{
  char v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@>",  NSStringFromClass(v3),  self->_serviceName);
}

- (id)queryPendingTssRequests
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[UARPUpdaterServiceInstance queryPendingTssRequests]";
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: query pending tss requests",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3052000000LL;
  id v16 = sub_10001E944;
  uint64_t v17 = sub_10001E954;
  uint64_t v18 = &__NSArray0__struct;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100020834;
  v9[3] = &unk_100075880;
  v9[4] = self;
  v9[5] = &buf;
  dispatch_sync(queue, v9);
  uint64_t v5 = self->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*((void *)&buf + 1) + 40LL);
    *(_DWORD *)char v10 = 136315394;
    uint64_t v11 = "-[UARPUpdaterServiceInstance queryPendingTssRequests]";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: pending tss requests %@", v10, 0x16u);
  }

  uint64_t v7 = *(void **)(*((void *)&buf + 1) + 40LL);
  _Block_object_dispose(&buf, 8);
  return v7;
}

- (void)tssResponse:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v9 = "-[UARPUpdaterServiceInstance tssResponse:]";
    __int16 v10 = 2112;
    id v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%s: tss reponse %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100020B28;
  v7[3] = &unk_1000754A8;
  v7[4] = self;
  void v7[5] = a3;
  dispatch_async(queue, v7);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSArray)accessoriesNeedingConsent
{
  return self->_accessoriesNeedingConsent;
}

@end