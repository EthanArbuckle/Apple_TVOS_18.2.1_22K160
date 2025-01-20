@interface ADUserNotificationAnnouncementSpeakingStatePublisher
+ (BOOL)supportsPublishingArrivalForAceObject:(id)a3;
+ (id)_notificationIdentifiersForObject:(id)a3;
+ (id)sharedPublisher;
- (BOOL)_publishStateChanged:(int64_t)a3 forIdentifiers:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_initWithQueue:(id)a3;
- (id)connectionProxy;
- (void)_invalidateConnection;
- (void)_publishCancelAndRemoveAllObjectsForReason:(id)a3;
- (void)_publishFinishedAndRemoveAllObjectsForReason:(id)a3;
- (void)_publishObjectHasArrived:(id)a3;
- (void)beginObserving;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)publishObjectHasArrived:(id)a3;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
@end

@implementation ADUserNotificationAnnouncementSpeakingStatePublisher

- (id)_initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADUserNotificationAnnouncementSpeakingStatePublisher;
  v6 = -[ADUserNotificationAnnouncementSpeakingStatePublisher init](&v13, "init");
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
    [v8 addListener:p_isa];

    v9 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v10 = -[NSXPCListener initWithMachServiceName:]( v9,  "initWithMachServiceName:",  kAssistantAnnouncementSpeakingStateServiceName);
    id v11 = p_isa[4];
    p_isa[4] = v10;

    [p_isa[4] setDelegate:p_isa];
    [p_isa[4] resume];
  }

  return p_isa;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADUserNotificationAnnouncementSpeakingStatePublisher;
  -[ADUserNotificationAnnouncementSpeakingStatePublisher dealloc](&v3, "dealloc");
}

- (void)publishObjectHasArrived:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007BD70;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007BD60;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007BD50;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestWasCancelledWithInfo:(id)a4 forReason:(int64_t)a5 origin:(int64_t)a6 client:(id)a7 successorInfo:(id)a8
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007BD40;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  char HasEntitlement = AFConnectionHasEntitlement();
  if ((HasEntitlement & 1) != 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10007BAAC;
    v10[3] = &unk_1004FD968;
    v10[4] = self;
    id v11 = v5;
    dispatch_async(queue, v10);
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v13 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher listener:shouldAcceptNewConnection:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s %@ Announcement Speaking State connection does not have required entitlements.",  buf,  0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_publishObjectHasArrived:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _notificationIdentifiersForObject:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v6 count])
  {
    if (!-[NSArray isEqualToArray:](self->_currentlyAnnouncingNotificationIdentifiers, "isEqualToArray:", v6)
      && -[NSArray count](self->_currentlyAnnouncingNotificationIdentifiers, "count"))
    {
      -[ADUserNotificationAnnouncementSpeakingStatePublisher _publishFinishedAndRemoveAllObjectsForReason:]( self,  "_publishFinishedAndRemoveAllObjectsForReason:",  @"New object arrived and we are currently announcing.");
LABEL_8:
      id v8 = (NSArray *)[v6 copy];
      currentlyAnnouncingNotificationIdentifiers = self->_currentlyAnnouncingNotificationIdentifiers;
      self->_currentlyAnnouncingNotificationIdentifiers = v8;

      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v10 = v6;
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          __int16 v14 = 0LL;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler]( &OBJC_CLASS___ADExternalNotificationRequestHandler,  "sharedNotificationRequestHandler",  (void)v20));
            [v16 markNotificationAsReadWithIdentifer:v15];

            __int16 v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v12);
      }

      -[ADUserNotificationAnnouncementSpeakingStatePublisher _publishStateChanged:forIdentifiers:]( self,  "_publishStateChanged:forIdentifiers:",  1LL,  v10);
      goto LABEL_18;
    }

    if (!-[NSArray isEqualToArray:](self->_currentlyAnnouncingNotificationIdentifiers, "isEqualToArray:", v6)) {
      goto LABEL_8;
    }
    v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishObjectHasArrived:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Received identifiers that we're already announcing. This is most likely a hint. Ignoring publishing.",  buf,  0xCu);
    }
  }

  else
  {
    v17 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
      *(_DWORD *)buf = 136315394;
      v26 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishObjectHasArrived:]";
      __int16 v27 = 2112;
      v28 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Not publishing arrival, no identifiers exist for %@. Ignoring.",  buf,  0x16u);
    }
  }

- (BOOL)_publishStateChanged:(int64_t)a3 forIdentifiers:(id)a4
{
  id v6 = a4;
  if (![v6 count])
  {
    __int16 v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      BOOL v13 = 0;
      goto LABEL_10;
    }

    int v19 = 136315138;
    __int128 v20 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishStateChanged:forIdentifiers:]";
    uint64_t v15 = "%s Cannot publish notification, no identifiers exist.";
    v16 = v14;
    uint32_t v17 = 12;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, v17);
    goto LABEL_9;
  }

  char IsValidAndSpecified = AFSiriUserNotificationAnnouncementSpeakingStateGetIsValidAndSpecified(a3);
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if ((IsValidAndSpecified & 1) == 0)
  {
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v19 = 136315394;
    __int128 v20 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishStateChanged:forIdentifiers:]";
    __int16 v21 = 2048;
    int64_t v22 = a3;
    uint64_t v15 = "%s Cannot publish notification, invalid state %li";
    v16 = v8;
    uint32_t v17 = 22;
    goto LABEL_12;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    uint64_t Name = AFSiriUserNotificationAnnouncementSpeakingStateGetName(a3);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v19 = 136315650;
    __int128 v20 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishStateChanged:forIdentifiers:]";
    __int16 v21 = 2112;
    int64_t v22 = (int64_t)v11;
    __int16 v23 = 2112;
    id v24 = v6;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADUserNotificationAnnouncementSpeakingStatePublisher connectionProxy](self, "connectionProxy"));
  [v12 speakingStateDidChange:a3 forIdentifiers:v6];

  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (void)_publishCancelAndRemoveAllObjectsForReason:(id)a3
{
  id v4 = a3;
  if (-[NSArray count](self->_currentlyAnnouncingNotificationIdentifiers, "count"))
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      id v8 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishCancelAndRemoveAllObjectsForReason:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Request cancelled for reason %@. Sending cancelled speaking state.",  (uint8_t *)&v7,  0x16u);
    }

    -[ADUserNotificationAnnouncementSpeakingStatePublisher _publishStateChanged:forIdentifiers:]( self,  "_publishStateChanged:forIdentifiers:",  3LL,  self->_currentlyAnnouncingNotificationIdentifiers);
    currentlyAnnouncingNotificationIdentifiers = self->_currentlyAnnouncingNotificationIdentifiers;
    self->_currentlyAnnouncingNotificationIdentifiers = 0LL;
  }
}

- (void)_publishFinishedAndRemoveAllObjectsForReason:(id)a3
{
  id v4 = a3;
  if (-[NSArray count](self->_currentlyAnnouncingNotificationIdentifiers, "count"))
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      id v8 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher _publishFinishedAndRemoveAllObjectsForReason:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Request ended for reason %@. Sending finished speaking state.",  (uint8_t *)&v7,  0x16u);
    }

    -[ADUserNotificationAnnouncementSpeakingStatePublisher _publishStateChanged:forIdentifiers:]( self,  "_publishStateChanged:forIdentifiers:",  2LL,  self->_currentlyAnnouncingNotificationIdentifiers);
    currentlyAnnouncingNotificationIdentifiers = self->_currentlyAnnouncingNotificationIdentifiers;
    self->_currentlyAnnouncingNotificationIdentifiers = 0LL;
  }
}

- (void)beginObserving
{
  v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher beginObserving]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Beginning observations.", (uint8_t *)&v3, 0xCu);
  }

- (id)connectionProxy
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  &stru_1004EF278);
}

- (void)connectionInterrupted
{
  int v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher connectionInterrupted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007B9E4;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)connectionInvalidated
{
  int v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[ADUserNotificationAnnouncementSpeakingStatePublisher connectionInvalidated]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007B9DC;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_invalidateConnection
{
  connection = self->_connection;
  self->_connection = 0LL;
}

- (void).cxx_destruct
{
}

+ (id)sharedPublisher
{
  if (qword_100577AA8 != -1) {
    dispatch_once(&qword_100577AA8, &stru_1004EF258);
  }
  return (id)qword_100577AB0;
}

+ (BOOL)supportsPublishingArrivalForAceObject:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
  if ([v5 length])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _notificationIdentifiersForObject:v4]);
    BOOL v7 = [v6 count] != 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)_notificationIdentifiersForObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SAUIAssistantUtteranceView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___SAUISayIt), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 context]);
  }

  else
  {
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___SADialog);
    if ((objc_opt_isKindOfClass(v3, v16) & 1) != 0)
    {
      uint32_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 configuration]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v17 context]);
    }

    else
    {
      id v6 = 0LL;
    }
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SADomainObject);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scheme]);
    uint64_t v10 = AFSiriUserNotificationAnnounceScheme;
    unsigned int v11 = [v9 isEqualToString:AFSiriUserNotificationAnnounceScheme];

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@://", v10));
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v13, "length")));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsSeparatedByString:@"&"]);
    }

    else
    {
      uint64_t v15 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

@end