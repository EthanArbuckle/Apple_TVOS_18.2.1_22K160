@interface CSDRelayHostController
- (CSDRelayHostController)initWithQueue:(id)a3 conversationManager:(id)a4 featureFlags:(id)a5;
- (OS_dispatch_queue)queue;
- (TUConversationManager)conversationManager;
- (TUFeatureFlags)featureFlags;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (void)_answerHostedCall:(id)a3 completionHandler:(id)a4;
- (void)_conferenceTransport:(id)a3 didStopForCall:(id)a4 cleanly:(BOOL)a5 error:(id)a6;
- (void)_launchInCallApplicationForOutgoingCallOnHostIfNecessary;
- (void)handleAnswerCallMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5;
- (void)handleDialCallMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5 completion:(id)a6;
- (void)handleDisconnectAllCallsMessageFromClient:(id)a3;
- (void)handleDisconnectCallMessageFromClient:(id)a3;
- (void)handleDisconnectCurrentCallAndActivateHeldMessageFromClient:(id)a3;
- (void)handleEndActiveAndAnswerMessageFromClient:(id)a3;
- (void)handleEndHeldAndAnswerMessageFromClient:(id)a3;
- (void)handleGroupCallMessageFromClient:(id)a3;
- (void)handleHoldActiveAndAnswerMessageFromClient:(id)a3;
- (void)handleHoldCallMessageFromClient:(id)a3;
- (void)handleJoinConversationMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5 completion:(id)a6;
- (void)handlePickRouteMessageFromClient:(id)a3;
- (void)handlePullHostedCallsMessageFromClient:(id)a3 destination:(id)a4 fromPairedDevice:(BOOL)a5 completion:(id)a6;
- (void)handlePushRelayingCallsMessageFromClient:(id)a3;
- (void)handleRequestCallContextMessageFromClient:(id)a3 fromDevice:(id)a4;
- (void)handleSendHardPauseDigitsMessageFromClient:(id)a3;
- (void)handleSwapCallsMessageFromClient:(id)a3;
- (void)handleUngroupCallMessageFromClient:(id)a3;
- (void)handleUnholdCallMessageFromClient:(id)a3;
- (void)pushHostedCallsForRemoteInviteDictionary:(id)a3 destination:(id)a4 toPairedDevice:(BOOL)a5 completion:(id)a6;
- (void)setFeatureFlags:(id)a3;
@end

@implementation CSDRelayHostController

- (CSDRelayHostController)initWithQueue:(id)a3 conversationManager:(id)a4 featureFlags:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSDRelayHostController;
  v12 = -[CSDRelayHostController init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_featureFlags, a5);
    objc_storeStrong((id *)&v13->_conversationManager, a4);
  }

  return v13;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callWithUniqueProxyIdentifier:v4]);

  return v7;
}

- (void)_answerHostedCall:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if ([v6 isHostedOnCurrentDevice])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController relayMessagingController](self, "relayMessagingController"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100150558;
    v11[3] = &unk_1003DB308;
    id v12 = v6;
    v13 = self;
    id v14 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueProxyIdentifier]);
    [v9 performBlockOnTransportAvailability:v11 forIdentifier:v10];
  }
}

- (void)_conferenceTransport:(id)a3 didStopForCall:(id)a4 cleanly:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  if ([v11 status] == 5 || objc_msgSend(v11, "status") == 6)
  {
    id v14 = sub_1001704C4();
    objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Received did stop for call that is already disconnecting/disconnected",  (uint8_t *)&v21,  2u);
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 relayClientTransport]);
    unsigned int v17 = [v16 isEqualToTransport:v10];

    id v18 = sub_1001704C4();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    objc_super v15 = v19;
    if (v17)
    {
      if (v7)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          id v22 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Conference connection ended for call %@. Disconnecting call normally",  (uint8_t *)&v21,  0xCu);
        }

        objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
        -[os_log_s disconnectCall:](v15, "disconnectCall:", v11);
      }

      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1002B8150((uint64_t)v11, (uint64_t)v12, v15);
        }

        objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
        -[os_log_s disconnectCall:withReason:](v15, "disconnectCall:withReason:", v11, 8LL);
      }
    }

    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v11 relayClientTransport]);
      int v21 = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      v24 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Not disconnecting call because this conference transport is %@ but the call's current relay client transport is %@",  (uint8_t *)&v21,  0x16u);
    }
  }
}

- (void)_launchInCallApplicationForOutgoingCallOnHostIfNecessary
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "_launchInCallApplicationForOutgoingCallOnHostIfNecessary",  v7,  2u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v6, &stru_1003DB328);
}

- (void)handleDialCallMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 dialRequest]);
  unsigned int v15 = [v14 isSOS];

  if (v15)
  {
    id v16 = sub_1001704C4();
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "For received dial call message, the dial request is SOS, so disconnecting all existing calls immediately.",  buf,  2u);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    [v18 disconnectAllCalls];
  }

  if (v12)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevice]);
    unsigned __int8 v21 = [v20 isEqual:v12];

    char v22 = v21 ^ 1;
  }

  else
  {
    char v22 = 1;
  }

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRouteManager sharedInstance](&OBJC_CLASS___CSDRouteManager, "sharedInstance"));
  unsigned int v24 = [v23 isEligibleRouteAvailable];

  if (([v10 hasSourceIdentifier] & 1) == 0
    && (v22 & 1) == 0
    && ([v10 cannotRelayAudioOrVideoOnPairedDevice] | v24) == 1)
  {
    id v25 = sub_1001704C4();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v27 = [v10 cannotRelayAudioOrVideoOnPairedDevice];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v58 = v27;
      *(_WORD *)&v58[4] = 1024;
      *(_DWORD *)&v58[6] = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Dialing without relay because cannotRelayAudioOrVideoOnPairedDevice is set (%d) or an eligible route is available (%d)",  buf,  0xEu);
    }

    v28 = (CSDRelayConferenceConnection *)objc_claimAutoreleasedReturnValue([v10 dialRequest]);
    -[CSDRelayConferenceConnection setEndpointOnCurrentDevice:](v28, "setEndpointOnCurrentDevice:", 1LL);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_1001510D4;
    v53[3] = &unk_1003DB370;
    id v54 = v10;
    id v55 = v11;
    v56 = self;
    [v29 dialWithRequest:v28 completion:v53];

    (*((void (**)(id, void, void))v13 + 2))(v13, 0LL, 0LL);
    goto LABEL_26;
  }

  id v30 = sub_1001704C4();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v32 = [v10 hasSourceIdentifier];
    unsigned int v33 = [v10 cannotRelayAudioOrVideoOnPairedDevice];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v58 = 0;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = v32;
    __int16 v59 = 1024;
    unsigned int v60 = v33;
    __int16 v61 = 1024;
    unsigned int v62 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Dialing with relay. isTinCanProvider: %d, message.hasSourceIdentifier: %d, message.cannotRelayAudioOrVideoOnPaired Device: %d, eligibleRouteAvailable: %d",  buf,  0x1Au);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  if (([v34 anyCallIsEndpointOnCurrentDevice] & 1) == 0)
  {

    goto LABEL_22;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue([v10 dialRequest]);
  unsigned int v36 = [v35 isSOS];

  if (v36)
  {
LABEL_22:
    v42 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueProxyIdentifier]);
    v28 = -[CSDRelayConferenceConnection initWithIdentifier:]( objc_alloc(&OBJC_CLASS___CSDRelayConferenceConnection),  "initWithIdentifier:",  v42);
    -[CSDRelayConferenceConnection setHost:](v28, "setHost:", 1LL);
    -[CSDRelayConferenceConnection setAudioDisabled:](v28, "setAudioDisabled:", 1LL);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v10 tuProvider]);
    if ([v43 isTelephonyProvider]) {
      uint64_t v44 = +[TUCallCapabilities isWiFiCallingCurrentlyAvailable]( &OBJC_CLASS___TUCallCapabilities,  "isWiFiCallingCurrentlyAvailable") ^ 1;
    }
    else {
      uint64_t v44 = 0LL;
    }
    -[CSDRelayConferenceConnection setUsingBaseband:](v28, "setUsingBaseband:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v10 inviteData]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v46 relayInviteDictionary]);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1001511C4;
    v49[3] = &unk_1003DB410;
    v49[4] = self;
    id v50 = v10;
    id v51 = v42;
    id v52 = v13;
    id v48 = v42;
    [v45 prepareConferenceConnection:v28 remoteInviteDictionary:v47 completion:v49];

LABEL_26:
    goto LABEL_27;
  }

  id v37 = sub_1001704C4();
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue([v10 typeString]);
    *(_DWORD *)buf = 138412290;
    *(void *)v58 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received %@ message, but we already have some non-relaying calls. Sending device busy message.",  buf,  0xCu);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController relayMessagingController](self, "relayMessagingController"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueProxyIdentifier]);
  [v40 sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier:v41];

  (*((void (**)(id, void, void))v13 + 2))(v13, 0LL, 0LL);
LABEL_27:
}

- (void)handleJoinConversationMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 joinConversationRequest]);
  [v12 setEndpointOnCurrentDevice:0];
  [v12 setHostedOnCurrentDevice:1];
  id v13 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueProxyIdentifier]);
  unsigned int v15 = -[NSUUID initWithUUIDString:](v13, "initWithUUIDString:", v14);
  [v12 setUUID:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  LODWORD(v14) = [v16 anyCallIsEndpointOnCurrentDevice];

  if ((_DWORD)v14)
  {
    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v9 typeString]);
      *(_DWORD *)buf = 138412290;
      v40 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received %@ message, but we already have some non-relaying calls. Sending device busy message.",  buf,  0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController relayMessagingController](self, "relayMessagingController"));
    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueProxyIdentifier]);
    [v20 sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier:v21];

    (*((void (**)(id, void, void))v11 + 2))(v11, 0LL, 0LL);
  }

  char v22 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);

  unsigned int v24 = -[CSDRelayConferenceConnection initWithIdentifier:]( objc_alloc(&OBJC_CLASS___CSDRelayConferenceConnection),  "initWithIdentifier:",  v23);
  -[CSDRelayConferenceConnection setHost:](v24, "setHost:", 1LL);
  -[CSDRelayConferenceConnection setAudioDisabled:](v24, "setAudioDisabled:", 1LL);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v9 inviteData]);
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 relayInviteDictionary]);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100151ABC;
  v33[3] = &unk_1003DB488;
  v33[4] = self;
  id v34 = v12;
  id v35 = v10;
  id v36 = v23;
  id v37 = v9;
  id v38 = v11;
  id v28 = v11;
  id v29 = v9;
  id v30 = v23;
  id v31 = v10;
  id v32 = v12;
  [v25 prepareConferenceConnection:v24 remoteInviteDictionary:v27 completion:v33];
}

- (void)handleAnswerCallMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueProxyIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v11));

  if (v12)
  {
    if (v10
      && (id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance")),
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pairedDevice]),
          unsigned int v15 = [v14 isEqual:v10],
          v14,
          v13,
          v15)
      && (([v8 cannotRelayAudioOrVideoOnPairedDevice] & 1) != 0
       || [v8 wantsHoldMusic]))
    {
      id v16 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)id v35 = [v8 wantsHoldMusic];
        *(_WORD *)&v35[4] = 1024;
        *(_DWORD *)&v35[6] = [v8 cannotRelayAudioOrVideoOnPairedDevice];
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Answering without relay because wantsHoldMusic is set (%d) or cannotRelayAudioOrVideoOnPairedDevice is set (%d)",  buf,  0xEu);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRouteManager sharedInstance](&OBJC_CLASS___CSDRouteManager, "sharedInstance"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 preferredRouteForCall:v12]);

      id v20 = [[TUAnswerRequest alloc] initWithCall:v12];
      if (v19) {
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 uniqueIdentifier]);
      }
      else {
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v8 sourceIdentifier]);
      }
      id v25 = (void *)v21;
      [v20 setSourceIdentifier:v21];

      objc_msgSend(v20, "setWantsHoldMusic:", objc_msgSend(v8, "wantsHoldMusic"));
      objc_msgSend(v20, "setPauseVideoToStart:", objc_msgSend(v8, "wantsHoldMusic"));
      if ([v12 isVideo])
      {
        if ([v8 hasProtoVideo])
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
          unsigned __int8 v27 = [v26 isGreenTea];

          if ((v27 & 1) == 0)
          {
            id v28 = sub_1001704C4();
            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Requesting downgrade to audio because paired device requested to answer call and we are not green tea",  buf,  2u);
            }

            [v20 setBehavior:4];
          }
        }
      }

      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
      [v30 answerWithRequest:v20];
    }

    else
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1001524BC;
      v31[3] = &unk_1003D7758;
      id v32 = v12;
      id v33 = v8;
      -[CSDRelayHostController _answerHostedCall:completionHandler:]( self,  "_answerHostedCall:completionHandler:",  v32,  v31);

      v19 = v32;
    }
  }

  else
  {
    id v22 = sub_1001704C4();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueProxyIdentifier]);
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      *(_DWORD *)buf = 138412546;
      *(void *)id v35 = v23;
      *(_WORD *)&v35[8] = 2112;
      id v36 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  buf,  0x16u);
    }
  }
}

- (void)handleDisconnectCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    objc_msgSend(v7, "disconnectCall:withReason:", v6, objc_msgSend(v4, "disconnectedReason"));

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
    [v8 stopConferenceForIdentifier:v9];
  }

  else
  {
    id v10 = sub_1001704C4();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)handleHoldCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    [v7 holdCall:v6];
  }

  else
  {
    id v8 = sub_1001704C4();
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleUnholdCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    [v7 unholdCall:v6];
  }

  else
  {
    id v8 = sub_1001704C4();
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleGroupCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (!v6)
  {
    id v11 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
    *(_DWORD *)buf = 138412546;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  buf,  0x16u);

    goto LABEL_13;
  }

  if ([v4 otherUniqueProxyIdentifiersCount])
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 otherUniqueProxyIdentifiers]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDRelayHostController callWithUniqueProxyIdentifier:]( self,  "callWithUniqueProxyIdentifier:",  v8));

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
      [v10 groupCall:v6 withOtherCall:v9];

      goto LABEL_17;
    }

    id v20 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 otherUniqueProxyIdentifiers]);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      *(_DWORD *)buf = 138412546;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with other uniqueProxyIdentifier %@. All current calls: %@",  buf,  0x16u);
    }

- (void)handleUngroupCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    [v7 ungroupCall:v6];
  }

  else
  {
    id v8 = sub_1001704C4();
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)handleSwapCallsMessageFromClient:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance", a3));
  [v3 swapCalls];
}

- (void)handleEndActiveAndAnswerMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100153018;
    v11[3] = &unk_1003D7730;
    id v12 = v6;
    -[CSDRelayHostController _answerHostedCall:completionHandler:]( self,  "_answerHostedCall:completionHandler:",  v12,  v11);
    BOOL v7 = v12;
  }

  else
  {
    id v8 = sub_1001704C4();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      *(_DWORD *)buf = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  buf,  0x16u);
    }
  }
}

- (void)handleEndHeldAndAnswerMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001531D0;
    v11[3] = &unk_1003D7730;
    id v12 = v6;
    -[CSDRelayHostController _answerHostedCall:completionHandler:]( self,  "_answerHostedCall:completionHandler:",  v12,  v11);
    BOOL v7 = v12;
  }

  else
  {
    id v8 = sub_1001704C4();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      *(_DWORD *)buf = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  buf,  0x16u);
    }
  }
}

- (void)handleHoldActiveAndAnswerMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v5));

  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100153388;
    v11[3] = &unk_1003D7730;
    id v12 = v6;
    -[CSDRelayHostController _answerHostedCall:completionHandler:]( self,  "_answerHostedCall:completionHandler:",  v12,  v11);
    BOOL v7 = v12;
  }

  else
  {
    id v8 = sub_1001704C4();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController allCalls](self, "allCalls"));
      *(_DWORD *)buf = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@",  buf,  0x16u);
    }
  }
}

- (void)handleDisconnectCurrentCallAndActivateHeldMessageFromClient:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  [v4 disconnectCurrentCallAndActivateHeld];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[CSDRelayConferenceInterface sharedInstance](&OBJC_CLASS___CSDRelayConferenceInterface, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueProxyIdentifier]);

  [v6 stopConferenceForIdentifier:v5];
}

- (void)handleDisconnectAllCallsMessageFromClient:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  [v4 disconnectAllCalls];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[CSDRelayConferenceInterface sharedInstance](&OBJC_CLASS___CSDRelayConferenceInterface, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueProxyIdentifier]);

  [v6 stopConferenceForIdentifier:v5];
}

- (void)handleSendHardPauseDigitsMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);

  if (v5)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayHostController callWithUniqueProxyIdentifier:](self, "callWithUniqueProxyIdentifier:", v6));
LABEL_3:

    [v7 sendHardPauseDigits];
    goto LABEL_4;
  }

  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No call was specified with SendHardPauseDigits message...",  (uint8_t *)&v13,  2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v10 callPassingTest:&stru_1003DB4A8]);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v6 = v12;
  if (v7)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "...so sending hard pause digits for call %@",  (uint8_t *)&v13,  0xCu);
    }

    goto LABEL_3;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1002B83E8(v6);
  }

LABEL_4:
}

- (void)handleRequestCallContextMessageFromClient:(id)a3 fromDevice:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController relayMessagingController](self, "relayMessagingController"));
  [v6 sendResetStateMessageToClient];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController relayMessagingController](self, "relayMessagingController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController callStateController](self, "callStateController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 callProviderManager]);
  [v7 sendUpdateCallContextMessageToClientForCallProviderManager:v9];

  LODWORD(v7) = [v5 canReceiveRelayedGFTCalls];
  if ((_DWORD)v7)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayController relayMessagingController](self, "relayMessagingController"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 conversationManager]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeConversations]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
    [v14 sendUpdateConversationsMessageToClient:v13];
  }

- (void)handlePullHostedCallsMessageFromClient:(id)a3 destination:(id)a4 fromPairedDevice:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayController relayMessagingController](self, "relayMessagingController"));
  [v13 sendUpdateRemoteCallStateMessageToClient:1];

  id v15 = (id)objc_claimAutoreleasedReturnValue([v12 inviteData]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v15 relayInviteDictionary]);
  -[CSDRelayHostController pushHostedCallsForRemoteInviteDictionary:destination:toPairedDevice:completion:]( self,  "pushHostedCallsForRemoteInviteDictionary:destination:toPairedDevice:completion:",  v14,  v11,  v6,  v10);
}

- (void)handlePushRelayingCallsMessageFromClient:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 callsWithAnEndpointElsewhere]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 sourceIdentifier]);
    if (v7
      && (id v8 = (void *)v7,
          id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRouteManager sharedInstance](&OBJC_CLASS___CSDRouteManager, "sharedInstance")),
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 sourceIdentifier]),
          unsigned int v11 = [v9 isAnyRouteAvailableWithUniqueIdentifier:v10 forCall:v6],
          v10,
          v9,
          v8,
          !v11))
    {
      id v28 = sub_1001704C4();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v3 sourceIdentifier]);
        *(_DWORD *)buf = 138412290;
        id v38 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find any audio route with source identifier %@. Ignoring push relaying calls request",  buf,  0xCu);
      }
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 sourceIdentifier]);

      if (v12)
      {
        id v13 = sub_1001704C4();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 sourceIdentifier]);
          *(_DWORD *)buf = 138412290;
          id v38 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Setting sourceIdentifier to %@ for all calls before pulling",  buf,  0xCu);
        }

        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance", 0LL));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentAudioAndVideoCalls]);

        id v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v33;
          do
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v33 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
              __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v3 sourceIdentifier]);
              [v22 setSourceIdentifier:v23];
            }

            id v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }

          while (v19);
        }
      }

      else
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL faceTimeShowInCallUIURL](&OBJC_CLASS___NSURL, "faceTimeShowInCallUIURL"));
        id v30 = sub_1001704C4();
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Opening URL for handled pushRelayingCalls message from client: %@",  buf,  0xCu);
        }

        TUOpenURL(v17);
      }

      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
      -[os_log_s pullRelayingCallsFromClient](v25, "pullRelayingCallsFromClient");
    }
  }

  else
  {
    id v24 = sub_1001704C4();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
      unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 _allCalls]);
      *(_DWORD *)buf = 138412290;
      id v38 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Asked to pull relaying calls from client when no calls with an endpoint elsewhere exist. All calls: %@",  buf,  0xCu);
    }
  }
}

- (void)handlePickRouteMessageFromClient:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 route]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 tuRoute]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 routeController]);
  [v5 pickRoute:v6];
}

- (void)pushHostedCallsForRemoteInviteDictionary:(id)a3 destination:(id)a4 toPairedDevice:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v25 = a3;
  id v26 = a4;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = sub_100154020;
  v32[4] = sub_100154048;
  id v24 = a6;
  id v33 = objc_retainBlock(v24);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  if ([v10 hasCurrentVideoCalls] & v7)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    unsigned int v12 = [v11 isGreenTea];

    if (v12)
    {
      id v13 = sub_1001704C4();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] We cannot send video calls to audio only device in china",  buf,  2u);
      }

      (*((void (**)(id, void))v24 + 2))(v24, 0LL);
      goto LABEL_20;
    }
  }

  else
  {
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentAudioAndVideoCalls]);

  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        if ([v20 hasRelaySupport:2])
        {
          [v20 setEndpointOnCurrentDevice:0];
          [v20 setExpectedRelayClientDestination:v26];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472LL;
          v27[2] = sub_100154050;
          v27[3] = &unk_1003DB4F8;
          v27[5] = self;
          v27[6] = v32;
          v27[4] = v20;
          [v21 prepareConferenceForCall:v20 remoteInviteDictionary:v25 completion:v27];
        }

        else
        {
          id v22 = sub_1001704C4();
          __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v35 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[WARN] Asked to push relaying calls to client but current call: %@ does not support audio+video relay",  buf,  0xCu);
          }
        }
      }

      id v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v17);
  }

LABEL_20:
  _Block_object_dispose(v32, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (void).cxx_destruct
{
}

@end