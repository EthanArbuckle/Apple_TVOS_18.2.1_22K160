@interface ADExternalNotificationRequestQueue
- (ADAnnounceNotificationRequest)currentRequest;
- (ADExternalNotificationRequestQueue)init;
- (BOOL)_isAnnounceNotificationRequest:(id)a3 equalToRequest:(id)a4;
- (BOOL)removeAnnouncementRequest:(id)a3;
- (id)_identifierForNotificationRequest:(id)a3;
- (id)_lastRequestIdentifierInQueue;
- (id)_nextRequestIdentifier;
- (id)nextAnnouncementRequest;
- (id)notificationRequestForNotificationIdentifierInAnnouncementQueue:(id)a3;
- (int64_t)_lastRequestAnnouncementTypeInQueue;
- (unint64_t)_numberOfNotificationRequests;
- (unint64_t)_numberOfThreads;
- (void)clearRequestQueue;
- (void)completeCurrentRequestWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5;
- (void)deliverSummary:(id)a3 forNotificationWithIdentifier:(id)a4 completion:(id)a5;
- (void)enqueueAnnouncementRequest:(id)a3;
- (void)fetchUnreadNotificationsFromThreadAfterNotificationWithID:(id)a3 completion:(id)a4;
- (void)markNotificationAsReadWithIdentifer:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelgate:(id)a3;
@end

@implementation ADExternalNotificationRequestQueue

- (id)_identifierForNotificationRequest:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 notification]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);

  if ([v3 announcementType] == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 content]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 threadIdentifier]);
  }

  else
  {
    if ([v3 announcementType] != (id)8 && objc_msgSend(v3, "announcementType") != (id)9)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      goto LABEL_7;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 announcementIdentifier]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  }

  v8 = (void *)v7;

LABEL_7:
  return v8;
}

- (ADExternalNotificationRequestQueue)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADExternalNotificationRequestQueue;
  v2 = -[ADExternalNotificationRequestQueue init](&v13, "init");
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___AFQueue);
    queuedNotificationRequestIdentifiers = v2->_queuedNotificationRequestIdentifiers;
    v2->_queuedNotificationRequestIdentifiers = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queuedRequestMap = v2->_queuedRequestMap;
    v2->_queuedRequestMap = v5;

    delegate = v2->_delegate;
    v2->_delegate = 0LL;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("ADExternalRequestHandlerQueueTimers", v9);

    timersQueue = v2->_timersQueue;
    v2->_timersQueue = (OS_dispatch_queue *)v10;
  }

  return v2;
}

- (void)setDelgate:(id)a3
{
}

- (id)_lastRequestIdentifierInQueue
{
  return -[AFQueue objectAtIndex:]( self->_queuedNotificationRequestIdentifiers,  "objectAtIndex:",  (char *)-[AFQueue count](self->_queuedNotificationRequestIdentifiers, "count") - 1);
}

- (int64_t)_lastRequestAnnouncementTypeInQueue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[ADExternalNotificationRequestQueue _lastRequestIdentifierInQueue]( self,  "_lastRequestIdentifierInQueue"));
  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v3)),
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]),
        v4,
        v5))
  {
    id v6 = [v5 announcementType];
  }

  else
  {
    id v6 = 0LL;
  }

  return (int64_t)v6;
}

- (void)enqueueAnnouncementRequest:(id)a3
{
  v5 = (AFSafetyBlock *)a3;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1001465BC;
  v50[3] = &unk_1004F2DB0;
  v50[4] = self;
  id v6 = objc_retainBlock(v50);
  uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
    __int16 v53 = 2112;
    v54 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s enqueueing request: %@", buf, 0x16u);
  }

  dispatch_queue_attr_t v8 = (AFSafetyBlock *)objc_claimAutoreleasedReturnValue( -[ADExternalNotificationRequestQueue _identifierForNotificationRequest:]( self,  "_identifierForNotificationRequest:",  v5));
  if (self->_currentRequest)
  {
    int64_t v9 = -[ADAnnounceNotificationRequest announcementType](self->_currentRequest, "announcementType");
    id v10 = -[AFSafetyBlock announcementType](v5, "announcementType");
    int64_t v11 = -[ADExternalNotificationRequestQueue _lastRequestAnnouncementTypeInQueue]( self,  "_lastRequestAnnouncementTypeInQueue");
    v12 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      log = v12;
      uint64_t Name = AFSiriUserNotificationAnnouncementTypeGetName(v9);
      v41 = (AFSafetyBlock *)objc_claimAutoreleasedReturnValue(Name);
      uint64_t v37 = AFSiriUserNotificationAnnouncementTypeGetName(v11);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v37);
      uint64_t v38 = AFSiriUserNotificationAnnouncementTypeGetName(v10);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      *(_DWORD *)buf = 136315906;
      v52 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
      __int16 v53 = 2112;
      v54 = v41;
      __int16 v55 = 2112;
      v56 = v40;
      __int16 v57 = 2112;
      v58 = v39;
      _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s current request type: %@, tail request type: %@, incoming announcement Type: %@",  buf,  0x2Au);
    }

    if (v10 == (id)1)
    {
      objc_super v13 = (AFSafetyBlock *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v8));
      v14 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v15 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
      if (v13)
      {
        if (v15)
        {
          *(_DWORD *)buf = 136315394;
          v52 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
          __int16 v53 = 2112;
          v54 = v8;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s found a thread id match for message announcement, adding it to: %@",  buf,  0x16u);
        }

        -[AFSafetyBlock addObject:](v13, "addObject:", v5, v39);
        v16 = (void *)objc_claimAutoreleasedReturnValue( -[ADExternalNotificationRequestQueue _identifierForNotificationRequest:]( self,  "_identifierForNotificationRequest:",  v5));
        unsigned int v17 = -[AFSafetyBlock isEqualToString:](v8, "isEqualToString:", v16);

        if (v17 && -[AFSafetyBlock supportsImmediateBurstMode](v5, "supportsImmediateBurstMode"))
        {
          v18 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v52 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s resetting burst timer for queue",  buf,  0xCu);
          }

          -[AFWatchdogTimer reset](self->_resettingBurstTimer, "reset");
        }
      }

      else
      {
        if (v15)
        {
          *(_DWORD *)buf = 136315394;
          v52 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
          __int16 v53 = 2112;
          v54 = v8;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s No thread id match for message announcement, enqueue request: %@",  buf,  0x16u);
        }

        ((void (*)(void *, AFSafetyBlock *, AFSafetyBlock *))v6[2])(v6, v5, v8);
      }

      goto LABEL_33;
    }

    if (v10 == (id)v9)
    {
      objc_super v13 = (AFSafetyBlock *)objc_claimAutoreleasedReturnValue( -[ADExternalNotificationRequestQueue _identifierForNotificationRequest:]( self,  "_identifierForNotificationRequest:",  self->_currentRequest));
      v30 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
        __int16 v53 = 2112;
        v54 = v13;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "%s same type as current request, adding it to the current request's queue %@",  buf,  0x16u);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v13, v39));
      [v31 addObject:v5];
      if (-[AFSafetyBlock supportsImmediateBurstMode](v5, "supportsImmediateBurstMode"))
      {
        v32 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v52 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "%s resetting burst timer for queue",  buf,  0xCu);
        }

        -[AFWatchdogTimer reset](self->_resettingBurstTimer, "reset");
      }

      goto LABEL_33;
    }

    v33 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v34 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v10 == (id)v11)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136315138;
        v52 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%s same type as tail request, adding it to the tail request's queue",  buf,  0xCu);
      }

      objc_super v13 = (AFSafetyBlock *)objc_claimAutoreleasedReturnValue( -[ADExternalNotificationRequestQueue _lastRequestIdentifierInQueue]( self,  "_lastRequestIdentifierInQueue",  v39));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v13));
      [v35 addObject:v5];

      goto LABEL_33;
    }

    if (v34)
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[ADExternalNotificationRequestQueue enqueueAnnouncementRequest:]";
      __int16 v53 = 2112;
      v54 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%s No head or tail match of request type, enqueueing request: %@",  buf,  0x16u);
    }

    ((void (*)(void *, AFSafetyBlock *, AFSafetyBlock *))v6[2])(v6, v5, v8);
  }

  else
  {
    objc_storeStrong((id *)&self->_currentRequest, a3);
    ((void (*)(void *, AFSafetyBlock *, AFSafetyBlock *))v6[2])(v6, v5, v8);
    if (-[AFSafetyBlock supportsImmediateBurstMode](v5, "supportsImmediateBurstMode"))
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_1001466EC;
      v49[3] = &unk_1004FB890;
      v49[4] = self;
      v19 = -[AFSafetyBlock initWithBlock:](objc_alloc(&OBJC_CLASS___AFSafetyBlock), "initWithBlock:", v49);
      v20 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
      timersQueue = self->_timersQueue;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472LL;
      v46[2] = sub_1001467DC;
      v46[3] = &unk_1004FD968;
      v22 = v5;
      v47 = v22;
      v23 = v19;
      v48 = v23;
      v24 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v20,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  timersQueue,  v46,  10.0);
      maxTimeEnqueueableTimer = self->_maxTimeEnqueueableTimer;
      self->_maxTimeEnqueueableTimer = v24;

      v26 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
      v27 = self->_timersQueue;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_1001468A0;
      v43[3] = &unk_1004FD968;
      v44 = v22;
      v45 = v23;
      objc_super v13 = v23;
      v28 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v26,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  v27,  v43,  3.0);
      resettingBurstTimer = self->_resettingBurstTimer;
      self->_resettingBurstTimer = v28;

      -[AFWatchdogTimer start](self->_maxTimeEnqueueableTimer, "start");
      -[AFWatchdogTimer start](self->_resettingBurstTimer, "start");

LABEL_33:
      goto LABEL_34;
    }

    -[ADExternalNotificationRequestQueueObserver announcementRequestReadyToBeAnnounced:]( self->_delegate,  "announcementRequestReadyToBeAnnounced:",  self->_currentRequest);
  }

- (void)deliverSummary:(id)a3 forNotificationWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  int64_t v9 = (ADAnnounceNotificationRequest *)a4;
  id v10 = (void (**)(id, uint64_t))a5;
  if (v10)
  {
    int64_t v11 = (ADAnnounceNotificationRequest *)objc_claimAutoreleasedReturnValue( -[ADExternalNotificationRequestQueue notificationRequestForNotificationIdentifierInAnnouncementQueue:]( self,  "notificationRequestForNotificationIdentifierInAnnouncementQueue:",  v9));
    v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (v11)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[ADExternalNotificationRequestQueue deliverSummary:forNotificationWithIdentifier:completion:]";
        __int16 v30 = 2112;
        v31 = v11;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Found request, setting summary on %@",  buf,  0x16u);
      }

      -[ADAnnounceNotificationRequest setSummary:](v11, "setSummary:", v8);
      if (self->_currentRequest == v11)
      {
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        v22 = (void *)objc_claimAutoreleasedReturnValue( -[ADExternalNotificationRequestQueue _identifierForNotificationRequest:]( self,  "_identifierForNotificationRequest:",  v11));
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:"));
        id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v24;
          while (2)
          {
            for (i = 0LL; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
              if ([v18 summaryDecision] == (id)2)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue([v18 summary]);

                if (!v19)
                {
                  v21 = (os_log_s *)AFSiriLogContextDaemon;
                  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315138;
                    v29 = "-[ADExternalNotificationRequestQueue deliverSummary:forNotificationWithIdentifier:completion:]";
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s There is still a notification pending a summary in this thread, don't announce yet.",  buf,  0xCu);
                  }

                  v10[2](v10, 1LL);

                  goto LABEL_10;
                }
              }
            }

            id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        v20 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[ADExternalNotificationRequestQueue deliverSummary:forNotificationWithIdentifier:completion:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s Summary has been set for last notification pending a summary in thread, announcing it",  buf,  0xCu);
        }

        -[AFWatchdogTimer cancel](self->_resettingBurstTimer, "cancel");
        -[AFWatchdogTimer cancel](self->_maxTimeEnqueueableTimer, "cancel");
        -[ADExternalNotificationRequestQueueObserver announcementRequestReadyToBeAnnounced:]( self->_delegate,  "announcementRequestReadyToBeAnnounced:",  self->_currentRequest);
      }

      v10[2](v10, 1LL);
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[ADExternalNotificationRequestQueue deliverSummary:forNotificationWithIdentifier:completion:]";
        __int16 v30 = 2112;
        v31 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Unable to find request with notificationIdentifier: %@",  buf,  0x16u);
      }

      v10[2](v10, 0LL);
    }

- (id)nextAnnouncementRequest
{
  if (self->_currentRequest)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFQueue frontObject](self->_queuedNotificationRequestIdentifiers, "frontObject"));
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v3, 0LL));
    id v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 completion]);

          if (v11) {
            -[NSMutableArray addObject:](v4, "addObject:", v10);
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }

      while (v7);
    }

    if (-[NSMutableArray count](v4, "count"))
    {
      v12 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v29 = v12;
        __int16 v30 = (ADAnnounceNotificationRequest *)-[NSMutableArray count](v4, "count");
        *(_DWORD *)buf = 136315394;
        v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
        __int16 v37 = 2048;
        uint64_t v38 = v30;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s %lu unread notifications, starting request at first unread notification",  buf,  0x16u);
      }

      -[NSMutableDictionary setObject:forKey:](self->_queuedRequestMap, "setObject:forKey:", v4, v3);
      goto LABEL_23;
    }

    id v15 = (ADAnnounceNotificationRequest *)objc_claimAutoreleasedReturnValue( -[AFQueue dequeueObject]( self->_queuedNotificationRequestIdentifiers,  "dequeueObject"));
    if (v15)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_queuedRequestMap, "removeObjectForKey:", v15);
      uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
        __int16 v37 = 2112;
        uint64_t v38 = v15;
        unsigned int v17 = "%s removing %@ and associated requests from the request queue";
        v18 = v16;
        uint32_t v19 = 22;
LABEL_32:
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
      }
    }

    else
    {
      v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
        unsigned int v17 = "%s old request queue is empty";
        v18 = v20;
        uint32_t v19 = 12;
        goto LABEL_32;
      }
    }

LABEL_23:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADExternalNotificationRequestQueue _nextRequestIdentifier](self, "_nextRequestIdentifier"));
    if (v21)
    {
      v22 = (ADAnnounceNotificationRequest *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_queuedRequestMap,  "objectForKey:",  v21));
      __int128 v23 = (ADAnnounceNotificationRequest *)objc_claimAutoreleasedReturnValue(-[ADAnnounceNotificationRequest firstObject](v22, "firstObject"));
      currentRequest = self->_currentRequest;
      self->_currentRequest = v23;
    }

    else
    {
      __int128 v25 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s request queue is empty, returning nil",  buf,  0xCu);
      }

      v22 = self->_currentRequest;
      self->_currentRequest = 0LL;
    }

    __int128 v26 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v28 = self->_currentRequest;
      *(_DWORD *)buf = 136315394;
      v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
      __int16 v37 = 2112;
      uint64_t v38 = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s next request is %@", buf, 0x16u);
    }

    v27 = self->_currentRequest;

    return v27;
  }

  objc_super v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[ADExternalNotificationRequestQueue nextAnnouncementRequest]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s no current request, returning nil for next request",  buf,  0xCu);
  }

  return 0LL;
}

- (id)_nextRequestIdentifier
{
  return -[AFQueue frontObject](self->_queuedNotificationRequestIdentifiers, "frontObject");
}

- (void)completeCurrentRequestWithSuccess:(BOOL)a3 forReason:(int64_t)a4 shouldEmitInstrumentationEvent:(BOOL)a5
{
  if (self->_currentRequest)
  {
    BOOL v5 = a5;
    BOOL v7 = a3;
    -[AFWatchdogTimer cancel](self->_maxTimeEnqueueableTimer, "cancel");
    -[AFWatchdogTimer cancel](self->_resettingBurstTimer, "cancel");
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADExternalNotificationRequestQueue _identifierForNotificationRequest:]( self,  "_identifierForNotificationRequest:",  self->_currentRequest));
    id v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v17 = v10;
      else {
        v18 = *(&off_1004F3B50 + a4);
      }
      uint32_t v19 = v18;
      *(_DWORD *)buf = 136315906;
      __int128 v26 = "-[ADExternalNotificationRequestQueue completeCurrentRequestWithSuccess:forReason:shouldEmitInstrumentationEvent:]";
      __int16 v27 = 2112;
      v28 = v9;
      __int16 v29 = 1024;
      BOOL v30 = v7;
      __int16 v31 = 2112;
      __int128 v32 = v19;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s completing request with id: %@ with success: %d for reason: %@",  buf,  0x26u);
    }

    -[ADAnnouncementRequest completeRequestWithSuccess:forReason:shouldEmitInstrumentationEvent:]( self->_currentRequest,  "completeRequestWithSuccess:forReason:shouldEmitInstrumentationEvent:",  v7,  a4,  v5);
    if (!v7)
    {
      int64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        __int128 v26 = "-[ADExternalNotificationRequestQueue completeCurrentRequestWithSuccess:forReason:shouldEmitInstrumentationEvent:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s request failed, mark all requests in thread with failure",  buf,  0xCu);
      }

      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v9, 0LL));
      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          uint64_t v16 = 0LL;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * (void)v16) completeRequestWithSuccess:0 forReason:a4 shouldEmitInstrumentationEvent:v5];
            uint64_t v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v14);
      }
    }
  }

- (void)clearRequestQueue
{
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0LL;

  v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint32_t v19 = "-[ADExternalNotificationRequestQueue clearRequestQueue]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s clearing request queue", buf, 0xCu);
  }

  -[AFWatchdogTimer cancel](self->_maxTimeEnqueueableTimer, "cancel");
  -[AFWatchdogTimer cancel](self->_resettingBurstTimer, "cancel");
  maxTimeEnqueueableTimer = self->_maxTimeEnqueueableTimer;
  self->_maxTimeEnqueueableTimer = 0LL;

  resettingBurstTimer = self->_resettingBurstTimer;
  self->_resettingBurstTimer = 0LL;

  while (-[AFQueue count](self->_queuedNotificationRequestIdentifiers, "count"))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFQueue dequeueObject](self->_queuedNotificationRequestIdentifiers, "dequeueObject"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v7, 0LL));
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) completeRequestWithSuccess:0 forReason:9 shouldEmitInstrumentationEvent:0];
          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v10);
    }
  }

  -[NSMutableDictionary removeAllObjects](self->_queuedRequestMap, "removeAllObjects");
}

- (BOOL)_isAnnounceNotificationRequest:(id)a3 equalToRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 notification]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 request]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 notification]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 request]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  unsigned int v13 = [v9 isEqualToString:v12];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 appID]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 appID]);
  unsigned __int8 v16 = [v14 isEqualToString:v15];

  id v17 = [v6 platform];
  id v18 = [v5 platform];

  if (!v13) {
    return 0;
  }
  if (v17 == v18) {
    return v16;
  }
  return 0;
}

- (id)notificationRequestForNotificationIdentifierInAnnouncementQueue:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  __int128 v15 = sub_1001463D0;
  unsigned __int8 v16 = sub_1001463E0;
  id v17 = 0LL;
  queuedRequestMap = self->_queuedRequestMap;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001463E8;
  v9[3] = &unk_1004F2DD8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queuedRequestMap, "enumerateKeysAndObjectsUsingBlock:", v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)removeAnnouncementRequest:(id)a3
{
  id v4 = (ADAnnounceNotificationRequest *)a3;
  id v5 = v4;
  if (!v4)
  {
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_14;
  }

  if (self->_currentRequest == v4)
  {
    uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADExternalNotificationRequestQueue removeAnnouncementRequest:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Current request is equal to request we are trying to remove. Ignoring as this is not supported.",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_10;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnouncementRequest completion](v4, "completion"));

  if (!v6)
  {
    unsigned int v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADExternalNotificationRequestQueue removeAnnouncementRequest:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Request to be removed has no completion, meaning we've already completed this request. Ignoring as this is not supported.",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_10;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADExternalNotificationRequestQueue _identifierForNotificationRequest:]( self,  "_identifierForNotificationRequest:",  v5));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v7));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001462C4;
  v16[3] = &unk_1004F2E00;
  v16[4] = self;
  id v9 = v5;
  id v17 = v9;
  p___int128 buf = &buf;
  [v8 enumerateObjectsUsingBlock:v16];
  uint64_t v10 = *(void *)(*((void *)&buf + 1) + 24LL);
  BOOL v11 = v10 != 0x7FFFFFFFFFFFFFFFLL;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint32_t v19 = 136315394;
      __int128 v20 = "-[ADExternalNotificationRequestQueue removeAnnouncementRequest:]";
      __int16 v21 = 2112;
      __int128 v22 = v9;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s Couldn't find request to remove: %@",  v19,  0x16u);
    }
  }

  else
  {
    objc_msgSend(v8, "removeObjectAtIndex:");
    -[ADAnnouncementRequest completeRequestWithSuccess:forReason:shouldEmitInstrumentationEvent:]( v9,  "completeRequestWithSuccess:forReason:shouldEmitInstrumentationEvent:",  0LL,  6LL,  1LL);
    -[NSMutableDictionary setObject:forKey:](self->_queuedRequestMap, "setObject:forKey:", v8, v7);
  }

  _Block_object_dispose(&buf, 8);
LABEL_14:

  return v11;
}

- (void)fetchUnreadNotificationsFromThreadAfterNotificationWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, NSMutableArray *))a4;
  v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AFQueue frontObject](self->_queuedNotificationRequestIdentifiers, "frontObject"));
  id v9 = (void *)v8;
  if (v8)
  {
    __int128 v33 = (void *)v8;
    __int128 v34 = v7;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v8));
    id v11 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v11)
    {
      id v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v38;
      do
      {
        __int128 v15 = 0LL;
        id v36 = v12;
        do
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v10);
          }
          unsigned __int8 v16 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v15);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 notification]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 request]);

          uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
          unsigned int v20 = [v19 isEqualToString:v6];

          if (v20)
          {
            __int16 v21 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int128 buf = 136315394;
              v42 = "-[ADExternalNotificationRequestQueue fetchUnreadNotificationsFromThreadAfterNotificationWithID:completion:]";
              __int16 v43 = 2112;
              id v44 = v6;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s found request with identifier: %@ in request queue",  buf,  0x16u);
            }

            char v13 = 1;
          }

          else if ((v13 & 1) != 0)
          {
            char v13 = 1;
            [v16 completeRequestWithSuccess:1 forReason:1 shouldEmitInstrumentationEvent:1];
            __int128 v22 = objc_alloc_init(&OBJC_CLASS___AFBulletin);
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v16 notification]);
            uint64_t v24 = v14;
            id v25 = v6;
            __int128 v26 = v10;
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v16 appID]);
            -[AFBulletin setNotification:fromSourceApp:](v22, "setNotification:fromSourceApp:", v23, v27);

            -[AFBulletin setAnnouncementType:](v22, "setAnnouncementType:", [v16 announcementType]);
            v28 = (void *)objc_claimAutoreleasedReturnValue([v16 summary]);
            __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 summary]);
            -[AFBulletin setSummary:](v22, "setSummary:", v29);

            BOOL v30 = (void *)objc_claimAutoreleasedReturnValue([v16 notification]);
            __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 request]);
            -[AFBulletin setNotificationRequest:](v22, "setNotificationRequest:", v31);

            uint64_t v10 = v26;
            id v6 = v25;
            uint64_t v14 = v24;
            id v12 = v36;

            -[NSMutableArray addObject:](v35, "addObject:", v22);
          }

          else
          {
            char v13 = 0;
          }

          __int128 v15 = (char *)v15 + 1;
        }

        while (v12 != v15);
        id v12 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }

      while (v12);
    }

    id v9 = v33;
    id v7 = v34;
  }

  else
  {
    __int128 v32 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v42 = "-[ADExternalNotificationRequestQueue fetchUnreadNotificationsFromThreadAfterNotificationWithID:completion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "%s No notification thread found in queue",  buf,  0xCu);
    }
  }

  v7[2](v7, v35);
}

- (void)markNotificationAsReadWithIdentifer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFQueue frontObject](self->_queuedNotificationRequestIdentifiers, "frontObject"));
  if (v5)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint32_t v19 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queuedRequestMap, "objectForKey:", v5));
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 notification]);
          char v13 = (void *)objc_claimAutoreleasedReturnValue([v12 request]);

          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
          unsigned int v15 = [v14 isEqualToString:v4];

          if (v15)
          {
            unsigned __int8 v16 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int128 buf = 136315394;
              id v25 = "-[ADExternalNotificationRequestQueue markNotificationAsReadWithIdentifer:]";
              __int16 v26 = 2112;
              id v27 = v4;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s found request with identifier: %@ in request queue",  buf,  0x16u);
            }

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 completion]);

            if (v17) {
              [v11 completeRequestWithSuccess:1 forReason:1 shouldEmitInstrumentationEvent:1];
            }
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }

      while (v8);
    }

    id v5 = v19;
  }

  else
  {
    id v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v25 = "-[ADExternalNotificationRequestQueue markNotificationAsReadWithIdentifer:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s No active announcement request",  buf,  0xCu);
    }
  }
}

- (unint64_t)_numberOfThreads
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_queuedRequestMap, "allKeys"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)_numberOfNotificationRequests
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_queuedRequestMap, "objectEnumerator", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * (void)i) count];
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (ADAnnounceNotificationRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end