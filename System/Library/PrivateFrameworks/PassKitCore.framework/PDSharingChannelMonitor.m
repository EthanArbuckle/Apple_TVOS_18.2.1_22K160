@interface PDSharingChannelMonitor
- (BOOL)_canEndpointBePolledOrCleanUpEndpoint:(id)a3;
- (BOOL)disabled;
- (PDSharingChannelMonitor)init;
- (PDSharingChannelMonitor)initWithQueue:(id)a3 webServiceCoordinator:(id)a4 databaseManager:(id)a5 pushNotificationManager:(id)a6 delegate:(id)a7;
- (id)_checkEndpointsToBePolledOrDetermineNextPollDate:(id *)a3;
- (id)pushNotificationTopics;
- (void)_processOutstandingEndpointsAndMessagesWithCompletion:(id)a3;
- (void)_updateEndpointHasOutstandingMessages:(id)a3 hasOutstandingMessages:(BOOL)a4 didCheckForNewMessages:(BOOL)a5;
- (void)checkForNewSharingMessagesWithShouldCheckAllEndpoint:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)scheduleNextCheckIfNeeded;
- (void)setDisabled:(BOOL)a3;
- (void)start;
@end

@implementation PDSharingChannelMonitor

- (PDSharingChannelMonitor)init
{
  return 0LL;
}

- (PDSharingChannelMonitor)initWithQueue:(id)a3 webServiceCoordinator:(id)a4 databaseManager:(id)a5 pushNotificationManager:(id)a6 delegate:(id)a7
{
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PDSharingChannelMonitor;
  v17 = -[PDSharingChannelMonitor init](&v24, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    id v19 = PDDefaultQueue();
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    replyQueue = v18->_replyQueue;
    v18->_replyQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v18->_webServiceCoordinator, a4);
    objc_storeStrong((id *)&v18->_databaseManager, a5);
    objc_storeStrong((id *)&v18->_pushNotificationManager, a6);
    objc_storeWeak((id *)&v18->_delegate, v16);
    -[PDPushNotificationManager registerConsumer:](v18->_pushNotificationManager, "registerConsumer:", v18);
    PDScheduledActivityClientRegister(@"PDSharingManager", v18, v18->_queue);
  }

  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDSharingChannelMonitor;
  -[PDSharingChannelMonitor dealloc](&v3, "dealloc");
}

- (void)start
{
}

- (void)scheduleNextCheckIfNeeded
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10038B478;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)checkForNewSharingMessagesWithShouldCheckAllEndpoint:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10038B6AC;
  block[3] = &unk_100644C20;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (id)_checkEndpointsToBePolledOrDetermineNextPollDate:(id *)a3
{
  if (self->_disabled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDSharingManager: Ignoring check endpoints because disabled",  buf,  2u);
    }

    id v5 = 0LL;
    goto LABEL_29;
  }

  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager sharingEndpointsOfType:](self->_databaseManager, "sharingEndpointsOfType:", 1LL));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (!v8)
  {
    id v10 = 0LL;
    goto LABEL_24;
  }

  id v9 = v8;
  id v10 = 0LL;
  uint64_t v11 = *(void *)v25;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
      if (-[PDSharingChannelMonitor _canEndpointBePolledOrCleanUpEndpoint:]( self,  "_canEndpointBePolledOrCleanUpEndpoint:",  v13))
      {
        unsigned int v14 = [v13 doesRemoteMailboxSupportPushNotifications];
        id v15 = [v13 pollingBackoffCounter];
        if (v14) {
          uint64_t v16 = PDSharingChannelEndpointPollingBackoffDuration();
        }
        else {
          uint64_t v16 = PDAggressiveSharingChannelEndpointPollingBackoffDuration((unint64_t)v15);
        }
        uint64_t v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v13 updatedAt]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 dateByAddingTimeInterval:(double)v17]);

        if ([v19 compare:v4] == (id)-1)
        {
          -[NSMutableArray addObject:](v23, "addObject:", v13);
          if (!v10) {
            goto LABEL_18;
          }
LABEL_16:
          uint64_t v20 = objc_claimAutoreleasedReturnValue([v10 earlierDate:v19]);

          id v10 = (id)v20;
        }

        else
        {
          if (v10) {
            goto LABEL_16;
          }
LABEL_18:
          id v10 = v19;
        }

        continue;
      }
    }

    id v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  }

  while (v9);
LABEL_24:
  if (-[NSMutableArray count](v23, "count"))
  {
    id v5 = -[NSMutableArray copy](v23, "copy");
  }

  else
  {
    id v5 = 0LL;
    if (a3) {
      *a3 = v10;
    }
  }

LABEL_29:
  return v5;
}

- (void)_processOutstandingEndpointsAndMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager sharingEndpointsWithOutstandingMessages]( self->_databaseManager,  "sharingEndpointsWithOutstandingMessages"));
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v10);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_10038BF18;
        v19[3] = &unk_10063CB08;
        v19[4] = self;
        v19[5] = v11;
        [v5 addOperation:v19];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10038C32C;
  v18[3] = &unk_1006396D8;
  v18[4] = self;
  [v5 addOperation:v18];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10038C624;
  v17[3] = &unk_1006396D8;
  v17[4] = self;
  [v5 addOperation:v17];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10038C704;
  v15[3] = &unk_100650BA0;
  v15[4] = self;
  id v16 = v4;
  id v13 = v4;
  id v14 = [v5 evaluateWithInput:v12 completion:v15];
}

- (id)pushNotificationTopics
{
  v2 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v3 = PKSharingRelayServerPushTopics();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[NSSet initWithArray:](v2, "initWithArray:", v4);

  return v5;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  if (PKSharingDisableStatefulPushNotifications())
  {
    uint64_t Object = PKLogFacilityTypeGetObject(33LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v8 = "PDSharingManager: Ignoring push notification because of debug override";
      uint64_t v9 = (uint8_t *)&v15;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if (self->_disabled)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(33LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v8 = "PDSharingManager: Ignoring push notification because of disabled";
      uint64_t v9 = (uint8_t *)&v14;
      goto LABEL_7;
    }

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
}

- (BOOL)_canEndpointBePolledOrCleanUpEndpoint:(id)a3
{
  id v4 = a3;
  if ([v4 channelType] == (id)1)
  {
    id v5 = v4;
    id v6 = [v5 timeToLive];
    if (v6) {
      unint64_t v7 = (unint64_t)v6;
    }
    else {
      unint64_t v7 = 604800LL;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 createdAt]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:(double)v7]);
    [v9 timeIntervalSinceNow];
    double v11 = v10;

    id v12 = [v5 provisioningType];
    if ((unint64_t)[v5 pollingBackoffCounter] < 5)
    {
      char v15 = 0;
    }

    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v14 = [WeakRetained canHandleOutstandingMessagesOnEndpoint:v5];

      char v15 = v14 ^ 1;
    }

    if (v11 <= 0.0
      || (v15 & 1) != 0
      || (PDSharingRelayServerEndpointStatusIsActive((unint64_t)[v5 mailboxStatus]) & 1) == 0)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      [v18 endpointWasRemotelyTerminated:v5];

      char v17 = 0;
    }

    else
    {
      char v17 = 1;
    }

    if (v12 == (id)2) {
      BOOL v16 = v17;
    }
    else {
      BOOL v16 = 0;
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_updateEndpointHasOutstandingMessages:(id)a3 hasOutstandingMessages:(BOOL)a4 didCheckForNewMessages:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v11 = a3;
  BOOL v8 = [v11 channelType] == (id)1;
  uint64_t v9 = v11;
  if (v8)
  {
    id v10 = v11;
    [v10 setHasOutstandingMessages:v6];
    if (v5) {
      objc_msgSend(v10, "setPollingBackoffCounter:", (char *)objc_msgSend(v10, "pollingBackoffCounter") + 1);
    }
    -[PDDatabaseManager insertSharingEndpoint:](self->_databaseManager, "insertSharingEndpoint:", v10);

    uint64_t v9 = v11;
  }
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
}

@end