@interface NSMigrationManager
+ (BOOL)_canMigrateWithMappingModel:(id)a3;
+ (int)migrationDebugLevel;
+ (uint64_t)_performSanityCheckForMapping:(void *)a3 fromSourceModel:(void *)a4 toDestinationModel:;
+ (void)setMigrationDebugLevel:(int)a3;
- (BOOL)migrateStoreFromURL:(NSURL *)sourceURL type:(NSString *)sStoreType options:(NSDictionary *)sOptions withMappingModel:(NSMappingModel *)mappings toDestinationURL:(NSURL *)dURL destinationType:(NSString *)dStoreType destinationOptions:(NSDictionary *)dOptions error:(NSError *)error;
- (BOOL)usesStoreSpecificMigrationManager;
- (NSArray)destinationInstancesForEntityMappingNamed:(NSString *)mappingName sourceInstances:(NSArray *)sourceInstances;
- (NSArray)sourceInstancesForEntityMappingNamed:(NSString *)mappingName destinationInstances:(NSArray *)destinationInstances;
- (NSDictionary)userInfo;
- (NSEntityDescription)destinationEntityForEntityMapping:(NSEntityMapping *)mEntity;
- (NSEntityDescription)sourceEntityForEntityMapping:(NSEntityMapping *)mEntity;
- (NSEntityMapping)currentEntityMapping;
- (NSManagedObjectContext)destinationContext;
- (NSManagedObjectContext)sourceContext;
- (NSManagedObjectModel)destinationModel;
- (NSManagedObjectModel)sourceModel;
- (NSMappingModel)mappingModel;
- (NSMigrationManager)initWithSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel;
- (NSString)destinationConfigurationForCloudKitValidation;
- (float)migrationProgress;
- (id)currentPropertyMapping;
- (id)destinationInstancesForSourceRelationshipNamed:(id)a3 sourceInstances:(id)a4;
- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4;
- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4 includesSubentities:(BOOL)a5;
- (uint64_t)_validateAllObjectsAfterMigration:(void *)a1;
- (void)_doCleanupOnFailure:(id *)a1;
- (void)associateSourceInstance:(NSManagedObject *)sourceInstance withDestinationInstance:(NSManagedObject *)destinationInstance forEntityMapping:(NSEntityMapping *)entityMapping;
- (void)cancelMigrationWithError:(NSError *)error;
- (void)dealloc;
- (void)reset;
- (void)setDestinationConfigurationForCloudKitValidation:(id)a3;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setUsesStoreSpecificMigrationManager:(BOOL)usesStoreSpecificMigrationManager;
@end

@implementation NSMigrationManager

- (NSMigrationManager)initWithSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSMigrationManager;
  v6 = -[NSMigrationManager init](&v14, sel_init);
  v7 = v6;
  if (!v6) {
    return v7;
  }
  if (sourceModel && destinationModel)
  {
    v8 = (NSManagedObjectModel *)-[NSManagedObjectModel copy](sourceModel, "copy");
    v7->_sourceModel = v8;
    if ((*(_BYTE *)&sourceModel->_managedObjectModelFlags & 0x10) != 0)
    {
      if (v8)
      {
        *(_DWORD *)&v8->_managedObjectModelFlags |= 0x10u;
        v8 = v7->_sourceModel;
      }
    }

    v7->_sourceEntitiesByVersionHash = (NSDictionary *)-[NSManagedObjectModel _entitiesByVersionHash](v8);
    -[NSManagedObjectModel _stripForMigration](v7->_sourceModel, "_stripForMigration");
    v9 = (NSManagedObjectModel *)-[NSManagedObjectModel copy](destinationModel, "copy");
    v7->_destinationModel = v9;
    v7->_destinationEntitiesByVersionHash = (NSDictionary *)-[NSManagedObjectModel _entitiesByVersionHash](v9);
    -[NSManagedObjectModel _stripForMigration](v7->_destinationModel, "_stripForMigration");
    v7->_migrationManagerFlags = (_migrationManagerFlags)(*(_DWORD *)&v7->_migrationManagerFlags & 0xFFFFFFFC | (2 * BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88)));
    v7->_destinationConfigurationForCloudKitValidation = 0LL;
    return v7;
  }

  if (sourceModel) {
    v11 = @"Cannot create an NSMigrationManager with a nil destination model";
  }
  else {
    v11 = @"Cannot create an NSMigrationManager with a nil source model";
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v11 userInfo:0]);
  -[NSMigrationManager dealloc](v12, v13);
  return result;
}

- (void)dealloc
{
  self->_sourceModel = 0LL;
  self->_sourceEntitiesByVersionHash = 0LL;

  self->_destinationModel = 0LL;
  self->_destinationEntitiesByVersionHash = 0LL;

  self->_userInfo = 0LL;
  self->_destinationConfigurationForCloudKitValidation = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMigrationManager;
  -[NSMigrationManager dealloc](&v3, sel_dealloc);
}

- (void)_doCleanupOnFailure:(id *)a1
{
  if (a1)
  {

    a1[6] = 0LL;
    a1[7] = 0LL;

    a1[8] = 0LL;
    a1[5] = 0LL;

    a1[13] = 0LL;
  }

+ (BOOL)_canMigrateWithMappingModel:(id)a3
{
  return 0;
}

- (BOOL)migrateStoreFromURL:(NSURL *)sourceURL type:(NSString *)sStoreType options:(NSDictionary *)sOptions withMappingModel:(NSMappingModel *)mappings toDestinationURL:(NSURL *)dURL destinationType:(NSString *)dStoreType destinationOptions:(NSDictionary *)dOptions error:(NSError *)error
{
  uint64_t v129 = *MEMORY[0x1895F89C0];
  uint64_t v104 = 0LL;
  v97 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)@"CoreData: Schema migration (manager)",  &v104);
  v103 = self;
  uint64_t v16 = objc_opt_class();
  if (v16 == objc_opt_class()
    && -[NSMigrationManager usesStoreSpecificMigrationManager](self, "usesStoreSpecificMigrationManager")
    && -[NSString isEqualToString:](sStoreType, "isEqualToString:", dStoreType))
  {
    id v17 = -[NSDictionary objectForKey:]( +[NSPersistentStoreCoordinator registeredStoreTypes]( &OBJC_CLASS___NSPersistentStoreCoordinator,  "registeredStoreTypes"),  "objectForKey:",  sStoreType);
    if ((id)objc_opt_class() != v17)
    {
      id v17 = (id)[v17 pointerValue];
    }

    if (v17)
    {
      v18 = (objc_class *)[v17 migrationManagerClass];
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        char v19 = -[objc_class _canMigrateWithMappingModel:](v18, "_canMigrateWithMappingModel:", mappings);
        if (v18) {
          char v20 = v19;
        }
        else {
          char v20 = 0;
        }
        if ((v20 & 1) == 0) {
          goto LABEL_21;
        }
      }

      else if (!v18)
      {
        goto LABEL_21;
      }

      if (v18 != (objc_class *)objc_opt_class())
      {
        v21 = (void *)objc_msgSend( [v18 alloc],  "initWithSourceModel:destinationModel:",  -[NSMigrationManager sourceModel](self, "sourceModel"),  -[NSMigrationManager destinationModel](self, "destinationModel"));
        objc_msgSend( v21,  "setDestinationConfigurationForCloudKitValidation:",  -[NSMigrationManager destinationConfigurationForCloudKitValidation]( self,  "destinationConfigurationForCloudKitValidation"));
        v22 = -[NSMigrationManager sourceModel](self, "sourceModel");
        if (v22)
        {
          if ((*(_BYTE *)&v22->_managedObjectModelFlags & 0x10) != 0)
          {
            uint64_t v23 = [v21 sourceModel];
            if (v23) {
              *(_DWORD *)(v23 + 64) |= 0x10u;
            }
          }
        }

        char v24 = [v21 migrateStoreFromURL:sourceURL type:sStoreType options:sOptions withMappingModel:mappings toDestinationURL:dURL destinationType:dStoreType destinationOptions:dOptions error:error];

        goto LABEL_146;
      }
    }
  }

- (void)reset
{
}

- (NSMappingModel)mappingModel
{
  return self->_mappingModel;
}

- (NSManagedObjectModel)sourceModel
{
  return self->_sourceModel;
}

- (NSManagedObjectModel)destinationModel
{
  return self->_destinationModel;
}

- (NSManagedObjectContext)sourceContext
{
  return self->_sourceManagedObjectContext;
}

- (NSManagedObjectContext)destinationContext
{
  return self->_destinationManagedObjectContext;
}

- (NSEntityDescription)sourceEntityForEntityMapping:(NSEntityMapping *)mEntity
{
  return (NSEntityDescription *)-[NSDictionary objectForKey:]( self->_sourceEntitiesByVersionHash,  "objectForKey:",  -[NSEntityMapping sourceEntityVersionHash](mEntity, "sourceEntityVersionHash"));
}

- (NSEntityDescription)destinationEntityForEntityMapping:(NSEntityMapping *)mEntity
{
  return (NSEntityDescription *)-[NSDictionary objectForKey:]( self->_destinationEntitiesByVersionHash,  "objectForKey:",  -[NSEntityMapping destinationEntityVersionHash]( mEntity,  "destinationEntityVersionHash"));
}

- (void)associateSourceInstance:(NSManagedObject *)sourceInstance withDestinationInstance:(NSManagedObject *)destinationInstance forEntityMapping:(NSEntityMapping *)entityMapping
{
  if (entityMapping)
  {
    if (self) {
      self = (NSMigrationManager *)self->_migrationContext;
    }
    -[NSMigrationContext associateSourceInstance:withDestinationInstance:forEntityMapping:]( (uint64_t)self,  sourceInstance,  destinationInstance,  entityMapping);
  }

  else
  {
    objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Manager requires an entity mapping for associations"));
    -[NSMigrationManager destinationInstancesForEntityMappingNamed:sourceInstances:](v5, v6, v7, v8);
  }

- (NSArray)destinationInstancesForEntityMappingNamed:(NSString *)mappingName sourceInstances:(NSArray *)sourceInstances
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    sourceInstances = (NSArray *)[MEMORY[0x189603F18] arrayWithObject:sourceInstances];
  }
  v7 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSArray count](sourceInstances, "count"));
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
  if (!mappingName) {
    goto LABEL_7;
  }
  if (!self
    || (id v30 = -[NSDictionary valueForKey:]( -[NSMappingModel entityMappingsByName]( -[NSMigrationManager mappingModel](self, "mappingModel"),  "entityMappingsByName"),  "valueForKey:",  mappingName)) == 0LL)
  {

    CFRelease(Mutable);
    self = (NSMigrationManager *)MEMORY[0x189603F70];
    sourceInstances = (NSArray *)*MEMORY[0x189603A60];
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Can't find mapping for name (%@).", mappingName), 0 reason userInfo]);
LABEL_7:
    id v30 = 0LL;
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( sourceInstances,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    obuint64_t j = sourceInstances;
    uint64_t v29 = *(void *)v36;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * v11);
        if (self) {
          migrationContext = self->_migrationContext;
        }
        else {
          migrationContext = 0LL;
        }
        objc_super v14 = -[NSMigrationContext destinationInstancesForEntityMapping:sourceInstance:]( (id *)&migrationContext->super.isa,  v30,  *(void *)(*((void *)&v35 + 1) + 8 * v11));
        if ((unint64_t)[v14 count] >= 2
          && +[NSMigrationManager migrationDebugLevel](&OBJC_CLASS___NSMigrationManager, "migrationDebugLevel") >= 2)
        {
          _NSCoreDataLog( 4LL,  (uint64_t)@"(migration) got more destinations for source than we expected. (%@, %@, %@)",  v15,  v16,  v17,  v18,  v19,  v20,  v12);
        }

        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        uint64_t v21 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (uint64_t i = 0LL; i != v22; ++i)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v14);
              }
              v25 = *(const void **)(*((void *)&v31 + 1) + 8 * i);
              if (!CFSetContainsValue(Mutable, v25))
              {
                [v7 addObject:v25];
                CFSetAddValue(Mutable, v25);
              }
            }

            uint64_t v22 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }

          while (v22);
        }

        ++v11;
      }

      while (v11 != v10);
      uint64_t v26 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
      uint64_t v10 = v26;
    }

    while (v26);
  }

  CFRelease(Mutable);
  return (NSArray *)v7;
}

- (id)destinationInstancesForSourceRelationshipNamed:(id)a3 sourceInstances:(id)a4
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  id v7 = objc_alloc_init(MEMORY[0x1896077E8]);
  v8 = -[NSMigrationManager currentEntityMapping](self, "currentEntityMapping");
  id v9 = -[NSMigrationManager currentPropertyMapping](self, "currentPropertyMapping");
  uint64_t v10 = -[NSMigrationManager sourceEntityForEntityMapping:](self, "sourceEntityForEntityMapping:", v8);
  uint64_t v11 = -[NSMigrationManager destinationEntityForEntityMapping:](self, "destinationEntityForEntityMapping:", v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    a4 = (id)[MEMORY[0x189603F18] arrayWithObject:a4];
  }
  if (!a3)
  {
    v53 = (void *)MEMORY[0x189603F70];
    uint64_t v54 = *MEMORY[0x189603A60];
    uint64_t v55 = [NSString stringWithFormat:@"Property mapping %@.%@ missing required relationship name argument to destinationInstancesForSourceRelationshipNamed:sourceInstances:", -[NSEntityMapping name](v8, "name"), objc_msgSend(v9, "name")];
    uint64_t v56 = v53;
    uint64_t v57 = v54;
    goto LABEL_54;
  }

  v60 = v7;
  obuint64_t j = a4;
  id v12 = -[NSEntityDescription _relationshipNamed:](v10, (uint64_t)a3);
  if (!v12)
  {
    v58 = (void *)MEMORY[0x189603F70];
    uint64_t v59 = *MEMORY[0x189603A60];
    uint64_t v55 = [NSString stringWithFormat:@"Can't find relationship for name (%@) for entity (%@) in source model.", a3, -[NSEntityDescription name](v10, "name")];
    uint64_t v56 = v58;
    uint64_t v57 = v59;
LABEL_54:
    objc_exception_throw((id)[v56 exceptionWithName:v57 reason:v55 userInfo:0]);
  }

  SEL v13 = v12;
  id v14 = -[NSEntityDescription _relationshipNamed:](v11, [v9 name]);
  uint64_t v15 = [v13 destinationEntity];
  uint64_t v16 = [v14 destinationEntity];
  id v65 = (id)[MEMORY[0x189603FA8] array];
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  uint64_t v17 = -[NSMappingModel entityMappings](-[NSMigrationManager mappingModel](self, "mappingModel"), "entityMappings");
  uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v80,  v87,  16LL);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v81;
    do
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        if (*(void *)v81 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v80 + 1) + 8 * i);
        if (-[NSEntityDescription isKindOfEntity:]( -[NSMigrationManager sourceEntityForEntityMapping:](self, "sourceEntityForEntityMapping:", v22),  "isKindOfEntity:",  v15)
          && -[NSEntityDescription isKindOfEntity:]( -[NSMigrationManager destinationEntityForEntityMapping:](self, "destinationEntityForEntityMapping:", v22),  "isKindOfEntity:",  v16))
        {
          [v65 addObject:v22];
        }
      }

      uint64_t v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v80,  v87,  16LL);
    }

    while (v19);
  }

  uint64_t v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(obj, "count"));
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  uint64_t v63 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v77;
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v77 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v25;
        uint64_t v26 = *(void *)(*((void *)&v76 + 1) + 8 * v25);
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        uint64_t v67 = [v65 countByEnumeratingWithState:&v72 objects:v85 count:16];
        if (v67)
        {
          uint64_t v66 = *(void *)v73;
          do
          {
            uint64_t v27 = 0LL;
            do
            {
              if (*(void *)v73 != v66) {
                objc_enumerationMutation(v65);
              }
              if (self) {
                migrationContext = self->_migrationContext;
              }
              else {
                migrationContext = 0LL;
              }
              uint64_t v29 = self;
              id v30 = -[NSMigrationContext destinationInstancesForEntityMapping:sourceInstance:]( (id *)&migrationContext->super.isa,  *(void **)(*((void *)&v72 + 1) + 8 * v27),  v26);
              if ((unint64_t)[v30 count] >= 2
                && +[NSMigrationManager migrationDebugLevel](&OBJC_CLASS___NSMigrationManager, "migrationDebugLevel") >= 2)
              {
                _NSCoreDataLog( 4LL,  (uint64_t)@"(migration) got more destinations for source than we expected. (%@, %@, %@)",  v31,  v32,  v33,  v34,  v35,  v36,  v26);
              }

              __int128 v70 = 0u;
              __int128 v71 = 0u;
              __int128 v68 = 0u;
              __int128 v69 = 0u;
              uint64_t v37 = [v30 countByEnumeratingWithState:&v68 objects:v84 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v69;
                do
                {
                  for (uint64_t j = 0LL; j != v38; ++j)
                  {
                    if (*(void *)v69 != v39) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v41 = *(const void **)(*((void *)&v68 + 1) + 8 * j);
                    if (!CFSetContainsValue(Mutable, v41))
                    {
                      [v23 addObject:v41];
                      CFSetAddValue(Mutable, v41);
                    }
                  }

                  uint64_t v38 = [v30 countByEnumeratingWithState:&v68 objects:v84 count:16];
                }

                while (v38);
              }

              ++v27;
              self = v29;
            }

            while (v27 != v67);
            uint64_t v42 = [v65 countByEnumeratingWithState:&v72 objects:v85 count:16];
            uint64_t v67 = v42;
          }

          while (v42);
        }

        uint64_t v25 = v64 + 1;
      }

      while (v64 + 1 != v63);
      uint64_t v63 = [obj countByEnumeratingWithState:&v76 objects:v86 count:16];
    }

    while (v63);
  }

  if (+[NSMigrationManager migrationDebugLevel](&OBJC_CLASS___NSMigrationManager, "migrationDebugLevel") >= 2)
  {
    uint64_t v43 = [v23 count];
    if (v43 != [obj count])
    {
      unint64_t v44 = [v23 count];
      if (v44 <= [obj count]) {
        unint64_t v45 = @"fewer";
      }
      else {
        unint64_t v45 = @"more";
      }
      [v23 count];
      [obj count];
      _NSCoreDataLog( 4LL,  (uint64_t)@"(migration) got %@ destinations[%lu] for sources[%lu] than we expected. (%@, %@)",  v46,  v47,  v48,  v49,  v50,  v51,  (uint64_t)v45);
    }
  }

  CFRelease(Mutable);
  return v23;
}

- (NSArray)sourceInstancesForEntityMappingNamed:(NSString *)mappingName destinationInstances:(NSArray *)destinationInstances
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    destinationInstances = (NSArray *)[MEMORY[0x189603F18] arrayWithObject:destinationInstances];
  }
  id v7 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSArray count](destinationInstances, "count"));
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
  if (!mappingName) {
    goto LABEL_7;
  }
  if (!self
    || (id v9 = -[NSDictionary valueForKey:]( -[NSMappingModel entityMappingsByName]( -[NSMigrationManager mappingModel](self, "mappingModel"),  "entityMappingsByName"),  "valueForKey:",  mappingName)) == 0LL)
  {
    CFRelease(Mutable);

    self = (NSMigrationManager *)MEMORY[0x189603F70];
    destinationInstances = (NSArray *)*MEMORY[0x189603A60];
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Can't find mapping for name (%@).", mappingName), 0 reason userInfo]);
LABEL_7:
    id v9 = 0LL;
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  uint64_t v30 = -[NSArray countByEnumeratingWithState:objects:count:]( destinationInstances,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
  if (v30)
  {
    obuint64_t j = destinationInstances;
    uint64_t v29 = *(void *)v36;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * v10);
        if (self) {
          migrationContext = self->_migrationContext;
        }
        else {
          migrationContext = 0LL;
        }
        SEL v13 = -[NSMigrationContext sourceInstancesForEntityMapping:destinationInstance:]( (id *)&migrationContext->super.isa,  v9,  *(void *)(*((void *)&v35 + 1) + 8 * v10));
        id v14 = v13;
        if (v9
          && (unint64_t)[v13 count] >= 2
          && +[NSMigrationManager migrationDebugLevel](&OBJC_CLASS___NSMigrationManager, "migrationDebugLevel") >= 2)
        {
          _NSCoreDataLog( 4LL,  (uint64_t)@"(migration) got more sources for destination than we expected. (%@, %@, %@)",  v15,  v16,  v17,  v18,  v19,  v20,  v11);
        }

        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        uint64_t v21 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (uint64_t i = 0LL; i != v22; ++i)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v14);
              }
              uint64_t v25 = *(const void **)(*((void *)&v31 + 1) + 8 * i);
              if (!CFSetContainsValue(Mutable, v25))
              {
                [v7 addObject:v25];
                CFSetAddValue(Mutable, v25);
              }
            }

            uint64_t v22 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }

          while (v22);
        }

        ++v10;
      }

      while (v10 != v30);
      uint64_t v26 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v40,  16LL);
      uint64_t v30 = v26;
    }

    while (v26);
  }

  CFRelease(Mutable);
  return (NSArray *)v7;
}

- (NSEntityMapping)currentEntityMapping
{
  if (self)
  {
    destinationEntityName = self->_destinationEntityName;
    if (destinationEntityName) {
      return (NSEntityMapping *)destinationEntityName[6].super.isa;
    }
    else {
      return 0LL;
    }
  }

  return self;
}

- (id)currentPropertyMapping
{
  if (self)
  {
    uint64_t v2 = *((void *)self + 8);
    if (v2) {
      return *(id *)(v2 + 64);
    }
    else {
      return 0LL;
    }
  }

  return self;
}

- (float)migrationProgress
{
  unint64_t v3 = -[NSArray count]( -[NSMappingModel entityMappings](-[NSMigrationManager mappingModel](self, "mappingModel"), "entityMappings"),  "count");
  if (!v3) {
    return 0.0;
  }
  double currentStep = 0.0;
  if (self)
  {
    migrationContext = self->_migrationContext;
    if (migrationContext) {
      double currentStep = (double)migrationContext->_currentStep;
    }
  }

  return currentStep / ((double)v3 * 3.0);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  unint64_t v3 = self->_userInfo;
  if (v3 != userInfo)
  {

    self->_userInfo = userInfo;
  }

- (void)cancelMigrationWithError:(NSError *)error
{
  *(_DWORD *)&self->_migrationManagerFlags |= 1u;
  migrationCancellationError = self->_migrationCancellationError;
  if (migrationCancellationError != error)
  {

    self->_migrationCancellationError = error;
  }

- (void)setUsesStoreSpecificMigrationManager:(BOOL)usesStoreSpecificMigrationManager
{
  if (usesStoreSpecificMigrationManager) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_migrationManagerFlags = (_migrationManagerFlags)(*(_DWORD *)&self->_migrationManagerFlags & 0xFFFFFFFD | v3);
}

- (BOOL)usesStoreSpecificMigrationManager
{
  return (*(_BYTE *)&self->_migrationManagerFlags >> 1) & 1;
}

- (NSString)destinationConfigurationForCloudKitValidation
{
  return self->_destinationConfigurationForCloudKitValidation;
}

- (void)setDestinationConfigurationForCloudKitValidation:(id)a3
{
}

+ (int)migrationDebugLevel
{
  return +[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel");
}

+ (void)setMigrationDebugLevel:(int)a3
{
}

- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4 includesSubentities:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = -[NSMigrationManager sourceModel](self, "sourceModel");
  if (v8 && (uint64_t v9 = -[NSMutableDictionary objectForKey:](v8->_entities, "objectForKey:", a3)) != 0)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [MEMORY[0x1896079C8] predicateWithFormat:a4];
    id v12 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
    -[NSFetchRequest setEntity:](v12, "setEntity:", v10);
    -[NSFetchRequest setPredicate:](v12, "setPredicate:", v11);
    -[NSFetchRequest setIncludesSubentities:](v12, "setIncludesSubentities:", v5);
    return v12;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Can't find entity named %@ in source model", a3), 0 reason userInfo]);
    return -[NSMigrationManager fetchRequestForSourceEntityNamed:predicateString:](v14, v15, v16, v17);
  }

- (id)fetchRequestForSourceEntityNamed:(id)a3 predicateString:(id)a4
{
  return -[NSMigrationManager fetchRequestForSourceEntityNamed:predicateString:includesSubentities:]( self,  "fetchRequestForSourceEntityNamed:predicateString:includesSubentities:",  a3,  a4,  0LL);
}

+ (uint64_t)_performSanityCheckForMapping:(void *)a3 fromSourceModel:(void *)a4 toDestinationModel:
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  id v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "entities"), "valueForKey:", @"versionHash");
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "entities"), "valueForKey:", @"versionHash");
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v9 = (void *)objc_msgSend(a2, "entityMappings", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v10) {
    return 1LL;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v19;
LABEL_3:
  uint64_t v13 = 0LL;
  while (1)
  {
    if (*(void *)v19 != v12) {
      objc_enumerationMutation(v9);
    }
    id v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
    int v15 = [v14 sourceEntityVersionHash]
        ? objc_msgSend(v7, "containsObject:", objc_msgSend(v14, "sourceEntityVersionHash"))
        : 1;
    int v16 = [v14 destinationEntityVersionHash]
        ? objc_msgSend(v8, "containsObject:", objc_msgSend(v14, "destinationEntityVersionHash"))
        : 1;
    uint64_t result = 0LL;
    if (!v15 || !v16) {
      return result;
    }
    if (v11 == ++v13)
    {
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        goto LABEL_3;
      }
      return 1LL;
    }
  }

- (uint64_t)_validateAllObjectsAfterMigration:(void *)a1
{
  uint64_t v25 = a2;
  v27[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "destinationContext"), "registeredObjects");
  unint64_t v3 = [v2 count];
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = (char *)&v25 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v3 >= 0x201)
  {
    id v7 = (char *)NSAllocateScannedUncollectable();
    [v2 getObjects:v7];
  }

  else
  {
    bzero((char *)&v25 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v5);
    [v2 getObjects:v7];
    if (!v4)
    {
      char v8 = 1;
      return v8 & 1;
    }
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = *MEMORY[0x189607460];
  uint64_t v26 = @"NSDetailedErrors";
  char v8 = 1;
  do
  {
    uint64_t v12 = *(void **)&v7[8 * v10];
    v27[0] = 0LL;
    if (([v12 validateForUpdate:v27] & 1) == 0)
    {
      if (!v9) {
        uint64_t v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v2, "count"));
      }
      if (v27[0])
      {
        if (objc_msgSend((id)objc_msgSend(v27[0], "domain"), "isEqual:", v11)
          && [v27[0] code] == 1560)
        {
          uint64_t v13 = (void *)[v27[0] userInfo];
          objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(v13, "objectForKey:", v26));
        }

        else
        {
          uint64_t v14 = objc_msgSend((id)objc_msgSend(v27[0], "userInfo"), "objectForKey:", @"NSValidationErrorObject");
          id v15 = v27[0];
          if (v14)
          {
            int v16 = (void *)objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithDictionary:",  objc_msgSend(v27[0], "userInfo"));
            objc_msgSend( v16,  "setObject:forKey:",  objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"NSValidationErrorObject"), "description"),  @"NSValidationErrorObject");
            id v17 = (void *)MEMORY[0x189607870];
            uint64_t v18 = [v27[0] domain];
            id v15 = (id)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, objc_msgSend(v27[0], "code"), v16);
            v27[0] = v15;
          }

          [v9 addObject:v15];
        }
      }

      char v8 = 0;
    }

    ++v10;
  }

  while (v4 != v10);
  if ((v8 & 1) == 0)
  {
    if ([v9 count] == 1)
    {
      if (v25)
      {
        uint64_t v19 = [v9 objectAtIndex:0];
        uint64_t *v25 = v19;
      }
    }

    else
    {
      unint64_t v20 = [v9 count];
      if (v25 && v20 >= 2)
      {
        id v21 = objc_alloc(MEMORY[0x189603F68]);
        uint64_t v22 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v9, v26, 0);
        uint64_t v23 = [MEMORY[0x189607870] errorWithDomain:v11 code:1560 userInfo:v22];
        uint64_t *v25 = v23;
      }
    }
  }

  if (v4 >= 0x201) {
    NSZoneFree(0LL, v7);
  }
  return v8 & 1;
}

void __148__NSMigrationManager_InternalMethods___migrateStoreFromURL_type_options_withMappingModel_toDestinationURL_destinationType_destinationOptions_error___block_invoke( uint64_t a1)
{
}

@end