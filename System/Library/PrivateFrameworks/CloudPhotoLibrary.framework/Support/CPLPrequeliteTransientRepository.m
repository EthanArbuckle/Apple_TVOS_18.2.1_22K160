@interface CPLPrequeliteTransientRepository
- (BOOL)_appendChange:(id)a3 alreadyMingled:(BOOL)a4 error:(id *)a5;
- (BOOL)_markChangesWithScopedIdentifiersAsMingled:(id)a3 error:(id *)a4;
- (BOOL)appendBatch:(id)a3 alreadyMingled:(BOOL)a4 error:(id *)a5;
- (BOOL)deleteAllRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteMingledRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasMingledRecordsForScopeWithIdentifier:(id)a3;
- (BOOL)hasOnlyMingledRecordsWithScopeIdentifier:(id)a3;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)hasStashedChangesForScopeWithIdentifier:(id)a3;
- (BOOL)hasStashedRecordWithScopedIdentifier:(id)a3;
- (BOOL)hasUnmingledChanges;
- (BOOL)hasUnmingledChangesForScope:(id)a3;
- (BOOL)hasUnmingledNonStashedRecordsForScopeWithIdentifier:(id)a3;
- (BOOL)hasUnmingledOrStashedRecordsWithScopeFilter:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)markUnmingledChangeWithScopedIdentifierAsMingled:(id)a3 error:(id *)a4;
- (BOOL)popChangeBatchOfRemappedRecords:(id *)a3 scope:(id)a4 maximumCount:(unint64_t)a5 error:(id *)a6;
- (BOOL)resetMingledRecordsWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)stashChangeWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)unstashRecordsForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteTransientRepository)initWithAbstractObject:(id)a3;
- (id)_allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5;
- (id)_enumeratorForRecordsWithScopeIndex:(unint64_t)a3 maximumCount:(unint64_t)a4;
- (id)_enumeratorForRecordsWithTransientType:(int)a3 scopeIndex:(unint64_t)a4 class:(Class)a5 maximumCount:(unint64_t)a6;
- (id)_enumeratorForRecordsWithTransientType:(int)a3 scopeIndex:(unint64_t)a4 maximumCount:(unint64_t)a5;
- (id)_recordWithTransientType:(int)a3 scopedIdentifier:(id)a4;
- (id)allUnmingledChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)allUnmingledChangesWithScopeIdentifier:(id)a3;
- (id)allUnmingledDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)allUnmingledNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (id)nextBatchOfRemappedRecordsInScope:(id)a3 maximumCount:(unint64_t)a4;
- (id)recordWithScopedIdentifier:(id)a3;
- (id)status;
- (id)unmingledChangeWithScopedIdentifier:(id)a3;
- (unint64_t)countOfStashedRecords;
- (unint64_t)countOfUnmingledRecords;
@end

@implementation CPLPrequeliteTransientRepository

- (CPLPrequeliteTransientRepository)initWithAbstractObject:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLPrequeliteTransientRepository;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v12, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"CPLIgnoredPulledIdentifiers"]);

    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@","]);

      v5 = (void *)v7;
    }

    else
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v5, v8) & 1) == 0)
      {
LABEL_7:

        return (CPLPrequeliteTransientRepository *)v3;
      }
    }

    if (v5)
    {
      v9 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v5);
      v10 = *(void **)(v3 + 36);
      *(void *)(v3 + 36) = v9;

      goto LABEL_7;
    }
  }

  return (CPLPrequeliteTransientRepository *)v3;
}

- (BOOL)initializeStorage
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLPrequeliteTransientRepository;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v8, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"transientType INTEGER NOT NULL,class TEXT NOT NULL,scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,relatedIdentifier TEXT,mingled INTEGER NOT NULL,dequeueOrder INTEGER DEFAULT 0,serializedRecord DATA NOT NULL",  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"scopeIndex, identifier",  1LL,  0LL);
      if (v3)
      {
        unsigned int v4 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"relatedScopedIdentifier",  @"scopeIndex, relatedIdentifier",  0LL,  0LL);
        LOBYTE(v3) = 0;
        if (v4)
        {
          unsigned int v5 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"pop",  @"transientType, mingled, class, scopeIndex",  0LL,  0LL);
          LOBYTE(v3) = 0;
          if (v5)
          {
            unsigned int v6 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"class",  @"class, scopeIndex",  0LL,  0LL);
            LOBYTE(v3) = 0;
            if (v6) {
              LOBYTE(v3) = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"mingled",  @"mingled, scopeIndex",  0LL,  0LL);
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
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLPrequeliteTransientRepository;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v10, "upgradeStorageToVersion:");
  if (a3 != 19 && v5)
  {
    LOBYTE(v5) = 1;
    if (a3 <= 54)
    {
      if (a3 == 39)
      {
        if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
        {
          LOBYTE(v5) = -[CPLPrequeliteStorage recreateMainTableWithCopyInstructions:oldFields:error:]( self,  "recreateMainTableWithCopyInstructions:oldFields:error:",  @"transientType, class, scopeIndex, identifier, relatedIdentifier, mingled, dequeueOrder, serializedRecord",  @"transientType, class, 1, identifier, relatedIdentifier, mingled, dequeueOrder, serializedRecord",  0LL);
          return v5;
        }

        goto LABEL_25;
      }

      if (a3 == 53)
      {
        if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
          goto LABEL_25;
        }
        BOOL v5 = -[CPLPrequeliteStorage dropIndexWithName:error:]( self,  "dropIndexWithName:error:",  @"relatedIdentifier",  0LL);
        if (v5)
        {
          unsigned int v6 = @"relatedScopedIdentifier";
          uint64_t v7 = @"scopeIndex, relatedIdentifier";
          goto LABEL_14;
        }
      }
    }

    else
    {
      switch(a3)
      {
        case '7':
          if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
            goto LABEL_25;
          }
          BOOL v5 = -[CPLPrequeliteStorage dropIndexWithName:error:](self, "dropIndexWithName:error:", @"class", 0LL);
          if (v5) {
            LOBYTE(v5) = -[CPLPrequeliteStorage dropIndexWithName:error:]( self,  "dropIndexWithName:error:",  @"transientType",  0LL);
          }
          break;
        case ';':
          if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
            goto LABEL_25;
          }
          BOOL v5 = -[CPLPrequeliteStorage dropIndexWithName:error:](self, "dropIndexWithName:error:", @"pop", 0LL);
          if (v5)
          {
            unsigned int v8 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"pop",  @"transientType, mingled, class, scopeIndex",  0LL,  0LL);
            LOBYTE(v5) = 0;
            if (v8)
            {
              BOOL v5 = -[CPLPrequeliteStorage dropIndexWithName:error:]( self,  "dropIndexWithName:error:",  @"mingled",  0LL);
              if (v5)
              {
                unsigned int v6 = @"mingled";
                uint64_t v7 = @"mingled, scopeIndex";
                goto LABEL_14;
              }
            }
          }

          break;
        case 'E':
          if (-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
          {
            unsigned int v6 = @"class";
            uint64_t v7 = @"class, scopeIndex";
LABEL_14:
            LOBYTE(v5) = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  v6,  v7,  0LL,  0LL);
            return v5;
          }

- (BOOL)hasUnmingledChanges
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"mingled = %i",  0LL));
  unsigned __int8 v6 = [v3 table:v4 hasRecordsMatchingQuery:v5];

  return v6;
}

- (BOOL)hasUnmingledChangesForScope:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v7 = [v4 localIndex];

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND mingled = %i",  v7,  0LL));
  unsigned __int8 v9 = [v5 table:v6 hasRecordsMatchingQuery:v8];

  return v9;
}

- (BOOL)_appendChange:(id)a3 alreadyMingled:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
  objc_super v10 = v9;
  v11 = *(void **)(&self->super._shouldUpgradeSchema + 1);
  if (v11)
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    unsigned __int8 v13 = [v11 containsObject:v12];

    if ((v13 & 1) != 0)
    {
      unsigned __int8 v14 = 1;
      goto LABEL_51;
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 scopeIdentifier]);
  int64_t v16 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v15);

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v8 realIdentifier]);

    int64_t v64 = v16;
    if (v17)
    {
      uint64_t v18 = 1LL;
    }

    else if ([v8 changeType] == (id)1024)
    {
      uint64_t v18 = 2LL;
    }

    else
    {
      uint64_t v18 = 3LL;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v8 relatedIdentifier]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[CPLArchiver archivedDataWithRootObject:]( &OBJC_CLASS___CPLArchiver,  "archivedDataWithRootObject:",  v8));
    if (!v21)
    {
      if (!_CPLSilentLogging)
      {
        id v35 = sub_10016DE90();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v66 = v8;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
        }
      }

      v37 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"can't serialize %@",  objc_opt_class(v8));
      unsigned __int8 v14 = 0;
      if (a5) {
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidCloudCacheErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "invalidCloudCacheErrorWithReason:",  v37));
      }
      goto LABEL_50;
    }

    v59 = v10;
    v61 = a5;
    v22 = (objc_class *)objc_opt_class(v8);
    v23 = NSStringFromClass(v22);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = v21;
    v26 = v20;
    v27 = v19;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    uint64_t v29 = v18;
    v30 = (void *)objc_claimAutoreleasedReturnValue([v28 pqlConnection]);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    v62 = v25;
    v63 = v27;
    v55 = v25;
    BOOL v58 = v6;
    v32 = v26;
    v60 = (NSString *)v24;
    uint64_t v54 = v24;
    v33 = v30;
    unsigned int v34 = [v30 cplExecute:@"INSERT OR IGNORE INTO %@ (transientType, class, scopeIndex, identifier, relatedIdentifier, mingled, dequeueOrder, serializedRecord) VALUES (%i, %@, %ld, %@, %@, %i, %ld, %@)", v31, v29, v54, v64, v27, v26, v6, objc_msgSend(v8, "dequeueOrder"), v55];

    if (v34)
    {
      if (![v30 changes])
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v8 realIdentifier]);

        v20 = v26;
        unsigned int v41 = [v8 isDelete];
        objc_super v10 = v59;
        if ((v41 & 1) != 0) {
          goto LABEL_36;
        }
        if (v40) {
          goto LABEL_36;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteTransientRepository recordWithScopedIdentifier:]( self,  "recordWithScopedIdentifier:",  v59));
        if (!v42) {
          goto LABEL_36;
        }
        v57 = v42;
        id v43 = (id)objc_claimAutoreleasedReturnValue([v42 mergeRecordChangeWithNewRecordChange:v8 direction:2]);
        if (!_CPLSilentLogging)
        {
          id v44 = sub_10016DE90();
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            id v66 = v8;
            __int16 v67 = 2112;
            v68 = v57;
            __int16 v69 = 2112;
            id v70 = v43;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Merging %@ and %@: %@", buf, 0x20u);
          }
        }

        if (!v43) {
LABEL_36:
        }
          id v43 = v8;
        uint64_t v45 = objc_claimAutoreleasedReturnValue( +[CPLArchiver archivedDataWithRootObject:]( &OBJC_CLASS___CPLArchiver,  "archivedDataWithRootObject:",  v43));
        if (v45)
        {
          if (v41) {
            unsigned int v46 = 2;
          }
          else {
            unsigned int v46 = 3;
          }
          if (v40) {
            uint64_t v47 = 1LL;
          }
          else {
            uint64_t v47 = v46;
          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
          v49 = (void *)v45;
          unsigned __int8 v14 = [v33 cplExecute:@"UPDATE %@ SET transientType = %i, mingled = %i, dequeueOrder = %ld, serializedRecord = %@ WHERE scopeIndex = %ld AND identifier = %@", v48, v47, v58, objc_msgSend(v8, "dequeueOrder"), v45, v64, v63];

          if (v61)
          {
            v19 = v63;
            v37 = v60;
            if ((v14 & 1) == 0)
            {
              unsigned __int8 v14 = 0;
              id *v61 = (id)objc_claimAutoreleasedReturnValue([v33 lastCPLError]);
            }
          }

          else
          {
            v19 = v63;
            v37 = v60;
          }
        }

        else
        {
          v49 = 0LL;
          v37 = v60;
          if (!_CPLSilentLogging)
          {
            id v51 = sub_10016DE90();
            v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v66 = v43;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Can't serialize %@", buf, 0xCu);
            }
          }

          v53 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"can't serialize %@",  objc_opt_class(v43));
          if (v61) {
            id *v61 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidCloudCacheErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "invalidCloudCacheErrorWithReason:",  v53));
          }

          unsigned __int8 v14 = 1;
          v19 = v63;
        }

        v21 = v62;
        goto LABEL_49;
      }

      unsigned __int8 v14 = 1;
    }

    else
    {
      v38 = v30;
      if (!v61)
      {
        unsigned __int8 v14 = 0;
        v21 = v62;
        v19 = v27;
        v20 = v32;
        v37 = v60;
        v33 = v38;
        goto LABEL_48;
      }

      v39 = v30;
      unsigned __int8 v14 = 0;
      id *v61 = (id)objc_claimAutoreleasedReturnValue([v38 lastCPLError]);
      v33 = v39;
    }

    v21 = v62;
    v19 = v27;
    v20 = v32;
    v37 = v60;
LABEL_48:
    objc_super v10 = v59;
LABEL_49:

LABEL_50:
    goto LABEL_51;
  }

  unsigned __int8 v14 = 0;
  if (a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v10));
  }
LABEL_51:

  return v14;
}

- (BOOL)appendBatch:(id)a3 alreadyMingled:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = a3;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!-[CPLPrequeliteTransientRepository _appendChange:alreadyMingled:error:]( self,  "_appendChange:alreadyMingled:error:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i),  v6,  a5,  (void)v15))
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)_markChangesWithScopedIdentifiersAsMingled:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 count]) {
    goto LABEL_12;
  }
  v26 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v10) {
    goto LABEL_11;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v28;
  id v25 = v6;
  while (2)
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      unsigned __int8 v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
      __int128 v15 = objc_autoreleasePoolPush();
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 scopeIdentifier]);
      int64_t v17 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v16);

      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v14 scopeIdentifier]);
        id v21 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v23));

LABEL_15:
        objc_autoreleasePoolPop(v15);

        if (v26)
        {
          id v21 = v21;
          BOOL v22 = 0;
          id *v26 = v21;
        }

        else
        {
          BOOL v22 = 0;
        }

        id v6 = v25;
        goto LABEL_19;
      }

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
      unsigned __int8 v20 = [v8 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND identifier = %@", v18, 1, v17, v19];

      if ((v20 & 1) == 0)
      {
        id v21 = (id)objc_claimAutoreleasedReturnValue([v8 lastError]);
        goto LABEL_15;
      }

      objc_autoreleasePoolPop(v15);
    }

    id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    id v6 = v25;
    if (v11) {
      continue;
    }
    break;
  }

- (id)_enumeratorForRecordsWithScopeIndex:(unint64_t)a3 maximumCount:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v10 = (void *)v9;
  if (a4 == -1LL) {
    id v11 = [v8 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE mingled = %i AND scopeIndex = %lu", v9, 0, a3, v16];
  }
  else {
    id v11 = [v8 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE mingled = %i AND scopeIndex = %lu LIMIT %lu", v9, 0, a3, a4];
  }
  uint64_t v12 = v11;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10016E358;
  v17[3] = &unk_100247A70;
  v17[4] = self;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 enumerateObjects:v17]);
  unsigned __int8 v14 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v13);

  return v14;
}

- (id)_enumeratorForRecordsWithTransientType:(int)a3 scopeIndex:(unint64_t)a4 maximumCount:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v12 = (void *)v11;
  if (a5 == -1LL) {
    id v13 = [v10 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE transientType = %i AND mingled = %i AND scopeIndex = %lu", v11, v7, 0, a4, v18];
  }
  else {
    id v13 = [v10 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE transientType = %i AND mingled = %i AND scopeIndex = %lu LIMIT %lu", v11, v7, 0, a4, a5];
  }
  unsigned __int8 v14 = v13;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10016E4E8;
  v19[3] = &unk_100247A70;
  v19[4] = self;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 enumerateObjects:v19]);
  uint64_t v16 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v15);

  return v16;
}

- (id)_enumeratorForRecordsWithTransientType:(int)a3 scopeIndex:(unint64_t)a4 class:(Class)a5 maximumCount:(unint64_t)a6
{
  uint64_t v9 = *(void *)&a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v14 = NSStringFromClass(a5);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)v15;
  if (a6 == -1LL) {
    id v17 = [v12 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE transientType = %i AND mingled = %i AND class = %@ AND scopeIndex = %lu", v13, v9, 0, v15, a4, v22];
  }
  else {
    id v17 = [v12 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE transientType = %i AND mingled = %i AND class = %@ AND scopeIndex = %lu LIMIT %lu", v13, v9, 0, v15, a4, a6];
  }
  uint64_t v18 = v17;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10016E69C;
  v23[3] = &unk_100247A70;
  v23[4] = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 enumerateObjects:v23]);
  unsigned __int8 v20 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v19);

  return v20;
}

- (id)recordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
  int64_t v6 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = [v9 cplFetchObject:&stru_100247A90, @"SELECT serializedRecord FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v10, v6, v11 sql];
  }

  return v7;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
  int64_t v6 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v7 = 0;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND identifier = %@",  v6,  v10));
    unsigned __int8 v7 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }

  return v7;
}

- (BOOL)hasStashedRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
  int64_t v6 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v7 = 0;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND identifier = %@ AND mingled = %i",  v6,  v10,  2LL));
    unsigned __int8 v7 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }

  return v7;
}

- (id)_recordWithTransientType:(int)a3 scopedIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  int64_t v8 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v9 = [v11 cplFetchObject:&stru_100247AB0, @"SELECT serializedRecord FROM %@ WHERE scopeIndex = %ld AND identifier = %@ AND +transientType = %i AND +mingled = %i", v12, v8, v13, v4, 0 sql];
  }

  return v9;
}

- (id)nextBatchOfRemappedRecordsInScope:(id)a3 maximumCount:(unint64_t)a4
{
  id v6 = a3;
  if (a4) {
    unint64_t v7 = a4;
  }
  else {
    unint64_t v7 = -1LL;
  }
  int64_t v8 = objc_alloc_init(&OBJC_CLASS___CPLChangeBatch);
  unsigned __int8 v20 = self;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteTransientRepository _enumeratorForRecordsWithTransientType:scopeIndex:maximumCount:]( self,  "_enumeratorForRecordsWithTransientType:scopeIndex:maximumCount:",  1,  [v6 localIndex],  v7));
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v23;
    unint64_t v21 = v7 - 1;
LABEL_6:
    uint64_t v14 = 0LL;
    uint64_t v15 = v21 - v12;
    v12 += (uint64_t)v11;
    while (1)
    {
      if (*(void *)v23 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
      -[CPLChangeBatch addRecord:](v8, "addRecord:", v16);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 scopedIdentifier]);

      if (!v17) {
        sub_10019BD74((uint64_t)v16, (uint64_t)a2, (uint64_t)v20);
      }
      if (v15 == v14) {
        break;
      }
      if (v11 == (id)++v14)
      {
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  return v8;
}

- (BOOL)popChangeBatchOfRemappedRecords:(id *)a3 scope:(id)a4 maximumCount:(unint64_t)a5 error:(id *)a6
{
  id v8 = a4;
  if (a5) {
    unint64_t v9 = a5;
  }
  else {
    unint64_t v9 = -1LL;
  }
  id v10 = objc_alloc_init(&OBJC_CLASS___CPLChangeBatch);
  id v11 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  if (v9 >= 0x14) {
    uint64_t v12 = 20LL;
  }
  else {
    uint64_t v12 = v9;
  }
  uint64_t v13 = -[NSMutableSet initWithCapacity:](v11, "initWithCapacity:", v12, a2);
  v32 = v8;
  v33 = self;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteTransientRepository _enumeratorForRecordsWithTransientType:scopeIndex:maximumCount:]( self,  "_enumeratorForRecordsWithTransientType:scopeIndex:maximumCount:",  1,  [v8 localIndex],  v9));
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = 0LL;
    uint64_t v18 = *(void *)v35;
    unint64_t v30 = v9 - 1;
LABEL_9:
    uint64_t v19 = 0LL;
    uint64_t v20 = v30 - v17;
    v17 += (uint64_t)v16;
    while (1)
    {
      if (*(void *)v35 != v18) {
        objc_enumerationMutation(v14);
      }
      unint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * v19);
      -[CPLChangeBatch addRecord:](v10, "addRecord:", v21);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 scopedIdentifier]);

      if (!v22) {
        sub_10019BE50((uint64_t)v21, v28, (uint64_t)v33);
      }
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v21 scopedIdentifier]);
      -[NSMutableSet addObject:](v13, "addObject:", v23);

      if (v20 == v19) {
        break;
      }
      if (v16 == (id)++v19)
      {
        id v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v16) {
          goto LABEL_9;
        }
        break;
      }
    }
  }

  unsigned int v24 = -[CPLPrequeliteTransientRepository _markChangesWithScopedIdentifiersAsMingled:error:]( v33,  "_markChangesWithScopedIdentifiersAsMingled:error:",  v13,  a6);
  if (v24)
  {
    __int128 v25 = (CPLChangeBatch *)-[CPLChangeBatch count](v10, "count");
    if (v25) {
      __int128 v25 = v10;
    }
    *a3 = v25;
  }

  return v24;
}

- (id)unmingledChangeWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
  int64_t v6 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10016F040;
    v14[3] = &unk_100247A70;
    v14[4] = self;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = [v9 cplFetchObject:v14, @"SELECT scopeIndex, serializedRecord, mingled FROM %@ WHERE identifier = %@ AND scopeIndex = %lu", v10, v11, v6 sql];

    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    if (v7 == v12)
    {

      id v7 = 0LL;
    }
  }

  return v7;
}

- (id)_allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  int64_t v8 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return &__NSArray0__struct;
  }
  int64_t v10 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v14 = NSStringFromClass(a3);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)v15;
  if (a5 == -1LL) {
    id v17 = [v12 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE mingled = %i AND class = %@ AND scopeIndex = %lu", v13, 0, v15, v10, v21];
  }
  else {
    id v17 = [v12 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE mingled = %i AND class = %@ AND scopeIndex = %lu LIMIT %lu", v13, 0, v15, v10, a5];
  }
  uint64_t v18 = v17;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10016F21C;
  v22[3] = &unk_100247A70;
  v22[4] = self;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 enumerateObjects:v22]);
  uint64_t v20 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v19);

  return v20;
}

- (id)allUnmingledChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  return -[CPLPrequeliteTransientRepository _allUnmingledChangesWithClass:scopeIdentifier:maximumCount:]( self,  "_allUnmingledChangesWithClass:scopeIdentifier:maximumCount:",  a3,  a4,  -1LL);
}

- (id)allUnmingledNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  int64_t v6 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    id v7 = &__NSArray0__struct;
  }
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteTransientRepository _enumeratorForRecordsWithTransientType:scopeIndex:class:maximumCount:]( self,  "_enumeratorForRecordsWithTransientType:scopeIndex:class:maximumCount:",  3LL,  v6,  a3,  -1LL));
  }
  return v7;
}

- (id)allUnmingledDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  int64_t v6 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    id v7 = &__NSArray0__struct;
  }
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteTransientRepository _enumeratorForRecordsWithTransientType:scopeIndex:class:maximumCount:]( self,  "_enumeratorForRecordsWithTransientType:scopeIndex:class:maximumCount:",  2LL,  v6,  a3,  -1LL));
  }
  return v7;
}

- (id)allUnmingledChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  int64_t v8 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = (CPLPrequeliteSkipNullEnumerator *)&__NSArray0__struct;
  }

  else
  {
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v14 = [v11 cplFetch:@"SELECT scopeIndex, serializedRecord, mingled FROM %@ WHERE relatedIdentifier = %@ AND scopeIndex = %lu AND +mingled = %i", v12, v13, v8, 0];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10016F4A8;
    v17[3] = &unk_100247AD8;
    v17[4] = self;
    void v17[5] = a3;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 enumerateObjects:v17]);
    unint64_t v9 = -[CPLPrequeliteSkipNullEnumerator initWithEnumerator:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteSkipNullEnumerator),  "initWithEnumerator:",  v15);
  }

  return v9;
}

- (id)allUnmingledChangesWithScopeIdentifier:(id)a3
{
  int64_t v4 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v5 = &__NSArray0__struct;
  }
  else {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteTransientRepository _enumeratorForRecordsWithScopeIndex:maximumCount:]( self,  "_enumeratorForRecordsWithScopeIndex:maximumCount:",  v4,  -1LL));
  }
  return v5;
}

- (BOOL)markUnmingledChangeWithScopedIdentifierAsMingled:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  int64_t v10 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v9);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v11));
    }

    goto LABEL_7;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  BOOL v14 = 1;
  unsigned __int8 v15 = [v8 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND identifier = %@", v12, 1, v10, v13];

  if ((v15 & 1) == 0)
  {
    if (!a4)
    {
LABEL_7:
      BOOL v14 = 0;
      goto LABEL_8;
    }

    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue([v8 lastCPLError]);
  }

- (BOOL)hasMingledRecordsForScopeWithIdentifier:(id)a3
{
  int64_t v4 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND mingled = %i",  v6,  1LL));
  unsigned __int8 v10 = [v7 table:v8 hasRecordsMatchingQuery:v9];

  return v10;
}

- (BOOL)hasUnmingledNonStashedRecordsForScopeWithIdentifier:(id)a3
{
  int64_t v4 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND mingled = %i",  v6,  0LL));
  unsigned __int8 v10 = [v7 table:v8 hasRecordsMatchingQuery:v9];

  return v10;
}

- (BOOL)hasOnlyMingledRecordsWithScopeIdentifier:(id)a3
{
  int64_t v4 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v5) = 0;
  }

  else
  {
    int64_t v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND mingled != %i",  v6,  1LL));
    unsigned int v5 = [v7 table:v8 hasRecordsMatchingQuery:v9] ^ 1;
  }

  return v5;
}

- (BOOL)resetMingledRecordsWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  id v9 = v6;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 localIndexesInjection]);
  unsigned __int8 v12 = [v8 cplExecute:@"UPDATE OR FAIL %@ SET mingled = %i WHERE %@ AND mingled = %i", v10, 0, v11, 1];

  if (a4 && (v12 & 1) == 0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v8 lastCPLError]);
  }

  return v12;
}

- (BOOL)deleteMingledRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v6);
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
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND mingled = %i", v12, v9, 1];

    if ((v8 & 1) != 0)
    {
      uint64_t v13 = (uint64_t)[v11 changes];
      if (v13 >= 1 && !_CPLSilentLogging)
      {
        uint64_t v14 = v13;
        id v15 = sub_10016DE90();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v19 = v14;
          __int16 v20 = 2112;
          id v21 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Removed %lld mingled processed changes for %@",  buf,  0x16u);
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

- (BOOL)hasUnmingledOrStashedRecordsWithScopeFilter:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localIndexesInjection]);

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"%@ AND mingled != %i",  v7,  1LL));
  unsigned __int8 v9 = [v5 table:v6 hasRecordsMatchingQuery:v8];

  return v9;
}

- (BOOL)stashChangeWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  int64_t v8 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v9));
    }

    unsigned __int8 v10 = 0;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned __int8 v10 = [v12 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND identifier = %@", v13, 2, v8, v14];

    if ((v10 & 1) != 0)
    {
      if ((uint64_t)[v12 changes] >= 1 && !_CPLSilentLogging)
      {
        id v15 = sub_10016DE90();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Stashed %@", buf, 0xCu);
        }
      }
    }

    else if (a4)
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue([v12 lastError]);
    }
  }

  return v10;
}

- (BOOL)unstashRecordsForScopeWithIdentifier:(id)a3 maxCount:(unint64_t)a4 hasMore:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  int64_t v11 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v10);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v13 = v11;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 pqlConnection]);

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v17 = (void *)v16;
    if (a4)
    {
      unsigned __int8 v18 = [v15 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND mingled = %i LIMIT %lu", v16, 0, v13, 2, a4];

      if ((v18 & 1) != 0)
      {
        *a5 = (unint64_t)[v15 changes] >= a4;
LABEL_10:
        BOOL v12 = 1;
LABEL_13:

        goto LABEL_14;
      }
    }

    else
    {
      uint64_t v19 = [v15 cplExecute:@"UPDATE %@ SET mingled = %i WHERE scopeIndex = %ld AND mingled = %i", v16, 0, v13, 2];

      if ((v19 & 1) != 0)
      {
        *a5 = 0;
        goto LABEL_10;
      }
    }

    BOOL v12 = 0;
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue([v15 lastError]);
    }
    goto LABEL_13;
  }

  BOOL v12 = 0;
  if (a6) {
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v10));
  }
LABEL_14:

  return v12;
}

- (BOOL)hasStashedChangesForScopeWithIdentifier:(id)a3
{
  int64_t v4 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"scopeIndex = %ld AND mingled = %i",  v6,  2LL));
  unsigned __int8 v10 = [v7 table:v8 hasRecordsMatchingQuery:v9];

  return v10;
}

- (BOOL)deleteAllRecordsForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v6);
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
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld", v12, v9];

    if ((v8 & 1) != 0)
    {
      uint64_t v13 = (uint64_t)[v11 changes];
      if (v13 >= 1 && !_CPLSilentLogging)
      {
        uint64_t v14 = v13;
        id v15 = sub_10016DE90();
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v19 = v14;
          __int16 v20 = 2112;
          id v21 = v6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Deleted %lld changes for %@", buf, 0x16u);
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

- (unint64_t)countOfUnmingledRecords
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"mingled = %i",  0LL));
  id v6 = [v3 table:v4 countOfRecordsMatchingQuery:v5];

  return (unint64_t)v6;
}

- (unint64_t)countOfStashedRecords
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"mingled = %i",  2LL));
  id v6 = [v3 table:v4 countOfRecordsMatchingQuery:v5];

  return (unint64_t)v6;
}

- (id)status
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CPLPrequeliteTransientRepository;
  id v3 = -[CPLPrequeliteStorage status](&v9, "status");
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  unint64_t v6 = -[CPLPrequeliteTransientRepository countOfUnmingledRecords](self, "countOfUnmingledRecords");
  if (v6) {
    objc_msgSend(v5, "appendFormat:", @"\n\t%lu unmingled changes", v6);
  }
  unint64_t v7 = -[CPLPrequeliteTransientRepository countOfStashedRecords](self, "countOfStashedRecords");
  if (v7) {
    objc_msgSend(v5, "appendFormat:", @"\n\t%lu stashed changes", v7);
  }
  return v5;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

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

- (void).cxx_destruct
{
}

@end