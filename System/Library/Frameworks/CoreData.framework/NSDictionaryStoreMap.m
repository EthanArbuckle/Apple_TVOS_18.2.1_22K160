@interface NSDictionaryStoreMap
+ (void)initialize;
- (NSDictionaryStoreMap)initWithStore:(id)a3;
- (NSDictionaryStoreMap)initWithStore:(id)a3 fromArchivedData:(id)a4;
- (NSDictionaryStoreMap)initWithStore:(id)a3 fromPath:(id)a4;
- (id)dataForKey:(id)a3;
- (id)handleFetchRequest:(id)a3;
- (id)retainedObjectIDsForRelationship:(id)a3 forObjectID:(id)a4;
- (uint64_t)_archivedData;
- (void)addObject:(id)a3 objectIDMap:(id)a4;
- (void)dealloc;
- (void)removeObject:(id)a3 objectIDMap:(id)a4;
- (void)saveToPath:(uint64_t)a1;
- (void)updateObject:(id)a3 objectIDMap:(id)a4;
@end

@implementation NSDictionaryStoreMap

+ (void)initialize
{
}

- (NSDictionaryStoreMap)initWithStore:(id)a3
{
  return -[NSDictionaryStoreMap initWithStore:fromPath:](self, "initWithStore:fromPath:", a3, 0LL);
}

- (NSDictionaryStoreMap)initWithStore:(id)a3 fromPath:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NSDictionaryStoreMap;
  v6 = -[NSPersistentStoreMap initWithStore:](&v24, sel_initWithStore_);
  if (!v6) {
    return v6;
  }
  if (!a4)
  {
    v6->_theMap = (NSMutableDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1024];
    v14 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  +[_PFRoutines _getUUID](),  @"NSStoreUUID",  @"Binary",  @"NSStoreType",  0);
    id v15 = -[NSPersistentStoreMap _updatedMetadataWithSeed:includeVersioning:](v6, v14, 1);
    -[NSPersistentStoreMap _setMetadata:]((uint64_t)v6, v15);
    return v6;
  }

  v7 = objc_alloc_init(&OBJC_CLASS___NSBinaryObjectStoreFile);
  v7->_storeOptions = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "options"), "copy");
  uint64_t v23 = 0LL;
  -[NSBinaryObjectStoreFile readFromFile:error:]((uint64_t)v7, (uint64_t)a4, &v23);
  if ((v8 & 1) != 0)
  {
    if (v7->_databaseVersion == 134481920)
    {
      -[NSPersistentStoreMap _setMetadata:]((uint64_t)v6, v7->_fullMetadata);
      v6->super._nextPK64 = v7->_primaryKeyGeneration;
      v9 = v7->_mapData;
      v6->_theMap = v9;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      v10 = (void *)-[NSMutableDictionary allValues](v9, "allValues");
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v10);
            }
            -[NSStoreMapNode _setMap:](*(void *)(*((void *)&v19 + 1) + 8 * v13++), (uint64_t)v6);
          }

          while (v11 != v13);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }

        while (v11);
      }

      return v6;
    }

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't load binary data from file (file was created by an incompatible version of CoreData)" userInfo:0]);
  }

  else
  {

    v17 = (void *)[MEMORY[0x189603F68] dictionaryWithObject:v23 forKey:*MEMORY[0x189607798]];
    id v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  259LL,  (uint64_t)@"Can't read binary data from file",  v17);
    objc_exception_throw(v18);
  }

  __break(1u);
  return result;
}

- (NSDictionaryStoreMap)initWithStore:(id)a3 fromArchivedData:(id)a4
{
  v40[1] = *MEMORY[0x1895F89C0];
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___NSDictionaryStoreMap;
  v6 = -[NSPersistentStoreMap initWithStore:](&v35, sel_initWithStore_);
  if (!v6) {
    return v6;
  }
  if (!a4)
  {
    v6->_theMap = (NSMutableDictionary *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:1024];
    return v6;
  }

  v7 = (void *)[a3 options];
  char v8 = v7;
  if (byte_18C4ABDBC)
  {
    v9 = (void *)[v7 objectForKey:@"_NSBinaryStoreInsecureDecodingCompatibilityOption"];
    if (v9) {
      int v10 = [v9 BOOLValue] ^ 1;
    }
    else {
      int v10 = 1;
    }
  }

  else
  {
    int v10 = 0;
  }

  id v34 = 0LL;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:a4 error:&v34];
  if (v34)
  {
    uint64_t v23 = [v34 code];
    uint64_t v39 = *MEMORY[0x189607798];
    v40[0] = v34;
    objc_super v24 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    id v25 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189607590],  v23,  (uint64_t)@"Keyed archiver failure",  v24);
    objc_exception_throw(v25);
  }

  else
  {
    id v12 = (id)+[NSBinaryObjectStore _classesForPropertyValues]();
    if (v10)
    {
      [v11 setRequiresSecureCoding:1];
      [v11 _allowDecodingCyclesInSecureMode];
      uint64_t v13 = [v8 objectForKey:@"NSBinaryStoreSecureDecodingClasses"];
      if (v13)
      {
        id v12 = (id)[v12 mutableCopy];
        [v12 unionSet:v13];
      }
    }

    else
    {
      [v11 setRequiresSecureCoding:0];
    }

    [v11 setDecodingFailurePolicy:1];
    if ([v11 decodeIntForKey:@"_NSStoreMapArchiveVersion"] == 134481920)
    {
      v14 = (void *)[v11 decodeObjectOfClasses:v12 forKey:@"_NSStoreMapArchiveMetadata"];
      if (v14)
      {
        id v15 = -[NSPersistentStoreMap _updatedMetadataWithSeed:includeVersioning:](v6, v14, 1);
        -[NSPersistentStoreMap _setMetadata:]((uint64_t)v6, v15);
      }

      v16 = (void *)[v11 decodeObjectOfClass:objc_opt_class() forKey:@"_NSStoreMapArchiveNextPK"];
      if (v16) {
        v16 = (void *)[v16 unsignedLongLongValue];
      }
      v6->super._nextPK64 = (unint64_t)v16;
      v17 = (NSMutableDictionary *)(id)[v11 decodeObjectOfClasses:v12 forKey:@"_NSStoreMapArchiveData"];
      v6->_theMap = v17;
      if (v17)
      {
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id v18 = (void *)-[NSMutableDictionary allValues](v17, "allValues", 0LL);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v31;
          do
          {
            for (uint64_t i = 0LL; i != v19; ++i)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v18);
              }
              -[NSStoreMapNode _setMap:](*(void *)(*((void *)&v30 + 1) + 8 * i), (uint64_t)v6);
            }

            uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }

          while (v19);
        }
      }

      if (![v11 error])
      {
        [v11 finishDecoding];

        if (v34)
        {

          return 0LL;
        }

        return v6;
      }

      id v34 = (id)[v11 error];
      uint64_t v27 = [v34 code];
      uint64_t v36 = *MEMORY[0x189607798];
      id v37 = v34;
      v28 = (void *)[MEMORY[0x189603F68] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v29 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189607590],  v27,  (uint64_t)@"Keyed archiver failure",  v28);
      objc_exception_throw(v29);
    }

    else
    {
      id v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189607590],  262LL,  (uint64_t)@"Can't load data from archived data (archived data was created by an incompatible version of CoreData)",  0LL);
      objc_exception_throw(v26);
    }
  }

  __break(1u);
  return result;
}

- (void)saveToPath:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  char v25 = 0;
  v4 = (void *)[MEMORY[0x1896078A8] defaultManager];
  uint64_t v5 = [a2 stringByDeletingLastPathComponent];
  if (([v4 fileExistsAtPath:v5 isDirectory:&v25] & 1) == 0)
  {
    int v10 = objc_alloc(&OBJC_CLASS____NSCoreDataException);
    uint64_t v11 = (_NSCoreDataException *)*MEMORY[0x189603A60];
    uint64_t v12 = [NSString stringWithFormat:@"Directory does not exist : %@", v5];
LABEL_10:
    uint64_t v13 = v12;
    v14 = v10;
    uint64_t v15 = (uint64_t)v11;
    uint64_t v16 = 514LL;
    v17 = 0LL;
    goto LABEL_17;
  }

  if (!v25)
  {
    int v10 = objc_alloc(&OBJC_CLASS____NSCoreDataException);
    uint64_t v11 = (_NSCoreDataException *)*MEMORY[0x189603A60];
    uint64_t v12 = [NSString stringWithFormat:@"Not a directory : %@", v5];
    goto LABEL_10;
  }

  v6 = objc_alloc_init(&OBJC_CLASS___NSBinaryObjectStoreFile);
  v6->_storeOptions = (NSDictionary *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "options"), "copy");
  v6->_databaseVersion = 134481920;
  v7 = *(NSDictionary **)(a1 + 24);
  if (v6->_fullMetadata != v7)
  {
    uint64_t v8 = -[NSDictionary copy](v7, "copy");

    v6->_fullMetadata = (NSDictionary *)v8;
  }

  v6->_primaryKeyGeneration = *(void *)(a1 + 32);
  -[NSXPCStoreServerConnectionContext setActiveStore:]((uint64_t)v6, *(void **)(a1 + 48));
  id v24 = 0LL;
  unsigned __int8 v9 = -[NSBinaryObjectStoreFile writeToFile:error:](v6, (uint64_t)a2, (uint64_t)&v24);

  if ((v9 & 1) == 0)
  {
    if (v24)
    {
      int v10 = (_NSCoreDataException *)[MEMORY[0x189603F68] dictionaryWithObject:v24 forKey:*MEMORY[0x189607798]];
      id v18 = v24;
      if (v24)
      {
LABEL_15:
        uint64_t v11 = (_NSCoreDataException *)&OBJC_CLASS____NSCoreDataException;
        if ([v18 code] != 513)
        {
LABEL_18:
          id v21 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)v11,  *MEMORY[0x189603A60],  [v24 code],  (uint64_t)@"Binary store save failed.",  v10);
          -[_NSCoreDataException _setDomain:]((uint64_t)v21, (void *)[v24 domain]);
          objc_exception_throw(v21);
          -[NSDictionaryStoreMap dealloc](v22, v23);
          return;
        }

        uint64_t v11 = objc_alloc(&OBJC_CLASS____NSCoreDataException);
        uint64_t v19 = *MEMORY[0x189603A60];
        uint64_t v13 = [NSString stringWithFormat:@"Directory is not writable : %@", v5];
        v14 = v11;
        uint64_t v15 = v19;
        uint64_t v16 = 513LL;
        v17 = v10;
LABEL_17:
        id v20 = -[_NSCoreDataException initWithName:code:reason:userInfo:](v14, v15, v16, v13, v17);
        objc_exception_throw(v20);
        goto LABEL_18;
      }
    }

    else
    {
      int v10 = 0LL;
    }

    id v18 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:512 userInfo:0];
    id v24 = v18;
    goto LABEL_15;
  }

- (void)dealloc
{
  self->_theMap = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDictionaryStoreMap;
  -[NSPersistentStoreMap dealloc](&v3, sel_dealloc);
}

- (id)dataForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", a3);
}

- (void)addObject:(id)a3 objectIDMap:(id)a4
{
  v4 = (id **)a3;
  uint64_t v61 = *MEMORY[0x1895F89C0];
  if (!self)
  {
    v54 = 0LL;
    goto LABEL_41;
  }

  uint64_t v8 = [a3 entity];
  unsigned __int8 v9 = (void *)[a3 objectID];
  v50 = (id **)a3;
  if (!a3)
  {
    v47 = (void *)MEMORY[0x189603F70];
    uint64_t v48 = *MEMORY[0x189603A60];
    v49 = @"Can't construct a node from nil.";
    goto LABEL_48;
  }

  uint64_t v10 = (uint64_t)v9;
  if (!v8)
  {
    v47 = (void *)MEMORY[0x189603F70];
    uint64_t v48 = *MEMORY[0x189603A58];
    v49 = @"Can't find entity for object";
LABEL_48:
    objc_exception_throw((id)[v47 exceptionWithName:v48 reason:v49 userInfo:0]);
  }

  uint64_t v11 = *(void **)(v8 + 112);
  uint64_t v53 = objc_msgSend((id)objc_msgSend((id)v8, "propertiesByName"), "values");
  uint64_t v12 = PF_CALLOC_OBJECT_ARRAY([*(id *)(v8 + 104) length]);
  uint64_t v55 = _kvcPropertysPrimitiveGetters((unint64_t *)v8);
  v54 = -[NSDictionaryMapNode initWithValues:objectID:]( objc_alloc(&OBJC_CLASS___NSDictionaryMapNode),  "initWithValues:objectID:",  v12,  v10);
  -[NSStoreMapNode _setMap:]((uint64_t)v54, (uint64_t)self);
  unint64_t v18 = v11[6];
  uint64_t v17 = v11[7];
  v4 = v50;
  if (v18 < v17 + v18)
  {
    do
    {
      _PF_Handler_Primitive_GetProperty(v50, v18, 0LL, *(void *)(v55 + 8 * v18), v13, v14, v15, v16);
      if (v19) {
        v12[v18] = v19;
      }
      ++v18;
      --v17;
    }

    while (v17);
  }

  unint64_t v20 = v11[12];
  uint64_t v21 = v11[13];
  uint64_t v22 = v53;
  if (v20 < v21 + v20)
  {
    do
    {
      uint64_t v23 = [*(id *)(v22 + 8 * v20) name];
      _PF_Handler_Primitive_GetProperty(v50, v20, v23, *(void *)(v55 + 8 * v20), v24, v25, v26, v27);
      if (v28)
      {
        uint64_t i = v28;
        if (-[NSManagedObject _isValidRelationshipDestination__](v28))
        {
          __int128 v30 = (void *)[(id)i objectID];
          if ((NSMappedObjectStore *)[v30 persistentStore] != self->super._store) {
            goto LABEL_44;
          }
          __int128 v31 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  objc_msgSend(v30, "_referenceData"),  0);
          if (v54) {
            -[NSMutableDictionary setObject:forKey:](v54->super._relatedNodes, "setObject:forKey:", v31, v23);
          }

          uint64_t v22 = v53;
        }
      }

      ++v20;
      --v21;
    }

    while (v21);
  }

  unint64_t v20 = v11[18];
  unint64_t v52 = v11[19] + v20;
  if (v20 < v52)
  {
    do
    {
      uint64_t v32 = [*(id *)(v22 + 8 * v20) name];
      _PF_Handler_Primitive_GetProperty(v4, v20, v32, *(void *)(v55 + 8 * v20), v33, v34, v35, v36);
      if (v37)
      {
        v38 = v37;
        uint64_t v51 = v32;
        uint64_t v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v37, "count"));
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        uint64_t v40 = [v38 countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          v4 = *(id ***)v57;
          do
          {
            for (uint64_t i = 0LL; i != v41; ++i)
            {
              if (*(id ***)v57 != v4) {
                objc_enumerationMutation(v38);
              }
              v42 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              if (-[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v42))
              {
                v43 = (void *)[v42 objectID];
                if ((NSMappedObjectStore *)[v43 persistentStore] != self->super._store)
                {
                  v45 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v50,  @"Source object",  v42,  @"Destination Object",  *(void *)(v53 + 8 * v20),  @"Relationship",  0);

                  while (1)
                  {
                    id v46 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  133010LL,  (uint64_t)@"CoreData does not support persistent cross-store relationships",  v45);
                    objc_exception_throw(v46);
LABEL_44:
                    v45 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v4,  @"Source object",  i,  @"Destination Object",  *(void *)(v53 + 8 * v20),  @"Relationship",  0);
                  }
                }

                objc_msgSend(v39, "addObject:", objc_msgSend(v43, "_referenceData"));
              }
            }

            uint64_t v41 = [v38 countByEnumeratingWithState:&v56 objects:v60 count:16];
          }

          while (v41);
        }

        uint64_t v44 = [v39 count];
        if (v54 && v44) {
          -[NSMutableDictionary setObject:forKey:](v54->super._relatedNodes, "setObject:forKey:", v39, v51);
        }

        v4 = v50;
        uint64_t v22 = v53;
      }

      ++v20;
    }

    while (v20 != v52);
  }

- (void)removeObject:(id)a3 objectIDMap:(id)a4
{
}

- (void)updateObject:(id)a3 objectIDMap:(id)a4
{
  v7 = (unint64_t *)[a3 entity];
  if (v7) {
    uint64_t v8 = (void *)v7[14];
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v13 = _kvcPropertysPrimitiveGetters(v7);
  unint64_t v14 = v8[18];
  uint64_t v15 = v8[19];
  if (v14 < v15 + v14)
  {
    do
    {
      _PF_Handler_Primitive_GetProperty((id **)a3, v14, 0LL, *(void *)(v13 + 8 * v14), v9, v10, v11, v12);
      [v16 count];
      ++v14;
      --v15;
    }

    while (v15);
  }

  unint64_t v17 = v8[26];
  uint64_t v18 = v8[27];
  if (v17 < v18 + v17)
  {
    do
    {
      _PF_Handler_Primitive_GetProperty((id **)a3, v17, 0LL, *(void *)(v13 + 8 * v17), v9, v10, v11, v12);
      [v19 count];
      ++v17;
      --v18;
    }

    while (v18);
  }

  uint64_t v20 = objc_msgSend((id)objc_msgSend(a3, "objectID"), "_referenceData");
  int v21 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", v20), "_versionNumber");
  -[NSDictionaryStoreMap removeObject:objectIDMap:](self, "removeObject:objectIDMap:", a3, a4);
  -[NSDictionaryStoreMap addObject:objectIDMap:](self, "addObject:objectIDMap:", a3, a4);
  objc_msgSend( (id)-[NSMutableDictionary objectForKey:](self->_theMap, "objectForKey:", v20),  "_setVersionNumber:",  (v21 + 1));
}

- (id)retainedObjectIDsForRelationship:(id)a3 forObjectID:(id)a4
{
  uint64_t v5 = (void *)objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_theMap,  "objectForKey:",  objc_msgSend(a4, "_referenceData")),  "destinationsForRelationship:",  objc_msgSend(a3, "name"));
  v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 count];
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v7];
  if (v7)
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      uint64_t v10 = (void *)-[NSMutableDictionary objectForKey:]( self->_theMap,  "objectForKey:",  [v6 objectAtIndex:i]);
      if (v10) {
        objc_msgSend(v8, "addObject:", objc_msgSend(v10, "objectID"));
      }
    }
  }

  return v8;
}

- (id)handleFetchRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  v4 = (void *)-[NSMutableDictionary allValues](self->_theMap, "allValues");
  uint64_t v5 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)[a3 entity];
  uint64_t v7 = (void *)[a3 predicate];
  uint64_t v8 = [a3 fetchLimit];
  unint64_t v25 = v8;
  if ([a3 sortDescriptors]) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  int v10 = !v9;
  int v11 = objc_msgSend(a3, "includesSubentities", a3);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v12 = v4;
  uint64_t v13 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
LABEL_9:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v27 != v15) {
        objc_enumerationMutation(v12);
      }
      unint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
      uint64_t v18 = [v17 entity];
      if ((v6 == (void *)v18 || v11 && [v6 _subentitiesIncludes:v18])
        && (!v7 || [v7 evaluateWithObject:v17]))
      {
        [v5 addObject:v17];
      }

      if (v10 && [v5 count] > v25) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v14) {
          goto LABEL_9;
        }
        break;
      }
    }
  }

  uint64_t v19 = [v24 sortDescriptors];
  if (v19) {
    [v5 sortUsingDescriptors:v19];
  }
  uint64_t v20 = [v5 count];
  if (v20)
  {
    uint64_t v21 = v20;
    for (uint64_t i = 0LL; i != v21; ++i)
      objc_msgSend( v5,  "replaceObjectAtIndex:withObject:",  i,  objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", i), "objectID"));
  }

  return v5;
}

- (uint64_t)_archivedData
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = [MEMORY[0x189603FB8] dataWithCapacity:1024];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initForWritingWithMutableData:v2];
  [v3 encodeInt:134481920 forKey:@"_NSStoreMapArchiveVersion"];
  [v3 encodeObject:a1[3] forKey:@"_NSStoreMapArchiveMetadata"];
  objc_msgSend( v3,  "encodeObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", a1[4]),  @"_NSStoreMapArchiveNextPK");
  [v3 encodeObject:a1[6] forKey:@"_NSStoreMapArchiveData"];
  [v3 finishEncoding];

  return v2;
}

@end