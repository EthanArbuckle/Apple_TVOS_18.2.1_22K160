@interface CUFileResponse
- (CUFileResponse)initWithDictionary:(id)a3 error:(id *)a4;
- (NSArray)fileItems;
- (id)description;
- (unsigned)flags;
- (void)encodeWithDictionary:(id)a3;
- (void)setFileItems:(id)a3;
- (void)setFlags:(unsigned int)a3;
@end

@implementation CUFileResponse

- (CUFileResponse)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v6 = (const __CFDictionary *)a3;
  v7 = -[CUFileResponse init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE5D4LL);
      v23 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v23 = 0LL;
    }

    goto LABEL_17;
  }

  CFTypeID TypeID = CFArrayGetTypeID();
  CFDictionaryGetTypedValue(v6, @"fIts", TypeID, 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9) {
    goto LABEL_13;
  }
  v10 = (NSArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v25 = v9;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v12) {
    goto LABEL_12;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0LL; i != v13; ++i)
    {
      if (*(void *)v29 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = v25;
        if (a4)
        {
          NSErrorF_safe((void *)*MEMORY[0x189607670], (const char *)0xFFFFE59CLL);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_23;
      }

      v17 = objc_alloc(&OBJC_CLASS___CUFileItem);
      id v27 = 0LL;
      v18 = -[CUFileItem initWithDictionary:error:](v17, "initWithDictionary:error:", v16, &v27);
      id v19 = v27;
      v20 = v19;
      if (!v18)
      {
        v9 = v25;
        if (a4) {
          *a4 = v19;
        }

LABEL_23:
        v23 = 0LL;
        goto LABEL_16;
      }

      -[NSArray addObject:](v10, "addObject:", v18);
    }

    uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13) {
      continue;
    }
    break;
  }

- (void)encodeWithDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = self->_fileItems;
  if (-[NSArray count](v5, "count"))
  {
    v15 = v4;
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v7 = v5;
    uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
          [v12 encodeWithDictionary:v13];
          [v6 addObject:v13];

          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v9);
    }

    id v4 = v15;
    [v15 setObject:v6 forKeyedSubscript:@"fIts"];
  }

  if (self->_flags)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v14 forKeyedSubscript:&unk_189F523B0];
  }
}

- (id)description
{
  return NSPrintF();
}

- (NSArray)fileItems
{
  return self->_fileItems;
}

- (void)setFileItems:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
}

@end