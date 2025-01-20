@interface CSDRelayClientController
- (CSDRelayClientController)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (void)handleCallAnsweredElsewhereMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handleCallConnectedMessageFromHost:(id)a3;
- (void)handleCallDialedMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handleCallDisconnectedMessageFromHost:(id)a3;
- (void)handleCallStartedConnectingMessageFromHost:(id)a3;
- (void)handleConversationProminenceMessageFromHost:(id)a3;
- (void)handleDeviceUnavailableMessageFromHost:(id)a3;
- (void)handleHardPauseDigitsAvailabilityMessageFromHost:(id)a3;
- (void)handleIncomingCallMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handleInvitationSentMessageFromHost:(id)a3;
- (void)handleNeedsManualInCallSoundsChangeMessageFromHost:(id)a3;
- (void)handleOngoingConversationMessageFromHost:(id)a3;
- (void)handlePullRelayingCallsMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handlePushHostedCallsMessageFromHost:(id)a3 completion:(id)a4;
- (void)handleReceivedDTMFUpdateMessageFromHost:(id)a3;
- (void)handleResetStateMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handleResetWantsHoldMusicFromHost:(id)a3;
- (void)handleUpdateCallContextAvailableMessageFromHost:(id)a3;
- (void)handleUpdateCallDisplayContextMessageFromHost:(id)a3;
- (void)handleUpdateCallModelMessageFromHost:(id)a3;
- (void)handleUpdateConversationsMessageFromHost:(id)a3;
- (void)handleUpdateFailureExpectedMessageFromHost:(id)a3;
- (void)handleUpdateRemoteCallStateMessageFromHost:(id)a3;
- (void)handleUpdateRemoteUplinkMutedMessageFromHost:(id)a3;
- (void)handleUpdateRoutesMessageFromHost:(id)a3;
- (void)handleUpdateSupportsDTMFUpdatesMessageFromHost:(id)a3;
- (void)handleUpdateSupportsEmergencyFallbackMessageFromHost:(id)a3;
- (void)handleUpdateSupportsTTYWithVoiceMessageFromHost:(id)a3;
- (void)pullRemotelyHostedCallsForMessage:(id)a3 completion:(id)a4;
@end

@implementation CSDRelayClientController

- (CSDRelayClientController)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDRelayClientController;
  v6 = -[CSDRelayClientController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callController](self, "callController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callContainer]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callWithUniqueProxyIdentifier:v4]);

  if (v8 && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___CSDRelayCall, v9), (objc_opt_isKindOfClass(v8, v10) & 1) == 0))
  {
    +[CSDCrashReporter simulateCrashReportWithFormat:]( &OBJC_CLASS___CSDCrashReporter,  "simulateCrashReportWithFormat:",  @"Call is not of type CSDRelayCall, this should not be happening.  Please file a bug to [FaceTime | (New Bugs)]");
    id v11 = 0LL;
  }

  else
  {
    id v11 = v8;
  }

  return v11;
}

- (void)handleIncomingCallMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v7));

  if (!v8)
  {
    v12 = -[CSDRelayCall initWithRelayMessage:outgoing:]( objc_alloc(&OBJC_CLASS___CSDRelayCall),  "initWithRelayMessage:outgoing:",  v6,  0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
    [v13 setCallDelegatesIfNeeded:v12];

    [v6 hostCallCreationTime];
    -[CSDRelayCall setHostCreationTime:](v12, "setHostCreationTime:");
    [v6 messageSendTime];
    -[CSDRelayCall setHostMessageSendTime:](v12, "setHostMessageSendTime:");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v14 timeIntervalSince1970];
    -[CSDRelayCall setClientMessageReceiveTime:](v12, "setClientMessageReceiveTime:");

    if (v4)
    {
      -[CSDCall setEndpointOnCurrentDevice:]( v12,  "setEndpointOnCurrentDevice:",  [v6 cannotBeAnswered] ^ 1);
      -[CSDRelayCall setCannotRelayAudioOrVideo:]( v12,  "setCannotRelayAudioOrVideo:",  [v6 cannotRelayAudioOrVideoOnPairedDevice]);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
    [v15 propertiesChangedForCall:v12];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall displayContext](v12, "displayContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 displayContext]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 displayContextByMergingWithDisplayContext:v17]);
    -[CSDRelayCall setDisplayContext:](v12, "setDisplayContext:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall imageURL](v12, "imageURL"));
    if (!v19) {
      goto LABEL_16;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 image]);
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall imageURL](v12, "imageURL"));
      unsigned __int8 v22 = [v20 writeToURL:v21 atomically:1];

      if ((v22 & 1) != 0)
      {
LABEL_15:

LABEL_16:
        dispatch_time_t v27 = dispatch_time(0LL, 90000000000LL);
        v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController queue](self, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100044EF0;
        block[3] = &unk_1003D7918;
        block[4] = self;
        v30 = v12;
        BOOL v31 = v4;
        uint64_t v10 = v12;
        dispatch_after(v27, v28, block);

        goto LABEL_17;
      }

      id v23 = sub_1001704C4();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Failed to persist business image";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
      }
    }

    else
    {
      id v26 = sub_1001704C4();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Got an imageURL but no imageData to persist";
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }

  id v9 = sub_1001704C4();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 typeString]);
    *(_DWORD *)buf = 138412546;
    v33 = v11;
    __int16 v34 = 2112;
    v35 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Ignoring %@ message because we already have a call with this uniqueProxyIdentifier: %@",  buf,  0x16u);
  }

- (void)handleConversationProminenceMessageFromHost:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "handleConversationProminenceMessageFromHost: %@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)handleUpdateConversationsMessageFromHost:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "handleUpdateConversationsMessageFromHost: %@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)handleOngoingConversationMessageFromHost:(id)a3
{
  id v3 = a3;
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "handleOngoingConversationMessageFromHost: %@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)handleCallDialedMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v7));

  id v9 = sub_1001704C4();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v4)
    {
      if (v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v6 typeString]);
        int v17 = 138412290;
        v18 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Creating new call for %@ message",  (uint8_t *)&v17,  0xCu);
      }

      uint64_t v10 = -[CSDRelayCall initWithRelayMessage:outgoing:]( objc_alloc(&OBJC_CLASS___CSDRelayCall),  "initWithRelayMessage:outgoing:",  v6,  1LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
      [v14 setCallDelegatesIfNeeded:v10];

      -[os_log_s setEndpointOnCurrentDevice:](v10, "setEndpointOnCurrentDevice:", 0LL);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
      [v15 propertiesChangedForCall:v10];
    }

    else
    {
      if (!v11)
      {
LABEL_12:

        goto LABEL_13;
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 typeString]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
      int v17 = 138412546;
      v18 = v15;
      __int16 v19 = 2112;
      v20 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring %@ message because no call exists for %@ and the message is not from the paired device",  (uint8_t *)&v17,  0x16u);
    }

    goto LABEL_12;
  }

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 typeString]);
    int v17 = 138412546;
    v18 = v12;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "We already have a call for this %@ message: %@. Updating it with new values",  (uint8_t *)&v17,  0x16u);
  }

  [v8 updateWithRelayMessage:v6];
LABEL_13:
}

- (void)handleCallAnsweredElsewhereMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayClientController callWithUniqueProxyIdentifier:]( self,  "callWithUniqueProxyIdentifier:",  v8));

    if (v9)
    {
      v33 = v9;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
    }

    else
    {
      id v14 = sub_1001704C4();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
        int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
        *(_DWORD *)buf = 138412546;
        v30 = v16;
        __int16 v31 = 2112;
        v32 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  buf,  0x16u);
      }

      uint64_t v10 = 0LL;
    }
  }

  else
  {
    id v11 = sub_1001704C4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Call answered elsewhere message had no uniqueProxyIdentifier set. Using current calls",  buf,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callController](self, "callController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 callContainer]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v13 callsHostedElsewhere]);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v18 = v10;
  id v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      unsigned __int8 v22 = 0LL;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v22);
        if (a4) {
          [v23 setEndpointOnCurrentDevice:0];
        }
        else {
          objc_msgSend(v23, "setLocallyDisconnectedWithReasonIfNone:", 1, (void)v24);
        }
        unsigned __int8 v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v20);
  }
}

- (void)handleCallDisconnectedMessageFromHost:(id)a3
{
  id v8 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueProxyIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v4));

  if (v5)
  {
    objc_msgSend( v5,  "setLocallyDisconnectedWithReasonIfNone:stopConference:",  objc_msgSend(v8, "disconnectedReason"),  1);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueProxyIdentifier]);
    [v6 stopConferenceForIdentifier:v7];
  }
}

- (void)handleCallConnectedMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    [v6 setLocallyConnected];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 callModel]);
    [v6 setModel:v7];
  }

  else
  {
    id v8 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handlePullRelayingCallsMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 otherUniqueProxyIdentifiers]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callController](self, "callController", 0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callContainer]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callsHostedElsewhere]);

  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (([v15 isHostedOnCurrentDevice] & 1) == 0)
        {
          if (!v4
            || (v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueProxyIdentifier]),
                unsigned int v17 = [v7 containsObject:v16],
                v16,
                v17))
          {
            [v15 setLocallyDisconnectedWithReasonIfNone:7];
          }

          [v15 setEndpointOnCurrentDevice:0];
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 uniqueProxyIdentifier]);
          [v18 stopConferenceForIdentifier:v19];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }
}

- (void)handleResetWantsHoldMusicFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    [v6 setWantsHoldMusic:0];
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleUpdateCallModelMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayClientController callWithUniqueProxyIdentifier:]( self,  "callWithUniqueProxyIdentifier:",  v6));

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 callModel]);
      [v7 setModel:v8];
    }

    else
    {
      id v17 = sub_1001704C4();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
        *(_DWORD *)buf = 138412546;
        __int128 v27 = v19;
        __int16 v28 = 2112;
        v29 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callController](self, "callController", 0LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callContainer]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 callsHostedElsewhere]);

    id v11 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v7);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v4 callModel]);
          [v15 setModel:v16];
        }

        id v12 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v12);
    }
  }
}

- (void)handleDeviceUnavailableMessageFromHost:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callController](self, "callController", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callContainer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callsHostedElsewhere]);

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)handleResetStateMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v36 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callsHostedElsewhere]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v7));

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  v35 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 protoCalls]);
  id v10 = [v9 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(CSDRelayCall **)(*((void *)&v41 + 1) + 8LL * (void)i);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](v14, "uniqueProxyIdentifier"));
        __int128 v16 = (CSDRelayCall *)objc_claimAutoreleasedReturnValue( -[CSDRelayClientController callWithUniqueProxyIdentifier:]( self,  "callWithUniqueProxyIdentifier:",  v15));

        if (v16)
        {
          [v8 removeObject:v16];
          unsigned __int8 v17 = -[CSDRelayCall isEqualToCall:](v14, "isEqualToCall:", v16);
          id v18 = sub_1001704C4();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if ((v17 & 1) != 0)
          {
            if (v20)
            {
              *(_DWORD *)buf = 138412546;
              v47 = v16;
              __int16 v48 = 2112;
              v49 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Not resetting call %@ with protoCall %@ because they are equal",  buf,  0x16u);
            }
          }

          else
          {
            if (v20)
            {
              *(_DWORD *)buf = 138412546;
              v47 = v16;
              __int16 v48 = 2112;
              v49 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Resetting call %@ with protoCall %@",  buf,  0x16u);
            }

            -[CSDRelayCall updateRelayCall:](v14, "updateRelayCall:", v16);
          }
        }

        else
        {
          if (!v36) {
            continue;
          }
          id v21 = sub_1001704C4();
          __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Creating new call with protoCall %@",  buf,  0xCu);
          }

          __int128 v23 = objc_alloc(&OBJC_CLASS___CSDRelayCall);
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCall uniqueProxyIdentifier](v14, "uniqueProxyIdentifier"));
          __int128 v16 = -[CSDRelayCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:]( v23,  "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:",  v24,  0LL);

          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
          [v25 setCallDelegatesIfNeeded:v16];

          -[CSDRelayCall updateRelayCall:](v14, "updateRelayCall:", v16);
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
          [v26 propertiesChangedForCall:v16];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }

    while (v11);
  }

  if (v36)
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v27 = v8;
    id v28 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v38;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(CSDRelayCall **)(*((void *)&v37 + 1) + 8LL * (void)j);
          if (-[CSDRelayCall status](v32, "status") != 3)
          {
            id v33 = sub_1001704C4();
            __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Existing call no longer exists and is not sending: %@",  buf,  0xCu);
            }

            -[CSDRelayCall setLocallyDisconnectedWithReasonIfNone:](v32, "setLocallyDisconnectedWithReasonIfNone:", 0LL);
          }
        }

        id v29 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }

      while (v29);
    }
  }
}

- (void)handleHardPauseDigitsAvailabilityMessageFromHost:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callController](self, "callController", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callContainer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callsHostedElsewhere]);

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v11);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 hardPauseDigits]);
        [v12 setHardPauseDigits:v13];

        objc_msgSend(v12, "setHardPauseDigitsState:", objc_msgSend(v4, "hardPauseDigitsState"));
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }
}

- (void)handleUpdateSupportsDTMFUpdatesMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    objc_msgSend(v6, "setSupportsDTMFUpdates:", objc_msgSend(v4, "supportsDTMFUpdates"));
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      __int128 v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleReceivedDTMFUpdateMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (!v6)
  {
    id v11 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v16 = 138412546;
      __int128 v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v16,  0x16u);
    }

    goto LABEL_6;
  }

  if ([v4 hasDtmfUpdateDigits])
  {
    id v7 = objc_alloc(&OBJC_CLASS___TUCallDTMFUpdate);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dtmfUpdateDigits]);
    id v9 = (os_log_s *)[v7 initWithDigits:v8];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
    [v10 handleReceivedCallDTMFUpdate:v9 forCall:v6];

LABEL_6:
    goto LABEL_10;
  }

  id v14 = sub_1001704C4();
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1002B29CC((uint64_t)v4, v15);
  }

LABEL_10:
}

- (void)handleUpdateRemoteCallStateMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "handleUpdateRemoteCallStateMessageFromHost %@",  buf,  0xCu);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v22 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 protoCalls]);
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueProxyIdentifier]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayClientController callWithUniqueProxyIdentifier:]( self,  "callWithUniqueProxyIdentifier:",  v13));

        if (!v14)
        {
          id v19 = sub_1001704C4();
          __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueProxyIdentifier]);
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
            *(_DWORD *)buf = 138412546;
            id v28 = v20;
            __int16 v29 = 2112;
            uint64_t v30 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  buf,  0x16u);
          }

          goto LABEL_14;
        }

        unsigned __int8 v15 = [v12 isEqualToCall:v14];
        id v16 = sub_1001704C4();
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if ((v15 & 1) != 0)
        {
          if (v18)
          {
            *(_DWORD *)buf = 138412546;
            id v28 = v14;
            __int16 v29 = 2112;
            uint64_t v30 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not updating call %@ with protoCall %@ because they are equal",  buf,  0x16u);
          }

- (void)handleCallStartedConnectingMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    [v6 setLocallyConnecting];
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handlePushHostedCallsMessageFromHost:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callController](self, "callController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callContainer]);
  unsigned __int8 v10 = [v9 hasCurrentCalls];

  if ((v10 & 1) != 0)
  {
    id v11 = sub_1001704C4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 typeString]);
      int v14 = 138412290;
      unsigned __int8 v15 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received %@ message, but we already have some calls",  (uint8_t *)&v14,  0xCu);
    }

    v7[2](v7, 0LL);
  }

  else
  {
    -[CSDRelayClientController pullRemotelyHostedCallsForMessage:completion:]( self,  "pullRemotelyHostedCallsForMessage:completion:",  v6,  v7);
  }
}

- (void)handleUpdateCallContextAvailableMessageFromHost:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v11 callCapabilitiesState]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSDCallCapabilities sharedInstance](&OBJC_CLASS___CSDCallCapabilities, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 callCapabilitiesState]);
    [v5 updatePairedHostDeviceCallCapabilitiesState:v6];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 providers]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callProviderManager]);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v11 tuProviders]);
    [v9 registerPairedHostDeviceProviders:v10];
  }
}

- (void)handleNeedsManualInCallSoundsChangeMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    objc_msgSend(v6, "setNeedsManualInCallSounds:", objc_msgSend(v4, "needsManualInCallSounds"));
    objc_msgSend(v6, "setSoundRegion:", objc_msgSend(v4, "soundRegion"));
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleInvitationSentMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    [v6 setLocallyHasSentInvitation];
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleUpdateCallDisplayContextMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 tuHandle]);
    [v6 setHandle:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 displayContext]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 displayContext]);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 displayContextByMergingWithDisplayContext:v9]);
    [v6 setDisplayContext:v10];
  }

  else
  {
    id v11 = sub_1001704C4();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v14 = 138412546;
      unsigned __int8 v15 = v12;
      __int16 v16 = 2112;
      __int128 v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v14,  0x16u);
    }
  }
}

- (void)handleUpdateRemoteUplinkMutedMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    objc_msgSend(v6, "setRemoteUplinkMuted:", objc_msgSend(v4, "isRemoteUplinkMuted"));
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleUpdateRoutesMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 routes]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routes", 0));
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      int v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v11) tuRoute]);
        [v6 addObject:v12];

        int v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pairedHostDeviceRouteController]);
  id v15 = [v6 copy];
  [v14 handleUpdatedPairedHostDeviceRoutes:v15];
}

- (void)handleUpdateFailureExpectedMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    objc_msgSend(v6, "setFailureExpected:", objc_msgSend(v4, "isFailureExpected"));
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleUpdateSupportsEmergencyFallbackMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    objc_msgSend(v6, "setSupportsEmergencyFallback:", objc_msgSend(v4, "supportsEmergencyFallback"));
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleUpdateSupportsTTYWithVoiceMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayClientController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    objc_msgSend(v6, "setSupportsTTYWithVoice:", objc_msgSend(v4, "supportsTTYWithVoice"));
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)pullRemotelyHostedCallsForMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x3032000000LL;
  v27[3] = sub_100047AB0;
  v27[4] = sub_100047AD8;
  id v18 = a4;
  id v28 = objc_retainBlock(v18);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 protoCalls]);
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    id obj = v7;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_alloc(&OBJC_CLASS___CSDRelayConferenceConnection);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueProxyIdentifier", v18));
        int v14 = -[CSDRelayConferenceConnection initWithIdentifier:](v12, "initWithIdentifier:", v13);

        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 inviteData]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 relayInviteDictionary]);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_100047AE0;
        v20[3] = &unk_1003D7F38;
        __int128 v22 = v27;
        v20[4] = self;
        v20[5] = v11;
        id v21 = v6;
        [v15 prepareConferenceConnection:v14 remoteInviteDictionary:v17 completion:v20];

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v7 = obj;
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }

    while (v8);
  }

  _Block_object_dispose(v27, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end