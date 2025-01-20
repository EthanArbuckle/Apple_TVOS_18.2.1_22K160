@interface CPLCloudKitUploadComputeStatesTask
- (CPLCloudKitUploadComputeStatesTask)initWithController:(id)a3 computeStates:(id)a4 scope:(id)a5 sharedScope:(id)a6 targetMapping:(id)a7 transportScopeMapping:(id)a8 knownRecords:(id)a9 completionHandler:(id)a10;
- (CPLEngineScope)scope;
- (CPLEngineScope)sharedScope;
- (CPLRecordTargetMapping)targetMapping;
- (NSDictionary)knownRecords;
- (void)_getEncryptionHelper;
- (void)_getTemporaryFolder;
- (void)_uploadComputeStatesWithTemporaryFolderURL:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitUploadComputeStatesTask

- (CPLCloudKitUploadComputeStatesTask)initWithController:(id)a3 computeStates:(id)a4 scope:(id)a5 sharedScope:(id)a6 targetMapping:(id)a7 transportScopeMapping:(id)a8 knownRecords:(id)a9 completionHandler:(id)a10
{
  id v16 = a4;
  id v30 = a5;
  id v29 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___CPLCloudKitUploadComputeStatesTask;
  v21 = -[CPLCloudKitTransportTask initWithController:](&v31, "initWithController:", a3);
  if (v21)
  {
    v22 = (NSArray *)objc_msgSend(v16, "copy", v29, v30);
    computeStates = v21->_computeStates;
    v21->_computeStates = v22;

    objc_storeStrong((id *)&v21->_scope, a5);
    objc_storeStrong((id *)&v21->_sharedScope, a6);
    objc_storeStrong((id *)&v21->_targetMapping, a7);
    -[CPLCloudKitTransportTask setTransportScopeMapping:](v21, "setTransportScopeMapping:", v18);
    v24 = (NSDictionary *)[v19 copy];
    knownRecords = v21->_knownRecords;
    v21->_knownRecords = v24;

    id v26 = [v20 copy];
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v26;
  }

  return v21;
}

- (void)runOperations
{
  id v5 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v5);
  id v4 = v5;
  if ((v3 & 1) != 0) {
    -[CPLCloudKitUploadComputeStatesTask _getEncryptionHelper](self, "_getEncryptionHelper");
  }
  else {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)_getEncryptionHelper
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10008C848;
  v2[3] = &unk_100241CF0;
  v2[4] = self;
  -[CPLCloudKitTransportTask acquireHelperWithIdentifier:completionHandler:]( self,  "acquireHelperWithIdentifier:completionHandler:",  @"compute-state-encryption",  v2);
}

- (void)_getTemporaryFolder
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10008C91C;
  v2[3] = &unk_10023FF48;
  v2[4] = self;
  -[CPLCloudKitTransportTask getTemporaryFolderWithCompletionHandler:]( self,  "getTemporaryFolderWithCompletionHandler:",  v2);
}

- (void)_uploadComputeStatesWithTemporaryFolderURL:(id)a3
{
  id v32 = a3;
  id v4 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](self->_computeStates, "count"));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v5 = self->_computeStates;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v43,  v49,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemScopedIdentifier]);
        if (v11)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, v11);
        }

        else if (!_CPLSilentLogging)
        {
          id v12 = sub_10008CDF4();
          v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "[CCSS] Missing identifier to upload for compute state %@",  buf,  0xCu);
          }
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v43,  v49,  16LL);
    }

    while (v7);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneID]);
  if (v16)
  {
    sharedScope = self->_sharedScope;
    if (sharedScope)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](sharedScope, "scopeIdentifier"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v18));

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
      if (!v20)
      {
        id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required shared zone"));
        completionHandler[2](completionHandler, 0LL, v22);
LABEL_25:

        goto LABEL_26;
      }
    }

    else
    {
      id v19 = 0LL;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    uint64_t v33 = objc_claimAutoreleasedReturnValue([v24 zoneIdentificationForCloudKitScope:v15 engineScope:self->_scope]);

    if (v19 && self->_sharedScope)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneIdentificationForCloudKitScope:v19 engineScope:self->_sharedScope]);
    }

    else
    {
      id v26 = 0LL;
    }

    v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
    targetMapping = self->_targetMapping;
    knownRecords = self->_knownRecords;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10008CE34;
    v41[3] = &unk_100241D18;
    v41[4] = self;
    v42 = v4;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10008D1A8;
    v36[3] = &unk_100241D40;
    v37 = v42;
    id v38 = v32;
    v39 = self;
    v40 = v27;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10008D548;
    v34[3] = &unk_10023DEF8;
    v34[4] = self;
    v35 = v40;
    objc_super v31 = v40;
    v22 = (void *)v33;
    -[CPLCloudKitTransportTask updatePrivatePropertiesOnAssetsWithScopedIdentifiers:desiredKeys:destinationZoneIdentification:sharedZoneIdentification:targetMapping:knownRecords:shouldUpdateRecord:updateBlock:completionHandler:]( self,  "updatePrivatePropertiesOnAssetsWithScopedIdentifiers:desiredKeys:destinationZoneIdentification:sharedZoneIdentific ation:targetMapping:knownRecords:shouldUpdateRecord:updateBlock:completionHandler:",  v28,  &off_10025C5E8,  v33,  v26,  targetMapping,  knownRecords,  v41,  v36,  v34);

    goto LABEL_25;
  }

  v23 = (void (**)(id, void, void *))self->_completionHandler;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone"));
  v23[2](v23, 0LL, v19);
LABEL_26:
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (NSDictionary)knownRecords
{
  return self->_knownRecords;
}

- (void).cxx_destruct
{
}

@end