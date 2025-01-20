@interface NSXPCStore
+ (BOOL)_allowCoreDataFutures;
+ (BOOL)_isOnExtendedTimeout;
+ (id)archiver:(id)a3 willEncodeObject:(id)a4;
+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
+ (int)debugDefault;
+ (void)initialize;
+ (void)setDebugDefault:(int)a3;
- (BOOL)_allowCoreDataFutures;
- (BOOL)_hasActiveGenerations;
- (BOOL)load:(id *)a3;
- (BOOL)loadMetadata:(id *)a3;
- (BOOL)supportsConcurrentRequestHandling;
- (BOOL)supportsGenerationalQuerying;
- (Class)_objectIDClass;
- (Class)objectIDFactoryForSQLEntity:(id)a3;
- (NSString)remoteStoreChangedNotificationName;
- (NSXPCStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4;
- (id)_rawMetadata__;
- (id)_storeInfoForEntityDescription:(id)a3;
- (id)ancillaryModels;
- (id)ancillarySQLModels;
- (id)connectionManager;
- (id)currentChangeToken;
- (id)currentQueryGeneration;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)fileBackedFuturesDirectory;
- (id)metadata;
- (id)model;
- (id)newForeignKeyID:(int64_t)a3 entity:(id)a4;
- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)objectIDFactoryForEntity:(id)a3;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4;
- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
- (id)sendMessage:(void *)a3 fromContext:(void *)a4 interrupts:(void *)a5 error:;
- (id)sqlCore;
- (id)type;
- (os_unfair_lock_s)_cachedRowForObjectWithID:(void *)a3 generation:;
- (os_unfair_lock_s)_cachedRowForRelationship:(const void *)a3 onObjectWithID:(void *)a4 generation:;
- (uint64_t)_commitChangesForRequestContext:(uint64_t)a1;
- (uint64_t)_executeSaveRequestForContext:(void *)a3 error:;
- (uint64_t)decodePrefetchArray:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:;
- (void)_clearCachedRowForObjectWithID:(void *)a3 generation:;
- (void)_prepareStoreForRemovalFromCoordinator:(id)a3;
- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4;
- (void)cacheContents:(void *)a3 ofRelationship:(void *)a4 onObjectWithID:(void *)a5 withTimestamp:(double)a6 generation:;
- (void)cacheFetchedRows:(void *)a3 forManagedObjects:(void *)a4 generation:;
- (void)dealloc;
- (void)decodePrefetchResult:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:;
- (void)executeFetchRequest:(NSManagedObjectContext *)a3 withContext:(void *)a4 error:;
- (void)freeQueryGenerationWithIdentifier:(id)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setURL:(id)a3;
- (void)willRemoveFromPersistentStoreCoordinator:(id)a3;
@end

@implementation NSXPCStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dword_18C694DF4 = +[_PFRoutines integerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.XPCDebug");
    v3 = getprogname();
    if (v3)
    {
      if (*v3)
      {
        if (!strncmp("PhotosReliveWidget", v3, 0x12uLL)) {
          atomic_store(1u, _MergedGlobals_118);
        }
      }
    }
  }

- (BOOL)_allowCoreDataFutures
{
  return 1;
}

+ (BOOL)_allowCoreDataFutures
{
  return 1;
}

+ (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  v5 = (void *)MEMORY[0x186E3E5D8](a1, a2, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc(&OBJC_CLASS___NSXPCStoreManagedObjectArchivingToken);
    id v7 = (id)[a4 objectID];
LABEL_5:
    uint64_t v8 = -[NSXPCStoreManagedObjectArchivingToken initWithURI:]( v6,  "initWithURI:",  [v7 URIRepresentation]);
LABEL_6:
    v9 = (void *)v8;
    objc_autoreleasePoolPop(v5);
    return v9;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc(&OBJC_CLASS___NSXPCStoreManagedObjectArchivingToken);
    id v7 = a4;
    goto LABEL_5;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v8 = +[_NSXPCStoreUtilities newUserInfoFromException:]((uint64_t)&OBJC_CLASS____NSXPCStoreUtilities, a4);
    goto LABEL_6;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v11 = objc_alloc(MEMORY[0x189603F50]);
    [a4 timeIntervalSinceReferenceDate];
    uint64_t v8 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    goto LABEL_6;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (+[NSQueryGenerationToken currentQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "currentQueryGenerationToken") == a4)
    {
      a4 = @"current";
    }

    else if (+[NSQueryGenerationToken unpinnedQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "unpinnedQueryGenerationToken") == a4)
    {
      a4 = @"unpinned";
    }

    else
    {
      +[NSQueryGenerationToken nostoresQueryGenerationToken]( &OBJC_CLASS___NSQueryGenerationToken,  "nostoresQueryGenerationToken");
    }
  }

  objc_autoreleasePoolPop(v5);
  return a4;
}

+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return (id)[a1 archiver:a4 willEncodeObject:a5];
}

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return (id)[(id)objc_opt_class() replacementObjectForXPCConnection:a3 encoder:a4 object:a5];
}

- (NSXPCStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  id v6 = a6;
  uint64_t v60 = *MEMORY[0x1895F89C0];
  if ([a6 valueForKey:@"serviceName"]
    || [v6 valueForKey:@"NSXPCStoreServiceName"]
    || [v6 valueForKey:@"NSXPCStoreServerEndpointFactory"])
  {
    id v47 = a4;
    if (objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"skipModelCheck"), "BOOLValue"))
    {
      if ([v6 valueForKey:@"NSXPCStoreServerEndpointFactory"]
        && ![v6 valueForKey:@"NSPersistentHistoryTrackingKey"])
      {
        id v6 = (id)[MEMORY[0x189603FC8] dictionaryWithDictionary:v6];
        [v6 setValue:MEMORY[0x189604A88] forKey:@"NSPersistentHistoryTrackingKey"];
      }
    }

    else
    {
      v10 = (void *)[a3 managedObjectModel];
      v45 = self;
      id v46 = a5;
      if ([a4 length]
        && ![a4 isEqualToString:@"PF_DEFAULT_CONFIGURATION_NAME"])
      {
        id v11 = (void *)[v10 entitiesForConfiguration:a4];
      }

      else
      {
        id v11 = (void *)[v10 entities];
      }

      v12 = v11;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v55;
        do
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v55 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            __int128 v50 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            __int128 v53 = 0u;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v51;
              while (2)
              {
                for (uint64_t j = 0LL; j != v17; ++j)
                {
                  if (*(void *)v51 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  v20 = *(void **)(*((void *)&v50 + 1) + 8 * j);
                  if ([v20 _propertyType] == 4
                    && [v20 isToMany]
                    && [v20 isOrdered])
                  {
                    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"XPC store does not currently allow models containing ordered relationships" userInfo:0]);
                    goto LABEL_50;
                  }
                }

                uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }
          }

          uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }

        while (v13);
      }

      a5 = v46;
      a4 = v47;
      self = v45;
    }

    v49.receiver = self;
    v49.super_class = (Class)&OBJC_CLASS___NSXPCStore;
    v26 = -[NSPersistentStore initWithPersistentStoreCoordinator:configurationName:URL:options:]( &v49,  sel_initWithPersistentStoreCoordinator_configurationName_URL_options_,  a3,  a4,  a5,  v6);
    if (!v26)
    {
      +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)@"Unable to initialize client",  0LL,  v21,  v22,  v23,  v24,  v25,  v44);
      return v26;
    }

    v26->_requestTerminationSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
    v26->_cache = -[NSGenerationalRowCache initWithStore:]( objc_alloc(&OBJC_CLASS___NSGenerationalRowCache),  "initWithStore:",  v26);
    v27 = -[NSSQLModel initWithManagedObjectModel:]( [NSSQLModel alloc],  "initWithManagedObjectModel:",  [a3 managedObjectModel]);
    v26->_model = v27;
    if (!v27) {
      +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)@"Unable to load model",  (uint64_t)v26,  v28,  v29,  v30,  v31,  v32,  v44);
    }
    v26->_sanityCheckToken = 0LL;
    v26->_stateLock._os_unfair_lock_opaque = 0;
    v26->_outstandingRequests = 0;
    v26->_connectionManager = (NSXPCStoreConnectionManager *)-[NSXPCStoreConnectionManager initForStore:]( objc_alloc(&OBJC_CLASS___NSXPCStoreConnectionManager),  "initForStore:",  v26);
    if (a3)
    {
      id v33 = objc_alloc_init(MEMORY[0x189603FC8]);
      id v34 = objc_alloc_init(MEMORY[0x189603FC8]);
      v35 = (void *)[MEMORY[0x189603FC8] dictionaryWithDictionary:v6];
      [v35 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"NSXPCStoreDelegate"];
      uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"/dev/null/CDInternalXPCStore-%p", v26);
      v37 = objc_alloc(&OBJC_CLASS___NSSQLCore);
      v38 = -[NSSQLCore initWithPersistentStoreCoordinator:configurationName:URL:options:]( v37,  "initWithPersistentStoreCoordinator:configurationName:URL:options:",  0,  v47,  [MEMORY[0x189604030] fileURLWithPath:v36],  v35);
      v26->_core = (NSSQLCore *)v38;
      -[NSSQLCore _useModel:](v38, v26->_model);
    }

    else
    {
      id v34 = 0LL;
      id v33 = 0LL;
    }

    uint64_t v39 = [v6 objectForKey:@"NSPersistentHistoryTrackingKey"];
    if (!a3 || !v39)
    {
LABEL_45:
      v26->_ancillaryModels = (NSDictionary *)[v33 copy];
      v26->_ancillarySQLModels = (NSDictionary *)[v34 copy];

      return v26;
    }

    v40 = (void *)[v6 objectForKey:@"NSPersistentHistoryTrackingKey"];
    if ([v40 isNSDictionary] & 1) != 0 || (objc_msgSend(v40, "isNSNumber"))
    {
      if (([v40 isNSDictionary] & 1) != 0
        || [v40 isNSNumber] && objc_msgSend(v40, "BOOLValue"))
      {
        id v41 = -[NSDictionary objectForKey:]( -[NSSQLCore ancillaryModels](v26->_core, "ancillaryModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey");
        -[_PFModelMap addManagedObjectModel:](*((void *)a3 + 12), v41);
        [v33 setObject:v41 forKey:@"NSPersistentHistoryTrackingKey"];
        objc_msgSend( v34,  "setObject:forKey:",  objc_msgSend( -[NSSQLCore ancillarySQLModels](v26->_core, "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  @"NSPersistentHistoryTrackingKey");
        id v42 = +[_PFPersistentHistoryFetchModel newFetchHistoryModelForCoordinator:andOptions:]();
        -[_PFModelMap addManagedObjectModel:](*((void *)a3 + 12), v42);
      }

      goto LABEL_45;
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"No service name or endpoint factory supplied" userInfo:0]);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPersistentHistoryTrackingKey must be a NSNumber" userInfo:0]);
LABEL_50:
  __break(1u);
  return result;
}

- (void)dealloc
{
  self->_ancillaryModels = 0LL;
  self->_ancillarySQLModels = 0LL;

  self->_connectionManager = 0LL;
  -[NSXPCStoreNotificationObserver setStore:]((id *)&self->_observer->super.isa, 0LL);

  self->_observer = 0LL;
  requestTerminationSem = (dispatch_object_s *)self->_requestTerminationSem;
  if (requestTerminationSem) {
    dispatch_release(requestTerminationSem);
  }

  self->_remoteStoreChangedNotificationName = 0LL;
  self->_cache = 0LL;

  self->_model = 0LL;
  self->_metadata = 0LL;

  self->_core = 0LL;
  self->_sanityCheckToken = 0LL;

  self->_fileBackedFuturesDirectory = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSXPCStore;
  -[NSIncrementalStore dealloc](&v4, sel_dealloc);
}

- (void)willRemoveFromPersistentStoreCoordinator:(id)a3
{
  if (self) {
    -[NSXPCStoreConnectionManager disconnectAllConnections:]((uint64_t)self->_connectionManager, 1);
  }
  -[NSXPCStoreNotificationObserver setStore:]((id *)&self->_observer->super.isa, 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSXPCStore;
  -[NSPersistentStore willRemoveFromPersistentStoreCoordinator:](&v5, sel_willRemoveFromPersistentStoreCoordinator_, a3);
}

- (BOOL)supportsConcurrentRequestHandling
{
  id v2 = -[NSDictionary valueForKey:]( -[NSPersistentStore options](self, "options"),  "valueForKey:",  @"NSPersistentStoreConnectionPoolMaxSize");
  uint64_t v3 = [v2 integerValue];
  if (v2) {
    BOOL v4 = v3 <= 0;
  }
  else {
    BOOL v4 = 0;
  }
  return !v4;
}

- (id)sendMessage:(void *)a3 fromContext:(void *)a4 interrupts:(void *)a5 error:
{
  uint64_t v125 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (self)
  {
    v10 = (void *)a1[23];
    if (v10) {
      objc_setProperty_nonatomic(self, (SEL)self, v10, 32LL);
    }
  }

  v114 = a5;
  if (!a3) {
    goto LABEL_12;
  }
  id v11 = (id)[*(id *)(a3[21] + 168) copy];
  if (self)
  {
    id v13 = v11;
    if (v11) {
      objc_setProperty_nonatomic(self, v12, v11, 40LL);
    }
  }

  id v14 = (id)objc_msgSend(*(id *)(a3[21] + 128), "copy", v13);
  if (!v14)
  {
LABEL_12:
    char v16 = [a3 _allowAncillaryEntities];
    if (self) {
      goto LABEL_13;
    }
LABEL_95:
    char v17 = 1;
    goto LABEL_14;
  }

  if (!self)
  {
    [a3 _allowAncillaryEntities];
    goto LABEL_95;
  }

  objc_setProperty_nonatomic(self, v15, v14, 48LL);
  char v16 = [a3 _allowAncillaryEntities];
LABEL_13:
  char v17 = 0;
  *((_BYTE *)self + 16) = v16;
LABEL_14:
  uint64_t v18 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "processName");
  if ((v17 & 1) == 0) {
    objc_setProperty_nonatomic(self, v19, v18, 56LL);
  }
  unint64_t v20 = 0LL;
  unint64_t v21 = 0x189607000uLL;
  while (1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (a1[20])
    {
      unint64_t v23 = v21;
      uint64_t v24 = -[NSXPCStoreMessageContext initForMessage:store:]( objc_alloc(&OBJC_CLASS___NSXPCStoreMessageContext),  "initForMessage:store:",  self,  a1);
      -[NSXPCStoreConnectionManager sendMessageWithContext:](a1[20], (uint64_t)v24);
      if (v24) {
        uint64_t v25 = (void *)v24[3];
      }
      else {
        uint64_t v25 = 0LL;
      }
      id v26 = v25;
      if (v114)
      {
        if (v24) {
          v27 = (void *)v24[4];
        }
        else {
          v27 = 0LL;
        }
        void *v114 = v27;
      }

      unint64_t v21 = v23;
      if (v26) {
        break;
      }
    }

    uint64_t v29 = objc_msgSend(*(id *)(v21 + 2600), "stringWithFormat:", @"sendMessage: failed #%d", v20);
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v29,  (uint64_t)a1,  v30,  v31,  v32,  v33,  v34,  v109);
    unint64_t v40 = v20 + 1;
    *a4 = v20 + 1;
    if (v20 == 2)
    {
      +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)@"Unable to sendMessage: to server",  (uint64_t)a1,  v35,  v36,  v37,  v38,  v39,  v108);
LABEL_28:
      if ((objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a1, "options"), "valueForKey:", @"NSXPCStoreSkipRetryWaitKey"),  "BOOLValue") & 1) == 0)
      {
        double v41 = CFAbsoluteTimeGetCurrent();
        if (v20 < 4) {
          unsigned int v42 = 3;
        }
        else {
          unsigned int v42 = +[NSXPCStore _isOnExtendedTimeout](&OBJC_CLASS___NSXPCStore, "_isOnExtendedTimeout") ? 60 : 3;
        }
        double v28 = v41 - Current;
      }

      goto LABEL_36;
    }

    if (v20) {
      goto LABEL_28;
    }
LABEL_36:
    ++v20;
    if (v40 == 8)
    {
      id v26 = 0LL;
      int v43 = 1;
      goto LABEL_41;
    }
  }

  int v43 = 0;
LABEL_41:
  if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault", v28) >= 1)
  {
    NSLog((NSString *)@"Got reply pointer: %p", v26);
    uint64_t v108 = (uint64_t)v26;
    NSLog((NSString *)@"Got reply: %@");
  }

  if (v43)
  {
    uint64_t v44 = *(void **)(v21 + 2600);
    uint64_t v110 = [a1 options];
    uint64_t v45 = [v44 stringWithFormat:@"Unable to connect to server with options %@"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v45,  (uint64_t)a1,  v46,  v47,  v48,  v49,  v50,  v110);
    __int128 v51 = v114;
    if (v114)
    {
      __int128 v52 = (void *)MEMORY[0x189607870];
      uint64_t v53 = *MEMORY[0x189607460];
      __int128 v54 = (void *)MEMORY[0x189603F68];
      __int128 v55 = (const __CFString *)objc_msgSend( *(id *)(v21 + 2600),  "stringWithFormat:",  @"Unable to send to server; failed after %d attempts.",
                                  8LL);
      __int128 v56 = v54;
      goto LABEL_46;
    }

    return 0LL;
  }

  else
  {
    uint64_t v58 = [v26 objectForKey:@"reply"];
    uint64_t v59 = [v26 objectForKey:@"error"];
    if (NSKeyValueCoding_NullValue == v59) {
      uint64_t v60 = 0LL;
    }
    else {
      uint64_t v60 = (void *)v59;
    }
    if (v58)
    {
      v61 = *(void **)(v58 + 24);
      BOOL v62 = *(void *)(v58 + 8) == 0LL;
    }

    else
    {
      v61 = 0LL;
      BOOL v62 = 1;
    }

    id v63 = v61;
    id v57 = v63;
    if (v62)
    {
      if (v60)
      {
        if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault") >= 1) {
          _NSCoreDataLog( 8LL,  (uint64_t)@" Got success, but also an error. Ignoring the error (%@).",  v69,  v70,  v71,  v72,  v73,  v74,  (uint64_t)v60);
        }
      }

      else if (!v63)
      {
        +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)@"sendMessage: apparently succeeded, but no response or error",  (uint64_t)a1,  v64,  v65,  v66,  v67,  v68,  v108);
        __int128 v51 = v114;
        if (!v114) {
          return 0LL;
        }
        __int128 v52 = (void *)MEMORY[0x189607870];
        uint64_t v53 = *MEMORY[0x189607460];
        __int128 v56 = (void *)MEMORY[0x189603F68];
        __int128 v55 = @"No data, cause unknown";
LABEL_46:
        id v57 = 0LL;
        *__int128 v51 = objc_msgSend( v52,  "errorWithDomain:code:userInfo:",  v53,  134060,  objc_msgSend(v56, "dictionaryWithObject:forKey:", v55, @"Problem"));
      }
    }

    else
    {
      if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault") >= 1) {
        _NSCoreDataLog(8LL, (uint64_t)@" Request failed: (%@).", v75, v76, v77, v78, v79, v80, (uint64_t)v60);
      }
      if (v60)
      {
        v81 = (void *)[v60 userInfo];
        uint64_t v82 = [v60 code];
        uint64_t v83 = [v81 objectForKey:@"NSAffectedObjectsErrorKey"];
        v113 = v81;
        if (v83)
        {
          v84 = (void *)v83;
          uint64_t v111 = v82;
          id v85 = objc_alloc_init(MEMORY[0x189603FE0]);
          __int128 v119 = 0u;
          __int128 v120 = 0u;
          __int128 v121 = 0u;
          __int128 v122 = 0u;
          uint64_t v86 = [v84 countByEnumeratingWithState:&v119 objects:v124 count:16];
          if (v86)
          {
            uint64_t v87 = v86;
            uint64_t v88 = *(void *)v120;
            do
            {
              uint64_t v89 = 0LL;
              do
              {
                if (*(void *)v120 != v88) {
                  objc_enumerationMutation(v84);
                }
                if (a3) {
                  id v90 = _PFRetainedObjectIDCore((uint64_t)a3, *(void **)(*((void *)&v119 + 1) + 8 * v89), 0LL, 1);
                }
                else {
                  id v90 = 0LL;
                }
                [v85 addObject:v90];

                ++v89;
              }

              while (v87 != v89);
              uint64_t v91 = [v84 countByEnumeratingWithState:&v119 objects:v124 count:16];
              uint64_t v87 = v91;
            }

            while (v91);
          }

          v81 = v113;
          v92 = (void *)[v113 mutableCopy];
          [v92 setObject:v85 forKey:@"NSAffectedObjectsErrorKey"];

          uint64_t v82 = v111;
        }

        else
        {
          v92 = 0LL;
        }

        v99 = (void *)[v81 objectForKey:@"conflictList"];
        if (v99)
        {
          v100 = v99;
          v112 = v92;
          __int128 v117 = 0u;
          __int128 v118 = 0u;
          __int128 v115 = 0u;
          __int128 v116 = 0u;
          uint64_t v101 = [v99 countByEnumeratingWithState:&v115 objects:v123 count:16];
          if (v101)
          {
            uint64_t v102 = v101;
            uint64_t v103 = *(void *)v116;
            do
            {
              for (uint64_t i = 0LL; i != v102; ++i)
              {
                if (*(void *)v116 != v103) {
                  objc_enumerationMutation(v100);
                }
                v105 = *(void **)(*((void *)&v115 + 1) + 8 * i);
                v106 = (void *)MEMORY[0x186E3E5D8]();
                [v105 _doCleanupForXPCStore:a1 context:a3];
                objc_autoreleasePoolPop(v106);
              }

              uint64_t v102 = [v100 countByEnumeratingWithState:&v115 objects:v123 count:16];
            }

            while (v102);
          }

          v92 = v112;
          if (!v112) {
            v92 = (void *)[v113 mutableCopy];
          }
          [v92 setObject:v100 forKey:@"conflictList"];
          uint64_t v82 = 134050LL;
        }

        if (v92)
        {
          uint64_t v60 = (void *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  objc_msgSend(v60, "domain"),  v82,  v92);
        }

        if (v114) {
          void *v114 = v60;
        }
      }

      else
      {
        uint64_t v93 = [*(id *)(v21 + 2600) stringWithFormat:@"Send failed with no error; probably something wrong here"];
        +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v93,  (uint64_t)a1,  v94,  v95,  v96,  v97,  v98,  v108);
      }
    }
  }

  return v57;
}

- (id)type
{
  return @"NSXPCStore";
}

- (void)setURL:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)load:(id *)a3
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NSXPCStore;
  unsigned int v4 = -[NSIncrementalStore load:](&v29, sel_load_, a3);
  BOOL v5 = v4;
  if (self && v4)
  {
    int v6 = objc_msgSend( -[NSDictionary objectForKey:]( -[NSPersistentStore options](self, "options"),  "objectForKey:",  @"NSPersistentStoreRemoteChangeNotificationOptionKey"),  "BOOLValue");
    int v7 = objc_msgSend( -[NSDictionary valueForKey:]( -[NSPersistentStore options](self, "options"),  "valueForKey:",  @"NSXPCStorePostUpdateNotifications"),  "BOOLValue") | v6;
    if (!self->_observer && v7 != 0)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
      v10 = v9;
      if (v9) {
        v9->_messageCode = 7LL;
      }
      uint64_t v31 = 0LL;
      id v11 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v9, 0LL, &v30, &v31);

      if (v11)
      {
        uint64_t v18 = (void *)MEMORY[0x189604010];
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
        unint64_t v21 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v11,  (uint64_t)self,  v20);
        if (v21) {
          self->_remoteStoreChangedNotificationName = (NSString *)objc_msgSend( (id)objc_msgSend( v21,  "objectForKey:",  @"notificationName"),  "copy");
        }
        else {
          _NSCoreDataLog( 8LL,  (uint64_t)@"Failed to enable remote store notifications: Can't get notification name. %@",  v22,  v23,  v24,  v25,  v26,  v27,  v31);
        }
      }

      if (self->_remoteStoreChangedNotificationName) {
        self->_observer = (NSXPCStoreNotificationObserver *)-[NSXPCStoreNotificationObserver initForObservationWithName:store:]( objc_alloc(&OBJC_CLASS___NSXPCStoreNotificationObserver),  "initForObservationWithName:store:",  -[NSXPCStore remoteStoreChangedNotificationName]( self,  "remoteStoreChangedNotificationName"),  self);
      }
      else {
        _NSCoreDataLog( 8LL,  (uint64_t)@"Failed to enable remote store notifications: %@",  v12,  v13,  v14,  v15,  v16,  v17,  v31);
      }
    }
  }

  return v5;
}

- (id)_rawMetadata__
{
  return self->_metadata;
}

- (id)metadata
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  metadata = self->_metadata;
  if (metadata)
  {
    BOOL v5 = metadata;
    os_unfair_lock_unlock(p_stateLock);
    if (v5) {
      return v5;
    }
  }

  else
  {
    os_unfair_lock_unlock(p_stateLock);
  }

  BOOL v5 = 0LL;
  if (-[NSXPCStore loadMetadata:](self, "loadMetadata:", 0LL))
  {
    os_unfair_lock_lock_with_options();
    BOOL v5 = self->_metadata;
    os_unfair_lock_unlock(p_stateLock);
  }

  return v5;
}

- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSXPCStore;
  id v5 = -[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:]( &v7,  sel__updatedMetadataWithSeed_includeVersioning_,  a3,  a4);
  os_unfair_lock_lock_with_options();
  if (([v5 isEqual:self->_metadata] & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSXPCStore;
    -[NSPersistentStore _setMetadataDirty:](&v6, sel__setMetadataDirty_, 1LL);

    self->_metadata = (NSDictionary *)v5;
  }

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)loadMetadata:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v5 = (void *)objc_msgSend( -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator"),  "managedObjectModel");
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(v5);
        }
        if ((-[NSEntityDescription _hasAttributesWithFileBackedFutures](*(void *)(*((void *)&v41 + 1) + 8 * i)) & 1) != 0)
        {
          int v9 = 1;
          goto LABEL_11;
        }
      }

      uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  int v9 = 0;
LABEL_11:
  v10 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  id v11 = v10;
  if (v10) {
    v10->_messageCode = 1LL;
  }
  unint64_t v40 = 0LL;
  id v12 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v10, 0LL, &v39, &v40);
  if (v12)
  {
    uint64_t v38 = 0LL;
    uint64_t v13 = (void *)[MEMORY[0x1896079E8] propertyListWithData:v12 options:0 format:&v38 error:a3];
    uint64_t v14 = v13;
    if (!v13)
    {

      return v12 != 0LL;
    }

    if (v9)
    {
      uint64_t v15 = (NSString *)(id)[v13 objectForKey:@"NSFileBackedFuturePathKey"];
      self->_fileBackedFuturesDirectory = v15;
      if (!v15)
      {
        uint64_t v26 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F022A8];
        BOOL result = 0;
        *a3 = v26;
        return result;
      }

      uint64_t v14 = (void *)[v14 objectForKey:@"NSMetadataKey"];
    }

    uint64_t v16 = (void *)[v14 objectForKey:@"NSStoreModelVersionIdentifiers"];
    if (!v16)
    {
      if (a3)
      {
        uint64_t v17 = (void *)MEMORY[0x189607870];
        uint64_t v18 = [MEMORY[0x189603F68] dictionaryWithObject:@"Server did not return model version info. (Unsupported configuration.)" forKey:@"Reason"];
        uint64_t v19 = (void *)[v17 errorWithDomain:*MEMORY[0x189607460] code:134080 userInfo:v18];
        id v12 = 0LL;
        *a3 = v19;
      }

      else
      {
        id v12 = 0LL;
      }
    }

    if (!objc_msgSend( -[NSDictionary objectForKey:]( -[NSPersistentStore options](self, "options"),  "objectForKey:",  @"NSIgnorePersistentStoreVersioningOption"),  "BOOLValue")
      || (objc_msgSend(v16, "isEqual:", objc_msgSend(v5, "entityVersionHashesByName")) & 1) != 0)
    {
      if (self)
      {
        os_unfair_lock_lock_with_options();
        double v28 = self->_sanityCheckToken;
        os_unfair_lock_unlock(&self->_stateLock);
        objc_super v29 = v28;
        uint64_t v30 = (NSString *)[v14 objectForKey:@"NSStoreUUID"];
        if (v29)
        {
          if ((-[NSString isEqual:](v29, "isEqual:", v30) & 1) == 0)
          {
            if (a3)
            {
              uint64_t v31 = (void *)MEMORY[0x189607870];
              uint64_t v32 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"Server side store changed, remove and re-add this client store",  @"Reason");
              uint64_t v33 = (void *)[v31 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v32];
              id v12 = 0LL;
              *a3 = v33;
            }

            else
            {
              id v12 = 0LL;
            }
          }
        }

        else
        {
          os_unfair_lock_lock_with_options();
          if (self->_sanityCheckToken != v30)
          {
            uint64_t v34 = v30;

            self->_sanityCheckToken = v30;
          }

          os_unfair_lock_unlock(&self->_stateLock);
        }
      }

      else
      {
        [v14 objectForKey:@"NSStoreUUID"];
      }

      -[NSXPCStore _setMetadata:includeVersioning:](self, "_setMetadata:includeVersioning:", v14, 0LL);

      if (v12) {
        return v12 != 0LL;
      }
      goto LABEL_24;
    }

    if (a3)
    {
      uint64_t v35 = (void *)MEMORY[0x189607870];
      uint64_t v36 = [MEMORY[0x189603F68] dictionaryWithObject:@"Server schema is incompatible and ignore version enabled. (Unsupported configuration.)" forKey:@"Reason"];
      *a3 = (id)[v35 errorWithDomain:*MEMORY[0x189607460] code:134020 userInfo:v36];
    }
  }

  else if (a3)
  {
    *a3 = v40;
  }

LABEL_24:
  uint64_t v20 = [NSString stringWithFormat:@"Unable to load metadata: %@", v40];
  +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v20,  (uint64_t)self,  v21,  v22,  v23,  v24,  v25,  v37);
  id v12 = 0LL;
  return v12 != 0LL;
}

- (BOOL)supportsGenerationalQuerying
{
  return 1;
}

- (id)currentQueryGeneration
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0LL;
  id v3 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__NSXPCStore_currentQueryGeneration__block_invoke;
  v6[3] = &unk_189EA7258;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __36__NSXPCStore_currentQueryGeneration__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  id v3 = v2;
  if (v2) {
    v2->_messageCode = 9LL;
  }
  uint64_t v25 = 0LL;
  id v4 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 32), v2, 0LL, &v24, &v25);

  if (!v4)
  {
    uint64_t v14 = @"Nil result for query generation request";
    goto LABEL_7;
  }

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = [MEMORY[0x189604010] setWithObject:objc_opt_class()];
  uint64_t v13 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v4,  v11,  v12);
  if (!v13)
  {
    uint64_t v14 = @"Unable to decode query generation";
LABEL_7:
    _NSCoreDataLog(8LL, (uint64_t)v14, v5, v6, v7, v8, v9, v10, v22);
    uint64_t v23 = v25;
    uint64_t v15 = [NSString stringWithFormat:@"Unable to get query generation: %@"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v15,  *(void *)(a1 + 32),  v16,  v17,  v18,  v19,  v20,  v23);
    uint64_t v13 = 0LL;
  }

  id result = v13;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = result;
  return result;
}

- (BOOL)_hasActiveGenerations
{
  id v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  id v3 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __35__NSXPCStore__hasActiveGenerations__block_invoke;
  v5[3] = &unk_189EA7258;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __35__NSXPCStore__hasActiveGenerations__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  id v3 = v2;
  if (v2) {
    v2->_messageCode = 17LL;
  }
  uint64_t v25 = 0LL;
  id v4 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 32), v2, 0LL, &v24, &v25);

  if (!v4)
  {
    uint64_t v14 = @"Nil result for active generations request";
    goto LABEL_7;
  }

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = [MEMORY[0x189604010] setWithObject:objc_opt_class()];
  uint64_t v13 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v4,  v11,  v12);
  if (!v13)
  {
    uint64_t v14 = @"Unable to decode active generations result";
LABEL_7:
    _NSCoreDataLog(8LL, (uint64_t)v14, v5, v6, v7, v8, v9, v10, v22);
    uint64_t v23 = v25;
    uint64_t v15 = [NSString stringWithFormat:@"Unable to check for active generations: %@"];
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v15,  *(void *)(a1 + 32),  v16,  v17,  v18,  v19,  v20,  v23);
    uint64_t v13 = 0LL;
  }

  uint64_t result = [v13 BOOLValue];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (void)freeQueryGenerationWithIdentifier:(id)a3
{
  id v5 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __48__NSXPCStore_freeQueryGenerationWithIdentifier___block_invoke;
  v6[3] = &unk_189EA7230;
  objc_copyWeak(&v7, &location);
  v6[4] = a3;
  [v5 performBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__NSXPCStore_freeQueryGenerationWithIdentifier___block_invoke(uint64_t a1)
{
  Weak = (uint64_t *)objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    id v3 = Weak;
    id v4 = *(void **)(a1 + 32);
    -[NSGenerationalRowCache removeRowCacheForGenerationWithIdentifier:](Weak[18], (uint64_t)v4);
    id v5 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
    uint64_t v6 = v5;
    if (v5) {
      v5->_messageCode = 10LL;
    }
    id v7 = objc_alloc(&OBJC_CLASS____NSQueryGenerationToken);
    if (v7) {
      uint64_t v8 = -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v7, v4, v3, 0);
    }
    else {
      uint64_t v8 = 0LL;
    }
    id v9 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v8);

    if (v6) {
      objc_setProperty_nonatomic(v6, v10, v9, 24LL);
    }

    uint64_t v23 = 0LL;
    id v11 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](v3, v6, 0LL, &v22, &v23);
    if (v11)
    {
      uint64_t v12 = (uint64_t)v11;
      uint64_t v13 = [MEMORY[0x189604010] setWithObject:objc_opt_class()];
      uint64_t v14 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v12,  (uint64_t)v3,  v13);
      if (v14 && ([v14 BOOLValue] & 1) != 0) {
        goto LABEL_14;
      }
      uint64_t v15 = [NSString stringWithFormat:@"Unable to release query generation: %@", v23];
    }

    else
    {
      uint64_t v15 = [NSString stringWithFormat:@"Attempt to release query generation failed: %@", v23];
    }

    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v15,  (uint64_t)v3,  v16,  v17,  v18,  v19,  v20,  v21);
LABEL_14:
  }

- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0LL;
  id v6 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator", a3, a4);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __56__NSXPCStore_reopenQueryGenerationWithIdentifier_error___block_invoke;
  v9[3] = &unk_189EA72B0;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = &v10;
  [v6 performBlockAndWait:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

id __56__NSXPCStore_reopenQueryGenerationWithIdentifier_error___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  id v3 = v2;
  if (v2) {
    v2->_messageCode = 11LL;
  }
  id v4 = objc_alloc(&OBJC_CLASS____NSQueryGenerationToken);
  if (v4) {
    id v5 = -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:]( v4,  *(void **)(a1 + 32),  *(void **)(a1 + 40),  0);
  }
  else {
    id v5 = 0LL;
  }
  id v6 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v5);

  if (v3) {
    objc_setProperty_nonatomic(v3, v7, v6, 24LL);
  }

  uint64_t v22 = 0LL;
  id v8 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 40), v3, 0LL, &v21, &v22);
  if (!v8
    || (uint64_t v9 = (uint64_t)v8,
        uint64_t v10 = *(void *)(a1 + 40),
        uint64_t v11 = [MEMORY[0x189604010] setWithObject:objc_opt_class()],
        (uint64_t v12 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v9,  v10,  v11)) == 0LL))
  {
    uint64_t v13 = [NSString stringWithFormat:@"Attempt to reopen query generation failed: %@", v22];
    +[_NSXPCStoreUtilities logMessage:forComponent:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v13,  *(void *)(a1 + 40),  v14,  v15,  v16,  v17,  v18,  v20);
    uint64_t v12 = 0LL;
  }

  id result = v12;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  return result;
}

- (void)cacheFetchedRows:(void *)a3 forManagedObjects:(void *)a4 generation:
{
  if (a1)
  {
    id v6 = -[NSGenerationalRowCache rowCacheForGeneration:](*(void *)(a1 + 144), a4);
    objc_msgSend((id)objc_msgSend(MEMORY[0x189603F50], "date"), "timeIntervalSinceReferenceDate");
    double v8 = v7;
    uint64_t v9 = [a2 count];
    if (v9)
    {
      uint64_t v10 = v9;
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        uint64_t v12 = (void *)[a2 objectAtIndex:i];
        uint64_t v13 = (void *)[v12 objectID];
        uint64_t v14 = -[NSIncrementalStoreNode initWithObjectID:fromSQLRow:]( objc_alloc(&OBJC_CLASS___NSIncrementalStoreNode),  "initWithObjectID:fromSQLRow:",  v13,  v12);
        uint64_t v15 = -[NSXPCRow initWithNode:](objc_alloc(&OBJC_CLASS___NSXPCRow), "initWithNode:", v14);
        uint64_t v16 = (unsigned int *)v15;
        if (v15) {
          v15->super._birth = v8;
        }
        uint64_t v17 = [a3 objectAtIndex:i];
        if (v17)
        {
          int v18 = *(_DWORD *)(v17 + 16);
          if ((v18 & 0x200) != 0)
          {
            if (!v16) {
              goto LABEL_17;
            }
            uint64_t v19 = v16 + 3;
            do
              signed int v20 = __ldaxr(v19);
            while (__stlxr(v20, v19));
            if (v20 >= 1) {
              goto LABEL_17;
            }
LABEL_15:
            uint64_t v21 = v16 + 3;
            do
              unsigned int v22 = __ldxr(v21);
            while (__stxr(v22 + 1, v21));
            goto LABEL_17;
          }

          *(_DWORD *)(v17 + 16) = v18 | 0x200;
        }

        if (v16) {
          goto LABEL_15;
        }
LABEL_17:
        -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v6, v16, v13, 0);
      }
    }
  }

- (uint64_t)decodePrefetchArray:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x186E3E5D8]();
        -[NSXPCStore decodePrefetchResult:forSources:context:](a1, v12, a3, a4);
        objc_autoreleasePoolPop(v13);
        ++v11;
      }

      while (v9 != v11);
      uint64_t result = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v9 = result;
    }

    while (result);
  }

  return result;
}

- (void)executeFetchRequest:(NSManagedObjectContext *)a3 withContext:(void *)a4 error:
{
  v104 = a4;
  v107 = a3;
  uint64_t v121 = *MEMORY[0x1895F89C0];
  v106 = (NSPersistentStore *)a1;
  if (!a1) {
    return;
  }
  id v109 = 0LL;
  id v103 = objc_alloc_init(MEMORY[0x1896077E8]);
  if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault")) {
    _NSCoreDataLog(8LL, (uint64_t)@"Executing fetch %@", v5, v6, v7, v8, v9, v10, a2);
  }
  if ([(id)a2 fetchBatchSize] && !objc_msgSend((id)a2, "resultType"))
  {
    id v11 = (id)[(id)a2 copy];
    [v11 setResultType:1];
    [v11 setFetchBatchSize:0];
    int v102 = 1;
    uint64_t v100 = a2;
    a2 = (uint64_t)v11;
  }

  else
  {
    int v102 = 0;
    uint64_t v100 = 0LL;
  }

  unsigned __int8 v12 = atomic_load(_MergedGlobals_118);
  if ((v12 & 1) == 0
    && [(id)a2 resultType] == 2
    && ![(id)a2 allocationType]
    && ![(id)a2 fetchBatchSize]
    && [(id)a2 _isEditable])
  {
    char v13 = -[NSManagedObjectContext _allowAncillaryEntities](v107, "_allowAncillaryEntities");
    char v14 = a2 ? v13 : 1;
    if ((v14 & 1) == 0) {
      *(_DWORD *)(a2 + 104) = *(_DWORD *)(a2 + 104) & 0xFFFE3FFF | 0x4000;
    }
  }

  uint64_t v15 = +[NSSQLCore bufferedAllocationsOverride](&OBJC_CLASS___NSSQLCore, "bufferedAllocationsOverride");
  if (v15 >= 1 && [(id)a2 resultType] == 2 && objc_msgSend((id)a2, "_isEditable"))
  {
    if (v15 == 1) {
      uint64_t v16 = 1LL;
    }
    else {
      uint64_t v16 = 2LL;
    }
    [(id)a2 setAllocationType:v16];
  }

  __int128 v17 = (void *)[(id)a2 encodeForXPC];
  int v18 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  uint64_t v19 = v18;
  if (v18) {
    v18->_messageCode = 2LL;
  }
  signed int v20 = -[_NSQueryGenerationToken _generationalComponentForStore:]( -[NSManagedObjectContext _queryGenerationToken](v107, "_queryGenerationToken"),  v106);
  if (v20) {
    uint64_t v21 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v17, v20, 0);
  }
  else {
    uint64_t v21 = [MEMORY[0x189603F18] arrayWithObject:v17];
  }

  id v23 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)&OBJC_CLASS____NSXPCStoreUtilities, v21);
  if (v19) {
    objc_setProperty_nonatomic(v19, v22, v23, 24LL);
  }

  id v24 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)v106, v19, v107, &v108, &v109);
  if (!v24)
  {
    if (v109)
    {
      __int128 v41 = (void *)[v109 userInfo];
      __int128 v42 = (void *)[v41 objectForKey:@"exception info"];
      __int128 v43 = (void *)[v42 objectForKey:@"controlled exception"];
      if (v42)
      {
        if (([v43 BOOLValue] & 1) == 0)
        {
          __int128 v44 = (void *)MEMORY[0x189603F70];
          uint64_t v45 = [NSString stringWithFormat:@"Fetch threw on server (%@)", v41];
          uint64_t v46 = (void *)[v44 exceptionWithName:*MEMORY[0x189603A60] reason:v45 userInfo:v41];
          if (v46)
          {
            objc_exception_throw(v46);
            __break(1u);
            return;
          }
        }
      }
    }

    uint64_t v35 = 0LL;
    goto LABEL_56;
  }

  if (-[NSManagedObjectContext _allowAncillaryEntities](v107, "_allowAncillaryEntities")
    && [(id)a2 _isEditable])
  {
    [(id)a2 _resolveEntityWithContext:v107];
  }

  uint64_t v25 = (void *)NSSet_EmptySet;
  uint64_t v26 = -[NSManagedObjectModel _allowedClassesFromTransformableAttributes](objc_msgSend((id)-[NSPersistentStore model]( v106,  "model"), "managedObjectModel"));
  if ([v25 count]) {
    uint64_t v26 = [v25 setByAddingObjectsFromSet:v26];
  }
  uint64_t v27 = [(id)+[_NSXPCStoreUtilities classesForFetchArchive]() setByAddingObjectsFromSet:v26];
  id v105 = (id)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v24,  (uint64_t)v106,  v27);
  if ([v105 count])
  {
    double v28 = -[_NSQueryGenerationToken _generationalComponentForStore:]( -[NSManagedObjectContext _queryGenerationToken](v107, "_queryGenerationToken"),  v106);
    objc_super v29 = (void *)[v105 objectAtIndex:0];
    uint64_t v30 = [(id)a2 resultType];
    uint64_t v31 = v30;
    if (v30 != 4)
    {
      if (v30)
      {
        int v47 = 0;
        BOOL v48 = 0;
      }

      else
      {
        int v47 = [(id)a2 _disablePersistentStoreResultCaching] ^ 1;
        BOOL v48 = objc_msgSend((id)objc_msgSend((id)a2, "propertiesToFetch"), "count") != 0;
      }

      __int128 v118 = 0LL;
      if ([(id)a2 allocationType] == 1 || objc_msgSend((id)a2, "allocationType") == 2)
      {
        if (v47) {
          uint64_t v68 = &v118;
        }
        else {
          uint64_t v68 = 0LL;
        }
        uint64_t v101 = (_PFBatchFaultingArray *)+[_NSXPCStoreUtilities _decodeBufferResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v29,  (void *)a2,  0LL,  (uint64_t)v106,  (uint64_t)v107,  (uint64_t)v68,  (uint64_t *)&v109);
      }

      else
      {
        if (v47) {
          uint64_t v69 = &v118;
        }
        else {
          uint64_t v69 = 0LL;
        }
        uint64_t v101 = (_PFBatchFaultingArray *)+[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v29,  (NSFetchRequest *)a2,  0LL,  v106,  v107,  v69,  &v109);
      }

      if (v118) {
        char v70 = v48;
      }
      else {
        char v70 = 1;
      }
      if ((v70 & 1) == 0 && ((v47 ^ 1) & 1) == 0) {
        -[NSXPCStore cacheFetchedRows:forManagedObjects:generation:]((uint64_t)v106, v118, v101, v28);
      }
      if (!v31)
      {
        if (v48)
        {
          unint64_t v99 = -[_PFBatchFaultingArray count](v101, "count");
          if (v99)
          {
            uint64_t defaultFaultHandler = (uint64_t)v106->_defaultFaultHandler;
            uint64_t v98 = (void **)-[_PFBatchFaultingArray _objectsPointer](v101, "_objectsPointer");
            uint64_t v71 = *v98;
            uint64_t v72 = (void *)[MEMORY[0x189603FA8] array];
            uint64_t v73 = (void *)[MEMORY[0x189603FE0] set];
            uint64_t v74 = (void *)[MEMORY[0x189603FA8] array];
            __int128 v116 = 0u;
            __int128 v117 = 0u;
            __int128 v114 = 0u;
            __int128 v115 = 0u;
            uint64_t v75 = (void *)[v71 mapping];
            uint64_t v76 = [v75 countByEnumeratingWithState:&v114 objects:v120 count:16];
            if (v76)
            {
              uint64_t v77 = *(void *)v115;
              do
              {
                for (uint64_t i = 0LL; i != v76; ++i)
                {
                  if (*(void *)v115 != v77) {
                    objc_enumerationMutation(v75);
                  }
                  uint64_t v79 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)a2, "entity"), "propertiesByName"),  "objectForKey:",  *(void *)(*((void *)&v114 + 1) + 8 * i));
                  uint64_t v80 = v79;
                  if (v79 && ([v79 _entitysReferenceID] & 0x8000000000000000) == 0)
                  {
                    [v72 addObject:v80];
                    [v73 addObject:v80];
                  }
                }

                uint64_t v76 = [v75 countByEnumeratingWithState:&v114 objects:v120 count:16];
              }

              while (v76);
            }

            __int128 v112 = 0u;
            __int128 v113 = 0u;
            __int128 v110 = 0u;
            __int128 v111 = 0u;
            v81 = (void *)[(id)a2 propertiesToFetch];
            uint64_t v82 = [v81 countByEnumeratingWithState:&v110 objects:v119 count:16];
            uint64_t v83 = v98;
            if (v82)
            {
              uint64_t v84 = *(void *)v111;
              do
              {
                for (uint64_t j = 0LL; j != v82; ++j)
                {
                  if (*(void *)v111 != v84) {
                    objc_enumerationMutation(v81);
                  }
                  uint64_t v86 = *(void **)(*((void *)&v110 + 1) + 8 * j);
                  if ([v86 isTransient])
                  {
                    [v74 addObject:v86];
                    if (([v86 _entitysReferenceID] & 0x8000000000000000) == 0) {
                      objc_msgSend(v73, "addObject:", objc_msgSend(v86, "name"));
                    }
                  }
                }

                uint64_t v82 = [v81 countByEnumeratingWithState:&v110 objects:v119 count:16];
              }

              while (v82);
            }

            if (v99 <= 1) {
              uint64_t v87 = 1LL;
            }
            else {
              uint64_t v87 = v99;
            }
            uint64_t v88 = defaultFaultHandler;
            do
            {
              id v89 = *v83;
              id v90 = (void **)[*v83 values];
              uint64_t v91 = (unsigned int *)-[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:]( v107,  *v90,  v88);
              _PFFaultHandlerFulfillPartialFault(v88, v91, (uint64_t)v107, (uint64_t)v90, v72, (uint64_t)v73, v74);
              *uint64_t v83 = v91;

              ++v83;
              --v87;
            }

            while (v87);
          }
        }

        else
        {
          uint64_t v92 = (uint64_t)v106->_defaultFaultHandler;
          uint64_t v93 = [v118 count];
          if (v93)
          {
            for (uint64_t k = 0LL; k != v93; ++k)
            {
              uint64_t v95 = -[_PFBatchFaultingArray objectAtIndex:](v101, "objectAtIndex:", k);
              _PFFaultHandlerFulfillFault(v92, v95, (uint64_t)v107, (void *)[v118 objectAtIndex:k], 0);
            }
          }
        }
      }

      if ((unint64_t)[v105 count] >= 2) {
        -[NSXPCStore decodePrefetchArray:forSources:context:]( v106,  (void *)[v105 objectAtIndex:1],  v101,  v107);
      }
      goto LABEL_42;
    }

    uint64_t v32 = (void *)MEMORY[0x189604010];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    id v105 = (id)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v29,  (uint64_t)v106,  v34);
  }

  uint64_t v101 = (_PFBatchFaultingArray *)v105;
LABEL_42:
  uint64_t v35 = v101;
  if (v102)
  {
    unint64_t v36 = -[_PFBatchFaultingArray count](v101, "count");
    unint64_t v37 = MEMORY[0x1895F8858](v36);
    unint64_t v40 = (char *)&v96 - v39;
    if (v37 >= 0x201) {
      unint64_t v40 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v96 - v39, 8 * v38);
    }
    -[_PFBatchFaultingArray getObjects:range:](v35, "getObjects:range:", v40, 0LL, v36);
    uint64_t v49 = -[_PFArray initWithObjects:count:andFlags:]( objc_alloc(&OBJC_CLASS____PFArray),  "initWithObjects:count:andFlags:",  v40,  v36,  27LL);
    if (v36 >= 0x201) {
      NSZoneFree(0LL, v40);
    }

    uint64_t v50 = objc_alloc(&OBJC_CLASS____PFBatchFaultingArray);
    uint64_t v35 = -[_PFBatchFaultingArray initWithPFArray:andRequest:andContext:]( v50,  "initWithPFArray:andRequest:andContext:",  v49,  v100,  v107);
  }

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, a4);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        -[NSPersistentStoreCache incrementRefCountForObjectID:]( (uint64_t)v5,  *(const void **)(*((void *)&v10 + 1) + 8 * v9++));
      }

      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, a4);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        -[NSPersistentStoreCache decrementRefCountForObjectID:]( (uint64_t)v5,  *(const void **)(*((void *)&v10 + 1) + 8 * v9++));
      }

      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }

- (uint64_t)_commitChangesForRequestContext:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (a2) {
    id v4 = (void *)a2[5];
  }
  else {
    id v4 = 0LL;
  }
  id v5 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:](*(void *)(a1 + 144), 0LL);
  objc_super v29 = a2;
  uint64_t v6 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:]( *(void *)(a1 + 144),  (void *)objc_msgSend((id)objc_msgSend(a2, "managedObjectContext"), "_queryGenerationToken"));
  if ([v4 count])
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v37;
      BOOL v11 = v5 == v6 || v6 == 0LL;
      unint64_t v12 = 0x18C68F000uLL;
      uint64_t v30 = *(void *)v37;
      do
      {
        uint64_t v13 = 0LL;
        uint64_t v31 = v8;
        do
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(v4);
          }
          char v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
          if (v11)
          {
            uint64_t v15 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:]( v5,  *(const void **)(*((void *)&v36 + 1) + 8 * v13),  *(double *)&NSSQLDistantPastTimeInterval);
            uint64_t v16 = (unsigned int *)[v4 objectForKey:v14];
            __int128 v17 = v16;
            if (v15)
            {
              BOOL v18 = v11;
              uint64_t v19 = v4;
              if (v16) {
                signed int v20 = *(void **)((char *)v16 + *(int *)(v12 + 1344));
              }
              else {
                signed int v20 = 0LL;
              }
              unint64_t v21 = v12;
              uint64_t v22 = [v20 version];
              -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v5, v17, v14, 0);
              unint64_t v12 = v21;
              id v4 = v19;
              BOOL v11 = v18;
              uint64_t v9 = v30;
              uint64_t v8 = v31;
            }

            else
            {
              -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v5, v16, v14, 0);
            }
          }

          else
          {
            -[NSPersistentStoreCache forgetRowForObjectID:]( (uint64_t)v5,  *(const void **)(*((void *)&v36 + 1) + 8 * v13));
          }

          ++v13;
        }

        while (v8 != v13);
        uint64_t v23 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
        uint64_t v8 = v23;
      }

      while (v23);
    }
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  if (v29) {
    id v24 = (void *)[(id)v29[2] deletedObjects];
  }
  else {
    id v24 = 0LL;
  }
  uint64_t result = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (result)
  {
    uint64_t v26 = result;
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v28 = 0LL;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        -[NSPersistentStoreCache forgetRowForObjectID:]( (uint64_t)v5,  (const void *)[*(id *)(*((void *)&v32 + 1) + 8 * v28++) objectID]);
      }

      while (v26 != v28);
      uint64_t result = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
      uint64_t v26 = result;
    }

    while (result);
  }

  return result;
}

- (uint64_t)_executeSaveRequestForContext:(void *)a3 error:
{
  uint64_t v6 = (void *)[a2 managedObjectContext];
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_messageCode = 3LL;
    id v9 = -[NSXPCSaveRequestContext newEncodedSaveRequest](a2);
    objc_setProperty_nonatomic(v8, v10, v9, 24LL);
  }

  else
  {
    id v9 = -[NSXPCSaveRequestContext newEncodedSaveRequest](a2);
  }

  uint64_t v15 = 0LL;
  id v11 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](a1, v8, v6, &v15, a3);
  uint64_t v12 = (uint64_t)v11;
  if (a2) {
    a2[6] = v15;
  }
  if (v11)
  {
    uint64_t v13 = [MEMORY[0x189604010] setWithObject:objc_opt_class()];
    uint64_t v12 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v12,  (uint64_t)a1,  v13);
  }

  return v12;
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v233 = *MEMORY[0x1895F89C0];
  uint64_t v9 = [a3 requestType];
  p_outstandingRequests = &self->_outstandingRequests;
  do
    int v11 = __ldxr((unsigned int *)p_outstandingRequests);
  while (__stxr(v11 + 1, (unsigned int *)p_outstandingRequests));
  if (v11 > -2)
  {
    switch(v9)
    {
      case 1LL:
        -[NSXPCStore executeFetchRequest:withContext:error:]( (uint64_t *)self,  (uint64_t)a3,  (NSManagedObjectContext *)a4,  a5);
        goto LABEL_137;
      case 2LL:
        if (!self) {
          goto LABEL_139;
        }
        id v47 = 0LL;
        v230 = 0LL;
        unsigned __int8 v48 = atomic_load((unsigned __int8 *)&self->super.super._isMetadataDirty);
        if ((v48 & 1) != 0) {
          id v47 = -[NSXPCStore metadata](self, "metadata");
        }
        uint64_t v49 = -[NSXPCSaveRequestContext initForStore:request:metadata:forceInsertsToUpdates:context:]( objc_alloc(&OBJC_CLASS___NSXPCSaveRequestContext),  "initForStore:request:metadata:forceInsertsToUpdates:context:",  self,  a3,  v47,  0LL,  a4);
        uint64_t v50 = (NSBatchInsertResult *)-[NSXPCStore _executeSaveRequestForContext:error:]((uint64_t *)self, v49, &v230);
        uint64_t v13 = v50;
        if (!v50) {
          goto LABEL_129;
        }
        if ((-[NSBatchInsertResult BOOLValue](v50, "BOOLValue") & 1) != 0) {
          goto LABEL_131;
        }
        if (!v49) {
          goto LABEL_126;
        }
        uint64_t v51 = v49[6];
        if (!v51) {
          goto LABEL_127;
        }
        if (objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "count")
          && (uint64_t v52 = -[__CFString domain](v230, "domain"),
              v215 = (void *)*MEMORY[0x189607460],
              [(id)*MEMORY[0x189607460] isEqual:v52])
          && -[__CFString code](v230, "code") == 1555)
        {
          if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault")) {
            _NSCoreDataLog( 8LL,  (uint64_t)@"Attempting to resend what looks like it may be a reinsert",  v53,  v54,  v55,  v56,  v57,  v58,  v208);
          }
          *(void *)buf = 0LL;
          uint64_t v59 =  -[NSXPCSaveRequestContext initForStore:request:metadata:forceInsertsToUpdates:context:]( objc_alloc(&OBJC_CLASS___NSXPCSaveRequestContext),  "initForStore:request:metadata:forceInsertsToUpdates:context:",  self,  a3,  v47,  1LL,  a4);
          uint64_t v60 = (NSBatchInsertResult *)-[NSXPCStore _executeSaveRequestForContext:error:]((uint64_t *)self, v59, buf);
          uint64_t v13 = v60;
          if (v60)
          {
            if ((-[NSBatchInsertResult BOOLValue](v60, "BOOLValue") & 1) != 0)
            {
              char v61 = 0;
            }

            else
            {
              if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault")) {
                _NSCoreDataLog( 8LL,  (uint64_t)@"Reinsert hit optimistic locking error, will discard and let the next save resolve it.",  v202,  v203,  v204,  v205,  v206,  v207,  v208);
              }
              if (!objc_msgSend(v215, "isEqual:", objc_msgSend(*(id *)buf, "domain"))
                || [*(id *)buf code] != 134050)
              {
                uint64_t v13 = 0LL;
                if (a5) {
                  *a5 = v230;
                }
                goto LABEL_131;
              }

              -[NSXPCStore _commitChangesForRequestContext:]((uint64_t)self, v59);
              char v61 = 1;
              uint64_t v13 = (NSBatchInsertResult *)[MEMORY[0x189607968] numberWithBool:1];
            }

            LOBYTE(v51) = 1;
            if ((v61 & 1) != 0) {
              goto LABEL_131;
            }
            goto LABEL_128;
          }
        }

        else
        {
          if (-[__CFString code](v230, "code") != 134050
            || (v136 = (void *)-[__CFString domain](v230, "domain"),
                ![v136 isEqualToString:*MEMORY[0x189607460]]))
          {
LABEL_126:
            LOBYTE(v51) = 0;
LABEL_127:
            uint64_t v13 = 0LL;
LABEL_128:
            if ((v51 & 1) == 0)
            {
LABEL_129:
              uint64_t v13 = 0LL;
              if (a5) {
                *a5 = v230;
              }
            }

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v9 = &off_189EA5000;
  if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault")) {
    _NSCoreDataLog(8LL, (uint64_t)@"Firing fault %@", v10, v11, v12, v13, v14, v15, (uint64_t)a3);
  }
  uint64_t v16 = (void *)[a4 _queryGenerationToken];
  else {
    __int128 v17 = 0LL;
  }
  BOOL v18 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v17);
  [a4 stalenessInterval];
  if (v19 != 0.0)
  {
    double v20 = v19 <= 0.0 ? *(double *)&NSSQLDistantPastTimeInterval : CFAbsoluteTimeGetCurrent() - v19;
    id v21 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v18, a3, v20);
    if (v21)
    {
      uint64_t v22 = *(void **)&v21[10]._os_unfair_lock_opaque;
      if (v22)
      {
        id v80 = v22;
        if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault")) {
          _NSCoreDataLog(8LL, (uint64_t)@"Returning cached value %@", v23, v24, v25, v26, v27, v28, (uint64_t)v80);
        }
        return v80;
      }
    }
  }

  uint64_t v30 = (void *)[MEMORY[0x189603FA8] array];
  objc_msgSend(v30, "addObject:", objc_msgSend(a3, "URIRepresentation"));
  if (v17) {
    [v30 addObject:v17];
  }
  id v31 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v30);
  uint64_t v32 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  __int128 v34 = v32;
  if (v32)
  {
    v32->_messageCode = 5LL;
    objc_setProperty_nonatomic(v32, v33, v31, 24LL);
  }

  uint64_t v81 = 0LL;
  id v82 = 0LL;
  id v35 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v34, a4, &v81, &v82);
  if (!v35)
  {
    if (a5)
    {
      uint64_t v40 = 0LL;
      *a5 = v82;
      goto LABEL_69;
    }

    goto LABEL_46;
  }

  uint64_t v36 = (uint64_t)v35;
  uint64_t v78 = a5;
  __int128 v37 = (void *)+[_NSXPCStoreUtilities classesForSaveArchive]();
  uint64_t v38 = objc_msgSend( v37,  "setByAddingObjectsFromSet:",  -[NSManagedObjectModel _allowedClassesFromTransformableAttributes](objc_msgSend(-[NSXPCStore model](self, "model"), "managedObjectModel")));
  __int128 v39 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v36,  (uint64_t)self,  v38);
  if (objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", 0), "integerValue") != 1)
  {
    if (objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", 0), "integerValue") == 2)
    {
      uint64_t v41 = (void *)objc_msgSend((id)objc_msgSend(v39, "objectAtIndex:", 1), "firstObject");
      uint64_t v42 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
      -[NSFetchRequest setEntity:](v42, "setEntity:", [a3 entity]);
      id v83 = 0LL;
      id v43 = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v41,  v42,  1LL,  &self->super.super,  (NSManagedObjectContext *)a4,  &v83,  &v82);

      if ([v43 count])
      {
        uint64_t v44 = (NSXPCRow *)[v83 lastObject];
        uint64_t v45 = v44;
      }

      else
      {
        uint64_t v44 = 0LL;
        id v82 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134093 userInfo:0];
      }

      uint64_t v9 = &off_189EA5000;
      if (v44)
      {
        uint64_t v60 = [a4 objectRegisteredForID:a3];
        char v61 = (void *)[MEMORY[0x189603F18] arrayWithObject:v44];
        -[NSXPCStore cacheFetchedRows:forManagedObjects:generation:]( (uint64_t)self,  v61,  (void *)[MEMORY[0x189603F18] arrayWithObject:v60],  v17);
        uint64_t v62 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:]( v18,  a3,  *(double *)&NSSQLDistantPastTimeInterval);
        if (v62) {
          uint64_t v63 = *(void **)&v62[10]._os_unfair_lock_opaque;
        }
        else {
          uint64_t v63 = 0LL;
        }
        uint64_t v40 = v63;
      }

      else
      {
        uint64_t v40 = 0LL;
        if (v78 && v82)
        {
          uint64_t v40 = 0LL;
          *uint64_t v78 = v82;
        }
      }

      goto LABEL_68;
    }

    if (v78)
    {
      uint64_t v40 = 0LL;
      *uint64_t v78 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:0];
      goto LABEL_69;
    }

    goto LABEL_46;
  }

  if ([v39 count] != 1)
  {
    uint64_t v46 = (void *)[v39 lastObject];
    id v47 = (void *)[a3 entity];
    unsigned __int8 v48 = (void *)[v47 _propertyRangesByType];
    uint64_t v49 = v48[7] + v48[13] + 1LL;
    if ([v46 count] == v49)
    {
      uint64_t v50 = v48[6];
      uint64_t v51 = v48[7];
      id v77 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  -[NSEntityDescription knownKeysMappingStrategy](v47));
      uint64_t v79 = -[NSKnownKeysDictionary knownKeyValuesPointer](v77, "knownKeyValuesPointer");
      if (v51)
      {
        uint64_t v52 = 0LL;
        uint64_t v53 = v79 + 8 * v50;
        do
        {
          uint64_t v54 = (void *)[v46 objectAtIndex:v52];
          ++v52;
        }

        while (v51 != v52);
      }

      uint64_t v55 = v48[13];
      if (v55)
      {
        uint64_t v56 = (void *)(v79 + 8LL * v48[12]);
        do
        {
          *v56++ = (id)[v46 objectAtIndex:v51++];
          --v55;
        }

        while (v55);
      }

      uint64_t v40 = -[NSIncrementalStoreNode initWithObjectID:withValues:version:]( [NSIncrementalStoreNode alloc],  "initWithObjectID:withValues:version:",  a3,  v77,  objc_msgSend((id)objc_msgSend(v46, "lastObject"), "unsignedIntegerValue"));

      uint64_t v44 = -[NSXPCRow initWithNode:](objc_alloc(&OBJC_CLASS___NSXPCRow), "initWithNode:", v40);
      [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
      if (v44) {
        v44->super._birth = v57;
      }
      uint64_t v58 = (void *)[a4 _queryGenerationToken];
      uint64_t v9 = &off_189EA5000;
      if ([v58 _isEnabled]) {
        uint64_t v59 = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v58, self);
      }
      else {
        uint64_t v59 = 0LL;
      }
      id v64 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v59);
      uint64_t v65 = [a4 objectWithID:a3];
      if (v65)
      {
        int v66 = *(_DWORD *)(v65 + 16);
        if ((v66 & 0x200) != 0)
        {
          if (!v44) {
            goto LABEL_67;
          }
          p_externalReferenceCount = (unsigned int *)&v44->super._externalReferenceCount;
          do
            signed int v68 = __ldaxr(p_externalReferenceCount);
          while (__stlxr(v68, p_externalReferenceCount));
          if (v68 >= 1) {
            goto LABEL_67;
          }
          goto LABEL_65;
        }

        *(_DWORD *)(v65 + 16) = v66 | 0x200;
      }

      if (!v44)
      {
LABEL_67:
        -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v64, (unsigned int *)v44, a3, 0);
LABEL_68:

        goto LABEL_69;
      }

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  v76[16] = *MEMORY[0x1895F89C0];
  [a5 stalenessInterval];
  double v12 = v11;
  uint64_t v13 = (void *)[a5 _queryGenerationToken];
  else {
    uint64_t v14 = 0LL;
  }
  uint64_t v15 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v14);
  if (v12 != 0.0)
  {
    uint64_t v16 = v15;
    if (v12 <= 0.0) {
      double v17 = *(double *)&NSSQLDistantPastTimeInterval;
    }
    else {
      double v17 = CFAbsoluteTimeGetCurrent() - v12;
    }
    BOOL v18 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v16, a4, v17);
    if (v18) {
      double v19 = *(void **)&v18[10]._os_unfair_lock_opaque;
    }
    else {
      double v19 = 0LL;
    }
    id v20 = v19;
    if (!v20)
    {
      v76[0] = 0LL;
      id v21 = -[NSXPCStore newValuesForObjectWithID:withContext:error:]( self,  "newValuesForObjectWithID:withContext:error:",  a4,  a5,  v76);
      if (!v21)
      {
        if (a6) {
          *a6 = (id)v76[0];
        }
        return 0LL;
      }

      id v20 = v21;
    }

    uint64_t v22 = (void *)[v20 valueForPropertyDescription:a3];
    if (([a3 isToMany] & 1) == 0)
    {
      uint64_t v24 = (void *)NSKeyValueCoding_NullValue;
      if (v22) {
        uint64_t v24 = v22;
      }
      uint64_t v23 = v24;
      goto LABEL_19;
    }

    if (v22)
    {
      uint64_t v23 = v22;
LABEL_19:
      uint64_t v25 = v23;

      return v25;
    }

    uint64_t v25 = -[NSPersistentStoreCache toManyForSourceObjectID:forProperty:afterTimestamp:](v16, a4, a3, v17);
    if (v25) {
      return v25;
    }
  }

  id v26 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v27 = objc_alloc_init(MEMORY[0x189603FC8]);
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(a4, "URIRepresentation"), @"source");
  objc_msgSend(v27, "setValue:forKey:", objc_msgSend(a3, "name"), @"relationship");
  [v26 addObject:v27];

  if (v14) {
    [v26 addObject:v14];
  }
  id v28 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v26);

  uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  id v31 = v29;
  if (v29)
  {
    v29->_messageCode = 6LL;
    objc_setProperty_nonatomic(v29, v30, v28, 24LL);
  }

  uint64_t v71 = 0LL;
  id v32 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]((uint64_t *)self, v31, a5, &v70, &v71);

  if (v32)
  {
    uint64_t v69 = v14;
    id v33 = (void *)MEMORY[0x189604010];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_msgSend(v33, "setWithObjects:", v34, v35, objc_opt_class(), 0);
    __int128 v37 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v32,  (uint64_t)self,  v36);
    if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault"))
    {
      [a3 name];
      _NSCoreDataLog(8LL, (uint64_t)@"Decoded value for %@ - %@ : %@", v38, v39, v40, v41, v42, v43, (uint64_t)a4);
    }

    uint64_t v44 = (void *)[a5 persistentStoreCoordinator];
    if ([a3 isToMany])
    {
      int v45 = [a3 isOrdered];
      uint64_t v46 = (Class *)0x189603FD0LL;
      if (!v45) {
        uint64_t v46 = (Class *)0x189603FE0LL;
      }
      uint64_t v25 = (os_unfair_lock_s *)objc_alloc_init(*v46);
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      uint64_t v47 = [v37 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        id v68 = a4;
        uint64_t v49 = *(void *)v73;
        do
        {
          for (uint64_t i = 0LL; i != v48; ++i)
          {
            if (*(void *)v73 != v49) {
              objc_enumerationMutation(v37);
            }
            uint64_t v51 = *(void *)(*((void *)&v72 + 1) + 8 * i);
            uint64_t v52 = (void *)MEMORY[0x186E3E5D8]();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_57;
            }
            uint64_t v53 = [v44 managedObjectIDForURIRepresentation:v51];
            if (v53) {
              -[os_unfair_lock_s addObject:](v25, "addObject:", v53);
            }
            objc_autoreleasePoolPop(v52);
          }

          uint64_t v48 = [v37 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }

        while (v48);
        a4 = v68;
      }
    }

    else
    {
      uint64_t v54 = NSKeyValueCoding_NullValue;
      if (v54 != [v37 lastObject])
      {
        uint64_t v55 = [v37 lastObject];
        objc_opt_class();
        uint64_t v56 = v69;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_57:
          uint64_t v61 = [a3 name];
          _NSCoreDataLog( 8LL,  (uint64_t)@"Got a bad relationship value for %@, %@ (%@)",  v62,  v63,  v64,  v65,  v66,  v67,  v61);
          __break(1u);
        }

        double v57 = (void *)[v44 managedObjectIDForURIRepresentation:v55];
        if (v57) {
          uint64_t v25 = v57;
        }
        else {
          uint64_t v25 = 0LL;
        }
        goto LABEL_53;
      }

      uint64_t v25 = (os_unfair_lock_s *)(id)NSKeyValueCoding_NullValue;
    }

    uint64_t v56 = v69;
LABEL_53:
    if ([a3 isToMany])
    {
      id v58 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_cache, v56);
      objc_msgSend((id)objc_msgSend(MEMORY[0x189603F50], "date"), "timeIntervalSinceReferenceDate");
      -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]( (uint64_t)v58,  v25,  0LL,  a4,  a3,  v59);
    }

    return v25;
  }

  uint64_t v25 = 0LL;
  if (a6) {
    *a6 = v71;
  }
  return v25;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  if (![a3 count]) {
    return (id)NSArray_EmptyArray;
  }
  uint64_t v7 = (void *)[MEMORY[0x189603FC8] dictionary];
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v69;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v69 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * i), "entity"), "name");
        uint64_t v13 = (void *)[v7 objectForKey:v12];
        if (v13)
        {
          uint64_t v14 = [v13 integerValue] + 1;
          uint64_t v15 = (void *)MEMORY[0x189607968];
        }

        else
        {
          uint64_t v15 = (void *)MEMORY[0x189607968];
          uint64_t v14 = 1LL;
        }

        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v15, "numberWithInteger:", v14), v12);
      }

      uint64_t v9 = [a3 countByEnumeratingWithState:&v68 objects:v74 count:16];
    }

    while (v9);
  }

  uint64_t v16 = [v7 count];
  id v17 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v7);
  BOOL v18 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  id v20 = v18;
  if (v18)
  {
    v18->_messageCode = 4LL;
    objc_setProperty_nonatomic(v18, v19, v17, 24LL);
  }

  uint64_t v67 = 0LL;
  id v21 = -[NSXPCStore sendMessage:fromContext:interrupts:error:]( (uint64_t *)self,  v20,  (void *)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "managedObjectContext"),  &v66,  &v67);
  if (v21)
  {
    uint64_t v22 = (uint64_t)v21;
    uint64_t v54 = a4;
    uint64_t v55 = v20;
    size_t __count = v16;
    uint64_t v23 = (void *)MEMORY[0x189604010];
    uint64_t v56 = self;
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, v27, v28, v29, objc_opt_class(), 0);
    id v31 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v22,  (uint64_t)v56,  v30);
    if ([v31 count]) {
      id v32 = (void *)[MEMORY[0x189603FA8] array];
    }
    else {
      id v32 = 0LL;
    }
    if ([v31 count] != __count)
    {

      uint64_t v48 = v54;
      if (!v54) {
        return 0LL;
      }
      uint64_t v49 = (void *)MEMORY[0x189607870];
      uint64_t v50 = *MEMORY[0x189607460];
      uint64_t v51 = (void *)MEMORY[0x189603F68];
      uint64_t v52 = @"Wrong number of object IDs returned from server";
      goto LABEL_43;
    }

    id v33 = -[NSKnownKeysMappingStrategy initForKeys:]( [NSKnownKeysMappingStrategy alloc],  "initForKeys:",  [v31 allKeys]);
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v62 objects:v73 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v63;
LABEL_24:
      uint64_t v37 = 0LL;
      while (1)
      {
        if (*(void *)v63 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v62 + 1) + 8 * v37);
        uint64_t v39 = objc_msgSend((id)objc_msgSend(v31, "objectForKey:", v38), "count");
        if (v39 != objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v38), "unsignedIntegerValue")) {
          break;
        }
        if (v35 == ++v37)
        {
          uint64_t v35 = [v33 countByEnumeratingWithState:&v62 objects:v73 count:16];
          if (v35) {
            goto LABEL_24;
          }
          goto LABEL_30;
        }
      }

      uint64_t v48 = v54;
      if (!v54) {
        return 0LL;
      }
      uint64_t v49 = (void *)MEMORY[0x189607870];
      uint64_t v50 = *MEMORY[0x189607460];
      uint64_t v51 = (void *)MEMORY[0x189603F68];
      uint64_t v52 = @"Wrong number of object IDs returned from server (2)";
LABEL_43:
      id v32 = 0LL;
      *uint64_t v48 = (id)objc_msgSend( v49,  "errorWithDomain:code:userInfo:",  v50,  134060,  objc_msgSend(v51, "dictionaryWithObject:forKey:", v52, @"Reason"));
      return v32;
    }

- (id)newForeignKeyID:(int64_t)a3 entity:(id)a4
{
  if (a3) {
    return (id)objc_msgSend( objc_alloc(-[NSXPCStore objectIDFactoryForSQLEntity:](self, "objectIDFactoryForSQLEntity:", a4)),  "initWithPK64:",  a3);
  }
  else {
    return 0LL;
  }
}

- (NSString)remoteStoreChangedNotificationName
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

+ (BOOL)_isOnExtendedTimeout
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__NSXPCStore_Internal___isOnExtendedTimeout__block_invoke;
  block[3] = &unk_189EA7280;
  block[4] = &v5;
  if (_isOnExtendedTimeout_onceToken != -1) {
    dispatch_once(&_isOnExtendedTimeout_onceToken, block);
  }
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__NSXPCStore_Internal___isOnExtendedTimeout__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1896079D8], "processInfo"), "processName");
  uint64_t result = [@"com.apple.internetaccounts" isEqual:v2];
  if ((result & 1) != 0
    || (uint64_t result = [@"com.apple.preferences.internetaccounts.remoteservices" isEqual:v2],
        (_DWORD)result))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

  return result;
}

- (void)_prepareStoreForRemovalFromCoordinator:(id)a3
{
  if (-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator") == a3)
  {
    os_unfair_lock_lock_with_options();
    if (a3 && (uint64_t v5 = (dispatch_object_s *)self->_requestTerminationSem) != 0LL)
    {
      dispatch_retain(v5);
      requestTerminationSeuint64_t m = self->_requestTerminationSem;
      os_unfair_lock_unlock(&self->_stateLock);
      if (requestTerminationSem)
      {
        p_outstandingRequests = &self->_outstandingRequests;
        do
        {
          if (__ldxr((unsigned int *)p_outstandingRequests))
          {
            while (1)
            {
              __clrex();
              dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
              dispatch_semaphore_wait((dispatch_semaphore_t)requestTerminationSem, v9);
              while (!__ldxr((unsigned int *)p_outstandingRequests))
              {
              }
            }
          }
        }

        while (__stxr(0xFFF0BDC1, (unsigned int *)p_outstandingRequests));
LABEL_14:
        os_unfair_lock_lock_with_options();
        double v11 = (dispatch_object_s *)self->_requestTerminationSem;
        if (v11)
        {
          dispatch_release(v11);
          self->_requestTerminationSeuint64_t m = 0LL;
        }

        os_unfair_lock_unlock(&self->_stateLock);
        dispatch_release((dispatch_object_t)requestTerminationSem);
      }
    }

    else
    {
      os_unfair_lock_unlock(&self->_stateLock);
    }
  }

- (id)model
{
  return self->_model;
}

- (id)sqlCore
{
  return self->_core;
}

- (id)ancillaryModels
{
  return self->_ancillaryModels;
}

- (id)ancillarySQLModels
{
  return self->_ancillarySQLModels;
}

- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4
{
  return (id)objc_msgSend( objc_alloc(-[NSXPCStore objectIDFactoryForSQLEntity:](self, "objectIDFactoryForSQLEntity:", a3)),  "initWithPK64:",  a4);
}

- (os_unfair_lock_s)_cachedRowForRelationship:(const void *)a3 onObjectWithID:(void *)a4 generation:
{
  if (result)
  {
    uint64_t v6 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:]( *(void *)&result[36]._os_unfair_lock_opaque,  a4);
    return -[NSPersistentStoreCache toManyForSourceObjectID:forProperty:afterTimestamp:]( v6,  a3,  a2,  *(double *)&NSSQLDistantPastTimeInterval);
  }

  return result;
}

- (os_unfair_lock_s)_cachedRowForObjectWithID:(void *)a3 generation:
{
  if (result)
  {
    id v4 = (os_unfair_lock_s *)-[NSGenerationalRowCache rowCacheForGeneration:]( *(void *)&result[36]._os_unfair_lock_opaque,  a3);
    uint64_t result = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v4, a2, *(double *)&NSSQLDistantPastTimeInterval);
    if (result) {
      return *(os_unfair_lock_s **)&result[10]._os_unfair_lock_opaque;
    }
  }

  return result;
}

- (void)_clearCachedRowForObjectWithID:(void *)a3 generation:
{
  if (a1)
  {
    id v4 = -[NSGenerationalRowCache rowCacheForGeneration:](*(void *)(a1 + 144), a3);
    -[NSPersistentStoreCache forgetRowForObjectID:]((uint64_t)v4, a2);
  }

- (void)decodePrefetchResult:(void *)a3 forSources:(NSManagedObjectContext *)a4 context:
{
  uint64_t v110 = a3;
  uint64_t v140 = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a2 objectAtIndex:0];
  uint64_t v8 = [a2 objectAtIndex:1];
  uint64_t v9 = objc_msgSend( -[NSPersistentStore _persistentStoreCoordinator](a1, "_persistentStoreCoordinator"),  "managedObjectModel");
  else {
    double v11 = 0LL;
  }
  if ([v11 _propertyType] != 4) {
    return;
  }
  int v12 = [v11 isToMany];
  if (!v11) {
    return;
  }
  int v13 = v12;
  id v109 = (id)[a2 objectAtIndex:2];
  unint64_t v14 = [a2 count];
  if (v14 < 4) {
    return;
  }
  id v15 = (id)v14;
  uint64_t v16 = (NSManagedObject *)[a2 objectAtIndex:3];
  if (!v16) {
    return;
  }
  uint64_t v108 = v16;
  id defaultFaultHandler = v15;
  id v103 = a2;
  uint64_t v112 = v11;
  objc_msgSend((id)objc_msgSend(MEMORY[0x189603F50], "date"), "timeIntervalSinceReferenceDate");
  double v18 = v17;
  __int128 v113 = a1;
  uint64_t v111 = -[_NSQueryGenerationToken _generationalComponentForStore:]( -[NSManagedObjectContext _queryGenerationToken](a4, "_queryGenerationToken"),  a1);
  LODWORD(v104) = v13;
  if (v13)
  {
    __int128 v133 = 0u;
    __int128 v134 = 0u;
    __int128 v131 = 0u;
    __int128 v132 = 0u;
    uint64_t v19 = [v110 countByEnumeratingWithState:&v131 objects:v139 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v132;
      do
      {
        for (uint64_t i = 0LL; i != v20; ++i)
        {
          if (*(void *)v132 != v21) {
            objc_enumerationMutation(v110);
          }
          uint64_t v23 = *(void **)(*((void *)&v131 + 1) + 8 * i);
          if (-[NSEntityDescription _relationshipNamed:]((void *)[v23 entity], v7))
          {
            uint64_t v24 = (void *)[v23 objectID];
            uint64_t v25 = (void *)NSArray_EmptyArray;
            id v26 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)v113[1]._oidFactories, v111);
            -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]( (uint64_t)v26,  v25,  0LL,  v24,  v112,  v18);
          }
        }

        uint64_t v20 = [v110 countByEnumeratingWithState:&v131 objects:v139 count:16];
      }

      while (v20);
    }
  }

  uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:](v27, "setEntity:", [v112 destinationEntity]);
  -[NSFetchRequest setResultType:](v27, "setResultType:", 0LL);
  uint64_t v130 = 0LL;
  uint64_t v28 = (os_unfair_lock_s *)v113;
  id v29 = +[_NSXPCStoreUtilities _decodeResultSetData:forFetchRequest:options:store:context:rowCacheRows:error:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v108,  v27,  0LL,  v113,  a4,  &v130,  0LL);
  -[NSXPCStore cacheFetchedRows:forManagedObjects:generation:]((uint64_t)v113, v130, v29, v111);

  uint64_t v30 = [v29 count];
  if (!v30)
  {

    return;
  }

  unint64_t v31 = v30;
  uint64_t v107 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:v29];
  else {
    id v32 = (void *)[v103 lastObject];
  }
  id v103 = v32;
  if (v113) {
    id defaultFaultHandler = v113->_defaultFaultHandler;
  }
  else {
    id defaultFaultHandler = 0LL;
  }
  id v101 = objc_alloc_init(MEMORY[0x1896077E8]);
  unint64_t v102 = v31;
  id v105 = v29;
  if (!(_DWORD)v104)
  {
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    __int128 v118 = 0u;
    __int128 v119 = 0u;
    uint64_t v46 = v112;
    id v109 = (id)[v110 countByEnumeratingWithState:&v118 objects:v136 count:16];
    if (!v109) {
      goto LABEL_110;
    }
    uint64_t v108 = *(NSManagedObject **)v119;
    while (1)
    {
      uint64_t v47 = 0LL;
      uint64_t v48 = v111;
      do
      {
        if (*(NSManagedObject **)v119 != v108) {
          objc_enumerationMutation(v110);
        }
        uint64_t v49 = *(void **)(*((void *)&v118 + 1) + 8LL * (void)v47);
        uint64_t v50 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v51 = (const void *)[v49 objectID];
        uint64_t v52 = [v49 primitiveValueForKey:v7];
        if (!v52)
        {
          uint64_t v55 = (void *)-[os_unfair_lock_s valueForPropertyDescription:]( -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v113, v51, v48),  "valueForPropertyDescription:",  v46);
          goto LABEL_55;
        }

        uint64_t v53 = (void *)v52;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v54 = -[os_unfair_lock_s valueForPropertyDescription:]( -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v113, v51, v48),  "valueForPropertyDescription:",  v46);
          else {
            uint64_t v55 = 0LL;
          }
          goto LABEL_55;
        }

        objc_opt_class();
        __int128 v58 = -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v113, v51, v48);
        if (!v58)
        {
          uint64_t v55 = (void *)[v53 objectID];
          __int128 v62 = -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)v113, v55, v48);
          if (v62)
          {
            __int128 v63 = v62;
            uint64_t v46 = v112;
            if (a4)
            {
              id v64 = _PFRetainedObjectIDCore((uint64_t)a4, v55, 0LL, 1);
              id v57 = v64;
              if (v64)
              {
                int v65 = *((_DWORD *)v64 + 4);
                if ((v65 & 0x200) == 0) {
                  *((_DWORD *)v64 + 4) = v65 | 0x200;
                }
              }
            }

            else
            {
              id v57 = 0LL;
            }

            goto LABEL_62;
          }

          uint64_t v46 = v112;
LABEL_55:
          if (v55) {
            BOOL v56 = NSKeyValueCoding_NullValue == (void)v55;
          }
          else {
            BOOL v56 = 1;
          }
          if (!v56)
          {
            if (a4) {
              id v57 = _PFRetainedObjectIDCore((uint64_t)a4, v55, 0LL, 1);
            }
            else {
              id v57 = 0LL;
            }
            _PFFaultHandlerPreconnectRelationship((int)defaultFaultHandler, (unsigned int *)v49, v46, v57);
LABEL_62:
            [v107 removeObject:v57];

            goto LABEL_71;
          }

          goto LABEL_71;
        }

        __int128 v59 = (void *)-[os_unfair_lock_s valueForPropertyDescription:](v58, "valueForPropertyDescription:", v112);
        uint64_t v46 = v112;
        if (objc_msgSend((id)objc_msgSend(v53, "objectID"), "isEqual:", v59))
        {
          if (a4)
          {
            id v60 = _PFRetainedObjectIDCore((uint64_t)a4, v59, 0LL, 1);
            id v57 = v60;
            if (v60)
            {
              int v61 = *((_DWORD *)v60 + 4);
              if ((v61 & 0x200) == 0) {
                *((_DWORD *)v60 + 4) = v61 | 0x200;
              }
            }
          }

          else
          {
            id v57 = 0LL;
          }

          goto LABEL_62;
        }

- (void)cacheContents:(void *)a3 ofRelationship:(void *)a4 onObjectWithID:(void *)a5 withTimestamp:(double)a6 generation:
{
  id v10 = -[NSGenerationalRowCache rowCacheForGeneration:](*(void *)(a1 + 144), a5);
  -[NSPersistentStoreCache registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]( (uint64_t)v10,  a2,  0LL,  a4,  a3,  a6);
}

- (id)currentChangeToken
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  id v10 = __Block_byref_object_copy_;
  double v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0LL;
  id v3 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __42__NSXPCStore_Internal__currentChangeToken__block_invoke;
  v6[3] = &unk_189EA7258;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __42__NSXPCStore_Internal__currentChangeToken__block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSCoreDataXPCMessage);
  id v3 = v2;
  if (v2) {
    v2->_messageCode = 14LL;
  }
  v27[0] = [*(id *)(a1 + 32) identifier];
  id v5 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)_NSXPCStoreUtilities,  [MEMORY[0x189603F18] arrayWithObjects:v27 count:1]);
  if (v3) {
    objc_setProperty_nonatomic(v3, v4, v5, 24LL);
  }

  uint64_t v26 = 0LL;
  id v6 = -[NSXPCStore sendMessage:fromContext:interrupts:error:](*(uint64_t **)(a1 + 32), v3, 0LL, &v25, &v26);
  if (v6)
  {
    uint64_t v13 = (uint64_t)v6;
    unint64_t v14 = (void *)MEMORY[0x189604010];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    double v18 = (void *)+[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  v13,  *(void *)(a1 + 32),  v17);
    if (+[NSXPCStore debugDefault](&OBJC_CLASS___NSXPCStore, "debugDefault")) {
      _NSCoreDataLog(8LL, (uint64_t)@"Decoded history token - %@", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    }

    if (v18)
    {
      if ([v18 count]) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = -[_NSPersistentHistoryToken initWithDictionary:]( objc_alloc(&OBJC_CLASS____NSPersistentHistoryToken),  "initWithDictionary:",  v18);
      }
    }
  }

  else
  {
    _NSCoreDataLog(8LL, (uint64_t)@"Nil result for history token request - %@", v7, v8, v9, v10, v11, v12, v26);
  }

+ (int)debugDefault
{
  return dword_18C694DF4;
}

+ (void)setDebugDefault:(int)a3
{
  dword_18C694DF4 = a3;
}

- (Class)_objectIDClass
{
  return (Class)objc_opt_class();
}

- (id)_storeInfoForEntityDescription:(id)a3
{
  return (id)_sqlEntityForEntityDescription((uint64_t)self->_model, a3);
}

- (id)objectIDFactoryForEntity:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSXPCStore;
  id v5 = -[NSPersistentStore objectIDFactoryForEntity:](&v8, sel_objectIDFactoryForEntity_);
  if (![v5 _storeInfo1])
  {
    uint64_t v6 = 0LL;
    if (self && a3) {
      uint64_t v6 = _sqlEntityForEntityDescription((uint64_t)self->_model, a3);
    }
    [v5 _setStoreInfo1:v6];
  }

  return v5;
}

- (Class)objectIDFactoryForSQLEntity:(id)a3
{
  if (a3 && *((void *)a3 + 3)) {
    return (Class)-[NSXPCStore objectIDFactoryForEntity:](self, "objectIDFactoryForEntity:");
  }
  else {
    return 0LL;
  }
}

- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4
{
  return -[NSXPCStore newObjectIDForEntity:pk:]( self,  "newObjectIDForEntity:pk:",  _sqlEntityForEntityDescription((uint64_t)self->_model, a3),  a4);
}

- (id)connectionManager
{
  return self->_connectionManager;
}

- (id)fileBackedFuturesDirectory
{
  return self->_fileBackedFuturesDirectory;
}

@end