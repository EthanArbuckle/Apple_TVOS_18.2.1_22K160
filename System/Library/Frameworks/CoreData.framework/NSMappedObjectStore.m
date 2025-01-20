@interface NSMappedObjectStore
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
- (NSMappedObjectStore)init;
- (NSMappedObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (id)_rawMetadata__;
- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)getNewIDForObject:(id *)result;
- (id)identifier;
- (id)metadata;
- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6;
- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5;
- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4;
- (void)_setMap:(void *)result;
- (void)dealloc;
- (void)executeFetchRequest:(void *)a3 withContext:;
- (void)saveDocumentToPath:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation NSMappedObjectStore

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  return 0LL;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  return 0;
}

- (NSMappedObjectStore)init
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSMappedObjectStore must be initialized with initWithPersistentStoreCoordinator:configurationName:URL:options:" userInfo:0]);
  return -[NSMappedObjectStore initWithPersistentStoreCoordinator:configurationName:URL:options:]( v2,  v3,  v4,  v5,  v6,  v7);
}

- (NSMappedObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v7 = (void *)[a3 managedObjectModel];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v45;
          do
          {
            for (uint64_t j = 0LL; j != v14; ++j)
            {
              if (*(void *)v45 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              uint64_t v18 = [v17 _propertyType];
              switch(v18)
              {
                case 2LL:
                  if ([v17 attributeType] == 1000
                    && [v17 isFileBackedFuture])
                  {

                    v31 = (void *)MEMORY[0x189603F70];
                    uint64_t v32 = *MEMORY[0x189603A60];
                    v33 = @"Core Data provided atomic stores do not support file backed futures";
LABEL_35:
                    objc_exception_throw((id)[v31 exceptionWithName:v32 reason:v33 userInfo:0]);
                  }

                  break;
                case 6LL:

                  v31 = (void *)MEMORY[0x189603F70];
                  uint64_t v32 = *MEMORY[0x189603A60];
                  v33 = @"Core Data provided atomic stores do not support derived properties";
                  goto LABEL_35;
                case 7LL:

                  v31 = (void *)MEMORY[0x189603F70];
                  uint64_t v32 = *MEMORY[0x189603A60];
                  v33 = @"Core Data provided atomic stores do not support composite attributes";
                  goto LABEL_35;
              }
            }

            uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }

          while (v14);
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }

    while (v9);
  }

  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___NSMappedObjectStore;
  v19 = -[NSPersistentStore initWithPersistentStoreCoordinator:configurationName:URL:options:]( &v43,  sel_initWithPersistentStoreCoordinator_configurationName_URL_options_,  a3,  a4,  a5,  a6);
  v20 = v19;
  if (v19)
  {
    v21 = (void *)objc_msgSend( (id)objc_msgSend( -[NSPersistentStore _persistentStoreCoordinator](v19, "_persistentStoreCoordinator"),  "managedObjectModel"),  "entitiesForConfiguration:",  a4);
    CFIndex v22 = *MEMORY[0x189605258];
    callBacks.retain = 0LL;
    callBacks.release = 0LL;
    callBacks.version = v22;
    *(_OWORD *)&callBacks.copyDescription = *(_OWORD *)(MEMORY[0x189605258] + 24LL);
    callBacks.hash = *(CFSetHashCallBack *)(MEMORY[0x189605258] + 40LL);
    v20->_entitiesToFetch = (NSSet *)CFSetCreateMutable(0, [v21 count], &callBacks);
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (uint64_t k = 0LL; k != v24; ++k)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v38 + 1) + 8 * k);
          -[NSSet addObject:](v20->_entitiesToFetch, "addObject:", v27);
          -[NSSet addObjectsFromArray:](v20->_entitiesToFetch, "addObjectsFromArray:", [v27 subentities]);
          uint64_t v28 = [v27 superentity];
          if (v28)
          {
            v29 = (void *)v28;
            do
            {
              -[NSSet addObject:](v20->_entitiesToFetch, "addObject:", v29);
              v29 = (void *)[v29 superentity];
            }

            while (v29);
          }
        }

        uint64_t v24 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
      }

      while (v24);
    }
  }

  return v20;
}

- (void)dealloc
{
  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);

  self->_theMap = 0LL;
  entitiesToFetch = self->_entitiesToFetch;
  if (entitiesToFetch) {
    CFRelease(entitiesToFetch);
  }
  [v3 drain];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSMappedObjectStore;
  -[NSPersistentStore dealloc](&v5, sel_dealloc);
}

- (void)_setMap:(void *)result
{
  if (result)
  {
    id v3 = result;
    id v4 = (void *)result[13];
    if (v4 != a2)
    {

      result = a2;
      v3[13] = result;
    }
  }

  return result;
}

- (void)saveDocumentToPath:(id)a3
{
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  if (!a3) {
LABEL_61:
  }
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"Unknown command type %@", a4, a5, a3), 0 reason userInfo]);
  switch([a3 requestType])
  {
    case 1LL:
      if ([a3 resultType] == 4) {
        goto LABEL_4;
      }
      if (!-[NSSet containsObject:](self->_entitiesToFetch, "containsObject:", [a3 entity])) {
        return (id)NSArray_EmptyArray;
      }
      return -[NSMappedObjectStore executeFetchRequest:withContext:]((uint64_t)self, a3, (void **)a4);
    case 2LL:
      if (!self) {
        return 0LL;
      }
      if (-[NSSaveChangesRequest hasChanges]((BOOL)a3)
        || (unsigned __int8 v15 = atomic_load((unsigned __int8 *)&self->super._isMetadataDirty), (v15 & 1) != 0))
      {
        id v42 = a4;
        id v43 = a3;
        v16 = (void *)[a3 insertedObjects];
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v16, "count"));
        __int128 v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v16, "count"));
        uint64_t v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v16, "count"));
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        uint64_t v19 = [v16 countByEnumeratingWithState:&v57 objects:v64 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v58;
          do
          {
            for (uint64_t i = 0LL; i != v19; ++i)
            {
              if (*(void *)v58 != v20) {
                objc_enumerationMutation(v16);
              }
              CFIndex v22 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              uint64_t v23 = (void *)[v22 objectID];
              if ([v23 isTemporaryID])
              {
                uint64_t v24 = -[NSMappedObjectStore getNewIDForObject:]((id *)&self->super.super.isa, v22);
                [v17 setObject:v24 forKey:v23];
                [v44 addObject:v22];
                [v18 addObject:v24];
              }
            }

            uint64_t v19 = [v16 countByEnumeratingWithState:&v57 objects:v64 count:16];
          }

          while (v19);
        }

        if ([v44 count])
        {
          uint64_t v25 = (void *)-[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((uint64_t)v42, v44, v18);
          if (v25) {
            -[NSSaveChangesRequest _addChangedObjectIDsNotification:]((uint64_t)v43, (uint64_t)v25);
          }
        }

        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        uint64_t v26 = [v16 countByEnumeratingWithState:&v53 objects:v63 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v54;
          do
          {
            for (uint64_t j = 0LL; j != v26; ++j)
            {
              if (*(void *)v54 != v27) {
                objc_enumerationMutation(v16);
              }
              uint64_t v29 = *(void *)(*((void *)&v53 + 1) + 8 * j);
              if (v29) {
                -[NSPersistentStoreMap addObject:objectIDMap:](self->_theMap, "addObject:objectIDMap:", v29, v17);
              }
            }

            uint64_t v26 = [v16 countByEnumeratingWithState:&v53 objects:v63 count:16];
          }

          while (v26);
        }

        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        v30 = (void *)[v43 deletedObjects];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v62 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v50;
          do
          {
            for (uint64_t k = 0LL; k != v31; ++k)
            {
              if (*(void *)v50 != v32) {
                objc_enumerationMutation(v30);
              }
              uint64_t v34 = *(void *)(*((void *)&v49 + 1) + 8 * k);
              if (v34) {
                -[NSPersistentStoreMap removeObject:objectIDMap:](self->_theMap, "removeObject:objectIDMap:", v34, v17);
              }
            }

            uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v62 count:16];
          }

          while (v31);
        }

        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        v35 = (void *)[v43 updatedObjects];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v45 objects:v61 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v46;
          do
          {
            for (uint64_t m = 0LL; m != v36; ++m)
            {
              if (*(void *)v46 != v37) {
                objc_enumerationMutation(v35);
              }
              uint64_t v39 = *(void *)(*((void *)&v45 + 1) + 8 * m);
              if (v39) {
                -[NSPersistentStoreMap updateObject:objectIDMap:](self->_theMap, "updateObject:objectIDMap:", v39, v17);
              }
            }

            uint64_t v36 = [v35 countByEnumeratingWithState:&v45 objects:v61 count:16];
          }

          while (v36);
        }

        __int128 v40 = -[NSPersistentStore URL](self, "URL");
        if (v40) {
          -[NSMappedObjectStore saveDocumentToPath:](self, "saveDocumentToPath:", -[NSURL path](v40, "path"));
        }
        -[NSPersistentStore _setMetadataDirty:](self, "_setMetadataDirty:", 0LL);
      }

      return (id)NSArray_EmptyArray;
    case 3LL:
LABEL_4:
      if (!self) {
        return 0LL;
      }
      id v9 = (id)[a3 copy];
      objc_msgSend( v9,  "setPredicate:",   -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( _NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:",  objc_msgSend(v9, "predicate")));
      uint64_t v10 = objc_msgSend(-[NSPersistentStoreMap handleFetchRequest:](self->_theMap, "handleFetchRequest:", v9), "count");
      return (id)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLong:", v10));
    case 8LL:
      if (!a5) {
        return 0LL;
      }
      v12 = (void *)MEMORY[0x189607870];
      uint64_t v13 = *MEMORY[0x189607460];
      uint64_t v14 = &unk_189F038B0;
      goto LABEL_56;
    case 10LL:
      if (!a5) {
        return 0LL;
      }
      v12 = (void *)MEMORY[0x189607870];
      uint64_t v13 = *MEMORY[0x189607460];
      uint64_t v14 = &unk_189F038D8;
LABEL_56:
      id v41 = (id)[v12 errorWithDomain:v13 code:134091 userInfo:v14];
      id result = 0LL;
      *a5 = v41;
      return result;
    default:
      goto LABEL_61;
  }

- (void)executeFetchRequest:(void *)a3 withContext:
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  uint64_t v72 = a1;
  if (!a1) {
    return 0LL;
  }
  id v4 = a2;
  if ([a2 propertiesToGroupBy]) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported fetch request: store %@ does not support GROUP BY", v72), 0 reason userInfo]);
  }
  id v5 =  -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:]( +[_NSMemoryStorePredicateRemapper defaultInstance]( _NSMemoryStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:",  [v4 predicate]);
  uint64_t v6 = *(void *)(v72 + 48);
  id v7 = (id)[v4 copy];
  [v7 setPredicate:v5];
  uint64_t v8 = (void *)[*(id *)(v72 + 104) handleFetchRequest:v7];
  uint64_t v9 = [v4 resultType];
  uint64_t v10 = [v4 resultType];
  char v11 = [v4 includesPropertyValues];
  char v12 = [v4 returnsObjectsAsFaults];
  uint64_t v13 = [v8 count];
  unint64_t v14 = v13;
  unint64_t v63 = v13;
  if (v9)
  {
    if (v10 != 2) {
      goto LABEL_70;
    }
    v62 = &v60;
    MEMORY[0x1895F8858](v13);
    v17 = (char *)&v60 - v16;
    if (v14 > 0x200) {
      v17 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v60 - v16, 8 * v15);
    }
    objc_msgSend(v8, "getObjects:range:", v17, 0, v14);
    id v27 = (id)[v4 propertiesToFetch];
    if (!v27)
    {
      uint64_t v28 = (void *)[v4 entity];
      if (v28) {
        uint64_t v29 = v28[14];
      }
      else {
        uint64_t v29 = 0LL;
      }
      uint64_t v30 = objc_msgSend((id)objc_msgSend(v28, "propertiesByName"), "values");
      id v27 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v30 + 8 * *(void *)(v29 + 48) count:*(void *)(v29 + 56) + *(void *)(v29 + 48)];
    }

    uint64_t v31 = [v27 count];
    unint64_t v32 = MEMORY[0x1895F8858](v31);
    uint64_t v34 = (char *)&v60 - v33;
    size_t v36 = 8 * v35;
    unint64_t v61 = v32;
    if (v32 > 0x200)
    {
      uint64_t v34 = (char *)NSAllocateScannedUncollectable();
      v66 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      bzero((char *)&v60 - v33, v36);
      MEMORY[0x1895F8858](v37);
      v66 = (char *)&v60 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v66, v36);
    }

    id v69 = objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v68 = objc_opt_class();
    if (!v14)
    {
      uint64_t v8 = (void *)[MEMORY[0x189603FA8] arrayWithObjects:v17 count:0];
      goto LABEL_67;
    }

    __int128 v60 = v4;
    uint64_t v73 = 0LL;
    id v38 = 0LL;
    v64 = v34;
    id v71 = v27;
    while (1)
    {
      __int128 v76 = 0u;
      __int128 v77 = 0u;
      __int128 v75 = 0u;
      __int128 v74 = 0u;
      uint64_t v39 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v74, v78, 16, v60);
      if (!v39) {
        goto LABEL_58;
      }
      uint64_t v40 = 0LL;
      uint64_t v41 = *(void *)v75;
      do
      {
        uint64_t v42 = 0LL;
        uint64_t v67 = (int)v40;
        id v43 = &v66[8 * (int)v40];
        uint64_t v65 = v40;
        v70 = &v34[8 * (int)v40];
        do
        {
          id v44 = v38;
          if (*(void *)v75 != v41) {
            objc_enumerationMutation(v71);
          }
          __int128 v45 = *(void **)(*((void *)&v74 + 1) + 8 * v42);
          __int128 v46 = v17;
          __int128 v47 = (void *)objc_msgSend( *(id *)(v72 + 104),  "dataForKey:",  objc_msgSend(*(id *)&v17[8 * v73], "_referenceData"));
          uint64_t v48 = [v45 _propertyType];
          uint64_t v49 = [v45 name];
          if (v48 != 5)
          {
            if (v48 == 4)
            {
              uint64_t v50 = objc_msgSend((id)objc_msgSend(v47, "valueForKey:", v49), "objectID");
LABEL_42:
              __int128 v51 = (void *)v50;
            }

            else
            {
              if (v48 == 2)
              {
                uint64_t v50 = [v47 valueForKey:v49];
                goto LABEL_42;
              }

              __int128 v51 = 0LL;
            }

            v17 = v46;
            id v38 = v44;
            goto LABEL_49;
          }

          __int128 v52 = (void *)[v45 expression];
          __int128 v51 = (void *)[v52 expressionValueWithObject:v47 context:v69];
          if ([v52 expressionType] == 50)
          {
            v17 = v46;
            if (([v52 isCountOnlyRequest] & 1) != 0
              || objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v52, "requestExpression"),  "expressionValueWithObject:context:",  0,  0),  "resultType") == 4)
            {
              __int128 v51 = (void *)[v51 lastObject];
            }
          }

          else
          {
            v17 = v46;
          }

          id v38 = v44;
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            __int128 v51 = (void *)[v51 objectID];
          }
LABEL_49:
          if (!v38) {
            *(void *)&v70[8 * v42] = v49;
          }
          *(void *)&v43[8 * v42++] = v51;
        }

        while (v39 != v42);
        id v27 = v71;
        uint64_t v53 = [v71 countByEnumeratingWithState:&v74 objects:v78 count:16];
        uint64_t v39 = v53;
        uint64_t v40 = v67 + v42;
        uint64_t v34 = v64;
      }

      while (v53);
      LODWORD(v39) = v42 + v65;
      unint64_t v14 = v63;
LABEL_58:
      if (!v38) {
        id v38 = -[NSKnownKeysMappingStrategy initForKeys:count:]( objc_alloc(&OBJC_CLASS___NSKnownKeysMappingStrategy),  "initForKeys:count:",  v34,  (int)v39);
      }
      __int128 v54 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v38);
      uint64_t v55 = v73;
      *(void *)&v17[8 * v73] = v54;
      -[NSKnownKeysDictionary setValues:](v54, "setValues:", v66);
      uint64_t v73 = v55 + 1;
      if (v55 + 1 == v14)
      {
        uint64_t v8 = (void *)[MEMORY[0x189603FA8] arrayWithObjects:v17 count:v14];
        uint64_t v56 = 0LL;
        do

        while (v14 != v56);
        if (v14 >= 0x201) {
          NSZoneFree(0LL, v17);
        }
        id v4 = v60;
LABEL_67:
        if (v61 >= 0x201)
        {
          NSZoneFree(0LL, v34);
          NSZoneFree(0LL, v66);
        }

        goto LABEL_70;
      }
    }
  }

  v62 = &v60;
  MEMORY[0x1895F8858](v13);
  uint64_t v20 = (char *)&v60 - v19;
  if (v14 >= 0x201)
  {
    uint64_t v20 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
  }

  else
  {
    bzero((char *)&v60 - v19, 8 * v18);
    objc_msgSend(v8, "getObjects:range:", v20, 0, v14);
    if (!v14)
    {
      uint64_t v8 = (void *)[MEMORY[0x189603FA8] arrayWithObjects:v20 count:0];
      goto LABEL_70;
    }
  }

  uint64_t v21 = 0LL;
  char v22 = v11 ^ 1 | v12;
  do
  {
    uint64_t v23 = *(void **)&v20[8 * v21];
    uint64_t v24 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](a3, v23, v6);
    if ((v22 & 1) == 0)
    {
      uint64_t v25 = (void *)objc_msgSend(*(id *)(v72 + 104), "dataForKey:", objc_msgSend(v23, "_referenceData"));
      if (v24) {
        v24[4] |= 0x200u;
      }
      _PFFaultHandlerFulfillFault(v6, (uint64_t)v24, (uint64_t)a3, v25, 1);
    }

    *(void *)&v20[8 * v21++] = v24;
  }

  while (v63 != v21);
  unint64_t v14 = v63;
  uint64_t v8 = (void *)[MEMORY[0x189603FA8] arrayWithObjects:v20 count:v63];
  uint64_t v26 = 0LL;
  do

  while (v14 != v26);
  if (v14 >= 0x201) {
    NSZoneFree(0LL, v20);
  }
LABEL_70:
  unint64_t v57 = [v4 fetchOffset];
  if (v57)
  {
    if (v57 <= v14) {
      [v8 removeObjectsInRange:0];
    }
    else {
      [v8 removeAllObjects];
    }
    unint64_t v14 = [v8 count];
  }

  unint64_t v58 = [v4 fetchLimit];
  if (v58 && v14 > v58) {
    objc_msgSend(v8, "removeObjectsInRange:", v58, v14 - v58);
  }
  return v8;
}

- (id)getNewIDForObject:(id *)result
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = [result[13] nextPK64];
    id v5 = (objc_class *)objc_msgSend(v3, "objectIDFactoryForEntity:", objc_msgSend(a2, "entity"));
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:v4];
    uint64_t v7 = [[v5 alloc] initWithObject:v6];

    return (id *)v7;
  }

  return result;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  return -[NSPersistentStoreMap dataForKey:](self->_theMap, "dataForKey:", [a3 _referenceData]);
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  id v7 = -[NSPersistentStoreMap retainedObjectIDsForRelationship:forObjectID:]( self->_theMap,  "retainedObjectIDsForRelationship:forObjectID:",  a3,  a4,  a5,  a6);
  if (([a3 isToMany] & 1) == 0)
  {
    uint64_t v8 = (void *)[v7 lastObject];
    id v9 = v8;

    return v8;
  }

  return v7;
}

- (id)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)objc_msgSend(MEMORY[0x189603FA8], "array", a3, a4);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a3);
        }
        char v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v12 = (void *)[v11 objectID];
        else {
          uint64_t v13 = v12;
        }
        unint64_t v14 = v13;
        [v6 addObject:v13];
      }

      uint64_t v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  return v6;
}

- (id)identifier
{
  return (id)-[NSPersistentStoreMap databaseUUID]((uint64_t)self->_theMap);
}

- (id)_rawMetadata__
{
  theMap = self->_theMap;
  if (theMap) {
    return theMap->_storeMetadata;
  }
  else {
    return 0LL;
  }
}

- (id)metadata
{
  theMap = self->_theMap;
  if (theMap) {
    return theMap->_storeMetadata;
  }
  else {
    return 0LL;
  }
}

- (void)setMetadata:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSMappedObjectStore;
  -[NSPersistentStore setMetadata:](&v5, sel_setMetadata_);
  -[NSPersistentStoreMap setMetadata:](self->_theMap, a3);
}

@end