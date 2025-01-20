@interface CPLPrequeliteCloudCache
- (BOOL)_deleteRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_hasRecordWithScopedIdentifier:(id)a3 isStaged:(BOOL *)a4;
- (BOOL)_insertFinalRecordWithScopedIdentifier:(id)a3 className:(id)a4 relatedIdentifier:(id)a5 secondaryIdentifier:(id)a6 otherScopeIndex:(int64_t)a7 serializedRecord:(id)a8 confirmed:(BOOL)a9 error:(id *)a10;
- (BOOL)_insertStagedRecordWithScopedIdentifier:(id)a3 className:(id)a4 relatedIdentifier:(id)a5 secondaryIdentifier:(id)a6 otherScopeIndex:(int64_t)a7 serializedRecord:(id)a8 error:(id *)a9;
- (BOOL)_updateFinalRecordWithScopedIdentifer:(id)a3 relatedIdentifier:(id)a4 secondaryIdentifier:(id)a5 otherScopeIndex:(int64_t)a6 serializedRecord:(id)a7 confirmed:(BOOL)a8 error:(id *)a9;
- (BOOL)_updateStagedRecordWithScopedIdentifer:(id)a3 relatedIdentifier:(id)a4 secondaryIdentifier:(id)a5 otherScopeIndex:(int64_t)a6 serializedRecord:(id)a7 error:(id *)a8;
- (BOOL)ackownledgeRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)addRecord:(id)a3 isFinal:(BOOL)a4 error:(id *)a5;
- (BOOL)commitStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)confirmAllRecordsWithError:(id *)a3;
- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)discardStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)discardStagedChangesWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)hasAnyRecordWithRelatedScopedIdentifier:(id)a3;
- (BOOL)hasRecordAcknowledgedByClientWithScopedIdentifier:(id)a3;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)popCloudScopedIdentifiersToCheck:(id *)a3 otherScopeIndex:(int64_t)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7;
- (BOOL)remapAllRecordsWithPreviousScopedIdentifier:(id)a3 newScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)updateFinalRecord:(id)a3 confirmed:(BOOL)a4 error:(id *)a5;
- (BOOL)updateStagedRecord:(id)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteCloudCache)initWithAbstractObject:(id)a3;
- (id)_recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5;
- (id)_relatedIdentifierForRecordWithIdentifier:(id)a3;
- (id)additionalStatusForScopeWithIndex:(int64_t)a3 baseRecordCount:(int64_t)a4;
- (id)allRecordsIsFinal:(BOOL)a3;
- (id)recordAcknowledgedByClientWithScopedIdentifier:(id)a3;
- (id)recordWithScopedIdentifier:(id)a3 isConfirmed:(BOOL *)a4 isStaged:(BOOL *)a5;
- (id)recordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 isConfirmed:(BOOL *)a5;
- (id)recordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)recordsOfClass:(Class)a3 isFinal:(BOOL)a4;
- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5;
- (id)recordsWithRelatedScopedIdentifier:(id)a3 isFinal:(BOOL)a4;
- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4;
- (id)status;
- (id)statusDictionary;
- (id)statusPerScopeIndex;
- (int64_t)_otherScopeIndexForRecord:(id)a3;
- (unint64_t)_countOfUnconfirmedRecords;
- (unint64_t)countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (unint64_t)countOfUnacknowledgesRecords;
- (void)_updateOtherScopeIdentifierInRecord:(id)a3 otherScopeIndex:(int64_t)a4;
- (void)transactionDidFinish;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequeliteCloudCache

- (CPLPrequeliteCloudCache)initWithAbstractObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLPrequeliteCloudCache;
  return -[CPLPrequeliteStorage initWithAbstractObject:](&v4, "initWithAbstractObject:", a3);
}

- (BOOL)initializeStorage
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLPrequeliteCloudCache;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v11, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"state INTEGER DEFAULT 0,scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,class TEXT NOT NULL,relatedIdentifier TEXT,secondaryIdentifier TEXT,serializedRecord DATA DEFAULT NULL,stagedRelatedIdentifier TEXT,stagedSecondaryIdentifier TEXT,stagedSerializedRecord DATA DEFAULT NULL,localScopeIndex INTEGER DEFAULT 0,otherScopeIndex INTEGER DEFAULT 0,stagedOtherScopeIndex INTEGER DEFAULT 0,confirmed INTEGER NOT NULL DEFAULT 1",  0LL);
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
            unsigned int v7 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"stagedRelatedScopedIdentifier",  @"stagedRelatedIdentifier, scopeIndex",  0LL,  0LL);
            LOBYTE(v3) = 0;
            if (v7)
            {
              unsigned int v8 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"stagedSecondaryScopedIdentifier",  @"stagedSecondaryIdentifier, scopeIndex",  0LL,  0LL);
              LOBYTE(v3) = 0;
              if (v8)
              {
                unsigned int v9 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedState",  @"state, scopeIndex",  0LL,  0LL);
                LOBYTE(v3) = 0;
                if (v9)
                {
                  BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"confirmed",  0LL);
                  if (v3)
                  {
                    BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"class",  0LL);
                    if (v3)
                    {
                      BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
                      if (v3)
                      {
                        BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"localScopeIndex",  0LL);
                        if (v3)
                        {
                          BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"otherScopeIndex",  0LL);
                          if (v3) {
                            LOBYTE(v3) = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"stagedOtherScopeIndex",  0LL);
                          }
                        }
                      }
                    }
                  }
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
  v67.receiver = self;
  v67.super_class = (Class)&OBJC_CLASS___CPLPrequeliteCloudCache;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v67, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  if (a3 <= 51)
  {
    if (a3 == 20)
    {
      if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
        return v5;
      }
      v22 = @"class";
      return -[CPLPrequeliteStorage createIndexOnColumn:error:](self, "createIndexOnColumn:error:", v22, 0LL);
    }

    if (a3 != 22)
    {
      if (a3 != 39) {
        return v5;
      }
      if (!_CPLSilentLogging)
      {
        id v7 = sub_1001615D8();
        unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          *(_DWORD *)buf = 138412546;
          v70 = v9;
          __int16 v71 = 2048;
          uint64_t v72 = 39LL;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Upgrading %@ to version %llu: adding scopeIndex column",  buf,  0x16u);
        }
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      unsigned __int8 v5 = [v11 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 2", v12];

LABEL_70:
      return v5;
    }

    if (!_CPLSilentLogging)
    {
      id v52 = sub_1001615D8();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        *(_DWORD *)buf = 138412546;
        v70 = v54;
        __int16 v71 = 2048;
        uint64_t v72 = 22LL;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Upgrading %@ to version %llu: adding confirmed column",  buf,  0x16u);
      }
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v55 pqlConnection]);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned int v57 = [v11 cplExecute:@"ALTER TABLE %@ ADD COLUMN confirmed INTEGER DEFAULT 1", v56];

    if (v57)
    {
      v21 = @"confirmed";
      goto LABEL_68;
    }

- (BOOL)_hasRecordWithScopedIdentifier:(id)a3 isStaged:(BOOL *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = 0;
  }

  else
  {
    int64_t v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    *a4 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100161730;
    v16[3] = &unk_100247730;
    v16[4] = a4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v14 = [v11 cplFetchObject:v16, @"SELECT identifier, state FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v12, v13, v9 sql];

    BOOL v8 = v14 != 0LL;
  }

  return v8;
}

- (int64_t)_otherScopeIndexForRecord:(id)a3
{
  id v4 = a3;
  if ([v4 supportsSharingScopedIdentifier]
    && (uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 sharingScopeIdentifier])) != 0)
  {
    id v6 = (void *)v5;
    [v4 setSharingScopeIdentifier:0];
    if (*(void *)(&self->super._shouldUpgradeSchema + 1) && objc_msgSend(v6, "isEqualToString:"))
    {
      int64_t v7 = *(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4);
    }

    else
    {
      objc_storeStrong((id *)(&self->super._shouldUpgradeSchema + 1), v6);
      int64_t v8 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:](self, "cloudScopeIndexForScopeIdentifier:", v6);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v7 = 0LL;
      }
      else {
        int64_t v7 = (NSString *)v8;
      }
      *(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4) = v7;
    }
  }

  else
  {
    int64_t v7 = 0LL;
  }

  return (int64_t)v7;
}

- (void)_updateOtherScopeIdentifierInRecord:(id)a3 otherScopeIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = v6;
  if (a4)
  {
    id v11 = v6;
    unsigned int v8 = [v6 supportsSharingScopedIdentifier];
    int64_t v7 = v11;
    if (v8)
    {
      if (*(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4) != (NSString *)a4)
      {
        *(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4) = (NSString *)a4;
        uint64_t v9 = objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage scopeIdentifierForCloudScopeIndex:]( self,  "scopeIdentifierForCloudScopeIndex:",  a4));
        v10 = *(void **)(&self->super._shouldUpgradeSchema + 1);
        *(void *)(&self->super._shouldUpgradeSchema + 1) = v9;

        int64_t v7 = v11;
      }

      [v7 setSharingScopeIdentifier:*(void *)(&self->super._shouldUpgradeSchema + 1)];
      int64_t v7 = v11;
    }
  }
}

- (BOOL)_updateFinalRecordWithScopedIdentifer:(id)a3 relatedIdentifier:(id)a4 secondaryIdentifier:(id)a5 otherScopeIndex:(int64_t)a6 serializedRecord:(id)a7 confirmed:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  char v14 = (char)a9;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  int64_t v19 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v15);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a9)
    {
      char v14 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v15));
    }
  }

  else
  {
    int64_t v20 = v19;
    id v37 = v17;
    id v21 = v16;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v15 scopeIdentifier]);
    int64_t v23 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v22);

    if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
      sub_10019B058(v15, a2, self);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 pqlConnection]);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v15 identifier]);
    v28 = (void *)v27;
    int64_t v35 = v23;
    id v16 = v21;
    if (v9) {
      unsigned __int8 v29 = [v25 cplExecute:@"UPDATE %@ SET serializedRecord = %@, relatedIdentifier = %@, secondaryIdentifier = %@, otherScopeIndex = %ld, localScopeIndex = %ld WHERE identifier = %@ AND scopeIndex = %ld", v26, v18, v21, v37, a6, v35, v27, v20];
    }
    else {
      unsigned __int8 v29 = [v25 cplExecute:@"UPDATE %@ SET serializedRecord = %@, relatedIdentifier = %@, secondaryIdentifier = %@, otherScopeIndex = %ld, confirmed = 0, localScopeIndex = %ld WHERE identifier = %@ AND scopeIndex = %ld", v26, v18, v21, v37, a6, v35, v27, v20];
    }
    unsigned __int8 v30 = v29;

    if ((v30 & 1) != 0)
    {
      char v14 = 1;
      id v17 = v37;
    }

    else
    {
      id v17 = v37;
      if (!_CPLSilentLogging)
      {
        id v31 = sub_1001615D8();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v25 lastCPLError]);
          *(_DWORD *)buf = 138412546;
          id v40 = v15;
          __int16 v41 = 2112;
          uint64_t v42 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Unable to update final record with identifier %@: %@",  buf,  0x16u);
        }
      }

      char v14 = 0;
      if (a9) {
        *a9 = (id)objc_claimAutoreleasedReturnValue([v25 lastCPLError]);
      }
    }
  }

  return v14;
}

- (BOOL)_updateStagedRecordWithScopedIdentifer:(id)a3 relatedIdentifier:(id)a4 secondaryIdentifier:(id)a5 otherScopeIndex:(int64_t)a6 serializedRecord:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  int64_t v18 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v14);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v19 = 0;
    if (a8) {
      *a8 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v14));
    }
  }

  else
  {
    int64_t v20 = v18;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 pqlConnection]);

    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    unsigned __int8 v19 = [v22 cplExecute:@"UPDATE %@ SET stagedSerializedRecord = %@, stagedRelatedIdentifier = %@, stagedSecondaryIdentifier = %@, stagedOtherScopeIndex = %ld, state = %d WHERE identifier = %@ AND scopeIndex = %ld", v23, v17, v15, v16, a6, 0, v24, v20];

    if ((v19 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v25 = sub_1001615D8();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v22 lastCPLError]);
          *(_DWORD *)buf = 138412546;
          id v30 = v14;
          __int16 v31 = 2112;
          v32 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Unable to update staged record with identifier %@: %@",  buf,  0x16u);
        }
      }

      if (a8) {
        *a8 = (id)objc_claimAutoreleasedReturnValue([v22 lastCPLError]);
      }
    }
  }

  return v19;
}

- (BOOL)_insertFinalRecordWithScopedIdentifier:(id)a3 className:(id)a4 relatedIdentifier:(id)a5 secondaryIdentifier:(id)a6 otherScopeIndex:(int64_t)a7 serializedRecord:(id)a8 confirmed:(BOOL)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  int64_t v21 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v16);
  if (v21 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v22 = 0;
    if (a10) {
      *a10 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v16));
    }
  }

  else
  {
    int64_t v23 = v21;
    id v37 = v19;
    id v38 = v18;
    id v24 = v17;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v16 scopeIdentifier]);
    int64_t v26 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v25);

    if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
      sub_10019B154(v16, a2, self);
    }
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 pqlConnection]);

    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
    int64_t v35 = v26;
    id v17 = v24;
    unsigned __int8 v22 = [v28 cplExecute:@"INSERT INTO %@ (scopeIndex, identifier, class, relatedIdentifier, secondaryIdentifier, serializedRecord, state, confirmed, otherScopeIndex, localScopeIndex) VALUES (%ld, %@, %@, %@, %@, %@, %d, %d, %ld, %ld)", v29, v23, v30, v24, v38, v37, v20, 1, a9, a7, v35];

    if ((v22 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v31 = sub_1001615D8();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue([v28 lastCPLError]);
          *(_DWORD *)buf = 138412546;
          id v40 = v16;
          __int16 v41 = 2112;
          uint64_t v42 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Unable to insert final record with identifier %@: %@",  buf,  0x16u);
        }
      }

      if (a10) {
        *a10 = (id)objc_claimAutoreleasedReturnValue([v28 lastCPLError]);
      }
    }

    id v19 = v37;
    id v18 = v38;
  }

  return v22;
}

- (BOOL)_insertStagedRecordWithScopedIdentifier:(id)a3 className:(id)a4 relatedIdentifier:(id)a5 secondaryIdentifier:(id)a6 otherScopeIndex:(int64_t)a7 serializedRecord:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  int64_t v20 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v15);
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v21 = 0;
    if (a9) {
      *a9 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v15));
    }
  }

  else
  {
    int64_t v22 = v20;
    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 pqlConnection]);

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    int64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
    unsigned __int8 v21 = [v24 cplExecute:@"INSERT INTO %@ (scopeIndex, identifier, class, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedSerializedRecord, stagedOtherScopeIndex, confirmed) VALUES (%ld, %@, %@, %@, %@, %@, %ld, 1)", v25, v22, v26, v16, v17, v18, v19, a7];

    if ((v21 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v27 = sub_1001615D8();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue([v24 lastCPLError]);
          *(_DWORD *)buf = 138412546;
          id v32 = v15;
          __int16 v33 = 2112;
          v34 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Unable to insert staged record with identifier %@: %@",  buf,  0x16u);
        }
      }

      if (a9) {
        *a9 = (id)objc_claimAutoreleasedReturnValue([v24 lastCPLError]);
      }
    }
  }

  return v21;
}

- (BOOL)_deleteRecordWithScopedIdentifier:(id)a3 error:(id *)a4
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v12, v13, v9];

    if ((v8 & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        id v14 = sub_1001615D8();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
          *(_DWORD *)buf = 138412546;
          id v19 = v6;
          __int16 v20 = 2112;
          unsigned __int8 v21 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unable to delete final record with identifier %@: %@",  buf,  0x16u);
        }
      }

      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
      }
    }
  }

  return v8;
}

- (BOOL)addRecord:(id)a3 isFinal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 relatedIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 secondaryIdentifier]);
  id v12 = [v8 copy];
  [v12 clearIdentifiers];
  [v12 prepareForStorage];
  int64_t v13 = -[CPLPrequeliteCloudCache _otherScopeIndexForRecord:](self, "_otherScopeIndexForRecord:", v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLArchiver archivedDataWithRootObject:]( &OBJC_CLASS___CPLArchiver,  "archivedDataWithRootObject:",  v12));
  if (v14)
  {
    if (-[CPLPrequeliteCloudCache _hasRecordWithScopedIdentifier:isStaged:]( self,  "_hasRecordWithScopedIdentifier:isStaged:",  v9,  buf))
    {
      if (v6) {
        unsigned __int8 v15 = -[CPLPrequeliteCloudCache _updateFinalRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:confirmed:error:]( self,  "_updateFinalRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRe cord:confirmed:error:",  v9,  v10,  v11,  v13,  v14,  0LL,  a5);
      }
      else {
        unsigned __int8 v15 = -[CPLPrequeliteCloudCache _updateStagedRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:error:]( self,  "_updateStagedRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:error:",  v9,  v10,  v11,  v13,  v14,  a5);
      }
      BOOL v19 = v15;
    }

    else
    {
      v28 = v10;
      __int16 v20 = (objc_class *)objc_opt_class(v8);
      unsigned __int8 v21 = NSStringFromClass(v20);
      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (v6)
      {
        if ([v8 supportsResources])
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 resources]);
          BOOL v23 = [v27 count] == 0;
        }

        else
        {
          BOOL v23 = 1;
        }

        LOBYTE(v26) = v23;
        unsigned __int8 v24 = -[CPLPrequeliteCloudCache _insertFinalRecordWithScopedIdentifier:className:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:confirmed:error:]( self,  "_insertFinalRecordWithScopedIdentifier:className:relatedIdentifier:secondaryIdentifier:otherScopeIndex:s erializedRecord:confirmed:error:",  v9,  v22,  v28,  v11,  v13,  v14,  v26,  a5);
      }

      else
      {
        unsigned __int8 v24 = -[CPLPrequeliteCloudCache _insertStagedRecordWithScopedIdentifier:className:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:error:]( self,  "_insertStagedRecordWithScopedIdentifier:className:relatedIdentifier:secondaryIdentifier:otherScopeIndex: serializedRecord:error:",  v9,  v22,  v28,  v11,  v13,  v14,  a5);
      }

      BOOL v19 = v24;

      v10 = v28;
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v16 = v10;
      id v17 = sub_1001615D8();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
      }

      v10 = v16;
    }

    BOOL v19 = 0;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidClientCacheErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "invalidClientCacheErrorWithReason:",  0LL));
    }
  }

  return v19;
}

- (BOOL)updateFinalRecord:(id)a3 confirmed:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 relatedIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 secondaryIdentifier]);
  id v12 = [v8 copy];
  [v12 clearIdentifiers];
  [v12 prepareForStorage];
  int64_t v13 = -[CPLPrequeliteCloudCache _otherScopeIndexForRecord:](self, "_otherScopeIndexForRecord:", v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLArchiver archivedDataWithRootObject:]( &OBJC_CLASS___CPLArchiver,  "archivedDataWithRootObject:",  v12));
  if (v14)
  {
    BOOL v15 = -[CPLPrequeliteCloudCache _updateFinalRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:confirmed:error:]( self,  "_updateFinalRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord :confirmed:error:",  v9,  v10,  v11,  v13,  v14,  v6,  a5);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v16 = sub_1001615D8();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
      }
    }

    BOOL v15 = 0;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidClientCacheErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "invalidClientCacheErrorWithReason:",  0LL));
    }
  }

  return v15;
}

- (BOOL)updateStagedRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopedIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedIdentifier]);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 secondaryIdentifier]);
  id v10 = [v6 copy];
  [v10 clearIdentifiers];
  [v10 prepareForStorage];
  int64_t v11 = -[CPLPrequeliteCloudCache _otherScopeIndexForRecord:](self, "_otherScopeIndexForRecord:", v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLArchiver archivedDataWithRootObject:]( &OBJC_CLASS___CPLArchiver,  "archivedDataWithRootObject:",  v10));
  if (v12)
  {
    BOOL v13 = -[CPLPrequeliteCloudCache _updateStagedRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:error:]( self,  "_updateStagedRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:error:",  v7,  v8,  v9,  v11,  v12,  a4);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_1001615D8();
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412290;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't serialize %@", (uint8_t *)&v17, 0xCu);
      }
    }

    BOOL v13 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidClientCacheErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "invalidClientCacheErrorWithReason:",  0LL));
    }
  }

  return v13;
}

- (BOOL)deleteRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned int v9 = -[CPLPrequeliteCloudCache _hasRecordWithScopedIdentifier:isStaged:]( self,  "_hasRecordWithScopedIdentifier:isStaged:",  v8,  &v13);
  if (v6)
  {
    if (v9)
    {
      if (v13) {
        unsigned __int8 v10 = -[CPLPrequeliteCloudCache _updateFinalRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:confirmed:error:]( self,  "_updateFinalRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRe cord:confirmed:error:",  v8,  0LL,  0LL,  0LL,  0LL,  1LL,  a5);
      }
      else {
        unsigned __int8 v10 = -[CPLPrequeliteCloudCache _deleteRecordWithScopedIdentifier:error:]( self,  "_deleteRecordWithScopedIdentifier:error:",  v8,  a5);
      }
      goto LABEL_9;
    }
  }

  else if (v9)
  {
    unsigned __int8 v10 = -[CPLPrequeliteCloudCache _updateStagedRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:error:]( self,  "_updateStagedRecordWithScopedIdentifer:relatedIdentifier:secondaryIdentifier:otherScopeIndex:serializedRecord:error:",  v8,  0LL,  0LL,  0LL,  0LL,  a5);
LABEL_9:
    BOOL v11 = v10;
    goto LABEL_10;
  }

  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (id)recordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4 isConfirmed:(BOOL *)a5
{
  id v8 = a3;
  int64_t v9 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0LL;
  }

  else
  {
    int64_t v11 = v9;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    char v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100162CA8;
    v18[3] = &unk_100247758;
    BOOL v22 = a4;
    id v19 = v8;
    id v20 = self;
    unsigned __int8 v21 = a5;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
    id v10 = [v13 cplFetchObject:v18, @"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex, confirmed FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v14, v15, v11 sql];

    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    if (v10 == v16)
    {

      id v10 = 0LL;
    }
  }

  return v10;
}

- (id)recordWithScopedIdentifier:(id)a3 isConfirmed:(BOOL *)a4 isStaged:(BOOL *)a5
{
  id v8 = a3;
  int64_t v9 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0LL;
  }

  else
  {
    int64_t v11 = v9;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    char v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pqlConnection]);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100162F90;
    v18[3] = &unk_100247780;
    unsigned __int8 v21 = a5;
    BOOL v22 = a4;
    id v19 = v8;
    id v20 = self;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
    id v10 = [v13 cplFetchObject:v18, @"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex, confirmed FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v14, v15, v11 sql];

    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    if (v10 == v16)
    {

      id v10 = 0LL;
    }
  }

  return v10;
}

- (id)_recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5
{
  id v8 = a3;
  int64_t v9 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v8);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    char v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v27 = v14;
    id v18 = [v14 cplFetch:@"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex FROM %@ WHERE (relatedIdentifier = %@ AND scopeIndex = %ld) OR (stagedRelatedIdentifier = %@ AND scopeIndex = %ld)", v15, v16, v11, v17, v11];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1001633B4;
    v29[3] = &unk_1002477A8;
    BOOL v35 = a5;
    Class v33 = a4;
    id v19 = v12;
    id v30 = v19;
    id v20 = v28;
    int64_t v34 = v11;
    id v31 = v20;
    id v32 = self;
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 enumerateObjects:v29]);
    if (v21)
    {
      BOOL v22 = (os_log_s *)v21;
      id v10 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v21);
      BOOL v23 = v27;
    }

    else
    {
      if (_CPLSilentLogging)
      {
        id v10 = 0LL;
        BOOL v23 = v27;
        goto LABEL_10;
      }

      id v24 = sub_1001615D8();
      BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      BOOL v23 = v27;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v27 lastCPLError]);
        *(_DWORD *)buf = 138412546;
        id v37 = v8;
        __int16 v38 = 2112;
        v39 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Unable to create enumerator for records with related identifier %@: %@",  buf,  0x16u);
      }

      id v10 = 0LL;
    }

LABEL_10:
    goto LABEL_11;
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  return -[CPLPrequeliteCloudCache _recordsWithRelatedScopedIdentifier:class:isFinal:]( self,  "_recordsWithRelatedScopedIdentifier:class:isFinal:",  a3,  0LL,  a4);
}

- (id)recordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4 isFinal:(BOOL)a5
{
  return -[CPLPrequeliteCloudCache _recordsWithRelatedScopedIdentifier:class:isFinal:]( self,  "_recordsWithRelatedScopedIdentifier:class:isFinal:",  a3,  a4,  a5);
}

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3 isFinal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

    if (v4)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v16 = [v12 cplFetchObjectOfClass:v13, @"SELECT relatedIdentifier FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v14, v15, v9 sql];
    }

    else
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v16 = [v12 cplFetchObject:&stru_1002477E8, @"SELECT relatedIdentifier, stagedRelatedIdentifier FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v17, v18, v9 sql];

      id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      if (v16 == v19)
      {
        id v8 = 0LL;
        goto LABEL_10;
      }
    }

    if (!v16)
    {
      id v8 = 0LL;
LABEL_11:

      goto LABEL_12;
    }

    id v8 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:scopeIndex:",  v10,  v16,  v9);
LABEL_10:

    goto LABEL_11;
  }

  id v8 = 0LL;
LABEL_12:

  return v8;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
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
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"identifier = %@ AND scopeIndex = %ld",  v10,  v7));
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }

  return v6;
}

- (BOOL)hasAnyRecordWithRelatedScopedIdentifier:(id)a3
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
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"relatedIdentifier = %@ AND scopeIndex = %ld",  v10,  v7));
    if ([v8 table:v9 hasRecordsMatchingQuery:v11])
    {
      unsigned __int8 v6 = 1;
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"secondaryIdentifier = %@ AND scopeIndex = %ld",  v12,  v7));
      unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v13];
    }
  }

  return v6;
}

- (id)recordAcknowledgedByClientWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  int64_t v6 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0LL;
LABEL_7:

    return v7;
  }

  int64_t v8 = v6;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 scopeIdentifier]);
  int64_t v10 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v9);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100163B48;
    v19[3] = &unk_100247810;
    int64_t v22 = v10;
    id v20 = v5;
    uint64_t v21 = self;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
    id v7 = [v12 cplFetchObject:v19, @"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, localScopeIndex FROM %@ WHERE (identifier = %@ AND scopeIndex = %ld)", v13, v14, v8 sql];

    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    if (v7 == v15)
    {

      id v7 = 0LL;
    }

    goto LABEL_7;
  }

  uint64_t v17 = sub_10019B250(v5, a2, self);
  return sub_100163B48(v17, v18);
}

- (BOOL)hasRecordAcknowledgedByClientWithScopedIdentifier:(id)a3
{
  id v5 = a3;
  int64_t v6 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = 0;
LABEL_8:

    return v7;
  }

  int64_t v8 = v6;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 scopeIdentifier]);
  id v10 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v9);

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    id v15 = [v12 cplFetchObjectOfClass:v13, @"SELECT localScopeIndex FROM cloudCache WHERE identifier = %@ AND scopeIndex = %ld", v14, v8 sql];

    if (v15) {
      BOOL v7 = [v15 integerValue] == v10;
    }
    else {
      BOOL v7 = 0;
    }

    goto LABEL_8;
  }

  uint64_t v17 = (CPLPrequeliteCloudCache *)sub_10019B34C(v5, a2, self);
  return -[CPLPrequeliteCloudCache recordsAcknowledgedByClientWithRelatedScopedIdentifier:class:]( v17,  v18,  v19,  v20);
}

- (id)recordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v7 = a3;
  int64_t v8 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v7);
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v11 = v8;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
    int64_t v13 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v12);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      sub_10019B448(v7, a2, self);
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
      a2 = (SEL)objc_claimAutoreleasedReturnValue([v7 identifier]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v15 pqlConnection]);

      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      uint64_t v9 = (uint64_t)[v12 cplFetch:@"SELECT identifier, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, localScopeIndex FROM %@ WHERE (relatedIdentifier = %@ AND scopeIndex = %ld)", v16, a2, v11];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100163FDC;
      v22[3] = &unk_100247838;
      int64_t v25 = v13;
      Class v26 = a4;
      a4 = v14;
      int64_t v27 = v11;
      Class v23 = a4;
      id v24 = self;
      uint64_t v17 = objc_claimAutoreleasedReturnValue([(id)v9 enumerateObjects:v22]);
      if (v17)
      {
        SEL v18 = (void *)v17;
        id v10 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v17);
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }

      if (!_CPLSilentLogging)
      {
        id v19 = sub_1001615D8();
        SEL v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
        {
          Class v20 = (void *)objc_claimAutoreleasedReturnValue([v12 lastCPLError]);
          *(_DWORD *)buf = 138412546;
          id v29 = v7;
          __int16 v30 = 2112;
          id v31 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "Unable to create enumerator for records with related identifier %@: %@",  buf,  0x16u);
        }

        id v10 = 0LL;
        goto LABEL_10;
      }
    }

    id v10 = 0LL;
    goto LABEL_11;
  }

  id v10 = 0LL;
LABEL_12:

  return v10;
}

- (unint64_t)countOfRecordsAcknowledgedByClientWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v7 = a3;
  int64_t v8 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0LL;
LABEL_5:

    return (unint64_t)v9;
  }

  int64_t v10 = v8;
  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
  int64_t v12 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v11);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v16 = NSStringFromClass(a4);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    SEL v18 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"(relatedIdentifier = %@ AND scopeIndex = %ld) AND (localScopeIndex = %ld AND class = %@)",  v13,  v10,  v12,  v17));
    id v9 = [v14 table:v15 countOfRecordsMatchingQuery:v18];

    goto LABEL_5;
  }

  Class v20 = (CPLPrequeliteCloudCache *)sub_10019B544(v7, a2, self);
  return -[CPLPrequeliteCloudCache ackownledgeRecordWithScopedIdentifier:error:](v20, v21, v22, v23);
}

- (BOOL)ackownledgeRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int64_t v6 = -[CPLPrequeliteStorage scopeIndexForCloudScopedIdentifier:](self, "scopeIndexForCloudScopedIdentifier:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v7 = 1;
  }

  else
  {
    int64_t v8 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 scopeIdentifier]);
    int64_t v10 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v9);

    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    unsigned __int8 v7 = [v12 cplExecute:@"UPDATE %@ SET localScopeIndex = %ld WHERE identifier = %@ AND scopeIndex = %ld", v13, v10, v14, v8];
  }

  return v7;
}

- (BOOL)confirmAllRecordsWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v8 = [v6 cplExecute:@"UPDATE OR FAIL %@ SET confirmed = 1 WHERE confirmed = 0", v7];

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1001615D8();
      int64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
        *(_DWORD *)buf = 138412290;
        id v14 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Unable to mark all records as confirmed: %@",  buf,  0xCu);
      }
    }

    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
    }
  }

  return v8;
}

- (BOOL)commitStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:](self, "cloudScopeIndexForScopeIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v6));
    }
  }

  else
  {
    int64_t v9 = v7;
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned int v13 = [v11 cplExecute:@"DELETE FROM %@ WHERE stagedSerializedRecord IS NULL AND state = %i AND scopeIndex = %ld", v12, 0, v9];

    if (!v13
      || (id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable")),
          BOOL v8 = 1,
          unsigned __int8 v15 = [v11 cplExecute:@"UPDATE OR FAIL %@ SET serializedRecord = stagedSerializedRecord, relatedIdentifier = stagedRelatedIdentifier, secondaryIdentifier = stagedSecondaryIdentifier, otherScopeIndex = stagedOtherScopeIndex, stagedSerializedRecord = NULL, stagedRelatedIdentifier = NULL, stagedSecondaryIdentifier = NULL, stagedOtherScopeIndex = 0, state = %d, confirmed = 1 WHERE state = %d AND scopeIndex = %ld", v14, 1, 0, v9],  v14,  (v15 & 1) == 0))
    {
      if (!_CPLSilentLogging)
      {
        id v16 = sub_1001615D8();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          SEL v18 = (void *)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
          *(_DWORD *)buf = 138412290;
          SEL v21 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to commit changes: %@", buf, 0xCu);
        }
      }

      BOOL v8 = 0;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
      }
    }
  }

  return v8;
}

- (BOOL)discardStagedChangesForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage cloudScopeIndexForScopeIdentifier:](self, "cloudScopeIndexForScopeIdentifier:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v6));
    }
  }

  else
  {
    int64_t v9 = v7;
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned int v13 = [v11 cplExecute:@"DELETE FROM %@ WHERE serializedRecord IS NULL AND state = %d AND scopeIndex = %ld", v12, 0, v9];

    if (!v13
      || (id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable")),
          BOOL v8 = 1,
          unsigned __int8 v15 = [v11 cplExecute:@"UPDATE OR FAIL %@ SET stagedSerializedRecord = NULL, stagedRelatedIdentifier = NULL, stagedSecondaryIdentifier = NULL, stagedOtherScopeIndex = 0, state = %d WHERE state = %d AND scopeIndex = %ld", v14, 1, 0, v9],  v14,  (v15 & 1) == 0))
    {
      if (!_CPLSilentLogging)
      {
        id v16 = sub_1001615D8();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          SEL v18 = (void *)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
          *(_DWORD *)buf = 138412290;
          SEL v21 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to discard changes: %@", buf, 0xCu);
        }
      }

      BOOL v8 = 0;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue([v11 lastCPLError]);
      }
    }
  }

  return v8;
}

- (BOOL)discardStagedChangesWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudIndexesInjection]);
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v11 = [v8 cplExecute:@"DELETE FROM %@ WHERE serializedRecord IS NULL AND state = %d AND %@", v10, 0, v9];

  if (!v11
    || (int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable")),
        BOOL v13 = 1,
        unsigned __int8 v14 = [v8 cplExecute:@"UPDATE OR FAIL %@ SET stagedSerializedRecord = NULL, stagedRelatedIdentifier = NULL, stagedSecondaryIdentifier = NULL, stagedOtherScopeIndex = 0, state = %d WHERE state = %d AND %@", v12, 1, 0, v9],  v12,  (v14 & 1) == 0))
  {
    if (!_CPLSilentLogging)
    {
      id v15 = sub_1001615D8();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 lastCPLError]);
        *(_DWORD *)buf = 138412290;
        Class v20 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unable to discard staged changes: %@",  buf,  0xCu);
      }
    }

    BOOL v13 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v8 lastCPLError]);
    }
  }

  return v13;
}

- (BOOL)remapAllRecordsWithPreviousScopedIdentifier:(id)a3 newScopedIdentifier:(id)a4 error:(id *)a5
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
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned int v18 = [v14 cplExecute:@"UPDATE %@ SET identifier = %@ WHERE identifier = %@ AND scopeIndex = %ld", v15, v16, v17, v12];

    if (!v18) {
      goto LABEL_9;
    }
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    Class v20 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    SEL v21 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned int v22 = [v14 cplExecute:@"UPDATE OR FAIL %@ SET relatedIdentifier = %@ WHERE relatedIdentifier = %@ AND scopeIndex = %ld", v19, v20, v21, v12];

    if (!v22) {
      goto LABEL_9;
    }
    Class v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    int64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned int v26 = [v14 cplExecute:@"UPDATE OR FAIL %@ SET secondaryIdentifier = %@ WHERE secondaryIdentifier = %@ AND scopeIndex = %ld", v23, v24, v25, v12];

    if (!v26) {
      goto LABEL_9;
    }
    int64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    unsigned int v30 = [v14 cplExecute:@"UPDATE OR FAIL %@ SET stagedRelatedIdentifier = %@ WHERE stagedRelatedIdentifier = %@ AND scopeIndex = %ld", v27, v28, v29, v12];

    if (v30)
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      Class v33 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      unsigned __int8 v11 = [v14 cplExecute:@"UPDATE OR FAIL %@ SET stagedSecondaryIdentifier = %@ WHERE stagedSecondaryIdentifier = %@ AND scopeIndex = %ld", v31, v32, v33, v12];
    }

    else
    {
LABEL_9:
      unsigned __int8 v11 = 0;
    }

    if (a5 && (v11 & 1) == 0) {
      *a5 = (id)objc_claimAutoreleasedReturnValue([v14 lastCPLError]);
    }
  }

  return v11;
}

- (id)recordsOfClass:(Class)a3 isFinal:(BOOL)a4
{
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  int64_t v10 = NSStringFromClass(a3);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v8 cplFetch:@"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex, scopeIndex FROM %@ WHERE class = %@", v9, v11];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100164EDC;
  v19[3] = &unk_100247860;
  BOOL v20 = a4;
  void v19[4] = self;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 enumerateObjects:v19]);
  if (v13)
  {
    unsigned __int8 v14 = (os_log_s *)v13;
    id v15 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v13);
  }

  else
  {
    if (_CPLSilentLogging)
    {
      id v15 = 0LL;
      goto LABEL_8;
    }

    id v16 = sub_1001615D8();
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 lastCPLError]);
      *(_DWORD *)buf = 138412546;
      Class v22 = a3;
      __int16 v23 = 2112;
      id v24 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Unable to create enumerator for records with class %@: %@",  buf,  0x16u);
    }

    id v15 = 0LL;
  }

LABEL_8:
  return v15;
}

- (id)allRecordsIsFinal:(BOOL)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v8 = [v6 cplFetch:@"SELECT identifier, state, stagedSerializedRecord, serializedRecord, relatedIdentifier, secondaryIdentifier, otherScopeIndex, stagedRelatedIdentifier, stagedSecondaryIdentifier, stagedOtherScopeIndex, scopeIndex FROM %@", v7];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100165214;
  v15[3] = &unk_100247860;
  BOOL v16 = a3;
  v15[4] = self;
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 enumerateObjects:v15]);
  if (v9)
  {
    int64_t v10 = (os_log_s *)v9;
    unsigned __int8 v11 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v9);
  }

  else
  {
    if (_CPLSilentLogging)
    {
      unsigned __int8 v11 = 0LL;
      goto LABEL_8;
    }

    id v12 = sub_1001615D8();
    int64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
      *(_DWORD *)buf = 138412290;
      unsigned int v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Unable to create enumerator for records: %@",  buf,  0xCu);
    }

    unsigned __int8 v11 = 0LL;
  }

LABEL_8:
  return v11;
}

- (void)writeTransactionDidSucceed
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CPLPrequeliteCloudCache;
  -[CPLPrequeliteStorage writeTransactionDidSucceed](&v2, "writeTransactionDidSucceed");
}

- (void)writeTransactionDidFail
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CPLPrequeliteCloudCache;
  -[CPLPrequeliteStorage writeTransactionDidFail](&v2, "writeTransactionDidFail");
}

- (void)transactionDidFinish
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLPrequeliteCloudCache;
  -[CPLPrequeliteStorage transactionDidFinish](&v4, "transactionDidFinish");
  *(NSString **)((char *)&self->_perTransactionOtherScopeIdentifier + 4) = 0LL;
  BOOL v3 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  *(void *)(&self->super._shouldUpgradeSchema + 1) = 0LL;
}

- (unint64_t)_countOfUnconfirmedRecords
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"confirmed = 0"));
  id v6 = [v3 table:v4 countOfRecordsMatchingQuery:v5];

  return (unint64_t)v6;
}

- (unint64_t)countOfUnacknowledgesRecords
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0LL;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteCloudCache abstractObject](self, "abstractObject"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 engineStore]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopes]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10016561C;
  v11[3] = &unk_100247888;
  id v8 = v5;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v6 table:v7 enumerateCountGroupedByProperty:@"localScopeIndex" block:v11];

  unint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)status
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_100165828;
  uint64_t v17 = sub_100165838;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLPrequeliteCloudCache;
  id v3 = -[CPLPrequeliteStorage status](&v12, "status");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v18 = [v4 mutableCopy];

  unint64_t v5 = -[CPLPrequeliteCloudCache countOfUnacknowledgesRecords](self, "countOfUnacknowledgesRecords");
  if (v5) {
    objc_msgSend((id)v14[5], "appendFormat:", @" (%lu not matched with client)", v5);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100165840;
  v11[3] = &unk_1002478B0;
  void v11[4] = &v13;
  [v6 table:v7 enumerateCountGroupedByProperty:@"class" block:v11];

  unint64_t v8 = -[CPLPrequeliteCloudCache _countOfUnconfirmedRecords](self, "_countOfUnconfirmedRecords");
  if (v8) {
    objc_msgSend((id)v14[5], "appendFormat:", @"\n%lu unconfirmed!", v8);
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)statusDictionary
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001659D4;
  v11[3] = &unk_1002478D8;
  id v6 = v3;
  objc_super v12 = v6;
  [v4 table:v5 enumerateCountGroupedByProperty:@"class" block:v11];

  if (-[CPLPrequeliteCloudCache countOfUnacknowledgesRecords](self, "countOfUnacknowledgesRecords"))
  {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, @"unacknowledged");
  }

  unint64_t v8 = -[CPLPrequeliteCloudCache _countOfUnconfirmedRecords](self, "_countOfUnconfirmedRecords");
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, @"unconfirmed");
  }

  return v6;
}

- (id)additionalStatusForScopeWithIndex:(int64_t)a3 baseRecordCount:(int64_t)a4
{
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteCloudCache abstractObject](self, "abstractObject"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 engineStore]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopes]);
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeWithCloudScopeIndex:a3]);

  if (!v10) {
    goto LABEL_7;
  }
  id v11 = [v10 localIndex];
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"localScopeIndex = %ld",  v11));
  uint64_t v15 = (char *)[v12 table:v13 countOfRecordsMatchingQuery:v14];

  if ((unint64_t)v15 >= a4)
  {
    if ((unint64_t)v15 > a4)
    {
      uint64_t v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%lu extra records matched with client!",  &v15[-a4]);
      goto LABEL_6;
    }

- (id)statusPerScopeIndex
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CPLPrequeliteCloudCache;
  id v2 = -[CPLPrequeliteStorage statusPerScopeIndexWithGroupProperty:valueDescription:]( &v4,  "statusPerScopeIndexWithGroupProperty:valueDescription:",  @"class",  &stru_100247918);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)_relatedIdentifierForRecordWithIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v8 = [v6 cplFetchObject:&stru_100247938, @"SELECT relatedIdentifier, stagedRelatedIdentifier FROM %@ WHERE identifier = %@", v7, v4 sql];

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  if (v8 == v9)
  {

    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

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

- (BOOL)popCloudScopedIdentifiersToCheck:(id *)a3 otherScopeIndex:(int64_t)a4 maxCount:(int64_t)a5 deletedCount:(int64_t *)a6 error:(id *)a7
{
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

  objc_super v12 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a5);
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  v39 = self;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v15 = [v11 cplFetch:@"SELECT rowid, scopeIndex, identifier, relatedIdentifier, stagedRelatedIdentifier FROM %@ WHERE otherScopeIndex = %ld OR stagedOtherScopeIndex = %ld LIMIT %lu", v14, a4, a4, a5];

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
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteCloudCache abstractObject](v39, "abstractObject"));
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 engineStore]);
        SEL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 scopes]);

        Class v22 = (void *)objc_claimAutoreleasedReturnValue([v21 scopeIdentifierForCloudScopeIndex:v18]);
        if (v22)
        {
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v21 scopeWithIdentifier:v22]);
          if (!v23 || [v21 valueForFlag:16 forScope:v23])
          {

            Class v22 = 0LL;
          }
        }

        uint64_t v17 = v22;
        id v16 = v18;
      }

      if (v17)
      {
        id v24 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
        int64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v15 stringAtIndex:2]);
        unsigned int v26 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( v24,  "initWithScopeIdentifier:identifier:scopeIndex:",  v17,  v25,  v18);

        -[NSMutableArray addObject:](v12, "addObject:", v26);
        int64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v15 stringAtIndex:3]);
        if (v27)
        {
          v28 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:scopeIndex:",  v17,  v27,  v18);

          -[NSMutableArray addObject:](v12, "addObject:", v28);
          unsigned int v26 = v28;
        }

        id v29 = (void *)objc_claimAutoreleasedReturnValue([v15 stringAtIndex:4]);
        unsigned int v30 = v29;
        if (v29 && (!v27 || ([v29 isEqual:v27] & 1) == 0))
        {
          id v31 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:scopeIndex:",  v17,  v30,  v18);

          -[NSMutableArray addObject:](v12, "addObject:", v31);
          unsigned int v26 = v31;
        }
      }
    }

    while (([v15 next] & 1) != 0);
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  uint64_t v51 = 0LL;
  id v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  char v54 = 1;
  uint64_t v45 = 0LL;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  uint64_t v48 = sub_100165828;
  v49 = sub_100165838;
  id v50 = 0LL;
  if (-[NSMutableIndexSet count](v13, "count"))
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](v39, "mainTable"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100166224;
    v40[3] = &unk_100247250;
    v43 = &v51;
    id v41 = v11;
    id v33 = v32;
    id v42 = v33;
    v44 = &v45;
    -[NSMutableIndexSet enumerateIndexesUsingBlock:](v13, "enumerateIndexesUsingBlock:", v40);
  }

  if (*((_BYTE *)v52 + 24))
  {
    *a3 = -[NSMutableArray copy](v12, "copy");
    *a6 = (int64_t)-[NSMutableIndexSet count](v13, "count");
  }

  else if (a7)
  {
    *a7 = (id) v46[5];
  }

  char v34 = *((_BYTE *)v52 + 24);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v34;
}

- (void).cxx_destruct
{
}

@end