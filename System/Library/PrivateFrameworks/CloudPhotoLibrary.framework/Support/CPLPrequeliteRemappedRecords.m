@interface CPLPrequeliteRemappedRecords
- (BOOL)addRemappedRecordWithScopedIdentifier:(id)a3 realScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)fixStorageAfterAnyVersionChange;
- (BOOL)initializeStorage;
- (BOOL)isRecordWithScopedIdentifierRemapped:(id)a3;
- (BOOL)removeRemappedRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)realScopedIdentifierForRemappedScopedIdentifier:(id)a3;
- (id)remappedRecordEnumeratorInScope:(id)a3;
- (id)scopedIdentifiersRemappedToScopedIdentifier:(id)a3;
@end

@implementation CPLPrequeliteRemappedRecords

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRemappedRecords;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,cloudIdentifier TEXT NOT NULL,realIdentifier TEXT NOT NULL",  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedCloudIdentifier",  @"scopeIndex, cloudIdentifier",  1LL,  0LL);
      if (v3) {
        LOBYTE(v3) = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedRealIdentifier",  @"scopeIndex, realIdentifier",  0LL,  0LL);
      }
    }
  }

  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRemappedRecords;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v10, "upgradeStorageToVersion:");
  if (v5)
  {
    if (a3 == 39)
    {
      if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
      {
        LOBYTE(v5) = -[CPLPrequeliteStorage recreateMainTableWithCopyInstructions:oldFields:error:]( self,  "recreateMainTableWithCopyInstructions:oldFields:error:",  @"scopeIndex, cloudIdentifier, realIdentifier",  @"2, cloudIdentifier, realIdentifier",  0LL);
        return v5;
      }
    }

    else if (a3 == 30)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tableName]);
      [v6 recordUpgradeEvent:@"Adding index on cloudIdentifier in %@", v8];

      LOBYTE(v5) = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"cloudIdentifier",  0LL);
      return v5;
    }

    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)fixStorageAfterAnyVersionChange
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CPLPrequeliteRemappedRecords;
  if (!-[CPLPrequeliteStorage fixStorageAfterAnyVersionChange](&v13, "fixStorageAfterAnyVersionChange")) {
    return 0;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v5 = [v3 table:v4 hasColumnWithName:@"deleteDate"];

  if (!v5) {
    return 1;
  }
  if (!_CPLSilentLogging)
  {
    id v6 = sub_100184CE4();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing unused deleteDate column", v12, 2u);
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

  unsigned __int8 v10 = [v9 cplExecute:@"ALTER TABLE remappedDeletes DROP COLUMN deleteDate"];
  return v10;
}

- (BOOL)addRemappedRecordWithScopedIdentifier:(id)a3 realScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v8);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v11 = 0;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v8));
    }
  }

  else
  {
    int64_t v12 = v10;
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    unsigned __int8 v11 = [v14 cplExecute:@"INSERT OR REPLACE INTO %@ (scopeIndex, cloudIdentifier, realIdentifier) VALUES (%ld, %@, %@)", v15, v12, v16, v17];

    if (a5 && (v11 & 1) == 0) {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v14 lastCPLError]);
    }
  }

  return v11;
}

- (BOOL)removeRemappedRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v6));
    }
  }

  else
  {
    int64_t v9 = v7;
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND cloudIdentifier = %@", v12, v9, v13];

    if ((v8 & 1) != 0)
    {
      if ((uint64_t)[v11 changes] >= 1 && !_CPLSilentLogging)
      {
        id v14 = sub_100184CE4();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Removed %@ from remapped records",  buf,  0xCu);
        }
      }
    }

    else if (a4)
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
    }
  }

  return v8;
}

- (id)realScopedIdentifierForRemappedScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0LL;
  }

  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v13 = [v9 cplFetchObjectOfClass:v10, @"SELECT realIdentifier FROM %@ WHERE scopeIndex = %ld AND cloudIdentifier = %@", v11, v7, v12 sql];

    if (v13) {
      id v6 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initRelativeToScopedIdentifier:identifier:",  v4,  v13);
    }
    else {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (id)scopedIdentifiersRemappedToScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = &__NSArray0__struct;
  }

  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v13 = [v9 cplFetch:@"SELECT cloudIdentifier FROM %@ WHERE scopeIndex = %ld AND realIdentifier = %@", v11, v7, v12];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100185290;
    v16[3] = &unk_1002479C0;
    id v17 = v10;
    int64_t v18 = v7;
    id v14 = v10;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 enumerateObjects:v16]);
  }

  return v6;
}

- (BOOL)isRecordWithScopedIdentifierRemapped:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0;
  }

  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND cloudIdentifier = %@",  v7,  v10));
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }

  return v6;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
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

- (id)remappedRecordEnumeratorInScope:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  id v7 = [v4 cloudIndex];
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v10 = [v6 cplFetch:@"SELECT cloudIdentifier, realIdentifier FROM %@ WHERE scopeIndex = %ld", v9, v7];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001855E8;
  v15[3] = &unk_1002479C0;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 enumerateObjects:v15]);
  id v13 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v12);

  return v13;
}

@end