@interface _PFPersistentHistoryModel
+ (id)_retainedTombstonesForEntity:(uint64_t)a1;
+ (id)ancillaryModelNamespace;
+ (id)newPersistentHistorySQLModelForSQLModel:(uint64_t)a1 options:(void *)a2;
+ (uint64_t)_hasTombstonesInUserInfo:(uint64_t)a1;
+ (uint64_t)_tombstonesColumnsForEntity:(uint64_t)a1;
+ (unint64_t)_maxCountOfTombstonesInModel:(uint64_t)a1;
+ (unint64_t)ancillaryEntityCount;
+ (unint64_t)ancillaryEntityOffset;
+ (unint64_t)newPersistentHistoryManagedObjectModelForSQLModel:(uint64_t)a1 options:(void *)a2;
+ (void)_entitiesWithTooManyTombstonesInModel:(uint64_t)a1;
+ (void)_invalidateStaticCaches;
+ (void)createModelsWithTombstoneCount:(uint64_t)a1 andOptions:(uint64_t)a2;
+ (void)initialize;
+ (void)resetCaches;
@end

@implementation _PFPersistentHistoryModel

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    objc_opt_self();
  }
}

+ (unint64_t)newPersistentHistoryManagedObjectModelForSQLModel:(uint64_t)a1 options:(void *)a2
{
  unint64_t v3 = +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)&OBJC_CLASS____PFPersistentHistoryModel, a2);
  if (v3 >= 0x65)
  {
    v8 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"NSPersistentHistoryTrackingKey only supports a max of 100 tombstones per entity in the Model",  +[_PFPersistentHistoryModel _entitiesWithTooManyTombstonesInModel:]( (uint64_t)_PFPersistentHistoryModel,  a2));
    objc_exception_throw(v8);
    return +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:](v9, v10);
  }

  else
  {
    uint64_t v4 = v3;
    uint64_t v5 = [MEMORY[0x189607968] numberWithUnsignedInteger:v3];
    os_unfair_lock_lock_with_options();
    if (![(id)_historyModelCache objectForKey:v5]) {
      +[_PFPersistentHistoryModel createModelsWithTombstoneCount:andOptions:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v4);
    }
    id v6 = (id)[(id)_historyModelCache objectForKey:v5];
    os_unfair_lock_unlock((os_unfair_lock_t)&_historyModelLock);
    return (unint64_t)v6;
  }

+ (unint64_t)_maxCountOfTombstonesInModel:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  if (a2) {
    a2 = (void *)a2[4];
  }
  uint64_t v3 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  unint64_t v5 = 0LL;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(a2);
      }
      id v8 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  *(void **)(*((void *)&v10 + 1) + 8 * i));
      if (objc_msgSend(v8, "count", (void)v10) > v5) {
        unint64_t v5 = [v8 count];
      }
    }

    uint64_t v4 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }

  while (v4);
  return v5;
}

+ (void)_entitiesWithTooManyTombstonesInModel:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v3 = (void *)[MEMORY[0x189603FC8] dictionary];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  if (a2) {
    a2 = (void *)a2[4];
  }
  uint64_t v4 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(a2);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v8);
        unint64_t v10 = objc_msgSend(v9, "count", (void)v12);
        if (v10 >= 0x65) {
          objc_msgSend( v3,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", v10),  objc_msgSend(v8, "name"));
        }
      }

      uint64_t v5 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  return v3;
}

+ (void)createModelsWithTombstoneCount:(uint64_t)a1 andOptions:(uint64_t)a2
{
  v55[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = objc_opt_self();
  context = (void *)MEMORY[0x186E3E5D8](v3);
  if (!_historyModelCache) {
    _historyModelCache = (uint64_t)objc_alloc_init(MEMORY[0x189603FC8]);
  }
  if (!_historySQLModelCache) {
    _historySQLModelCache = (uint64_t)objc_alloc_init(MEMORY[0x189603FC8]);
  }
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSEntityDescription);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSEntityDescription);
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSEntityDescription);
  id v7 = -[NSRelationshipDescription _initWithName:]( objc_alloc(&OBJC_CLASS___NSRelationshipDescription),  "_initWithName:",  @"BUNDLEIDTS");
  [v7 setDestinationEntity:v6];
  v47 = v7;
  [v7 setMaxCount:1];
  id v8 = -[NSRelationshipDescription _initWithName:]( objc_alloc(&OBJC_CLASS___NSRelationshipDescription),  "_initWithName:",  @"PROCESSIDTS");
  [v8 setDestinationEntity:v6];
  v46 = v8;
  [v8 setMaxCount:1];
  id v9 = -[NSRelationshipDescription _initWithName:]( objc_alloc(&OBJC_CLASS___NSRelationshipDescription),  "_initWithName:",  @"CONTEXTNAMETS");
  [v9 setDestinationEntity:v6];
  v45 = v9;
  [v9 setMaxCount:1];
  id v10 = -[NSRelationshipDescription _initWithName:]( objc_alloc(&OBJC_CLASS___NSRelationshipDescription),  "_initWithName:",  @"AUTHORTS");
  [v10 setDestinationEntity:v6];
  v44 = v10;
  [v10 setMaxCount:1];
  id v11 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"NAME",  700LL);
  -[NSEntityDescription setName:](v6, "setName:", @"TRANSACTIONSTRING");
  v55[0] = v11;
  -[NSEntityDescription setProperties:]( v6,  "setProperties:",  [MEMORY[0x189603F18] arrayWithObjects:v55 count:1]);
  v30 = v11;
  uint64_t v53 = [v11 name];
  uint64_t v54 = [MEMORY[0x189603F18] arrayWithObjects:&v53 count:1];
  v31 = v6;
  -[NSEntityDescription setUniquenessConstraints:]( v6,  "setUniquenessConstraints:",  [MEMORY[0x189603F18] arrayWithObjects:&v54 count:1]);
  id v43 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"BUNDLEID",  700LL);
  id v42 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"PROCESSID",  700LL);
  id v41 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"CONTEXTNAME",  700LL);
  id v40 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"AUTHOR",  700LL);
  id v39 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"QUERYGEN",  1000LL);
  id v38 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"TIMESTAMP",  500LL);
  v34 = v4;
  -[NSEntityDescription setName:](v4, "setName:", @"TRANSACTION");
  id v37 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"ENTITY",  300LL);
  id v36 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"ENTITYPK",  300LL);
  id v35 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"CHANGETYPE",  100LL);
  id v12 = -[NSAttributeDescription _initWithName:type:]( objc_alloc(&OBJC_CLASS___NSAttributeDescription),  "_initWithName:type:",  @"COLUMNS",  1000LL);
  __int128 v13 = v5;
  -[NSEntityDescription setName:](v5, "setName:", @"CHANGE");
  __int128 v14 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:(int)a2];
  uint64_t v32 = a2;
  if ((int)a2 >= 1)
  {
    uint64_t v15 = 0LL;
    do
    {
      v16 = objc_alloc(&OBJC_CLASS___NSAttributeDescription);
      id v17 = -[NSAttributeDescription _initWithName:type:]( v16,  "_initWithName:type:",  [NSString stringWithFormat:@"%@%lu", @"TOMBSTONE", v15],  1000);
      [v14 addObject:v17];

      ++v15;
    }

    while ((int)a2 != v15);
  }

  id v18 = -[NSRelationshipDescription _initWithName:]( objc_alloc(&OBJC_CLASS___NSRelationshipDescription),  "_initWithName:",  @"CHANGES");
  [v18 setDeleteRule:2];
  id v19 = -[NSRelationshipDescription _initWithName:]( objc_alloc(&OBJC_CLASS___NSRelationshipDescription),  "_initWithName:",  @"TRANSACTIONID");
  [v18 setInverseRelationship:v19];
  [v18 setDestinationEntity:v5];
  [v19 setInverseRelationship:v18];
  [v19 setDestinationEntity:v34];
  [v19 setMaxCount:1];
  [v19 setMinCount:1];
  v52[0] = v43;
  v52[1] = v42;
  v52[2] = v41;
  v52[3] = v40;
  v52[4] = v47;
  v52[5] = v46;
  v52[6] = v45;
  v52[7] = v10;
  v52[8] = v38;
  v52[9] = v39;
  v52[10] = v18;
  -[NSEntityDescription setProperties:]( v34,  "setProperties:",  [MEMORY[0x189603F18] arrayWithObjects:v52 count:11]);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v37, v36, v35, v12, 0);
  [v20 addObjectsFromArray:v14];
  [v20 addObject:v19];
  -[NSEntityDescription setProperties:](v5, "setProperties:", v20);
  v21 = -[NSFetchIndexElementDescription initWithProperty:collationType:]( objc_alloc(&OBJC_CLASS___NSFetchIndexElementDescription),  "initWithProperty:collationType:",  v38,  0LL);
  v22 = objc_alloc(&OBJC_CLASS___NSFetchIndexDescription);
  v51 = v21;
  v23 = -[NSFetchIndexDescription initWithName:elements:]( v22,  "initWithName:elements:",  @"TransactionTimestampIndex",  [MEMORY[0x189603F18] arrayWithObjects:&v51 count:1]);
  v24 = -[NSFetchIndexElementDescription initWithProperty:collationType:]( objc_alloc(&OBJC_CLASS___NSFetchIndexElementDescription),  "initWithProperty:collationType:",  v40,  0LL);
  v25 = objc_alloc(&OBJC_CLASS___NSFetchIndexDescription);
  v50 = v24;
  v26 = -[NSFetchIndexDescription initWithName:elements:]( v25,  "initWithName:elements:",  @"TransactionAuthorIndex",  [MEMORY[0x189603F18] arrayWithObjects:&v50 count:1]);
  v49[0] = v26;
  v49[1] = v23;
  -[NSEntityDescription setIndexes:]( v34,  "setIndexes:",  [MEMORY[0x189603F18] arrayWithObjects:v49 count:2]);

  -[NSEntityDescription _flattenProperties](v34, "_flattenProperties");
  -[NSEntityDescription _createCachesAndOptimizeState](v34, "_createCachesAndOptimizeState");
  -[NSEntityDescription _flattenProperties](v13, "_flattenProperties");
  -[NSEntityDescription _createCachesAndOptimizeState](v13, "_createCachesAndOptimizeState");
  -[NSEntityDescription _flattenProperties](v31, "_flattenProperties");
  -[NSEntityDescription _createCachesAndOptimizeState](v31, "_createCachesAndOptimizeState");
  v48[0] = v34;
  v48[1] = v13;
  v48[2] = v31;
  id v27 = -[NSManagedObjectModel _initWithEntities:]( [NSManagedObjectModel alloc],  "_initWithEntities:",  [MEMORY[0x189603F18] arrayWithObjects:v48 count:3]);
  objc_msgSend( v27,  "_setModelsReferenceIDOffset:",  +[_PFPersistentHistoryModel ancillaryEntityOffset](_PFPersistentHistoryModel, "ancillaryEntityOffset"));
  [v27 _setIsEditable:0];
  v28 = -[NSSQLModel initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSSQLModel),  "initWithManagedObjectModel:",  v27);
  uint64_t v29 = [MEMORY[0x189607968] numberWithInt:v32];
  [(id)_historyModelCache setObject:v27 forKey:v29];
  [(id)_historySQLModelCache setObject:v28 forKey:v29];

  objc_autoreleasePoolPop(context);
}

+ (id)newPersistentHistorySQLModelForSQLModel:(uint64_t)a1 options:(void *)a2
{
  unint64_t v3 = +[_PFPersistentHistoryModel _maxCountOfTombstonesInModel:]((uint64_t)&OBJC_CLASS____PFPersistentHistoryModel, a2);
  uint64_t v4 = [MEMORY[0x189607968] numberWithUnsignedInteger:v3];
  os_unfair_lock_lock_with_options();
  if (![(id)_historySQLModelCache objectForKey:v4]) {
    +[_PFPersistentHistoryModel createModelsWithTombstoneCount:andOptions:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v3);
  }
  id v5 = (id)[(id)_historySQLModelCache objectForKey:v4];
  os_unfair_lock_unlock((os_unfair_lock_t)&_historyModelLock);
  return v5;
}

+ (void)resetCaches
{
  _historySQLModelCache = 0LL;
  _historyModelCache = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)&_historyModelLock);
}

+ (void)_invalidateStaticCaches
{
}

+ (id)_retainedTombstonesForEntity:(uint64_t)a1
{
  uint64_t v3 = objc_opt_self();
  uint64_t v4 = (void *)MEMORY[0x186E3E5D8](v3);
  id v5 = objc_alloc_init(MEMORY[0x189603FD0]);
  while (1)
  {
    while (!a2)
      __58___PFPersistentHistoryModel__retainedTombstonesForEntity___block_invoke(0LL, v5);
    uint64_t v6 = a2[20];
    __58___PFPersistentHistoryModel__retainedTombstonesForEntity___block_invoke(a2, v5);
    if (!v6) {
      break;
    }
    a2 = (void *)a2[20];
  }

  id v7 = (id)[v5 array];

  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (uint64_t)_hasTombstonesInUserInfo:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(a2);
        }
        id v7 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "userInfo"),  "objectForKey:",  @"NSPersistentHistoryTombstoneAttributes");
        if (v7)
        {
          id v8 = v7;
          if ([v7 isNSString])
          {
            if ([v8 length]) {
              return 1LL;
            }
          }
        }

        ++v6;
      }

      while (v4 != v6);
      uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }

  return result;
}

+ (uint64_t)_tombstonesColumnsForEntity:(uint64_t)a1
{
  id v3 = objc_alloc_init(MEMORY[0x189603FD0]);
  if (!a2) {
    goto LABEL_3;
  }
  while (*(void *)(a2 + 160))
  {
    do
    {
LABEL_3:
      __57___PFPersistentHistoryModel__tombstonesColumnsForEntity___block_invoke((id *)a2, v3);
      a2 = [(id)a2 rootEntity];
    }

    while (!a2);
  }

  __57___PFPersistentHistoryModel__tombstonesColumnsForEntity___block_invoke((id *)a2, v3);
  uint64_t v4 = [v3 array];

  return v4;
}

+ (id)ancillaryModelNamespace
{
  return @"PersistentHistory";
}

+ (unint64_t)ancillaryEntityCount
{
  return 3LL;
}

+ (unint64_t)ancillaryEntityOffset
{
  return 16000LL;
}

@end