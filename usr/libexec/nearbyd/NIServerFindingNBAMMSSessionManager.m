@interface NIServerFindingNBAMMSSessionManager
+ (id)sharedInstance;
- (BOOL)_isReciprocalFindingPossibleRoleIsFinder:(BOOL)a3 rangingSession:(id)a4;
- (BOOL)shouldAttemptMerging;
- (BOOL)shouldInformMutualAuthFailure:(id)a3;
- (NIServerFindingNBAMMSSessionManager)init;
- (id).cxx_construct;
- (id)printableState;
- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8;
- (pair<int,)_getAuthenticatedFinderFindeeClients;
- (void)_updateAnalyticsWithFailedRangingRequestToken:(id)a3 isFinder:(BOOL)a4;
- (void)_updateAnalyticsWithSuccessfulRangingRequest;
- (void)logUnservableRangingRequestWithToken:(id)a3 isFinder:(BOOL)a4;
- (void)mutualAuthUpdateForSession:(id)a3 token:(id)a4 isFinder:(BOOL)a5 result:(BOOL)a6;
- (void)refreshRangingForToken:(id)a3;
- (void)session:(id)a3 updateState:(int)a4;
- (void)unregisterNBAMMSSessionForToken:(id)a3;
- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4;
- (void)updateSignallingData:(const void *)a3 token:(id)a4;
@end

@implementation NIServerFindingNBAMMSSessionManager

- (NIServerFindingNBAMMSSessionManager)init
{
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___NIServerFindingNBAMMSSessionManager;
  v2 = -[NIServerFindingNBAMMSSessionManager init](&v39, "init");
  v3 = v2;
  if (v2)
  {
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.nearbyd.nbammssession", v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    v8 = sub_100288340();
    uint64_t v9 = v8[21];
    *(void *)&__int128 location = v8[20];
    *((void *)&location + 1) = v9;
    if (v9)
    {
      v10 = (unint64_t *)(v9 + 8);
      do
        unint64_t v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }

    sub_10000EE54((uint64_t)&v2->_pbLogger, &location);
    v12 = (std::__shared_weak_count *)*((void *)&location + 1);
    if (*((void *)&location + 1))
    {
      v13 = (unint64_t *)(*((void *)&location + 1) + 8LL);
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

    v15 = objc_alloc_init(&OBJC_CLASS___GroupFindingAnalytics);
    analytics = v3->_analytics;
    v3->_analytics = v15;

    objc_initWeak((id *)&location, v3);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1001F370C;
    v35[3] = &unk_1007B65C8;
    objc_copyWeak(&v37, (id *)&location);
    v17 = v3;
    v36 = v17;
    v18 = objc_retainBlock(v35);
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472LL;
    v31 = sub_1001F37D0;
    v32 = &unk_1007B6618;
    objc_copyWeak(&v34, (id *)&location);
    v19 = v17;
    v33 = v19;
    v20 = objc_retainBlock(&v29);
    v21 = objc_alloc(&OBJC_CLASS___NIServerNBAMMSSession);
    v22 = -[NIServerNBAMMSSession initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:]( v21,  "initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:",  v3->_internalQueue,  @"nmiSession1",  v18,  v20,  v29,  v30,  v31,  v32);
    nmiSession1 = v19->_nmiSession1;
    v19->_nmiSession1 = v22;

    v24 = -[NIServerNBAMMSSession initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:]( objc_alloc(&OBJC_CLASS___NIServerNBAMMSSession),  "initWithQueue:identityString:stateUpdateHandler:mutualAuthHandler:",  v3->_internalQueue,  @"nmiSession2",  v18,  v20);
    nmiSession2 = v19->_nmiSession2;
    v19->_nmiSession2 = v24;

    *(void *)&v19->_sessionState1 = 0LL;
    v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    tokenToMutualAuthSessions = v19->_tokenToMutualAuthSessions;
    v19->_tokenToMutualAuthSessions = v26;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)&location);
  }

  return v3;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F3940;
  block[3] = &unk_1007A2398;
  block[4] = a1;
  if (qword_1007F9EE0 != -1) {
    dispatch_once(&qword_1007F9EE0, block);
  }
  return (id)qword_1007F9ED8;
}

- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8
{
  id v14 = a3;
  id v15 = a5;
  v16 = v15;
  if (v14)
  {
    if (v15)
    {
      uint64_t v29 = 0LL;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x3032000000LL;
      v32 = sub_1001F3BE0;
      v33 = sub_1001F3BF0;
      id v34 = 0LL;
      internalQueue = (dispatch_queue_s *)self->_internalQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001F3BF8;
      block[3] = &unk_1007B6640;
      block[4] = self;
      v24 = &v29;
      id v22 = v14;
      BOOL v28 = a4;
      id v23 = v16;
      v25 = a6;
      v26 = a7;
      int v27 = a8;
      dispatch_sync(internalQueue, block);
      id v18 = (id)v30[5];

      _Block_object_dispose(&v29, 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039D1CC();
      }
      NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
      v36 = @"Client is nil";
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
      id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v19));
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039D1A0();
    }
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10012LL,  0LL));
  }

  return v18;
}

- (void)unregisterNBAMMSSessionForToken:(id)a3
{
  id v4 = a3;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F42A8;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
}

- (void)refreshRangingForToken:(id)a3
{
  id v4 = a3;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F4568;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
}

- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F4624;
  block[3] = &unk_1007B6360;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

- (void)updateSignallingData:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F46E8;
  block[3] = &unk_1007B6360;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

- (void)logUnservableRangingRequestWithToken:(id)a3 isFinder:(BOOL)a4
{
  id v6 = a3;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F47AC;
  block[3] = &unk_1007B1690;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(internalQueue, block);
}

- (id)printableState
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = sub_1001F3BE0;
  v13 = sub_1001F3BF0;
  id v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v7[0] = 0LL;
  v7[1] = v7;
  v7[2] = 0x3032000000LL;
  v7[3] = sub_1001F3BE0;
  v7[4] = sub_1001F3BF0;
  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F48E8;
  block[3] = &unk_1007B6668;
  block[4] = self;
  void block[5] = &v9;
  block[6] = v7;
  dispatch_sync(internalQueue, block);
  id v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)session:(id)a3 updateState:(int)a4
{
  id v6 = (NIServerNBAMMSSession *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_nmiSession1 == v6)
  {
    id v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = "IDLE";
      if (a4 == 1) {
        uint64_t v9 = "ACQ";
      }
      if (a4 == 2) {
        uint64_t v9 = "RNG";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-range,Received session state %s from nmiSession1",  buf,  0xCu);
    }

    p_int sessionState1 = &self->_sessionState1;
    int sessionState1 = self->_sessionState1;
  }

  else
  {
    v7 = (os_log_s *)qword_1008000A0;
    if (self->_nmiSession2 != v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039DD04();
      }
      goto LABEL_37;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "IDLE";
      if (a4 == 1) {
        v12 = "ACQ";
      }
      if (a4 == 2) {
        v12 = "RNG";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#find-range,Received session state %s from nmiSession2",  buf,  0xCu);
    }

    p_int sessionState1 = &self->_sessionState2;
    int sessionState1 = self->_sessionState2;
  }

  if (sessionState1 == a4) {
    goto LABEL_37;
  }
  int *p_sessionState1 = a4;
  if (!-[NIServerFindingNBAMMSSessionManager shouldAttemptMerging](self, "shouldAttemptMerging")) {
    goto LABEL_37;
  }
  v13 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#find-range,Merging started", buf, 2u);
  }

  unsigned int v14 = -[NIServerNBAMMSSession sessionState](self->_nmiSession1, "sessionState");
  uint64_t v15 = 2LL;
  if (v14 == 1) {
    uint64_t v15 = 1LL;
  }
  v16 = (&self->super.isa)[v15];
  unsigned int v17 = -[NIServerNBAMMSSession sessionState](self->_nmiSession1, "sessionState");
  p_nmiSession2 = &self->_nmiSession2;
  if (v17 == 2) {
    p_nmiSession2 = &self->_nmiSession1;
  }
  v19 = *p_nmiSession2;
  if (v16)
  {
    -[objc_class attachedRoles](v16, "attachedRoles");
    v20 = __p;
    uint64_t v21 = v28;
  }

  else
  {
    v20 = 0LL;
    uint64_t v21 = 0LL;
    __p = 0LL;
  }

  if (v21 - (void)v20 != 4) {
    __assert_rtn( "-[NIServerFindingNBAMMSSessionManager session:updateState:]",  "NIServerFindingRanging.mm",  3034,  "acqSessionRoles.size() == 1");
  }
  int v22 = *v20;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sessionClientForFinder:](v16, "sessionClientForFinder:", *v20 == 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sessionTokenForFinder:](v16, "sessionTokenForFinder:", v22 == 0));
  if (!v16)
  {
    memset(buf, 0, 512);
LABEL_41:
    __assert_rtn( "-[NIServerFindingNBAMMSSessionManager session:updateState:]",  "NIServerFindingRanging.mm",  3047,  "optServiceRequest.has_value()");
  }

  -[objc_class sessionServiceRequestForFinder:](v16, "sessionServiceRequestForFinder:", v22 == 0);
  if (!buf[504]) {
    goto LABEL_41;
  }
  memcpy(__dst, buf, sizeof(__dst));
  -[objc_class sessionStartRangingOptionsForFinder:](v16, "sessionStartRangingOptionsForFinder:", v22 == 0);
  if (!v30) {
    __assert_rtn( "-[NIServerFindingNBAMMSSessionManager session:updateState:]",  "NIServerFindingRanging.mm",  3052,  "optStartRangingOptions.has_value()");
  }
  v29[4] = v29[11];
  v29[5] = v29[12];
  v29[6] = v29[13];
  v29[0] = v29[7];
  v29[1] = v29[8];
  v29[2] = v29[9];
  v29[3] = v29[10];
  id v25 =  -[NIServerNBAMMSSession registerNBAMMSSessionWithToken:isFinder:client:serviceRequest:startRangingOptions:sharedProtocol:]( v19,  "registerNBAMMSSessionWithToken:isFinder:client:serviceRequest:startRangingOptions:sharedProtocol:",  v24,  v22 == 0,  v23,  __dst,  v29,  -[NIServerNBAMMSSession sharedProtocol](v19, "sharedProtocol"));
  v26 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v26, "addObject:", v19);
  -[NSMutableDictionary setObject:forKey:](self->_tokenToMutualAuthSessions, "setObject:forKey:", v26, v24);

  if (__p) {
    operator delete(__p);
  }

LABEL_37:
}

- (BOOL)shouldAttemptMerging
{
  int sessionState1 = self->_sessionState1;
  if (sessionState1 == 1)
  {
    if (self->_sessionState2 != 2) {
      return 0;
    }
  }

  else if (sessionState1 != 2 || self->_sessionState2 != 1)
  {
    return 0;
  }

  nmiSession1 = self->_nmiSession1;
  if (nmiSession1)
  {
    -[NIServerNBAMMSSession attachedRoles](nmiSession1, "attachedRoles");
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
  }

  nmiSession2 = self->_nmiSession2;
  if (nmiSession2)
  {
    -[NIServerNBAMMSSession attachedRoles](nmiSession2, "attachedRoles");
  }

  else
  {
    __p = 0LL;
    uint64_t v10 = 0LL;
  }

  if (v12 - (void)v11 != 4) {
    goto LABEL_17;
  }
  v7 = __p;
  if (v10 - (void)__p == 4)
  {
    if (*v11 != *__p && -[NIServerNBAMMSSession sharedProtocol](self->_nmiSession1, "sharedProtocol"))
    {
      BOOL v4 = -[NIServerNBAMMSSession sharedProtocol](self->_nmiSession2, "sharedProtocol") != 0;
      goto LABEL_18;
    }

- (BOOL)shouldInformMutualAuthFailure:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession sessionTokenForFinder:](self->_nmiSession1, "sessionTokenForFinder:", 1LL));
  unsigned int v6 = [v5 isEqual:v4];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession sessionTokenForFinder:](self->_nmiSession1, "sessionTokenForFinder:", 0LL));
  unsigned int v8 = [v7 isEqual:v4];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession sessionTokenForFinder:](self->_nmiSession2, "sessionTokenForFinder:", 1LL));
  unsigned int v10 = [v9 isEqual:v4];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession sessionTokenForFinder:](self->_nmiSession2, "sessionTokenForFinder:", 0LL));
  unsigned int v12 = [v11 isEqual:v4];
  if (v6) {
    int v13 = 2;
  }
  else {
    int v13 = 1;
  }
  if (!v8) {
    int v13 = v6;
  }
  BOOL v14 = v13 + v10 + v12 == 1;

  return v14;
}

- (void)mutualAuthUpdateForSession:(id)a3 token:(id)a4 isFinder:(BOOL)a5 result:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  unsigned int v10 = (NIServerNBAMMSSession *)a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_tokenToMutualAuthSessions, "objectForKey:", v11));

  if (v12)
  {
    if (v6)
    {
      int v13 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#find-range,Attachment is successful",  buf,  2u);
      }

      -[NSMutableDictionary removeObjectForKey:](self->_tokenToMutualAuthSessions, "removeObjectForKey:", v11);
      nmiSession1 = self->_nmiSession1;
      if (nmiSession1 != v10 || (nmiSession1 = self->_nmiSession2, nmiSession1 != v10)) {
        -[NIServerNBAMMSSession unregisterNBAMMSSessionForToken:](nmiSession1, "unregisterNBAMMSSessionForToken:", v11);
      }
      -[NIServerFindingNBAMMSSessionManager _updateAnalyticsWithSuccessfulRangingRequest]( self,  "_updateAnalyticsWithSuccessfulRangingRequest");
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_tokenToMutualAuthSessions, "objectForKey:", v11));
      if ([v15 containsObject:v10])
      {
        if ((unint64_t)[v15 count] < 2)
        {
          unsigned int v17 = -[NIServerFindingNBAMMSSessionManager shouldInformMutualAuthFailure:]( self,  "shouldInformMutualAuthFailure:",  v11);
          id v18 = (os_log_s *)qword_1008000A0;
          BOOL v19 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v19)
            {
              *(_WORD *)uint64_t v21 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#find-range,Inform mutual auth failure to client",  v21,  2u);
            }

            -[NIServerNBAMMSSession informMutualAuthFailuresToClients](v10, "informMutualAuthFailuresToClients");
            -[NIServerFindingNBAMMSSessionManager _updateAnalyticsWithFailedRangingRequestToken:isFinder:]( self,  "_updateAnalyticsWithFailedRangingRequestToken:isFinder:",  v11,  v7);
          }

          else
          {
            if (v19)
            {
              *(_WORD *)v20 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#find-range,Do not inform mutual auth failure to client, clean attached token silently",  v20,  2u);
            }

            -[NIServerNBAMMSSession unregisterNBAMMSSessionForToken:](v10, "unregisterNBAMMSSessionForToken:", v11);
            -[NIServerFindingNBAMMSSessionManager _updateAnalyticsWithSuccessfulRangingRequest]( self,  "_updateAnalyticsWithSuccessfulRangingRequest");
          }
        }

        else
        {
          -[NIServerNBAMMSSession unregisterNBAMMSSessionForToken:](v10, "unregisterNBAMMSSessionForToken:", v11);
          v16 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v22 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#find-range,One attaching attempt failed, more to come",  v22,  2u);
          }
        }

        [v15 removeObject:v10];
        if (![v15 count]) {
          -[NSMutableDictionary removeObjectForKey:](self->_tokenToMutualAuthSessions, "removeObjectForKey:", v11);
        }
      }
    }
  }
}

- (pair<int,)_getAuthenticatedFinderFindeeClients
{
  unint64_t v3 = (unint64_t)-[NIServerNBAMMSSession sessionClientsStatus](self->_nmiSession1, "sessionClientsStatus");
  uint64_t v5 = v4;
  uint64_t v7 = ((unint64_t)-[NIServerNBAMMSSession sessionClientsStatus](self->_nmiSession2, "sessionClientsStatus") & 0xFFFFFFFF00000001LL) == 1;
  if ((v3 & 0xFFFFFFFF00000001LL) == 1) {
    ++v7;
  }
  if ((v6 & 0xFFFFFFFF00000001LL) == 1) {
    uint64_t v8 = ((v5 & 0xFFFFFFFF00000001LL) == 1) + 1;
  }
  else {
    uint64_t v8 = (v5 & 0xFFFFFFFF00000001LL) == 1;
  }
  return (pair<int, int>)(v7 | (v8 << 32));
}

- (BOOL)_isReciprocalFindingPossibleRoleIsFinder:(BOOL)a3 rangingSession:(id)a4
{
  uint64_t v5 = a4;
  uint64_t v6 = v5;
  if (v5 && ([v5 attachedRoles], uint64_t v5 = v10, v11 - (void)v10 == 8))
  {
    BOOL v7 = 0;
    BOOL v8 = 0;
    if (!v10) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v7 = (*v5 == 0) ^ a3;
  }

  operator delete(v5);
  BOOL v8 = v7;
LABEL_7:

  return v8;
}

- (void)_updateAnalyticsWithSuccessfulRangingRequest
{
  unint64_t v3 = (unint64_t)-[NIServerNBAMMSSession sessionClientsStatus](self->_nmiSession1, "sessionClientsStatus");
  uint64_t v5 = v4;
  unint64_t v6 = (unint64_t)-[NIServerNBAMMSSession sessionClientsStatus](self->_nmiSession2, "sessionClientsStatus");
  int v8 = v3;
  if ((_BYTE)v3) {
    BOOL v9 = (v3 & 0xFFFFFFFF00000000LL) == 0x200000000LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9
    || ((_BYTE)v5 ? (BOOL v10 = (v5 & 0xFFFFFFFF00000000LL) == 0x200000000LL) : (BOOL v10 = 0),
        v10
     || ((int v11 = v6, (_BYTE)v6) ? (v12 = (v6 & 0xFFFFFFFF00000000LL) == 0x200000000LL) : (v12 = 0),
         v12 || (unsigned __int8 v13 = v7) != 0 && (v7 & 0xFFFFFFFF00000000LL) == 0x200000000LL)))
  {
    BOOL v14 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#find-range,Mutual-auth still ongoing, not ready for analytics update",  v17,  2u);
    }
  }

  else
  {
    pair<int, int> v15 = -[NIServerFindingNBAMMSSessionManager _getAuthenticatedFinderFindeeClients]( self,  "_getAuthenticatedFinderFindeeClients");
    switch((unint64_t)v15)
    {
      case 0x200000000uLL:
        -[GroupFindingAnalytics updateTo0Finder2Findee](self->_analytics, "updateTo0Finder2Findee");
        break;
      case 0x100000001uLL:
        analytics = self->_analytics;
        else {
          -[GroupFindingAnalytics updateTo1Finder1Findee](analytics, "updateTo1Finder1Findee");
        }
        break;
      case 0x200000001uLL:
        -[GroupFindingAnalytics updateTo1Finder2Findee](self->_analytics, "updateTo1Finder2Findee");
        break;
    }
  }

- (void)_updateAnalyticsWithFailedRangingRequestToken:(id)a3 isFinder:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  pair<int, int> v6 = -[NIServerFindingNBAMMSSessionManager _getAuthenticatedFinderFindeeClients]( self,  "_getAuthenticatedFinderFindeeClients");
  if (v6 == 0x200000000LL)
  {
    analytics = self->_analytics;
    if (v4) {
      -[GroupFindingAnalytics updateWithFinderRequestAt0Finder2Findee:]( analytics,  "updateWithFinderRequestAt0Finder2Findee:",  v8);
    }
    else {
      -[GroupFindingAnalytics updateWithFindeeRequestAt0Finder2Findee:]( analytics,  "updateWithFindeeRequestAt0Finder2Findee:",  v8);
    }
  }

  else if (v6 != 0x100000001LL || v4)
  {
    if (v6 == 0x200000001LL && !v4) {
      -[GroupFindingAnalytics updateWithFindeeRequestAt1Finder2Findee:]( self->_analytics,  "updateWithFindeeRequestAt1Finder2Findee:",  v8);
    }
  }

  else
  {
    -[GroupFindingAnalytics updateWithFindeeRequestAt1Finder1Findee:]( self->_analytics,  "updateWithFindeeRequestAt1Finder1Findee:",  v8);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  return self;
}

@end