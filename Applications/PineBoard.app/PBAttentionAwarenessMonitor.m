@interface PBAttentionAwarenessMonitor
- (AWAttentionAwarenessClient)awarenessClient;
- (BOOL)isAttentionLost;
- (BOOL)resumeWithError:(id *)a3;
- (BOOL)suspendWithError:(id *)a3;
- (PBAttentionAwarenessMonitor)initWithTimeout:(double)a3 observerQueue:(id)a4;
- (TVSObserverSet)observers;
- (double)timeout;
- (void)_notifyAttentionLost;
- (void)_notifyAttentionRegained;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAwarenessClient:(id)a3;
@end

@implementation PBAttentionAwarenessMonitor

- (PBAttentionAwarenessMonitor)initWithTimeout:(double)a3 observerQueue:(id)a4
{
  id v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PBAttentionAwarenessMonitor;
  v7 = -[PBAttentionAwarenessMonitor init](&v22, "init");
  if (!v7) {
    goto LABEL_7;
  }
  v8 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
  observers = v7->_observers;
  v7->_observers = v8;

  v10 = (void *)objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessConfiguration);
  [v10 setIdentifier:@"com.apple.PineBoard.attentionAwarenessMonitor"];
  [v10 setEventMask:4095];
  [v10 setAttentionLostTimeout:a3];
  v11 = objc_alloc_init(&OBJC_CLASS___AWAttentionAwarenessClient);
  awarenessClient = v7->_awarenessClient;
  v7->_awarenessClient = v11;

  v13 = v7->_awarenessClient;
  id v21 = 0LL;
  -[AWAttentionAwarenessClient setConfiguration:shouldReset:error:]( v13,  "setConfiguration:shouldReset:error:",  v10,  0LL,  &v21);
  id v14 = v21;
  if (!v14)
  {
    objc_initWeak((id *)buf, v7);
    v17 = v7->_awarenessClient;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10012AAE4;
    v19[3] = &unk_1003D0840;
    objc_copyWeak(&v20, (id *)buf);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v17, "setEventHandlerWithQueue:block:", v6, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

LABEL_7:
    v16 = v7;
    goto LABEL_8;
  }

  v15 = v14;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed to set up PBAttentionAwarenessMonitor: %{public}@",  buf,  0xCu);
  }

  v16 = 0LL;
LABEL_8:

  return v16;
}

- (double)timeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AWAttentionAwarenessClient configuration](self->_awarenessClient, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attentionLostTimeouts]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 anyObject]);
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (BOOL)resumeWithError:(id *)a3
{
  return -[AWAttentionAwarenessClient resumeWithError:](self->_awarenessClient, "resumeWithError:", a3);
}

- (BOOL)suspendWithError:(id *)a3
{
  return -[AWAttentionAwarenessClient suspendWithError:]( self->_awarenessClient,  "suspendWithError:",  a3);
}

- (void)addObserver:(id)a3
{
  if (a3) {
    id v3 = -[TVSObserverSet addObserver:](self->_observers, "addObserver:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[TVSObserverSet removeObserver:](self->_observers, "removeObserver:");
  }
}

- (void)_notifyAttentionLost
{
  observers = self->_observers;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10012AC80;
  v3[3] = &unk_1003D88A0;
  v3[4] = self;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v3);
}

- (void)_notifyAttentionRegained
{
  observers = self->_observers;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10012ACF4;
  v3[3] = &unk_1003D88A0;
  v3[4] = self;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v3);
}

- (BOOL)isAttentionLost
{
  return self->_attentionLost;
}

- (AWAttentionAwarenessClient)awarenessClient
{
  return self->_awarenessClient;
}

- (void)setAwarenessClient:(id)a3
{
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end