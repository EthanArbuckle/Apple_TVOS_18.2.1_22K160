@interface CSDRelayCallDelegate
- (BOOL)_anyOtherCallHasAnEndpointElsewhere:(id)a3;
- (CSDCallController)callController;
- (CSDCallStateController)callStateController;
- (CSDRelayCallDelegate)init;
- (CSDRelayMessagingController)relayMessagingController;
- (TUDTMFSoundPlayer)dtmfSoundPlayer;
- (id)localProviderWithIdentifier:(id)a3;
- (void)_handleJoinConversationResponse:(BOOL)a3 sessionAvailable:(BOOL)a4 forRelayCall:(id)a5;
- (void)_setAllCallsToHeldExceptCall:(id)a3;
- (void)relayCall:(id)a3 didAnswerWithRequest:(id)a4;
- (void)relayCall:(id)a3 didGroupWithOtherCall:(id)a4;
- (void)relayCall:(id)a3 didPlayLocalDTMFToneForKey:(unsigned __int8)a4;
- (void)relayCallConferenceDidStartSuccessfullyForIncomingAnsweredCall:(id)a3;
- (void)relayCallConferenceDidStartSuccessfullyForPulledCall:(id)a3;
- (void)relayCallConferenceDidStop:(id)a3 cleanly:(BOOL)a4 error:(id)a5;
- (void)relayCallConferenceFailedToStart:(id)a3;
- (void)relayCallDidBecomeEndpointForPull:(id)a3;
- (void)relayCallDidDial:(id)a3;
- (void)relayCallDidDisconnect:(id)a3;
- (void)relayCallDidHold:(id)a3;
- (void)relayCallDidJoin:(id)a3;
- (void)relayCallDidPerformUplinkMuted:(id)a3 uplinkMuted:(BOOL)a4;
- (void)relayCallDidSendHardPauseDigits:(id)a3;
- (void)relayCallDidUngroup:(id)a3;
- (void)relayCallDidUnhold:(id)a3;
- (void)setCallStateController:(id)a3;
@end

@implementation CSDRelayCallDelegate

- (CSDRelayCallDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDRelayCallDelegate;
  v2 = -[CSDRelayCallDelegate init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TUDTMFSoundPlayer);
    dtmfSoundPlayer = v2->_dtmfSoundPlayer;
    v2->_dtmfSoundPlayer = v3;
  }

  return v2;
}

- (CSDRelayMessagingController)relayMessagingController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate callStateController](self, "callStateController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 relayMessagingController]);

  return (CSDRelayMessagingController *)v3;
}

- (CSDCallController)callController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate callStateController](self, "callStateController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 callController]);

  return (CSDCallController *)v3;
}

- (void)_setAllCallsToHeldExceptCall:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate callController](self, "callController", 0LL));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callContainer]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callsHostedElsewhere]);

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v13 + 1) + 8LL * (void)v11);
        if (v12 != v4) {
          [v12 setCallStatus:2];
        }
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (BOOL)_anyOtherCallHasAnEndpointElsewhere:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate callController](self, "callController", 0LL));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callContainer]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callsHostedElsewhere]);

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(id *)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (v13 != v4)
        {
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) setCallStatus:2];
          if ((v10 & 1) != 0) {
            char v10 = 1;
          }
          else {
            char v10 = [v13 isEndpointOnCurrentDevice] ^ 1;
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  else
  {
    char v10 = 0;
  }

  return v10 & 1;
}

- (void)_handleJoinConversationResponse:(BOOL)a3 sessionAvailable:(BOOL)a4 forRelayCall:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (!a3)
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002B9030();
    }

    __int128 v14 = v9;
    uint64_t v15 = 9LL;
    goto LABEL_11;
  }

  if (!a4)
  {
    id v16 = sub_1001704C4();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1002B8FD0();
    }

    __int128 v14 = v9;
    uint64_t v15 = 8LL;
LABEL_11:
    [v14 setLocallyDisconnectedWithReasonIfNone:v15];
    goto LABEL_12;
  }

  if ([v8 isEndpointOnCurrentDevice])
  {
    char v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100168EF0;
    v18[3] = &unk_1003DB950;
    id v19 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueProxyIdentifier]);
    [v10 performBlockOnTransportAvailability:v18 forIdentifier:v11];
  }

- (id)localProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate callStateController](self, "callStateController"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callProviderManager]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localProvidersByIdentifierForRemoteClients:0]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);
  return v8;
}

- (void)relayCallDidJoin:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hasRelaySupport:2];
  unsigned int v6 = -[CSDRelayCallDelegate _anyOtherCallHasAnEndpointElsewhere:](self, "_anyOtherCallHasAnEndpointElsewhere:", v4);
  unsigned int v7 = v6;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v4 isEndpointOnCurrentDevice];
    uint64_t v11 = @"NO";
    if (v10) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    if (v5) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    id v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    if (v7) {
      uint64_t v11 = @"YES";
    }
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Determined if endpoint should be on current device: %@; hasRelaySupport: %@, anyOtherCallHasAnEndpointElsewhere: %@",
      buf,
      0x20u);
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 joinConversationRequest]);
  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10016922C;
    v16[3] = &unk_1003DB978;
    v16[4] = self;
    id v17 = v4;
    [v15 sendJoinConversationMessageToHostForCall:v17 completionHandler:v16];
  }
}

- (void)relayCallDidDial:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hasRelaySupport:2];
  unsigned int v6 = -[CSDRelayCallDelegate _anyOtherCallHasAnEndpointElsewhere:](self, "_anyOtherCallHasAnEndpointElsewhere:", v4);
  unsigned int v7 = v6;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    else {
      unsigned int v10 = @"NO";
    }
    if (v5) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    if (v7) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    *(_DWORD *)buf = 138413058;
    else {
      id v13 = @"NO";
    }
    __int16 v20 = v10;
    __int16 v21 = 2112;
    __int16 v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    __int16 v25 = 2112;
    v26 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Determined if endpoint should be on current device: %@; hasRelaySupport: %@, anyOtherCallHasAnEndpointElsewhere: %"
      "@, relayCall.isSOS: %@",
      buf,
      0x2Au);
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 dialRequest]);
  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100169414;
    v16[3] = &unk_1003DB978;
    id v17 = v4;
    __int128 v18 = self;
    [v15 sendDialCallMessageToHostForCall:v17 completionHandler:v16];
  }
}

- (void)relayCall:(id)a3 didAnswerWithRequest:(id)a4
{
  id v6 = a3;
  if ([v6 canBeAnsweredWithAudioOrVideoRelayWithRequest:a4])
  {
    [v6 setLocallyConnecting];
  }

  else
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting endpoint elsewhere for call because it can't be answered with audio or video relay: %@",  buf,  0xCu);
    }

    [v6 setEndpointOnCurrentDevice:0];
    [v6 setLocallyConnected];
  }

  if ([v6 isEndpointOnCurrentDevice])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10016979C;
    v11[3] = &unk_1003DB950;
    id v12 = v6;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueProxyIdentifier]);
    [v9 performBlockOnTransportAvailability:v11 forIdentifier:v10];
  }
}

- (void)relayCallDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
  [v5 sendDisconnectCallMessageToHostForCall:v4];
}

- (void)relayCallDidHold:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
  [v5 sendHoldCallMessageToHostForCall:v4];
}

- (void)relayCallDidUnhold:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
  [v5 sendUnholdCallMessageToHostForCall:v4];
}

- (void)relayCall:(id)a3 didGroupWithOtherCall:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
  [v8 sendGroupCallMessageToHostForCall:v7 otherCall:v6];
}

- (void)relayCallDidUngroup:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
  [v5 sendUngroupCallMessageToHostForCall:v4];
}

- (void)relayCall:(id)a3 didPlayLocalDTMFToneForKey:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate dtmfSoundPlayer](self, "dtmfSoundPlayer", a3));
  [v5 attemptToPlayKey:v4];
}

- (void)relayCallDidSendHardPauseDigits:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
  [v5 sendSendHardPauseDigitsMessageToHostForCall:v4];
}

- (void)relayCallDidBecomeEndpointForPull:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100169B14;
  v8[3] = &unk_1003DB950;
  id v9 = v4;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  [v5 performBlockOnTransportAvailability:v8 forIdentifier:v7];
}

- (void)relayCallConferenceDidStartSuccessfullyForIncomingAnsweredCall:(id)a3
{
  id v4 = a3;
  -[CSDRelayCallDelegate _setAllCallsToHeldExceptCall:](self, "_setAllCallsToHeldExceptCall:", v4);
  [v4 setLocallyConnected];
}

- (void)relayCallConferenceDidStartSuccessfullyForPulledCall:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL faceTimeShowInCallUIURL](&OBJC_CLASS___NSURL, "faceTimeShowInCallUIURL", a3));
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Opening URL for handled pushHostedCalls message from host: %@",  (uint8_t *)&v6,  0xCu);
  }

  TUOpenURL(v3);
}

- (void)relayCallConferenceFailedToStart:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 isEndpointOnCurrentDevice];
  id v5 = sub_1001704C4();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1002B9210();
    }

    [v3 setLocallyDisconnectedWithReasonIfNone:8];
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Not disconnecting call for failed conference start because it is not an endpoint here: %@",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)relayCallConferenceDidStop:(id)a3 cleanly:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 isEndpointOnCurrentDevice])
  {
    if (v8 || !a4)
    {
      id v12 = sub_1001704C4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1002B9270();
      }

      uint64_t v9 = 8LL;
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    [v7 setLocallyDisconnectedWithReasonIfNone:v9];
  }

  else
  {
    id v10 = sub_1001704C4();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not disconnecting call for conference didStop because it is not an endpoint here: %@",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (void)relayCallDidPerformUplinkMuted:(id)a3 uplinkMuted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayCallDelegate relayMessagingController](self, "relayMessagingController"));
  [v7 sendSetUplinkMutedCallMessageForCall:v6 uplinkMuted:v4];
}

- (CSDCallStateController)callStateController
{
  return (CSDCallStateController *)objc_loadWeakRetained((id *)&self->_callStateController);
}

- (void)setCallStateController:(id)a3
{
}

- (TUDTMFSoundPlayer)dtmfSoundPlayer
{
  return self->_dtmfSoundPlayer;
}

- (void).cxx_destruct
{
}

@end