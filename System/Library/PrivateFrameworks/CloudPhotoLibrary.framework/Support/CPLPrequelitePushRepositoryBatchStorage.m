@interface CPLPrequelitePushRepositoryBatchStorage
- (BOOL)checkOutWithError:(id *)a3;
- (BOOL)hasChangesInScopeWithIdentifier:(id)a3;
- (BOOL)removeChange:(id)a3 error:(id *)a4;
- (CPLPrequelitePushRepository)pushRepository;
- (CPLPrequelitePushRepositoryBatchStorage)initWithPushRepository:(id)a3 priority:(unint64_t)a4;
- (CPLPrequeliteTable)enumerationTable;
- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5;
- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5;
- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4;
- (id)allChangesWithScopeIdentifier:(id)a3;
- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4;
- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3;
- (unint64_t)priority;
@end

@implementation CPLPrequelitePushRepositoryBatchStorage

- (CPLPrequelitePushRepositoryBatchStorage)initWithPushRepository:(id)a3 priority:(unint64_t)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CPLPrequelitePushRepositoryBatchStorage;
  v7 = -[CPLPrequelitePushRepositoryBatchStorage init](&v22, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_pushRepository, v6);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 mainTable]);
    pushRepositoryTable = v8->_pushRepositoryTable;
    v8->_pushRepositoryTable = (CPLPrequeliteTable *)v9;

    v8->_priority = a4;
    if (a4 == -1LL)
    {
      v16 = v8->_pushRepositoryTable;
      enumerationTable = v8->_enumerationTable;
      v8->_enumerationTable = v16;
    }

    else
    {
      v11 = objc_alloc(&OBJC_CLASS___NSString);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteTable tableName](v8->_pushRepositoryTable, "tableName"));
      enumerationTable = -[NSString initWithFormat:](v11, "initWithFormat:", @"%@_%lu", v12, a4);

      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[CPLPrequeliteTable tableWithName:](&OBJC_CLASS___CPLPrequeliteTable, "tableWithName:", enumerationTable));
      v15 = v8->_enumerationTable;
      v8->_enumerationTable = (CPLPrequeliteTable *)v14;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 abstractObject]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 engineStore]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 outgoingResources]);
    outgoingResources = v8->_outgoingResources;
    v8->_outgoingResources = (CPLEngineOutgoingResources *)v19;
  }

  return v8;
}

- (BOOL)checkOutWithError:(id *)a3
{
  if (self->_viewIsCreated)
  {
    id v3 = 0LL;
    unsigned __int8 v4 = 1;
  }

  else if (self->_pushRepositoryTable == self->_enumerationTable)
  {
    id v3 = 0LL;
    unsigned __int8 v4 = 1;
    self->_viewIsCreated = 1;
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pushRepository);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pqStore]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

    if (!_CPLSilentLogging)
    {
      id v11 = sub_10017CB04();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteTable tableName](self->_enumerationTable, "tableName"));
        id v14 = objc_loadWeakRetained((id *)&self->_pushRepository);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mainTable]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 tableName]);
        unint64_t priority = self->_priority;
        *(_DWORD *)buf = 138543874;
        v24 = v13;
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2048;
        unint64_t v28 = priority;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Creating view %{public}@ for %@ with priority %lu",  buf,  0x20u);
      }
    }

    v18 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"unint64_t priority = %lu",  self->_priority);
    uint64_t v19 = objc_alloc(&OBJC_CLASS___PQLRawInjection);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](v18, "dataUsingEncoding:", 4LL));
    v21 = -[PQLRawInjection initWithData:](v19, "initWithData:", v20);

    unsigned __int8 v4 = [v10 cplExecute:@"CREATE TEMP VIEW %@ AS SELECT rowid, class, scopeIndex, identifier, changeType, relatedIdentifier, secondaryIdentifier, dequeueOrder, trashed, uploadIdentifier, flags, priority, trustLevel, serializedRecord FROM %@ WHERE %@", self->_enumerationTable, self->_pushRepositoryTable, v21];
    if ((v4 & 1) != 0) {
      id v3 = 0LL;
    }
    else {
      id v3 = (id)objc_claimAutoreleasedReturnValue([v10 lastError]);
    }

    self->_viewIsCreated = v4;
    if (a3) {
      char v22 = v4;
    }
    else {
      char v22 = 1;
    }
    if ((v22 & 1) == 0)
    {
      id v3 = v3;
      unsigned __int8 v4 = 0;
      *a3 = v3;
    }
  }

  return v4;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5
{
  BOOL v5 = a5;
  p_pushRepository = &self->_pushRepository;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained allChangesWithClass:a3 scopeIdentifier:v9 trashed:v5 table:self->_enumerationTable]);

  return v11;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5
{
  p_pushRepository = &self->_pushRepository;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained allChangesWithClass:a3 scopeIdentifier:v9 changeType:a5 table:self->_enumerationTable]);

  return v11;
}

- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  p_pushRepository = &self->_pushRepository;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained allNonDeletedChangesWithClass:a3 scopeIdentifier:v7 table:self->_enumerationTable]);

  return v9;
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  p_pushRepository = &self->_pushRepository;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained allChangesWithClass:a3 relatedScopedIdentifier:v7 table:self->_pushRepositoryTable]);

  return v9;
}

- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4
{
  p_pushRepository = &self->_pushRepository;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained allChangesWithClass:a3 secondaryScopedIdentifier:v7 table:self->_pushRepositoryTable]);

  return v9;
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  p_pushRepository = &self->_pushRepository;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained allChangesWithScopeIdentifier:v5 table:self->_enumerationTable]);

  return v7;
}

- (BOOL)removeChange:(id)a3 error:(id *)a4
{
  p_pushRepository = &self->_pushRepository;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 scopedIdentifier]);

  LOBYTE(a4) = [WeakRetained deleteChangeWithScopedIdentifier:v8 error:a4];
  return (char)a4;
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v3 = self;
  p_pushRepository = &self->_pushRepository;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_pushRepository);
  LOBYTE(v3) = [WeakRetained hasChangesInScopeWithIdentifier:v5 table:v3->_enumerationTable];

  return (char)v3;
}

- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3
{
  return (unint64_t)-[CPLEngineOutgoingResources availableResourceSizeForUploadIdentifier:]( self->_outgoingResources,  "availableResourceSizeForUploadIdentifier:",  a3);
}

- (CPLPrequelitePushRepository)pushRepository
{
  return (CPLPrequelitePushRepository *)objc_loadWeakRetained((id *)&self->_pushRepository);
}

- (CPLPrequeliteTable)enumerationTable
{
  return self->_enumerationTable;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
}

@end