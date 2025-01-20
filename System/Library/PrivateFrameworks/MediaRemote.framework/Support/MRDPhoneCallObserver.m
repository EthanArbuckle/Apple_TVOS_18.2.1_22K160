@interface MRDPhoneCallObserver
- (BOOL)callControllerWillHandleCommandForBargeCalls:(id)a3;
- (MRDPhoneCallObserver)init;
- (MRDPhoneCallObserverDelegate)delegate;
- (void)_notifyDelegate:(id)a3;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)handleMediaRemoteCommand:(id)a3 completion:(id)a4;
- (void)numberOfActivePhoneCalls:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MRDPhoneCallObserver

- (MRDPhoneCallObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRDPhoneCallObserver;
  v2 = -[MRDPhoneCallObserver init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___CXCallObserver);
    callObserver = v2->_callObserver;
    v2->_callObserver = v3;

    -[CXCallObserver setDelegate:queue:](v2->_callObserver, "setDelegate:queue:", v2, &_dispatch_main_q);
  }

  return v2;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "UUID", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  -[MRDPhoneCallObserver _notifyDelegate:](self, "_notifyDelegate:", v5);
}

- (void)_notifyDelegate:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector(WeakRetained, "phoneCallObserver:callDidChange:");

  if ((v5 & 1) != 0)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 phoneCallObserver:self callDidChange:v7];
  }
}

- (void)numberOfActivePhoneCalls:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    char v5 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallObserver calls](self->_callObserver, "calls"));
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0LL;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        }

        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v7);
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    v4[2](v4, v8);
  }
}

- (BOOL)callControllerWillHandleCommandForBargeCalls:(id)a3
{
  return 0;
}

- (void)handleMediaRemoteCommand:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  uint64_t v8 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 commandID]);
  v10 = -[NSMutableString initWithFormat:]( v8,  "initWithFormat:",  @"%@<%@>",  @"MRDPhoneCallObserver.handleMediaRemoteCommand",  v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  if (v11)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
    -[NSMutableString appendFormat:](v10, "appendFormat:", @" for %@", v13);
  }

  uint64_t v14 = _MRLogForCategory(10LL, v12);
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000F64A0;
  v20[3] = &unk_1003A0860;
  id v21 = v5;
  id v22 = v7;
  id v23 = v6;
  id v16 = v6;
  id v17 = v7;
  id v18 = v5;
  v19 = objc_retainBlock(v20);
  ((void (*)(void *, void, void))v19[2])(v19, 0LL, 0LL);
}

- (MRDPhoneCallObserverDelegate)delegate
{
  return (MRDPhoneCallObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end