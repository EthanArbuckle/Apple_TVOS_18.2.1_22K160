@interface APSOutgoingMessageQueue
- (APSOutgoingMessageQueue)initWithDelegate:(id)a3 environment:(id)a4;
- (BOOL)_outgoingMessageIsLateCriticalMessage:(id)a3;
- (BOOL)hasEagerMessages;
- (BOOL)hasPendingMessages;
- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled;
- (BOOL)shouldReportLastReversePushRTTOnInterface:(id)a3;
- (id)lastReversePushRTTMillisecondsOnInterface:(id)a3;
- (id)outgoingMessagesToSend;
- (unint64_t)count;
- (void)_clearCriticalMessageKeepAliveTimer;
- (void)_clearCriticalMessageKeepAliveTimerIfAppropriate;
- (void)_criticalMessageKeepAliveTimerFired;
- (void)_deliverResult:(id)a3 forMessage:(id)a4;
- (void)_queueChanged;
- (void)_recalculateDisableFastDormancy;
- (void)_recalculatePowerAssertion;
- (void)_recalculateTimer;
- (void)_startCriticalMessageFlushTimerSendingFlush;
- (void)_timerFired:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)cancelOutgoingMessageWithID:(unint64_t)a3;
- (void)dealloc;
- (void)enqueueOutgoingMessage:(id)a3 forOriginator:(id)a4;
- (void)handleAcknowledgmentForOutgoingMessageWithResult:(id)a3 ackTimestamp:(unint64_t)a4 linkQuality:(int)a5 connectionType:(int64_t)a6 onInterface:(id)a7;
- (void)handleConnectionClosedOnInterface:(id)a3;
- (void)handleConnectionOpenedOnInterface:(id)a3;
- (void)handleErrorSendingOutgoingMessage:(id)a3 error:(id)a4;
- (void)handleSentOutgoingMessage:(id)a3 onInterface:(id)a4;
- (void)setCriticalMessageKeepAliveTimerDuration:(id)a3;
- (void)setCriticalMessageTimeout:(id)a3;
- (void)setForcedShortTimeoutInterval:(id)a3;
- (void)setNumberOfCriticalMessageFlushesBeforeDisconnecting:(id)a3;
- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3;
- (void)setShouldReportLastReversePushRTT:(BOOL)a3 onInterface:(id)a4;
- (void)transferOwnershipOfPendingMessagesToHandler:(id)a3;
@end

@implementation APSOutgoingMessageQueue

- (APSOutgoingMessageQueue)initWithDelegate:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___APSOutgoingMessageQueue;
  v9 = -[APSOutgoingMessageQueue init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a3);
    objc_storeStrong((id *)&v10->_environment, a4);
    v10->_criticalMessageTimeout = 10.0;
    v10->_criticalMessageKeepAliveTimerDuration = 10.0;
    *(_OWORD *)&v10->_criticalMessageFlushCount = xmmword_100102B10;
    v10->_criticalMessageFlushSize = 0LL;
    v10->_forcedShortTimeoutDuration = 2.0;
  }

  return v10;
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  -[NSTimer invalidate](v2->_timer, "invalidate");
  objc_sync_exit(v2);

  -[APSOutgoingMessageQueue _clearCriticalMessageKeepAliveTimer](v2, "_clearCriticalMessageKeepAliveTimer");
  v2->_criticalMessageFlushCount = 0LL;
  v2->_criticalMessageFlushSize = 0LL;
  v3.receiver = v2;
  v3.super_class = (Class)&OBJC_CLASS___APSOutgoingMessageQueue;
  -[APSOutgoingMessageQueue dealloc](&v3, "dealloc");
}

- (void)enqueueOutgoingMessage:(id)a3 forOriginator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)-[NSMutableArray count](self->_queue, "count") > 0x63)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000BEA54((uint64_t)self, v6);
    }
    uint64_t v12 = APSError(7LL, @"Outgoing message queue full");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v7 handleResult:v13 forSendingOutgoingMessage:v6];
  }

  else
  {
    queue = self->_queue;
    if (!queue)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v10 = self->_queue;
      self->_queue = v9;

      queue = self->_queue;
    }

    -[NSMutableArray addObject:](queue, "addObject:", v6);
    ++self->_numberQueued;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_lastNotificationQueued = v11;
    -[APSOutgoingMessageQueue _queueChanged](self, "_queueChanged");
  }
}

- (id)outgoingMessagesToSend
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self->_queue;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v9, "wasSent", (void)v11) & 1) == 0
          && ([v9 wasCancelled] & 1) == 0
          && ([v9 hasTimedOut] & 1) == 0)
        {
          -[NSMutableArray addObject:](v3, "addObject:", v9);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)cancelOutgoingMessageWithID:(unint64_t)a3
{
  id v5 = -[NSMutableArray count](self->_queue, "count");
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0LL;
    while (1)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_queue, "objectAtIndex:", v7));
      if ([v8 messageID] == (id)a3) {
        break;
      }

      if (v6 == (id)++v7) {
        goto LABEL_5;
      }
    }

    if (([v8 wasCancelled] & 1) != 0 || objc_msgSend(v8, "hasTimedOut"))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        __int128 v14 = self;
        __int16 v15 = 2048;
        unint64_t v16 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Cancelled outgoing message %lu was already cancelled or timed out",  (uint8_t *)&v13,  0x16u);
      }
    }

    else
    {
      uint64_t v9 = APSError(3LL, @"Message cancelled");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[APSOutgoingMessageQueue _deliverResult:forMessage:](self, "_deliverResult:forMessage:", v10, v8);
    }

    unsigned int v11 = [v8 wasSent];
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v12)
      {
        int v13 = 138412546;
        __int128 v14 = self;
        __int16 v15 = 2048;
        unint64_t v16 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Cancelled outgoing message %lu was already sent",  (uint8_t *)&v13,  0x16u);
      }

      [v8 setCancelled:1];
    }

    else
    {
      if (v12)
      {
        int v13 = 138412546;
        __int128 v14 = self;
        __int16 v15 = 2048;
        unint64_t v16 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Removing cancelled outgoing message %lu from queue",  (uint8_t *)&v13,  0x16u);
      }

      -[NSMutableArray removeObjectAtIndex:](self->_queue, "removeObjectAtIndex:", v7);
    }
  }

  else
  {
LABEL_5:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      __int128 v14 = self;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Cancelled outgoing message %lu not found in queue",  (uint8_t *)&v13,  0x16u);
    }
  }

  -[APSOutgoingMessageQueue _queueChanged](self, "_queueChanged");
}

- (void)transferOwnershipOfPendingMessagesToHandler:(id)a3
{
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = self->_queue;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "originator", (void)v13));
          v4[2](v4, v10, v11);
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }

    queue = self->_queue;
    self->_queue = 0LL;

    -[APSOutgoingMessageQueue _queueChanged](self, "_queueChanged");
  }
}

- (void)handleSentOutgoingMessage:(id)a3 onInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2048;
    id v16 = [v6 identifier];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ handleSentOutgoingMessage: %@ onInterface %@ identifier %lu",  buf,  0x2Au);
  }

  [v6 setSent:1];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v6 setSentTimestamp:v8];

  [v6 setSendInterfaceIdentifier:v7];
  [v6 messageID];
  APSAlert(@"Sent message %lu");
  -[APSOutgoingMessageQueue _queueChanged](self, "_queueChanged");
}

- (void)handleErrorSendingOutgoingMessage:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [a3 messageID];
  id v8 = -[NSMutableArray count](self->_queue, "count");
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = 0LL;
    *(void *)&__int128 v9 = 138412546LL;
    __int128 v20 = v9;
    while (1)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_queue, "objectAtIndex:", v11, v20));
      if ([v12 messageID] == v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v20;
        v22 = self;
        __int16 v23 = 2048;
        id v24 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Message %lu may have already been sent, not removing message...",  buf,  0x16u);
      }

      if (v10 == (id)++v11) {
        goto LABEL_9;
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v12 originator]);
    [v19 handleResult:v6 forSendingOutgoingMessage:v12];
    -[NSMutableArray removeObjectAtIndex:](self->_queue, "removeObjectAtIndex:", v11);
  }

  else
  {
LABEL_9:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000BEB80((uint64_t)self, (uint64_t)v7, v13, v14, v15, v16, v17, v18);
    }
  }

  -[APSOutgoingMessageQueue _queueChanged](self, "_queueChanged");
}

- (BOOL)shouldReportLastReversePushRTTOnInterface:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    __int128 v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to return shouldReportLastReversePushRTT on invalid interface %@",  (uint8_t *)&v8,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_shouldReportLastReversePushRTT,  "objectForKeyedSubscript:",  v4));
  BOOL v6 = v5 != 0LL;

  return v6;
}

- (void)setShouldReportLastReversePushRTT:(BOOL)a3 onInterface:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_shouldReportLastReversePushRTT,  "objectForKeyedSubscript:",  v6));
    unsigned int v8 = [v7 BOOLValue];

    if (v8 != v4)
    {
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_shouldReportLastReversePushRTT,  "setObject:forKeyedSubscript:",  v9,  v6);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = @"NO";
        *(_DWORD *)id v12 = 138412802;
        *(void *)&v12[4] = self;
        *(_WORD *)&v12[12] = 2112;
        if (v4) {
          __int16 v10 = @"YES";
        }
        *(void *)&v12[14] = v10;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to set shouldReportLastReversePushRTT to %@ on  %@",  v12,  0x20u);
      }
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lastReversePushRTTMilliseconds,  "setObject:forKeyedSubscript:",  0LL,  v6,  *(_OWORD *)v12);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"NO";
    *(_DWORD *)id v12 = 138412802;
    *(void *)&v12[4] = self;
    *(_WORD *)&v12[12] = 2112;
    if (v4) {
      uint64_t v11 = @"YES";
    }
    *(void *)&v12[14] = v11;
    __int16 v13 = 2112;
    id v14 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to set shouldReportLastReversePushRTT %@ on invalid interface %@",  v12,  0x20u);
  }
}

- (id)lastReversePushRTTMillisecondsOnInterface:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      __int16 v10 = self;
      __int16 v11 = 2112;
      id v12 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to get  _lastReversePushRTTMilliseconds on invalid interface %@",  (uint8_t *)&v9,  0x16u);
    }

    goto LABEL_8;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_shouldReportLastReversePushRTT,  "objectForKeyedSubscript:",  v4));

  if (!v5)
  {
LABEL_8:
    id v7 = 0LL;
    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lastReversePushRTTMilliseconds,  "objectForKeyedSubscript:",  v4));
    int v9 = 138412802;
    __int16 v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to get  _lastReversePushRTTMilliseconds %@ on interface %@",  (uint8_t *)&v9,  0x20u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lastReversePushRTTMilliseconds,  "objectForKeyedSubscript:",  v4));
LABEL_9:

  return v7;
}

- (void)handleAcknowledgmentForOutgoingMessageWithResult:(id)a3 ackTimestamp:(unint64_t)a4 linkQuality:(int)a5 connectionType:(int64_t)a6 onInterface:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v10 = a3;
  id v11 = a7;
  p_queue = &self->_queue;
  id v13 = -[NSMutableArray count](self->_queue, "count");
  if (v13)
  {
    id v14 = v13;
    id v15 = v10;
    uint64_t v16 = 0LL;
    while (1)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](*p_queue, "objectAtIndex:", v16));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sendInterfaceIdentifier]);
      unsigned __int8 v19 = [v18 isEqualToString:v11];

      if ((v19 & 1) != 0) {
        break;
      }
      if (v14 == (id)++v16)
      {
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        break;
      }
    }

    id v10 = v15;
  }

  else
  {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v59 = self;
    __int16 v60 = 2048;
    double v61 = *(double *)&v16;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ handleAcknowledgmentForOutgoingMessageWithResult - firstSentIndex %lu",  buf,  0x16u);
  }

  if (v16 != 0x7FFFFFFFFFFFFFFFLL
    && -[NSMutableArray count](*p_queue, "count")
    && (__int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](*p_queue, "objectAtIndex:", v16)),
        unsigned int v21 = [v20 wasSent],
        v20,
        v21))
  {
    v54 = v10;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_double lastReceivedAckOrReconnect = v22;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double lastReceivedAckOrReconnect = self->_lastReceivedAckOrReconnect;
      *(_DWORD *)buf = 138412546;
      v59 = self;
      __int16 v60 = 2048;
      double v61 = lastReceivedAckOrReconnect;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ updating lastReceivedAck to %f",  buf,  0x16u);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_queue, "objectAtIndex:", v16));
    id v50 = [v24 messageID];
    APSAlert(@"Received ack for msg %lu");
    uint64_t v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sentTimestamp", v50));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v53 = (void *)v25;
    [v26 timeIntervalSinceDate:v25];
    double v28 = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v28));
    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
    uint64_t v31 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_criticalMessageFlushCount));
    uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v24 payloadLength]));
    v68[0] = @"ConnectionType";
    v33 = sub_100005B48(a6);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v69[0] = v34;
    v69[1] = v30;
    v56 = (void *)v30;
    v68[1] = @"LinkQuality";
    v68[2] = @"FlushCount";
    v51 = (void *)v32;
    v52 = (void *)v31;
    v69[2] = v31;
    v69[3] = v29;
    v68[3] = @"SendDuration";
    v68[4] = @"PayloadSize";
    v69[4] = v32;
    v68[5] = @"MessageIdentifier";
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v24 identifier]));
    v69[5] = v35;
    v68[6] = @"Topic";
    v36 = (void *)objc_claimAutoreleasedReturnValue([v24 topic]);
    v69[6] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  7LL));

    v38 = v29;
    [v29 doubleValue];
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unint64_t)(v39 * 1000.0)));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_lastReversePushRTTMilliseconds,  "setObject:forKeyedSubscript:",  v40,  v11);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lastReversePushRTTMilliseconds,  "objectForKeyedSubscript:",  v11));
      *(_DWORD *)buf = 138412802;
      v59 = self;
      __int16 v60 = 2112;
      double v61 = *(double *)&v41;
      __int16 v62 = 2112;
      id v63 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ record _lastReversePushRTTMilliseconds %@ on %@",  buf,  0x20u);
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lastReversePushRTTMilliseconds,  "objectForKeyedSubscript:",  v11));
    objc_msgSend(v24, "setSendRTT:", objc_msgSend(v42, "unsignedIntegerValue"));

    [v24 setAckReceived:1];
    [v24 setAckTimestamp:a4];
    id v10 = v54;
    if (([v24 wasCancelled] & 1) != 0 || objc_msgSend(v24, "hasTimedOut"))
    {
      v43 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = [v24 messageID];
        *(_DWORD *)buf = 138412546;
        v59 = self;
        __int16 v60 = 2048;
        double v61 = *(double *)&v44;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Ack'ed outgoing message %lu was already cancelled or timed out",  buf,  0x16u);
      }

      APSPowerLog(@"Received Late Ack", v37);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = [v24 messageID];
        id v46 = [v24 identifier];
        id v47 = [v54 code];
        v48 = (void *)objc_claimAutoreleasedReturnValue([v54 localizedDescription]);
        *(_DWORD *)buf = 138413314;
        v59 = self;
        __int16 v60 = 2048;
        double v61 = *(double *)&v45;
        __int16 v62 = 2048;
        id v63 = v46;
        __int16 v64 = 2048;
        id v65 = v47;
        id v10 = v54;
        __int16 v66 = 2112;
        v67 = v48;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Delivering result for outgoing message %lu with idenitifer %lu: %ld '%@'",  buf,  0x34u);
      }

      APSPowerLog(@"Received Ack", v37);
      -[APSOutgoingMessageQueue _deliverResult:forMessage:](self, "_deliverResult:forMessage:", v10, v24);
      v43 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
    }

    -[NSMutableArray removeObjectAtIndex:](self->_queue, "removeObjectAtIndex:", v16);
    ++self->_numberAcked;
    [v43[290] timeIntervalSinceReferenceDate];
    self->_lastNotificationAcked = v49;
    -[APSOutgoingMessageQueue _queueChanged](self, "_queueChanged");
  }

  else if (-[NSMutableArray count](*p_queue, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000BEC78((uint64_t)self, (id *)&self->_queue);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_1000BEBFC((uint64_t)self);
  }
}

- (void)handleConnectionOpenedOnInterface:(id)a3
{
  id v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  self->_double lastReceivedAckOrReconnect = v5;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = self->_queue;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&__int128 v9 = 138412546LL;
    __int128 v20 = v9;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v13, "wasCancelled", v20, (void)v21) & 1) == 0
          && ([v13 hasTimedOut] & 1) == 0)
        {
          if ([v13 isCritical])
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 timestamp]);
            [v14 timeIntervalSinceNow];
            double v16 = v15 + self->_criticalMessageTimeout;

            if (v16 < 0.0 && ([v13 sendRetried] & 1) == 0)
            {
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 sendInterfaceIdentifier]);
              unsigned __int8 v18 = [v17 isEqualToString:v4];

              if ((v18 & 1) == 0)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v13 guid]);
                  *(_DWORD *)buf = v20;
                  v26 = self;
                  __int16 v27 = 2112;
                  double v28 = v19;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ informed of reconnect, retry late critical message %@ sent on another interface",  buf,  0x16u);
                }

                [v13 setSent:0];
                [v13 setSendRetried:1];
                [v13 setSendInterfaceIdentifier:0];
                -[NSMutableArray addObject:](v6, "addObject:", v13);
              }
            }
          }
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    }

    while (v10);
  }

  -[NSMutableArray removeObjectsInArray:](self->_queue, "removeObjectsInArray:", v6);
  -[NSMutableArray addObjectsFromArray:](self->_queue, "addObjectsFromArray:", v6);
}

- (void)handleConnectionClosedOnInterface:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = (uint64_t)-[NSMutableArray count](self->_queue, "count");
  if (v6 >= 1)
  {
    uint64_t v8 = v6;
    uint64_t v9 = 0LL;
    *(void *)&__int128 v7 = 138412802LL;
    __int128 v16 = v7;
    do
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_queue, "objectAtIndex:", v9, v16));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sendInterfaceIdentifier]);
      unsigned int v12 = [v11 isEqualToString:v4];

      if (v12)
      {
        if (([v10 wasCancelled] & 1) != 0
          || [v10 hasTimedOut])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [v10 messageID];
            *(_DWORD *)buf = 138412546;
            unsigned __int8 v18 = self;
            __int16 v19 = 2048;
            id v20 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Removing cancelled or timed out outgoing message %lu from queue",  buf,  0x16u);
          }

- (void)_deliverResult:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138413058;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 1024;
    unsigned int v16 = [v7 priority];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to deliver result %@ for message %@ with priority %d",  (uint8_t *)&v9,  0x26u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 originator]);
  [v8 handleResult:v6 forSendingOutgoingMessage:v7];
}

- (void)_queueChanged
{
  if (!-[NSMutableArray count](self->_queue, "count"))
  {
    queue = self->_queue;
    self->_queue = 0LL;
  }

  -[APSOutgoingMessageQueue _clearCriticalMessageKeepAliveTimerIfAppropriate]( self,  "_clearCriticalMessageKeepAliveTimerIfAppropriate");
  -[APSOutgoingMessageQueue _recalculateTimer](self, "_recalculateTimer");
  -[APSOutgoingMessageQueue _recalculatePowerAssertion](self, "_recalculatePowerAssertion");
  -[APSOutgoingMessageQueue _recalculateDisableFastDormancy](self, "_recalculateDisableFastDormancy");
}

- (void)_recalculateTimer
{
  v2 = self;
  if (-[APSOutgoingMessageQueueDelegate shouldForceShortTimeouts]( self->_delegate,  "shouldForceShortTimeouts")
    && -[NSMutableArray count](v2->_queue, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double forcedShortTimeoutDuration = v2->_forcedShortTimeoutDuration;
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v2;
      __int16 v33 = 2048;
      v34 = *(NSTimer **)&forcedShortTimeoutDuration;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ shouldForceShortTimeouts, enforcing maximum %f pending outgoing message duration",  buf,  0x16u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  v2->_forcedShortTimeoutDuration));
    v2 = self;
  }

  else
  {
    id v4 = 0LL;
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  double v5 = v2->_queue;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v8);
        id v10 = objc_autoreleasePoolPush();
        if (([v9 wasCancelled] & 1) == 0
          && ([v9 hasTimedOut] & 1) == 0)
        {
          if (!self->_criticalMessageKeepAliveTimer
            && [v9 wasSent]
            && [v9 isCritical])
          {
            double criticalMessageTimeout = (double)(unint64_t)self->_criticalMessageTimeout;
            id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_lastReceivedAckOrReconnect + criticalMessageTimeout));
            __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 timestamp]);
            id v14 = (id)objc_claimAutoreleasedReturnValue([v13 dateByAddingTimeInterval:criticalMessageTimeout]);

            if ([v12 compare:v14] == (id)-1)
            {
              id v14 = v14;

              id v12 = v14;
            }

- (void)_recalculatePowerAssertion
{
  unsigned int v3 = -[APSOutgoingMessageQueue hasEagerMessages](self, "hasEagerMessages");
  powerAssertion = self->_powerAssertion;
  if (v3)
  {
    if (!powerAssertion)
    {
      if (self->_powerOptimizationsForExpensiveNetworkingDisabled
        || !+[PCInterfaceMonitor isNetworkingPowerExpensiveToUse]( &OBJC_CLASS___PCInterfaceMonitor,  "isNetworkingPowerExpensiveToUse"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = -[NSMutableArray count](self->_queue, "count");
          *(_DWORD *)buf = 138412546;
          id v12 = self;
          __int16 v13 = 2048;
          id v14 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Creating power assertion - pending message count %lu",  buf,  0x16u);
        }

        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-outgoingmessage",  APSBundleIdentifier));
        int v9 = -[APSPowerAssertion initWithName:category:holdDuration:]( objc_alloc(&OBJC_CLASS___APSPowerAssertion),  "initWithName:category:holdDuration:",  v8,  206LL,  300.0);
        id v10 = self->_powerAssertion;
        self->_powerAssertion = v9;
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Not taking power assertion for eager outgoing message, interfaces are expensive to use",  buf,  0xCu);
      }
    }
  }

  else if (powerAssertion)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = -[NSMutableArray count](self->_queue, "count");
      *(_DWORD *)buf = 138412546;
      id v12 = self;
      __int16 v13 = 2048;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Releasing power assertion - pending message count %lu",  buf,  0x16u);
    }

    id v6 = self->_powerAssertion;
    self->_powerAssertion = 0LL;
  }

- (void)_recalculateDisableFastDormancy
{
  unsigned int v3 = -[APSOutgoingMessageQueue hasEagerMessages](self, "hasEagerMessages");
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: disabling fast dormancy.",  (uint8_t *)&v6,  0xCu);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUTTelephonyManager sharedInstance](&OBJC_CLASS___CUTTelephonyManager, "sharedInstance"));
    [v5 addFastDormancyDisableToken:@"APSDFastDormancyDisableToken"];
  }

  else
  {
    if (v4)
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: un-disabling fast dormancy.",  (uint8_t *)&v6,  0xCu);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUTTelephonyManager sharedInstance](&OBJC_CLASS___CUTTelephonyManager, "sharedInstance"));
    [v5 removeFastDormancyDisableToken:@"APSDFastDormancyDisableToken"];
  }
}

- (void)_timerFired:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Outgoing message timer fired",  buf,  0xCu);
  }

  id v5 = self;
  objc_sync_enter(v5);
  timer = v5->_timer;
  v5->_timer = 0LL;

  objc_sync_exit(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5->_queue));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v8)
  {
    id v9 = v8;
    id v34 = v4;
    char v35 = 0;
    id v10 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
    uint64_t v11 = *(void *)v38;
    while (1)
    {
      id v12 = 0LL;
      id v36 = v9;
      do
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v7);
        }
        __int16 v13 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sentTimestamp]);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v10[290] date]);
        [v15 timeIntervalSinceDate:v14];
        double v17 = v16;

        if (([v13 wasCancelled] & 1) == 0
          && ([v13 hasTimedOut] & 1) == 0)
        {
          uint64_t v18 = v11;
          __int16 v19 = v5;
          id v20 = v10;
          BOOL v21 = v7;
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 sendTimeoutTime]);
          __int128 v23 = v20;
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v20[290] date]);
          id v25 = [v22 compare:v24];

          if (v25 == (id)-1LL)
          {
            APSAlert(@"Outgoing message timeout");
            id v5 = v19;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v27 = [v13 messageID];
              *(_DWORD *)buf = 138412546;
              v42 = v19;
              __int16 v43 = 2048;
              id v44 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Outgoing message %lu timed out",  buf,  0x16u);
            }

            [v13 setTimedOut:1];
            else {
              __int128 v28 = @"Timeout connecting to server";
            }
            uint64_t v29 = APSError(4LL, v28);
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            -[APSOutgoingMessageQueue _deliverResult:forMessage:](v19, "_deliverResult:forMessage:", v30, v13);
            id v7 = v21;
            id v10 = v23;
            uint64_t v11 = v18;
            id v9 = v36;
            if (([v13 wasSent] & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v31 = [v13 messageID];
                *(_DWORD *)buf = 138412546;
                v42 = v5;
                __int16 v43 = 2048;
                id v44 = v31;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Removing unsent timed out message %lu from queue",  buf,  0x16u);
              }

              -[NSMutableArray removeObject:](v5->_queue, "removeObject:", v13);
            }

            if ([v13 isCritical] && (unint64_t)objc_msgSend(v13, "timeout") >= 0x14)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v32 = [v13 timeout];
                *(_DWORD *)buf = 138412546;
                v42 = v5;
                __int16 v43 = 2048;
                id v44 = v32;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Critical message has timed out. Timeout = %lu. Alerting the delegate.",  buf,  0x16u);
              }

              -[APSOutgoingMessageQueueDelegate outgoingMessageQueue:lateAcknowledgmentForCriticalOutgoingMessage:]( v5->_delegate,  "outgoingMessageQueue:lateAcknowledgmentForCriticalOutgoingMessage:",  v5,  v13);
            }
          }

          else
          {
            id v5 = v19;
            if (-[APSOutgoingMessageQueue _outgoingMessageIsLateCriticalMessage:]( v19,  "_outgoingMessageIsLateCriticalMessage:",  v13))
            {
              APSAlert(@"Critical ack is late");
              id v7 = v21;
              uint64_t v11 = v18;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = [v13 messageID];
                *(_DWORD *)buf = 138412546;
                v42 = v5;
                __int16 v43 = 2048;
                id v44 = v26;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Acknowledgment for critical outgoing message %lu is late",  buf,  0x16u);
              }

              -[APSOutgoingMessageQueue _startCriticalMessageFlushTimerSendingFlush]( v5,  "_startCriticalMessageFlushTimerSendingFlush");
LABEL_36:
              id v10 = v23;
              id v9 = v36;
              goto LABEL_37;
            }

            id v7 = v21;
            uint64_t v11 = v18;
            if (!v14) {
              goto LABEL_36;
            }
            id v10 = v23;
            id v9 = v36;
            if (v17 > v5->_forcedShortTimeoutDuration
              && -[APSOutgoingMessageQueueDelegate shouldForceShortTimeouts]( v5->_delegate,  "shouldForceShortTimeouts"))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                double forcedShortTimeoutDuration = v5->_forcedShortTimeoutDuration;
                *(_DWORD *)buf = 138413314;
                v42 = v5;
                __int16 v43 = 2112;
                id v44 = v13;
                __int16 v45 = 2112;
                id v46 = v14;
                __int16 v47 = 2048;
                double v48 = v17;
                __int16 v49 = 2048;
                double v50 = forcedShortTimeoutDuration;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: %@ sent at %@ (%f ago) has exceeded the forcedShortTimeoutDuration %f and we're enforcing short timeouts!",  buf,  0x34u);
              }

              char v35 = 1;
            }
          }
        }

- (BOOL)_outgoingMessageIsLateCriticalMessage:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_lastReceivedAckOrReconnect));
  [v5 timeIntervalSinceNow];
  double v7 = v6;
  double criticalMessageTimeout = self->_criticalMessageTimeout;

  if ((-[__CFString wasCancelled](v4, "wasCancelled") & 1) != 0
    || (-[__CFString hasTimedOut](v4, "hasTimedOut") & 1) != 0)
  {
    goto LABEL_3;
  }

  BOOL v9 = 0;
  if (-[__CFString isCritical](v4, "isCritical") && v7 + criticalMessageTimeout < 0.0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString timestamp](v4, "timestamp", v7 + criticalMessageTimeout));
    [v11 timeIntervalSinceNow];
    double v13 = v12 + self->_criticalMessageTimeout;

    if (v13 >= 0.0)
    {
LABEL_3:
      BOOL v9 = 0;
      goto LABEL_4;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      double v17 = v4;
      __int16 v18 = 2112;
      __int16 v19 = @"YES";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ isLateCriticalMessage ? %@",  (uint8_t *)&v16,  0x16u);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double lastReceivedAckOrReconnect = self->_lastReceivedAckOrReconnect;
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      int v16 = 138412802;
      double v17 = @"YES";
      __int16 v18 = 2048;
      __int16 v19 = *(const __CFString **)&lastReceivedAckOrReconnect;
      __int16 v20 = 2048;
      uint64_t v21 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "lastAckIsTooOld: %@  lastReceivedAck: %f now: %f",  (uint8_t *)&v16,  0x20u);
    }

    BOOL v9 = 1;
  }

- (void)_startCriticalMessageFlushTimerSendingFlush
{
  if (!self->_criticalMessageKeepAliveTimer)
  {
    unint64_t criticalMessageFlushSize = self->_criticalMessageFlushSize;
    uint64_t v4 = 2 * criticalMessageFlushSize;
    if (criticalMessageFlushSize == 512) {
      uint64_t v4 = 512LL;
    }
    if (criticalMessageFlushSize) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 128LL;
    }
    self->_unint64_t criticalMessageFlushSize = v5;
    -[APSOutgoingMessageQueueDelegate outgoingMessageQueue:requestCriticalMessageFlushWithPaddingLength:]( self->_delegate,  "outgoingMessageQueue:requestCriticalMessageFlushWithPaddingLength:",  self);
    unint64_t v6 = self->_criticalMessageFlushCount + 1;
    self->_unint64_t criticalMessageFlushCount = v6;
    unint64_t v10 = v6;
    APSAlert(@"critKeepAliveCount %lu");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t criticalMessageFlushCount = self->_criticalMessageFlushCount;
      *(_DWORD *)buf = 138412546;
      double v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = criticalMessageFlushCount;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ _criticalMessageFlushCount is now %lu",  buf,  0x16u);
    }

    id v8 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_criticalMessageKeepAliveTimerFired",  0LL,  0LL,  self->_criticalMessageKeepAliveTimerDuration,  v10));
    criticalMessageKeepAliveTimer = self->_criticalMessageKeepAliveTimer;
    self->_criticalMessageKeepAliveTimer = v8;
  }

- (void)_clearCriticalMessageKeepAliveTimerIfAppropriate
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  unsigned int v3 = self->_queue;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      double v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[APSOutgoingMessageQueue _outgoingMessageIsLateCriticalMessage:]( self,  "_outgoingMessageIsLateCriticalMessage:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  (void)v8))
        {

          return;
        }

        double v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  -[APSOutgoingMessageQueue _clearCriticalMessageKeepAliveTimer](self, "_clearCriticalMessageKeepAliveTimer");
  self->_unint64_t criticalMessageFlushCount = 0LL;
  self->_unint64_t criticalMessageFlushSize = 0LL;
}

- (void)_clearCriticalMessageKeepAliveTimer
{
  if (self->_criticalMessageKeepAliveTimer)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      criticalMessageKeepAliveTimer = self->_criticalMessageKeepAliveTimer;
      int v5 = 138412546;
      uint64_t v6 = self;
      __int16 v7 = 2112;
      __int128 v8 = criticalMessageKeepAliveTimer;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ clearingCriticalMessageKeepAliveTimer %@",  (uint8_t *)&v5,  0x16u);
    }

    -[NSTimer invalidate](self->_criticalMessageKeepAliveTimer, "invalidate");
    id v4 = self->_criticalMessageKeepAliveTimer;
    self->_criticalMessageKeepAliveTimer = 0LL;
  }

- (void)_criticalMessageKeepAliveTimerFired
{
  if (self->_criticalMessageFlushCount >= self->_numberOfCriticalMessageFlushesBeforeDisconnecting)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    unsigned int v3 = self->_queue;
    id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          __int128 v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
          if (-[APSOutgoingMessageQueue _outgoingMessageIsLateCriticalMessage:]( self,  "_outgoingMessageIsLateCriticalMessage:",  v8,  (void)v10))
          {
            id v9 = v8;

            self->_unint64_t criticalMessageFlushCount = 0LL;
            self->_unint64_t criticalMessageFlushSize = 0LL;
            if (v9)
            {
              -[APSOutgoingMessageQueueDelegate outgoingMessageQueue:lateAcknowledgmentForCriticalOutgoingMessage:]( self->_delegate,  "outgoingMessageQueue:lateAcknowledgmentForCriticalOutgoingMessage:",  self,  v9);
            }

            return;
          }
        }

        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
        if (v5) {
          continue;
        }
        break;
      }
    }

    self->_unint64_t criticalMessageFlushCount = 0LL;
    self->_unint64_t criticalMessageFlushSize = 0LL;
  }

  else
  {
    -[APSOutgoingMessageQueue _startCriticalMessageFlushTimerSendingFlush]( self,  "_startCriticalMessageFlushTimerSendingFlush");
  }

- (BOOL)hasPendingMessages
{
  return -[NSMutableArray count](self->_queue, "count") != 0LL;
}

- (BOOL)hasEagerMessages
{
  uint64_t v6 = 0LL;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005C82C;
  v5[3] = &unk_10011F428;
  v5[4] = &v6;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](queue, "enumerateObjectsWithOptions:usingBlock:", 2LL, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setNumberOfCriticalMessageFlushesBeforeDisconnecting:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    unint64_t v6 = (unint64_t)[v4 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 3LL;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numberOfCriticalMessageFlushesBeforeDisconnecting = self->_numberOfCriticalMessageFlushesBeforeDisconnecting;
    int v8 = 138413058;
    char v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = numberOfCriticalMessageFlushesBeforeDisconnecting;
    __int16 v12 = 2048;
    unint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ setNumberOfCriticalMessageFlushesBeforeDisconnecting: changing from %lu to %lu (got number %@)",  (uint8_t *)&v8,  0x2Au);
  }

  self->_unint64_t numberOfCriticalMessageFlushesBeforeDisconnecting = v6;
}

- (void)setCriticalMessageKeepAliveTimerDuration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    if (v6 < 2.0) {
      double v7 = 2.0;
    }
    else {
      double v7 = v6;
    }
  }

  else
  {
    double v7 = 10.0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double criticalMessageKeepAliveTimerDuration = self->_criticalMessageKeepAliveTimerDuration;
    int v9 = 138413058;
    __int16 v10 = self;
    __int16 v11 = 2048;
    double v12 = criticalMessageKeepAliveTimerDuration;
    __int16 v13 = 2048;
    double v14 = v7;
    __int16 v15 = 2112;
    int v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ setCriticalMessageKeepAliveTimerDuration: changing from %f to %f (got number %@)",  (uint8_t *)&v9,  0x2Au);
  }

  self->_double criticalMessageKeepAliveTimerDuration = v7;
}

- (void)setCriticalMessageTimeout:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    if (v6 < 2.0) {
      double v7 = 2.0;
    }
    else {
      double v7 = v6;
    }
  }

  else
  {
    double v7 = 10.0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double criticalMessageTimeout = self->_criticalMessageTimeout;
    int v9 = 138413058;
    __int16 v10 = self;
    __int16 v11 = 2048;
    double v12 = criticalMessageTimeout;
    __int16 v13 = 2048;
    double v14 = v7;
    __int16 v15 = 2112;
    int v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ setCriticalMessageTimeout: changing from %f to %f (got number %@)",  (uint8_t *)&v9,  0x2Au);
  }

  self->_double criticalMessageTimeout = v7;
}

- (void)setForcedShortTimeoutInterval:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    if (v6 < 2.0) {
      double v7 = 2.0;
    }
    else {
      double v7 = v6;
    }
  }

  else
  {
    double v7 = 2.0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double forcedShortTimeoutDuration = self->_forcedShortTimeoutDuration;
    int v9 = 138413058;
    __int16 v10 = self;
    __int16 v11 = 2048;
    double v12 = forcedShortTimeoutDuration;
    __int16 v13 = 2048;
    double v14 = v7;
    __int16 v15 = 2112;
    int v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ setForcedShortTimeoutInterval: changing from %f to %f (got number %@)",  (uint8_t *)&v9,  0x2Au);
  }

  self->_double forcedShortTimeoutDuration = v7;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_queue, "count");
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v10 = a3;
  if (-[NSMutableArray count](self->_queue, "count") || self->_numberQueued || self->_numberAcked)
  {
    unint64_t numberQueued = self->_numberQueued;
    unint64_t numberAcked = self->_numberAcked;
    double v6 = @"Some reverse pushes not acknowledged";
    if (numberAcked == numberQueued) {
      double v6 = @"Ok";
    }
    if (numberAcked) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = numberQueued == 0;
    }
    if (v7) {
      int v8 = v6;
    }
    else {
      int v8 = @"Unable to send reverse pushes";
    }
    [v10 appendDescription:@"reverse push send queue status" stringValue:v8];
    [v10 pushIndent];
    [v10 appendDescription:@"last reverse push queued" timeIntervalValue:self->_lastNotificationQueued];
    unint64_t v9 = self->_numberQueued;
    if (v9) {
      [v10 appendDescription:@"send success rate" successRateWithSuccessCount:self->_numberAcked failureCount:v9 - self->_numberAcked];
    }
    if (self->_numberAcked) {
      [v10 appendDescription:@"last reverse push acknowledged" timeIntervalValue:self->_lastNotificationAcked];
    }
    [v10 popIndent];
  }
}

- (BOOL)powerOptimizationsForExpensiveNetworkingDisabled
{
  return self->_powerOptimizationsForExpensiveNetworkingDisabled;
}

- (void)setPowerOptimizationsForExpensiveNetworkingDisabled:(BOOL)a3
{
  self->_powerOptimizationsForExpensiveNetworkingDisabled = a3;
}

- (void).cxx_destruct
{
}

@end