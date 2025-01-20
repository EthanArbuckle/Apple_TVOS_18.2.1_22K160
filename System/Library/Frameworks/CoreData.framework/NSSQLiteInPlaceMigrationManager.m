@interface NSSQLiteInPlaceMigrationManager
+ (BOOL)_canMigrateWithMappingModel:(id)a3;
- (BOOL)migrateStoreFromURL:(id)a3 type:(id)a4 options:(id)a5 withMappingModel:(id)a6 toDestinationURL:(id)a7 destinationType:(id)a8 destinationOptions:(id)a9 error:(id *)a10;
- (void)dealloc;
@end

@implementation NSSQLiteInPlaceMigrationManager

+ (BOOL)_canMigrateWithMappingModel:(id)a3
{
  return -[NSMappingModel _isInferredMappingModel]((uint64_t)a3);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSSQLiteInPlaceMigrationManager;
  -[NSMigrationManager dealloc](&v2, sel_dealloc);
}

- (BOOL)migrateStoreFromURL:(id)a3 type:(id)a4 options:(id)a5 withMappingModel:(id)a6 toDestinationURL:(id)a7 destinationType:(id)a8 destinationOptions:(id)a9 error:(id *)a10
{
  v90[1] = *MEMORY[0x1895F89C0];
  if (([a3 isEqual:a7] & 1) == 0
    && [a7 isFileURL]
    && !stat((const char *)objc_msgSend((id)objc_msgSend(a7, "path"), "fileSystemRepresentation"), &v80)
    && v80.st_size >= 1)
  {
    if (a10)
    {
      v15 = (void *)MEMORY[0x189607870];
      uint64_t v89 = *MEMORY[0x1896074F8];
      v90[0] = [a7 path];
      uint64_t v16 = [MEMORY[0x189603F68] dictionaryWithObjects:v90 forKeys:&v89 count:1];
      unsigned __int8 v17 = 0;
      *a10 = (id)[v15 errorWithDomain:*MEMORY[0x189607460] code:516 userInfo:v16];
    }

    else
    {
      unsigned __int8 v17 = 0;
    }

    return v17 & 1;
  }

  id v74 = objc_alloc_init(MEMORY[0x1896077E8]);
  v76 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  -[NSMigrationManager sourceModel](self, "sourceModel"));
  -[NSPersistentStoreCoordinator _setIsMigrating:]((unint64_t)v76, 1);
  int v18 = [a3 isEqual:a7];
  id v79 = 0LL;
  *(void *)&v80.st_dev = 0LL;
  id v19 = (id)[a9 mutableCopy];
  uint64_t v20 = MEMORY[0x189604A88];
  [v19 setObject:MEMORY[0x189604A88] forKey:@"NSPersistentStoreForceDestroyOption"];
  id v73 = v19;
  [v19 setObject:v20 forKey:@"NSPersistentStoreUnlinkDestroyOption"];
  id v21 = a3;
  if ((v18 & 1) == 0)
  {
    id v21 = a7;
    if (!-[NSPersistentStoreCoordinator replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:]( v76,  "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:",  a7,  a9,  a3,  a5,  a4,  &v80))
    {
      v27 = 0LL;
      v28 = 0LL;
      char v22 = 0;
      unsigned __int8 v17 = 0;
LABEL_19:
      double v24 = 0.0;
LABEL_20:
      int v29 = 1;
LABEL_21:
      id v30 = *(id *)&v80.st_dev;

      -[NSPersistentStoreCoordinator _removeAllPersistentStores:](v76, "_removeAllPersistentStores:", 0LL);
      if ((v22 & 1) != 0)
      {
        if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 1)
        {
          [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
          _NSCoreDataLog( 4LL,  (uint64_t)@"(migration) in-place migration completed successfully in %2.2f seconds",  v32,  v33,  v34,  v35,  v36,  v37,  COERCE__INT64(v31 - v24));
        }
      }

      else if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") < 1)
      {
        if (([a3 isEqual:a7] & 1) == 0)
        {
          -[NSPersistentStoreCoordinator _destroyPersistentStoreAtURL:withType:options:error:]( v76,  "_destroyPersistentStoreAtURL:withType:options:error:",  a7,  @"SQLite",  v73,  0LL);
          v44 = (void *)[MEMORY[0x1896078A8] defaultManager];
          objc_msgSend(v44, "removeItemAtPath:error:", objc_msgSend(a7, "path"), 0);
          objc_msgSend( v44,  "removeItemAtPath:error:",  objc_msgSend((id)objc_msgSend(a7, "path"), "stringByAppendingString:", @"-shm"),  0);
          objc_msgSend( v44,  "removeItemAtPath:error:",  objc_msgSend((id)objc_msgSend(a7, "path"), "stringByAppendingString:", @"-journal"),  0);
          objc_msgSend( v44,  "removeItemAtPath:error:",  objc_msgSend((id)objc_msgSend(a7, "path"), "stringByAppendingString:", @"-wal"),  0);
        }
      }

      else
      {
        if (v79) {
          [v79 description];
        }
        _NSCoreDataLog( 4LL,  (uint64_t)@"(migration) leaving incompletely migrated store on disk after in-place migration error. (%@, %@)",  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)a7);
      }

      [v74 drain];
      id v48 = 0LL;
      id v49 = *(id *)&v80.st_dev;
      if (a10 && *(void *)&v80.st_dev) {
        *a10 = *(id *)&v80.st_dev;
      }
      if ((v29 | 2) == 2) {
        unsigned __int8 v17 = v22;
      }
      return v17 & 1;
    }
  }

  char v22 = v18 ^ 1;
  if (![@"SQLite" isEqualToString:a4]
    || ([@"SQLite" isEqualToString:a8] & 1) == 0)
  {

    v69 = (void *)MEMORY[0x189603F70];
    uint64_t v70 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  -[NSMigrationManager sourceModel](self, "sourceModel"),  @"sourceModel",  -[NSMigrationManager destinationModel](self, "destinationModel"),  @"destinationModel",  a6,  @"mappingModel",  0);
    objc_exception_throw((id)[v69 exceptionWithName:*MEMORY[0x189603A60] reason:@"NSSQLiteInPlaceMigrationManager requires that the source and destination stores to be NSSQLiteStoreType" userInfo:v70]);
    goto LABEL_75;
  }

  if ((-[NSMappingModel _isInferredMappingModel]((uint64_t)a6) & 1) == 0)
  {
    if (v18)
    {
      v25 = (void *)MEMORY[0x189607870];
      v87 = @"sourceStore";
      id v88 = a3;
      uint64_t v26 = [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
      v27 = 0LL;
      v28 = 0LL;
      char v22 = 0;
      unsigned __int8 v17 = 0;
      *(void *)&v80.st_dev = [v25 errorWithDomain:*MEMORY[0x189607460] code:134182 userInfo:v26];
    }

    else
    {
      v78.receiver = self;
      v78.super_class = (Class)&OBJC_CLASS___NSSQLiteInPlaceMigrationManager;
      char v22 = 1;
      unsigned __int8 v17 = -[NSMigrationManager migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:]( &v78,  sel_migrateStoreFromURL_type_options_withMappingModel_toDestinationURL_destinationType_destinationOptions_error_,  v21,  a4,  a5,  a6,  a7,  a8,  a9,  &v80);
      v27 = 0LL;
      v28 = 0LL;
    }

    goto LABEL_19;
  }

  if ((+[NSMigrationManager _performSanityCheckForMapping:fromSourceModel:toDestinationModel:]( (uint64_t)&OBJC_CLASS___NSMigrationManager,  a6,  -[NSMigrationManager sourceModel](self, "sourceModel"),  -[NSMigrationManager destinationModel](self, "destinationModel")) & 1) != 0)
  {
    if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") < 1)
    {
      double v24 = 0.0;
    }

    else
    {
      [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
      double v24 = v23;
    }

    if (a9)
    {
      v45 = (void *)[a9 objectForKey:@"NSSQLitePragmasOption"];
      id v46 = (id)[a9 mutableCopy];
      if (v45)
      {
        id v47 = (id)[v45 mutableCopy];
        objc_msgSend(v47, "setObject:forKey:", objc_msgSend(MEMORY[0x189603FE8], "null"), @"journal_mode");
      }

      else
      {
        v85 = @"journal_mode";
        uint64_t v86 = [MEMORY[0x189603FE8] null];
        id v47 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      }

      [v46 setObject:v47 forKey:@"NSSQLitePragmasOption"];
    }

    else
    {
      v83 = @"NSSQLitePragmasOption";
      v81 = @"journal_mode";
      uint64_t v82 = [MEMORY[0x189603FE8] null];
      uint64_t v84 = [MEMORY[0x189603F68] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      id v46 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
    }

    v51 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v76,  "addPersistentStoreWithType:configuration:URL:options:error:",  @"SQLite",  0LL,  v21,  v46,  &v79);

    if (v51)
    {
      v52 = -[NSMigrationManager destinationModel](self, "destinationModel");
      -[NSManagedObjectModel _setIsEditable:](v52, "_setIsEditable:", 0LL);
      v53 = -[NSSQLModel initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSSQLModel),  "initWithManagedObjectModel:",  v52);
      if (v53)
      {
        v27 = v53;
        v28 = -[_NSSQLiteStoreMigrator initWithStore:destinationModel:mappingModel:]( objc_alloc(&OBJC_CLASS____NSSQLiteStoreMigrator),  v51,  v53,  a6);
        objc_msgSend( v28,  "setDestinationConfigurationForCloudKitValidation:",  -[NSMigrationManager destinationConfigurationForCloudKitValidation]( self,  "destinationConfigurationForCloudKitValidation"));
        if (self)
        {
          int v55 = (*(_BYTE *)&self->super._migrationManagerFlags >> 3) & 1;
          if (!v28) {
            goto LABEL_48;
          }
        }

        else
        {
          LOBYTE(v55) = 0;
          if (!v28)
          {
LABEL_48:
            if (self)
            {
              stageLabel = self->super._stageLabel;
              if (!v28)
              {
LABEL_51:
                BOOL v57 = -[_NSSQLiteStoreMigrator performMigration:]((uint64_t)v28, &v79);
                char v58 = v57;
                if (a10) {
                  char v59 = v57;
                }
                else {
                  char v59 = 1;
                }
                if ((v59 & 1) == 0)
                {
                  uint64_t v60 = objc_msgSend((id)objc_msgSend(v79, "userInfo"), "objectForKey:", @"reason");
                  if (v60) {
                    v61 = (const __CFString *)[@"Cannot migrate store in-place: " stringByAppendingString:v60];
                  }
                  else {
                    v61 = @"Cannot migrate store in-place";
                  }
                  v67 = (void *)MEMORY[0x189607870];
                  uint64_t v68 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v61,  @"reason",  v79,  *MEMORY[0x189607798],  a3,  @"sourceURL",  a3,  @"destinationURL",  0);
                  *(void *)&v80.st_dev = [v67 errorWithDomain:*MEMORY[0x189607460] code:134110 userInfo:v68];
                }

                if (self) {
                  *(_DWORD *)&self->super._migrationManagerFlags |= 4u;
                }
                -[_NSSQLiteStoreMigrator _disconnect]((uint64_t)v28);
                int v29 = 0;
                unsigned __int8 v17 = 0;
                char v22 = v58;
                goto LABEL_21;
              }
            }

            else
            {
              stageLabel = 0LL;
              if (!v28) {
                goto LABEL_51;
              }
            }

            objc_setProperty_nonatomic_copy(v28, v54, stageLabel, 232LL);
            goto LABEL_51;
          }
        }

        v28[218] = v55;
        goto LABEL_48;
      }

      if (a10)
      {
        v65 = (void *)MEMORY[0x189607870];
        uint64_t v66 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Invalid destination data model",  @"reason",  0);
        uint64_t v64 = [v65 errorWithDomain:*MEMORY[0x189607460] code:134110 userInfo:v66];
        goto LABEL_61;
      }
    }

    else if (a10)
    {
      v62 = (void *)MEMORY[0x189607870];
      uint64_t v63 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Failed to open the store",  @"reason",  v79,  *MEMORY[0x189607798],  0);
      uint64_t v64 = [v62 errorWithDomain:*MEMORY[0x189607460] code:134110 userInfo:v63];
LABEL_61:
      v27 = 0LL;
      v28 = 0LL;
      unsigned __int8 v17 = 0;
      *(void *)&v80.st_dev = v64;
      goto LABEL_20;
    }

    v27 = 0LL;
    v28 = 0LL;
    unsigned __int8 v17 = 0;
    goto LABEL_20;
  }

  v71 = (void *)MEMORY[0x189603F70];
  uint64_t v72 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  -[NSMigrationManager sourceModel](self, "sourceModel"),  @"sourceModel",  -[NSMigrationManager destinationModel](self, "destinationModel"),  @"destinationModel",  a6,  @"mappingModel",  0);
  objc_exception_throw((id)[v71 exceptionWithName:*MEMORY[0x189603A60] reason:@"Mismatch between mapping and source/destination models" userInfo:v72]);
LABEL_75:
  __break(1u);
  return result;
}

@end