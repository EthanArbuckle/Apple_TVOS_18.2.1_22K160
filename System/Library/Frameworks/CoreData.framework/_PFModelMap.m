@interface _PFModelMap
+ (id)ancillaryModelFactoryClasses;
- (NSArray)allEntities;
- (NSDictionary)entitiesByPath;
- (NSManagedObjectModel)clientModel;
- (id)entitiesForContext:(uint64_t)a3 configuration:;
- (unint64_t)clientEntityCount;
- (void)addManagedObjectModel:(uint64_t)a1;
- (void)ancillaryEntityWithName:(void *)a1;
- (void)dealloc;
- (void)entityForClassName:(void *)a3 inContext:;
- (void)initWithClientModel:(void *)a1;
@end

@implementation _PFModelMap

- (void)initWithClientModel:(void *)a1
{
  v2 = a1;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ([a2 _modelsReferenceIDOffset])
    {

      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"Illegal attempt to register a client managed object model with a non-zero offset (%ld).\n%@", objc_msgSend(a2, "_modelsReferenceIDOffset"), a2), 0 reason userInfo]);
    }

    v20.receiver = v2;
    v20.super_class = (Class)&OBJC_CLASS____PFModelMap;
    v2 = objc_msgSendSuper2(&v20, sel_init);
    if (v2)
    {
      v4 = (void *)MEMORY[0x186E3E5D8]();
      v2[1] = a2;
      uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "entitiesByName"), "count");
      v2[5] = v5;
      v2[6] = v5;
      v6 = (void *)objc_msgSend( +[_PFModelMap ancillaryModelFactoryClasses]( _PFModelMap,  "ancillaryModelFactoryClasses"),  "sortedArrayUsingComparator:",  &__block_literal_global_18);
      v7 = malloc(8 * [v6 count] + 8);
      v2[8] = v7;
      void *v7 = v2[6];
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = 0LL;
        uint64_t v11 = *(void *)v17;
        do
        {
          uint64_t v12 = 0LL;
          uint64_t v13 = v10;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = v13 + 1;
            uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) ancillaryEntityCount];
            *(void *)(v2[8] + 8 * v13 + 8) = v14;
            v2[6] += v14;
            ++v12;
            ++v13;
          }

          while (v9 != v12);
          uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }

        while (v9);
      }

      -[_PFModelMap addManagedObjectModel:]((uint64_t)v2, a2);
      objc_autoreleasePoolPop(v4);
    }
  }

  return v2;
}

- (void)addManagedObjectModel:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  if (!*(void *)(a1 + 32)) {
    *(void *)(a1 + 32) = PF_CALLOC_OBJECT_ARRAY(*(void *)(a1 + 48));
  }
  context = (void *)MEMORY[0x186E3E5D8]();
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v4 = *(void **)(a1 + 24);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)v37;
  char v7 = 1;
  while (2)
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      if (*(void *)v37 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v10 = [v9 _modelsReferenceIDOffset];
      if (v10 == [a2 _modelsReferenceIDOffset])
      {
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "entities"), "count");
        if (v11 == objc_msgSend((id)objc_msgSend(a2, "entities"), "count"))
        {
          if (objc_msgSend( (id)objc_msgSend(v9, "entityVersionHashesByName"),  "isEqual:",  objc_msgSend(a2, "entityVersionHashesByName")))
          {
            char v7 = 0;
            continue;
          }

          v27 = (void *)MEMORY[0x189603F70];
          uint64_t v28 = [NSString stringWithFormat:@"Attempt to register ancillary model with different version hashes than the currently registered model: %p has hashes\n%@\n%p has hashes\n%@", v9, objc_msgSend(v9, "entityVersionHashesByName"), a2, objc_msgSend(a2, "entityVersionHashesByName")];
          objc_exception_throw((id)[v27 exceptionWithName:*MEMORY[0x189603A58] reason:v28 userInfo:0]);
        }

        else
        {
          v29 = (void *)MEMORY[0x189603F70];
          uint64_t v30 = objc_msgSend( NSString,  "stringWithFormat:",  @"Attempt to register ancillary model with offset %ld but different entity count.",  objc_msgSend(v9, "_modelsReferenceIDOffset"));
          objc_exception_throw((id)[v29 exceptionWithName:*MEMORY[0x189603A58] reason:v30 userInfo:0]);
        }

        __break(1u);
        return;
      }
    }

    uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v5) {
      continue;
    }
    break;
  }

  if ((v7 & 1) != 0)
  {
LABEL_16:
    uint64_t v12 = *(void **)(a1 + 16);
    if (v12) {
      id v13 = (id)[v12 mutableCopy];
    }
    else {
      id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
    }
    uint64_t v14 = v13;
    v15 = *(void **)(a1 + 56);
    if (v15) {
      id v16 = (id)[v15 mutableCopy];
    }
    else {
      id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
    __int128 v17 = v16;
    __int128 v18 = *(void **)(a1 + 24);
    if (v18) {
      id v19 = (id)[v18 mutableCopy];
    }
    else {
      id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
    }
    objc_super v20 = v19;
    [v19 addObject:a2];
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    uint64_t v21 = [a2 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v33;
      do
      {
        for (uint64_t j = 0LL; j != v21; ++j)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(a2);
          }
          v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          uint64_t v25 = _PFModelMapSlotForEntity(a1, v24);
          [v17 setObject:v24 forKey:_PFModelMapPathForEntity(v24)];
          v26 = *(void **)(*(void *)(a1 + 32) + 8 * v25);
          if (v26 != v24)
          {

            *(void *)(*(void *)(a1 + 32) + 8 * v25) = v24;
          }

          [v14 addObject:v24];
        }

        uint64_t v21 = [a2 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }

      while (v21);
    }

    *(void *)(a1 + 24) = [v20 copy];
    *(void *)(a1 + 16) = v14;

    *(void *)(a1 + 56) = [v17 copy];
  }

  objc_autoreleasePoolPop(context);
}

- (void)dealloc
{
  self->_clientModel = 0LL;
  self->_models = 0LL;
  modelEntityCounts = self->_modelEntityCounts;
  if (modelEntityCounts) {
    free(modelEntityCounts);
  }
  indexedEntities = self->_indexedEntities;
  if (indexedEntities)
  {
    unint64_t entityCount = self->_entityCount;
    if (entityCount)
    {
      for (unint64_t i = 0LL; i < entityCount; ++i)
      {
        id v7 = self->_indexedEntities[i];
        if (v7)
        {

          self->_indexedEntities[i] = 0LL;
          unint64_t entityCount = self->_entityCount;
        }
      }

      indexedEntities = self->_indexedEntities;
    }

    free(indexedEntities);
  }

  self->_allEntities = 0LL;
  self->_entitiesByPath = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____PFModelMap;
  -[_PFModelMap dealloc](&v8, sel_dealloc);
}

- (void)ancillaryEntityWithName:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v3 = a1[5];
  if (v3 >= a1[6]) {
    return 0LL;
  }
  while (1)
  {
    uint64_t v5 = *(void **)(a1[4] + 8 * v3);
    if (++v3 >= a1[6]) {
      return 0LL;
    }
  }

  return v5;
}

- (void)entityForClassName:(void *)a3 inContext:
{
  if (!a1) {
    return 0LL;
  }
  int v5 = [a3 _allowAncillaryEntities];
  uint64_t v6 = 40LL;
  if (v5) {
    uint64_t v6 = 48LL;
  }
  unint64_t v7 = *(void *)(a1 + v6);
  if (!v7) {
    return 0LL;
  }
  for (unint64_t i = 0LL; i < v7; ++i)
  {
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 8 * i);
    uint64_t v10 = (void *)[v9 managedObjectClassName];
    else {
      uint64_t v9 = 0LL;
    }
  }

  return v9;
}

- (id)entitiesForContext:(uint64_t)a3 configuration:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if ([a2 _allowAncillaryEntities])
  {
    if (a3)
    {
      id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      uint64_t v6 = *(void **)(a1 + 24);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          for (uint64_t i = 0LL; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            else {
              uint64_t v12 = [v11 entities];
            }
            [v5 addObjectsFromArray:v12];
          }

          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }

        while (v8);
      }

      id v13 = (id)[v5 copy];

      return v13;
    }

    id v15 = *(id *)(a1 + 16);
  }

  else
  {
    id v15 = (id)[*(id *)(a1 + 8) entitiesForConfiguration:a3];
  }

  return v15;
}

+ (id)ancillaryModelFactoryClasses
{
  if (qword_18C4ABAB0 != -1) {
    dispatch_once(&qword_18C4ABAB0, &__block_literal_global_29);
  }
  return (id)_MergedGlobals_78;
}

- (NSManagedObjectModel)clientModel
{
  return self->_clientModel;
}

- (NSArray)allEntities
{
  return self->_allEntities;
}

- (NSDictionary)entitiesByPath
{
  return self->_entitiesByPath;
}

- (unint64_t)clientEntityCount
{
  return self->_clientEntityCount;
}

@end