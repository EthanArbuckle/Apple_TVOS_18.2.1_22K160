@interface CPLCloudKitFetchExistingSharedScopeTask
- (CPLCloudKitFetchExistingSharedScopeTask)initWithController:(id)a3 completionHandler:(id)a4;
- (void)_validateLastZoneIDInArray:(id)a3 currentUserID:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitFetchExistingSharedScopeTask

- (CPLCloudKitFetchExistingSharedScopeTask)initWithController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLCloudKitFetchExistingSharedScopeTask;
  v7 = -[CPLCloudKitTransportTask initWithController:](&v11, "initWithController:", a3);
  if (v7)
  {
    id v8 = [v6 copy];
    id completionHandler = v7->_completionHandler;
    v7->_id completionHandler = v8;
  }

  return v7;
}

- (void)_validateLastZoneIDInArray:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v35 = 0LL;
  unsigned __int8 v8 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v35);
  id v9 = v35;
  if ((v8 & 1) != 0)
  {
    if ([v6 count])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 lastObject]);
      [v6 removeLastObject];
      if (!_CPLSilentLogging)
      {
        id v11 = sub_1000B3D6C();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cpl_zoneName"));
          *(_DWORD *)buf = 138543362;
          v37 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Checking if %{public}@ is a valid shared zone",  buf,  0xCu);
        }
      }

      v14 = -[CPLCloudKitScope initWithZoneID:](objc_alloc(&OBJC_CLASS___CPLCloudKitScope), "initWithZoneID:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
      v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 recordsToFetchToIdentifyCloudKitScope:v14 proposedScopeType:0 currentUserID:v7]);
      if ([v16 count])
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_1000B4D58;
        v29[3] = &unk_100242978;
        v29[4] = self;
        id v30 = v15;
        v17 = (id *)&v31;
        v18 = v10;
        v19 = v14;
        v31 = v19;
        id v32 = v7;
        id v33 = v18;
        id v34 = v6;
        v20 = v19;
        v10 = v18;
        v21 = &v30;
        -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:inScope:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:inScope:completionHandler:",  v16,  1LL,  v20,  v29);
      }

      else
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_1000B51A8;
        v26[3] = &unk_10023DE80;
        v26[4] = self;
        v21 = &v27;
        id v27 = v6;
        v17 = &v28;
        id v28 = v7;
        -[CPLCloudKitTransportTask dispatchAsync:](self, "dispatchAsync:", v26);
      }
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v22 = sub_1000B3D6C();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "No more candidate for a shared zone",  buf,  2u);
        }
      }

      id completionHandler = self->_completionHandler;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  39LL,  @"No Shared Zone available"));
      (*((void (**)(id, void, void, void, void *))completionHandler + 2))( completionHandler,  0LL,  0LL,  0LL,  v25);
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  id v6 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v6);
  id v4 = v6;
  if ((v3 & 1) != 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000B526C;
    v5[3] = &unk_10023FB58;
    v5[4] = self;
    -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v5);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void).cxx_destruct
{
}

@end