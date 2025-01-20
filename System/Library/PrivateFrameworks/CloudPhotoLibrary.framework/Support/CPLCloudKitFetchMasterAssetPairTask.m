@interface CPLCloudKitFetchMasterAssetPairTask
- (CPLCloudKitFetchMasterAssetPairTask)initWithController:(id)a3 scopedIdentifier:(id)a4 cloudKitScope:(id)a5 resourcesFolderURL:(id)a6 completionHandler:(id)a7;
- (CPLCloudKitScope)cloudKitScope;
- (CPLScopedIdentifier)scopedIdentifier;
- (NSURL)resourcesFolderURL;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)completionHandler;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (void)_fetchRecordWithIdentifier:(id)a3 expectedClass:(Class)a4 currentUserRecordID:(id)a5 completionHandler:(id)a6;
- (void)runOperations;
@end

@implementation CPLCloudKitFetchMasterAssetPairTask

- (CPLCloudKitFetchMasterAssetPairTask)initWithController:(id)a3 scopedIdentifier:(id)a4 cloudKitScope:(id)a5 resourcesFolderURL:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CPLCloudKitFetchMasterAssetPairTask;
  v17 = -[CPLCloudKitTransportTask initWithController:](&v24, "initWithController:", a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_scopedIdentifier, a4);
    objc_storeStrong((id *)&v18->_cloudKitScope, a5);
    v19 = (NSURL *)[v15 copy];
    resourcesFolderURL = v18->_resourcesFolderURL;
    v18->_resourcesFolderURL = v19;

    id v21 = [v16 copy];
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v21;
  }

  return v18;
}

- (void)_fetchRecordWithIdentifier:(id)a3 expectedClass:(Class)a4 currentUserRecordID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope recordIDWithRecordName:](self->_cloudKitScope, "recordIDWithRecordName:", v10));
  v27 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFetchMasterAssetPairTask cloudKitScope](self, "cloudKitScope"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100047870;
  v20[3] = &unk_10023FD38;
  id v25 = v12;
  Class v26 = a4;
  id v21 = v13;
  id v22 = v10;
  v23 = self;
  id v24 = v11;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  id v19 = v12;
  -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:inScope:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:inScope:completionHandler:",  v14,  1LL,  v15,  v20);
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100047F2C;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v2);
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFetchMasterAssetPairTask scopedIdentifier](self, "scopedIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scopeIdentifier]);
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7) {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFetchMasterAssetPairTask cloudKitScope](self, "cloudKitScope"));
  }
  else {
    v8 = 0LL;
  }
  return v8;
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFetchMasterAssetPairTask cloudKitScope](self, "cloudKitScope"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFetchMasterAssetPairTask scopedIdentifier](self, "scopedIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___CPLCloudKitFetchMasterAssetPairTask;
    id v10 = -[CPLCloudKitTransportTask scopeIdentifierFromZoneID:](&v12, "scopeIdentifierFromZoneID:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v9;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFetchMasterAssetPairTask cloudKitScope](self, "cloudKitScope"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  unsigned int v8 = [v5 isEqual:v7];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitFetchMasterAssetPairTask scopedIdentifier](self, "scopedIdentifier"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cpl_scopedIdentifierWithScopeIdentifier:", v10));
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (NSURL)resourcesFolderURL
{
  return self->_resourcesFolderURL;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end