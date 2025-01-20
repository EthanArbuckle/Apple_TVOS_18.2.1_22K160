@interface CUKeychainManager
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BOOL)addItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (BOOL)addOrUpdateOrReAddItem:(id)a3 flags:(unsigned int)a4 logCategory:(LogCategory *)a5 logLabel:(id)a6 error:(id *)a7;
- (BOOL)addOrUpdateOrReAddItem:(id)a3 logCategory:(LogCategory *)a4 logLabel:(id)a5 error:(id *)a6;
- (BOOL)removeItemMatchingItem:(id)a3 error:(id *)a4;
- (BOOL)removeItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 error:(id *)a5;
- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 flags:(unsigned int)a5 error:(id *)a6;
- (id)_copyItemsMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (id)_copyItemsMatchingItemSeparate:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (id)addItem:(id)a3 returnFlags:(unsigned int)a4 error:(id *)a5;
- (id)copyItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
@end

@implementation CUKeychainManager

- (id)copyItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  [v7 persistentRef];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x18960BE80]];
    [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE18]];
    if ((v6 & 8) != 0) {
      [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE28]];
    }
    if ((v6 & 1) != 0) {
      [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE20]];
    }
LABEL_10:
    CFTypeRef result = 0LL;
    LODWORD(v11) = SecItemCopyMatching((CFDictionaryRef)v9, &result);
    v12 = (void *)result;
    if (result)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
        id v22 = 0LL;
        BOOL v14 = -[CUKeychainItem _updateWithAttributesDictionary:flags:error:]( v13,  "_updateWithAttributesDictionary:flags:error:",  v12,  v6,  &v22);
        id v15 = v22;
        v16 = v15;
        if (v14)
        {
          v17 = v13;
LABEL_28:

          goto LABEL_29;
        }

        if (a5)
        {
          if (v15)
          {
            v17 = 0LL;
            *a5 = v15;
            goto LABEL_28;
          }

          id v19 = NSErrorWithOSStatusF((const char *)0xFFFFE596LL);
          *a5 = v19;
        }

        v17 = 0LL;
        goto LABEL_28;
      }

      if (a5)
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSErrorWithOSStatusF((const char *)0xFFFFE59CLL);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else if (a5)
    {
      if ((_DWORD)v11) {
        uint64_t v11 = v11;
      }
      else {
        uint64_t v11 = 4294941996LL;
      }
      NSErrorWithOSStatusF((const char *)v11);
      v17 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }

    v17 = 0LL;
LABEL_29:

    goto LABEL_30;
  }

  if ((v6 & 1) != 0) {
    int v10 = 196608;
  }
  else {
    int v10 = 0x10000;
  }
  [v7 _attributesDictionaryWithFlags:v10 | (v6 & 8) error:a5];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9) {
    goto LABEL_10;
  }
  v17 = 0LL;
LABEL_30:

  return v17;
}

- (id)_copyItemsMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  [v7 persistentRef];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x18960BE80]];
    [v9 setObject:*MEMORY[0x18960BDA8] forKeyedSubscript:*MEMORY[0x18960BDA0]];
    [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE18]];
    if ((v6 & 8) != 0) {
      [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE28]];
    }
    if ((v6 & 1) != 0) {
      [v9 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE20]];
    }
LABEL_10:
    CFTypeRef result = 0LL;
    LODWORD(v11) = SecItemCopyMatching((CFDictionaryRef)v9, &result);
    v12 = (void *)result;
    if (result)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v30 = v9;
        v31 = v8;
        id v32 = v7;
        id v33 = objc_alloc_init(MEMORY[0x189603FA8]);
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v36;
LABEL_14:
          uint64_t v17 = 0LL;
          while (1)
          {
            if (*(void *)v36 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              id v19 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
              id v34 = 0LL;
              BOOL v20 = -[CUKeychainItem _updateWithAttributesDictionary:flags:error:]( v19,  "_updateWithAttributesDictionary:flags:error:",  v18,  v6,  &v34);
              id v21 = v34;
              id v22 = v21;
              if (v20)
              {
                [v33 addObject:v19];
              }

              else if ((v6 & 2) == 0)
              {
                v8 = v31;
                id v7 = v32;
                id v9 = v30;
                v23 = v33;
                if (a5)
                {
                  if (v21)
                  {
                    *a5 = v21;
                  }

                  else
                  {
                    id v27 = NSErrorWithOSStatusF((const char *)0xFFFFE596LL);
                    *a5 = v27;
                  }
                }

LABEL_43:
                goto LABEL_44;
              }
            }

            else if ((v6 & 2) == 0)
            {
              v8 = v31;
              id v7 = v32;
              id v9 = v30;
              v23 = v33;
              if (a5)
              {
                v26 = (objc_class *)objc_opt_class();
                NSStringFromClass(v26);
                id v19 = (CUKeychainItem *)objc_claimAutoreleasedReturnValue();
                NSErrorWithOSStatusF((const char *)0xFFFFE59CLL);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_43;
              }

- (id)_copyItemsMatchingItemSeparate:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = -[CUKeychainManager _copyItemsMatchingItem:flags:error:]( self,  "_copyItemsMatchingItem:flags:error:",  v8,  v6 & 0xFFFFFFFE,  a5);
  int v10 = v9;
  if (v9)
  {
    if ([v9 count])
    {
      id v33 = a5;
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
      [v8 accessGroup];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUKeychainItem setAccessGroup:](v11, "setAccessGroup:", v12);

      -[CUKeychainItem setLegacy:](v11, "setLegacy:", [v8 legacy]);
      -[CUKeychainItem setSyncType:](v11, "setSyncType:", [v8 syncType]);
      [v8 type];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUKeychainItem setType:](v11, "setType:", v13);

      [v8 viewHint];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUKeychainItem setViewHint:](v11, "setViewHint:", v14);

      id v35 = v8;
      [v8 type];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      id v37 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v34 = v10;
      id v16 = v10;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        id v36 = 0LL;
        uint64_t v19 = *(void *)v40;
        do
        {
          for (uint64_t i = 0LL; i != v18; ++i)
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            objc_msgSend(v21, "identifier", v33);
            id v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              [v21 identifier];
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[CUKeychainItem setIdentifier:](v11, "setIdentifier:", v23);

              if (!v15)
              {
                [v21 type];
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[CUKeychainItem setType:](v11, "setType:", v24);
              }

              [v21 viewHint];
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[CUKeychainItem setViewHint:](v11, "setViewHint:", v25);

              id v38 = 0LL;
              id v26 = -[CUKeychainManager copyItemMatchingItem:flags:error:]( self,  "copyItemMatchingItem:flags:error:",  v11,  v6,  &v38);
              id v27 = v38;
              v28 = v27;
              if (v26)
              {
                [v37 addObject:v26];
              }

              else if (!v36)
              {
                id v36 = v27;
              }
            }
          }

          uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }

        while (v18);
      }

      else
      {
        id v36 = 0LL;
      }

      if ([v37 count])
      {
        v29 = (void *)[v37 copy];
        int v10 = v34;
        id v8 = v35;
        id v30 = v36;
LABEL_29:

        goto LABEL_30;
      }

      int v10 = v34;
      id v8 = v35;
      id v30 = v36;
      if (v33)
      {
        if (v36)
        {
          v29 = 0LL;
          *id v33 = v36;
          goto LABEL_29;
        }

        id v31 = NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5D4LL);
        *id v33 = v31;
      }

      v29 = 0LL;
      goto LABEL_29;
    }

    v29 = (void *)MEMORY[0x189604A58];
  }

  else
  {
    v29 = 0LL;
  }

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  return -[CUKeychainManager addItem:flags:error:](self, "addItem:flags:error:", a3, 0LL, a4);
}

- (BOOL)addItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  [v7 identifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (a5) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }

  [v7 type];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (a5)
    {
LABEL_10:
      NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
      BOOL v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }

- (id)addItem:(id)a3 returnFlags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  [v7 identifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [v7 type];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if ((v6 & 1) != 0) {
        int v10 = 196608;
      }
      else {
        int v10 = 0x10000;
      }
      [v7 _attributesDictionaryWithFlags:v10 | v6 error:a5];
      uint64_t v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
      {
        uint64_t v15 = 0LL;
LABEL_29:

        goto LABEL_30;
      }

      CFTypeRef result = 0LL;
      BOOL v13 = (const char *)SecItemAdd(v11, &result);
      uint64_t v14 = (void *)result;
      if ((_DWORD)v13)
      {
        if (a5)
        {
          NSErrorWithOSStatusF(v13);
          uint64_t v15 = 0LL;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

          goto LABEL_29;
        }

- (BOOL)addOrUpdateOrReAddItem:(id)a3 logCategory:(LogCategory *)a4 logLabel:(id)a5 error:(id *)a6
{
  return -[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]( self,  "addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:",  a3,  0LL,  a4,  a5,  a6);
}

- (BOOL)addOrUpdateOrReAddItem:(id)a3 flags:(unsigned int)a4 logCategory:(LogCategory *)a5 logLabel:(id)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a6;
  id v53 = 0LL;
  BOOL v14 = -[CUKeychainManager addItem:flags:error:](self, "addItem:flags:error:", v12, v10, &v53);
  id v19 = v53;
  if (!v14)
  {
    BOOL v20 = objc_alloc_init(&OBJC_CLASS___CUKeychainItem);
    [v12 accessGroup];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUKeychainItem setAccessGroup:](v20, "setAccessGroup:", v21);

    [v12 identifier];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUKeychainItem setIdentifier:](v20, "setIdentifier:", v22);

    -[CUKeychainItem setLegacy:](v20, "setLegacy:", [v12 legacy]);
    -[CUKeychainItem setSyncType:](v20, "setSyncType:", [v12 syncType]);
    [v12 type];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUKeychainItem setType:](v20, "setType:", v23);

    [v12 viewHint];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUKeychainItem setViewHint:](v20, "setViewHint:", v24);

    if ([v19 code] == -25299)
    {
      id v52 = v19;
      BOOL v29 = -[CUKeychainManager updateItem:matchingItem:flags:error:]( self,  "updateItem:matchingItem:flags:error:",  v12,  v20,  v10,  &v52);
      id v30 = v52;

      int var0 = a5->var0;
      if (v29)
      {
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x1Eu))) {
          LogPrintF( (uint64_t)a5,  (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]",  0x1Eu,  (uint64_t)"%@ updated: %@\n",  v31,  v32,  v33,  v34,  (char)v13);
        }
        goto LABEL_40;
      }

      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au))) {
        LogPrintF( (uint64_t)a5,  (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]",  0x5Au,  (uint64_t)"### %@ update failed: %@, %{error}\n",  v31,  v32,  v33,  v34,  (char)v13);
      }
    }

    else
    {
      if (a5->var0 <= 90 && (a5->var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au))) {
        LogPrintF( (uint64_t)a5,  (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]",  0x5Au,  (uint64_t)"### %@ add failed: %@, %{error}\n",  v25,  v26,  v27,  v28,  (char)v13);
      }
      id v30 = v19;
    }

    id v51 = v30;
    BOOL v37 = -[CUKeychainManager removeItemMatchingItem:flags:error:]( self,  "removeItemMatchingItem:flags:error:",  v20,  v10,  &v51);
    id v38 = v51;

    if (!v37 && a5->var0 <= 90 && (a5->var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au))) {
      LogPrintF( (uint64_t)a5,  (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]",  0x5Au,  (uint64_t)"### %@ delete to re-add failed: %@, %{error}\n",  v39,  v40,  v41,  v42,  (char)v13);
    }
    id v50 = v38;
    BOOL v43 = -[CUKeychainManager addItem:flags:error:](self, "addItem:flags:error:", v12, v10, &v50);
    id v30 = v50;

    int v48 = a5->var0;
    if (!v43)
    {
      if (v48 <= 90 && (v48 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au))) {
        LogPrintF( (uint64_t)a5,  (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]",  0x5Au,  (uint64_t)"### %@ re-add failed: %@, %{error}\n",  v44,  v45,  v46,  v47,  (char)v13);
      }
      if (a7)
      {
        id v30 = v30;
        BOOL v36 = 0;
        *a7 = v30;
      }

      else
      {
        BOOL v36 = 0;
      }

      goto LABEL_41;
    }

    if (v48 <= 30 && (v48 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x1Eu))) {
      LogPrintF( (uint64_t)a5,  (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]",  0x1Eu,  (uint64_t)"%@ deleted and re-added: %@\n",  v44,  v45,  v46,  v47,  (char)v13);
    }
LABEL_40:
    BOOL v36 = 1;
LABEL_41:

    id v19 = v30;
    goto LABEL_42;
  }

  if (a5->var0 <= 30 && (a5->var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x1Eu))) {
    LogPrintF( (uint64_t)a5,  (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]",  0x1Eu,  (uint64_t)"%@ added: %@\n",  v15,  v16,  v17,  v18,  (char)v13);
  }
  BOOL v36 = 1;
LABEL_42:

  return v36;
}

- (BOOL)removeItemMatchingItem:(id)a3 error:(id *)a4
{
  return -[CUKeychainManager removeItemMatchingItem:flags:error:]( self,  "removeItemMatchingItem:flags:error:",  a3,  0LL,  a4);
}

- (BOOL)removeItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v21[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  uint64_t v8 = [v7 persistentRef];
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v20 = *MEMORY[0x18960BE80];
    v21[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (const char *)SecItemDelete(v10);
    BOOL v12 = (_DWORD)v11 == 0;
    if (!a5 || !(_DWORD)v11) {
      goto LABEL_6;
    }
    NSErrorWithOSStatusF(v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }

  uint64_t v15 = [v7 identifier];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    [v7 type];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      [v7 _attributesDictionaryWithFlags:v6 error:a5];
      uint64_t v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = v18;
      if (!v18)
      {
        BOOL v12 = 0;
        goto LABEL_6;
      }

      id v19 = (const char *)SecItemDelete(v18);
      BOOL v12 = (_DWORD)v19 == 0;
      if (!a5 || !(_DWORD)v19) {
        goto LABEL_6;
      }
      NSErrorWithOSStatusF(v19);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v12 = 0;
LABEL_5:
      *a5 = v13;
LABEL_6:

      goto LABEL_7;
    }
  }

  if (a5)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v12 = 0;
  }

- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 error:(id *)a5
{
  return -[CUKeychainManager updateItem:matchingItem:flags:error:]( self,  "updateItem:matchingItem:flags:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 flags:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  [v10 secrets];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = -[CUKeychainManager copyItemMatchingItem:flags:error:]( self,  "copyItemMatchingItem:flags:error:",  v11,  (v12 != 0LL) | v7,  a6);
  BOOL v14 = v13;
  if (v13)
  {
    [v13 _mergeItem:v10];
    [v14 _attributesDictionaryWithFlags:v7 | 0x80000 error:a6];
    uint64_t v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      [v11 _attributesDictionaryWithFlags:v7 error:a6];
      uint64_t v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = v16;
      if (v16)
      {
        uint64_t v18 = (const char *)SecItemUpdate(v16, v15);
        BOOL v19 = (_DWORD)v18 == 0;
        if (a6 && (_DWORD)v18)
        {
          NSErrorWithOSStatusF(v18);
          BOOL v19 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      else
      {
        BOOL v19 = 0;
      }
    }

    else
    {
      BOOL v19 = 0;
    }
  }

  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

@end