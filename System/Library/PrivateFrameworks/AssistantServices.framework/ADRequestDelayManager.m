@interface ADRequestDelayManager
- (ADRequestDelayManager)initWithQueue:(id)a3;
- (ADRequestDelayManagerDelegate)delegate;
- (BOOL)isDelaying;
- (id)_delayedCommandHandlers;
- (id)_delayedcontextCommandHandlers;
- (void)_beginTimerForContextCommands;
- (void)beginTimerForContextCommands;
- (void)dequeueDelayedCommandsAndSend:(BOOL)a3 completion:(id)a4;
- (void)interceptCommand:(id)a3 completion:(id)a4;
- (void)releaseStoredContextCommandsAndSendCommands:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsDelaying:(BOOL)a3;
- (void)startDelaying;
- (void)stopDelayingAndSendCommands:(BOOL)a3 completion:(id)a4;
@end

@implementation ADRequestDelayManager

- (ADRequestDelayManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRequestDelayManager;
  v6 = -[ADRequestDelayManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (id)_delayedCommandHandlers
{
  delayedCommandHandlers = self->_delayedCommandHandlers;
  if (!delayedCommandHandlers)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___AFQueue);
    id v5 = self->_delayedCommandHandlers;
    self->_delayedCommandHandlers = v4;

    delayedCommandHandlers = self->_delayedCommandHandlers;
  }

  return delayedCommandHandlers;
}

- (id)_delayedcontextCommandHandlers
{
  delayedcontextCommandHandlers = self->_delayedcontextCommandHandlers;
  if (!delayedcontextCommandHandlers)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___AFQueue);
    id v5 = self->_delayedcontextCommandHandlers;
    self->_delayedcontextCommandHandlers = v4;

    delayedcontextCommandHandlers = self->_delayedcontextCommandHandlers;
  }

  return delayedcontextCommandHandlers;
}

- (void)startDelaying
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001085DC;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopDelayingAndSendCommands:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100108480;
  block[3] = &unk_1004FCB38;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)dequeueDelayedCommandsAndSend:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  while (1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADRequestDelayManager _delayedCommandHandlers](self, "_delayedCommandHandlers"));
    id v7 = [v6 count];

    if (!v7) {
      break;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADRequestDelayManager _delayedCommandHandlers](self, "_delayedCommandHandlers"));
    objc_super v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v8 dequeueObject]);

    v9[2](v9, v4);
  }

  id v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    id v10 = v11;
  }
}

- (void)releaseStoredContextCommandsAndSendCommands:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADRequestDelayManager _delayedcontextCommandHandlers](self, "_delayedcontextCommandHandlers"));
    int v12 = 136315650;
    v13 = "-[ADRequestDelayManager releaseStoredContextCommandsAndSendCommands:]";
    __int16 v14 = 2048;
    id v15 = [v7 count];
    __int16 v16 = 1024;
    BOOL v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Releasing %lu delayed context commands sendCommands: %d",  (uint8_t *)&v12,  0x1Cu);
  }

  while (1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADRequestDelayManager _delayedcontextCommandHandlers](self, "_delayedcontextCommandHandlers"));
    id v11 = [v10 count];

    if (!v11) {
      break;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADRequestDelayManager _delayedcontextCommandHandlers](self, "_delayedcontextCommandHandlers"));
    objc_super v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v8 dequeueObject]);
    v9[2](v9, v3);
  }

- (void)beginTimerForContextCommands
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100108478;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_beginTimerForContextCommands
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADRequestDelayManager _delayedcontextCommandHandlers](self, "_delayedcontextCommandHandlers"));
  id v4 = [v3 count];

  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
    queue = self->_queue;
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    v13 = sub_1001083B8;
    __int16 v14 = &unk_1004FAF58;
    objc_copyWeak(&v15, &location);
    id v7 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v5,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  &v11,  60.0);
    currentContextCommandsTimer = self->_currentContextCommandsTimer;
    self->_currentContextCommandsTimer = v7;

    objc_super v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[ADRequestDelayManager _beginTimerForContextCommands]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Starting/Resetting context commands timer",  buf,  0xCu);
    }

    -[AFWatchdogTimer reset](self->_currentContextCommandsTimer, "reset", v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[ADRequestDelayManager _beginTimerForContextCommands]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Context command queue empty, not starting timer",  buf,  0xCu);
    }
  }

- (void)interceptCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_100577E10 != -1) {
    dispatch_once(&qword_100577E10, &stru_1004F1AA0);
  }
  id v8 = (id)qword_100577E08;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v6 groupIdentifier]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKey:v9]);
  if (!v10)
  {

    goto LABEL_9;
  }

  id v11 = (void *)v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 groupIdentifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v12]);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedClassName]);
  unsigned int v15 = [v13 containsObject:v14];

  if (!v15)
  {
LABEL_9:
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100108160;
    block[3] = &unk_1004FD9E0;
    block[4] = self;
    id v19 = v6;
    id v20 = v7;
    dispatch_async(queue, block);

    goto LABEL_10;
  }

  __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[ADRequestDelayManager interceptCommand:completion:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Whitelisted command received, bypassing delay: %@",  buf,  0x16u);
  }

  (*((void (**)(id, uint64_t))v7 + 2))(v7, 1LL);
LABEL_10:
}

- (ADRequestDelayManagerDelegate)delegate
{
  return (ADRequestDelayManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDelaying
{
  return self->_isDelaying;
}

- (void)setIsDelaying:(BOOL)a3
{
  self->_isDelaying = a3;
}

- (void).cxx_destruct
{
}

@end