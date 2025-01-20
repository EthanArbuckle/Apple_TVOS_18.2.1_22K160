@interface DownloadHandlerAuthenticationOperation
- (DownloadHandlerAuthenticationOperation)initWithSessionProperties:(id)a3;
- (DownloadSessionProperties)sessionProperties;
- (NSURLCredential)URLCredential;
- (id)_openSession;
- (id)outputBlock;
- (int64_t)downloadSessionState;
- (void)_setState:(int64_t)a3;
- (void)_setURLCredential:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)downloadHandlerManager:(id)a3 sessionsDidChange:(id)a4;
- (void)run;
- (void)setOutputBlock:(id)a3;
@end

@implementation DownloadHandlerAuthenticationOperation

- (DownloadHandlerAuthenticationOperation)initWithSessionProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DownloadHandlerAuthenticationOperation;
  v4 = -[DownloadHandlerAuthenticationOperation init](&v6, "init");
  if (v4)
  {
    v4->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
    v4->_sessionProperties = (DownloadSessionProperties *)[a3 copy];
  }

  return v4;
}

- (void)dealloc
{
  semaphore = (dispatch_object_s *)self->_semaphore;
  if (semaphore) {
    dispatch_release(semaphore);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DownloadHandlerAuthenticationOperation;
  -[DownloadHandlerAuthenticationOperation dealloc](&v4, "dealloc");
}

- (int64_t)downloadSessionState
{
  int64_t state = self->_state;
  -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
  return state;
}

- (id)outputBlock
{
  id v3 = [self->_outputBlock copy];
  -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
  return v3;
}

- (DownloadSessionProperties)sessionProperties
{
  return (DownloadSessionProperties *)-[DownloadSessionProperties copy](self->_sessionProperties, "copy");
}

- (void)setOutputBlock:(id)a3
{
  id outputBlock = self->_outputBlock;
  if (outputBlock != a3)
  {

    self->_id outputBlock = [a3 copy];
  }

  -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
}

- (NSURLCredential)URLCredential
{
  id v3 = self->_urlCredential;
  -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
  return v3;
}

- (void)cancel
{
  int64_t sessionID = self->_sessionID;
  -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
  if (sessionID) {
    objc_msgSend( +[DownloadHandlerManager handlerManager](DownloadHandlerManager, "handlerManager"),  "cancelSessionWithID:",  sessionID);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DownloadHandlerAuthenticationOperation;
  -[DownloadHandlerAuthenticationOperation cancel](&v4, "cancel");
}

- (void)run
{
  id v3 = +[DownloadHandlerManager handlerManager](&OBJC_CLASS___DownloadHandlerManager, "handlerManager");
  [v3 addHandlerObserver:self];
  id v4 = 0LL;
  id v5 = 0LL;
  while (v5)
  {
LABEL_5:
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
    int64_t v10 = -[DownloadHandlerAuthenticationOperation downloadSessionState](self, "downloadSessionState");
    if (v10)
    {
      if (v10 != 7) {
        goto LABEL_22;
      }
      if (v4)
      {
        [v3 endBackgroundTaskForSessionWithID:v5 identifier:v4];
      }

      -[DownloadHandlerAuthenticationOperation lock](self, "lock");
      self->_int64_t sessionID = 0LL;
      -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
      +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 10.0);
      id v4 = 0LL;
      id v5 = 0LL;
    }
  }

  id v6 = -[DownloadHandlerAuthenticationOperation _openSession](self, "_openSession");
  if (v6)
  {
    v7 = v6;
    -[DownloadHandlerAuthenticationOperation lock](self, "lock");
    id v5 = [v7 sessionID];
    self->_int64_t sessionID = (int64_t)v5;
    -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
    v8 = +[SSWeakReference weakReferenceWithObject:](&OBJC_CLASS___SSWeakReference, "weakReferenceWithObject:", self);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10013DB5C;
    v23[3] = &unk_10034AE98;
    v23[4] = v8;
    id v4 = [v3 beginBackgroundTaskForSessionWithID:v5 reason:10 expirationBlock:v23];
    id v9 = v4;
    [v3 beginSessionWithID:v5];
    goto LABEL_5;
  }

  id v11 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v11) {
    id v11 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v12 = [v11 shouldLog];
  else {
    LODWORD(v13) = v12;
  }
  v14 = (os_log_s *)[v11 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    uint64_t v13 = v13;
  }
  else {
    v13 &= 2u;
  }
  if ((_DWORD)v13)
  {
    uint64_t v16 = objc_opt_class(self);
    sessionProperties = self->_sessionProperties;
    int v24 = 138412546;
    uint64_t v25 = v16;
    __int16 v26 = 2112;
    v27 = sessionProperties;
    uint64_t v18 = _os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  2LL,  "%@: No session for properties: %@",  &v24,  22);
    if (v18)
    {
      v19 = (void *)v18;
      v20 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v18, 4LL);
      free(v19);
      v22 = v20;
      *(void *)&double v15 = SSFileLog(v11, @"%@").n128_u64[0];
    }
  }

  -[DownloadHandlerAuthenticationOperation _setState:](self, "_setState:", 10LL, v15, v22);
  id v5 = 0LL;
LABEL_22:
  v21 = -[DownloadHandlerAuthenticationOperation outputBlock](self, "outputBlock");
  if (v21)
  {
    v21[2]( v21,  -[DownloadHandlerAuthenticationOperation downloadSessionState](self, "downloadSessionState"),  -[DownloadHandlerAuthenticationOperation URLCredential](self, "URLCredential"));
    -[DownloadHandlerAuthenticationOperation setOutputBlock:](self, "setOutputBlock:", 0LL);
  }

  if (v4)
  {
    [v3 endBackgroundTaskForSessionWithID:v5 identifier:v4];
  }

  [v3 removeHandlerObserver:self];
}

- (void)downloadHandlerManager:(id)a3 sessionsDidChange:(id)a4
{
  id sessionID = (id)self->_sessionID;
  -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a4);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ([v11 sessionID] == sessionID)
        {
          id v12 = [v11 sessionState];
          -[DownloadHandlerAuthenticationOperation setError:](self, "setError:", [v11 error]);
          -[DownloadHandlerAuthenticationOperation setSuccess:](self, "setSuccess:", v12 != (id)8);
          -[DownloadHandlerAuthenticationOperation _setURLCredential:]( self,  "_setURLCredential:",  [v11 URLCredential]);
          -[DownloadHandlerAuthenticationOperation _setState:](self, "_setState:", v12);
          return;
        }
      }

      id v8 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)_openSession
{
  id v3 = +[DownloadHandlerManager handlerManager](&OBJC_CLASS___DownloadHandlerManager, "handlerManager");
  id v4 = -[DownloadSessionProperties clientIdentifier](self->_sessionProperties, "clientIdentifier");
  id result = [v3 openSessionWithProperties:self->_sessionProperties];
  if (result) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0LL;
  }
  if (!v6)
  {
    uint64_t v20 = FBSOpenApplicationOptionKeyActivateSuspended;
    v21 = &__kCFBooleanTrue;
    unsigned int v7 = -[SpringBoardUtility launchApplicationWithIdentifier:options:error:]( +[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"),  "launchApplicationWithIdentifier:options:error:",  v4,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL),  0LL);
    id result = 0LL;
    if (v7)
    {
      id v8 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v8) {
        id v8 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v9 = [v8 shouldLog];
      else {
        LODWORD(v10) = v9;
      }
      id v11 = (os_log_s *)[v8 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        uint64_t v10 = v10;
      }
      else {
        v10 &= 2u;
      }
      if ((_DWORD)v10)
      {
        int v16 = 138412546;
        uint64_t v17 = objc_opt_class(self);
        __int16 v18 = 2112;
        v19 = v4;
        uint64_t v12 = _os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  1LL,  "%@: Launched download handler: %@",  &v16,  22);
        if (v12)
        {
          __int128 v13 = (void *)v12;
          __int128 v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
          free(v13);
          __int128 v15 = v14;
          SSFileLog(v8, @"%@");
        }
      }

      +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 10.0, v15);
      return [v3 openSessionWithProperties:self->_sessionProperties];
    }
  }

  return result;
}

- (void)_setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_int64_t state = a3;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  }

  -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
}

- (void)_setURLCredential:(id)a3
{
  urlCredential = self->_urlCredential;
  if (urlCredential != a3)
  {

    self->_urlCredential = (NSURLCredential *)a3;
  }

  -[DownloadHandlerAuthenticationOperation unlock](self, "unlock");
}

@end