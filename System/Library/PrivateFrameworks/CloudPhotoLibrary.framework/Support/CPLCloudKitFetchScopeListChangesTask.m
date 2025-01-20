@interface CPLCloudKitFetchScopeListChangesTask
+ (id)descriptionForScopeListSyncAnchor:(id)a3;
- (CPLCloudKitFetchScopeListChangesTask)initWithController:(id)a3 scopeListSyncAnchor:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)_launchOperationForSharedDatabase:(BOOL)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitFetchScopeListChangesTask

+ (id)descriptionForScopeListSyncAnchor:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScopeListSyncAnchor cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:]( &OBJC_CLASS___CPLCloudKitScopeListSyncAnchor,  "cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);

  return v4;
}

- (CPLCloudKitFetchScopeListChangesTask)initWithController:(id)a3 scopeListSyncAnchor:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CPLCloudKitFetchScopeListChangesTask;
  v13 = -[CPLCloudKitTransportTask initWithController:](&v21, "initWithController:", a3);
  if (v13)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[CPLCloudKitScopeListSyncAnchor cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:]( &OBJC_CLASS___CPLCloudKitScopeListSyncAnchor,  "cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:",  v10));
    ckScopeListSyncAnchor = v13->_ckScopeListSyncAnchor;
    v13->_ckScopeListSyncAnchor = (CPLCloudKitScopeListSyncAnchor *)v14;

    id v16 = objc_retainBlock(v11);
    id progressHandler = v13->_progressHandler;
    v13->_id progressHandler = v16;

    id v18 = objc_retainBlock(v12);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v18;
  }

  return v13;
}

- (void)runOperations
{
}

- (void)_launchOperationForSharedDatabase:(BOOL)a3
{
  BOOL v3 = a3;
  id v38 = 0LL;
  unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v38);
  id v6 = v38;
  if ((v5 & 1) != 0)
  {
    ckScopeListSyncAnchor = self->_ckScopeListSyncAnchor;
    if (v3) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitScopeListSyncAnchor sharedChangeToken](ckScopeListSyncAnchor, "sharedChangeToken"));
    }
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitScopeListSyncAnchor privateChangeToken](ckScopeListSyncAnchor, "privateChangeToken"));
    }
    v9 = (void *)v8;
    id v10 = -[CKFetchDatabaseChangesOperation initWithPreviousServerChangeToken:]( objc_alloc(&OBJC_CLASS___CKFetchDatabaseChangesOperation),  "initWithPreviousServerChangeToken:",  v8);
    -[CKFetchDatabaseChangesOperation setFetchAllChanges:](v10, "setFetchAllChanges:", 1LL);
    v36[0] = 0LL;
    v36[1] = v36;
    v36[2] = 0x3032000000LL;
    v36[3] = sub_1000B5A7C;
    v36[4] = sub_1000B5A8C;
    v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v34[0] = 0LL;
    v34[1] = v34;
    v34[2] = 0x3032000000LL;
    v34[3] = sub_1000B5A7C;
    v34[4] = sub_1000B5A8C;
    v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000B5A94;
    v29[3] = &unk_1002429E8;
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    id v30 = v11;
    v31 = self;
    BOOL v33 = v3;
    v32 = v36;
    -[CKFetchDatabaseChangesOperation setRecordZoneWithIDChangedBlock:](v10, "setRecordZoneWithIDChangedBlock:", v29);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000B5D04;
    v25[3] = &unk_100242A10;
    id v12 = v11;
    id v26 = v12;
    v27 = self;
    v28 = v34;
    -[CKFetchDatabaseChangesOperation setRecordZoneWithIDWasDeletedBlock:]( v10,  "setRecordZoneWithIDWasDeletedBlock:",  v25);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000B5E90;
    v23[3] = &unk_100242A38;
    BOOL v24 = v3;
    v23[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000B5F30;
    v19[3] = &unk_100242A60;
    v19[4] = self;
    v13 = objc_retainBlock(v23);
    id v20 = v13;
    objc_super v21 = v36;
    v22 = v34;
    -[CKFetchDatabaseChangesOperation setChangeTokenUpdatedBlock:](v10, "setChangeTokenUpdatedBlock:", v19);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000B603C;
    v16[3] = &unk_100242A88;
    v16[4] = self;
    BOOL v18 = v3;
    uint64_t v14 = v13;
    id v17 = v14;
    -[CKFetchDatabaseChangesOperation setFetchDatabaseChangesCompletionBlock:]( v10,  "setFetchDatabaseChangesCompletionBlock:",  v16);
    if (v3) {
      uint64_t v15 = 2LL;
    }
    else {
      uint64_t v15 = 1LL;
    }
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v10,  v15,  0LL);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v36, 8);
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