@interface XBLaunchImageProviderServer
+ (id)sharedInstance;
- (XBLaunchImageProviderServer)init;
- (id)_transactionWorkForClient:(id)a3;
- (unsigned)_onMain_createLaunchWindowForClient:(id)a3 withLaunchRequest:(id)a4 appInfo:(id)a5 captureInfo:(id *)a6 captureOptions:(int64_t)a7 error:(id *)a8;
- (void)_queue_handleGetLaunchImage:(id)a3 forClient:(id)a4;
- (void)_removeTransactionWorkForClient:(id)a3;
- (void)_setTransactionWork:(id)a3 forClient:(id)a4;
- (void)queue_clientAdded:(id)a3;
- (void)queue_clientRemoved:(id)a3;
- (void)queue_handleMessage:(id)a3 client:(id)a4;
- (void)run;
@end

@implementation XBLaunchImageProviderServer

+ (id)sharedInstance
{
  if (qword_1000115B0 != -1) {
    dispatch_once(&qword_1000115B0, &stru_10000C6C8);
  }
  return (id)qword_1000115A8;
}

- (XBLaunchImageProviderServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___XBLaunchImageProviderServer;
  v2 = -[XBLaunchImageProviderServer initWithServiceName:]( &v8,  "initWithServiceName:",  XBApplicationLaunchImageServiceName);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____XBMemoryMonitor);
    memoryMonitor = v2->_memoryMonitor;
    v2->_memoryMonitor = v3;

    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
    accessLock_clientTransactionWorkMap = v2->_accessLock_clientTransactionWorkMap;
    v2->_accessLock_clientTransactionWorkMap = (NSMapTable *)v5;
  }

  return v2;
}

- (void)run
{
  id v3 = sub_100002838();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Running", buf, 2u);
  }

  if (qword_1000115B8 != -1) {
    dispatch_once(&qword_1000115B8, &stru_10000C6E8);
  }
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[XBLaunchImageProviderServer queue](self, "queue"));
  dispatch_async(v5, &stru_10000C708);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___XBLaunchImageProviderServer;
  -[XBLaunchImageProviderServer run](&v6, "run");
}

- (void)queue_handleMessage:(id)a3 client:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  int64_t int64 = xpc_dictionary_get_int64(xdict, XBLaunchImageProviderMessageKeyMessageType);
  if (int64 == 1)
  {
    -[XBLaunchImageProviderServer _handlePreheat:forClient:](self, "_handlePreheat:forClient:", xdict, v6);
  }

  else if (!int64)
  {
    -[XBLaunchImageProviderServer _queue_handleGetLaunchImage:forClient:]( self,  "_queue_handleGetLaunchImage:forClient:",  xdict,  v6);
  }
}

- (void)queue_clientAdded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___XBLaunchImageClientTransactionWork);
  -[XBLaunchImageProviderServer _setTransactionWork:forClient:](self, "_setTransactionWork:forClient:", v5, v4);
}

- (void)queue_clientRemoved:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005A60;
  block[3] = &unk_10000C758;
  block[4] = self;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  id v4 = v8;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, block);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  -[XBLaunchImageProviderServer _removeTransactionWorkForClient:](self, "_removeTransactionWorkForClient:", v5);
}

- (void)_queue_handleGetLaunchImage:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->BSBaseXPCServer_opaque[OBJC_IVAR___BSBaseXPCServer__queue]);
  xpc_object_t xdict = v6;
  uint64_t v8 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey(v6, XBLaunchImageProviderMessageKeyCompatibilityInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey(v6, XBLaunchImageProviderMessageKeyLaunchRequest);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v10);
  LODWORD(v11) = xpc_dictionary_get_BOOL(v6, XBLaunchImageProviderMessageKeyCreateCaptureInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 connection]);
  uint64_t v13 = BSPIDForXPCConnection();
  uint64_t v14 = BSProcessDescriptionForPID(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  id v16 = sub_1000028A8();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Running image request from %{public}@ for %@",  buf,  0x16u);
  }

  v65[0] = 0LL;
  v65[1] = v65;
  v65[2] = 0x2020000000LL;
  int v66 = XBInvalidContextId;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  v72 = sub_100006180;
  v73 = sub_100006190;
  id v74 = 0LL;
  v63[0] = 0LL;
  v63[1] = v63;
  v63[2] = 0x3032000000LL;
  v63[3] = sub_100006180;
  v63[4] = sub_100006190;
  id v64 = 0LL;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v7 connection]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BSAuditToken tokenFromXPCConnection:](&OBJC_CLASS___BSAuditToken, "tokenFromXPCConnection:", v19));

  if (v20) {
    [v20 realToken];
  }
  else {
    memset(v62, 0, sizeof(v62));
  }
  if (BSAuditTokenRepresentsPlatformBinary(v62))
  {
LABEL_8:
    char v21 = (char)v11;
    if ((_DWORD)v11) {
      LOBYTE(v11) = [v20 hasEntitlement:XBApplicationLaunchImageCaarCaptureEntitlement];
    }
    pthread_dependency_init_np(v67, qword_1000115C0, 0LL);
    Main = CFRunLoopGetMain();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006198;
    block[3] = &unk_10000C780;
    char v60 = v21;
    char v61 = (char)v11;
    v56 = v65;
    block[4] = self;
    id v53 = v7;
    id v54 = v48;
    id v11 = v9;
    id v55 = v11;
    v57 = v63;
    v58 = buf;
    v59 = v67;
    CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
    v23 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v23);
    pthread_dependency_wait_np(v67);
    memoryMonitor = self->_memoryMonitor;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
    -[_XBMemoryMonitor recordMemoryForBundleID:](memoryMonitor, "recordMemoryForBundleID:", v25);

    LOBYTE(v11) = v21;
  }

  else
  {
    id v26 = sub_1000028A8();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100007134((uint64_t)v15, v27, v28, v29, v30, v31, v32, v33);
    }

    v34 = objc_alloc(&OBJC_CLASS___XBLaunchImageError);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    v36 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:]( v34,  "initWithCode:bundleID:reason:fatal:",  10LL,  v35,  @"The client is unentitled",  0LL);
    v37 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = v36;
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[BSXPCReply replyForMessage:](&OBJC_CLASS___BSXPCReply, "replyForMessage:", xdict));
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10000625C;
  v50[3] = &unk_10000C7A8;
  v50[4] = v65;
  v50[5] = buf;
  char v51 = (char)v11;
  v50[6] = v63;
  [v38 sendReply:v50];
  v39 = *(void **)(*(void *)&buf[8] + 40LL);
  if (v39)
  {
    if ([v39 isFatal])
    {
      id v44 = sub_1000028A8();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = [*(id *)(*(void *)&buf[8] + 40) code];
        v47 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
        *(_DWORD *)v67 = 134218242;
        id v68 = v46;
        __int16 v69 = 2114;
        v70 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "XBLaunchImageProviderServer encountered a fatal error with code: %ld during launch image generation for bundleID: %{public}@",  v67,  0x16u);
      }

      exit(0);
    }

    id v40 = sub_1000028A8();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = [*(id *)(*(void *)&buf[8] + 40) code];
      v43 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
      *(_DWORD *)v67 = 134218242;
      id v68 = v42;
      __int16 v69 = 2114;
      v70 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "XBLaunchImageProviderServer encountered an error with code: %ld during launch image generation for bundleID: %{public}@",  v67,  0x16u);
    }
  }

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v65, 8);
}

- (unsigned)_onMain_createLaunchWindowForClient:(id)a3 withLaunchRequest:(id)a4 appInfo:(id)a5 captureInfo:(id *)a6 captureOptions:(int64_t)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v17 = sub_1000028A8();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v34 = 67109376;
    *(_DWORD *)v35 = qos_class_self();
    *(_WORD *)&v35[4] = 1024;
    *(_DWORD *)&v35[6] = BSPthreadGetCurrentPriority();
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Running on main thread at QoS %d with priority %d.",  (uint8_t *)&v34,  0xEu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchImageProviderServer _transactionWorkForClient:](self, "_transactionWorkForClient:", v16));

  char v21 = (void *)objc_claimAutoreleasedReturnValue([v20 contextWrapper]);
  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[XBLaunchImageContextWrapper contextWrapperForApplicationWithCompatibilityInfo:launchRequest:captureOptions:]( &OBJC_CLASS___XBLaunchImageContextWrapper,  "contextWrapperForApplicationWithCompatibilityInfo:launchRequest:captureOptions:",  v15,  v14,  a7));
    [v20 setContextWrapper:v22];
    if (!a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  v22 = v21;
  [v21 updateLaunchRequest:v14];
  if (a6) {
LABEL_5:
  }
    *a6 = (id)objc_claimAutoreleasedReturnValue([v22 captureInformation]);
LABEL_6:
  unsigned int v23 = XBInvalidContextId;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v22 error]);
  if (v24 || (unsigned int v28 = [v22 contextID]) == 0 || v23 == v28)
  {
    [v22 invalidate];
    [v20 setContextWrapper:0];
    id v25 = sub_1000028A8();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
      int v34 = 138412546;
      *(void *)v35 = v27;
      *(_WORD *)&v35[8] = 2112;
      double v36 = *(double *)&v24;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@] launch image generation failed with error: %@",  (uint8_t *)&v34,  0x16u);
    }

    if (a8 && v24) {
      *a8 = v24;
    }
  }

  else
  {
    unsigned int v23 = [v22 contextID];
    id v29 = sub_1000028A8();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
      [v19 timeIntervalSinceNow];
      int v34 = 138412546;
      *(void *)v35 = v31;
      *(_WORD *)&v35[8] = 2048;
      double v36 = -v32;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[%@] launch image generation completed after %.3fs",  (uint8_t *)&v34,  0x16u);
    }
  }

  return v23;
}

- (id)_transactionWorkForClient:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_accessLock_clientTransactionWorkMap, "objectForKey:", v5));

  os_unfair_lock_unlock(p_accessLock);
  return v6;
}

- (void)_setTransactionWork:(id)a3 forClient:(id)a4
{
  p_accessLock = &self->_accessLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[NSMapTable setObject:forKey:](self->_accessLock_clientTransactionWorkMap, "setObject:forKey:", v8, v7);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_removeTransactionWorkForClient:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[NSMapTable removeObjectForKey:](self->_accessLock_clientTransactionWorkMap, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void).cxx_destruct
{
}

@end