@interface CDDCloudKitServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CDDCloudKitServer)initWithListener:(id)a3 configuration:(id)a4;
- (CDDCloudKitServerConfiguration)configuration;
- (CKScheduler)scheduler;
- (NSXPCListener)listener;
- (PFCloudKitContainerProvider)containerProvider;
- (uint64_t)createRealPathForPath:(void *)a3 error:;
- (void)dealloc;
- (void)finishedActivity:(id)a3 withResult:(id)a4 inManagedObjectContext:(id)a5;
- (void)handleMessage:(id)a3 reply:(id)a4;
- (void)runActivity:(uint64_t)a3 completionHandler:;
- (void)setUp;
- (void)tearDown;
@end

@implementation CDDCloudKitServer

- (CDDCloudKitServer)initWithListener:(id)a3 configuration:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CDDCloudKitServer;
  v6 = -[CDDCloudKitServer init](&v12, sel_init);
  if (v6)
  {
    v6->_configuration = (CDDCloudKitServerConfiguration *)[a4 copy];
    if (a3)
    {
      v7 = (NSXPCListener *)a3;
    }

    else
    {
      id v8 = objc_alloc(MEMORY[0x189607B50]);
      configuration = v6->_configuration;
      if (configuration) {
        machServiceName = configuration->_machServiceName;
      }
      else {
        machServiceName = 0LL;
      }
      v7 = (NSXPCListener *)[v8 initWithMachServiceName:machServiceName];
    }

    v6->_listener = v7;
    -[NSXPCListener setDelegate:](v7, "setDelegate:", v6);
    v6->_initialized = 0;
    v6->_initializationGroup = (OS_dispatch_group *)dispatch_group_create();
    v6->_containerProvider = objc_alloc_init(&OBJC_CLASS___PFCloudKitContainerProvider);
    v6->_scheduler = (CKScheduler *)(id)-[objc_class sharedScheduler]( getCloudKitCKSchedulerClass(),  "sharedScheduler");
  }

  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_initializationGroup);
  self->_lastInitializationError = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CDDCloudKitServer;
  -[CDDCloudKitServer dealloc](&v3, sel_dealloc);
}

- (void)setUp
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__CDDCloudKitServer_setUp__block_invoke;
  block[3] = &unk_189EA7758;
  block[4] = self;
  dispatch_async(global_queue, block);
  -[NSXPCListener resume](self->_listener, "resume");
}

void __26__CDDCloudKitServer_setUp__block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    *(_BYTE *)(v3 + 8) = 0;

    *(void *)(v3 + 48) = 0LL;
    id v4 = +[CDDCloudKitMetadataModel newMetadataModel](&OBJC_CLASS___CDDCloudKitMetadataModel, "newMetadataModel");
    *(void *)(v3 + 32) = -[NSPersistentContainer initWithName:managedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentContainer),  "initWithName:managedObjectModel:",  @"CDDCloudKitServer",  v4);
    uint64_t v5 = *(void *)(v3 + 24);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 8);
    }
    else {
      uint64_t v6 = 0LL;
    }
    v7 = (void *)[MEMORY[0x189604030] fileURLWithPath:v6];
    id v8 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 32), "persistentStoreDescriptions"), "lastObject");
    objc_msgSend(v8, "setURL:", objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", @"cdck.sqlite", 0));

    id v30 = 0LL;
    objc_opt_self();
    if (+[NSCloudKitMirroringDelegate checkAndCreateDirectoryAtURL:wipeIfExists:error:]( &OBJC_CLASS___NSCloudKitMirroringDelegate,  "checkAndCreateDirectoryAtURL:wipeIfExists:error:",  v7,  0LL,  &v30))
    {
      uint64_t v26 = 0LL;
      v27 = &v26;
      uint64_t v28 = 0x2020000000LL;
      char v29 = 1;
      id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
      v16 = *(void **)(v3 + 32);
      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 3221225472LL;
      v25[2] = __32__CDDCloudKitServer__setUpAsync__block_invoke;
      v25[3] = &unk_189EA9690;
      v25[5] = v8;
      v25[6] = &v26;
      v25[4] = v15;
      [v16 loadPersistentStoresWithCompletionHandler:v25];
      if (*((_BYTE *)v27 + 24))
      {
        *(_BYTE *)(v3 + 8) = 1;
      }

      else
      {
        _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to load persistent stores for CloudKit integration: %@",  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)v15);
        id v23 = objc_alloc(MEMORY[0x189607870]);
        uint64_t v31 = *MEMORY[0x1896075F0];
        v32[0] = [NSString stringWithFormat:@"Failed to initialize storage:\n%@", objc_msgSend(v15, "description")];
        uint64_t v24 = [MEMORY[0x189603F68] dictionaryWithObjects:v32 forKeys:&v31 count:1];
        *(void *)(v3 + 48) = [v23 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v24];
      }

      _Block_object_dispose(&v26, 8);
    }

    else
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to create directory for persistent storage: %@",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)v30);
      *(void *)(v3 + 48) = v30;
    }

    dispatch_group_leave(*(dispatch_group_t *)(v3 + 40));
  }

  objc_autoreleasePoolPop(v2);
}

- (void)tearDown
{
}

uint64_t __32__CDDCloudKitServer__setUpAsync__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL) = 0;
    return objc_msgSend( *(id *)(result + 32),  "setObject:forKey:",  a3,  objc_msgSend((id)objc_msgSend(*(id *)(result + 40), "URL"), "path"));
  }

  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  listener = self->_listener;
  if (listener == a3)
  {
    [a4 setExportedObject:self];
    objc_msgSend( a4,  "setExportedInterface:",  objc_msgSend(MEMORY[0x189607B48], "interfaceWithProtocol:", &unk_18C6A6DB8));
    [a4 resume];
  }

  else
  {
    uint64_t v6 = [NSString stringWithUTF8String:"Called to accept connection for unknown listener: %@", a4];
    _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    uint64_t v13 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = a3;
      _os_log_fault_impl( &dword_186681000,  v13,  OS_LOG_TYPE_FAULT,  "CoreData: Called to accept connection for unknown listener: %@",  buf,  0xCu);
    }
  }

  return listener == a3;
}

- (void)handleMessage:(id)a3 reply:(id)a4
{
  uint64_t v120 = *MEMORY[0x1895F89C0];
  initializationGroup = self->_initializationGroup;
  dispatch_time_t v8 = dispatch_time(0LL, 3000000000LL);
  uint64_t v9 = dispatch_group_wait((dispatch_group_t)initializationGroup, v8);
  uint64_t v10 = (void *)MEMORY[0x186E3E5D8]();
  if (v9)
  {
    uint64_t v11 = objc_alloc(&OBJC_CLASS___CDDCloudKitResponse);
    uint64_t v12 = (void *)MEMORY[0x189607870];
    uint64_t v101 = *MEMORY[0x1896075F0];
    v102 = @"The server was unable to process the request because it timed out waiting for initialization.";
    uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:]( v11,  a3,  0,  (void *)[v12 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v13]);
LABEL_3:
    id v15 = v14;
    goto LABEL_4;
  }

  if (!self->_initialized)
  {
    v39 = objc_alloc(&OBJC_CLASS___CDDCloudKitResponse);
    v40 = (void *)MEMORY[0x189607870];
    uint64_t v103 = *MEMORY[0x1896075F0];
    v41 = (void *)NSString;
    v90 = (NSString *)-[NSError description](self->_lastInitializationError, "description");
    uint64_t v104 = [v41 stringWithFormat:@"The server is not initialized due to: %@"];
    uint64_t v42 = [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:]( v39,  a3,  0,  (void *)[v40 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v42]);
    goto LABEL_3;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
    {
      v16 = (void *)*((void *)a3 + 3);
      id v17 = (void *)*((void *)a3 + 4);
    }

    else
    {
      v16 = 0LL;
      id v17 = 0LL;
    }

    if ((int)[v16 fileDescriptor] < 1)
    {
      v60 = (void *)MEMORY[0x189607870];
      uint64_t v111 = *MEMORY[0x1896075F0];
      v112 = @"Provided file handle is invalid, it doesn't point to the requested store.";
      uint64_t v61 = [MEMORY[0x189603F68] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      uint64_t v22 = [v60 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v61];
      goto LABEL_44;
    }

    uint64_t v18 = (NSString *)stat((const char *)[v17 fileSystemRepresentation], &v119);
    if ((_DWORD)v18)
    {
      __error();
      uint64_t v19 = (void *)MEMORY[0x189607870];
      uint64_t v20 = *__error();
      uint64_t v113 = *MEMORY[0x1896075F0];
      v90 = v18;
      uint64_t v114 = [NSString stringWithFormat:@"Failed to stat file at url (%d:%d): %@"];
      uint64_t v21 = [MEMORY[0x189603F68] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      uint64_t v22 = [v19 errorWithDomain:*MEMORY[0x189607688] code:v20 userInfo:v21];
      goto LABEL_44;
    }

    v62 = (NSString *)fstat([v16 fileDescriptor], &v100);
    if ((_DWORD)v62)
    {
      __error();
      v63 = (void *)MEMORY[0x189607870];
      uint64_t v64 = *__error();
      uint64_t v115 = *MEMORY[0x1896075F0];
      v65 = (void *)NSString;
      [v16 fileDescriptor];
      v90 = v62;
      uint64_t v116 = [v65 stringWithFormat:@"Failed to fstat file descriptor (%d:%d): %d"];
      uint64_t v66 = [MEMORY[0x189603F68] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
      uint64_t v22 = [v63 errorWithDomain:*MEMORY[0x189607688] code:v64 userInfo:v66];
      goto LABEL_44;
    }

    if (v119.st_ino != v100.st_ino || v119.st_dev != v100.st_dev)
    {
      v75 = (void *)MEMORY[0x189607870];
      uint64_t v117 = *MEMORY[0x1896075F0];
      v118 = @"Provided file handle is invalid, it doesn't point to the requested store.";
      uint64_t v76 = [MEMORY[0x189603F68] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
      uint64_t v22 = [v75 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v76];
LABEL_44:
      v77 = (void *)v22;
      if (!v22)
      {
        uint64_t v78 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v78,  v79,  v80,  v81,  v82,  v83,  v84,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/coredatad/CloudKit/CDDCloudKitServer.m");
        v85 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          v119.st_dev = 136315394;
          *(void *)&v119.st_mode = "/Library/Caches/com.apple.xbs/Sources/Persistence/coredatad/CloudKit/CDDCloudKitServer.m";
          WORD2(v119.st_ino) = 1024;
          *(_DWORD *)((char *)&v119.st_ino + 6) = 668;
          _os_log_fault_impl( &dword_186681000,  v85,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  (uint8_t *)&v119,  0x12u);
        }
      }

      uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:]( objc_alloc(&OBJC_CLASS___CDDCloudKitResponse),  a3,  0,  v77);
      goto LABEL_3;
    }

    v67 = (void *)[MEMORY[0x1896078A8] defaultManager];
    if (a3) {
      uint64_t v68 = *((void *)a3 + 4);
    }
    else {
      uint64_t v68 = 0LL;
    }
    if (![v67 isWritableFileAtPath:v68])
    {
      v86 = objc_alloc(&OBJC_CLASS___CDDCloudKitResponse);
      v87 = (void *)MEMORY[0x189607870];
      uint64_t v107 = *MEMORY[0x1896075F0];
      v108 = @"Provided file handle is invalid, the file is not writable.";
      uint64_t v88 = [MEMORY[0x189603F68] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:]( v86,  a3,  0,  (void *)[v87 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v88]);
      goto LABEL_3;
    }

    *(void *)&v100.st_dev = 0LL;
    v100.st_ino = (__darwin_ino64_t)&v100;
    *(void *)&v100.st_uid = 0x2020000000LL;
    LOBYTE(v100.st_rdev) = 0;
    *(void *)&v119.st_dev = 0LL;
    v119.st_ino = (__darwin_ino64_t)&v119;
    *(void *)&v119.st_uid = 0x3052000000LL;
    *(void *)&v119.st_rdev = __Block_byref_object_copy__21;
    v119.st_atimespec.tv_sec = (__darwin_time_t)__Block_byref_object_dispose__21;
    v119.st_atimespec.tv_nsec = 0LL;
    v69 = -[NSPersistentContainer newBackgroundContext](self->_metadataContainer, "newBackgroundContext");
    uint64_t v91 = MEMORY[0x1895F87A8];
    uint64_t v92 = 3221225472LL;
    uint64_t v93 = (uint64_t)__48__CDDCloudKitServer__handleRegistrationMessage___block_invoke;
    v94 = &unk_189EA96B8;
    v95 = self;
    id v96 = a3;
    v97 = v69;
    v98 = &v119;
    v99 = &v100;
    -[NSManagedObjectContext performBlockAndWait:](v69, "performBlockAndWait:", &v91);

    uint64_t v70 = *(void *)(v119.st_ino + 40);
    if (v70)
    {
      v71 = (void *)MEMORY[0x189607870];
      uint64_t v109 = *MEMORY[0x1896075F0];
      if (a3) {
        uint64_t v72 = *((void *)a3 + 1);
      }
      else {
        uint64_t v72 = 0LL;
      }
      uint64_t v110 = [NSString stringWithFormat:@"Failed to register store for message '%@' due to the following error: %@", v72, v70];
      uint64_t v73 = [MEMORY[0x189603F68] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      v74 = (void *)[v71 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v73];
    }

    else
    {
      v74 = 0LL;
    }

    v89 = objc_alloc(&OBJC_CLASS___CDDCloudKitResponse);
    id v15 = -[CDDCloudKitResponse initWithMessage:success:error:](v89, a3, *(_BYTE *)(v100.st_ino + 24), v74);

    *(void *)(v119.st_ino + 40) = 0LL;
    v54 = &v119;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v55 = objc_alloc(&OBJC_CLASS___CDDCloudKitResponse);
      v56 = (void *)MEMORY[0x189607870];
      uint64_t v105 = *MEMORY[0x1896075F0];
      v57 = (void *)NSString;
      v58 = (objc_class *)objc_opt_class();
      v90 = NSStringFromClass(v58);
      uint64_t v106 = [v57 stringWithFormat:@"Unknown message: %@"];
      uint64_t v59 = [MEMORY[0x189603F68] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:]( v55,  a3,  0,  (void *)[v56 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v59]);
      goto LABEL_3;
    }

    *(void *)&v100.st_dev = 0LL;
    v100.st_ino = (__darwin_ino64_t)&v100;
    *(void *)&v100.st_uid = 0x3052000000LL;
    *(void *)&v100.st_rdev = __Block_byref_object_copy__21;
    v100.st_atimespec.tv_sec = (__darwin_time_t)__Block_byref_object_dispose__21;
    v100.st_atimespec.tv_nsec = 0LL;
    uint64_t v91 = 0LL;
    uint64_t v92 = (uint64_t)&v91;
    uint64_t v93 = 0x2020000000LL;
    LOBYTE(v94) = 0;
    v43 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v44 = __ckLoggingOverride;
    }
    uint64_t v45 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Asked to schedule activity for store: %@"];
    _NSCoreDataLog(v44, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]");
    objc_autoreleasePoolPop(v43);
    v52 = -[NSPersistentContainer newBackgroundContext](self->_metadataContainer, "newBackgroundContext");
    *(void *)&v119.st_dev = MEMORY[0x1895F87A8];
    v119.st_ino = 3221225472LL;
    *(void *)&v119.st_uid = __44__CDDCloudKitServer__handleScheduleMessage___block_invoke;
    *(void *)&v119.st_rdev = &unk_189EA96B8;
    v119.st_atimespec.tv_sec = (__darwin_time_t)self;
    v119.st_atimespec.tv_nsec = (uint64_t)a3;
    v119.st_mtimespec.tv_sec = (__darwin_time_t)v52;
    v119.st_mtimespec.tv_nsec = (uint64_t)&v100;
    v119.st_ctimespec.tv_sec = (__darwin_time_t)&v91;
    -[NSManagedObjectContext performBlockAndWait:](v52, "performBlockAndWait:", &v119);

    v53 = objc_alloc(&OBJC_CLASS___CDDCloudKitResponse);
    id v15 = -[CDDCloudKitResponse initWithMessage:success:error:]( v53,  a3,  *(_BYTE *)(v92 + 24),  *(void **)(v100.st_ino + 40));

    *(void *)(v100.st_ino + 40) = 0LL;
    v54 = (stat *)&v91;
  }

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v100, 8);
LABEL_4:
  objc_autoreleasePoolPop(v10);
  if (v15)
  {
    if (*((_BYTE *)v15 + 8) || v15[3]) {
      goto LABEL_18;
    }
  }

  else
  {
    uint64_t v23 = [NSString stringWithUTF8String:"CloudKit Server is attempting to send back a nil response: %@"];
    _NSCoreDataLog(17LL, v23, v24, v25, v26, v27, v28, v29, (uint64_t)a3);
    id v30 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v119.st_dev = 138412290;
      *(void *)&v119.st_mode = a3;
      _os_log_fault_impl( &dword_186681000,  v30,  OS_LOG_TYPE_FAULT,  "CoreData: CloudKit Server is attempting to send back a nil response: %@",  (uint8_t *)&v119,  0xCu);
    }
  }

  uint64_t v31 = [NSString stringWithUTF8String:"Bug in CoreData CloudKit Server: Response success == NO but error is also nil."];
  _NSCoreDataLog(17LL, v31, v32, v33, v34, v35, v36, v37, (uint64_t)v90);
  v38 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v119.st_dev) = 0;
    _os_log_fault_impl( &dword_186681000,  v38,  OS_LOG_TYPE_FAULT,  "CoreData: Bug in CoreData CloudKit Server: Response success == NO but error is also nil.",  (uint8_t *)&v119,  2u);
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

void __48__CDDCloudKitServer__handleRegistrationMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    id v4 = *(void **)(v3 + 32);
  }
  else {
    id v4 = 0LL;
  }
  uint64_t v5 = -[CDDCloudKitServer createRealPathForPath:error:]( v2,  v4,  (void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[CDDCloudKitRegisteredClient entityName](&OBJC_CLASS___CDDCloudKitRegisteredClient, "entityName"));
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = *(void *)(v8 + 16);
      uint64_t v8 = *(void *)(v8 + 56);
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    -[NSFetchRequest setPredicate:]( v7,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"bundleIdentifier = %@ AND storeConfigurationName = %@ AND storePath = %@", v9, v8, v6]);
    id v21 = 0LL;
    uint64_t v10 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v7 error:&v21];
    if (!v10) {
      goto LABEL_23;
    }
    if ([v10 count]) {
      goto LABEL_21;
    }
    uint64_t v11 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[CDDCloudKitRegisteredClient entityName](&OBJC_CLASS___CDDCloudKitRegisteredClient, "entityName"),  *(void *)(a1 + 48));
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = v13 ? *(void *)(v13 + 16) : 0LL;
    -[NSManagedObject setBundleIdentifier:](v11, "setBundleIdentifier:", v14);
    -[NSManagedObject setStorePath:](v12, "setStorePath:", v6);
    id v15 = *(void **)(a1 + 40);
    if (!v15) {
      goto LABEL_28;
    }
    if (v15[5])
    {
      -[NSManagedObject setFileProtectionType:](v12, "setFileProtectionType:");
      id v15 = *(void **)(a1 + 40);
      if (!v15) {
        goto LABEL_28;
      }
    }

    v16 = (void *)v15[7];
    if (!v16) {
      goto LABEL_19;
    }
    char v17 = [v16 isEqualToString:@"PF_DEFAULT_CONFIGURATION_NAME"];
    id v15 = *(void **)(a1 + 40);
    if ((v17 & 1) == 0)
    {
      if (v15) {
        uint64_t v18 = v15[7];
      }
      else {
        uint64_t v18 = 0LL;
      }
      -[NSManagedObject setStoreConfigurationName:](v12, "setStoreConfigurationName:", v18);
      id v15 = *(void **)(a1 + 40);
    }

    if (v15) {
LABEL_19:
    }
      uint64_t v19 = v15[8];
    else {
LABEL_28:
    }
      uint64_t v19 = 0LL;
    -[NSManagedObject setContainerIdentifier:](v12, "setContainerIdentifier:", v19);
    if ([*(id *)(a1 + 48) save:&v21]) {
LABEL_21:
    }
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    else {
LABEL_23:
    }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = v21;
  }

  else
  {
    id v20 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  }

- (uint64_t)createRealPathForPath:(void *)a3 error:
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v4 = realpath_DARWIN_EXTSN((const char *)[a2 UTF8String], 0);
  if (v4)
  {
    uint64_t v5 = [objc_alloc(NSString) initWithCString:v4 encoding:4];
  }

  else if (a3)
  {
    uint64_t v6 = *MEMORY[0x189607460];
    uint64_t v8 = *MEMORY[0x1896075F0];
    v9[0] = @"Failed to get a real path for the provided store path.";
    uint64_t v5 = 0LL;
    *a3 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v6,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  free(v4);
  return v5;
}

void __44__CDDCloudKitServer__handleScheduleMessage___block_invoke(uint64_t a1)
{
  uint64_t v113 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    id v4 = *(void **)(v3 + 24);
  }
  else {
    id v4 = 0LL;
  }
  uint64_t v5 = (NSManagedObject *)-[CDDCloudKitServer createRealPathForPath:error:]( v2,  v4,  (void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
  if (v5)
  {
    uint64_t v6 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[CDDCloudKitRegisteredClient entityName](&OBJC_CLASS___CDDCloudKitRegisteredClient, "entityName"));
    uint64_t v91 = v5;
    -[NSFetchRequest setPredicate:]( v6,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"storePath = %@", v5]);
    id v99 = 0LL;
    uint64_t v92 = a1;
    uint64_t v7 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v6 error:&v99];
    uint64_t v8 = v7;
    if (v7)
    {
      if ([v7 count])
      {
        v90 = (NSManagedObject *)[v8 lastObject];
        if ((unint64_t)[v8 count] >= 2)
        {
          uint64_t v9 = [NSString stringWithUTF8String:"Multiple clients registered for the same store path: %@\n%@"];
          v87 = v8;
          _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v5);
          v16 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v110 = v91;
            __int16 v111 = 2112;
            v112 = v8;
            _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Multiple clients registered for the same store path: %@\n%@",  buf,  0x16u);
          }
        }

        __int128 v97 = 0u;
        __int128 v98 = 0u;
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        char v17 = (void *)-[NSManagedObject scheduledActivities](v90, "scheduledActivities");
        uint64_t v18 = 0LL;
        uint64_t v19 = 0LL;
        uint64_t v20 = [v17 countByEnumeratingWithState:&v95 objects:v108 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v96;
          do
          {
            for (uint64_t i = 0LL; i != v20; ++i)
            {
              if (*(void *)v96 != v21) {
                objc_enumerationMutation(v17);
              }
              uint64_t v23 = *(NSManagedObject **)(*((void *)&v95 + 1) + 8 * i);
              uint64_t v24 = -[NSManagedObject activityType](v23, "activityType");
              if (v24 == 1)
              {
                uint64_t v19 = v23;
              }

              else if (v24 == 2)
              {
                uint64_t v18 = v23;
              }

              else
              {
                uint64_t v25 = [NSString stringWithUTF8String:"Found unknown activity type: %@"];
                _NSCoreDataLog(17LL, v25, v26, v27, v28, v29, v30, v31, (uint64_t)v23);
                uint64_t v32 = (os_log_s *)__pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v110 = v23;
                  _os_log_fault_impl( &dword_186681000,  v32,  OS_LOG_TYPE_FAULT,  "CoreData: Found unknown activity type: %@",  buf,  0xCu);
                }
              }
            }

            uint64_t v20 = [v17 countByEnumeratingWithState:&v95 objects:v108 count:16];
          }

          while (v20);
        }

        uint64_t v33 = objc_msgSend( (id)objc_msgSend(*(id *)(v92 + 32), "containerProvider"),  "containerWithIdentifier:",  -[NSManagedObject containerIdentifier](v90, "containerIdentifier"));
        if (v33)
        {
          uint64_t v34 = *(void *)(v92 + 40);
          if (!v34) {
            goto LABEL_42;
          }
          uint64_t v35 = *(void *)(v34 + 16);
          if (v35 != 2 || v18)
          {
            if (v35 != 1 || v19) {
              goto LABEL_42;
            }
            uint64_t v19 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[CDDCloudKitScheduledActivity entityName](&OBJC_CLASS___CDDCloudKitScheduledActivity, "entityName"),  *(void *)(v92 + 48));
            -[NSManagedObject setActivityUUID:](v19, "setActivityUUID:", [MEMORY[0x189607AB8] UUID]);
            -[NSManagedObject setActivityType:](v19, "setActivityType:", 1LL);
            -[NSManagedObject setRegisteredClient:](v19, "setRegisteredClient:", v90);
            -[NSManagedObject setScheduledAt:](v19, "setScheduledAt:", [MEMORY[0x189603F50] date]);
            uint64_t v46 = objc_msgSend( @"com.apple.coredatad.cloudkit.",  "stringByAppendingString:",  objc_msgSend((id)-[NSManagedObject activityUUID](v19, "activityUUID"), "UUIDString"));
            uint64_t v37 = (void *)[objc_alloc((Class)getCloudKitCKSchedulerActivityClass[0]()) initWithIdentifier:v46 container:v33 priority:2];
            uint64_t v106 = [NSString stringWithUTF8String:*MEMORY[0x1895F8700]];
            uint64_t v107 = MEMORY[0x1895F9178];
            objc_msgSend( v37,  "setAdditionalXPCActivityCriteria:",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1));
            -[NSManagedObject populateFromCriteria:]( v19,  "populateFromCriteria:",  [v37 additionalXPCActivityCriteria]);
          }

          else
          {
            uint64_t v18 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  +[CDDCloudKitScheduledActivity entityName](&OBJC_CLASS___CDDCloudKitScheduledActivity, "entityName"),  *(void *)(v92 + 48));
            -[NSManagedObject setActivityUUID:](v18, "setActivityUUID:", [MEMORY[0x189607AB8] UUID]);
            -[NSManagedObject setActivityType:](v18, "setActivityType:", 2LL);
            -[NSManagedObject setRegisteredClient:](v18, "setRegisteredClient:", v90);
            -[NSManagedObject setScheduledAt:](v18, "setScheduledAt:", [MEMORY[0x189603F50] date]);
            uint64_t v36 = objc_msgSend( @"com.apple.coredatad.cloudkit.",  "stringByAppendingString:",  objc_msgSend((id)-[NSManagedObject activityUUID](v18, "activityUUID"), "UUIDString"));
            uint64_t v37 = (void *)[objc_alloc((Class)getCloudKitCKSchedulerActivityClass[0]()) initWithIdentifier:v36 container:v33 priority:2];
          }

          if (v37)
          {
            uint64_t v47 = (NSManagedObject *)[*(id *)(v92 + 32) scheduler];
            uint64_t v48 = (void *)MEMORY[0x186E3E5D8]();
            else {
              uint64_t v49 = __ckLoggingOverride;
            }
            uint64_t v50 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Scheduling activity: %@ for client: %@ with scheduler: %@"];
            uint64_t v88 = v90;
            v89 = v47;
            _NSCoreDataLog( v49,  v50,  v51,  v52,  v53,  v54,  v55,  v56,  (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
            objc_autoreleasePoolPop(v48);
            objc_initWeak((id *)buf, *(id *)(v92 + 32));
            uint64_t v57 = [v37 identifier];
            v93[0] = MEMORY[0x1895F87A8];
            v93[1] = 3221225472LL;
            v93[2] = __44__CDDCloudKitServer__handleScheduleMessage___block_invoke_2;
            v93[3] = &unk_189EA96E0;
            objc_copyWeak(&v94, (id *)buf);
            v93[4] = *(void *)(v92 + 32);
            -[NSManagedObject registerActivityIdentifier:handler:](v47, "registerActivityIdentifier:handler:", v57, v93);
            -[NSManagedObject submitActivity:](v47, "submitActivity:", v37);
            objc_destroyWeak(&v94);
            objc_destroyWeak((id *)buf);
LABEL_46:
            int v67 = [*(id *)(v92 + 48) hasChanges];
            uint64_t v68 = (void *)MEMORY[0x186E3E5D8]();
            else {
              uint64_t v69 = __ckLoggingOverride;
            }
            if (v67)
            {
              uint64_t v70 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Saving changes for client: %@"];
              _NSCoreDataLog( v69,  v70,  v71,  v72,  v73,  v74,  v75,  v76,  (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
              objc_autoreleasePoolPop(v68);
              *(_BYTE *)(*(void *)(*(void *)(v92 + 64) + 8) + 24) = [*(id *)(v92 + 48) save:&v99];
              if (!*(_BYTE *)(*(void *)(*(void *)(v92 + 64) + 8LL) + 24LL))
              {
                id v77 = objc_alloc(MEMORY[0x189607870]);
                uint64_t v104 = *MEMORY[0x1896075F0];
                uint64_t v105 = [NSString stringWithFormat:@"Failed to save changes: %@", v99, 400, v90, v88, v89];
                uint64_t v78 = [MEMORY[0x189603F68] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
                *(void *)(*(void *)(*(void *)(v92 + 56) + 8) + 40) = [v77 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v78];
              }
            }

            else
            {
              uint64_t v79 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"No change to save for client: %@"];
              _NSCoreDataLog( v69,  v79,  v80,  v81,  v82,  v83,  v84,  v85,  (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
              objc_autoreleasePoolPop(v68);
              *(_BYTE *)(*(void *)(*(void *)(v92 + 64) + 8LL) + 24LL) = 1;
            }

            goto LABEL_57;
          }

void __44__CDDCloudKitServer__handleScheduleMessage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    -[CDDCloudKitServer runActivity:completionHandler:](*(void *)(a1 + 32), a2, a3);
  }

  else
  {
    uint64_t v7 = [NSString stringWithUTF8String:"Asked to run activity but no server: %@"];
    _NSCoreDataLog(17LL, v7, v8, v9, v10, v11, v12, v13, (uint64_t)a2);
    uint64_t v14 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = a2;
      _os_log_fault_impl( &dword_186681000,  v14,  OS_LOG_TYPE_FAULT,  "CoreData: Asked to run activity but no server: %@",  buf,  0xCu);
    }
  }
}

- (void)runActivity:(uint64_t)a3 completionHandler:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v6 = *(dispatch_group_s **)(a1 + 40);
    dispatch_time_t v7 = dispatch_time(0LL, 3000000000LL);
    if (dispatch_group_wait(v6, v7))
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Failed to handle activity because initialization took longer than expected: %@"];
      _NSCoreDataLog(17LL, v8, v9, v10, v11, v12, v13, v14, (uint64_t)a2);
      uint64_t v15 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = a2;
        _os_log_fault_impl( &dword_186681000,  v15,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to handle activity because initialization took longer than expected: %@",  buf,  0xCu);
      }

      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1LL);
    }

    else
    {
      v16 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v17 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v18 = __ckLoggingOverride;
      }
      uint64_t v19 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Asked to run activity: %@"];
      _NSCoreDataLog( v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]");
      objc_autoreleasePoolPop(v17);
      uint64_t v26 = (void *)[*(id *)(a1 + 32) newBackgroundContext];
      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 3221225472LL;
      v27[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke;
      v27[3] = &unk_189EA97A8;
      v27[4] = a2;
      v27[5] = v26;
      v27[6] = a1;
      v27[7] = a3;
      [v26 performBlockAndWait:v27];

      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1LL);
      objc_msgSend( (id)objc_msgSend((id)a1, "scheduler"),  "unregisterActivityIdentifier:",  objc_msgSend(a2, "identifier"));
      objc_autoreleasePoolPop(v16);
    }
  }

void __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke(uint64_t a1)
{
  v117[1] = *MEMORY[0x1895F89C0];
  uint64_t v109 = 0LL;
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607AB8]),  "initWithUUIDString:",  objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "identifier"),  "substringFromIndex:",  objc_msgSend(@"com.apple.coredatad.cloudkit.", "length")));
  id v4 = +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  +[CDDCloudKitScheduledActivity entityName](&OBJC_CLASS___CDDCloudKitScheduledActivity, "entityName"));
  -[NSFetchRequest setPredicate:]( v4,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"activityUUID = %@", v3]);
  uint64_t v5 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v4 error:&v109];
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v7 = __ckLoggingOverride;
  }
  uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Looking up activities matching the identifier: %@\n%@"];
  [*v2 identifier];
  _NSCoreDataLog( v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke");
  objc_autoreleasePoolPop(v6);
  if (v5)
  {
    if ([v5 count])
    {
      if ((unint64_t)[v5 count] >= 2)
      {
        uint64_t v15 = [NSString stringWithUTF8String:"Found more than one scheduled activities matching the identifier '%@': %@"];
        uint64_t v16 = [*(id *)(a1 + 32) identifier];
        _NSCoreDataLog(17LL, v15, v17, v18, v19, v20, v21, v22, v16);
        uint64_t v23 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          uint64_t v102 = [*(id *)(a1 + 32) identifier];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v102;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v5;
          _os_log_fault_impl( &dword_186681000,  v23,  OS_LOG_TYPE_FAULT,  "CoreData: Found more than one scheduled activities matching the identifier '%@': %@",  buf,  0x16u);
        }
      }

      uint64_t v24 = (void *)[v5 lastObject];
      uint64_t v25 = (void *)[v24 registeredClient];
      uint64_t v26 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v27 = __ckLoggingOverride;
      }
      uint64_t v28 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Running scheduled activity: %@\nClient: %@"];
      _NSCoreDataLog( v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke");
      objc_autoreleasePoolPop(v26);
      uint64_t v35 = objc_alloc(&OBJC_CLASS___NSPersistentStoreDescription);
      uint64_t v36 = -[NSPersistentStoreDescription initWithURL:]( v35,  "initWithURL:",  objc_msgSend(MEMORY[0x189604030], "fileURLWithPath:", objc_msgSend(v25, "storePath")));
      -[NSPersistentStoreDescription setConfiguration:]( v36,  "setConfiguration:",  [v25 storeConfigurationName]);
      uint64_t v37 = [v25 fileProtectionType];
      -[NSPersistentStoreDescription setOption:forKey:](v36, "setOption:forKey:", v37, *MEMORY[0x189607530]);
      -[NSPersistentStoreDescription setOption:forKey:]( v36,  "setOption:forKey:",  MEMORY[0x189604A88],  @"NSPersistentHistoryTrackingKey");
      uint64_t v38 = MEMORY[0x189604A88];
      -[NSPersistentStoreDescription setOption:forKey:]( v36,  "setOption:forKey:",  MEMORY[0x189604A88],  @"NSPersistentStoreRemoteChangeNotificationOptionKey");
      id v39 = -[NSCloudKitMirroringDelegateOptions initWithContainerIdentifier:]( [NSCloudKitMirroringDelegateOptions alloc],  "initWithContainerIdentifier:",  [v25 containerIdentifier]);
      id v40 = (void *)[*(id *)(a1 + 48) containerProvider];
      if (v39)
      {
        objc_setProperty_nonatomic(v39, v41, v40, 80LL);
        -[NSCloudKitMirroringDelegateOptions setAutomaticallyScheduleImportAndExportOperations:]( v39,  "setAutomaticallyScheduleImportAndExportOperations:",  0LL);
        v39->_useDaemon = 0;
      }

      else
      {
        [0 setAutomaticallyScheduleImportAndExportOperations:0];
      }

      uint64_t v42 = -[NSCloudKitMirroringDelegate initWithOptions:]( objc_alloc(&OBJC_CLASS___NSCloudKitMirroringDelegate),  "initWithOptions:",  v39);
      -[NSPersistentStoreDescription setMirroringDelegate:](v36, "setMirroringDelegate:", v42);

      uint64_t v108 = 0LL;
      uint64_t v43 = objc_msgSend(MEMORY[0x189604030], "fileURLWithPath:", objc_msgSend(v25, "storePath"));
      uint64_t v116 = @"NSReadOnlyPersistentStoreOption";
      v117[0] = v38;
      id v44 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:]( NSPersistentStore,  "cachedModelForPersistentStoreWithURL:options:error:",  v43,  [MEMORY[0x189603F68] dictionaryWithObjects:v117 forKeys:&v116 count:1],  &v108);
      if (v44)
      {
        uint64_t v104 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v44);
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3052000000LL;
        uint64_t v113 = __Block_byref_object_copy__21;
        uint64_t v114 = __Block_byref_object_dispose__21;
        uint64_t v115 = 0LL;
        uint64_t v45 = dispatch_semaphore_create(0LL);
        uint64_t v46 = (void *)[MEMORY[0x189607958] defaultCenter];
        uint64_t v47 = MEMORY[0x1895F87A8];
        v107[0] = MEMORY[0x1895F87A8];
        v107[1] = 3221225472LL;
        v107[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_2;
        v107[3] = &unk_189EA9708;
        v107[4] = v45;
        uint64_t v103 = [v46 addObserverForName:@"PFCloudKitDidSetupNotificationName" object:v42 queue:0 usingBlock:v107];
        v106[0] = v47;
        v106[1] = 3221225472LL;
        v106[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_102;
        v106[3] = &unk_189EA9730;
        v106[4] = buf;
        uint64_t v48 = -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:]( v104,  "addPersistentStoreWithDescription:completionHandler:",  v36,  v106);
        LODWORD(v47) = *(void *)(*(void *)&buf[8] + 40LL) == 0LL;
        uint64_t v49 = (void *)MEMORY[0x186E3E5D8](v48);
        unint64_t v50 = __ckLoggingOverride;
        if ((_DWORD)v47)
        {
          uint64_t v76 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Store initialized waiting for the mirroring delegate to set up."];
          if (v50 >= 0x10) {
            uint64_t v83 = 16LL;
          }
          else {
            uint64_t v83 = v50;
          }
          _NSCoreDataLog( v83,  v76,  v77,  v78,  v79,  v80,  v81,  v82,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
          objc_autoreleasePoolPop(v49);
          dispatch_time_t v84 = dispatch_time(0LL, 30000000000LL);
          if (dispatch_semaphore_wait(v45, v84))
          {
            id v85 = objc_alloc(MEMORY[0x189607870]);
            uint64_t v110 = *MEMORY[0x1896075F0];
            __int16 v111 = @"Timed out waiting for the mirroring delegate to set up.";
            uint64_t v86 = [MEMORY[0x189603F68] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
            uint64_t v87 = [v85 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v86];
            *(void *)(*(void *)&buf[8] + 40LL) = v87;
          }

          else
          {
            uint64_t v88 = (void *)MEMORY[0x186E3E5D8]();
            unint64_t v89 = __ckLoggingOverride;
            uint64_t v90 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Mirroring delegate initialized."];
            uint64_t v97 = MEMORY[0x1895F87A8];
            if (v89 >= 0x10) {
              uint64_t v98 = 16LL;
            }
            else {
              uint64_t v98 = v89;
            }
            _NSCoreDataLog( v98,  v90,  v91,  v92,  v93,  v94,  v95,  v96,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
            objc_autoreleasePoolPop(v88);
            id v99 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
            -[NSManagedObjectContext setPersistentStoreCoordinator:](v99, "setPersistentStoreCoordinator:", v104);
            -[NSManagedObjectContext setTransactionAuthor:]( v99,  "setTransactionAuthor:",  [NSString stringWithFormat:@"%@.%@", objc_msgSend(v25, "bundleIdentifier"), objc_msgSend((id)objc_msgSend(v24, "activityUUID"), "UUIDString"), v24, v25]);
            v105[0] = v97;
            v105[1] = 3221225472LL;
            v105[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_3;
            v105[3] = &unk_189EA9780;
            uint64_t v101 = *(void *)(a1 + 40);
            uint64_t v100 = *(void *)(a1 + 48);
            v105[4] = v104;
            v105[5] = v100;
            v105[6] = v24;
            v105[7] = v101;
            v105[8] = v99;
            v105[9] = buf;
            -[NSManagedObjectContext performBlockAndWait:](v99, "performBlockAndWait:", v105);
          }
        }

        else
        {
          uint64_t v51 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to load persistent store for client: %@\n%@"];
          _NSCoreDataLog( v50 != 0,  v51,  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
          objc_autoreleasePoolPop(v49);
        }

        objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "removeObserver:", v103);

        *(void *)(*(void *)&buf[8] + 40LL) = 0LL;
        _Block_object_dispose(buf, 8);
      }

      else
      {
        int v67 = (void *)MEMORY[0x186E3E5D8]();
        BOOL v68 = __ckLoggingOverride != 0;
        uint64_t v69 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to load managed object model for registered client: %@\n%@"];
        _NSCoreDataLog( v68,  v69,  v70,  v71,  v72,  v73,  v74,  v75,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
        objc_autoreleasePoolPop(v67);
      }
    }

    else
    {
      v58 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v59 = __ckLoggingOverride;
      }
      uint64_t v60 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"No activity registered with identifier: %@"];
      _NSCoreDataLog( v59,  v60,  v61,  v62,  v63,  v64,  v65,  v66,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
      objc_autoreleasePoolPop(v58);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }
  }
}

uint64_t __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKeyedSubscript:", @"result");
  if ([v3 success])
  {
    if ([v3 error])
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "Error was non-nil, but expected nil");
      _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, v22);
      uint64_t v11 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        uint64_t v12 = "CoreData: Error was non-nil, but expected nil";
        uint64_t v13 = (uint8_t *)&v22;
LABEL_8:
        _os_log_fault_impl(&dword_186681000, v11, OS_LOG_TYPE_FAULT, v12, v13, 2u);
      }
    }
  }

  else
  {
    uint64_t v14 = [NSString stringWithUTF8String:"Success was NO but expected YES"];
    _NSCoreDataLog(17LL, v14, v15, v16, v17, v18, v19, v20, v22);
    uint64_t v11 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "CoreData: Success was NO but expected YES";
      uint64_t v13 = buf;
      goto LABEL_8;
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_102( uint64_t a1,  uint64_t a2,  void *a3)
{
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  return result;
}

void __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___NSCloudKitMirroringExportRequest);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_4;
  v13[3] = &unk_189EA9758;
  __int128 v3 = *(_OWORD *)(a1 + 48);
  __int128 v14 = *(_OWORD *)(a1 + 32);
  __int128 v15 = v3;
  if (!objc_msgSend( *(id *)(a1 + 64),  "executeRequest:error:",  -[NSCloudKitMirroringRequest initWithOptions:completionBlock:]( v2,  "initWithOptions:completionBlock:",  0,  v13),  *(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v4 = (void *)MEMORY[0x186E3E5D8](*(id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL));
    BOOL v5 = __ckLoggingOverride != 0;
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to execute export request: %@\n%@"];
    _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_3");
    objc_autoreleasePoolPop(v4);
  }

void __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v13 = *(id *)(a1 + 32);
  if (([a2 success] & 1) == 0)
  {
    uint64_t v4 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v5 = __ckLoggingOverride != 0;
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Backup export failed: %@"];
    [a2 error];
    _NSCoreDataLog( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_4");
    objc_autoreleasePoolPop(v4);
  }

  [*(id *)(a1 + 40) finishedActivity:*(void *)(a1 + 48) withResult:a2 inManagedObjectContext:*(void *)(a1 + 56)];
}

- (void)finishedActivity:(id)a3 withResult:(id)a4 inManagedObjectContext:(id)a5
{
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke;
  v5[3] = &unk_189EA8980;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = a5;
  v5[7] = self;
  [a5 performBlock:v5];
}

void __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke(id *a1)
{
  if ([a1[4] success])
  {
    uint64_t v2 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v3 = __ckLoggingOverride;
    }
    uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Successfully finished activity, pruning: %@"];
    _NSCoreDataLog( v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    objc_autoreleasePoolPop(v2);
    [a1[6] deleteObject:a1[5]];
    id location = 0LL;
    if (([a1[6] save:&location] & 1) == 0)
    {
      uint64_t v11 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v12 = __ckLoggingOverride;
      }
      uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to prune activity after successful execution: %@"];
      _NSCoreDataLog( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
LABEL_10:
      objc_autoreleasePoolPop(v11);
    }
  }

  else if (objc_msgSend((id)objc_msgSend(a1[4], "error"), "code") == 134410 {
         && (uint64_t v20 = (void *)objc_msgSend((id)objc_msgSend(a1[4], "error"), "domain"),
  }
             [v20 isEqualToString:*MEMORY[0x189607460]]))
  {
    uint64_t v21 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v22 = __ckLoggingOverride != 0;
    uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Execution of activity encountered a fatal error, it will not be retried: %@\n%@"];
    [a1[4] error];
    _NSCoreDataLog( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    objc_autoreleasePoolPop(v21);
    [a1[6] deleteObject:a1[5]];
    id location = 0LL;
    if (([a1[6] save:&location] & 1) == 0)
    {
      uint64_t v11 = (void *)MEMORY[0x186E3E5D8]();
      else {
        uint64_t v30 = __ckLoggingOverride;
      }
      uint64_t v31 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to prune activity after fatal error: %@"];
      _NSCoreDataLog( v30,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v38 = (void *)MEMORY[0x186E3E5D8]();
    BOOL v39 = __ckLoggingOverride != 0;
    uint64_t v40 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Execution of activity failed: %@\n%@"];
    [a1[4] error];
    _NSCoreDataLog( v39,  v40,  v41,  v42,  v43,  v44,  v45,  v46,  (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    objc_autoreleasePoolPop(v38);
    uint64_t v47 = objc_msgSend( (id)objc_msgSend(a1[7], "containerProvider"),  "containerWithIdentifier:",  objc_msgSend((id)objc_msgSend(a1[5], "registeredClient"), "containerIdentifier"));
    uint64_t v48 = objc_msgSend( @"com.apple.coredatad.cloudkit.",  "stringByAppendingString:",  objc_msgSend((id)objc_msgSend(a1[5], "activityUUID"), "UUIDString"));
    uint64_t v49 = (void *)[objc_alloc((Class)getCloudKitCKSchedulerActivityClass[0]()) initWithIdentifier:v48 container:v47 priority:2];
    objc_msgSend(v49, "setAdditionalXPCActivityCriteria:", objc_msgSend(a1[5], "xpcActivityCriteria"));
    unint64_t v50 = (void *)[a1[7] scheduler];
    uint64_t v51 = (void *)MEMORY[0x186E3E5D8]();
    else {
      uint64_t v52 = __ckLoggingOverride;
    }
    uint64_t v53 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Scheduling activity: %@ for client: %@ with scheduler: %@"];
    [a1[5] registeredClient];
    _NSCoreDataLog( v52,  v53,  v54,  v55,  v56,  v57,  v58,  v59,  (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    objc_autoreleasePoolPop(v51);
    objc_initWeak(&location, a1[7]);
    uint64_t v60 = [v49 identifier];
    v61[0] = MEMORY[0x1895F87A8];
    v61[1] = 3221225472LL;
    v61[2] = __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke_2;
    v61[3] = &unk_189EA96E0;
    objc_copyWeak(&v62, &location);
    v61[4] = a1[7];
    [v50 registerActivityIdentifier:v60 handler:v61];
    [v50 submitActivity:v49];

    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
  }

void __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    -[CDDCloudKitServer runActivity:completionHandler:](*(void *)(a1 + 32), a2, a3);
  }

  else
  {
    uint64_t v7 = [NSString stringWithUTF8String:"Asked to run activity but no server: %@"];
    _NSCoreDataLog(17LL, v7, v8, v9, v10, v11, v12, v13, (uint64_t)a2);
    uint64_t v14 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = a2;
      _os_log_fault_impl( &dword_186681000,  v14,  OS_LOG_TYPE_FAULT,  "CoreData: Asked to run activity but no server: %@",  buf,  0xCu);
    }
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (CDDCloudKitServerConfiguration)configuration
{
  return self->_configuration;
}

- (PFCloudKitContainerProvider)containerProvider
{
  return self->_containerProvider;
}

- (CKScheduler)scheduler
{
  return self->_scheduler;
}

@end