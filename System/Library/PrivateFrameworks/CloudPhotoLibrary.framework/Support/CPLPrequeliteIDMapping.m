@interface CPLPrequeliteIDMapping
- (BOOL)addAddEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5;
- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7;
- (BOOL)addDeleteEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasPendingIdentifiers;
- (BOOL)initializeStorage;
- (BOOL)markAllPendingIdentifiersForScopeWithIdentifier:(id)a3 asFinalWithError:(id *)a4;
- (BOOL)removeMappingForCloudScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeMappingForLocalScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)resetAllFinalCloudIdentifiersForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setFinalCloudScopedIdentifier:(id)a3 forPendingCloudScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteIDMapping)initWithAbstractObject:(id)a3;
- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)scopeIndexColumnName;
- (id)status;
- (void)_cacheLocalScopedIdentifier:(id)a3 cloudScopedIdentifier:(id)a4 isFinal:(BOOL)a5;
- (void)_clearScopedIdentifiersCache;
- (void)transactionDidFinish;
@end

@implementation CPLPrequeliteIDMapping

- (CPLPrequeliteIDMapping)initWithAbstractObject:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIDMapping;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v11, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v7 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v9 = *(void **)(v3 + 52);
    *(void *)(v3 + 52) = v8;
  }

  return (CPLPrequeliteIDMapping *)v3;
}

- (void)_clearScopedIdentifiersCache
{
}

- (void)_cacheLocalScopedIdentifier:(id)a3 cloudScopedIdentifier:(id)a4 isFinal:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  id v9 = a4;
  id v11 = a3;
  [v8 setObject:v9 forKeyedSubscript:v11];
  [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) setObject:v11 forKeyedSubscript:v9];

  v10 = *(NSMutableDictionary **)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4);
  if (v5) {
    [v10 removeObject:v11];
  }
  else {
    [v10 addObject:v11];
  }
}

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIDMapping;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v5, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"stableScopeIndex INTEGER NOT NULL,cloudIdentifier TEXT NOT NULL,localIdentifier TEXT NOT NULL,mappingState INTEGER NOT NULL,addTimestamp TIMESTAMP NOT NULL,addDirection INTEGER NOT NULL,deleteTimestamp TIMESTAMP,deleteDirection INTEGER",  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedCloudIdentifier",  @"stableScopeIndex, cloudIdentifier",  1LL,  0LL);
      if (v3)
      {
        BOOL v3 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedLocalIdentifier",  @"stableScopeIndex, localIdentifier",  1LL,  0LL);
        if (v3) {
          LOBYTE(v3) = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"mappingState",  0LL);
        }
      }
    }
  }

  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIDMapping;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v18, "upgradeStorageToVersion:")) {
    return 0;
  }
  if (a3 == 45)
  {
    if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
      return 1;
    }
    v15 = self;
    v16 = @"stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection, deleteTimestamp, deleteDirection";
    return -[CPLPrequeliteStorage recreateMainTableWithCopyInstructions:oldFields:error:]( v15,  "recreateMainTableWithCopyInstructions:oldFields:error:",  @"stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection, deleteTimestamp, deleteDirection",  v16,  0LL);
  }

  if (a3 == 39)
  {
    if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
      return 1;
    }
    v16 = @"3, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection, deleteTimestamp, deleteDirection";
    v15 = self;
    return -[CPLPrequeliteStorage recreateMainTableWithCopyInstructions:oldFields:error:]( v15,  "recreateMainTableWithCopyInstructions:oldFields:error:",  @"stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection, deleteTimestamp, deleteDirection",  v16,  0LL);
  }

  if (a3 != 37) {
    return 1;
  }
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v8 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN addTimestamp TIMESTAMP NOT NULL DEFAULT -2147483648", v7];

  if (v8
    && (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable")),
        unsigned int v10 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN addDirection INTEGER NOT NULL DEFAULT 0", v9],  v9,  v10)
    && (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable")),
        unsigned int v12 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN deleteTimestamp TIMESTAMP DEFAULT NULL", v11],  v11,  v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v14 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN deleteDirection INTEGER DEFAULT NULL", v13];
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(&self->super._shouldUpgradeSchema + 1) objectForKeyedSubscript:v6]);
  if (v7)
  {
    id v8 = (id)v7;
    *a4 = [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) containsObject:v6] ^ 1;
  }

  else
  {
    *a4 = 0;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
    int64_t v10 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v9);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = 0LL;
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100169704;
      v18[3] = &unk_1002479C0;
      v20 = a4;
      id v13 = v6;
      id v19 = v13;
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      id v16 = [v12 cplFetchObject:v18, @"SELECT cloudIdentifier, mappingState FROM %@ WHERE stableScopeIndex = %ld AND localIdentifier = %@", v14, v10, v15 sql];

      if (v16) {
        -[CPLPrequeliteIDMapping _cacheLocalScopedIdentifier:cloudScopedIdentifier:isFinal:]( self,  "_cacheLocalScopedIdentifier:cloudScopedIdentifier:isFinal:",  v13,  v16,  *a4);
      }
      id v8 = v16;
    }
  }

  return v8;
}

- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) objectForKeyedSubscript:v6]);
  if (v7)
  {
    id v8 = (id)v7;
    *a4 = [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) containsObject:v7] ^ 1;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
    int64_t v10 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v9);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = 0LL;
    }

    else
    {
      *a4 = 0;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100169944;
      v18[3] = &unk_1002479C0;
      v20 = a4;
      id v13 = v6;
      id v19 = v13;
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      id v16 = [v12 cplFetchObject:v18, @"SELECT localIdentifier, mappingState FROM %@ WHERE stableScopeIndex = %ld AND cloudIdentifier = %@", v14, v10, v15 sql];

      if (v16) {
        -[CPLPrequeliteIDMapping _cacheLocalScopedIdentifier:cloudScopedIdentifier:isFinal:]( self,  "_cacheLocalScopedIdentifier:cloudScopedIdentifier:isFinal:",  v16,  v13,  *a4);
      }
      id v8 = v16;
    }
  }

  return v8;
}

- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 scopeIdentifier]);
  int64_t v15 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v14);

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unint64_t v19 = a6;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 pqlConnection]);

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v22 = (uint64_t)v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v50 = v12;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v13 identifier]);
    BOOL v26 = v9;
    v27 = (void *)v25;
    unint64_t v48 = v19;
    BOOL v49 = v26;
    LOBYTE(v19) = [v20 cplExecute:@"INSERT OR IGNORE INTO %@ (stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection) VALUES (%ld, %@, %@, %i, %ld, %ld)", v23, v15, v24, v25, v26, v22, v19];

    if ((v19 & 1) != 0)
    {
      v28 = v20;
      if ([v20 changes])
      {
LABEL_7:
        -[CPLPrequeliteIDMapping _cacheLocalScopedIdentifier:cloudScopedIdentifier:isFinal:]( self,  "_cacheLocalScopedIdentifier:cloudScopedIdentifier:isFinal:",  v13,  v50,  v49);
        BOOL v17 = 1;
LABEL_39:

        id v12 = v50;
        goto LABEL_40;
      }

      char v51 = 0;
      v29 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteIDMapping cloudScopedIdentifierForLocalScopedIdentifier:isFinal:]( self,  "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:",  v13,  &v51));
      v30 = v29;
      if (v29 && (!v50 || ([v29 isEqual:v50] & 1) == 0))
      {
        if (!_CPLSilentLogging)
        {
          id v31 = sub_100169EB0();
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v53 = v30;
            __int16 v54 = 2112;
            id v55 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Removing stale mapping of cloud identifier %@ to local identifier %@",  buf,  0x16u);
          }
        }

        v28 = v20;
        if (!-[CPLPrequeliteIDMapping removeMappingForCloudScopedIdentifier:error:]( self,  "removeMappingForCloudScopedIdentifier:error:",  v30,  a7)) {
          goto LABEL_36;
        }
      }

      v20 = v28;
      v33 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteIDMapping localScopedIdentifierForCloudScopedIdentifier:isFinal:]( self,  "localScopedIdentifierForCloudScopedIdentifier:isFinal:",  v50,  &v51));
      if (!v33) {
        goto LABEL_31;
      }
      v34 = v33;
      if (v13 && ([v33 isEqual:v13] & 1) != 0)
      {
        v47 = v30;
        if (!_CPLSilentLogging)
        {
          id v35 = sub_100169EB0();
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v53 = v50;
            __int16 v54 = 2112;
            id v55 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Mapping cloud identifier %@ to local identifier %@ is already known",  buf,  0x16u);
          }
        }

        v28 = v20;
        goto LABEL_32;
      }

      if (!_CPLSilentLogging)
      {
        id v37 = sub_100169EB0();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v53 = v34;
          __int16 v54 = 2112;
          id v55 = v50;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Removing stale mapping of local identifier %@ to cloud identifier %@",  buf,  0x16u);
        }
      }

      unsigned __int8 v39 = -[CPLPrequeliteIDMapping removeMappingForLocalScopedIdentifier:error:]( self,  "removeMappingForLocalScopedIdentifier:error:",  v34,  a7);

      if ((v39 & 1) != 0)
      {
LABEL_31:
        v47 = v30;
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v50 identifier]);
        v42 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        v28 = v20;
        unsigned __int8 v43 = [v20 cplExecute:@"INSERT INTO %@ (stableScopeIndex, cloudIdentifier, localIdentifier, mappingState, addTimestamp, addDirection) VALUES (%ld, %@, %@, %i, %ld, %ld)", v40, v15, v41, v42, v49, v22, v48];

        if ((v43 & 1) != 0)
        {
LABEL_32:

          goto LABEL_7;
        }

        v44 = (void *)objc_claimAutoreleasedReturnValue([v28 lastCPLError]);
        v45 = v44;
        if (a7) {
          *a7 = v44;
        }

        v30 = v47;
LABEL_36:

        BOOL v17 = 0;
        goto LABEL_39;
      }
    }

    else if (a7)
    {
      v28 = v20;
      BOOL v17 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue([v20 lastCPLError]);
      goto LABEL_39;
    }

    BOOL v17 = 0;
    v28 = v20;
    goto LABEL_39;
  }

  if (a7)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 scopeIdentifier]);
    *a7 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v16));
  }

  BOOL v17 = 0;
LABEL_40:

  return v17;
}

- (BOOL)setFinalCloudScopedIdentifier:(id)a3 forPendingCloudScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
  int64_t v11 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v10);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a5)
    {
      unsigned __int8 v14 = 0;
      goto LABEL_12;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v12));
    unsigned __int8 v14 = 0;
    goto LABEL_10;
  }

  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v15 pqlConnection]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  unsigned __int8 v14 = [v12 cplExecute:@"UPDATE %@ SET cloudIdentifier = %@, mappingState = %i WHERE stableScopeIndex = %ld AND cloudIdentifier = %@", v16, v17, 1, v11, v18];

  if ((v14 & 1) != 0)
  {
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) objectForKeyedSubscript:v9]);
    if (v19)
    {
      [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) removeObjectForKey:v9];
      -[CPLPrequeliteIDMapping _cacheLocalScopedIdentifier:cloudScopedIdentifier:isFinal:]( self,  "_cacheLocalScopedIdentifier:cloudScopedIdentifier:isFinal:",  v19,  v8,  1LL);
    }

    goto LABEL_11;
  }

  if (a5)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue([v12 lastCPLError]);
LABEL_10:
    *a5 = v13;
  }

- (BOOL)markAllPendingIdentifiersForScopeWithIdentifier:(id)a3 asFinalWithError:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v6));
    }
  }

  else
  {
    int64_t v9 = v7;
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE OR FAIL %@ SET mappingState = %i WHERE stableScopeIndex = %ld AND mappingState = %i", v12, 1, v9, 0];

    if ((v8 & 1) != 0)
    {
      [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) removeAllObjects];
    }

    else if (a4)
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
    }
  }

  return v8;
}

- (BOOL)hasPendingIdentifiers
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"mappingState = %i",  0LL));
  unsigned __int8 v7 = [v4 table:v5 hasRecordsMatchingQuery:v6];

  return v7;
}

- (BOOL)removeMappingForCloudScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  int64_t v8 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a4)
    {
      unsigned __int8 v11 = 0;
      goto LABEL_12;
    }

    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v9));
    unsigned __int8 v11 = 0;
    goto LABEL_10;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned __int8 v11 = [v9 cplExecute:@"DELETE FROM %@ WHERE stableScopeIndex = %ld AND cloudIdentifier = %@", v13, v8, v14];

  if ((v11 & 1) != 0)
  {
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) objectForKeyedSubscript:v6]);
    if (v15)
    {
      [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) removeObjectForKey:v6];
      [*(id *)(&self->super._shouldUpgradeSchema + 1) removeObjectForKey:v15];
      [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) removeObject:v15];
    }

    goto LABEL_11;
  }

  if (a4)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 lastCPLError]);
LABEL_10:
    *a4 = v10;
  }

- (BOOL)addDeleteEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
  int64_t v10 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a5)
    {
      unsigned __int8 v13 = 0;
      goto LABEL_10;
    }

    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v11));
    unsigned __int8 v13 = 0;
  }

  else
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v14 pqlConnection]);

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v16 = (uint64_t)v15;
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned __int8 v13 = [v11 cplExecute:@"UPDATE OR IGNORE %@ SET deleteTimestamp = %ld, deleteDirection = %ld WHERE stableScopeIndex = %ld AND localIdentifier = %@ AND (deleteTimestamp IS NULL OR (deleteTimestamp <= addTimestamp))", v17, v16, a4, v10, v18];

    if (!a5 || (v13 & 1) != 0) {
      goto LABEL_8;
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
  }

  *a5 = v12;
LABEL_8:

LABEL_10:
  return v13;
}

- (BOOL)addAddEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
  int64_t v10 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v11));
    }

    unsigned __int8 v12 = 0;
  }

  else
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v16 = (uint64_t)v15;
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned __int8 v12 = [v14 cplExecute:@"UPDATE OR IGNORE %@ SET addTimestamp = %ld, addDirection = %ld WHERE stableScopeIndex = %ld AND localIdentifier = %@ AND (addTimestamp <= deleteTimestamp)", v17, v16, a4, v10, v18];

    if ((v12 & 1) != 0)
    {
      if ([v14 changes] && !_CPLSilentLogging)
      {
        id v19 = sub_100169EB0();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          double v21 = (void *)objc_claimAutoreleasedReturnValue( +[CPLRecordChange descriptionForDirection:]( &OBJC_CLASS___CPLRecordChange,  "descriptionForDirection:",  a4));
          *(_DWORD *)buf = 138412546;
          id v24 = v8;
          __int16 v25 = 2112;
          BOOL v26 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Updated 'add event' for already existing mapping of %@ (direction %@)",  buf,  0x16u);
        }
      }
    }

    else if (a5)
    {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v14 lastCPLError]);
    }
  }

  return v12;
}

- (BOOL)removeMappingForLocalScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  int64_t v8 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a4)
    {
      unsigned __int8 v11 = 0;
      goto LABEL_12;
    }

    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v9));
    unsigned __int8 v11 = 0;
    goto LABEL_10;
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned __int8 v11 = [v9 cplExecute:@"DELETE FROM %@ WHERE stableScopeIndex = %ld AND localIdentifier = %@", v13, v8, v14];

  if ((v11 & 1) != 0)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) objectForKeyedSubscript:v6]);
    if (v6)
    {
      [*(id *)((char *)&self->_localToCloudScopedIdentifiersCache + 4) removeObjectForKey:v15];
      [*(id *)(&self->super._shouldUpgradeSchema + 1) removeObjectForKey:v6];
      [*(id *)((char *)&self->_cloudToLocalScopedIdentifiersCache + 4) removeObject:v6];
    }

    goto LABEL_11;
  }

  if (a4)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 lastCPLError]);
LABEL_10:
    *a4 = v10;
  }

- (BOOL)resetAllFinalCloudIdentifiersForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage stableScopeIndexForScopeIdentifier:](self, "stableScopeIndexForScopeIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v6));
    }
  }

  else
  {
    int64_t v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE OR FAIL %@ SET mappingState = %i WHERE stableScopeIndex = %ld AND mappingState = %i", v12, 0, v9, 1];

    if ((v8 & 1) != 0)
    {
      -[CPLPrequeliteIDMapping _clearScopedIdentifiersCache](self, "_clearScopedIdentifiersCache");
    }

    else if (a4)
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
    }
  }

  return v8;
}

- (id)status
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"mappingState = %i",  0LL));
  id v6 = [v3 table:v4 countOfRecordsMatchingQuery:v5];

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIDMapping;
    id v7 = -[CPLPrequeliteStorage status](&v13, "status");
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%lu pending)",  v8,  v6));

    return v9;
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIDMapping;
    id v11 = -[CPLPrequeliteStorage status](&v12, "status");
    return (id)objc_claimAutoreleasedReturnValue(v11);
  }

- (id)scopeIndexColumnName
{
  return @"stableScopeIndex";
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v14 = [v12 cplExecute:@"DELETE FROM %@ WHERE stableScopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (v14)
  {
    *a5 = (int64_t)[v12 changes];
    -[CPLPrequeliteIDMapping _clearScopedIdentifiersCache](self, "_clearScopedIdentifiersCache");
  }

  else if (a6)
  {
    *a6 = (id)objc_claimAutoreleasedReturnValue([v12 lastError]);
  }

  return v14;
}

- (void)transactionDidFinish
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLPrequeliteIDMapping;
  -[CPLPrequeliteStorage transactionDidFinish](&v3, "transactionDidFinish");
  -[CPLPrequeliteIDMapping _clearScopedIdentifiersCache](self, "_clearScopedIdentifiersCache");
}

- (void).cxx_destruct
{
}

@end