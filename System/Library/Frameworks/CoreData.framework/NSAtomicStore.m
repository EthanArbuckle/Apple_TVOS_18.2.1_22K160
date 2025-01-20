@interface NSAtomicStore
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
+ (void)initialize;
- (BOOL)load:(NSError *)error;
- (BOOL)save:(NSError *)error;
- (NSAtomicStore)init;
- (NSAtomicStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator configurationName:(NSString *)configurationName URL:(NSURL *)url options:(NSDictionary *)options;
- (NSAtomicStoreCacheNode)cacheNodeForObjectID:(NSManagedObjectID *)objectID;
- (NSAtomicStoreCacheNode)newCacheNodeForManagedObject:(NSManagedObject *)managedObject;
- (NSManagedObjectID)objectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data;
- (NSSet)cacheNodes;
- (id)_rawMetadata__;
- (id)executeFetchRequest:(void *)a3 withContext:;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)metadata;
- (id)newReferenceObjectForManagedObject:(NSManagedObject *)managedObject;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID;
- (uint64_t)_insertNodeIntoEntityCache:(uint64_t)a1;
- (void)_didLoadMetadata;
- (void)_getNewIDForObject:(void *)result;
- (void)_retrieveNodesSatisfyingRequest:(uint64_t)a1;
- (void)addCacheNodes:(NSSet *)cacheNodes;
- (void)dealloc;
- (void)setMetadata:(id)a3;
- (void)updateCacheNode:(NSAtomicStoreCacheNode *)node fromManagedObject:(NSManagedObject *)managedObject;
@end

@implementation NSAtomicStore

+ (void)initialize
{
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  return -[NSAtomicStore init](v4, v5);
}

- (NSAtomicStore)init
{
  return -[NSAtomicStore initWithPersistentStoreCoordinator:configurationName:URL:options:](v2, v3, v4, v5, v6, v7);
}

- (NSAtomicStore)initWithPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)coordinator configurationName:(NSString *)configurationName URL:(NSURL *)url options:(NSDictionary *)options
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v7 = -[NSPersistentStoreCoordinator managedObjectModel](coordinator, "managedObjectModel");
  uint64_t v8 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          do
          {
            for (uint64_t j = 0LL; j != v14; ++j)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              if ([v17 _isAttribute]
                && [v17 attributeType] == 1000
                && [v17 isFileBackedFuture])
              {

                objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Atomic stores do not support file backed futures" userInfo:0]);
              }
            }

            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }

          while (v14);
        }
      }

      uint64_t v9 = -[NSManagedObjectModel countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v29,  v34,  16LL);
    }

    while (v9);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NSAtomicStore;
  v18 = -[NSPersistentStore initWithPersistentStoreCoordinator:configurationName:URL:options:]( &v24,  sel_initWithPersistentStoreCoordinator_configurationName_URL_options_,  coordinator,  configurationName,  url,  options);
  if (v18)
  {
    v18->_nodeCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v18->_entityCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v18;
}

- (void)dealloc
{
  self->_nodeCache = 0LL;
  self->_entityCache = 0LL;

  self->_storeMetadata = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAtomicStore;
  -[NSPersistentStore dealloc](&v3, sel_dealloc);
}

- (BOOL)save:(NSError *)error
{
  return -[NSAtomicStore load:](v3, v4, v5);
}

- (BOOL)load:(NSError *)error
{
  return result;
}

- (void)addCacheNodes:(NSSet *)cacheNodes
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  SEL v5 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithArray:",  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( -[NSPersistentStore _persistentStoreCoordinator](self, "_persistentStoreCoordinator"),  "managedObjectModel"),  "entitiesForConfiguration:",  -[NSPersistentStore configurationName](self, "configurationName")),  "valueForKey:",  @"name"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v6 = -[NSSet countByEnumeratingWithState:objects:count:]( cacheNodes,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(cacheNodes);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend( v5,  "containsObject:",  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectID"), "entity"), "name")) & 1) == 0)
        {

          objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Store %@ cannot hold instances of entity %@", self, objc_msgSend((id)objc_msgSend(v10, "objectID"), "entity")), 0 reason userInfo]);
        }

        if (self)
        {
          -[NSMutableDictionary setObject:forKey:]( self->_nodeCache,  "setObject:forKey:",  v10,  [v10 objectID]);
          -[NSAtomicStore _insertNodeIntoEntityCache:]((uint64_t)self, v10);
        }
      }

      uint64_t v7 = -[NSSet countByEnumeratingWithState:objects:count:]( cacheNodes,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (NSSet)cacheNodes
{
  return (NSSet *)objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  -[NSMutableDictionary allValues](self->_nodeCache, "allValues"));
}

- (NSAtomicStoreCacheNode)cacheNodeForObjectID:(NSManagedObjectID *)objectID
{
  return (NSAtomicStoreCacheNode *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", objectID);
}

- (NSAtomicStoreCacheNode)newCacheNodeForManagedObject:(NSManagedObject *)managedObject
{
  return result;
}

- (void)updateCacheNode:(NSAtomicStoreCacheNode *)node fromManagedObject:(NSManagedObject *)managedObject
{
}

- (id)newReferenceObjectForManagedObject:(NSManagedObject *)managedObject
{
  int64_t v4 = self->_nextReference + 1;
  self->_nextReference = v4;
  objc_sync_exit(self);
  return (id)[objc_alloc(MEMORY[0x189607968]) initWithInteger:v4];
}

- (NSManagedObjectID)objectIDForEntity:(NSEntityDescription *)entity referenceObject:(id)data
{
  BOOL result = (NSManagedObjectID *)objc_msgSend( objc_alloc((Class)-[NSPersistentStore objectIDFactoryForEntity:]( self,  "objectIDFactoryForEntity:",  entity)),  "initWithObject:",  data);
  if (BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88)) {
    return result;
  }
  return result;
}

- (id)referenceObjectForObjectID:(NSManagedObjectID *)objectID
{
  if (!objectID) {
    return 0LL;
  }
  if ((NSAtomicStore *)-[NSManagedObjectID persistentStore](objectID, "persistentStore") == self) {
    return -[NSManagedObjectID _referenceData](objectID, "_referenceData");
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot retrieve referenceObject from an objectID that was not created by this store" userInfo:0]);
  return -[NSAtomicStore _rawMetadata__](v5, v6);
}

- (id)_rawMetadata__
{
  return self->_storeMetadata;
}

- (id)metadata
{
  id result = self->_storeMetadata;
  if (!result)
  {
    id result = (id)[MEMORY[0x189603FC8] dictionaryWithObject:+[_PFRoutines _getUUID]() forKey:@"NSStoreUUID"];
    self->_storeMetadata = (NSMutableDictionary *)result;
  }

  return result;
}

- (void)setMetadata:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSAtomicStore;
  -[NSPersistentStore setMetadata:](&v6, sel_setMetadata_);
  if (([a3 isEqual:self->_storeMetadata] & 1) == 0)
  {
    id v5 = -[NSPersistentStore _updatedMetadataWithSeed:includeVersioning:]( self,  "_updatedMetadataWithSeed:includeVersioning:",  a3,  1LL);

    self->_storeMetadata = (NSMutableDictionary *)v5;
  }

- (uint64_t)_insertNodeIntoEntityCache:(uint64_t)a1
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "objectID"), "entity");
  if (v4)
  {
    if ((*(_BYTE *)(v4 + 120) & 4) != 0)
    {
      id v5 = *(void **)(v4 + 72);
    }

    else
    {
      do
      {
        id v5 = (void *)v4;
        uint64_t v4 = [(id)v4 superentity];
      }

      while (v4);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  uint64_t v6 = [v5 name];
  id v7 = (id)[*(id *)(a1 + 112) objectForKey:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x189603FE0]);
    [*(id *)(a1 + 112) setObject:v7 forKey:v6];
  }

  return [v7 addObject:a2];
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  if (!a3) {
LABEL_90:
  }
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"Unknown command type %@", a4, a5, a3), 0 reason userInfo]);
  switch([a3 requestType])
  {
    case 1LL:
      if ([a3 resultType] == 4) {
        goto LABEL_4;
      }
      v74 = self;
      id v75 = a3;
      v76 = (void **)a4;
      return -[NSAtomicStore executeFetchRequest:withContext:]((uint64_t)v74, v75, v76);
    case 2LL:
      if (!self) {
        return 0LL;
      }
      if (!-[NSSaveChangesRequest hasChanges]((BOOL)a3))
      {
        unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->super._isMetadataDirty);
        if ((v11 & 1) == 0) {
          return (id)NSArray_EmptyArray;
        }
      }

      obuint64_t j = a3;
      __int128 v12 = (void *)[a3 insertedObjects];
      __int128 v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v12, "count"));
      __int128 v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v12, "count"));
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      uint64_t v15 = [v12 countByEnumeratingWithState:&v99 objects:v107 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v100;
        do
        {
          for (uint64_t i = 0LL; i != v16; ++i)
          {
            if (*(void *)v100 != v17) {
              objc_enumerationMutation(v12);
            }
            v19 = *(void **)(*((void *)&v99 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v19, "objectID"), "isTemporaryID"))
            {
              v20 = -[NSAtomicStore _getNewIDForObject:](self, v19);
              [v13 addObject:v19];
              [v14 addObject:v20];
            }
          }

          uint64_t v16 = [v12 countByEnumeratingWithState:&v99 objects:v107 count:16];
        }

        while (v16);
      }

      if ([v13 count])
      {
        v21 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)a4, v13, v14);
        if (v21) {
          -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)obj, (uint64_t)v21);
        }
      }

      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      uint64_t v22 = [v12 countByEnumeratingWithState:&v95 objects:v106 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v96;
        do
        {
          for (uint64_t j = 0LL; j != v23; ++j)
          {
            if (*(void *)v96 != v24) {
              objc_enumerationMutation(v12);
            }
            if (*(void *)(*((void *)&v95 + 1) + 8 * j))
            {
              __int128 v26 = -[NSAtomicStore newCacheNodeForManagedObject:](self, "newCacheNodeForManagedObject:");
              -[NSMutableDictionary setObject:forKey:]( self->_nodeCache,  "setObject:forKey:",  v26,  -[NSAtomicStoreCacheNode objectID](v26, "objectID"));
              -[NSAtomicStore _insertNodeIntoEntityCache:]((uint64_t)self, v26);
            }
          }

          uint64_t v23 = [v12 countByEnumeratingWithState:&v95 objects:v106 count:16];
        }

        while (v23);
      }

      __int128 v27 = (void *)[obj deletedObjects];
      id v28 = objc_alloc_init(MEMORY[0x189603FE0]);
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      uint64_t v29 = [v27 countByEnumeratingWithState:&v91 objects:v105 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v92;
        do
        {
          for (uint64_t k = 0LL; k != v30; ++k)
          {
            if (*(void *)v92 != v31) {
              objc_enumerationMutation(v27);
            }
            v33 = *(void **)(*((void *)&v91 + 1) + 8 * k);
            if (-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", [v33 objectID])) {
              objc_msgSend( v28,  "addObject:",  -[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", objc_msgSend(v33, "objectID")));
            }
          }

          uint64_t v30 = [v27 countByEnumeratingWithState:&v91 objects:v105 count:16];
        }

        while (v30);
      }

      -[NSAtomicStore willRemoveCacheNodes:](self, "willRemoveCacheNodes:", v28);

      __int128 v89 = 0u;
      __int128 v90 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      uint64_t v34 = [v27 countByEnumeratingWithState:&v87 objects:v104 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v88;
        do
        {
          uint64_t v37 = 0LL;
          do
          {
            if (*(void *)v88 != v36) {
              objc_enumerationMutation(v27);
            }
            v38 = *(void **)(*((void *)&v87 + 1) + 8 * v37);
            if (v38)
            {
              v39 = (void *)-[NSMutableDictionary objectForKey:]( self->_nodeCache,  "objectForKey:",  [v38 objectID]);
              uint64_t v40 = [v39 objectID];
              if (v40) {
                -[NSMutableDictionary removeObjectForKey:](self->_nodeCache, "removeObjectForKey:", v40);
              }
              uint64_t v41 = objc_msgSend((id)objc_msgSend(v39, "objectID"), "entity");
              if (v41)
              {
                if ((*(_BYTE *)(v41 + 120) & 4) != 0)
                {
                  v42 = *(void **)(v41 + 72);
                }

                else
                {
                  do
                  {
                    v42 = (void *)v41;
                    uint64_t v41 = [(id)v41 superentity];
                  }

                  while (v41);
                }
              }

              else
              {
                v42 = 0LL;
              }

              uint64_t v43 = [v42 name];
              if (v43)
              {
                uint64_t v44 = v43;
                v45 = (void *)-[NSMutableDictionary objectForKey:](self->_entityCache, "objectForKey:", v43);
                if (v45)
                {
                  v46 = v45;
                  [v45 removeObject:v39];
                  if (![v46 count]) {
                    -[NSMutableDictionary removeObjectForKey:](self->_entityCache, "removeObjectForKey:", v44);
                  }
                }
              }
            }

            ++v37;
          }

          while (v37 != v35);
          uint64_t v47 = [v27 countByEnumeratingWithState:&v87 objects:v104 count:16];
          uint64_t v35 = v47;
        }

        while (v47);
      }

      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      id obja = (id)[obj updatedObjects];
      uint64_t v48 = [obja countByEnumeratingWithState:&v83 objects:v103 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v84;
        do
        {
          for (uint64_t m = 0LL; m != v49; ++m)
          {
            if (*(void *)v84 != v50) {
              objc_enumerationMutation(obja);
            }
            v52 = *(id ***)(*((void *)&v83 + 1) + 8 * m);
            if (v52)
            {
              v53 = (unint64_t *)[*(id *)(*((void *)&v83 + 1) + 8 * m) entity];
              if (v53) {
                v54 = (void *)v53[14];
              }
              else {
                v54 = 0LL;
              }
              uint64_t v59 = _kvcPropertysPrimitiveGetters(v53);
              unint64_t v61 = v54[18];
              uint64_t v60 = v54[19];
              if (v61 < v60 + v61)
              {
                do
                {
                  _PF_Handler_Primitive_GetProperty(v52, v61, 0LL, *(void *)(v59 + 8 * v61), v55, v56, v57, v58);
                  [v62 count];
                  ++v61;
                  --v60;
                }

                while (v60);
              }

              unint64_t v64 = v54[26];
              uint64_t v63 = v54[27];
              if (v64 < v63 + v64)
              {
                do
                {
                  _PF_Handler_Primitive_GetProperty(v52, v64, 0LL, *(void *)(v59 + 8 * v64), v55, v56, v57, v58);
                  [v65 count];
                  ++v64;
                  --v63;
                }

                while (v63);
              }

              v66 = (void *)-[NSMutableDictionary objectForKey:]( self->_nodeCache,  "objectForKey:",  [v52 objectID]);
              -[NSAtomicStore updateCacheNode:fromManagedObject:](self, "updateCacheNode:fromManagedObject:", v66, v52);
              objc_msgSend(v66, "_setVersionNumber:", objc_msgSend(v66, "_versionNumber") + 1);
            }
          }

          uint64_t v49 = [obja countByEnumeratingWithState:&v83 objects:v103 count:16];
        }

        while (v49);
      }

      id v82 = 0LL;
      id v67 = -[NSAtomicStore metadata](self, "metadata");
      if (objc_msgSend((id)objc_msgSend(v67, "objectForKey:", 0x189EBA2E8), "integerValue") != self->_nextReference)
      {
        uint64_t v68 = objc_msgSend(MEMORY[0x189607968], "numberWithInteger:");
        v69 = (void *)[v67 mutableCopy];
        [v69 setObject:v68 forKey:0x189EBA2E8];
        -[NSAtomicStore setMetadata:](self, "setMetadata:", v69);
      }

      if (-[NSAtomicStore save:](self, "save:", &v82))
      {
        -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 0LL);
        return (id)NSArray_EmptyArray;
      }

      else
      {
        if (v82)
        {
          uint64_t v78 = [v82 code];
          if (v82) {
            v77 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"NSCoreDataPrimaryError",  0);
          }
          else {
            v77 = 0LL;
          }
        }

        else
        {
          v77 = 0LL;
          uint64_t v78 = 134030LL;
        }

        id v79 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A48],  v78,  (uint64_t)@"Error saving the persistent store.",  v77);
        objc_exception_throw(v79);
        return -[NSAtomicStore executeFetchRequest:withContext:]((uint64_t)v74, v75, v76);
      }

    case 3LL:
LABEL_4:
      if (!self) {
        return 0LL;
      }
      id v9 = (id)[a3 copy];
      objc_msgSend( v9,  "setPredicate:",   -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( _NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:",  objc_msgSend(v9, "predicate")));
      return (id)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLong:",  objc_msgSend(-[NSAtomicStore _retrieveNodesSatisfyingRequest:]((uint64_t)self, v9), "count")));
    case 8LL:
      if (!a5) {
        return 0LL;
      }
      v70 = (void *)MEMORY[0x189607870];
      uint64_t v71 = *MEMORY[0x189607460];
      v72 = &unk_189F03220;
      goto LABEL_86;
    case 10LL:
      if (!a5) {
        return 0LL;
      }
      v70 = (void *)MEMORY[0x189607870];
      uint64_t v71 = *MEMORY[0x189607460];
      v72 = &unk_189F03248;
LABEL_86:
      id v73 = (id)[v70 errorWithDomain:v71 code:134091 userInfo:v72];
      id result = 0LL;
      *a5 = v73;
      return result;
    default:
      goto LABEL_90;
  }

- (id)executeFetchRequest:(void *)a3 withContext:
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  uint64_t v75 = a1;
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = a2;
  if ([a2 propertiesToGroupBy]) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported fetch request: store %@ does not support GROUP BY", v75), 0 reason userInfo]);
  }
  id v5 =  -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( _NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:",  [v4 predicate]);
  uint64_t v6 = *(void *)(v75 + 48);
  id v7 = (id)[v4 copy];
  [v7 setPredicate:v5];
  id v8 = -[NSAtomicStore _retrieveNodesSatisfyingRequest:](v75, v7);
  uint64_t v9 = [v4 resultType];
  uint64_t v10 = [v4 resultType];
  char v11 = [v4 includesPropertyValues];
  char v12 = [v4 returnsObjectsAsFaults];
  uint64_t v13 = [v8 count];
  unint64_t v14 = v13;
  unint64_t v66 = v13;
  if (!v9)
  {
    id v65 = &v63;
    MEMORY[0x1895F8858](v13);
    v20 = (char *)&v63 - v19;
    if (v14 >= 0x201)
    {
      v20 = (char *)NSAllocateScannedUncollectable();
      objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
    }

    else
    {
      bzero((char *)&v63 - v19, 8 * v18);
      objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
      if (!v14)
      {
        char v21 = 1;
LABEL_18:
        id v8 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:v20 count:v14];
        if ((v21 & 1) == 0)
        {
          __int128 v27 = (void **)v20;
          unint64_t v28 = v14;
          do
          {
            uint64_t v29 = *v27++;

            --v28;
          }

          while (v28);
        }

        if (v14 >= 0x201) {
          NSZoneFree(0LL, v20);
        }
        goto LABEL_72;
      }
    }

    uint64_t v22 = 0LL;
    char v23 = v11 ^ 1 | v12;
    do
    {
      uint64_t v24 = *(void **)&v20[8 * v22];
      __int128 v25 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](a3, v24, v6);
      if ((v23 & 1) == 0)
      {
        __int128 v26 = (void *)[*(id *)(v75 + 104) objectForKey:v24];
        if (v25) {
          v25[4] |= 0x200u;
        }
        _PFFaultHandlerFulfillFault(v6, (uint64_t)v25, (uint64_t)a3, v26, 1);
      }

      *(void *)&v20[8 * v22++] = v25;
    }

    while (v66 != v22);
    char v21 = 0;
    unint64_t v14 = v66;
    goto LABEL_18;
  }

  if (v10 != 2) {
    goto LABEL_72;
  }
  id v65 = &v63;
  MEMORY[0x1895F8858](v13);
  uint64_t v17 = (char *)&v63 - v16;
  if (v14 > 0x200) {
    uint64_t v17 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v63 - v16, 8 * v15);
  }
  objc_msgSend(v8, "getObjects:range:", v17, 0, v14);
  id v30 = (id)[v4 propertiesToFetch];
  if (!v30)
  {
    uint64_t v31 = (void *)[v4 entity];
    if (v31) {
      uint64_t v32 = v31[14];
    }
    else {
      uint64_t v32 = 0LL;
    }
    uint64_t v33 = objc_msgSend((id)objc_msgSend(v31, "propertiesByName"), "values");
    id v30 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v33 + 8 * *(void *)(v32 + 48) count:*(void *)(v32 + 56) + *(void *)(v32 + 48)];
  }

  uint64_t v34 = [v30 count];
  unint64_t v35 = MEMORY[0x1895F8858](v34);
  uint64_t v37 = (char *)&v63 - v36;
  size_t v39 = 8 * v38;
  unint64_t v64 = v35;
  if (v35 > 0x200)
  {
    uint64_t v37 = (char *)NSAllocateScannedUncollectable();
    v69 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)&v63 - v36, v39);
    MEMORY[0x1895F8858](v40);
    v69 = (char *)&v63 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v69, v39);
  }

  id v72 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v71 = objc_opt_class();
  if (!v14)
  {
    id v8 = (id)[MEMORY[0x189603FA8] arrayWithObjects:v17 count:0];
    goto LABEL_69;
  }

  uint64_t v63 = v4;
  uint64_t v76 = 0LL;
  id v41 = 0LL;
  id v67 = v37;
  id v74 = v30;
  do
  {
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v78 = 0u;
    __int128 v77 = 0u;
    uint64_t v42 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v77, v81, 16, v63);
    if (!v42) {
      goto LABEL_60;
    }
    uint64_t v43 = 0LL;
    uint64_t v44 = *(void *)v78;
    do
    {
      uint64_t v45 = 0LL;
      uint64_t v70 = (int)v43;
      v46 = &v69[8 * (int)v43];
      uint64_t v68 = v43;
      id v73 = &v37[8 * (int)v43];
      do
      {
        id v47 = v41;
        if (*(void *)v78 != v44) {
          objc_enumerationMutation(v74);
        }
        uint64_t v48 = *(void **)(*((void *)&v77 + 1) + 8 * v45);
        uint64_t v49 = v17;
        uint64_t v50 = (void *)[*(id *)(v75 + 104) objectForKey:*(void *)&v17[8 * v76]];
        uint64_t v51 = [v48 _propertyType];
        uint64_t v52 = [v48 name];
        if ([v48 _isAttribute])
        {
          uint64_t v53 = [v50 valueForKey:v52];
          goto LABEL_44;
        }

        if (v51 != 5)
        {
          if (v51 == 4)
          {
            uint64_t v53 = objc_msgSend((id)objc_msgSend(v50, "valueForKey:", v52), "objectID");
LABEL_44:
            v54 = (void *)v53;
          }

          else
          {
            v54 = 0LL;
          }

          uint64_t v17 = v49;
          id v41 = v47;
          goto LABEL_46;
        }

        uint64_t v55 = (void *)[v48 expression];
        v54 = (void *)[v55 expressionValueWithObject:v50 context:v72];
        if ([v55 expressionType] == 50)
        {
          uint64_t v17 = v49;
          if (([v55 isCountOnlyRequest] & 1) != 0
            || objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v55, "requestExpression"),  "expressionValueWithObject:context:",  0,  0),  "resultType") == 4)
          {
            v54 = (void *)[v54 lastObject];
          }
        }

        else
        {
          uint64_t v17 = v49;
        }

        id v41 = v47;
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          v54 = (void *)[v54 objectID];
        }
LABEL_46:
        if (!v41) {
          *(void *)&v73[8 * v45] = v52;
        }
        *(void *)&v46[8 * v45++] = v54;
      }

      while (v42 != v45);
      id v30 = v74;
      uint64_t v56 = [v74 countByEnumeratingWithState:&v77 objects:v81 count:16];
      uint64_t v42 = v56;
      uint64_t v43 = v70 + v45;
      uint64_t v37 = v67;
    }

    while (v56);
    LODWORD(v42) = v45 + v68;
    unint64_t v14 = v66;
LABEL_60:
    if (!v41) {
      id v41 = -[NSKnownKeysMappingStrategy initForKeys:count:]( objc_alloc(&OBJC_CLASS___NSKnownKeysMappingStrategy),  "initForKeys:count:",  v37,  (int)v42);
    }
    uint64_t v57 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v41);
    uint64_t v58 = v76;
    *(void *)&v17[8 * v76] = v57;
    -[NSKnownKeysDictionary setValues:](v57, "setValues:", v69);
    uint64_t v76 = v58 + 1;
  }

  while (v58 + 1 != v14);
  id v8 = (id)[MEMORY[0x189603FA8] arrayWithObjects:v17 count:v14];
  uint64_t v59 = 0LL;
  do

  while (v14 != v59);
  if (v14 >= 0x201) {
    NSZoneFree(0LL, v17);
  }
  uint64_t v4 = v63;
LABEL_69:
  if (v64 >= 0x201)
  {
    NSZoneFree(0LL, v37);
    NSZoneFree(0LL, v69);
  }

LABEL_72:
  unint64_t v60 = [v4 fetchOffset];
  if (v60)
  {
    if (v60 <= v14) {
      [v8 removeObjectsInRange:0];
    }
    else {
      [v8 removeAllObjects];
    }
    unint64_t v14 = [v8 count];
  }

  unint64_t v61 = [v4 fetchLimit];
  if (v61 && v14 > v61) {
    objc_msgSend(v8, "removeObjectsInRange:", v61, v14 - v61);
  }
  return v8;
}

- (void)_retrieveNodesSatisfyingRequest:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v4 = [a2 entity];
  id v5 = (void *)v4;
  if (v4)
  {
    if ((*(_BYTE *)(v4 + 120) & 4) != 0)
    {
      uint64_t v6 = *(void **)(v4 + 72);
    }

    else
    {
      do
      {
        uint64_t v6 = (void *)v4;
        uint64_t v4 = [(id)v4 superentity];
      }

      while (v4);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  id v7 = (void *)objc_msgSend(*(id *)(a1 + 112), "objectForKey:", objc_msgSend(v6, "name"));
  id v8 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  __int128 v26 = (void *)[a2 predicate];
  if (!v26) {
    __int128 v26 = (void *)[MEMORY[0x1896079C8] predicateWithValue:1];
  }
  unint64_t v9 = [a2 fetchLimit];
  if ([a2 sortDescriptors]) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  int v11 = !v10;
  int v12 = objc_msgSend(a2, "includesSubentities", a2);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v13 = v7;
  uint64_t v14 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
LABEL_16:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v28 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * v17);
      uint64_t v19 = objc_msgSend((id)objc_msgSend(v18, "objectID"), "entity");
      if ((v5 == (void *)v19 || v12 && [v5 _subentitiesIncludes:v19])
        && [v26 evaluateWithObject:v18])
      {
        [v8 addObject:v18];
      }

      if (v11 && [v8 count] > v9) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v15) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  uint64_t v20 = [v25 sortDescriptors];
  if (v20) {
    [v8 sortUsingDescriptors:v20];
  }
  uint64_t v21 = [v8 count];
  if (v21)
  {
    uint64_t v22 = v21;
    for (uint64_t i = 0LL; i != v22; ++i)
      objc_msgSend( v8,  "replaceObjectAtIndex:withObject:",  i,  objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", i), "objectID"));
  }

  return v8;
}

- (void)_getNewIDForObject:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    uint64_t v4 = (void *)[result newReferenceObjectForManagedObject:a2];
    uint64_t v5 = objc_msgSend( objc_alloc((Class)objc_msgSend(v3, "objectIDFactoryForEntity:", objc_msgSend(a2, "entity"))),  "initWithObject:",  v4);

    return (void *)v5;
  }

  return result;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  if (self) {
    self = (NSAtomicStore *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", a3, a4, a5);
  }
  return self;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (self) {
    id v7 = (void *)-[NSMutableDictionary objectForKey:](self->_nodeCache, "objectForKey:", a4);
  }
  else {
    id v7 = 0LL;
  }
  uint64_t v8 = [a3 name];
  char v9 = [a3 isToMany];
  BOOL v10 = (void *)[v7 valueForKey:v8];
  int v11 = v10;
  if ((v9 & 1) == 0) {
    return (id)[v10 objectID];
  }
  int v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFIndex v13 = [v10 count];
  Mutable = CFArrayCreateMutable(v12, v13, MEMORY[0x189605228]);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v15 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v11);
        }
        CFArrayAppendValue(Mutable, (const void *)[*(id *)(*((void *)&v20 + 1) + 8 * v18++) objectID]);
      }

      while (v16 != v18);
      uint64_t v16 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v16);
  }

  return Mutable;
}

- (void)_didLoadMetadata
{
  objc_super v3 = (void *)objc_msgSend(-[NSAtomicStore metadata](self, "metadata"), "objectForKey:", 0x189EBA2E8);
  if (v3) {
    objc_super v3 = (void *)[v3 integerValue];
  }
  self->_nextReference = (int64_t)v3;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)objc_msgSend(MEMORY[0x189603FA8], "array", a3, a4);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a3);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = (void *)[v11 objectID];
        if ([v12 isTemporaryID])
        {
          CFIndex v13 = -[NSAtomicStore _getNewIDForObject:](self, v11);
          [v6 addObject:v13];
        }

        else
        {
          [v6 addObject:v12];
        }
      }

      uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  return v6;
}

@end