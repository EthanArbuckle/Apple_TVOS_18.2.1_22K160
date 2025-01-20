@interface PFPersistentHistoryModel
@end

@implementation PFPersistentHistoryModel

void __58___PFPersistentHistoryModel__retainedTombstonesForEntity___block_invoke(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v4 = (void *)MEMORY[0x186E3E5D8]();
  v5 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a1, "entityDescription"), "userInfo"),  "objectForKey:",  @"NSPersistentHistoryTombstoneAttributes");
  if ([v5 isNSString])
  {
    v6 = (void *)[v5 componentsSeparatedByString:@","];
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          [a2 addObject:*(void *)(*((void *)&v22 + 1) + 8 * v10++)];
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v8);
    }
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v11 = (void *)objc_msgSend(a1, "attributeColumns", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(_BYTE **)(*((void *)&v18 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x186E3E5D8]();
        if (v16
          && v16[24] == 1
          && objc_msgSend( (id)objc_msgSend(v16, "attributeDescription"),  "preservesValueInHistoryOnDeletion"))
        {
          objc_msgSend(a2, "addObject:", objc_msgSend((id)objc_msgSend(v16, "attributeDescription"), "_qualifiedName"));
        }

        objc_autoreleasePoolPop(v17);
        ++v15;
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v13);
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __57___PFPersistentHistoryModel__tombstonesColumnsForEntity___block_invoke(id *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v4 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a1, "entityDescription"), "userInfo"),  "objectForKey:",  @"NSPersistentHistoryTombstoneAttributes"),  "componentsSeparatedByString:",  @",");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        if (a1) {
          uint64_t v9 = (void *)[a1[5] objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * v8)];
        }
        else {
          uint64_t v9 = 0LL;
        }
        objc_msgSend(a2, "addObject:", objc_msgSend(v9, "columnName"));
        ++v8;
      }

      while (v6 != v8);
      uint64_t v10 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      uint64_t v6 = v10;
    }

    while (v10);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v11 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a1, "entityDescription", 0), "attributesByName"),  "allValues");
  uint64_t result = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
        if ([v16 preservesValueInHistoryOnDeletion])
        {
          uint64_t v17 = [v16 name];
          if (a1) {
            __int128 v18 = (void *)[a1[5] objectForKey:v17];
          }
          else {
            __int128 v18 = 0LL;
          }
          objc_msgSend(a2, "addObject:", objc_msgSend(v18, "columnName"));
        }

        ++v15;
      }

      while (v13 != v15);
      uint64_t result = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
      uint64_t v13 = result;
    }

    while (result);
  }

  return result;
}

@end