@interface PQLFormatInjection
+ (id)formatInjection:(id)a3;
- (NSString)description;
- (PQLFormatInjection)initWithFormat:(id)a3 arguments:(char *)a4;
- (id)bindValuesToKeepAlive;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation PQLFormatInjection

- (id)bindValuesToKeepAlive
{
  return self->_binds;
}

+ (id)formatInjection:(id)a3
{
  id v3 = a3;
  v4 = -[PQLFormatInjection initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___PQLFormatInjection),  "initWithFormat:arguments:",  v3,  &v6);

  return v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend( MEMORY[0x189607940], "stringWithFormat:", @"<PQLFormat %s>", -[PQLNameInjectionBase bytes](self, "bytes"));
}

- (PQLFormatInjection)initWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  v56 = a4;
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v54 = v5;
  v7 = (const char *)[v54 UTF8String];
  v8 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:strlen(v7) + 1];
  size_t v9 = strcspn(v7, "%");
  [v8 appendBytes:v7 length:v9];
  v10 = &v7[v9];
  if (*v10)
  {
    id v11 = 0LL;
    v55 = 0LL;
    uint64_t v52 = *MEMORY[0x189603A60];
    while (1)
    {
      v13 = v10 + 1;
      int v12 = *((unsigned __int8 *)v10 + 1);
      if (v12 == 64) {
        break;
      }
      if (v12 == 37)
      {
        v13 = v10 + 2;
        [v8 appendBytes:"%" length:1];
      }

      else
      {
        int v16 = (char)v12;
        [v8 appendBytes:"?" length:1];
        if (v16 <= 96)
        {
          if (v16 > 64)
          {
LABEL_19:
            v19 = (double *)v56;
            v56 += 8;
            uint64_t v18 = [MEMORY[0x189607968] numberWithDouble:*v19];
LABEL_31:
            v29 = (void *)v18;
            [v6 addObject:v18];

            goto LABEL_32;
          }

          if (v16 == 42)
          {
            if (!memchr("sp", v10[2], 3uLL)) {
              goto LABEL_56;
            }
            v31 = v56;
            v57 = v56 + 8;
            uint64_t v32 = *(int *)v31;
            if (v10[2] == 115)
            {
              id v33 = objc_alloc(NSString);
              v34 = v57;
              v56 = v57 + 8;
              uint64_t v35 = [v33 initWithBytes:*(void *)v34 length:v32 encoding:4];
            }

            else
            {
              id v42 = objc_alloc(MEMORY[0x189603F48]);
              v43 = v57;
              v56 = v57 + 8;
              uint64_t v35 = [v42 initWithBytes:*(void *)v43 length:v32];
            }

            uint64_t v27 = v35;

            [v6 addObject:v27];
            v13 = v10 + 3;
LABEL_53:
            v55 = (void *)v27;
            goto LABEL_33;
          }

          if (v16 == 46)
          {
            if (v10[2] != 42 || !memchr("sp", v10[3], 3uLL)) {
              goto LABEL_56;
            }
            v36 = v56;
            v58 = v56 + 8;
            uint64_t v37 = *(int *)v36;
            if (v10[3] == 115)
            {
              id v38 = objc_alloc(NSString);
              v39 = v58;
              v56 = v58 + 8;
              uint64_t v40 = [v38 initWithBytes:*(void *)v39 length:v37 encoding:4];
            }

            else
            {
              id v45 = objc_alloc(MEMORY[0x189603F48]);
              v46 = v58;
              v56 = v58 + 8;
              uint64_t v40 = [v45 initWithBytes:*(void *)v46 length:v37];
            }

            uint64_t v27 = v40;

            [v6 addObject:v27];
            v13 = v10 + 4;
            goto LABEL_53;
          }

          if (v16 != 64) {
            goto LABEL_56;
          }
LABEL_12:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v18 = [v11 copy];
            goto LABEL_31;
          }

          if (!v11)
          {
            uint64_t v18 = [MEMORY[0x189603FE8] null];
            goto LABEL_31;
          }

          [v6 addObject:v11];
LABEL_32:
          v13 = v10 + 2;
          goto LABEL_33;
        }

        switch(v16)
        {
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            goto LABEL_19;
          case 'd':
          case 'i':
            v17 = (unsigned int *)v56;
            v56 += 8;
            uint64_t v18 = [MEMORY[0x189607968] numberWithInt:*v17];
            goto LABEL_31;
          case 'l':
            int v20 = v10[2];
            if (memchr("udi", v20, 4uLL))
            {
              v21 = v56;
              v56 += 8;
              uint64_t v22 = [MEMORY[0x189607968] numberWithLongLong:*(void *)v21];
LABEL_27:
              v23 = (void *)v22;
              [v6 addObject:v22];

              v13 = v10 + 3;
              break;
            }

            if (v20 <= 107)
            {
              if (v20 == 100 || v20 == 105)
              {
                v41 = (unsigned int *)v56;
                v56 += 8;
                uint64_t v22 = [MEMORY[0x189607968] numberWithInt:*v41];
                goto LABEL_27;
              }

              goto LABEL_56;
            }

            if (v20 != 108)
            {
              if (v20 == 117)
              {
                v44 = (unsigned int *)v56;
                v56 += 8;
                uint64_t v22 = [MEMORY[0x189607968] numberWithUnsignedInt:*v44];
                goto LABEL_27;
              }

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  LODWORD(v4) = a4;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = self->_binds;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  int v16 = v4;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    uint64_t v4 = v4;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v12 = (v4 + 1);
          sqlite3_bind_null(a3, v4);
LABEL_10:
          uint64_t v4 = v12;
          goto LABEL_11;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v12 = (v4 + 1);
          pql_sqlite3_bind_pointer(a3, v4, (sqlite3_int64)v11);
          goto LABEL_10;
        }

        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v12 = (v4 + 1);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            [v11 sqliteBind:a3 index:v4];
          }

          else
          {
            id v13 = [v11 description];
            sqlite3_bind_text( a3,  v4,  (const char *)[v13 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }

          goto LABEL_10;
        }

        uint64_t v4 = [v11 bindWithStatement:a3 startingAtIndex:v4] + v4;
LABEL_11:
        ++v10;
      }

      while (v8 != v10);
      uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      uint64_t v8 = v14;
    }

    while (v14);
  }

  return v4 - v16;
}

- (void).cxx_destruct
{
}

@end