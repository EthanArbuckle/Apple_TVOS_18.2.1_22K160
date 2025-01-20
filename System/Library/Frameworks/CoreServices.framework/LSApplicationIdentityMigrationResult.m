@interface LSApplicationIdentityMigrationResult
- (LSApplicationIdentityMigrationResult)init;
- (id)bestMigratedIdentityForIdentity:(id)a3;
- (id)migratedIdentitiesForIdentity:(id)a3;
- (void)noteIdentityDoesNotNeedMigration:(uint64_t)a1;
@end

@implementation LSApplicationIdentityMigrationResult

- (void)noteIdentityDoesNotNeedMigration:(uint64_t)a1
{
  v6[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v6[0] = v3;
    [MEMORY[0x189603F18] arrayWithObjects:v6 count:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 8) setObject:v5 forKeyedSubscript:v4];
  }
}

- (LSApplicationIdentityMigrationResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LSApplicationIdentityMigrationResult;
  v2 = -[LSApplicationIdentityMigrationResult init](&v6, sel_init);
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    migratedIdentities = v2->_migratedIdentities;
    v2->_migratedIdentities = v3;
  }

  return v2;
}

- (id)migratedIdentitiesForIdentity:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    [MEMORY[0x189604010] setWithArray:v3];
  }
  else {
    [MEMORY[0x189604010] set];
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bestMigratedIdentityForIdentity:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 firstObject];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
}

@end