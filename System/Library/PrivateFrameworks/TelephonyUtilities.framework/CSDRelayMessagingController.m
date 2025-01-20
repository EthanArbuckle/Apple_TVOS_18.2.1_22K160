@interface CSDRelayMessagingController
- (BOOL)_canReceiveGuestSessionInviteForMessageType:(int)a3;
- (BOOL)_shouldDeclineSessionInviteWithMessage:(id)a3;
- (BOOL)_shouldSendToPairedIDSDevice;
- (BOOL)_shouldSendToPairedIDSDevice:(BOOL)a3;
- (BOOL)shouldDeclineSecondSessionInviteWithMessage:(id)a3;
- (BOOL)shouldDeclineSessionInviteWithMessageWhenRelayIsDisabled:(id)a3;
- (BOOL)shouldProcessRelayMessageOfType:(int)a3;
- (BOOL)shouldScreenTimeRestrictMessage:(id)a3;
- (CSDCallContainer)callCenter;
- (CSDRelayIDSSessionMessenger)sessionMessenger;
- (CSDRelayMessagingController)initWithQueue:(id)a3 callContainer:(id)a4 sessionMessenger:(id)a5 localRouteController:(id)a6;
- (CSDRelayMessagingController)initWithQueue:(id)a3 localRouteController:(id)a4;
- (CSDRelayMessagingControllerClientMessagingDelegate)clientMessagingDelegate;
- (CSDRelayMessagingControllerCommonMessagingDelegate)commonMessagingDelegate;
- (CSDRelayMessagingControllerDelegate)delegate;
- (CSDRelayMessagingControllerHostMessagingDelegate)hostMessagingDelegate;
- (CSDRelayPairedDeviceMessenger)pairedDeviceMessenger;
- (CSDRouteController)localRouteController;
- (IDSDestination)dialingIDSDestination;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)_callsWithUniqueProxyIdentifiers:(id)a3;
- (id)bundleIdentifierForProvider:(id)a3;
- (id)identifiersForSessionInvitationWithMessage:(id)a3;
- (id)remoteDeviceForUPI:(id)a3;
- (int64_t)_relayInvitationTimeoutForTimeout:(int64_t)a3;
- (int64_t)timeoutForInvitationWithMessage:(id)a3;
- (void)_handleCallChanged:(id)a3;
- (void)_handleConferenceConnectionDidClose:(id)a3;
- (void)_handleConferenceConnectionDidReceiveData:(id)a3;
- (void)_handleConferenceConnectionWillClose:(id)a3;
- (void)_handleRetrievedLocalInviteDictionary:(id)a3 forMessage:(id)a4;
- (void)_updateDialingIDSDeviceWithHostIDSIdentifier:(id)a3;
- (void)checkShouldIgnoreSessionInviteWithMessage:(id)a3 fromDestination:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)disconnectMessagingConnectionForCall:(id)a3;
- (void)messenger:(id)a3 handledMessage:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)messengerConnectionCouldNotEstablishLink:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5;
- (void)messengerConnectionEnded:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5;
- (void)messengerConnectionFailed:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5;
- (void)performBlockOnTransportAvailability:(id)a3 forIdentifier:(id)a4;
- (void)prepareToDisconnectMessagingConnectionForCall:(id)a3;
- (void)requestAnswerForRequest:(id)a3 forCall:(id)a4;
- (void)sendAddRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5;
- (void)sendAnswerCallMessageToHostForCall:(id)a3;
- (void)sendBuzzMember:(id)a3 toConversation:(id)a4;
- (void)sendCallAnsweredElsewhereMessageToClientForCall:(id)a3;
- (void)sendCallConnectedMessageToClientForCall:(id)a3;
- (void)sendCallDialedMessageToClientForCall:(id)a3;
- (void)sendCallDisconnectedMessageToClientForCall:(id)a3;
- (void)sendCallStartedConnectingMessageToClientForCall:(id)a3;
- (void)sendConversationAudioPriorityToClientForConversation:(id)a3;
- (void)sendConversationToClientForConversation:(id)a3 withConversationMessageType:(int)a4;
- (void)sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier:(id)a3;
- (void)sendDialCallFailedForScreenTimeForUniqueProxyIdentifier:(id)a3;
- (void)sendDialCallFailedForUniqueProxyIdentifier:(id)a3;
- (void)sendDialCallFailedForUniqueProxyIdentifier:(id)a3 withDisconnectedReason:(int)a4;
- (void)sendDialCallMessageToHostForCall:(id)a3 completionHandler:(id)a4;
- (void)sendDisconnectAllCallsMessageToHostForDisconnectedCall:(id)a3;
- (void)sendDisconnectCallMessageToHostForCall:(id)a3;
- (void)sendDisconnectCurrentCallAndActivateHeldMessageToHostForDisconnectedCall:(id)a3;
- (void)sendEndActiveAndAnswerCallMessageToHostForCall:(id)a3;
- (void)sendEndHeldAndAnswerCallMessageToHostForCall:(id)a3;
- (void)sendGroupCallMessageToHostForCall:(id)a3 otherCall:(id)a4;
- (void)sendHardPauseAvailabilityMessageToClientForState:(int)a3 digits:(id)a4;
- (void)sendHoldActiveAndAnswerCallMessageToHostForCall:(id)a3;
- (void)sendHoldCallMessageToHostForCall:(id)a3;
- (void)sendIncomingCallMessageToClientForCall:(id)a3 cannotBeAnswered:(BOOL)a4 cannotRelayAudioOrVideoOnPairedDevice:(BOOL)a5;
- (void)sendInvitationSentMessageToClientForCall:(id)a3;
- (void)sendJoinConversationMessageToHostForCall:(id)a3 completionHandler:(id)a4;
- (void)sendNeedsManualInCallSoundsChangeMessageToClientForCall:(id)a3;
- (void)sendPickRouteMessageToHostForRoute:(id)a3;
- (void)sendPlayDTMFToneForKeyMessageForCall:(id)a3 DTMFKey:(unsigned __int8)a4;
- (void)sendPullCallsMessageToHost;
- (void)sendPullRelayingCallsMessageToClientAndDisconnectCallsWithUPI:(id)a3;
- (void)sendPushCallsMessageToClientDestination:(id)a3;
- (void)sendPushRelayingCallsMessageToHostForSourceIdentifier:(id)a3;
- (void)sendReceivedDTMFUpdateForCall:(id)a3 dtmfUpdate:(id)a4;
- (void)sendRequestCallStateMessageToHost;
- (void)sendResetStateMessageToClient;
- (void)sendResetWantsHoldMusicMessageToClientForCall:(id)a3;
- (void)sendSendHardPauseDigitsMessageToHostForCall:(id)a3;
- (void)sendSetTTYTypeCallMessageForCall:(id)a3 ttyType:(int)a4;
- (void)sendSetUplinkMutedCallMessageForCall:(id)a3 uplinkMuted:(BOOL)a4;
- (void)sendSuppressRingtoneMessageForCall:(id)a3;
- (void)sendSwapCallsMessageToHost;
- (void)sendUngroupCallMessageToHostForCall:(id)a3;
- (void)sendUnholdCallMessageToHostForCall:(id)a3;
- (void)sendUpdateCallContextMessageToClientForCallProviderManager:(id)a3;
- (void)sendUpdateCallDisplayContextMessageToClientForCall:(id)a3;
- (void)sendUpdateCallModelMessageToClientForCall:(id)a3;
- (void)sendUpdateConversationsMessageToClient:(id)a3;
- (void)sendUpdateFailureExpectedMessageToClientForCall:(id)a3;
- (void)sendUpdateRemoteCallStateMessageToClient;
- (void)sendUpdateRemoteCallStateMessageToClient:(BOOL)a3;
- (void)sendUpdateRemoteUplinkMutedCallMessageToClientForCall:(id)a3;
- (void)sendUpdateRemoteUplinkMutedCallMessageToHostForCall:(id)a3;
- (void)sendUpdateRoutesMessageToClientForRoutes:(id)a3;
- (void)sendUpdateSupportsDTMFUpdatesToClientForCall:(id)a3;
- (void)sendUpdateSupportsEmergencyFallbackToClientForCall:(id)a3;
- (void)sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall:(id)a3;
- (void)sendUpdateSystemVolumeForCall:(id)a3 volume:(float)a4;
- (void)setClientMessagingDelegate:(id)a3;
- (void)setCommonMessagingDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialingIDSDestination:(id)a3;
- (void)setHostMessagingDelegate:(id)a3;
@end

@implementation CSDRelayMessagingController

- (CSDRelayMessagingController)initWithQueue:(id)a3 localRouteController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[CSDRelayIDSSessionMessenger initWithQueue:localRouteController:]( objc_alloc(&OBJC_CLASS___CSDRelayIDSSessionMessenger),  "initWithQueue:localRouteController:",  v7,  v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  v10 = -[CSDRelayMessagingController initWithQueue:callContainer:sessionMessenger:localRouteController:]( self,  "initWithQueue:callContainer:sessionMessenger:localRouteController:",  v7,  v9,  v8,  v6);

  return v10;
}

- (CSDRelayMessagingController)initWithQueue:(id)a3 callContainer:(id)a4 sessionMessenger:(id)a5 localRouteController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CSDRelayMessagingController;
  v15 = -[CSDRelayMessagingController init](&v26, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_callCenter, a4);
    objc_storeStrong((id *)&v16->_localRouteController, a6);
    objc_storeStrong((id *)&v16->_sessionMessenger, a5);
    -[CSDRelayIDSMessenger setDelegate:](v16->_sessionMessenger, "setDelegate:", v16);
    objc_storeStrong((id *)&v16->_localRouteController, a6);
    v17 = -[CSDRelayPairedDeviceMessenger initWithQueue:]( objc_alloc(&OBJC_CLASS___CSDRelayPairedDeviceMessenger),  "initWithQueue:",  v16->_queue);
    pairedDeviceMessenger = v16->_pairedDeviceMessenger;
    v16->_pairedDeviceMessenger = v17;

    -[CSDRelayIDSMessenger setDelegate:](v16->_pairedDeviceMessenger, "setDelegate:", v16);
    v19 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    featureFlags = v16->_featureFlags;
    v16->_featureFlags = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v21 addObserver:v16 selector:"_handleConferenceConnectionWillClose:" name:@"CSDRelayConferenceConnectionWillCloseNotification" object:0];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v22 addObserver:v16 selector:"_handleConferenceConnectionDidClose:" name:@"CSDRelayConferenceConnectionDidCloseNotification" object:0];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v23 addObserver:v16 selector:"_handleConferenceConnectionDidReceiveData:" name:@"CSDRelayConferenceConnectionDidReceiveDataNotification" object:0];

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v24 addObserver:v16 selector:"_handleCallChanged:" name:TUCallCenterCallStatusChangedInternalNotification object:0];
  }

  return v16;
}

- (NSString)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@\n",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController dialingIDSDestination](self, "dialingIDSDestination"));
  [v3 appendFormat:@"    dialingIDSDevice: %@\n", v4];

  return (NSString *)v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSDRelayMessagingController;
  -[CSDRelayMessagingController dealloc](&v4, "dealloc");
}

- (int64_t)_relayInvitationTimeoutForTimeout:(int64_t)a3
{
  return a3 + 10;
}

- (void)_handleCallChanged:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CSDRelayCall, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0 && ([v4 isHostedOnCurrentDevice] & 1) == 0)
  {
    if ([v4 isEndpointOnCurrentDevice])
    {
      if ([v4 status] == 4)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
        v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForIdentifier:v8]);

        if (!v9)
        {
          id v10 = sub_1001704C4();
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v12 = 138412290;
            id v13 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Terminating relay call that we don't have a relay session for: %@",  (uint8_t *)&v12,  0xCu);
          }

          [v4 setLocallyDisconnectedWithReasonIfNone:0];
        }
      }
    }
  }
}

- (id)remoteDeviceForUPI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sessionForIdentifier:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteDevice]);
  return v7;
}

- (void)_handleConferenceConnectionWillClose:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138412290;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Handling %@ by preparing connected sessions to end",  buf,  0xCu);
  }

  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007B570;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v8, block);
}

- (void)_handleConferenceConnectionDidClose:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    *(_DWORD *)buf = 138412290;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Handling %@ by ending ending sessions",  buf,  0xCu);
  }

  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007B6B4;
  block[3] = &unk_1003D7730;
  block[4] = self;
  dispatch_async(v8, block);
}

- (void)_handleConferenceConnectionDidReceiveData:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007B77C;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateDialingIDSDeviceWithHostIDSIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 devices]);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v57 = v6;
    __int16 v58 = 2112;
    id v59 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updating dialingIDSDevice using device list %@, host: %@",  buf,  0x16u);
  }

  -[CSDRelayMessagingController setDialingIDSDestination:](self, "setDialingIDSDestination:", 0LL);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v50;
LABEL_5:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v50 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v49 + 1) + 8 * v13);
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }

    id v15 = v14;

    if (!v15) {
      goto LABEL_16;
    }
    id v16 = sub_1001704C4();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "A paired device exists, so using that as the dialing device: %@",  buf,  0xCu);
    }

    id v18 = (id)objc_claimAutoreleasedReturnValue([v15 destination]);
    -[CSDRelayMessagingController setDialingIDSDestination:](self, "setDialingIDSDestination:", v18);
  }

  else
  {
LABEL_11:

LABEL_16:
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCapabilities outgoingRelayCallerID](&OBJC_CLASS___TUCallCapabilities, "outgoingRelayCallerID"));
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v19 = v9;
    id v40 = [v19 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v40)
    {
      id v37 = v4;
      id obj = v19;
      v35 = self;
      id v36 = v9;
      id v18 = 0LL;
      uint64_t v39 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v46 != v39) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "linkedUserURIs", v35));
          id v23 = [v22 countByEnumeratingWithState:&v41 objects:v53 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v42;
            while (2)
            {
              for (j = 0LL; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v42 != v25) {
                  objc_enumerationMutation(v22);
                }
                unsigned int v28 = [v15 isEqualToString:v27];

                if (v28)
                {
                  if (!v18)
                  {
                    id v18 = v21;
                    goto LABEL_35;
                  }

                  id v29 = sub_1001704C4();
                  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v57 = v18;
                    __int16 v58 = 2112;
                    id v59 = v21;
                    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[WARN] We found two devices with matching linkedUserURIs (arbitrarily choosing the first): %@ and %@",  buf,  0x16u);
                  }
                }
              }

              id v24 = [v22 countByEnumeratingWithState:&v41 objects:v53 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }

- (BOOL)_shouldSendToPairedIDSDevice
{
  return -[CSDRelayMessagingController _shouldSendToPairedIDSDevice:](self, "_shouldSendToPairedIDSDevice:", 0LL);
}

- (BOOL)_shouldSendToPairedIDSDevice:(BOOL)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  unsigned int v6 = [v5 pairedDeviceExists];
  if (v6 && !a3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceWithActiveSession]);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceWithActiveSession]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pairedDevice]);
      unsigned int v6 = [v10 isEqual:v12] ^ 1;
    }

    else
    {
      LOBYTE(v6) = 1;
    }
  }

  return v6;
}

- (id)_callsWithUniqueProxyIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter", (void)v16));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 callWithUniqueProxyIdentifier:v11]);

        if (v13) {
          [v5 addObject:v13];
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  id v14 = [v5 copy];
  return v14;
}

- (void)_handleRetrievedLocalInviteDictionary:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayMessagingController identifiersForSessionInvitationWithMessage:]( self,  "identifiersForSessionInvitationWithMessage:",  v7));
  if (v6)
  {
    uint64_t v9 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  0LL);
    id v10 = -[CSDMessagingAVConferenceInviteData initWithRelayInviteDictionary:]( objc_alloc(&OBJC_CLASS___CSDMessagingAVConferenceInviteData),  "initWithRelayInviteDictionary:",  v6);
    -[CSDMessagingRelayMessage setInviteData:](v9, "setInviteData:", v10);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    [v11 sendMessage:v9 andAcceptInvitationIfNecessaryForIdentifier:v12];
  }

  else
  {
    id v13 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1002B3B3C((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    [v21 cancelOrDeclineInvitationForIdentifier:v22];
  }
}

- (void)sendIncomingCallMessageToClientForCall:(id)a3 cannotBeAnswered:(BOOL)a4 cannotRelayAudioOrVideoOnPairedDevice:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendIncomingCallMessageToClientForCall: %@",  buf,  0xCu);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10007C430;
  v23[3] = &unk_1003D87F0;
  id v11 = v8;
  id v24 = v11;
  BOOL v25 = a5;
  uint64_t v12 = objc_retainBlock(v23);
  if (v6)
  {
    id v13 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Call cannot be answered. Only notifying the paired device",  buf,  2u);
    }

    uint64_t v15 = ((uint64_t (*)(void *))v12[2])(v12);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v16 setCannotBeAnswered:1];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v17 sendMessage:v16 completionHandler:0];
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10007C834;
    v19[3] = &unk_1003D8818;
    id v20 = v11;
    v21 = self;
    v22 = v12;
    [v18 prepareConferenceForCall:v20 remoteInviteDictionary:0 completion:v19];

    uint64_t v16 = v20;
  }
}

- (void)sendUpdateConversationsMessageToClient:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateConversationsMessageToClient: %@",  buf,  0xCu);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  54LL);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12);
        id v14 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationRelayMessage);
        uint64_t v15 = -[CSDMessagingConversationRelayMessage initWithConversation:]( v14,  "initWithConversation:",  v13,  (void)v17);
        -[CSDMessagingConversationRelayMessage setType:](v15, "setType:", 1LL);
        -[CSDMessagingRelayMessage addConversations:](v7, "addConversations:", v15);

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
  [v16 sendMessage:v7 completionHandler:0];
}

- (void)sendConversationToClientForConversation:(id)a3 withConversationMessageType:(int)a4
{
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendConversationMessageToClientForConversation: %@",  buf,  0xCu);
  }

  __int128 v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  __int128 v19 = sub_10007CCEC;
  __int128 v20 = &unk_1003D8840;
  id v21 = v6;
  int v22 = a4;
  id v9 = v6;
  id v10 = objc_retainBlock(&v17);
  uint64_t v14 = ((uint64_t (*)(void ***, uint64_t, uint64_t, uint64_t))v10[2])(v10, v11, v12, v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayMessagingController pairedDeviceMessenger]( self,  "pairedDeviceMessenger",  v17,  v18,  v19,  v20));
  [v16 sendMessage:v15 completionHandler:0];
}

- (void)sendConversationAudioPriorityToClientForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendConversationMessageToClientForConversation: %@",  buf,  0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007CEDC;
  v12[3] = &unk_1003D8868;
  id v13 = v4;
  id v7 = v4;
  id v8 = objc_retainBlock(v12);
  uint64_t v9 = ((uint64_t (*)(void))v8[2])();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
  [v11 sendMessage:v10 completionHandler:0];
}

- (void)sendCallDialedMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendCallDialedMessageToClientForCall: %@",  (uint8_t *)&v27,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  3LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
  -[CSDMessagingRelayMessage setTuHandle:](v9, "setTuHandle:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 isoCountryCode]);
  -[CSDMessagingRelayMessage setIsoCountryCode:](v9, "setIsoCountryCode:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
  -[CSDMessagingRelayMessage setTuProvider:isVideo:](v9, "setTuProvider:isVideo:", v12, [v4 isVideo]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 sourceIdentifier]);
  -[CSDMessagingRelayMessage setSourceIdentifier:](v9, "setSourceIdentifier:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  -[CSDMessagingRelayMessage setCallModel:](v9, "setCallModel:", v14);

  -[CSDMessagingRelayMessage setVoicemail:](v9, "setVoicemail:", [v4 isVoicemail]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 callerNameFromNetwork]);
  -[CSDMessagingRelayMessage setCallerNameFromNetwork:](v9, "setCallerNameFromNetwork:", v15);

  -[CSDMessagingRelayMessage setNeedsManualInCallSounds:]( v9,  "setNeedsManualInCallSounds:",  [v4 needsManualInCallSounds]);
  -[CSDMessagingRelayMessage setSoundRegion:](v9, "setSoundRegion:", [v4 soundRegion]);
  -[CSDMessagingRelayMessage setEmergency:](v9, "setEmergency:", [v4 isEmergency]);
  -[CSDMessagingRelayMessage setFailureExpected:](v9, "setFailureExpected:", [v4 isFailureExpected]);
  -[CSDMessagingRelayMessage setSupportsEmergencyFallback:]( v9,  "setSupportsEmergencyFallback:",  [v4 supportsEmergencyFallback]);
  -[CSDMessagingRelayMessage setSOS:](v9, "setSOS:", [v4 isSOS]);
  -[CSDMessagingRelayMessage setSupportsDTMFUpdates:]( v9,  "setSupportsDTMFUpdates:",  [v4 supportsDTMFUpdates]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 displayContext]);
  -[CSDMessagingRelayMessage setDisplayContext:](v9, "setDisplayContext:", v16);

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityUUID]);
  -[CSDMessagingRelayMessage setLocalSenderIdentityUUID:](v9, "setLocalSenderIdentityUUID:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityAccountUUID]);
  -[CSDMessagingRelayMessage setLocalSenderIdentityAccountUUID:](v9, "setLocalSenderIdentityAccountUUID:", v18);

  -[CSDMessagingRelayMessage setRemoteUplinkMuted:]( v9,  "setRemoteUplinkMuted:",  [v4 isRemoteUplinkMuted]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteParticipantHandles]);
  -[CSDMessagingRelayMessage setRemoteParticipantTUHandles:](v9, "setRemoteParticipantTUHandles:", v19);

  -[CSDMessagingRelayMessage setTtyType:](v9, "setTtyType:", [v4 ttyType]);
  -[CSDMessagingRelayMessage setSupportsTTYWithVoice:]( v9,  "setSupportsTTYWithVoice:",  [v4 supportsTTYWithVoice]);
  -[CSDMessagingRelayMessage setOriginatingUIType:](v9, "setOriginatingUIType:", [v4 originatingUIType]);
  if ([v4 isConversation])
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
    if (v21)
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
      -[CSDMessagingRelayMessage setGroupUUIDString:](v9, "setGroupUUIDString:", v23);
    }

    else
    {
      -[CSDMessagingRelayMessage setGroupUUIDString:]( v9,  "setGroupUUIDString:",  @"No GroupUUID populated, but is conversation");
    }
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v24 sendMessage:v9 forIdentifier:v25 customizedForRemoteProtocolVersion:&stru_1003D88A8 completionHandler:0];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice:](self, "_shouldSendToPairedIDSDevice:", 1LL))
  {
    objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v26 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendCallAnsweredElsewhereMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendCallAnsweredElsewhereMessageToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  5LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendCallDisconnectedMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendCallDisconnectedMessageToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  6LL,  v8);

  -[CSDMessagingRelayMessage setDisconnectedReason:]( v9,  "setDisconnectedReason:",  [v4 disconnectedReason]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v11];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
  [v12 sendMessage:v9 wantsAcknowledgement:1 completionHandler:0];
}

- (void)sendCallConnectedMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendCallConnectedMessageToClientForCall: %@",  (uint8_t *)&v14,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  8LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  -[CSDMessagingRelayMessage setCallModel:](v9, "setCallModel:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
  [v11 sendMessage:v9 completionHandler:0];

  if (([v4 isEndpointOnCurrentDevice] & 1) == 0
    && [v4 isOutgoing])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    [v12 sendMessage:v9 forIdentifier:v13];
  }
}

- (void)sendResetWantsHoldMusicMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendResetWantsHoldMusicMessageToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  15LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendUpdateCallDisplayContextMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateCallDisplayContextMessageToClientForCall: %@",  (uint8_t *)&v15,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  37LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 displayContext]);
  -[CSDMessagingRelayMessage setDisplayContext:](v9, "setDisplayContext:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
  -[CSDMessagingRelayMessage setTuHandle:](v9, "setTuHandle:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v12 sendMessage:v9 forIdentifier:v13];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v14 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendUpdateFailureExpectedMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateFailureExpectedMessageToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  47LL,  v8);

  -[CSDMessagingRelayMessage setFailureExpected:](v9, "setFailureExpected:", [v4 isFailureExpected]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendUpdateSupportsEmergencyFallbackToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateSupportsEmergencyFallbackToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  48LL,  v8);

  -[CSDMessagingRelayMessage setSupportsEmergencyFallback:]( v9,  "setSupportsEmergencyFallback:",  [v4 supportsEmergencyFallback]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendUpdateRemoteUplinkMutedCallMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateRemoteUplinkMutedCallMessageToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  39LL,  v8);

  -[CSDMessagingRelayMessage setRemoteUplinkMuted:]( v9,  "setRemoteUplinkMuted:",  [v4 isRemoteUplinkMuted]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  41LL,  v8);

  -[CSDMessagingRelayMessage setSupportsTTYWithVoice:]( v9,  "setSupportsTTYWithVoice:",  [v4 supportsTTYWithVoice]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendUpdateCallModelMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateCallModelMessageToClientForCall: %@",  (uint8_t *)&v14,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  17LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  -[CSDMessagingRelayMessage setCallModel:](v9, "setCallModel:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v11 sendMessage:v9 forIdentifier:v12];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v13 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendDeviceUnavailableMessageToClient",  v9,  2u);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  18LL);
  -[CSDMessagingRelayMessage setDisconnectedReason:](v7, "setDisconnectedReason:", 10LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  [v8 sendMessage:v7 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v4];
}

- (void)sendPullRelayingCallsMessageToClientAndDisconnectCallsWithUPI:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendPullRelayingCallsMessageToClient",  v10,  2u);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  10LL);
  id v8 = [v4 mutableCopy];

  -[CSDMessagingRelayMessage setOtherUniqueProxyIdentifiers:](v7, "setOtherUniqueProxyIdentifiers:", v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  [v9 sendMessage:v7 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
}

- (void)sendResetStateMessageToClient
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendResetStateMessageToClient",  buf,  2u);
  }

  id v5 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  23LL);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentAudioAndVideoCalls]);

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[CSDMessagingRelayMessage addCall:](v5, "addCall:", *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11));
        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v9);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  [v12 sendMessage:v5 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v13 sendMessage:v5 wantsAcknowledgement:1 completionHandler:0];
  }
}

- (void)sendHardPauseAvailabilityMessageToClientForState:(int)a3 digits:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = v4;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendHardPauseAvailabilityMessageToClientForState %d digits: %@",  (uint8_t *)v11,  0x12u);
  }

  id v9 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  24LL);
  -[CSDMessagingRelayMessage setHardPauseDigitsState:](v9, "setHardPauseDigitsState:", v4);
  -[CSDMessagingRelayMessage setHardPauseDigits:](v9, "setHardPauseDigits:", v6);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  [v10 sendMessage:v9 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
}

- (void)sendUpdateRemoteCallStateMessageToClient
{
}

- (void)sendUpdateRemoteCallStateMessageToClient:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v3) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    BOOL v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateRemoteCallStateMessageToClient force=%@",  buf,  0xCu);
  }

  id v8 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  26LL);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter", 0LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentAudioAndVideoCalls]);

  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v11)
  {

LABEL_15:
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    [v17 sendMessage:v8 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];

    goto LABEL_16;
  }

  id v12 = v11;
  uint64_t v13 = *(void *)v20;
  int v14 = 1;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v10);
      }
      __int128 v16 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
      -[CSDMessagingRelayMessage addCall:](v8, "addCall:", v16);
      v14 &= [v16 isConnected];
    }

    id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }

  while (v12);

  if ((v14 & 1) != 0) {
    goto LABEL_15;
  }
LABEL_16:
  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice:](self, "_shouldSendToPairedIDSDevice:", v3))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v18 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendCallStartedConnectingMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendCallStartedConnectingMessageToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  29LL,  v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
  [v10 sendMessage:v9 completionHandler:0];

  if (([v4 isEndpointOnCurrentDevice] & 1) == 0
    && [v4 isOutgoing])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    [v11 sendMessage:v9 forIdentifier:v12];
  }
}

- (void)sendDialCallFailedForUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendDialCallFailedForUniqueProxyIdentifier: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDRelayMessagingController sendDialCallFailedForUniqueProxyIdentifier:withDisconnectedReason:]( self,  "sendDialCallFailedForUniqueProxyIdentifier:withDisconnectedReason:",  v4,  14LL);
}

- (void)sendDialCallFailedForScreenTimeForUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendDialCallFailedForScreenTimeForUniqueProxyIdentifier: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[CSDRelayMessagingController sendDialCallFailedForUniqueProxyIdentifier:withDisconnectedReason:]( self,  "sendDialCallFailedForUniqueProxyIdentifier:withDisconnectedReason:",  v4,  25LL);
}

- (void)sendDialCallFailedForUniqueProxyIdentifier:(id)a3 withDisconnectedReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v9 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  2LL);
  -[CSDMessagingRelayMessage setUniqueProxyIdentifier:](v9, "setUniqueProxyIdentifier:", v6);
  -[CSDMessagingRelayMessage setDisconnectedReason:](v9, "setDisconnectedReason:", v4);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  [v7 sendMessage:v9 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v6];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v8 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendPushCallsMessageToClientDestination:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendPushCallsMessageToClientDestination: %@",  buf,  0xCu);
  }

  __int128 v41 = self;
  __int128 v42 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  30LL);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _allCalls]);

  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceForService:v10]);

  __int128 v44 = (void *)v9;
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pairedDevice]);
    unsigned int v40 = [v13 isEqual:v11];
  }

  else
  {
    unsigned int v40 = 0;
  }

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v8;
  id v14 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (!v14)
  {
    char v43 = 0;
    goto LABEL_36;
  }

  id v15 = v14;
  char v43 = 0;
  uint64_t v16 = *(void *)v58;
  do
  {
    for (i = 0LL; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v58 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
      if (v11)
      {
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v57 + 1) + 8 * (void)i) provider]);
        unsigned int v20 = [v11 canReceiveMessagesForCallProvider:v19];

        if (v20)
        {
          id v21 = sub_1001704C4();
          __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v63 = v18;
            __int16 v64 = 2112;
            id v65 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Allowing call: %@ to be pushed to destination: %@",  buf,  0x16u);
          }

- (void)sendUpdateCallContextMessageToClientForCallProviderManager:(id)a3
{
  id v4 = a3;
  id v5 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  33LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDCallCapabilities sharedInstance](&OBJC_CLASS___CSDCallCapabilities, "sharedInstance"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callCapabilitiesState]);
  -[CSDMessagingRelayMessage setCallCapabilitiesState:](v5, "setCallCapabilitiesState:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 providersByIdentifierForRemoteClients:0]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);
  -[CSDMessagingRelayMessage setTuProviders:](v5, "setTuProviders:", v9);

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) Sending UpdateCallContext message: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
  [v12 sendMessage:v5 completionHandler:0];
}

- (void)sendNeedsManualInCallSoundsChangeMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendNeedsManualInCallSoundsChangeMessageToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  int v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  34LL,  v8);

  -[CSDMessagingRelayMessage setNeedsManualInCallSounds:]( v9,  "setNeedsManualInCallSounds:",  [v4 needsManualInCallSounds]);
  -[CSDMessagingRelayMessage setSoundRegion:](v9, "setSoundRegion:", [v4 soundRegion]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendInvitationSentMessageToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendInvitationSentMessageToClientForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  int v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  uint64_t v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  35LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendUpdateRoutesMessageToClientForRoutes:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateRoutesMessageToClientForRoutes: %@",  buf,  0xCu);
  }

  int v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  44LL);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12);
        id v14 = objc_alloc(&OBJC_CLASS___CSDMessagingRoute);
        id v15 = -[CSDMessagingRoute initWithTURoute:](v14, "initWithTURoute:", v13, (void)v17);
        -[CSDMessagingRelayMessage addRoutes:](v7, "addRoutes:", v15);

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
  [v16 sendMessage:v7 completionHandler:0];
}

- (void)sendUpdateSupportsDTMFUpdatesToClientForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateSupportsDTMFUpdatesToClientForCall: %@",  (uint8_t *)&v12,  0xCu);
  }

  int v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  55LL,  v8);

  -[CSDMessagingRelayMessage setSupportsDTMFUpdates:]( v9,  "setSupportsDTMFUpdates:",  [v4 supportsDTMFUpdates]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];
}

- (void)sendReceivedDTMFUpdateForCall:(id)a3 dtmfUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendReceivedDTMFUpdateForCall: %@ dtmfUpdate: %@",  (uint8_t *)&v16,  0x16u);
  }

  id v10 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  int v12 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v10,  "initWithType:uniqueProxyIdentifier:",  56LL,  v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 digits]);
  -[CSDMessagingRelayMessage setDtmfUpdateDigits:](v12, "setDtmfUpdateDigits:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  [v14 sendMessage:v12 forIdentifier:v15];
}

- (void)sendDialCallMessageToHostForCall:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendDialCallMessageToHostForCall: %@",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dialRequest]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 hostIDSIdentifier]);
  -[CSDRelayMessagingController _updateDialingIDSDeviceWithHostIDSIdentifier:]( self,  "_updateDialingIDSDeviceWithHostIDSIdentifier:",  v11);

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController dialingIDSDestination](self, "dialingIDSDestination"));
  if (!v12)
  {
    id v13 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No dialing IDS device found. If we aren't already in a session, this dial call attempt will fail.",  buf,  2u);
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10007FF80;
  v18[3] = &unk_1003D88F8;
  id v19 = v6;
  __int128 v20 = self;
  id v21 = v7;
  id v16 = v7;
  id v17 = v6;
  [v15 prepareConferenceForCall:v17 remoteInviteDictionary:0 completion:v18];
}

- (void)sendJoinConversationMessageToHostForCall:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendJoinConversationMessageToHostForCall: %@",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dialRequest]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 hostIDSIdentifier]);
  -[CSDRelayMessagingController _updateDialingIDSDeviceWithHostIDSIdentifier:]( self,  "_updateDialingIDSDeviceWithHostIDSIdentifier:",  v11);

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController dialingIDSDestination](self, "dialingIDSDestination"));
  if (!v12)
  {
    id v13 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No dialing IDS device found. If we aren't already in a session, this join conversation request will fail.",  buf,  2u);
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10008051C;
  v18[3] = &unk_1003D88F8;
  id v19 = v6;
  __int128 v20 = self;
  id v21 = v7;
  id v16 = v7;
  id v17 = v6;
  [v15 prepareConferenceForCall:v17 remoteInviteDictionary:0 completion:v18];
}

- (void)sendAnswerCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendAnswerCallMessageToHostForCall: %@",  buf,  0xCu);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100080960;
  v18[3] = &unk_1003D8868;
  id v7 = v4;
  id v19 = v7;
  id v8 = objc_retainBlock(v18);
  if ([v7 isEndpointOnCurrentDevice])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteInviteDictionary]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100080A30;
    v15[3] = &unk_1003D8920;
    id v17 = v8;
    v15[4] = self;
    id v16 = v7;
    [v9 prepareConferenceForCall:v16 remoteInviteDictionary:v10 completion:v15];

    uint64_t v11 = v17;
  }

  else
  {
    uint64_t v12 = ((uint64_t (*)(void *))v8[2])(v8);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueProxyIdentifier]);
    [v13 sendMessage:v11 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v14];
  }
}

- (void)sendDisconnectCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendDisconnectCallMessageToHostForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  9LL,  v8);

  -[CSDMessagingRelayMessage setDisconnectedReason:]( v9,  "setDisconnectedReason:",  [v4 disconnectedReason]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendHoldCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendHoldCallMessageToHostForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  11LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendUnholdCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendUnholdCallMessageToHostForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  12LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendGroupCallMessageToHostForCall:(id)a3 otherCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendGroupCallMessageToHostForCall: %@ otherCall: %@",  (uint8_t *)&v17,  0x16u);
  }

  id v10 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  uint64_t v12 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v10,  "initWithType:uniqueProxyIdentifier:",  13LL,  v11);

  int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueProxyIdentifier]);
  -[CSDMessagingRelayMessage addOtherUniqueProxyIdentifiers:](v12, "addOtherUniqueProxyIdentifiers:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  [v14 sendMessage:v12 forIdentifier:v15];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v16 sendMessage:v12 completionHandler:0];
  }
}

- (void)sendUngroupCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendUngroupCallMessageToHostForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  14LL,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendSwapCallsMessageToHost
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendSwapCallsMessageToHost",  v8,  2u);
  }

  id v5 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  16LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  [v6 sendMessage:v5 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v7 sendMessage:v5 completionHandler:0];
  }
}

- (void)sendEndActiveAndAnswerCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendEndActiveAndAnswerCallMessageToHostForCall: %@",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteInviteDictionary]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10008145C;
  v10[3] = &unk_1003D8948;
  id v11 = v4;
  uint64_t v12 = self;
  id v9 = v4;
  [v7 prepareConferenceForCall:v9 remoteInviteDictionary:v8 completion:v10];
}

- (void)sendEndHeldAndAnswerCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendEndHeldAndAnswerCallMessageToHostForCall: %@",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteInviteDictionary]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000816E0;
  v10[3] = &unk_1003D8948;
  id v11 = v4;
  uint64_t v12 = self;
  id v9 = v4;
  [v7 prepareConferenceForCall:v9 remoteInviteDictionary:v8 completion:v10];
}

- (void)sendHoldActiveAndAnswerCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendHoldActiveAndAnswerCallMessageToHostForCall: %@",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  int v9 = [v7 sessionProtocolVersionForIdentifier:v8];

  if (v9 <= 2)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 callWithStatus:1]);

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 provider]);
      if ([v12 isFaceTimeProvider])
      {

LABEL_9:
        -[CSDRelayMessagingController sendHoldCallMessageToHostForCall:](self, "sendHoldCallMessageToHostForCall:", v11);
        goto LABEL_10;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
      unsigned int v16 = [v15 isFaceTimeProvider];

      if (v16) {
        goto LABEL_9;
      }
    }

- (void)sendDisconnectCurrentCallAndActivateHeldMessageToHostForDisconnectedCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendDisconnectCurrentCallAndActivateHeldToHost",  v12,  2u);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  21LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  -[CSDMessagingRelayMessage setUniqueProxyIdentifier:](v7, "setUniqueProxyIdentifier:", v8);

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);

  [v9 sendMessage:v7 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v10];
  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v11 sendMessage:v7 completionHandler:0];
  }
}

- (void)sendDisconnectAllCallsMessageToHostForDisconnectedCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendDisconnectAllCallsToHost",  v12,  2u);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  22LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  -[CSDMessagingRelayMessage setUniqueProxyIdentifier:](v7, "setUniqueProxyIdentifier:", v8);

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);

  [v9 sendMessage:v7 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v10];
  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v11 sendMessage:v7 completionHandler:0];
  }
}

- (void)sendSendHardPauseDigitsMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendSendHardPauseDigitsMessageToHost",  v11,  2u);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  25LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  -[CSDMessagingRelayMessage setUniqueProxyIdentifier:](v7, "setUniqueProxyIdentifier:", v8);

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);

  [v9 sendMessage:v7 forIdentifier:v10];
}

- (void)sendRequestCallStateMessageToHost
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendRequestCallStateMessageToHost",  v7,  2u);
  }

  id v5 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  28LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
  [v6 sendMessage:v5 timeout:1 wantsAcknowledgement:3 maximumRetryAttempts:0 completionHandler:300.0];
}

- (void)sendPullCallsMessageToHost
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendPullCallsMessageToHost",  buf,  2u);
  }

  id v5 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  31LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _allCalls]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueProxyIdentifier]);
        [v8 addObject:v15];

        -[CSDMessagingRelayMessage addCall:](v5, "addCall:", v14);
      }

      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v11);
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController clientMessagingDelegate](self, "clientMessagingDelegate"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000821B0;
  v19[3] = &unk_1003D8970;
  id v20 = v5;
  id v21 = self;
  id v22 = v8;
  id v17 = v8;
  id v18 = v5;
  [v16 pullRemotelyHostedCallsForMessage:v18 completion:v19];
}

- (void)sendPushRelayingCallsMessageToHostForSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client->Host) sendPushRelayingCallsMessageToHostForSourceIdentifier: %@",  (uint8_t *)&v9,  0xCu);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  32LL);
  -[CSDMessagingRelayMessage setSourceIdentifier:](v7, "setSourceIdentifier:", v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  [v8 sendMessage:v7 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
}

- (void)sendUpdateRemoteUplinkMutedCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendUpdateRemoteUplinkMutedCallMessageToHostForCall: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  int v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  39LL,  v8);

  -[CSDMessagingRelayMessage setRemoteUplinkMuted:]( v9,  "setRemoteUplinkMuted:",  [v4 isRemoteUplinkMuted]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  [v10 sendMessage:v9 forIdentifier:v11];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v12 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendPickRouteMessageToHostForRoute:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Host->Client) sendPickRouteMessageToHostForRoute: %@",  (uint8_t *)&v10,  0xCu);
  }

  id v7 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  45LL);
  id v8 = -[CSDMessagingRoute initWithTURoute:](objc_alloc(&OBJC_CLASS___CSDMessagingRoute), "initWithTURoute:", v4);
  -[CSDMessagingRelayMessage setRoute:](v7, "setRoute:", v8);

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
  [v9 sendMessage:v7 completionHandler:0];
}

- (void)sendPlayDTMFToneForKeyMessageForCall:(id)a3 DTMFKey:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  id v11 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  7LL,  v8);

  -[CSDMessagingRelayMessage setDTMFKey:](v11, "setDTMFKey:", v4);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);

  [v9 sendMessage:v11 forIdentifier:v10];
}

- (void)sendSetTTYTypeCallMessageForCall:(id)a3 ttyType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client<->Host) sendSetTTYTypeCallMessageForCall: %@ ttyType: %d",  (uint8_t *)&v15,  0x12u);
  }

  int v9 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  id v11 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v9,  "initWithType:uniqueProxyIdentifier:",  42LL,  v10);

  -[CSDMessagingRelayMessage setTtyType:](v11, "setTtyType:", v4);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  [v12 sendMessage:v11 forIdentifier:v13];

  if (-[CSDRelayMessagingController _shouldSendToPairedIDSDevice](self, "_shouldSendToPairedIDSDevice"))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController pairedDeviceMessenger](self, "pairedDeviceMessenger"));
    [v14 sendMessage:v11 completionHandler:0];
  }
}

- (void)sendSetUplinkMutedCallMessageForCall:(id)a3 uplinkMuted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client<->Host) sendSetUplinkMutedCallMessageForCall: %@ uplinkMuted: %d",  (uint8_t *)&v14,  0x12u);
  }

  int v9 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  id v11 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v9,  "initWithType:uniqueProxyIdentifier:",  38LL,  v10);

  -[CSDMessagingRelayMessage setUplinkMuted:](v11, "setUplinkMuted:", v4);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  [v12 sendMessage:v11 forIdentifier:v13];
}

- (void)sendSuppressRingtoneMessageForCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client<->Host) sendSuppressRingtoneMessageForCall",  v12,  2u);
  }

  id v7 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  int v9 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v7,  "initWithType:uniqueProxyIdentifier:",  27LL,  v8);

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);

  [v10 sendMessage:v9 forIdentifier:v11 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
}

- (void)sendUpdateSystemVolumeForCall:(id)a3 volume:(float)a4
{
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client<->Host) sendUpdateSystemVolumeForCall: %@",  (uint8_t *)&v15,  0xCu);
  }

  int v9 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  id v11 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v9,  "initWithType:uniqueProxyIdentifier:",  40LL,  v10);

  *(float *)&double v12 = a4;
  -[CSDMessagingRelayMessage setSystemVolume:](v11, "setSystemVolume:", v12);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  [v13 sendMessage:v11 forIdentifier:v14];
}

- (void)sendBuzzMember:(id)a3 toConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
    int v22 = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    __int128 v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client<->Host) sendBuzzMember: %@ toConversationWithUUID: %@",  (uint8_t *)&v22,  0x16u);
  }

  id v11 = -[CSDMessagingRelayMessage initWithType:]( objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage),  "initWithType:",  51LL);
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  v6));
  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v12));
  -[CSDMessagingRelayMessage setConversationMembers:](v11, "setConversationMembers:", v13);

  int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
  -[CSDMessagingRelayMessage setConversationUUIDString:](v11, "setConversationUUIDString:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter"));
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v7 groupUUID]);
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 callForConversationWithGroupUUID:v17]);

  if (v18)
  {
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 uniqueProxyIdentifier]);
    [v19 sendMessage:v11 forIdentifier:v20];
  }

  else
  {
    id v21 = sub_1001704C4();
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
      sub_1002B3CCC(v7, (os_log_s *)v19);
    }
  }
}

- (void)sendAddRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
    int v23 = 138412802;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "(IDSMessaging Client<->Host) sendAddRemoteMembers: %@ otherInvitedHandles: %@ toConversationWithUUID: %@",  (uint8_t *)&v23,  0x20u);
  }

  int v14 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
  id v16 = -[CSDMessagingRelayMessage initAddRemoteMemberMessageWithMembers:otherInvitedHandles:conversationWithUUID:]( v14,  "initAddRemoteMemberMessageWithMembers:otherInvitedHandles:conversationWithUUID:",  v8,  v9,  v15);

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter"));
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v10 groupUUID]);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 callForConversationWithGroupUUID:v18]);

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 uniqueProxyIdentifier]);
    [v20 sendMessage:v16 forIdentifier:v21];
  }

  else
  {
    id v22 = sub_1001704C4();
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
      sub_1002B3D50(v10, (os_log_s *)v20);
    }
  }
}

- (void)requestAnswerForRequest:(id)a3 forCall:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = (char *)[v18 behavior];
  else {
    uint64_t v8 = dword_100379100[(void)(v7 - 1)];
  }
  id v9 = objc_alloc(&OBJC_CLASS___CSDMessagingRelayMessage);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
  id v11 = -[CSDMessagingRelayMessage initWithType:uniqueProxyIdentifier:]( v9,  "initWithType:uniqueProxyIdentifier:",  43LL,  v10);

  -[CSDMessagingRelayMessage setRequestActionType:](v11, "setRequestActionType:", v8);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v18 sourceIdentifier]);
  -[CSDMessagingRelayMessage setSourceIdentifier:](v11, "setSourceIdentifier:", v12);

  if ([v6 isHostedOnCurrentDevice])
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v18 endpointIDSDestination]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v15));
    [v13 sendMessage:v11 forIdentifier:v14 toDestinations:v16];
  }

  else
  {
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v18 endpointIDSDestination]);
    -[CSDMessagingRelayMessage setEndpointIDSDestination:](v11, "setEndpointIDSDestination:", v17);

    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
    [v13 sendMessage:v11 forIdentifier:v14 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
  }
}

- (void)messenger:(id)a3 handledMessage:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (([v10 canReceiveRelayedCalls] & 1) != 0
    || [v11 canReceiveRelayedCalls])
  {
    if (-[CSDRelayMessagingController shouldProcessRelayMessageOfType:]( self,  "shouldProcessRelayMessageOfType:",  [v9 type]))
    {
      if (v11 || ([v10 isGuest] & 1) != 0)
      {
        id v12 = sub_1001704C4();
        int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 typeString]);
          *(_DWORD *)buf = 138412546;
          id v52 = v14;
          __int16 v53 = 2112;
          id v54 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Handle incoming %@ message: %@",  buf,  0x16u);
        }

        if (v11)
        {
          int v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pairedDevice]);
          id v17 = [v16 isEqual:v11];
        }

        else
        {
          id v17 = 0LL;
        }

        id v32 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
        [v32 reportRelayMessageReceived:v9 fromPairedDevice:v17];

        __int16 v19 = (CSDMessagingRelayMessage *)objc_claimAutoreleasedReturnValue( -[CSDRelayMessagingController clientMessagingDelegate]( self,  "clientMessagingDelegate"));
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController hostMessagingDelegate](self, "hostMessagingDelegate"));
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController commonMessagingDelegate](self, "commonMessagingDelegate"));
        switch([v9 type])
        {
          case 1u:
            -[CSDMessagingRelayMessage handleIncomingCallMessageFromHost:fromPairedDevice:]( v19,  "handleIncomingCallMessageFromHost:fromPairedDevice:",  v9,  v17);
            break;
          case 2u:
            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v9 tuProvider]);
            unsigned __int8 v35 = [v11 canReceiveMessagesForCallProvider:v34];

            if ((v35 & 1) != 0)
            {
              if (!-[CSDRelayMessagingController shouldScreenTimeRestrictMessage:]( self,  "shouldScreenTimeRestrictMessage:",  v9))
              {
                v49[0] = _NSConcreteStackBlock;
                v49[1] = 3221225472LL;
                v49[2] = sub_100083C64;
                v49[3] = &unk_1003D8998;
                v49[4] = self;
                id v50 = v9;
                [v21 handleDialCallMessageFromClient:v50 destination:v10 device:v11 completion:v49];
                __int128 v41 = v50;
                goto LABEL_66;
              }

              id v36 = sub_1001704C4();
              id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v9 destinationID]);
                v38 = (void *)objc_claimAutoreleasedReturnValue([v9 tuProvider]);
                unsigned int v39 = [v9 isEmergency];
                *(_DWORD *)buf = 138412802;
                id v52 = v44;
                __int16 v53 = 2112;
                id v54 = v38;
                __int16 v55 = 1024;
                LODWORD(v56) = v39;
                _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[WARN] Screen Time restricted the call for dial call message with destinationID %@ and provider: %@ is emergency: (%d)",  buf,  0x1Cu);
              }

              unsigned int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 uniqueProxyIdentifier]);
              -[CSDRelayMessagingController sendDialCallFailedForScreenTimeForUniqueProxyIdentifier:]( self,  "sendDialCallFailedForScreenTimeForUniqueProxyIdentifier:",  v40);
            }

            else
            {
              id v42 = sub_1001704C4();
              unsigned int v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                char v43 = (void *)objc_claimAutoreleasedReturnValue([v9 tuProvider]);
                *(_DWORD *)buf = 138412802;
                id v52 = v11;
                __int16 v53 = 2112;
                id v54 = v43;
                __int16 v55 = 2112;
                id v56 = v9;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "[WARN] We determined that device: %@ cannot process messages for provider %@. Ignoring incoming message: %@",  buf,  0x20u);
              }
            }

            break;
          case 3u:
            -[CSDMessagingRelayMessage handleCallDialedMessageFromHost:fromPairedDevice:]( v19,  "handleCallDialedMessageFromHost:fromPairedDevice:",  v9,  v17);
            break;
          case 4u:
            [v21 handleAnswerCallMessageFromClient:v9 destination:v10 device:v11];
            break;
          case 5u:
            -[CSDMessagingRelayMessage handleCallAnsweredElsewhereMessageFromHost:fromPairedDevice:]( v19,  "handleCallAnsweredElsewhereMessageFromHost:fromPairedDevice:",  v9,  v17);
            break;
          case 6u:
            -[CSDMessagingRelayMessage handleCallDisconnectedMessageFromHost:]( v19,  "handleCallDisconnectedMessageFromHost:",  v9);
            break;
          case 7u:
            [v28 handlePlayDTMFToneForKeyMessage:v9];
            break;
          case 8u:
            -[CSDMessagingRelayMessage handleCallConnectedMessageFromHost:]( v19,  "handleCallConnectedMessageFromHost:",  v9);
            break;
          case 9u:
            [v21 handleDisconnectCallMessageFromClient:v9];
            break;
          case 0xAu:
            -[CSDMessagingRelayMessage handlePullRelayingCallsMessageFromHost:fromPairedDevice:]( v19,  "handlePullRelayingCallsMessageFromHost:fromPairedDevice:",  v9,  v17);
            break;
          case 0xBu:
            [v21 handleHoldCallMessageFromClient:v9];
            break;
          case 0xCu:
            [v21 handleUnholdCallMessageFromClient:v9];
            break;
          case 0xDu:
            [v21 handleGroupCallMessageFromClient:v9];
            break;
          case 0xEu:
            [v21 handleUngroupCallMessageFromClient:v9];
            break;
          case 0xFu:
            -[CSDMessagingRelayMessage handleResetWantsHoldMusicFromHost:]( v19,  "handleResetWantsHoldMusicFromHost:",  v9);
            break;
          case 0x10u:
            [v21 handleSwapCallsMessageFromClient:v9];
            break;
          case 0x11u:
            -[CSDMessagingRelayMessage handleUpdateCallModelMessageFromHost:]( v19,  "handleUpdateCallModelMessageFromHost:",  v9);
            break;
          case 0x12u:
            -[CSDMessagingRelayMessage handleDeviceUnavailableMessageFromHost:]( v19,  "handleDeviceUnavailableMessageFromHost:",  v9);
            break;
          case 0x13u:
            [v21 handleEndActiveAndAnswerMessageFromClient:v9];
            break;
          case 0x14u:
            [v21 handleEndHeldAndAnswerMessageFromClient:v9];
            break;
          case 0x15u:
            [v21 handleDisconnectCurrentCallAndActivateHeldMessageFromClient:v9];
            break;
          case 0x16u:
            [v21 handleDisconnectAllCallsMessageFromClient:v9];
            break;
          case 0x17u:
            -[CSDMessagingRelayMessage handleResetStateMessageFromHost:fromPairedDevice:]( v19,  "handleResetStateMessageFromHost:fromPairedDevice:",  v9,  v17);
            break;
          case 0x18u:
            -[CSDMessagingRelayMessage handleHardPauseDigitsAvailabilityMessageFromHost:]( v19,  "handleHardPauseDigitsAvailabilityMessageFromHost:",  v9);
            break;
          case 0x19u:
            [v21 handleSendHardPauseDigitsMessageFromClient:v9];
            break;
          case 0x1Au:
            -[CSDMessagingRelayMessage handleUpdateRemoteCallStateMessageFromHost:]( v19,  "handleUpdateRemoteCallStateMessageFromHost:",  v9);
            break;
          case 0x1Bu:
            [v28 handleSuppressRingtoneMessage:v9];
            break;
          case 0x1Cu:
            [v21 handleRequestCallContextMessageFromClient:v9 fromDevice:v11];
            break;
          case 0x1Du:
            -[CSDMessagingRelayMessage handleCallStartedConnectingMessageFromHost:]( v19,  "handleCallStartedConnectingMessageFromHost:",  v9);
            break;
          case 0x1Eu:
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472LL;
            v47[2] = sub_100083CF4;
            v47[3] = &unk_1003D8948;
            void v47[4] = self;
            id v48 = v9;
            -[CSDMessagingRelayMessage handlePushHostedCallsMessageFromHost:completion:]( v19,  "handlePushHostedCallsMessageFromHost:completion:",  v48,  v47);
            __int128 v41 = v48;
            goto LABEL_66;
          case 0x1Fu:
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472LL;
            v45[2] = sub_100083D04;
            v45[3] = &unk_1003D8948;
            v45[4] = self;
            id v46 = v9;
            [v21 handlePullHostedCallsMessageFromClient:v46 destination:v10 fromPairedDevice:v17 completion:v45];
            __int128 v41 = v46;
LABEL_66:

            break;
          case 0x20u:
            [v21 handlePushRelayingCallsMessageFromClient:v9];
            break;
          case 0x21u:
            -[CSDMessagingRelayMessage handleUpdateCallContextAvailableMessageFromHost:]( v19,  "handleUpdateCallContextAvailableMessageFromHost:",  v9);
            break;
          case 0x22u:
            -[CSDMessagingRelayMessage handleNeedsManualInCallSoundsChangeMessageFromHost:]( v19,  "handleNeedsManualInCallSoundsChangeMessageFromHost:",  v9);
            break;
          case 0x23u:
            -[CSDMessagingRelayMessage handleInvitationSentMessageFromHost:]( v19,  "handleInvitationSentMessageFromHost:",  v9);
            break;
          case 0x24u:
            [v21 handleHoldActiveAndAnswerMessageFromClient:v9];
            break;
          case 0x25u:
            -[CSDMessagingRelayMessage handleUpdateCallDisplayContextMessageFromHost:]( v19,  "handleUpdateCallDisplayContextMessageFromHost:",  v9);
            break;
          case 0x26u:
            [v28 handleSetUplinkMutedMessage:v9];
            break;
          case 0x27u:
            -[CSDMessagingRelayMessage handleUpdateRemoteUplinkMutedMessageFromHost:]( v19,  "handleUpdateRemoteUplinkMutedMessageFromHost:",  v9);
            break;
          case 0x28u:
            [v28 handleUpdateSystemVolumeMessageFromHost:v9];
            break;
          case 0x29u:
            -[CSDMessagingRelayMessage handleUpdateSupportsTTYWithVoiceMessageFromHost:]( v19,  "handleUpdateSupportsTTYWithVoiceMessageFromHost:",  v9);
            break;
          case 0x2Au:
            [v28 handleSetTTYTypeMessage:v9];
            break;
          case 0x2Bu:
            [v28 handleRequestActionMessage:v9];
            break;
          case 0x2Cu:
            -[CSDMessagingRelayMessage handleUpdateRoutesMessageFromHost:]( v19,  "handleUpdateRoutesMessageFromHost:",  v9);
            break;
          case 0x2Du:
            [v21 handlePickRouteMessageFromClient:v9];
            break;
          case 0x2Fu:
            -[CSDMessagingRelayMessage handleUpdateFailureExpectedMessageFromHost:]( v19,  "handleUpdateFailureExpectedMessageFromHost:",  v9);
            break;
          case 0x30u:
            -[CSDMessagingRelayMessage handleUpdateSupportsEmergencyFallbackMessageFromHost:]( v19,  "handleUpdateSupportsEmergencyFallbackMessageFromHost:",  v9);
            break;
          case 0x31u:
            goto LABEL_87;
          case 0x33u:
            [v21 handleBuzzMemberMessageFromClient:v9];
            break;
          case 0x34u:
            [v21 handleAddMemberMessageFromClient:v9];
            break;
          case 0x35u:
            -[CSDMessagingRelayMessage handleConversationProminenceMessageFromHost:]( v19,  "handleConversationProminenceMessageFromHost:",  v9);
            break;
          case 0x36u:
            -[CSDMessagingRelayMessage handleUpdateConversationsMessageFromHost:]( v19,  "handleUpdateConversationsMessageFromHost:",  v9);
LABEL_87:
            -[CSDMessagingRelayMessage handleOngoingConversationMessageFromHost:]( v19,  "handleOngoingConversationMessageFromHost:",  v9);
            break;
          case 0x37u:
            -[CSDMessagingRelayMessage handleUpdateSupportsDTMFUpdatesMessageFromHost:]( v19,  "handleUpdateSupportsDTMFUpdatesMessageFromHost:",  v9);
            break;
          case 0x38u:
            -[CSDMessagingRelayMessage handleReceivedDTMFUpdateMessageFromHost:]( v19,  "handleReceivedDTMFUpdateMessageFromHost:",  v9);
            break;
          default:
            break;
        }

- (void)messengerConnectionEnded:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController delegate](self, "delegate"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayMessagingController _callsWithUniqueProxyIdentifiers:]( self,  "_callsWithUniqueProxyIdentifiers:",  v7));

  [v9 messagingConnectionEndedForCalls:v8 didStartConnecting:v5];
}

- (void)messengerConnectionFailed:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController delegate](self, "delegate"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayMessagingController _callsWithUniqueProxyIdentifiers:]( self,  "_callsWithUniqueProxyIdentifiers:",  v7));

  [v9 messagingConnectionFailedForCalls:v8 didStartConnecting:v5];
}

- (void)messengerConnectionCouldNotEstablishLink:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController delegate](self, "delegate"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayMessagingController _callsWithUniqueProxyIdentifiers:]( self,  "_callsWithUniqueProxyIdentifiers:",  v7));

  [v9 messagingConnectionCouldNotEstablishLinkForCalls:v8 didStartConnecting:v5];
}

- (BOOL)_shouldDeclineSessionInviteWithMessage:(id)a3
{
  return [a3 type] == 2;
}

- (BOOL)shouldDeclineSecondSessionInviteWithMessage:(id)a3
{
  return -[CSDRelayMessagingController _shouldDeclineSessionInviteWithMessage:]( self,  "_shouldDeclineSessionInviteWithMessage:",  a3);
}

- (BOOL)shouldDeclineSessionInviteWithMessageWhenRelayIsDisabled:(id)a3
{
  return -[CSDRelayMessagingController _shouldDeclineSessionInviteWithMessage:]( self,  "_shouldDeclineSessionInviteWithMessage:",  a3);
}

- (BOOL)shouldProcessRelayMessageOfType:(int)a3
{
  BOOL v3 = 1;
  if (a3 <= 0x24 && ((1LL << a3) & 0x1000791A14LL) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
    BOOL v3 = [v4 deviceType] == (id)2;
  }

  return v3;
}

- (BOOL)_canReceiveGuestSessionInviteForMessageType:(int)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance", *(void *)&a3));
  id v4 = [v3 deviceType];

  return v4 == (id)7;
}

- (void)checkShouldIgnoreSessionInviteWithMessage:(id)a3 fromDestination:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = a4;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCapabilities debugDescription](&OBJC_CLASS___TUCallCapabilities, "debugDescription"));
    int v55 = 138412290;
    id v56 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "TUCallCapabilities: %@", (uint8_t *)&v55, 0xCu);
  }

  unsigned int v14 = [v10 isGuest];
  if (v14
    && !-[CSDRelayMessagingController _canReceiveGuestSessionInviteForMessageType:]( self,  "_canReceiveGuestSessionInviteForMessageType:",  [v8 type]))
  {
    id v30 = sub_1001704C4();
    uint32_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v8 typeString]);
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 model]);
      int v55 = 138412546;
      id v56 = v32;
      __int16 v57 = 2112;
      __int128 v58 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[WARN] Setting should ignore session to YES for %@ message because message is from a guest destination and this device is not a supported Guest Session device (%@)",  (uint8_t *)&v55,  0x16u);
    }

    uint64_t v35 = 1LL;
  }

  else
  {
    unsigned int v15 = [v8 type];
    if (v15 == 31)
    {
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter"));
      unsigned int v37 = [v36 anyCallPassesTest:&stru_1003D89B8];

      if ((v37 & 1) == 0)
      {
        id v38 = sub_1001704C4();
        unsigned int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter"));
          __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v40 _allCalls]);
          int v55 = 138412290;
          id v56 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "[WARN] Setting should ignore session to YES because no calls exist with an endpoint on the current device: %@",  (uint8_t *)&v55,  0xCu);
        }
      }

      uint64_t v35 = v37 ^ 1;
    }

    else
    {
      if (v15 == 1)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 tuProvider]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 destinationID]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[TUICFInterface allowCallForDestinationID:providerIdentifier:]( &OBJC_CLASS___TUICFInterface,  "allowCallForDestinationID:providerIdentifier:",  v17,  v18));

        id v20 = sub_1001704C4();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 destinationID]);
          int v23 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
          int v55 = 138412802;
          id v56 = v19;
          __int16 v57 = 2112;
          __int128 v58 = v22;
          __int16 v59 = 2112;
          __int128 v60 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Query result: %@ for handle: %@ provider: %@",  (uint8_t *)&v55,  0x20u);
        }

        if ([v8 priority] != (id)2
          && ([v19 allowCallForDestinationID] & 1) == 0)
        {
          id v48 = sub_1001704C4();
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            char v43 = (void *)objc_claimAutoreleasedReturnValue([v8 destinationID]);
            int v55 = 138412546;
            id v56 = v43;
            __int16 v57 = 2112;
            __int128 v58 = v16;
            __int128 v45 = "[WARN] Setting should ignore session to YES because TUICFInterface allowCall = NO for destinationID %@"
                  " and provider %@";
            id v46 = v27;
            uint32_t v47 = 22;
            goto LABEL_28;
          }

- (BOOL)shouldScreenTimeRestrictMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 destinationID]);
  if ([v5 length]) {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 destinationID]);
  }
  else {
    id v6 = TUCallFilterUnknownCallerAddress;
  }
  id v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController callCenter](self, "callCenter"));
  unsigned __int8 v9 = [v4 isEmergency];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 callFilterController]);
  if ((objc_opt_respondsToSelector(v10, "shouldRestrictAddresses:forBundleIdentifier:performSynchronously:") & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 callFilterController]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 tuProvider]);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDRelayMessagingController bundleIdentifierForProvider:]( self,  "bundleIdentifierForProvider:",  v13));
    unsigned __int8 v15 = [v11 shouldRestrictAddresses:v12 forBundleIdentifier:v14 performSynchronously:1];
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15 & ~v9;
}

- (id)bundleIdentifierForProvider:(id)a3
{
  id v3 = a3;
  if ([v3 isTelephonyProvider])
  {
    id v4 = TUBundleIdentifierMobilePhoneApplication;
  }

  else
  {
    id v5 = [v3 isFaceTimeProvider];
    if ((_DWORD)v5)
    {
      uint64_t v6 = TUPreferredFaceTimeBundleIdentifier(v5);
      id v4 = (id)objc_claimAutoreleasedReturnValue(v6);
    }

    else
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    }
  }

  id v7 = v4;

  return v7;
}

- (int64_t)timeoutForInvitationWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 type];
  if ((_DWORD)v4 == 2)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 tuProvider]);
    int64_t v5 = TUOutgoingInvitationTimeoutForCallProvider(v6, [v3 isVideo]);
  }

  else if ((_DWORD)v4 == 1)
  {
    int64_t v5 = TUIncomingInvitationTimeout(v4);
  }

  else
  {
    int64_t v5 = 30LL;
  }

  return v5;
}

- (id)identifiersForSessionInvitationWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (([v3 type] & 0xFFFFFFFE) == 0x1E)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "protoCalls", 0));
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)i) uniqueProxyIdentifier]);
          [v4 addObject:v10];
        }

        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v7);
    }

    goto LABEL_12;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueProxyIdentifier]);

  if (v11)
  {
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueProxyIdentifier]);
    [v4 addObject:v5];
LABEL_12:
  }

  id v12 = [v4 copy];

  return v12;
}

- (void)performBlockOnTransportAvailability:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  [v8 performBlockOnTransportAvailability:v7 forIdentifier:v6];
}

- (void)prepareToDisconnectMessagingConnectionForCall:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);

  [v6 prepareSessionToEndForIdentifier:v5];
}

- (void)disconnectMessagingConnectionForCall:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDRelayMessagingController sessionMessenger](self, "sessionMessenger"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);

  [v6 cancelOrDeclineInvitationForIdentifier:v5];
}

- (CSDRelayMessagingControllerClientMessagingDelegate)clientMessagingDelegate
{
  return (CSDRelayMessagingControllerClientMessagingDelegate *)objc_loadWeakRetained((id *)&self->_clientMessagingDelegate);
}

- (void)setClientMessagingDelegate:(id)a3
{
}

- (CSDRelayMessagingControllerCommonMessagingDelegate)commonMessagingDelegate
{
  return (CSDRelayMessagingControllerCommonMessagingDelegate *)objc_loadWeakRetained((id *)&self->_commonMessagingDelegate);
}

- (void)setCommonMessagingDelegate:(id)a3
{
}

- (CSDRelayMessagingControllerHostMessagingDelegate)hostMessagingDelegate
{
  return (CSDRelayMessagingControllerHostMessagingDelegate *)objc_loadWeakRetained((id *)&self->_hostMessagingDelegate);
}

- (void)setHostMessagingDelegate:(id)a3
{
}

- (CSDRelayMessagingControllerDelegate)delegate
{
  return (CSDRelayMessagingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSDRelayIDSSessionMessenger)sessionMessenger
{
  return self->_sessionMessenger;
}

- (CSDRelayPairedDeviceMessenger)pairedDeviceMessenger
{
  return self->_pairedDeviceMessenger;
}

- (IDSDestination)dialingIDSDestination
{
  return self->_dialingIDSDestination;
}

- (void)setDialingIDSDestination:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallContainer)callCenter
{
  return self->_callCenter;
}

- (CSDRouteController)localRouteController
{
  return self->_localRouteController;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
}

  ;
}

@end