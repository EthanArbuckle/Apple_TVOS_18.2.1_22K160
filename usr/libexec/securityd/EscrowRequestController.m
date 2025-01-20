@interface EscrowRequestController
- (BOOL)forceIgnoreCloudServicesRateLimiting;
- (BOOL)haveRecordedDate;
- (CKKSLockStateTracker)lockStateTracker;
- (EscrowRequestController)initWithLockStateTracker:(id)a3;
- (OS_dispatch_queue)queue;
- (OctagonStateMachine)stateMachine;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (void)setForceIgnoreCloudServicesRateLimiting:(BOOL)a3;
- (void)setHaveRecordedDate:(BOOL)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)storePrerecordsInEscrowRPC:(id)a3;
- (void)triggerEscrowUpdateRPC:(id)a3 options:(id)a4 reply:(id)a5;
@end

@implementation EscrowRequestController

- (EscrowRequestController)initWithLockStateTracker:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___EscrowRequestController;
  v6 = -[EscrowRequestController init](&v18, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("EscrowRequestControllerQueue", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_lockStateTracker, a3);
    v11 = objc_alloc(&OBJC_CLASS___OctagonStateMachine);
    v20[0] = @"nothing_to_do";
    v20[1] = @"trigger_cloudservices";
    v21[0] = &off_1002AD290;
    v21[1] = &off_1002AD2A8;
    v20[2] = @"trigger_escrow_upload";
    v20[3] = @"wait_for_unlock";
    v21[2] = &off_1002AD2C0;
    v21[3] = &off_1002AD2D8;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  4LL));
    v19 = @"escrowrequest_inform_cloudservices";
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
    v15 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:]( v11,  "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:",  @"escrowrequest",  v12,  v14,  @"nothing_to_do",  v6->_queue,  v6,  @"com.apple.security.escrowrequest.state",  v5,  0LL);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = v15;

    v6->_forceIgnoreCloudServicesRateLimiting = 0;
  }

  return v6;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  dispatch_queue_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  if ([v8 _onqueueContains:@"escrowrequest_inform_cloudservices"])
  {
    [v8 _onqueueRemoveFlag:@"escrowrequest_inform_cloudservices"];
LABEL_4:
    v10 = objc_alloc(&OBJC_CLASS___EscrowRequestInformCloudServicesOperation);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
    v12 = -[EscrowRequestInformCloudServicesOperation initWithIntendedState:errorState:lockStateTracker:]( v10,  "initWithIntendedState:errorState:lockStateTracker:",  @"nothing_to_do",  @"nothing_to_do",  v11);
LABEL_5:
    v13 = v12;
LABEL_6:

    goto LABEL_7;
  }

  if ([v7 isEqualToString:@"trigger_escrow_upload"])
  {
    v15 = objc_alloc(&OBJC_CLASS___EscrowRequestPerformEscrowEnrollOperation);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
    v12 = -[EscrowRequestPerformEscrowEnrollOperation initWithIntendedState:errorState:enforceRateLimiting:lockStateTracker:]( v15,  "initWithIntendedState:errorState:enforceRateLimiting:lockStateTracker:",  @"nothing_to_do",  @"nothing_to_do",  1LL,  v11);
    goto LABEL_5;
  }

  if ([v7 isEqualToString:@"wait_for_unlock"])
  {
    v16 = sub_10001267C("escrowrequest");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "waiting for unlock before continuing with state machine",  buf,  2u);
    }

    v13 = (EscrowRequestInformCloudServicesOperation *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"wait-for-unlock",  @"nothing_to_do"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v11 unlockDependency]);
    -[EscrowRequestInformCloudServicesOperation addNullableDependency:](v13, "addNullableDependency:", v18);

    goto LABEL_6;
  }

  id v60 = 0LL;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadAllFromKeychain:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadAllFromKeychain:",  &v60));
  id v20 = v60;
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
    unsigned int v22 = [v21 isLockedError:v20];

    if (v22)
    {
      v13 = (EscrowRequestInformCloudServicesOperation *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"wait-for-unlock",  @"wait_for_unlock"));
    }

    else
    {
      v46 = sub_10001267C("escrowrequest");
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "failed to fetch records from keychain, nothing to do: %@",  buf,  0xCu);
      }

      v13 = 0LL;
    }

    goto LABEL_50;
  }

  v54 = v19;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v23 = v19;
  id v24 = [v23 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (!v24) {
    goto LABEL_42;
  }
  id v25 = v24;
  uint64_t v26 = *(void *)v57;
  while (2)
  {
    v27 = 0LL;
    id v55 = v25;
    do
    {
      if (*(void *)v57 != v26) {
        objc_enumerationMutation(v23);
      }
      v28 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)v27);
      if (![v28 hasUploadCompleted]
        || ([v28 uploadCompleted] & 1) == 0)
      {
        if (!-[EscrowRequestController haveRecordedDate](self, "haveRecordedDate"))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
          v30 = (void *)objc_claimAutoreleasedReturnValue([v29 datePropertyForKey:@"ERSPending"]);

          if (!v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
            uint64_t v32 = v26;
            id v33 = v23;
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            [v31 setDateProperty:v34 forKey:@"ERSPending"];

            id v23 = v33;
            uint64_t v26 = v32;
            id v25 = v55;
          }

          -[EscrowRequestController setHaveRecordedDate:](self, "setHaveRecordedDate:", 1LL);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v35 timeIntervalSince1970];
        double v37 = v36;

        if ([v28 certCached])
        {
          unsigned int v38 = [v28 escrowAttemptedWithinLastSeconds:300.0];
          v39 = sub_10001267C("escrowrequest");
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
          if (!v38)
          {
            if (v41)
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue([v28 uuid]);
              *(_DWORD *)buf = 138412290;
              id v63 = v53;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Request %@ needs to be stored!",  buf,  0xCu);
            }

            v51 = @"escrow-request-attempt-escrow-upload";
            v52 = @"trigger_escrow_upload";
LABEL_49:
            v13 = (EscrowRequestInformCloudServicesOperation *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  v51,  v52));
            id v20 = 0LL;
            v19 = v54;

            goto LABEL_50;
          }

          if (!v41) {
            goto LABEL_39;
          }
          v42 = (void *)objc_claimAutoreleasedReturnValue([v28 uuid]);
          *(_DWORD *)buf = 138412290;
          id v63 = v42;
          v43 = v40;
          v44 = "Request %@ needs to be stored, but has been attempted recently. Holding off...";
        }

        else
        {
          if (-[EscrowRequestController forceIgnoreCloudServicesRateLimiting]( self,  "forceIgnoreCloudServicesRateLimiting")
            || ![v28 hasLastCloudServicesTriggerTime]
            || (unint64_t)[v28 lastCloudServicesTriggerTime] < 1000 * (unint64_t)v37
                                                                                   - 300000)
          {
            v48 = sub_10001267C("escrowrequest");
            v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue([v28 uuid]);
              *(_DWORD *)buf = 138412290;
              id v63 = v50;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Request %@ needs a cached certififcate",  buf,  0xCu);
            }

            v51 = @"escrow-request-cache-cert";
            v52 = @"trigger_cloudservices";
            goto LABEL_49;
          }

          v45 = sub_10001267C("escrowrequest");
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_39;
          }
          v42 = (void *)objc_claimAutoreleasedReturnValue([v28 uuid]);
          *(_DWORD *)buf = 138412290;
          id v63 = v42;
          v43 = v40;
          v44 = "Request %@ needs to cache a certificate, but that has been attempted recently. Holding off...";
        }

        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 0xCu);

LABEL_39:
      }

- (void)triggerEscrowUpdateRPC:(id)a3 options:(id)a4 reply:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController stateMachine](self, "stateMachine"));
  [v9 startOperation];

  id v66 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[SecEscrowPendingRecord loadAllFromKeychain:]( &OBJC_CLASS___SecEscrowPendingRecord,  "loadAllFromKeychain:",  &v66));
  id v11 = v66;
  v12 = v11;
  if (!v11)
  {
LABEL_4:

    v15 = sub_10001267C("escrowrequest");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Investigating a new escrow request", buf, 2u);
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:SecEscrowRequestOptionFederationMove]);
    __int128 v59 = (void *)v17;
    __int128 v56 = self;
    if (v17)
    {
      uint64_t v18 = v17;
      v19 = sub_10001267C("escrowrequest");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v69 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Move requested to federation %@",  buf,  0xCu);
      }

      id v21 = objc_alloc_init(&OBJC_CLASS___SecureBackupEscrowReason);
      [v21 setReason:1];
      [v21 setExpectedFederationID:v18];
    }

    else
    {
      id v21 = 0LL;
    }

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    id v24 = v10;
    id v25 = [v24 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v25)
    {
      id v26 = v25;
      __int128 v57 = v8;
      id v58 = v7;
      char v27 = 0;
      uint64_t v28 = *(void *)v63;
      while (2)
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v63 != v28) {
            objc_enumerationMutation(v24);
          }
          v30 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
          if (([v30 uploadCompleted] & 1) == 0
            && ([v30 hasAltDSID] & 1) == 0)
          {
            v31 = sub_10001267C("escrowrequest");
            uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v69 = (uint64_t)v30;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Retriggering an existing escrow request: %@",  buf,  0xCu);
            }

            [v30 setHasCertCached:0];
            [v30 setSerializedPrerecord:0];
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v21 data]);
            [v30 setSerializedReason:v33];

            id v61 = 0LL;
            [v30 saveToKeychain:&v61];
            id v34 = v61;
            if (v34)
            {
              v12 = v34;
              double v37 = sub_10001267C("SecError");
              unsigned int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v69 = (uint64_t)v12;
                _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "escrowrequest: Unable to save modified request to keychain: %@",  buf,  0xCu);
              }

              id v8 = v57;
              v57[2](v57, v12);

              id v7 = v58;
              goto LABEL_46;
            }

            v35 = sub_10001267C("escrowrequest");
            double v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Retriggering an existing escrow request complete",  buf,  2u);
            }

            char v27 = 1;
          }
        }

        id v26 = [v24 countByEnumeratingWithState:&v62 objects:v67 count:16];
        if (v26) {
          continue;
        }
        break;
      }

      id v8 = v57;
      id v7 = v58;
      if ((v27 & 1) != 0) {
        goto LABEL_45;
      }
    }

    else
    {
    }

    v39 = sub_10001267C("escrowrequest");
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Creating a new escrow request", buf, 2u);
    }

    BOOL v41 = objc_alloc_init(&OBJC_CLASS___SecEscrowPendingRecord);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 UUIDString]);
    -[SecEscrowPendingRecord setUuid:](v41, "setUuid:", v43);

    -[SecEscrowPendingRecord setAltDSID:](v41, "setAltDSID:", 0LL);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v44 timeIntervalSince1970];
    -[SecEscrowPendingRecord setTriggerRequestTime:](v41, "setTriggerRequestTime:", 1000 * (unint64_t)v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue([v21 data]);
    -[SecEscrowPendingRecord setSerializedReason:](v41, "setSerializedReason:", v46);

    v47 = sub_10001267C("escrowrequest");
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord uuid](v41, "uuid"));
      *(_DWORD *)buf = 138412290;
      uint64_t v69 = (uint64_t)v49;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "beginning a new escrow request (%@)",  buf,  0xCu);
    }

    id v60 = 0LL;
    -[SecEscrowPendingRecord saveToKeychain:](v41, "saveToKeychain:", &v60);
    id v50 = v60;
    if (v50)
    {
      v12 = v50;
      v51 = sub_10001267C("SecError");
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v69 = (uint64_t)v12;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "escrowrequest: unable to save escrow update request: %@",  buf,  0xCu);
      }

      v8[2](v8, v12);
      goto LABEL_46;
    }

LABEL_45:
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v53 setDateProperty:v54 forKey:@"ERSPending"];

    -[EscrowRequestController setHaveRecordedDate:](v56, "setHaveRecordedDate:", 1LL);
    id v55 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController stateMachine](v56, "stateMachine"));
    [v55 handleFlag:@"escrowrequest_inform_cloudservices"];

    v8[2](v8, 0LL);
    v12 = 0LL;
LABEL_46:

    goto LABEL_47;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
  if ([v13 isEqualToString:NSOSStatusErrorDomain])
  {
    id v14 = [v12 code];

    if (v14 == (id)-25300LL) {
      goto LABEL_4;
    }
  }

  else
  {
  }

  unsigned int v22 = sub_10001267C("escrowrequest");
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v69 = (uint64_t)v12;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "failed to fetch records from keychain: %@",  buf,  0xCu);
  }

  v8[2](v8, v12);
LABEL_47:
}

- (void)storePrerecordsInEscrowRPC:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___EscrowRequestPerformEscrowEnrollOperation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController lockStateTracker](self, "lockStateTracker"));
  id v7 = -[EscrowRequestPerformEscrowEnrollOperation initWithIntendedState:errorState:enforceRateLimiting:lockStateTracker:]( v5,  "initWithIntendedState:errorState:enforceRateLimiting:lockStateTracker:",  @"nothing_to_do",  @"nothing_to_do",  0LL,  v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController stateMachine](self, "stateMachine"));
  [v8 startOperation];

  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowRequestController stateMachine](self, "stateMachine"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"nothing_to_do"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100034E8C;
  v13[3] = &unk_100285D40;
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  v12 = v7;
  [v9 doSimpleStateMachineRPC:@"trigger-escrow-store" op:v12 sourceStates:v10 reply:v13];
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (BOOL)forceIgnoreCloudServicesRateLimiting
{
  return self->_forceIgnoreCloudServicesRateLimiting;
}

- (void)setForceIgnoreCloudServicesRateLimiting:(BOOL)a3
{
  self->_forceIgnoreCloudServicesRateLimiting = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (BOOL)haveRecordedDate
{
  return self->_haveRecordedDate;
}

- (void)setHaveRecordedDate:(BOOL)a3
{
  self->_haveRecordedDate = a3;
}

- (void).cxx_destruct
{
}

@end