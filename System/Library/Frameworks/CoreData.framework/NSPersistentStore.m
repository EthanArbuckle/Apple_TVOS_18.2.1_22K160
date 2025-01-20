@interface NSPersistentStore
+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6;
+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)doURLStuff:(id)a3 createdStubFile:(BOOL *)a4 readOnly:(BOOL *)a5 error:(id *)a6 options:(id)a7;
+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreWithURL:(NSURL *)url error:(NSError *)error;
+ (Class)migrationManagerClass;
+ (Class)rowCacheClass;
+ (NSDictionary)metadataForPersistentStoreWithURL:(NSURL *)url error:(NSError *)error;
+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3;
+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (void)initialize;
- (BOOL)_hasActiveGenerations;
- (BOOL)_isCloudKitOptioned;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)_unload:(id *)a3;
- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4;
- (BOOL)isCloudKitEnabled;
- (BOOL)isReadOnly;
- (BOOL)load:(id *)a3;
- (BOOL)loadMetadata:(NSError *)error;
- (BOOL)supportsConcurrentRequestHandling;
- (BOOL)supportsGenerationalQuerying;
- (Class)_objectIDClass;
- (NSDictionary)metadata;
- (NSDictionary)options;
- (NSPersistentStore)init;
- (NSPersistentStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)root configurationName:(NSString *)name URL:(NSURL *)url options:(NSDictionary *)options;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)configurationName;
- (NSString)identifier;
- (NSString)type;
- (NSURL)URL;
- (_BYTE)_updateMetadata;
- (__CFSet)_entitiesForConfiguration;
- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5;
- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)_persistentStoreCoordinator;
- (id)_rawMetadata__;
- (id)_storeInfoForEntityDescription:(id)a3;
- (id)_updatedMetadataWithSeed:(id)a3 includeVersioning:(BOOL)a4;
- (id)ancillaryModels;
- (id)currentChangeToken;
- (id)currentQueryGeneration;
- (id)description;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)mirroringDelegate;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)objectIDFactoryForEntity:(id)a3;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3;
- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4;
- (unint64_t)entityIDForEntityDescription:(id)a3;
- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3;
- (void)_preflightCrossCheck;
- (void)_setMetadataDirty:(BOOL)a3;
- (void)dealloc;
- (void)doFilesystemCleanupOnRemove:(BOOL)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3;
- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3;
- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4;
- (void)setIdentifier:(NSString *)identifier;
- (void)setMetadata:(NSDictionary *)metadata;
- (void)setReadOnly:(BOOL)readOnly;
- (void)setURL:(NSURL *)URL;
- (void)willRemoveFromPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator;
@end

@implementation NSPersistentStore

- (NSString)configurationName
{
  if (self->_configurationName) {
    return self->_configurationName;
  }
  else {
    return (NSString *)@"PF_DEFAULT_CONFIGURATION_NAME";
  }
}

- (id)_persistentStoreCoordinator
{
  return (id)atomic_load((unint64_t *)&self->_coordinator);
}

- (NSDictionary)options
{
  return self->_options;
}

- (id)objectIDFactoryForEntity:(id)a3
{
  if (!self->_oidFactories) {
    return 0LL;
  }
  if (-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator"))
  {
    uint64_t v5 = _PFModelMapSlotForEntity((uint64_t)self->_modelMap, a3);
    if ((v5 & 0x8000000000000000LL) == 0)
    {
      uint64_t v6 = v5;
      v7 = (objc_class *)atomic_load((unint64_t *)&self->_oidFactories[v5]);
      if (!v7)
      {
        v8 = -[objc_class classWithStore:andEntity:]( -[NSPersistentStore _objectIDClass](self, "_objectIDClass"),  "classWithStore:andEntity:",  self,  a3);
        v7 = v8;
        v9 = (unint64_t *)&self->_oidFactories[v6];
        while (!__ldaxr(v9))
        {
          if (!__stlxr((unint64_t)v8, v9))
          {
            [a3 _addFactoryToRetainList:v8];
            return v7;
          }
        }

        __clrex();
        v12 = (objc_class *)atomic_load((unint64_t *)&self->_oidFactories[v6]);
        if (v8 != v12)
        {
          -[objc_class _storeDeallocated](v8, "_storeDeallocated");

          return v12;
        }
      }

      return v7;
    }
  }

  else
  {
    id v13 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134098LL,  (uint64_t)@"objectIDFactoryForEntity invoked after store was removed",  0LL);
    objc_exception_throw(v13);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"objectIDFactoryForEntity invoked before model was finalized" userInfo:0]);
  return (id)_PFModelMapSlotForEntity(v14, v15);
}

- (NSPersistentStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentStore;
  return -[NSPersistentStore init](&v3, sel_init);
}

+ (void)initialize
{
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (NSDictionary)metadataForPersistentStoreWithURL:(NSURL *)url error:(NSError *)error
{
  return 0LL;
}

+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreWithURL:(NSURL *)url error:(NSError *)error
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSPersistentStoreCoordinator _setMetadata:forPersistentStoreOfType:URL:options:error:]( (uint64_t)&OBJC_CLASS___NSPersistentStoreCoordinator,  (uint64_t)metadata,  0LL,  url,  0LL,  error);
  }

  else if (-[NSURL isFileURL](url, "isFileURL"))
  {
    v8 = -[NSURL path](url, "path");
    BOOL result = objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "isWritableFileAtPath:", v8);
    if (error)
    {
      if (!result)
      {
        id v10 = objc_alloc(MEMORY[0x189603F68]);
        v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", url, *MEMORY[0x189607760], 0);
        *error = (NSError *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:512 userInfo:v11];

        return 0;
      }
    }
  }

  else
  {
    return 1;
  }

  return result;
}

- (NSPersistentStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)root configurationName:(NSString *)name URL:(NSURL *)url options:(NSDictionary *)options
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NSPersistentStore;
  id v11 = -[NSPersistentStore init](&v18, sel_init);
  if (v11)
  {
    *((_BYTE *)v11 + 56) = *((_BYTE *)v11 + 56) & 0xFE | objc_msgSend( -[NSDictionary objectForKey:]( options,  "objectForKey:",  @"NSReadOnlyPersistentStoreOption"),  "BOOLValue");
    atomic_store((unint64_t)root, (unint64_t *)v11 + 1);
    *((void *)v11 + 2) = -[NSString copy](name, "copy");
    if (root) {
      modelMap = root->_modelMap;
    }
    else {
      modelMap = 0LL;
    }
    id v13 = modelMap;
    *((void *)v11 + 12) = v13;
    if (v13) {
      unint64_t entityCount = v13->_entityCount;
    }
    else {
      unint64_t entityCount = 0LL;
    }
    v15 = (unint64_t *)PF_CALLOC_OBJECT_ARRAY(entityCount + 1);
    *((void *)v11 + 5) = v15;
    atomic_store((unint64_t)v11, &v15[entityCount]);
    *((void *)v11 + 3) = url;
    if (url) {
      CFRetain(url);
    }
    *((void *)v11 + 4) = -[NSDictionary copy](options, "copy");
    atomic_store(0, (unsigned __int8 *)v11 + 61);
    *((void *)v11 + 10) = -[NSPersistentStoreCoordinator managedObjectModel](root, "managedObjectModel");
    id v16 = objc_alloc((Class)objc_opt_class());
    *((void *)v11 + 6) = -[NSFaultHandler initWithPersistenceStore:](v16);
  }

  return (NSPersistentStore *)v11;
}

- (void)dealloc
{
  p_entitiesInConfiguration = (unint64_t *)&self->_entitiesInConfiguration;
  if (atomic_load((unint64_t *)&self->_entitiesInConfiguration))
  {
    uint64_t v5 = (const void *)atomic_load(p_entitiesInConfiguration);
    CFRelease(v5);
    atomic_store(0LL, p_entitiesInConfiguration);
  }

  oidFactories = (unint64_t *)self->_oidFactories;
  if (oidFactories)
  {
    v7 = (NSPersistentStore *)atomic_load(oidFactories);
    if (v7 != self)
    {
      uint64_t v8 = 0LL;
      do
      {
        v9 = (void *)atomic_load((unint64_t *)&self->_oidFactories[v8]);
        [v9 _storeDeallocated];
        id v10 = (NSPersistentStore *)atomic_load((unint64_t *)&self->_oidFactories[++v8]);
      }

      while (v10 != self);
    }
  }

  temporaryIDClass = self->_temporaryIDClass;
  if (temporaryIDClass)
  {
    [temporaryIDClass _storeDeallocated];

    self->_temporaryIDClass = 0LL;
  }

  self->_modelMap = 0LL;
  atomic_store(0LL, (unint64_t *)&self->_coordinator);
  self->_configurationName = 0LL;
  v12 = (unint64_t *)self->_oidFactories;
  if (v12)
  {
    id v13 = (NSPersistentStore *)atomic_load(v12);
    if (v13 != self)
    {
      uint64_t v14 = 0LL;
      do
      {
        v15 = (const void *)atomic_load((unint64_t *)&self->_oidFactories[v14]);
        if (v15) {
          CFRelease(v15);
        }
        atomic_store(0LL, (unint64_t *)&self->_oidFactories[v14]);
        id v16 = (NSPersistentStore *)atomic_load((unint64_t *)&self->_oidFactories[++v14]);
      }

      while (v16 != self);
    }

    PF_FREE_OBJECT_ARRAY(self->_oidFactories);
    self->_oidFactories = 0LL;
  }

  self->_defaultFaultHandler = 0LL;
  self->_coreSpotlightDelegate = 0LL;
  self->_url = 0LL;
  self->_options = 0LL;

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSPersistentStore;
  -[NSPersistentStore dealloc](&v17, sel_dealloc);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentStore;
  return (id)[NSString stringWithFormat:@"%@ (URL: %@)", -[NSPersistentStore description](&v3, sel_description), -[NSPersistentStore URL](self, "URL")];
}

- (BOOL)isReadOnly
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setReadOnly:(BOOL)readOnly
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | readOnly;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  p_coordinator = (unint64_t *)&self->_coordinator;
  objc_super v3 = (void *)atomic_load((unint64_t *)&self->_coordinator);
  if ([v3 _isDeallocating]) {
    return 0LL;
  }
  uint64_t v5 = (void *)atomic_load(p_coordinator);
  return (NSPersistentStoreCoordinator *)v5;
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(NSURL *)URL
{
  uint64_t v5 = self->_url;
  if (v5 != URL)
  {
    if (v5) {
      CFRelease(v5);
    }
    self->_url = URL;
    if (URL) {
      CFRetain(URL);
    }
  }

- (NSString)identifier
{
  objc_super v3 = -[NSDictionary objectForKey:]( -[NSPersistentStore metadata](self, "metadata"),  "objectForKey:",  @"NSStoreUUID");
  if (!v3)
  {
    objc_super v3 = (NSString *)+[_PFRoutines _getUUID]();
    -[NSPersistentStore setIdentifier:](self, "setIdentifier:", v3);
  }

  return v3;
}

- (void)setIdentifier:(NSString *)identifier
{
  uint64_t v5 = (void *)objc_msgSend( MEMORY[0x189603FC8],  "dictionaryWithDictionary:",  -[NSPersistentStore metadata](self, "metadata"));
  uint64_t v6 = v5;
  if (identifier) {
    [v5 setObject:identifier forKey:@"NSStoreUUID"];
  }
  else {
    [v5 removeObjectForKey:@"NSStoreUUID"];
  }
  -[NSPersistentStore setMetadata:](self, "setMetadata:", v6);
}

- (NSDictionary)metadata
{
  return 0LL;
}

- (void)setMetadata:(NSDictionary *)metadata
{
  uint64_t v5 = (NSDictionary *)-[NSPersistentStore _rawMetadata](self, "_rawMetadata");
  if (v5 != metadata && (-[NSDictionary isEqual:](metadata, "isEqual:", v5) & 1) == 0) {
    -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 1LL);
  }
}

- (NSString)type
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)willRemoveFromPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator
{
}

- (BOOL)loadMetadata:(NSError *)error
{
  return 1;
}

+ (Class)migrationManagerClass
{
  return (Class)objc_opt_class();
}

- (id)_rawMetadata__
{
  return 0LL;
}

+ (Class)rowCacheClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_isPersistentStoreAlive
{
  BOOL result = 0;
  if (-[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator"))
  {
    objc_super v3 = (void *)atomic_load((unint64_t *)&self->_coordinator);
  }

  return result;
}

+ (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 error:(id *)a7
{
  if (!a5) {
    return 0;
  }
  int v11 = objc_msgSend(a5, "isFileURL", a3, a4);
  BOOL v12 = 0;
  if (!a3 || !v11) {
    return v12;
  }
  id v13 = (const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation");
  uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(a5, "path"), "fileSystemRepresentation");
  v15 = (void *)[a6 objectForKey:@"NSPersistentStoreUnlinkDestroyOption"];
  if (v15 && [v15 BOOLValue])
  {
    if (rename(v14, v13))
    {
      uint64_t v16 = *__error();
      BOOL v12 = v16 == 2;
      if (a7 && (_DWORD)v16 != 2)
      {
        objc_super v17 = (void *)MEMORY[0x189607870];
        uint64_t v18 = *MEMORY[0x189607688];
        v19 = (void *)MEMORY[0x189603F68];
        uint64_t v20 = objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  objc_msgSend(a5, "path"),  objc_msgSend(a3, "path"),  0);
        v21 = (void *)objc_msgSend( v17,  "errorWithDomain:code:userInfo:",  v18,  v16,  objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v20, *MEMORY[0x1896074F8], 0));
        BOOL v12 = 0;
        *a7 = v21;
      }
    }

    else
    {
      return 1;
    }
  }

  else
  {
    v23 = copyfile_state_alloc();
    if (copyfile(v14, v13, v23, 0xFu))
    {
      uint64_t v24 = *__error();
      BOOL v12 = v24 == 2;
      if (a7 && (_DWORD)v24 != 2)
      {
        v25 = (void *)MEMORY[0x189607870];
        uint64_t v26 = *MEMORY[0x189607688];
        v27 = (void *)MEMORY[0x189603F68];
        uint64_t v28 = objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  objc_msgSend(a5, "path"),  objc_msgSend(a3, "path"),  0);
        v29 = (void *)objc_msgSend( v25,  "errorWithDomain:code:userInfo:",  v26,  v24,  objc_msgSend(v27, "dictionaryWithObjectsAndKeys:", v28, *MEMORY[0x1896074F8], 0));
        BOOL v12 = 0;
        *a7 = v29;
      }
    }

    else
    {
      BOOL v12 = 1;
    }

    copyfile_state_free(v23);
  }

  return v12;
}

+ (BOOL)_destroyPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a3)
  {
    int v7 = [a3 isFileURL];
    if (v7)
    {
      if (unlink((const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation")))
      {
        uint64_t v8 = *__error();
        LOBYTE(v7) = v8 == 2;
        if (a5 && (_DWORD)v8 != 2)
        {
          v9 = (void *)MEMORY[0x189607870];
          uint64_t v10 = *MEMORY[0x189607688];
          int v11 = (void *)MEMORY[0x189603F68];
          uint64_t v12 = [a3 path];
          id v13 = (void *)objc_msgSend( v9,  "errorWithDomain:code:userInfo:",  v10,  v8,  objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, *MEMORY[0x1896074F8], 0));
          LOBYTE(v7) = 0;
          *a5 = v13;
        }
      }

      else
      {
        LOBYTE(v7) = 1;
      }
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)_rekeyPersistentStoreAtURL:(id)a3 options:(id)a4 withKey:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = (id)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Store does not support encryption",  a4,  a5,  *MEMORY[0x1896075E0],  0));
  }
  return 0;
}

- (Class)_objectIDClass
{
  return (Class)objc_opt_class();
}

- (BOOL)load:(id *)a3
{
  v4 = -[NSPersistentStore identifier](self, "identifier", a3);
  oidFactories = (unint64_t *)self->_oidFactories;
  if (oidFactories)
  {
    uint64_t v6 = (NSPersistentStore *)atomic_load(oidFactories);
    if (v6 != self)
    {
      uint64_t v7 = 0LL;
      do
      {
        uint64_t v8 = (void *)atomic_load((unint64_t *)&self->_oidFactories[v7]);
        [v8 setObjectStoreIdentifier:v4];
        v9 = (NSPersistentStore *)atomic_load((unint64_t *)&self->_oidFactories[++v7]);
      }

      while (v9 != self);
    }
  }

  temporaryIDClass = self->_temporaryIDClass;
  if (temporaryIDClass) {
    [temporaryIDClass setObjectStoreIdentifier:v4];
  }
  return 1;
}

- (BOOL)_unload:(id *)a3
{
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_cleanOnRemove);
  uint64_t v6 = -[NSURL path](self->_url, "path");
  if ((v5 & 1) == 0) {
    goto LABEL_7;
  }
  if (!self->_url)
  {
    BOOL result = 0;
    goto LABEL_9;
  }

  uint64_t v7 = v6;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "fileExistsAtPath:", v6))
  {
    BOOL result = objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "removeItemAtPath:error:",  -[NSURL path](self->_url, "path"),  a3);
    if (a3 && !result)
    {
      v9 = (void *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460], 134060, objc_msgSend( MEMORY[0x189603F68], "dictionaryWithObjectsAndKeys:", objc_msgSend( NSString, "stringWithFormat:", @"Unable to unload store file because file at path '%@' could not be removed", v7), @"reason", 0) code userInfo];
      BOOL result = 0;
      *a3 = v9;
    }
  }

  else
  {
LABEL_7:
    BOOL result = 1;
  }

+ (BOOL)doURLStuff:(id)a3 createdStubFile:(BOOL *)a4 readOnly:(BOOL *)a5 error:(id *)a6 options:(id)a7
{
  uint64_t v12 = (void *)[a3 path];
  id v13 = (char *)[v12 fileSystemRepresentation];
  uint64_t v14 = (void *)[a7 valueForKey:@"NSReadOnlyPersistentStoreOption"];
  v15 = v14;
  if (v14)
  {
    int v16 = [v14 BOOLValue];
    int v17 = [v15 BOOLValue] ^ 1;
  }

  else
  {
    int v16 = 0;
    int v17 = 0;
  }

  uint64_t v18 = [a7 valueForKey:@"NSPersistentStoreFileProtectionKey"];
  if (v18)
  {
    if ([(id)*MEMORY[0x189607538] isEqualToString:v18])
    {
      LODWORD(v18) = 4;
    }

    else if ([(id)*MEMORY[0x189607518] isEqualToString:v18])
    {
      LODWORD(v18) = 3;
    }

    else if ([(id)*MEMORY[0x189607510] isEqualToString:v18])
    {
      LODWORD(v18) = 2;
    }

    else if ([(id)*MEMORY[0x189607508] isEqualToString:v18])
    {
      LODWORD(v18) = 1;
    }

    else if ([(id)*MEMORY[0x189607528] isEqualToString:v18])
    {
      LODWORD(v18) = 7;
    }

    else
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"Unrecognized value '%@' passed into options for NSPersistentStoreFileProtectionKey",  v19,  v20,  v21,  v22,  v23,  v24,  v18);
      LODWORD(v18) = 0;
    }
  }

  if (access(v13, 4))
  {
    uint64_t v25 = *__error();
    if ((_DWORD)v25 != 2)
    {
      if ((_DWORD)v25 == 20)
      {
        if (a6)
        {
          v36 = (void *)MEMORY[0x189607870];
          uint64_t v37 = *MEMORY[0x189607460];
          v38 = (void *)MEMORY[0x189603F68];
          uint64_t v39 = [NSString stringWithFormat:@"Component of path %@ is not a directory", v12];
          uint64_t v28 = objc_msgSend(v38, "dictionaryWithObjectsAndKeys:", v39, @"reason", v12, *MEMORY[0x1896074F8], 0);
          v29 = v36;
          uint64_t v30 = v37;
          uint64_t v31 = 258LL;
          goto LABEL_37;
        }
      }

      else if ((_DWORD)v25 == 13)
      {
        if (a6)
        {
          uint64_t v26 = (void *)MEMORY[0x189607870];
          uint64_t v27 = *MEMORY[0x189607460];
          uint64_t v28 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(NSString, "stringWithFormat:", @"No access to file; code = %d", 13),
                  @"reason");
          v29 = v26;
          uint64_t v30 = v27;
          uint64_t v31 = 257LL;
LABEL_37:
          *a6 = (id)[v29 errorWithDomain:v30 code:v31 userInfo:v28];
          goto LABEL_38;
        }
      }

      else if (a6)
      {
        v40 = (void *)MEMORY[0x189607870];
        uint64_t v41 = *MEMORY[0x189607460];
        uint64_t v28 = [MEMORY[0x189603F68] dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"Unknown failure to access file: %d", v25), @"reason" forKey];
        v29 = v40;
        uint64_t v30 = v41;
        uint64_t v31 = 256LL;
        goto LABEL_37;
      }

      goto LABEL_38;
    }

    if (v16)
    {
      if (!a6) {
        return 0;
      }
      BOOL v32 = 0;
      *a6 = (id)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  260,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend( NSString,  "stringWithFormat:",  @"Attempt to open missing file read only; code = %d",
                      2LL),
                    @"reason"));
      return v32;
    }

    int v43 = _PFCeateStubFileAtPath(v13, v18);
    if ((v43 & 0x80000000) == 0)
    {
      close(v43);
      BOOL v32 = 1;
      *a4 = 1;
      return v32;
    }

    if (!a6)
    {
LABEL_60:
      +[_PFRoutines _logFileAccessDebugInformation:]((uint64_t)&OBJC_CLASS____PFRoutines, v13);
      +[_PFRoutines _logDirectoryAccessDebugInformation:]( (uint64_t)_PFRoutines,  (void *)[v12 stringByDeletingLastPathComponent]);
      return 0;
    }

    uint64_t v44 = *__error();
    if ((int)v44 > 12)
    {
      if ((_DWORD)v44 != 13)
      {
        if ((_DWORD)v44 == 17)
        {
          v45 = (void *)MEMORY[0x189607870];
          uint64_t v46 = *MEMORY[0x189607460];
          v49 = (void *)MEMORY[0x189603F68];
          v50 = @"File unexpectedly appeared during sanity check";
LABEL_58:
          uint64_t v55 = [v49 dictionaryWithObject:v50 forKey:@"reason"];
          v56 = v45;
          uint64_t v57 = v46;
          uint64_t v58 = 512LL;
          goto LABEL_59;
        }

        goto LABEL_56;
      }

      v51 = (void *)MEMORY[0x189607870];
      uint64_t v52 = *MEMORY[0x189607460];
      v53 = (void *)MEMORY[0x189603F68];
      uint64_t v54 = objc_msgSend(NSString, "stringWithFormat:", @"No access to create file; code = %d", 13);
    }

    else
    {
      if ((_DWORD)v44 != 1)
      {
        if ((_DWORD)v44 == 2)
        {
          v45 = (void *)MEMORY[0x189607870];
          uint64_t v46 = *MEMORY[0x189607460];
          v47 = (void *)MEMORY[0x189603F68];
          v48 = (void *)NSString;
          uint64_t v44 = 2LL;
LABEL_57:
          v50 = (const __CFString *)objc_msgSend( v48,  "stringWithFormat:",  @"Failed to create file; code = %d",
                                      v44);
          v49 = v47;
          goto LABEL_58;
        }

+ (id)_figureOutWhereExternalReferencesEndedUpRelativeTo:(id)a3
{
  return 0LL;
}

- (void)_preflightCrossCheck
{
  objc_super v3 = -[NSPersistentStore URL](self, "URL");
  if (-[NSURL isFileURL](v3, "isFileURL")
    && ((__CFString *)-[NSPersistentStore type](self, "type") != @"SQLite"
     || (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)&OBJC_CLASS____PFRoutines, v3) & 1) == 0)
    && stat(-[NSString fileSystemRepresentation](-[NSURL path](v3, "path"), "fileSystemRepresentation"), &v30))
  {
    int v4 = *__error();
    id v5 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v6 = *MEMORY[0x189607688];
    uint64_t v7 = (void *)MEMORY[0x189603F68];
    uint64_t v8 = -[NSURL path](v3, "path");
    uint64_t v9 = *MEMORY[0x1896074F8];
    id v10 = (id)objc_msgSend( v5,  "initWithDomain:code:userInfo:",  v6,  v4,  objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, *MEMORY[0x1896074F8]));
    _NSCoreDataLog(1LL, (uint64_t)@"Error opening store: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
    if (v4 != 20)
    {
      if (v4 == 13)
      {
        uint64_t v17 = 513LL;
        goto LABEL_12;
      }

      if (v4 != 2)
      {
        uint64_t v17 = 512LL;
        goto LABEL_12;
      }
    }

    uint64_t v17 = 4LL;
LABEL_12:
    uint64_t v18 = *MEMORY[0x189607798];
    if (v10) {
      id v10 = (id)[MEMORY[0x189603F68] dictionaryWithObject:v10 forKey:*MEMORY[0x189607798]];
    }
    id v19 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v20 = *MEMORY[0x189607460];
    id v21 = (id)[v19 initWithDomain:*MEMORY[0x189607460] code:v17 userInfo:v10];
    uint64_t v22 = (void *)MEMORY[0x189603F68];
    uint64_t v23 = -[NSURL path](v3, "path");
    uint64_t v24 = objc_msgSend( v22,  "dictionaryWithObjectsAndKeys:",  v21,  v18,  v23,  v9,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", self),  @"NSAffectedStoresErrorKey",  0);
    id v25 = (id)[objc_alloc(MEMORY[0x189607870]) initWithDomain:v20 code:134030 userInfo:v24];
    id v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  *MEMORY[0x189603A58],  134030,  (uint64_t)@"Could not write to file.",  (void *)[MEMORY[0x189603F68] dictionaryWithObject:v25 forKey:@"NSCoreDataPrimaryError"]);
    objc_exception_throw(v26);
    -[NSPersistentStore doFilesystemCleanupOnRemove:](v27, v28, v29);
  }

- (void)doFilesystemCleanupOnRemove:(BOOL)a3
{
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  return 0LL;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3
{
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3
{
}

- (void)_mapsSyncDidUnregisterObjectsWithIDs_112229675:(id)a3
{
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  return 0LL;
}

- (BOOL)_isCloudKitOptioned
{
  return 0;
}

- (id)_updatedMetadataWithSeed:(id)a3 includeVersioning:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (void *)[a3 mutableCopy];
  if (!v7) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:5];
  }
  uint64_t v8 = -[NSPersistentStore type](self, "type");
  if (v8 || (uint64_t v8 = (NSString *)[a3 objectForKey:@"NSStoreType"]) != 0) {
    [v7 setObject:v8 forKey:@"NSStoreType"];
  }
  uint64_t v9 = (NSString *)[a3 objectForKey:@"NSStoreUUID"];
  if (!v9)
  {
    uint64_t v9 = -[NSPersistentStore identifier](self, "identifier");
    if (!v9) {
      uint64_t v9 = (NSString *)+[_PFRoutines _getUUID]();
    }
  }

  [v7 setObject:v9 forKey:@"NSStoreUUID"];
  if (v4)
  {
    [v7 setObject:+[_PFRoutines _getPFBundleVersionNumber]() forKey:0x189EBA2C8];
    BOOL v10 = -[NSString isEqualToString:](-[NSPersistentStore type](self, "type"), "isEqualToString:", @"SQLite")
       || -[NSString isEqualToString:](-[NSPersistentStore type](self, "type"), "isEqualToString:", @"Binary");
    int v11 = v10 | -[NSString isEqualToString:]( -[NSPersistentStore type](self, "type"),  "isEqualToString:",  @"NSXPCStore");
    id v12 = -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator");
    if (v12)
    {
      uint64_t v13 = (void *)[v12 managedObjectModel];
      uint64_t v14 = (void *)[v13 entityVersionHashesByName];
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 3), 0x189EBA2A8);
      [v7 setObject:v14 forKey:@"NSStoreModelVersionHashes"];
      if (v13) {
        uint64_t v15 = objc_msgSend((id)objc_msgSend(v13, "versionIdentifiers"), "allObjects");
      }
      else {
        uint64_t v15 = 0LL;
      }
      [v7 setObject:v15 forKey:@"NSStoreModelVersionIdentifiers"];
      if (v11) {
        objc_msgSend( v7,  "setObject:forKey:",  -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v13, v14),  0x189EB9D88);
      }
      uint64_t v16 = [v13 versionChecksum];
      uint64_t v17 = @"NSStoreModelVersionChecksumKey";
      uint64_t v18 = v7;
      goto LABEL_19;
    }

    if (![v7 objectForKey:0x189EBA2A8])
    {
      id v19 = -[NSDictionary objectForKey:]( -[NSPersistentStore metadata](self, "metadata"),  "objectForKey:",  0x189EBA2A8LL);
      if (v19) {
        [v7 setObject:v19 forKey:0x189EBA2A8];
      }
    }

    if (![v7 objectForKey:@"NSStoreModelVersionHashes"])
    {
      id v20 = -[NSDictionary objectForKey:]( -[NSPersistentStore metadata](self, "metadata"),  "objectForKey:",  @"NSStoreModelVersionHashes");
      if (v20) {
        [v7 setObject:v20 forKey:@"NSStoreModelVersionHashes"];
      }
    }

    if (![v7 objectForKey:0x189EB9D88])
    {
      if (v11)
      {
        id v21 = -[NSDictionary objectForKey:]( -[NSPersistentStore metadata](self, "metadata"),  "objectForKey:",  0x189EB9D88LL);
        if (v21) {
          [v7 setObject:v21 forKey:0x189EB9D88];
        }
      }
    }

    if (![v7 objectForKey:@"NSStoreModelVersionChecksumKey"])
    {
      objc_opt_class();
      uint64_t v22 = (objc_opt_isKindOfClass() & 1) != 0
          ? (NSDictionary *)-[NSPersistentStore _rawMetadata](self, "_rawMetadata")
          : -[NSPersistentStore metadata](self, "metadata");
      uint64_t v23 = -[NSDictionary objectForKey:](v22, "objectForKey:", @"NSStoreModelVersionChecksumKey");
      if (v23) {
        [v7 setObject:v23 forKey:@"NSStoreModelVersionChecksumKey"];
      }
    }

    if (![v7 objectForKey:@"NSStoreModelVersionIdentifiers"])
    {
      id v25 = -[NSDictionary objectForKey:]( -[NSPersistentStore metadata](self, "metadata"),  "objectForKey:",  @"NSStoreModelVersionIdentifiers");
      if (v25)
      {
        uint64_t v16 = (uint64_t)v25;
        uint64_t v18 = v7;
        uint64_t v17 = @"NSStoreModelVersionIdentifiers";
LABEL_19:
        [v18 setObject:v16 forKey:v17];
      }
    }
  }

  return v7;
}

- (_BYTE)_updateMetadata
{
  if (result)
  {
    if ((result[56] & 1) == 0) {
      return (_BYTE *)objc_msgSend( result,  "setMetadata:",  objc_msgSend( result,  "_updatedMetadataWithSeed:includeVersioning:",  objc_msgSend(result, "metadata"),  1));
    }
  }

  return result;
}

- (void)_setMetadataDirty:(BOOL)a3
{
}

- (id)_storeInfoForEntityDescription:(id)a3
{
  return 0LL;
}

+ (id)cachedModelForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  return +[NSSQLCore cachedModelForPersistentStoreWithURL:options:error:]( &OBJC_CLASS___NSSQLCore,  "cachedModelForPersistentStoreWithURL:options:error:",  a3,  a4,  a5);
}

- (unint64_t)entityIDForEntityDescription:(id)a3
{
  return 0LL;
}

- (id)propertyNamesInHistoryChangeDataForEntityDescription:(id)a3
{
  return (id)NSArray_EmptyArray;
}

- (BOOL)supportsConcurrentRequestHandling
{
  return 0;
}

- (BOOL)supportsGenerationalQuerying
{
  return 0;
}

- (BOOL)_hasActiveGenerations
{
  return 0;
}

- (id)currentQueryGeneration
{
  if (!currentQueryGeneration_token)
  {
    v2 = -[_NSQueryGenerationToken initForNonGenerationalStore:]( objc_alloc(&OBJC_CLASS____NSQueryGenerationToken),  self);
    while (!__ldaxr((unint64_t *)&currentQueryGeneration_token))
    {
    }

    __clrex();
  }

  return (id)currentQueryGeneration_token;
}

- (id)reopenQueryGenerationWithIdentifier:(id)a3 error:(id *)a4
{
  if (+[_NSQueryGenerationToken identifierIsForNonGenerationalStore:]( (uint64_t)&OBJC_CLASS____NSQueryGenerationToken,  (uint64_t)a3)) {
    return -[NSPersistentStore currentQueryGeneration](self, "currentQueryGeneration");
  }
  else {
    return 0LL;
  }
}

- (id)currentChangeToken
{
  return 0LL;
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  return 0LL;
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F03A40];
  }
  return 0LL;
}

- (BOOL)finishDeferredLightweightMigration:(BOOL)a3 withError:(id *)a4
{
  return 1;
}

- (__CFSet)_entitiesForConfiguration
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  p_entitiesInConfiguration = (unint64_t *)&self->_entitiesInConfiguration;
  if (!atomic_load((unint64_t *)&self->_entitiesInConfiguration))
  {
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
    context = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v7 = (void *)objc_msgSend( self->_managedObjectModel,  "entitiesForConfiguration:",  -[NSPersistentStore configurationName](self, "configurationName"));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v7);
          }
          CFSetAddValue(Mutable, *(const void **)(*((void *)&v32 + 1) + 8 * v11++));
        }

        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }

      while (v9);
    }

    id v12 = -[NSPersistentStore ancillaryModels](self, "ancillaryModels");
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = (void *)[v12 objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * v16)];
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v25;
            do
            {
              uint64_t v21 = 0LL;
              do
              {
                if (*(void *)v25 != v20) {
                  objc_enumerationMutation(v17);
                }
                CFSetAddValue(Mutable, *(const void **)(*((void *)&v24 + 1) + 8 * v21++));
              }

              while (v19 != v21);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
            }

            while (v19);
          }

          ++v16;
        }

        while (v16 != v14);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }

      while (v14);
    }

    objc_autoreleasePoolPop(context);
    while (!__ldaxr(p_entitiesInConfiguration))
    {
    }

    __clrex();
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  return (__CFSet *)atomic_load(p_entitiesInConfiguration);
}

- (id)ancillaryModels
{
  return 0LL;
}

- (id)mirroringDelegate
{
  return (id)objc_msgSend( -[NSDictionary objectForKey:]( -[NSPersistentStore options](self, "options"),  "objectForKey:",  @"NSPersistentStoreMirroringOptionsKey"),  "objectForKey:",  @"NSPersistentStoreMirroringDelegateOptionKey");
}

- (BOOL)isCloudKitEnabled
{
  id v2 = -[NSPersistentStore mirroringDelegate](self, "mirroringDelegate");
  if (v2)
  {
    objc_opt_class();
    LOBYTE(v2) = objc_opt_isKindOfClass();
  }

  return v2 & 1;
}

@end