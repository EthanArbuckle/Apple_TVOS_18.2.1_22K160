@interface NSStoreMigrationPolicy
+ (id)destinationURLForMigrationSourceURL:(id)a3 createDocumentReplacementDirectory:(BOOL)a4 error:(id *)a5;
+ (id)migrationStoreOptionsFromStoreOptions:(id)a3;
+ (int)migrationDebugLevel;
+ (void)setMigrationDebugLevel:(int)a3;
- (NSManagedObjectModel)_sourceModelForVersionHashes:(uint64_t)a3 withMetadata:(void *)a4 inBundles:(void *)a5 outPaths:;
- (id)createMigrationManagerForSourceModel:(id)a3 destinationModel:(id)a4 error:(id *)a5;
- (id)migrateStoreAtURL:(id)a3 withManager:(id)a4 metadata:(id)a5 options:(id)a6 error:(id *)a7;
- (id)sourceModelForStoreAtURL:(id)a3 metadata:(id)a4 error:(id *)a5;
- (uint64_t)_gatherDataAndPerformMigration:(uint64_t)a1;
- (uint64_t)setMigrationManager:(uint64_t)a1;
- (uint64_t)setSourceMetadata:(uint64_t)result;
- (void)dealloc;
- (void)resourceBundles;
- (void)setPersistentStoreCoordinator:(void *)a3 sourceURL:(void *)a4 configuration:(void *)a5 metadata:(void *)a6 options:;
@end

@implementation NSStoreMigrationPolicy

+ (id)migrationStoreOptionsFromStoreOptions:(id)a3
{
  v7[2] = *MEMORY[0x1895F89C0];
  v3 = (void *)[a3 mutableCopy];
  objc_msgSend( v3,  "removeObjectsForKeys:",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  @"NSPersistentStoreUbiquitousContentURLKey",  @"NSPersistentStoreUbiquitousContentNameKey",  @"NSMigratePersistentStoresAutomaticallyOption",  @"NSInferMappingModelAutomaticallyOption",  0));
  if (objc_msgSend( (id)objc_msgSend(v3, "valueForKey:", @"NSPersistentHistoryTrackingKey"),  "isNSDictionary"))
  {
    v4 = (void *)objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithDictionary:",  objc_msgSend(v3, "valueForKey:", @"NSPersistentHistoryTrackingKey"));
    v7[0] = @"NSPersistentHistoryTrackingEntitiesToExclude";
    v7[1] = @"NSPersistentHistoryTrackingEntitiesToInclude";
    objc_msgSend(v4, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v7, 2));
    [v3 setValue:v4 forKey:@"NSPersistentHistoryTrackingKey"];
  }

  [v3 removeObjectForKey:@"NSPersistentStoreRemoveStoreOnCleanup"];
  v6[0] = @"NSPersistentCloudKitContainerOptionsKey";
  v6[1] = @"NSPersistentStoreMirroringOptionsKey";
  objc_msgSend(v3, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v6, 2));
  return v3;
}

- (void)dealloc
{
  self->_coordinator = 0LL;
  self->_sourceURL = 0LL;

  self->_sourceConfiguration = 0LL;
  self->_destinationConfiguration = 0LL;

  self->_sourceMetadata = 0LL;
  self->_sourceOptions = 0LL;

  self->_sourceModel = 0LL;
  self->_mappingModel = 0LL;

  self->_destinationURL = 0LL;
  self->_destinationType = 0LL;

  self->_destinationOptions = 0LL;
  self->_migrationManager = 0LL;

  self->_resourceBundles = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSStoreMigrationPolicy;
  -[NSStoreMigrationPolicy dealloc](&v3, sel_dealloc);
}

- (NSManagedObjectModel)_sourceModelForVersionHashes:(uint64_t)a3 withMetadata:(void *)a4 inBundles:(void *)a5 outPaths:
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (result)
  {
    context = (void *)MEMORY[0x186E3E5D8]();
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    uint64_t v40 = [a4 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v40)
    {
      id obj = a4;
      v8 = 0LL;
      uint64_t v39 = *(void *)v48;
LABEL_4:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v48 != v39) {
          objc_enumerationMutation(obj);
        }
        if (v8) {
          break;
        }
        v10 = (void *)objc_msgSend( (id)objc_msgSend( *(id *)(*((void *)&v47 + 1) + 8 * v9),  "pathsForResourcesOfType:inDirectory:",  @"mom",  0),  "arrayByAddingObjectsFromArray:",  objc_msgSend( *(id *)(*((void *)&v47 + 1) + 8 * v9),  "pathsForResourcesOfType:inDirectory:",  @"momd",  0));
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v44;
          while (2)
          {
            for (uint64_t i = 0LL; i != v12; ++i)
            {
              if (*(void *)v44 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              if (([a5 containsObject:v15] & 1) == 0)
              {
                [a5 addObject:v15];
                char v42 = 0;
                if (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:isDirectory:",  v15,  &v42)) {
                  BOOL v16 = v42 == 0;
                }
                else {
                  BOOL v16 = 1;
                }
                if (v16)
                {
                  v8 = -[NSManagedObjectModel initWithContentsOfURL:]( [NSManagedObjectModel alloc],  "initWithContentsOfURL:",  [MEMORY[0x189604030] fileURLWithPath:v15 isDirectory:0]);
                }

                else
                {
                  v17 = -[NSManagedObjectModelBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModelBundle),  "initWithPath:",  v15);
                  v8 = -[NSManagedObjectModelBundle _modelForVersionHashes:](v17, "_modelForVersionHashes:", a2);
                  v18 = v8;
                }

                if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
                  _NSCoreDataLog( 9LL,  (uint64_t)@"_sourceModelForVersionHashes: testing model at path '%@'",  v19,  v20,  v21,  v22,  v23,  v24,  v15);
                }
                BOOL v25 = -[NSManagedObjectModel isConfiguration:compatibleWithStoreMetadata:]( v8,  "isConfiguration:compatibleWithStoreMetadata:",  0LL,  a3);
                int v26 = +[_PFPersistentHistoryModel _hasTombstonesInUserInfo:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v8);
                if (v25)
                {
                  if (v8) {
                    int v27 = v26;
                  }
                  else {
                    int v27 = 0;
                  }
                  if (v27 == 1) {
                    *(_DWORD *)&v8->_managedObjectModelFlags |= 0x10u;
                  }
                  if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") > 1) {
LABEL_37:
                  }
                    _NSCoreDataLog( 9LL,  (uint64_t)@"  \t Choosing model at path '%@'",  v28,  v29,  v30,  v31,  v32,  v33,  v15);
LABEL_38:
                  v34 = v8;
                  goto LABEL_39;
                }

                if (v26)
                {
                  if (v8) {
                    -[NSManagedObjectModel _traverseTombstonesAndMark:]((uint64_t)v8, 1LL);
                  }
                  if (-[NSManagedObjectModel isConfiguration:compatibleWithStoreMetadata:]( v8,  "isConfiguration:compatibleWithStoreMetadata:",  0LL,  a3))
                  {
                    if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
                      goto LABEL_37;
                    }
                    goto LABEL_38;
                  }
                }
              }
            }

            uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        v8 = 0LL;
LABEL_39:
        if (++v9 == v40)
        {
          uint64_t v35 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
          uint64_t v40 = v35;
          if (v35) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    else
    {
      v8 = 0LL;
    }

    v36 = v8;
    objc_autoreleasePoolPop(context);
    return v8;
  }

  return result;
}

- (id)sourceModelForStoreAtURL:(id)a3 metadata:(id)a4 error:(id *)a5
{
  v101[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = objc_msgSend(a4, "objectForKey:");
  if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
    _NSCoreDataLog( 9LL,  (uint64_t)@"sourceModelForStoreAtURL: Testing models searched via resourceBundles",  v10,  v11,  v12,  v13,  v14,  v15,  v92);
  }
  BOOL v16 = -[NSStoreMigrationPolicy resourceBundles](self);
  v17 = v16;
  if (v16) {
    id v18 = (id)[v16 mutableCopy];
  }
  else {
    id v18 = (id)[MEMORY[0x189603FA8] array];
  }
  uint64_t v19 = v18;
  uint64_t v20 = (void *)[MEMORY[0x189603FE0] set];
  uint64_t v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]( (NSManagedObjectModel *)self,  v9,  (uint64_t)a4,  v17,  v20);
  if (!v21)
  {
    if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
      _NSCoreDataLog( 9LL,  (uint64_t)@"sourceModelForStoreAtURL: Testing models searched via mainBundle",  v23,  v24,  v25,  v26,  v27,  v28,  v92);
    }
    uint64_t v29 = [MEMORY[0x1896077F8] mainBundle];
    if (!v29
      || (uint64_t v30 = v29,
          [v19 addObject:v29],
          v101[0] = v30,
          (uint64_t v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]( (NSManagedObjectModel *)self,  v9,  (uint64_t)a4,  (void *)[MEMORY[0x189603F18] arrayWithObjects:v101 count:1],  v20)) == 0))
    {
      if (self) {
        id v31 = -[NSDictionary valueForKey:](self->_sourceMetadata, "valueForKey:", @"NSStoreType");
      }
      else {
        id v31 = 0LL;
      }
      if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
        _NSCoreDataLog( 9LL,  (uint64_t)@"sourceModelForStoreAtURL: Testing model cached in database file",  v32,  v33,  v34,  v35,  v36,  v37,  v92);
      }
      v38 = self ? self->_sourceOptions : 0LL;
      uint64_t v39 = +[NSSQLCore cachedModelForPersistentStoreWithURL:options:error:]( &OBJC_CLASS___NSSQLCore,  "cachedModelForPersistentStoreWithURL:options:error:",  a3,  v38,  0LL);
      if (v39)
      {
        uint64_t v21 = v39;
        if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 1)
        {
          uint64_t v40 = [a3 path];
          _NSCoreDataLog( 9LL,  (uint64_t)@"  \t Choosing model from cache table in db at '%@'",  v41,  v42,  v43,  v44,  v45,  v46,  v40);
        }
      }

      else
      {
LABEL_22:
        if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
          _NSCoreDataLog( 9LL,  (uint64_t)@"sourceModelForStoreAtURL: Testing models searched via allBundles",  v47,  v48,  v49,  v50,  v51,  v52,  v92);
        }
        uint64_t v53 = (void *)[MEMORY[0x1896077F8] allBundles];
        [v19 addObjectsFromArray:v53];
        if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
          _NSCoreDataLog( 9LL,  (uint64_t)@"sourceModelForStoreAtURL: allBundles is %@",  v54,  v55,  v56,  v57,  v58,  v59,  (uint64_t)v53);
        }
        uint64_t v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]( (NSManagedObjectModel *)self,  v9,  (uint64_t)a4,  v53,  v20);
        if (!v21)
        {
          if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
            _NSCoreDataLog( 9LL,  (uint64_t)@"sourceModelForStoreAtURL: Testing models searched via allFrameworks",  v60,  v61,  v62,  v63,  v64,  v65,  v92);
          }
          v66 = (void *)[MEMORY[0x1896077F8] allFrameworks];
          if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
            _NSCoreDataLog( 9LL,  (uint64_t)@"sourceModelForStoreAtURL: allFrameworks is %@",  v67,  v68,  v69,  v70,  v71,  v72,  (uint64_t)v66);
          }
          [v19 addObjectsFromArray:v66];
          uint64_t v21 = -[NSStoreMigrationPolicy _sourceModelForVersionHashes:withMetadata:inBundles:outPaths:]( (NSManagedObjectModel *)self,  v9,  (uint64_t)a4,  v66,  v20);
          if (!v21)
          {
            if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 2) {
              _NSCoreDataLog( 9LL,  (uint64_t)@"Last ditch review of models with skewed hashing",  v73,  v74,  v75,  v76,  v77,  v78,  v92);
            }
            __int128 v98 = 0u;
            __int128 v99 = 0u;
            __int128 v96 = 0u;
            __int128 v97 = 0u;
            uint64_t v79 = [v20 countByEnumeratingWithState:&v96 objects:v100 count:16];
            if (v79)
            {
              uint64_t v80 = v79;
              id v93 = a3;
              v94 = a5;
              uint64_t v81 = *(void *)v97;
              unint64_t v82 = 0x189607000uLL;
              while (2)
              {
                for (uint64_t i = 0LL; i != v80; ++i)
                {
                  if (*(void *)v97 != v81) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v84 = *(void *)(*((void *)&v96 + 1) + 8 * i);
                  if (objc_msgSend( (id)objc_msgSend(*(id *)(v82 + 2216), "defaultManager"),  "fileExistsAtPath:isDirectory:",  v84,  &v95)) {
                    BOOL v85 = v95 == 0;
                  }
                  else {
                    BOOL v85 = 1;
                  }
                  if (v85)
                  {
                    uint64_t v21 = -[NSManagedObjectModel initWithContentsOfURL:]( [NSManagedObjectModel alloc],  "initWithContentsOfURL:",  [MEMORY[0x189604030] fileURLWithPath:v84 isDirectory:0]);
                  }

                  else
                  {
                    uint64_t v86 = v81;
                    unint64_t v87 = v82;
                    v88 = -[NSManagedObjectModelBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModelBundle),  "initWithPath:",  v84);
                    uint64_t v21 = -[NSManagedObjectModelBundle _modelForVersionHashes:inStyle:]( v88,  "_modelForVersionHashes:inStyle:",  v9,  1LL);
                    v89 = v21;

                    unint64_t v82 = v87;
                    uint64_t v81 = v86;
                  }

                  if (-[NSManagedObjectModel _isConfiguration:inStyle:compatibleWithStoreMetadata:]( (uint64_t)v21,  0LL,  1LL,  a4))
                  {
                    v90 = v21;
                    self->_workingWithSkewedSource = 1LL;
                    v91 = (void *)-[NSDictionary mutableCopy](self->_sourceMetadata, "mutableCopy");
                    objc_msgSend( v91,  "setValue:forKey:",  -[NSManagedObjectModel entityVersionHashesByName](v21, "entityVersionHashesByName"),  @"NSStoreModelVersionHashes");
                    -[NSStoreMigrationPolicy setSourceMetadata:]((uint64_t)self, v91);

                    goto LABEL_50;
                  }
                }

                uint64_t v80 = [v20 countByEnumeratingWithState:&v96 objects:v100 count:16];
                if (v80) {
                  continue;
                }
                break;
              }

              uint64_t v21 = 0LL;
LABEL_50:
              a3 = v93;
              a5 = v94;
            }

            else
            {
              uint64_t v21 = 0LL;
            }

            if (a5 && !v21) {
              *a5 = (id)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134130,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Can't find model for source store",  @"reason",  a3,  @"URL",  a4,  @"metadata",  0));
            }
          }
        }
      }
    }
  }

  return v21;
}

- (void)resourceBundles
{
  if (result)
  {
    v1 = result;
    result = (void *)result[13];
    if (!result)
    {
      uint64_t v2 = [(id)v1[4] objectForKey:@"NSPersistentStoreCoordinatorResourceBundlesForMigration"];
      uint64_t v3 = MEMORY[0x189604A58];
      if (v2) {
        v4 = (void *)v2;
      }
      else {
        v4 = (void *)MEMORY[0x189604A58];
      }
      uint64_t v5 = [(id)v1[4] objectForKey:@"_NSAutomaticMigrationResourceBundlesOption"];
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = v3;
      }
      result = (id)[v4 arrayByAddingObjectsFromArray:v6];
      v1[13] = result;
    }
  }

  return result;
}

- (uint64_t)setSourceMetadata:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = [*(id *)(result + 48) isEqual:a2];
    if ((result & 1) == 0)
    {

      result = a2;
      *(void *)(v3 + 48) = result;
    }
  }

  return result;
}

- (id)createMigrationManagerForSourceModel:(id)a3 destinationModel:(id)a4 error:(id *)a5
{
  v8 = (objc_class *)objc_opt_class();
  if (BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    uint64_t v9 = self ? self->_mappingModel : 0LL;
    if (-[NSMappingModel _isInferredMappingModel]((uint64_t)v9))
    {
      uint64_t v10 = +[NSPersistentStoreCoordinator registeredStoreTypes]( &OBJC_CLASS___NSPersistentStoreCoordinator,  "registeredStoreTypes");
      if (self) {
        id v11 = -[NSDictionary valueForKey:](self->_sourceMetadata, "valueForKey:", @"NSStoreType");
      }
      else {
        id v11 = 0LL;
      }
      id v12 = -[NSDictionary objectForKey:](v10, "objectForKey:", v11);
      if ((id)objc_opt_class() != v12)
      {
        id v12 = (id)[v12 pointerValue];
      }

      if (v12)
      {
        [v12 migrationManagerClass];
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend( (id)objc_msgSend(v12, "migrationManagerClass"),  "_canMigrateWithMappingModel:",  v9)) {
            v8 = (objc_class *)[v12 migrationManagerClass];
          }
        }
      }
    }
  }

  return (id)[[v8 alloc] initWithSourceModel:a3 destinationModel:a4];
}

- (id)migrateStoreAtURL:(id)a3 withManager:(id)a4 metadata:(id)a5 options:(id)a6 error:(id *)a7
{
  if (self)
  {
    id v11 = (unsigned __int8 *)self;
    uint64_t v12 = *((void *)self + 8);
    uint64_t v13 = *((void *)self + 9);
    uint64_t v14 = (void *)[(id)objc_opt_class() migrationStoreOptionsFromStoreOptions:*((void *)self + 4)];
    id v15 = v14;
    if (*((void *)v11 + 14))
    {
      id v15 = (id)[v14 mutableCopy];
      objc_msgSend( v15,  "setValue:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"NSIgnorePersistentStoreVersioningOption");
    }

    if (a4)
    {
      *((_DWORD *)a4 + 24) = *((_DWORD *)a4 + 24) & 0xFFFFFFF7 | (8 * v11[120]);
      BOOL v16 = (void *)*((void *)v11 + 16);
      v17 = (void *)*((void *)a4 + 9);
      if (v17 != v16)
      {

        *((void *)a4 + 9) = 0LL;
        *((void *)a4 + 9) = [v16 copy];
      }

      id v18 = (void *)*((void *)v11 + 17);
      uint64_t v19 = (void *)*((void *)a4 + 10);
      if (v19 != v18)
      {

        *((void *)a4 + 10) = 0LL;
        *((void *)a4 + 10) = [v18 copy];
      }
    }

    if (objc_msgSend( a4,  "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:",  a3,  objc_msgSend(*((id *)v11 + 6), "valueForKey:", @"NSStoreType"),  v15,  *((void *)v11 + 7),  v12,  v13,  objc_msgSend((id)objc_opt_class(), "migrationStoreOptionsFromStoreOptions:", a6),  a7)) {
      return (id)*((void *)v11 + 8);
    }
    else {
      return 0LL;
    }
  }

  return self;
}

+ (int)migrationDebugLevel
{
  return +[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel");
}

+ (void)setMigrationDebugLevel:(int)a3
{
}

- (void)setPersistentStoreCoordinator:(void *)a3 sourceURL:(void *)a4 configuration:(void *)a5 metadata:(void *)a6 options:
{
  if (result)
  {
    id v11 = result;
    uint64_t v12 = (void *)result[1];
    if (v12 != a2)
    {

      result = a2;
      v11[1] = result;
    }

    uint64_t v13 = (void *)v11[2];
    if (v13 != a3)
    {

      result = a3;
      v11[2] = result;
    }

    uint64_t v14 = (void *)v11[3];
    if (v14 != a4)
    {

      result = a4;
      v11[3] = result;
    }

    id v15 = (void *)v11[6];
    if (v15 != a5)
    {

      result = a5;
      v11[6] = result;
    }

    BOOL v16 = (void *)v11[4];
    if (v16 != a6)
    {

      result = a6;
      v11[4] = result;
    }
  }

  return result;
}

- (uint64_t)setMigrationManager:(uint64_t)a1
{
  uint64_t result = [*(id *)(a1 + 96) isEqual:a2];
  if ((result & 1) == 0)
  {

    uint64_t result = a2;
    *(void *)(a1 + 96) = result;
  }

  return result;
}

+ (id)destinationURLForMigrationSourceURL:(id)a3 createDocumentReplacementDirectory:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v8 = (void *)[a3 path];
  uint64_t v9 = [v8 lastPathComponent];
  if (v6)
  {
    id result = (id)objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "URLForDirectory:inDomain:appropriateForURL:create:error:",  99,  1,  a3,  1,  a5);
    if (result) {
      return (id)[result URLByAppendingPathComponent:v9];
    }
  }

  else
  {
    uint64_t v11 = objc_msgSend( (id)objc_msgSend(v8, "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  objc_msgSend( (id)objc_msgSend(@".", "stringByAppendingString:", v9),  "stringByAppendingString:",  @".migrationdestination_41b5a6b5c6e848c462a8480cd24caef3"));
    return (id)[MEMORY[0x189604030] fileURLWithPath:v11 isDirectory:0];
  }

  return result;
}

- (uint64_t)_gatherDataAndPerformMigration:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v82 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v77 = 0LL;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    uint64_t v72 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Schema migration (policy)",  &v77);
    v4 = (void *)[*(id *)(v2 + 8) managedObjectModel];
    int v5 = 0;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v74;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v74 != v7) {
            objc_enumerationMutation(v4);
          }
          v5 |= -[NSEntityDescription _hasAttributesWithExternalDataReferences](*(void *)(*((void *)&v73 + 1) + 8 * i));
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v73 objects:v78 count:16];
      }

      while (v6);
    }

    uint64_t v9 = (void *)[*(id *)(v2 + 16) path];
    uint64_t v10 = (void *)[v9 pathExtension];
    uint64_t v11 = v10;
    if (v10 && ![v10 isEqualToString:&stru_189EAC2E8]) {
      uint64_t v12 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v9, "stringByDeletingPathExtension"),  "stringByAppendingString:",  @"~"),  "stringByAppendingPathExtension:",  v11);
    }
    else {
      uint64_t v12 = [v9 stringByAppendingString:@"~"];
    }
    uint64_t v13 = v12;
    uint64_t v14 = (void *)[MEMORY[0x1896078A8] defaultManager];
    if ((v5 & 1) != 0)
    {
      id v15 = (void *)objc_msgSend( (id)objc_msgSend( -[NSDictionary valueForKey:]( +[NSPersistentStoreCoordinator registeredStoreTypes]( NSPersistentStoreCoordinator,  "registeredStoreTypes"),  "valueForKey:",  objc_msgSend(*(id *)(v2 + 48), "valueForKey:", @"NSStoreType")),  "pointerValue"),  "_figureOutWhereExternalReferencesEndedUpRelativeTo:",  objc_msgSend(MEMORY[0x189604030], "fileURLWithPath:", v13));
      if (objc_msgSend(v14, "fileExistsAtPath:", objc_msgSend(v15, "path")))
      {
        if (([v14 removeItemAtURL:v15 error:0] & 1) == 0)
        {
          if (!a2) {
            goto LABEL_86;
          }
          uint64_t v25 = (void *)MEMORY[0x189607870];
          uint64_t v26 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Unable to delete file (backup external data references URL)",  @"reason",  v15,  @"URL",  0);
          uint64_t v27 = [v25 errorWithDomain:*MEMORY[0x189607460] code:134110 userInfo:v26];
          goto LABEL_28;
        }
      }
    }

    BOOL v16 = (void *)[(id)v2 sourceModelForStoreAtURL:*(void *)(v2 + 16) metadata:*(void *)(v2 + 48) error:a2];
    [v16 _setIsEditable:0];
    char v17 = [*(id *)(v2 + 40) isEqual:v16];
    id v18 = *(id *)(v2 + 40);
    if ((v17 & 1) == 0)
    {

      id v18 = v16;
      *(void *)(v2 + 40) = v18;
    }

    if (!v18) {
      goto LABEL_86;
    }
    uint64_t v19 = (void *)[*(id *)(v2 + 8) managedObjectModel];
    uint64_t v20 = -[NSStoreMigrationPolicy resourceBundles]((void *)v2);
    uint64_t v21 = (void *)[*(id *)(v2 + 32) objectForKey:@"NSInferMappingModelAutomaticallyOption"];
    uint64_t v22 = v21;
    if (v21
      && [v21 isNSString]
      && [@"force" isEqualToString:v22])
    {
      uint64_t v22 = (void *)[MEMORY[0x189607968] numberWithBool:1];
      [v20 count];
      uint64_t v23 = 0LL;
      char v24 = 1;
    }

    else
    {
      uint64_t v23 = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]( (uint64_t)&OBJC_CLASS___NSMappingModel,  v20,  v18,  v19);
      if (v23) {
        goto LABEL_49;
      }
      if ([v20 count])
      {
        char v24 = 0;
        uint64_t v23 = 0LL;
      }

      else
      {
        uint64_t v23 = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]( (uint64_t)&OBJC_CLASS___NSMappingModel,  0LL,  v18,  v19);
        char v24 = 0;
      }
    }

    if ([v22 BOOLValue]
      && (*(void *)buf = 0LL,
          (uint64_t v23 = +[NSMappingModel inferredMappingModelForSourceModel:destinationModel:error:]( &OBJC_CLASS___NSMappingModel,  "inferredMappingModelForSourceModel:destinationModel:error:",  v18,  v19,  buf)) == 0LL))
    {
      uint64_t v30 = (void *)MEMORY[0x189607870];
      uint64_t v31 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Can't find or automatically infer mapping model for migration",  @"reason",  v18,  @"sourceModel",  v19,  @"destinationModel",  *(void *)buf,  *MEMORY[0x189607798],  0);
      uint64_t v28 = [v30 errorWithDomain:*MEMORY[0x189607460] code:134140 userInfo:v31];
    }

    else
    {
      uint64_t v28 = 0LL;
      if (v23) {
        goto LABEL_49;
      }
    }

    if ([v20 count]) {
      char v29 = v24;
    }
    else {
      char v29 = 1;
    }
    if ((v29 & 1) != 0) {
      uint64_t v23 = 0LL;
    }
    else {
      uint64_t v23 = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]( (uint64_t)&OBJC_CLASS___NSMappingModel,  0LL,  v18,  v19);
    }
    if (!((unint64_t)v23 | v28))
    {
      uint64_t v32 = (void *)MEMORY[0x189607870];
      uint64_t v33 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Can't find mapping model for migration",  @"reason",  v18,  @"sourceModel",  v19,  @"destinationModel",  0);
      uint64_t v28 = [v32 errorWithDomain:*MEMORY[0x189607460] code:134140 userInfo:v33];
      goto LABEL_43;
    }

    if (!v23)
    {
LABEL_43:
      if (v28)
      {
        if (a2)
        {
          uint64_t v23 = 0LL;
          *a2 = v28;
          goto LABEL_49;
        }
      }

      else
      {
        uint64_t v34 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog( 17LL,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSStoreMigrationPolicy.m");
        uint64_t v41 = (os_log_s *)__pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSStoreMigrationPolicy.m";
          __int16 v80 = 1024;
          int v81 = 524;
          _os_log_fault_impl( &dword_186681000,  v41,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
        }
      }

      uint64_t v23 = 0LL;
    }

@end