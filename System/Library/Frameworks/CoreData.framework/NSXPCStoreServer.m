@interface NSXPCStoreServer
+ (unint64_t)debugDefault;
+ (void)initialize;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSQueryGenerationToken)retainedXPCEncodableGenerationTokenForOriginal:(NSQueryGenerationToken *)a1 inContext:(void *)a2;
- (NSQueryGenerationToken)unpackQueryGeneration:(uint64_t)a1 withContext:(void *)a2;
- (NSXPCStoreServerDelegate)delegate;
- (id)errorHandlingDelegate;
- (id)initForStoreWithURL:(id)a3 usingModel:(id)a4 options:(id)a5 policy:(id)a6;
- (id)initForStoreWithURL:(id)a3 usingModelAtURL:(id)a4 options:(id)a5 policy:(id)a6;
- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
- (uint64_t)_populateObject:(void *)a1 withValuesFromClient:(void *)a2;
- (uint64_t)setupRecoveryForConnectionContext:(uint64_t)a3 ifNecessary:;
- (void)dealloc;
- (void)errorIsPlausiblyAnSQLiteIssue:(uint64_t)a1;
- (void)handleRequest:(id)a3 reply:(id)a4;
- (void)removeCachesForConnection:(void *)result;
- (void)setDelegate:(id)a3;
- (void)setErrorHandlingDelegate:(id)a3;
- (void)startListening;
@end

@implementation NSXPCStoreServer

+ (unint64_t)debugDefault
{
  return _CoreData_XPCDebug;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _CoreData_XPCDebug = +[_PFRoutines integerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.XPCDebug");
  }
}

- (id)initForStoreWithURL:(id)a3 usingModel:(id)a4 options:(id)a5 policy:(id)a6
{
  v69[1] = *MEMORY[0x1895F89C0];
  if (!a3 || !a4)
  {

    v14 = @"model";
    if (!a3) {
      v14 = @"storeURL";
    }
    uint64_t v15 = [NSString stringWithFormat:@"Can't create server - misconfigured server : %@ is nil", v14];
    goto LABEL_14;
  }

  v11 = (void *)[a5 valueForKey:@"NSXPCStoreEntitlementNames"];
  if (!v11)
  {
    v69[0] = @"application-identifier";
    uint64_t v13 = [MEMORY[0x189603F18] arrayWithObjects:v69 count:1];
    goto LABEL_10;
  }

  v12 = v11;
  if (([v11 containsObject:@"application-identifier"] & 1) == 0)
  {
    uint64_t v13 = objc_msgSend( (id)objc_msgSend(MEMORY[0x189603FA8], "arrayWithArray:", v12),  "arrayByAddingObject:",  @"application-identifier");
LABEL_10:
    v12 = (void *)v13;
  }

  uint64_t v21 = [a5 valueForKey:@"NSXPCStoreServiceName"];
  int v22 = objc_msgSend((id)objc_msgSend(a5, "valueForKey:", @"NSXPCStoreDaemonize"), "BOOLValue");
  int v23 = v22;
  if (!v21 && v22)
  {

    uint64_t v15 = objc_msgSend( NSString,  "stringWithFormat:",  @"Can't create server - misconfigured server : no service name supplied for daemonized server",  v57);
LABEL_14:
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v15,  0LL,  v16,  v17,  v18,  v19,  v20,  v58);
    return 0LL;
  }

  uint64_t v26 = [a5 valueForKey:@"NSXPCStoreListener"];
  if (v26 && v21)
  {
    uint64_t v27 = objc_msgSend( NSString,  "stringWithFormat:",  @"Options dictionary contains service name and anonymous listener, defaulting to service name");
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v27,  0LL,  v28,  v29,  v30,  v31,  v32,  v57);
    uint64_t v26 = 0LL;
  }

  v59 = (void *)v26;
  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___NSXPCStoreServer;
  v24 = -[NSXPCStoreServer init](&v66, sel_init);
  if (v24)
  {
    int v60 = v23;
    id v61 = a6;
    v33 = (NSManagedObjectModel *)a4;
    v24->_model = v33;
    if (!v33)
    {
      uint64_t v51 = [NSString stringWithFormat:@"Can't create server - unable to load model"];
      +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v51,  (uint64_t)v24,  v52,  v53,  v54,  v55,  v56,  v57);
      abort();
    }

    v34 = v33;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    uint64_t v35 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v62,  v68,  16LL);
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v63;
      do
      {
        for (uint64_t i = 0LL; i != v36; ++i)
        {
          if (*(void *)v63 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          if (v39)
          {

            *(void *)(v39 + 48) = 0LL;
          }
        }

        uint64_t v36 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v62,  v68,  16LL);
      }

      while (v36);
    }

    v24->_storeURL = (NSURL *)a3;
    v24->_entitlementNames = (NSArray *)[v12 copy];
    if (v61) {
      v40 = (NSXPCStoreServerRequestHandlingPolicy *)v61;
    }
    else {
      v40 = objc_alloc_init(&OBJC_CLASS___NSXPCStoreServerRequestHandlingPolicy);
    }
    v24->_policy = v40;
    v41 = (NSDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:a5];
    v67[0] = @"NSPersistentStoreDeferredLightweightMigrationOptionKey";
    v67[1] = @"NSMigratePersistentStoresAutomaticallyOption";
    v67[2] = @"NSInferMappingModelAutomaticallyOption";
    v67[3] = @"NSPersistentStoreForceLightweightMigrationOption";
    -[NSDictionary removeObjectsForKeys:]( v41,  "removeObjectsForKeys:",  [MEMORY[0x189603F18] arrayWithObjects:v67 count:4]);
    if (!-[NSDictionary isEqualToDictionary:](v41, "isEqualToDictionary:", a5)) {
      _NSCoreDataLog( 2LL,  (uint64_t)@"XPC Store Server - Migration keys have been removed from %@",  v42,  v43,  v44,  v45,  v46,  v47,  (uint64_t)a5);
    }
    v24->_storeOptions = v41;
    if (v21)
    {
      if (v60)
      {
        v48 = (NSXPCListener *)[objc_alloc(MEMORY[0x189607B50]) initWithMachServiceName:v21];
      }

      else
      {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Attempting to create non-mach listener with service name: %@",  v42,  v43,  v44,  v45,  v46,  v47,  v21);
        v48 = (NSXPCListener *)[objc_alloc(MEMORY[0x189607B50]) initWithServiceName:v21];
      }
    }

    else if (v59)
    {
      v48 = v59;
    }

    else
    {
      v48 = (NSXPCListener *)(id)[MEMORY[0x189607B50] serviceListener];
    }

    v24->_listener = v48;
    -[NSXPCListener setDelegate:](v48, "setDelegate:", v24);
    v49 = (void *)[objc_alloc(MEMORY[0x1896079C0]) initWithOptions:0];
    v50 = (void *)[objc_alloc(MEMORY[0x1896079C0]) initWithOptions:0];
    v24->_connectionToCoordinatorMap = (NSMapTable *)[objc_alloc(MEMORY[0x189607920]) initWithKeyPointerFunctions:v49 valuePointerFunctions:v50 capacity:10];

    v24->_cacheIDtoCoordinatorMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v24;
}

- (id)initForStoreWithURL:(id)a3 usingModelAtURL:(id)a4 options:(id)a5 policy:(id)a6
{
  if (a3 && a4)
  {
    v11 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  a4);
    v12 = -[NSXPCStoreServer initForStoreWithURL:usingModel:options:policy:]( self,  "initForStoreWithURL:usingModel:options:policy:",  a3,  v11,  a5,  a6);
    if (v12) {
      v12[2] = a4;
    }
  }

  else
  {

    uint64_t v13 = @"storeURL";
    if (!a4) {
      uint64_t v13 = @"modelURL";
    }
    uint64_t v14 = [NSString stringWithFormat:@"Can't create server - misconfigured server : %@ is nil", v13];
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v14,  0LL,  v15,  v16,  v17,  v18,  v19,  v21);
    return 0LL;
  }

  return v12;
}

- (void)startListening
{
  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
    _NSCoreDataLog(8LL, (uint64_t)@"%@: Listening", v3, v4, v5, v6, v7, v8, (uint64_t)self);
  }
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)dealloc
{
  self->_listener = 0LL;
  self->_policy = 0LL;

  self->_connectionToCoordinatorMap = 0LL;
  self->_cacheIDtoCoordinatorMap = 0LL;

  self->_modelURL = 0LL;
  self->_model = 0LL;

  self->_storeURL = 0LL;
  self->_storeOptions = 0LL;

  self->_entitlementNames = 0LL;
  self->_delegate = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSXPCStoreServer;
  -[NSXPCStoreServer dealloc](&v3, sel_dealloc);
}

- (id)errorHandlingDelegate
{
  return self->_delegate;
}

- (void)setErrorHandlingDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    id v5 = a3;

    self->_delegate = a3;
  }

- (void)errorIsPlausiblyAnSQLiteIssue:(uint64_t)a1
{
  result = 0LL;
  if (a1 && a2)
  {
    result = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"NSSQLiteErrorDomain");
    if (result) {
      goto LABEL_8;
    }
    id v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"NSUnderlyingException");
    if (v5)
    {
      result = (void *)[v5 userInfo];
    }

    else
    {
      result = (void *)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"exception info");
      if (!result) {
        return result;
      }
    }

    result = (void *)[result objectForKey:@"NSSQLiteErrorDomain"];
    if (result)
    {
LABEL_8:
      int v6 = [result intValue];
      return (void *)(v6 == 11 || v6 == 26);
    }
  }

  return result;
}

- (uint64_t)setupRecoveryForConnectionContext:(uint64_t)a3 ifNecessary:
{
  if (result)
  {
    uint64_t v3 = result;
    result = *(void *)(result + 8);
    if (result)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return 0LL;
      }
      result = [*(id *)(v3 + 8) willPerformRecoveryForError:a3 fromContext:a2];
      if (!(_DWORD)result) {
        return result;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        [*(id *)(v3 + 8) performRecoveryForError:a3 fromContext:a2];
        return 1LL;
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

- (void)removeCachesForConnection:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = objc_sync_enter(result);
    id v5 = (void *)MEMORY[0x186E3E5D8](v4);
    int v6 = NSMapGet(*((NSMapTable **)v3 + 9), a2);
    if (v6 && v6[6])
    {
      uint64_t v7 = v6 + 5;
      do
      {
        unint64_t v8 = __ldxr(v7);
        BOOL v9 = __OFSUB__(v8, 1LL);
        int64_t v10 = v8 - 1;
      }

      while (__stxr(v10, v7));
      if ((v10 < 0) ^ v9 | (v10 == 0)) {
        objc_msgSend(*((id *)v3 + 10), "removeObjectForKey:");
      }
    }

    NSMapRemove(*((NSMapTable **)v3 + 9), a2);
    [a2 setUserInfo:0];
    objc_autoreleasePoolPop(v5);
    return (void *)objc_sync_exit(v3);
  }

  return result;
}

void *__47__NSXPCStoreServer_retainedCacheForConnection___block_invoke(uint64_t a1)
{
  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
    _NSCoreDataLog(8LL, (uint64_t)@" Server Connection interrupted.", v2, v3, v4, v5, v6, v7, v9);
  }
  return -[NSXPCStoreServer removeCachesForConnection:](*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void *__47__NSXPCStoreServer_retainedCacheForConnection___block_invoke_2(uint64_t a1)
{
  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
    _NSCoreDataLog(8LL, (uint64_t)@" Server Connection invalidated.", v2, v3, v4, v5, v6, v7, v9);
  }
  return -[NSXPCStoreServer removeCachesForConnection:](*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8](self, a2, a3);
  if (a4)
  {
    [a4 auditToken];
  }

  else
  {
    __int128 v63 = 0u;
    __int128 v64 = 0u;
  }

  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
    _NSCoreDataLog(8LL, (uint64_t)@"%@ - Incoming connection: %@", v7, v8, v9, v10, v11, v12, (uint64_t)self);
  }
  if (self)
  {
    uint64_t v13 = (void *)MEMORY[0x186E3E5D8]();
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v14 = (void *)[self->_delegate identifierForConnection:a4];
      objc_sync_enter(self);
      if (v14)
      {
        uint64_t v15 = (NSXPCStoreServerPerConnectionCache *)-[NSMutableDictionary objectForKey:]( self->_cacheIDtoCoordinatorMap,  "objectForKey:",  v14);
        if (v15)
        {
          if (!NSMapGet(self->_connectionToCoordinatorMap, a4))
          {
            NSMapInsert(self->_connectionToCoordinatorMap, a4, v15);
            p_connections = (unint64_t *)&v15->_connections;
            do
              unint64_t v17 = __ldxr(p_connections);
            while (__stxr(v17 + 1, p_connections));
LABEL_26:
            uint64_t v30 = MEMORY[0x1895F87A8];
            *(void *)&__int128 v66 = MEMORY[0x1895F87A8];
            *((void *)&v66 + 1) = 3221225472LL;
            *(void *)&__int128 v67 = __47__NSXPCStoreServer_retainedCacheForConnection___block_invoke;
            *((void *)&v67 + 1) = &unk_189EA7648;
            v68 = self;
            id v69 = a4;
            [a4 setInterruptionHandler:&v66];
            v65[0] = v30;
            v65[1] = 3221225472LL;
            v65[2] = __47__NSXPCStoreServer_retainedCacheForConnection___block_invoke_2;
            v65[3] = &unk_189EA7648;
            v65[4] = self;
            v65[5] = a4;
            [a4 setInvalidationHandler:v65];
            goto LABEL_34;
          }

          goto LABEL_34;
        }

        char v18 = 0;
LABEL_17:
        uint64_t v15 = (NSXPCStoreServerPerConnectionCache *)NSMapGet(self->_connectionToCoordinatorMap, a4);
        if (!v15)
        {
          v25 = self->_model;
          if (v25)
          {
            uint64_t v26 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v27 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v25);

            *(void *)&__int128 v66 = 0LL;
            if (-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v27,  "addPersistentStoreWithType:configuration:URL:options:error:",  @"SQLite",  0LL,  self->_storeURL,  self->_storeOptions,  &v66))
            {
              objc_autoreleasePoolPop(v26);
              if (v27)
              {
                uint64_t v15 = -[NSXPCStoreServerPerConnectionCache initWithCoordinator:]( objc_alloc(&OBJC_CLASS___NSXPCStoreServerPerConnectionCache),  "initWithCoordinator:",  v27);

                if ((v18 & 1) == 0)
                {
                  -[NSMutableDictionary setObject:forKey:]( self->_cacheIDtoCoordinatorMap,  "setObject:forKey:",  v15,  v14);
                  -[NSXPCStoreServerPerConnectionCache setClientIdentifier:](v15, v14);
                  if (v15)
                  {
                    uint64_t v28 = (unint64_t *)&v15->_connections;
                    do
                      unint64_t v29 = __ldxr(v28);
                    while (__stxr(v29 + 1, v28));
                  }
                }

                NSMapInsert(self->_connectionToCoordinatorMap, a4, v15);

                goto LABEL_26;
              }
            }

            else
            {
              if (-[NSXPCStoreServer errorIsPlausiblyAnSQLiteIssue:]((uint64_t)self, (void *)v66))
              {
                -[NSXPCStoreServer setupRecoveryForConnectionContext:ifNecessary:]((uint64_t)self, 0LL, v66);
                uint64_t v31 = [NSString stringWithFormat:@"Can't create coordinator - attempting SQLite recovery"];
              }

              else
              {
                uint64_t v62 = v66;
                uint64_t v31 = [NSString stringWithFormat:@"Can't create coordinator - due to an error - %@"];
              }

              +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v31,  (uint64_t)self,  v32,  v33,  v34,  v35,  v36,  v62);

              _NSCoreDataLog(8LL, (uint64_t)@"Unable to load store: %@", v37, v38, v39, v40, v41, v42, v66);
              objc_autoreleasePoolPop(v26);
            }
          }

          else
          {
            _NSCoreDataLog(8LL, (uint64_t)@"%@: Unable to find model", v19, v20, v21, v22, v23, v24, (uint64_t)self);
          }

          uint64_t v15 = 0LL;
        }

- (void)handleRequest:(id)a3 reply:(id)a4
{
  id v40 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v7 = (void *)[MEMORY[0x189607B30] currentConnection];
  uint64_t v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "userInfo"), "objectForKey:", @"NSConnectionInfo");
  uint64_t v9 = -[NSXPCStoreServerConnectionContext initWithConnectionInfo:]( objc_alloc(&OBJC_CLASS___NSXPCStoreServerConnectionContext),  "initWithConnectionInfo:",  v8);
  uint64_t v48 = 0LL;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  char v51 = 0;
  uint64_t v42 = 0LL;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3052000000LL;
  uint64_t v45 = __Block_byref_object_copy__0;
  id v46 = __Block_byref_object_dispose__0;
  uint64_t v47 = 0LL;
  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
    _NSCoreDataLog(8LL, (uint64_t)@"Starting event handler", v10, v11, v12, v13, v14, v15, v39);
  }
  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
    _NSCoreDataLog( 8LL,  (uint64_t)@"XPCStore server handling request: %@",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)a3);
  }
  BOOL v22 = -[NSXPCStoreServerRequestHandlingPolicy shouldAcceptConnectionsFromClientWithContext:]( self->_policy,  "shouldAcceptConnectionsFromClientWithContext:",  v9);
  uint64_t v23 = v49;
  *((_BYTE *)v49 + 24) = v22;
  v43[5] = 0LL;
  if (!*((_BYTE *)v23 + 24))
  {
    uint64_t v24 = [NSString stringWithFormat:@"Policy rejected connection from client: %@"];
    v43[5] = v24;
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v24,  (uint64_t)self,  v25,  v26,  v27,  v28,  v29,  (uint64_t)v7);
  }

  id v30 = -[NSXPCStoreServerConnectionContext persistentStoreCoordinator](v9, "persistentStoreCoordinator");
  uint64_t v31 = (NSManagedObjectContext *) -[NSXPCStoreServerConnectionContext managedObjectContext]( v9,  "managedObjectContext");
  if (!v31)
  {
    uint64_t v32 = -[NSManagedObjectContext initWithConcurrencyType:]( objc_alloc(&OBJC_CLASS___NSManagedObjectContext),  "initWithConcurrencyType:",  1LL);
    -[NSManagedObjectContext setPersistentStoreCoordinator:](v32, "setPersistentStoreCoordinator:", v30);
    -[NSManagedObjectContext _setDelegate:](v32, "_setDelegate:", self);
    if (v32) {
      *(_DWORD *)&v32->_flags |= 0x1000000u;
    }
    uint64_t v33 = (void *)objc_msgSend((id)objc_msgSend(v8, "entitlements"), "objectForKey:", @"application-identifier");
    if (v33) {
      -[NSPersistentStoreCoordinator _setXPCBundleIdentifier:]((uint64_t)v30, v33);
    }
    if (a3)
    {
      uint64_t v34 = (void *)*((void *)a3 + 7);
      if (v34) {
        -[NSPersistentStoreCoordinator _setXPCProcessName:]((uint64_t)v30, v34);
      }
    }

    -[NSManagedObjectContext setMergePolicy:](v32, "setMergePolicy:", NSErrorMergePolicy);
    -[NSManagedObjectContext setUndoManager:](v32, "setUndoManager:", 0LL);
    if (a3 && *((void *)a3 + 5)) {
      -[NSManagedObjectContext setName:](v32, "setName:");
    }
    -[NSXPCStoreServerConnectionContext setManagedObjectContext:](v9, "setManagedObjectContext:", v32);
    uint64_t v31 = v32;
  }

  if (a3)
  {
    uint64_t v35 = (void *)*((void *)a3 + 5);
    if (v35 && (objc_msgSend(v35, "isEqual:", -[NSManagedObjectContext name](v31, "name")) & 1) == 0) {
      -[NSManagedObjectContext setName:](v31, "setName:", *((void *)a3 + 5));
    }
    uint64_t v36 = (void *)*((void *)a3 + 6);
    if (v36
      && (objc_msgSend(v36, "isEqual:", -[NSManagedObjectContext transactionAuthor](v31, "transactionAuthor")) & 1) == 0)
    {
      -[NSManagedObjectContext setTransactionAuthor:](v31, "setTransactionAuthor:", *((void *)a3 + 6));
    }

    if (*((_BYTE *)a3 + 16)) {
      -[NSManagedObjectContext _setAllowAncillaryEntities:](v31, "_setAllowAncillaryEntities:", 1LL);
    }
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__NSXPCStoreServer_handleRequest_reply___block_invoke;
  block[3] = &unk_189EA7620;
  block[4] = 0LL;
  block[5] = a3;
  block[6] = v31;
  block[7] = v9;
  block[12] = &v48;
  block[13] = &v42;
  block[8] = self;
  block[9] = v7;
  block[10] = v30;
  block[11] = a4;
  dispatch_block_t v37 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  uint64_t v38 = v37;
  if (v31) {
    -[NSManagedObjectContext performBlockAndWait:](v31, "performBlockAndWait:", v37);
  }
  else {
    (*((void (**)(dispatch_block_t))v37 + 2))(v37);
  }
  _Block_release(v38);
  [v40 drain];
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);
}

void __40__NSXPCStoreServer_handleRequest_reply___block_invoke(uint64_t *a1)
{
  uint64_t v784 = *MEMORY[0x1895F89C0];
  id v733 = objc_alloc_init(MEMORY[0x1896077E8]);
  self = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  v742 = 0LL;
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    goto LABEL_448;
  }
  uint64_t v3 = a1[5];
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 32);
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t v5 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)a1[6], "persistentStoreCoordinator"), "persistentStores"),  "lastObject");
  -[NSXPCStoreServerConnectionContext setActiveStore:](a1[7], v5);
  if (v4 && (objc_msgSend(v4, "isEqual:", objc_msgSend(v5, "identifier")) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[12] + 8) + 24LL) = 0;
    *(void *)(*(void *)(a1[13] + 8) + 40) = [NSString stringWithFormat:@"Token mismatch"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  *(void *)(*(void *)(a1[13] + 8) + 40LL),  a1[8],  v6,  v7,  v8,  v9,  v10,  v724);
    int v732 = 1;
  }

  else
  {
    int v732 = 0;
  }

  if (!*(_BYTE *)(*(void *)(a1[12] + 8) + 24LL))
  {
    id v39 = 0LL;
LABEL_408:
    uint64_t v679 = *MEMORY[0x189607460];
    if (v732)
    {
      v742 = (char *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v679,  134095,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"request failed, store identifier mismatch",  @"Problem"));
LABEL_410:
      uint64_t v681 = 2LL;
      goto LABEL_412;
    }

    v742 = (char *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v679,  134070,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"request failed, insufficient permission",  @"Problem"));
    uint64_t v681 = 1LL;
    goto LABEL_412;
  }

  v734 = a1;
  uint64_t v11 = a1[5];
  if (!v11)
  {
LABEL_28:
    if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
    {
      uint64_t v46 = a1[5];
      if (v46) {
        uint64_t v46 = *(void *)(v46 + 8);
      }
      uint64_t v726 = a1[9];
      _NSCoreDataLog(8LL, (uint64_t)@"Illegal input: %u from connection %p", v40, v41, v42, v43, v44, v45, v46);
    }

    id v39 = 0LL;
    v742 = (char *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134070 userInfo:0];
    goto LABEL_404;
  }

  switch(*(void *)(v11 + 8))
  {
    case 1LL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Metadata", v12, v13, v14, v15, v16, v17, v724);
      }
      if (!a1[8]) {
        goto LABEL_445;
      }
      uint64_t v18 = (void *)a1[7];
      uint64_t v19 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v20 = (void *)objc_msgSend((id)objc_msgSend(v18, "managedObjectContext"), "persistentStoreCoordinator");
      uint64_t v27 = (void *)objc_msgSend((id)objc_msgSend(v20, "persistentStores"), "lastObject");
      if (!v27) {
        _NSCoreDataLog(8LL, (uint64_t)@"no store", v21, v22, v23, v24, v25, v26, v724);
      }
      uint64_t v28 = (void *)[v27 metadata];
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Got metadata %@", v29, v30, v31, v32, v33, v34, (uint64_t)v28);
      }
      uint64_t v35 = (void *)[v20 managedObjectModel];
      __int128 v779 = 0u;
      __int128 v780 = 0u;
      __int128 v777 = 0u;
      __int128 v778 = 0u;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v777 objects:&v781 count:16];
      if (!v36) {
        goto LABEL_284;
      }
      uint64_t v37 = *(void *)v778;
      while (1)
      {
        for (uint64_t i = 0LL; i != v36; ++i)
        {
          if (*(void *)v778 != v37) {
            objc_enumerationMutation(v35);
          }
          if ((-[NSEntityDescription _hasAttributesWithFileBackedFutures](*(void *)(*((void *)&v777 + 1) + 8 * i)) & 1) != 0)
          {
            v502 = (void *)[v27 fileBackedFuturesDirectory];
            if (v502)
            {
              v775[0] = @"NSMetadataKey";
              v775[1] = @"NSFileBackedFuturePathKey";
              v776[0] = v28;
              v776[1] = v502;
              uint64_t v28 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v776 forKeys:v775 count:2];
              goto LABEL_284;
            }

            _NSCoreDataLog(8LL, (uint64_t)@"what on earth happened?", v503, v504, v505, v506, v507, v508, v724);
            while (1)
            {
LABEL_447:
              __break(1u);
LABEL_448:
              objc_exception_throw(v2);
            }
          }
        }

        uint64_t v36 = [v35 countByEnumeratingWithState:&v777 objects:&v781 count:16];
        if (!v36)
        {
LABEL_284:
          v509 = (void *)[MEMORY[0x1896079E8] dataWithPropertyList:v28 format:200 options:0 error:0];
          if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
            _NSCoreDataLog( 8LL,  (uint64_t)@"Which archives to %@",  v510,  v511,  v512,  v513,  v514,  v515,  (uint64_t)v509);
          }
          id v516 = v509;
          objc_autoreleasePoolPop(v19);
          id v332 = v509;
          goto LABEL_403;
        }
      }

    case 2LL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Fetch", v284, v285, v286, v287, v288, v289, v724);
      }
      uint64_t v290 = a1[5];
      if (v290) {
        uint64_t v291 = *(void *)(v290 + 24);
      }
      else {
        uint64_t v291 = 0LL;
      }
      uint64_t v292 = a1[8];
      if (!v292) {
        goto LABEL_445;
      }
      v293 = (void *)a1[7];
      v776[0] = 0LL;
      id v740 = objc_alloc_init(MEMORY[0x1896077E8]);
      v294 = (void *)MEMORY[0x189604010];
      uint64_t v295 = objc_opt_class();
      uint64_t v296 = objc_opt_class();
      uint64_t v297 = objc_opt_class();
      uint64_t v298 = objc_opt_class();
      objc_opt_class();
      uint64_t v726 = v297;
      uint64_t v727 = v298;
      uint64_t v724 = v296;
      v299 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)_NSXPCStoreUtilities,  v291,  (uint64_t)v293,  [v294 setWithObjects:v295]);
      if ((unint64_t)[v299 count] < 2)
      {
        uint64_t v301 = 0LL;
      }

      else
      {
        uint64_t v300 = [v299 objectAtIndex:1];
        uint64_t v301 = v300;
        if (v300)
        {
          v302 = -[NSXPCStoreServer unpackQueryGeneration:withContext:](v300, v293);
          goto LABEL_289;
        }
      }

      v302 = 0LL;
LABEL_289:
      id v517 = +[NSFetchRequest decodeFromXPCArchive:withContext:andPolicy:]( NSFetchRequest,  "decodeFromXPCArchive:withContext:andPolicy:",  [v299 firstObject],  v293,  *(void *)(v292 + 64));
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Got a fetch request %@", v518, v519, v520, v521, v522, v523, (uint64_t)v517);
      }
      if (v301 && !v302 && +[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
      {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Can't fulfill fetch request: can't find query generation: %@",  v524,  v525,  v526,  v527,  v528,  v529,  0LL);
        v530 = (void *)MEMORY[0x189607870];
        v781 = @"unrecognized query generation";
        *(void *)&__int128 v777 = @"reason";
        *((void *)&v777 + 1) = @"generation";
        uint64_t v782 = [MEMORY[0x189603FE8] null];
        uint64_t v531 = [MEMORY[0x189603F68] dictionaryWithObjects:&v781 forKeys:&v777 count:2];
        int v532 = 0;
        v533 = 0LL;
        v776[0] = (id)[v530 errorWithDomain:*MEMORY[0x189607460] code:134061 userInfo:v531];
        goto LABEL_391;
      }

      v534 = (void *)[*(id *)(v292 + 64) processRequest:v517 fromClientWithContext:v293 error:v776];
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
      {
        if (v534) {
          uint64_t v541 = [v534 count];
        }
        else {
          uint64_t v541 = 0LL;
        }
        uint64_t v726 = v541;
        _NSCoreDataLog(8LL, (uint64_t)@"Which had result %d (%d)", v535, v536, v537, v538, v539, v540, v534 != 0LL);
      }

      if (v534)
      {
        id v631 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v534);
        v533 = v631;
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
        {
          BOOL v638 = v631 != 0LL;
          if (v533) {
            uint64_t v639 = [v533 length];
          }
          else {
            uint64_t v639 = 0LL;
          }
          uint64_t v726 = v639;
          _NSCoreDataLog(8LL, (uint64_t)@"Which archived %d (%d)", v632, v633, v634, v635, v636, v637, v638);
        }

        goto LABEL_381;
      }

      if (v776[0])
      {
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
        {
          v533 = 0LL;
          _NSCoreDataLog( 8LL,  (uint64_t)@"Fetch failed returning error %@",  v640,  v641,  v642,  v643,  v644,  v645,  (uint64_t)v776[0]);
LABEL_390:
          int v532 = 1;
LABEL_391:
          id v664 = v776[0];
          [v740 drain];
          id v665 = 0LL;
          id v666 = v776[0];
          if (v776[0]) {
            v742 = (char *)v776[0];
          }
          if (v532)
          {
            id v332 = v533;
            goto LABEL_403;
          }

          goto LABEL_445;
        }
      }

      else if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
      {
        v533 = 0LL;
        _NSCoreDataLog(8LL, (uint64_t)@"Fetch failed with no error.", v658, v659, v660, v661, v662, v663, v724);
        goto LABEL_390;
      }

      v533 = 0LL;
LABEL_381:
      int v532 = 1;
      goto LABEL_391;
    case 3LL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Save", v122, v123, v124, v125, v126, v127, v724);
      }
      uint64_t v128 = a1[5];
      if (v128) {
        uint64_t v129 = *(void *)(v128 + 24);
      }
      else {
        uint64_t v129 = 0LL;
      }
      uint64_t v730 = a1[8];
      if (!v730) {
        goto LABEL_445;
      }
      v731 = (void *)a1[7];
      id v728 = objc_alloc_init(MEMORY[0x1896077E8]);
      v771[0] = 0LL;
      uint64_t v130 = objc_msgSend( (id)+[_NSXPCStoreUtilities classesForSaveArchive](),  "setByAddingObjectsFromSet:",  objc_msgSend(*(id *)(v730 + 64), "allowableClassesForClientWithContext:", v731));
      v131 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v129,  (uint64_t)v731,  v130);
      v132 = v131;
      if (v131)
      {
        v133 = (void *)[v131 valueForKey:@"NSMetadata"];
        v134 = (void *)[v731 managedObjectContext];
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
          _NSCoreDataLog(8LL, (uint64_t)@"Got save request: %@", v135, v136, v137, v138, v139, v140, (uint64_t)v132);
        }
        if (!v133) {
          goto LABEL_88;
        }
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
          _NSCoreDataLog(8LL, (uint64_t)@"Updating metadata", v141, v142, v143, v144, v145, v146, v724);
        }
        if ((objc_opt_respondsToSelector() & 1) == 0
          || ([*(id *)(v730 + 64) shouldAcceptMetadataChangesFromClientWithContext:v731] & 1) != 0)
        {
          v147 = (void *)[v133 mutableCopy];
          [v147 removeObjectForKey:@"NSStoreUUID"];
          [v147 removeObjectForKey:@"NSStoreType"];
          [v147 removeObjectForKey:@"NSStoreModelVersionHashes"];
          [v147 removeObjectForKey:@"NSStoreModelVersionIdentifiers"];
          [v147 removeObjectForKey:0x189EBA2A8];
          [v147 removeObjectForKey:0x189EBA2C8];
          if (v731) {
            v148 = (void *)v731[4];
          }
          else {
            v148 = 0LL;
          }
          [v148 setMetadata:v147];

LABEL_88:
          obuint64_t j = (id)[v132 valueForKey:@"deleted"];
          id v735 = (id)[v132 valueForKey:@"inserted"];
          id v738 = (id)[v132 valueForKey:@"updated"];
          v149 = (void *)[v132 valueForKey:@"locked"];
          v150 = (void *)[MEMORY[0x189603FA8] array];
          __int128 v769 = 0u;
          __int128 v770 = 0u;
          __int128 v767 = 0u;
          __int128 v768 = 0u;
          uint64_t v151 = [obj countByEnumeratingWithState:&v767 objects:&v781 count:16];
          if (v151)
          {
            uint64_t v152 = *(void *)v768;
            do
            {
              for (uint64_t j = 0LL; j != v151; ++j)
              {
                if (*(void *)v768 != v152) {
                  objc_enumerationMutation(obj);
                }
                objc_msgSend( v150,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v767 + 1) + 8 * j), "objectAtIndex:", 0));
              }

              uint64_t v151 = [obj countByEnumeratingWithState:&v767 objects:&v781 count:16];
            }

            while (v151);
          }

          __int128 v765 = 0u;
          __int128 v766 = 0u;
          __int128 v763 = 0u;
          __int128 v764 = 0u;
          uint64_t v154 = [v738 countByEnumeratingWithState:&v763 objects:&v777 count:16];
          if (v154)
          {
            uint64_t v155 = *(void *)v764;
            do
            {
              for (uint64_t k = 0LL; k != v154; ++k)
              {
                if (*(void *)v764 != v155) {
                  objc_enumerationMutation(v738);
                }
                objc_msgSend( v150,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v763 + 1) + 8 * k), "objectAtIndex:", 0));
              }

              uint64_t v154 = [v738 countByEnumeratingWithState:&v763 objects:&v777 count:16];
            }

            while (v154);
          }

          __int128 v761 = 0u;
          __int128 v762 = 0u;
          __int128 v759 = 0u;
          __int128 v760 = 0u;
          uint64_t v157 = [v149 countByEnumeratingWithState:&v759 objects:v776 count:16];
          if (v157)
          {
            uint64_t v158 = *(void *)v760;
            do
            {
              for (uint64_t m = 0LL; m != v157; ++m)
              {
                if (*(void *)v760 != v158) {
                  objc_enumerationMutation(v149);
                }
                objc_msgSend( v150,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v759 + 1) + 8 * m), "objectAtIndex:", 0));
              }

              uint64_t v157 = [v149 countByEnumeratingWithState:&v759 objects:v776 count:16];
            }

            while (v157);
          }

          +[_PFRoutines fetchHeterogeneousCollectionByObjectIDs:intoContext:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v150,  (uint64_t)v134);
          objc_opt_self();
          if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
            _NSCoreDataLog( 8LL,  (uint64_t)@"Locking objects :%@",  v160,  v161,  v162,  v163,  v164,  v165,  (uint64_t)v149);
          }
          __int128 v757 = 0u;
          __int128 v758 = 0u;
          __int128 v755 = 0u;
          __int128 v756 = 0u;
          uint64_t v166 = [v149 countByEnumeratingWithState:&v755 objects:v775 count:16];
          if (v166)
          {
            uint64_t v167 = *(void *)v756;
            do
            {
              uint64_t v168 = 0LL;
              do
              {
                if (*(void *)v756 != v167) {
                  objc_enumerationMutation(v149);
                }
                v169 = *(void **)(*((void *)&v755 + 1) + 8 * v168);
                v170 = (void *)MEMORY[0x186E3E5D8]();
                v171 = (void *)[v169 objectAtIndex:0];
                if (v134) {
                  id v172 = _PFRetainedObjectIDCore((uint64_t)v134, v171, 0LL, 1);
                }
                else {
                  id v172 = 0LL;
                }
                [v172 willAccessValueForKey:0];
                if ([v172 isDeleted])
                {
                  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
                    _NSCoreDataLog( 8LL,  (uint64_t)@"Not locking %@ because it's not in the db",  v173,  v174,  v175,  v176,  v177,  v178,  (uint64_t)v172);
                  }
                }

                else
                {
                  if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
                    _NSCoreDataLog(8LL, (uint64_t)@"Locking %@", v179, v180, v181, v182, v183, v184, (uint64_t)v172);
                  }
                  objc_msgSend( v172,  "_setVersionReference__:",  objc_msgSend((id)objc_msgSend(v169, "objectAtIndex:", 1), "unsignedIntegerValue"));
                  [v134 detectConflictsForObject:v172];
                }

                objc_autoreleasePoolPop(v170);
                ++v168;
              }

              while (v166 != v168);
              uint64_t v185 = [v149 countByEnumeratingWithState:&v755 objects:v775 count:16];
              uint64_t v166 = v185;
            }

            while (v185);
          }

          __int128 v753 = 0u;
          __int128 v754 = 0u;
          __int128 v751 = 0u;
          __int128 v752 = 0u;
          uint64_t v186 = [obj countByEnumeratingWithState:&v751 objects:v774 count:16];
          if (!v186) {
            goto LABEL_156;
          }
          v187 = 0LL;
          uint64_t v188 = 0LL;
          uint64_t v189 = *(void *)v752;
          uint64_t v729 = *MEMORY[0x189607460];
          while (1)
          {
            uint64_t v190 = 0LL;
            do
            {
              if (*(void *)v752 != v189) {
                objc_enumerationMutation(obj);
              }
              v191 = *(void **)(*((void *)&v751 + 1) + 8 * v190);
              v192 = (void *)MEMORY[0x186E3E5D8]();
              v193 = (void *)[v191 objectAtIndex:0];
              uint64_t v194 = [v193 entity];
              if (v188 != v194)
              {
                v187 = (void *)[*(id *)(v730 + 64) restrictingWritePredicateForEntity:v194 fromClientWithContext:v731];
                uint64_t v188 = v194;
              }

              if (!v187)
              {
                v203 = (void *)[MEMORY[0x189607870] errorWithDomain:v729 code:134092 userInfo:0];
LABEL_149:
                int v202 = 0;
                v771[0] = v203;
                goto LABEL_150;
              }

              if ((void *)[MEMORY[0x1896079C8] predicateWithValue:0] == v187)
              {
                v203 = (void *)[MEMORY[0x189607870] errorWithDomain:v729 code:134030 userInfo:0];
                goto LABEL_149;
              }

              if (v134) {
                id v195 = _PFRetainedObjectIDCore((uint64_t)v134, v193, 0LL, 1);
              }
              else {
                id v195 = 0LL;
              }
              [v195 willAccessValueForKey:0];
              if ([v195 isDeleted]) {
                goto LABEL_146;
              }
              objc_msgSend( v195,  "_setVersionReference__:",  objc_msgSend((id)objc_msgSend(v191, "objectAtIndex:", 1), "unsignedIntegerValue"));
              -[NSXPCStoreServer _populateObject:withValuesFromClient:](v195, v191);
              if ((void *)[MEMORY[0x1896079C8] predicateWithValue:1] == v187
                || ([v187 evaluateWithObject:v195] & 1) != 0)
              {
                if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
                  _NSCoreDataLog( 8LL,  (uint64_t)@"Deleting object :%@",  v196,  v197,  v198,  v199,  v200,  v201,  (uint64_t)v195);
                }
                [v134 deleteObject:v195];
LABEL_146:

                int v202 = 1;
                goto LABEL_150;
              }

              v771[0] = (id)[MEMORY[0x189607870] errorWithDomain:v729 code:134030 userInfo:0];

              int v202 = 0;
LABEL_150:
              objc_autoreleasePoolPop(v192);
              if (!v202)
              {
                id v39 = 0LL;
                goto LABEL_385;
              }

              ++v190;
            }

            while (v186 != v190);
            uint64_t v204 = [obj countByEnumeratingWithState:&v751 objects:v774 count:16];
            uint64_t v186 = v204;
            if (!v204)
            {
LABEL_156:
              v205 = (void *)[MEMORY[0x189603FA8] array];
              v206 = (void *)[MEMORY[0x189603FA8] array];
              v207 = (void *)[MEMORY[0x189603FA8] array];
              __int128 v749 = 0u;
              __int128 v750 = 0u;
              __int128 v747 = 0u;
              __int128 v748 = 0u;
              uint64_t v208 = [v735 countByEnumeratingWithState:&v747 objects:v773 count:16];
              if (v208)
              {
                uint64_t v209 = *(void *)v748;
                do
                {
                  for (uint64_t n = 0LL; n != v208; ++n)
                  {
                    if (*(void *)v748 != v209) {
                      objc_enumerationMutation(v735);
                    }
                    v211 = *(void **)(*((void *)&v747 + 1) + 8 * n);
                    v212 = (void *)MEMORY[0x186E3E5D8]();
                    v213 = (void *)[v211 objectAtIndex:0];
                    [v207 addObject:v213];
                    v214 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]( [NSManagedObject alloc],  "initWithEntity:insertIntoManagedObjectContext:",  [v213 entity],  v134);
                    [v206 addObject:v214];
                    if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
                      _NSCoreDataLog( 8LL,  (uint64_t)@"Inserting object with ID %@",  v215,  v216,  v217,  v218,  v219,  v220,  (uint64_t)v213);
                    }
                    [v205 addObject:v214];

                    objc_autoreleasePoolPop(v212);
                  }

                  uint64_t v208 = [v735 countByEnumeratingWithState:&v747 objects:v773 count:16];
                }

                while (v208);
              }

              uint64_t v221 = [v205 count];
              if (v221)
              {
                for (iuint64_t i = 0LL; ii != v221; ++ii)
                {
                  v223 = (void *)MEMORY[0x186E3E5D8]();
                  v224 = (void *)[v735 objectAtIndex:ii];
                  v225 = (void *)[v205 objectAtIndex:ii];
                  objc_msgSend( v225,  "_setVersionReference__:",  objc_msgSend((id)objc_msgSend(v224, "objectAtIndex:", 1), "unsignedIntegerValue"));
                  -[NSXPCStoreServer _populateObject:withValuesFromClient:](v225, v224);
                  objc_autoreleasePoolPop(v223);
                }
              }

              __int128 v745 = 0u;
              __int128 v746 = 0u;
              __int128 v743 = 0u;
              __int128 v744 = 0u;
              uint64_t v226 = [v738 countByEnumeratingWithState:&v743 objects:v772 count:16];
              if (v226)
              {
                uint64_t v227 = *(void *)v744;
                do
                {
                  uint64_t v228 = 0LL;
                  do
                  {
                    if (*(void *)v744 != v227) {
                      objc_enumerationMutation(v738);
                    }
                    v229 = *(void **)(*((void *)&v743 + 1) + 8 * v228);
                    v230 = (void *)MEMORY[0x186E3E5D8]();
                    v231 = (void *)[v229 objectAtIndex:0];
                    if (v134) {
                      id v232 = _PFRetainedObjectIDCore((uint64_t)v134, v231, 0LL, 1);
                    }
                    else {
                      id v232 = 0LL;
                    }
                    [v232 willAccessValueForKey:0];
                    objc_msgSend( v232,  "_setVersionReference__:",  objc_msgSend((id)objc_msgSend(v229, "objectAtIndex:", 1), "unsignedIntegerValue"));
                    -[NSXPCStoreServer _populateObject:withValuesFromClient:](v232, v229);

                    objc_autoreleasePoolPop(v230);
                    ++v228;
                  }

                  while (v226 != v228);
                  uint64_t v233 = [v738 countByEnumeratingWithState:&v743 objects:v772 count:16];
                  uint64_t v226 = v233;
                }

                while (v233);
              }

              [v134 processPendingChanges];
              v234 = -[NSManagedObjectContext _newSaveRequestForCurrentState]((uint64_t)v134);
              if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
                _NSCoreDataLog( 8LL,  (uint64_t)@"Made save request: %@",  v235,  v236,  v237,  v238,  v239,  v240,  (uint64_t)v234);
              }
              id v39 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)_NSXPCStoreUtilities,  [*(id *)(v730 + 64) processRequest:v234 fromClientWithContext:v731 error:v771]);
LABEL_385:
              id v654 = v771[0];
              [v728 drain];
              id v655 = v39;
              id v656 = 0LL;
              if (v771[0]) {
                v742 = (char *)v771[0];
              }
              id v657 = v771[0];
              goto LABEL_404;
            }
          }
        }

        v608 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134092 userInfo:0];
      }

      else
      {
        v606 = (void *)MEMORY[0x189607870];
        *(void *)&__int128 v777 = *MEMORY[0x1896075F0];
        uint64_t v724 = v130;
        v781 = (__CFString *)[NSString stringWithFormat:@"Unable to unarchive save request with allowed classes: %@"];
        uint64_t v607 = [MEMORY[0x189603F68] dictionaryWithObjects:&v781 forKeys:&v777 count:1];
        v608 = (void *)[v606 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v607];
      }

      id v39 = 0LL;
      v771[0] = v608;
      goto LABEL_385;
    case 4LL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"OID", v403, v404, v405, v406, v407, v408, v724);
      }
      uint64_t v409 = a1[5];
      if (v409) {
        uint64_t v410 = *(void *)(v409 + 24);
      }
      else {
        uint64_t v410 = 0LL;
      }
      uint64_t v411 = v734[8];
      if (!v411) {
        goto LABEL_324;
      }
      v412 = (void *)v734[7];
      v413 = (void *)MEMORY[0x186E3E5D8]();
      v414 = (void *)MEMORY[0x189604010];
      uint64_t v415 = objc_opt_class();
      uint64_t v416 = objc_opt_class();
      uint64_t v417 = objc_opt_class();
      uint64_t v727 = objc_opt_class();
      uint64_t v724 = v416;
      uint64_t v726 = v417;
      v418 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)_NSXPCStoreUtilities,  v410,  (uint64_t)v412,  [v414 setWithObjects:v415]);
      id v419 = v418;
      objc_autoreleasePoolPop(v413);
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Got oid  request for %@",  v420,  v421,  v422,  v423,  v424,  v425,  (uint64_t)v418);
      }
      v426 = -[NSXPCStoreServerRequestHandlingPolicy processObtainRequest:inContext:error:]( *(void **)(v411 + 64),  v418,  v412,  &v742);
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Returning result %@", v427, v428, v429, v430, v431, v432, (uint64_t)v426);
      }

      if (!v426) {
        goto LABEL_324;
      }
      id v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v426);
      goto LABEL_402;
    case 5LL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Fault", v433, v434, v435, v436, v437, v438, v724);
      }
      uint64_t v439 = a1[5];
      if (v439) {
        uint64_t v440 = *(void *)(v439 + 24);
      }
      else {
        uint64_t v440 = 0LL;
      }
      uint64_t v441 = a1[8];
      if (!v441) {
        goto LABEL_445;
      }
      v442 = (void *)a1[7];
      v776[0] = 0LL;
      id v741 = objc_alloc_init(MEMORY[0x1896077E8]);
      v443 = (void *)MEMORY[0x189604010];
      uint64_t v444 = objc_opt_class();
      uint64_t v445 = objc_opt_class();
      uint64_t v446 = objc_opt_class();
      uint64_t v447 = objc_opt_class();
      objc_opt_class();
      uint64_t v726 = v446;
      uint64_t v727 = v447;
      uint64_t v724 = v445;
      v448 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)_NSXPCStoreUtilities,  v440,  (uint64_t)v442,  [v443 setWithObjects:v444]);
      if ((unint64_t)[v448 count] < 2)
      {
        uint64_t v450 = 0LL;
      }

      else
      {
        uint64_t v449 = [v448 objectAtIndex:1];
        uint64_t v450 = v449;
        if (v449)
        {
          v451 = -[NSXPCStoreServer unpackQueryGeneration:withContext:](v449, v442);
          goto LABEL_300;
        }
      }

      v451 = 0LL;
LABEL_300:
      uint64_t v542 = [v448 firstObject];
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Attempting to fire fault for %@", v543, v544, v545, v546, v547, v548, v542);
      }
      if (v450 && !v451 && +[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
      {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Can't fulfill fault request: can't find query generation: %@",  v549,  v550,  v551,  v552,  v553,  v554,  0LL);
        v555 = (void *)MEMORY[0x189607870];
        v781 = @"unrecognized query generation";
        *(void *)&__int128 v777 = @"reason";
        *((void *)&v777 + 1) = @"generation";
        *(void *)&__int128 v778 = @"target";
        uint64_t v782 = [MEMORY[0x189603FE8] null];
        uint64_t v783 = v542;
        uint64_t v556 = [MEMORY[0x189603F68] dictionaryWithObjects:&v781 forKeys:&v777 count:3];
        v557 = (void *)[v555 errorWithDomain:*MEMORY[0x189607460] code:134061 userInfo:v556];
LABEL_353:
        int v617 = 0;
        id v561 = 0LL;
        v776[0] = v557;
        goto LABEL_372;
      }

      v558 = (void *)[v442 managedObjectContext];
      [v558 setStalenessInterval:0.0];
      uint64_t v559 = objc_msgSend( (id)objc_msgSend(v558, "persistentStoreCoordinator"),  "managedObjectIDForURIRepresentation:",  v542);
      if (!v559)
      {
        v615 = (void *)MEMORY[0x189607870];
        uint64_t v616 = [MEMORY[0x189603F68] dictionaryWithObject:@"missing objectID" forKey:@"reason"];
        v557 = (void *)[v615 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v616];
        goto LABEL_353;
      }

      uint64_t v560 = [*(id *)(v441 + 64) processFaultForObjectWithID:v559 fromClientWithContext:v442 error:v776];
      if (v560) {
        id v561 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v560);
      }
      else {
        id v561 = 0LL;
      }
      int v617 = 1;
LABEL_372:
      id v646 = v776[0];
      [v741 drain];
      if (v776[0]) {
        v742 = (char *)v776[0];
      }
      id v647 = v776[0];
      if (!v617)
      {
LABEL_445:
        id v39 = 0LL;
        goto LABEL_404;
      }

      goto LABEL_375;
    case 6LL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Rel fault", v241, v242, v243, v244, v245, v246, v724);
      }
      uint64_t v247 = a1[5];
      if (v247) {
        uint64_t v248 = *(void *)(v247 + 24);
      }
      else {
        uint64_t v248 = 0LL;
      }
      uint64_t v249 = a1[8];
      if (!v249) {
        goto LABEL_445;
      }
      v250 = (void *)a1[7];
      v776[0] = 0LL;
      id v739 = objc_alloc_init(MEMORY[0x1896077E8]);
      v251 = (void *)MEMORY[0x189604010];
      uint64_t v252 = objc_opt_class();
      uint64_t v253 = objc_opt_class();
      uint64_t v254 = objc_opt_class();
      uint64_t v255 = objc_opt_class();
      objc_opt_class();
      objc_opt_class();
      uint64_t v727 = v255;
      uint64_t v724 = v253;
      uint64_t v726 = v254;
      v256 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)_NSXPCStoreUtilities,  v248,  (uint64_t)v250,  [v251 setWithObjects:v252]);
      v257 = (void *)[v256 firstObject];
      if ((unint64_t)[v256 count] < 2)
      {
        uint64_t v259 = 0LL;
      }

      else
      {
        uint64_t v258 = [v256 objectAtIndex:1];
        uint64_t v259 = v258;
        if (v258)
        {
          v260 = -[NSXPCStoreServer unpackQueryGeneration:withContext:](v258, v250);
          goto LABEL_311;
        }
      }

      v260 = 0LL;
LABEL_311:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Got relationship fault request: %@",  v562,  v563,  v564,  v565,  v566,  v567,  (uint64_t)v257);
      }
      if (v259 && !v260 && +[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
      {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Can't fulfill relationship fault request: can't find query generation: %@",  v568,  v569,  v570,  v571,  v572,  v573,  0LL);
        v574 = (void *)MEMORY[0x189607870];
        v781 = @"unrecognized query generation";
        *(void *)&__int128 v777 = @"reason";
        *((void *)&v777 + 1) = @"generation";
        *(void *)&__int128 v778 = @"request";
        uint64_t v782 = [MEMORY[0x189603FE8] null];
        uint64_t v783 = (uint64_t)v257;
        uint64_t v575 = [MEMORY[0x189603F68] dictionaryWithObjects:&v781 forKeys:&v777 count:3];
        v576 = (void *)[v574 errorWithDomain:*MEMORY[0x189607460] code:134061 userInfo:v575];
      }

      else
      {
        v577 = (void *)[v250 managedObjectContext];
        [v577 setStalenessInterval:0.0];
        uint64_t v578 = objc_msgSend( (id)objc_msgSend(v577, "persistentStoreCoordinator"),  "managedObjectIDForURIRepresentation:",  objc_msgSend(v257, "valueForKey:", @"source"));
        uint64_t v579 = [v257 valueForKey:@"relationship"];
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
        {
          uint64_t v726 = v579;
          _NSCoreDataLog( 8LL,  (uint64_t)@"Attempting to fire fault for %@, %@",  v580,  v581,  v582,  v583,  v584,  v585,  v578);
        }

        if (v578)
        {
          v586 = (void *)[*(id *)(v249 + 64) processFaultForRelationshipWithName:v579 onObjectWithID:v578 fromClientWithContext:v250 error:v776];
          if (v586)
          {
            id v587 = objc_alloc_init(MEMORY[0x189603FA8]);
            if ((void *)[MEMORY[0x189603FE8] null] == v586)
            {
              objc_msgSend(v587, "addObject:", objc_msgSend(MEMORY[0x189603FE8], "null"));
            }

            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                [v586 URIRepresentation];
              }

              else
              {
                __int128 v779 = 0u;
                __int128 v780 = 0u;
                __int128 v777 = 0u;
                __int128 v778 = 0u;
                uint64_t v704 = [v586 countByEnumeratingWithState:&v777 objects:&v781 count:16];
                if (v704)
                {
                  uint64_t v705 = *(void *)v778;
                  do
                  {
                    for (juint64_t j = 0LL; jj != v704; ++jj)
                    {
                      if (*(void *)v778 != v705) {
                        objc_enumerationMutation(v586);
                      }
                      v707 = *(void **)(*((void *)&v777 + 1) + 8 * jj);
                      v708 = (void *)MEMORY[0x186E3E5D8]();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        uint64_t v717 = objc_opt_class();
                        _NSCoreDataLog( 8LL,  (uint64_t)@"Wrong in all kinds of ways. Less colloquially, that should be an object ID, but it's an instance of %@ instead",  v718,  v719,  v720,  v721,  v722,  v723,  v717);
                        goto LABEL_447;
                      }

                      objc_msgSend(v587, "addObject:", objc_msgSend(v707, "URIRepresentation"));
                      objc_autoreleasePoolPop(v708);
                    }

                    uint64_t v704 = [v586 countByEnumeratingWithState:&v777 objects:&v781 count:16];
                  }

                  while (v704);
                }
              }
            }

            if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
            {
              uint64_t v726 = v579;
              uint64_t v727 = (uint64_t)v587;
              _NSCoreDataLog( 8LL,  (uint64_t)@"Fired relationship fault %@ - %@, returning values: %@",  v709,  v710,  v711,  v712,  v713,  v714,  v578);
            }

            id v561 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v587);
          }

          else
          {
            if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
            {
              uint64_t v726 = v579;
              _NSCoreDataLog( 8LL,  (uint64_t)@"Attempted to fire relationship fault %@ - %@, no such luck",  v648,  v649,  v650,  v651,  v652,  v653,  v578);
            }

            id v561 = 0LL;
          }

          int v620 = 1;
LABEL_442:
          id v715 = v776[0];
          [v739 drain];
          if (v776[0]) {
            v742 = (char *)v776[0];
          }
          id v716 = v776[0];
          if (!v620) {
            goto LABEL_445;
          }
LABEL_375:
          id v332 = v561;
          goto LABEL_403;
        }

        v618 = (void *)MEMORY[0x189607870];
        uint64_t v619 = [MEMORY[0x189603F68] dictionaryWithObject:v257 forKey:@"originalRequest"];
        v576 = (void *)[v618 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v619];
      }

      int v620 = 0;
      id v561 = 0LL;
      v776[0] = v576;
      goto LABEL_442;
    case 7LL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Request notification name", v303, v304, v305, v306, v307, v308, v724);
      }
      if (!a1[8]) {
        goto LABEL_445;
      }
      v309 = (void *)a1[7];
      v310 = (void *)MEMORY[0x186E3E5D8]();
      v317 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v309, "managedObjectContext"),  "persistentStoreCoordinator"),  "persistentStores"),  "lastObject");
      if (!v317) {
        _NSCoreDataLog(8LL, (uint64_t)@"no store", v311, v312, v313, v314, v315, v316, v724);
      }
      *(void *)&__int128 v777 = @"notificationName";
      v781 = (__CFString *)+[_PFRoutines _remoteChangeNotificationNameForStore:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v317);
      uint64_t v318 = [MEMORY[0x189603F68] dictionaryWithObjects:&v781 forKeys:&v777 count:1];
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Got pull changes result %@", v319, v320, v321, v322, v323, v324, v318);
      }
      id v325 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v318);
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Which archives to %@", v326, v327, v328, v329, v330, v331, (uint64_t)v325);
      }
      objc_autoreleasePoolPop(v310);
      id v332 = v325;
      goto LABEL_403;
    case 9LL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Query generation", v333, v334, v335, v336, v337, v338, v724);
      }
      if (!a1[8]) {
        goto LABEL_324;
      }
      v339 = (void *)a1[7];
      v340 = (void *)MEMORY[0x186E3E5D8]();
      v341 = (void *)[v339 persistentStoreCoordinator];
      v342 = (void *)[v341 _retainedCurrentQueryGeneration:0];
      v349 = (void *)objc_msgSend((id)objc_msgSend(v341, "persistentStores"), "lastObject");
      if (!v349) {
        _NSCoreDataLog(8LL, (uint64_t)@"no store", v343, v344, v345, v346, v347, v348, v724);
      }
      v350 = (NSQueryGenerationToken *)-[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v342, v349);
      v351 = -[NSXPCStoreServer retainedXPCEncodableGenerationTokenForOriginal:inContext:](v350, v339);
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Got queryGeneration %@", v352, v353, v354, v355, v356, v357, (uint64_t)v342);
      }

      id v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v351);
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        goto LABEL_400;
      }
      goto LABEL_401;
    case 0xALL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Query generation release", v469, v470, v471, v472, v473, v474, v724);
      }
      uint64_t v475 = a1[5];
      if (v475) {
        uint64_t v476 = *(void *)(v475 + 24);
      }
      else {
        uint64_t v476 = 0LL;
      }
      if (!a1[8]) {
        goto LABEL_324;
      }
      v477 = (void *)a1[7];
      v340 = (void *)MEMORY[0x186E3E5D8]();
      v478 = (void *)MEMORY[0x189604010];
      uint64_t v479 = objc_opt_class();
      uint64_t v480 = objc_opt_class();
      uint64_t v726 = objc_opt_class();
      uint64_t v727 = 0LL;
      uint64_t v724 = v480;
      uint64_t v481 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)_NSXPCStoreUtilities,  v476,  (uint64_t)v477,  [v478 setWithObjects:v479]);
      if (v481) {
        -[NSXPCStoreServerPerConnectionCache releaseQueryGenerationForRemoteGeneration:]( (id *)[v477 cache],  *(void *)(v481 + 24));
      }
      else {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Attempting to free nothing (or too many things) %@",  v482,  v483,  v484,  v485,  v486,  v487,  0LL);
      }
      id v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  MEMORY[0x189604A88]);
      goto LABEL_401;
    case 0xBLL:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Query generation reopen", v452, v453, v454, v455, v456, v457, v724);
      }
      uint64_t v458 = a1[5];
      if (v458) {
        uint64_t v459 = *(void *)(v458 + 24);
      }
      else {
        uint64_t v459 = 0LL;
      }
      if (!a1[8]) {
        goto LABEL_324;
      }
      v460 = (void *)a1[7];
      v340 = (void *)MEMORY[0x186E3E5D8]();
      v461 = (void *)MEMORY[0x189604010];
      uint64_t v462 = objc_opt_class();
      uint64_t v463 = objc_opt_class();
      uint64_t v726 = objc_opt_class();
      uint64_t v727 = 0LL;
      uint64_t v724 = v463;
      uint64_t v464 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)_NSXPCStoreUtilities,  v459,  (uint64_t)v460,  [v461 setWithObjects:v462]);
      uint64_t v465 = v464;
      if (!v464)
      {
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
        {
          _NSCoreDataLog( 8LL,  (uint64_t)@"Bad parameter to reopen generation %@",  v609,  v610,  v611,  v612,  v613,  v614,  0LL);
          v468 = 0LL;
          goto LABEL_399;
        }

        goto LABEL_398;
      }

      uint64_t v466 = *(void *)(v464 + 24);
      v467 = (NSQueryGenerationToken *)-[NSXPCStoreServerPerConnectionCache localGenerationForRemoteGeneration:]( (id *)[v460 cache],  v466);
      if (v467)
      {
        v468 = -[NSXPCStoreServer retainedXPCEncodableGenerationTokenForOriginal:inContext:](v467, v460);
        goto LABEL_399;
      }

      v621 = (NSQueryGenerationToken *)-[NSPersistentStoreCoordinator _reopenQueryGenerationWithIdentifier:inStoreWithIdentifier:error:]( [v460 persistentStoreCoordinator],  v466,  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v460, "persistentStoreCoordinator"),  "persistentStores"),  "firstObject"),  "identifier"),  0);
      v622 = v621;
      if (!v621)
      {
        if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
          _NSCoreDataLog( 8LL,  (uint64_t)@"Unable to reopen generation %@",  v667,  v668,  v669,  v670,  v671,  v672,  v465);
        }
LABEL_398:
        v468 = 0LL;
        goto LABEL_399;
      }

      v623 = -[NSXPCStoreServer retainedXPCEncodableGenerationTokenForOriginal:inContext:](v621, v460);
      v468 = v623;
      if (v623) {
        uint64_t isa = (uint64_t)v623[3].super.isa;
      }
      else {
        uint64_t isa = 0LL;
      }
      -[NSXPCStoreServerPerConnectionCache registerQueryGeneration:forRemoteGeneration:]( (void *)[v460 cache],  v622,  isa);
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Reopened generation %@", v625, v626, v627, v628, v629, v630, (uint64_t)v468);
      }
LABEL_399:
      id v358 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v468);

      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
LABEL_400:
      }
        _NSCoreDataLog(8LL, (uint64_t)@"Which archives to %@", v359, v360, v361, v362, v363, v364, (uint64_t)v358);
LABEL_401:
      objc_autoreleasePoolPop(v340);
LABEL_402:
      id v332 = v358;
LABEL_403:
      id v39 = v332;
LABEL_404:
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault")) {
        _NSCoreDataLog(8LL, (uint64_t)@"Done event handler", v673, v674, v675, v676, v677, v678, v724);
      }
      if (!*(_BYTE *)(*(void *)(v734[12] + 8) + 24LL))
      {
        a1 = v734;
        goto LABEL_408;
      }

      v680 = v742;
      if (v742)
      {
        a1 = v734;
        if (-[NSXPCStoreServer errorIsPlausiblyAnSQLiteIssue:](v734[8], v742))
        {
          if (-[NSXPCStoreServer setupRecoveryForConnectionContext:ifNecessary:]( v734[8],  v734[7],  (uint64_t)v742)) {
            v696 = @"SQLite error on server: %@, recovery being attempted";
          }
          else {
            v696 = @"SQLite error on server: %@, no recovery being attempted";
          }
          *(void *)(*(void *)(v734[13] + 8) + 40) = objc_msgSend( NSString,  "stringWithFormat:",  v696,  v742,  v726,  v727);
          +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  *(void *)(*(void *)(v734[13] + 8) + 40LL),  v734[8],  v697,  v698,  v699,  v700,  v701,  v725);
        }

        goto LABEL_410;
      }

      a1 = v734;
      if (v39)
      {
        uint64_t v681 = 0LL;
      }

      else
      {
        v702 = (void *)MEMORY[0x189607870];
        uint64_t v703 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"request failed (no result, no error)",  @"Problem");
        id v39 = 0LL;
        v742 = (char *)[v702 errorWithDomain:*MEMORY[0x189607460] code:134070 userInfo:v703];
        uint64_t v681 = 8LL;
      }

- (NSXPCStoreServerDelegate)delegate
{
  return (NSXPCStoreServerDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8](self, a2, a3, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSXPCStoreManagedObjectArchivingToken);
    a5 = (id)[a5 objectID];
LABEL_5:
    uint64_t v8 = -[NSXPCStoreManagedObjectArchivingToken initWithURI:]( v7,  "initWithURI:",  [a5 URIRepresentation]);
    objc_autoreleasePoolPop(v6);
    return v8;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSXPCStoreManagedObjectArchivingToken);
    goto LABEL_5;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (+[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken") == a5)
    {
      a5 = @"current";
    }

    else if (+[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken") == a5)
    {
      a5 = @"unpinned";
    }

    else
    {
      +[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken");
    }
  }

  objc_autoreleasePoolPop(v6);
  return a5;
}

- (NSQueryGenerationToken)retainedXPCEncodableGenerationTokenForOriginal:(NSQueryGenerationToken *)a1 inContext:(void *)a2
{
  uint64_t v4 = (void *)MEMORY[0x186E3E5D8]();
  if (+[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken") == a1 || +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken") == a1)
  {
    uint64_t v9 = a1;
    goto LABEL_13;
  }

  if (+[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken") == a1)
  {
    uint64_t v9 = 0LL;
    goto LABEL_13;
  }

  if (a1)
  {
    Class isa = a1[2].super.isa;
    if (isa) {
      id WeakRetained = objc_loadWeakRetained((id *)&isa[1].isa);
    }
    else {
      id WeakRetained = 0LL;
    }
    uint64_t v7 = objc_alloc(&OBJC_CLASS____NSXPCQueryGenerationToken);
    Class v8 = a1[3].super.isa;
    if (v7) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v9 = 0LL;
    goto LABEL_9;
  }

  uint64_t v7 = objc_alloc(&OBJC_CLASS____NSXPCQueryGenerationToken);
  id WeakRetained = 0LL;
  Class v8 = 0LL;
  if (!v7) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v9 = (NSQueryGenerationToken *)-[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:]( v7,  v8,  WeakRetained,  0);
LABEL_9:

  uint64_t v10 = (void *)[a2 cache];
  if (a1) {
    uint64_t v11 = (uint64_t)a1[3].super.isa;
  }
  else {
    uint64_t v11 = 0LL;
  }
  -[NSXPCStoreServerPerConnectionCache registerQueryGeneration:forRemoteGeneration:](v10, a1, v11);
LABEL_13:
  objc_autoreleasePoolPop(v4);
  return v9;
}

- (NSQueryGenerationToken)unpackQueryGeneration:(uint64_t)a1 withContext:(void *)a2
{
  uint64_t v4 = (void *)MEMORY[0x186E3E5D8]();
  if ([@"current" isEqual:a1])
  {
    uint64_t v5 = +[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken");
  }

  else if ([@"unpinned" isEqual:a1])
  {
    uint64_t v5 = +[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken");
  }

  else
  {
    uint64_t v6 = (void *)MEMORY[0x186E3E5D8]();
    if (a1) {
      uint64_t v7 = *(void *)(a1 + 24);
    }
    else {
      uint64_t v7 = 0LL;
    }
    Class v8 = (void *)-[NSXPCStoreServerPerConnectionCache localGenerationForRemoteGeneration:]( (id *)[a2 cache],  v7);
    if (!v8)
    {
      unint64_t v9 = [a2 persistentStoreCoordinator];
      uint64_t v10 = a1 ? *(void *)(a1 + 8) : 0LL;
      Class v8 = -[NSPersistentStoreCoordinator _reopenQueryGenerationWithIdentifier:inStoreWithIdentifier:error:]( v9,  v7,  v10,  0LL);
      if (v8)
      {
        -[NSXPCStoreServerPerConnectionCache registerQueryGeneration:forRemoteGeneration:]( (void *)[a2 cache],  v8,  v7);
        Class v8 = (void *)-[NSXPCStoreServerPerConnectionCache localGenerationForRemoteGeneration:]( (id *)[a2 cache],  v7);
      }
    }

    id v11 = v8;
    objc_autoreleasePoolPop(v6);
    uint64_t v5 = v8;
  }

  uint64_t v12 = v5;
  if (v5)
  {
    uint64_t v21 = 0LL;
    if ((objc_msgSend((id)objc_msgSend(a2, "managedObjectContext"), "setQueryGenerationFromToken:error:", v5, &v21) & 1) == 0)
    {
      if (+[NSXPCStoreServer debugDefault](&OBJC_CLASS___NSXPCStoreServer, "debugDefault"))
      {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Failed to set query generation on context: %@ -> %@ (%@)",  v13,  v14,  v15,  v16,  v17,  v18,  a1);
        uint64_t v12 = 0LL;
      }
    }

    uint64_t v19 = v12;
    objc_autoreleasePoolPop(v4);
    return v12;
  }

  else
  {
    objc_autoreleasePoolPop(v4);
    return 0LL;
  }

- (uint64_t)_populateObject:(void *)a1 withValuesFromClient:(void *)a2
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v47 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v4 = (void *)[a1 managedObjectContext];
  uint64_t v5 = (void *)[a1 entity];
  objc_msgSend( a1,  "_setVersionReference__:",  objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 1), "longLongValue"));
  uint64_t v56 = a2;
  uint64_t v55 = [a2 objectAtIndex:2];
  if (v5) {
    uint64_t v6 = (void *)v5[14];
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "values");
  unint64_t v8 = v6[6];
  uint64_t v9 = v6[7];
  uint64_t v10 = [MEMORY[0x189603FE8] null];
  uint64_t v53 = v10;
  BOOL v11 = v8 < v9 + v8;
  uint64_t v49 = v7;
  if (v8 < v9 + v8)
  {
    uint64_t v50 = v6;
    uint64_t v12 = 0LL;
    uint64_t v13 = v7;
    char v14 = 0;
    uint64_t v15 = v9 + 3;
    uint64_t v16 = v13 + 8 * v8;
    while (1)
    {
      uint64_t v17 = [*(id *)(v16 + 8 * v12) name];
      uint64_t v10 = [v56 objectAtIndex:v12 + 3];
      if (v10 != v55)
      {
        uint64_t v18 = v10;
        uint64_t v10 = [a1 valueForKey:v17];
        if (v10 != v18)
        {
          uint64_t v10 = [(id)v10 isEqual:v18];
          if ((v10 & 1) == 0) {
            break;
          }
        }
      }

      if ((v14 & 1) == 0)
      {
        uint64_t v19 = [a1 valueForKey:v17];
LABEL_14:
        uint64_t v10 = [a1 setValue:v19 forKey:v17];
      }

      ++v12;
      char v14 = 1;
      if (v9 == v12)
      {
        uint64_t v7 = v49;
        uint64_t v6 = v50;
        goto LABEL_18;
      }
    }

    if (v53 == v18) {
      uint64_t v19 = 0LL;
    }
    else {
      uint64_t v19 = v18;
    }
    goto LABEL_14;
  }

  uint64_t v15 = 3LL;
LABEL_18:
  unint64_t v20 = v6[12];
  uint64_t v21 = v6[13];
  uint64_t v48 = a1;
  if (v20 >= v21 + v20) {
    goto LABEL_32;
  }
  uint64_t v51 = v21 + v15;
  uint64_t v22 = (id *)(v7 + 8 * v20);
  do
  {
    uint64_t v23 = [*v22 name];
    uint64_t v10 = [v56 objectAtIndex:v15];
    if (v10 == v55
      || (v24 = v10, uint64_t v10 = [a1 valueForKey:v23], v10 == v24)
      || (uint64_t v10 = [(id)v10 isEqual:v24], (v10 & 1) != 0))
    {
      if (v11) {
        goto LABEL_29;
      }
      uint64_t v25 = [a1 valueForKey:v23];
    }

    else
    {
      if (v53 == v24)
      {
        uint64_t v26 = 0LL;
        goto LABEL_28;
      }

      uint64_t v25 = [v4 existingObjectWithID:v24 error:0];
    }

    uint64_t v26 = v25;
LABEL_28:
    uint64_t v10 = [a1 setValue:v26 forKey:v23];
LABEL_29:
    ++v15;
    ++v22;
    BOOL v11 = 1;
    --v21;
  }

  while (v21);
  uint64_t v15 = v51;
LABEL_32:
  unint64_t v28 = v6[14];
  uint64_t v27 = v6[15];
  if (v28 < v27 + v28)
  {
    uint64_t v52 = v27 + v15;
    do
    {
      uint64_t v29 = (void *)MEMORY[0x186E3E5D8](v10);
      uint64_t v30 = [*(id *)(v7 + 8 * v28) name];
      uint64_t v31 = (void *)[v56 objectAtIndex:v15];
      if (v55 == [v31 objectAtIndex:0])
      {
        if (!v11) {
          objc_msgSend(v48, "setValue:forKey:", objc_msgSend(v48, "valueForKey:", v30), v30);
        }
        BOOL v11 = 1;
      }

      else
      {
        uint64_t v32 = (void *)[v31 objectAtIndex:0];
        uint64_t v33 = (void *)[v31 objectAtIndex:1];
        uint64_t v54 = (void *)[v48 mutableSetValueForKey:v30];
        if ([v32 count])
        {
          id v34 = objc_alloc_init(MEMORY[0x189603FE0]);
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          uint64_t v35 = [v32 countByEnumeratingWithState:&v61 objects:v66 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v62;
            do
            {
              uint64_t v38 = 0LL;
              do
              {
                if (*(void *)v62 != v37) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v39 = [v4 existingObjectWithID:*(void *)(*((void *)&v61 + 1) + 8 * v38) error:0];
                if (v39) {
                  [v34 addObject:v39];
                }
                ++v38;
              }

              while (v36 != v38);
              uint64_t v36 = [v32 countByEnumeratingWithState:&v61 objects:v66 count:16];
            }

            while (v36);
          }

          [v54 unionSet:v34];

          BOOL v11 = 1;
          uint64_t v7 = v49;
        }

        if ([v33 count])
        {
          id v40 = objc_alloc_init(MEMORY[0x189603FE0]);
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          uint64_t v41 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v58;
            do
            {
              uint64_t v44 = 0LL;
              do
              {
                if (*(void *)v58 != v43) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v45 = [v4 existingObjectWithID:*(void *)(*((void *)&v57 + 1) + 8 * v44) error:0];
                if (v45) {
                  [v40 addObject:v45];
                }
                ++v44;
              }

              while (v42 != v44);
              uint64_t v42 = [v33 countByEnumeratingWithState:&v57 objects:v65 count:16];
            }

            while (v42);
          }

          [v54 minusSet:v40];

          BOOL v11 = 1;
          uint64_t v7 = v49;
        }
      }

      ++v15;
      objc_autoreleasePoolPop(v29);
      ++v28;
    }

    while (v15 != v52);
  }

  return [v47 drain];
}

@end