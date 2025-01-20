@interface CPLCloudKitDownloadComputeStatesTask
- (BOOL)shouldDecrypt;
- (CPLCloudKitDownloadComputeStatesTask)initWithController:(id)a3 scopedIdentifiers:(id)a4 scope:(id)a5 sharedScope:(id)a6 targetStorageURL:(id)a7 transportScopeMapping:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)scope;
- (CPLEngineScope)sharedScope;
- (NSURL)targetStorageURL;
- (void)_downloadComputeStates;
- (void)_getEncryptionHelper;
- (void)_group:(id)a3 dispatchWhenFinished:(id)a4;
- (void)runOperations;
- (void)setShouldDecrypt:(BOOL)a3;
@end

@implementation CPLCloudKitDownloadComputeStatesTask

- (CPLCloudKitDownloadComputeStatesTask)initWithController:(id)a3 scopedIdentifiers:(id)a4 scope:(id)a5 sharedScope:(id)a6 targetStorageURL:(id)a7 transportScopeMapping:(id)a8 completionHandler:(id)a9
{
  id v15 = a4;
  id v26 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___CPLCloudKitDownloadComputeStatesTask;
  v20 = -[CPLCloudKitTransportTask initWithController:](&v27, "initWithController:", a3);
  if (v20)
  {
    v21 = (NSArray *)[v15 copy];
    scopedIdentifiers = v20->_scopedIdentifiers;
    v20->_scopedIdentifiers = v21;

    objc_storeStrong((id *)&v20->_scope, a5);
    objc_storeStrong((id *)&v20->_sharedScope, a6);
    objc_storeStrong((id *)&v20->_targetStorageURL, a7);
    -[CPLCloudKitTransportTask setTransportScopeMapping:](v20, "setTransportScopeMapping:", v18);
    id v23 = [v19 copy];
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = v23;
  }

  return v20;
}

- (void)runOperations
{
  id v5 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v5);
  id v4 = v5;
  if ((v3 & 1) != 0) {
    -[CPLCloudKitDownloadComputeStatesTask _getEncryptionHelper](self, "_getEncryptionHelper");
  }
  else {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)_getEncryptionHelper
{
  if (self->_shouldDecrypt)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000933B4;
    v5[3] = &unk_100241CF0;
    v5[4] = self;
    -[CPLCloudKitTransportTask acquireHelperWithIdentifier:completionHandler:]( self,  "acquireHelperWithIdentifier:completionHandler:",  @"compute-state-encryption",  v5);
  }

  else
  {
    unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitComputeStateNoEncryptionHelper);
    encryptionHelper = self->_encryptionHelper;
    self->_encryptionHelper = (CPLCloudKitComputeStateEncryptionHelper *)v3;

    -[CPLCloudKitDownloadComputeStatesTask _downloadComputeStates](self, "_downloadComputeStates");
  }

- (void)_group:(id)a3 dispatchWhenFinished:(id)a4
{
  id v6 = a4;
  v7 = (dispatch_group_s *)a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 1LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100093524;
  v11[3] = &unk_10023E058;
  v11[4] = self;
  id v12 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask blockWithAdaptedQOS:](self, "blockWithAdaptedQOS:", v11));
  -[CPLCloudKitTransportTask dispatchCallbackOperation:progress:]( self,  "dispatchCallbackOperation:progress:",  @"Waiting for decryption to finish",  v8);
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask synchronousWorkQueue](self, "synchronousWorkQueue"));
  dispatch_group_notify(v7, v10, v9);
}

- (void)_downloadComputeStates
{
  id v63 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v63);
  id v41 = v63;
  if ((v3 & 1) != 0 && -[NSArray count](self->_scopedIdentifiers, "count"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
    v38 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v4));

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v38 zoneID]);
    BOOL v6 = v5 == 0LL;

    if (v6)
    {
      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone"));
      completionHandler[2](completionHandler, 0LL, v37);
LABEL_20:

      goto LABEL_21;
    }

    sharedScope = self->_sharedScope;
    if (sharedScope)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](sharedScope, "scopeIdentifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v8));

      v9 = (void *)objc_claimAutoreleasedReturnValue([v37 zoneID]);
      BOOL v10 = v9 == 0LL;

      if (v10)
      {
        v11 = (void (**)(id, void, void *))self->_completionHandler;
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required shared zone"));
        v11[2](v11, 0LL, v12);
LABEL_19:

        goto LABEL_20;
      }
    }

    else
    {
      v37 = 0LL;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneIdentificationForCloudKitScope:v38 engineScope:self->_scope]);

    id v15 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](self->_scopedIdentifiers, "count"));
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v16 = self->_scopedIdentifiers;
    id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v59,  v64,  16LL);
    if (v17)
    {
      uint64_t v18 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v60 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v12 recordIDWithRecordName:v21]);

          -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v20, v22);
        }

        id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v59,  v64,  16LL);
      }

      while (v17);
    }

    v57[0] = 0LL;
    v57[1] = v57;
    v57[2] = 0x3032000000LL;
    v57[3] = sub_100093BBC;
    v57[4] = sub_100093BCC;
    id v58 = 0LL;
    id v23 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](self->_scopedIdentifiers, "count"));
    v24 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](self->_scopedIdentifiers, "count"));
    v25 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](self->_scopedIdentifiers, "count"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100093BD4;
    v48[3] = &unk_100241E30;
    id v26 = dispatch_group_create();
    v49 = v26;
    v50 = self;
    v55 = v57;
    v36 = v15;
    v51 = v36;
    SEL v56 = a2;
    objc_super v27 = v25;
    v52 = v27;
    v28 = v24;
    v53 = v28;
    v29 = v23;
    v54 = v29;
    v30 = objc_retainBlock(v48);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v36, "allKeys"));
    id v32 = [v12 operationType];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000943D4;
    v42[3] = &unk_100241EA8;
    v42[4] = self;
    v40 = v26;
    v43 = v40;
    v47 = v57;
    v33 = v29;
    v44 = v33;
    v34 = v27;
    v45 = v34;
    v35 = v28;
    v46 = v35;
    -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:desiredKeys:wantsAllRecords:type:perFoundRecordBlock:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:desiredKeys:wantsAllRecords:type:perFoundRecordBlock:completionHandler:",  v31,  1LL,  &off_10025C630,  0LL,  v32,  v30,  v42);

    _Block_object_dispose(v57, 8);
    goto LABEL_19;
  }

  (*((void (**)(void))self->_completionHandler + 2))();
LABEL_21:
}

- (BOOL)shouldDecrypt
{
  return self->_shouldDecrypt;
}

- (void)setShouldDecrypt:(BOOL)a3
{
  self->_shouldDecrypt = a3;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (NSURL)targetStorageURL
{
  return self->_targetStorageURL;
}

- (void).cxx_destruct
{
}

@end