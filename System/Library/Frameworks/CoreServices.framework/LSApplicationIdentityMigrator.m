@interface LSApplicationIdentityMigrator
- (id)migrateIdentities:(id)a3 error:(id *)a4;
- (id)migrateIdentity:(id)a3 error:(id *)a4;
@end

@implementation LSApplicationIdentityMigrator

- (id)migrateIdentities:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___LSApplicationIdentityMigrationResult);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v16;
    *(void *)&__int128 v8 = 138412290LL;
    __int128 v14 = v8;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "needsMigration", v14, (void)v15))
        {
          _LSDefaultLog();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v11;
            _os_log_fault_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_FAULT,  "identity %@ needs migration!? How!?",  buf,  0xCu);
          }
        }

        -[LSApplicationIdentityMigrationResult noteIdentityDoesNotNeedMigration:]((uint64_t)v5, v11);
      }

      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v7);
  }

  return v5;
}

- (id)migrateIdentity:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSApplicationIdentityMigrator migrateIdentities:error:](self, "migrateIdentities:error:", v6, a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end