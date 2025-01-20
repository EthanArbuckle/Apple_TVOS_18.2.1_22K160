@interface CPLCloudKitFixUpSparseRecordTask
- (CPLCloudKitFixUpSparseRecordTask)initWithController:(id)a3 tasks:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (NSArray)tasks;
- (id)completionHandler;
- (void)_fetchSparseRecordsWithCompletionHandler:(id)a3;
- (void)_updateSparseRecords:(id)a3 currentUserRecordID:(id)a4 completionHandler:(id)a5;
- (void)runOperations;
@end

@implementation CPLCloudKitFixUpSparseRecordTask

- (CPLCloudKitFixUpSparseRecordTask)initWithController:(id)a3 tasks:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CPLCloudKitFixUpSparseRecordTask;
  v14 = -[CPLCloudKitTransportTask initWithController:](&v19, "initWithController:", a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_tasks, a4);
    id v16 = [v13 copy];
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = v16;

    -[CPLCloudKitTransportTask setTransportScopeMapping:](v15, "setTransportScopeMapping:", v12);
  }

  return v15;
}

- (void)_fetchSparseRecordsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self->_tasks, "count"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v6 = self->_tasks;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) privateCloudScopedIdentifier]);
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v8);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100078774;
  v13[3] = &unk_1002411E0;
  id v14 = v4;
  id v12 = v4;
  -[CPLCloudKitTransportTask fetchRecordWithScopedIdentifiers:completionHandler:]( self,  "fetchRecordWithScopedIdentifiers:completionHandler:",  v5,  v13);
}

- (void)_updateSparseRecords:(id)a3 currentUserRecordID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v71 = a4;
  v10 = (void (**)(id, id))a5;
  id v82 = 0LL;
  LOBYTE(a5) = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v82);
  id v11 = v82;
  id v12 = v11;
  if ((a5 & 1) == 0)
  {
    v10[2](v10, v11);
    goto LABEL_48;
  }

  SEL v65 = a2;
  id v66 = v11;
  v67 = v10;
  v69 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self->_tasks, "count"));
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  uint64_t v64 = 34LL;
  obj = self->_tasks;
  id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v78,  v91,  16LL);
  id v14 = self;
  if (!v13) {
    goto LABEL_41;
  }
  id v15 = v13;
  uint64_t v16 = *(void *)v79;
  id v68 = v9;
  v70 = self;
  do
  {
    for (i = 0LL; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v79 != v16) {
        objc_enumerationMutation(obj);
      }
      __int128 v18 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)i);
      objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "privateCloudScopedIdentifier", v64 * 8));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v19]);

      if (!v20)
      {
        if (_CPLSilentLogging) {
          goto LABEL_39;
        }
        id v28 = sub_100078FF0();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v18 privateCloudScopedIdentifier]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v18 sharedCloudScopedIdentifier]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v18 realCloudScopedIdentifier]);
          *(_DWORD *)buf = 138412802;
          v84 = v23;
          __int16 v85 = 2112;
          v86 = v24;
          __int16 v87 = 2112;
          v88 = v25;
          v26 = v22;
          v27 = "Sparse record %@ can't be found anymore. No need to fix-up its sharing record scoped identifier (%@ -> %@)";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0x20u);
        }

- (void)runOperations
{
  if (-[NSArray count](self->_tasks, "count"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100079344;
    v3[3] = &unk_10023FB58;
    v3[4] = self;
    -[CPLCloudKitTransportTask fetchUserRecordIDFetchWithCompletionHandler:]( self,  "fetchUserRecordIDFetchWithCompletionHandler:",  v3);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }

- (NSArray)tasks
{
  return self->_tasks;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end