@interface IDSSocketPairConnection
- (BOOL)_processIncomingMessage:(id)a3;
- (BOOL)_queueNextOutgoingData;
- (BOOL)hasEndedSession;
- (BOOL)isConnected;
- (BOOL)isEmpty;
- (BOOL)sendDataMessage:(id)a3;
- (BOOL)sendDataMessage:(id)a3 canFragment:(BOOL)a4;
- (IDSSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 priority:(int64_t)a6 connectionID:(id)a7 linkType:(unint64_t)a8;
- (IDSStallDetector)outgoingStallDetector;
- (NSSet)inFlightMessages;
- (NSString)connectionID;
- (double)lastSocketActivityTime;
- (int64_t)_read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)inFlightMessageCount;
- (unint64_t)inFlightMessageCountLowWaterMark;
- (unsigned)fragmentationSize;
- (unsigned)maxAllowedMessageSize;
- (void)_callDelegateWithBlock:(id)a3;
- (void)_endSession;
- (void)_processBytesAvailable;
- (void)_sendToConnectedSocket;
- (void)dealloc;
- (void)endSession;
- (void)processStoredIncomingMessage:(id)a3;
- (void)removePendingMessagesForProtectionClass:(unsigned int)a3;
- (void)setConnectionID:(id)a3;
- (void)setFragmentationSize:(unsigned int)a3;
- (void)setHasEndedSession:(BOOL)a3;
- (void)setInFlightMessageCountLowWaterMark:(unint64_t)a3;
- (void)setMaxAllowedMessageSize:(unsigned int)a3;
- (void)setNotifyWhenConnectionReceivesBytes:(BOOL)a3;
- (void)setOTREncryptionBlock:(id)a3 decryptionBlock:(id)a4;
- (void)setOutgoingStallDetector:(id)a3;
- (void)start;
@end

@implementation IDSSocketPairConnection

- (IDSSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 priority:(int64_t)a6 connectionID:(id)a7 linkType:(unint64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IDSSocketPairConnection;
  v18 = -[IDSSocketPairConnection init](&v28, "init");
  if (v18)
  {
    if (IDSTransportThreadInitWithPriority(a6))
    {
      if ((a3 & 0x80000000) == 0)
      {
        objc_storeWeak((id *)&v18->_delegate, v16);
        objc_storeStrong((id *)&v18->_delegateQueue, a4);
        v18->_lock._os_unfair_lock_opaque = 0;
        v18->_lastDateCheck = 0.0;
        v18->_int connectedSocket = a3;
        v18->_writeSocketIsResumed = 1;
        v18->_hasEndedSession = 0;
        v18->_priority = a6;
        v18->_maxAllowedMessageSize = -1;
        objc_storeStrong((id *)&v18->_connectionID, a7);
        v18->_linkType = a8;
        uint64_t v19 = OSLogHandleForIDSCategory("FTMessageDelivery");
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int connectedSocket = v18->_connectedSocket;
          *(_DWORD *)buf = 67109120;
          LODWORD(v30) = connectedSocket;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Created with {socket:%d}", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled(v22))
        {
          if (IMShouldLog(@"IDS", 0LL)) {
            IMLogString( 0LL,  @"IDS",  @"IDSAgent",  @"FTMessageDelivery",  @"Created with {socket:%d}");
          }
        }

        goto LABEL_11;
      }

      uint64_t v24 = OSLogHandleForIDSCategory("FTMessageDelivery");
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@ instance created with a dead file descriptor!",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v26))
      {
        if (MarcoShouldLog(@"IDSAgent")) {
          MarcoLog( 0LL,  @"IDSAgent",  @"SPConnection",  @"%@ instance created with a dead file descriptor!");
        }
        if (IMShouldLog(@"IDS", 0LL)) {
          IMLogString( 0LL,  @"IDS",  @"IDSAgent",  @"FTMessageDelivery",  @"%@ instance created with a dead file descriptor!");
        }
      }
    }

    v23 = 0LL;
    goto LABEL_20;
  }

- (void)start
{
  int64_t priority = self->_priority;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100045540;
  v4[3] = &unk_1008F7948;
  v4[4] = self;
  IDSTransportThreadAddBlockWithPriority(priority, v4);
}

- (void)dealloc
{
  if (!-[IDSSocketPairConnection hasEndedSession](self, "hasEndedSession"))
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog socketPairConnection](&OBJC_CLASS___IDSFoundationLog, "socketPairConnection"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_100695DF4(v3);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSSocketPairConnection;
  -[IDSSocketPairConnection dealloc](&v4, "dealloc");
}

- (void)endSession
{
  uint64_t v3 = OSLogHandleForIDSCategory("FTMessageDelivery");
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138412546;
    id v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ endSession at %@!", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v6))
  {
    if (MarcoShouldLog(@"IDSAgent"))
    {
      v13 = self;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
      MarcoLog(0LL, @"IDSAgent", @"SPConnection", @"%@ endSession at %@!");
    }

    if (IMShouldLog(@"IDS", 0LL))
    {
      v13 = self;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
      IMLogString(0LL, @"IDS", @"IDSAgent", @"FTMessageDelivery", @"%@ endSession at %@!");
    }
  }

  IDSTransportThreadInitWithPriority(self->_priority);
  int64_t priority = self->_priority;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100045974;
  v15[3] = &unk_1008F7948;
  v15[4] = self;
  IDSTransportThreadAddSyncBlockWithPriority(priority, v15);
  if (self->_outgoingStallDetector)
  {
    uint64_t v8 = OSLogHandleForTransportCategory("SPConnection");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      outgoingStallDetector = self->_outgoingStallDetector;
      *(_DWORD *)buf = 134217984;
      id v17 = (IDSSocketPairConnection *)outgoingStallDetector;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%p: reset the stall detector", buf, 0xCu);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12 && _IDSShouldLogTransport(v12))
    {
      v13 = self->_outgoingStallDetector;
      _IDSLogTransport(@"SPConnection", @"IDS", @"%p: reset the stall detector");
      if (_IDSShouldLog(0LL, @"SPConnection"))
      {
        v13 = self->_outgoingStallDetector;
        _IDSLogV(0LL, @"IDSFoundation", @"SPConnection", @"%p: reset the stall detector");
      }
    }

    -[IDSStallDetector reset](self->_outgoingStallDetector, "reset", v13, v14);
  }

- (BOOL)isConnected
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isConnected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unsigned)fragmentationSize
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_fragmentationSize;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unint64_t)inFlightMessageCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[NSMutableArray count](self->_outgoingMessageArray, "count");
  os_unfair_lock_unlock(p_lock);
  return (unint64_t)v4;
}

- (unint64_t)inFlightMessageCountLowWaterMark
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t inFlightMessageCountLowWaterMark = self->_inFlightMessageCountLowWaterMark;
  os_unfair_lock_unlock(p_lock);
  return inFlightMessageCountLowWaterMark;
}

- (BOOL)isEmpty
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSData length](self->_outgoingData, "length")) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = -[NSMutableArray count](self->_outgoingMessageArray, "count") == 0LL;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)lastSocketActivityTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lastSocketActivityTime = self->_lastSocketActivityTime;
  os_unfair_lock_unlock(p_lock);
  return lastSocketActivityTime;
}

- (NSSet)inFlightMessages
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  outgoingMessageArray = self->_outgoingMessageArray;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100045BDC;
  v8[3] = &unk_1008F7970;
  id v6 = v3;
  id v9 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](outgoingMessageArray, "enumerateObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v6;
}

- (void)setFragmentationSize:(unsigned int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_fragmentationSize = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setInFlightMessageCountLowWaterMark:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t inFlightMessageCountLowWaterMark = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100045D90;
      v7[3] = &unk_1008F6358;
      id v9 = v4;
      id v8 = WeakRetained;
      dispatch_async(delegateQueue, v7);
    }
  }
}

- (int64_t)_read:(char *)a3 maxLength:(unint64_t)a4
{
  ssize_t v5 = recv(self->_connectedSocket, a3, a4, 0);
  int64_t v6 = v5;
  if (v5 < 0)
  {
    int v11 = *__error();
    uint64_t v12 = OSLogHandleForIDSCategory("FTMessageDelivery");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int connectedSocket = self->_connectedSocket;
      *(_DWORD *)buf = 67109376;
      int v18 = v11;
      __int16 v19 = 1024;
      int v20 = connectedSocket;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error %d received on {socket:%d}", buf, 0xEu);
    }

    if (os_log_shim_legacy_logging_enabled(v15))
    {
      if (IMShouldLog(@"IDS", 0LL)) {
        IMLogString( 0LL,  @"IDS",  @"IDSAgent",  @"FTMessageDelivery",  @"Error %d received on {socket:%d}");
      }
    }
  }

  else if (!v5)
  {
    uint64_t v7 = OSLogHandleForIDSCategory("FTMessageDelivery");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_connectedSocket;
      *(_DWORD *)buf = 67109120;
      int v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Remote side closed the connection, cleaning up {socket:%d}",  buf,  8u);
    }

    if (os_log_shim_legacy_logging_enabled(v10))
    {
      if (MarcoShouldLog(@"IDSAgent")) {
        MarcoLog( 0LL,  @"IDSAgent",  @"SPConnection",  @"Remote side closed the connection, cleaning up {socket:%d}");
      }
      if (IMShouldLog(@"IDS", 0LL)) {
        IMLogString( 0LL,  @"IDS",  @"IDSAgent",  @"FTMessageDelivery",  @"Remote side closed the connection, cleaning up {socket:%d}");
      }
    }
  }

  return v6;
}

- (void)removePendingMessagesForProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void **)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = OSLogHandleForTransportCategory("SPConnection");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = (_DWORD)v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing pending OTR messages for protection class %u.",  buf,  8u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      id v18 = v3;
      _IDSLogTransport( @"SPConnection",  @"IDS",  @"Removing pending OTR messages for protection class %u.");
      if (_IDSShouldLog(0LL, @"SPConnection"))
      {
        id v18 = v3;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"SPConnection",  @"Removing pending OTR messages for protection class %u.");
      }
    }
  }

  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  outgoingMessageArray = self->_outgoingMessageArray;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100046354;
  v20[3] = &unk_1008F7998;
  int v22 = (int)v3;
  uint64_t v12 = v10;
  v21 = v12;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:]( outgoingMessageArray,  "enumerateObjectsWithOptions:usingBlock:",  2LL,  v20);
  if (-[NSMutableIndexSet count](v12, "count"))
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_outgoingMessageArray, "removeObjectsAtIndexes:", v12);
    uint64_t v13 = OSLogHandleForTransportCategory("SPConnection");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = -[NSMutableIndexSet count](v12, "count");
      *(_DWORD *)buf = 134217984;
      id v24 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Removed %lu pending OTR messages.",  buf,  0xCu);
    }

    uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
    if ((_DWORD)v17)
    {
      if (_IDSShouldLogTransport(v17))
      {
        id v18 = -[NSMutableIndexSet count](v12, "count");
        _IDSLogTransport(@"SPConnection", @"IDS", @"Removed %lu pending OTR messages.");
        if (_IDSShouldLog(0LL, @"SPConnection"))
        {
          id v18 = -[NSMutableIndexSet count](v12, "count", v18);
          _IDSLogV(0LL, @"IDSFoundation", @"SPConnection", @"Removed %lu pending OTR messages.");
        }
      }
    }
  }

  if ((unint64_t)-[NSMutableArray count](self->_outgoingMessageArray, "count", v18) <= self->_inFlightMessageCountLowWaterMark)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10004646C;
    v19[3] = &unk_1008F79C0;
    v19[4] = self;
    -[IDSSocketPairConnection _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v19);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)processStoredIncomingMessage:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = v4;
  uint64_t v6 = OSLogHandleForTransportCategory("SPConnection");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v16 = [v5 encrypted];
    __int16 v17 = 1024;
    unsigned int v18 = [v5 sequenceNumber];
    __int16 v19 = 1024;
    unsigned int v20 = [v5 streamID];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Process stored data message (Encrypted:%u, SN:%u, StreamID:%u).",  buf,  0x14u);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      id v10 = [v5 encrypted];
      id v13 = [v5 sequenceNumber];
      uint64_t v14 = [v5 streamID];
      id v12 = v10;
      _IDSLogTransport( @"SPConnection",  @"IDS",  @"Process stored data message (Encrypted:%u, SN:%u, StreamID:%u).");
      if (_IDSShouldLog(0LL, @"SPConnection"))
      {
        id v11 = objc_msgSend(v5, "encrypted", v10, v13, v14);
        id v13 = [v5 sequenceNumber];
        uint64_t v14 = [v5 streamID];
        id v12 = v11;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"SPConnection",  @"Process stored data message (Encrypted:%u, SN:%u, StreamID:%u).");
      }
    }
  }

  -[IDSSocketPairConnection _processIncomingMessage:](self, "_processIncomingMessage:", v5, v12, v13, v14);
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_processIncomingMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  id v6 = v4;
  unsigned int v7 = [v6 command];
  id v8 = v6;
  if (v7 == 24)
  {
    kdebug_trace(722010296, [v6 sequenceNumber], 0, 0, 0);
    decryptionBlock = (uint64_t (**)(id, id))self->_decryptionBlock;
    if (decryptionBlock
      && (v10 = decryptionBlock[2](decryptionBlock, v6), (id v11 = (void *)objc_claimAutoreleasedReturnValue(v10)) != 0LL))
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[IDSSocketPairMessage messageWithData:](&OBJC_CLASS___IDSSocketPairMessage, "messageWithData:", v11));
    }

    else
    {
      id v8 = 0LL;
      id v11 = v6;
    }
  }

  if (v8)
  {
    if ([v8 command] == 21)
    {
      if (!self->_incomingDataFragments)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        incomingDataFragments = self->_incomingDataFragments;
        self->_incomingDataFragments = Mutable;
      }

      id v14 = v8;
      unsigned int v15 = [v14 fragmentIndex];
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v14 fragmentedMessageID]));
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_incomingDataFragments, "objectForKey:", v16));
      if (!v17)
      {
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v14 totalFragmentCount]));
        -[NSMutableDictionary setObject:forKey:](self->_incomingDataFragments, "setObject:forKey:", v17, v16);
      }

      [v17 addObject:v14];
      id v18 = [v17 count];
      if (v18 != (id)[v14 totalFragmentCount])
      {

        goto LABEL_20;
      }

      id v8 = +[IDSSocketPairFragmentedMessage createOriginalMessageFromFragmentedMessages:]( &OBJC_CLASS___IDSSocketPairFragmentedMessage,  "createOriginalMessageFromFragmentedMessages:",  v17);

      -[NSMutableDictionary removeObjectForKey:](self->_incomingDataFragments, "removeObjectForKey:", v16);
      if (!v8)
      {
        uint64_t v34 = OSLogHandleForTransportCategory("SPConnection");
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = [v14 totalFragmentCount];
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "FragmentedMessage: can't reassemble message from %u pieces",  buf,  8u);
        }

        uint64_t v37 = os_log_shim_legacy_logging_enabled(v36);
        if ((_DWORD)v37)
        {
          if (_IDSShouldLogTransport(v37))
          {
            id v39 = [v14 totalFragmentCount];
            _IDSLogTransport( @"SPConnection",  @"IDS",  @"FragmentedMessage: can't reassemble message from %u pieces");
            if (_IDSShouldLog(0LL, @"SPConnection"))
            {
              objc_msgSend(v14, "totalFragmentCount", v39);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"SPConnection",  @"FragmentedMessage: can't reassemble message from %u pieces");
            }
          }
        }

        currentMessageData = self->_currentMessageData;
        self->_currentMessageData = 0LL;

        -[IDSSocketPairConnection endSession](self, "endSession");
        BOOL v32 = 0;
        uint64_t v26 = v14;
        id v14 = 0LL;
        goto LABEL_29;
      }
    }

    else
    {
      unsigned int v15 = 0;
    }

    __int16 v19 = -[NSData initWithData:](objc_alloc(&OBJC_CLASS___NSData), "initWithData:", self->_currentMessageData);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100046C94;
    v40[3] = &unk_1008F79E8;
    id v14 = v8;
    id v41 = v14;
    v42 = self;
    v43 = v19;
    -[IDSSocketPairConnection _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v40);
  }

  else
  {
    unsigned int v15 = 0;
    id v14 = 0LL;
  }

- (void)_processBytesAvailable
{
  *(double *)&uint64_t v3 = COERCE_DOUBLE((id)-[IDSSocketPairConnection _read:maxLength:]( self,  "_read:maxLength:",  __b,  0x2000LL));
  uint64_t v4 = OSLogHandleForIDSCategory("FTMessageDelivery");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)unsigned int v53 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_processBytesAvailable: read %d bytes", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled(v6))
  {
    if (MarcoShouldLog(@"IDSAgent"))
    {
      double v49 = *(double *)&v3;
      MarcoLog(0LL, @"IDSAgent", @"SPConnection", @"_processBytesAvailable: read %d bytes");
    }

    if (IMShouldLog(@"IDS", 0LL))
    {
      double v49 = *(double *)&v3;
      IMLogString( 0LL,  @"IDS",  @"IDSAgent",  @"FTMessageDelivery",  @"_processBytesAvailable: read %d bytes");
    }
  }

  if (v3 < 0)
  {
    uint64_t v34 = OSLogHandleForIDSCategory("FTMessageDelivery");
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Error when receiving bytes, closing connection",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v36))
    {
      if (IMShouldLog(@"IDS", 0LL)) {
        IMLogString( 0LL,  @"IDS",  @"IDSAgent",  @"FTMessageDelivery",  @"Error when receiving bytes, closing connection");
      }
    }

    goto LABEL_55;
  }

  if (*(double *)&v3 == 0.0)
  {
    uint64_t v37 = OSLogHandleForIDSCategory("FTMessageDelivery");
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Remote side closed the connection, cleaning up",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v39))
    {
      if (IMShouldLog(@"IDS", 0LL)) {
        IMLogString( 0LL,  @"IDS",  @"IDSAgent",  @"FTMessageDelivery",  @"Remote side closed the connection, cleaning up");
      }
    }

- (BOOL)_queueNextOutgoingData
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_outgoingMessageArray, "firstObject"));
  if (!v3) {
    goto LABEL_18;
  }
  -[NSMutableArray removeObjectAtIndex:](self->_outgoingMessageArray, "removeObjectAtIndex:", 0LL);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___IDSSocketPairMessage, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    if ((objc_opt_isKindOfClass(v3, v12) & 1) != 0)
    {
      id v13 = v3;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"remainingFragments"]);
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
      [v14 removeObjectAtIndex:0];
      if (v48)
      {
        unsigned int v51 = [v48 fragmentIndex];
        unsigned int v15 = (id)CFDictionaryGetValue( (CFDictionaryRef)v13,  @"originalMessage");
        if ([v15 command] == 24)
        {
          id v8 = v15;
          unsigned int v50 = [v8 protectionClass];
          unsigned int v49 = [v8 priority];
          unsigned int v47 = [v8 streamID];
          unsigned int v53 = [v8 sequenceNumber];
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topic]);
          connectionID = self->_connectionID;
          if (connectionID) {
            __int16 v17 = sub_100265688(v49, v50, (uint64_t)connectionID);
          }
          else {
            __int16 v17 = sub_100265648(v49, v50);
          }
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v17);
          if ([v8 shouldEncrypt])
          {
            encryptionBlock = (uint64_t (**)(id, void *, void *))self->_encryptionBlock;
            if (encryptionBlock)
            {
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v48 underlyingData]);
              uint64_t v35 = encryptionBlock[2](encryptionBlock, v34, v20);
              encryptionBlock = (uint64_t (**)(id, void *, void *))objc_claimAutoreleasedReturnValue(v35);
            }

            uint64_t v52 = 1LL;
          }

          else
          {
            encryptionBlock = (uint64_t (**)(id, void *, void *))objc_claimAutoreleasedReturnValue([v48 underlyingData]);
            uint64_t v52 = 0LL;
          }
        }

        else
        {
          BOOL v32 = (NSData *)objc_claimAutoreleasedReturnValue([v48 underlyingData]);
          outgoingData = self->_outgoingData;
          self->_outgoingData = v32;

          encryptionBlock = 0LL;
          id v8 = 0LL;
          unsigned int v47 = 0;
          uint64_t v52 = 0LL;
          unsigned int v53 = 0;
          uint64_t v20 = 0LL;
          uint64_t v9 = 0LL;
          unsigned int v49 = 0;
          unsigned int v50 = 3;
        }

        int v30 = 1;
      }

      else
      {
        unsigned int v51 = 0;
        uint64_t v52 = 0LL;
        encryptionBlock = 0LL;
        id v8 = 0LL;
        unsigned int v47 = 0;
        unsigned int v53 = 0;
        uint64_t v20 = 0LL;
        uint64_t v9 = 0LL;
        int v30 = 0;
        unsigned int v49 = 0;
        unsigned int v50 = 3;
      }

      if ([v14 count])
      {
        -[NSMutableArray addObject:](self->_outgoingMessageArray, "addObject:", v13);
        id v7 = 0LL;
      }

      else
      {
        id v7 = (id)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"originalMessage"]);
      }

      goto LABEL_40;
    }

    uint64_t v22 = OSLogHandleForTransportCategory("SPConnection");
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "unknown object in _outgoingMessageArray",  buf,  2u);
    }

    uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
    if ((_DWORD)v25)
    {
      if (_IDSShouldLogTransport(v25))
      {
        _IDSLogTransport(@"SPConnection", @"IDS", @"unknown object in _outgoingMessageArray");
      }
    }

- (void)_sendToConnectedSocket
{
  self->_isConnected = 1;
  if (self->_connectedSocket < 0)
  {
    uint64_t v15 = OSLogHandleForTransportCategory("SPConnection");
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Connected socket closed, cannot send data, cleaning up...",  v48,  2u);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
    if ((_DWORD)v18)
    {
      if (_IDSShouldLogTransport(v18))
      {
        _IDSLogTransport( @"SPConnection",  @"IDS",  @"Connected socket closed, cannot send data, cleaning up...");
        if (_IDSShouldLog(0LL, @"SPConnection")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"SPConnection",  @"Connected socket closed, cannot send data, cleaning up...");
        }
      }
    }

    goto LABEL_21;
  }

  if (-[NSData length](self->_outgoingData, "length")) {
    goto LABEL_3;
  }
  if (-[NSMutableArray count](self->_outgoingMessageArray, "count"))
  {
    if (-[IDSSocketPairConnection _queueNextOutgoingData](self, "_queueNextOutgoingData"))
    {
LABEL_3:
      uint64_t v3 = -[NSData bytes](self->_outgoingData, "bytes");
      NSUInteger v4 = -[NSData length](self->_outgoingData, "length");
      ssize_t v5 = send(self->_connectedSocket, &v3[self->_currentOutgoingDataIndex], v4 - self->_currentOutgoingDataIndex, 0);
      if (v5 < 0)
      {
        if (*__error() == 35)
        {
          uint64_t v23 = OSLogHandleForIDSCategory("FTMessageDelivery");
          uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int connectedSocket = self->_connectedSocket;
            *(_DWORD *)uint64_t v48 = 67109120;
            *(_DWORD *)&v48[4] = connectedSocket;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "{socket:%d} timeout, ignoring ...",  v48,  8u);
          }

          if (os_log_shim_legacy_logging_enabled(v26))
          {
            if (IMShouldLog(@"IDS", 0LL)) {
              IMLogString( 0LL,  @"IDS",  @"IDSAgent",  @"FTMessageDelivery",  @"{socket:%d} timeout, ignoring ...");
            }
          }
        }

        else
        {
          uint64_t v32 = *__error();
          uint64_t v33 = OSLogHandleForTransportCategory("SPConnection");
          uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int v35 = self->_connectedSocket;
            *(_DWORD *)uint64_t v48 = 67109376;
            *(_DWORD *)&v48[4] = v32;
            *(_WORD *)&v48[8] = 1024;
            *(_DWORD *)&v48[10] = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "got send error %d, cleaning up {socket:%d} ...",  v48,  0xEu);
          }

          uint64_t v37 = os_log_shim_legacy_logging_enabled(v36);
          if ((_DWORD)v37)
          {
            if (_IDSShouldLogTransport(v37))
            {
              uint64_t v38 = v32;
              uint64_t v39 = self->_connectedSocket;
              _IDSLogTransport( @"SPConnection",  @"IDS",  @"got send error %d, cleaning up {socket:%d} ...");
              if (_IDSShouldLog(0LL, @"SPConnection"))
              {
                uint64_t v38 = v32;
                uint64_t v39 = self->_connectedSocket;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"SPConnection",  @"got send error %d, cleaning up {socket:%d} ...");
              }
            }
          }

          -[IDSSocketPairConnection _endSession](self, "_endSession", v38, v39);
        }
      }

      else
      {
        ssize_t v6 = v5;
        unint64_t v73 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v71 = v7;
        __int128 v72 = v7;
        __int128 v69 = v7;
        __int128 v70 = v7;
        __int128 v67 = v7;
        __int128 v68 = v7;
        __int128 v65 = v7;
        __int128 v66 = v7;
        __int128 v63 = v7;
        __int128 v64 = v7;
        __int128 v61 = v7;
        __int128 v62 = v7;
        __int128 v59 = v7;
        __int128 v60 = v7;
        __int128 v57 = v7;
        __int128 v58 = v7;
        __int128 v55 = v7;
        __int128 v56 = v7;
        __int128 v53 = v7;
        __int128 v54 = v7;
        __int128 v52 = v7;
        __int128 v50 = v7;
        __int128 v51 = v7;
        *(_OWORD *)uint64_t v48 = v7;
        __int128 v49 = v7;
        socklen_t v40 = 408;
        if (!getsockopt(self->_connectedSocket, 6, 512, v48, &v40))
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance"));
          [v8 IDSSocketPairConnectionTCPInfoLinkType:self->_linkType currentRTT:DWORD1(v49) bandwidth:*(void *)((char *)&v56 + 4)];
        }

        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog socketPairConnection]( &OBJC_CLASS___IDSFoundationLog,  "socketPairConnection"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          NSUInteger v10 = -[NSData length](self->_outgoingData, "length");
          int v11 = self->_connectedSocket;
          *(_DWORD *)buf = 134218496;
          ssize_t v43 = v6;
          __int16 v44 = 2048;
          NSUInteger v45 = v10;
          __int16 v46 = 1024;
          int v47 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sent %ld bytes. Remaining outgoingData %lu {socket:%d}",  buf,  0x1Cu);
        }

        if (qword_1009BE848 != -1) {
          dispatch_once(&qword_1009BE848, &stru_1008F7A08);
        }
        self->_double lastSocketActivityTime = *(double *)&qword_1009BE850 * (double)mach_continuous_time();
        unint64_t v12 = self->_currentOutgoingDataIndex + v6;
        self->_currentOutgoingDataIndex = v12;
        if (v12 == v4)
        {
          outgoingData = self->_outgoingData;
          self->_outgoingData = 0LL;

          self->_currentOutgoingDataIndex = 0LL;
        }

        if (v6)
        {
          outgoingStallDetector = self->_outgoingStallDetector;
          if (outgoingStallDetector) {
            -[IDSStallDetector produceBytes:](outgoingStallDetector, "produceBytes:", v6);
          }
        }
      }

      return;
    }

    uint64_t v19 = OSLogHandleForTransportCategory("SPConnection");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Failed to queue outgoing data - possible message fragmentation issue",  v48,  2u);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        _IDSLogTransport( @"SPConnection",  @"IDS",  @"Failed to queue outgoing data - possible message fragmentation issue");
        if (_IDSShouldLog(0LL, @"SPConnection")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"SPConnection",  @"Failed to queue outgoing data - possible message fragmentation issue");
        }
      }
    }

- (BOOL)sendDataMessage:(id)a3
{
  return -[IDSSocketPairConnection sendDataMessage:canFragment:](self, "sendDataMessage:canFragment:", a3, 0LL);
}

- (BOOL)sendDataMessage:(id)a3 canFragment:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 underlyingData]);
  }
  id v8 = (void *)v7;
  os_unfair_lock_lock(&self->_lock);
  if (self->_outgoingMessageArray)
  {
    if (!v4) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    outgoingMessageArray = self->_outgoingMessageArray;
    self->_outgoingMessageArray = v9;

    if (!v4) {
      goto LABEL_11;
    }
  }

  if (self->_fragmentationSize && (unint64_t)[v8 length] > self->_fragmentationSize)
  {
    id v11 = +[IDSSocketPairFragmentedMessage createMessageFragmentsFromOriginalMessage:withFragmentedMessageID:fragmentSize:]( &OBJC_CLASS___IDSSocketPairFragmentedMessage,  "createMessageFragmentsFromOriginalMessage:withFragmentedMessageID:fragmentSize:",  v8,  self->_currentOutgoingFragmentedMessageID);
    v18[0] = @"originalMessage";
    v18[1] = @"remainingFragments";
    v19[0] = v6;
    v19[1] = v11;
    v18[2] = @"totalFragmentCount";
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v11 count]));
    v19[2] = v12;
    v18[3] = @"fragmentedMessageID";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_currentOutgoingFragmentedMessageID));
    v19[3] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));

    -[NSMutableArray addObject:](self->_outgoingMessageArray, "addObject:", v14);
    ++self->_currentOutgoingFragmentedMessageID;

    goto LABEL_12;
  }

- (void)_endSession
{
  if ((self->_connectedSocket & 0x80000000) == 0)
  {
    uint64_t v3 = OSLogHandleForTransportCategory("SPConnection");
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int connectedSocket = self->_connectedSocket;
      *(_DWORD *)buf = 138412546;
      unint64_t v12 = self;
      __int16 v13 = 1024;
      int v14 = connectedSocket;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ removing {socket:%d} from transport thread!",  buf,  0x12u);
    }

    uint64_t v7 = os_log_shim_legacy_logging_enabled(v6);
    if ((_DWORD)v7)
    {
      if (_IDSShouldLogTransport(v7))
      {
        id v8 = self;
        uint64_t v9 = self->_connectedSocket;
        _IDSLogTransport(@"SPConnection", @"IDS", @"%@ removing {socket:%d} from transport thread!");
        if (_IDSShouldLog(0LL, @"SPConnection"))
        {
          id v8 = self;
          uint64_t v9 = self->_connectedSocket;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"SPConnection",  @"%@ removing {socket:%d} from transport thread!");
        }
      }
    }

    IDSTransportThreadInitWithPriority(self->_priority);
    IDSTransportThreadRemoveSocketWithPriority(self->_connectedSocket, self->_priority);
    self->_writeSocketIsResumed = 0;
    shutdown(self->_connectedSocket, 2);
    close(self->_connectedSocket);
    self->_int connectedSocket = -1;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100048A5C;
    v10[3] = &unk_1008F79C0;
    v10[4] = self;
    -[IDSSocketPairConnection _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v10);
  }

  -[IDSSocketPairConnection setHasEndedSession:](self, "setHasEndedSession:", 1LL, v8, v9);
}

- (void)setNotifyWhenConnectionReceivesBytes:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_notifyWhenConnectionReceivesBytes = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setOTREncryptionBlock:(id)a3 decryptionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v8 = [v6 copy];
  id encryptionBlock = self->_encryptionBlock;
  self->_id encryptionBlock = v8;

  id v10 = [v7 copy];
  id decryptionBlock = self->_decryptionBlock;
  self->_id decryptionBlock = v10;

  uint64_t v12 = OSLogHandleForTransportCategory("SPConnection");
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_retainBlock(v6);
    id v15 = objc_retainBlock(v7);
    *(_DWORD *)buf = 134218496;
    uint64_t v23 = self;
    __int16 v24 = 2048;
    id v25 = v14;
    __int16 v26 = 2048;
    id v27 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SocketPairConnection (%p) add OTR blocks (enc:%p dec:%p).",  buf,  0x20u);
  }

  uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
  if ((_DWORD)v17)
  {
    if (_IDSShouldLogTransport(v17))
    {
      id v18 = objc_retainBlock(v6);
      id v20 = objc_retainBlock(v7);
      _IDSLogTransport( @"SPConnection",  @"IDS",  @"SocketPairConnection (%p) add OTR blocks (enc:%p dec:%p).");

      if (_IDSShouldLog(0LL, @"SPConnection"))
      {
        id v19 = objc_retainBlock(v6);
        id v21 = objc_retainBlock(v7);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"SPConnection",  @"SocketPairConnection (%p) add OTR blocks (enc:%p dec:%p).");
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (unsigned)maxAllowedMessageSize
{
  return self->_maxAllowedMessageSize;
}

- (void)setMaxAllowedMessageSize:(unsigned int)a3
{
  self->_unsigned int maxAllowedMessageSize = a3;
}

- (NSString)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(id)a3
{
}

- (IDSStallDetector)outgoingStallDetector
{
  return self->_outgoingStallDetector;
}

- (void)setOutgoingStallDetector:(id)a3
{
}

- (BOOL)hasEndedSession
{
  return self->_hasEndedSession;
}

- (void)setHasEndedSession:(BOOL)a3
{
  self->_hasEndedSession = a3;
}

- (void).cxx_destruct
{
}

@end