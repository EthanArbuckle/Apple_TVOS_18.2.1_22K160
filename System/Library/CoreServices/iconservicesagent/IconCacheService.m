@interface IconCacheService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ClearCacheOperation)clearOperation;
- (ISMutableIconCache)iconCache;
- (IconCacheService)initWithServiceName:(id)a3;
- (NSString)serviceName;
- (NSXPCListener)listener;
- (OS_dispatch_source)clearTimer;
- (OS_dispatch_workloop)workLoop;
- (id)generateStoreUnitWithRequest:(id)a3 validationToken:(id *)a4;
- (os_unfair_lock_s)clearOperationLock;
- (void)clearCache;
- (void)clearCachedItemsForBundeID:(id)a3 reply:(id)a4;
- (void)fetchCacheConfigurationWithReply:(id)a3;
- (void)generateImageWithRequest:(id)a3 reply:(id)a4;
- (void)scheduleCacheOperation:(unint64_t)a3;
- (void)start;
@end

@implementation IconCacheService

- (IconCacheService)initWithServiceName:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IconCacheService;
  v5 = -[IconCacheService init](&v24, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = v6;

    dispatch_workloop_t v8 = dispatch_workloop_create("iconservicesagent workloop");
    workLoop = v5->_workLoop;
    v5->_workLoop = (OS_dispatch_workloop *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ISDefaults sharedInstance](&OBJC_CLASS___ISDefaults, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cacheURL]);

    objc_initWeak(&location, v5);
    v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
    dispatch_source_set_timer(v12, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = sub_100003480;
    v21 = &unk_1000083A8;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v12, &v18);
    objc_storeStrong((id *)&v5->_clearTimer, v12);
    dispatch_resume(v12);
    clearOperation = v5->_clearOperation;
    v5->_clearOperation = 0LL;

    v5->_clearOperationLock._os_unfair_lock_opaque = 0;
    v14 = objc_alloc(&OBJC_CLASS___ISMutableIconCache);
    v15 = -[ISMutableIconCache initWithURL:](v14, "initWithURL:", v11, v18, v19, v20, v21);
    iconCache = v5->_iconCache;
    v5->_iconCache = v15;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)start
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_listener)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[IconCacheService serviceName](obj, "serviceName"));

    if (v2)
    {
      v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
      id v4 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(-[IconCacheService serviceName](obj, "serviceName"));
      v5 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", v4);
      listener = obj->_listener;
      obj->_listener = v5;
    }

    else
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
      id v4 = obj->_listener;
      obj->_listener = (NSXPCListener *)v7;
    }

    -[NSXPCListener setDelegate:](obj->_listener, "setDelegate:");
    -[NSXPCListener resume](obj->_listener, "resume");
  }

  objc_sync_exit(obj);
}

- (void)scheduleCacheOperation:(unint64_t)a3
{
  id v4 = -[ClearCacheOperation initWithCache:operationType:]( objc_alloc(&OBJC_CLASS___ClearCacheOperation),  "initWithCache:operationType:",  self->_iconCache,  a3);
  uint64_t v5 = _ISDefaultLog(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Scheduling: %@ ", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock(&self->_clearOperationLock);
  clearOperation = self->_clearOperation;
  self->_clearOperation = v4;
  dispatch_workloop_t v8 = v4;

  os_unfair_lock_unlock(&self->_clearOperationLock);
  dispatch_source_set_timer((dispatch_source_t)self->_clearTimer, 0x3B9ACA00uLL, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
}

- (void)clearCache
{
  p_clearOperationLock = &self->_clearOperationLock;
  os_unfair_lock_lock(&self->_clearOperationLock);
  id v4 = self->_clearOperation;
  clearOperation = self->_clearOperation;
  self->_clearOperation = 0LL;

  os_unfair_lock_unlock(p_clearOperationLock);
  if (v4)
  {
    uint64_t v7 = _ISDefaultLog(v6);
    dispatch_workloop_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100004E30();
    }

    -[ClearCacheOperation run](v4, "run");
  }
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 32LL, 1);
}

- (ISMutableIconCache)iconCache
{
  return (ISMutableIconCache *)objc_getProperty(self, a2, 56LL, 1);
}

- (OS_dispatch_workloop)workLoop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 64LL, 1);
}

- (OS_dispatch_source)clearTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72LL, 1);
}

- (os_unfair_lock_s)clearOperationLock
{
  return self->_clearOperationLock;
}

- (ClearCacheOperation)clearOperation
{
  return (ClearCacheOperation *)objc_getProperty(self, a2, 80LL, 1);
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _ISDefaultLog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100004E90();
  }

  dispatch_workloop_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ISIconCacheServiceProtocol));
  [v5 setExportedInterface:v8];
  [v5 setExportedObject:self];
  [v5 setInterruptionHandler:&stru_1000083E8];
  [v5 setInvalidationHandler:&stru_100008408];
  [v5 resume];

  return 1;
}

- (void)fetchCacheConfigurationWithReply:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IconCacheService iconCache](self, "iconCache"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cacheURL]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);

  id v8 = v7;
  int v9 = (const char *)[v8 UTF8String];
  if (!realpath_DARWIN_EXTSN(v9, v19))
  {
    uint64_t v10 = _ISDefaultLog(0LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Failed to get the real path for: %s",  (uint8_t *)&v17,  0xCu);
    }
  }

  uint64_t v12 = sandbox_extension_issue_file(APP_SANDBOX_READ, v19, SANDBOX_EXTENSION_CANONICAL);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
    free(v13);
  }

  else
  {
    v14 = 0LL;
  }

  id v15 = objc_alloc_init(&OBJC_CLASS___ISIconCacheConfiguration);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
  [v15 setUrl:v16];

  [v15 setSandboxExtension:v14];
  v4[2](v4, v15);
}

- (void)generateImageWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)os_transaction_create("icon generation");
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v10 = [v9 processIdentifier];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003CFC;
  block[3] = &unk_100008430;
  unsigned int v21 = v10;
  id v17 = v6;
  v18 = self;
  id v19 = v8;
  id v20 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IconCacheService workLoop](self, "workLoop"));
  +[NSXPCConnection _handoffCurrentReplyToQueue:block:]( &OBJC_CLASS___NSXPCConnection,  "_handoffCurrentReplyToQueue:block:",  v15,  v14);
}

- (void)clearCachedItemsForBundeID:(id)a3 reply:(id)a4
{
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (a3) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  -[IconCacheService scheduleCacheOperation:](self, "scheduleCacheOperation:", v6);
  v7[2](v7, 1LL, 0LL);
}

- (id)generateStoreUnitWithRequest:(id)a3 validationToken:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 icon]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 imageDescriptor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v8 digest]);
  id v34 = 0LL;
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 generateImageReturningRecordIdentifiers:&v34]);

  id v32 = v34;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bitmapData]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 digest]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v9 validationToken]);
  *a4 = v12;
  id v13 = [v12 bytes];
  uint64_t v14 = _ISDefaultLog(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    if (v13) {
      sub_1000050B8((uint64_t)v13, (uint64_t)buf, (uint64_t)v7, v15);
    }
    else {
      sub_100005054(buf, (uint64_t)v7, v15);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IconCacheService iconCache](self, "iconCache"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 store]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 addUnitWithData:v10]);

  if ([v18 isValid])
  {
    [v8 scale];
    unsigned int v20 = v19;
    [v9 iconSize];
    uint64_t v22 = v21;
    [v9 minimumSize];
    uint64_t v24 = v23;
    [v9 iconSize];
    double v26 = v25;
    *(void *)&__int128 v47 = v22;
    DWORD2(v47) = v20;
    [v33 getUUIDBytes:(char *)&v47 + 12];
    *(void *)&__int128 v46 = v24;
    *((double *)&v46 + 1) = v26;
    [v11 getUUIDBytes:buf];
    v27 = (void *)objc_claimAutoreleasedReturnValue([v18 UUID]);
    [v27 getUUIDBytes:(char *)&v48 + 12];

    [*a4 getBytes:(char *)v49 + 12 length:40];
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[IconCacheService iconCache](self, "iconCache"));
    [v28 registerRecordIdentifiers:v32 asSourceForUnit:v18];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[IconCacheService iconCache](self, "iconCache"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 mutableStoreIndex]);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100004498;
    v35[3] = &unk_100008480;
    v35[4] = self;
    __int128 v41 = v49[0];
    __int128 v42 = v49[1];
    __int128 v43 = v49[2];
    int v44 = v50;
    __int128 v37 = *(_OWORD *)buf;
    __int128 v38 = v46;
    __int128 v39 = v47;
    __int128 v40 = v48;
    id v36 = v11;
    [v30 performBlock:v35];
  }

  return v18;
}

@end