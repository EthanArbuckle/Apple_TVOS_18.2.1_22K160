@interface IDSFanoutSender
- (IDSAckStateMachine)ackStateMachine;
- (IDSFanoutSender)initWithGUID:(id)a3 service:(id)a4 messageDelivery:(id)a5 completionActivity:(id)a6 coalesceQueueManager:(id)a7;
- (void)finishedTrackingAPNSAcksWithURIs:(id)a3 guid:(id)a4;
- (void)finishedTrackingMadridAcksWithContext:(id)a3 uris:(id)a4 guid:(id)a5;
- (void)receivedAPNSAckForMessage:(id)a3 guid:(id)a4;
- (void)receivedErrorWithContext:(id)a3;
- (void)receivedRateLimitingResponseForTopic:(id)a3 ttr:(id)a4;
- (void)sendFanouts:(id)a3 guidToDeliveryAcknowledgementBlock:(id)a4 guidToSendCompletionBlock:(id)a5 forURIs:(id)a6 messageQueue:(id)a7;
- (void)sendMMLs:(id)a3 guidToDeliveryAcknowledgementBlock:(id)a4 guidToSendCompletionBlock:(id)a5 forService:(id)a6 sendMode:(id)a7 messageQueue:(id)a8;
@end

@implementation IDSFanoutSender

- (IDSFanoutSender)initWithGUID:(id)a3 service:(id)a4 messageDelivery:(id)a5 completionActivity:(id)a6 coalesceQueueManager:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IDSFanoutSender;
  v17 = -[IDSFanoutSender init](&v23, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_messageDelivery, a5);
    v19 = objc_alloc_init(&OBJC_CLASS___IDSAckStateMachine);
    ackStateMachine = v18->_ackStateMachine;
    v18->_ackStateMachine = v19;

    objc_storeStrong((id *)&v18->_guid, a3);
    objc_storeStrong((id *)&v18->_service, a4);
    objc_storeStrong((id *)&v18->_completionActivity, a6);
    objc_storeStrong((id *)&v18->_coalesceQueueManager, a7);
  }

  return v18;
}

- (void)sendFanouts:(id)a3 guidToDeliveryAcknowledgementBlock:(id)a4 guidToSendCompletionBlock:(id)a5 forURIs:(id)a6 messageQueue:(id)a7
{
  id v12 = a3;
  id v29 = a4;
  id v28 = a5;
  id v13 = a6;
  id v14 = a7;
  objc_storeStrong((id *)&self->_guidToDeliveryAcknowledgementBlock, a4);
  objc_storeStrong((id *)&self->_guidToSendCompletionBlock, a5);
  id v15 = objc_alloc_init(&OBJC_CLASS___IDSAPNSAckTracker);
  id v16 = objc_alloc_init(&OBJC_CLASS___IDSMadridAckTracker);
  -[IDSAPNSAckTracker setDelegate:](v15, "setDelegate:", self);
  -[IDSMadridAckTracker setDelegate:](v16, "setDelegate:", self);
  v26 = v15;
  -[IDSAPNSAckTracker trackMessages:forURIs:](v15, "trackMessages:forURIs:", v12, v13);
  v25 = v16;
  v27 = v13;
  -[IDSMadridAckTracker trackMessages:forURIs:messageQueue:](v16, "trackMessages:forURIs:messageQueue:", v12, v13, v14);
  -[IDSAckStateMachine setState:](self->_ackStateMachine, "setState:", 1LL);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        -[FTMessageDelivery sendMessage:]( self->_messageDelivery,  "sendMessage:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)i));
        id v22 = [v14 count];
        objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
        v24 = v23;
        if (v22) {
          [v23 addFastDormancyDisableToken:@"IDSDeliveryManager"];
        }
        else {
          [v23 removeFastDormancyDisableToken:@"IDSDeliveryManager"];
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v19);
  }
}

- (void)sendMMLs:(id)a3 guidToDeliveryAcknowledgementBlock:(id)a4 guidToSendCompletionBlock:(id)a5 forService:(id)a6 sendMode:(id)a7 messageQueue:(id)a8
{
  id v14 = a3;
  id v34 = a4;
  id v33 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  objc_storeStrong((id *)&self->_guidToDeliveryAcknowledgementBlock, a4);
  objc_storeStrong((id *)&self->_guidToSendCompletionBlock, a5);
  id v18 = objc_alloc_init(&OBJC_CLASS___IDSAPNSAckTracker);
  id v19 = objc_alloc_init(&OBJC_CLASS___IDSMadridAckTracker);
  -[IDSAPNSAckTracker setDelegate:](v18, "setDelegate:", self);
  -[IDSMadridAckTracker setDelegate:](v19, "setDelegate:", self);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
  __int128 v31 = v16;
  __int128 v32 = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMMLBuilder mmlsFromAggregates:service:sendMode:guid:]( &OBJC_CLASS___IDSMMLBuilder,  "mmlsFromAggregates:service:sendMode:guid:",  v20,  v15,  v16,  self->_guid));

  -[IDSAPNSAckTracker trackMMLMessages:forURIs:](v18, "trackMMLMessages:forURIs:", v21, v14);
  __int128 v30 = v19;
  v35 = v14;
  -[IDSMadridAckTracker trackMMLMessages:forURIs:messageQueue:]( v19,  "trackMMLMessages:forURIs:messageQueue:",  v21,  v14,  v17);
  -[IDSAckStateMachine setState:](self->_ackStateMachine, "setState:", 1LL);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v22 = v21;
  id v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        -[FTMessageDelivery sendMessage:]( self->_messageDelivery,  "sendMessage:",  *(void *)(*((void *)&v36 + 1) + 8LL * (void)i));
        id v27 = [v17 count];
        id v28 = (void *)objc_claimAutoreleasedReturnValue(+[IMMobileNetworkManager sharedInstance](&OBJC_CLASS___IMMobileNetworkManager, "sharedInstance"));
        id v29 = v28;
        if (v27) {
          [v28 addFastDormancyDisableToken:@"IDSDeliveryManager"];
        }
        else {
          [v28 removeFastDormancyDisableToken:@"IDSDeliveryManager"];
        }
      }

      id v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v24);
  }
}

- (void)receivedAPNSAckForMessage:(id)a3 guid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received APNS Ack for GUID %@",  (uint8_t *)&v11,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_guidToDeliveryAcknowledgementBlock, "objectForKey:", v7));
  if (v9)
  {
    v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_guidToDeliveryAcknowledgementBlock,  "objectForKey:",  v7));
    ((void (**)(void, id))v10)[2](v10, v6);
  }
}

- (void)finishedTrackingAPNSAcksWithURIs:(id)a3 guid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (-[IDSAckStateMachine successful](self->_ackStateMachine, "successful")) {
      v9 = @"YES";
    }
    else {
      v9 = @"NO";
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAckStateMachine error](self->_ackStateMachine, "error"));
    int v17 = 138412802;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Finished acks for GUID %@ success: %@ error: %@",  (uint8_t *)&v17,  0x20u);
  }

  if ((id)-[IDSAckStateMachine state](self->_ackStateMachine, "state") != (id)3)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_guidToSendCompletionBlock, "objectForKey:", v7));

    if (v11)
    {
      uint64_t v12 = 2LL;
      -[IDSAckStateMachine setState:](self->_ackStateMachine, "setState:", 2LL);
      id v13 = objc_alloc(&OBJC_CLASS___IDSDeliveryContext);
      if (-[IDSAckStateMachine successful](self->_ackStateMachine, "successful")) {
        uint64_t v12 = 0LL;
      }
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAckStateMachine error](self->_ackStateMachine, "error"));
      id v15 = -[IDSDeliveryContext initWithResponseCode:error:lastCall:]( v13,  "initWithResponseCode:error:lastCall:",  v12,  v14,  0LL);

      -[IDSDeliveryContext setDisplayURIs:](v15, "setDisplayURIs:", v6);
      -[IDSDeliveryContext setLastCourierAck:](v15, "setLastCourierAck:", 1LL);
      id v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_guidToSendCompletionBlock,  "objectForKey:",  v7));
      ((void (**)(void, IDSDeliveryContext *))v16)[2](v16, v15);
      -[IDSAckStateMachine setError:](self->_ackStateMachine, "setError:", 0LL);
    }
  }
}

- (void)receivedErrorWithContext:(id)a3
{
  id v9 = a3;
  -[IDSAckStateMachine setSuccessful:](self->_ackStateMachine, "setSuccessful:", 0LL);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v9 responseError]);
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAckStateMachine error](self->_ackStateMachine, "error"));

    if (!v6)
    {
      ackStateMachine = self->_ackStateMachine;
      v8 = (void *)objc_claimAutoreleasedReturnValue([v9 responseError]);
      -[IDSAckStateMachine setError:](ackStateMachine, "setError:", v8);
    }
  }
}

- (void)finishedTrackingMadridAcksWithContext:(id)a3 uris:(id)a4 guid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(self->_completionActivity, &state);
  -[IDSAckStateMachine setState:](self->_ackStateMachine, "setState:", 3LL);
  uint64_t v11 = OSLogHandleForIDSCategory("GUIDTRACE");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2112;
    __int128 v30 = (const __CFString *)service;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "OUTGOING-PUSH_FULLY_SENT:%@ SERVICE:%@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v14) && _IDSShouldLog(0LL, @"GUIDTRACE"))
  {
    id v24 = v10;
    uint64_t v25 = self->_service;
    _IDSLogV(0LL, @"IDSFoundation", @"GUIDTRACE", @"OUTGOING-PUSH_FULLY_SENT:%@ SERVICE:%@");
  }

  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery", v24, v25));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = -[IDSAckStateMachine successful](self->_ackStateMachine, "successful");
    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[IDSAckStateMachine error](self->_ackStateMachine, "error"));
    id v18 = (void *)v17;
    __int16 v19 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v28 = v10;
    __int16 v29 = 2112;
    if (v16) {
      __int16 v19 = @"YES";
    }
    __int128 v30 = v19;
    __int16 v31 = 2112;
    uint64_t v32 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Finished sending GUID %@ success: %@ error: %@",  buf,  0x20u);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_guidToSendCompletionBlock, "objectForKey:", v10));
  if (v20)
  {
    [v8 setDisplayURIs:v9];
    if (-[IDSAckStateMachine successful](self->_ackStateMachine, "successful")) {
      uint64_t v21 = 0LL;
    }
    else {
      uint64_t v21 = 2LL;
    }
    [v8 setIdsResponseCode:v21];
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAckStateMachine error](self->_ackStateMachine, "error"));
    [v8 setResponseError:v22];

    [v8 setLastCall:1];
    id v23 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_guidToSendCompletionBlock,  "objectForKey:",  v10));
    ((void (**)(void, id))v23)[2](v23, v8);
    -[IDSAckStateMachine setError:](self->_ackStateMachine, "setError:", 0LL);
  }

  os_activity_scope_leave(&state);
}

- (void)receivedRateLimitingResponseForTopic:(id)a3 ttr:(id)a4
{
}

- (IDSAckStateMachine)ackStateMachine
{
  return self->_ackStateMachine;
}

- (void).cxx_destruct
{
}

@end