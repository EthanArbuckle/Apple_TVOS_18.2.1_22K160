@interface NSSQLCore
+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6;
+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7;
+ (BOOL)coloredLoggingDefault;
+ (BOOL)dropPersistentHistoryforPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5;
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (BOOL)trackSQLiteDatabaseStatistics;
+ (BOOL)useConcurrentFetching;
+ (Class)_databaseKeyFromValue:(uint64_t)a1;
+ (Class)databaseKeyFromOptionsDictionary:(uint64_t)a1;
+ (Class)migrationManagerClass;
+ (Class)rowCacheClass;
+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3;
+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (int)debugDefault;
+ (int64_t)bufferedAllocationsOverride;
+ (uint64_t)sanityCheckFileAtURL:(void *)a3 options:(uint64_t *)a4 error:;
+ (void)initialize;
+ (void)setColoredLoggingDefault:(BOOL)a3;
+ (void)setDebugDefault:(int)a3;
+ (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3;
- (BOOL)_hasActiveGenerations;
- (BOOL)_initializeQueryGenerationTrackingConnection;
- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)_unload:(id *)a3;
- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4;
- (BOOL)hasAncillaryModels;
- (BOOL)load:(id *)a3;
- (BOOL)loadMetadata:(id *)a3;
- (BOOL)supportsConcurrentRequestHandling;
- (BOOL)supportsGenerationalQuerying;
- (Class)_objectIDClass;
- (Class)objectIDFactoryForEntity:(id)a3;
- (Class)objectIDFactoryForPersistentHistoryEntity:(id)a3;
- (Class)objectIDFactoryForSQLEntity:(id)a3;
- (NSDictionary)ancillaryModels;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSSQLCore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (NSSQLModel)model;
- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5;
- (id)_newObjectIDForEntity:(id)a3 referenceData64:(unint64_t)a4;
- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)_rebuildDerivedAttributeTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:;
- (id)_storeInfoForEntityDescription:(id)a3;
- (id)adapter;
- (id)ancillarySQLModels;
- (id)connectionForMigration;
- (id)currentChangeToken;
- (id)currentQueryGeneration;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)externalDataReferencesDirectory;
- (id)fileBackedFuturesDirectory;
- (id)harvestIndexStatisticsFromConnections;
- (id)identifier;
- (id)metadata;
- (id)metadataToWrite;
- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4;
- (id)newObjectIDSetsForToManyPrefetchingRequest:(uint64_t)a3 andSourceObjectIDs:(uint64_t)a4 orderColumnName:;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3;
- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4;
- (id)type;
- (uint64_t)_disconnectAllConnections;
- (uint64_t)_rebuildTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:(id *)a3;
- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1;
- (uint64_t)entityForObjectID:(uint64_t)result;
- (uint64_t)newForeignKeyID:(void *)a1 entity:(uint64_t)a2;
- (uint64_t)safeguardLocationForFileWithUUID:(unint64_t *)a1;
- (unint64_t)entityIDForEntityDescription:(id)a3;
- (void)_cacheRows:(void *)result;
- (void)_initializeQueryGenerationConnectionForProtectionClasses;
- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3;
- (void)_newRowDataForXPCFetch:(void *)a3 variables:(uint64_t)a4 context:(void *)a5 error:;
- (void)_newValuesForRelationship:(void *)a3 forObjectWithID:(void *)a4 withContext:(NSError *)a5 error:;
- (void)_obtainPermanentIDsForObjects:(void *)a1 withNotification:(void *)a2 error:(void *)a3;
- (void)_postChangeNotificationWithTransactionID:(uint64_t)a1;
- (void)_rebuildIndiciesSynchronously:(BOOL)a3;
- (void)_refreshTriggerValues:(uint64_t)a1;
- (void)_setHasAncillaryModels:(BOOL)a3;
- (void)_setMetadata:(int)a3 clean:;
- (void)_setupHistoryModelForPSC:(void *)a3 withExcludedEntityNames:;
- (void)_setupObserver:(id)a3;
- (void)_supportDirectoryPath;
- (void)_uncacheRows:(void *)result;
- (void)_updateAutoVacuumMetadataWithValues:(unsigned __int8 *)a1;
- (void)_updateToVersion640PrimaryKeyTableUsingStatements:(void *)a3 connection:;
- (void)_useModel:(id *)a1;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)cachedModelWithError:(uint64_t)a1;
- (void)dealloc;
- (void)dispatchRequest:(uint64_t)a3 withRetries:;
- (void)freeQueryGenerationWithIdentifier:(id)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)rowCacheForGeneration:(void *)result;
- (void)setAncillaryModels:(id)a3;
- (void)setAncillarySQLModels:(id)a3;
- (void)setExclusiveLockingMode:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setURL:(id)a3;
- (void)supportsComplexFeatures;
- (void)willRemoveFromPersistentStoreCoordinator:(id)a3;
@end

@implementation NSSQLCore

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v187 = *MEMORY[0x1895F89C0];
  uint64_t v6 = [a3 requestType];
  v172 = 0LL;
  uint64_t v169 = *MEMORY[0x189607460];
  int v7 = 4;
  while (1)
  {
    BOOL v8 = __OFSUB__(v7--, 1);
    if (v7 < 0 != v8) {
      break;
    }
    switch(v6)
    {
      case 1LL:
        if ([a3 resultType] == 4) {
          goto LABEL_5;
        }
        if (self)
        {
          v92 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLFetchRequestContext),  "initWithRequest:context:sqlCore:",  a3,  a4,  self);
          id v93 = (id)[a4 _delegate];
          if (v93 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v93 managedObjectContext:a4 willExecuteFetchRequest:a3];
          }
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v92, 0LL);
          id v94 = -[NSSQLStoreRequestContext result](v92, "result");
          if (v92) {
            v95 = v92->super._exception;
          }
          else {
            v95 = 0LL;
          }
          exception = v95;
          if (v92) {
            error = v92->super._error;
          }
          else {
            error = 0LL;
          }
          v21 = error;
          if (v93 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v97 = -[NSSQLFetchRequestContext fetchStatement](v92, "fetchStatement");
            uint64_t v98 = -[NSSQLiteStatement sqlString](v97, "sqlString");
            uint64_t v99 = -[NSSQLiteStatement bindVariables](v97, "bindVariables");
            if (v94) {
              uint64_t v100 = [v94 count];
            }
            else {
              uint64_t v100 = -1LL;
            }
            [v93 managedObjectContext:a4 didExecuteFetchRequest:a3 withSQLString:v98 bindVariables:v99 rowCount:v100];
          }

          if (v94)
          {
LABEL_174:
            v21 = 0LL;
          }

          else
          {
            v67 = exception;
            if (exception) {
              goto LABEL_229;
            }
            if (!v21)
            {
              uint64_t v149 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
              _NSCoreDataLog( 17LL,  v149,  v150,  v151,  v152,  v153,  v154,  v155,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
              v156 = (os_log_s *)__pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                v184 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
                __int16 v185 = 1024;
                int v186 = 2689;
                _os_log_fault_impl( &dword_186681000,  v156,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
              }

              goto LABEL_174;
            }
          }

          v32 = (NSPersistentCloudKitContainerEventResult *)v94;
          goto LABEL_178;
        }

        v21 = 0LL;
        v32 = 0LL;
LABEL_178:
        v148 = (void *)[a3 _asyncResultHandle];
        if (v148 && [v148 _isCancelled])
        {
          v21 = (NSError *)[MEMORY[0x189607870] errorWithDomain:v169 code:3072 userInfo:0];
          int v7 = 0;
          v32 = 0LL;
        }

        uint64_t v6 = 1LL;
        goto LABEL_200;
      case 2LL:
        if (!self)
        {
          v21 = 0LL;
          v32 = 0LL;
          goto LABEL_84;
        }

        v23 = -[NSSQLSaveChangesRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLSaveChangesRequestContext),  "initWithRequest:context:sqlCore:",  a3,  a4,  self);
        p_isa = (id *)&v23->super.super.isa;
        if (!v23)
        {
          p_transactionInMemorySequence = &self->_transactionInMemorySequence;
          do
            unsigned int v162 = __ldaxr((unsigned int *)p_transactionInMemorySequence);
          while (__stlxr(v162 + 1, (unsigned int *)p_transactionInMemorySequence));
          savePlan = 0LL;
          atomic_load((unsigned int *)&self->_transactionInMemorySequence);
          BOOL v29 = 1;
LABEL_33:
          id v31 = (id)NSArray_EmptyArray;
          goto LABEL_81;
        }

        savePlan = v23->_savePlan;
        v26 = &self->_transactionInMemorySequence;
        do
          unsigned int v27 = __ldaxr((unsigned int *)v26);
        while (__stlxr(v27 + 1, (unsigned int *)v26));
        unsigned int v28 = atomic_load((unsigned int *)&self->_transactionInMemorySequence);
        BOOL v29 = savePlan == 0LL;
        if (savePlan) {
          atomic_store(v28, (unsigned int *)&savePlan->_transactionInMemorySequence);
        }
        if (!v23->_metadataToWrite)
        {
          v30 = v23->_savePlan;
          if (!v30 || (*(_BYTE *)&v30->_flags & 2) == 0) {
            goto LABEL_33;
          }
        }

        -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v23, 0LL);
        id v66 = (id)[p_isa result];
        v67 = (NSException *)p_isa[6];
        if (!v66 && v67)
        {
LABEL_229:
          objc_exception_throw(v67);
          goto LABEL_248;
        }

        atomic_store(1u, (unsigned __int8 *)&self->_metadataIsClean);
        -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 0LL);
        id v31 = v66;
LABEL_81:
        -[NSPersistentStore doFilesystemCleanupOnRemove:](self, "doFilesystemCleanupOnRemove:", 0LL);
        v68 = (void *)MEMORY[0x189607950];
        v69 = (void *)MEMORY[0x189603F68];
        uint64_t v70 = [MEMORY[0x189607968] numberWithInt:5];
        if (v29) {
          uint64_t v71 = 0LL;
        }
        else {
          uint64_t v71 = atomic_load((unsigned int *)&savePlan->_transactionInMemorySequence);
        }
        uint64_t v72 = objc_msgSend( v68,  "notificationWithName:object:userInfo:",  @"_NSSQLCoreTransactionStateChangeNotification",  self,  objc_msgSend( v69,  "dictionaryWithObjectsAndKeys:",  v70,  @"_NSSQLCoreTransactionType",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v71),  @"_NSSQLCoreTransientSequenceNumber",  a4,  @"_NSSQLCoreActiveSavingContext",  0));
        objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v72);

        v32 = (NSPersistentCloudKitContainerEventResult *)v31;
        v21 = 0LL;
LABEL_84:
        uint64_t v6 = 2LL;
        goto LABEL_200;
      case 3LL:
LABEL_5:
        if (self)
        {
          if (_sqlCoreLookupSQLEntityForEntityDescription(self, (void *)[a3 entity]))
          {
            v9 = (void *)[a3 predicate];
            if (v9) {
              [v9 minimalFormInContext:0];
            }
            v10 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLCountRequestContext),  "initWithRequest:context:sqlCore:",  a3,  a4,  self);
            -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v10, 0LL);
            id v11 = -[NSSQLStoreRequestContext result](v10, "result");
            if (v10) {
              v12 = v10->super.super._exception;
            }
            else {
              v12 = 0LL;
            }
            v13 = v12;

            if (!v11 && v13) {
              goto LABEL_228;
            }
            v14 = (NSPersistentCloudKitContainerEventResult *)v11;
          }

          else
          {
            v14 = (NSPersistentCloudKitContainerEventResult *)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 0));
          }

          v32 = v14;
          v21 = 0LL;
        }

        else
        {
          v21 = 0LL;
          v32 = 0LL;
        }

        uint64_t v6 = 3LL;
        goto LABEL_200;
      case 4LL:
        v21 = 0LL;
        if (self) {
          v32 = (NSPersistentCloudKitContainerEventResult *)NSArray_EmptyArray;
        }
        else {
          v32 = 0LL;
        }
        uint64_t v6 = 4LL;
        goto LABEL_200;
      case 5LL:
        if (self)
        {
          v15 = -[NSSQLBatchInsertRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBatchInsertRequestContext),  "initWithRequest:context:sqlCore:",  a3,  a4,  self);
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v15, 0LL);
          id v16 = -[NSSQLStoreRequestContext result](v15, "result");
          if (v15) {
            v17 = v15->super.super._exception;
          }
          else {
            v17 = 0LL;
          }
          v18 = v17;
          if (v15) {
            v19 = v15->super.super._error;
          }
          else {
            v19 = 0LL;
          }
          v20 = v19;

          if (v16)
          {
            v21 = 0LL;
          }

          else
          {
            if (v18)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_240;
              }
              v101 = (NSError *)-[NSException errorObjectWithUserInfo:](v18, "errorObjectWithUserInfo:", 0LL);
            }

            else
            {
              v101 = v20;
            }

            v21 = v101;
          }

          v32 = (NSPersistentCloudKitContainerEventResult *)v16;
          if (v21 && a3 && (*((void *)a3 + 4) || *((void *)a3 + 5))) {
            int v7 = 0;
          }
        }

        else
        {
          v21 = 0LL;
          v32 = 0LL;
        }

        uint64_t v6 = 5LL;
        goto LABEL_200;
      case 6LL:
        if (self)
        {
          v40 = -[NSSQLBatchUpdateRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBatchUpdateRequestContext),  "initWithRequest:context:sqlCore:",  a3,  a4,  self);
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v40, 0LL);
          id v41 = -[NSSQLStoreRequestContext result](v40, "result");
          if (v40) {
            v42 = v40->super.super._exception;
          }
          else {
            v42 = 0LL;
          }
          v18 = v42;
          if (v40) {
            v43 = v40->super.super._error;
          }
          else {
            v43 = 0LL;
          }
          v44 = v43;

          if (v41)
          {
            v21 = 0LL;
          }

          else
          {
            if (v18)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_240;
              }
              v102 = (NSError *)-[NSException errorObjectWithUserInfo:](v18, "errorObjectWithUserInfo:", 0LL);
            }

            else
            {
              v102 = v44;
            }

            v21 = v102;
          }

          v32 = (NSPersistentCloudKitContainerEventResult *)v41;
        }

        else
        {
          v21 = 0LL;
          v32 = 0LL;
        }

        uint64_t v6 = 6LL;
        goto LABEL_200;
      case 7LL:
        if (self)
        {
          v45 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBatchDeleteRequestContext),  "initWithRequest:context:sqlCore:",  a3,  a4,  self);
          -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v45, 0LL);
          id v46 = -[NSSQLStoreRequestContext result](v45, "result");
          if (v45) {
            v47 = v45->super.super._exception;
          }
          else {
            v47 = 0LL;
          }
          v18 = v47;
          if (v45) {
            v48 = v45->super.super._error;
          }
          else {
            v48 = 0LL;
          }
          v49 = v48;

          if (v46)
          {
            v21 = 0LL;
          }

          else
          {
            if (v18)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_240;
              }
              v103 = (NSError *)-[NSException errorObjectWithUserInfo:](v18, "errorObjectWithUserInfo:", 0LL);
            }

            else
            {
              v103 = v49;
            }

            v21 = v103;
          }

          v32 = (NSPersistentCloudKitContainerEventResult *)v46;
        }

        else
        {
          v21 = 0LL;
          v32 = 0LL;
        }

        uint64_t v6 = 7LL;
        goto LABEL_200;
      case 8LL:
        if (!self) {
          goto LABEL_131;
        }
        if ((*((_BYTE *)&self->_sqlCoreFlags + 1) & 4) == 0)
        {
          id v33 = -[NSSQLCore identifier](self, "identifier");
          -[NSPersistentStore URL](self, "URL");
          _NSCoreDataLog( 1LL,  (uint64_t)@"History Change Request failed as no history tracking option detected on store %@ at %@",  v34,  v35,  v36,  v37,  v38,  v39,  (uint64_t)v33);
          v21 = (NSError *)[MEMORY[0x189607870] errorWithDomain:v169 code:134091 userInfo:&unk_189F03D60];
          if (!v21)
          {
            uint64_t v104 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog( 17LL,  v104,  v105,  v106,  v107,  v108,  v109,  v110,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
            uint64_t v111 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v184 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
              __int16 v185 = 1024;
              int v186 = 2494;
              v145 = (os_log_s *)v111;
LABEL_208:
              _os_log_fault_impl( &dword_186681000,  v145,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
            }

            goto LABEL_131;
          }

+ (BOOL)coloredLoggingDefault
{
  return _CoreData_SyntaxColoredLogging;
}

+ (BOOL)useConcurrentFetching
{
  return dword_18C694E60 != 0;
}

- (BOOL)supportsGenerationalQuerying
{
  unsigned int v3 = -[NSSQLCore supportsComplexFeatures](self);
  if (v3)
  {
    if (self) {
      LOBYTE(v3) = (*(_DWORD *)&self->_sqlCoreFlags & 0x4000) == 0;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }

  return v3;
}

- (void)supportsComplexFeatures
{
  if (result)
  {
    v1 = result;
    result = (void *)[result _persistentStoreCoordinator];
    if (result)
    {
      if (objc_msgSend( (id)objc_msgSend(v1, "options"),  "objectForKey:",  @"NSPersistentStoreUbiquitousContentNameKey"))
      {
        return 0LL;
      }

      else
      {
        return (void *)(objc_msgSend((id)objc_msgSend(v1, "options"), "objectForKey:", @"NSXPCStoreDelegate") == 0);
      }
    }
  }

  return result;
}

- (id)externalDataReferencesDirectory
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  p_externalDataReferencesDirectory = (unint64_t *)&self->_externalDataReferencesDirectory;
  if (!atomic_load((unint64_t *)&self->_externalDataReferencesDirectory))
  {
    if ((*(_BYTE *)&self->_sqlCoreFlags & 2) == 0)
    {
      v5 = &stru_189EAC2E8;
      goto LABEL_8;
    }

    v5 = (__CFString *)(id)[-[NSSQLCore _supportDirectoryPath](self) stringByAppendingPathComponent:@"_EXTERNAL_DATA"];
    uint64_t v6 = (void *)[MEMORY[0x1896078A8] defaultManager];
    char v34 = 0;
    if ([v6 fileExistsAtPath:v5 isDirectory:&v34])
    {
      if (v34) {
        goto LABEL_8;
      }
      int v7 = (void *)MEMORY[0x189603F70];
      uint64_t v8 = *MEMORY[0x189603A58];
      v9 = @"Can't create external reference directory (file exists)";
      uint64_t v10 = 0LL;
      goto LABEL_31;
    }

    id v33 = 0LL;
    if (([v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v33] & 1) == 0)
    {
      uint64_t v18 = [NSString stringWithUTF8String:"Fatal error creating external data directory: %@ at path %@ with ui %@"];
      v19 = @"null";
      if (v33) {
        v20 = v33;
      }
      else {
        v20 = @"null";
      }
      -[__CFString userInfo](v33, "userInfo");
      _NSCoreDataLog(17LL, v18, v21, v22, v23, v24, v25, v26, (uint64_t)v20);
      unsigned int v27 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        if (v33) {
          v19 = v33;
        }
        uint64_t v28 = -[__CFString userInfo](v33, "userInfo");
        *(_DWORD *)buf = 138412802;
        uint64_t v36 = v19;
        __int16 v37 = 2112;
        uint64_t v38 = v5;
        __int16 v39 = 2112;
        uint64_t v40 = v28;
        _os_log_fault_impl( &dword_186681000,  v27,  OS_LOG_TYPE_FAULT,  "CoreData: Fatal error creating external data directory: %@ at path %@ with ui %@",  buf,  0x20u);
      }

      BOOL v29 = (void *)MEMORY[0x189603F70];
      uint64_t v30 = *MEMORY[0x189603A58];
      uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObject:v33 forKey:*MEMORY[0x189607798]];
      v9 = @"Can't create support directory (can't create directory)";
      int v7 = v29;
      uint64_t v8 = v30;
LABEL_31:
      objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:v10]);
      return -[NSSQLCore fileBackedFuturesDirectory](v31, v32);
    }

- (id)fileBackedFuturesDirectory
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  p_fileBackedFuturesPath = (unint64_t *)&self->_fileBackedFuturesPath;
  if (!atomic_load((unint64_t *)&self->_fileBackedFuturesPath))
  {
    if ((*((_BYTE *)&self->_sqlCoreFlags + 1) & 0x20) == 0)
    {
      v4 = &stru_189EAC2E8;
      goto LABEL_8;
    }

    v4 = (__CFString *)(id)[-[NSSQLCore _supportDirectoryPath](self) stringByAppendingPathComponent:@"_FBF"];
    v5 = (void *)[MEMORY[0x1896078A8] defaultManager];
    char v29 = 0;
    if ([v5 fileExistsAtPath:v4 isDirectory:&v29])
    {
      if (v29) {
        goto LABEL_8;
      }
      uint64_t v6 = (void *)MEMORY[0x189603F70];
      uint64_t v7 = *MEMORY[0x189603A58];
      uint64_t v8 = @"Can't create fbf directory (file exists)";
      uint64_t v9 = 0LL;
      goto LABEL_24;
    }

    uint64_t v28 = 0LL;
    if (([v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v28] & 1) == 0)
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Fatal error creating file backed futures directory: %@ at path %@ with ui %@"];
      v14 = @"null";
      if (v28) {
        v15 = v28;
      }
      else {
        v15 = @"null";
      }
      -[__CFString userInfo](v28, "userInfo");
      _NSCoreDataLog(17LL, v13, v16, v17, v18, v19, v20, v21, (uint64_t)v15);
      uint64_t v22 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        if (v28) {
          v14 = v28;
        }
        uint64_t v23 = -[__CFString userInfo](v28, "userInfo");
        *(_DWORD *)buf = 138412802;
        id v31 = v14;
        __int16 v32 = 2112;
        id v33 = v4;
        __int16 v34 = 2112;
        uint64_t v35 = v23;
        _os_log_fault_impl( &dword_186681000,  v22,  OS_LOG_TYPE_FAULT,  "CoreData: Fatal error creating file backed futures directory: %@ at path %@ with ui %@",  buf,  0x20u);
      }

      uint64_t v24 = (void *)MEMORY[0x189603F70];
      uint64_t v25 = *MEMORY[0x189603A58];
      uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObject:v28 forKey:*MEMORY[0x189607798]];
      uint64_t v8 = @"Can't create support directory (can't create directory)";
      uint64_t v6 = v24;
      uint64_t v7 = v25;
LABEL_24:
      objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:v9]);
      return (id)_sqlCoreLookupSQLEntityForEntityDescription(v26, v27);
    }

- (NSSQLModel)model
{
  return self->_model;
}

- (void)rowCacheForGeneration:(void *)result
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (result)
  {
    v2 = result;
    result = (void *)result[17];
    if (result)
    {
      result = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)result, a2);
      if (!result)
      {
        uint64_t v4 = [NSString stringWithUTF8String:"generational row cache %p failed to return a value for store '%@' with token %@"];
        uint64_t v5 = v2[17];
        [v2 identifier];
        _NSCoreDataLog(17LL, v4, v6, v7, v8, v9, v10, v11, v5);
        unint64_t v12 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          uint64_t v13 = v2[17];
          *(_DWORD *)buf = 134218498;
          uint64_t v15 = v13;
          __int16 v16 = 2112;
          uint64_t v17 = [v2 identifier];
          __int16 v18 = 2112;
          uint64_t v19 = a2;
          _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: generational row cache %p failed to return a value for store '%@' with token %@",  buf,  0x20u);
        }

        return 0LL;
      }
    }
  }

  return result;
}

- (void)dispatchRequest:(uint64_t)a3 withRetries:
{
  if (a1)
  {
    [a2 executePrologue];
    if (a2)
    {
      if (a2[6]) {
        return;
      }
      BOOL v6 = a2[5] != 0LL;
      if (a3 < 0) {
        return;
      }
    }

    else
    {
      BOOL v6 = 0;
      if (a3 < 0) {
        return;
      }
    }

    if (!v6)
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = a3 + 1;
      do
      {
        if ((-[NSSQLCoreDispatchManager routeStoreRequest:](*(void *)(a1 + 128), (uint64_t)a2) & 1) != 0
          || [a2 result])
        {
          [a2 executeEpilogue];
          return;
        }

        if (a2) {
          uint64_t v9 = (void *)a2[6];
        }
        else {
          uint64_t v9 = 0LL;
        }
        id v10 = v9;
        if (v10)
        {
          unint64_t v12 = v10;
          if (!v7) {
            uint64_t v7 = v10;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0) {
              [v12 userInfo];
            }
            _NSCoreDataLog( 1LL,  (uint64_t)@"SQLCore dispatchRequest: exception handling request: %@ , %@ with userInfo of %@",  v13,  v14,  v15,  v16,  v17,  v18,  (uint64_t)a2);
          }
        }

        --v8;
      }

      while (v8 > 0);
      if (a2)
      {
        if (v7) {
          objc_setProperty_nonatomic(a2, v11, v7, 48LL);
        }
      }
    }
  }

- (id)adapter
{
  return self->_adapter;
}

+ (int)debugDefault
{
  return dword_18C694E5C;
}

- (Class)objectIDFactoryForSQLEntity:(id)a3
{
  return -[NSSQLCore objectIDFactoryForEntity:](self, "objectIDFactoryForEntity:", *((void *)a3 + 3));
}

- (Class)objectIDFactoryForEntity:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSSQLCore;
  uint64_t v5 = -[NSPersistentStore objectIDFactoryForEntity:](&v8, sel_objectIDFactoryForEntity_);
  if (!-[objc_class _storeInfo1](v5, "_storeInfo1"))
  {
    uint64_t v6 = 0LL;
    if (self && a3) {
      uint64_t v6 = _sqlCoreLookupSQLEntityForEntityDescription(self, a3);
    }
    -[objc_class _setStoreInfo1:](v5, "_setStoreInfo1:", v6);
  }

  return v5;
}

- (id)_storeInfoForEntityDescription:(id)a3
{
  return (id)_sqlCoreLookupSQLEntityForEntityDescription(self, a3);
}

+ (int64_t)bufferedAllocationsOverride
{
  return qword_18C694E68;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v7 = v6;
  id v8 = (id)[v6 firstObject];

  return v8;
}

- (void)_newValuesForRelationship:(void *)a3 forObjectWithID:(void *)a4 withContext:(NSError *)a5 error:
{
  if (a1 && [a1 _persistentStoreCoordinator])
  {
    if ([a3 isTemporaryID])
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"cannot find data for a temporary oid: %@", a3), 0 reason userInfo]);
      objc_exception_rethrow();
      goto LABEL_32;
    }

    [a4 stalenessInterval];
    double v11 = v10;
    double v12 = CFAbsoluteTimeGetCurrent() - v10;
    if (v11 <= 0.0) {
      double v12 = *(double *)&NSSQLDistantPastTimeInterval;
    }
    if (v11 == 0.0) {
      double v13 = *(double *)&NSSQLDistantFutureTimeInterval;
    }
    else {
      double v13 = v12;
    }
    uint64_t v14 = (os_unfair_lock_s *)-[NSSQLCore rowCacheForGeneration:]( a1,  (void *)objc_msgSend(a4, "_queryGenerationToken", v12));
    if ([a2 isToMany])
    {
      id v15 = (id)-[NSPersistentStoreCache toManyInformationForSourceObjectID:forProperty:afterTimestamp:]( (uint64_t)v14,  a3,  a2,  v13);
    }

    else
    {
      uint64_t v16 = -[os_unfair_lock_s valueForKey:]( -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v14, a3, v13),  "valueForKey:",  [a2 name]);
      if (!v16) {
        goto LABEL_15;
      }
      id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v16, 0);
    }

    if (v15) {
      return;
    }
LABEL_15:
    uint64_t v17 = -[NSSQLRelationshipFaultRequestContext initWithObjectID:relationship:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLRelationshipFaultRequestContext),  "initWithObjectID:relationship:context:sqlCore:",  a3,  a2,  a4,  a1);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v17, 0LL);
    if (-[NSSQLStoreRequestContext result](v17, "result"))
    {
LABEL_25:

      return;
    }

    if (v17)
    {
      exception = v17->super._exception;
      if (exception)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!a5) {
            goto LABEL_25;
          }
          uint64_t v19 = (NSError *)-[NSException errorObjectWithUserInfo:](exception, "errorObjectWithUserInfo:", 0LL);
          goto LABEL_24;
        }

        uint64_t v21 = exception;
        objc_exception_throw(exception);
LABEL_32:
        __break(1u);
        return;
      }

      if (!a5) {
        goto LABEL_25;
      }
      error = v17->super._error;
    }

    else
    {
      error = 0LL;
      if (!a5) {
        goto LABEL_25;
      }
    }

    uint64_t v19 = error;
LABEL_24:
    *a5 = v19;
    goto LABEL_25;
  }

- (uint64_t)entityForObjectID:(uint64_t)result
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (a2)
    {
      unsigned int v3 = (void *)result;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        result = [a2 _storeInfo1];
        if (result) {
          return result;
        }
        uint64_t v4 = [NSString stringWithUTF8String:"entityForObjectID failed to retrieve an NSSQLEntity for objectID %@"];
        _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
        double v11 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = a2;
          _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: entityForObjectID failed to retrieve an NSSQLEntity for objectID %@",  buf,  0xCu);
        }
      }

      double v12 = (void *)[a2 entity];
      if (v12)
      {
        double v13 = v12;
        result = _sqlCoreLookupSQLEntityForEntityDescription(v3, v12);
        if (result) {
          return result;
        }
        uint64_t v14 = [NSString stringWithUTF8String:"_sqlCoreLookupSQLEntityForEntityDescription failed to return a result for objectID %@ with entity %@"];
        _NSCoreDataLog(17LL, v14, v15, v16, v17, v18, v19, v20, (uint64_t)a2);
        uint64_t v21 = __pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
          return 0LL;
        }
        *(_DWORD *)buf = 138412546;
        v43 = a2;
        __int16 v44 = 2112;
        v45 = v13;
        uint64_t v22 = "CoreData: _sqlCoreLookupSQLEntityForEntityDescription failed to return a result for objectID %@ with entity %@";
        uint64_t v23 = (os_log_s *)v21;
        uint32_t v24 = 22;
        goto LABEL_17;
      }

      uint64_t v33 = [NSString stringWithUTF8String:"entityForObjectID passed a nil entity description from %@"];
      _NSCoreDataLog(17LL, v33, v34, v35, v36, v37, v38, v39, (uint64_t)a2);
      uint64_t v40 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        return 0LL;
      }
      *(_DWORD *)buf = 138412290;
      v43 = a2;
      uint64_t v22 = "CoreData: entityForObjectID passed a nil entity description from %@";
      uint64_t v23 = (os_log_s *)v40;
      uint32_t v24 = 12;
    }

    else
    {
      uint64_t v25 = [NSString stringWithUTF8String:"entityForObjectID was passed a nil objectID"];
      _NSCoreDataLog(17LL, v25, v26, v27, v28, v29, v30, v31, v41);
      uint64_t v32 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        return 0LL;
      }
      *(_WORD *)buf = 0;
      uint64_t v22 = "CoreData: entityForObjectID was passed a nil objectID";
      uint64_t v23 = (os_log_s *)v32;
      uint32_t v24 = 2;
    }

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1895F89C0];
  if (!-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator")) {
    return 0LL;
  }
  if ([a3 isTemporaryID])
  {
    a4 = (id)MEMORY[0x189603F70];
    a5 = (id *)*MEMORY[0x189603A58];
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"cannot find data for a temporary oid: %@", a3), 0 reason userInfo]);
  }

  else
  {
    [a4 stalenessInterval];
    double v11 = v10;
    if (v10 <= 0.0) {
      double v12 = *(double *)&NSSQLDistantPastTimeInterval;
    }
    else {
      double v12 = CFAbsoluteTimeGetCurrent() - v10;
    }
    if (v11 == 0.0) {
      double v5 = *(double *)&NSSQLDistantFutureTimeInterval;
    }
    else {
      double v5 = v12;
    }
    if (self)
    {
      uint64_t v14 = (os_unfair_lock_s *)-[NSSQLCore rowCacheForGeneration:]( self,  (void *)objc_msgSend(a4, "_queryGenerationToken", v12));
      goto LABEL_12;
    }
  }

  uint64_t v14 = 0LL;
LABEL_12:
  uint64_t v15 = -[NSPersistentStoreCache rowForObjectID:afterTimestamp:](v14, a3, v5);
  if (v15)
  {
    double v13 = v15;
    uint64_t v16 = v15;
    return v13;
  }

  uint64_t v17 = -[NSSQLObjectFaultRequestContext initWithObjectID:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLObjectFaultRequestContext),  "initWithObjectID:context:sqlCore:",  a3,  a4,  self);
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v17, 0LL);
  double v13 = (os_unfair_lock_s *)-[NSSQLStoreRequestContext result](v17, "result");
  if (v13)
  {
LABEL_28:

    return v13;
  }

  if (!v17)
  {
    if (!a5) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }

  exception = v17->super._exception;
  if (!exception)
  {
    if (!a5) {
      goto LABEL_30;
    }
    error = v17->super._error;
    if (error)
    {
      uint64_t v19 = error;
      goto LABEL_27;
    }

- (uint64_t)newForeignKeyID:(void *)a1 entity:(uint64_t)a2
{
  if (a1 && a2) {
    return objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "objectIDFactoryForSQLEntity:")), "initWithPK64:", a2);
  }
  else {
    return 0LL;
  }
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  double v5 = -[NSSQLCore rowCacheForGeneration:](self, a4);
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
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (self)
  {
    id v5 = -[NSGenerationalRowCache rowCacheForGeneration:]((uint64_t)self->_generationalRowCache, a4);
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0LL;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(a3);
            }
            -[NSPersistentStoreCache decrementRefCountForObjectID:]( v6,  *(const void **)(*((void *)&v11 + 1) + 8 * v10++));
          }

          while (v8 != v10);
          uint64_t v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }

        while (v8);
      }
    }
  }

+ (void)setDebugDefault:(int)a3
{
  dword_18C694E5C = a3;
}

+ (void)setColoredLoggingDefault:(BOOL)a3
{
  _CoreData_SyntaxColoredLogging = a3;
}

+ (BOOL)trackSQLiteDatabaseStatistics
{
  return _MergedGlobals_152;
}

+ (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3
{
  _MergedGlobals_152 = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    objc_opt_class();
    objc_opt_self();
    dword_18C694E5C = +[_PFRoutines sensitiveIntegerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.SQLDebug");
    v2 = +[_PFRoutines stringValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.ConcurrentFetching");
    if (v2 && (unsigned int v3 = v2, [v2 length])) {
      int v4 = [v3 intValue];
    }
    else {
      int v4 = 1;
    }
    dword_18C694E60 = v4;
    BOOL v6 = (int)+[_PFTask getNumActiveProcessors]() > 1 && dword_18C694E60 > 0;
    dword_18C694E60 = v6;
    objc_msgSend((id)objc_msgSend(MEMORY[0x189603F50], "distantPast"), "timeIntervalSinceReferenceDate");
    NSSQLDistantPastTimeInterval = v7;
    objc_msgSend((id)objc_msgSend(MEMORY[0x189603F50], "distantFuture"), "timeIntervalSinceReferenceDate");
    NSSQLDistantFutureTimeInterval = v8;
    qword_18C694E70 = (uint64_t)objc_alloc_init(MEMORY[0x189607988]);
    uint64_t v9 = +[_PFRoutines integerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.BufferAllocations");
    qword_18C694E68 = v9;
    if (v9 >= 1) {
      _NSCoreDataLog( 2LL,  (uint64_t)@"Dictionary Result type overridden to use Buffered Results with level - %ld!!!",  v10,  v11,  v12,  v13,  v14,  v15,  v9);
    }
    _CoreData_debugVMBufferAllocations = +[_PFRoutines BOOLValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.BufferAllocations.VMMemory");
    _CoreData_debugOneBufferAllocations = +[_PFRoutines BOOLValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.BufferAllocations.OneBuffer");
    _CoreData_debuguseManyResultSetsAllocations = +[_PFRoutines BOOLValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.BufferAllocations.ManyResultSets");
    _MergedGlobals_152 = +[_PFRoutines integerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.SQLDatabaseStatistics") != 0;
    uint64_t v16 = getprogname();
    if (v16)
    {
      uint64_t v17 = v16;
      if (!strncmp("xctest", v16, 6uLL) || !strncmp("mapssyncd", v17, 9uLL)) {
        byte_18C694E59 = 1;
      }
    }
  }

+ (Class)rowCacheClass
{
  return (Class)objc_opt_class();
}

+ (Class)migrationManagerClass
{
  return (Class)objc_opt_class();
}

+ (Class)databaseKeyFromOptionsDictionary:(uint64_t)a1
{
  return +[NSSQLCore _databaseKeyFromValue:]( (uint64_t)NSSQLCore,  (void *)[a2 objectForKey:@"_NSSQLiteSEEKeychainItemOption"]);
}

+ (Class)_databaseKeyFromValue:(uint64_t)a1
{
  v29[3] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (!a2) {
    return 0LL;
  }
  if (!byte_18C4ABDC4)
  {
    uint64_t v4 = [NSString stringWithUTF8String:"Illegal attempt to use SPI outside of entitled process"];
    _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, v26);
    uint64_t v11 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(result) = 0;
      _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to use SPI outside of entitled process",  (uint8_t *)&result,  2u);
    }

    return 0LL;
  }

  CFTypeRef result = 0LL;
  if ([a2 isNSData])
  {
    unsigned int v3 = (void *)objc_msgSend( MEMORY[0x189603F48],  "_newZeroingDataWithBytes:length:",  objc_msgSend(a2, "bytes"),  objc_msgSend(a2, "length"));
    CFTypeRef result = v3;
    return (Class)v3;
  }

  uint64_t v13 = *MEMORY[0x18960BE88];
  v28[0] = *MEMORY[0x18960BB38];
  v28[1] = v13;
  v29[0] = *MEMORY[0x18960BB48];
  v29[1] = a2;
  v28[2] = *MEMORY[0x18960BE20];
  v29[2] = *MEMORY[0x189604DE8];
  uint64_t v14 = SecItemCopyMatching( (CFDictionaryRef)[MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:v28 count:3],  &result);
  if ((_DWORD)v14)
  {
    uint64_t v15 = v14;
    CFStringRef v16 = SecCopyErrorMessageString(v14, 0LL);
    if (v16)
    {
      CFStringRef v22 = v16;
      uint64_t v23 = [NSString stringWithFormat:@"Keychain failed to return key for database encryption (error %d): %@", v15, v16];
      CFRelease(v22);
      uint64_t v20 = (void *)MEMORY[0x189603F70];
      uint64_t v21 = *MEMORY[0x189603A60];
      uint64_t v19 = (const __CFString *)v23;
    }

    else
    {
      uint64_t v17 = (void *)MEMORY[0x189603F70];
      uint64_t v18 = *MEMORY[0x189603A60];
      uint64_t v19 = (const __CFString *)objc_msgSend( NSString,  "stringWithFormat:",  @"Keychain failed to return key for database encryption (error %d)",  v15);
      uint64_t v20 = v17;
      uint64_t v21 = v18;
    }
  }

  else
  {
    unsigned int v3 = (void *)result;
    if (result) {
      return (Class)v3;
    }
    uint64_t v20 = (void *)MEMORY[0x189603F70];
    uint64_t v21 = *MEMORY[0x189603A60];
    uint64_t v19 = @"Keychain did not return a key for database encryption";
  }

  objc_exception_throw((id)[v20 exceptionWithName:v21 reason:v19 userInfo:0]);
  return -[NSSQLCore _objectIDClass](v24, v25);
}

- (Class)_objectIDClass
{
  return (Class)objc_opt_class();
}

- (Class)objectIDFactoryForPersistentHistoryEntity:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSQLCore;
  uint64_t v4 = -[NSPersistentStore objectIDFactoryForEntity:]( &v6,  sel_objectIDFactoryForEntity_,  [a3 entityDescription]);
  if (!-[objc_class _storeInfo1](v4, "_storeInfo1")) {
    -[objc_class _setStoreInfo1:](v4, "_setStoreInfo1:", a3);
  }
  return v4;
}

- (id)newObjectIDForEntity:(id)a3 pk:(int64_t)a4
{
  return (id)objc_msgSend( objc_alloc(-[NSSQLCore objectIDFactoryForSQLEntity:](self, "objectIDFactoryForSQLEntity:", a3)),  "initWithPK64:",  a4);
}

+ (uint64_t)sanityCheckFileAtURL:(void *)a3 options:(uint64_t *)a4 error:
{
  uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "fileSystemRepresentation");
  if (v7)
  {
    uint64_t v8 = v7;
    if (*v7)
    {
      if ([a3 objectForKey:@"_NSSQLiteSEEKeychainItemOption"]) {
        return 1LL;
      }
      int v19 = +[NSSQLiteConnection readMagicWordFromPath:options:]((uint64_t)&OBJC_CLASS___NSSQLiteConnection, v8, a3);
      int v20 = v19;
      if (v19 > 12)
      {
        if (v19 == 92)
        {
          if (!a4) {
            return 1LL;
          }
          id v26 = objc_alloc(MEMORY[0x189603F68]);
          uint64_t v11 = (void *)objc_msgSend(v26, "initWithObjectsAndKeys:", a2, *MEMORY[0x189607760], 0);
          CFStringRef v22 = (void *)MEMORY[0x189607870];
          uint64_t v23 = *MEMORY[0x189607460];
          uint64_t v24 = 259LL;
LABEL_19:
          uint64_t v12 = [v22 errorWithDomain:v23 code:v24 userInfo:v11];
          goto LABEL_6;
        }

        if (v19 != 13)
        {
LABEL_11:
          if (!a4) {
            return 1LL;
          }
          id v21 = objc_alloc(MEMORY[0x189603F68]);
          uint64_t v11 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", a2, *MEMORY[0x189607760], 0);
          CFStringRef v22 = (void *)MEMORY[0x189607870];
          uint64_t v23 = *MEMORY[0x189607688];
          uint64_t v24 = v20;
          goto LABEL_19;
        }
      }

      else
      {
        if (!v19) {
          return 1LL;
        }
        if (v19 != 1) {
          goto LABEL_11;
        }
      }

      if (!a4) {
        return 1LL;
      }
      id v25 = objc_alloc(MEMORY[0x189603F68]);
      uint64_t v11 = (void *)objc_msgSend(v25, "initWithObjectsAndKeys:", a2, *MEMORY[0x189607760], 0);
      CFStringRef v22 = (void *)MEMORY[0x189607870];
      uint64_t v23 = *MEMORY[0x189607460];
      uint64_t v24 = 257LL;
      goto LABEL_19;
    }
  }

  id v10 = objc_alloc(MEMORY[0x189603F68]);
  uint64_t v11 = (void *)objc_msgSend( v10,  "initWithObjectsAndKeys:",  a2,  *MEMORY[0x189607760],  @"path's fileSystemRepresentation returned NULL",  @"reason",  0);
  uint64_t v12 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:258 userInfo:v11];
  _NSCoreDataLog( 1LL,  (uint64_t)@" failed to open file due to illegal URL encoding.  error = %@ with userInfo %@",  v13,  v14,  v15,  v16,  v17,  v18,  v12);
  if (a4) {
LABEL_6:
  }
    *a4 = v12;

  return 0LL;
}

- (NSSQLCore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  location[3] = *(id *)MEMORY[0x1895F89C0];
  objc_opt_self();
  if (!a5)
  {

    v79 = (void *)MEMORY[0x189603F70];
    uint64_t v80 = *MEMORY[0x189603A60];
    v81 = @"Cannot create an SQL store with a nil URL.";
    goto LABEL_159;
  }

  if (([a5 isFileURL] & 1) == 0)
  {
    v82 = (void *)MEMORY[0x189603F70];
    uint64_t v83 = *MEMORY[0x189603A60];
    v81 = (const __CFString *)[NSString stringWithFormat:@"CoreData SQL stores only support file URLs (got %@).", a5];
    v79 = v82;
    uint64_t v80 = v83;
LABEL_159:
    objc_exception_throw((id)[v79 exceptionWithName:v80 reason:v81 userInfo:0]);
  }

  id v124 = 0LL;
  int v10 = +[_PFRoutines _isInMemoryStoreURL:]((uint64_t)&OBJC_CLASS____PFRoutines, a5);
  if (v10) {
    int v11 = 0x4000;
  }
  else {
    int v11 = 0;
  }
  self->_sqlCoreFlags = (_sqlCoreFlags)(*(_DWORD *)&self->_sqlCoreFlags & 0xFFFFBFFF | v11);
  id v93 = a3;
  if (v10)
  {
    if (strcmp((const char *)[a5 fileSystemRepresentation], "/dev/null"))
    {
LABEL_22:
      __int16 v123 = 0;
      goto LABEL_27;
    }

    if ((int)objc_msgSend( (id)objc_msgSend(a6, "objectForKey:", @"NSPersistentStoreConnectionPoolMaxSize"),  "intValue") < 2)
    {
      if (a6)
      {
        a6 = (id)[a6 mutableCopy];
        objc_msgSend( a6,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 1),  @"NSPersistentStoreConnectionPoolMaxSize");
      }

      else
      {
        a6 = (id)objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 1),  @"NSPersistentStoreConnectionPoolMaxSize");
      }

      goto LABEL_22;
    }

    id v87 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134060LL,  (uint64_t)@"Error - In Memory store at /dev/null can only have NSPersistentStoreConnectionPoolMaxSizeKey equal to 1",  0LL);
    objc_exception_throw(v87);
LABEL_164:
    if (v124) {
      id v88 = (void *)[MEMORY[0x189603F68] dictionaryWithObject:v124 forKey:*MEMORY[0x189607798]];
    }
    else {
      id v88 = 0LL;
    }
    id v89 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  513LL,  (uint64_t)@"Attempt to add read-only store read-write",  v88);
    objc_exception_throw(v89);
    goto LABEL_168;
  }

  __int16 v123 = 0;
  if (!+[NSPersistentStore doURLStuff:createdStubFile:readOnly:error:options:]( &OBJC_CLASS___NSPersistentStore,  "doURLStuff:createdStubFile:readOnly:error:options:",  a5,  (char *)&v123 + 1,  &v123,  &v124,  a6))
  {

    uint64_t v84 = [v124 code];
    uint64_t v85 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v124,  @"NSCoreDataPrimaryError",  0);
    id v86 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  v84,  (uint64_t)@"Error validating url for store",  v85);
    objc_exception_throw(v86);
    goto LABEL_168;
  }

  if ((_BYTE)v123)
  {
    if (a3)
    {
      if (objc_msgSend((id)objc_msgSend(a6, "valueForKey:", @"NSReadOnlyPersistentStoreOption"), "BOOLValue")) {
        goto LABEL_27;
      }
      if ([a6 valueForKey:@"NSReadOnlyPersistentStoreOption"]
        && BYTE5(z9dsptsiQ80etb9782fsrs98bfdle88))
      {
        goto LABEL_164;
      }

      if (a6)
      {
        a6 = (id)[a6 mutableCopy];
        objc_msgSend( a6,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"NSReadOnlyPersistentStoreOption");
      }

      else
      {
        a6 = (id)objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"NSReadOnlyPersistentStoreOption");
      }

      uint64_t v12 = [NSString stringWithUTF8String:"Attempt to add read-only file at path %@ read/write. Adding it read-only instead. This will be a hard erro r in the future; you must specify the NSReadOnlyPersistentStoreOption."];
      _NSCoreDataLog(17LL, v12, v13, v14, v15, v16, v17, v18, (uint64_t)a5);
      int v19 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = a5;
        _os_log_fault_impl( &dword_186681000,  v19,  OS_LOG_TYPE_FAULT,  "CoreData: Attempt to add read-only file at path %@ read/write. Adding it read-only instead. This will be a har d error in the future; you must specify the NSReadOnlyPersistentStoreOption.",
          (uint8_t *)location,
          0xCu);
      }
    }

    else if (a6)
    {
      a6 = (id)[a6 mutableCopy];
      objc_msgSend( a6,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"NSReadOnlyPersistentStoreOption");
    }

    else
    {
      a6 = (id)objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"NSReadOnlyPersistentStoreOption");
    }
  }

- (void)_setupHistoryModelForPSC:(void *)a3 withExcludedEntityNames:
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  if (!a1
    || !objc_msgSend((id)objc_msgSend((id)a1, "options"), "objectForKey:", @"NSPersistentHistoryTrackingKey"))
  {
    return;
  }

  objc_super v6 = (void *)objc_msgSend( (id)objc_msgSend((id)a1, "options"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey");
  uint64_t v7 = v6;
  if (v6 && ([v6 isNSDictionary] & 1) == 0 && (objc_msgSend(v7, "isNSNumber") & 1) == 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPersistentHistoryTrackingKey must be a NSNumber" userInfo:0]);
    goto LABEL_91;
  }

  if (([v7 isNSDictionary] & 1) == 0
    && (![v7 isNSNumber] || !objc_msgSend(v7, "BOOLValue")))
  {
    _NSCoreDataLog(9LL, (uint64_t)@"Persistent History is disabled - %@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    return;
  }

  if ([(id)a1 ancillaryModels]) {
    id v8 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithDictionary:",  objc_msgSend((id)a1, "ancillaryModels"));
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  id v66 = v8;
  uint64_t v64 = a3;
  if ([(id)a1 ancillarySQLModels]) {
    id v65 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithDictionary:",  objc_msgSend((id)a1, "ancillarySQLModels"));
  }
  else {
    id v65 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  *(_DWORD *)(a1 + 200) |= 0x400u;
  uint64_t v15 = *(void **)(a1 + 104);
  [(id)a1 options];
  uint64_t v16 = (void *)+[_PFPersistentHistoryModel newPersistentHistoryManagedObjectModelForSQLModel:options:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v15);
  [v66 setObject:v16 forKey:@"NSPersistentHistoryTrackingKey"];
  uint64_t v17 = *(void **)(a1 + 104);
  [(id)a1 options];
  id v18 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v17);
  [v65 setObject:v18 forKey:@"NSPersistentHistoryTrackingKey"];
  if (a2)
  {
    -[_PFModelMap addManagedObjectModel:](*(void *)(a2 + 96), v16);
    id v19 = +[_PFPersistentHistoryFetchModel newFetchHistoryModelForCoordinator:andOptions:]();
    -[_PFModelMap addManagedObjectModel:](*(void *)(a2 + 96), v19);
  }

  if ([v7 isNSDictionary] && objc_msgSend(v7, "count"))
  {
    if (objc_msgSend( (id)objc_msgSend( v7,  "valueForKey:",  @"NSPersistentHistoryTrackingExcludeUnmodifiedPropertiesForBatchUpdate"),  "BOOLValue"))
    {
      _NSCoreDataLog( 9LL,  (uint64_t)@"Persistent History Tracking Option - Batch Update Only Tracks Modified Properties",  v20,  v21,  v22,  v23,  v24,  v25,  v63);
      *(_DWORD *)(a1 + 200) |= 0x8000u;
    }

    id v26 = (void *)[v7 objectForKey:@"NSPersistentHistoryTrackingEntitiesToInclude"];
    uint64_t v27 = v26;
    if (!v26 || ([v26 isNSArray] & 1) != 0)
    {
      if ([v27 count])
      {
        uint64_t v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v27, "count"));
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        uint64_t v29 = [v27 countByEnumeratingWithState:&v79 objects:v88 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v80;
          while (2)
          {
            for (uint64_t i = 0LL; i != v29; ++i)
            {
              if (*(void *)v80 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              if (([v32 isNSString] & 1) == 0)
              {
                v62 = @"NSPersistentHistoryTrackingEntitiesToInclude must be an NSArray of NSString";
                goto LABEL_94;
              }

              if (![*(id *)(a1 + 104) entityNamed:v32])
              {
                v62 = @"NSPersistentHistoryTrackingEntitiesToInclude has entities not included in the Managed Object Model";
                goto LABEL_94;
              }

              [v28 addObject:v32];
            }

            uint64_t v29 = [v27 countByEnumeratingWithState:&v79 objects:v88 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }
      }

      else
      {
        uint64_t v28 = 0LL;
      }

      v49 = (void *)[v7 objectForKey:@"NSPersistentHistoryTrackingEntitiesToExclude"];
      uint64_t v50 = v49;
      if (v49 && ([v49 isNSArray] & 1) == 0)
      {
        v62 = @"NSPersistentHistoryTrackingEntitiesToExclude must be an NSArray";
      }

      else
      {
        if (![v28 count] || !objc_msgSend(v50, "count"))
        {
          if ([v50 count])
          {
            uint64_t v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FE0]), "initWithCapacity:", objc_msgSend(v50, "count"));
            __int128 v77 = 0u;
            __int128 v78 = 0u;
            __int128 v75 = 0u;
            __int128 v76 = 0u;
            uint64_t v51 = [v50 countByEnumeratingWithState:&v75 objects:v87 count:16];
            if (v51)
            {
              uint64_t v52 = *(void *)v76;
              while (2)
              {
                for (uint64_t j = 0LL; j != v51; ++j)
                {
                  if (*(void *)v76 != v52) {
                    objc_enumerationMutation(v50);
                  }
                  v54 = *(void **)(*((void *)&v75 + 1) + 8 * j);
                  if (([v54 isNSString] & 1) == 0)
                  {
                    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPersistentHistoryTrackingEntitiesToExclude must be an NSArray of NSString" userInfo:0]);
                    goto LABEL_95;
                  }

                  if ([*(id *)(a1 + 104) entityNamed:v54])
                  {
                    [v33 addObject:v54];
                  }

                  else
                  {
                    uint64_t v55 = [NSString stringWithFormat:@"Entity (%@) was not found in model."];
                    _NSCoreDataLog(2LL, v55, v56, v57, v58, v59, v60, v61, (uint64_t)v54);
                  }
                }

                uint64_t v51 = [v50 countByEnumeratingWithState:&v75 objects:v87 count:16];
                if (v51) {
                  continue;
                }
                break;
              }
            }
          }

          else
          {
            uint64_t v33 = 0LL;
          }

          goto LABEL_36;
        }

        v62 = @"NSPersistentHistoryTrackingEntitiesToExclude & NSPersistentHistoryTrackingEntitiesToInclude are mutually exclusive, you cannot set both options";
      }

void __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke( uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  Weauint64_t k = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    uint64_t v3 = (uint64_t)Weak;
    uint64_t v4 = (void *)MEMORY[0x186E3E5D8]();
    [(id)v3 identifier];
    _NSCoreDataLog( 2LL,  (uint64_t)@"cache_handle_memory_pressure invoked for core %p / %@",  v5,  v6,  v7,  v8,  v9,  v10,  v3);
    -[NSSQLCoreDispatchManager enumerateAvailableConnectionsWithBlock:]( *(void *)(v3 + 128),  (uint64_t)&__block_literal_global_722);
    -[NSGenerationalRowCache forgetAllGenerationalExternalData](*(void *)(v3 + 136));
    objc_autoreleasePoolPop(v4);
    os_unfair_lock_lock_with_options();
    dispatch_suspend(*(dispatch_object_t *)(v3 + 272));
    *(_DWORD *)(v3 + 200) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 152));
    dispatch_time_t v11 = dispatch_time(0LL, 10000000000LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke_2;
    block[3] = &unk_189EA8330;
    objc_copyWeak(&v14, v1);
    dispatch_after(v11, global_queue, block);
    objc_destroyWeak(&v14);
  }

void __78__NSSQLCore_initWithPersistentStoreCoordinator_configurationName_URL_options___block_invoke_2( uint64_t a1)
{
  Weauint64_t k = (os_unfair_lock_s *)objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    v2 = Weak;
    uint64_t v3 = Weak + 38;
    os_unfair_lock_lock_with_options();
    uint64_t v4 = *(dispatch_object_s **)&v2[68]._os_unfair_lock_opaque;
    if (v4)
    {
      dispatch_resume(v4);
      v2[50]._os_unfair_lock_opaque &= ~0x20000u;
    }

    os_unfair_lock_unlock(v3);
  }

- (BOOL)load:(id *)a3
{
  if (self)
  {
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x2020000000LL;
    char v10 = 0;
    uint64_t v4 = -[NSSQLCore schemaValidationConnection](self);
    if (-[NSSQLiteConnection canConnect]((uint64_t)v4)
      && (!-[NSSQLiteConnection databaseIsEmpty]((BOOL)v4) || (*((_BYTE *)&self->_sqlCoreFlags + 1) & 0x40) != 0))
    {
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __40__NSSQLCore__ensureDatabaseMatchesModel__block_invoke;
      v8[3] = &unk_189EA72B0;
      v8[4] = v4;
      v8[5] = self;
      v8[6] = v9;
      -[NSSQLiteConnection performAndWait:]((uint64_t)v4, (uint64_t)v8);
    }

    _Block_object_dispose(v9, 8);
  }

  int v5 = *(_DWORD *)&self->_sqlCoreFlags | 0x40;
  self->_sqlCoreFlags = (_sqlCoreFlags)v5;
  schemaValidationConnection = self->_schemaValidationConnection;
  if (schemaValidationConnection) {
    LODWORD(schemaValidationConnection) = ((*(_DWORD *)&schemaValidationConnection->_sqliteConnectionFlags & 0xC) == 4) << 7;
  }
  self->_sqlCoreFlags = (_sqlCoreFlags)(schemaValidationConnection | v5 & 0xFFFFFF7F);
  self->_dispatchManager = -[NSSQLCoreDispatchManager initWithSQLCore:seedConnection:]( objc_alloc(&OBJC_CLASS___NSSQLCoreDispatchManager),  "initWithSQLCore:seedConnection:",  self,  self->_schemaValidationConnection);

  self->_schemaValidationConnection = 0LL;
  return 1;
}

void __18__NSSQLCore_load___block_invoke(uint64_t a1)
{
}

void __18__NSSQLCore_load___block_invoke_2(uint64_t a1)
{
}

- (uint64_t)_rebuildTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:(id *)a3
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v60 = 0LL;
  id v45 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v39 = objc_alloc_init(MEMORY[0x1896077E8]);
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  uint64_t v4 = *(void *)(a1 + 104);
  if (v4) {
    int v5 = *(void **)(v4 + 24);
  }
  else {
    int v5 = 0LL;
  }
  uint64_t v6 = (void *)[v5 allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v67 count:16];
  if (!v7) {
    goto LABEL_53;
  }
  uint64_t v41 = *(void *)v57;
  char v44 = 1;
  uint64_t v8 = MEMORY[0x1895F87A8];
  do
  {
    uint64_t v9 = 0LL;
    uint64_t v42 = v7;
    do
    {
      if (*(void *)v57 != v41) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v56 + 1) + 8 * v9);
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      if (v10) {
        dispatch_time_t v11 = *(void **)(v10 + 40);
      }
      else {
        dispatch_time_t v11 = 0LL;
      }
      uint64_t v12 = (void *)[v11 allValues];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v66 count:16];
      uint64_t v43 = v9;
      if (v13)
      {
        uint64_t v14 = *(void *)v53;
        do
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v53 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(_WORD **)(*((void *)&v52 + 1) + 8 * i);
            int v17 = [v16 propertyType];
            if (v16) {
              BOOL v18 = v17 == 1;
            }
            else {
              BOOL v18 = 0;
            }
            if (v18 && (v16[16] & 8) != 0)
            {
              id v19 = +[NSSQLAttributeExtensionFactory newExtensionsForAttribute:error:]( (uint64_t)&OBJC_CLASS___NSSQLAttributeExtensionFactory,  v16,  (uint64_t *)&v60);
              uint64_t v20 = v19;
              if (v19)
              {
                v50[0] = v8;
                v50[1] = 3221225472LL;
                v50[2] = __72__NSSQLCore__rebuildTriggerSchemaUsingConnection_recomputeValues_error___block_invoke;
                v50[3] = &unk_189EA99B0;
                v50[4] = v10;
                v50[5] = v45;
                char v51 = 0;
                [v19 enumerateObjectsUsingBlock:v50];
              }

              else
              {
                char v44 = 0;
              }
            }
          }

          uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v66 count:16];
        }

        while (v13);
      }

      uint64_t v9 = v43 + 1;
    }

    while (v43 + 1 != v42);
    uint64_t v21 = [v6 countByEnumeratingWithState:&v56 objects:v67 count:16];
    uint64_t v7 = v21;
  }

  while (v21);
  if ((v44 & 1) != 0)
  {
LABEL_53:
    if ([v45 count])
    {
      -[NSSQLiteConnection beginTransaction](a2);
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      uint64_t v23 = [v45 countByEnumeratingWithState:&v46 objects:v65 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v47;
        do
        {
          for (uint64_t j = 0LL; j != v23; ++j)
          {
            if (*(void *)v47 != v24) {
              objc_enumerationMutation(v45);
            }
            -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a2, *(void **)(*((void *)&v46 + 1) + 8 * j));
          }

          uint64_t v23 = [v45 countByEnumeratingWithState:&v46 objects:v65 count:16];
        }

        while (v23);
      }

      uint64_t v22 = 1LL;
      -[NSSQLiteConnection commitTransaction](a2);
    }

    else
    {
      uint64_t v22 = 1LL;
    }
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  -[NSSQLiteConnection endFetchAndRecycleStatement:](a2, 0);
  id v26 = v60;

  id v27 = 0LL;
  id v28 = v60;
  if ((v22 & 1) == 0)
  {
    if (v60)
    {
      if (a3) {
        *a3 = v60;
      }
    }

    else
    {
      uint64_t v29 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
      uint64_t v36 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
        __int16 v63 = 1024;
        int v64 = 5475;
        _os_log_fault_impl( &dword_186681000,  v36,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  return v22;
}

- (id)_rebuildDerivedAttributeTriggerSchemaUsingConnection:(uint64_t)a1 recomputeValues:(uint64_t)a2 error:
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v21 = objc_alloc_init(MEMORY[0x1896077E8]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v4 = *(void *)(a1 + 104);
  if (v4) {
    int v5 = *(void **)(v4 + 24);
  }
  else {
    int v5 = 0LL;
  }
  uint64_t v6 = (void *)objc_msgSend(v5, "allValues", v21);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = -[NSSQLEntity derivedAttributesExtension](*(NSSQLEntity_DerivedAttributesExtension **)(*((void *)&v28 + 1) + 8 * v9));
        dispatch_time_t v11 = v10;
        if (v10)
        {
          -[NSSQLEntity_DerivedAttributesExtension _generateTriggerSQL]((uint64_t)v10);
          migrationSQL = v11->_migrationSQL;
        }

        else
        {
          migrationSQL = 0LL;
        }

        uint64_t v13 = -[NSMutableDictionary valueForKey:](migrationSQL, "valueForKey:", @"dropStatements");
        uint64_t v14 = -[NSMutableDictionary valueForKey:](migrationSQL, "valueForKey:", @"triggerCreationStatements");
        [v3 addObjectsFromArray:v13];
        [v3 addObjectsFromArray:v14];
        objc_msgSend( v3,  "addObjectsFromArray:",  -[NSMutableDictionary valueForKey:](migrationSQL, "valueForKey:", @"dataStatements"));
        ++v9;
      }

      while (v7 != v9);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      uint64_t v7 = v15;
    }

    while (v15);
  }

  if ([v3 count])
  {
    -[NSSQLiteConnection beginTransaction](a2);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v16 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v3);
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:](a2, *(void **)(*((void *)&v24 + 1) + 8 * i));
        }

        uint64_t v16 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }

      while (v16);
    }

    -[NSSQLiteConnection commitTransaction](a2);
  }

  -[NSSQLiteConnection endFetchAndRecycleStatement:](a2, 0);

  id v19 = 0LL;
  return 0LL;
}

- (void)_updateToVersion640PrimaryKeyTableUsingStatements:(void *)a3 connection:
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  -[NSSQLiteConnection connect]((uint64_t)a3);
  -[NSSQLiteConnection beginTransaction]((uint64_t)a3);
  -[NSSQLiteConnection fetchMetadata]((uint64_t)a3);
  uint64_t v7 = v6;
  uint64_t v8 = (void *)[v6 objectForKey:0x189EBA2C8];
  if (v8 && (int)[v8 intValue] <= 639)
  {
    uint64_t v9 = (__CFString *)[v7 mutableCopy];
    -[__CFString setObject:forKey:](v9, "setObject:forKey:", +[_PFRoutines _getPFBundleVersionNumber](), 0x189EBA2C8LL);
    -[NSSQLiteConnection saveMetadata:](a3, v9);

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(a2);
          }
          -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)a3, *(void **)(*((void *)&v13 + 1) + 8 * i));
        }

        uint64_t v10 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v10);
    }

    -[NSSQLiteConnection commitTransaction]((uint64_t)a3);
    os_unfair_lock_lock_with_options();
    [*(id *)(a1 + 160) setObject:+[_PFRoutines _getPFBundleVersionNumber]() forKey:0x189EBA2C8];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }

  else
  {
    -[NSSQLiteConnection rollbackTransaction]((uint64_t)a3);
  }

  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a3, 0);
}

void __40__NSSQLCore__ensureDatabaseMatchesModel__block_invoke(uint64_t a1)
{
  uint64_t v303 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) model];
    if (v4) {
      int v5 = *(void **)(v4 + 32);
    }
    else {
      int v5 = 0LL;
    }
    os_unfair_lock_lock_with_options();
    uint64_t v6 = (void *)[*(id *)(v2 + 160) objectForKey:@"NSStoreModelVersionHashes"];
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 152));
    if (v6)
    {
      __int128 v298 = 0u;
      __int128 v297 = 0u;
      __int128 v296 = 0u;
      *(_OWORD *)buf = 0u;
      uint64_t v7 = [v5 countByEnumeratingWithState:buf objects:&v286 count:16];
      if (!v7) {
        goto LABEL_26;
      }
      uint64_t v8 = *(void *)v296;
LABEL_9:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v296 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend( v6,  "objectForKey:",  objc_msgSend(*(id *)(*(void *)(*(void *)&buf[8] + 8 * v9) + 24), "name"))) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:buf objects:&v286 count:16];
          if (v7) {
            goto LABEL_9;
          }
          goto LABEL_26;
        }
      }
    }

    -[NSSQLiteConnection connect]((uint64_t)v3);
    uint64_t v10 = (void *)[MEMORY[0x189604010] setWithArray:-[NSSQLiteConnection fetchTableNames](v3)];
    __int128 v294 = 0u;
    __int128 v293 = 0u;
    __int128 v292 = 0u;
    __int128 v291 = 0u;
    uint64_t v11 = [v5 countByEnumeratingWithState:&v291 objects:&v285 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v292;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v292 != v12) {
            objc_enumerationMutation(v5);
          }
          __int128 v14 = *(void **)(*((void *)&v291 + 1) + 8 * i);
          if (v14
            && !v14[20]
            && (objc_msgSend(v10, "containsObject:", objc_msgSend(*(id *)(*((void *)&v291 + 1) + 8 * i), "tableName")) & 1) == 0)
          {
            uint64_t v63 = [NSString stringWithFormat:@"Can't find table for entity '%@' in database at URL '%@'", objc_msgSend((id)objc_msgSend(v14, "entityDescription"), "name"), objc_msgSend((id)v2, "URL")];
            v290[0] = v63;
            uint64_t v64 = *MEMORY[0x1896074F8];
            v289[0] = @"message";
            v289[1] = v64;
            v290[1] = objc_msgSend((id)objc_msgSend((id)v2, "URL"), "path");
            id v65 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v290 forKeys:v289 count:2];
            id v66 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134020LL,  v63,  v65);
            objc_exception_throw(v66);
            __break(1u);
            JUMPOUT(0x1867C7E40LL);
          }
        }

        uint64_t v11 = [v5 countByEnumeratingWithState:&v291 objects:&v285 count:16];
      }

      while (v11);
    }
  }

void __32__NSSQLCore__loadAndSetMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  if (-[NSSQLiteConnection canConnect](a2))
  {
    if (![*(id *)(a1 + 32) metadata])
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
      -[NSSQLCore _setMetadata:clean:](*(void *)(a1 + 32), v4, 1);
    }

    -[NSSQLiteConnection connect](a2);
    -[NSSQLiteConnection fetchMetadata](a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = v5;
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v6) {
      -[NSSQLCore _setMetadata:clean:]( *(void *)(a1 + 32),  (void *)[*(id *)(a1 + 32) _updatedMetadataWithSeed:v6 includeVersioning:0],  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "objectForKey:", 0x189EBA2A8) != 0);
    }
  }

- (void)_setMetadata:(int)a3 clean:
{
  if (a1)
  {
    uint64_t v6 = (void *)[a2 mutableCopy];
    os_unfair_lock_lock_with_options();
    uint64_t v7 = *(void **)(a1 + 160);
    if (v7)
    {
      if ([v7 isEqual:a2])
      {

LABEL_8:
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
        return;
      }

      uint64_t v8 = *(void **)(a1 + 160);
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    *(void *)(a1 + 160) = v6;
    atomic_store(a3, (unsigned __int8 *)(a1 + 196));
    [(id)a1 _setMetadataDirty:a3 ^ 1u];
    goto LABEL_8;
  }

uint64_t __32__NSSQLCore__loadAndSetMetadata__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __32__NSSQLCore__loadAndSetMetadata__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void __32__NSSQLCore__loadAndSetMetadata__block_invoke_4(uint64_t a1)
{
}

- (BOOL)loadMetadata:(id *)a3
{
  if (!self)
  {
    BOOL v9 = 1;
    if (!a3) {
      return !v9;
    }
    goto LABEL_6;
  }

  uint64_t v19 = 0LL;
  int v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  uint64_t v22 = __Block_byref_object_copy__22;
  id v23 = __Block_byref_object_dispose__22;
  uint64_t v24 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __32__NSSQLCore__loadAndSetMetadata__block_invoke;
  v18[3] = &unk_189EA9858;
  v18[4] = self;
  v18[5] = &v19;
  if ((*(_BYTE *)&self->_sqlCoreFlags & 0x40) != 0)
  {
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = (uint64_t)__32__NSSQLCore__loadAndSetMetadata__block_invoke_2;
    uint64_t v15 = (void (*)(uint64_t, uint64_t))&unk_189EA9880;
    __int128 v16 = (void (*)(uint64_t))v18;
    uint64_t v7 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  &v12,  0LL,  self);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v7, 0LL);
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = (uint64_t)&v12;
    uint64_t v14 = 0x3052000000LL;
    uint64_t v15 = __Block_byref_object_copy__22;
    __int128 v16 = __Block_byref_object_dispose__22;
    uint64_t v17 = 0LL;
    uint64_t v6 = -[NSSQLCore schemaValidationConnection](self);
    *(void *)(v13 + 40) = v6;
    v11[0] = v5;
    v11[1] = 3221225472LL;
    v11[2] = __32__NSSQLCore__loadAndSetMetadata__block_invoke_3;
    v11[3] = &unk_189EA77F8;
    v11[4] = v18;
    v11[5] = &v12;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v6, (uint64_t)v11);
    _Block_object_dispose(&v12, 8);
  }

  uint64_t v8 = v20[5];
  _Block_object_dispose(&v19, 8);
  BOOL v9 = v8 == 0;
  if (a3)
  {
LABEL_6:
    if (v9) {
      *a3 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134080 userInfo:0];
    }
  }

  return !v9;
}

- (void)_setupObserver:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  char v5 = objc_msgSend( -[NSDictionary objectForKey:]( -[NSPersistentStore options](self, "options"),  "objectForKey:",  @"NSPersistentStoreRemoteChangeNotificationOptionKey"),  "BOOLValue");
  int v6 = objc_msgSend( -[NSDictionary objectForKey:]( -[NSPersistentStore options](self, "options"),  "objectForKey:",  @"NSXPCStorePostUpdateNotifications"),  "BOOLValue");
  _sqlCoreFlags sqlCoreFlags = self->_sqlCoreFlags;
  if ((v5 & 1) != 0 || v6)
  {
    self->__sqlCoreFlags sqlCoreFlags = (_sqlCoreFlags)(*(_DWORD *)&sqlCoreFlags | 0x1000);
LABEL_6:
    if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
    {
      id v8 = -[NSSQLCore identifier](self, "identifier");
      _NSCoreDataLog( 9LL,  (uint64_t)@"Remote Change Notification - registered core observer for %@",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)v8);
    }

    uint64_t v15 = objc_alloc(&OBJC_CLASS____NSSQLCoreConnectionObserver);
    if (v15)
    {
      v39.receiver = v15;
      v39.super_class = (Class)&OBJC_CLASS____NSSQLCoreConnectionObserver;
      __int128 v16 = -[NSPersistentStore init](&v39, sel_init);
      uint64_t v17 = (_NSSQLCoreConnectionObserver *)v16;
      if (!v16) {
        goto LABEL_20;
      }
      LODWORD(v16->super._configurationName) = -1;
      objc_storeWeak((id *)&v16->super._url, self);
      objc_storeWeak((id *)&v17->_psc, a3);
      if ((*((_BYTE *)&self->_sqlCoreFlags + 1) & 0x10) == 0) {
        goto LABEL_20;
      }
      char v18 = (void *)+[_PFRoutines _remoteChangeNotificationNameForStore:]((uint64_t)&OBJC_CLASS____PFRoutines, self);
      if (!v18) {
        goto LABEL_20;
      }
      v17->_queue = (OS_dispatch_queue *)dispatch_queue_create( (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"%@.queue.%p", v18, v17), "UTF8String"],  0);
      objc_initWeak(&location, v17);
      uint64_t v19 = (const char *)[v18 fileSystemRepresentation];
      queue = (dispatch_queue_s *)v17->_queue;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __63___NSSQLCoreConnectionObserver_initWithSQLCore_andCoordinator___block_invoke;
      handler[3] = &unk_189EA9AB8;
      objc_copyWeak(&v37, &location);
      uint64_t v21 = notify_register_dispatch(v19, &v17->_token, queue, handler);
      if (!(_DWORD)v21)
      {
        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1) {
          _NSCoreDataLog( 9LL,  (uint64_t)@"Remote Change Notification - registered for  %@",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)v18);
        }
        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
        goto LABEL_20;
      }

      uint64_t v22 = [NSString stringWithUTF8String:"Remote Change Notification - Failed to setup notification listener for NSPersistentStoreRemoteChangeNotification: %d"];
      _NSCoreDataLog(17LL, v22, v23, v24, v25, v26, v27, v28, v21);
      uint64_t v29 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v41 = v21;
        _os_log_fault_impl( &dword_186681000,  v29,  OS_LOG_TYPE_FAULT,  "CoreData: Remote Change Notification - Failed to setup notification listener for NSPersistentStoreRemoteChange Notification: %d",  buf,  8u);
      }

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }

    uint64_t v17 = 0LL;
LABEL_20:
    self->_observer = v17;
    return;
  }

  if ((*(_WORD *)&sqlCoreFlags & 0x1000) != 0) {
    goto LABEL_6;
  }
}

- (void)_postChangeNotificationWithTransactionID:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (void *)MEMORY[0x186E3E5D8]();
    if ((*(_BYTE *)(a1 + 201) & 0x10) != 0) {
      char v5 = (void *)+[_PFRoutines _remoteChangeNotificationNameForStore:]((uint64_t)&OBJC_CLASS____PFRoutines, (void *)a1);
    }
    else {
      char v5 = 0LL;
    }
    int v6 = (const char *)[v5 UTF8String];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = *(_DWORD *)(a1 + 268);
      out_tokeuint64_t n = v8;
      if (v8 == -1)
      {
        if (notify_register_check(v6, &out_token))
        {
          _NSCoreDataLog( 1LL,  (uint64_t)@"unable to check registration for posting store changed notification",  v15,  v16,  v17,  v18,  v19,  v20,  v23);
          if (out_token != -1) {
            notify_cancel(out_token);
          }
          goto LABEL_13;
        }

        int v8 = out_token;
        uint64_t v21 = (unsigned int *)(a1 + 268);
        while (1)
        {
          unsigned int v22 = __ldxr(v21);
          if (v22 != -1) {
            break;
          }
          if (!__stxr(v8, v21)) {
            goto LABEL_7;
          }
        }

        __clrex();
        notify_cancel(v8);
        int v8 = *(_DWORD *)(a1 + 268);
        out_tokeuint64_t n = v8;
      }

- (void)dealloc
{
  observer = self->_observer;
  if (observer)
  {
    objc_storeWeak((id *)&observer->_core, 0LL);

    self->_observer = 0LL;
  }

  cache_event_source = self->_cache_event_source;
  if (cache_event_source)
  {
    dispatch_source_cancel((dispatch_source_t)cache_event_source);
    if ((*((_BYTE *)&self->_sqlCoreFlags + 2) & 2) != 0)
    {
      dispatch_resume((dispatch_object_t)self->_cache_event_source);
      *(_DWORD *)&self->_sqlCoreFlags &= ~0x20000u;
    }

    dispatch_release((dispatch_object_t)self->_cache_event_source);
    self->_cache_event_source = 0LL;
  }

  schemaValidationConnectiouint64_t n = self->_schemaValidationConnection;
  uint64_t v6 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __20__NSSQLCore_dealloc__block_invoke;
  v18[3] = &unk_189EA7758;
  v18[4] = self;
  -[NSSQLiteConnection performAndWait:]((uint64_t)schemaValidationConnection, (uint64_t)v18);

  self->_schemaValidationConnectiouint64_t n = 0LL;
  self->_adapter = 0LL;

  self->_generationalRowCache = 0LL;
  self->_storeMetadata = 0LL;

  self->_usedIndexes = 0LL;
  self->_historyTrackingOptions = 0LL;
  uint64_t v7 = (void *)atomic_load((unint64_t *)&self->_externalDataReferencesDirectory);

  atomic_store(0LL, (unint64_t *)&self->_externalDataReferencesDirectory);
  int v8 = (void *)atomic_load((unint64_t *)&self->_externalDataLinksDirectory);

  atomic_store(0LL, (unint64_t *)&self->_externalDataLinksDirectory);
  uint64_t v9 = (void *)atomic_load((unint64_t *)&self->_fileBackedFuturesPath);

  atomic_store(0LL, (unint64_t *)&self->_fileBackedFuturesPath);
  -[NSSQLCoreDispatchManager disconnectAllConnections]((uint64_t)self->_dispatchManager);

  self->_dispatchManager = 0LL;
  remoteNotificationTokeuint64_t n = self->_remoteNotificationToken;
  if (remoteNotificationToken != -1)
  {
    notify_cancel(remoteNotificationToken);
    self->_remoteNotificationTokeuint64_t n = -1;
  }

  p_queryGenerationTrackingConnectiouint64_t n = (unint64_t *)&self->_queryGenerationTrackingConnection;
  if (atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection))
  {
    uint64_t v13 = atomic_load(p_queryGenerationTrackingConnection);
    v17[0] = v6;
    v17[1] = 3221225472LL;
    v17[2] = __20__NSSQLCore_dealloc__block_invoke_2;
    v17[3] = &unk_189EA7758;
    v17[4] = self;
    -[NSSQLiteConnection performAndWait:](v13, (uint64_t)v17);
    uint64_t v14 = (void *)atomic_load(p_queryGenerationTrackingConnection);

    atomic_store(0LL, p_queryGenerationTrackingConnection);
  }

  dbKey = self->_dbKey;
  if (dbKey)
  {
    CFRelease(dbKey);
    self->_dbKey = 0LL;
  }

  self->_writerSerializationMutex = 0LL;
  self->_ancillaryModels = 0LL;

  self->_ancillarySQLModels = 0LL;
  self->_model = 0LL;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NSSQLCore;
  -[NSPersistentStore dealloc](&v16, sel_dealloc);
}

void __20__NSSQLCore_dealloc__block_invoke(uint64_t a1)
{
}

void __20__NSSQLCore_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208LL));
  -[NSSQLiteConnection disconnect](v1);
}

- (id)newObjectIDSetsForToManyPrefetchingRequest:(uint64_t)a3 andSourceObjectIDs:(uint64_t)a4 orderColumnName:
{
  id v4 = a1;
  if (a1)
  {
    char v5 = -[NSSQLObjectIDSetFetchRequestContext initWithRequest:context:sqlCore:idSets:columnName:]( objc_alloc(&OBJC_CLASS___NSSQLObjectIDSetFetchRequestContext),  "initWithRequest:context:sqlCore:idSets:columnName:",  a2,  0LL,  a1,  a3,  a4);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v4, v5, 0LL);
    id v4 = -[NSSQLStoreRequestContext result](v5, "result");
  }

  return v4;
}

- (void)_newRowDataForXPCFetch:(void *)a3 variables:(uint64_t)a4 context:(void *)a5 error:
{
  if (a1)
  {
    uint64_t v9 = -[NSSQLFetchRequestContext initWithRequest:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLXPCFetchRequestContext),  "initWithRequest:context:sqlCore:",  a2,  a4,  a1);
    uint64_t v11 = v9;
    if (v9) {
      objc_setProperty_nonatomic(v9, v10, a3, 216LL);
    }
    uint64_t v12 = (void *)[a2 predicate];
    if (v12) {
      [v12 minimalFormInContext:0];
    }
    -[NSSQLCore dispatchRequest:withRetries:](a1, v11, 0LL);
    if (-[NSSQLStoreRequestContext result](v11, "result")) {
      goto LABEL_12;
    }
    if (v11)
    {
      exceptiouint64_t n = v11->super.super._exception;
      if (exception)
      {
        uint64_t v15 = exception;
        objc_exception_throw(exception);
        __break(1u);
        return;
      }

      if (!a5) {
        goto LABEL_12;
      }
      error = v11->super.super._error;
    }

    else
    {
      error = 0LL;
      if (!a5) {
        goto LABEL_12;
      }
    }

    *a5 = error;
LABEL_12:
  }

- (id)metadataToWrite
{
  if (!a1) {
    return 0LL;
  }
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 196));
  if ((v2 & 1) != 0) {
    return 0LL;
  }
  os_unfair_lock_lock_with_options();
  id v3 = (id)[*(id *)(a1 + 160) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  return v3;
}

- (void)_obtainPermanentIDsForObjects:(void *)a1 withNotification:(void *)a2 error:(void *)a3
{
  uint64_t v84 = a3;
  uint64_t v110 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ([a2 count])
    {
      __int128 v105 = 0u;
      __int128 v106 = 0u;
      __int128 v103 = 0u;
      __int128 v104 = 0u;
      uint64_t v94 = (uint64_t)a2;
      uint64_t v5 = [a2 countByEnumeratingWithState:&v103 objects:v109 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v104;
        while (2)
        {
          for (uint64_t i = 0LL; i != v5; ++i)
          {
            if (*(void *)v104 != v6) {
              objc_enumerationMutation((id)v94);
            }
            uint64_t v85 = [*(id *)(*((void *)&v103 + 1) + 8 * i) managedObjectContext];
            if (v85)
            {
              id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
              id v87 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithObjects:",  objc_msgSend(a1, "model"),  0);
              objc_msgSend( v87,  "addObjectsFromArray:",  objc_msgSend((id)objc_msgSend(a1, "ancillarySQLModels"), "allValues"));
              uint64_t v92 = (char *)objc_alloc_init(MEMORY[0x189603FC8]);
              size_t v9 = [v87 count];
              uint64_t v86 = calloc(8uLL, v9);
              uint64_t v93 = calloc(8uLL, v9);
              if ([v87 count])
              {
                unint64_t v10 = 0LL;
                uint64_t v91 = 0LL;
                do
                {
                  uint64_t v11 = [v87 objectAtIndexedSubscript:v10];
                  uint64_t v12 = [MEMORY[0x189607968] numberWithInt:v10];
                  if (v11)
                  {
                    objc_msgSend( v92,  "setObject:forKeyedSubscript:",  v12,  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", *(unsigned int *)(v11 + 60)));
                    uint64_t v13 = *(void **)(v11 + 32);
                  }

                  else
                  {
                    objc_msgSend( v92,  "setObject:forKeyedSubscript:",  v12,  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", 0));
                    uint64_t v13 = 0LL;
                  }

                  uint64_t v14 = [v13 count];
                  int v15 = v14;
                  v86[v10] = v14;
                  v93[v10] = calloc(0x18uLL, v14 + 1);
                  uint64_t v91 = (v91 + v15);
                  ++v10;
                }

                while ([v87 count] > v10);
              }

              else
              {
                uint64_t v91 = 0LL;
              }

              __int128 v101 = 0u;
              __int128 v102 = 0u;
              __int128 v99 = 0u;
              __int128 v100 = 0u;
              uint64_t v16 = [(id)v94 countByEnumeratingWithState:&v99 objects:v108 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v100;
                do
                {
                  uint64_t v18 = 0LL;
                  do
                  {
                    if (*(void *)v100 != v17) {
                      objc_enumerationMutation((id)v94);
                    }
                    uint64_t v19 = *(void **)(*((void *)&v99 + 1) + 8 * v18);
                    if (objc_msgSend((id)objc_msgSend(v19, "objectID"), "isTemporaryID"))
                    {
                      uint64_t v20 = (void *)[v19 entity];
                      if (v20) {
                        uint64_t v21 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(a1, v20);
                      }
                      else {
                        uint64_t v21 = 0LL;
                      }
                      unsigned int v22 = (_DWORD *)[v21 rootEntity];
                      uint64_t v23 = (void *)MEMORY[0x189607968];
                      uint64_t v24 = [v22 model];
                      if (v24) {
                        uint64_t v25 = *(unsigned int *)(v24 + 60);
                      }
                      else {
                        uint64_t v25 = 0LL;
                      }
                      int v26 = objc_msgSend( (id)objc_msgSend( v92,  "objectForKeyedSubscript:",  objc_msgSend(v23, "numberWithUnsignedInt:", v25)),  "intValue");
                      if (v22) {
                        int v27 = v22[46];
                      }
                      else {
                        int v27 = 0;
                      }
                      uint64_t v28 = v93[v26];
                      uint64_t v29 = [v22 model];
                      if (v29) {
                        int v30 = *(_DWORD *)(v29 + 60);
                      }
                      else {
                        int v30 = 0;
                      }
                      uint64_t v31 = 24LL * (v27 - v30);
                      ++*(void *)(v28 + v31);
                      uint64_t v32 = *(void **)(v28 + v31 + 16);
                      if (v32) {
                        [v32 addObject:v19];
                      }
                      else {
                        *(void *)(v28 + v31 + 16) = objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithObjects:",  v19,  0);
                      }
                    }

                    ++v18;
                  }

                  while (v16 != v18);
                  uint64_t v33 = [(id)v94 countByEnumeratingWithState:&v99 objects:v108 count:16];
                  uint64_t v16 = v33;
                }

                while (v33);
              }

              Mutable = CFDictionaryCreateMutable(0LL, (int)v91, MEMORY[0x189605240], MEMORY[0x189605250]);
              if ([v87 count])
              {
                unint64_t v35 = 0LL;
                do
                {
                  uint64_t v36 = [v87 objectAtIndexedSubscript:v35];
                  uint64_t v37 = v86[v35];
                  if (v37 >= 1)
                  {
                    uint64_t v38 = v36;
                    uint64_t v39 = 0LL;
                    uint64_t v40 = (void *)(v93[v35] + 24LL);
                    do
                    {
                      if (v38) {
                        uint64_t v41 = *(unsigned int *)(v38 + 60);
                      }
                      else {
                        uint64_t v41 = 0LL;
                      }
                      uint64_t v42 = _sqlEntityForEntityID(v38, v39 + v41 + 1);
                      if (*v40) {
                        CFDictionarySetValue( Mutable,  v42,  (const void *)objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:"));
                      }
                      ++v39;
                      v40 += 3;
                    }

                    while (v37 != v39);
                  }

                  ++v35;
                }

                while ([v87 count] > v35);
              }

              uint64_t v43 = -[NSSQLGenerateObjectIDRequestContext initForEntitiesAndCounts:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLGenerateObjectIDRequestContext),  "initForEntitiesAndCounts:context:sqlCore:",  Mutable,  v85,  a1);
              CFRelease(Mutable);
              id v83 = v43;
              -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)a1, v43, 1LL);
              uint64_t v44 = [v43 result];
              uint64_t v45 = (void *)v44;
              if (v44)
              {
                unint64_t v46 = 0LL;
                uint64_t v88 = (void *)v44;
                while (objc_msgSend(v87, "count", v83) > v46)
                {
                  uint64_t v47 = [v87 objectAtIndexedSubscript:v46];
                  uint64_t v91 = v86[v46];
                  if (v91 >= 1)
                  {
                    uint64_t v48 = v47;
                    uint64_t v92 = (char *)v93[v46];
                    uint64_t v49 = 1LL;
                    uint64_t v89 = v47;
                    unint64_t v90 = v46;
                    do
                    {
                      if (v48) {
                        uint64_t v50 = *(unsigned int *)(v48 + 60);
                      }
                      else {
                        uint64_t v50 = 0LL;
                      }
                      uint64_t v51 = objc_msgSend( (id)objc_msgSend(v45, "objectForKey:", _sqlEntityForEntityID(v48, v49 + v50)),  "integerValue");
                      uint64_t v94 = v49;
                      __int128 v52 = v92;
                      uint64_t v53 = &v92[24 * v49];
                      *((void *)v53 + 1) = v51;
                      uint64_t v54 = v53 + 8;
                      if (*(void *)&v52[24 * v49])
                      {
                        __int128 v97 = 0u;
                        __int128 v98 = 0u;
                        __int128 v95 = 0u;
                        __int128 v96 = 0u;
                        __int128 v55 = *(void **)&v92[24 * v94 + 16];
                        uint64_t v56 = [v55 countByEnumeratingWithState:&v95 objects:v107 count:16];
                        if (v56)
                        {
                          uint64_t v57 = *(void *)v96;
                          do
                          {
                            for (uint64_t j = 0LL; j != v56; ++j)
                            {
                              if (*(void *)v96 != v57) {
                                objc_enumerationMutation(v55);
                              }
                              uint64_t v59 = *(void **)(*((void *)&v95 + 1) + 8 * j);
                              uint64_t v60 = (void *)[v59 entity];
                              if (v60) {
                                uint64_t v61 = _sqlCoreLookupSQLEntityForEntityDescription(a1, v60);
                              }
                              else {
                                uint64_t v61 = 0LL;
                              }
                              uint64_t v62 = (void *)[a1 newObjectIDForEntity:v61 pk:(*v54)--];
                              [v8 setObject:v59 forKey:v62];
                            }

                            uint64_t v56 = [v55 countByEnumeratingWithState:&v95 objects:v107 count:16];
                          }

                          while (v56);
                        }
                      }

                      uint64_t v49 = v94 + 1;
                      unint64_t v46 = v90;
                      uint64_t v45 = v88;
                      uint64_t v48 = v89;
                    }

                    while (v94 != v91);
                  }

                  ++v46;
                }

                id v64 = 0LL;
                int v65 = 1;
              }

              else
              {
                if (v43) {
                  uint64_t v63 = (void *)v43[6];
                }
                else {
                  uint64_t v63 = 0LL;
                }
                id v64 = v63;
                int v65 = 0;
              }

              if (v93)
              {
                for (unint64_t k = 0; objc_msgSend(v87, "count", v83) > k; ++k)
                {
                  uint64_t v67 = (id *)v93[k];
                  uint64_t v68 = v86[k];
                  if (v68 >= 1)
                  {
                    __int128 v69 = v67 + 5;
                    do
                    {

                      v69 += 3;
                      --v68;
                    }

                    while (v68);
                  }

                  free(v67);
                }

                free(v93);
              }

              free(v86);
              if (v64)
              {

                objc_exception_throw(v64);
                __break(1u);
              }

              else
              {
                if (v65)
                {
                  unint64_t v70 = [v8 count];
                  unint64_t v71 = v70;
                  uint64_t v94 = (uint64_t)&v83;
                  if (v70 <= 1) {
                    uint64_t v72 = 1LL;
                  }
                  else {
                    uint64_t v72 = v70;
                  }
                  if (v70 >= 0x201) {
                    uint64_t v73 = 1LL;
                  }
                  else {
                    uint64_t v73 = v72;
                  }
                  uint64_t v74 = (char *)&v83 - ((8 * v73 + 15) & 0xFFFFFFFFFFFFFFF0LL);
                  size_t v75 = 8 * v72;
                  if (v70 > 0x200)
                  {
                    uint64_t v74 = (char *)NSAllocateScannedUncollectable();
                    uint64_t v76 = (char *)NSAllocateScannedUncollectable();
                  }

                  else
                  {
                    bzero((char *)&v83 - ((8 * v73 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v72);
                    uint64_t v76 = (char *)&v83 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0LL);
                    bzero(v76, v75);
                  }

                  BOOL v78 = v71 < 0x201;
                  [v8 getObjects:v76 andKeys:v74];
                  uint64_t v79 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v74 count:v71];
                  __int128 v80 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v76 count:v71];
                  __int128 v77 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](v85, v80, v79);

                  if (!v78)
                  {
                    NSZoneFree(0LL, v74);
                    NSZoneFree(0LL, v76);
                  }
                }

                else
                {
                  __int128 v77 = 0LL;
                }

                uint64_t v81 = [a1 doFilesystemCleanupOnRemove:0];
                if (v77)
                {
                  if (v84)
                  {
                    void *v84 = v77;
                  }

                  else
                  {
                    uint64_t v82 = (void *)MEMORY[0x186E3E5D8](v81);
                    objc_msgSend((id)objc_msgSend(MEMORY[0x189607958], "defaultCenter"), "postNotification:", v77);

                    objc_autoreleasePoolPop(v82);
                  }
                }

                else if (v84)
                {
                  void *v84 = 0LL;
                }
              }

              return;
            }
          }

          uint64_t v5 = [(id)v94 countByEnumeratingWithState:&v103 objects:v109 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
    }
  }

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  return result;
}

- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "count")) {
    return 1;
  }
  id v21 = 0LL;
  uint64_t v7 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = (void *)objc_msgSend(a3, "insertedObjects", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v10);
  }

  -[NSSQLCore _obtainPermanentIDsForObjects:withNotification:error:](self, v7, &v21);
  BOOL v15 = v14 != 0;
  if (v21)
  {
    -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)a3, (uint64_t)v21);
  }

  return v15;
}

- (uint64_t)_disconnectAllConnections
{
  if (result)
  {
    uint64_t v1 = result;
    -[NSSQLCoreDispatchManager disconnectAllConnections](*(void *)(result + 128));
    uint64_t v2 = *(void *)(v1 + 120);
    uint64_t v3 = MEMORY[0x1895F87A8];
    if (v2)
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __38__NSSQLCore__disconnectAllConnections__block_invoke;
      v7[3] = &unk_189EA7758;
      v7[4] = v1;
      -[NSSQLiteConnection performAndWait:](v2, (uint64_t)v7);
    }

    if (atomic_load((unint64_t *)(v1 + 208)))
    {
      uint64_t v5 = atomic_load((unint64_t *)(v1 + 208));
      v6[0] = v3;
      v6[1] = 3221225472LL;
      v6[2] = __38__NSSQLCore__disconnectAllConnections__block_invoke_2;
      v6[3] = &unk_189EA7758;
      v6[4] = v1;
      -[NSSQLiteConnection performAndWait:](v5, (uint64_t)v6);
    }

    id result = *(unsigned int *)(v1 + 268);
    if ((_DWORD)result != -1)
    {
      id result = notify_cancel(result);
      *(_DWORD *)(v1 + 268) = -1;
    }
  }

  return result;
}

void __38__NSSQLCore__disconnectAllConnections__block_invoke(uint64_t a1)
{
}

void __38__NSSQLCore__disconnectAllConnections__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208LL));
  -[NSSQLiteConnection disconnect](v1);
}

- (void)_rebuildIndiciesSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSPersistentStore isReadOnly](self, "isReadOnly")
    || !-[NSPersistentStore persistentStoreCoordinator](self, "persistentStoreCoordinator")
    || (*((_BYTE *)&self->_sqlCoreFlags + 1) & 1) != 0)
  {
    if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
    {
      id v7 = -[NSSQLCore identifier](self, "identifier");
      -[NSPersistentStore isReadOnly](self, "isReadOnly");
      _NSCoreDataLog(4LL, (uint64_t)@"Unable to reindex store(%@) - %@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    }
  }

  else
  {
    uint64_t v5 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke;
    v16[3] = &unk_189EA98A8;
    v16[4] = self;
    if (v3)
    {
      uint64_t v6 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  v16,  0LL,  self);
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v6, 0LL);
    }

    else
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      block[0] = v5;
      block[1] = 3221225472LL;
      block[2] = __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke_297;
      block[3] = &unk_189EA8A98;
      void block[4] = self;
      block[5] = v16;
      dispatch_async(global_queue, block);
    }
  }

void __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0LL;
  }
  if (-[NSSQLiteConnection recreateIndices](v3))
  {
    os_unfair_lock_lock_with_options();
    [*(id *)(*(void *)(a1 + 32) + 160) setValue:0 forKey:@"NSPersistentStoreRebuildIndicies"];
    atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 196LL));
    [*(id *)(a1 + 32) _setMetadataDirty:1];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 152LL));
    uint64_t v10 = [*(id *)(a1 + 32) identifier];
    _NSCoreDataLog( 2LL,  (uint64_t)@"Finished rebuilding indicies for store - %@",  v11,  v12,  v13,  v14,  v15,  v16,  v10);
  }

  else
  {
    _NSCoreDataLog(1LL, (uint64_t)@"Index recreation failed", v4, v5, v6, v7, v8, v9, v17);
  }

void __43__NSSQLCore__rebuildIndiciesSynchronously___block_invoke_297(uint64_t a1)
{
  uint64_t v2 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
  -[NSSQLCore dispatchRequest:withRetries:](*(void *)(a1 + 32), v2, 0LL);
}

+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3
{
  uint64_t v3 = (void *)[a3 path];
  uint64_t v4 = objc_msgSend( (id)objc_msgSend(v3, "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  objc_msgSend( (id)objc_msgSend( @".",  "stringByAppendingString:",  objc_msgSend((id)objc_msgSend(v3, "lastPathComponent"), "stringByDeletingPathExtension")),  "stringByAppendingString:",  @"_SUPPORT"));
  return (id)[MEMORY[0x189604030] fileURLWithPath:v4 isDirectory:1];
}

- (void)_supportDirectoryPath
{
  if (result)
  {
    uint64_t v1 = (void *)[result URL];
    if ([v1 isFileURL])
    {
      uint64_t v2 = (void *)[v1 path];
      return (void *)objc_msgSend( (id)objc_msgSend(v2, "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  objc_msgSend( (id)objc_msgSend( @".",  "stringByAppendingString:",  objc_msgSend((id)objc_msgSend(v2, "lastPathComponent"), "stringByDeletingPathExtension")),  "stringByAppendingString:",  @"_SUPPORT"));
    }

    else
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't write external data to non-file URL" userInfo:0]);
      return (void *)-[NSSQLCore safeguardLocationForFileWithUUID:]();
    }
  }

  return result;
}

- (uint64_t)safeguardLocationForFileWithUUID:(unint64_t *)a1
{
  if (!a1 || ![a2 length]) {
    return 0LL;
  }
  if (!atomic_load(a1 + 21)) {
    [a1 externalDataReferencesDirectory];
  }
  uint64_t v5 = (void *)atomic_load(a1 + 22);
  return [v5 stringByAppendingPathComponent:a2];
}

- (void)cachedModelWithError:(uint64_t)a1
{
  if (a1)
  {
    if (a2) {
      *a2 = 0LL;
    }
    uint64_t v4 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  &__block_literal_global_13,  0LL,  a1);
    -[NSSQLCore dispatchRequest:withRetries:](a1, v4, 0LL);
    id v5 = -[NSSQLStoreRequestContext result](v4, "result");
    if (v4) {
      error = v4->super._error;
    }
    else {
      error = 0LL;
    }
    uint64_t v7 = error;
    if (v5) {
      goto LABEL_11;
    }
    if (!v4 || (exceptiouint64_t n = v4->super._exception) == 0LL)
    {
      id v5 = 0LL;
      if (a2) {
        *a2 = v7;
      }
LABEL_11:

      id v9 = v5;
      return;
    }

    uint64_t v10 = exception;
    objc_exception_throw(exception);
    __break(1u);
  }

void __34__NSSQLCore_cachedModelWithError___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t v3 = a2[3];
  }
  else {
    uint64_t v3 = 0LL;
  }
  if (-[NSSQLiteConnection canConnect](v3))
  {
    -[NSSQLiteConnection connect](v3);
    -[NSSQLiteConnection fetchCachedModel](v3);
    [a2 setResult:v4];
  }

  else
  {
    id v5 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134180 userInfo:&unk_189F03DB0];
    if (a2) {
      objc_setProperty_nonatomic(a2, v6, v5, 40LL);
    }
  }

- (id)identifier
{
  p_sqlCoreStateLocunint64_t k = &self->_sqlCoreStateLock;
  os_unfair_lock_lock_with_options();
  id v4 = (id)-[NSMutableDictionary objectForKey:]( self->_storeMetadata,  "objectForKey:",  @"NSStoreUUID");
  os_unfair_lock_unlock(p_sqlCoreStateLock);
  return v4;
}

- (void)setIdentifier:(id)a3
{
  p_sqlCoreStateLocunint64_t k = &self->_sqlCoreStateLock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setObject:forKey:](self->_storeMetadata, "setObject:forKey:", a3, @"NSStoreUUID");
  atomic_store(0, (unsigned __int8 *)&self->_metadataIsClean);
  -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 1LL);
  os_unfair_lock_unlock(p_sqlCoreStateLock);
}

- (id)metadata
{
  p_sqlCoreStateLocunint64_t k = &self->_sqlCoreStateLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_storeMetadata;
  os_unfair_lock_unlock(p_sqlCoreStateLock);
  return v4;
}

- (void)setMetadata:(id)a3
{
  if (-[NSPersistentStore isReadOnly](self, "isReadOnly"))
  {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Cannot set metadata in read-only store.",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", self),  @"NSAffectedStoresErrorKey",  0)));
    -[NSSQLCore _updateAutoVacuumMetadataWithValues:](v7, v8);
  }

  else
  {
    id v5 = -[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:]( self,  "_updatedMetadataWithSeed:includeVersioning:",  a3,  1LL);
    os_unfair_lock_lock_with_options();
    uint64_t v6 = -[NSMutableDictionary objectForKey:](self->_storeMetadata, "objectForKey:", @"_NSAutoVacuumLevel");
    os_unfair_lock_unlock(&self->_sqlCoreStateLock);
    if (v6) {
      [v5 setObject:v6 forKey:@"_NSAutoVacuumLevel"];
    }
    -[NSSQLCore _setMetadata:clean:]((uint64_t)self, v5, 0);
  }

- (void)_updateAutoVacuumMetadataWithValues:(unsigned __int8 *)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "metadata"), "mutableCopy");
    unsigned __int8 v5 = atomic_load(a1 + 196);
    if (v4)
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      uint64_t v6 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(a2);
            }
            objc_msgSend( v4,  "setValue:forKey:",  objc_msgSend(a2, "valueForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i)),  *(void *)(*((void *)&v13 + 1) + 8 * i));
          }

          uint64_t v7 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }

        while (v7);
      }

      int v10 = v5 & 1;
      uint64_t v11 = (uint64_t)a1;
      uint64_t v12 = v4;
    }

    else
    {
      int v10 = v5 & 1;
      uint64_t v11 = (uint64_t)a1;
      uint64_t v12 = a2;
    }

    -[NSSQLCore _setMetadata:clean:](v11, v12, v10);
  }

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  return (id)[a1 metadataForPersistentStoreWithURL:a3 options:0 error:a4];
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  return [a1 setMetadata:a3 forPersistentStoreWithURL:a4 options:0 error:a5];
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5 = a3;
  v22[1] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return v5;
  }
  if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:",  objc_msgSend(v5, "path")) & 1) == 0)
  {
    if (a5)
    {
      id v17 = objc_alloc(MEMORY[0x189603F68]);
      uint64_t v18 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v5, *MEMORY[0x189607760], 0);
      *a5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:260 userInfo:v18];
    }

    return 0LL;
  }

  id v9 = (void *)MEMORY[0x189603FC8];
  uint64_t v10 = [MEMORY[0x189607968] numberWithDouble:240.0];
  id v21 = @"journal_mode";
  v22[0] = [MEMORY[0x189603FE8] null];
  uint64_t v11 = (void *)objc_msgSend( v9,  "dictionaryWithObjectsAndKeys:",  v10,  @"NSPersistentStoreTimeoutOption",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1),  @"NSSQLitePragmasOption",  0);
  uint64_t v12 = v11;
  if (a4)
  {
    [v11 addEntriesFromDictionary:a4];
    [v12 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
    __int128 v13 = (void *)[a4 objectForKey:@"NSSQLitePragmasOption"];
    if ([v13 objectForKey:@"journal_mode"])
    {
      __int128 v14 = (void *)[v13 mutableCopy];
      objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x189603FE8], "null"), @"journal_mode");
      [v12 setObject:v14 forKey:@"NSSQLitePragmasOption"];
    }
  }

  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]( (uint64_t)&OBJC_CLASS___NSSQLCore,  v5,  a4,  (uint64_t *)a5)) {
    return 0LL;
  }
  __int128 v15 = (void *)[objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:v5 options:v12];
  if ([v15 loadMetadata:a5])
  {
    id v5 = (id)objc_msgSend((id)objc_msgSend(v15, "metadata"), "copy");
    int v16 = 0;
  }

  else
  {
    id v5 = 0LL;
    int v16 = 1;
  }

  -[NSSQLCore _disconnectAllConnections]((uint64_t)v15);

  if ((v16 | 2) != 2) {
    return 0LL;
  }
  __int128 v19 = (void *)[v5 objectForKey:@"NSStoreType"];
  return v5;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v22[1] = *MEMORY[0x1895F89C0];
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___NSSQLCore;
  uint64_t v11 = (void *)MEMORY[0x189603FC8];
  uint64_t v12 = [MEMORY[0x189607968] numberWithDouble:240.0];
  id v21 = @"journal_mode";
  v22[0] = [MEMORY[0x189603FE8] null];
  __int128 v13 = (void *)objc_msgSend( v11,  "dictionaryWithObjectsAndKeys:",  v12,  @"NSPersistentStoreTimeoutOption",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1),  @"NSSQLitePragmasOption",  0);
  __int128 v14 = v13;
  if (a5)
  {
    [v13 addEntriesFromDictionary:a5];
    [v14 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
    __int128 v15 = (void *)[a5 objectForKey:@"NSSQLitePragmasOption"];
    if ([v15 objectForKey:@"journal_mode"])
    {
      int v16 = (void *)[v15 mutableCopy];
      objc_msgSend(v16, "setObject:forKey:", objc_msgSend(MEMORY[0x189603FE8], "null"), @"journal_mode");
      [v14 setObject:v16 forKey:@"NSSQLitePragmasOption"];
    }
  }

  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]( (uint64_t)&OBJC_CLASS___NSSQLCore,  a4,  a5,  (uint64_t *)a6)) {
    return 0;
  }
  id v17 = (void *)[objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:a4 options:v14];
  if ([v17 loadMetadata:a6] && objc_msgSend(v17, "load:", a6))
  {
    [v17 setMetadata:a3];
    BOOL v18 = [v17 executeRequest:objc_alloc_init(NSSaveChangesRequest) withContext:0 error:a6] != 0;
  }

  else
  {
    BOOL v18 = 0;
  }

  -[NSSQLCore _disconnectAllConnections]((uint64_t)v17);

  return v18;
}

+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  if (!a3 || ![a3 isFileURL])
  {
    if (a5)
    {
      id v17 = 0LL;
      *a5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134070 userInfo:&unk_189F03DD8];
      return v17;
    }

    return 0LL;
  }

  if ((objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:",  objc_msgSend(a3, "path")) & 1) == 0)
  {
    if (a5)
    {
      id v18 = objc_alloc(MEMORY[0x189603F68]);
      __int128 v19 = (void *)objc_msgSend(v18, "initWithObjectsAndKeys:", a3, *MEMORY[0x189607760], 0);
      *a5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:260 userInfo:v19];
    }

    return 0LL;
  }

  id v9 = (void *)MEMORY[0x189603FC8];
  uint64_t v10 = [MEMORY[0x189607968] numberWithDouble:240.0];
  id v21 = @"journal_mode";
  v22[0] = [MEMORY[0x189603FE8] null];
  uint64_t v11 = (void *)objc_msgSend( v9,  "dictionaryWithObjectsAndKeys:",  v10,  @"NSPersistentStoreTimeoutOption",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1),  @"NSSQLitePragmasOption",  0);
  uint64_t v12 = v11;
  if (a4)
  {
    [v11 addEntriesFromDictionary:a4];
    [v12 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
    __int128 v13 = (void *)[a4 objectForKey:@"NSSQLitePragmasOption"];
    if ([v13 objectForKey:@"journal_mode"])
    {
      __int128 v14 = (void *)[v13 mutableCopy];
      objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x189603FE8], "null"), @"journal_mode");
      [v12 setObject:v14 forKey:@"NSSQLitePragmasOption"];
    }
  }

  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]( (uint64_t)&OBJC_CLASS___NSSQLCore,  a3,  a4,  (uint64_t *)a5)) {
    return 0LL;
  }
  __int128 v15 = (void *)[objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:a3 options:v12];
  if ([v15 loadMetadata:a5] && objc_msgSend(v15, "load:", a5))
  {
    -[NSSQLCore cachedModelWithError:]((uint64_t)v15, (NSError **)a5);
    id v17 = v16;
  }

  else
  {
    id v17 = 0LL;
  }

  -[NSSQLCore _disconnectAllConnections]((uint64_t)v15);

  return v17;
}

+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a3 && ([a3 isFileURL] & 1) != 0)
  {
    uint64_t v20 = 0LL;
    id v9 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Destroying store",  &v20);
    if (+[NSSQLiteConnection _destroyPersistentStoreAtURL:options:error:]( (uint64_t)&OBJC_CLASS___NSSQLiteConnection,  a3,  a4,  (uint64_t *)a5))
    {
      uint64_t v10 = [a1 _figureOutWhereExternalReferencesEndedUpRelativeTo:a3];
      if (!v10
        || (objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "removeItemAtURL:error:", v10, 0) & 1) != 0
        || +[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") < 1)
      {
        BOOL v12 = 1;
      }

      else
      {
        uint64_t v11 = [a3 path];
        BOOL v12 = 1;
        _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to delete support directory for store: %@",  v13,  v14,  v15,  v16,  v17,  v18,  v11);
      }
    }

    else
    {
      BOOL v12 = 0;
    }

    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v20,  v9);
  }

  else
  {
    BOOL v12 = 0;
    if (a5) {
      *a5 = (id)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Only persistent stores backed by files can be destroyed",  a4,  *MEMORY[0x1896075E0],  0));
    }
  }

  return v12;
}

+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7
{
  if (a5)
  {
    int v13 = [a5 isFileURL];
    if (a3)
    {
      if (v13 && ([a3 isFileURL] & 1) != 0)
      {
        uint64_t v80 = 0LL;
        uint64_t v74 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Replacing entire store",  &v80);
        uint64_t v14 = (void *)[a1 _figureOutWhereExternalReferencesEndedUpRelativeTo:a3];
        uint64_t v76 = (void *)[a1 _figureOutWhereExternalReferencesEndedUpRelativeTo:a5];
        BOOL v78 = (void *)objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:isDirectory:",  objc_msgSend( (id)objc_msgSend(v14, "path"),  "stringByAppendingString:",  @"_transsrc_4052146efa0d85c9fbe0634c0e8bc4457ed82f7c"),  1);
        __int128 v77 = (void *)objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:isDirectory:",  objc_msgSend( (id)objc_msgSend(v14, "path"),  "stringByAppendingString:",  @"_transdst_878d188f109e9f52ae70b0b25413f6a38c8267a8"),  1);
        uint64_t v15 = (void *)[MEMORY[0x1896078A8] defaultManager];
        int v75 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v76, "path"));
        int v73 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v14, "path"));
        int v16 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v78, "path"));
        int v17 = objc_msgSend(v15, "fileExistsAtPath:", objc_msgSend(v77, "path"));
        if (!v16) {
          goto LABEL_15;
        }
        uint64_t v79 = 0LL;
        if ([v15 removeItemAtURL:v78 error:&v79]) {
          goto LABEL_15;
        }
        if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
        {
          uint64_t v18 = [v78 path];
          _NSCoreDataLog( 4LL,  (uint64_t)@"Failed to delete staging area for external support directory for store: %@",  v19,  v20,  v21,  v22,  v23,  v24,  v18);
        }

        if (v75)
        {
          int v25 = 0;
          if (a7) {
            *a7 = v79;
          }
        }

        else
        {
LABEL_15:
          int v25 = 1;
        }

        int v27 = v75;
        if (!v25) {
          int v27 = 0;
        }
        if (v27 == 1)
        {
          uint64_t v79 = 0LL;
          int v28 = [v15 copyItemAtURL:v76 toURL:v78 error:&v79];
          if ((v28 & 1) == 0)
          {
            if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
            {
              uint64_t v72 = [a5 path];
              [v78 path];
              _NSCoreDataLog( 4LL,  (uint64_t)@"Failed to copy support directory from store: %@ to store: %@.  %@",  v29,  v30,  v31,  v32,  v33,  v34,  v72);
            }

            if (a7) {
              *a7 = v79;
            }
          }

          int v25 = v28;
        }

        else
        {
          int v28 = 0;
        }

        if (v25) {
          int v35 = v17;
        }
        else {
          int v35 = 0;
        }
        if (v35 == 1)
        {
          uint64_t v79 = 0LL;
          if ([v15 removeItemAtURL:v77 error:&v79]) {
            goto LABEL_36;
          }
          if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
          {
            uint64_t v36 = [a5 path];
            [v78 path];
            _NSCoreDataLog( 4LL,  (uint64_t)@"Failed to copy support directory from store: %@ to store: %@.  %@",  v37,  v38,  v39,  v40,  v41,  v42,  v36);
          }

          if (!v73)
          {
LABEL_36:
            int v25 = 1;
          }

          else
          {
            int v25 = 0;
            if (a7) {
              *a7 = v79;
            }
          }
        }

        if (v25)
        {
          int v43 = +[NSSQLiteConnection _replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:error:]( (uint64_t)&OBJC_CLASS___NSSQLiteConnection,  a3,  a4,  a5,  a6,  (uint64_t *)a7);
          if ((v43 & v73) == 1)
          {
            uint64_t v79 = 0LL;
            int v44 = [v15 moveItemAtURL:v14 toURL:v77 error:&v79];
            if ((v44 & 1) != 0) {
              goto LABEL_47;
            }
            if (+[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
            {
              uint64_t v45 = [a3 path];
              _NSCoreDataLog( 4LL,  (uint64_t)@"Failed to delete support directory for store: %@.  %@",  v46,  v47,  v48,  v49,  v50,  v51,  v45);
            }

            if (!v75)
            {
LABEL_47:
              int v43 = 1;
            }

            else
            {
              int v43 = 0;
              if (a7) {
                *a7 = v79;
              }
            }
          }

          else
          {
            int v44 = 0;
          }

          if (v43) {
            int v52 = v28;
          }
          else {
            int v52 = 0;
          }
          if (v52 == 1)
          {
            uint64_t v79 = 0LL;
            int v53 = [v15 moveItemAtURL:v78 toURL:v14 error:&v79];
            if ((v53 & 1) == 0 && +[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
            {
              uint64_t v54 = [a5 path];
              [a3 path];
              _NSCoreDataLog( 4LL,  (uint64_t)@"Failed to copy support directory from store: %@ to store: %@ (failed to move %@ to %@ due to %@)",  v55,  v56,  v57,  v58,  v59,  v60,  v54);
            }

            int v43 = v53;
          }
        }

        else
        {
          int v44 = 0;
          int v43 = 0;
        }

        uint64_t v61 = (void *)[a6 objectForKey:@"NSPersistentStoreUnlinkDestroyOption"];
        if (v61)
        {
          int v62 = [v61 BOOLValue];
          BOOL v63 = v43 == 0;
          if (v43 && ((v62 ^ 1) & 1) == 0)
          {
            uint64_t v79 = 0LL;
            if (([v15 removeItemAtURL:v76 error:&v79] & 1) == 0
              && +[NSSQLCore debugDefault](&OBJC_CLASS___NSSQLCore, "debugDefault") >= 1)
            {
              uint64_t v64 = [v76 path];
              [a5 path];
              _NSCoreDataLog( 1LL,  (uint64_t)@"Failed to unlink support directory %@ from old store location: %@ due to %@",  v65,  v66,  v67,  v68,  v69,  v70,  v64);
            }

+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6
{
  if (a3 && ([a3 isFileURL] & 1) != 0)
  {
    uint64_t v14 = 0LL;
    uint64_t v10 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Rekeying entire store",  &v14);
    Class v11 = +[NSSQLCore _databaseKeyFromValue:]((uint64_t)&OBJC_CLASS___NSSQLCore, a5);
    BOOL v12 = +[NSSQLiteConnection _rekeyPersistentStoreAtURL:options:withKey:error:]( (uint64_t)&OBJC_CLASS___NSSQLiteConnection,  a3,  a4,  v11,  (uint64_t *)a6);
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v14,  v10);
  }

  else
  {
    BOOL v12 = 0;
    if (a6) {
      *a6 = (id)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Only persistent stores backed by files can be rekeyed",  a4,  a5,  *MEMORY[0x1896075E0],  0));
    }
  }

  return v12;
}

- (BOOL)_initializeQueryGenerationTrackingConnection
{
  if (result)
  {
    BOOL v1 = result;
    id v2 = -[NSSQLiteConnection initAsQueryGenerationTrackingConnectionForSQLCore:]( objc_alloc(&OBJC_CLASS___NSSQLiteConnection),  "initAsQueryGenerationTrackingConnectionForSQLCore:",  result);
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __57__NSSQLCore__initializeQueryGenerationTrackingConnection__block_invoke;
    v16[3] = &unk_189EA7758;
    v16[4] = v2;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v2, (uint64_t)v16);
    if (v2)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v3 = (unint64_t *)(v1 + 208);
      while (!__ldaxr(v3))
      {
      }

      __clrex();

LABEL_10:
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 152));
      unint64_t v13 = atomic_load((unint64_t *)(v1 + 208));
      return v13 != 0;
    }

    else
    {
      uint64_t v5 = [NSString stringWithUTF8String:"An unreported error occurred during initialization of query generation connection."];
      _NSCoreDataLog(17LL, v5, v6, v7, v8, v9, v10, v11, v14);
      BOOL v12 = (os_log_s *)__pflogFaultLog;
      id result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: An unreported error occurred during initialization of query generation connection.",  buf,  2u);
        return 0LL;
      }
    }
  }

  return result;
}

void __57__NSSQLCore__initializeQueryGenerationTrackingConnection__block_invoke(uint64_t a1)
{
}

- (void)_initializeQueryGenerationConnectionForProtectionClasses
{
  if (a1)
  {
    id v2 = getprogname();
    BOOL v3 = v2 && strcmp("routined", v2) == 0;
    if ([a1 supportsGenerationalQuerying])
    {
      if (([a1 isReadOnly] & 1) == 0)
      {
        uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "options"), "objectForKey:", @"NSPersistentStoreFileProtectionKey");
        if (v4)
        {
          uint64_t v5 = (void *)v4;
          if ([a1 _isCloudKitOptioned])
          {
            if (([v5 isEqualToString:*MEMORY[0x189607510]] & 1) != 0
              || [v5 isEqualToString:*MEMORY[0x189607508]])
            {
              if (atomic_load(a1 + 26))
              {
                if (!v3) {
                  return;
                }
              }

              else
              {
                BOOL GenerationTracking = -[NSSQLCore _initializeQueryGenerationTrackingConnection]((BOOL)a1);
                if (!v3) {
                  return;
                }
                if (GenerationTracking)
                {
                  uint64_t v8 = [a1 options];
                  uint64_t v15 = @"Preloading query generation connection success for store with options: %@";
LABEL_18:
                  _NSCoreDataLog(2LL, (uint64_t)v15, v9, v10, v11, v12, v13, v14, v8);
                  return;
                }
              }

              uint64_t v8 = [a1 options];
              uint64_t v15 = @"Preloading query generation connection failed without a reported error for store with options: %@";
              goto LABEL_18;
            }
          }
        }
      }
    }
  }

- (BOOL)_hasActiveGenerations
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  if (self)
  {
    if (atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection))
    {
      uint64_t v3 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
      v6[0] = MEMORY[0x1895F87A8];
      v6[1] = 3221225472LL;
      v6[2] = __34__NSSQLCore__hasActiveGenerations__block_invoke;
      v6[3] = &unk_189EA78C0;
      v6[4] = self;
      void v6[5] = &v7;
      -[NSSQLiteConnection performAndWait:](v3, (uint64_t)v6);
    }
  }

  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __34__NSSQLCore__hasActiveGenerations__block_invoke(uint64_t a1)
{
  id v2 = (id *)atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208LL));
  uint64_t result = [-[NSSQLiteConnection _activeGenerations](v2) count];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result != 0;
  return result;
}

- (uint64_t)_registerNewQueryGenerationSnapshot:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000LL;
    int v9 = 0;
    uint64_t v3 = atomic_load((unint64_t *)(a1 + 208));
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __49__NSSQLCore__registerNewQueryGenerationSnapshot___block_invoke;
    v5[3] = &unk_189EA8380;
    v5[5] = a2;
    v5[6] = &v6;
    v5[4] = v2;
    -[NSSQLiteConnection performAndWait:](v3, (uint64_t)v5);
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(v2 + 264) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 152));
    uint64_t v2 = *((unsigned int *)v7 + 6);
    _Block_object_dispose(&v6, 8);
  }

  return v2;
}

uint64_t __49__NSSQLCore__registerNewQueryGenerationSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v2 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208LL));
  uint64_t result = -[NSSQLiteConnection _registerNewQueryGenerationSnapshot:](v2, *(void **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

- (id)currentQueryGeneration
{
  v28[1] = *MEMORY[0x1895F89C0];
  if (!-[NSSQLCore supportsGenerationalQuerying](self, "supportsGenerationalQuerying"))
  {
    int v17 = (void *)MEMORY[0x189603F70];
    int v27 = @"store";
    v28[0] = self;
    uint64_t v18 = [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    objc_exception_throw((id)[v17 exceptionWithName:*MEMORY[0x189603A58] reason:@"Unsupported feature in this configuration" userInfo:v18]);
    __break(1u);
  }

  unint64_t v3 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
  if (v3 || -[NSSQLCore _initializeQueryGenerationTrackingConnection]((BOOL)self))
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3052000000LL;
    uint64_t v24 = __Block_byref_object_copy__22;
    int v25 = __Block_byref_object_dispose__22;
    uint64_t v26 = 0LL;
    os_unfair_lock_lock_with_options();
    BOOL remoteStoresDidChange = self->_remoteStoresDidChange;
    os_unfair_lock_unlock(&self->_sqlCoreStateLock);
    uint64_t v11 = MEMORY[0x1895F87A8];
    if (remoteStoresDidChange)
    {
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __35__NSSQLCore_currentQueryGeneration__block_invoke;
      v20[3] = &unk_189EA98A8;
      v20[4] = self;
      uint64_t v12 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  v20,  0LL,  self);
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v12, 0LL);
    }

    uint64_t v13 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
    v19[0] = v11;
    v19[1] = 3221225472LL;
    v19[2] = (uint64_t)__35__NSSQLCore_currentQueryGeneration__block_invoke_397;
    v19[3] = (uint64_t)&unk_189EA78C0;
    v19[4] = (uint64_t)self;
    v19[5] = (uint64_t)&v21;
    -[NSSQLiteConnection performAndWait:](v13, (uint64_t)v19);
    if (v22[5])
    {
      uint64_t v14 = objc_alloc(&OBJC_CLASS____NSQueryGenerationToken);
      uint64_t v15 = -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](v14, (void *)v22[5], self, 1);
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    _Block_object_dispose(&v21, 8);
  }

  else
  {
    _NSCoreDataLog( 1LL,  (uint64_t)@"initializing query generations connection for current failed.",  v4,  v5,  v6,  v7,  v8,  v9,  v19[0]);
    return 0LL;
  }

  return v15;
}

void __35__NSSQLCore_currentQueryGeneration__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void **)(a2 + 24);
  }
  else {
    uint64_t v2 = 0LL;
  }
  if ([v2 registerCurrentQueryGenerationWithStore:*(void *)(a1 + 32)])
  {
    uint64_t v3 = [NSString stringWithUTF8String:"Failed to adopt query generation from remote change"];
    _NSCoreDataLog(17LL, v3, v4, v5, v6, v7, v8, v9, v11);
    char v10 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      _os_log_fault_impl( &dword_186681000,  v10,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to adopt query generation from remote change",  (uint8_t *)&v11,  2u);
    }
  }

void __35__NSSQLCore_currentQueryGeneration__block_invoke_397( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  char v10 = (unsigned int *)atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208LL));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = -[NSSQLiteConnection currentQueryGenerationIdentifier](v10);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)) {
    _NSCoreDataLog( 1LL,  (uint64_t)@"SQLCore failed to get a currentQueryGeneration",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
  }
}

- (void)freeQueryGenerationWithIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __47__NSSQLCore_freeQueryGenerationWithIdentifier___block_invoke;
    v4[3] = &unk_189EA7648;
    v4[4] = self;
    v4[5] = a3;
    -[NSSQLiteConnection performAndWait:](v3, (uint64_t)v4);
  }

uint64_t __47__NSSQLCore_freeQueryGenerationWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 208LL));
  return -[NSSQLiteConnection freeQueryGenerationWithIdentifier:](v2, v1);
}

- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1895F89C0];
  if (!-[NSSQLCore supportsGenerationalQuerying](self, "supportsGenerationalQuerying"))
  {
    uint64_t v19 = *MEMORY[0x189603A58];
    int v27 = @"store";
    v28[0] = self;
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v19,  @"Unsupported feature in this configuration",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1)));
  }

  unint64_t v7 = atomic_load((unint64_t *)&self->_queryGenerationTrackingConnection);
  if (!v7 && !-[NSSQLCore _initializeQueryGenerationTrackingConnection]((BOOL)self))
  {
    if (a4) {
      *a4 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134502 userInfo:0];
    }
    _NSCoreDataLog( 1LL,  (uint64_t)@"initializing query generations connection failed.",  v8,  v9,  v10,  v11,  v12,  v13,  v22);
    return 0LL;
  }

  uint64_t v22 = MEMORY[0x1895F87A8];
  uint64_t v23 = 3221225472LL;
  uint64_t v24 = __55__NSSQLCore_reopenQueryGenerationWithIdentifier_error___block_invoke;
  int v25 = &unk_189EA98A8;
  id v26 = a3;
  uint64_t v14 =  -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  &v22,  0LL,  self);
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v14, 0LL);
  id v15 = -[NSSQLStoreRequestContext result](v14, "result", v22, v23, v24, v25, v26);
  if (v15) {
    return  -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:]( objc_alloc(&OBJC_CLASS____NSQueryGenerationToken),  v15,  self,  1);
  }
  if (v14)
  {
    exceptiouint64_t n = v14->super._exception;
    if (!exception)
    {
      if (a4)
      {
        error = v14->super._error;
LABEL_10:
        id result = 0LL;
        *a4 = error;
        return result;
      }

      return 0LL;
    }

    objc_exception_throw(exception);
    __55__NSSQLCore_reopenQueryGenerationWithIdentifier_error___block_invoke(v20, v21);
  }

  else
  {
    error = 0LL;
    id result = 0LL;
    if (a4) {
      goto LABEL_10;
    }
  }

  return result;
}

void __55__NSSQLCore_reopenQueryGenerationWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t v4 = a2[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  -[NSSQLiteConnection connect](v4);
  id newValue = 0LL;
  -[NSSQLiteConnection reopenQueryGenerationWithIdentifier:error:](v4, *(void **)(a1 + 32), &newValue);
  if (v5)
  {
    [a2 setResult:v5];
  }

  else if (a2)
  {
    objc_setProperty_nonatomic(a2, v6, newValue, 40LL);
  }

- (BOOL)supportsConcurrentRequestHandling
{
  int v3 = -[NSSQLCore supportsComplexFeatures](self);
  if (v3)
  {
    id v4 = -[NSDictionary valueForKey:]( -[NSPersistentStore options](self, "options"),  "valueForKey:",  @"NSPersistentStoreConnectionPoolMaxSize");
    if (v4)
    {
      LOBYTE(v3) = 0;
      return v3;
    }

    uint64_t v5 = getprogname();
    if (!v5 || (int v3 = strncmp("YouTube", v5, 7uLL)) != 0) {
LABEL_3:
    }
      LOBYTE(v3) = 1;
  }

  return v3;
}

- (id)connectionForMigration
{
  id v1 = a1;
  if (a1)
  {
    id v1 = -[NSSQLiteConnection initForSQLCore:](objc_alloc(&OBJC_CLASS___NSSQLiteConnection), "initForSQLCore:", a1);
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __35__NSSQLCore_connectionForMigration__block_invoke;
    v3[3] = &unk_189EA7758;
    v3[4] = v1;
    -[NSSQLiteConnection performAndWait:]((uint64_t)v1, (uint64_t)v3);
  }

  return v1;
}

void __35__NSSQLCore_connectionForMigration__block_invoke(uint64_t a1)
{
}

- (id)type
{
  return @"SQLite";
}

- (void)setURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSQLCore;
  -[NSPersistentStore setURL:](&v7, sel_setURL_, a3);
  -[NSSQLCore _disconnectAllConnections]((uint64_t)self);
  if (self)
  {
    id v4 = (void *)atomic_load((unint64_t *)&self->_externalDataLinksDirectory);

    atomic_store(0LL, (unint64_t *)&self->_externalDataLinksDirectory);
    uint64_t v5 = (void *)atomic_load((unint64_t *)&self->_externalDataReferencesDirectory);

    atomic_store(0LL, (unint64_t *)&self->_externalDataReferencesDirectory);
    uint64_t v6 = (void *)atomic_load((unint64_t *)&self->_fileBackedFuturesPath);

    atomic_store(0LL, (unint64_t *)&self->_fileBackedFuturesPath);
  }

- (void)_useModel:(id *)a1
{
  if (a1)
  {
    if (a1[13] != a2)
    {
      id v4 = (void *)MEMORY[0x186E3E5D8]();
      id v5 = a2;

      a1[13] = a2;
      -[NSSQLiteAdapter _useModel:]([a1 adapter], a2);
      -[NSSQLCore _setupHistoryModelForPSC:withExcludedEntityNames:]((uint64_t)a1, 0LL, (void *)NSSet_EmptySet);
      objc_autoreleasePoolPop(v4);
    }
  }

- (void)_cacheRows:(void *)result
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    int v3 = -[NSSQLCore rowCacheForGeneration:](result, 0LL);
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id result = (void *)[a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      id v4 = result;
      uint64_t v5 = *(void *)v10;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(a2);
          }
          objc_super v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)v6);
          uint64_t v8 = (void *)[v7 objectID];
          if (v3) {
            -[NSPersistentStoreCache registerRow:forObjectID:options:]((uint64_t)v3, (unsigned int *)v7, v8, 0);
          }
          uint64_t v6 = (void *)((char *)v6 + 1);
        }

        while (v4 != v6);
        id result = (void *)[a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        id v4 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)_uncacheRows:(void *)result
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    int v3 = -[NSSQLCore rowCacheForGeneration:](result, 0LL);
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id result = (void *)[a2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      id v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(a2);
          }
          -[NSPersistentStoreCache decrementRefCountForObjectID:]( (uint64_t)v3,  (const void *)[*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) objectID]);
          uint64_t v6 = (void *)((char *)v6 + 1);
        }

        while (v4 != v6);
        id result = (void *)[a2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        id v4 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (self
    && -[NSDictionary objectForKey:]( -[NSPersistentStore options](self, "options"),  "objectForKey:",  @"NSPersistentStoreUbiquitousContentNameKey"))
  {
    id v5 = 0LL;
  }

  else
  {
    id v5 = -[NSDictionary valueForKey:]( -[NSPersistentStore options](self, "options"),  "valueForKey:",  @"NSPersistentStoreConnectionPoolMaxSize");
  }

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3
{
}

- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3
{
  if (byte_18C694E59 == 1)
  {
    -[NSSQLCore managedObjectContextDidUnregisterObjectsWithIDs:generation:]( self,  "managedObjectContextDidUnregisterObjectsWithIDs:generation:",  a3,  0LL);
  }

  else
  {
    uint64_t v3 = [NSString stringWithUTF8String:"Attempt to use SPI reserved for mapssyncd"];
    _NSCoreDataLog(17LL, v3, v4, v5, v6, v7, v8, v9, v11);
    __int128 v10 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      _os_log_fault_impl( &dword_186681000,  v10,  OS_LOG_TYPE_FAULT,  "CoreData: Attempt to use SPI reserved for mapssyncd",  (uint8_t *)&v11,  2u);
    }
  }

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3
{
}

- (void)willRemoveFromPersistentStoreCoordinator:(id)a3
{
  observer = self->_observer;
  if (observer)
  {
    objc_storeWeak((id *)&observer->_core, 0LL);

    self->_observer = 0LL;
  }

  id v6 = -[NSSQLCore harvestIndexStatisticsFromConnections]((uint64_t)self);
  if ([v6 count])
  {
    uint64_t v11 = 0LL;
    uint64_t v7 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Saving index statistics",  &v11);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __54__NSSQLCore_willRemoveFromPersistentStoreCoordinator___block_invoke;
    v10[3] = &unk_189EA9910;
    v10[4] = v6;
    v10[5] = self;
    uint64_t v8 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  v10,  0LL,  self);
    -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v8, 0LL);

    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  v11,  v7);
  }

  -[NSSQLCore _disconnectAllConnections]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSQLCore;
  -[NSPersistentStore willRemoveFromPersistentStoreCoordinator:](&v9, sel_willRemoveFromPersistentStoreCoordinator_, a3);
}

void __54__NSSQLCore_willRemoveFromPersistentStoreCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v2 = 0LL;
  }
  +[NSSQLiteIndexTrackingModel updateIndexStatistics:usingConnection:model:]( (uint64_t)NSSQLiteIndexTrackingModel,  *(void **)(a1 + 32),  v2,  (void *)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 40), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentStoreTrackIndexUseOptionKey"));
}

- (BOOL)_unload:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSQLCore;
  return -[NSPersistentStore _unload:](&v6, sel__unload_, a3);
}

- (id)_newObjectIDForEntity:(id)a3 referenceData64:(unint64_t)a4
{
  if (a4)
  {
    if (a3)
    {
      id v6 = -[NSSQLModel entityNamed:](self->_model, "entityNamed:", [a3 name]);
      if (v6) {
        return -[NSSQLCore newObjectIDForEntity:pk:](self, "newObjectIDForEntity:pk:", v6, a4);
      }
    }

    uint64_t v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = *MEMORY[0x189603A60];
    __int128 v10 = @"Invalid parameter value (bad entity)";
  }

  else
  {
    uint64_t v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = *MEMORY[0x189603A60];
    __int128 v10 = @"Invalid parameter value (zero)";
  }

  objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
  return -[NSSQLCore presentedItemURL](v11, v12);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)qword_18C694E70;
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
}

void __66__NSSQLCore_processCloudKitContainerEventRequest_inContext_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = -[NSPersistentCloudKitContainerEvent initWithCKEvent:]( objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainerEvent),  "initWithCKEvent:",  a2);
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v15 = 0LL;
  -[NSSQLCore _newValuesForRelationship:forObjectWithID:withContext:error:](self, a3, a4, a5, &v15);
  __int128 v10 = v9;
  if (a6 && !v9)
  {
    uint64_t v11 = v15;
    if (!v15)
    {
      SEL v12 = (void *)MEMORY[0x189607870];
      uint64_t v13 = *MEMORY[0x189607460];
      uint64_t v16 = @"message";
      v17[0] = [NSString stringWithFormat:@"failed to retrieve ordering information from fault for object %@ and relationship %@", a4, objc_msgSend(a3, "name")];
      uint64_t v11 = (NSError *)objc_msgSend( v12,  "errorWithDomain:code:userInfo:",  v13,  133000,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1));
    }

    *a6 = v11;
  }

  return v10;
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void *)[a4 entity];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "subentities"), "count");
  uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(self, v8);
  uint64_t v11 = [a4 name];
  if (v10)
  {
    uint64_t v12 = [*(id *)(v10 + 40) objectForKey:v11];
    if ([(id)v12 isToMany])
    {
LABEL_3:
      uint64_t v13 = -[NSSQLiteAdapter generateSQLStatmentForSourcesAndOrderKeysForDestination:inToMany:]( (NSSQLiteStatement *)-[NSSQLCore adapter](self, "adapter"),  a3,  (void *)v12);
LABEL_7:
      uint64_t v14 = v13;
      goto LABEL_9;
    }

    if (v12 && *(_BYTE *)(v12 + 24) == 9)
    {
      uint64_t v13 = -[NSSQLiteAdapter generateSQLStatmentForSourcesAndOrderKeysForDestination:inManyToMany:]( (NSSQLiteStatement *)-[NSSQLCore adapter](self, "adapter"),  a3,  (__CFString *)v12);
      goto LABEL_7;
    }

    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
  }

void __62__NSSQLCore__allOrderKeysForDestination_inRelationship_error___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    uint64_t v3 = a2[3];
  }
  else {
    uint64_t v3 = 0LL;
  }
  CFMutableArrayRef v4 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](v3, (void *)[*(id *)(a1 + 32) sqlString]);
  [a2 setResult:v4];
  CFRelease(v4);
  -[NSSQLiteConnection endFetchAndRecycleStatement:](v3, 0);
}

- (void)_refreshTriggerValues:(uint64_t)a1
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v55 = 0LL;
    id v44 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v38 = objc_alloc_init(MEMORY[0x1896077E8]);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    uint64_t v3 = *(void *)(a1 + 104);
    if (v3) {
      CFMutableArrayRef v4 = *(void **)(v3 + 24);
    }
    else {
      CFMutableArrayRef v4 = 0LL;
    }
    uint64_t v5 = (void *)[v4 allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:v61 count:16];
    uint64_t v7 = MEMORY[0x1895F87A8];
    uint64_t v8 = &off_1868D5000;
    if (!v6) {
      goto LABEL_34;
    }
    obuint64_t j = v5;
    uint64_t v40 = *(void *)v52;
    char v43 = 1;
    do
    {
      uint64_t v9 = 0LL;
      uint64_t v41 = v6;
      do
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v51 + 1) + 8 * v9);
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        if (v10) {
          uint64_t v11 = *(void **)(v10 + 40);
        }
        else {
          uint64_t v11 = 0LL;
        }
        uint64_t v12 = (void *)[v11 allValues];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v60 count:16];
        uint64_t v42 = v9;
        if (v13)
        {
          uint64_t v14 = *(void *)v48;
          do
          {
            for (uint64_t i = 0LL; i != v13; ++i)
            {
              if (*(void *)v48 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(_WORD **)(*((void *)&v47 + 1) + 8 * i);
              int v17 = [v16 propertyType];
              if (v16) {
                BOOL v18 = v17 == 1;
              }
              else {
                BOOL v18 = 0;
              }
              if (v18 && (v16[16] & 8) != 0)
              {
                id v19 = +[NSSQLAttributeExtensionFactory newExtensionsForAttribute:error:]( (uint64_t)&OBJC_CLASS___NSSQLAttributeExtensionFactory,  v16,  (uint64_t *)&v55);
                uint64_t v20 = v19;
                if (v19)
                {
                  v46[0] = v7;
                  v46[1] = 3221225472LL;
                  v46[2] = __35__NSSQLCore__refreshTriggerValues___block_invoke;
                  v46[3] = &unk_189EA9988;
                  v46[4] = v10;
                  v46[5] = v44;
                  [v19 enumerateObjectsUsingBlock:v46];
                }

                else
                {
                  char v43 = 0;
                }
              }
            }

            uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v60 count:16];
          }

          while (v13);
        }

        uint64_t v9 = v42 + 1;
      }

      while (v42 + 1 != v41);
      uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      uint64_t v6 = v21;
    }

    while (v21);
    uint64_t v8 = &off_1868D5000;
    if ((v43 & 1) != 0)
    {
LABEL_34:
      v45[0] = v7;
      v45[1] = *((void *)v8 + 371);
      v45[2] = __35__NSSQLCore__refreshTriggerValues___block_invoke_2;
      v45[3] = &unk_189EA9910;
      v45[4] = v44;
      v45[5] = a1;
      uint64_t v23 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  v45,  0LL,  a1);
      -[NSSQLCore dispatchRequest:withRetries:](a1, v23, 0LL);
      if (v23) {
        exceptiouint64_t n = v23->super._exception;
      }
      else {
        exceptiouint64_t n = 0LL;
      }
      id v25 = exception;

      if (v25)
      {
        objc_exception_throw(v25);
        __break(1u);
        return;
      }

      char v22 = 1;
    }

    else
    {
      char v22 = 0;
    }

    id v26 = v55;

    id v27 = 0LL;
    id v28 = v55;
    if ((v22 & 1) == 0)
    {
      if (v55)
      {
        if (a2) {
          *a2 = v55;
        }
      }

      else
      {
        uint64_t v29 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m");
        uint64_t v36 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v57 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLCore.m";
          __int16 v58 = 1024;
          int v59 = 5392;
          _os_log_fault_impl( &dword_186681000,  v36,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
        }
      }
    }
  }

uint64_t __35__NSSQLCore__refreshTriggerValues___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = (void *)objc_msgSend(a2, "bulkUpdateSQLStrings", 0);
  uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  *(void *)(a1 + 32),  *(void *)(*((void *)&v9 + 1) + 8 * v7));
        [*(id *)(a1 + 40) addObject:v8];

        ++v7;
      }

      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = result;
    }

    while (result);
  }

  return result;
}

void __35__NSSQLCore__refreshTriggerValues___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a2) {
    CFMutableArrayRef v4 = *(void **)(a2 + 24);
  }
  else {
    CFMutableArrayRef v4 = 0LL;
  }
  -[NSSQLiteConnection beginTransaction]((uint64_t)v4);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v5);
        }
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:]((uint64_t)v4, *(void **)(*((void *)&v21 + 1) + 8 * i));
      }

      uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v6);
  }

  -[NSSQLiteConnection commitTransaction]((uint64_t)v4);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    if (atomic_load((unint64_t *)(v9 + 208)))
    {
      if (a2) {
        uint64_t v11 = *(void *)(a2 + 8);
      }
      else {
        uint64_t v11 = 0LL;
      }
      uint64_t v12 = [v4 registerCurrentQueryGenerationWithStore:v11];
      if ((_DWORD)v12)
      {
        uint64_t v13 = [NSString stringWithUTF8String:"Refreshing trigger values failed to adopt post transaction query generation with error %d"];
        _NSCoreDataLog(17LL, v13, v14, v15, v16, v17, v18, v19, v12);
        uint64_t v20 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v26 = v12;
          _os_log_fault_impl( &dword_186681000,  v20,  OS_LOG_TYPE_FAULT,  "CoreData: Refreshing trigger values failed to adopt post transaction query generation with error %d",  buf,  8u);
        }
      }
    }
  }

  -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)v4, 0);
}

void __72__NSSQLCore__rebuildTriggerSchemaUsingConnection_recomputeValues_error___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v4 = (id)[a2 insertSQLStrings];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v5 = (void *)[a2 dropSQLStrings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  *(void *)(a1 + 32),  *(void *)(*((void *)&v30 + 1) + 8 * i));
        [*(id *)(a1 + 40) addObject:v10];
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }

    while (v7);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v11 = [v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t j = 0LL; j != v12; ++j)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v4);
        }
        uint64_t v15 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  *(void *)(a1 + 32),  *(void *)(*((void *)&v26 + 1) + 8 * j));
        [*(id *)(a1 + 40) addObject:v15];
      }

      uint64_t v12 = [v4 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }

    while (v12);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v16 = (void *)objc_msgSend(a2, "bulkUpdateSQLStrings", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t k = 0LL; k != v18; ++k)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          __int128 v21 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  *(void *)(a1 + 32),  *(void *)(*((void *)&v22 + 1) + 8 * k));
          [*(id *)(a1 + 40) addObject:v21];
        }

        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }

      while (v18);
    }
  }
}

- (id)currentChangeToken
{
  uint64_t v2 = self;
  if (self)
  {
    if ((*((_BYTE *)&self->_sqlCoreFlags + 1) & 4) != 0)
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x2020000000LL;
      uint64_t v16 = -1LL;
      uint64_t v7 = MEMORY[0x1895F87A8];
      uint64_t v8 = 3221225472LL;
      uint64_t v9 = __31__NSSQLCore_currentChangeToken__block_invoke;
      __int128 v10 = &unk_189EA99D8;
      uint64_t v11 = self;
      uint64_t v12 = &v13;
      uint64_t v3 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  &v7,  0LL,  self);
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v2, v3, 0LL);

      if (v14[3] == -1)
      {
        uint64_t v5 = 0LL;
      }

      else
      {
        id v4 = objc_alloc(&OBJC_CLASS____NSPersistentHistoryToken);
        uint64_t v5 = -[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:]( v4,  "initWithTransactionNumber:andStoreID:",  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", v14[3], v7, v8, v9, v10, v11, v12),  -[NSSQLCore identifier](v2, "identifier"));
      }

      uint64_t v2 = v5;
      _Block_object_dispose(&v13, 8);
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

sqlite3_int64 __31__NSSQLCore_currentChangeToken__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0LL;
  }
  -[NSSQLiteConnection connect](v3);
  sqlite3_int64 result = -[NSSQLiteConnection fetchMaxPrimaryKeyForEntity:]( v3,  (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "ancillarySQLModels"),  "objectForKey:",  @"NSPersistentHistoryTrackingKey"),  "entityNamed:",  @"TRANSACTION"));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = __58__NSSQLCore_finishDeferredLightweightMigration_withError___block_invoke;
  uint64_t v16 = &unk_189EA9A00;
  uint64_t v17 = &v19;
  LOBYTE(v18) = a3;
  uint64_t v6 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext),  "initWithBlock:context:sqlCore:",  &v13,  0LL,  self);
  -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)self, v6, 0LL);
  if (*((_BYTE *)v20 + 24)) {
    goto LABEL_11;
  }
  if (!v6)
  {
    if (!a4) {
      goto LABEL_11;
    }
    error = 0LL;
    goto LABEL_9;
  }

  exceptiouint64_t n = v6->super._exception;
  if (!exception)
  {
    if (!a4) {
      goto LABEL_11;
    }
    error = v6->super._error;
LABEL_9:
    uint64_t v8 = error;
    goto LABEL_10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = exception;
    objc_exception_throw(exception);
    __break(1u);
    JUMPOUT(0x1867CE608LL);
  }

  if (a4)
  {
    uint64_t v8 = (NSError *)-[NSException errorObjectWithUserInfo:]( exception,  "errorObjectWithUserInfo:",  0LL,  v13,  v14,  v15,  v16,  v17,  v18);
LABEL_10:
    *a4 = v8;
  }

BOOL __58__NSSQLCore_finishDeferredLightweightMigration_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0LL;
  }
  BOOL result = -[NSSQLiteConnection finishDeferredLightweightMigration:](v3, *(unsigned __int8 *)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

- (id)harvestIndexStatisticsFromConnections
{
  if (!a1 || (*(_BYTE *)(a1 + 202) & 1) == 0) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  uint64_t v8 = __Block_byref_object_copy__22;
  uint64_t v9 = __Block_byref_object_dispose__22;
  uint64_t v2 = *(void *)(a1 + 128);
  uint64_t v10 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke;
  v4[3] = &unk_189EA9A50;
  v4[4] = &v5;
  -[NSSQLCoreDispatchManager enumerateAvailableConnectionsWithBlock:](v2, (uint64_t)v4);
  id v1 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v1;
}

void *__50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = -[NSSQLiteConnection harvestUsedIndexes](a2);
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v4)
  {
    uint64_t v5 = [v4 count];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5)
    {
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke_2;
      void v9[3] = &unk_189EA9A28;
      v9[4] = v6;
      return (void *)[v3 enumerateKeysAndObjectsUsingBlock:v9];
    }

    uint64_t v8 = *(void **)(*(void *)(v6 + 8) + 40LL);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  BOOL result = v3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  return result;
}

void *__50__NSSQLCore_harvestIndexStatisticsFromConnections__block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  BOOL result = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:a2];
  if (!result) {
    return (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:a3 forKeyedSubscript:a2];
  }
  uint64_t v7 = result[4];
  result[3] += a3[3];
  result[4] = v7 + a3[4];
  result[5] += a3[5];
  return result;
}

- (NSDictionary)ancillaryModels
{
  return self->_ancillaryModels;
}

- (void)setAncillaryModels:(id)a3
{
  self->_ancillaryModels = 0LL;
  self->_ancillaryModels = (NSDictionary *)a3;
}

- (id)ancillarySQLModels
{
  return self->_ancillarySQLModels;
}

- (void)setAncillarySQLModels:(id)a3
{
  self->_ancillarySQLModels = 0LL;
  self->_ancillarySQLModels = (NSDictionary *)a3;
}

- (BOOL)hasAncillaryModels
{
  return (*((unsigned __int8 *)&self->_sqlCoreFlags + 1) >> 3) & 1;
}

- (void)_setHasAncillaryModels:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->__sqlCoreFlags sqlCoreFlags = (_sqlCoreFlags)(*(_DWORD *)&self->_sqlCoreFlags & 0xFFFFF7FF | v3);
}

+ (BOOL)dropPersistentHistoryforPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  v31[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = (void *)MEMORY[0x189603FC8];
  uint64_t v10 = [MEMORY[0x189607968] numberWithDouble:240.0];
  __int128 v30 = @"journal_mode";
  v31[0] = [MEMORY[0x189603FE8] null];
  uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  uint64_t v12 = (void *)objc_msgSend( v9,  "dictionaryWithObjectsAndKeys:",  v10,  @"NSPersistentStoreTimeoutOption",  v11,  @"NSSQLitePragmasOption",  MEMORY[0x189604A88],  @"NSPersistentHistoryTrackingKey",  0);
  uint64_t v13 = v12;
  if (a4)
  {
    [v12 addEntriesFromDictionary:a4];
    [v13 removeObjectForKey:@"NSReadOnlyPersistentStoreOption"];
    uint64_t v14 = (void *)[a4 objectForKey:@"NSSQLitePragmasOption"];
    if ([v14 objectForKey:@"journal_mode"])
    {
      uint64_t v15 = (void *)[v14 mutableCopy];
      objc_msgSend(v15, "setObject:forKey:", objc_msgSend(MEMORY[0x189603FE8], "null"), @"journal_mode");
      [v13 setObject:v15 forKey:@"NSSQLitePragmasOption"];
    }
  }

  if (!+[NSSQLCore sanityCheckFileAtURL:options:error:]( (uint64_t)&OBJC_CLASS___NSSQLCore,  a3,  a4,  (uint64_t *)a5)) {
    return 0;
  }
  uint64_t v16 = [objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:a3 options:v13];
  uint64_t v17 = (void *)v16;
  if (v16)
  {
    if ((*(_BYTE *)(v16 + 200) & 0x40) != 0)
    {
      uint64_t v20 = objc_alloc(&OBJC_CLASS___NSSQLBlockRequestContext);
      uint64_t v24 = MEMORY[0x1895F87A8];
      uint64_t v25 = 3221225472LL;
      uint64_t v26 = (uint64_t)__31__NSSQLCore__dropHistoryTables__block_invoke_2;
      __int128 v27 = (void (*)(uint64_t, uint64_t))&unk_189EA9880;
      __int128 v28 = (void (*)(uint64_t))&__block_literal_global_466;
      uint64_t v21 = -[NSSQLBlockRequestContext initWithBlock:context:sqlCore:]( v20,  "initWithBlock:context:sqlCore:",  &v24,  0LL,  v17);
      -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v17, v21, 0LL);
    }

    else
    {
      uint64_t v24 = 0LL;
      uint64_t v25 = (uint64_t)&v24;
      uint64_t v26 = 0x3052000000LL;
      __int128 v27 = __Block_byref_object_copy__22;
      __int128 v28 = __Block_byref_object_dispose__22;
      uint64_t v29 = 0LL;
      uint64_t v18 = -[NSSQLCore schemaValidationConnection]((void *)v16);
      *(void *)(v25 + 40) = v18;
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __31__NSSQLCore__dropHistoryTables__block_invoke_3;
      v23[3] = &unk_189EA77F8;
      v23[4] = &__block_literal_global_466;
      v23[5] = &v24;
      -[NSSQLiteConnection performAndWait:]((uint64_t)v18, (uint64_t)v23);
      _Block_object_dispose(&v24, 8);
    }
  }

  BOOL v19 = 1;
  -[NSSQLCore _disconnectAllConnections]((uint64_t)v17);

  return v19;
}

uint64_t __31__NSSQLCore__dropHistoryTables__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = -[NSSQLiteConnection canConnect](a2);
  if ((_DWORD)result)
  {
    -[NSSQLiteConnection connect](a2);
    return -[NSSQLiteConnection _dropKnownHistoryTrackingTables](a2);
  }

  return result;
}

uint64_t __31__NSSQLCore__dropHistoryTables__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __31__NSSQLCore__dropHistoryTables__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void __31__NSSQLCore__dropHistoryTables__block_invoke_4(uint64_t a1)
{
}

- (unint64_t)entityIDForEntityDescription:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  model = self->_model;
  if (model) {
    return -[NSKnownKeysMappingStrategy fastIndexForKnownKey:]( -[NSKnownKeysDictionary mapping](model->_entitiesByName, "mapping"),  "fastIndexForKnownKey:",  [a3 name])
  }
         + 1;
  else {
    return 0LL;
  }
}

- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return (id)NSArray_EmptyArray;
  }
  id v3 = -[NSSQLModel entityNamed:](self->_model, "entityNamed:", [a3 name]);
  if (!v3) {
    return (id)NSArray_EmptyArray;
  }
  id v4 = v3;
  uint64_t v5 = (void *)[v3 foreignKeyColumns];
  uint64_t v6 = (void *)[v4 foreignEntityKeyColumns];
  uint64_t v7 = (void *)[v4 foreignOrderKeyColumns];
  uint64_t v8 = (void *)[v4 attributeColumns];
  uint64_t v9 = (void *)[v4 toManyRelationships];
  uint64_t v10 = (void *)[v4 manyToManyRelationships];
  uint64_t v50 = [v8 count];
  uint64_t v11 = [v7 count];
  uint64_t v12 = [v6 count];
  uint64_t v13 = [v5 count];
  uint64_t v14 = [v9 count];
  uint64_t v15 = [v10 count];
  uint64_t v16 = (void *)[MEMORY[0x189603FA8] arrayWithCapacity:v11 + v50 + v12 + v13 + v14 + v15];
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  uint64_t v17 = [v5 countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v72;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v72 != v19) {
          objc_enumerationMutation(v5);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v71 + 1) + 8 * v20) toOneRelationship];
        if (v21)
        {
          char v22 = (void *)[v21 propertyDescription];
          if (v22) {
            objc_msgSend(v16, "addObject:", objc_msgSend(v22, "name"));
          }
        }

        ++v20;
      }

      while (v18 != v20);
      uint64_t v18 = [v5 countByEnumeratingWithState:&v71 objects:v80 count:16];
    }

    while (v18);
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  uint64_t v23 = [v6 countByEnumeratingWithState:&v67 objects:v79 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v68;
    do
    {
      uint64_t v26 = 0LL;
      do
      {
        if (*(void *)v68 != v25) {
          objc_enumerationMutation(v6);
        }
        __int128 v27 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * v26) toOneRelationship];
        if (v27)
        {
          __int128 v28 = (void *)[v27 propertyDescription];
          if (v28) {
            objc_msgSend(v16, "addObject:", objc_msgSend(v28, "name"));
          }
        }

        ++v26;
      }

      while (v24 != v26);
      uint64_t v24 = [v6 countByEnumeratingWithState:&v67 objects:v79 count:16];
    }

    while (v24);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  uint64_t v29 = [v7 countByEnumeratingWithState:&v63 objects:v78 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v64;
    do
    {
      uint64_t v32 = 0LL;
      do
      {
        if (*(void *)v64 != v31) {
          objc_enumerationMutation(v7);
        }
        __int128 v33 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * v32) toOneRelationship];
        if (v33)
        {
          uint64_t v34 = (void *)[v33 propertyDescription];
          if (v34) {
            objc_msgSend(v16, "addObject:", objc_msgSend(v34, "name"));
          }
        }

        ++v32;
      }

      while (v30 != v32);
      uint64_t v30 = [v7 countByEnumeratingWithState:&v63 objects:v78 count:16];
    }

    while (v30);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  uint64_t v35 = [v8 countByEnumeratingWithState:&v59 objects:v77 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v60;
    do
    {
      uint64_t v38 = 0LL;
      do
      {
        if (*(void *)v60 != v37) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( v16,  "addObject:",  objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * v38++), "attributeDescription"), "name"));
      }

      while (v36 != v38);
      uint64_t v36 = [v8 countByEnumeratingWithState:&v59 objects:v77 count:16];
    }

    while (v36);
  }

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  uint64_t v39 = [v9 countByEnumeratingWithState:&v55 objects:v76 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v56;
    do
    {
      uint64_t v42 = 0LL;
      do
      {
        if (*(void *)v56 != v41) {
          objc_enumerationMutation(v9);
        }
        char v43 = *(void **)(*((void *)&v55 + 1) + 8 * v42);
        if (v43) {
          char v43 = (void *)[v43 propertyDescription];
        }
        objc_msgSend(v16, "addObject:", objc_msgSend(v43, "name"));
        ++v42;
      }

      while (v40 != v42);
      uint64_t v40 = [v9 countByEnumeratingWithState:&v55 objects:v76 count:16];
    }

    while (v40);
  }

  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  uint64_t v44 = [v10 countByEnumeratingWithState:&v51 objects:v75 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v52;
    do
    {
      uint64_t v47 = 0LL;
      do
      {
        if (*(void *)v52 != v46) {
          objc_enumerationMutation(v10);
        }
        __int128 v48 = *(void **)(*((void *)&v51 + 1) + 8 * v47);
        if (v48) {
          __int128 v48 = (void *)[v48 propertyDescription];
        }
        objc_msgSend(v16, "addObject:", objc_msgSend(v48, "name"));
        ++v47;
      }

      while (v45 != v47);
      uint64_t v45 = [v10 countByEnumeratingWithState:&v51 objects:v75 count:16];
    }

    while (v45);
  }

  return (id)[v16 allObjects];
}

@end