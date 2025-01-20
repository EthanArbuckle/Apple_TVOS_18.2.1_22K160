@interface HMCAMDEmbeddedDeviceService
+ (id)logCategory;
+ (void)confirmSemaphoreAndSignal:(id)a3;
- (BOOL)directInvocations;
- (BOOL)isRoot;
- (BOOL)isValid;
- (BOOL)testCommunication;
- (HMCAMDBlockManager)blockInvoker;
- (HMCAMDEmbeddedDeviceService)init;
- (id)_initAsRoot:(BOOL)a3;
- (id)initAsMobile;
- (id)initAsRoot;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)logIdentifier;
- (id)performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 error:(id *)a6;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)requestTimeout;
- (void)_fireActualBlockWithArguments:(id)a3 forKey:(id)a4;
- (void)_performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 reply:(id)a6;
- (void)_removeActualBlockForKey:(id)a3;
- (void)_testCommunication:(id)a3;
- (void)blockReleased:(id)a3;
- (void)dealloc;
- (void)resetConnection;
- (void)setDirectInvocations:(BOOL)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRequestTimeout:(unint64_t)a3;
- (void)start;
@end

@implementation HMCAMDEmbeddedDeviceService

- (id)_initAsRoot:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HMCAMDEmbeddedDeviceService;
  v4 = -[HMCAMDEmbeddedDevice init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    v4[33] = a3;
    v4[34] = 0;
    v4[35] = 1;
    *(void *)(v4 + 41) = 900LL;
    *(void *)(v4 + 25) = 2LL;
    v6 = -[HMCAMDBlockManager initWithService:](objc_alloc(&OBJC_CLASS___HMCAMDBlockManager), "initWithService:", v4);
    v7 = *(void **)(v5 + 65);
    *(void *)(v5 + 65) = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v5 selector:"blockReleased:" name:@"kCAMDBlockReleasedNotification" object:0];
  }

  return v5;
}

- (HMCAMDEmbeddedDeviceService)init
{
  return (HMCAMDEmbeddedDeviceService *)-[HMCAMDEmbeddedDeviceService _initAsRoot:](self, "_initAsRoot:", 0LL);
}

- (id)initAsRoot
{
  return -[HMCAMDEmbeddedDeviceService _initAsRoot:](self, "_initAsRoot:", 1LL);
}

- (id)initAsMobile
{
  return -[HMCAMDEmbeddedDeviceService init](self, "init");
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"kCAMDBlockReleasedNotification" object:0];

  v4 = *(void **)(&self->super._filterNSDataLogging + 1);
  if (v4 && BYTE2(self->_backoffTimer)) {
    [v4 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HMCAMDEmbeddedDeviceService;
  -[HMCAMDEmbeddedDeviceService dealloc](&v5, "dealloc");
}

- (void)blockReleased:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  if (v4)
  {
    id v6 = v4;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"blocks"]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100014614;
    v7[3] = &unk_100028C48;
    v7[4] = self;
    [v5 enumerateObjectsUsingBlock:v7];

    v4 = v6;
  }
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  if (*(void *)(&v2->super._filterNSDataLogging + 1) && BYTE2(v2->_backoffTimer))
  {
    v3 = objc_autoreleasePoolPush();
    v4 = v2;
    uint64_t v5 = HMFGetOSLogHandle(v4);
    id v6 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 138543362;
      v31 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}@Server connection already started and valid. Reset connection if needed.",  buf,  0xCu);
    }

    objc_autoreleasePoolPop(v3);
  }

  else
  {
    *(NSXPCConnection **)((char *)&v2->_connection + 1) = (NSXPCConnection *)2;
    if (BYTE1(v2->_backoffTimer)) {
      v9 = @"com.apple.coreautomationd.xpc.root";
    }
    else {
      v9 = @"com.apple.coreautomationd.xpc.mobile";
    }
    objc_super v10 = v9;
    v11 = objc_autoreleasePoolPush();
    v12 = v2;
    uint64_t v13 = HMFGetOSLogHandle(v12);
    v14 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier(v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138543618;
      v31 = v16;
      __int16 v32 = 2112;
      v33 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%{public}@Starting connection to service %@.",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v11);
    v17 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  v10,  4096LL);
    v18 = *(void **)(&v2->super._filterNSDataLogging + 1);
    *(void *)(&v2->super._filterNSDataLogging + 1) = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___HMCAMDEmbeddedDeviceServerProxy));
    [*(id *)(&v2->super._filterNSDataLogging + 1) setRemoteObjectInterface:v19];

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___HMCAMDEmbeddedDeviceClientProxy));
    [*(id *)(&v2->super._filterNSDataLogging + 1) setExportedInterface:v20];

    [*(id *)(&v2->super._filterNSDataLogging + 1) setExportedObject:v12];
    objc_initWeak((id *)buf, v12);
    v21 = *(void **)(&v2->super._filterNSDataLogging + 1);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10001402C;
    v28[3] = &unk_100028C70;
    objc_copyWeak(&v29, (id *)buf);
    [v21 setInvalidationHandler:v28];
    v22 = *(void **)(&v2->super._filterNSDataLogging + 1);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    v25 = sub_100014194;
    v26 = &unk_100028C70;
    objc_copyWeak(&v27, (id *)buf);
    [v22 setInterruptionHandler:&v23];
    objc_msgSend(*(id *)(&v2->super._filterNSDataLogging + 1), "resume", v23, v24, v25, v26);
    BYTE2(v12->_backoffTimer) = 1;
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }

  objc_sync_exit(v2);
}

- (void)resetConnection
{
  v2 = self;
  objc_sync_enter(v2);
  if (!BYTE2(v2->_backoffTimer))
  {
    v3 = objc_autoreleasePoolPush();
    v4 = v2;
    uint64_t v5 = HMFGetOSLogHandle(v4);
    id v6 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v9 = *(uint64_t *)((char *)&v4->_connection + 1);
      int v11 = 138543618;
      v12 = v8;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}@Resetting connection to server (waited %lu seconds).",  (uint8_t *)&v11,  0x16u);
    }

    objc_autoreleasePoolPop(v3);
    objc_super v10 = *(void **)(&v4->super._filterNSDataLogging + 1);
    if (v10)
    {
      *(void *)(&v4->super._filterNSDataLogging + 1) = 0LL;

      BYTE2(v2->_backoffTimer) = 0;
    }

    -[HMCAMDEmbeddedDeviceService start](v4, "start");
  }

  objc_sync_exit(v2);
}

- (id)remoteObjectProxy
{
  return -[HMCAMDEmbeddedDeviceService remoteObjectProxyWithErrorHandler:]( self,  "remoteObjectProxyWithErrorHandler:",  0LL);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(void **)(&self->super._filterNSDataLogging + 1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100013F1C;
  v9[3] = &unk_100028C98;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v9]);

  return v7;
}

- (id)performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (BYTE2(self->_backoffTimer))
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000LL;
    v43 = sub_1000126CC;
    v44 = sub_1000126DC;
    id v45 = 0LL;
    uint64_t v35 = 0LL;
    v36 = &v35;
    uint64_t v37 = 0x3032000000LL;
    v38 = sub_1000126CC;
    v39 = sub_1000126DC;
    id v40 = 0LL;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100013E5C;
    v32[3] = &unk_100028CC0;
    v34 = &v35;
    __int16 v13 = dispatch_semaphore_create(0LL);
    v33 = v13;
    uint64_t v14 = objc_retainBlock(v32);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[HMCAMDEmbeddedDeviceService remoteObjectProxyWithErrorHandler:]( self,  "remoteObjectProxyWithErrorHandler:",  v14));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100013EA0;
    v28[3] = &unk_100028CE8;
    p___int128 buf = &buf;
    v31 = &v35;
    v16 = v13;
    id v29 = v16;
    [v15 _performCommandFromClass:v10 method:v11 arguments:v12 reply:v28];

    dispatch_time_t v17 = dispatch_time(0LL, 1000000000LL * *(void *)&self->_isValid);
    uint64_t v18 = dispatch_semaphore_wait(v16, v17);
    if (a6 && v18)
    {
      id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](&OBJC_CLASS___NSError, "hmfErrorWithCode:", 13LL));
    }

    else
    {
      if (!a6)
      {
LABEL_12:
        id v26 = *(id *)(*((void *)&buf + 1) + 40LL);

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_13;
      }

      id v19 = (id) v36[5];
    }

    *a6 = v19;
    goto LABEL_12;
  }

  v20 = objc_autoreleasePoolPush();
  v21 = self;
  uint64_t v22 = HMFGetOSLogHandle(v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = HMFGetLogIdentifier(v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%{public}@Attempted to invoke a service command when HMDCAMDEmbeddedDeviceService is not started or connection is invalid. Start the service and then retry.",  (uint8_t *)&buf,  0xCu);
  }

  objc_autoreleasePoolPop(v20);
  id v26 = 0LL;
  if (a6) {
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](&OBJC_CLASS___NSError, "hmfErrorWithCode:", 11LL));
  }
LABEL_13:

  return v26;
}

- (BOOL)testCommunication
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v4 = *(void *)&self->_isValid;
  uint64_t v20 = 0x2020000000LL;
  *(void *)&self->_isValid = 5LL;
  char v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100013E1C;
  v15[3] = &unk_100028CC0;
  dispatch_time_t v17 = &v18;
  uint64_t v5 = v3;
  v16 = v5;
  id v6 = objc_retainBlock(v15);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[HMCAMDEmbeddedDeviceService remoteObjectProxyWithErrorHandler:]( self,  "remoteObjectProxyWithErrorHandler:",  v6));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100013E3C;
  v12[3] = &unk_100028D10;
  uint64_t v14 = &v18;
  v8 = v5;
  __int16 v13 = v8;
  [v7 _testCommunication:v12];

  dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL * *(void *)&self->_isValid);
  if (dispatch_semaphore_wait(v8, v9))
  {
    BOOL v10 = 0;
    *((_BYTE *)v19 + 24) = 0;
  }

  else
  {
    BOOL v10 = *((_BYTE *)v19 + 24) != 0;
  }

  *(void *)&self->_isValid = v4;

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (void)_fireActualBlockWithArguments:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_autoreleasePoolPush();
  dispatch_time_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier(v9);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%{public}@Firing block on client for key %@.",  (uint8_t *)&v14,  0x16u);
  }

  objc_autoreleasePoolPop(v8);
  [*(id *)((char *)&v9->_invalidationHandler + 1) invokeForwardedBlockWithArguments:v6 forKey:v7];
}

- (void)_removeActualBlockForKey:(id)a3
{
  id v4 = a3;
  [*(id *)((char *)&self->_invalidationHandler + 1) removeBlockForKey:v4];
  uint64_t v5 = objc_autoreleasePoolPush();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier(v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [*(id *)((char *)&self->_invalidationHandler + 1) count];
    int v12 = 138543874;
    __int16 v13 = v10;
    __int16 v14 = 2048;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%{public}@Removed block (%lu) on client for key %@.",  (uint8_t *)&v12,  0x20u);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_performCommandFromClass:(id)a3 method:(id)a4 arguments:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = (void (**)(id, void *, id))a6;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v12)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100013B14;
    v25[3] = &unk_100028D38;
    v25[4] = self;
    id v26 = v14;
    id v16 = v15;
    id v27 = v16;
    [v12 enumerateObjectsUsingBlock:v25];
    id v17 = v16;
  }

  else
  {
    id v17 = 0LL;
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___HMCAMDEmbeddedDeviceService;
  id v24 = 0LL;
  id v18 = -[HMCAMDEmbeddedDevice performCommandFromClass:method:arguments:error:]( &v23,  "performCommandFromClass:method:arguments:error:",  v10,  v11,  v17,  &v24);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = v24;
  if (v20 && [v14 count])
  {
    char v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v28 = @"blocks";
    id v29 = v14;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    [v21 postNotificationName:@"kCAMDBlockReleasedNotification" object:0 userInfo:v22];
  }

  v13[2](v13, v19, v20);
}

- (void)_testCommunication:(id)a3
{
}

- (id)logIdentifier
{
  return @"HMDCAMDEmbeddedDeviceService";
}

- (BOOL)isRoot
{
  return BYTE1(self->_backoffTimer) & 1;
}

- (BOOL)isValid
{
  return BYTE2(self->_backoffTimer) & 1;
}

- (BOOL)directInvocations
{
  return BYTE3(self->_backoffTimer) & 1;
}

- (void)setDirectInvocations:(BOOL)a3
{
  BYTE3(self->_backoffTimer) = a3;
}

- (unint64_t)requestTimeout
{
  return *(void *)&self->_isValid;
}

- (void)setRequestTimeout:(unint64_t)a3
{
  *(void *)&self->_isValid = a3;
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 49LL, 1);
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 57LL, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (HMCAMDBlockManager)blockInvoker
{
  return (HMCAMDBlockManager *)objc_getProperty(self, a2, 65LL, 1);
}

- (void).cxx_destruct
{
}

+ (void)confirmSemaphoreAndSignal:(id)a3
{
  id v4 = (dispatch_semaphore_s *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    dispatch_semaphore_signal(v4);
  }

  else
  {
    id v6 = objc_autoreleasePoolPush();
    id v7 = a1;
    uint64_t v8 = HMFGetOSLogHandle(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier(v7);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
      int v13 = 138543874;
      __int16 v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = 0LL;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%{public}@Semaphore [%p] is nil.\n%@",  (uint8_t *)&v13,  0x20u);
    }

    objc_autoreleasePoolPop(v6);
  }
}

+ (id)logCategory
{
  if (qword_100032D58 != -1) {
    dispatch_once(&qword_100032D58, &stru_100028D58);
  }
  return (id)qword_100032D60;
}

@end