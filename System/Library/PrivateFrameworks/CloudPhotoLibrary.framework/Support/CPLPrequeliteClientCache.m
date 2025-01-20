@interface CPLPrequeliteClientCache
- (BOOL)_deleteBadRelations;
- (BOOL)_updateRelatedIdentifier:(id)a3 forRecordWithIdentifier:(id)a4;
- (BOOL)addRecord:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasRecordWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)updateRecord:(id)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteClientCache)initWithAbstractObject:(id)a3;
- (id)_badContainerRelationsIdentifiers;
- (id)recordWithScopedIdentifier:(id)a3;
- (id)recordsWithRelatedScopedIdentifier:(id)a3;
- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3;
- (id)status;
- (id)statusDictionary;
- (id)statusPerScopeIndex;
- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (void)fillRelatedIdentifiersInChange:(id)a3;
@end

@implementation CPLPrequeliteClientCache

- (CPLPrequeliteClientCache)initWithAbstractObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLPrequeliteClientCache;
  return -[CPLPrequeliteStorage initWithAbstractObject:](&v4, "initWithAbstractObject:", a3);
}

- (BOOL)initializeStorage
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLPrequeliteClientCache;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v10, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,class TEXT NOT NULL,relatedIdentifier TEXT,secondaryIdentifier TEXT,serializedRecord DATA NOT NULL",  0LL);
    if (v3)
    {
      unsigned int v4 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"identifier, scopeIndex",  0LL,  0LL);
      LOBYTE(v3) = 0;
      if (v4)
      {
        unsigned int v5 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"relatedScopedIdentifier",  @"relatedIdentifier, scopeIndex",  0LL,  0LL);
        LOBYTE(v3) = 0;
        if (v5)
        {
          unsigned int v6 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"secondaryScopedIdentifier",  @"secondaryIdentifier, scopeIndex",  0LL,  0LL);
          LOBYTE(v3) = 0;
          if (v6)
          {
            unsigned int v7 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"relatedScopedIdentifier.class",  @"relatedIdentifier, scopeIndex, class",  0LL,  0LL);
            LOBYTE(v3) = 0;
            if (v7)
            {
              unsigned int v8 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"secondaryScopedIdentifier.class",  @"secondaryIdentifier, scopeIndex, class",  0LL,  0LL);
              LOBYTE(v3) = 0;
              if (v8)
              {
                BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"class",  0LL);
                if (v3) {
                  LOBYTE(v3) = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
                }
              }
            }
          }
        }
      }
    }
  }

  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLPrequeliteClientCache;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v12, "upgradeStorageToVersion:");
  if (!v5) {
    return v5;
  }
  LOBYTE(v5) = 1;
  if (a3 <= 51)
  {
    if (a3 != 20)
    {
      if (a3 == 39) {
        LOBYTE(v5) = -[CPLPrequeliteStorage recreateMainTableWithCopyInstructions:oldFields:error:]( self,  "recreateMainTableWithCopyInstructions:oldFields:error:",  @"scopeIndex, identifier, class, relatedIdentifier, secondaryIdentifier, serializedRecord",  @"1, identifier, class, relatedIdentifier, secondaryIdentifier, serializedRecord",  0LL);
      }
      return v5;
    }

    if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
    {
      objc_super v10 = @"class";
LABEL_23:
      LOBYTE(v5) = -[CPLPrequeliteStorage createIndexOnColumn:error:](self, "createIndexOnColumn:error:", v10, 0LL);
      return v5;
    }

    goto LABEL_24;
  }

  if (a3 == 52)
  {
    if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
    {
      objc_super v10 = @"scopeIndex";
      goto LABEL_23;
    }

- (BOOL)addRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopedIdentifier]);
  int64_t v8 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v9 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v7));
    }
  }

  else
  {
    int64_t v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedIdentifier]);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 secondaryIdentifier]);
    id v13 = [v6 copy];
    [v13 clearIdentifiers];
    [v13 prepareForStorage];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLArchiver archivedDataWithRootObject:]( &OBJC_CLASS___CPLArchiver,  "archivedDataWithRootObject:",  v13));
    if (v14)
    {
      id v31 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v16 = a4;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v15 pqlConnection]);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      v20 = (objc_class *)objc_opt_class(v6);
      v21 = NSStringFromClass(v20);
      uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
      v23 = v12;
      v24 = (void *)v22;
      v32 = v23;
      unsigned __int8 v9 = [v17 cplExecute:@"INSERT INTO %@ (scopeIndex, identifier, class, relatedIdentifier, secondaryIdentifier, serializedRecord) VALUES (%ld, %@, %@, %@, %@, %@)", v18, v10, v19, v22, v11, v23, v14];

      if ((v9 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          id v25 = sub_1001772CC();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue([v17 lastCPLError]);
            *(_DWORD *)buf = 138412546;
            id v34 = v7;
            __int16 v35 = 2112;
            v36 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Unable to add record with identifier %@: %@",  buf,  0x16u);
          }
        }

        if (v16) {
          id *v16 = (id)objc_claimAutoreleasedReturnValue([v17 lastCPLError]);
        }
      }

      objc_super v12 = v32;
      id v13 = v31;
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v28 = sub_1001772CC();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v6;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
        }
      }

      unsigned __int8 v9 = 0;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidClientCacheErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "invalidClientCacheErrorWithReason:",  0LL));
      }
    }
  }

  return v9;
}

- (BOOL)updateRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopedIdentifier]);
  int64_t v8 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v9 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v7));
    }
  }

  else
  {
    int64_t v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedIdentifier]);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 secondaryIdentifier]);
    id v13 = [v6 copy];
    [v13 clearIdentifiers];
    [v13 prepareForStorage];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLArchiver archivedDataWithRootObject:]( &OBJC_CLASS___CPLArchiver,  "archivedDataWithRootObject:",  v13));
    if (v14)
    {
      id v31 = v13;
      v15 = a4;
      v16 = v14;
      v17 = v11;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pqlConnection]);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v7 identifier]);
      uint64_t v22 = v12;
      v23 = (void *)v21;
      v32 = v22;
      v33 = v17;
      v30 = v17;
      v14 = v16;
      unsigned __int8 v9 = [v19 cplExecute:@"UPDATE %@ SET serializedRecord = %@, relatedIdentifier = %@, secondaryIdentifier = %@ WHERE identifier = %@ AND scopeIndex = %ld", v20, v16, v30, v22, v21, v10];

      if ((v9 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          id v24 = sub_1001772CC();
          id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v19 lastCPLError]);
            *(_DWORD *)buf = 138412546;
            id v35 = v7;
            __int16 v36 = 2112;
            v37 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Unable to update record with identifier %@: %@",  buf,  0x16u);
          }
        }

        if (v15) {
          id *v15 = (id)objc_claimAutoreleasedReturnValue([v19 lastCPLError]);
        }
      }

      objc_super v12 = v32;
      v11 = v33;
      id v13 = v31;
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v27 = sub_1001772CC();
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v6;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
        }
      }

      unsigned __int8 v9 = 0;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidClientCacheErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "invalidClientCacheErrorWithReason:",  0LL));
      }
    }
  }

  return v9;
}

- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v6);
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
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v12, v13, v9];

    if ((v8 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v14 = sub_1001772CC();
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
          *(_DWORD *)buf = 138412546;
          id v19 = v6;
          __int16 v20 = 2112;
          uint64_t v21 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unable to delete record with identifier %@: %@",  buf,  0x16u);
        }
      }

      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
      }
    }
  }

  return v8;
}

- (id)recordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0LL;
  }

  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001778EC;
    v13[3] = &unk_100247278;
    id v14 = v4;
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    id v6 = [v9 cplFetchObject:v13, @"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v10, v11, v7 sql];
  }

  return v6;
}

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v4);
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
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v13 = [v9 cplFetchObjectOfClass:v10, @"SELECT relatedIdentifier FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v11, v12, v7 sql];

    if (v13)
    {
      id v14 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
      id v6 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]( v14,  "initWithScopeIdentifier:identifier:",  v15,  v13);

      -[CPLScopedIdentifier setScopeIndex:](v6, "setScopeIndex:", v7);
    }

    else
    {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v4);
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
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"identifier = %@ AND scopeIndex = %ld",  v10,  v7));
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }

  return v6;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0LL;
  }

  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v13 = [v10 cplFetch:@"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier FROM %@ WHERE relatedIdentifier = %@ AND scopeIndex = %ld", v11, v12, v7];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100177E6C;
    v19[3] = &unk_1002479C0;
    id v20 = v8;
    int64_t v21 = v7;
    id v14 = v8;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v13 enumerateObjects:v19]);
    if (!v6 && !_CPLSilentLogging)
    {
      id v15 = sub_1001772CC();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v10 lastCPLError]);
        *(_DWORD *)buf = 138412546;
        id v23 = v4;
        __int16 v24 = 2112;
        id v25 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unable to create enumerator for records with related identifier %@: %@",  buf,  0x16u);
      }
    }
  }

  return v6;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0LL;
  }

  else
  {
    int64_t v9 = v7;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v15 = NSStringFromClass(a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = [v12 cplFetch:@"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier FROM %@ WHERE relatedIdentifier = %@ AND class = %@ AND scopeIndex = %ld", v13, v14, v16, v9];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100178238;
    v23[3] = &unk_1002479C0;
    id v24 = v10;
    int64_t v25 = v9;
    id v18 = v10;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v17 enumerateObjects:v23]);
    if (!v8 && !_CPLSilentLogging)
    {
      id v19 = sub_1001772CC();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v12 lastCPLError]);
        *(_DWORD *)buf = 138412546;
        id v27 = v6;
        __int16 v28 = 2112;
        v29 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Unable to create enumerator for records with related identifier %@: %@",  buf,  0x16u);
      }
    }
  }

  return v8;
}

- (BOOL)hasRecordWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }

  else
  {
    int64_t v9 = v7;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v13 = NSStringFromClass(a4);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"relatedIdentifier = %@ AND class = %@ AND scopeIndex = %ld",  v12,  v14,  v9));
    unsigned __int8 v8 = [v10 table:v11 hasRecordsMatchingQuery:v15];
  }

  return v8;
}

- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0LL;
  }

  else
  {
    int64_t v9 = v7;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v13 = NSStringFromClass(a4);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"relatedIdentifier = %@ AND class = %@ AND scopeIndex = %ld",  v12,  v14,  v9));
    id v8 = [v10 table:v11 countOfRecordsMatchingQuery:v15];
  }

  return (unint64_t)v8;
}

- (id)_badContainerRelationsIdentifiers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___CPLContainerRelationChange);
  int64_t v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v4 cplFetch:@"SELECT identifier FROM %@ WHERE relatedIdentifier IS NULL AND class = %@", v5, v8];

  id v10 = [v9 enumerateObjectsOfClass:objc_opt_class(NSString)];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (BOOL)_deleteBadRelations
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___CPLContainerRelationChange);
  int64_t v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned __int8 v9 = [v4 cplExecute:@"DELETE FROM %@ WHERE relatedIdentifier IS NULL AND class = %@", v5, v8];

  return v9;
}

- (BOOL)_updateRelatedIdentifier:(id)a3 forRecordWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  LOBYTE(v8) = [v9 cplExecute:@"UPDATE %@ SET relatedIdentifier = %@ WHERE identifier = %@", v10, v7, v6];

  return (char)v8;
}

- (id)status
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLPrequeliteClientCache;
  id v3 = -[CPLPrequeliteStorage status](&v12, "status");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001788DC;
  v10[3] = &unk_1002478D8;
  id v8 = v5;
  id v11 = v8;
  [v6 table:v7 enumerateCountGroupedByProperty:@"class" block:v10];

  return v8;
}

- (id)statusDictionary
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001789F4;
  v8[3] = &unk_1002478D8;
  id v6 = v3;
  unsigned __int8 v9 = v6;
  [v4 table:v5 enumerateCountGroupedByProperty:@"class" block:v8];

  return v6;
}

- (id)statusPerScopeIndex
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLPrequeliteClientCache;
  id v2 = -[CPLPrequeliteStorage statusPerScopeIndexWithGroupProperty:valueDescription:]( &v4,  "statusPerScopeIndexWithGroupProperty:valueDescription:",  @"class",  &stru_100247C28);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)fillRelatedIdentifiersInChange:(id)a3
{
  id v11 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v11 scopedIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 scopedIdentifier]);
  int64_t v6 = -[CPLPrequeliteStorage scopeIndexForLocalScopedIdentifier:](self, "scopeIndexForLocalScopedIdentifier:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100178BF0;
    v12[3] = &unk_100247278;
    id v13 = v11;
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  }
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

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

@end