@interface CPLCloudKitDownloadBatchTask
+ (BOOL)forceUpdatePrimarySyncStateOnce;
+ (void)setForceUpdatePrimarySyncStateOnce:(BOOL)a3;
- (CKFetchRecordZoneChangesOperation)currentFetchRecordZoneChangesOperation;
- (CKServerChangeToken)syncAnchor;
- (CPLCloudKitDownloadBatchTask)initWithController:(id)a3 syncAnchor:(id)a4 scope:(id)a5 transportScopeMapping:(id)a6 currentScopeChange:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)scope;
- (CPLScopeChange)currentScopeChange;
- (id)_partnerScopesNeedingToPullChangesFromZoneIDsWithSyncObligations:(id)a3;
- (void)_downloadBatchWithCurrentUserID:(id)a3;
- (void)addPartnerScope:(id)a3 mostCurrentSyncAnchor:(id)a4;
- (void)runOperations;
- (void)runWithinSyncSession:(id)a3;
- (void)sendProgressBatch:(id)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 updatedSyncAnchor:(id)a6 zoneIDsWithSyncObligations:(id)a7;
- (void)setCurrentFetchRecordZoneChangesOperation:(id)a3;
@end

@implementation CPLCloudKitDownloadBatchTask

+ (BOOL)forceUpdatePrimarySyncStateOnce
{
  return byte_100296148;
}

+ (void)setForceUpdatePrimarySyncStateOnce:(BOOL)a3
{
  byte_100296148 = a3;
}

- (CPLCloudKitDownloadBatchTask)initWithController:(id)a3 syncAnchor:(id)a4 scope:(id)a5 transportScopeMapping:(id)a6 currentScopeChange:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v30 = a5;
  id v17 = a6;
  id v29 = a7;
  id v18 = a8;
  id v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___CPLCloudKitDownloadBatchTask;
  v20 = -[CPLCloudKitTransportTask initWithController:](&v35, "initWithController:", v15);
  if (v20)
  {
    objc_initWeak(&location, v20);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100052908;
    v31[3] = &unk_1002402D0;
    objc_copyWeak(&v33, &location);
    id v32 = v19;
    id v21 = [v31 copy];
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = v21;

    id v23 = [v18 copy];
    id progressHandler = v20->_progressHandler;
    v20->_id progressHandler = v23;

    if (v16)
    {
      id v25 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v16,  objc_opt_class(&OBJC_CLASS___CKServerChangeToken));
      uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
      syncAnchor = v20->_syncAnchor;
      v20->_syncAnchor = (CKServerChangeToken *)v26;
    }

    -[CPLCloudKitTransportTask setTransportScopeMapping:](v20, "setTransportScopeMapping:", v17);
    objc_storeStrong((id *)&v20->_scope, a5);
    objc_storeStrong((id *)&v20->_currentScopeChange, a7);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v20;
}

- (void)runWithinSyncSession:(id)a3
{
  id v4 = a3;
  kdebug_trace(721946576LL, -[CPLCloudKitDownloadBatchTask hash](self, "hash"), 0LL, 0LL, 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLCloudKitDownloadBatchTask;
  -[CPLCloudKitTransportTask runWithinSyncSession:](&v5, "runWithinSyncSession:", v4);
}

- (void)addPartnerScope:(id)a3 mostCurrentSyncAnchor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!self->_scopesBySupplementalZoneID)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    scopesBySupplementalZoneID = self->_scopesBySupplementalZoneID;
    self->_scopesBySupplementalZoneID = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    supplementalChangeTokenByZoneID = self->_supplementalChangeTokenByZoneID;
    self->_supplementalChangeTokenByZoneID = v11;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v13));

  if (!v14) {
    sub_100191BA0((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
  }
  id v15 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:class:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:class:",  v8,  objc_opt_class(&OBJC_CLASS___CKServerChangeToken));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v14 zoneID]);
    if (!v17) {
      sub_100191C80((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
    }
    id v18 = (void *)v17;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_supplementalChangeTokenByZoneID,  "setObject:forKeyedSubscript:",  v16,  v17);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_scopesBySupplementalZoneID,  "setObject:forKeyedSubscript:",  v7,  v18);
  }

  else if (!_CPLSilentLogging)
  {
    id v19 = sub_100052C30();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412546;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Invalid sync obligation change token for %@: %@",  (uint8_t *)&v21,  0x16u);
    }
  }
}

- (id)_partnerScopesNeedingToPullChangesFromZoneIDsWithSyncObligations:(id)a3
{
  id v4 = a3;
  if (-[NSMutableDictionary count](self->_supplementalChangeTokenByZoneID, "count")
    && (id v5 = [v4 count]) != 0)
  {
    v6 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v5);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v19 = v4;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_supplementalChangeTokenByZoneID,  "objectForKeyedSubscript:",  v12));

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_scopesBySupplementalZoneID,  "objectForKeyedSubscript:",  v12));
            if (v14)
            {
              if (!_CPLSilentLogging)
              {
                id v15 = sub_100052C30();
                id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  id v25 = v14;
                  __int16 v26 = 2114;
                  uint64_t v27 = v12;
                  _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@ needs to pull changes (sync obligation on %{public}@)",  buf,  0x16u);
                }
              }

              -[NSMutableArray addObject:](v6, "addObject:", v14);
            }

            -[NSMutableDictionary removeObjectForKey:]( self->_supplementalChangeTokenByZoneID,  "removeObjectForKey:",  v12);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }

      while (v9);
    }

    id v17 = -[NSMutableArray copy](v6, "copy");
    id v4 = v19;
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (void)sendProgressBatch:(id)a3 updatedScopeChange:(id)a4 updatedFlags:(id)a5 updatedSyncAnchor:(id)a6 zoneIDsWithSyncObligations:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v14)
  {
    id v16 = 0LL;
    if (!v12) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  v14));
  if (v12)
  {
LABEL_3:
    [v19 addRecord:v12];
    objc_storeStrong((id *)&self->_currentScopeChange, a4);
  }

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100053004;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v2);
}

- (void)_downloadBatchWithCurrentUserID:(id)a3
{
  id v47 = a3;
  id v96 = 0LL;
  unsigned __int8 v4 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v96);
  id v46 = v96;
  if ((v4 & 1) != 0)
  {
    scope = self->_scope;
    if (scope)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](scope, "scopeIdentifier"));
      v45 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v6));

      if (v45)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v45 zoneID]);
        v43 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration);
        -[CKFetchRecordZoneChangesConfiguration setPreviousServerChangeToken:]( v43,  "setPreviousServerChangeToken:",  self->_syncAnchor);
        -[CKFetchRecordZoneChangesConfiguration setResultsLimit:](v43, "setResultsLimit:", 200LL);
        id v7 = objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation);
        v101 = v42;
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v101, 1LL));
        v99 = v42;
        v100 = v43;
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v100,  &v99,  1LL));
        uint64_t v10 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( v7,  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v8,  v9);

        -[CKFetchRecordZoneChangesOperation setFetchAllChanges:](v10, "setFetchAllChanges:", 1LL);
        supplementalChangeTokenByZoneID = self->_supplementalChangeTokenByZoneID;
        if (supplementalChangeTokenByZoneID)
        {
          id v12 = -[NSMutableDictionary copy](supplementalChangeTokenByZoneID, "copy");
          -[CKFetchRecordZoneChangesOperation setSupplementalChangeTokenByZoneID:]( v10,  "setSupplementalChangeTokenByZoneID:",  v12);
        }

        v94[0] = 0LL;
        v94[1] = v94;
        v94[2] = 0x3032000000LL;
        v94[3] = sub_100053984;
        v94[4] = sub_100053994;
        v95 = objc_alloc_init(&OBJC_CLASS___CPLChangeBatch);
        v92[0] = 0LL;
        v92[1] = v92;
        v92[2] = 0x3032000000LL;
        v92[3] = sub_100053984;
        v92[4] = sub_100053994;
        id v93 = 0LL;
        v90[0] = 0LL;
        v90[1] = v90;
        v90[2] = 0x3032000000LL;
        v90[3] = sub_100053984;
        v90[4] = sub_100053994;
        id v91 = 0LL;
        v89[0] = 0LL;
        v89[1] = v89;
        v89[2] = 0x2020000000LL;
        v89[3] = 0LL;
        v87[0] = 0LL;
        v87[1] = v87;
        v87[2] = 0x2020000000LL;
        char v88 = 0;
        v85[0] = 0LL;
        v85[1] = v85;
        v85[2] = 0x3032000000LL;
        v85[3] = sub_100053984;
        v85[4] = sub_100053994;
        id v86 = 0LL;
        -[CKFetchRecordZoneChangesOperation setShouldFetchAssetContents:](v10, "setShouldFetchAssetContents:", 0LL);
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLRecordChange assetTransferOptionsByRecordTypeAndKey]( &OBJC_CLASS___CPLRecordChange,  "assetTransferOptionsByRecordTypeAndKey"));
        -[CKFetchRecordZoneChangesOperation setAssetTransferOptionsByRecordTypeAndKey:]( v10,  "setAssetTransferOptionsByRecordTypeAndKey:",  v13);

        v83[0] = 0LL;
        v83[1] = v83;
        v83[2] = 0x3032000000LL;
        v83[3] = sub_100053984;
        v83[4] = sub_100053994;
        v84 = self->_syncAnchor;
        v81[0] = 0LL;
        v81[1] = v81;
        v81[2] = 0x2020000000LL;
        char v82 = 0;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneIdentificationForCloudKitScope:v45 engineScope:self->_scope]);

        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
        if (+[CPLCloudKitDownloadBatchTask forceUpdatePrimarySyncStateOnce]( &OBJC_CLASS___CPLCloudKitDownloadBatchTask,  "forceUpdatePrimarySyncStateOnce"))
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 mainScopeIdentifier]);
          unsigned int v18 = [v15 isEqualToString:v17];

          if (v18)
          {
            if (!_CPLSilentLogging)
            {
              id v19 = sub_100052C30();
              __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v21 = self->_scope;
                *(_DWORD *)buf = 138412290;
                v98 = v21;
                _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Forcing update of library state for %@",  buf,  0xCu);
              }
            }

            __int128 v22 = objc_alloc(&OBJC_CLASS___CKRecord);
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v41 recordIDWithRecordName:@"PrimarySync-0000-ZS"]);
            id v24 = -[CKRecord initWithRecordType:recordID:]( v22,  "initWithRecordType:recordID:",  @"CPLZoneState",  v23);

            id v25 = (void *)objc_claimAutoreleasedReturnValue( [v41 updatedScopeChangeFromScopeChange:self->_currentScopeChange currentUserID:v47 withCKRecord:v24]);
            if (v25)
            {
              __int16 v26 = objc_alloc_init(&OBJC_CLASS___CPLChangeBatch);
              -[CPLCloudKitDownloadBatchTask sendProgressBatch:updatedScopeChange:updatedFlags:updatedSyncAnchor:zoneIDsWithSyncObligations:]( self,  "sendProgressBatch:updatedScopeChange:updatedFlags:updatedSyncAnchor:zoneIDsWithSyncObligations:",  v26,  v25,  0LL,  self->_syncAnchor,  0LL);
            }

            +[CPLCloudKitDownloadBatchTask setForceUpdatePrimarySyncStateOnce:]( &OBJC_CLASS___CPLCloudKitDownloadBatchTask,  "setForceUpdatePrimarySyncStateOnce:",  0LL,  v41);
          }
        }

        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472LL;
        v72[2] = sub_10005399C;
        v72[3] = &unk_1002402F8;
        v77 = v89;
        v76 = v81;
        v72[4] = self;
        id v27 = v15;
        id v73 = v27;
        id v28 = v47;
        id v74 = v28;
        id v29 = v41;
        id v75 = v29;
        v78 = v94;
        v79 = v92;
        v80 = v90;
        -[CKFetchRecordZoneChangesOperation setRecordWasChangedBlock:](v10, "setRecordWasChangedBlock:", v72);
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472LL;
        v63[2] = sub_100053E00;
        v63[3] = &unk_100240320;
        v67 = v81;
        v68 = v89;
        v63[4] = self;
        v69 = v92;
        id v30 = v29;
        id v64 = v30;
        id v65 = v28;
        v70 = v90;
        id v31 = v27;
        id v66 = v31;
        v71 = v94;
        -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:]( v10,  "setRecordWithIDWasDeletedBlock:",  v63);
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472LL;
        v62[2] = sub_100054030;
        v62[3] = &unk_100240370;
        v62[4] = self;
        v62[5] = v81;
        v62[6] = v85;
        v62[7] = v83;
        v62[8] = v87;
        id v32 = objc_retainBlock(v62);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472LL;
        v61[2] = sub_1000542B0;
        v61[3] = &unk_100240398;
        v61[4] = self;
        v61[5] = v81;
        v61[6] = v89;
        v61[7] = v83;
        v61[8] = v94;
        v61[9] = v92;
        v61[10] = v90;
        id v33 = objc_retainBlock(v61);
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472LL;
        v56[2] = sub_1000544F8;
        v56[3] = &unk_1002403C0;
        v60 = v81;
        id v34 = v42;
        id v57 = v34;
        v58 = self;
        objc_super v35 = v33;
        id v59 = v35;
        -[CKFetchRecordZoneChangesOperation setRecordZoneChangeTokensUpdatedBlock:]( v10,  "setRecordZoneChangeTokensUpdatedBlock:",  v56);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_100054654;
        v48[3] = &unk_1002403E8;
        v52 = v81;
        id v36 = v34;
        SEL v55 = a2;
        id v49 = v36;
        v50 = self;
        v37 = v35;
        id v51 = v37;
        v53 = v85;
        v54 = v87;
        -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:]( v10,  "setRecordZoneFetchCompletionBlock:",  v48);
        -[CKFetchRecordZoneChangesOperation setFetchRecordZoneChangesCompletionBlock:]( v10,  "setFetchRecordZoneChangesCompletionBlock:",  v32);
        -[CPLCloudKitDownloadBatchTask setCurrentFetchRecordZoneChangesOperation:]( self,  "setCurrentFetchRecordZoneChangesOperation:",  v10);
        -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v10,  CPLCloudKitOperationTypeForScope(v45),  0LL);

        _Block_object_dispose(v81, 8);
        _Block_object_dispose(v83, 8);

        _Block_object_dispose(v85, 8);
        _Block_object_dispose(v87, 8);
        _Block_object_dispose(v89, 8);
        _Block_object_dispose(v90, 8);

        _Block_object_dispose(v92, 8);
        _Block_object_dispose(v94, 8);
      }

      else
      {
        id completionHandler = self->_completionHandler;
        id v36 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone"));
        (*((void (**)(id, void, void, void, id))completionHandler + 2))( completionHandler,  0LL,  0LL,  0LL,  v36);
      }
    }

    else
    {
      id v38 = self->_completionHandler;
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required scope"));
      (*((void (**)(id, void, void, void, void *))v38 + 2))(v38, 0LL, 0LL, 0LL, v39);
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (CKServerChangeToken)syncAnchor
{
  return self->_syncAnchor;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLScopeChange)currentScopeChange
{
  return self->_currentScopeChange;
}

- (CKFetchRecordZoneChangesOperation)currentFetchRecordZoneChangesOperation
{
  return self->_currentFetchRecordZoneChangesOperation;
}

- (void)setCurrentFetchRecordZoneChangesOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end