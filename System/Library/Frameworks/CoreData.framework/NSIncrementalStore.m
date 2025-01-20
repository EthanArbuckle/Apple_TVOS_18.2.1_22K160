@interface NSIncrementalStore
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5;
+ (id)identifierForNewStoreAtURL:(NSURL *)storeURL;
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)load:(id *)a3;
- (BOOL)loadMetadata:(NSError *)error;
- (NSArray)obtainPermanentIDsForObjects:(NSArray *)array error:(NSError *)error;
- (NSIncrementalStoreNode)newValuesForObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error;
- (NSManagedObjectID)newObjectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data;
- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4;
- (id)_rawMetadata__;
- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error;
- (id)metadata;
- (id)newValueForRelationship:(NSRelationshipDescription *)relationship forObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error;
- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID;
- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4;
- (void)dealloc;
- (void)setMetadata:(id)a3;
@end

@implementation NSIncrementalStore

+ (id)identifierForNewStoreAtURL:(NSURL *)storeURL
{
  return +[_PFRoutines _getUUID]();
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_msgSend( objc_alloc((Class)a1),  "initWithPersistentStoreCoordinator:configurationName:URL:options:",  0,  0,  a3,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"NSReadOnlyPersistentStoreOption"));
  int v6 = [v5 loadMetadata:a4];
  v7 = 0LL;
  if (v6) {
    v7 = (void *)[v5 metadata];
  }

  return v7;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  v7 = (void *)[objc_alloc((Class)a1) initWithPersistentStoreCoordinator:0 configurationName:0 URL:a4 options:0];
  [v7 setMetadata:a3];
  v8 = objc_alloc_init(&OBJC_CLASS___NSSaveChangesRequest);
  uint64_t v9 = [v7 executeRequest:v8 withContext:0 error:a5];

  return v9 != 0;
}

- (void)dealloc
{
  self->_storeMetadata = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSIncrementalStore;
  -[NSPersistentStore dealloc](&v3, sel_dealloc);
}

- (BOOL)load:(id *)a3
{
  return 1;
}

- (id)metadata
{
  storeMetadata = self->_storeMetadata;
  if (storeMetadata)
  {
    id v4 = -[NSDictionary objectForKey:](storeMetadata, "objectForKey:", @"_NSMetadataLastIdentifier");
    unint64_t lastIdentifier = self->_lastIdentifier;
    if (lastIdentifier != [v4 unsignedLongValue])
    {
      id v6 = (id)-[NSDictionary mutableCopy](self->_storeMetadata, "mutableCopy");
      objc_msgSend( v6,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", self->_lastIdentifier),  @"_NSMetadataLastIdentifier");

      v7 = (NSDictionary *)[v6 copy];
LABEL_7:
      self->_storeMetadata = v7;

      return self->_storeMetadata;
    }

    return self->_storeMetadata;
  }

  v15 = 0LL;
  if (-[NSIncrementalStore loadMetadata:](self, "loadMetadata:", &v15))
  {
    if (!self->_storeMetadata)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
      objc_msgSend( v6,  "setObject:forKey:",  objc_msgSend((id)objc_opt_class(), "identifierForNewStoreAtURL:", -[NSPersistentStore URL](self, "URL")),  @"NSStoreUUID");
      self->_unint64_t lastIdentifier = 0LL;
      objc_msgSend( v6,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", 0),  @"_NSMetadataLastIdentifier");
      v7 = (NSDictionary *) -[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:]( self,  "_updatedMetadataWithSeed:includeVersioning:",  v6,  1LL);
      goto LABEL_7;
    }

    return self->_storeMetadata;
  }

  uint64_t v9 = v15;
  if (v15)
  {
    v10 = (const __CFString *)*MEMORY[0x189607798];
  }

  else
  {
    uint64_t v9 = @"Unknown failure";
    v10 = @"Reason";
  }

  uint64_t v11 = [MEMORY[0x189603F68] dictionaryWithObject:v9 forKey:v10];
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Failed to load metadata" userInfo:v11]);
  -[NSIncrementalStore setMetadata:](v12, v13, v14);
  return result;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)loadMetadata:(NSError *)error
{
  return 0;
}

- (NSArray)obtainPermanentIDsForObjects:(NSArray *)array error:(NSError *)error
{
  NSUInteger v7 = -[NSArray count](array, "count");
  if (__CFADD__(v7, self->_lastIdentifier))
  {
    v8 = 0LL;
    if (error) {
      *error = (NSError *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"Keyspace exhausted",  @"Problem"));
    }
  }

  else
  {
    NSUInteger v9 = v7;
    v8 = (NSArray *)[MEMORY[0x189603FA8] array];
    if (v9)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        uint64_t v11 = objc_msgSend(-[NSArray objectAtIndex:](array, "objectAtIndex:", i), "entity");
        v12 = (void *)MEMORY[0x189607968];
        ++self->_lastIdentifier;
        SEL v13 = -[NSIncrementalStore newObjectIDForEntity:referenceObject:]( self,  "newObjectIDForEntity:referenceObject:",  v11,  objc_msgSend(v12, "numberWithUnsignedLongLong:"));
        -[NSArray addObject:](v8, "addObject:", v13);
      }
    }
  }

  return v8;
}

- (BOOL)_prepareForExecuteRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (!objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "count")) {
    return 1;
  }
  id v28 = 0LL;
  id v23 = objc_alloc_init(MEMORY[0x1896077E8]);
  NSUInteger v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "insertedObjects"), "allObjects");
  v10 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      }

      uint64_t v12 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v12);
  }

  v16 = -[NSIncrementalStore obtainPermanentIDsForObjects:error:]( self,  "obtainPermanentIDsForObjects:error:",  v10,  &v28);
  BOOL v17 = v16 != 0LL;
  if (v16)
  {
    v18 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)a4, v10, v16);
    if (v18) {
      -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)a3, (uint64_t)v18);
    }
  }

  id v19 = v28;
  [v23 drain];
  id v20 = v28;
  if (v28)
  {
    if (a5) {
      *a5 = v28;
    }
    id v21 = v20;
  }

  return v17;
}

- (NSIncrementalStoreNode)newValuesForObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  return 0LL;
}

- (id)newValueForRelationship:(NSRelationshipDescription *)relationship forObjectWithID:(NSManagedObjectID *)objectID withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  return 0LL;
}

- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  return 0LL;
}

- (NSManagedObjectID)newObjectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data
{
  return (NSManagedObjectID *)objc_msgSend( objc_alloc((Class)-[NSPersistentStore objectIDFactoryForEntity:]( self,  "objectIDFactoryForEntity:",  entity)),  "initWithObject:",  data);
}

- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID
{
  if ((NSIncrementalStore *)-[NSManagedObjectID persistentStore](objectID, "persistentStore") == self) {
    return -[NSManagedObjectID _referenceData](objectID, "_referenceData");
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot retrieve referenceObject from an objectID that was not created by this store" userInfo:0]);
  return -[NSIncrementalStore _rawMetadata__](v5, v6);
}

- (id)_rawMetadata__
{
  return self->_storeMetadata;
}

- (void)_setMetadata:(id)a3 includeVersioning:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[NSDictionary objectForKey:](self->_storeMetadata, "objectForKey:", @"_NSMetadataLastIdentifier");
  if (self->_storeMetadata != a3 || (unint64_t v8 = self->_lastIdentifier, v8 != [v7 unsignedLongValue]))
  {
    NSUInteger v9 = (void *)[a3 mutableCopy];
    v10 = (void *)[v9 objectForKey:@"_NSMetadataLastIdentifier"];
    if (v10)
    {
      unint64_t lastIdentifier = self->_lastIdentifier;
      if (lastIdentifier > [v10 unsignedLongValue]) {
        objc_msgSend( v9,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", self->_lastIdentifier),  @"_NSMetadataLastIdentifier");
      }
    }

    id v12 = -[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:]( self,  "_updatedMetadataWithSeed:includeVersioning:",  v9,  v4);

    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NSIncrementalStore;
    -[NSPersistentStore setMetadata:](&v13, sel_setMetadata_, v12);

    self->_storeMetadata = (NSDictionary *)v12;
  }

- (id)_newObjectIDForEntityDescription:(id)a3 pk:(int64_t)a4
{
  return 0LL;
}

@end