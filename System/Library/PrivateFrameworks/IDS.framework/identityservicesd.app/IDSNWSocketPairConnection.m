@interface IDSNWSocketPairConnection
- (BOOL)hasEndedSession;
- (BOOL)sendDataMessage:(id)a3;
- (BOOL)sendDataMessage:(id)a3 canFragment:(BOOL)a4;
- (BOOL)shouldUseCrossLayerLogging;
- (IDSNWSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 priority:(int64_t)a6 identifier:(id)a7;
- (IDSSocketPairConnectionDelegate)delegate;
- (NSMutableDictionary)incomingDataFragments;
- (NSSet)inFlightMessages;
- (NSString)identifier;
- (OS_dispatch_queue)priorityQueue;
- (OS_nw_connection)nwConnection;
- (double)lastSocketActivityTime;
- (id)decryptionBlock;
- (id)encryptionBlock;
- (int64_t)priority;
- (unsigned)currentOutgoingFragmentedMessageID;
- (unsigned)fragmentationSize;
- (unsigned)loggingSequenceIncoming;
- (unsigned)loggingSequenceOutgoing;
- (void)_dequeueNextMessageFromOutgoingQueue;
- (void)_notifyDelegateAboutClosedConnection;
- (void)_processIncomingRawMessage:(id)a3;
- (void)_receiveFromNWConnection:(id)a3;
- (void)_sendDataViaNWConnection:(id)a3 isLargeTransfer:(BOOL)a4;
- (void)dealloc;
- (void)endSession;
- (void)setCurrentOutgoingFragmentedMessageID:(unsigned int)a3;
- (void)setDecryptionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncryptionBlock:(id)a3;
- (void)setFragmentationSize:(unsigned int)a3;
- (void)setHasEndedSession:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncomingDataFragments:(id)a3;
- (void)setLoggingSequenceIncoming:(unsigned __int8)a3;
- (void)setLoggingSequenceOutgoing:(unsigned __int8)a3;
- (void)setNwConnection:(id)a3;
- (void)setOTREncryptionBlock:(id)a3 decryptionBlock:(id)a4;
- (void)setPriority:(int64_t)a3;
- (void)setPriorityQueue:(id)a3;
- (void)setShouldUseCrossLayerLogging:(BOOL)a3;
- (void)start;
@end

@implementation IDSNWSocketPairConnection

- (IDSNWSocketPairConnection)initWithSocket:(int)a3 queue:(id)a4 delegate:(id)a5 priority:(int64_t)a6 identifier:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___IDSNWSocketPairConnection;
  v16 = -[IDSNWSocketPairConnection init](&v29, "init");
  v17 = v16;
  if (v16)
  {
    nwConnection = v16->_nwConnection;
    v16->_nwConnection = 0LL;

    objc_storeStrong((id *)&v17->_priorityQueue, a4);
    objc_storeWeak((id *)&v17->_delegate, v14);
    v17->_priority = a6;
    *(void *)&v17->_currentOutgoingFragmentedMessageID = 0x1F4000000000LL;
    *(_WORD *)&v17->_loggingSequenceIncoming = 0;
    objc_storeStrong((id *)&v17->_identifier, a7);
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    outgoingMessageArray = v17->_outgoingMessageArray;
    v17->_outgoingMessageArray = v19;

    v17->_sendMessageCounter = 0;
    *(_WORD *)&v17->_hasEndedSession = 0;
    v21 = nw_parameters_create();
    nw_parameters_set_indefinite(v21, 0LL);
    v22 = nw_parameters_copy_default_protocol_stack(v21);
    v23 = (nw_protocol_definition *)sub_1003C7584();
    options = nw_framer_create_options(v23);
    nw_protocol_stack_prepend_application_protocol(v22, options);

    v25 = nw_tcp_create_options();
    nw_protocol_stack_set_transport_protocol(v22, v25);

    uint64_t v26 = nw_connection_create_with_connected_socket_and_parameters(v11, v21);
    v27 = v17->_nwConnection;
    v17->_nwConnection = (OS_nw_connection *)v26;

    nw_connection_get_uuid(v17->_nwConnection, v17->_connectionID);
  }

  return v17;
}

- (void)start
{
  nwConnection = self->_nwConnection;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog socketPairConnection](&OBJC_CLASS___IDSFoundationLog, "socketPairConnection"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (nwConnection)
  {
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNWSocketPairConnection identifier](self, "identifier"));
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "IDSNWSocketPairConnection: %@ Succesful nw_connection_create_with_connected_socket_and_parameters",  buf,  0xCu);
    }

    nw_connection_set_queue(self->_nwConnection, (dispatch_queue_t)self->_priorityQueue);
    v7 = self->_nwConnection;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1003C7C4C;
    v9[3] = &unk_1009040A8;
    v9[4] = self;
    nw_connection_set_event_handler(v7, v9);
    nw_connection_start(self->_nwConnection);
  }

  else
  {
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNWSocketPairConnection identifier](self, "identifier"));
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "IDSNWSocketPairConnection: %@ _nwConnection is nil.",  buf,  0xCu);
    }

    -[IDSNWSocketPairConnection _notifyDelegateAboutClosedConnection](self, "_notifyDelegateAboutClosedConnection");
  }

- (void)dealloc
{
  if (!-[IDSNWSocketPairConnection hasEndedSession](self, "hasEndedSession"))
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog socketPairConnection](&OBJC_CLASS___IDSFoundationLog, "socketPairConnection"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1006AC210(v3);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSNWSocketPairConnection;
  -[IDSNWSocketPairConnection dealloc](&v4, "dealloc");
}

- (void)endSession
{
  if (self->_nwConnection)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog socketPairConnection](&OBJC_CLASS___IDSFoundationLog, "socketPairConnection"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNWSocketPairConnection identifier](self, "identifier"));
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "IDSNWSocketPairConnection: %@ Ending session",  (uint8_t *)&v7,  0xCu);
    }

    nwConnection = self->_nwConnection;
    self->_nwConnection = 0LL;
    v6 = nwConnection;

    nw_connection_cancel(v6);
    -[IDSNWSocketPairConnection setHasEndedSession:](self, "setHasEndedSession:", 1LL);
    -[IDSNWSocketPairConnection _notifyDelegateAboutClosedConnection](self, "_notifyDelegateAboutClosedConnection");
  }

- (void)_notifyDelegateAboutClosedConnection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNWSocketPairConnection delegate](self, "delegate"));
  char v4 = objc_opt_respondsToSelector(v3, "connectionDidClose");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSNWSocketPairConnection delegate](self, "delegate"));
    [v5 connectionDidClose];
  }

- (void)setOTREncryptionBlock:(id)a3 decryptionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  id encryptionBlock = self->_encryptionBlock;
  self->_id encryptionBlock = v7;

  id v9 = [v6 copy];
  id decryptionBlock = self->_decryptionBlock;
  self->_id decryptionBlock = v9;
}

- (void)_receiveFromNWConnection:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1003C81A8;
  v4[3] = &unk_1009040D0;
  v4[4] = self;
  id v5 = a3;
  v3 = (nw_connection *)v5;
  nw_connection_receive_message(v3, v4);
}

- (void)_processIncomingRawMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  self->_lastSocketActivityTime = ids_monotonic_time(v5);
  if (self->_decryptionBlock && [v4 command] == 24)
  {
    uint64_t v6 = (*((uint64_t (**)(void))self->_decryptionBlock + 2))();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[IDSSocketPairMessage messageWithData:](&OBJC_CLASS___IDSSocketPairMessage, "messageWithData:", v7));

    id v4 = (id)v8;
  }

  if (v4)
  {
    if ([v4 command] == 21)
    {
      if (!self->_incomingDataFragments)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        incomingDataFragments = self->_incomingDataFragments;
        self->_incomingDataFragments = Mutable;
      }

      id v4 = v4;
      unsigned int v11 = [v4 fragmentIndex];
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 fragmentedMessageID]));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_incomingDataFragments, "objectForKey:", v12));
      if (!v13)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 totalFragmentCount]));
        -[NSMutableDictionary setObject:forKey:](self->_incomingDataFragments, "setObject:forKey:", v13, v12);
      }

      [v13 addObject:v4];
      id v14 = [v13 count];
      if (v14 != (id)[v4 totalFragmentCount])
      {

        goto LABEL_29;
      }

      id v15 = +[IDSSocketPairFragmentedMessage createOriginalMessageFromFragmentedMessages:]( &OBJC_CLASS___IDSSocketPairFragmentedMessage,  "createOriginalMessageFromFragmentedMessages:",  v13);

      -[NSMutableDictionary removeObjectForKey:](self->_incomingDataFragments, "removeObjectForKey:", v12);
      id v4 = v15;
    }

    else
    {
      unsigned int v11 = 0;
    }

    if ([v4 command] == 24)
    {
      unsigned int v16 = [v4 priority];
      unsigned int v17 = [v4 protectionClass];
      unsigned int v18 = [v4 encrypted];
      unsigned int v19 = [v4 sequenceNumber];
      id v20 = [v4 streamID];
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUTunDeliveryController sharedInstance]( &OBJC_CLASS___IDSUTunDeliveryController,  "sharedInstance"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 topicForStreamID:v20]);

      if (v22)
      {
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog socketPairConnection]( &OBJC_CLASS___IDSFoundationLog,  "socketPairConnection"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138414082;
          *(void *)v34 = @"idsotr";
          *(_WORD *)&v34[8] = 2048;
          uint64_t v35 = v16;
          LOWORD(v36) = 1024;
          *(_DWORD *)((char *)&v36 + 2) = v17;
          HIWORD(v36) = 1024;
          *(_DWORD *)v37 = v18;
          *(_WORD *)&v37[4] = 1024;
          *(_DWORD *)v38 = v19;
          *(_WORD *)&v38[4] = 1024;
          *(_DWORD *)&v38[6] = v11;
          __int16 v39 = 1024;
          BOOL v40 = v4 != 0LL;
          __int16 v41 = 2112;
          v42 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "IDSNWSocketPairConnection: Recv OTR message for %@-%ld-%u E:%u SN:%u FI:%u D:%u T:%@",  buf,  0x3Eu);
        }
      }
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNWSocketPairConnection delegate](self, "delegate"));
    char v25 = objc_opt_respondsToSelector(v24, "didReceiveDataMessage:");

    if ((v25 & 1) != 0)
    {
      if ((objc_opt_respondsToSelector(v4, "messageUUID") & 1) != 0)
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v4 messageUUID]);
        if (v26 && -[IDSNWSocketPairConnection shouldUseCrossLayerLogging](self, "shouldUseCrossLayerLogging"))
        {
          v27 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  v26,  0xAAAAAAAAAAAAAAAALL,  0xAAAAAAAAAAAAAAAALL);
          -[NSUUID getUUIDBytes:](v27, "getUUIDBytes:", &v32);

          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog CrossLayerLogging](&OBJC_CLASS___IDSFoundationLog, "CrossLayerLogging"));
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v29 = [v4 underlyingDataLength];
            unsigned int v30 = -[IDSNWSocketPairConnection loggingSequenceIncoming](self, "loggingSequenceIncoming");
            -[IDSNWSocketPairConnection setLoggingSequenceIncoming:]( self,  "setLoggingSequenceIncoming:",  (v30 + 1));
            *(_DWORD *)buf = 67110914;
            *(_DWORD *)v34 = 120;
            *(_WORD *)&v34[4] = 1024;
            *(_DWORD *)&v34[6] = 140;
            uint64_t v35 = 0x832000000100412LL;
            v36 = &v32;
            *(_WORD *)v37 = 1042;
            *(_DWORD *)&v37[2] = 16;
            *(_WORD *)v38 = 2098;
            *(void *)&v38[2] = self->_connectionID;
            __int16 v39 = 1024;
            BOOL v40 = v29;
            __int16 v41 = 1024;
            LODWORD(v42) = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "31 {curProtocol: %hhu, prevProtocol: %hhu, curUUID: %{public}.16P, conUUID: %{public}.16P, curPktLen: %u, logSeqn: %hhu}",  buf,  0x3Au);
          }
        }
      }

      else
      {
        uint64_t v26 = 0LL;
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNWSocketPairConnection delegate](self, "delegate"));
      [v31 didReceiveDataMessage:v4];
    }
  }

- (BOOL)sendDataMessage:(id)a3
{
  return -[IDSNWSocketPairConnection sendDataMessage:canFragment:](self, "sendDataMessage:canFragment:", a3, 0LL);
}

- (BOOL)sendDataMessage:(id)a3 canFragment:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSNWSocketPairConnection nwConnection](self, "nwConnection"));

  if (v7)
  {
    if ((objc_opt_respondsToSelector(v6, "messageUUID") & 1) != 0)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 messageUUID]);
      if (v8 && -[IDSNWSocketPairConnection shouldUseCrossLayerLogging](self, "shouldUseCrossLayerLogging"))
      {
        v48[0] = 0xAAAAAAAAAAAAAAAALL;
        v48[1] = 0xAAAAAAAAAAAAAAAALL;
        id v9 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v8);
        -[NSUUID getUUIDBytes:](v9, "getUUIDBytes:", v48);

        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog CrossLayerLogging](&OBJC_CLASS___IDSFoundationLog, "CrossLayerLogging"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v11 = [v6 underlyingDataLength];
          unsigned int v12 = -[IDSNWSocketPairConnection loggingSequenceOutgoing](self, "loggingSequenceOutgoing");
          -[IDSNWSocketPairConnection setLoggingSequenceOutgoing:]( self,  "setLoggingSequenceOutgoing:",  (v12 + 1));
          *(_DWORD *)buf = 67110914;
          int v33 = 120;
          __int16 v34 = 1024;
          int v35 = 140;
          __int16 v36 = 1042;
          int v37 = 16;
          __int16 v38 = 2098;
          __int16 v39 = v48;
          __int16 v40 = 1042;
          int v41 = 16;
          __int16 v42 = 2098;
          connectionID = self->_connectionID;
          __int16 v44 = 1024;
          unsigned int v45 = v11;
          __int16 v46 = 1024;
          unsigned int v47 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "30 {curProtocol: %hhu, nextProtocol: %hhu, curUUID: %{public}.16P, conUUID: %{public}.16P, curPktLen: %u, logSeqn: %hhu}",  buf,  0x3Au);
        }
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    else {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 underlyingData]);
    }
    id v14 = v13;
    if (v4 && self->_fragmentationSize && (unint64_t)[v13 length] > self->_fragmentationSize)
    {
      id v15 = +[IDSSocketPairFragmentedMessage createMessageFragmentsFromOriginalMessage:withFragmentedMessageID:fragmentSize:]( &OBJC_CLASS___IDSSocketPairFragmentedMessage,  "createMessageFragmentsFromOriginalMessage:withFragmentedMessageID:fragmentSize:",  v14,  self->_currentOutgoingFragmentedMessageID);
      v30[0] = @"originalMessage";
      v30[1] = @"remainingFragments";
      v31[0] = v6;
      v31[1] = v15;
      v30[2] = @"totalFragmentCount";
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 count]));
      v31[2] = v16;
      v30[3] = @"fragmentedMessageID";
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_currentOutgoingFragmentedMessageID));
      v31[3] = v17;
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  4LL));

      os_unfair_lock_lock(&self->_outgoingMessageArrayLock);
      -[NSMutableArray addObject:](self->_outgoingMessageArray, "addObject:", v18);
      if (v8)
      {
        unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog socketPairConnection]( &OBJC_CLASS___IDSFoundationLog,  "socketPairConnection"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_1006AC2B4();
        }
      }

      os_unfair_lock_unlock(&self->_outgoingMessageArrayLock);
      ++self->_currentOutgoingFragmentedMessageID;
    }

    else
    {
      os_unfair_lock_lock(&self->_outgoingMessageArrayLock);
      -[NSMutableArray addObject:](self->_outgoingMessageArray, "addObject:", v6);
      if (v8)
      {
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog socketPairConnection]( &OBJC_CLASS___IDSFoundationLog,  "socketPairConnection"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_1006AC250((uint64_t)v8, v20, v21, v22, v23, v24, v25, v26);
        }
      }

      os_unfair_lock_unlock(&self->_outgoingMessageArrayLock);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDaemonPriorityQueueController sharedInstance]( &OBJC_CLASS___IDSDaemonPriorityQueueController,  "sharedInstance"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1003C8DDC;
    v29[3] = &unk_1008F6010;
    v29[4] = self;
    [v27 performBlockWithPriority:v29 priority:self->_priority];
  }

  return v7 != 0LL;
}

- (double)lastSocketActivityTime
{
  return self->_lastSocketActivityTime;
}

- (void)_dequeueNextMessageFromOutgoingQueue
{
  p_outgoingMessageArrayLock = &self->_outgoingMessageArrayLock;
  os_unfair_lock_lock(&self->_outgoingMessageArrayLock);
  if (-[NSMutableArray count](self->_outgoingMessageArray, "count"))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_outgoingMessageArray, "firstObject"));
    -[NSMutableArray removeObjectAtIndex:](self->_outgoingMessageArray, "removeObjectAtIndex:", 0LL);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSSocketPairMessage, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      id v8 = v4;
      if ((objc_opt_respondsToSelector(v8, "messageUUID") & 1) != 0)
      {
        uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 messageUUID]);
        if (v9)
        {
          v10 = (void *)v9;
          unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog socketPairConnection]( &OBJC_CLASS___IDSFoundationLog,  "socketPairConnection"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            sub_1006AC320((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
          }
        }
      }

      else {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v8 underlyingData]);
      }
      uint64_t v22 = (void *)v18;
      BOOL v23 = [v8 command] == 24;
    }

    else
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
      if ((objc_opt_isKindOfClass(v4, v19) & 1) != 0)
      {
        id v8 = v4;
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"remainingFragments"]);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);
        [v20 removeObjectAtIndex:0];
        if ([v20 count])
        {
          -[NSMutableArray addObject:](self->_outgoingMessageArray, "addObject:", v8);
        }

        else
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"fragmentedMessageID"]);
          int v25 = [v24 unsignedIntValue];

          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog socketPairConnection]( &OBJC_CLASS___IDSFoundationLog,  "socketPairConnection"));
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            sub_1006AC384(v25, v26);
          }
        }

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 underlyingData]);

        BOOL v23 = 1LL;
      }

      else
      {
        id v8 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog socketPairConnection](&OBJC_CLASS___IDSFoundationLog, "socketPairConnection"));
        if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "IDSNWSocketPairConnection: unknown object in _outgoingMessageArray",  buf,  2u);
        }

        uint64_t v22 = 0LL;
        BOOL v23 = 0LL;
      }
    }

    os_unfair_lock_unlock(p_outgoingMessageArrayLock);
    if (v22)
    {
      -[IDSNWSocketPairConnection _sendDataViaNWConnection:isLargeTransfer:]( self,  "_sendDataViaNWConnection:isLargeTransfer:",  v22,  v23);
    }
  }

  else
  {
    os_unfair_lock_unlock(p_outgoingMessageArrayLock);
    id v27 = (id)objc_claimAutoreleasedReturnValue(-[IDSNWSocketPairConnection delegate](self, "delegate"));
    [v27 connectionBecameEmpty];
  }

- (NSSet)inFlightMessages
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  p_outgoingMessageArrayLock = &self->_outgoingMessageArrayLock;
  os_unfair_lock_lock(&self->_outgoingMessageArrayLock);
  outgoingMessageArray = self->_outgoingMessageArray;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003C916C;
  v8[3] = &unk_1008F7970;
  id v6 = v3;
  id v9 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](outgoingMessageArray, "enumerateObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_outgoingMessageArrayLock);

  return (NSSet *)v6;
}

- (void)_sendDataViaNWConnection:(id)a3 isLargeTransfer:(BOOL)a4
{
  id v5 = a3;
  id v6 = [v5 length];
  int v7 = (int)v6;
  self->_lastSocketActivityTime = ids_monotonic_time(v6);
  ++self->_sendMessageCounter;
  nwConnection = self->_nwConnection;
  id v9 = (dispatch_data_s *)[v5 _createDispatchData];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1003C92C4;
  v10[3] = &unk_1009040F8;
  v10[4] = self;
  int v11 = v7;
  nw_connection_send(nwConnection, v9, _nw_content_context_default_message, 1, v10);
}

- (OS_dispatch_queue)priorityQueue
{
  return self->_priorityQueue;
}

- (void)setPriorityQueue:(id)a3
{
}

- (IDSSocketPairConnectionDelegate)delegate
{
  return (IDSSocketPairConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (OS_nw_connection)nwConnection
{
  return self->_nwConnection;
}

- (void)setNwConnection:(id)a3
{
}

- (unsigned)currentOutgoingFragmentedMessageID
{
  return self->_currentOutgoingFragmentedMessageID;
}

- (void)setCurrentOutgoingFragmentedMessageID:(unsigned int)a3
{
  self->_currentOutgoingFragmentedMessageID = a3;
}

- (unsigned)fragmentationSize
{
  return self->_fragmentationSize;
}

- (void)setFragmentationSize:(unsigned int)a3
{
  self->_fragmentationSize = a3;
}

- (unsigned)loggingSequenceIncoming
{
  return self->_loggingSequenceIncoming;
}

- (void)setLoggingSequenceIncoming:(unsigned __int8)a3
{
  self->_loggingSequenceIncoming = a3;
}

- (unsigned)loggingSequenceOutgoing
{
  return self->_loggingSequenceOutgoing;
}

- (void)setLoggingSequenceOutgoing:(unsigned __int8)a3
{
  self->_loggingSequenceOutgoing = a3;
}

- (NSMutableDictionary)incomingDataFragments
{
  return self->_incomingDataFragments;
}

- (void)setIncomingDataFragments:(id)a3
{
}

- (id)encryptionBlock
{
  return self->_encryptionBlock;
}

- (void)setEncryptionBlock:(id)a3
{
}

- (id)decryptionBlock
{
  return self->_decryptionBlock;
}

- (void)setDecryptionBlock:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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

- (BOOL)shouldUseCrossLayerLogging
{
  return self->_shouldUseCrossLayerLogging;
}

- (void)setShouldUseCrossLayerLogging:(BOOL)a3
{
  self->_shouldUseCrossLayerLogging = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end