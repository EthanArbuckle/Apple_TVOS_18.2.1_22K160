@interface CPLPrequeliteFlattentPipelineMigrator
- (BOOL)_discardResourceForUpload:(id)a3;
- (BOOL)_enqueueResourcesForChange:(id)a3 inOutgoingResourcesWithUploadIdentifier:(id)a4;
- (BOOL)_migratePushQueue:(id)a3;
- (BOOL)migrate;
- (CPLPrequeliteFlattentPipelineMigrator)initWithStore:(id)a3;
- (CPLPrequeliteStore)store;
- (NSError)lastError;
- (unint64_t)_availabilityOfResource:(id)a3;
- (void)_setLastError:(id)a3;
@end

@implementation CPLPrequeliteFlattentPipelineMigrator

- (CPLPrequeliteFlattentPipelineMigrator)initWithStore:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CPLPrequeliteFlattentPipelineMigrator;
  v6 = -[CPLPrequeliteFlattentPipelineMigrator init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore abstractObject](v7->_store, "abstractObject"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 clientCache]);
    clientCache = v7->_clientCache;
    v7->_clientCache = (CPLPrequeliteClientCache *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 pushRepository]);
    pushRepository = v7->_pushRepository;
    v7->_pushRepository = (CPLEnginePushRepository *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 outgoingResources]);
    outgoingResources = v7->_outgoingResources;
    v7->_outgoingResources = (CPLEngineOutgoingResources *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v8 resourceStorage]);
    resources = v7->_resources;
    v7->_resources = (CPLEngineResourceStorage *)v15;

    v17 = objc_alloc(&OBJC_CLASS___CPLPrequeliteResourceUploadQueue);
    store = v7->_store;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteTable tableWithName:]( &OBJC_CLASS___CPLPrequeliteTable,  "tableWithName:",  @"uploadQueue"));
    v20 = -[CPLPrequeliteResourceUploadQueue initWithStore:table:](v17, "initWithStore:table:", store, v19);
    uploadQueue = v7->_uploadQueue;
    v7->_uploadQueue = v20;
  }

  return v7;
}

- (void)_setLastError:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_lastError, a3);
    id v5 = v6;
  }
}

- (NSError)lastError
{
  lastError = self->_lastError;
  if (lastError)
  {
    v3 = lastError;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore pqlConnection](self->_store, "pqlConnection"));
    v3 = (NSError *)objc_claimAutoreleasedReturnValue([v4 lastError]);
  }

  return v3;
}

- (unint64_t)_availabilityOfResource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteResourceUploadQueue queuedResourceForResource:pendingCount:]( self->_uploadQueue,  "queuedResourceForResource:pendingCount:",  v4,  v21));
  id v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identity]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identity]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 fingerPrint]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 fingerPrint]);
    unint64_t v11 = (unint64_t)v10;
    if (v9) {
      BOOL v12 = v10 == 0LL;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {

      if (v9 | v11) {
        goto LABEL_14;
      }
    }

    else
    {
      unsigned __int8 v14 = [(id)v9 isEqual:v10];

      if ((v14 & 1) == 0) {
        goto LABEL_14;
      }
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 fileUTI]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 fileUTI]);
    unint64_t v17 = (unint64_t)v16;
    if (v15 && v16)
    {
      unsigned __int8 v18 = [(id)v15 isEqual:v16];

      if ((v18 & 1) == 0)
      {
LABEL_14:
        unint64_t v13 = 3LL;
LABEL_15:

        goto LABEL_16;
      }
    }

    else
    {

      if (v15 | v17) {
        goto LABEL_14;
      }
    }

    if ([v7 isAvailable])
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v7 fileURL]);

      unint64_t v13 = v20 != 0LL;
    }

    else
    {
      unint64_t v13 = 2LL;
    }

    goto LABEL_15;
  }

  unint64_t v13 = 3LL;
LABEL_16:

  return v13;
}

- (BOOL)_enqueueResourcesForChange:(id)a3 inOutgoingResourcesWithUploadIdentifier:(id)a4
{
  id v30 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 resources]);
  v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v36;
  while (2)
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(obj);
      }
      BOOL v12 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
      if (!-[CPLPrequeliteFlattentPipelineMigrator _availabilityOfResource:](self, "_availabilityOfResource:", v12))
      {
        resources = self->_resources;
        id v34 = 0LL;
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineResourceStorage retainFileURLForResource:error:]( resources,  "retainFileURLForResource:error:",  v12,  &v34));
        id v15 = v34;
        v16 = v15;
        if (v14)
        {
          unint64_t v17 = v7;
          unsigned __int8 v18 = self->_resources;
          id v33 = v16;
          unsigned __int8 v19 = -[CPLEngineResourceStorage releaseFileURL:forResource:error:]( v18,  "releaseFileURL:forResource:error:",  v14,  v12,  &v33);
          id v20 = v33;

          if ((v19 & 1) != 0)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue([v12 identity]);
            [v21 setFileURL:v14];

            v7 = v17;
            -[NSMutableArray addObject:](v17, "addObject:", v12);

            continue;
          }

          -[CPLPrequeliteFlattentPipelineMigrator _setLastError:](self, "_setLastError:", v20);
          v28 = (void *)objc_claimAutoreleasedReturnValue([v12 identity]);
          [v28 setFileURL:v14];

          v7 = v17;
          -[NSMutableArray addObject:](v17, "addObject:", v12);

          v16 = v20;
          objc_super v23 = v30;
        }

        else
        {
          objc_super v23 = v30;
          if (!_CPLSilentLogging)
          {
            uint64_t v26 = __CPLGenericOSLogDomain(v15);
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v40 = v12;
              __int16 v41 = 2112;
              v42 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to find resource %@ in cache: %@",  buf,  0x16u);
            }
          }

          -[CPLPrequeliteFlattentPipelineMigrator _setLastError:](self, "_setLastError:", v16);
        }

        unsigned __int8 v24 = 0;
        id v25 = obj;
        goto LABEL_22;
      }
    }

    id v9 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v9) {
      continue;
    }
    break;
  }

- (BOOL)_discardResourceForUpload:(id)a3
{
  id v4 = a3;
  uploadQueue = self->_uploadQueue;
  id v16 = 0LL;
  unsigned int v6 = -[CPLPrequeliteResourceUploadQueue discardResource:discardedResource:error:]( uploadQueue,  "discardResource:discardedResource:error:",  v4,  &v16,  0LL);
  id v7 = v16;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v7 identity]);
    if ([v10 isAvailable])
    {
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fileURL]);

      if (v12)
      {
        LOBYTE(v6) = 1;
        goto LABEL_10;
      }

      ++self->_countOfDroppedResources;
      resources = self->_resources;
      id v15 = 0LL;
      LOBYTE(v6) = -[CPLEngineResourceStorage dropResourceForUpload:error:]( resources,  "dropResourceForUpload:error:",  v4,  &v15);
      id v10 = v15;
      if ((v6 & 1) == 0) {
        -[CPLPrequeliteFlattentPipelineMigrator _setLastError:](self, "_setLastError:", v10);
      }
    }

    else
    {
      LOBYTE(v6) = 1;
    }
  }

- (BOOL)_migratePushQueue:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  unsigned __int8 v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 1;
  if ([v4 hasChanges])
  {
    uint64_t v9 = 0LL;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000LL;
    char v12 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100176360;
    v8[3] = &unk_100247BC0;
    v8[5] = &v9;
    v8[6] = &v13;
    v8[4] = self;
    [v4 enumerateChangesWithBlock:v8];
    if (*((_BYTE *)v14 + 24) && *((_BYTE *)v10 + 24))
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1001765A8;
      v7[3] = &unk_100247BE8;
      v7[4] = self;
      v7[5] = &v13;
      [v4 enumerateChangesWithBlock:v7];
    }

    _Block_object_dispose(&v9, 8);
  }

  char v5 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (BOOL)migrate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore pqlConnection](self->_store, "pqlConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteTable tableWithName:]( &OBJC_CLASS___CPLPrequeliteTable,  "tableWithName:",  @"deletePushQueue"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteTable tableWithName:]( &OBJC_CLASS___CPLPrequeliteTable,  "tableWithName:",  @"pushQueue"));
  unsigned int v6 = -[CPLPrequeliteChangePipeEnumerator initWithStore:table:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteChangePipeEnumerator),  "initWithStore:table:",  self->_store,  v4);
  if (!-[CPLPrequeliteFlattentPipelineMigrator _migratePushQueue:](self, "_migratePushQueue:", v6))
  {
    id v7 = v6;
    goto LABEL_6;
  }

  id v7 = -[CPLPrequeliteChangePipeEnumerator initWithStore:table:]( objc_alloc(&OBJC_CLASS___CPLPrequeliteChangePipeEnumerator),  "initWithStore:table:",  self->_store,  v5);

  if (!-[CPLPrequeliteFlattentPipelineMigrator _migratePushQueue:](self, "_migratePushQueue:", v7))
  {
LABEL_6:
    store = self->_store;
    unint64_t countOfMigratedChanges = self->_countOfMigratedChanges;
    char v12 = (void *)objc_claimAutoreleasedReturnValue([v3 lastCPLError]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedDescription]);
    -[CPLPrequeliteStore recordUpgradeEvent:]( store,  "recordUpgradeEvent:",  @"failed to migrate %lu changes to flat pipeline: %@",  countOfMigratedChanges,  v13);

    BOOL v14 = 0;
    goto LABEL_9;
  }

  unint64_t v8 = self->_countOfMigratedChanges;
  uint64_t v9 = self->_store;
  if (v8) {
    -[CPLPrequeliteStore recordUpgradeEvent:]( v9,  "recordUpgradeEvent:",  @"succesfully migrated %lu changes to flat pipeline (dropped resources: %lu but re-enqueued %lu).",  v8,  self->_countOfDroppedResources,  self->_countOfOutgoingResources);
  }
  else {
    -[CPLPrequeliteStore recordUpgradeEvent:]( v9,  "recordUpgradeEvent:",  @"succesfully migrated empty push pipeline to flat pipeline.",  v17,  v18,  v19);
  }
  BOOL v14 = 1;
LABEL_9:
  [v3 cplExecute:@"DROP TABLE IF EXISTS %@", v4];
  [v3 cplExecute:@"DROP TABLE IF EXISTS %@", v5];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteResourceUploadQueue table](self->_uploadQueue, "table"));
  [v3 cplExecute:@"DROP TABLE IF EXISTS %@", v15];

  return v14;
}

- (CPLPrequeliteStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

@end