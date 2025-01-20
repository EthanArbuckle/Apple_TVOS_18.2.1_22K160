@interface CPLCloudKitUploadBatchTask
+ (NSArray)simulateOverQuotaPhases;
- (CPLChangeBatch)batch;
- (CPLCloudKitUploadBatchTask)initWithController:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (CPLEngineScope)scope;
- (CPLEngineScope)sharedScope;
- (CPLRecordTargetMapping)targetMapping;
- (NSDate)cplEnabledDate;
- (double)approximativeResourcesUploadRate;
- (void)_executeSharePlanFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_executeUnsharePlanFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_fetchPrivateRecordsFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_fetchRequestedRecordsFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_fetchSharedRecordsFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_runModernOperationsWithCurrentUserID:(id)a3;
- (void)_uploadBatchFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_uploadRecords:(id)a3 deleteRecordIDs:(id)a4 identification:(id)a5 fromPlanner:(id)a6 uploadContext:(id)a7 updateProgress:(id)a8 completionHandler:(id)a9;
- (void)_uploadSharedBatchFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)runOperations;
- (void)setBatch:(id)a3;
- (void)setCplEnabledDate:(id)a3;
- (void)setSharedScope:(id)a3;
@end

@implementation CPLCloudKitUploadBatchTask

+ (NSArray)simulateOverQuotaPhases
{
  v3[0] = @"none";
  v3[1] = @"upload";
  v3[2] = @"sharedUpload";
  v3[3] = @"share";
  v3[4] = @"unshare";
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  5LL));
}

- (CPLCloudKitUploadBatchTask)initWithController:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v57 = a4;
  id v58 = a5;
  id v59 = a6;
  id v61 = a7;
  id v60 = a8;
  v74.receiver = self;
  v74.super_class = (Class)&OBJC_CLASS___CPLCloudKitUploadBatchTask;
  v15 = -[CPLCloudKitTransportTask initWithController:](&v74, "initWithController:", v14);
  v16 = v15;
  if (!v15) {
    goto LABEL_55;
  }
  objc_storeStrong((id *)&v15->_scope, a4);
  objc_storeStrong((id *)&v16->_targetMapping, a5);
  if (qword_100296550 != -1) {
    dispatch_once(&qword_100296550, &stru_100241F08);
  }
  if (byte_100296548)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 arrayForKey:@"CPLForceRejectClasses"]);
    if (v56)
    {
      v17 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v56 count]);
      autoRejectClasses = v16->_autoRejectClasses;
      v16->_autoRejectClasses = v17;

      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v71 = 0u;
      __int128 v70 = 0u;
      id v19 = v56;
      id v20 = [v19 countByEnumeratingWithState:&v70 objects:v76 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v71;
LABEL_8:
        uint64_t v22 = 0LL;
        while (1)
        {
          if (*(void *)v71 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(NSString **)(*((void *)&v70 + 1) + 8 * v22);
          uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
          {
            Class v25 = NSClassFromString(v23);
            if (v25)
            {
              -[NSMutableSet addObject:](v16->_autoRejectClasses, "addObject:", v25);
            }

            else
            {
              uint64_t v28 = objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  v23));
              autoError = v16->_autoError;
              v16->_autoError = (NSError *)v28;
            }
          }

          else
          {
            uint64_t v26 = objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"CPLForceRejectClasses"));
            v27 = v16->_autoError;
            v16->_autoError = (NSError *)v26;
          }

          if (v16->_autoError) {
            break;
          }
          if (v20 == (id)++v22)
          {
            id v20 = [v19 countByEnumeratingWithState:&v70 objects:v76 count:16];
            if (v20) {
              goto LABEL_8;
            }
            break;
          }
        }
      }
    }

    if (!v16->_autoError)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue([v55 arrayForKey:@"CPLForceRejectIdentifiers"]);
      if (v54)
      {
        v30 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v54 count]);
        autoRejectRecordIdentifiers = v16->_autoRejectRecordIdentifiers;
        v16->_autoRejectRecordIdentifiers = v30;

        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        id v32 = v54;
        id v33 = [v32 countByEnumeratingWithState:&v66 objects:v75 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v67;
LABEL_24:
          uint64_t v35 = 0LL;
          while (1)
          {
            if (*(void *)v67 != v34) {
              objc_enumerationMutation(v32);
            }
            uint64_t v36 = *(void *)(*((void *)&v66 + 1) + 8 * v35);
            uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0)
            {
              -[NSMutableSet addObject:](v16->_autoRejectRecordIdentifiers, "addObject:", v36);
            }

            else
            {
              uint64_t v38 = objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"CPLForceRejectIdentifiers"));
              v39 = v16->_autoError;
              v16->_autoError = (NSError *)v38;
            }

            if (v16->_autoError) {
              break;
            }
            if (v33 == (id)++v35)
            {
              id v33 = [v32 countByEnumeratingWithState:&v66 objects:v75 count:16];
              if (v33) {
                goto LABEL_24;
              }
              break;
            }
          }
        }
      }
    }
  }

  if (byte_100296549)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:@"CPLSimulateOverQuotaPhase"]);

    uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue([v41 lowercaseString]);

      if ([v43 isEqualToString:@"none"])
      {
        uint64_t v44 = 0LL;
LABEL_49:
        v16->_simulateOverQuotaPhase = v44;
        goto LABEL_50;
      }

      if ([v43 isEqualToString:@"upload"])
      {
        uint64_t v44 = 1LL;
        goto LABEL_49;
      }

      if ([v43 isEqualToString:@"sharedupload"])
      {
        uint64_t v44 = 2LL;
        goto LABEL_49;
      }

      if ([v43 isEqualToString:@"share"])
      {
        uint64_t v44 = 3LL;
        goto LABEL_49;
      }

      if ([v43 isEqualToString:@"unshare"])
      {
        uint64_t v44 = 4LL;
        goto LABEL_49;
      }
    }

    else
    {
      v43 = v41;
    }

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100095654;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v2);
}

- (void)_runModernOperationsWithCurrentUserID:(id)a3
{
  id v75 = a3;
  id v96 = 0LL;
  v77 = self;
  LOBYTE(self) = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v96);
  id v74 = v96;
  if ((self & 1) == 0 || v77->_autoError)
  {
    (*((void (**)(void))v77->_completionHandler + 2))();
    goto LABEL_4;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v5 = [v4 BOOLForKey:@"CPLRejectAllUploads"];

  if (v5)
  {
    v6 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[CPLChangeBatch count](v77->_batch, "count"));
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    v7 = v77->_batch;
    id v8 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v92,  v107,  16LL);
    if (v8)
    {
      uint64_t v9 = *(void *)v93;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v93 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v92 + 1) + 8 * (void)i) scopedIdentifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  @"record is rejected for testing purpose",  v11);
        }

        id v8 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v92,  v107,  16LL);
      }

      while (v8);
    }

    uint64_t v105 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
    v106 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v106,  &v105,  1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:userInfo:description:",  18LL,  0LL,  v12,  @"Some records are rejected for testing purpose"));

    (*((void (**)(void))v77->_completionHandler + 2))();
    goto LABEL_4;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v15 = [v14 integerForKey:@"CPLSimulateBusyState"];

  if (v15)
  {
    uint64_t v103 = CPLErrorScopeBusyKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
    v104 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v104,  &v103,  1LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[CPLScopeChange descriptionForBusyState:]( &OBJC_CLASS___CPLScopeChange,  "descriptionForBusyState:",  v15));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:userInfo:description:",  35LL,  0LL,  v17,  @"Simulating busy state (%@)",  v18));

    (*((void (**)(void))v77->_completionHandler + 2))();
    goto LABEL_4;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](v77->_scope, "scopeIdentifier"));
  __int128 v73 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( v77,  "cloudKitScopeForScopeIdentifier:",  v20));

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v73 zoneID]);
  LODWORD(v20) = v21 == 0LL;

  if ((_DWORD)v20)
  {
    id completionHandler = (void (**)(id, void *))v77->_completionHandler;
    __int128 v72 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone"));
    completionHandler[2](completionHandler, v72);
    goto LABEL_67;
  }

  uint64_t v22 = v77;
  sharedScope = v77->_sharedScope;
  if (sharedScope)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](sharedScope, "scopeIdentifier"));
    __int128 v72 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( v77,  "cloudKitScopeForScopeIdentifier:",  v24));

    Class v25 = (void *)objc_claimAutoreleasedReturnValue([v72 zoneID]);
    LODWORD(v24) = v25 == 0LL;

    if ((_DWORD)v24)
    {
      id v64 = (void (**)(id, void *))v77->_completionHandler;
      v65 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required shared zone"));
      v64[2](v64, v65);

      goto LABEL_67;
    }

    uint64_t v22 = v77;
  }

  else
  {
    __int128 v72 = 0LL;
  }

  if (!v22->_autoRejectRecordIdentifiers && !v22->_autoRejectClasses) {
    goto LABEL_43;
  }
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  v27 = v22->_batch;
  id v28 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v88,  v102,  16LL);
  if (!v28)
  {

    uint64_t v22 = v77;
    goto LABEL_43;
  }

  v29 = 0LL;
  uint64_t v30 = *(void *)v89;
  do
  {
    for (j = 0LL; j != v28; j = (char *)j + 1)
    {
      if (*(void *)v89 != v30) {
        objc_enumerationMutation(v27);
      }
      id v32 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)j);
      if (-[NSMutableSet containsObject:]( v77->_autoRejectClasses,  "containsObject:",  objc_opt_class(v32)))
      {
        if (!v29) {
          v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        }
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 scopedIdentifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  @"record class is rejected for testing purpose",  v33);
      }

      else
      {
        autoRejectRecordIdentifiers = v77->_autoRejectRecordIdentifiers;
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v32 scopedIdentifier]);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 identifier]);
        LODWORD(autoRejectRecordIdentifiers) = -[NSMutableSet containsObject:]( autoRejectRecordIdentifiers,  "containsObject:",  v36);

        if (!(_DWORD)autoRejectRecordIdentifiers) {
          continue;
        }
        if (!v29) {
          v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        }
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 scopedIdentifier]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  @"record is rejected for testing purpose",  v33);
      }
    }

    id v28 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v88,  v102,  16LL);
  }

  while (v28);

  uint64_t v22 = v77;
  if (v29)
  {
    uint64_t v100 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
    v101 = v29;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:userInfo:description:",  18LL,  0LL,  v37,  @"Some records are rejected for testing purpose"));

    (*((void (**)(void))v77->_completionHandler + 2))();
    goto LABEL_67;
  }

- (void)_fetchRequestedRecordsFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordRequestor]);
  if ([v8 needsRequestedRecords])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100096434;
    v9[3] = &unk_100241230;
    id v11 = v7;
    v9[4] = self;
    id v10 = v6;
    [v8 fetchRequestedRecordsForTransportTask:self completionHandler:v9];
  }

  else
  {
    -[CPLCloudKitUploadBatchTask _fetchSharedRecordsFromPlanner:completionHandler:]( self,  "_fetchSharedRecordsFromPlanner:completionHandler:",  v6,  v7);
  }
}

- (void)_fetchSharedRecordsFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 requestedSharedCKRecordIDs]);
  if ([v9 count])
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000955C4();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will fetch %@ before upload", buf, 0xCu);
      }
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 sharedZoneIdentification]);

    if (!v12) {
      sub_10019740C((uint64_t)v9, (uint64_t)a2, (uint64_t)self);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 sharedZoneIdentification]);
    id v14 = [v13 operationType];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10009660C;
    v15[3] = &unk_100241F58;
    id v18 = v8;
    id v16 = v7;
    v17 = self;
    -[CPLCloudKitTransportTask fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:",  v9,  1LL,  v14,  v15);
  }

  else
  {
    -[CPLCloudKitUploadBatchTask _uploadBatchFromPlanner:completionHandler:]( self,  "_uploadBatchFromPlanner:completionHandler:",  v7,  v8);
  }
}

- (void)_fetchPrivateRecordsFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 requestedPrivateCKRecordIDs]);
  if ([v9 count])
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000955C4();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will fetch %@ before upload", buf, 0xCu);
      }
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 sharedZoneIdentification]);

    if (!v12) {
      sub_1001974E8((uint64_t)v9, (uint64_t)a2, (uint64_t)self);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationZoneIdentification]);
    id v14 = [v13 operationType];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100096AC4;
    v15[3] = &unk_100241F58;
    id v18 = v8;
    id v16 = v7;
    v17 = self;
    -[CPLCloudKitTransportTask fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:",  v9,  1LL,  v14,  v15);
  }

  else
  {
    -[CPLCloudKitUploadBatchTask _uploadSharedBatchFromPlanner:completionHandler:]( self,  "_uploadSharedBatchFromPlanner:completionHandler:",  v7,  v8);
  }
}

- (void)_uploadRecords:(id)a3 deleteRecordIDs:(id)a4 identification:(id)a5 fromPlanner:(id)a6 uploadContext:(id)a7 updateProgress:(id)a8 completionHandler:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v37 = a8;
  id v21 = a9;
  v53[0] = 0LL;
  LOBYTE(a8) = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", v53);
  id v22 = v53[0];
  if ((a8 & 1) != 0)
  {
    if ([v16 count] || objc_msgSend(v17, "count"))
    {
      id v34 = v22;
      v23 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v16,  v17);
      -[CKModifyRecordsOperation setSavePolicy:](v23, "setSavePolicy:", 0LL);
      uint64_t v36 = v18;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_1000970D8;
      v49[3] = &unk_100241F80;
      v49[4] = self;
      id v24 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask fetchCache](self, "fetchCache"));
      id v50 = v24;
      uint64_t v35 = v17;
      id v25 = v19;
      id v26 = v20;
      id v51 = v26;
      id v27 = v16;
      id v28 = v20;
      id v29 = v37;
      id v52 = v29;
      -[CKModifyRecordsOperation setPerRecordSaveBlock:](v23, "setPerRecordSaveBlock:", v49);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_1000973AC;
      v47[3] = &unk_10023F750;
      v47[4] = self;
      id v48 = v24;
      id v33 = v24;
      -[CKModifyRecordsOperation setPerRecordDeleteBlock:](v23, "setPerRecordDeleteBlock:", v47);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_10009744C;
      v44[3] = &unk_100241FA8;
      v44[4] = self;
      id v30 = v26;
      id v19 = v25;
      id v17 = v35;
      id v31 = v30;
      id v45 = v30;
      id v32 = v29;
      id v20 = v28;
      id v16 = v27;
      id v46 = v32;
      -[CKModifyRecordsOperation setPerRecordProgressBlock:](v23, "setPerRecordProgressBlock:", v44);
      v38[0] = _NSConcreteStackBlock;
      id v18 = v36;
      v38[1] = 3221225472LL;
      v38[2] = sub_1000975D8;
      v38[3] = &unk_100242020;
      v38[4] = self;
      id v39 = v16;
      id v40 = v35;
      id v41 = v19;
      SEL v43 = a2;
      id v42 = v21;
      -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v23, "setModifyRecordsCompletionBlock:", v38);
      -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v23,  [v36 operationType],  v31);

      id v22 = v34;
    }

    else
    {
      (*((void (**)(id, void))v21 + 2))(v21, 0LL);
    }
  }

  else
  {
    (*((void (**)(id, id))v21 + 2))(v21, v22);
  }
}

- (void)_uploadBatchFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 ckRecordsToUpload]);
  if ([v8 count] && self->_simulateOverQuotaPhase == 1)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100097E50;
    v20[3] = &unk_10023DBC8;
    id v21 = v7;
    id v9 = v7;
    -[CPLCloudKitTransportTask dispatchAsync:](self, "dispatchAsync:", v20);
    id v10 = v21;
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 ckRecordIDsToDelete]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 willUploadRecords]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationZoneIdentification]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100097FE8;
    v17[3] = &unk_100242048;
    id v18 = v6;
    id v19 = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10009801C;
    v13[3] = &unk_100242070;
    id v15 = self;
    id v16 = v7;
    id v14 = v18;
    id v12 = v7;
    -[CPLCloudKitUploadBatchTask _uploadRecords:deleteRecordIDs:identification:fromPlanner:uploadContext:updateProgress:completionHandler:]( self,  "_uploadRecords:deleteRecordIDs:identification:fromPlanner:uploadContext:updateProgress:completionHandler:",  v8,  v9,  v11,  v14,  v10,  v17,  v13);
  }
}

- (void)_uploadSharedBatchFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedCKRecordsToUpload]);
  if ([v8 count] && self->_simulateOverQuotaPhase == 2)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10009824C;
    v20[3] = &unk_10023DBC8;
    id v21 = v7;
    id v9 = v7;
    -[CPLCloudKitTransportTask dispatchAsync:](self, "dispatchAsync:", v20);
    id v10 = v21;
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([v6 sharedCKRecordIDsToDelete]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 willUploadSharedRecords]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedZoneIdentification]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100098294;
    v17[3] = &unk_100242048;
    id v18 = v6;
    id v19 = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000982C8;
    v13[3] = &unk_100242070;
    id v15 = self;
    id v16 = v7;
    id v14 = v18;
    id v12 = v7;
    -[CPLCloudKitUploadBatchTask _uploadRecords:deleteRecordIDs:identification:fromPlanner:uploadContext:updateProgress:completionHandler:]( self,  "_uploadRecords:deleteRecordIDs:identification:fromPlanner:uploadContext:updateProgress:completionHandler:",  v8,  v9,  v11,  v14,  v10,  v17,  v13);
  }
}

- (void)_executeSharePlanFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sharePlan]);
  if ([v8 count])
  {
    if (self->_simulateOverQuotaPhase == 3)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100098514;
      v19[3] = &unk_10023DBC8;
      id v20 = v7;
      -[CPLCloudKitTransportTask dispatchAsync:](self, "dispatchAsync:", v19);
      id v9 = v20;
    }

    else
    {
      [v8 willUploadRecords];
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 ckRecordIDsToShare]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationZoneIdentification]);
      id v12 = [v11 operationType];
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 sharedCKRecordIDs]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedZoneIdentification]);
      id v15 = [v14 operationType];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10009855C;
      v16[3] = &unk_100242098;
      id v18 = v7;
      id v17 = v8;
      -[CPLCloudKitTransportTask moveRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:]( self,  "moveRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:",  v10,  1LL,  v12,  v13,  v15,  v17,  v16);

      id v9 = v18;
    }
  }

  else
  {
    -[CPLCloudKitUploadBatchTask _executeUnsharePlanFromPlanner:completionHandler:]( self,  "_executeUnsharePlanFromPlanner:completionHandler:",  v6,  v7);
  }
}

- (void)_executeUnsharePlanFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 unsharePlan]);
  if ([v8 count])
  {
    if (self->_simulateOverQuotaPhase == 4)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000987B8;
      v19[3] = &unk_10023DBC8;
      id v20 = v7;
      -[CPLCloudKitTransportTask dispatchAsync:](self, "dispatchAsync:", v19);
      id v9 = v20;
    }

    else
    {
      [v8 willUploadRecords];
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 ckRecordIDsToUnshare]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedZoneIdentification]);
      id v12 = [v11 operationType];
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 privateRecordIDs]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 destinationZoneIdentification]);
      id v15 = [v14 operationType];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100098800;
      v16[3] = &unk_100242098;
      id v18 = v7;
      id v17 = v8;
      -[CPLCloudKitTransportTask moveRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:]( self,  "moveRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:",  v10,  1LL,  v12,  v13,  v15,  v17,  v16);

      id v9 = v18;
    }
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (double)approximativeResourcesUploadRate
{
  return self->_approximativeResourcesUploadRate;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (void)setSharedScope:(id)a3
{
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLChangeBatch)batch
{
  return self->_batch;
}

- (void)setBatch:(id)a3
{
}

- (NSDate)cplEnabledDate
{
  return self->_cplEnabledDate;
}

- (void)setCplEnabledDate:(id)a3
{
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (void).cxx_destruct
{
}

@end