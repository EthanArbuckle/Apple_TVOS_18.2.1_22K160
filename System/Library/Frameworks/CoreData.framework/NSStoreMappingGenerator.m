@interface NSStoreMappingGenerator
+ (NSStoreMappingGenerator)defaultMappingGenerator;
- (void)mappingsDictForConfigurationWithName:(void *)a3 inModel:;
@end

@implementation NSStoreMappingGenerator

+ (NSStoreMappingGenerator)defaultMappingGenerator
{
  result = (NSStoreMappingGenerator *)_NSDefaultMappingGenerator;
  if (!_NSDefaultMappingGenerator)
  {
    result = objc_alloc_init(&OBJC_CLASS___NSStoreMappingGenerator);
    _NSDefaultMappingGenerator = (uint64_t)result;
  }

  return result;
}

- (void)mappingsDictForConfigurationWithName:(void *)a3 inModel:
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v33 = (void *)[MEMORY[0x189603FC8] dictionary];
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v37 = (id)[MEMORY[0x189603FA8] array];
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  obuint64_t j = (id)[a3 entitiesForConfiguration:a2];
  uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v46;
    v5 = (objc_class *)&OBJC_IVAR____NSPersistentHistoryToken__storeTokens;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v6;
        v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
        v38 =  -[NSEntityStoreMapping initWithEntity:]( objc_alloc(&OBJC_CLASS___NSEntityStoreMapping),  "initWithEntity:",  v7);
        v8 = (void *)[MEMORY[0x189603FC8] dictionary];
        v40 = v7;
        v9 = (void *)objc_msgSend((id)objc_msgSend(v7, "attributesByName"), "allValues");
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v60 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v54;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v54 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              id v15 = (id)[objc_alloc(v5 + 412) initWithProperty:v14];
              objc_msgSend(v15, "setExternalType:", objc_msgSend(v14, "attributeType"));
              objc_msgSend(v8, "setObject:forKey:", v15, objc_msgSend(v14, "name"));
            }

            uint64_t v11 = [v9 countByEnumeratingWithState:&v53 objects:v60 count:16];
          }

          while (v11);
        }

        v16 = (void *)objc_msgSend((id)objc_msgSend(v40, "relationshipsByName"), "allValues");
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v50;
          do
          {
            for (uint64_t j = 0LL; j != v18; ++j)
            {
              if (*(void *)v50 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v49 + 1) + 8 * j);
              v22 =  -[NSPropertyStoreMapping initWithProperty:]( objc_alloc(&OBJC_CLASS___NSRelationshipStoreMapping),  "initWithProperty:",  v21);
              -[NSRelationshipStoreMapping setDestinationEntityExternalName:]( (uint64_t)v22,  (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v21, "destinationEntity"), "name"),  "uppercaseString"));
              else {
                v23 = (void *)[v21 destinationEntity];
              }
              uint64_t v24 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v23, "name"), "stringByAppendingString:", @"_id"),  "lowercaseString");
              v25 = (void *)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  +[NSJoin joinWithSourceAttributeName:destinationAttributeName:]( (uint64_t)NSJoin,  v24,  v24));
              -[NSRelationshipStoreMapping setJoins:]((uint64_t)v22, v25);
              v26 = (void *)objc_msgSend( (id)objc_msgSend(v25, "valueForKey:", @"sourceAttributeName"),  "mutableCopy");
              objc_msgSend( v26,  "removeObject:",  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v21, "entity"), "name"),  "stringByAppendingString:",  @"_id"),  "lowercaseString"));
              -[NSRelationshipStoreMapping setForeignKeys:]((uint64_t)v22, v26);

              if (v22) {
                v22->_joinSemantic = 2;
              }
              objc_msgSend(v8, "setObject:forKey:", v22, objc_msgSend(v21, "name"));
            }

            uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v59 count:16];
          }

          while (v18);
        }

        -[NSEntityStoreMapping setPropertyMappings:]((uint64_t)v38, v8);
        -[NSEntityStoreMapping setPrimaryKeys:]( (uint64_t)v38,  (void *)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v40, "name"), "stringByAppendingString:", @"_id"),  "lowercaseString")));
        [v37 addObject:v38];
        uint64_t v6 = v39 + 1;
        v5 = (objc_class *)&OBJC_IVAR____NSPersistentHistoryToken__storeTokens;
      }

      while (v39 + 1 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    }

    while (v36);
  }

  uint64_t v27 = [v37 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (!v27) {
    return v33;
  }
  uint64_t v28 = v27;
  uint64_t v29 = *(void *)v42;
  v30 = v33;
  do
  {
    for (uint64_t k = 0LL; k != v28; ++k)
    {
      if (*(void *)v42 != v29) {
        objc_enumerationMutation(v37);
      }
      objc_msgSend( v33,  "setObject:forKey:",  *(void *)(*((void *)&v41 + 1) + 8 * k),  objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * k), "entity"), "name"));
    }

    uint64_t v28 = [v37 countByEnumeratingWithState:&v41 objects:v57 count:16];
  }

  while (v28);
  return v30;
}

@end