@interface AKAuthorizationSessionManager
+ (id)sharedInstance;
- (AKAuthorizationSessionManager)init;
- (BOOL)_hasSessionTimedOutForRequest:(id)a3;
- (id)_activeSessionForContext:(id)a3 client:(id)a4;
- (id)_clientBundleIDForContext:(id)a3 client:(id)a4;
- (id)clientForContext:(id)a3;
- (id)userResponseWithContext:(id)a3 forClient:(id)a4;
- (void)beginSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)continueSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)endSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)updateUserResponse:(id)a3 withContext:(id)a4 forClient:(id)a5;
@end

@implementation AKAuthorizationSessionManager

+ (id)sharedInstance
{
  if (qword_10020F388 != -1) {
    dispatch_once(&qword_10020F388, &stru_1001C7A28);
  }
  return (id)qword_10020F380;
}

- (AKAuthorizationSessionManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AKAuthorizationSessionManager;
  v2 = -[AKAuthorizationSessionManager init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    activeSessions = v2->_activeSessions;
    v2->_activeSessions = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("AKAuthorizationClearanceQueue", v6);
    clearanceQueue = v2->_clearanceQueue;
    v2->_clearanceQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("AKAuthorizationTrafficQueue", v10);
    trafficQueue = v2->_trafficQueue;
    v2->_trafficQueue = (OS_dispatch_queue *)v11;
  }

  return v2;
}

- (id)clientForContext:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _sessionID]);
  BOOL v6 = v5 == 0LL;

  uint64_t v9 = _AKLogSiwa(v7, v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Session ID is nil for context: %@",  (uint8_t *)&buf,  0xCu);
    }

    id v19 = 0LL;
  }

  else
  {
    if (v11)
    {
      id v12 = -[NSMutableDictionary count](self->_activeSessions, "count");
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Number of active sessions: %lu",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v15 = _AKLogSiwa(v13, v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 _sessionID]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Looking for client with session ID: %@",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x3032000000LL;
    v26 = sub_100031030;
    v27 = sub_100031040;
    id v28 = 0LL;
    activeSessions = self->_activeSessions;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100031048;
    v21[3] = &unk_1001C7A50;
    id v22 = v4;
    p___int128 buf = &buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeSessions, "enumerateKeysAndObjectsUsingBlock:", v21);
    id v19 = *(id *)(*((void *)&buf + 1) + 40LL);

    _Block_object_dispose(&buf, 8);
  }

  return v19;
}

- (void)beginSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x3032000000LL;
  v26[3] = sub_100031030;
  v26[4] = sub_100031040;
  id v27 = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = sub_100031030;
  v24[4] = sub_100031040;
  id v25 = 0LL;
  trafficQueue = (dispatch_queue_s *)self->_trafficQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003136C;
  block[3] = &unk_1001C7A78;
  id v18 = v9;
  id v19 = self;
  id v20 = v8;
  id v21 = v10;
  id v22 = v24;
  v23 = v26;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(trafficQueue, block);
  clearanceQueue = (dispatch_queue_s *)self->_clearanceQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000316EC;
  v16[3] = &unk_1001C7AA0;
  v16[4] = v24;
  v16[5] = v26;
  dispatch_sync(clearanceQueue, v16);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

- (void)endSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  trafficQueue = (dispatch_queue_s *)self->_trafficQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003181C;
  block[3] = &unk_1001C6E88;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(trafficQueue, block);
}

- (void)continueSessionWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationSessionManager _clientBundleIDForContext:client:]( self,  "_clientBundleIDForContext:client:",  v8,  a4));
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activeSessions,  "objectForKeyedSubscript:",  v11));
    id v14 = v12;
    if (v12)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 userResponse]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 selectedRequest]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v16 requestIdentifier]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 _continuationRequestIdentifier]);
      LOBYTE(v16) = [v18 isEqualToString:v19];

      if ((v16 & 1) != 0)
      {
        BOOL v22 = -[AKAuthorizationSessionManager _hasSessionTimedOutForRequest:]( self,  "_hasSessionTimedOutForRequest:",  v14);
        if (v22)
        {
          uint64_t v24 = _AKLogSiwa(v22, v23);
          id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            sub_100131044();
          }

          clearanceQueue = (dispatch_queue_s *)self->_clearanceQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100031EEC;
          block[3] = &unk_1001C78D0;
          id v42 = v9;
          dispatch_sync(clearanceQueue, block);
          -[NSMutableDictionary removeObjectForKey:](self->_activeSessions, "removeObjectForKey:", v11);
          id v27 = v42;
        }

        else
        {
          v37 = (dispatch_queue_s *)self->_clearanceQueue;
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472LL;
          v38[2] = sub_100031F40;
          v38[3] = &unk_1001C7258;
          id v40 = v9;
          id v39 = v14;
          dispatch_sync(v37, v38);

          id v27 = v40;
        }
      }

      else
      {
        uint64_t v34 = _AKLogSiwa(v20, v21);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          sub_1001310A4();
        }

        v36 = (dispatch_queue_s *)self->_clearanceQueue;
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_100031E98;
        v43[3] = &unk_1001C78D0;
        id v44 = v9;
        dispatch_sync(v36, v43);
        id v27 = v44;
      }
    }

    else
    {
      uint64_t v31 = _AKLogSiwa(0LL, v13);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_100130FE4();
      }

      v33 = (dispatch_queue_s *)self->_clearanceQueue;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_100031E44;
      v45[3] = &unk_1001C78D0;
      id v46 = v9;
      dispatch_sync(v33, v45);
      id v18 = v46;
    }
  }

  else
  {
    uint64_t v28 = _AKLogSiwa(0LL, v10);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_100130FB8();
    }

    v30 = (dispatch_queue_s *)self->_clearanceQueue;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_100031DF0;
    v47[3] = &unk_1001C78D0;
    id v48 = v9;
    dispatch_sync(v30, v47);
    id v14 = v48;
  }
}

- (void)updateUserResponse:(id)a3 withContext:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = _AKLogSiwa(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100131130();
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationSessionManager _activeSessionForContext:client:]( self,  "_activeSessionForContext:client:",  v9,  v10));
  if (v14)
  {
    [v14 setUserResponse:v8];
  }

  else
  {
    uint64_t v17 = _AKLogSiwa(v15, v16);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001310D0();
    }
  }
}

- (id)userResponseWithContext:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _AKLogSiwa(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100131190();
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationSessionManager _activeSessionForContext:client:]( self,  "_activeSessionForContext:client:",  v6,  v7));
  if (v11)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 userResponse]);
  }

  else
  {
    uint64_t v15 = _AKLogSiwa(v12, v13);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1001310D0();
    }

    id v14 = 0LL;
  }

  return v14;
}

- (BOOL)_hasSessionTimedOutForRequest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 requestTime]);
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 context]);
  [v8 _authSessionTimeoutInterval];
  if (v9 <= 0.0)
  {
    double v12 = 900.0;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 context]);
    [v10 _authSessionTimeoutInterval];
    double v12 = v11;
  }

  return v7 > v12;
}

- (id)_clientBundleIDForContext:(id)a3 client:(id)a4
{
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([a4 bundleID]);
  if ([v5 _isWebLogin])
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _proxiedClientServiceID]);

    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 _proxiedClientServiceID]);

      double v6 = (void *)v8;
    }
  }

  return v6;
}

- (id)_activeSessionForContext:(id)a3 client:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationSessionManager _clientBundleIDForContext:client:]( self,  "_clientBundleIDForContext:client:",  a3,  a4));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_activeSessions, "objectForKeyedSubscript:", v5));

  return v6;
}

- (void).cxx_destruct
{
}

@end