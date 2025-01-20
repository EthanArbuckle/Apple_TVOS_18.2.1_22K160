@interface NSMigrationContext
- (NSMigrationContext)initWithMigrationManager:(id)a3;
- (id)destinationInstancesForEntityMapping:(uint64_t)a3 sourceInstance:;
- (id)sourceInstancesForEntityMapping:(uint64_t)a3 destinationInstance:;
- (uint64_t)_createAssociationsByDestination:(uint64_t)a3 fromSource:(void *)a4 forEntityMapping:;
- (uint64_t)_createAssociationsBySource:(uint64_t)a3 withDestination:(void *)a4 forEntityMapping:;
- (uint64_t)associateSourceInstance:(const void *)a3 withDestinationInstance:(void *)a4 forEntityMapping:;
- (uint64_t)setCurrentEntityMapping:(uint64_t)result;
- (uint64_t)setCurrentPropertyMapping:(uint64_t)result;
- (void)clearAssociationTables;
- (void)dealloc;
@end

@implementation NSMigrationContext

- (NSMigrationContext)initWithMigrationManager:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSMigrationContext;
  v4 = -[NSMigrationContext init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_migrationManager = (NSMigrationManager *)a3;
    v4->_currentStep = 0LL;
    v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
    v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
    v4->_bySourceAssociationTable = (NSMutableDictionary *)CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    v5->_byDestinationAssociationTable = (NSMutableDictionary *)CFDictionaryCreateMutable(v6, 0LL, v7, v8);
    v5->_byMappingBySourceAssociationTable = (NSMutableDictionary *)CFDictionaryCreateMutable(v6, 0LL, v7, v8);
    v5->_byMappingByDestinationAssociationTable = (NSMutableDictionary *)CFDictionaryCreateMutable(v6, 0LL, v7, v8);
  }

  return v5;
}

- (void)dealloc
{
  self->_migrationManager = 0LL;
  -[NSMigrationContext clearAssociationTables]((uint64_t)self);

  self->_currentMapping = 0LL;
  self->_currentPropertyMapping = 0LL;

  self->_destinationConfigurationForCloudKitValidation = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMigrationContext;
  -[NSMigrationContext dealloc](&v3, sel_dealloc);
}

- (void)clearAssociationTables
{
  if (a1)
  {

    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;

    *(void *)(a1 + 24) = 0LL;
    *(void *)(a1 + 32) = 0LL;
    *(void *)(a1 + 56) = 0LL;
  }

- (uint64_t)setCurrentEntityMapping:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(void **)(result + 48) != a2)
    {
      [*(id *)(result + 40) willChangeValueForKey:@"currentEntityMapping"];

      *(void *)(v3 + 48) = a2;
      [*(id *)(v3 + 40) didChangeValueForKey:@"currentEntityMapping"];
    }

    uint64_t v4 = *(void *)(v3 + 56) + 1LL;
    [*(id *)(v3 + 40) willChangeValueForKey:@"migrationProgress"];
    *(void *)(v3 + 56) = v4;
    return [*(id *)(v3 + 40) didChangeValueForKey:@"migrationProgress"];
  }

  return result;
}

- (uint64_t)setCurrentPropertyMapping:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(void **)(result + 64) != a2)
    {
      [*(id *)(result + 40) willChangeValueForKey:@"currentPropertyMapping"];

      *(void *)(v3 + 64) = a2;
      return [*(id *)(v3 + 40) didChangeValueForKey:@"currentPropertyMapping"];
    }
  }

  return result;
}

- (uint64_t)_createAssociationsBySource:(uint64_t)a3 withDestination:(void *)a4 forEntityMapping:
{
  if (result)
  {
    uint64_t v7 = result;
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)objc_msgSend(*(id *)(result + 24), "objectForKey:", objc_msgSend(a4, "name"));
    if (!Mutable)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      objc_msgSend(*(id *)(v7 + 24), "setObject:forKey:", Mutable, objc_msgSend(a4, "name"));
    }

    id v9 = (id)-[__CFDictionary objectForKey:](Mutable, "objectForKey:", a2);
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
      CFDictionarySetValue(Mutable, a2, v9);
    }

    [v9 addObject:a3];
    id v10 = (id)[*(id *)(v7 + 8) objectForKey:a2];
    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v7 + 8), a2, v10);
    }

    return [v10 addObject:a3];
  }

  return result;
}

- (uint64_t)_createAssociationsByDestination:(uint64_t)a3 fromSource:(void *)a4 forEntityMapping:
{
  if (result)
  {
    uint64_t v7 = result;
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)objc_msgSend(*(id *)(result + 32), "objectForKey:", objc_msgSend(a4, "name"));
    if (!Mutable)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      objc_msgSend(*(id *)(v7 + 32), "setObject:forKey:", Mutable, objc_msgSend(a4, "name"));
    }

    id v9 = (id)-[__CFDictionary objectForKey:](Mutable, "objectForKey:", a2);
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
      CFDictionarySetValue(Mutable, a2, v9);
    }

    [v9 addObject:a3];
    id v10 = (id)[*(id *)(v7 + 16) objectForKey:a2];
    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v7 + 16), a2, v10);
    }

    return [v10 addObject:a3];
  }

  return result;
}

- (uint64_t)associateSourceInstance:(const void *)a3 withDestinationInstance:(void *)a4 forEntityMapping:
{
  if (result)
  {
    uint64_t v7 = result;
    -[NSMigrationContext _createAssociationsBySource:withDestination:forEntityMapping:](result, a2, (uint64_t)a3, a4);
    return -[NSMigrationContext _createAssociationsByDestination:fromSource:forEntityMapping:](v7, a3, (uint64_t)a2, a4);
  }

  return result;
}

- (id)destinationInstancesForEntityMapping:(uint64_t)a3 sourceInstance:
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (result)
  {
    v5 = result;
    if (a2)
    {
      if (!a3)
      {
        id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
        v8 = (void *)objc_msgSend((id)objc_msgSend(v5[3], "objectForKey:", objc_msgSend(a2, "name")), "allValues");
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            for (uint64_t i = 0LL; i != v10; ++i)
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [v7 addObjectsFromArray:*(void *)(*((void *)&v13 + 1) + 8 * i)];
            }

            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }

          while (v10);
        }

        goto LABEL_7;
      }

      id v6 = (id)objc_msgSend(result[3], "objectForKey:", objc_msgSend(a2, "name"));
    }

    else
    {
      id v6 = result[1];
    }

    id v7 = (id)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", a3), "copy");
LABEL_7:
    if (v7) {
      return (id *)v7;
    }
    else {
      return (id *)NSArray_EmptyArray;
    }
  }

  return result;
}

- (id)sourceInstancesForEntityMapping:(uint64_t)a3 destinationInstance:
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (result)
  {
    v5 = result;
    if (a2)
    {
      if (!a3)
      {
        id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
        v8 = (void *)objc_msgSend((id)objc_msgSend(v5[4], "objectForKey:", objc_msgSend(a2, "name")), "allValues");
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            for (uint64_t i = 0LL; i != v10; ++i)
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [v7 addObjectsFromArray:*(void *)(*((void *)&v13 + 1) + 8 * i)];
            }

            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }

          while (v10);
        }

        goto LABEL_7;
      }

      id v6 = (id)objc_msgSend(result[4], "objectForKey:", objc_msgSend(a2, "name"));
    }

    else
    {
      id v6 = result[2];
    }

    id v7 = (id)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", a3), "copy");
LABEL_7:
    if (v7) {
      return (id *)v7;
    }
    else {
      return (id *)NSArray_EmptyArray;
    }
  }

  return result;
}

@end