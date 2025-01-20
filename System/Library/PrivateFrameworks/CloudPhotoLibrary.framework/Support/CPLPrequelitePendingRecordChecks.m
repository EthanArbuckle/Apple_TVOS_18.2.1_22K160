@interface CPLPrequelitePendingRecordChecks
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)dequeueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4;
- (BOOL)enqueueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4;
- (BOOL)hasRecordsToCheckWithScopeIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)nextBatchOfRecordsToCheckWithScopeIdentifier:(id)a3;
- (id)status;
@end

@implementation CPLPrequelitePendingRecordChecks

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequelitePendingRecordChecks;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL",  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
      if (v3) {
        LOBYTE(v3) = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"scopeIndex, identifier",  1LL,  0LL);
      }
    }
  }

  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CPLPrequelitePendingRecordChecks;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v7, "upgradeStorageToVersion:");
  if (a3 == 72 && v5) {
    LOBYTE(v5) = -[CPLPrequeliteStorage createStorage](self, "createStorage");
  }
  return v5;
}

- (BOOL)enqueueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (![v13 scopeIndex]) {
          sub_10019C094((uint64_t)v13, (uint64_t)a2, (uint64_t)self);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        id v15 = [v13 scopeIndex];
        v16 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        LODWORD(v15) = [v7 cplExecute:@"INSERT OR IGNORE INTO %@ (scopeIndex, identifier) VALUES (%ld, %@)", v14, v15, v16];

        if (!(_DWORD)v15)
        {

          BOOL v17 = 0;
          if (a4) {
            *a4 = (id)objc_claimAutoreleasedReturnValue([v7 lastError]);
          }
          goto LABEL_13;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = 1;
LABEL_13:

  return v17;
}

- (id)nextBatchOfRecordsToCheckWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:](self, "cloudScopeIndexForScopeIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = &__NSArray0__struct;
  }

  else
  {
    int64_t v7 = v5;
    id v8 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 200LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v12 = [v10 cplFetch:@"SELECT identifier FROM %@ WHERE scopeIndex = %ld LIMIT %lu", v11, v7, 200];

    if ([v12 next])
    {
      do
      {
        v13 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringAtIndex:0]);
        id v15 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( v13,  "initWithScopeIdentifier:identifier:scopeIndex:",  v4,  v14,  v7);

        -[NSMutableArray addObject:](v8, "addObject:", v15);
      }

      while (([v12 next] & 1) != 0);
    }

    id v6 = -[NSMutableArray copy](v8, "copy");
  }

  return v6;
}

- (BOOL)dequeueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v9)
  {

    uint64_t v11 = 0LL;
    char v23 = 1;
    goto LABEL_18;
  }

  id v10 = v9;
  v25 = a4;
  uint64_t v11 = 0LL;
  int64_t v12 = 0LL;
  uint64_t v13 = *(void *)v29;
  unsigned __int8 v26 = 1;
  do
  {
    v14 = v8;
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v14);
      }
      v16 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
      if (!v11
        || (BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v28 + 1) + 8 * (void)i) scopeIdentifier]),
            unsigned __int8 v18 = [v17 isEqualToString:v11],
            v17,
            (v18 & 1) == 0))
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 scopeIdentifier]);

        int64_t v20 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:]( self,  "cloudScopeIndexForScopeIdentifier:",  v19);
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v12 = 0LL;
          uint64_t v11 = (void *)v19;
          continue;
        }

        int64_t v12 = v20;
        uint64_t v11 = (void *)v19;
      }

      if (v12)
      {
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        unsigned __int8 v26 = [v27 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v21, v12, v22];
      }
    }

    id v8 = v14;
    id v10 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }

  while (v10);

  char v23 = v26;
  if (!((v25 == 0LL) | v26 & 1))
  {
    char v23 = 0;
    id *v25 = (id)objc_claimAutoreleasedReturnValue([v27 lastError]);
  }

- (BOOL)hasRecordsToCheckWithScopeIdentifier:(id)a3
{
  int64_t v4 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:](self, "cloudScopeIndexForScopeIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld",  v6));
  unsigned __int8 v10 = [v7 table:v8 hasRecordsMatchingQuery:v9];

  return v10;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v14 = [v12 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (v14)
  {
    *a5 = (int64_t)[v12 changes];
  }

  else if (a6)
  {
    *a6 = (id)objc_claimAutoreleasedReturnValue([v12 lastError]);
  }

  return v14;
}

- (id)status
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v5 = [v3 tableCountOfRecords:v4];

  if (v5) {
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu records need to be checked in the Cloud",  v5));
  }
  else {
    int64_t v6 = 0LL;
  }
  return v6;
}

@end