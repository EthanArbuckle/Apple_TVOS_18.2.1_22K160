@interface CPLCloudKitGetCurrentSyncAnchorTask
- (CPLCloudKitGetCurrentSyncAnchorTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 previousScopeChange:(id)a6 completionHandler:(id)a7;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (CPLScopeChange)previousScopeChange;
- (void)_fetchLibraryInfoAndStateWithCurrentSyncAnchor:(id)a3;
- (void)_fetchLibraryInfoAndStateWithCurrentSyncAnchor:(id)a3 currentUserID:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitGetCurrentSyncAnchorTask

- (CPLCloudKitGetCurrentSyncAnchorTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 previousScopeChange:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CPLCloudKitGetCurrentSyncAnchorTask;
  v17 = -[CPLCloudKitTransportTask initWithController:](&v21, "initWithController:", a3);
  if (v17)
  {
    id v18 = [v16 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v18;

    objc_storeStrong((id *)&v17->_cloudKitScope, a4);
    objc_storeStrong((id *)&v17->_scope, a5);
    objc_storeStrong((id *)&v17->_previousScopeChange, a6);
  }

  return v17;
}

- (void)_fetchLibraryInfoAndStateWithCurrentSyncAnchor:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000B4314;
  v4[3] = &unk_10023F750;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( v5,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v4);
}

- (void)_fetchLibraryInfoAndStateWithCurrentSyncAnchor:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneIdentificationForCloudKitScope:self->_cloudKitScope engineScope:self->_scope]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordsToFetchForScopeInfoWithCurrentUserID:v7]);
  if ([v10 count])
  {
    cloudKitScope = self->_cloudKitScope;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000B44A4;
    v12[3] = &unk_100242900;
    v12[4] = self;
    id v13 = v9;
    id v14 = v7;
    id v15 = v6;
    -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:inScope:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:inScope:completionHandler:",  v10,  1LL,  cloudKitScope,  v12);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  id v10 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v10);
  id v4 = v10;
  if ((v3 & 1) != 0)
  {
    if (-[CPLEngineScope scopeType](self->_scope, "scopeType"))
    {
      cloudKitScope = self->_cloudKitScope;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000B46B0;
      v9[3] = &unk_100242928;
      v9[4] = self;
      -[CPLCloudKitTransportTask fetchZoneForScope:completionHandler:]( self,  "fetchZoneForScope:completionHandler:",  cloudKitScope,  v9);
    }

    else
    {
      id completionHandler = self->_completionHandler;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v7));
      (*((void (**)(id, void, void, void, void *))completionHandler + 2))( completionHandler,  0LL,  0LL,  0LL,  v8);
    }
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