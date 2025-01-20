@interface CPLPrequeliteRecordComputeStatePushQueue
- (BOOL)addComputeState:(id)a3 discardedFileStorageIdentifier:(id *)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 discardedFileStorageIdentifiers:(id *)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3 table:(id)a4;
- (BOOL)hasSomeComputeStateWithFileStorageIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)removeComputeStateWithLocalScopedIdentifier:(id)a3 version:(id)a4 adjustmentFingerprint:(id)a5 discardedFileStorageIdentifier:(id *)a6 error:(id *)a7;
- (BOOL)updateFileURLForComputeState:(id)a3 discardedFileStorageIdentifier:(id *)a4 hasUpdated:(BOOL *)a5 error:(id *)a6;
- (BOOL)updateLocalStateForComputeState:(id)a3 newLocalState:(unint64_t)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)computeStatesToUploadWithScopeIdentifier:(id)a3 localState:(unint64_t)a4 maximumCount:(unint64_t)a5;
- (id)status;
- (unint64_t)countOfComputeStates;
@end

@implementation CPLPrequeliteRecordComputeStatePushQueue

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRecordComputeStatePushQueue;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,localIdentifier TEXT NOT NULL,fileStorageIdentifier TEXT NOT NULL,version TEXT NOT NULL,adjustmentFingerprint TEXT,lastUpdatedDate TIMESTAMP NOT NULL,state INTEGER NOT NULL DEFAULT 0",  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"localIdentifier, scopeIndex",  1LL,  0LL);
      if (v3)
      {
        BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
        if (v3)
        {
          BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"fileStorageIdentifier",  0LL);
          if (v3) {
            LOBYTE(v3) = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"state",  @"state, scopeIndex",  0LL,  0LL);
          }
        }
      }
    }
  }

  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRecordComputeStatePushQueue;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v17, "upgradeStorageToVersion:")) {
    return 0;
  }
  if (a3 != 89)
  {
    if (a3 == 88) {
      return -[CPLPrequeliteStorage createStorage](self, "createStorage");
    }
    return 1;
  }

  if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
    return 1;
  }
  if (!_CPLSilentLogging)
  {
    id v6 = sub_100179AC8();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = 89LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Upgrading %@ to version %llu: adding adjustmentFingerprint column, renaming date column, and dropping fileURL column",  buf,  0x16u);
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v12 = [v10 cplExecute:@"ALTER TABLE %@ ADD COLUMN adjustmentFingerprint TEXT DEFAULT NULL", v11];

  if (v12
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable")),
        unsigned int v14 = [v10 cplExecute:@"ALTER TABLE %@ RENAME COLUMN date TO lastUpdatedDate", v13],  v13,  v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v5 = [v10 cplExecute:@"ALTER TABLE %@ DROP COLUMN fileURL", v15];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)addComputeState:(id)a3 discardedFileStorageIdentifier:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 itemScopedIdentifier]);
  int64_t v10 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v9);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v47 = a4;
    v50 = a5;
    int64_t v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v51 = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v8 fileStorageIdentifier]);
    v18 = (void *)v17;
    v19 = @"#__NONE__#";
    if (v17) {
      v19 = (__CFString *)v17;
    }
    __int16 v20 = v19;
    uint64_t v21 = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 version]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v21 adjustmentFingerprint]);
    v52 = v21;
    v48 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v21 lastUpdatedDate]);
    [v24 timeIntervalSinceReferenceDate];
    int64_t v49 = v12;
    LOBYTE(v21) = [v14 cplExecute:@"INSERT INTO %@ (scopeIndex, localIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, lastUpdatedDate) VALUES (%ld, %@, %@, %@, %@, %lu)", v15, v12, v16, v20, v22, v23, (unint64_t)v25];

    v26 = v14;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v14 lastError]);
    v28 = v27;
    if ((v21 & 1) != 0)
    {
      unsigned __int8 v11 = 1;
      v9 = v51;
      id v8 = v52;
LABEL_20:

      goto LABEL_21;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue([v27 domain]);
    if ([v29 isEqual:PQLSqliteErrorDomain])
    {
      id v30 = [v28 code];

      v9 = v51;
      if (v30 != (id)19)
      {
        unsigned __int8 v11 = 0;
        v45 = v50;
        goto LABEL_17;
      }

      uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](v48, "mainTable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue([v51 identifier]);
      id v34 = [v14 cplFetchObjectOfClass:v31, @"SELECT fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@", v32, v12, v33 sql];
      id v35 = sub_100179EAC(v34);
      id *v47 = (id)objc_claimAutoreleasedReturnValue(v35);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](v48, "mainTable"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v51 identifier]);
      uint64_t v37 = objc_claimAutoreleasedReturnValue([v52 fileStorageIdentifier]);
      v38 = (void *)v37;
      v39 = @"#__NONE__#";
      if (v37) {
        v39 = (__CFString *)v37;
      }
      v40 = v39;
      v41 = (void *)objc_claimAutoreleasedReturnValue([v52 version]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v52 adjustmentFingerprint]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v52 lastUpdatedDate]);
      [v43 timeIntervalSinceReferenceDate];
      unsigned __int8 v11 = [v14 cplExecute:@"REPLACE INTO %@ (scopeIndex, localIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, lastUpdatedDate) VALUES (%ld, %@, %@, %@, %@, %lu)", v29, v49, v36, v40, v41, v42, (unint64_t)v44];

      v26 = v14;
    }

    else
    {
      unsigned __int8 v11 = 0;
    }

    v45 = v50;

    v9 = v51;
LABEL_17:
    id v8 = v52;
    if (v45 && (v11 & 1) == 0)
    {
      unsigned __int8 v11 = 0;
      id *v45 = (id)objc_claimAutoreleasedReturnValue([v26 lastError]);
    }

    goto LABEL_20;
  }

  unsigned __int8 v11 = 0;
  if (a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v9));
  }
LABEL_21:

  return v11;
}

- (BOOL)updateLocalStateForComputeState:(id)a3 newLocalState:(unint64_t)a4 error:(id *)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 itemScopedIdentifier]);
  int64_t v9 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v10 = 0;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v8));
    }
  }

  else
  {
    int64_t v11 = v9;
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned __int8 v10 = [v13 cplExecute:@"UPDATE OR FAIL %@ SET state = %ld WHERE scopeIndex = %ld AND localIdentifier = %@", v14, a4, v11, v15];

    if (a5 && (v10 & 1) == 0) {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v13 lastError]);
    }
  }

  return v10;
}

- (BOOL)updateFileURLForComputeState:(id)a3 discardedFileStorageIdentifier:(id *)a4 hasUpdated:(BOOL *)a5 error:(id *)a6
{
  id v11 = a3;
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 itemScopedIdentifier]);
  int64_t v13 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v12);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v15 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 fileStorageIdentifier]);

    if (!v16) {
      sub_10019C290((uint64_t)v11, (uint64_t)a2, (uint64_t)self);
    }
    id v34 = a5;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pqlConnection]);

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    id v22 = [v18 cplFetchObjectOfClass:v19, @"SELECT fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@", v20, v15, v21 sql];
    id v23 = sub_100179EAC(v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v11 adjustmentFingerprint]);
    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v11 fileStorageIdentifier]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v11 version]);
    v29 = (void *)v28;
    if (v24)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 adjustmentFingerprint]);
      unsigned __int8 v31 = [v18 cplExecute:@"UPDATE OR FAIL %@ SET fileStorageIdentifier = %@ WHERE scopeIndex = %ld AND localIdentifier = %@ AND version = %@ AND adjustmentFingerprint = %@", v25, v26, v15, v27, v29, v30];

      if ((v31 & 1) != 0)
      {
LABEL_7:
        *id v34 = (uint64_t)[v18 changes] > 0;
        BOOL v14 = 1;
LABEL_12:

        goto LABEL_13;
      }
    }

    else
    {
      unsigned int v32 = [v18 cplExecute:@"UPDATE OR FAIL %@ SET fileStorageIdentifier = %@ WHERE scopeIndex = %ld AND localIdentifier = %@ AND version = %@ AND adjustmentFingerprint IS NULL", v25, v26, v15, v27, v28];

      if (v32) {
        goto LABEL_7;
      }
    }

    BOOL v14 = 0;
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue([v18 lastError]);
    }
    goto LABEL_12;
  }

  BOOL v14 = 0;
  if (a6) {
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v12));
  }
LABEL_13:

  return v14;
}

- (BOOL)removeComputeStateWithLocalScopedIdentifier:(id)a3 version:(id)a4 adjustmentFingerprint:(id)a5 discardedFileStorageIdentifier:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  int64_t v15 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v12);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v17 = v15;
    v41 = a6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pqlConnection]);

    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v12 identifier]);
    id v23 = (void *)v22;
    id v42 = v13;
    if (v14)
    {
      id v39 = v13;
      id v40 = v14;
      int64_t v36 = v17;
      uint64_t v38 = v22;
      id v35 = v21;
      v24 = @"SELECT fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@ AND version = %@ AND adjustmentFingerprint = %@";
    }

    else
    {
      uint64_t v38 = v22;
      id v39 = v13;
      id v35 = v21;
      int64_t v36 = v17;
      v24 = @"SELECT fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@ AND version = %@ AND adjustmentFingerprint IS NULL";
    }

    double v25 = v19;
    id v26 = objc_msgSend(v19, "cplFetchObjectOfClass:sql:", v20, v24, v35, v36, v38, v39, v40);

    if (v26)
    {
      id v27 = sub_100179EAC(v26);
      id *v41 = (id)objc_claimAutoreleasedReturnValue(v27);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
      int64_t v37 = v17;
      id v30 = v25;
      unsigned __int8 v16 = [v25 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND localIdentifier = %@", v28, v37, v29];

      if (a7)
      {
        id v13 = v42;
        if ((v16 & 1) == 0)
        {
          unsigned __int8 v16 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue([v30 lastError]);
        }

        goto LABEL_18;
      }
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v31 = sub_100179AC8();
        unsigned int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        id v30 = v19;
        id v13 = v42;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          *(_DWORD *)buf = 138413058;
          id v44 = v12;
          __int16 v45 = 2112;
          id v46 = v42;
          __int16 v47 = 2112;
          id v48 = v14;
          __int16 v49 = 2112;
          v50 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "No payload found with localScopedIdentifier: %@ version: %@ and adjustmentFingerprint: %@ to be removed from %@",  buf,  0x2Au);
        }

        unsigned __int8 v16 = 1;
        goto LABEL_18;
      }

      unsigned __int8 v16 = 1;
      id v30 = v19;
    }

    id v13 = v42;
LABEL_18:

    goto LABEL_19;
  }

  unsigned __int8 v16 = 0;
  if (a7) {
    *a7 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v12));
  }
LABEL_19:

  return v16;
}

- (id)computeStatesToUploadWithScopeIdentifier:(id)a3 localState:(unint64_t)a4 maximumCount:(unint64_t)a5
{
  id v8 = a3;
  int64_t v9 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v10 = (NSMutableArray *)&__NSArray0__struct;
  }

  else
  {
    int64_t v11 = v9;
    unsigned __int8 v10 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a5);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v28 = v13;
    id v15 = [v13 cplFetch:@"SELECT localIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, lastUpdatedDate FROM %@ WHERE scopeIndex = %ld AND state = %ld LIMIT %ld", v14, v11, a4, a5];

    if ([v15 next])
    {
      do
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v15 stringAtIndex:0]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v15 stringAtIndex:1]);
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringAtIndex:2]);
        int64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 stringAtIndex:3]);
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)[v15 integerAtIndex:4]));
        uint64_t v19 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:scopeIndex:",  v8,  v30,  v11);
        int64_t v20 = v11;
        id v21 = v8;
        id v22 = objc_alloc(&OBJC_CLASS___CPLRecordComputeState);
        id v23 = sub_100179EAC(v29);
        v24 = v10;
        double v25 = (void *)objc_claimAutoreleasedReturnValue(v23);
        id v26 = [v22 initWithItemScopedIdentifier:v19 fileStorageIdentifier:v25 version:v16 fileURL:0 adjustmentFingerprint:v17 lastUpdatedDate:v18];

        unsigned __int8 v10 = v24;
        -[NSMutableArray addObject:](v24, "addObject:", v26);

        id v8 = v21;
        int64_t v11 = v20;
      }

      while (([v15 next] & 1) != 0);
    }
  }

  return v10;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3 table:(id)a4
{
  id v6 = a4;
  int64_t v7 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    int64_t v9 = v7;
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld",  v9));
    unsigned __int8 v8 = [v10 table:v6 hasRecordsMatchingQuery:v11];
  }

  return v8;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  LOBYTE(self) = -[CPLPrequeliteRecordComputeStatePushQueue hasChangesInScopeWithIdentifier:table:]( self,  "hasChangesInScopeWithIdentifier:table:",  v4,  v5);

  return (char)self;
}

- (BOOL)hasSomeComputeStateWithFileStorageIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v8 = [v6 cplFetch:@"SELECT fileStorageIdentifier FROM %@ WHERE fileStorageIdentifier = %@", v7, v4];

  LOBYTE(v7) = [v8 next];
  return (char)v7;
}

- (id)status
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRecordComputeStatePushQueue;
  id v2 = -[CPLPrequeliteStorage status](&v6, "status");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 mutableCopy];

  return v4;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 discardedFileStorageIdentifiers:(id *)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7
{
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 1;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pqlConnection]);

  int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v18 = [v16 cplFetch:@"SELECT rowID, fileStorageIdentifier FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v17, a3, a5];
  while (1)
  {

    -[NSMutableIndexSet addIndex:](v14, "addIndex:", [v18 integerAtIndex:0]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringAtIndex:1]);
    id v20 = sub_100179EAC(v19);
    int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (v17) {
      -[NSMutableArray addObject:](v13, "addObject:", v17);
    }
  }

  if (!*((_BYTE *)v29 + 24)) {
    goto LABEL_11;
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10017AC18;
  v24[3] = &unk_1002476F0;
  id v27 = &v28;
  id v21 = v16;
  id v25 = v21;
  id v26 = self;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](v14, "enumerateIndexesUsingBlock:", v24);
  if (a7 && !*((_BYTE *)v29 + 24)) {
    *a7 = (id)objc_claimAutoreleasedReturnValue([v21 lastError]);
  }

  if (*((_BYTE *)v29 + 24))
  {
    *a6 = (int64_t)-[NSMutableIndexSet count](v14, "count");
    *a4 = v13;
    BOOL v22 = *((_BYTE *)v29 + 24) != 0;
  }

  else
  {
LABEL_11:
    BOOL v22 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v22;
}

- (unint64_t)countOfComputeStates
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v5 = [v3 tableCountOfRecords:v4];

  return (unint64_t)v5;
}

@end