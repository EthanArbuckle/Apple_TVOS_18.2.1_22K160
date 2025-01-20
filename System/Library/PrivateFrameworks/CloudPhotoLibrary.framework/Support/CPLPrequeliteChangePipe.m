@interface CPLPrequeliteChangePipe
- (BOOL)_deleteAllChangesWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_resetPushAndPullMarkersIfEmptyWithError:(id *)a3;
- (BOOL)_resetPushAndPullMarkersWithError:(id *)a3;
- (BOOL)_setPullMarker:(unint64_t)a3 error:(id *)a4;
- (BOOL)_setPushMarker:(unint64_t)a3 error:(id *)a4;
- (BOOL)appendChangeBatch:(id)a3 error:(id *)a4;
- (BOOL)compactChangeBatchesWithError:(id *)a3;
- (BOOL)deleteAllChangeBatchesWithError:(id *)a3;
- (BOOL)deleteAllChangesWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasQueuedBatches;
- (BOOL)hasSomeChangeInScopesWithIdentifiers:(id)a3;
- (BOOL)hasSomeChangeWithScopeFilter:(id)a3;
- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)popChangeBatch:(id *)a3 error:(id *)a4;
- (BOOL)popNextBatchWithError:(id *)a3;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteChangePipe)initWithAbstractObject:(id)a3;
- (id)allChangeBatches;
- (id)nextBatch;
- (id)status;
- (id)statusPerScopeIndex;
- (unint64_t)_pullMarker;
- (unint64_t)_pushMarker;
- (unint64_t)countOfQueuedBatches;
- (void)writeTransactionDidFail;
@end

@implementation CPLPrequeliteChangePipe

- (CPLPrequeliteChangePipe)initWithAbstractObject:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLPrequeliteChangePipe;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v11, "initWithAbstractObject:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"pullMarker" type:v4]);
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 variableWithName:@"pushMarker" type:v7]);
    v9 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v8;
  }

  return (CPLPrequeliteChangePipe *)v3;
}

- (BOOL)initializeStorage
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CPLPrequeliteChangePipe;
  BOOL v3 = -[CPLPrequeliteStorage initializeStorage](&v6, "initializeStorage");
  if (v3)
  {
    BOOL v3 = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(void *)(&self->super._shouldUpgradeSchema + 1),  &off_10025A4A0,  0LL);
    if (v3)
    {
      BOOL v3 = -[CPLPrequeliteStorage createVariable:defaultValue:error:]( self,  "createVariable:defaultValue:error:",  *(CPLPrequeliteVariable **)((char *)&self->_pullGenerationVar + 4),  &off_10025A4A0,  0LL);
      if (v3)
      {
        BOOL v3 = -[CPLPrequeliteStorage createMainTableWithDefinition:error:]( self,  "createMainTableWithDefinition:error:",  @"library_version TEXT NOT NULL,batch_marker INTEGER NOT NULL,scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,serializedRecord DATA NOT NULL",  0LL);
        if (v3)
        {
          BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"library_version",  0LL);
          if (v3)
          {
            unsigned int v4 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"identifier, scopeIndex",  0LL,  0LL);
            LOBYTE(v3) = 0;
            if (v4)
            {
              BOOL v3 = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"batch_marker",  0LL);
              if (v3) {
                LOBYTE(v3) = -[CPLPrequeliteStorage createIndexOnColumn:error:]( self,  "createIndexOnColumn:error:",  @"scopeIndex",  0LL);
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
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CPLPrequeliteChangePipe;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v15, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  if (a3 > 51)
  {
    if (a3 != 52)
    {
      if (a3 != 56) {
        return v5;
      }
      if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
        return v5;
      }
      unsigned __int8 v5 = 0;
      if (!-[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  @"scopedIdentifier",  @"identifier, scopeIndex",  0LL,  0LL)) {
        return v5;
      }
      return -[CPLPrequeliteStorage dropIndexWithName:error:]( self,  "dropIndexWithName:error:",  @"identifier",  0LL);
    }

    if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
      return v5;
    }
    v14 = @"scopeIndex";
    return -[CPLPrequeliteStorage createIndexOnColumn:error:](self, "createIndexOnColumn:error:", v14, 0LL);
  }

  if (a3 == 20)
  {
    if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
      return v5;
    }
    v14 = @"batch_marker";
    return -[CPLPrequeliteStorage createIndexOnColumn:error:](self, "createIndexOnColumn:error:", v14, 0LL);
  }

  if (a3 == 39 && -[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_100173B50();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        __int16 v18 = 2048;
        uint64_t v19 = 39LL;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Upgrading %@ to version %llu: adding scopeIndex column",  buf,  0x16u);
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v5 = [v10 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 1", v11];
  }

  return v5;
}

- (unint64_t)_pullMarker
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(void *)(&self->super._shouldUpgradeSchema + 1)));
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (BOOL)_setPullMarker:(unint64_t)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  LOBYTE(a4) = -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  v6,  *(void *)(&self->super._shouldUpgradeSchema + 1),  a4);

  return (char)a4;
}

- (unint64_t)_pushMarker
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage valueForVariable:]( self,  "valueForVariable:",  *(CPLPrequeliteVariable **)((char *)&self->_pullGenerationVar + 4)));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (BOOL)_setPushMarker:(unint64_t)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  LOBYTE(a4) = -[CPLPrequeliteStorage setValue:forVariable:error:]( self,  "setValue:forVariable:error:",  v6,  *(CPLPrequeliteVariable **)((char *)&self->_pullGenerationVar + 4),  a4);

  return (char)a4;
}

- (BOOL)_resetPushAndPullMarkersWithError:(id *)a3
{
  id v11 = 0LL;
  BOOL v5 = -[CPLPrequeliteChangePipe _setPushMarker:error:](self, "_setPushMarker:error:", 0LL, &v11);
  id v6 = v11;
  v7 = v6;
  if (v5)
  {
    id v10 = v6;
    LOBYTE(v5) = -[CPLPrequeliteChangePipe _setPullMarker:error:](self, "_setPullMarker:error:", 0LL, &v10);
    id v8 = v10;

    v7 = v8;
  }

  *(NSString **)((char *)&self->_logDomain + 4) = 0LL;
  if (a3 && !v5) {
    *a3 = v7;
  }

  return v5;
}

- (BOOL)_resetPushAndPullMarkersIfEmptyWithError:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v7 = [v5 tableHasRecords:v6];

  if ((v7 & 1) != 0) {
    return 1;
  }
  else {
    return -[CPLPrequeliteChangePipe _resetPushAndPullMarkersWithError:](self, "_resetPushAndPullMarkersWithError:", a3);
  }
}

- (unint64_t)countOfQueuedBatches
{
  unint64_t v3 = -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker");
  unint64_t v4 = -[CPLPrequeliteChangePipe _pushMarker](self, "_pushMarker");
  unint64_t result = v4 - v3;
  if (v4 < v3)
  {
    unint64_t v9 = v4;
    id v10 = self;
    if (!_CPLSilentLogging)
    {
      id v6 = sub_100173B50();
      unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteChangePipe abstractObject](v10, "abstractObject"));
        *(_DWORD *)buf = 134218498;
        unint64_t v12 = v3;
        __int16 v13 = 2048;
        unint64_t v14 = v9;
        __int16 v15 = 2112;
        v16 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Pull marker %lu should always be less than push marker %lu for %@",  buf,  0x20u);
      }
    }

    _CPLStoreFailure(@"Inconsistent pull/push marker");
  }

  return result;
}

- (BOOL)hasQueuedBatches
{
  return -[CPLPrequeliteChangePipe countOfQueuedBatches](self, "countOfQueuedBatches") != 0;
}

- (BOOL)appendChangeBatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteChangePipe abstractObject](self, "abstractObject"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 engineStore]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v10 libraryVersion]);

  unint64_t v11 = -[CPLPrequeliteChangePipe _pushMarker](self, "_pushMarker");
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v36;
    v29 = a4;
    v30 = v7;
LABEL_3:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v36 != v14) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 scopedIdentifier]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 scopeIdentifier]);
      int64_t v19 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v18);

      if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[CPLArchiver archivedDataWithRootObject:]( &OBJC_CLASS___CPLArchiver,  "archivedDataWithRootObject:",  v16));
      if (!v20)
      {
        a4 = v29;
        if (!_CPLSilentLogging)
        {
          id v26 = sub_100173B50();
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v16;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unable to serialize %@", buf, 0xCu);
          }
        }

        id v25 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidClientCacheErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "invalidClientCacheErrorWithReason:",  0LL));
LABEL_19:

LABEL_20:
        BOOL v24 = 0;
        unsigned __int8 v7 = v30;
        goto LABEL_21;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
      unsigned __int8 v23 = [v33 cplExecute:@"INSERT INTO %@ (library_version, batch_marker, scopeIndex, identifier, serializedRecord) VALUES (%@, %lu, %ld, %@, %@)", v21, v32, v11, v19, v22, v20];

      if ((v23 & 1) == 0)
      {
        id v25 = (id)objc_claimAutoreleasedReturnValue([v33 lastCPLError]);
        a4 = v29;
        goto LABEL_19;
      }

      if (v13 == (id)++v15)
      {
        id v13 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
        a4 = v29;
        unsigned __int8 v7 = v30;
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }

    id v25 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v17));
    a4 = v29;
    goto LABEL_20;
  }

- (BOOL)popChangeBatch:(id *)a3 error:(id *)a4
{
  unint64_t v7 = -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker");
  unint64_t v8 = -[CPLPrequeliteChangePipe _pushMarker](self, "_pushMarker");
  if (v7 > v8)
  {
    if (!_CPLSilentLogging)
    {
      unint64_t v29 = v8;
      id v30 = sub_100173B50();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteChangePipe abstractObject](self, "abstractObject"));
        *(_DWORD *)buf = 138412802;
        v48 = v32;
        __int16 v49 = 2048;
        unint64_t v50 = v7;
        __int16 v51 = 2048;
        unint64_t v52 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Inconsistency when popping one batch %@ (pull marker: %lu / push marker: %lu)",  buf,  0x20u);
      }
    }

    _CPLStoreFailure(@"Inconsistent pull/push marker");
  }

  if (v7 == v8)
  {
    *a3 = 0LL;
    return -[CPLPrequeliteChangePipe deleteAllChangeBatchesWithError:](self, "deleteAllChangeBatchesWithError:", a4);
  }

  SEL v34 = a2;
  __int128 v38 = a4;
  *a3 = objc_alloc_init(&OBJC_CLASS___CPLChangeBatch);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unint64_t v35 = v7;
  __int128 v37 = v10;
  id v12 = [v10 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE batch_marker == %lu ORDER BY rowid", v11, v7];

  id v36 = v12;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v12 enumerateObjects:&stru_100247B58]);
  id v14 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v43;
    id v39 = v13;
    uint64_t v40 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        int64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 scopedIdentifier]);
        id v20 = [v19 scopeIndex];
        if (v20 == (id)0x7FFFFFFFFFFFFFFFLL) {
          sub_10019BF2C((uint64_t)v34, (uint64_t)self);
        }
        unint64_t v21 = (unint64_t)v20;
        if (-[CPLPrequeliteStorage isLocalScopeIndexValid:](self, "isLocalScopeIndexValid:", v20))
        {
          [v18 setScopeIndex:0];
          [*a3 addRecord:v18];
        }

        else if (!_CPLSilentLogging)
        {
          id v22 = sub_100173B50();
          unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteChangePipe abstractObject](self, "abstractObject"));
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
            *(_DWORD *)buf = 138412802;
            v48 = v25;
            __int16 v49 = 2112;
            unint64_t v50 = (unint64_t)v18;
            __int16 v51 = 2048;
            unint64_t v52 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ dropping %@ (scope index %ld id no longer valid)",  buf,  0x20u);

            id v13 = v39;
            uint64_t v16 = v40;
          }
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }

    while (v15);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v37 lastCPLError]);
  if (!v26)
  {
    if (-[CPLPrequeliteChangePipe _setPullMarker:error:](self, "_setPullMarker:error:", v35 + 1, v38))
    {
      v28 = v36;
      else {
        BOOL v27 = -[CPLPrequeliteChangePipe compactChangeBatchesWithError:](self, "compactChangeBatchesWithError:", v38);
      }
      goto LABEL_27;
    }

    goto LABEL_25;
  }

  if (!v38)
  {
LABEL_25:
    BOOL v27 = 0;
    goto LABEL_26;
  }

  BOOL v27 = 0;
  *__int128 v38 = (id)objc_claimAutoreleasedReturnValue([v37 lastCPLError]);
LABEL_26:
  v28 = v36;
LABEL_27:

  return v27;
}

- (id)nextBatch
{
  unint64_t v4 = -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker");
  unint64_t v5 = -[CPLPrequeliteChangePipe _pushMarker](self, "_pushMarker");
  if (v4 > v5)
  {
    if (!_CPLSilentLogging)
    {
      unint64_t v24 = v5;
      id v25 = sub_100173B50();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteChangePipe abstractObject](self, "abstractObject"));
        *(_DWORD *)buf = 138412802;
        uint64_t v40 = v27;
        __int16 v41 = 2048;
        unint64_t v42 = v4;
        __int16 v43 = 2048;
        unint64_t v44 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Inconsistency getting next batch %@ (pull marker: %lu / push marker: %lu)",  buf,  0x20u);
      }
    }

    _CPLStoreFailure(@"Inconsistent pull/push marker");
  }

  if (v4 >= v5)
  {
    v33 = 0LL;
  }

  else
  {
    SEL v28 = a2;
    v33 = objc_alloc_init(&OBJC_CLASS___CPLChangeBatch);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pqlConnection]);

    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v30 = v7;
    id v9 = [v7 cplFetch:@"SELECT scopeIndex, serializedRecord FROM %@ WHERE batch_marker == %lu ORDER BY rowid", v8, v4];

    unint64_t v29 = v9;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 enumerateObjects:&stru_100247B78]);
    id v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v35;
      id v31 = v10;
      uint64_t v32 = *(void *)v35;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 scopedIdentifier]);
          id v17 = [v16 scopeIndex];
          if (v17 == (id)0x7FFFFFFFFFFFFFFFLL) {
            sub_10019BFE0((uint64_t)v28, (uint64_t)self);
          }
          unint64_t v18 = (unint64_t)v17;
          if (-[CPLPrequeliteStorage isLocalScopeIndexValid:](self, "isLocalScopeIndexValid:", v17))
          {
            [v15 setScopeIndex:0];
            -[CPLChangeBatch addRecord:](v33, "addRecord:", v15);
          }

          else if (!_CPLSilentLogging)
          {
            id v19 = sub_100173B50();
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteChangePipe abstractObject](self, "abstractObject"));
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
              *(_DWORD *)buf = 138412802;
              uint64_t v40 = v22;
              __int16 v41 = 2112;
              unint64_t v42 = (unint64_t)v15;
              __int16 v43 = 2048;
              unint64_t v44 = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@ dropping %@ (scope index %ld id no longer valid)",  buf,  0x20u);

              id v10 = v31;
              uint64_t v13 = v32;
            }
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }

      while (v12);
    }
  }

  return v33;
}

- (BOOL)popNextBatchWithError:(id *)a3
{
  unint64_t v5 = -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker");
  unint64_t v6 = -[CPLPrequeliteChangePipe _pushMarker](self, "_pushMarker");
  if (v5 >= v6)
  {
    unint64_t v13 = v6;
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100173B50();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteChangePipe abstractObject](self, "abstractObject"));
        *(_DWORD *)buf = 138412802;
        id v15 = v11;
        __int16 v16 = 2048;
        unint64_t v17 = v5;
        __int16 v18 = 2048;
        unint64_t v19 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Inconsistency when popping next batch from %@ (pull marker: %lu / push marker: %lu)",  buf,  0x20u);
      }
    }

    _CPLStoreFailure(@"Inconsistent pull/push marker");
  }

  unint64_t v7 = v5 + 1;
  BOOL v8 = -[CPLPrequeliteChangePipe _setPullMarker:error:](self, "_setPullMarker:error:", v7, a3);
  if (v8)
  {
    else {
      LOBYTE(v8) = -[CPLPrequeliteChangePipe compactChangeBatchesWithError:](self, "compactChangeBatchesWithError:", a3);
    }
  }

  return v8;
}

- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  if (-[CPLPrequeliteChangePipe hasQueuedBatches](self, "hasQueuedBatches")
    && (unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]),
        int64_t v6 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v5),
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"identifier = %@ AND scopeIndex = %ld",  v10,  v6));
    unsigned __int8 v7 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)hasSomeChangeInScopesWithIdentifiers:(id)a3
{
  id v4 = a3;
  if (-[CPLPrequeliteChangePipe hasQueuedBatches](self, "hasQueuedBatches"))
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteStorage filterForIncludedScopeIdentifiers:]( self,  "filterForIncludedScopeIdentifiers:",  v4));
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localIndexes]);
    id v7 = [v6 count];

    if (v7)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localIndexesInjection]);
      unsigned __int8 v11 = [v8 table:v9 hasRecordsMatchingQuery:v10];
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)hasSomeChangeWithScopeFilter:(id)a3
{
  id v4 = a3;
  if (-[CPLPrequeliteChangePipe hasQueuedBatches](self, "hasQueuedBatches"))
  {
    id v5 = v4;
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 includedScopeIdentifiers]);

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localIndexes]);
      id v8 = [v7 count];

      if (!v8)
      {
        unsigned __int8 v9 = 0;
LABEL_9:

        goto LABEL_10;
      }
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 excludedScopeIdentifiers]);

      if (v10)
      {
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 localIndexes]);
        id v12 = [v11 count];

        if (!v12)
        {
          unsigned __int8 v9 = 1;
          goto LABEL_9;
        }
      }
    }

    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 localIndexesInjection]);
    unsigned __int8 v9 = [v13 table:v14 hasRecordsMatchingQuery:v15];

    goto LABEL_9;
  }

  unsigned __int8 v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)deleteAllChangeBatchesWithError:(id *)a3
{
  if (-[CPLPrequeliteChangePipe _pushMarker](self, "_pushMarker")
    || -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pqlConnection]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v8 = [v6 cplExecute:@"DELETE FROM %@", v7];

    if ((v8 & 1) != 0)
    {
      BOOL v9 = -[CPLPrequeliteChangePipe _resetPushAndPullMarkersWithError:](self, "_resetPushAndPullMarkersWithError:", a3);
    }

    else
    {
      BOOL v9 = 0;
      if (a3) {
        *a3 = (id)objc_claimAutoreleasedReturnValue([v6 lastCPLError]);
      }
    }
  }

  else
  {
    *(NSString **)((char *)&self->_logDomain + 4) = 0LL;
    return 1;
  }

  return v9;
}

- (BOOL)deleteAllChangesWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[CPLPrequeliteChangePipe _pushMarker](self, "_pushMarker")
    || -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker"))
  {
    id v7 = v6;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 localIndexesInjection]);
    unsigned __int8 v12 = [v9 cplExecute:@"DELETE FROM %@ WHERE %@", v10, v11];

    if ((v12 & 1) != 0)
    {
      BOOL v13 = -[CPLPrequeliteChangePipe _resetPushAndPullMarkersIfEmptyWithError:]( self,  "_resetPushAndPullMarkersIfEmptyWithError:",  a4);
    }

    else
    {
      BOOL v13 = 0;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue([v9 lastCPLError]);
      }
    }
  }

  else
  {
    *(NSString **)((char *)&self->_logDomain + 4) = 0LL;
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)compactChangeBatchesWithError:(id *)a3
{
  id v5 = -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker");
  if (!v5) {
    return 1;
  }
  id v6 = v5;
  if ((NSString *)-[CPLPrequeliteChangePipe _pushMarker](self, "_pushMarker") == v5) {
    return -[CPLPrequeliteChangePipe deleteAllChangeBatchesWithError:](self, "deleteAllChangeBatchesWithError:", a3);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pqlConnection]);

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v10 = [v8 cplExecute:@"DELETE FROM %@ WHERE batch_marker < %lu", v9, v6];

  if (a3)
  {
    if ((v10 & 1) == 0) {
      *a3 = (id)objc_claimAutoreleasedReturnValue([v8 lastCPLError]);
    }
  }

  *(NSString **)((char *)&self->_logDomain + 4) = v6;

  return v10;
}

- (id)allChangeBatches
{
  id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  unint64_t v5 = -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v7 = [v4 cplFetch:@"SELECT batch_marker, scopeIndex, serializedRecord FROM %@ WHERE batch_marker >= %lu", v6, v5];

  if ([v7 next])
  {
    id v25 = v4;
    unsigned __int8 v8 = 0LL;
    uint64_t v9 = -1LL;
    unsigned __int8 v10 = &_CPLSilentLogging;
    unsigned __int8 v11 = &_s10Foundation17URLResourceValuesV8fileSizeSiSgvg_ptr;
    do
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v7 cplChangeAtIndex:2]);
      id v13 = [v7 integerAtIndex:1];
      [v12 setScopeIndex:v13];
      id v14 = [v7 unsignedIntegerAtIndex:0];
      if (v14 != (id)v9)
      {
        uint64_t v15 = (uint64_t)v14;
        if (v8) {
          -[NSMutableArray addObject:](v26, "addObject:", v8);
        }
        id v16 = objc_alloc_init((Class)v11[397]);

        uint64_t v9 = v15;
        unsigned __int8 v8 = v16;
      }

      if (-[CPLPrequeliteStorage isLocalScopeIndexValid:](self, "isLocalScopeIndexValid:", v13))
      {
        [v12 setScopeIndex:0];
        [v8 addRecord:v12];
      }

      else if (!*v10)
      {
        id v17 = sub_100173B50();
        __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteChangePipe abstractObject](self, "abstractObject"));
          uint64_t v27 = v9;
          id v20 = self;
          unint64_t v21 = v11;
          id v22 = v10;
          unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
          *(_DWORD *)buf = 138412802;
          unint64_t v29 = v23;
          __int16 v30 = 2112;
          id v31 = v12;
          __int16 v32 = 2048;
          id v33 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@ dropping %@ (scope index %ld id no longer valid)",  buf,  0x20u);

          unsigned __int8 v10 = v22;
          unsigned __int8 v11 = v21;
          self = v20;
          uint64_t v9 = v27;
        }
      }
    }

    while (([v7 next] & 1) != 0);
    if (v8) {
      -[NSMutableArray addObject:](v26, "addObject:", v8);
    }
    id v4 = v25;
  }

  else
  {
    unsigned __int8 v8 = 0LL;
  }

  return v26;
}

- (void)writeTransactionDidFail
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLPrequeliteChangePipe;
  -[CPLPrequeliteStorage writeTransactionDidFail](&v3, "writeTransactionDidFail");
  *(NSString **)((char *)&self->_logDomain + 4) = 0LL;
}

- (id)status
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v5 = [v3 tableCountOfRecords:v4];

  if (v5)
  {
    unint64_t v6 = -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[PQLFormatInjection formatInjection:]( &OBJC_CLASS___PQLFormatInjection,  "formatInjection:",  @"batch_marker >= %lu",  v6));
    id v9 = [v3 table:v7 countOfRecordsMatchingQuery:v8];

    unsigned __int8 v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu changes to pop (%lu batches) - %lu total changes",  v9,  -[CPLPrequeliteChangePipe countOfQueuedBatches](self, "countOfQueuedBatches"),  v5));
  }

  else
  {
    unsigned __int8 v10 = @"0 changes";
  }

  return v10;
}

- (id)statusPerScopeIndex
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pqlConnection]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v6 = [v4 cplFetch:@"SELECT scopeIndex, count(scopeIndex) FROM %@ WHERE batch_marker >= %lu GROUP BY scopeIndex", v5, -[CPLPrequeliteChangePipe _pullMarker](self, "_pullMarker")];

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ([v6 next])
  {
    do
    {
      id v8 = [v6 integerAtIndex:0];
      id v9 = -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"%lu changes to pop",  [v6 unsignedIntegerAtIndex:1]);
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, v10);
    }

    while (([v6 next] & 1) != 0);
  }

  return v7;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  LOBYTE(a4) = [v12 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if ((a4 & 1) != 0)
  {
    id v14 = [v12 changes];
    *a5 = (int64_t)v14;
    if (v14) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = -[CPLPrequeliteChangePipe _resetPushAndPullMarkersIfEmptyWithError:]( self,  "_resetPushAndPullMarkersIfEmptyWithError:",  a6);
    }
  }

  else
  {
    BOOL v15 = 0;
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue([v12 lastError]);
    }
  }

  return v15;
}

- (BOOL)_deleteAllChangesWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
  int64_t v8 = -[CPLPrequeliteStorage localScopeIndexForScopeIdentifier:](self, "localScopeIndexForScopeIdentifier:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopedIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopedIdentifier:",  v6));
    unsigned __int8 v10 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned __int8 v10 = [v12 cplExecute:@"DELETE FROM %@ WHERE identifier = %@ AND scopeIndex = %ld", v13, v14, v8];

  if ((v10 & 1) != 0) {
    id v9 = 0LL;
  }
  else {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 lastError]);
  }

  if (a4)
  {
LABEL_8:
    if ((v10 & 1) == 0) {
      *a4 = v9;
    }
  }

- (void).cxx_destruct
{
}

@end