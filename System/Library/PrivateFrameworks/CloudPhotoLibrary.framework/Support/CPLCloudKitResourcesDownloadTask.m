@interface CPLCloudKitResourcesDownloadTask
- (CPLCloudKitResourcesDownloadTask)initWithController:(id)a3 completionHandler:(id)a4;
- (NSArray)downloadTasks;
- (id)_cloudKitScopeForTask:(id)a3;
- (id)_downloadOperationWithRecordIDsAndTasks:(id)a3 keys:(id)a4 perRecordProgressBlock:(id)a5 perRecordCompletionBlock:(id)a6 completionBlock:(id)a7;
- (id)_recordIDForResourcesWithItemScopedIdentifier:(id)a3;
- (id)completionHandler;
- (void)_downloadCurrentGroup;
- (void)_downloadNextGroup;
- (void)_downloadNextOperationType;
- (void)_finishRemainingTasksWithError:(id)a3;
- (void)cancelDownloadTask:(id)a3;
- (void)runOperations;
- (void)setDownloadTasks:(id)a3;
@end

@implementation CPLCloudKitResourcesDownloadTask

- (CPLCloudKitResourcesDownloadTask)initWithController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLCloudKitResourcesDownloadTask;
  v7 = -[CPLCloudKitTransportTask initWithController:](&v11, "initWithController:", a3);
  if (v7)
  {
    id v8 = [v6 copy];
    id completionHandler = v7->_completionHandler;
    v7->_id completionHandler = v8;

    -[CPLCloudKitTransportTask setIsMetadata:](v7, "setIsMetadata:", 0LL);
    -[CPLCloudKitTransportTask setBoostable:](v7, "setBoostable:", 0LL);
  }

  return v7;
}

- (void)setDownloadTasks:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  downloadTasks = self->_downloadTasks;
  self->_downloadTasks = v5;

  v7 = objc_alloc_init(&OBJC_CLASS___CPLRecordTargetMapping);
  targetMapping = self->_targetMapping;
  v36 = self;
  self->_targetMapping = v7;

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v49 count:16];
  id obj = v9;
  if (v10)
  {
    id v11 = v10;
    v35 = 0LL;
    v12 = 0LL;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 transportScopeMapping]);
        v17 = (void *)v16;
        if (v12)
        {
          [v12 updateWithTransportScopeMapping:v16];
        }

        else
        {
          v12 = (void *)v16;
        }

        v18 = v36->_targetMapping;
        v19 = (void *)objc_claimAutoreleasedReturnValue([v15 target]);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v15 cloudResource]);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 itemScopedIdentifier]);
        -[CPLRecordTargetMapping setTarget:forRecordWithScopedIdentifier:]( v18,  "setTarget:forRecordWithScopedIdentifier:",  v19,  v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue([v15 cloudRecord]);
        if (!v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v15 cloudResource]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 identity]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 fingerPrint]);

          v26 = v35;
          if (!v35) {
            v26 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue([v15 cloudResource]);
          v28 = (void *)objc_claimAutoreleasedReturnValue([v27 itemScopedIdentifier]);
          v35 = v26;
          -[NSMutableSet addObject:](v26, "addObject:", v28);
        }
      }

      id v9 = obj;
      id v11 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    }

    while (v11);

    if (v12) {
      -[CPLCloudKitTransportTask setTransportScopeMapping:](v36, "setTransportScopeMapping:", v12);
    }
  }

  else
  {

    v12 = 0LL;
    v35 = 0LL;
  }

  if (!_CPLSilentLogging)
  {
    id v29 = sub_10008595C();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = [v9 count];
      id v32 = -[NSMutableSet count](v35, "count");
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordTargetMapping targetDescriptions](v36->_targetMapping, "targetDescriptions"));
      *(_DWORD *)buf = 134218754;
      id v42 = v31;
      __int16 v43 = 2048;
      id v44 = v32;
      __int16 v45 = 2112;
      v46 = v33;
      __int16 v47 = 2112;
      v48 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Will download %lu tasks (%lu missing placeholders) using:\n%@\nand:\n%@",  buf,  0x2Au);

      id v9 = obj;
    }
  }
}

- (void)cancelDownloadTask:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100085A14;
  v4[3] = &unk_10023DDE8;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[CPLCloudKitTransportTask dispatchAsync:](v5, "dispatchAsync:", v4);
}

- (void)_finishRemainingTasksWithError:(id)a3
{
  id v5 = a3;
  if (!v5) {
    sub_100196220((uint64_t)a2, (uint64_t)self);
  }
  remainingTasksPerOperationType = self->_remainingTasksPerOperationType;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100085BF0;
  v8[3] = &unk_100241970;
  id v9 = v5;
  id v7 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( remainingTasksPerOperationType,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (id)_downloadOperationWithRecordIDsAndTasks:(id)a3 keys:(id)a4 perRecordProgressBlock:(id)a5 perRecordCompletionBlock:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (CPLCloudKitUseGateKeeperForOperationType(self->_currentOperationType))
  {
    uint64_t v17 = CPLCloudKitGateKeeperDefaultDownloadType;
    id v46 = v16;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_100086078;
    v47[3] = &unk_100241998;
    id v48 = v15;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100086130;
    v45[3] = &unk_10023EAE8;
    id v18 = v16;
    id v19 = v15;
    v20 = (CKFetchRecordsOperation *)objc_claimAutoreleasedReturnValue( +[CPLCKResourceDownloadOperation downloadOperationWithRecordIDsAndTasks:keys:downloadType:perRecordProgressBlock:perRecordCompletionBlock:completionBlock:]( &OBJC_CLASS___CPLCKResourceDownloadOperation,  "downloadOperationWithRecordIDsAndTasks:keys:downloadType:perRecordProgressBlock :perRecordCompletionBlock:completionBlock:",  v12,  v13,  v17,  v14,  v47,  v45));

    id v21 = v48;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v22 = sub_10008595C();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
        *(_DWORD *)buf = 138412546;
        v51 = v24;
        __int16 v52 = 2112;
        id v53 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Will use legacy downloads for %@ (%@)",  buf,  0x16u);
      }
    }

    v25 = objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
    v20 = -[CKFetchRecordsOperation initWithRecordIDs:](v25, "initWithRecordIDs:", v26);

    uint64_t v27 = sub_100089C34((uint64_t)v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = sub_100089BF8((uint64_t)v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v31 = sub_100089BD4((uint64_t)v13);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v49[0] = v30;
    v49[1] = v28;
    v49[2] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 3LL));
    -[CKFetchRecordsOperation setDesiredKeys:](v20, "setDesiredKeys:", v33);

    -[CKFetchRecordsOperation setShouldFetchAssetContent:](v20, "setShouldFetchAssetContent:", 1LL);
    -[CKFetchRecordsOperation setPerRecordProgressBlock:](v20, "setPerRecordProgressBlock:", v14);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100086180;
    v40[3] = &unk_1002419C0;
    id v41 = v28;
    id v42 = v30;
    id v43 = v32;
    id v44 = v15;
    id v34 = v32;
    id v21 = v30;
    id v18 = v28;
    id v35 = v15;
    -[CKFetchRecordsOperation setPerRecordCompletionBlock:](v20, "setPerRecordCompletionBlock:", v40);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100086250;
    v38[3] = &unk_10023EBB0;
    id v39 = v16;
    id v36 = v16;
    -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v20, "setFetchRecordsCompletionBlock:", v38);
  }

  return v20;
}

- (id)_cloudKitScopeForTask:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudResource]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 itemScopedIdentifier]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceScopedIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v10));

  if (!v11)
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_10008595C();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceScopedIdentifier]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudResource]);
        *(_DWORD *)buf = 138412546;
        id v22 = v15;
        __int16 v23 = 2112;
        v24 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Impossible to find cloudkit scope for %@ (%@)",  buf,  0x16u);
      }
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit /CPLCloudKitResourcesDownloadTask.m"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceScopedIdentifier]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudResource]);
    [v17 handleFailureInMethod:a2, self, v18, 204, @"Impossible to find cloudkit scope for %@ (%@)", v19, v20 object file lineNumber description];

    abort();
  }

  return v11;
}

- (id)_recordIDForResourcesWithItemScopedIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:]( self->_targetMapping,  "targetForRecordWithScopedIdentifier:",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 resourceScopedIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v8));

  if (!v9)
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_10008595C();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Impossible to find cloudkit scope for %@ (%@)",  buf,  0x16u);
      }
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit /CPLCloudKitResourcesDownloadTask.m"));
    [v15 handleFailureInMethod:a2, self, v16, 212, @"Impossible to find cloudkit scope for %@ (%@)", v7, v5 object file lineNumber description];

    abort();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 recordIDWithRecordName:v10]);

  return v11;
}

- (void)_downloadCurrentGroup
{
  id v52 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v52);
  id v4 = v52;
  if ((v3 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10008595C();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        downloadGroup = self->_downloadGroup;
        *(_DWORD *)buf = 138412290;
        v54 = downloadGroup;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will download %@", buf, 0xCu);
      }
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_CPLCloudKitDownloadGroup propertyKeys](self->_downloadGroup, "propertyKeys"));
    id v9 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[_CPLCloudKitDownloadGroup countOfDownloadTasks](self->_downloadGroup, "countOfDownloadTasks"));
    id v10 = -[CPLCloudKitDownloadResourcesOperationContext initWithResourceType:]( objc_alloc(&OBJC_CLASS___CPLCloudKitDownloadResourcesOperationContext),  "initWithResourceType:",  -[_CPLCloudKitDownloadGroup resourceType](self->_downloadGroup, "resourceType"));
    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v12 = self->_downloadGroup;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_100086BB4;
    v46[3] = &unk_1002419E8;
    id v13 = v10;
    __int16 v47 = v13;
    id v48 = self;
    id v14 = v11;
    v49 = v14;
    id v15 = v9;
    v50 = v15;
    id v16 = v8;
    id v51 = v16;
    -[_CPLCloudKitDownloadGroup enumerateRecordScopedIdentifiersAndTasksWithBlock:]( v12,  "enumerateRecordScopedIdentifiersAndTasksWithBlock:",  v46);
    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitDownloadMetric);
    -[CPLCloudKitDownloadMetric setRequestedItemCount:]( v17,  "setRequestedItemCount:",  -[NSMutableDictionary count](v15, "count"));
    -[CPLCloudKitDownloadMetric setExpectedSize:]( v17,  "setExpectedSize:",  -[_CPLCloudKitDownloadGroup downloadSize](self->_downloadGroup, "downloadSize"));
    -[CPLCloudKitTransportTask associateMetric:](self, "associateMetric:", v17);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100086D9C;
    v43[3] = &unk_100241A10;
    v43[4] = self;
    id v44 = v14;
    __int16 v45 = v13;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100086F64;
    v39[3] = &unk_100241A60;
    v39[4] = self;
    id v36 = v44;
    __int128 v40 = v36;
    id v18 = v45;
    id v41 = v18;
    id v42 = v17;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100087350;
    v37[3] = &unk_10023DEF8;
    v37[4] = self;
    __int16 v19 = v42;
    __int128 v38 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitResourcesDownloadTask _downloadOperationWithRecordIDsAndTasks:keys:perRecordProgressBlock:perRecordCompletionBlock:completionBlock:]( self,  "_downloadOperationWithRecordIDsAndTasks:keys:perRecordProgressBlock:perRecordCompletionBlock:completionBlock:",  v15,  v16,  v43,  v39,  v37));
    if (-[CPLCloudKitTransportTask foreground](self, "foreground")
      && -[_CPLCloudKitDownloadGroup shouldBoostPriority](self->_downloadGroup, "shouldBoostPriority"))
    {
      [v20 setQueuePriority:4];
    }

    id v21 = objc_msgSend( (id)objc_opt_class(self),  "allowsCellularForDownloadOperationOfSize:isForeground:isHighPriority:",  -[_CPLCloudKitDownloadGroup downloadSize](self->_downloadGroup, "downloadSize"),  -[CPLCloudKitTransportTask foreground](self, "foreground"),  -[_CPLCloudKitDownloadGroup isHighPriority](self->_downloadGroup, "isHighPriority"));
    if ((_DWORD)v21 && !_CPLSilentLogging)
    {
      id v22 = sub_10008595C();
      __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (_CPLCloudKitDownloadGroup *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  -[_CPLCloudKitDownloadGroup downloadSize]( self->_downloadGroup,  "downloadSize"),  1LL));
        id v34 = v19;
        id v25 = v16;
        if (-[CPLCloudKitTransportTask foreground](self, "foreground")) {
          v26 = @" in foreground";
        }
        else {
          v26 = &stru_1002482B0;
        }
        unsigned int v27 = -[_CPLCloudKitDownloadGroup isHighPriority](self->_downloadGroup, "isHighPriority", v34, v36);
        v28 = @" high priority";
        *(_DWORD *)buf = 138412802;
        v54 = v24;
        if (!v27) {
          v28 = &stru_1002482B0;
        }
        __int16 v55 = 2112;
        v56 = v26;
        id v16 = v25;
        __int16 v19 = v35;
        __int16 v57 = 2112;
        v58 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Allowing cellular access for resources download for %@%@%@",  buf,  0x20u);
      }
    }

    -[CPLCloudKitTransportTask setAllowsCellular:](self, "setAllowsCellular:", v21);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[_CPLCloudKitDownloadGroup mainSourceBundleIdentifier]( self->_downloadGroup,  "mainSourceBundleIdentifier"));
    -[CPLCloudKitTransportTask setSourceBundleIdentifier:](self, "setSourceBundleIdentifier:", v29);

    v30 = self->_downloadGroup;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v20 operationID]);
    -[_CPLCloudKitDownloadGroup allDownloadsDidStartWithOperationID:](v30, "allDownloadsDidStartWithOperationID:", v31);

    int64_t currentOperationType = self->_currentOperationType;
    v33 = (void *)objc_claimAutoreleasedReturnValue( -[_CPLCloudKitDownloadGroup allSourceBundleIdentifiers]( self->_downloadGroup,  "allSourceBundleIdentifiers"));
    -[CPLCloudKitTransportTask launchOperation:type:withContext:sourceBundleIdentifiers:]( self,  "launchOperation:type:withContext:sourceBundleIdentifiers:",  v20,  currentOperationType,  v18,  v33);
  }

  else
  {
    -[_CPLCloudKitDownloadGroup allDownloadsDidFailWithError:]( self->_downloadGroup,  "allDownloadsDidFailWithError:",  v4);
    -[CPLCloudKitResourcesDownloadTask _finishRemainingTasksWithError:](self, "_finishRemainingTasksWithError:", v4);
  }
}

- (void)_downloadNextOperationType
{
  if (-[NSMutableDictionary count](self->_remainingTasksPerOperationType, "count"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_remainingTasksPerOperationType, "allKeys"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 firstObject]);

    self->_int64_t currentOperationType = (int64_t)[v6 integerValue];
    id v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remainingTasksPerOperationType,  "objectForKeyedSubscript:",  v6));
    currentRemainingTasks = self->_currentRemainingTasks;
    self->_currentRemainingTasks = v4;

    -[CPLCloudKitResourcesDownloadTask _downloadNextGroup](self, "_downloadNextGroup");
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }

- (void)_downloadNextGroup
{
  id v39 = 0LL;
  unsigned __int8 v4 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v39);
  id v5 = v39;
  if ((v4 & 1) != 0)
  {
    if (-[NSMutableArray count](self->_currentRemainingTasks, "count"))
    {
      SEL v33 = a2;
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_currentRemainingTasks, "firstObject"));
      if (v6)
      {
        id v7 = (void *)v6;
        while (1)
        {
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v7 cloudResource]);
          unint64_t v8 = +[CPLCloudKitFakeDynamicDerivatives realResourceTypeForResource:]( &OBJC_CLASS___CPLCloudKitFakeDynamicDerivatives,  "realResourceTypeForResource:");
          id v9 = objc_alloc(&OBJC_CLASS____CPLCloudKitDownloadGroup);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultSourceBundleIdentifier]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask fingerprintContext](self, "fingerprintContext"));
          id v13 = -[_CPLCloudKitDownloadGroup initWithResourceType:defaultSourceBundleIdentifier:fingerprintContext:]( v9,  "initWithResourceType:defaultSourceBundleIdentifier:fingerprintContext:",  v8,  v11,  v12);
          downloadGroup = self->_downloadGroup;
          self->_downloadGroup = v13;

          id v15 = -[NSMutableIndexSet initWithIndex:](objc_alloc(&OBJC_CLASS___NSMutableIndexSet), "initWithIndex:", 0LL);
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          id v16 = self->_currentRemainingTasks;
          id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v35,  v42,  16LL);
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = 0LL;
            uint64_t v20 = *(void *)v36;
            do
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v36 != v20) {
                  objc_enumerationMutation(v16);
                }
                id v22 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
                unsigned int v23 = -[_CPLCloudKitDownloadGroup addDownloadTask:](self->_downloadGroup, "addDownloadTask:", v22);
                if (v22 == v7 && (v23 & 1) == 0) {
                  sub_100196388((uint64_t)v33, (uint64_t)self);
                }
                if (v23) {
                  -[NSMutableIndexSet addIndex:](v15, "addIndex:", (char *)i + v19);
                }
              }

              id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v35,  v42,  16LL);
              v19 += (uint64_t)i;
            }

            while (v18);
          }

          -[NSMutableArray removeObjectsAtIndexes:](self->_currentRemainingTasks, "removeObjectsAtIndexes:", v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[_CPLCloudKitDownloadGroup propertyKeys](self->_downloadGroup, "propertyKeys"));
          if (v24) {
            break;
          }
          if (!_CPLSilentLogging)
          {
            id v25 = sub_10008595C();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              unsigned int v27 = self->_downloadGroup;
              *(_DWORD *)buf = 138412290;
              id v41 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Asked to download unsupported resources: %@",  buf,  0xCu);
            }
          }

          v28 = self->_downloadGroup;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"resourceType"));
          -[_CPLCloudKitDownloadGroup allDownloadsDidFailWithError:](v28, "allDownloadsDidFailWithError:", v29);

          v30 = self->_downloadGroup;
          self->_downloadGroup = 0LL;

          id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_currentRemainingTasks, "firstObject"));
          if (!v7) {
            goto LABEL_22;
          }
        }
      }

- (void)runOperations
{
  if (self->_scopedIdentifiersNeedingPlaceholderRecords) {
    scopedIdentifiersNeedingPlaceholderRecords = self->_scopedIdentifiersNeedingPlaceholderRecords;
  }
  else {
    scopedIdentifiersNeedingPlaceholderRecords = (NSArray *)&__NSArray0__struct;
  }
  targetMapping = self->_targetMapping;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100087A60;
  v4[3] = &unk_100241A88;
  void v4[4] = self;
  v4[5] = a2;
  -[CPLCloudKitTransportTask fetchPlaceholderRecordsForScopedIdentifiers:targetMapping:completionHandler:]( self,  "fetchPlaceholderRecordsForScopedIdentifiers:targetMapping:completionHandler:",  scopedIdentifiersNeedingPlaceholderRecords,  targetMapping,  v4);
}

- (NSArray)downloadTasks
{
  return self->_downloadTasks;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
}

@end