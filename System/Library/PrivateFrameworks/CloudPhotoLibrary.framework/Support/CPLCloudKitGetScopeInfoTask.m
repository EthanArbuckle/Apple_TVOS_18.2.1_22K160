@interface CPLCloudKitGetScopeInfoTask
- (CPLCloudKitGetScopeInfoTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 previousScopeChange:(id)a6 completionHandler:(id)a7;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (CPLScopeChange)previousScopeChange;
- (void)_determineScopeTypeAndFetchLibraryInfoWithCurrentUserID:(id)a3;
- (void)getScopeInfoWithCurrentUserID:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitGetScopeInfoTask

- (CPLCloudKitGetScopeInfoTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 previousScopeChange:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CPLCloudKitGetScopeInfoTask;
  v17 = -[CPLCloudKitTransportTask initWithController:](&v21, "initWithController:", a3);
  if (v17)
  {
    id v18 = [v16 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v18;

    objc_storeStrong((id *)&v17->_cloudKitScope, a4);
    v17->_originalScopeType = (int64_t)[v14 scopeType];
    objc_storeStrong((id *)&v17->_scope, a5);
    objc_storeStrong((id *)&v17->_previousScopeChange, a6);
  }

  return v17;
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000B350C;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v2);
}

- (void)getScopeInfoWithCurrentUserID:(id)a3
{
  id v4 = a3;
  id v20 = 0LL;
  unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v20);
  id v6 = v20;
  if ((v5 & 1) != 0)
  {
    cloudKitScope = self->_cloudKitScope;
    if (cloudKitScope
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zone](cloudKitScope, "zone")),
          v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]),
          v9,
          v8,
          v9))
    {
      v18[0] = 0LL;
      v18[1] = v18;
      v18[2] = 0x3032000000LL;
      v18[3] = sub_1000B376C;
      v18[4] = sub_1000B377C;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
      id v19 = (id)objc_claimAutoreleasedReturnValue( [v10 zoneIdentificationForCloudKitScope:self->_cloudKitScope engineScope:self->_scope]);

      v11 = self->_cloudKitScope;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000B3784;
      v15[3] = &unk_1002428B0;
      v15[4] = self;
      v17 = v18;
      id v16 = v4;
      -[CPLCloudKitTransportTask fetchZoneForScope:completionHandler:]( self,  "fetchZoneForScope:completionHandler:",  v11,  v15);

      _Block_object_dispose(v18, 8);
    }

    else
    {
      id completionHandler = self->_completionHandler;
      int64_t originalScopeType = self->_originalScopeType;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  32LL,  @"No CloudKit scope for %@",  self->_scope));
      (*((void (**)(id, int64_t, void, void, void, void *))completionHandler + 2))( completionHandler,  originalScopeType,  0LL,  0LL,  0LL,  v14);
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)_determineScopeTypeAndFetchLibraryInfoWithCurrentUserID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 recordsToFetchToIdentifyCloudKitScope:self->_cloudKitScope proposedScopeType:self->_originalScopeType currentUserID:v4]);
  if ([v6 count])
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_1000B3D6C();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
        cloudKitScope = self->_cloudKitScope;
        *(_DWORD *)buf = 138543874;
        id v16 = v9;
        __int16 v17 = 2114;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = cloudKitScope;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Trying to determine scope type for %{public}@. Fetching %{public}@ in %@",  buf,  0x20u);
      }
    }

    v11 = self->_cloudKitScope;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000B3DAC;
    v12[3] = &unk_1002428D8;
    v12[4] = self;
    id v13 = v5;
    id v14 = v4;
    -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:inScope:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:inScope:completionHandler:",  v6,  1LL,  v11,  v12);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLScopeChange)previousScopeChange
{
  return self->_previousScopeChange;
}

- (void).cxx_destruct
{
}

@end