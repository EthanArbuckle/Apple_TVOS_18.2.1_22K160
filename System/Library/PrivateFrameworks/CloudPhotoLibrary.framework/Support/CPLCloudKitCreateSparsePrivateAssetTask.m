@interface CPLCloudKitCreateSparsePrivateAssetTask
- (CPLCloudKitCreateSparsePrivateAssetTask)initWithController:(id)a3 scope:(id)a4 sharedScope:(id)a5 transportScopeMapping:(id)a6 privateScopedIdentifier:(id)a7 sharedScopedIdentifier:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)scope;
- (CPLEngineScope)sharedScope;
- (CPLScopedIdentifier)privateScopedIdentifier;
- (CPLScopedIdentifier)sharedScopedIdentifier;
- (void)runOperations;
@end

@implementation CPLCloudKitCreateSparsePrivateAssetTask

- (CPLCloudKitCreateSparsePrivateAssetTask)initWithController:(id)a3 scope:(id)a4 sharedScope:(id)a5 transportScopeMapping:(id)a6 privateScopedIdentifier:(id)a7 sharedScopedIdentifier:(id)a8 completionHandler:(id)a9
{
  id v26 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___CPLCloudKitCreateSparsePrivateAssetTask;
  v20 = -[CPLCloudKitTransportTask initWithController:](&v27, "initWithController:", a3);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_scope, a4);
    objc_storeStrong((id *)&v21->_sharedScope, a5);
    objc_storeStrong((id *)&v21->_privateScopedIdentifier, a7);
    objc_storeStrong((id *)&v21->_sharedScopedIdentifier, a8);
    id v22 = objc_msgSend(v19, "copy", v25, v26);
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v22;

    -[CPLCloudKitTransportTask setTransportScopeMapping:](v21, "setTransportScopeMapping:", v16);
  }

  return v21;
}

- (void)runOperations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  if (!v5)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    v15 = @"Missing required zone";
LABEL_9:
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  v15));
    completionHandler[2](completionHandler, v8);
    goto LABEL_14;
  }

  sharedScope = self->_sharedScope;
  if (!sharedScope)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    v15 = @"Missing required shared scope";
    goto LABEL_9;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](sharedScope, "scopeIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneIdentificationForCloudKitScope:v4 engineScope:self->_scope]);

    if (v8 && self->_sharedScope)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneIdentificationForCloudKitScope:v8 engineScope:self->_sharedScope]);
    }

    else
    {
      v13 = 0LL;
    }

    id v16 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]( objc_alloc(&OBJC_CLASS___CPLRecordTarget),  "initWithScopedIdentifier:otherScopedIdentifier:targetState:",  self->_privateScopedIdentifier,  self->_sharedScopedIdentifier,  2LL);
    id v17 = objc_alloc_init(&OBJC_CLASS___CPLRecordTargetMapping);
    -[CPLRecordTargetMapping setTarget:forRecordWithScopedIdentifier:]( v17,  "setTarget:forRecordWithScopedIdentifier:",  v16,  self->_privateScopedIdentifier);
    privateScopedIdentifier = self->_privateScopedIdentifier;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &privateScopedIdentifier,  1LL));
    -[CPLCloudKitTransportTask updatePrivatePropertiesOnAssetsWithScopedIdentifiers:desiredKeys:destinationZoneIdentification:sharedZoneIdentification:targetMapping:knownRecords:shouldUpdateRecord:updateBlock:completionHandler:]( self,  "updatePrivatePropertiesOnAssetsWithScopedIdentifiers:desiredKeys:destinationZoneIdentification:sharedZoneIdentific ation:targetMapping:knownRecords:shouldUpdateRecord:updateBlock:completionHandler:",  v18,  &__NSArray0__struct,  v11,  v13,  v17,  0LL,  &stru_100242100,  &stru_100242140,  self->_completionHandler);
  }

  else
  {
    id v19 = (void (**)(id, void *))self->_completionHandler;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required shared zone"));
    v19[2](v19, v11);
  }

LABEL_14:
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (CPLScopedIdentifier)privateScopedIdentifier
{
  return self->_privateScopedIdentifier;
}

- (CPLScopedIdentifier)sharedScopedIdentifier
{
  return self->_sharedScopedIdentifier;
}

- (void).cxx_destruct
{
}

@end