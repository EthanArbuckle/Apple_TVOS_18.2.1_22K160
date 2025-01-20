@interface CSDVoiceOverObserver
- (BOOL)isBrailleScreenInputEnabled;
- (BOOL)isEnabled;
- (BOOL)shouldRouteToSpeakerWithProximity;
- (CSDVoiceOverObserver)initWithQueue:(id)a3;
- (NSMapTable)delegateToQueue;
- (OS_dispatch_queue)queue;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)handleAXSVoiceOverTouchEnabledNotification:(id)a3;
- (void)performAsynchronousBlock:(id)a3;
- (void)performSynchronousBlock:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)updateEnabled;
@end

@implementation CSDVoiceOverObserver

- (CSDVoiceOverObserver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDVoiceOverObserver;
  v6 = -[CSDVoiceOverObserver init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    dispatch_queue_set_specific((dispatch_queue_t)v7->_queue, v7, v7, 0LL);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDVoiceOverObserver;
  -[CSDVoiceOverObserver dealloc](&v3, "dealloc");
}

- (BOOL)isEnabled
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100181320;
  v4[3] = &unk_1003D7850;
  v4[4] = self;
  v4[5] = &v5;
  -[CSDVoiceOverObserver performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDVoiceOverObserver queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoiceOverObserver delegateToQueue](self, "delegateToQueue"));
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v11, "voiceOverObserver:didChangeEnabled:") & 1) != 0)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoiceOverObserver delegateToQueue](self, "delegateToQueue"));
            v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1001814E0;
            block[3] = &unk_1003D7918;
            block[4] = v11;
            block[5] = self;
            BOOL v15 = v3;
            dispatch_async(v13, block);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }
  }

- (BOOL)isBrailleScreenInputEnabled
{
  return 0;
}

- (BOOL)shouldRouteToSpeakerWithProximity
{
  return 0;
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(self) == self)
  {
    v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = (dispatch_queue_s *)a3;
    v6();
  }

  else
  {
    id v5 = a3;
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDVoiceOverObserver queue](self, "queue"));
    dispatch_sync(v7, v5);
  }
}

- (void)performAsynchronousBlock:(id)a3
{
  if (dispatch_get_specific(self) == self)
  {
    v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = (dispatch_queue_s *)a3;
    v6();
  }

  else
  {
    id v5 = a3;
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDVoiceOverObserver queue](self, "queue"));
    dispatch_async(v7, v5);
  }
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100181688;
  v9[3] = &unk_1003D7828;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  -[CSDVoiceOverObserver performAsynchronousBlock:](self, "performAsynchronousBlock:", v9);
}

- (void)removeDelegate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100181740;
  v4[3] = &unk_1003D7758;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[CSDVoiceOverObserver performSynchronousBlock:](v5, "performSynchronousBlock:", v4);
}

- (void)handleAXSVoiceOverTouchEnabledNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10018187C;
  v7[3] = &unk_1003D7730;
  v7[4] = self;
  -[CSDVoiceOverObserver performAsynchronousBlock:](self, "performAsynchronousBlock:", v7);
}

- (void)updateEnabled
{
  char v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDVoiceOverObserver queue](self, "queue"));
  dispatch_assert_queue_V2(v2);
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end