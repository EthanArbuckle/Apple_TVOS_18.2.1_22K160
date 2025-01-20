@interface CKKSOutgoingQueueOperation
+ (id)ontransactionFetchEntries:(id)a3 contextID:(id)a4 error:(id *)a5;
- (BOOL)_onqueueIsErrorMissingSyncKey:(id)a3;
- (BOOL)intransactionIsErrorBadEtagOnKeyPointersOnly:(id)a3;
- (BOOL)isCKErrorBadEtagOnly:(id)a3;
- (CKKSOperationDependencies)deps;
- (CKKSOutgoingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 ckErrorState:(id)a5 errorState:(id)a6;
- (OctagonStateString)ckErrorState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (unint64_t)itemsProcessed;
- (void)_onqueueModifyAllRecords:(id)a3 as:(id)a4 viewState:(id)a5;
- (void)_onqueueModifyRecordAsError:(id)a3 recordError:(id)a4 viewState:(id)a5;
- (void)_onqueueSaveRecordsWithDelay:(id)a3 viewState:(id)a4;
- (void)groupStart;
- (void)modifyRecordsCompleted:(id)a3 fullUpload:(BOOL)a4 recordsToSave:(id)a5 recordIDsToDelete:(id)a6 recordIDsModified:(id)a7 modifyComplete:(id)a8 savedRecords:(id)a9 deletedRecordIDs:(id)a10 ckerror:(id)a11;
- (void)setCkErrorState:(id)a3;
- (void)setDeps:(id)a3;
- (void)setItemsProcessed:(unint64_t)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSOutgoingQueueOperation

- (CKKSOutgoingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 ckErrorState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CKKSOutgoingQueueOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->super._queue, a3);
    objc_storeStrong((id *)&v16->super._startOperation, a6);
    objc_storeStrong((id *)&v16->super._finishOperation, a4);
    objc_storeStrong((id *)&v16->_nextState, a5);
  }

  return v16;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 personaAdapter]);
  [v4 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v5 databaseProvider]);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 overallLaunch]);
  [v7 addEvent:@"process-outgoing-queue-begin"];

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v8 activeManagedViews]);

  id v9 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v9)
  {
    uint64_t v33 = *(void *)v41;
    uint64_t v29 = kSecurityRTCEventNameProcessOutgoingQueue;
    uint64_t v28 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
    do
    {
      id v34 = v9;
      for (i = 0LL; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 syncingPolicy]);
        if ([v13 isInheritedAccount])
        {
        }

        else
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 syncingPolicy]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
          unsigned __int8 v18 = [v15 isSyncingEnabledForView:v17];

          if ((v18 & 1) != 0)
          {
            v19 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
            v21 = (void *)objc_claimAutoreleasedReturnValue([v20 activeAccount]);
            v22 = (void *)objc_claimAutoreleasedReturnValue([v21 altDSID]);
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
            v24 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v19,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  &__NSDictionary0__struct,  v22,  v29,  0,  v28,  [v23 sendMetric]);

            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472LL;
            v35[2] = sub_100068430;
            v35[3] = &unk_100284378;
            v35[4] = v11;
            v35[5] = self;
            v25 = v24;
            v36 = v25;
            id v37 = v31;
            objc_copyWeak(&v38, &location);
            [v30 dispatchSyncWithSQLTransaction:v35];
            objc_destroyWeak(&v38);

            goto LABEL_12;
          }
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
        id v27 = sub_1000AA6AC(@"ckksoutgoing", v26);
        v25 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue(v27);

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Item syncing for this view is disabled",  buf,  2u);
        }

- (void)modifyRecordsCompleted:(id)a3 fullUpload:(BOOL)a4 recordsToSave:(id)a5 recordIDsToDelete:(id)a6 recordIDsModified:(id)a7 modifyComplete:(id)a8 savedRecords:(id)a9 deletedRecordIDs:(id)a10 ckerror:(id)a11
{
  BOOL v54 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v50 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a8;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 databaseProvider]);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_100066B88;
  v55[3] = &unk_1002843A0;
  id v24 = v19;
  id v56 = v24;
  id v25 = v15;
  id v57 = v25;
  id v52 = v21;
  id v58 = v52;
  v59 = self;
  id v53 = v16;
  id v60 = v53;
  id v26 = v17;
  id v61 = v26;
  id v27 = v18;
  id v62 = v27;
  id v28 = v50;
  id v63 = v28;
  [v23 dispatchSyncWithSQLTransaction:v55];

  if (v24) {
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation ckErrorState](self, "ckErrorState"));
  }
  else {
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation intendedState](self, "intendedState"));
  }
  v30 = (void *)v29;
  -[CKKSOutgoingQueueOperation setNextState:](self, "setNextState:", v29, v50);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSGroupOperation operationQueue](self, "operationQueue"));
  [v31 addOperation:v20];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneID]);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 zoneName]);
  id v34 = sub_1000AA6AC(@"ckksoutgoing", v33);
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);

  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    if (v54) {
      v36 = @"full";
    }
    else {
      v36 = @"non-full";
    }
    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
    *(_DWORD *)buf = 138412546;
    v65 = v36;
    __int16 v66 = 2112;
    v67 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Considering retry after a %@ upload with error: %@",  buf,  0x16u);
  }

  if (v54
    || (id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error")),
        v38,
        v38))
  {
    id v51 = v28;
    if (v24)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 reachabilityTracker]);
      else {
        uint64_t v41 = 0LL;
      }
    }

    else
    {
      uint64_t v41 = 0LL;
    }

    __int128 v42 = -[OctagonPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"process_outgoing_queue",  v41,  0.2);
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 flagHandler]);
    [v44 handlePendingFlag:v42];

    if (!v54 || (__int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"))) != 0LL)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error", v28, v52, v53));
      unsigned int v46 = -[CKKSOutgoingQueueOperation isCKErrorBadEtagOnly:](self, "isCKErrorBadEtagOnly:", v45);

      if (v54)
      {

        if ((v46 & 1) == 0) {
          goto LABEL_24;
        }
      }

      else if (!v46)
      {
LABEL_24:

        id v28 = v51;
        goto LABEL_25;
      }
    }

    v47 = -[OctagonPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"oqo_token",  0LL,  0.2);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v48 flagHandler]);
    [v49 handlePendingFlag:v47];

    goto LABEL_24;
  }

- (void)_onqueueModifyRecordAsError:(id)a3 recordError:(id)a4 viewState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
  if ([v12 isEqualToString:@"classC"])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
  if ([v13 hasPrefix:@"Manifest:-:"])
  {

    goto LABEL_5;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
  unsigned __int8 v15 = [v14 hasPrefix:@"ManifestLeafRecord:-:"];

  if ((v15 & 1) == 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 contextID]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
    id v29 = 0LL;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry fromDatabase:state:contextID:zoneID:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "fromDatabase:state:contextID:zoneID:error:",  v16,  @"inflight",  v18,  v19,  &v29));
    id v21 = v29;

    id v28 = v21;
    [v20 intransactionMarkAsError:v9 viewState:v10 error:&v28];
    id v22 = v28;

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneName]);
      id v25 = sub_1000AA6AC(@"ckksoutgoing", v24);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);

      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
        *(_DWORD *)buf = 138412546;
        v31 = v27;
        __int16 v32 = 2112;
        id v33 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Couldn't set OQE %@ as error: %@",  buf,  0x16u);
      }

      -[CKKSResultOperation setError:](self, "setError:", v22);
    }
  }

- (void)_onqueueSaveRecordsWithDelay:(id)a3 viewState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 1800.0));
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v5;
  id v37 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v37)
  {
    id v8 = 0LL;
    uint64_t v36 = *(void *)v42;
    *(void *)&__int128 v7 = 138412802LL;
    __int128 v33 = v7;
    do
    {
      for (i = 0LL; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName", v33));
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 contextID]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
        __int128 v40 = v8;
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry fromDatabase:state:contextID:zoneID:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "fromDatabase:state:contextID:zoneID:error:",  v11,  @"inflight",  v13,  v14,  &v40));
        id v16 = v40;

        if (v16 || !v15)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 zoneName]);
          id v30 = sub_1000AA6AC(@"ckksoutgoing", v29);
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);

          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
            *(_DWORD *)buf = 138412546;
            unsigned int v46 = v32;
            __int16 v47 = 2112;
            v48 = v16;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Couldn't fetch OQE %@: %@", buf, 0x16u);
          }

          -[CKKSResultOperation setError:](self, "setError:", v16);
          id v8 = (__CFString *)v16;
        }

        else
        {
          [v15 setWaitUntil:v34];
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
          id v19 = sub_1000AA6AC(@"ckksoutgoing", v18);
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
            id v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 waitUntil]);
            *(_DWORD *)buf = 138412546;
            unsigned int v46 = v21;
            __int16 v47 = 2112;
            v48 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Saving OQE %@ scheduled for retry at: %@",  buf,  0x16u);
          }

          id v39 = 0LL;
          [v15 intransactionMoveToState:@"new" viewState:v6 error:&v39];
          id v8 = (__CFString *)v39;
          if (v8)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneName]);
            id v25 = sub_1000AA6AC(@"ckksoutgoing", v24);
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);

            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
              *(_DWORD *)buf = v33;
              unsigned int v46 = v27;
              __int16 v47 = 2112;
              v48 = @"new";
              __int16 v49 = 2112;
              id v50 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Couldn't save OQE %@ as %@: %@",  buf,  0x20u);
            }

            -[CKKSResultOperation setError:](self, "setError:", v8);
          }
        }
      }

      id v37 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    }

    while (v37);
  }
}

- (void)_onqueueModifyAllRecords:(id)a3 as:(id)a4 viewState:(id)a5
{
  id v7 = a3;
  id v35 = a4;
  id v37 = a5;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (!v8)
  {
    id v11 = 0LL;
    uint64_t v12 = 0LL;
    goto LABEL_19;
  }

  id v10 = v8;
  id v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = *(void *)v43;
  *(void *)&__int128 v9 = 138412802LL;
  __int128 v32 = v9;
  uint64_t v33 = *(void *)v43;
  id v34 = v7;
  do
  {
    id v14 = 0LL;
    id v39 = v10;
    do
    {
      if (*(void *)v43 != v13) {
        objc_enumerationMutation(v7);
      }
      unsigned __int8 v15 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordName", v32));
      if (([v16 isEqualToString:@"classA"] & 1) == 0)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 recordName]);
        unsigned __int8 v18 = [v17 isEqualToString:@"classC"];

        if ((v18 & 1) != 0)
        {
          id v10 = v39;
          goto LABEL_15;
        }

        id v38 = (void *)objc_claimAutoreleasedReturnValue([v15 recordName]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOutgoingQueueOperation deps](self, "deps"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 contextID]);
        uint64_t v21 = v12;
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v37 zoneID]);
        id v41 = v11;
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry fromDatabase:state:contextID:zoneID:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "fromDatabase:state:contextID:zoneID:error:",  v38,  @"inflight",  v20,  v22,  &v41));
        id v23 = v41;

        uint64_t v24 = v21;
        id v40 = v23;
        [v16 intransactionMoveToState:v35 viewState:v37 error:&v40];
        id v11 = v40;

        if (v11)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v37 zoneID]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneName]);
          id v27 = sub_1000AA6AC(@"ckksoutgoing", v26);
          id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);

          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v15 recordName]);
            *(_DWORD *)buf = v32;
            __int16 v49 = v29;
            __int16 v50 = 2112;
            id v51 = v35;
            __int16 v52 = 2112;
            id v53 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Couldn't set OQE %@ as %@: %@",  buf,  0x20u);
          }

          -[CKKSResultOperation setError:](self, "setError:", v11);
        }

        uint64_t v12 = v24 + 1;
        uint64_t v13 = v33;
        id v7 = v34;
        id v10 = v39;
      }

LABEL_15:
      id v14 = (char *)v14 + 1;
    }

    while (v10 != v14);
    id v10 = [v7 countByEnumeratingWithState:&v42 objects:v54 count:16];
  }

  while (v10);
LABEL_19:
  if ([v35 isEqualToString:@"reencrypt"])
  {
    uint64_t v46 = SecCoreAnalyticsValue;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
    __int16 v47 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    +[SecCoreAnalytics sendEvent:event:]( &OBJC_CLASS___SecCoreAnalytics,  "sendEvent:event:",  @"com.apple.security.ckks.reencrypt",  v31);
  }
}

- (BOOL)_onqueueIsErrorMissingSyncKey:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v4 isEqualToString:CKErrorDomain])
  {
LABEL_12:

    goto LABEL_13;
  }

  id v5 = [v3 code];

  if (v5 == (id)2)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v4 = v7;
    id v8 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v12, (void)v20));
          if ([v13 isCKKSServerPluginError:2])
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
            id v18 = sub_1000AA6AC(@"ckksoutgoing", v17);
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);

            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v25 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Error is a 'missing record' error: %@",  buf,  0xCu);
            }

            BOOL v14 = 1;
            goto LABEL_14;
          }
        }

        id v9 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    goto LABEL_12;
  }

- (BOOL)intransactionIsErrorBadEtagOnKeyPointersOnly:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v4 isEqualToString:CKErrorDomain])
  {

    goto LABEL_17;
  }

  id v5 = [v3 code];

  if (v5 != (id)2)
  {
LABEL_17:
    BOOL v20 = 1;
    goto LABEL_22;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v22));
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
        if (![v15 isEqualToString:CKErrorDomain])
        {

LABEL_20:
          BOOL v20 = 0;
          goto LABEL_21;
        }

        id v16 = [v14 code];

        if (v16 != (id)14) {
          goto LABEL_20;
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 recordName]);
        if ([v17 isEqualToString:@"classA"])
        {
        }

        else
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 recordName]);
          unsigned __int8 v19 = [v18 isEqualToString:@"classC"];

          if ((v19 & 1) == 0) {
            goto LABEL_20;
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      BOOL v20 = 1;
      if (v10) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v20 = 1;
  }

- (BOOL)isCKErrorBadEtagOnly:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v4 isEqualToString:CKErrorDomain])
  {

    goto LABEL_19;
  }

  id v5 = [v3 code];

  if (v5 != (id)2)
  {
LABEL_19:
    BOOL v18 = 0;
    goto LABEL_25;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

  if (v7)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
LABEL_6:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v20 + 1) + 8 * v12),  (void)v20));
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
        id v15 = [v13 code];

        if (v15 != (id)14) {
          goto LABEL_13;
        }
LABEL_15:

        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_17;
        }
      }

LABEL_13:
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
      if (![v16 isEqualToString:CKErrorDomain])
      {

LABEL_22:
        BOOL v18 = 0;
        goto LABEL_23;
      }

      id v17 = [v13 code];

      if (v17 != (id)22) {
        goto LABEL_22;
      }
      goto LABEL_15;
    }

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136LL, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (unint64_t)itemsProcessed
{
  return (unint64_t)self->super._internalSuccesses;
}

- (void)setItemsProcessed:(unint64_t)a3
{
  self->super._internalSuccesses = (NSMutableArray *)a3;
}

- (OctagonStateString)ckErrorState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setCkErrorState:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)ontransactionFetchEntries:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v39 = a5;
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pendingCallbackUUIDs]);

  id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
  id v42 = v7;
  if (v10)
  {
    id v11 = v10;
    uint64_t v44 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v51 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)i);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID", v39));
        id v49 = 0LL;
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "tryFromDatabase:contextID:zoneID:error:",  v13,  v7,  v14,  &v49));
        id v16 = v49;

        if (v16)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
          id v19 = sub_1000AA6AC(@"ckksoutgoing", v18);
          __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v56 = v13;
            __int16 v57 = 2112;
            id v58 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Unable to fetch priority uuid %@: %@",  buf,  0x16u);
          }
        }

        else
        {
          if (!v15) {
            goto LABEL_18;
          }
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 state]);
          unsigned __int8 v22 = [v21 isEqualToString:@"new"];

          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneName]);
          id v25 = sub_1000AA6AC(@"ckksoutgoing", v24);
          __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);

          BOOL v26 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if ((v22 & 1) != 0)
          {
            if (v26)
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v56 = v13;
              __int16 v57 = 2112;
              id v58 = 0LL;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Found OQE  to fetch priority uuid %@: %@",  buf,  0x16u);
            }

            [v40 addObject:v15];
            __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 uuid]);
            [v41 addObject:v20];
          }

          else if (v26)
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v56 = v13;
            __int16 v57 = 2112;
            id v58 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Priority uuid %@ is not in 'new': %@",  buf,  0x16u);
          }

          id v7 = v42;
        }

LABEL_18:
      }

      id v11 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    }

    while (v11);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry fetch:state:contextID:zoneID:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "fetch:state:contextID:zoneID:error:",  100LL,  @"new",  v7,  v27,  v39));

  if (v28)
  {
    id v29 = [v40 mutableCopy];
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v30 = v28;
    id v31 = [v30 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v46;
LABEL_23:
      id v34 = 0LL;
      while (1)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v34);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 uuid]);
        unsigned __int8 v37 = [v41 containsObject:v36];

        if ((v37 & 1) == 0) {
          [v29 addObject:v35];
        }
        id v34 = (char *)v34 + 1;
        id v7 = v42;
        if (v32 == v34)
        {
          id v32 = [v30 countByEnumeratingWithState:&v45 objects:v54 count:16];
          if (v32) {
            goto LABEL_23;
          }
          break;
        }
      }
    }
  }

  else
  {
    id v29 = 0LL;
  }

  return v29;
}

@end