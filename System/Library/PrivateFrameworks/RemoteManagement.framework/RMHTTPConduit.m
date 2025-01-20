@interface RMHTTPConduit
+ (NSString)userAgent;
+ (id)_generateEnrollmentToken;
- (BOOL)_incrementConduitStateError:(signed __int16)a3 serverRetryAfter:(id)a4 error:(id *)a5;
- (BOOL)_prepareTask:(id)a3 withAuthenticationCredential:(id)a4 error:(id *)a5;
- (BOOL)_prepareURLRequest:(id)a3 withAuthenticationCredential:(id)a4 error:(id *)a5;
- (BOOL)_processErrorResponse:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)_processUnauthorizedResponse:(id)a3 shouldRetry:(BOOL *)a4 error:(id *)a5;
- (BOOL)_setRequestPayload:(id)a3 onURLRequest:(id)a4 error:(id *)a5;
- (BOOL)isSyncAllowed;
- (BOOL)madeChangesDuringSync;
- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (NSURLSession)session;
- (RMConduitDelegate)delegate;
- (RMHTTPConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4;
- (RMHTTPConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4 session:(id)a5;
- (RMPersistentHistoryNotifier)persistentHistoryNotifier;
- (id)_authenticationCredential;
- (id)_makeURLRequestWithManagementSource:(id)a3 method:(id)a4 endpoint:(id)a5;
- (id)_processResponse:(id)a3 data:(id)a4 payloadClassByStatusCode:(id)a5 shouldRetry:(BOOL *)a6 error:(id *)a7;
- (id)statusItemsToImplicitlySubscribeTo;
- (id)statusItemsToSendDuringEnrollment;
- (signed)errorState;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_didFinishEnrollingWithResponsePayload:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_didFinishFetchingDeclarationItems:(id)a3 response:(id)a4 error:(id)a5 lastReceivedPushTimestamp:(id)a6 completionHandler:(id)a7;
- (void)_didFinishFetchingObject:(id)a3 objectID:(id)a4 class:(Class)a5 endpoint:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9;
- (void)_didFinishFetchingServerTokens:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)_didFinishSendingStatusWithResponse:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_didFinishUnenrollingToldRemote:(BOOL)a3 completionHandler:(id)a4;
- (void)_didReceiveEnrollReferralWithOriginalRequest:(id)a3 responsePayload:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)_fetchDeclarationItemsOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_fetchNextObjectOfClass:(Class)a3 endpoint:(id)a4 completionHandler:(id)a5;
- (void)_fetchPartialObjectsWithCompletionHandler:(id)a3;
- (void)_fetchTokensOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_processDeclarationItemsWithContext:(id)a3 infos:(id)a4 declarationItemClass:(Class)a5 declarationItemKeyPath:(id)a6;
- (void)_resumeEnrollmentTaskForRequest:(id)a3 enrollmentToken:(id)a4 completionHandler:(id)a5;
- (void)_resumeTaskForRequest:(id)a3 enrollmentToken:(id)a4 expectedResponseClassByStatusCode:(id)a5 completionHandler:(id)a6;
- (void)_setBody:(id)a3 onURLRequest:(id)a4;
- (void)_startObservers;
- (void)_stopObservers;
- (void)_updateWithSyncTokens:(id)a3 completionHandler:(id)a4;
- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4;
- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4;
- (void)sendStatusData:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMadeChangesDuringSync:(BOOL)a3;
- (void)setPersistentHistoryNotifier:(id)a3;
- (void)setSession:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)unenrollWithCompletionHandler:(id)a3;
- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4;
- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation RMHTTPConduit

+ (NSString)userAgent
{
  if (qword_1000CF118 != -1) {
    dispatch_once(&qword_1000CF118, &stru_1000B9C10);
  }
  return (NSString *)(id)qword_1000CF110;
}

- (RMHTTPConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v8,  self,  0LL));

  v10 = -[RMHTTPConduit initWithManagementSourceObjectID:inContext:session:]( self,  "initWithManagementSourceObjectID:inContext:session:",  v7,  v6,  v9);
  return v10;
}

- (RMHTTPConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4 session:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RMHTTPConduit;
  v12 = -[RMHTTPConduit init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v13->_session, a5);
  }

  return v13;
}

- (void)startWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = _os_activity_create( (void *)&_mh_execute_header,  "HTTPConduit: starting",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000382B4();
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003033C;
  v8[3] = &unk_1000B90A0;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v9 = v7;
  id v10 = self;
  [v7 performBlockAndWait:v8];
  v4[2](v4);

  os_activity_scope_leave(&state);
}

- (void)_startObservers
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionAuthor]);
  v4 = -[RMPersistentHistoryNotifier initWithContext:]( objc_alloc(&OBJC_CLASS___RMPersistentHistoryNotifier),  "initWithContext:",  v6);
  -[RMPersistentHistoryNotifier setDelegate:](v4, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v3));
  -[RMPersistentHistoryNotifier setIgnoredTransactionAuthors:](v4, "setIgnoredTransactionAuthors:", v5);

  -[RMHTTPConduit setPersistentHistoryNotifier:](self, "setPersistentHistoryNotifier:", v4);
  -[RMPersistentHistoryNotifier start](v4, "start");
}

- (void)_stopObservers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit persistentHistoryNotifier](self, "persistentHistoryNotifier"));
  [v3 setDelegate:0];

  -[RMHTTPConduit setPersistentHistoryNotifier:](self, "setPersistentHistoryNotifier:", 0LL);
}

- (signed)errorState
{
  v2 = self;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  __int16 v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000305E8;
  v5[3] = &unk_1000B8DA8;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v6 = v3;
  id v7 = v2;
  v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOWORD(v2) = *((_WORD *)v10 + 12);

  _Block_object_dispose(&v9, 8);
  return (__int16)v2;
}

- (id)statusItemsToImplicitlySubscribeTo
{
  v5[0] = RMModelStatusItemManagementClientCapabilities;
  v5[1] = RMModelStatusItemManagementDeclarations;
  v5[2] = RMModelStatusItemManagementPushToken;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 3LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (id)statusItemsToSendDuringEnrollment
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  [v3 addObject:RMModelStatusItemManagementClientCapabilities];
  uint64_t v11 = 0LL;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003086C;
  v7[3] = &unk_1000B8DA8;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v8 = v4;
  uint64_t v9 = self;
  id v10 = &v11;
  [v4 performBlockAndWait:v7];
  if (*((_BYTE *)v12 + 24))
  {
    [v3 addObject:RMModelStatusItemDeviceSerialNumber];
    [v3 addObject:RMModelStatusItemDeviceUDID];
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "HTTPConduit: enrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100038340();
  }

  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = sub_100030BF4;
  v40 = sub_100030C04;
  id v41 = 0LL;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = sub_100030BF4;
  v34 = sub_100030C04;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_100030BF4;
  v28 = sub_100030C04;
  id v29 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100030C0C;
  v18[3] = &unk_1000B9C38;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v19 = v10;
  v20 = self;
  v21 = &v36;
  v22 = &v30;
  v23 = &v24;
  [v10 performBlockAndWait:v18];
  if (v37[5])
  {
    v7[2](v7);
  }

  else
  {
    uint64_t v11 = v25[5];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  v6));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[RMProtocolEnrollRequest requestWithEnrollmentToken:statusItems:]( &OBJC_CLASS___RMProtocolEnrollRequest,  "requestWithEnrollmentToken:statusItems:",  v11,  v12));

    uint64_t v14 = v31[5];
    id v17 = 0LL;
    LOBYTE(v11) = -[RMHTTPConduit _setRequestPayload:onURLRequest:error:]( self,  "_setRequestPayload:onURLRequest:error:",  v13,  v14,  &v17);
    id v15 = v17;
    if ((v11 & 1) != 0)
    {
      -[RMHTTPConduit _resumeEnrollmentTaskForRequest:enrollmentToken:completionHandler:]( self,  "_resumeEnrollmentTaskForRequest:enrollmentToken:completionHandler:",  v31[5],  v25[5],  v7);
    }

    else
    {
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_1000382E0();
      }

      ((void (*)(void (**)(void), id))v7[2])(v7, v15);
    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  os_activity_scope_leave(&state);
}

+ (id)_generateEnrollmentToken
{
  v2 = objc_opt_new(&OBJC_CLASS___NSUUID);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v2, "UUIDString"));

  return v3;
}

- (void)_resumeEnrollmentTaskForRequest:(id)a3 enrollmentToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17[0] = &off_1000BEB78;
  id v10 = a4;
  v17[1] = &off_1000BEB90;
  v18[0] = objc_opt_class(&OBJC_CLASS___RMProtocolEnrollReferralResponse);
  v18[1] = objc_opt_class(&OBJC_CLASS___RMProtocolEnrollResponse);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100030F7C;
  v14[3] = &unk_1000B9C60;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  -[RMHTTPConduit _resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:]( self,  "_resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:",  v13,  v10,  v11,  v14);
}

- (void)_didReceiveEnrollReferralWithOriginalRequest:(id)a3 responsePayload:(id)a4 response:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v35 = a3;
  id v12 = a4;
  id v34 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, id))a7;
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  id v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100038484();
    }

    v14[2](v14, v13);
  }

  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100038458();
    }

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v12 responseReferralBaseURL]);
    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:"));
      if (v33)
      {
        uint64_t v59 = 0LL;
        v60 = &v59;
        uint64_t v61 = 0x3032000000LL;
        v62 = sub_100030BF4;
        v63 = sub_100030C04;
        id v64 = 0LL;
        uint64_t v53 = 0LL;
        v54 = &v53;
        uint64_t v55 = 0x3032000000LL;
        v56 = sub_100030BF4;
        v57 = sub_100030C04;
        id v58 = 0LL;
        uint64_t v47 = 0LL;
        v48 = &v47;
        uint64_t v49 = 0x3032000000LL;
        v50 = sub_100030BF4;
        v51 = sub_100030C04;
        id v52 = 0LL;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_100031504;
        v40[3] = &unk_1000B9C88;
        id v41 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
        v42 = self;
        v44 = &v59;
        id v43 = v33;
        v45 = &v47;
        v46 = &v53;
        id v30 = v41;
        [v41 performBlockAndWait:v40];
        if (v60[5])
        {
          ((void (*)(void (**)(id, id)))v14[2])(v14);
        }

        else
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v35 URL]);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pathComponents]);

          v21 = (char *)[v20 count];
          if ((unint64_t)v21 >= 2)
          {
            uint64_t v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subarrayWithRange:", v21 - 2, 2));

            v20 = (void *)v22;
          }

          id v23 = (id)v48[5];
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          id v24 = v20;
          id v25 = [v24 countByEnumeratingWithState:&v36 objects:v65 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v37;
            do
            {
              v27 = 0LL;
              v28 = v23;
              do
              {
                if (*(void *)v37 != v26) {
                  objc_enumerationMutation(v24);
                }
                id v23 = (id)objc_claimAutoreleasedReturnValue( [v28 URLByAppendingPathComponent:*(void *)(*((void *)&v36 + 1) + 8 * (void)v27) isDirectory:0]);

                v27 = (char *)v27 + 1;
                v28 = v23;
              }

              while (v25 != v27);
              id v25 = [v24 countByEnumeratingWithState:&v36 objects:v65 count:16];
            }

            while (v25);
          }

          id v29 = [v35 mutableCopy];
          [v29 setURL:v23];
          -[RMHTTPConduit _resumeEnrollmentTaskForRequest:enrollmentToken:completionHandler:]( self,  "_resumeEnrollmentTaskForRequest:enrollmentToken:completionHandler:",  v29,  v54[5],  v14);
        }

        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v53, 8);

        _Block_object_dispose(&v59, 8);
      }

      else
      {
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000383F8();
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createCouldNotParseURLErrorWithString:]( &OBJC_CLASS___RMErrorUtilities,  "createCouldNotParseURLErrorWithString:",  v32));
        v14[2](v14, v31);
      }
    }

    else
    {
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000383CC();
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMissingReferralURLError]( &OBJC_CLASS___RMErrorUtilities,  "createMissingReferralURLError"));
      v14[2](v14, v33);
    }
  }
}

- (void)_didFinishEnrollingWithResponsePayload:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  if (v12)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003859C();
    }

    v13[2](v13, v12);
  }

  else
  {
    if (v10)
    {
      v23[0] = 0LL;
      v23[1] = v23;
      v23[2] = 0x3032000000LL;
      v23[3] = sub_100030BF4;
      v23[4] = sub_100030C04;
      id v24 = 0LL;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      void v17[2] = sub_100031970;
      v17[3] = &unk_1000B9CB0;
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
      id v18 = v15;
      id v19 = self;
      id v20 = v10;
      uint64_t v22 = v23;
      id v21 = v11;
      [v15 performBlockAndWait:v17];
      ((void (*)(void (**)(id, id)))v13[2])(v13);

      _Block_object_dispose(v23, 8);
    }

    else
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100038570();
      }

      id v15 = (id)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
      v13[2](v13, v15);
    }
  }
}

- (void)unenrollWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create( (void *)&_mh_execute_header,  "HTTPConduit: unenrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000385FC();
  }

  -[RMHTTPConduit _stopObservers](self, "_stopObservers");
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_100030BF4;
  v27 = sub_100030C04;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_100030BF4;
  id v21 = sub_100030C04;
  id v22 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100031E34;
  v12[3] = &unk_1000B9408;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = &v23;
  id v16 = &v17;
  [v7 performBlockAndWait:v12];
  uint64_t v8 = v24[5];
  if (v8)
  {
    uint64_t v9 = v18[5];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100031F10;
    v10[3] = &unk_1000B9CD8;
    v10[4] = self;
    id v11 = v4;
    -[RMHTTPConduit _resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:]( self,  "_resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:",  v8,  v9,  0LL,  v10);
  }

  else
  {
    -[RMHTTPConduit _didFinishUnenrollingToldRemote:completionHandler:]( self,  "_didFinishUnenrollingToldRemote:completionHandler:",  0LL,  v4);
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  os_activity_scope_leave(&state);
}

- (void)_didFinishUnenrollingToldRemote:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit session](self, "session"));
  [v7 finishTasksAndInvalidate];

  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_100030BF4;
  v13[4] = sub_100030C04;
  id v14 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100032168;
  v9[3] = &unk_1000B8DA8;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v10 = v8;
  id v11 = self;
  id v12 = v13;
  [v8 performBlockAndWait:v9];
  v6[2](v6, v4);

  _Block_object_dispose(v13, 8);
}

- (void)_fetchTokensOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create( (void *)&_mh_execute_header,  "HTTPConduit: fetching server tokens",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000386B4();
  }

  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_100030BF4;
  uint64_t v32 = sub_100030C04;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100030BF4;
  uint64_t v26 = sub_100030C04;
  id v27 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100032590;
  v16[3] = &unk_1000B9D00;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v17 = v9;
  id v18 = self;
  BOOL v21 = a3;
  uint64_t v19 = &v22;
  id v20 = &v28;
  [v9 performBlockAndWait:v16];
  uint64_t v10 = v29[5];
  if (v10)
  {
    uint64_t v11 = v23[5];
    id v35 = &off_1000BEB78;
    uint64_t v36 = objc_opt_class(&OBJC_CLASS___RMProtocolTokensResponse);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000327C4;
    v14[3] = &unk_1000B9CD8;
    v14[4] = self;
    id v15 = v6;
    -[RMHTTPConduit _resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:]( self,  "_resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:",  v10,  v11,  v12,  v14);
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100038688();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingServerTokens:(id)a3 response:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  if (v12)
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100038738();
    }

    v13[2](v13, v12);
  }

  else
  {
    uint64_t v23 = 0LL;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000LL;
    uint64_t v26 = sub_100030BF4;
    id v27 = sub_100030C04;
    id v28 = 0LL;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    void v18[2] = sub_1000329E0;
    v18[3] = &unk_1000B9D28;
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
    id v19 = v15;
    id v20 = self;
    id v21 = v10;
    uint64_t v22 = &v23;
    [v15 performBlockAndWait:v18];
    if (v24[5])
    {
      ((void (*)(void (**)(id, id)))v13[2])(v13);
    }

    else
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Successfully saved server tokens",  (uint8_t *)v17,  2u);
      }

      v13[2](v13, 0LL);
    }

    _Block_object_dispose(&v23, 8);
  }
}

- (BOOL)isSyncAllowed
{
  v2 = self;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100032C88;
  void v5[3] = &unk_1000B8DA8;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v6 = v3;
  id v7 = v2;
  id v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOBYTE(v2) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create( (void *)&_mh_execute_header,  "HTTPConduit: syncing only if needed",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002FAE4(v4, v8, v9, v10, v11, v12, v13, v14);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100032FD0;
  v32[3] = &unk_1000B9830;
  id v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v33 = v15;
  id v16 = objc_retainBlock(v32);
  -[RMHTTPConduit setMadeChangesDuringSync:](self, "setMadeChangesDuringSync:", 0LL);
  id v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100033040;
  v27[3] = &unk_1000B9DA0;
  id v18 = v16;
  id v30 = v18;
  id v19 = v17;
  id v28 = v19;
  id v29 = self;
  BOOL v31 = v4;
  -[RMHTTPConduit _fetchTokensOnlyIfNeeded:completionHandler:]( self,  "_fetchTokensOnlyIfNeeded:completionHandler:",  v4,  v27);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000331D0;
  v24[3] = &unk_1000B9DC8;
  uint64_t v25 = v15;
  id v26 = v6;
  v24[4] = self;
  uint64_t v22 = v15;
  id v23 = v6;
  dispatch_group_notify(v19, v21, v24);

  os_activity_scope_leave(&state);
}

- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4
{
  id v11 = 0LL;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[RMProtocolPushMessage loadData:serializationType:error:]( &OBJC_CLASS___RMProtocolPushMessage,  "loadData:serializationType:error:",  a3,  1LL,  &v11));
  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 messageSyncTokens]);
    -[RMHTTPConduit _updateWithSyncTokens:completionHandler:](self, "_updateWithSyncTokens:completionHandler:", v9, v6);

    id v6 = (id)v9;
  }

  else
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000387F8();
    }

    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (!v6)
  {
    uint64_t v10 = 0LL;
    goto LABEL_5;
  }

  id v13 = 0LL;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[RMProtocolTokensResponse loadData:serializationType:error:]( &OBJC_CLASS___RMProtocolTokensResponse,  "loadData:serializationType:error:",  v6,  1LL,  &v13));
  id v9 = v13;
  uint64_t v10 = v9;
  if (v8)
  {

    uint64_t v10 = (void *)v8;
LABEL_5:
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 responseSyncTokens]);
    -[RMHTTPConduit _updateWithSyncTokens:completionHandler:](self, "_updateWithSyncTokens:completionHandler:", v11, v7);

    goto LABEL_9;
  }

  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100038858();
  }

  v7[2](v7, v10);
LABEL_9:
}

- (void)_updateWithSyncTokens:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100030BF4;
  id v19 = sub_100030C04;
  id v20 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000335C4;
  v10[3] = &unk_1000B9D28;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v11 = v8;
  uint64_t v12 = self;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v15;
  [v8 performBlockAndWait:v10];
  v7[2](v7, v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (void)_fetchDeclarationItemsOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create( (void *)&_mh_execute_header,  "HTTPConduit: fetching declaration items",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000388E4();
  }

  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = sub_100030BF4;
  uint64_t v36 = sub_100030C04;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_100030BF4;
  id v30 = sub_100030C04;
  id v31 = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = sub_100030BF4;
  v24[4] = sub_100030C04;
  id v25 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  void v17[2] = sub_100033A50;
  v17[3] = &unk_1000B9DF0;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v18 = v9;
  id v19 = self;
  BOOL v23 = a3;
  id v20 = &v26;
  id v21 = v24;
  uint64_t v22 = &v32;
  [v9 performBlockAndWait:v17];
  uint64_t v10 = v33[5];
  if (v10)
  {
    uint64_t v11 = v27[5];
    __int128 v39 = &off_1000BEB78;
    uint64_t v40 = objc_opt_class(&OBJC_CLASS___RMProtocolDeclarationItemsResponse);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100033C98;
    v14[3] = &unk_1000B9E18;
    v14[4] = self;
    id v16 = v24;
    id v15 = v6;
    -[RMHTTPConduit _resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:]( self,  "_resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:",  v10,  v11,  v12,  v14);
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000388B8();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingDeclarationItems:(id)a3 response:(id)a4 error:(id)a5 lastReceivedPushTimestamp:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, id))a7;
  if (v14)
  {
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003893C();
    }

    v16[2](v16, v14);
  }

  else
  {
    uint64_t v26 = 0LL;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000LL;
    id v29 = sub_100030BF4;
    id v30 = sub_100030C04;
    id v31 = 0LL;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100033ED0;
    v21[3] = &unk_1000B9D28;
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
    id v22 = v18;
    BOOL v23 = self;
    id v24 = v12;
    id v25 = &v26;
    [v18 performBlockAndWait:v21];
    if (v27[5])
    {
      ((void (*)(void (**)(id, id)))v16[2])(v16);
    }

    else
    {
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Successfully saved partial object",  (uint8_t *)v20,  2u);
      }

      v16[2](v16, 0LL);
    }

    _Block_object_dispose(&v26, 8);
  }
}

- (void)_processDeclarationItemsWithContext:(id)a3 infos:(id)a4 declarationItemClass:(Class)a5 declarationItemKeyPath:(id)a6
{
  id v9 = a3;
  id v40 = a4;
  id v10 = a6;
  context = objc_autoreleasePoolPush();
  __int128 v39 = self;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit managementSourceObjectID](self, "managementSourceObjectID"));
  __int128 v38 = v9;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectWithID:v11]);

  id v37 = v12;
  id v35 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForKey:v10]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v13 count]));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v13;
  id v15 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 serverToken]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v20,  v21));
        [v14 setObject:v19 forKeyedSubscript:v22];
      }

      id v16 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }

    while (v16);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v41 = v40;
  id v23 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v41);
        }
        id v27 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 responseIdentifier]);
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 responseServerToken]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v28,  v29));
        uint64_t v31 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v30]);
        if (v31)
        {
          id v32 = (id)v31;
          [v14 removeObjectForKey:v30];
        }

        else
        {
          id v32 = [[a5 alloc] initWithContext:v38];
          [v32 setIdentifier:v28];
          [v32 setServerToken:v29];
          [v32 setManagementSource:v37];
          -[RMHTTPConduit setMadeChangesDuringSync:](v39, "setMadeChangesDuringSync:", 1LL);
        }
      }

      id v24 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }

    while (v24);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100034540;
  v43[3] = &unk_1000B9E40;
  v43[4] = v39;
  id v33 = v38;
  id v44 = v33;
  [v14 enumerateKeysAndObjectsUsingBlock:v43];

  objc_autoreleasePoolPop(context);
}

- (void)_fetchPartialObjectsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___RMActivationPayload);
  uint64_t v6 = RMProtocolEndpointDeclarationActivation;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000346C4;
  v8[3] = &unk_1000B9D50;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[RMHTTPConduit _fetchNextObjectOfClass:endpoint:completionHandler:]( self,  "_fetchNextObjectOfClass:endpoint:completionHandler:",  v5,  v6,  v8);
}

- (void)_fetchNextObjectOfClass:(Class)a3 endpoint:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v24 = _os_activity_create( (void *)&_mh_execute_header,  "HTTPConduit: fetching next object from server",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v24, &state);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = NSStringFromClass(a3);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    sub_100038B68(v12, (uint64_t)v60, v10);
  }

  uint64_t v50 = 0LL;
  __int128 v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  uint64_t v53 = sub_100030BF4;
  v54 = sub_100030C04;
  id v55 = 0LL;
  uint64_t v44 = 0LL;
  __int128 v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  __int128 v47 = sub_100030BF4;
  __int128 v48 = sub_100030C04;
  id v49 = 0LL;
  uint64_t v38 = 0LL;
  __int128 v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  id v41 = sub_100030BF4;
  v42 = sub_100030C04;
  id v43 = 0LL;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100034C90;
  v30[3] = &unk_1000B9E90;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v31 = v13;
  id v32 = self;
  Class v37 = a3;
  uint64_t v34 = &v38;
  id v14 = v8;
  id v33 = v14;
  id v35 = &v44;
  uint64_t v36 = &v50;
  [v13 performBlockAndWait:v30];
  uint64_t v15 = v51[5];
  if (!v15)
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = NSStringFromClass(a3);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      sub_100038ABC(v20, (uint64_t)v59, v18);
    }

    goto LABEL_10;
  }

  if (!v39[5])
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v21 = NSStringFromClass(a3);
      id v22 = (id)objc_claimAutoreleasedReturnValue(v21);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit managementSourceObjectID](self, "managementSourceObjectID"));
      sub_100038B04(v22, v23, (uint64_t)v59, v18);
    }

- (void)_didFinishFetchingObject:(id)a3 objectID:(id)a4 class:(Class)a5 endpoint:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void (**)(void))a9;
  id v21 = [v18 statusCode];
  if (v21 == (id)200 || !v19 || v21 == (id)404)
  {
    Class v26 = a5;
    *(void *)Class v37 = 0LL;
    *(void *)&v37[8] = v37;
    *(void *)&v37[16] = 0x3032000000LL;
    uint64_t v38 = sub_100030BF4;
    __int128 v39 = sub_100030C04;
    id v40 = 0LL;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100035208;
    v28[3] = &unk_1000B9EE0;
    id v23 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
    id v29 = v23;
    id v30 = self;
    id v31 = v16;
    id v32 = v19;
    id v24 = v17;
    id v33 = v24;
    id v34 = v15;
    id v35 = v18;
    uint64_t v36 = v37;
    [v23 performBlockAndWait:v28];
    if (*(void *)(*(void *)&v37[8] + 40LL))
    {
      v20[2](v20);
    }

    else
    {
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Successfully saved object, fetching next one",  buf,  2u);
      }

      -[RMHTTPConduit _fetchNextObjectOfClass:endpoint:completionHandler:]( self,  "_fetchNextObjectOfClass:endpoint:completionHandler:",  v26,  v24,  v20);
    }

    _Block_object_dispose(v37, 8);
  }

  else
  {
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)Class v37 = 138543874;
      *(void *)&v37[4] = v16;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v17;
      *(_WORD *)&v37[22] = 2114;
      uint64_t v38 = (uint64_t (*)(uint64_t, uint64_t))v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Error while fetching object %{public}@ (%{public}@): %{public}@",  v37,  0x20u);
    }

    ((void (*)(void (**)(void), id))v20[2])(v20, v19);
  }
}

- (void)sendStatusData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "HTTPConduit: sending status",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100038D1C();
  }

  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_100030BF4;
  id v31 = sub_100030C04;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_100030BF4;
  uint64_t v25 = sub_100030C04;
  id v26 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000357FC;
  v16[3] = &unk_1000B9408;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v17 = v10;
  id v18 = self;
  id v19 = &v21;
  id v20 = &v27;
  [v10 performBlockAndWait:v16];
  if (v28[5])
  {
    -[RMHTTPConduit _setBody:onURLRequest:](self, "_setBody:onURLRequest:", v6);
    uint64_t v11 = v28[5];
    uint64_t v12 = v22[5];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000358CC;
    v14[3] = &unk_1000B9CD8;
    v14[4] = self;
    id v15 = v7;
    -[RMHTTPConduit _resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:]( self,  "_resumeTaskForRequest:enrollmentToken:expectedResponseClassByStatusCode:completionHandler:",  v11,  v12,  0LL,  v14);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  os_activity_scope_leave(&state);
}

- (void)_didFinishSendingStatusWithResponse:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if (v9)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100038D48();
    }

    v10[2](v10, v9);
  }

  else
  {
    uint64_t v19 = 0LL;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000LL;
    id v22 = sub_100030BF4;
    uint64_t v23 = sub_100030C04;
    id v24 = 0LL;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100035AB4;
    v15[3] = &unk_1000B8DA8;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
    id v16 = v12;
    id v17 = self;
    id v18 = &v19;
    [v12 performBlockAndWait:v15];
    if (v20[5])
    {
      ((void (*)(void (**)(id, id)))v10[2])(v10);
    }

    else
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        __int16 v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Successfully sent status",  (uint8_t *)&v14,  2u);
      }

      v10[2](v10, 0LL);
    }

    _Block_object_dispose(&v19, 8);
  }
}

- (id)_processResponse:(id)a3 data:(id)a4 payloadClassByStatusCode:(id)a5 shouldRetry:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (char *)[v12 statusCode];
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Got back from HTTP: %ld", buf, 0xCu);
  }

  if ([v12 statusCode] == (id)401
    && !-[RMHTTPConduit _processUnauthorizedResponse:shouldRetry:error:]( self,  "_processUnauthorizedResponse:shouldRetry:error:",  v12,  a6,  a7))
  {
    goto LABEL_34;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
  id v18 = [v14 objectForKey:v17];

  if (v15 == (char *)204)
  {
    if (!v14 || v18 == (id)objc_opt_class(&OBJC_CLASS___RMModelAnyPayload)) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }

  if ((unint64_t)(v15 - 400) <= 0xC7)
  {
    id v48 = 0LL;
    unsigned __int8 v19 = -[RMHTTPConduit _processErrorResponse:data:error:](self, "_processErrorResponse:data:error:", v12, v13, &v48);
    id v20 = v48;
    uint64_t v21 = v20;
    if ((v19 & 1) == 0)
    {
      if (!a7 || !v20) {
        goto LABEL_33;
      }
LABEL_27:
      *a7 = v21;
LABEL_33:

LABEL_34:
      id v34 = 0LL;
      goto LABEL_35;
    }

    if (v13)
    {
      id v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringWithOptions:0]);
      if (!a7) {
        goto LABEL_32;
      }
    }

    else
    {
      id v22 = @"Empty Response Body";
      if (!a7)
      {
LABEL_32:

        goto LABEL_33;
      }
    }

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createHTTPErrorWithStatusCode:reason:]( &OBJC_CLASS___RMErrorUtilities,  "createHTTPErrorWithStatusCode:reason:",  v15,  v22));
    Class v37 = v36;
    if (v36) {
      *a7 = v36;
    }

    goto LABEL_32;
  }

  if (!v14)
  {
LABEL_20:
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  &__NSDictionary0__struct));
    goto LABEL_35;
  }

  if (v18)
  {
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v12 allHeaderFields]);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"Content-Type"]);
    id v24 = @"text/html";
    uint64_t v46 = (void *)v23;
    if (v23) {
      id v24 = (__CFString *)v23;
    }
    uint64_t v25 = v24;
    id v26 = (char *)-[__CFString rangeOfString:](v25, "rangeOfString:", @";");
    if (v27)
    {
      uint64_t v28 = v26;
      uint64_t v29 = v27;
      id v30 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v25, "substringToIndex:", v26));
      id v31 = &v28[v29];
      id v32 = v30;
      id v33 = (id)objc_claimAutoreleasedReturnValue(-[__CFString substringFromIndex:](v25, "substringFromIndex:", v31));
    }

    else
    {
      id v32 = v25;
      id v33 = 0LL;
    }

    __int128 v39 = v32;
    id v40 = (char *)v33;

    if (v13
      && (-[__CFString isEqualToString:](v39, "isEqualToString:", @"application/json") & 1) == 0)
    {
      unsigned int v42 = -[RMHTTPConduit _incrementConduitStateError:serverRetryAfter:error:]( self,  "_incrementConduitStateError:serverRetryAfter:error:",  2LL,  0LL,  a7);
      id v34 = 0LL;
      if (a7 && v42)
      {
        id v43 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnhandledContentTypeErrorWithContentType:]( &OBJC_CLASS___RMErrorUtilities,  "createUnhandledContentTypeErrorWithContentType:",  v39));
        uint64_t v44 = v43;
        if (v43) {
          *a7 = v43;
        }

        id v34 = 0LL;
      }
    }

    else
    {
      if ([v40 length])
      {
        id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v50 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "Unused Content-Type parameter: %{public}@",  buf,  0xCu);
        }
      }

      if (v13)
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v18 loadData:v13 serializationType:1 error:a7]);
      }

      else
      {
        __int128 v45 = objc_opt_new(&OBJC_CLASS___NSData);
        id v34 = (void *)objc_claimAutoreleasedReturnValue([v18 loadData:v45 serializationType:1 error:a7]);
      }
    }

    goto LABEL_35;
  }

- (BOOL)_processUnauthorizedResponse:(id)a3 shouldRetry:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allHeaderFields]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"WWW-Authenticate"]);

  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100038E94();
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @", "));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByCharactersInSet:v12]);

  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100038E34();
  }

  if (([v13 containsObject:RMAuthenticationSchemeTest] & 1) != 0
    || ([v13 containsObject:RMAuthenticationSchemeBearer] & 1) != 0
    || [v13 containsObject:RMAuthenticationSchemeMAID])
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100038E08();
    }

    uint64_t v27 = 0LL;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    id v30 = sub_100030BF4;
    id v31 = sub_100030C04;
    id v32 = 0LL;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100036384;
    v22[3] = &unk_1000B9D28;
    id v16 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
    id v23 = v16;
    id v24 = self;
    id v25 = v13;
    id v26 = &v27;
    [v16 performBlockAndWait:v22];
    id v17 = (void *)v28[5];
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
    }

    else
    {
      *a4 = 1;
    }

    _Block_object_dispose(&v27, 8);
  }

  else if (a5)
  {
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v13 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", @", "));

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createUnsupportedAuthenticationSchemeErrorWithScheme:]( &OBJC_CLASS___RMErrorUtilities,  "createUnsupportedAuthenticationSchemeErrorWithScheme:",  v20));
    if (v21) {
      *a5 = v21;
    }
  }

  return 0;
}

- (BOOL)_processErrorResponse:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (NSData *)a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 allHeaderFields]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"Content-Type"]);
  id v12 = (void *)v11;
  id v13 = @"text/html";
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  id v14 = v13;
  id v15 = (char *)-[__CFString rangeOfString:](v14, "rangeOfString:", @";");
  if (v16)
  {
    id v17 = v15;
    uint64_t v18 = v16;
    unsigned __int8 v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v14, "substringToIndex:", v15));
    id v20 = (id)objc_claimAutoreleasedReturnValue(-[__CFString substringFromIndex:](v14, "substringFromIndex:", &v17[v18]));
  }

  else
  {
    unsigned __int8 v19 = v14;
    id v20 = 0LL;
  }

  uint64_t v21 = v19;
  id v22 = v20;

  if (v9 && !-[__CFString isEqualToString:](v21, "isEqualToString:", @"application/json"))
  {
    id v25 = 0LL;
    goto LABEL_23;
  }

  if ([v22 length])
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v41 = 138543362;
      *(void *)&v41[4] = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Unused Content-Type parameter: %{public}@",  v41,  0xCu);
    }
  }

  id v24 = v9;
  if (!v9) {
    id v24 = objc_opt_new(&OBJC_CLASS___NSData);
  }
  *(void *)id v41 = 0LL;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[RMProtocolErrorResponse loadData:serializationType:error:]( &OBJC_CLASS___RMProtocolErrorResponse,  "loadData:serializationType:error:",  v24,  1LL,  v41));
  id v26 = *(id *)v41;
  if (v9)
  {
    if (!v25) {
      goto LABEL_19;
    }
  }

  else
  {

    if (!v25)
    {
LABEL_19:
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10003918C();
      }
    }
  }

LABEL_23:
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 responseCode]);
  uint64_t v29 = (uint64_t)[v8 statusCode];
  id v30 = 0LL;
  uint64_t v31 = 2LL;
  if (v29 > 409)
  {
    if (v29 == 410)
    {
      id v30 = 0LL;
      BOOL v32 = [v28 isEqualToString:RMProtocolErrorResponse_Code_enrollmentNotAllowed] == 0;
      unsigned int v33 = 4;
LABEL_38:
      if (v32) {
        uint64_t v31 = 2LL;
      }
      else {
        uint64_t v31 = v33;
      }
      goto LABEL_46;
    }

    if (v29 == 503)
    {
      id v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allHeaderFields", 2));
      unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"Retry-After"]);

      if (v35)
      {
        uint64_t v36 = objc_opt_new(&OBJC_CLASS___NSDateFormatter);
        Class v37 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
        -[NSDateFormatter setLocale:](v36, "setLocale:", v37);

        -[NSDateFormatter setDateFormat:](v36, "setDateFormat:", @"EEE, dd MMM yyyy HH:mm:ss Z");
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v36, "dateFromString:", v35));
        if (!v30)
        {
          uint64_t v38 = (uint64_t)[v35 integerValue];
          if (v38 < 1) {
            id v30 = 0LL;
          }
          else {
            id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)v38));
          }
        }
      }

      else
      {
        id v30 = 0LL;
      }

      uint64_t v31 = 3LL;
    }
  }

  else
  {
    if (v29 != 403)
    {
      if (v29 != 404) {
        goto LABEL_46;
      }
      id v30 = 0LL;
      BOOL v32 = [v28 isEqualToString:RMProtocolErrorResponse_Code_enrollmentTokenInvalid] == 0;
      unsigned int v33 = 5;
      goto LABEL_38;
    }

    if (([v28 isEqualToString:RMProtocolErrorResponse_Code_clientVersionInvalid] & 1) != 0
      || ([v28 isEqualToString:RMProtocolErrorResponse_Code_deviceAuthInvalid] & 1) != 0
      || [v28 isEqualToString:RMProtocolErrorResponse_Code_deviceAuthMissing])
    {
      id v30 = 0LL;
      uint64_t v31 = 1LL;
    }

    else
    {
      id v30 = 0LL;
      uint64_t v31 = 2LL;
    }
  }

- (BOOL)_incrementConduitStateError:(signed __int16)a3 serverRetryAfter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_100030BF4;
  id v23 = sub_100030C04;
  id v24 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100036D08;
  v13[3] = &unk_1000B9F08;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v14 = v9;
  id v15 = self;
  signed __int16 v18 = a3;
  id v10 = v8;
  id v16 = v10;
  id v17 = &v19;
  [v9 performBlockAndWait:v13];
  uint64_t v11 = (void *)v20[5];
  if (a5 && v11) {
    *a5 = v11;
  }

  _Block_object_dispose(&v19, 8);
  return v11 == 0LL;
}

- (id)_makeURLRequestWithManagementSource:(id)a3 method:(id)a4 endpoint:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 conduitConfig]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 state]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 enrollmentToken]);
  unsigned int v13 = [v9 enrollmentType];

  id v14 = (id *)&RMProtocolChannelUser;
  if (v13) {
    id v14 = (id *)&RMProtocolChannelDevice;
  }
  id v15 = *v14;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 referralBaseURL]);
  id v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue([v11 baseURL]);
  }
  uint64_t v19 = v18;

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"{channel}" withString:v15]);
  if (v12)
  {
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 stringByReplacingOccurrencesOfString:@"{enrollmenttoken}" withString:v12]);

    id v20 = (void *)v21;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 URLByAppendingPathComponent:v20]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v22,  0LL,  30.0));
  [v23 setHTTPMethod:v8];

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[RMHTTPConduit userAgent](&OBJC_CLASS___RMHTTPConduit, "userAgent"));
  [v23 setValue:v24 forHTTPHeaderField:@"User-Agent"];

  [v23 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  return v23;
}

- (id)_authenticationCredential
{
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_100030BF4;
  uint64_t v28 = sub_100030C04;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_100030BF4;
  id v22 = sub_100030C04;
  id v23 = 0LL;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_100037214;
  unsigned int v13 = &unk_1000B9408;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
  id v14 = v3;
  id v15 = self;
  id v16 = &v18;
  id v17 = &v24;
  [v3 performBlockAndWait:&v10];
  uint64_t v4 = v25[5];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___RMGenericAuthenticationCredential);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    id v6 = 0LL;
    id v8 = 0LL;
    if (v19[5]) {
      goto LABEL_8;
    }
LABEL_7:
    id v8 = (id)v25[5];
    goto LABEL_8;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v25[5], "authenticationScheme", v10, v11, v12, v13));
  id v7 = (void *)v19[5];
  id v8 = 0LL;
LABEL_8:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (BOOL)_prepareURLRequest:(id)a3 withAuthenticationCredential:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_new(&OBJC_CLASS___NSUUID);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v9, "UUIDString"));
  [v7 setValue:v10 forHTTPHeaderField:@"X-Apple-Request-UUID"];

  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10003924C(v7);
  }

  if ((objc_opt_respondsToSelector(v8, "prepareURLRequest:error:") & 1) == 0) {
    goto LABEL_6;
  }
  id v19 = 0LL;
  unsigned __int8 v12 = [v8 prepareURLRequest:v7 error:&v19];
  id v13 = v19;
  id v14 = v13;
  if ((v12 & 1) != 0)
  {

LABEL_6:
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[RMFeatureOverrides testOrganizationID](&OBJC_CLASS___RMFeatureOverrides, "testOrganizationID"));
    if ([v14 length])
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForHTTPHeaderField:@"Authorization"]);
      if ([v15 length])
      {
        uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 stringByAppendingFormat:@", %@=\"%@\", @"test-org-id"", v14]);

        [v7 setValue:v16 forHTTPHeaderField:@"Authorization"];
        id v15 = (void *)v16;
      }
    }

    BOOL v17 = 1;
    goto LABEL_11;
  }

  BOOL v17 = 0;
  if (a5 && v13)
  {
    id v14 = v13;
    BOOL v17 = 0;
    *a5 = v14;
  }

- (BOOL)_prepareTask:(id)a3 withAuthenticationCredential:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 originalRequest]);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000392FC(v9);
  }

  if ((objc_opt_respondsToSelector(v8, "prepareTask:error:") & 1) != 0)
  {
    id v15 = 0LL;
    unsigned __int8 v11 = [v8 prepareTask:v7 error:&v15];
    id v12 = v15;
    id v13 = v12;
    if ((v11 & 1) == 0 && a5 && v12) {
      *a5 = v12;
    }
  }

  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (BOOL)_setRequestPayload:(id)a3 onURLRequest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v10 = 0LL;
    goto LABEL_5;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 serializeAsDataWithType:1 error:a5]);
  if (v10)
  {
LABEL_5:
    -[RMHTTPConduit _setBody:onURLRequest:](self, "_setBody:onURLRequest:", v10, v9);

    BOOL v11 = 1;
    goto LABEL_6;
  }

  BOOL v11 = 0;
LABEL_6:

  return v11;
}

- (void)_setBody:(id)a3 onURLRequest:(id)a4
{
  id v7 = a4;
  if (a3)
  {
    [v7 setHTTPBody:a3];
    uint64_t v5 = @"application/json";
    id v6 = v7;
  }

  else
  {
    [v7 setHTTPBody:0];
    id v6 = v7;
    uint64_t v5 = 0LL;
  }

  [v6 setValue:v5 forHTTPHeaderField:@"Content-Type"];
}

- (void)_resumeTaskForRequest:(id)a3 enrollmentToken:(id)a4 expectedResponseClassByStatusCode:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit _authenticationCredential](self, "_authenticationCredential"));
  id v32 = 0LL;
  LOBYTE(a6) = -[RMHTTPConduit _prepareURLRequest:withAuthenticationCredential:error:]( self,  "_prepareURLRequest:withAuthenticationCredential:error:",  v10,  v14,  &v32);
  id v15 = v32;
  if ((a6 & 1) != 0)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 HTTPMethod]);
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000393AC();
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[RMHTTPConduit session](self, "session"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000378BC;
    v25[3] = &unk_1000B9F30;
    id v19 = v16;
    id v26 = v19;
    id v27 = v10;
    id v23 = v11;
    id v28 = v11;
    id v20 = v13;
    id v31 = v20;
    id v29 = self;
    id v30 = v12;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([(id)v18 dataTaskWithRequest:v27 completionHandler:v25]);

    id v24 = v15;
    LOBYTE(v18) = -[RMHTTPConduit _prepareTask:withAuthenticationCredential:error:]( self,  "_prepareTask:withAuthenticationCredential:error:",  v21,  v14,  &v24);
    id v22 = v24;

    if ((v18 & 1) != 0) {
      [v21 resume];
    }
    else {
      (*((void (**)(id, void, void, id))v20 + 2))(v20, 0LL, 0LL, v22);
    }

    id v11 = v23;
  }

  else
  {
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v15);
    id v22 = v15;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v7 = (void (**)(id, void, void *))a6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a5 protectionSpace]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 authenticationMethod]);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10003965C();
  }

  unsigned int v11 = [v9 isEqualToString:NSURLAuthenticationMethodServerTrust];
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100039604();
    }

    id v14 = (__SecTrust *)[v8 serverTrust];
    if (v14)
    {
      uint64_t v15 = (uint64_t)v14;
      CFErrorRef error = 0LL;
      if (SecTrustEvaluateWithError(v14, &error))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialForTrust:]( &OBJC_CLASS___NSURLCredential,  "credentialForTrust:",  v15));
        BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          sub_100039558();
        }

        v7[2](v7, 0LL, v16);
        goto LABEL_21;
      }

      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100039584(v15, (void **)&error);
      }
    }

    else
    {
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog httpConduit](&OBJC_CLASS___RMLog, "httpConduit"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003952C();
      }
    }

    v7[2](v7, 2LL, 0LL);
    goto LABEL_21;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100039630();
  }

  v7[2](v7, 3LL, 0LL);
LABEL_21:
}

- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 changeType] == (id)2)
  {
    LOBYTE(v10) = 0;
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 changedObjectID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 entity]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMConduitConfig entity](&OBJC_CLASS___RMConduitConfig, "entity"));
    unsigned int v10 = [v12 isKindOfEntity:v13];
    if (v10)
    {
      uint64_t v22 = 0LL;
      id v23 = &v22;
      uint64_t v24 = 0x2020000000LL;
      char v25 = 0;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit context](self, "context"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100037ED4;
      v16[3] = &unk_1000B9F58;
      void v16[4] = self;
      id v17 = v11;
      id v18 = v9;
      id v19 = v12;
      id v20 = v13;
      uint64_t v21 = &v22;
      [v14 performBlockAndWait:v16];
      *a5 = *((_BYTE *)v23 + 24);

      _Block_object_dispose(&v22, 8);
    }
  }

  return v10;
}

- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 insertedObjectIDs]);
  if (![v7 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 updatedObjectIDs]);
    if (![v8 count])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 deletedObjectIDs]);
      if (![v9 count])
      {
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v14 persistentHistoryToken]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentHistoryToken]);
        unsigned __int8 v13 = +[RMPersistentHistoryNotifierChanges isExistingPersistentHistoryToken:fromSameStoreAsUpdatedToken:]( &OBJC_CLASS___RMPersistentHistoryNotifierChanges,  "isExistingPersistentHistoryToken:fromSameStoreAsUpdatedToken:",  v11,  v12);

        if ((v13 & 1) != 0) {
          goto LABEL_10;
        }
        goto LABEL_7;
      }
    }
  }

LABEL_7:
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMHTTPConduit delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v10, "conduitNeedsToSync:") & 1) != 0) {
    [v10 conduitNeedsToSync:self];
  }

LABEL_10:
}

- (RMConduitDelegate)delegate
{
  return (RMConduitDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (RMPersistentHistoryNotifier)persistentHistoryNotifier
{
  return self->_persistentHistoryNotifier;
}

- (void)setPersistentHistoryNotifier:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BOOL)madeChangesDuringSync
{
  return self->_madeChangesDuringSync;
}

- (void)setMadeChangesDuringSync:(BOOL)a3
{
  self->_madeChangesDuringSync = a3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end