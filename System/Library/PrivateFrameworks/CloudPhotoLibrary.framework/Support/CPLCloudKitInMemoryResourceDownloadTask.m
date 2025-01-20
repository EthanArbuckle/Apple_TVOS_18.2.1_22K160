@interface CPLCloudKitInMemoryResourceDownloadTask
- (CPLCloudKitInMemoryResourceDownloadTask)initWithController:(id)a3 resource:(id)a4 record:(id)a5 target:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8;
- (CPLPlaceholderRecord)record;
- (CPLResource)resource;
- (id)_inMemoryDownloadOperationForRecordID:(id)a3 resource:(id)a4 record:(id)a5 keys:(id)a6 operationType:(int64_t)a7 completionBlock:(id)a8;
- (id)completionHandler;
- (void)_fetchPlaceholderRecordAndStartDownload;
- (void)_startDownload;
- (void)runOperations;
@end

@implementation CPLCloudKitInMemoryResourceDownloadTask

- (CPLCloudKitInMemoryResourceDownloadTask)initWithController:(id)a3 resource:(id)a4 record:(id)a5 target:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___CPLCloudKitInMemoryResourceDownloadTask;
  v20 = -[CPLCloudKitTransportTask initWithController:](&v29, "initWithController:", a3);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_resource, a4);
    objc_storeStrong((id *)&v21->_record, a5);
    v22 = objc_alloc_init(&OBJC_CLASS___CPLRecordTargetMapping);
    targetMapping = v21->_targetMapping;
    v21->_targetMapping = v22;

    v24 = v21->_targetMapping;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v17 scopedIdentifier]);
    -[CPLRecordTargetMapping setTarget:forRecordWithScopedIdentifier:]( v24,  "setTarget:forRecordWithScopedIdentifier:",  v17,  v25);

    id v26 = [v19 copy];
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v26;

    -[CPLCloudKitTransportTask setTransportScopeMapping:](v21, "setTransportScopeMapping:", v18);
    -[CPLCloudKitTransportTask setIsMetadata:](v21, "setIsMetadata:", 0LL);
    -[CPLCloudKitTransportTask setBoostable:](v21, "setBoostable:", 0LL);
  }

  return v21;
}

- (id)_inMemoryDownloadOperationForRecordID:(id)a3 resource:(id)a4 record:(id)a5 keys:(id)a6 operationType:(int64_t)a7 completionBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = sub_100089C34((uint64_t)v16);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (CPLCloudKitUseGateKeeperForOperationType(a7))
  {
    uint64_t v20 = CPLCloudKitGateKeeperDefaultDownloadType;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1000A856C;
    v37[3] = &unk_100242480;
    id v38 = v17;
    v21 = (CKFetchRecordsOperation *)objc_claimAutoreleasedReturnValue( +[CPLCKResourceDownloadOperation inMemoryDownloadOperationForRecordID:resource:record:keys:downloadType:completionBlock:]( &OBJC_CLASS___CPLCKResourceDownloadOperation,  "inMemoryDownloadOperationForRecordID:resource:record:keys:downloadType:completionBlock:",  v13,  v14,  v15,  v16,  v20,  v37));
    v22 = v38;
  }

  else
  {
    v23 = objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation);
    id v40 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
    v21 = -[CKFetchRecordsOperation initWithRecordIDs:](v23, "initWithRecordIDs:", v24);

    -[CKFetchRecordsOperation setShouldFetchAssetContentInMemory:](v21, "setShouldFetchAssetContentInMemory:", 1LL);
    uint64_t v25 = sub_100089BD4((uint64_t)v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v39[0] = v19;
    v39[1] = v22;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
    -[CKFetchRecordsOperation setDesiredKeys:](v21, "setDesiredKeys:", v26);

    v35[0] = 0LL;
    v35[1] = v35;
    v35[2] = 0x3032000000LL;
    v35[3] = sub_1000A85F4;
    v35[4] = sub_1000A8604;
    id v36 = 0LL;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1000A860C;
    v34[3] = &unk_1002424A8;
    v34[4] = v35;
    -[CKFetchRecordsOperation setPerRecordCompletionBlock:](v21, "setPerRecordCompletionBlock:", v34);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000A8754;
    v28[3] = &unk_1002424D0;
    v33 = v35;
    id v29 = v13;
    id v30 = v19;
    id v31 = v16;
    id v32 = v17;
    -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v21, "setFetchRecordsCompletionBlock:", v28);

    _Block_object_dispose(v35, 8);
  }

  return v21;
}

- (void)runOperations
{
  id v8 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v8);
  id v4 = v8;
  if ((v3 & 1) != 0)
  {
    if (self->_record)
    {
      targetMapping = self->_targetMapping;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1000A8ADC;
      v7[3] = &unk_10023E430;
      v7[4] = self;
      -[CPLCloudKitTransportTask fetchUnknownTargetsInMapping:completionHandler:]( self,  "fetchUnknownTargetsInMapping:completionHandler:",  targetMapping,  v7);
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLResource identity](self->_resource, "identity"));

      -[CPLCloudKitInMemoryResourceDownloadTask _fetchPlaceholderRecordAndStartDownload]( self,  "_fetchPlaceholderRecordAndStartDownload");
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)_fetchPlaceholderRecordAndStartDownload
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLResource itemScopedIdentifier](self->_resource, "itemScopedIdentifier"));
  v9 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  targetMapping = self->_targetMapping;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A8BFC;
  v7[3] = &unk_100240BE8;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  -[CPLCloudKitTransportTask fetchPlaceholderRecordsForScopedIdentifiers:targetMapping:completionHandler:]( self,  "fetchPlaceholderRecordsForScopedIdentifiers:targetMapping:completionHandler:",  v4,  targetMapping,  v7);
}

- (void)_startDownload
{
  id v36 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v36);
  id v4 = v36;
  if ((v3 & 1) != 0)
  {
    id v5 = sub_1000896D4( (uint64_t)&OBJC_CLASS___CPLCloudKitResourceKeys,  +[CPLCloudKitFakeDynamicDerivatives realResourceTypeForResource:]( &OBJC_CLASS___CPLCloudKitFakeDynamicDerivatives,  "realResourceTypeForResource:",  self->_resource));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLResource itemScopedIdentifier](self->_resource, "itemScopedIdentifier"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceScopedIdentifier]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
      v11 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v10));

      if (v11)
      {
        id v32 = v8;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        id v13 = (CPLResource *)objc_claimAutoreleasedReturnValue([v11 recordIDWithRecordName:v12]);

        if (!_CPLSilentLogging)
        {
          id v14 = sub_1000A8714();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v16 = sub_100089C34((uint64_t)v6);
            id v17 = v9;
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
            *(_DWORD *)buf = 138412546;
            id v38 = v13;
            __int16 v39 = 2112;
            id v40 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Starting in memory download for %@ (resourceKey %@)",  buf,  0x16u);

            v9 = v17;
          }
        }

        id v31 = v9;
        id v19 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitDownloadMetric);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLResource identity](self->_resource, "identity"));
        -[CPLCloudKitDownloadMetric setExpectedSize:](v19, "setExpectedSize:", [v20 fileSize]);

        -[CPLCloudKitDownloadMetric setRequestedItemCount:](v19, "setRequestedItemCount:", 1LL);
        -[CPLCloudKitTransportTask associateMetric:](self, "associateMetric:", v19);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_1000A9114;
        v33[3] = &unk_100242520;
        v33[4] = self;
        v34 = v19;
        v35 = v13;
        v21 = v13;
        v22 = v19;
        v23 = objc_retainBlock(v33);
        uint64_t v24 = CPLCloudKitOperationTypeForScope(v11);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitInMemoryResourceDownloadTask _inMemoryDownloadOperationForRecordID:resource:record:keys:operationType:completionBlock:]( self,  "_inMemoryDownloadOperationForRecordID:resource:record:keys:operationType:completionBlock:",  v21,  self->_resource,  self->_record,  v6,  v24,  v23));
        -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v25,  v24,  0LL);

        v9 = v31;
        id v8 = v32;
      }

      else
      {
        id completionHandler = (void (**)(id, void, id))self->_completionHandler;
        v22 = (CPLCloudKitDownloadMetric *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
        v21 = (CPLResource *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing zone for %@",  v22));
        completionHandler[2](completionHandler, 0LL, v21);
      }
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v26 = sub_1000A8714();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          resource = self->_resource;
          *(_DWORD *)buf = 138412290;
          id v38 = resource;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Tried to download an unsupported resource type in memory: %@",  buf,  0xCu);
        }
      }

      id v29 = (void (**)(id, void, void *))self->_completionHandler;
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"resourceType"));
      v29[2](v29, 0LL, v7);
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (CPLResource)resource
{
  return self->_resource;
}

- (CPLPlaceholderRecord)record
{
  return self->_record;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end