@interface CPLPrequeliteIgnoredRecords
- (BOOL)_isEmpty;
- (BOOL)addIgnoredRecord:(id)a3 ignoredDate:(id)a4 otherScopeIndex:(int64_t)a5 error:(id *)a6;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)popCloudScopedIdentifiersToCheck:(id *)a3 otherScopeIndex:(int64_t)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7;
- (BOOL)removeRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)scopeIdentifier:(id)a3 hasIgnoredRecordsBeforeDate:(id)a4;
- (BOOL)setIgnoredDate:(id)a3 forRecordWithScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteIgnoredRecords)initWithAbstractObject:(id)a3;
- (id)ignoredRecordWithScopedIdentifier:(id)a3;
- (id)ignoredRecordsBeforeDate:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5;
- (id)recordsDesignation;
- (id)status;
- (void)writeTransactionDidFail;
@end

@implementation CPLPrequeliteIgnoredRecords

- (CPLPrequeliteIgnoredRecords)initWithAbstractObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIgnoredRecords;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v8, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteSynthesizedVariable,  "variableWithName:type:",  @"isEmpty",  v4));
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;
  }

  return (CPLPrequeliteIgnoredRecords *)v3;
}

- (BOOL)_isEmpty
{
  v2 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10017AE44;
  v6[3] = &unk_100247CB0;
  v6[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueWithConstructor:v6]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)initializeStorage
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIgnoredRecords;
  if (!-[CPLPrequeliteStorage initializeStorage](&v10, "initializeStorage")
    || !-[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,serializedRecord DATA NOT NULL,ignoredDate TIMESTAMP NOT NULL,otherScopeIndex INTEGER NOT NULL,shadowed INTEGER NOT NULL",  0LL)
    || !-[CPLPrequeliteStorage createIndexOnColumn:error:](self, "createIndexOnColumn:error:", @"scopeIndex", 0LL)
    || !-[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"scopeIndex, identifier",  1LL,  0LL)
    || !-[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"otherScopeIndex",  0LL)
    || !-[CPLPrequeliteStorage createIndexOnColumn:error:](self, "createIndexOnColumn:error:", @"shadowed", 0LL))
  {
    return 0;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable indexVariableForVariableWithName:forTable:]( &OBJC_CLASS___CPLPrequeliteVariable,  "indexVariableForVariableWithName:forTable:",  @"ignoredDate",  v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v8 = [v4 cplExecute:@"CREATE INDEX %@ ON %@ (scopeIndex, ignoredDate ASC) WHERE shadowed != 0", v6, v7];

  return v8;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIgnoredRecords;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v55, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  switch(a3)
  {
    case 'I':
      return -[CPLPrequeliteStorage createStorage](self, "createStorage");
    case 'J':
      if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
        unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        unsigned int v10 = [v8 cplExecute:@"ALTER TABLE %@ ADD COLUMN shadowed INTEGER DEFAULT 1", v9];

        if (!v10) {
          goto LABEL_18;
        }
        unsigned __int8 v5 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"shadowed",  0LL);
        goto LABEL_19;
      }

      return v5;
    case 'L':
      if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        double v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
        unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        unsigned int v15 = [v8 cplExecute:@"ALTER TABLE %@ ADD COLUMN ignoredDate TIMESTAMP DEFAULT 0", v14];

        if (v15
          && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable")),
              unsigned int v17 = [v8 cplExecute:@"UPDATE %@ SET ignoredDate = %ld", v16, (unint64_t)v12],  v16,  v17))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable indexVariableForVariableWithName:forTable:]( &OBJC_CLASS___CPLPrequeliteVariable,  "indexVariableForVariableWithName:forTable:",  @"ignoredDate",  v18));

          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          unsigned __int8 v5 = [v8 cplExecute:@"CREATE INDEX %@ ON %@ (scopeIndex, ignoredDate ASC) WHERE shadowed != 0", v19, v20];
        }

        else
        {
LABEL_18:
          unsigned __int8 v5 = 0;
        }

- (id)ignoredRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  if (-[CPLPrequeliteIgnoredRecords _isEmpty](self, "_isEmpty")
    || (int64_t v5 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:]( self,  "scopeIndexForCloudScopedIdentifier:",  v4),  v5 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v6 = 0LL;
  }

  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10017B794;
    v14[3] = &unk_100247278;
    id v15 = v4;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
    id v6 = [v9 cplFetchObject:v14, @"SELECT scopeIndex, identifier, serializedRecord, ignoredDate FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v10, v11, v7 sql];

    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    if (v6 == v12)
    {

      id v6 = 0LL;
    }
  }

  return v6;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  if (-[CPLPrequeliteIgnoredRecords _isEmpty](self, "_isEmpty")
    || (int64_t v5 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:]( self,  "scopeIndexForCloudScopedIdentifier:",  v4),  v5 == 0x7FFFFFFFFFFFFFFFLL))
  {
    unsigned __int8 v6 = 0;
  }

  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"identifier = %@ AND scopeIndex = %ld",  v10,  v7));
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }

  return v6;
}

- (BOOL)addIgnoredRecord:(id)a3 ignoredDate:(id)a4 otherScopeIndex:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 scopedIdentifier]);
  int64_t v13 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v12);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v14 = 0;
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v12));
    }
  }

  else
  {
    int64_t v15 = v13;
    v28 = a6;
    unsigned int v30 = [v10 supportsSharingScopedIdentifier];
    id v16 = [v10 copy];
    [v16 prepareForStorage];
    id v29 = v16;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[CPLArchiver archivedDataWithRootObject:](&OBJC_CLASS___CPLArchiver, "archivedDataWithRootObject:", v16));
    v18 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pqlConnection]);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    [v18 timeIntervalSinceReferenceDate];
    int64_t v27 = a5;
    unsigned int v24 = (void *)v17;
    unsigned __int8 v14 = [v20 cplExecute:@"INSERT OR REPLACE INTO %@ (scopeIndex, identifier, serializedRecord, shadowed, ignoredDate, otherScopeIndex) VALUES (%ld, %@, %@, %d, %ld, %ld)", v21, v15, v22, v17, v30, (uint64_t)v23, v27];

    if ((v14 & 1) != 0)
    {
      [*(id *)(&self->super._shouldUpgradeSchema + 1) setValue:&__kCFBooleanFalse];
      unsigned __int8 v25 = v29;
      id v11 = v18;
    }

    else
    {
      unsigned __int8 v25 = v29;
      id v11 = v18;
      if (v28) {
        id *v28 = (id)objc_claimAutoreleasedReturnValue([v20 lastCPLError]);
      }
    }
  }

  return v14;
}

- (BOOL)removeRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[CPLPrequeliteIgnoredRecords _isEmpty](self, "_isEmpty"))
  {
    unsigned __int8 v7 = 1;
  }

  else
  {
    int64_t v8 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v6);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned __int8 v7 = 0;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v6));
      }
    }

    else
    {
      int64_t v9 = v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      unsigned __int8 v7 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v12, v9, v13];

      if (a4 && (v7 & 1) == 0) {
        *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
      }
      [*(id *)(&self->super._shouldUpgradeSchema + 1) discardCachedValue];
    }
  }

  return v7;
}

- (id)ignoredRecordsBeforeDate:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:](self, "cloudScopeIndexForScopeIdentifier:", v9);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = &__NSArray0__struct;
  }

  else
  {
    int64_t v12 = v10;
    int64_t v13 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a5);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pqlConnection]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    [v8 timeIntervalSinceReferenceDate];
    int64_t v27 = v15;
    id v18 = [v15 cplFetch:@"SELECT scopeIndex, identifier, serializedRecord, ignoredDate FROM %@ WHERE shadowed != 0 AND scopeIndex = %ld AND ignoredDate < %ld LIMIT %ld", v16, v12, (uint64_t)v17, a5];

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10017BEB8;
    v28[3] = &unk_1002479C0;
    id v29 = v9;
    int64_t v30 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 enumerateObjects:v28]);
    id v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          unsigned int v24 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

          if (v24 != v25) {
            -[NSMutableArray addObject:](v13, "addObject:", v24);
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v21);
    }

    id v11 = -[NSMutableArray copy](v13, "copy");
  }

  return v11;
}

- (BOOL)setIgnoredDate:(id)a3 forRecordWithScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v9);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v11 = 0;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v9));
    }
  }

  else
  {
    int64_t v12 = v10;
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    [v8 timeIntervalSinceReferenceDate];
    uint64_t v17 = (uint64_t)v16;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    unsigned __int8 v11 = [v14 cplExecute:@"UPDATE %@ SET ignoredDate = %ld WHERE scopeIndex = %ld AND identifier = %@", v15, v17, v12, v18];

    if (a5 && (v11 & 1) == 0) {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v14 lastCPLError]);
    }
  }

  return v11;
}

- (BOOL)scopeIdentifier:(id)a3 hasIgnoredRecordsBeforeDate:(id)a4
{
  id v6 = a4;
  int64_t v7 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:](self, "cloudScopeIndexForScopeIdentifier:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    int64_t v9 = v7;
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    [v6 timeIntervalSinceReferenceDate];
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"shadowed != 0 AND scopeIndex = %ld AND ignoredDate < %ld",  v9,  (uint64_t)v12));
    unsigned __int8 v8 = [v10 table:v11 hasRecordsMatchingQuery:v13];
  }

  return v8;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v14 = [v12 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (v14)
  {
    *a5 = (int64_t)[v12 changes];
  }

  else if (a6)
  {
    *a6 = (id)objc_claimAutoreleasedReturnValue([v12 lastError]);
  }

  [*(id *)(&self->super._shouldUpgradeSchema + 1) discardCachedValue];

  return v14;
}

- (BOOL)popCloudScopedIdentifiersToCheck:(id *)a3 otherScopeIndex:(int64_t)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7
{
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

  double v12 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a5);
  int64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v15 = [v11 cplFetch:@"SELECT rowid, scopeIndex, identifier FROM %@ WHERE otherScopeIndex = %ld LIMIT %lu", v14, a4, a5];

  if ([v15 next])
  {
    id v16 = 0LL;
    uint64_t v17 = 0LL;
    do
    {
      -[NSMutableIndexSet addIndex:](v13, "addIndex:", [v15 integerAtIndex:0]);
      id v18 = [v15 integerAtIndex:1];
      if (v18 != v16)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteIgnoredRecords abstractObject](self, "abstractObject"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 engineStore]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 scopes]);

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 scopeIdentifierForCloudScopeIndex:v18]);
        if (v22)
        {
          double v23 = (void *)objc_claimAutoreleasedReturnValue([v21 scopeWithIdentifier:v22]);
          if (!v23 || [v21 valueForFlag:16 forScope:v23])
          {

            uint64_t v22 = 0LL;
          }
        }

        uint64_t v17 = v22;
        id v16 = v18;
      }

      if (v17)
      {
        unsigned int v24 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
        unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v15 stringAtIndex:2]);
        v26 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( v24,  "initWithScopeIdentifier:identifier:scopeIndex:",  v17,  v25,  v18);

        -[NSMutableArray addObject:](v12, "addObject:", v26);
      }
    }

    while (([v15 next] & 1) != 0);
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 1;
  uint64_t v39 = 0LL;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_10017C654;
  v43 = sub_10017C664;
  id v44 = 0LL;
  if (-[NSMutableIndexSet count](v13, "count"))
  {
    int64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10017C66C;
    v34[3] = &unk_100247250;
    v37 = &v45;
    id v35 = v11;
    id v28 = v27;
    id v36 = v28;
    id v38 = &v39;
    -[NSMutableIndexSet enumerateIndexesUsingBlock:](v13, "enumerateIndexesUsingBlock:", v34);
  }

  if (*((_BYTE *)v46 + 24))
  {
    *a3 = -[NSMutableArray copy](v12, "copy");
    *a6 = (int64_t)-[NSMutableIndexSet count](v13, "count");
  }

  else if (a7)
  {
    *a7 = (id) v40[5];
  }

  char v29 = *((_BYTE *)v46 + 24);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v29;
}

- (id)recordsDesignation
{
  return @"ignored records";
}

- (id)status
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  int64_t v5 = [v3 tableCountOfRecords:v4];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"shadowed = 1"));
    int64_t v9 = [v6 table:v7 countOfRecordsMatchingQuery:v8];

    if (v5 == v9)
    {
      int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteIgnoredRecords recordsDesignation](self, "recordsDesignation"));
      unsigned __int8 v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu %@ (all shadowed)",  v5,  v10,  v17,  v18);
    }

    else
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteIgnoredRecords recordsDesignation](self, "recordsDesignation"));
      int64_t v10 = (void *)v12;
      if (v9)
      {
        uint64_t v17 = v9;
        int64_t v18 = v5 - v9;
        id v15 = v5;
        uint64_t v16 = v12;
        int64_t v13 = @"%lu %@ (%lu shadowed - %lu split)";
      }

      else
      {
        id v15 = v5;
        uint64_t v16 = v12;
        int64_t v13 = @"%lu %@ (all split)";
      }

      unsigned __int8 v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v15, v16, v17, v18);
    }

    int64_t v5 = (_BYTE *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v5;
}

- (void)writeTransactionDidFail
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIgnoredRecords;
  -[CPLPrequeliteStorage writeTransactionDidFail](&v3, "writeTransactionDidFail");
  [*(id *)(&self->super._shouldUpgradeSchema + 1) discardCachedValue];
}

- (void).cxx_destruct
{
}

@end