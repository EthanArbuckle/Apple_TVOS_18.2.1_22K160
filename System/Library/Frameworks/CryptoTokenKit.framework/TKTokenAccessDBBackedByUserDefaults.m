@interface TKTokenAccessDBBackedByUserDefaults
- (TKTokenAccessDBBackedByUserDefaults)init;
- (id)_keyRefForRequest:(id)a3;
- (int64_t)fetchAccessForRequest:(id)a3;
- (void)clearAllAccessRecords;
- (void)storeAccess:(int64_t)a3 forRequest:(id)a4;
@end

@implementation TKTokenAccessDBBackedByUserDefaults

- (TKTokenAccessDBBackedByUserDefaults)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TKTokenAccessDBBackedByUserDefaults;
  v2 = -[TKTokenAccessDBBackedByUserDefaults init](&v10, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189604038]) initWithSuiteName:@"com.apple.ctkd.access-db"];
    db = v2->_db;
    v2->_db = (NSUserDefaults *)v3;
  }

  dispatch_get_global_queue(0LL, 0LL);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__TKTokenAccessDBBackedByUserDefaults_init__block_invoke;
  block[3] = &unk_189F8A290;
  v6 = v2;
  v9 = v6;
  dispatch_async(v5, block);

  return v6;
}

void __43__TKTokenAccessDBBackedByUserDefaults_init__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  [*(id *)(*(void *)(a1 + 32) + 8) dictionaryRepresentation];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 allKeys];
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&__int128 v4 = 138412290LL;
    __int128 v15 = v4;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        uint64_t v9 = objc_msgSend(v8, "rangeOfString:", @",", v15);
        if (v9) {
          BOOL v10 = v9 == 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          objc_msgSend(v8, "substringWithRange:", 0, v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v11 length])
          {
            [MEMORY[0x189605750] defaultWorkspace];
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            char v13 = [v12 applicationIsInstalled:v11];

            if ((v13 & 1) == 0)
            {
              [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v8];
              if (TK_LOG_token_access_registry_once != -1) {
                dispatch_once(&TK_LOG_token_access_registry_once, &__block_literal_global_1);
              }
              v14 = (os_log_s *)TK_LOG_token_access_registry_log;
              if (os_log_type_enabled((os_log_t)TK_LOG_token_access_registry_log, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v15;
                v22 = v11;
                _os_log_debug_impl( &dword_186E58000,  v14,  OS_LOG_TYPE_DEBUG,  "'%@' removed from token registry DB",  buf,  0xCu);
              }
            }
          }
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v5);
  }
}

- (int64_t)fetchAccessForRequest:(id)a3
{
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](self->_db, "objectForKey:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[NSUserDefaults BOOLForKey:](self->_db, "BOOLForKey:", v4)) {
      int64_t v6 = 1LL;
    }
    else {
      int64_t v6 = 2LL;
    }
  }

  else
  {
    int64_t v6 = 0LL;
  }

  return v6;
}

- (void)storeAccess:(int64_t)a3 forRequest:(id)a4
{
  if (a3)
  {
    -[TKTokenAccessDBBackedByUserDefaults _keyRefForRequest:](self, "_keyRefForRequest:", a4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setBool:forKey:](self->_db, "setBool:forKey:", a3 == 1, v6);
  }

- (void)clearAllAccessRecords
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  -[NSUserDefaults dictionaryRepresentation](self->_db, "dictionaryRepresentation", 0LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 allKeys];
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSUserDefaults removeObjectForKey:]( self->_db,  "removeObjectForKey:",  *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (id)_keyRefForRequest:(id)a3
{
  uint64_t v3 = (void *)NSString;
  id v4 = a3;
  uint64_t v5 = [v4 clientBundleID];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (const __CFString *)v5;
  }
  else {
    uint64_t v7 = &stru_189F8C1A8;
  }
  [v4 tokenID];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 classID];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@,%@", v7, v9];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
}

@end