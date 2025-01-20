@interface ADRemoraEndpointAssistantDeletionSession
- (ADRemoraEndpointAssistantDeletionSession)initWithQueue:(id)a3 instanceContext:(id)a4 endpointAccount:(id)a5 hubAccount:(id)a6;
- (BOOL)assistantSessionShouldAttemptRetry:(id)a3;
- (BOOL)assistantSessionShouldLogVisibleRequestFailure:(id)a3 forError:(id)a4;
- (BOOL)assistantSessionShouldPrewarmConnetion:(id)a3;
- (BOOL)assistantSessionShouldRestartConnectionOnWiFi:(id)a3;
- (id)assistantSessionCommandsToRestoreStateOnNewConnection:(id)a3;
- (void)_cancelSession;
- (void)_finalizeDeleteAssistantHistoryWithState:(int64_t)a3 error:(id)a4;
- (void)_finalizeDestroyAssistantWithState:(int64_t)a3 error:(id)a4;
- (void)_invalidate;
- (void)_startSession;
- (void)assistantSession:(id)a3 beginSessionRetryPreferringWWAN:(BOOL)a4;
- (void)assistantSession:(id)a3 cannotHandleRequest:(id)a4 error:(id)a5;
- (void)assistantSession:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5;
- (void)assistantSession:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4;
- (void)assistantSession:(id)a3 didOpenConnectionWithPolicyId:(id)a4 routeId:(id)a5 connectionDelay:(double)a6;
- (void)assistantSession:(id)a3 receivedCommand:(id)a4;
- (void)assistantSession:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5;
- (void)assistantSession:(id)a3 willRetryOnError:(id)a4;
- (void)assistantSessionConnectionDidClose:(id)a3;
- (void)assistantSessionConnectionDidReset:(id)a3;
- (void)assistantSessionDictationHIPAAMDMStatusDidChange;
- (void)assistantSessionDidCreateAssistant:(id)a3;
- (void)assistantSessionDidDestroyAssistant:(id)a3;
- (void)assistantSessionRetryingRequest:(id)a3;
- (void)assistantSessionWillStartConnection:(id)a3;
- (void)dealloc;
- (void)deleteAssistantHistoryWithCompletion:(id)a3;
- (void)destroyAssistantWithCompletion:(id)a3;
- (void)invalidate;
@end

@implementation ADRemoraEndpointAssistantDeletionSession

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    instanceContext = self->_instanceContext;
    *(_DWORD *)buf = 136315650;
    v7 = "-[ADRemoraEndpointAssistantDeletionSession dealloc]";
    __int16 v8 = 2048;
    v9 = self;
    __int16 v10 = 2112;
    v11 = instanceContext;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p instanceContext = %@", buf, 0x20u);
  }

  -[ADRemoraEndpointAssistantDeletionSession _invalidate](self, "_invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointAssistantDeletionSession;
  -[ADRemoraEndpointAssistantDeletionSession dealloc](&v5, "dealloc");
}

- (ADRemoraEndpointAssistantDeletionSession)initWithQueue:(id)a3 instanceContext:(id)a4 endpointAccount:(id)a5 hubAccount:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v22 handleFailureInMethod:a2, self, @"ADRemoraEndpointAssistantDeletionSession.m", 72, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_12:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v24 handleFailureInMethod:a2, self, @"ADRemoraEndpointAssistantDeletionSession.m", 74, @"Invalid parameter not satisfying: %@", @"endpointAccount != nil" object file lineNumber description];

      if (v15) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v23 handleFailureInMethod:a2, self, @"ADRemoraEndpointAssistantDeletionSession.m", 73, @"Invalid parameter not satisfying: %@", @"instanceContext != nil" object file lineNumber description];

  if (!v14) {
    goto LABEL_12;
  }
LABEL_4:
  if (v15) {
    goto LABEL_5;
  }
LABEL_13:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v25 handleFailureInMethod:a2, self, @"ADRemoraEndpointAssistantDeletionSession.m", 75, @"Invalid parameter not satisfying: %@", @"hubAccount != nil" object file lineNumber description];

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ADRemoraEndpointAssistantDeletionSession;
  v16 = -[ADRemoraEndpointAssistantDeletionSession init](&v28, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_queue, a3);
    objc_storeStrong((id *)&v17->_instanceContext, a4);
    objc_storeStrong((id *)&v17->_endpointAccount, a5);
    objc_storeStrong((id *)&v17->_hubAccount, a6);
    v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      instanceContext = v17->_instanceContext;
      *(_DWORD *)buf = 136315650;
      v30 = "-[ADRemoraEndpointAssistantDeletionSession initWithQueue:instanceContext:endpointAccount:hubAccount:]";
      __int16 v31 = 2048;
      v32 = v17;
      __int16 v33 = 2112;
      v34 = instanceContext;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s %p instanceContext = %@", buf, 0x20u);
    }

    queue = (dispatch_queue_s *)v17->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000BF35C;
    block[3] = &unk_1004FD940;
    v27 = v17;
    dispatch_async(queue, block);
  }

  return v17;
}

- (void)deleteAssistantHistoryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = "-[ADRemoraEndpointAssistantDeletionSession deleteAssistantHistoryWithCompletion:]";
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %p %llu started", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BEECC;
  block[3] = &unk_1004FB930;
  id v10 = v4;
  uint64_t v11 = v5;
  void block[4] = self;
  id v8 = v4;
  dispatch_async(queue, block);
}

- (void)destroyAssistantWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = "-[ADRemoraEndpointAssistantDeletionSession destroyAssistantWithCompletion:]";
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2048;
    uint64_t v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %p %llu", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BEA24;
  block[3] = &unk_1004FB930;
  id v10 = v4;
  uint64_t v11 = v5;
  void block[4] = self;
  id v8 = v4;
  dispatch_async(queue, block);
}

- (void)_startSession
{
  if (!self->_session)
  {
    v3 = -[ADPreferences initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___ADPreferences),  "initWithInstanceContext:",  self->_instanceContext);
    id v4 = objc_alloc(+[ADSession sessionClassForType:](&OBJC_CLASS___ADSession, "sessionClassForType:", 0LL));
    queue = self->_queue;
    endpointAccount = self->_endpointAccount;
    hubAccount = self->_hubAccount;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences languageCode](v3, "languageCode"));
    uint64_t v9 = SAConnectionModeAssistantValue;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences sharedUserIdentifier](v3, "sharedUserIdentifier"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADPreferences loggingSharedUserIdentifier](v3, "loggingSharedUserIdentifier"));
    id v12 = (ADSession *)[v4 initOnQueue:queue withAccount:endpointAccount hubAccount:hubAccount languageCode:v8 connectionMode:v9 sharedUserIdentifier:v10 loggingShar edUserIdentifier:v11 instanceContext:self->_instanceContext];
    session = self->_session;
    self->_session = v12;

    -[ADSession setDelegate:](self->_session, "setDelegate:", self);
    -[ADSession preheatAndMakeQuiet:](self->_session, "preheatAndMakeQuiet:", 0LL);
    __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v15 = self->_session;
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[ADRemoraEndpointAssistantDeletionSession _startSession]";
      __int16 v18 = 2048;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %p session = %@", buf, 0x20u);
    }
  }

- (void)_invalidate
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    session = self->_session;
    int64_t deleteAssistantHistoryState = self->_deleteAssistantHistoryState;
    int64_t destroyAssistantState = self->_destroyAssistantState;
    int v9 = 136316162;
    id v10 = "-[ADRemoraEndpointAssistantDeletionSession _invalidate]";
    __int16 v11 = 2048;
    id v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = session;
    __int16 v15 = 2048;
    int64_t v16 = deleteAssistantHistoryState;
    __int16 v17 = 2048;
    int64_t v18 = destroyAssistantState;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s %p session = %@, int64_t deleteAssistantHistoryState = %zd, destroyAssistantState = %zd",  (uint8_t *)&v9,  0x34u);
  }

  if (self->_deleteAssistantHistoryState == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 42LL));
    -[ADRemoraEndpointAssistantDeletionSession _finalizeDeleteAssistantHistoryWithState:error:]( self,  "_finalizeDeleteAssistantHistoryWithState:error:",  3LL,  v7);
  }

  if (self->_destroyAssistantState == 1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 42LL));
    -[ADRemoraEndpointAssistantDeletionSession _finalizeDestroyAssistantWithState:error:]( self,  "_finalizeDestroyAssistantWithState:error:",  3LL,  v8);
  }

  -[ADRemoraEndpointAssistantDeletionSession _cancelSession](self, "_cancelSession");
}

- (void)_cancelSession
{
  session = self->_session;
  if (session)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      v7 = "-[ADRemoraEndpointAssistantDeletionSession _cancelSession]";
      __int16 v8 = 2048;
      int v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = session;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %p session = %@", (uint8_t *)&v6, 0x20u);
      session = self->_session;
    }

    -[ADSession cancel](session, "cancel");
    uint64_t v5 = self->_session;
    self->_session = 0LL;
  }

- (void)_finalizeDeleteAssistantHistoryWithState:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v15 = "-[ADRemoraEndpointAssistantDeletionSession _finalizeDeleteAssistantHistoryWithState:error:]";
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2048;
      int64_t v19 = a3;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s %p int64_t deleteAssistantHistoryState = %zd, error = %@",  buf,  0x2Au);
    }
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[ADRemoraEndpointAssistantDeletionSession _finalizeDeleteAssistantHistoryWithState:error:]";
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s %p int64_t deleteAssistantHistoryState = %zd",  buf,  0x20u);
  }

  deleteAssistantHistoryCommandId = self->_deleteAssistantHistoryCommandId;
  self->_int64_t deleteAssistantHistoryState = a3;
  self->_deleteAssistantHistoryCommandId = 0LL;

  deleteAssistantHistoryHandlers = self->_deleteAssistantHistoryHandlers;
  self->_deleteAssistantHistoryHandlers = 0LL;
  __int16 v10 = deleteAssistantHistoryHandlers;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000BEA18;
  v12[3] = &unk_1004F01E8;
  id v13 = v6;
  id v11 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v12);
}

- (void)_finalizeDestroyAssistantWithState:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v15 = "-[ADRemoraEndpointAssistantDeletionSession _finalizeDestroyAssistantWithState:error:]";
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2048;
      int64_t v19 = a3;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s %p int64_t destroyAssistantState = %zd, error = %@",  buf,  0x2Au);
    }
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[ADRemoraEndpointAssistantDeletionSession _finalizeDestroyAssistantWithState:error:]";
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %p int64_t destroyAssistantState = %zd", buf, 0x20u);
  }

  destroyAssistantCommandId = self->_destroyAssistantCommandId;
  self->_int64_t destroyAssistantState = a3;
  self->_destroyAssistantCommandId = 0LL;

  destroyAssistantHandlers = self->_destroyAssistantHandlers;
  self->_destroyAssistantHandlers = 0LL;
  __int16 v10 = destroyAssistantHandlers;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000BEA0C;
  v12[3] = &unk_1004F01E8;
  id v13 = v6;
  id v11 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v12);
}

- (BOOL)assistantSessionShouldPrewarmConnetion:(id)a3
{
  return 1;
}

- (void)assistantSessionWillStartConnection:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[ADRemoraEndpointAssistantDeletionSession assistantSessionWillStartConnection:]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v5, 0x16u);
  }

- (void)assistantSession:(id)a3 receivedCommand:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v12 = "-[ADRemoraEndpointAssistantDeletionSession assistantSession:receivedCommand:]";
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s %p command = %@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000BE6F8;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)assistantSession:(id)a3 cannotHandleRequest:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315906;
    id v11 = "-[ADRemoraEndpointAssistantDeletionSession assistantSession:cannotHandleRequest:error:]";
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s %p request = %@, error = %@",  (uint8_t *)&v10,  0x2Au);
  }
}

- (void)assistantSession:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v14 = "-[ADRemoraEndpointAssistantDeletionSession assistantSession:receivedError:isRetryableError:]";
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 1024;
    BOOL v20 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s %p error = %@, isRetryable = %d",  buf,  0x26u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000BE69C;
  v11[3] = &unk_1004FD968;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (BOOL)assistantSessionShouldLogVisibleRequestFailure:(id)a3 forError:(id)a4
{
  return 0;
}

- (BOOL)assistantSessionShouldRestartConnectionOnWiFi:(id)a3
{
  return 1;
}

- (void)assistantSessionConnectionDidReset:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[ADRemoraEndpointAssistantDeletionSession assistantSessionConnectionDidReset:]";
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BE5D8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)assistantSessionShouldAttemptRetry:(id)a3
{
  return 0;
}

- (id)assistantSessionCommandsToRestoreStateOnNewConnection:(id)a3
{
  return 0LL;
}

- (void)assistantSession:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315906;
    id v11 = "-[ADRemoraEndpointAssistantDeletionSession assistantSession:didChangeRequestIdFrom:toId:]";
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s %p oldId = %@, newId = %@",  (uint8_t *)&v10,  0x2Au);
  }
}

- (void)assistantSessionDidCreateAssistant:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[ADRemoraEndpointAssistantDeletionSession assistantSessionDidCreateAssistant:]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v5, 0x16u);
  }

- (void)assistantSessionDidDestroyAssistant:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[ADRemoraEndpointAssistantDeletionSession assistantSessionDidDestroyAssistant:]";
    __int16 v9 = 2048;
    int v10 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BE5C8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)assistantSession:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315650;
    id v8 = "-[ADRemoraEndpointAssistantDeletionSession assistantSession:didLoadAssistantSyncRequested:]";
    __int16 v9 = 2048;
    int v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s %p syncRequested = %d",  (uint8_t *)&v7,  0x1Cu);
  }

- (void)assistantSession:(id)a3 didOpenConnectionWithPolicyId:(id)a4 routeId:(id)a5 connectionDelay:(double)a6
{
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136316162;
    __int16 v13 = "-[ADRemoraEndpointAssistantDeletionSession assistantSession:didOpenConnectionWithPolicyId:routeId:connectionDelay:]";
    __int16 v14 = 2048;
    id v15 = self;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2048;
    double v21 = a6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s %p policyId = %@, routeId = %@, connectionDelay = %f",  (uint8_t *)&v12,  0x34u);
  }
}

- (void)assistantSession:(id)a3 willRetryOnError:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315650;
    id v8 = "-[ADRemoraEndpointAssistantDeletionSession assistantSession:willRetryOnError:]";
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s %p error = %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)assistantSession:(id)a3 beginSessionRetryPreferringWWAN:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315650;
    id v8 = "-[ADRemoraEndpointAssistantDeletionSession assistantSession:beginSessionRetryPreferringWWAN:]";
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s %p preferWWAN = %d",  (uint8_t *)&v7,  0x1Cu);
  }

- (void)assistantSessionConnectionDidClose:(id)a3
{
  BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[ADRemoraEndpointAssistantDeletionSession assistantSessionConnectionDidClose:]";
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BE504;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)assistantSessionDictationHIPAAMDMStatusDidChange
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    id v5 = "-[ADRemoraEndpointAssistantDeletionSession assistantSessionDictationHIPAAMDMStatusDidChange]";
    __int16 v6 = 2048;
    int v7 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v4, 0x16u);
  }

- (void)assistantSessionRetryingRequest:(id)a3
{
  int v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    __int16 v6 = "-[ADRemoraEndpointAssistantDeletionSession assistantSessionRetryingRequest:]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v5, 0x16u);
  }

- (void)invalidate
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v7 = "-[ADRemoraEndpointAssistantDeletionSession invalidate]";
    __int16 v8 = 2048;
    __int16 v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BE4FC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

@end