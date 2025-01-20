@interface RPMultipleClientProxy
+ (id)clientProxy;
- (NSMutableSet)connectionSet;
- (RPMultipleClientProxy)init;
- (int)currentConnectionProcessIdentifier;
- (void)handleNewConnection:(id)a3 currentState:(id)a4;
- (void)recordingDidPause;
- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4;
- (void)recordingLockInterrupted:(id)a3;
- (void)recordingTimerDidUpdate:(id)a3;
- (void)resetConnectionWithProcessIdentifier:(int)a3;
- (void)setConnectionSet:(id)a3;
- (void)setCurrentConnectionProcessIdentifier:(int)a3;
- (void)shouldResumeSessionType:(id)a3;
- (void)updateBroadcastURL:(id)a3;
- (void)updateScreenRecordingStateWithCurrentState:(id)a3;
@end

@implementation RPMultipleClientProxy

+ (id)clientProxy
{
  if (qword_100084730 != -1) {
    dispatch_once(&qword_100084730, &stru_1000715C0);
  }
  return (id)qword_100084728;
}

- (RPMultipleClientProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPMultipleClientProxy;
  v2 = -[RPMultipleClientProxy init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[RPMultipleClientProxy setConnectionSet:](v2, "setConnectionSet:", v3);
  }

  return v2;
}

- (void)resetConnectionWithProcessIdentifier:(int)a3
{
  v4 = self;
  objc_sync_enter(v4);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v4, "connectionSet", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    v7 = 0LL;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8LL * (void)i);

        v7 = v10;
        if ([v10 processIdentifier] == a3)
        {
          [v10 setInvalidationHandler:0];
          [v10 setInterruptionHandler:0];
          [v10 invalidate];
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  if ([0 processIdentifier] == a3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v4, "connectionSet"));
    [v11 removeObject:0];
  }

  objc_sync_exit(v4);
}

- (void)handleNewConnection:(id)a3 currentState:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v7, "connectionSet"));
  unsigned __int8 v9 = [v8 containsObject:v11];

  if ((v9 & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v7, "connectionSet"));
    [v10 addObject:v11];
  }

  -[RPMultipleClientProxy updateScreenRecordingStateWithCurrentState:]( v7,  "updateScreenRecordingStateWithCurrentState:",  v6);
  objc_sync_exit(v7);
}

- (void)updateScreenRecordingStateWithCurrentState:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPMultipleClientProxy:updateScreenRecordingState:",  buf,  2u);
  }

  objc_super v5 = self;
  objc_sync_enter(v5);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v5, "connectionSet", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remoteObjectProxyWithErrorHandler:&stru_1000715E0]);
        [v10 updateScreenRecordingStateWithCurrentState:v4];

        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPMultipleClientProxy:recordingDidStopWithError:movieURL:",  buf,  2u);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v8, "connectionSet", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) remoteObjectProxyWithErrorHandler:&stru_100071600]);
        [v13 recordingDidStopWithError:v6 movieURL:v7];

        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)updateBroadcastURL:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPMultipleClientProxy:updateBroadcastURL:",  buf,  2u);
  }

  objc_super v5 = self;
  objc_sync_enter(v5);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v5, "connectionSet", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remoteObjectProxyWithErrorHandler:&stru_100071620]);
        [v10 updateBroadcastURL:v4];

        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)recordingLockInterrupted:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPMultipleClientProxy:recordingLockInterrupted:",  buf,  2u);
  }

  objc_super v5 = self;
  objc_sync_enter(v5);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v5, "connectionSet", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remoteObjectProxyWithErrorHandler:&stru_100071640]);
        [v10 recordingLockInterrupted:v4];

        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)recordingTimerDidUpdate:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RPMultipleClientProxy:recordingTimerDidUpdate:",  buf,  2u);
  }

  objc_super v5 = self;
  objc_sync_enter(v5);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPMultipleClientProxy connectionSet](v5, "connectionSet", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) remoteObjectProxyWithErrorHandler:&stru_100071660]);
        [v10 recordingTimerDidUpdate:v4];

        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)recordingDidPause
{
  BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v2) {
    sub_1000445E0(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)shouldResumeSessionType:(id)a3
{
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v3) {
    sub_100044614(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (int)currentConnectionProcessIdentifier
{
  return self->_currentConnectionProcessIdentifier;
}

- (void)setCurrentConnectionProcessIdentifier:(int)a3
{
  self->_currentConnectionProcessIdentifier = a3;
}

- (NSMutableSet)connectionSet
{
  return self->_connectionSet;
}

- (void)setConnectionSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end