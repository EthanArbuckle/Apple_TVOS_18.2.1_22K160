@interface IDSActivityPushListener
- (BOOL)downgradeOnLock;
- (BOOL)listening;
- (BOOL)shouldListen;
- (IDSActivityPushListener)initWithQueue:(id)a3 shouldDowngradeOnLock:(BOOL)a4;
- (IDSActivityPushListenerDelegate)delegate;
- (IDSPushHandler)persistentEnrollmentHandler;
- (IDSPushHandler)pushHandler;
- (IMSystemMonitor)systemMonitor;
- (NSSet)topicsToListenOn;
- (OS_dispatch_queue)queue;
- (id)_nonWakingTopics;
- (id)_opportunisticTopics;
- (void)_configurePushHandler:(BOOL)a3;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setDowngradeOnLock:(BOOL)a3;
- (void)setListening:(BOOL)a3;
- (void)setPersistentEnrollmentHandler:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldListen:(BOOL)a3;
- (void)setSystemMonitor:(id)a3;
- (void)setTopicsToListenOn:(id)a3;
- (void)systemDidLock;
- (void)systemDidUnlock;
@end

@implementation IDSActivityPushListener

- (IDSActivityPushListener)initWithQueue:(id)a3 shouldDowngradeOnLock:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IDSActivityPushListener;
  v8 = -[IDSActivityPushListener init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
    pushHandler = v9->_pushHandler;
    v9->_pushHandler = (IDSPushHandler *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    topicsToListenOn = v9->_topicsToListenOn;
    v9->_topicsToListenOn = (NSSet *)v12;

    v9->_downgradeOnLock = v4;
    if (v4)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
      systemMonitor = v9->_systemMonitor;
      v9->_systemMonitor = (IMSystemMonitor *)v14;

      -[IMSystemMonitor addListener:](v9->_systemMonitor, "addListener:", v9);
    }
  }

  return v9;
}

- (void)setTopicsToListenOn:(id)a3
{
  v5 = (NSSet *)a3;
  topicsToListenOn = self->_topicsToListenOn;
  if (topicsToListenOn != v5)
  {
    v8 = v5;
    if (!v5
      || !topicsToListenOn
      || (unsigned __int8 v7 = -[NSSet isEqualToSet:](topicsToListenOn, "isEqualToSet:", v5), v5 = v8, (v7 & 1) == 0))
    {
      objc_storeStrong((id *)&self->_topicsToListenOn, a3);
      -[IDSActivityPushListener _configurePushHandler:](self, "_configurePushHandler:", 0LL);
      v5 = v8;
    }
  }
}

- (void)setShouldListen:(BOOL)a3
{
  if (self->_shouldListen != a3)
  {
    self->_shouldListen = a3;
    -[IDSActivityPushListener _configurePushHandler:](self, "_configurePushHandler:", 0LL);
  }

- (void)_configurePushHandler:(BOOL)a3
{
  BOOL v4 = self->_listening && !a3;
  if (v4 || !self->_shouldListen)
  {
    if (-[NSSet count](self->_topicsToListenOn, "count", a3) && self->_shouldListen)
    {
      pushHandler = self->_pushHandler;
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[IDSActivityPushListener _opportunisticTopics](self, "_opportunisticTopics"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityPushListener _nonWakingTopics](self, "_nonWakingTopics"));
      -[IDSPushHandler setWakingTopics:opportunisticTopics:nonWakingTopics:forListener:]( pushHandler,  "setWakingTopics:opportunisticTopics:nonWakingTopics:forListener:",  0LL,  v11,  v10,  self);
    }

    else
    {
      -[IDSPushHandler removeListener:](self->_pushHandler, "removeListener:", self);
      self->_listening = 0;
    }
  }

  else if (-[NSSet count](self->_topicsToListenOn, "count", a3))
  {
    v5 = self->_pushHandler;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityPushListener _opportunisticTopics](self, "_opportunisticTopics"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityPushListener _nonWakingTopics](self, "_nonWakingTopics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", &off_1009472D8, 0LL));
    -[IDSPushHandler addListener:wakingTopics:opportunisticTopics:nonWakingTopics:commands:queue:]( v5,  "addListener:wakingTopics:opportunisticTopics:nonWakingTopics:commands:queue:",  self,  0LL,  v6,  v7,  v8,  self->_queue);

    self->_listening = 1;
  }

- (id)_opportunisticTopics
{
  if (self->_downgradeOnLock
    && (-[IMSystemMonitor isSystemLocked](self->_systemMonitor, "isSystemLocked") & 1) != 0)
  {
    id v3 = 0LL;
  }

  else
  {
    id v3 = -[NSSet copy](self->_topicsToListenOn, "copy");
  }

  return v3;
}

- (id)_nonWakingTopics
{
  else {
    id v3 = 0LL;
  }
  return v3;
}

- (void)systemDidLock
{
}

- (void)systemDidUnlock
{
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 _numberForKey:@"c"]);
  id v12 = [v11 integerValue];

  if (v12 == (id)223)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityPushListener delegate](self, "delegate"));

    if (v13)
    {
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Received update message: %@",  (uint8_t *)&v22,  0xCu);
      }

      v15 = objc_alloc_init(&OBJC_CLASS___IDSActivityUpdatePush);
      -[IDSActivityUpdatePush setActivityTopic:](v15, "setActivityTopic:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v9 _numberForKey:@"pS"]);
      -[IDSActivityUpdatePush setActivityStatus:](v15, "setActivityStatus:", [v16 BOOLValue]);

      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v9 _dataForKey:@"pT"]);
      -[IDSActivityUpdatePush setToken:](v15, "setToken:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 _dataForKey:@"pAM"]);
      -[IDSActivityUpdatePush setMetadataBlob:](v15, "setMetadataBlob:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue([v9 _numberForKey:@"pTs"]);
      -[IDSActivityUpdatePush setActivityTimestamp:](v15, "setActivityTimestamp:", [v19 integerValue]);

      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 _stringForKey:@"pSa"]);
      -[IDSActivityUpdatePush setActivitySubActivity:](v15, "setActivitySubActivity:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityPushListener delegate](self, "delegate"));
      [v21 pushListener:self receivedUpdatePush:v15];
    }
  }
}

- (BOOL)shouldListen
{
  return self->_shouldListen;
}

- (NSSet)topicsToListenOn
{
  return self->_topicsToListenOn;
}

- (IDSActivityPushListenerDelegate)delegate
{
  return (IDSActivityPushListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IDSPushHandler)persistentEnrollmentHandler
{
  return self->_persistentEnrollmentHandler;
}

- (void)setPersistentEnrollmentHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)listening
{
  return self->_listening;
}

- (void)setListening:(BOOL)a3
{
  self->_listening = a3;
}

- (BOOL)downgradeOnLock
{
  return self->_downgradeOnLock;
}

- (void)setDowngradeOnLock:(BOOL)a3
{
  self->_downgradeOnLock = a3;
}

- (void).cxx_destruct
{
}

@end