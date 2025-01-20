@interface IDSServerStorageStateMachine
+ (id)sharedInstance;
- (BOOL)inflightServerStorageStateMachineForTopic:(id)a3;
- (IDSDeliveryController)deliveryController;
- (IDSServerBag)idsServerBag;
- (IDSServerStorageStateMachine)init;
- (IDSServerStorageStateMachine)initWithDeliveryController:(id)a3 userDefaults:(id)a4 idsServerBag:(id)a5;
- (IMUserDefaults)userDefaults;
- (NSMutableDictionary)currentStorageRetriesPerTopic;
- (NSMutableDictionary)deathTimerToTopicMap;
- (id)_persistedTopics;
- (id)currentMetricCollectorForTopic:(id)a3;
- (id)lastReceivedMessageTimeForTopic:(id)a3;
- (id)metricCollectors;
- (void)_incrementMessagesFromStorageForTopic:(id)a3;
- (void)_persistTopic:(id)a3;
- (void)_sendServerStorageMessageForTopic:(id)a3 retryCount:(int)a4;
- (void)_startExtendedTimeoutTimerForTopic:(id)a3;
- (void)_startTimeoutTimerForTopic:(id)a3;
- (void)_stateMachineTimedOut:(id)a3;
- (void)_submitNoLastFromStorageMetricForService:(id)a3;
- (void)_unpersistTopic:(id)a3;
- (void)dealloc;
- (void)incomingStorageRequestForTopic:(id)a3 primary:(BOOL)a4 messageContext:(id)a5;
- (void)recievedLastMessageFromStorageForTopic:(id)a3;
- (void)recievedMessageFromStorageForTopic:(id)a3;
- (void)recievedNoStorageResponseForTopic:(id)a3 messageContext:(id)a4;
- (void)reissuePersistedRequests;
- (void)setCurrentStorageRetriesPerTopic:(id)a3;
- (void)setDeathTimerToTopicMap:(id)a3;
- (void)setDeliveryController:(id)a3;
- (void)setIdsServerBag:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)startCollectingMetricsForServerStorageStateMachineFor:(id)a3 isPrimary:(BOOL)a4;
- (void)stopCollectingMetricsForServerStorageStateMachineFor:(id)a3;
- (void)terminateStateMachineForTopic:(id)a3;
@end

@implementation IDSServerStorageStateMachine

+ (id)sharedInstance
{
  if (qword_1009BEE68 != -1) {
    dispatch_once(&qword_1009BEE68, &stru_1008FDD68);
  }
  return (id)qword_1009BEE70;
}

- (IDSServerStorageStateMachine)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDeliveryController sharedInstance](&OBJC_CLASS___IDSDeliveryController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v6 = -[IDSServerStorageStateMachine initWithDeliveryController:userDefaults:idsServerBag:]( self,  "initWithDeliveryController:userDefaults:idsServerBag:",  v3,  v4,  v5);

  return v6;
}

- (IDSServerStorageStateMachine)initWithDeliveryController:(id)a3 userDefaults:(id)a4 idsServerBag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IDSServerStorageStateMachine;
  v11 = -[IDSServerStorageStateMachine init](&v24, "init");
  v12 = v11;
  if (v11)
  {
    if (!v11->_currentStorageRetriesPerTopic)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      currentStorageRetriesPerTopic = v12->_currentStorageRetriesPerTopic;
      v12->_currentStorageRetriesPerTopic = (NSMutableDictionary *)Mutable;
    }

    if (!v12->_deathTimerToTopicMap)
    {
      CFMutableDictionaryRef v15 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      deathTimerToTopicMap = v12->_deathTimerToTopicMap;
      v12->_deathTimerToTopicMap = (NSMutableDictionary *)v15;
    }

    if (!v12->_lastReceivedMessageTimePerTopic)
    {
      CFMutableDictionaryRef v17 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      lastReceivedMessageTimePerTopic = v12->_lastReceivedMessageTimePerTopic;
      v12->_lastReceivedMessageTimePerTopic = (NSMutableDictionary *)v17;
    }

    if (!v12->_inflightStorageRequests)
    {
      v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      inflightStorageRequests = v12->_inflightStorageRequests;
      v12->_inflightStorageRequests = v19;
    }

    if (!v12->_pendingStorageRequests)
    {
      v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      pendingStorageRequests = v12->_pendingStorageRequests;
      v12->_pendingStorageRequests = v21;
    }

    -[IDSServerStorageStateMachine setDeliveryController:](v12, "setDeliveryController:", v8);
    -[IDSServerStorageStateMachine setUserDefaults:](v12, "setUserDefaults:", v9);
    -[IDSServerStorageStateMachine setIdsServerBag:](v12, "setIdsServerBag:", v10);
  }

  return v12;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deathTimerToTopicMap, "allValues"));
  [v3 makeObjectsPerformSelector:"invalidate"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSServerStorageStateMachine;
  -[IDSServerStorageStateMachine dealloc](&v4, "dealloc");
}

- (void)incomingStorageRequestForTopic:(id)a3 primary:(BOOL)a4 messageContext:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (-[NSMutableSet containsObject:](self->_inflightStorageRequests, "containsObject:", v8))
  {
    uint64_t v10 = OSLogHandleForIDSCategory("ServerStorage");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "We already have an inflight request for topic %@, checking if we have a backup",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v12)
      && _IDSShouldLog(0LL, @"ServerStorage"))
    {
      id v22 = v8;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"We already have an inflight request for topic %@, checking if we have a backup");
    }

    if (-[NSMutableSet containsObject:](self->_pendingStorageRequests, "containsObject:", v8, v22))
    {
      uint64_t v13 = OSLogHandleForIDSCategory("ServerStorage");
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "We already have a backup request for topic %@, throwing this request away",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v15)
        && _IDSShouldLog(0LL, @"ServerStorage"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"We already have a backup request for topic %@, throwing this request away");
      }
    }

    else
    {
      -[NSMutableSet addObject:](self->_pendingStorageRequests, "addObject:", v8);
      uint64_t v19 = OSLogHandleForIDSCategory("ServerStorage");
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "We already have an inflight request for this topic %@, adding it to the backup queue",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v21)
        && _IDSShouldLog(0LL, @"ServerStorage"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"We already have an inflight request for this topic %@, adding it to the backup queue");
      }
    }
  }

  else
  {
    uint64_t v16 = OSLogHandleForIDSCategory("ServerStorage");
    CFMutableDictionaryRef v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "This is the first request for topic %@, kicking off a server message for it",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v18)
      && _IDSShouldLog(0LL, @"ServerStorage"))
    {
      id v22 = v8;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"This is the first request for topic %@, kicking off a server message for it");
    }

    -[IDSServerStorageStateMachine _persistTopic:](self, "_persistTopic:", v8, v22);
    -[NSMutableSet addObject:](self->_inflightStorageRequests, "addObject:", v8);
    -[IDSServerStorageStateMachine startCollectingMetricsForServerStorageStateMachineFor:isPrimary:]( self,  "startCollectingMetricsForServerStorageStateMachineFor:isPrimary:",  v8,  v6);
    -[IDSServerStorageStateMachine _sendServerStorageMessageForTopic:retryCount:]( self,  "_sendServerStorageMessageForTopic:retryCount:",  v8,  0LL);
  }
}

- (void)recievedNoStorageResponseForTopic:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory("ServerStorage");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "We received a 165 from the server for topic %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v10) && _IDSShouldLog(0LL, @"ServerStorage"))
  {
    id v11 = v6;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"We received a 165 from the server for topic %@");
  }

  -[IDSServerStorageStateMachine terminateStateMachineForTopic:](self, "terminateStateMachineForTopic:", v6, v11);
}

- (void)recievedLastMessageFromStorageForTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("ServerStorage");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "We received a last from storage from the server for topic %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"ServerStorage"))
  {
    id v8 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"We received a last from storage from the server for topic %@");
  }

  -[IDSServerStorageStateMachine terminateStateMachineForTopic:](self, "terminateStateMachineForTopic:", v4, v8);
}

- (void)recievedMessageFromStorageForTopic:(id)a3
{
  lastReceivedMessageTimePerTopic = self->_lastReceivedMessageTimePerTopic;
  id v6 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:](lastReceivedMessageTimePerTopic, "setObject:forKey:", v5, v6);

  -[IDSServerStorageStateMachine _incrementMessagesFromStorageForTopic:]( self,  "_incrementMessagesFromStorageForTopic:",  v6);
}

- (void)_startTimeoutTimerForTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-retry-timeout",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine idsServerBag](self, "idsServerBag"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);
  signed int v8 = [v7 intValue];

  if (!v8) {
    signed int v8 = 60;
  }
  id v9 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v11 = im_primary_queue(v9, v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v4,  @"topic",  0LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001F9900;
  v15[3] = &unk_1008F8088;
  v15[4] = self;
  v14 = -[IMDispatchTimer initWithQueue:interval:repeats:userInfo:handlerBlock:]( v9,  "initWithQueue:interval:repeats:userInfo:handlerBlock:",  v12,  v8,  0LL,  v13,  v15);

  -[NSMutableDictionary setObject:forKey:](self->_deathTimerToTopicMap, "setObject:forKey:", v14, v4);
}

- (void)_startExtendedTimeoutTimerForTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-extend-retry-timeout",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine idsServerBag](self, "idsServerBag"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);
  signed int v8 = [v7 intValue];

  if (!v8) {
    signed int v8 = 20;
  }
  id v9 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v11 = im_primary_queue(v9, v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v4,  @"topic",  0LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001F9A68;
  v15[3] = &unk_1008F8088;
  v15[4] = self;
  v14 = -[IMDispatchTimer initWithQueue:interval:repeats:userInfo:handlerBlock:]( v9,  "initWithQueue:interval:repeats:userInfo:handlerBlock:",  v12,  v8,  0LL,  v13,  v15);

  -[NSMutableDictionary setObject:forKey:](self->_deathTimerToTopicMap, "setObject:forKey:", v14, v4);
}

- (void)_submitNoLastFromStorageMetricForService:(id)a3
{
  id v3 = a3;
  id v4 = [[IDSMissingMessageMetric alloc] initWithReason:705 guid:0 service:v3 additionalInformation:0];

  +[IDSMissingMessageMetricReporter sendMetric:](&OBJC_CLASS___IDSMissingMessageMetricReporter, "sendMetric:", v4);
}

- (void)_stateMachineTimedOut:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _stringForKey:@"topic"]);
  uint64_t v7 = OSLogHandleForIDSCategory("ServerStorage");
  signed int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Topic %@, has timed out waiting for server response",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"ServerStorage"))
  {
    v52 = v6;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"Topic %@, has timed out waiting for server response");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSServerStorageStateMachine lastReceivedMessageTimeForTopic:]( self,  "lastReceivedMessageTimeForTopic:",  v6,  v52));
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_56;
  }
  [v10 timeIntervalSinceNow];
  if (v12 < 0.0) {
    double v12 = -v12;
  }
  if (v12 < 10.0)
  {
    uint64_t v13 = OSLogHandleForIDSCategory("ServerStorage");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Topic %@ has recently received a message from storage.  Starting a new extended timer for retry.",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"ServerStorage"))
    {
      v53 = v6;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"Topic %@ has recently received a message from storage.  Starting a new extended timer for retry.");
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deathTimerToTopicMap, "objectForKey:", v6, v53));
    CFMutableDictionaryRef v17 = v16;
    if (v16)
    {
      [v16 invalidate];
      -[NSMutableDictionary removeObjectForKey:](self->_deathTimerToTopicMap, "removeObjectForKey:", v6);
    }

    -[IDSServerStorageStateMachine _startExtendedTimeoutTimerForTopic:](self, "_startExtendedTimeoutTimerForTopic:", v6);
  }

  else
  {
LABEL_56:
    if (-[NSMutableSet containsObject:](self->_pendingStorageRequests, "containsObject:", v6))
    {
      uint64_t v18 = OSLogHandleForIDSCategory("ServerStorage");
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "We timed out with our request for %@ however we have one in the pending queue, Not retrying and instead lettin g that take over",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v20)
        && _IDSShouldLog(0LL, @"ServerStorage"))
      {
        v53 = v6;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"We timed out with our request for %@ however we have one in the pending queue, Not retrying and instead letting that take over");
      }

      -[IDSServerStorageStateMachine terminateStateMachineForTopic:](self, "terminateStateMachineForTopic:", v6, v53);
      -[IDSServerStorageStateMachine _submitNoLastFromStorageMetricForService:]( self,  "_submitNoLastFromStorageMetricForService:",  v6);
    }

    else
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
      v60 = (void *)objc_claimAutoreleasedReturnValue([v21 serviceWithPushTopic:v6]);

      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-force-passthrough-retry",  v6));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine idsServerBag](self, "idsServerBag"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v22]);
      unsigned int v25 = [v24 BOOLValue];

      if (([v60 passThroughMessagesFromStorage] ^ 1 | v25))
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-storage-state-machine-retry-limit",  v6));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
        v59 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v58]);

        if (v59 && (uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSNumber, v27), (objc_opt_isKindOfClass(v59, v28) & 1) != 0)) {
          int v29 = [v59 intValue];
        }
        else {
          int v29 = 2;
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary _numberForKey:]( self->_currentStorageRetriesPerTopic,  "_numberForKey:",  v6));
        BOOL v34 = (int)[v33 intValue] < v29;

        if (v34)
        {
          uint64_t v35 = OSLogHandleForIDSCategory("ServerStorage");
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary _numberForKey:]( self->_currentStorageRetriesPerTopic,  "_numberForKey:",  v6));
            unsigned int v38 = [v37 intValue];
            *(_DWORD *)buf = 138412802;
            v62 = v6;
            __int16 v63 = 1024;
            unsigned int v64 = v38;
            __int16 v65 = 1024;
            int v66 = 2;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "We have not used up our remaining retries on topic %@: Used: %d Available: %d",  buf,  0x18u);
          }

          if (os_log_shim_legacy_logging_enabled(v39)
            && _IDSShouldLog(0LL, @"ServerStorage"))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary _numberForKey:]( self->_currentStorageRetriesPerTopic,  "_numberForKey:",  v6));
            id v56 = [v40 intValue];
            uint64_t v57 = 2LL;
            v55 = v6;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"We have not used up our remaining retries on topic %@: Used: %d Available: %d");
          }

          v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_deathTimerToTopicMap,  "objectForKey:",  v6,  v55,  v56,  v57));
          v42 = v41;
          if (v41)
          {
            [v41 invalidate];
            -[NSMutableDictionary removeObjectForKey:](self->_deathTimerToTopicMap, "removeObjectForKey:", v6);
          }

          v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary _numberForKey:]( self->_currentStorageRetriesPerTopic,  "_numberForKey:",  v6));
          v44 = (char *)[v43 integerValue];

          v45 = v44 + 1;
          currentStorageRetriesPerTopic = self->_currentStorageRetriesPerTopic;
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v45));
          -[NSMutableDictionary setObject:forKey:](currentStorageRetriesPerTopic, "setObject:forKey:", v47, v6);

          v48 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary _numberForKey:]( self->_currentStorageRetriesPerTopic,  "_numberForKey:",  v6));
          -[IDSServerStorageStateMachine _sendServerStorageMessageForTopic:retryCount:]( self,  "_sendServerStorageMessageForTopic:retryCount:",  v6,  [v48 intValue]);
        }

        else
        {
          uint64_t v49 = OSLogHandleForIDSCategory("ServerStorage");
          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "We have used up all available retries for topic %@: Terminating state machine",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v51)
            && _IDSShouldLog(0LL, @"ServerStorage"))
          {
            v55 = v6;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"We have used up all available retries for topic %@: Terminating state machine");
          }

          -[IDSServerStorageStateMachine terminateStateMachineForTopic:]( self,  "terminateStateMachineForTopic:",  v6,  v55);
          -[IDSServerStorageStateMachine _submitNoLastFromStorageMetricForService:]( self,  "_submitNoLastFromStorageMetricForService:",  v6);
        }
      }

      else
      {
        uint64_t v30 = OSLogHandleForIDSCategory("ServerStorage");
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "The topic %@ is a pass-through-message service. Not retrying.",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v32)
          && _IDSShouldLog(0LL, @"ServerStorage"))
        {
          v54 = v6;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"The topic %@ is a pass-through-message service. Not retrying.");
        }

        -[IDSServerStorageStateMachine terminateStateMachineForTopic:](self, "terminateStateMachineForTopic:", v6, v54);
        -[IDSServerStorageStateMachine _submitNoLastFromStorageMetricForService:]( self,  "_submitNoLastFromStorageMetricForService:",  v6);
      }
    }
  }
}

- (void)_sendServerStorageMessageForTopic:(id)a3 retryCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___IDSPendingOfflineMessageResponse);
  signed int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  [v7 setRetryCount:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine deliveryController](self, "deliveryController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001FA3A8;
  v11[3] = &unk_1008F7C00;
  id v12 = v6;
  uint64_t v13 = self;
  id v10 = v6;
  [v9 sendIDSMessage:v7 service:0 topic:v10 completionBlock:v11];
}

- (void)terminateStateMachineForTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("ServerStorage");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Told to terminate state machine for topic %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7) && _IDSShouldLog(0LL, @"ServerStorage"))
  {
    id v16 = v4;
    _IDSLogV(0LL, @"IDSFoundation", @"ServerStorage", @"Told to terminate state machine for topic %@");
  }

  signed int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_deathTimerToTopicMap, "objectForKey:", v4, v16));
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 invalidate];
    -[NSMutableDictionary removeObjectForKey:](self->_deathTimerToTopicMap, "removeObjectForKey:", v4);
  }

  else
  {
    uint64_t v10 = OSLogHandleForIDSCategory("ServerStorage");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Unable to find a topic timeout timer, This will likely cause a bug",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v12)
      && _IDSShouldLog(0LL, @"ServerStorage"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"Unable to find a topic timeout timer, This will likely cause a bug");
    }
  }

  -[NSMutableSet removeObject:](self->_inflightStorageRequests, "removeObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_currentStorageRetriesPerTopic, "removeObjectForKey:", v4);
  -[IDSServerStorageStateMachine stopCollectingMetricsForServerStorageStateMachineFor:]( self,  "stopCollectingMetricsForServerStorageStateMachineFor:",  v4);
  if (-[NSMutableSet containsObject:](self->_pendingStorageRequests, "containsObject:", v4))
  {
    uint64_t v13 = OSLogHandleForIDSCategory("ServerStorage");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "We terminated our state machine for %@, however we have another backed up, kicking off another state machine",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"ServerStorage"))
    {
      id v17 = v4;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"We terminated our state machine for %@, however we have another backed up, kicking off another state machine");
    }

    -[NSMutableSet removeObject:](self->_pendingStorageRequests, "removeObject:", v4, v17);
    -[IDSServerStorageStateMachine incomingStorageRequestForTopic:primary:messageContext:]( self,  "incomingStorageRequestForTopic:primary:messageContext:",  v4,  0LL,  0LL);
  }

  else
  {
    -[IDSServerStorageStateMachine _unpersistTopic:](self, "_unpersistTopic:", v4);
  }
}

- (BOOL)inflightServerStorageStateMachineForTopic:(id)a3
{
  return -[NSMutableSet containsObject:](self->_inflightStorageRequests, "containsObject:", a3);
}

- (id)lastReceivedMessageTimeForTopic:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_lastReceivedMessageTimePerTopic, "objectForKey:", a3);
}

- (id)currentMetricCollectorForTopic:(id)a3
{
  id v4 = a3;
  metricCollectors = self->_metricCollectors;
  if (!metricCollectors)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v7 = self->_metricCollectors;
    self->_metricCollectors = Mutable;

    metricCollectors = self->_metricCollectors;
  }

  signed int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](metricCollectors, "objectForKey:", v4));

  return v8;
}

- (void)startCollectingMetricsForServerStorageStateMachineFor:(id)a3 isPrimary:(BOOL)a4
{
  BOOL v4 = a4;
  id key = a3;
  id v6 = -[IDSServerStorageMetricCollector initWithTopic:isPrimary:]( objc_alloc(&OBJC_CLASS___IDSServerStorageMetricCollector),  "initWithTopic:isPrimary:",  key,  v4);
  uint64_t v7 = v6;
  if (!self->_metricCollectors)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    metricCollectors = self->_metricCollectors;
    self->_metricCollectors = Mutable;

    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v6) {
LABEL_3:
  }
    CFDictionarySetValue((CFMutableDictionaryRef)self->_metricCollectors, key, v7);
LABEL_4:
}

- (void)stopCollectingMetricsForServerStorageStateMachineFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_metricCollectors, "objectForKey:", v4));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_metricCollectors, "objectForKey:", v4));
    [v6 endCollector];
    [v6 reportMetric];
    -[NSMutableDictionary removeObjectForKey:](self->_metricCollectors, "removeObjectForKey:", v4);
  }

  else
  {
    uint64_t v7 = OSLogHandleForIDSCategory("ServerStorage");
    signed int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Was told to stop, but we didnt have one in progress...",  v10,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(0LL, @"ServerStorage"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"Was told to stop, but we didnt have one in progress...");
    }
  }
}

- (void)_incrementMessagesFromStorageForTopic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_metricCollectors, "objectForKey:", v4));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_metricCollectors, "objectForKey:", v4));
    [v6 incrementMessageCount];
  }

  else
  {
    uint64_t v7 = OSLogHandleForIDSCategory("ServerStorage");
    signed int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Told about a message from server storage, but we dont have an ongoing metric for it, not able to incriment",  v10,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(0LL, @"ServerStorage"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"ServerStorage",  @"Told about a message from server storage, but we dont have an ongoing metric for it, not able to incriment");
    }
  }
}

- (void)reissuePersistedRequests
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine _persistedTopics](self, "_persistedTopics", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[IDSServerStorageStateMachine incomingStorageRequestForTopic:primary:messageContext:]( self,  "incomingStorageRequestForTopic:primary:messageContext:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  1LL,  0LL);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (id)metricCollectors
{
  return self->_metricCollectors;
}

- (void)_persistTopic:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine _persistedTopics](self, "_persistedTopics"));
  id v5 = (NSMutableArray *)[v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  if ((-[NSMutableArray containsObject:](v5, "containsObject:", v7) & 1) == 0)
  {
    -[NSMutableArray addObject:](v5, "addObject:", v7);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine userDefaults](self, "userDefaults"));
    [v6 setAppValue:v5 forKey:@"IDSActiveStorageStateMachines"];
  }
}

- (void)_unpersistTopic:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine _persistedTopics](self, "_persistedTopics"));
  id v5 = [v4 mutableCopy];

  if ([v5 containsObject:v9])
  {
    [v5 removeObject:v9];
    id v6 = [v5 count];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine userDefaults](self, "userDefaults"));
    __int128 v8 = v7;
    if (v6) {
      [v7 setAppValue:v5 forKey:@"IDSActiveStorageStateMachines"];
    }
    else {
      [v7 removeAppValueForKey:@"IDSActiveStorageStateMachines"];
    }
  }
}

- (id)_persistedTopics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageStateMachine userDefaults](self, "userDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appValueForKey:@"IDSActiveStorageStateMachines"]);

  return v3;
}

- (IDSDeliveryController)deliveryController
{
  return self->_deliveryController;
}

- (void)setDeliveryController:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (IDSServerBag)idsServerBag
{
  return self->_idsServerBag;
}

- (void)setIdsServerBag:(id)a3
{
}

- (NSMutableDictionary)deathTimerToTopicMap
{
  return self->_deathTimerToTopicMap;
}

- (void)setDeathTimerToTopicMap:(id)a3
{
}

- (NSMutableDictionary)currentStorageRetriesPerTopic
{
  return self->_currentStorageRetriesPerTopic;
}

- (void)setCurrentStorageRetriesPerTopic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end