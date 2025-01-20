@interface CSDCallStateController
+ (id)automaticNameAndPhotoQueue;
+ (void)sanitizeJoinConversationRequest:(id)a3;
- (BOOL)_hasAlreadyDeniedSendingNameAndPhotoToHandles:(id)a3;
- (BOOL)_nameAndPhotoSharingEnabled;
- (BOOL)_nonRingingCallExistsOnThisDevice;
- (BOOL)_sharingAudienceAllowsAutoSendNameAndPhoto;
- (BOOL)_shouldLaunchInCallApplicationForProviderOfCall:(id)a3;
- (BOOL)hasCustomGreetingFor:(id)a3;
- (BOOL)isCallEligible:(id)a3 forClient:(id)a4;
- (BOOL)isInCallUIActive;
- (BOOL)isTrackingVoIPCallForBundleIdentifier:(id)a3;
- (BOOL)multipleCallsActiveOrHeld;
- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 callProvider:(id)a4;
- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 conversationProvider:(id)a4;
- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 isDefaultProvider:(BOOL)a4;
- (BOOL)shouldFilterClient:(id)a3;
- (BOOL)shouldHandleCarPlayControlEvents;
- (BOOL)shouldRelayToOtherDevices;
- (BOOL)shouldSendCall:(id)a3 forClient:(id)a4;
- (CSDApplicationInstallationObserver)applicationInstallationObserver;
- (CSDAudioArbitrationController)audioArbitrationController;
- (CSDAudioController)audioController;
- (CSDCallContainer)callContainer;
- (CSDCallController)callController;
- (CSDCallFilterController)callFilterController;
- (CSDCallHistoryManager)callHistoryManager;
- (CSDCallHistoryManagerXPCServer)callHistoryManagerXPCServer;
- (CSDCallProviderManager)callProviderManager;
- (CSDCallProviderManagerXPCServer)callProviderManagerXPCServer;
- (CSDCallStateController)init;
- (CSDCallStateController)initWithQueue:(id)a3 chManager:(id)a4;
- (CSDCallStateController)initWithQueue:(id)a3 featureFlags:(id)a4 serverBag:(id)a5 chManager:(id)a6;
- (CSDClientManager)clientManager;
- (CSDConversationServerBag)serverBag;
- (CSDProcessObserverProtocol)processObserver;
- (CSDProviderCallDataSource)providerCallDataSource;
- (CSDRecentsController)recentsController;
- (CSDRelayCallDataSource)relayCallDataSource;
- (CSDRelayCallDelegate)relayCallDelegate;
- (CSDRelayMessagingController)relayMessagingController;
- (CSDRouteController)localRouteController;
- (CSDRouteController)pairedHostDeviceRouteController;
- (CSDVoIPApplicationController)voipApplicationController;
- (IMNicknameProvider)nicknameProvider;
- (NSArray)currentUpdatesForScreening;
- (NSMutableDictionary)pendingCallInfoDict;
- (NSNumber)shouldHandleSecureMicrophoneEvents;
- (NSString)currentlyTrackedA2DPRouteIdentifier;
- (NSXPCListenerEndpoint)uiXPCEndpoint;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (TUHardwareControlsBroadcaster)hardwareControlsBroadcaster;
- (id)_contactForHandle:(id)a3 contactStore:(id)a4;
- (id)callForClient:(id)a3 usingCall:(id)a4;
- (id)callWithUniqueProxyIdentifier:(id)a3 fromCallsToAnswer:(id)a4;
- (id)clientInvalidationHandler;
- (id)currentCallsForClient:(id)a3;
- (id)currentProxyCalls;
- (id)eligibleCallsByFilteringCalls:(id)a3 forClient:(id)a4;
- (id)fetchPreferredFaceTimeAccountID;
- (id)outgoingCallFromDialRequest:(id)a3;
- (id)outgoingCallFromJoinRequest:(id)a3;
- (id)performDialCall:(id)a3 displayContext:(id)a4;
- (id)performJoinConversation:(id)a3;
- (void)_answerIncomingCall:(id)a3 withBehavior:(int64_t)a4;
- (void)_answerIncomingCallAsConversation:(id)a3;
- (void)_dial:(id)a3 displayContext:(id)a4 completion:(id)a5;
- (void)_endProxyCallsForConnectingVideoCall;
- (void)_handleActiveCallStatusChangeForHostedCall:(id)a3;
- (void)_handleAudioSessionInterruptionNotification:(id)a3;
- (void)_handleCSDRelayIDSActiveAccountsChanged:(id)a3;
- (void)_handleCallConnectedNotification:(id)a3;
- (void)_handleCallDisplayContextChangedNotification:(id)a3;
- (void)_handleCallIsUsingBasebandChangedNotification:(id)a3;
- (void)_handleCallModelChangedNotification:(id)a3;
- (void)_handleCallRemoteParticipantHandlesChangedNotification:(id)a3;
- (void)_handleCallShouldSuppressRingtoneChangedNotification:(id)a3;
- (void)_handleCallStartedConnectingNotification:(id)a3;
- (void)_handleCallStartedOutgoingNotification:(id)a3;
- (void)_handleCallStatusChangedNotification:(id)a3;
- (void)_handleCallWantsHoldMusicChangedNotification:(id)a3;
- (void)_handleCarPlayControlEventNotification:(id)a3;
- (void)_handleConnectedCallStatusChangeForHostedCall:(id)a3;
- (void)_handleConnectingCallStatusChangeForHostedCall:(id)a3;
- (void)_handleDisconnectedCallStatusChangeForHostedCall:(id)a3;
- (void)_handleDisconnectedCallStatusChangeForVoicemailCall;
- (void)_handleFaceTimeAvailabilityChangedNotification:(id)a3;
- (void)_handleFailureExpectedChangedNotification:(id)a3;
- (void)_handleGroupUUIDChangeForHostedCall:(id)a3;
- (void)_handleGroupUUIDChangedNotification:(id)a3;
- (void)_handleHardPauseStateChangedNotification:(id)a3;
- (void)_handleHeldCallStatusChangeForHostedCall:(id)a3;
- (void)_handleInvitationSentNotification:(id)a3;
- (void)_handleLocaleChange:(id)a3;
- (void)_handleMessagingConnectionEndForCalls:(id)a3 withDisconnectedReason:(int)a4 didStartConnecting:(BOOL)a5;
- (void)_handleMixesVoiceWithMediaChangedNotification:(id)a3;
- (void)_handleNeedsManualInCallSoundsChangedNotification:(id)a3;
- (void)_handlePreferredRouteChangedNotification:(id)a3;
- (void)_handleRelayCallingChanged;
- (void)_handleResetCallStateNotification:(id)a3;
- (void)_handleRingingCallStatusChangeForHostedCall:(id)a3;
- (void)_handleSendingCallStatusChangeForHostedCall:(id)a3;
- (void)_handleSupportsDTMFUpdatesChangedNotification:(id)a3;
- (void)_handleSupportsEmergencyFallbackChangedNotification:(id)a3;
- (void)_handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3;
- (void)_handleTUCallTTYTypeChangedNotification:(id)a3;
- (void)_handleUpdateRemoteUplinkMutedChangedNotification:(id)a3;
- (void)_launchInCallApplicationForCall:(id)a3 withURL:(id)a4;
- (void)_launchInCallApplicationForIncomingCallIfNecessary:(id)a3;
- (void)_launchInCallApplicationForOutgoingCallIfNecessary:(id)a3;
- (void)_sendClientsReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4;
- (void)_updateBluetoothAudioFormatIfNecessaryDueToMVMChange:(BOOL)a3;
- (void)_updateRoutesForDisconnectedCall;
- (void)answerCallWithRequest:(id)a3;
- (void)callHistoryManager:(id)a3 recentCallRequestedFor:(id)a4 withStartDate:(id)a5 avMode:(unint64_t)a6;
- (void)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5 reply:(id)a6;
- (void)customSandboxedURLGreetingForAccountUUID:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)defaultGreeting:(id)a3;
- (void)deleteCustomGreetingForAccountUUID:(id)a3;
- (void)dialWithRequest:(id)a3 displayContext:(id)a4;
- (void)dialWithRequest:(id)a3 reply:(id)a4;
- (void)didChangeRelayCallingCapabilities;
- (void)disconnectAllCalls;
- (void)disconnectCallWithUniqueProxyIdentifier:(id)a3;
- (void)disconnectCurrentCallAndActivateHeld;
- (void)enteredBackgroundForAllCalls;
- (void)enteredForegroundForCallWithUniqueProxyIdentifier:(id)a3;
- (void)fetchAnonymousXPCEndpoint:(id)a3;
- (void)fetchCurrentCallUpdates:(id)a3;
- (void)filterStatusForAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)groupCallWithUniqueProxyIdentifier:(id)a3 withOtherCallWithUniqueProxyIdentifier:(id)a4;
- (void)handleReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4;
- (void)holdCallWithUniqueProxyIdentifier:(id)a3;
- (void)invalidate;
- (void)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5 reply:(id)a6;
- (void)joinConversationWithRequest:(id)a3;
- (void)localRoutesByUniqueIdentifier:(id)a3;
- (void)messagingConnectionCouldNotEstablishLinkForCalls:(id)a3 didStartConnecting:(BOOL)a4;
- (void)messagingConnectionEndedForCalls:(id)a3 didStartConnecting:(BOOL)a4;
- (void)messagingConnectionFailedForCalls:(id)a3 didStartConnecting:(BOOL)a4;
- (void)pairedHostDeviceRoutesByUniqueIdentifier:(id)a3;
- (void)performAnswerCall:(id)a3 withRequest:(id)a4;
- (void)performAnswerCallAsAudioDowngrade:(id)a3 withRequest:(id)a4;
- (void)performAnswerCallAsVideoUpgrade:(id)a3 withRequest:(id)a4;
- (void)performDisconnectAllCallsWithReason:(int)a3;
- (void)performDisconnectCall:(id)a3;
- (void)performDisconnectCurrentCallAndActivateHeld;
- (void)performEndActiveAndAnswerCall:(id)a3 withRequest:(id)a4;
- (void)performEndHeldAndAnswerCall:(id)a3 withRequest:(id)a4;
- (void)performGroupCall:(id)a3 withCall:(id)a4;
- (void)performHoldActiveAndAnswerCall:(id)a3 withRequest:(id)a4;
- (void)performHoldCall:(id)a3;
- (void)performPlayDTMFToneForCall:(id)a3 key:(unsigned __int8)a4;
- (void)performPullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4;
- (void)performPullHostedCallsFromPairedHostDevice;
- (void)performPullRelayingCallsFromClientAndUpdateEndpoint:(BOOL)a3 updateExpectedDestination:(BOOL)a4;
- (void)performPullRelayingCallsFromClientAndUpdateEndpoint:(BOOL)a3 updateExpectedDestination:(BOOL)a4 onlyIfNeedsEndpointConversationRelaySupport:(BOOL)a5;
- (void)performPushHostedCallsToDestination:(id)a3;
- (void)performPushRelayingCallsToHostWithSourceIdentifier:(id)a3;
- (void)performSendMMIOrUSSDCodeWithRequest:(id)a3;
- (void)performSetLiveVoicemailUnavailableReason:(int64_t)a3 forCall:(id)a4;
- (void)performSetTTYType:(int)a3 forCall:(id)a4;
- (void)performSetUplinkMuted:(BOOL)a3 forCall:(id)a4;
- (void)performSwapCalls;
- (void)performUngroupCall:(id)a3;
- (void)performUnholdCall:(id)a3;
- (void)performUpdateCallWithProxy:(id)a3;
- (void)pickLocalRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4;
- (void)pickPairedHostDeviceRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4;
- (void)playDTMFToneForCallWithUniqueProxyIdentifier:(id)a3 key:(unsigned __int8)a4;
- (void)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)propertiesChangedForCall:(id)a3;
- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 reply:(id)a4;
- (void)pullHostedCallsFromPairedHostDevice;
- (void)pullRelayingCallsFromClient;
- (void)pullRelayingGFTCallsFromClientIfNecessary;
- (void)pushHostedCallsToDestination:(id)a3;
- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3;
- (void)registerAnonymousXPCEndpoint:(id)a3;
- (void)registerForSecureMicEvents;
- (void)reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:(id)a3;
- (void)requestInitialState:(id)a3;
- (void)requestVideoUpgradeForCallWithUniqueProxyIdentifier:(id)a3;
- (void)resetClientCallProvisionalStates;
- (void)saveCustomSandboxedURLGreeting:(id)a3 forAccountUUID:(id)a4;
- (void)screenUpdate:(id)a3 withProvider:(id)a4 callSource:(id)a5 callUUID:(id)a6;
- (void)screenWithRequest:(id)a3;
- (void)sendAutomaticNameAndPhotoUsingDialRequestIfPossible:(id)a3;
- (void)sendAutomaticNameAndPhotoUsingJoinRequestIfPossible:(id)a3;
- (void)sendClientsNotificationName:(id)a3;
- (void)sendClientsNotificationName:(id)a3 forCall:(id)a4;
- (void)sendClientsNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5;
- (void)sendHardPauseDigitsForCallWithUniqueProxyIdentifier:(id)a3;
- (void)sendMMIOrUSSDCodeWithRequest:(id)a3;
- (void)sendNameAndPhotoToHandles:(id)a3 fromID:(id)a4;
- (void)sendNameAndPhotoUsingDialRequest:(id)a3;
- (void)sendNameAndPhotoUsingJoinRequest:(id)a3;
- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4;
- (void)setAudioArbitrationController:(id)a3;
- (void)setAudioController:(id)a3;
- (void)setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:(id)a3 bluetoothAudioFormat:(int64_t)a4;
- (void)setCallDelegatesIfNeeded:(id)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setClientInvalidationHandler:(id)a3;
- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3;
- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3;
- (void)setCurrentUpdatesForScreening:(id)a3;
- (void)setCurrentlyTrackedA2DPRouteIdentifier:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setEmergencyMediaItems:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setHasEmergencyVideoStream:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setIsSendingVideo:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setMixesVoiceWithMedia:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setNicknameProvider:(id)a3;
- (void)setPendingCallInfoDict:(id)a3;
- (void)setRelayMessagingController:(id)a3;
- (void)setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:(id)a3 size:(CGSize)a4;
- (void)setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:(id)a3 presentationState:(int)a4;
- (void)setScreenShareAttributesForCallWithUniqueProxyIdentifier:(id)a3 attributes:(id)a4;
- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4 forCallWithUniqueProxyIdentifier:(id)a5;
- (void)setSharingScreen:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setShouldHandleSecureMicrophoneEvents:(id)a3;
- (void)setTTYType:(int)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setUiXPCEndpoint:(id)a3;
- (void)setUplinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setVoipApplicationController:(id)a3;
- (void)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5 reply:(id)a6;
- (void)swapCalls;
- (void)ungroupCallWithUniqueProxyIdentifier:(id)a3;
- (void)unholdCallWithUniqueProxyIdentifier:(id)a3;
- (void)updateCallWithProxy:(id)a3;
- (void)updateClientsWithCall:(id)a3;
- (void)updateClientsWithFrequency:(id)a3 inDirection:(int)a4 forCalls:(id)a5;
- (void)updateClientsWithMeterLevel:(float)a3 inDirection:(int)a4 forCalls:(id)a5;
- (void)willEnterBackgroundForAllCalls;
- (void)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
@end

@implementation CSDCallStateController

- (CSDCallStateController)initWithQueue:(id)a3 chManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  v9 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
  v10 = -[CSDCallStateController initWithQueue:featureFlags:serverBag:chManager:]( self,  "initWithQueue:featureFlags:serverBag:chManager:",  v7,  v8,  v9,  v6);

  return v10;
}

- (CSDCallStateController)init
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CSDCallStateController;
  v2 = -[CSDCallStateController init](&v34, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_handleCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v2 selector:"_handleCallStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_handleGroupUUIDChangedNotification:" name:TUCallGroupUUIDChangedNotification object:0];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v2 selector:"_handleGroupUUIDChangedNotification:" name:TUCallConversationChangedNotification object:0];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v2 selector:"_handleCSDRelayIDSActiveAccountsChanged:" name:@"CSDRelayIDSActiveAccountsChanged" object:0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"_handleCSDRelayPairedDeviceConnectedNotification:" name:@"CSDRelayPairedDeviceConnectedNotification" object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:v2 selector:"_handlePreferredRouteChangedNotification:" name:@"CSDRouteManagerPreferredRouteChangedNotification" object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v2 selector:"_handleCallStartedOutgoingNotification:" name:@"CSDCallHasStartedOutgoingChangedNotification" object:0];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v2 selector:"_handleCallStartedConnectingNotification:" name:TUCallCenterCallStartedConnectingNotification object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v2 selector:"_handleCallConnectedNotification:" name:TUCallCenterCallConnectedNotification object:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v2 selector:"_handleNeedsManualInCallSoundsChangedNotification:" name:TUCallNeedsManualInCallSoundsChangedNotification object:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v2 selector:"_handleCallWantsHoldMusicChangedNotification:" name:TUCallCenterCallWantsHoldMusicChangedNotification object:0];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v15 addObserver:v2 selector:"_handleCallShouldSuppressRingtoneChangedNotification:" name:TUCallShouldSuppressRingingChangedNotification object:0];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 addObserver:v2 selector:"_handleCallModelChangedNotification:" name:TUCallModelChangedNotification object:0];

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 addObserver:v2 selector:"_handleResetCallStateNotification:" name:TUCallCenterResetCallStateNotification object:0];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v18 addObserver:v2 selector:"_handleHardPauseStateChangedNotification:" name:TUCallHardPauseDigitsStateChangedNotification object:0];

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 addObserver:v2 selector:"_handleCallIsUsingBasebandChangedNotification:" name:TUCallIsUsingBasebandChangedNotification object:0];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v20 addObserver:v2 selector:"_handleInvitationSentNotification:" name:TUCallCenterCallInvitationSentNotification object:0];

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v21 addObserver:v2 selector:"_handleCallDisplayContextChangedNotification:" name:TUCallDisplayContextChangedNotification object:0];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v22 addObserver:v2 selector:"_handleUpdateRemoteUplinkMutedChangedNotification:" name:TUCallRemoteUplinkMutedChangedNotification object:0];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v23 addObserver:v2 selector:"_handleCallRemoteParticipantHandlesChangedNotification:" name:TUCallRemoteParticipantHandlesChangedNotification object:0];

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v24 addObserver:v2 selector:"_handleTUCallSupportsTTYWithVoiceChangedNotification:" name:TUCallSupportsTTYWithVoiceChangedNotification object:0];

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v25 addObserver:v2 selector:"_handleTUCallTTYTypeChangedNotification:" name:TUCallTTYTypeChangedNotification object:0];

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v26 addObserver:v2 selector:"_handleMixesVoiceWithMediaChangedNotification:" name:TUCallMixesVoiceWithMediaChangedNotification object:0];

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 addObserver:v2 selector:"_handleFailureExpectedChangedNotification:" name:TUCallCenterIsFailureExpectedChangedNotification object:0];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v28 addObserver:v2 selector:"_handleSupportsEmergencyFallbackChangedNotification:" name:TUCallCenterSupportsEmergencyFallbackChangedNotification object:0];

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 addObserver:v2 selector:"_handleSupportsDTMFUpdatesChangedNotification:" name:TUCallSupportsDTMFUpdatesChangedNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_1001222C8,  @"BluetoothTakeAudioNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingCallInfoDict = v2->_pendingCallInfoDict;
    v2->_pendingCallInfoDict = v31;
  }

  return v2;
}

- (CSDCallStateController)initWithQueue:(id)a3 featureFlags:(id)a4 serverBag:(id)a5 chManager:(id)a6
{
  queue = (dispatch_queue_s *)a3;
  id v51 = a4;
  id v52 = a5;
  id v55 = a6;
  v11 = -[CSDCallStateController init](self, "init");
  if (v11)
  {
    dispatch_assert_queue_V2(queue);
    objc_storeStrong((id *)&v11->_queue, a3);
    objc_storeStrong((id *)&v11->_featureFlags, a4);
    objc_storeStrong((id *)&v11->_serverBag, a5);
    v12 = -[CSDClientManager initWithSerialQueue:]( objc_alloc(&OBJC_CLASS___CSDClientManager),  "initWithSerialQueue:",  v11->_queue);
    clientManager = v11->_clientManager;
    v11->_clientManager = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCConnection callServicesClientXPCInterface]( &OBJC_CLASS___NSXPCConnection,  "callServicesClientXPCInterface"));
    -[CSDClientManager setRemoteObjectInterface:](v11->_clientManager, "setRemoteObjectInterface:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCConnection callServicesServerXPCInterface]( &OBJC_CLASS___NSXPCConnection,  "callServicesServerXPCInterface"));
    -[CSDClientManager setExportedInterface:](v11->_clientManager, "setExportedInterface:", v15);

    -[CSDClientManager setExportedObject:](v11->_clientManager, "setExportedObject:", v11);
    -[CSDClientManager setRequiredConnectionCapability:]( v11->_clientManager,  "setRequiredConnectionCapability:",  @"access-calls");
    -[CSDClientManager setInterruptionHandler:](v11->_clientManager, "setInterruptionHandler:", &stru_1003DA868);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientInvalidationHandler](v11, "clientInvalidationHandler"));
    -[CSDClientManager setInvalidationHandler:](v11->_clientManager, "setInvalidationHandler:", v16);

    v17 = v11->_queue;
    v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDClientManager synchronousExportedObjectProxy]( v11->_clientManager,  "synchronousExportedObjectProxy"));
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[TUCallCenter sharedInstanceWithQueue:server:shouldRegister:]( &OBJC_CLASS___TUCallCenter,  "sharedInstanceWithQueue:server:shouldRegister:",  v17,  v18,  0LL));

    v19 = v11->_clientManager;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v53 callServicesInterface]);
    -[CSDClientManager addLocalClientObject:](v19, "addLocalClientObject:", v20);

    [v53 registerWithCompletionHandler:0];
    v21 = -[CSDCallHistoryManager initWithCHManager:]( objc_alloc(&OBJC_CLASS___CSDCallHistoryManager),  "initWithCHManager:",  v55);
    callHistoryManager = v11->_callHistoryManager;
    v11->_callHistoryManager = v21;

    -[CSDCallHistoryManager addDelegate:queue:](v11->_callHistoryManager, "addDelegate:queue:", v11, v11->_queue);
    v23 = -[CSDCallHistoryManagerXPCServer initWithManager:]( objc_alloc(&OBJC_CLASS___CSDCallHistoryManagerXPCServer),  "initWithManager:",  v11->_callHistoryManager);
    callHistoryManagerXPCServer = v11->_callHistoryManagerXPCServer;
    v11->_callHistoryManagerXPCServer = v23;

    v25 = objc_alloc_init(&OBJC_CLASS___CSDCallProviderManager);
    callProviderManager = v11->_callProviderManager;
    v11->_callProviderManager = v25;

    -[CSDCallProviderManager addDelegate:queue:](v11->_callProviderManager, "addDelegate:queue:", v11, v11->_queue);
    v27 = -[CSDCallProviderManagerXPCServer initWithProviderManager:]( objc_alloc(&OBJC_CLASS___CSDCallProviderManagerXPCServer),  "initWithProviderManager:",  v11->_callProviderManager);
    callProviderManagerXPCServer = v11->_callProviderManagerXPCServer;
    v11->_callProviderManagerXPCServer = v27;

    v29 = -[CSDRelayCallDataSource initWithCallStateController:queue:]( objc_alloc(&OBJC_CLASS___CSDRelayCallDataSource),  "initWithCallStateController:queue:",  v11,  v11->_queue);
    relayCallDataSource = v11->_relayCallDataSource;
    v11->_relayCallDataSource = v29;

    v31 = -[CSDProviderCallDataSource initWithCallStateController:queue:coreTelephonyClient:chManager:callSourceManager:protectedAppsUtilities:]( objc_alloc(&OBJC_CLASS___CSDProviderCallDataSource),  "initWithCallStateController:queue:coreTelephonyClient:chManager:callSourceManager:protectedAppsUtilities:",  v11,  v11->_queue,  0LL,  v55,  0LL,  0LL);
    providerCallDataSource = v11->_providerCallDataSource;
    v11->_providerCallDataSource = v31;

    -[CSDProviderCallDataSource setCallProviderManager:]( v11->_providerCallDataSource,  "setCallProviderManager:",  v11->_callProviderManager);
    -[CSDProviderCallDataSource setRelayCallDataSource:]( v11->_providerCallDataSource,  "setRelayCallDataSource:",  v11->_relayCallDataSource);
    v33 = objc_alloc(&OBJC_CLASS___CSDCallController);
    objc_super v34 = v11->_providerCallDataSource;
    v71[0] = v11->_relayCallDataSource;
    v71[1] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));
    v36 = -[CSDCallController initWithDataSources:queue:](v33, "initWithDataSources:queue:", v35, v11->_queue);
    callController = v11->_callController;
    v11->_callController = v36;

    objc_initWeak(&location, v11);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_100122BD0;
    v68[3] = &unk_1003DA890;
    objc_copyWeak(&v69, &location);
    -[CSDCallController setCallChanged:](v11->_callController, "setCallChanged:", v68);
    v38 = objc_alloc_init(&OBJC_CLASS___CSDRelayCallDelegate);
    relayCallDelegate = v11->_relayCallDelegate;
    v11->_relayCallDelegate = v38;

    -[CSDRelayCallDelegate setCallStateController:](v11->_relayCallDelegate, "setCallStateController:", v11);
    v40 = -[CSDProcessObserver initWithQueue:]( objc_alloc(&OBJC_CLASS___CSDProcessObserver),  "initWithQueue:",  v11->_queue);
    processObserver = v11->_processObserver;
    v11->_processObserver = (CSDProcessObserverProtocol *)v40;

    v42 = -[CSDApplicationInstallationObserver initWithQueue:]( objc_alloc(&OBJC_CLASS___CSDApplicationInstallationObserver),  "initWithQueue:",  v11->_queue);
    applicationInstallationObserver = v11->_applicationInstallationObserver;
    v11->_applicationInstallationObserver = v42;

    -[CSDCallStateController _handleRelayCallingChanged](v11, "_handleRelayCallingChanged");
    v44 = -[CSDRecentsController initWithQueue:chManager:]( objc_alloc(&OBJC_CLASS___CSDRecentsController),  "initWithQueue:chManager:",  v11->_queue,  v55);
    recentsController = v11->_recentsController;
    v11->_recentsController = v44;

    uint64_t v46 = objc_claimAutoreleasedReturnValue(+[CSDRouteController makeLocalRouteController](&OBJC_CLASS___CSDRouteController, "makeLocalRouteController"));
    localRouteController = v11->_localRouteController;
    v11->_localRouteController = (CSDRouteController *)v46;

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_100122C28;
    v66[3] = &unk_1003D7DF0;
    objc_copyWeak(&v67, &location);
    -[CSDRouteController setRoutesDidChangeHandler:](v11->_localRouteController, "setRoutesDidChangeHandler:", v66);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_100122DC4;
    v64[3] = &unk_1003DA8E0;
    objc_copyWeak(&v65, &location);
    -[CSDRouteController setPickedRouteDidChangeHandler:]( v11->_localRouteController,  "setPickedRouteDidChangeHandler:",  v64);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_100122EB0;
    v62[3] = &unk_1003DA8E0;
    objc_copyWeak(&v63, &location);
    -[CSDRouteController setRouteWasPickedHandler:](v11->_localRouteController, "setRouteWasPickedHandler:", v62);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100122F9C;
    v60[3] = &unk_1003DA8E0;
    objc_copyWeak(&v61, &location);
    -[CSDRouteController setTimedOutPickingRouteHandler:]( v11->_localRouteController,  "setTimedOutPickingRouteHandler:",  v60);
    uint64_t v48 = objc_claimAutoreleasedReturnValue( +[CSDRouteController makePairedHostDeviceRouteController]( &OBJC_CLASS___CSDRouteController,  "makePairedHostDeviceRouteController"));
    pairedHostDeviceRouteController = v11->_pairedHostDeviceRouteController;
    v11->_pairedHostDeviceRouteController = (CSDRouteController *)v48;

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_100123088;
    v58[3] = &unk_1003D7DF0;
    objc_copyWeak(&v59, &location);
    -[CSDRouteController setRoutesDidChangeHandler:]( v11->_pairedHostDeviceRouteController,  "setRoutesDidChangeHandler:",  v58);
    -[CSDRouteController setPickedRouteDidChangeHandler:]( v11->_pairedHostDeviceRouteController,  "setPickedRouteDidChangeHandler:",  &stru_1003DA920);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_100123268;
    v56[3] = &unk_1003DA8E0;
    objc_copyWeak(&v57, &location);
    -[CSDRouteController setRouteWasPickedHandler:]( v11->_pairedHostDeviceRouteController,  "setRouteWasPickedHandler:",  v56);
    -[CSDRouteController setTimedOutPickingRouteHandler:]( v11->_pairedHostDeviceRouteController,  "setTimedOutPickingRouteHandler:",  &stru_1003DA940);
    -[CSDClientManager startListeningOnMachServiceWithName:]( v11->_clientManager,  "startListeningOnMachServiceWithName:",  @"com.apple.telephonyutilities.callservicesdaemon.callstatecontroller");
    +[TUCallCapabilities addDelegate:queue:](&OBJC_CLASS___TUCallCapabilities, "addDelegate:queue:", v11, v11->_queue);
    objc_destroyWeak(&v57);
    objc_destroyWeak(&v59);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v63);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&v67);
    objc_destroyWeak(&v69);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  [v2 invalidate];
}

- (id)clientInvalidationHandler
{
  id clientInvalidationHandler = self->_clientInvalidationHandler;
  if (!clientInvalidationHandler)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001234A8;
    v8[3] = &unk_1003D83E8;
    objc_copyWeak(&v9, &location);
    v4 = objc_retainBlock(v8);
    id v5 = self->_clientInvalidationHandler;
    self->_id clientInvalidationHandler = v4;

    objc_destroyWeak(&v9);
    id clientInvalidationHandler = self->_clientInvalidationHandler;
  }

  id v6 = objc_retainBlock(clientInvalidationHandler);
  objc_destroyWeak(&location);
  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callHistoryManagerXPCServer](self, "callHistoryManagerXPCServer"));
  [v3 invalidate];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callProviderManagerXPCServer](self, "callProviderManagerXPCServer"));
  [v4 invalidate];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSDCallStateController;
  -[CSDCallStateController dealloc](&v7, "dealloc");
}

- (void)registerForSecureMicEvents
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001238E8;
  block[3] = &unk_1003D7730;
  block[4] = self;
  if (qword_10044D058 != -1) {
    dispatch_once(&qword_10044D058, block);
  }
}

- (NSNumber)shouldHandleSecureMicrophoneEvents
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (TUCallCenter)callCenter
{
  return +[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance");
}

- (CSDCallContainer)callContainer
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callController](self, "callController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 callContainer]);

  return (CSDCallContainer *)v3;
}

- (CSDCallFilterController)callFilterController
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController providerCallDataSource](self, "providerCallDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 callFilterController]);

  return (CSDCallFilterController *)v3;
}

- (BOOL)shouldRelayToOtherDevices
{
  unsigned int v2 = +[TUCallCapabilities supportsRelayingToOtherDevices]( &OBJC_CLASS___TUCallCapabilities,  "supportsRelayingToOtherDevices");
  if (v2) {
    LOBYTE(v2) = +[TUCallCapabilities areRelayCallingFeaturesEnabled]( &OBJC_CLASS___TUCallCapabilities,  "areRelayCallingFeaturesEnabled");
  }
  return v2;
}

- (void)_handleRelayCallingChanged
{
  unsigned int v3 = +[TUCallCapabilities areRelayCallingFeaturesEnabled]( &OBJC_CLASS___TUCallCapabilities,  "areRelayCallingFeaturesEnabled");
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Relay capabilities enabled", buf, 2u);
    }

    -[CSDCallStateController _requestCallStateFromHost](self, "_requestCallStateFromHost");
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Relay capabilities disabled", buf, 2u);
    }

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callsHostedElsewhere]);

    id v9 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v12);
          id v14 = sub_1001704C4();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Disconnecting relaying call because relay calling is no longer enabled: %@",  buf,  0xCu);
          }

          [v13 setLocallyDisconnectedWithReasonIfNone:8 stopConference:1];
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
          [v16 disconnectMessagingConnectionForCall:v13];

          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }

      while (v10);
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 callsWithAnEndpointElsewhere]);

    id v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          id v24 = sub_1001704C4();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Disconnecting call being relayed elsewhere because relay calling is no longer enabled: %@",  buf,  0xCu);
          }

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
          [v26 disconnectCall:v23 withReason:8];
        }

        id v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }

      while (v20);
    }
  }

- (void)setRelayMessagingController:(id)a3
{
  id v5 = (CSDRelayMessagingController *)a3;
  if (self->_relayMessagingController != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_relayMessagingController, a3);
    -[CSDCallStateController _requestCallStateFromHost](self, "_requestCallStateFromHost");
    id v5 = v6;
  }
}

- (BOOL)shouldHandleCarPlayControlEvents
{
  return 0;
}

- (void)_handleLocaleChange:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100124008;
  block[3] = &unk_1003D7730;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)_handleAudioSessionInterruptionNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100124144;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleCarPlayControlEventNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100124360;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_answerIncomingCall:(id)a3 withBehavior:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[TUAnswerRequest alloc] initWithCall:v6];
  [v7 setSourceIdentifier:TUCallSourceIdentifierCarPlay];
  [v7 setBehavior:a4];
  [v7 setDowngradeToAudio:1];
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Answering incoming call: %@, %@",  (uint8_t *)&v11,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
  [v10 answerWithRequest:v7];
}

- (void)_answerIncomingCallAsConversation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeConversationForCall:v4]);

  id v7 = -[TUJoinConversationRequest initWithConversation:originatingUIType:]( objc_alloc(&OBJC_CLASS___TUJoinConversationRequest),  "initWithConversation:originatingUIType:",  v6,  45LL);
  -[TUJoinConversationRequest setVideoEnabled:](v7, "setVideoEnabled:", [v4 isVideo]);
  -[TUJoinConversationRequest setVideo:](v7, "setVideo:", [v4 isVideo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifierUUID]);
  -[TUJoinConversationRequest setUUID:](v7, "setUUID:", v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Answering incoming call as conversation: %@, %@",  (uint8_t *)&v13,  0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
  id v12 = [v11 joinConversationWithConversationRequest:v7];
}

- (void)_launchInCallApplicationForIncomingCallIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSDCallCapabilities sharedInstance](&OBJC_CLASS___CSDCallCapabilities, "sharedInstance"));
  if (![v5 _supportslaunchingInCallApplicationForIncomingCall])
  {
LABEL_8:

    goto LABEL_9;
  }

  unsigned int v6 = -[CSDCallStateController _shouldLaunchInCallApplicationForProviderOfCall:]( self,  "_shouldLaunchInCallApplicationForProviderOfCall:",  v4);

  if (v6)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL faceTimeLaunchForIncomingCallURL](&OBJC_CLASS___NSURL, "faceTimeLaunchForIncomingCallURL"));
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      int v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Opening URL for incoming call: %@",  (uint8_t *)&v12,  0xCu);
    }

    int v9 = MGGetBoolAnswer(@"still-camera");
    if (![v4 isConversation]
      || (id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags")),
          unsigned int v11 = [v10 expanseEnabled],
          v10,
          (v11 ^ 1 | v9) == 1))
    {
      -[CSDCallStateController _launchInCallApplicationForCall:withURL:]( self,  "_launchInCallApplicationForCall:withURL:",  v4,  v5);
    }

    goto LABEL_8;
  }

- (void)_launchInCallApplicationForOutgoingCallIfNecessary:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSDCallCapabilities sharedInstance](&OBJC_CLASS___CSDCallCapabilities, "sharedInstance"));
  if ([v4 _supportslaunchingInCallApplicationForIncomingCall]) {
    -[CSDCallStateController _shouldLaunchInCallApplicationForProviderOfCall:]( self,  "_shouldLaunchInCallApplicationForProviderOfCall:",  v5);
  }
}

- (void)_launchInCallApplicationForCall:(id)a3 withURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = 0LL;
  char v8 = TUOpenURLWithError(v7, 0LL, 0LL, &v15);
  id v9 = v15;
  if (v9 || (v8 & 1) == 0)
  {
    id v10 = sub_1001704C4();
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002B6F60();
    }

    id v12 = sub_1001704C4();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Disconnecting call because there wont be a UI to host the call: %@",  buf,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
    [v14 disconnectCall:v6];
  }
}

- (BOOL)_shouldLaunchInCallApplicationForProviderOfCall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeConversationForCall:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned __int8 v8 = 1;
  if ([v7 groupFacetimeAsAServiceEnabled] && v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
    unsigned __int8 v8 = [v9 isDefaultProvider];
  }

  return v8;
}

- (void)_endProxyCallsForConnectingVideoCall
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentCalls]);

  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v14 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v10, "isHostedOnCurrentDevice", v14) & 1) == 0)
        {
          id v11 = sub_1001704C4();
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            id v20 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Disconnecting proxy call because a video call started connecting: %@",  buf,  0xCu);
          }

          int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
          [v13 disconnectCall:v10];
        }
      }

      id v7 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v7);
  }
}

- (void)updateClientsWithCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating clients with call: %@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController currentProxyCalls](self, "currentProxyCalls"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUProxyCall proxyCallWithCall:](&OBJC_CLASS___TUProxyCall, "proxyCallWithCall:", v4));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012520C;
  v13[3] = &unk_1003D7B28;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v16 = v4;
  id v10 = v4;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

- (id)eligibleCallsByFilteringCalls:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (-[CSDCallStateController isCallEligible:forClient:]( self,  "isCallEligible:forClient:",  v14,  v7,  (void)v17))
        {
          [v8 addObject:v14];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  id v15 = [v8 copy];
  return v15;
}

- (BOOL)shouldFilterClient:(id)a3
{
  unsigned int v4 = [a3 isRemote];
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
    unsigned __int8 v6 = [v5 filterGFTaaSCalls];

    LOBYTE(v4) = v6;
  }

  return v4;
}

- (BOOL)shouldSendCall:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CSDCallStateController shouldFilterClient:](self, "shouldFilterClient:", v7))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeConversationForCall:v6]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

    if (!v11)
    {
      if (![v6 isConversation])
      {
        id v11 = 0LL;
        goto LABEL_16;
      }

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 providerContext]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:TUConversationProviderIdentifierKey]);

      if (!v11) {
        goto LABEL_16;
      }
    }

    if ((+[TUConversationProvider matchesDefaultProviderIdentifier:]( &OBJC_CLASS___TUConversationProvider,  "matchesDefaultProviderIdentifier:",  v11) & 1) == 0)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 providerIdentifiersForClient:v7]);

      id v14 = sub_1001704C4();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        __int128 v20 = v13;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "providerIdentifiers: %@ client: %@",  (uint8_t *)&v19,  0x16u);
      }

      BOOL v16 = [v13 count] && (objc_msgSend(v13, "containsObject:", v11) & 1) != 0;
      goto LABEL_17;
    }

- (BOOL)isCallEligible:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0LL;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 capabilities]);
  id v9 = [v8 wantsToScreenCalls];

  char v18 = (char)v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100125ABC;
  v14[3] = &unk_1003DA2A0;
  v14[4] = &v15;
  sub_1001544C8( v7,  @"access-screen-calls",  v14,  0LL,  (uint64_t)"-[CSDCallStateController isCallEligible:forClient:]");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  if ([v10 callScreeningEnabledM3]
    && [v7 isRemote]
    && [v6 isScreening]
    && !*((_BYTE *)v16 + 24)
    && [v6 status] != 5
    && [v6 status] != 6)
  {
    BOOL v12 = 0;
  }

  else
  {
    unsigned int v11 = [v7 isRemote];
    if (v11
      && (id v9 = (id)objc_claimAutoreleasedReturnValue([v6 provider]),
          ![v9 supportsCurrentPlatform]))
    {
      BOOL v12 = 0;
    }

    else
    {
      BOOL v12 = -[CSDCallStateController shouldSendCall:forClient:](self, "shouldSendCall:forClient:", v6, v7);
      if (!v11) {
        goto LABEL_13;
      }
    }
  }

- (void)updateClientsWithFrequency:(id)a3 inDirection:(int)a4 forCalls:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100125B9C;
  v13[3] = &unk_1003D7A18;
  int v16 = a4;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)updateClientsWithMeterLevel:(float)a3 inDirection:(int)a4 forCalls:(id)a5
{
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100125E08;
  block[3] = &unk_1003D78F0;
  int v13 = a4;
  void block[4] = self;
  id v12 = v8;
  float v14 = a3;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (void)resetClientCallProvisionalStates
{
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100125FF4;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)sendClientsNotificationName:(id)a3
{
}

- (void)sendClientsNotificationName:(id)a3 forCall:(id)a4
{
}

- (void)sendClientsNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100126154;
  v15[3] = &unk_1003D7B28;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)handleReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  -[CSDCallStateController _sendClientsReceivedCallDTMFUpdate:forCall:]( self,  "_sendClientsReceivedCallDTMFUpdate:forCall:",  v8,  v6);
  if ([v6 isHostedOnCurrentDevice])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v7 sendReceivedDTMFUpdateForCall:v6 dtmfUpdate:v8];
  }
}

- (void)_sendClientsReceivedCallDTMFUpdate:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001263D4;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)_handleCallDisplayContextChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 isHostedOnCurrentDevice])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 sendUpdateCallDisplayContextMessageToClientForCall:v8];
  }
}

- (void)_handleUpdateRemoteUplinkMutedChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 isHostedOnCurrentDevice])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 sendUpdateRemoteUplinkMutedCallMessageToClientForCall:v8];
  }
}

- (void)_handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = (id)objc_opt_class(self, v8);
    __int16 v14 = 2112;
    id v15 = v4;
    id v9 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v10 isHostedOnCurrentDevice])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v11 sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall:v10];
  }
}

- (void)_handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = (id)objc_opt_class(self, v8);
    __int16 v14 = 2112;
    id v15 = v4;
    id v9 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v10 isHostedOnCurrentDevice])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    objc_msgSend(v11, "sendSetTTYTypeCallMessageForCall:ttyType:", v10, objc_msgSend(v10, "ttyType"));
  }
}

- (void)_handleMixesVoiceWithMediaChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class(self, v8);
    __int16 v12 = 2112;
    id v13 = v4;
    id v9 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v10, 0x16u);
  }

  -[CSDCallStateController _updateBluetoothAudioFormatIfNecessaryDueToMVMChange:]( self,  "_updateBluetoothAudioFormatIfNecessaryDueToMVMChange:",  1LL);
}

- (void)_handleFailureExpectedChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = (id)objc_opt_class(self, v8);
    __int16 v14 = 2112;
    id v15 = v4;
    id v9 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v10 isHostedOnCurrentDevice])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v11 sendUpdateFailureExpectedMessageToClientForCall:v10];
  }
}

- (void)_handleSupportsEmergencyFallbackChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = (id)objc_opt_class(self, v8);
    __int16 v14 = 2112;
    id v15 = v4;
    id v9 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v10 isHostedOnCurrentDevice])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v11 sendUpdateSupportsEmergencyFallbackToClientForCall:v10];
  }
}

- (void)_handleSupportsDTMFUpdatesChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = (id)objc_opt_class(self, v8);
    __int16 v14 = 2112;
    id v15 = v4;
    id v9 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v12, 0x16u);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v10 isHostedOnCurrentDevice])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v11 sendUpdateSupportsDTMFUpdatesToClientForCall:v10];
  }
}

- (void)_handleGroupUUIDChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Handling groupUUIDChangedNotification: %@",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v9 = v8;
}

- (void)_handleCallStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v9 = v8;
  if (v8)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 provider]);
    if ([v10 isFaceTimeProvider])
    {
      unsigned int v11 = [v9 isActive];

      if (v11) {
        -[CSDCallStateController registerForSecureMicEvents](self, "registerForSecureMicEvents");
      }
    }

    else
    {
    }

    switch([v9 status])
    {
      case 1u:
        if ([v9 isHostedOnCurrentDevice]) {
          -[CSDCallStateController _handleActiveCallStatusChangeForHostedCall:]( self,  "_handleActiveCallStatusChangeForHostedCall:",  v9);
        }
        break;
      case 2u:
        if ([v9 isHostedOnCurrentDevice]) {
          -[CSDCallStateController _handleHeldCallStatusChangeForHostedCall:]( self,  "_handleHeldCallStatusChangeForHostedCall:",  v9);
        }
        break;
      case 3u:
        if ([v9 isHostedOnCurrentDevice]) {
          -[CSDCallStateController _handleSendingCallStatusChangeForHostedCall:]( self,  "_handleSendingCallStatusChangeForHostedCall:",  v9);
        }
        if ([v9 isOutgoing])
        {
          if ([v9 isEndpointOnCurrentDevice])
          {
            int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);
            unsigned int v13 = [v12 supportsCurrentPlatform];

            if (v13)
            {
              if ([v9 isConversation]) {
                -[CSDCallStateController _launchInCallApplicationForOutgoingConversationIfNecessary:]( self,  "_launchInCallApplicationForOutgoingConversationIfNecessary:",  v9);
              }
              else {
                -[CSDCallStateController _launchInCallApplicationForOutgoingCallIfNecessary:]( self,  "_launchInCallApplicationForOutgoingCallIfNecessary:",  v9);
              }
            }
          }
        }

        break;
      case 4u:
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);
        unsigned int v15 = [v14 supportsCurrentPlatform];

        if (v15) {
          -[CSDCallStateController _launchInCallApplicationForIncomingCallIfNecessary:]( self,  "_launchInCallApplicationForIncomingCallIfNecessary:",  v9);
        }
        if ([v9 isHostedOnCurrentDevice]) {
          -[CSDCallStateController _handleRingingCallStatusChangeForHostedCall:]( self,  "_handleRingingCallStatusChangeForHostedCall:",  v9);
        }
        break;
      case 6u:
        if ([v9 isHostedOnCurrentDevice])
        {
          -[CSDCallStateController _handleDisconnectedCallStatusChangeForHostedCall:]( self,  "_handleDisconnectedCallStatusChangeForHostedCall:",  v9);
          if ([v9 isVoicemail]) {
            -[CSDCallStateController _handleDisconnectedCallStatusChangeForVoicemailCall]( self,  "_handleDisconnectedCallStatusChangeForVoicemailCall");
          }
        }

        -[CSDCallStateController _updateRoutesForDisconnectedCall](self, "_updateRoutesForDisconnectedCall");
        break;
      default:
        break;
    }
  }
}

- (void)_handleCallStartedOutgoingNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueProxyIdentifier]);
  objc_msgSend( v9,  "updateConferenceForIdentifier:isUsingBaseband:disableAudio:isTinCan:",  v10,  objc_msgSend(v8, "isUsingBaseband"),  0,  0);
}

- (void)_handleCallStartedConnectingNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 isHostedOnCurrentDevice]) {
    -[CSDCallStateController _handleConnectingCallStatusChangeForHostedCall:]( self,  "_handleConnectingCallStatusChangeForHostedCall:",  v8);
  }
}

- (void)_handleCallConnectedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 isHostedOnCurrentDevice]) {
    -[CSDCallStateController _handleConnectedCallStatusChangeForHostedCall:]( self,  "_handleConnectedCallStatusChangeForHostedCall:",  v8);
  }
}

- (void)_handleNeedsManualInCallSoundsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 isHostedOnCurrentDevice])
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 sendNeedsManualInCallSoundsChangeMessageToClientForCall:v8];
  }
}

- (void)_handleCallWantsHoldMusicChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 isHostedOnCurrentDevice]
    && ([v8 wantsHoldMusic] & 1) == 0)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 sendResetWantsHoldMusicMessageToClientForCall:v8];
  }
}

- (void)_handleCallShouldSuppressRingtoneChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 shouldSuppressRingtone]
    && (([v8 isHostedOnCurrentDevice] & 1) != 0
     || ([v8 ringtoneSuppressedRemotely] & 1) == 0))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 sendSuppressRingtoneMessageForCall:v8];
    goto LABEL_10;
  }

  if (([v8 shouldSuppressRingtone] & 1) == 0
    && [v8 isHostedOnCurrentDevice])
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 sendUpdateRemoteCallStateMessageToClient];
LABEL_10:
  }
}

- (void)_handleCallModelChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 isHostedOnCurrentDevice])
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 sendUpdateCallModelMessageToClientForCall:v8];
  }
}

- (void)_handleResetCallStateNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
  [v8 sendResetStateMessageToClient];
}

- (void)_handleHardPauseStateChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
  id v10 = [v8 hardPauseDigitsState];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 hardPauseDigits]);
  [v9 sendHardPauseAvailabilityMessageToClientForState:v10 digits:v11];
}

- (void)_handleCallIsUsingBasebandChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if (([v8 isEndpointOnCurrentDevice] & 1) == 0
    && [v8 hasStartedOutgoing])
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueProxyIdentifier]);
    objc_msgSend( v9,  "updateConferenceForIdentifier:isUsingBaseband:disableAudio:isTinCan:",  v10,  objc_msgSend(v8, "isUsingBaseband"),  0,  0);
  }
}

- (void)_handleFaceTimeAvailabilityChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (+[TUCallCapabilities supportsPrimaryCalling]( &OBJC_CLASS___TUCallCapabilities,  "supportsPrimaryCalling"))
  {
    id v6 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callProviderManager](self, "callProviderManager"));
    [v8 sendUpdateCallContextMessageToClientForCallProviderManager:v9];
  }
}

- (void)_handleInvitationSentNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 isHostedOnCurrentDevice])
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 sendInvitationSentMessageToClientForCall:v8];
  }
}

- (void)_handleCSDRelayIDSActiveAccountsChanged:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100127ED0;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handlePreferredRouteChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100128018;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)_nonRingingCallExistsOnThisDevice
{
  unsigned int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAudioAndVideoCalls]);

  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ([v10 status] != 4
          && [v10 isEndpointOnCurrentDevice])
        {
          id v12 = sub_1001704C4();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
            unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _allCalls]);
            *(_DWORD *)buf = 138412546;
            id v22 = v10;
            __int16 v23 = 2112;
            id v24 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Non-ringing call found on device: %@. All calls: %@",  buf,  0x16u);
          }

          BOOL v11 = 1;
          goto LABEL_14;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (void)_handleRingingCallStatusChangeForHostedCall:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRouteManager sharedInstance](&OBJC_CLASS___CSDRouteManager, "sharedInstance"));
  unsigned int v7 = [v6 isAnyVehicleRouteAvailableForCall:v4];

  if ([v4 isConversation])
  {
    if ([v4 isConversation])
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
      if ([v8 conversationOneToOneModeEnabled])
      {
        int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteParticipantHandles]);
        BOOL v10 = [v9 count] == (id)1;
      }

      else
      {
        BOOL v10 = 0;
      }
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    BOOL v10 = 1;
  }

  if (!-[CSDCallStateController shouldRelayToOtherDevices](self, "shouldRelayToOtherDevices")
    || (([v4 hasRelaySupport:1] ^ 1 | v7) & 1) != 0
    || ([v4 isTTY] & 1) != 0
    || !v10)
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138413826;
      id v15 = v4;
      __int16 v16 = 1024;
      unsigned int v17 = !-[CSDCallStateController shouldRelayToOtherDevices](self, "shouldRelayToOtherDevices");
      __int16 v18 = 1024;
      unsigned int v19 = [v4 hasRelaySupport:1] ^ 1;
      __int16 v20 = 1024;
      unsigned int v21 = v7;
      __int16 v22 = 1024;
      unsigned int v23 = [v4 isTTY];
      __int16 v24 = 1024;
      unsigned int v25 = [v4 isConversation];
      __int16 v26 = 1024;
      int v27 = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Ignoring ringing call status change for call %@ because relay calling is disabled (%d) or this call doesn't supp ort relaying call state (%d) or a vehicle route is available (%d) or call is TTY (%d) or call is conversation (% d) or shouldRelayTinCanCall (%d)",  (uint8_t *)&v14,  0x30u);
    }
  }

  else
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    objc_msgSend( v11,  "sendIncomingCallMessageToClientForCall:cannotBeAnswered:cannotRelayAudioOrVideoOnPairedDevice:",  v4,  -[CSDCallStateController _nonRingingCallExistsOnThisDevice](self, "_nonRingingCallExistsOnThisDevice"),  0);
  }
}

- (void)_handleGroupUUIDChangeForHostedCall:(id)a3
{
  id v6 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if ([v6 isConversation] && objc_msgSend(v6, "isHostedOnCurrentDevice"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v5 sendUpdateRemoteCallStateMessageToClient:1];
  }
}

- (void)_handleSendingCallStatusChangeForHostedCall:(id)a3
{
  id v6 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  if (([v6 isConversation] & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v5 sendCallDialedMessageToClientForCall:v6];
  }
}

- (void)_handleConnectingCallStatusChangeForHostedCall:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if ([v4 isEndpointOnCurrentDevice]
    && ([v4 isOutgoing] & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v6 sendCallAnsweredElsewhereMessageToClientForCall:v4];

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
    [v7 stopConferenceForIdentifier:v8];
  }

  if ([v4 status] == 6)
  {
    id v9 = sub_1001704C4();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Not sending out call started connecting message because call is already disconnected: %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    -[os_log_s sendCallStartedConnectingMessageToClientForCall:]( v10,  "sendCallStartedConnectingMessageToClientForCall:",  v4);
  }
}

- (void)_handleConnectedCallStatusChangeForHostedCall:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if ([v4 status] == 6)
  {
    id v6 = sub_1001704C4();
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Not sending out call connected message because call is already disconnected: %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    -[os_log_s sendCallConnectedMessageToClientForCall:](v7, "sendCallConnectedMessageToClientForCall:", v4);
  }
}

- (void)_handleActiveCallStatusChangeForHostedCall:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
  [v6 sendUpdateRemoteCallStateMessageToClient];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[CSDRelayConferenceInterface sharedInstance](&OBJC_CLASS___CSDRelayConferenceInterface, "sharedInstance"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);

  [v8 setConferenceActiveForIdentifier:v7];
}

- (void)_handleCallRemoteParticipantHandlesChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notification: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  if ([v8 isHostedOnCurrentDevice])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 sendUpdateRemoteCallStateMessageToClient];
  }
}

- (void)_handleHeldCallStatusChangeForHostedCall:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
  [v5 sendUpdateRemoteCallStateMessageToClient];
}

- (void)_handleDisconnectedCallStatusChangeForVoicemailCall
{
  id v2 = sub_1001704C4();
  unsigned int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.telephonyutilities.callservicesdaemon.voicemailcallended"));
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Sending voicemail call ended notification %@",  (uint8_t *)&v5,  0xCu);
  }

  notify_post("com.apple.telephonyutilities.callservicesdaemon.voicemailcallended");
}

- (void)_updateRoutesForDisconnectedCall
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController localRouteController](self, "localRouteController"));
  [v3 clearState];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallStateController pairedHostDeviceRouteController](self, "pairedHostDeviceRouteController"));
  [v4 clearState];
}

- (void)_handleDisconnectedCallStatusChangeForHostedCall:(id)a3
{
  id v10 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
  [v5 sendNeedsManualInCallSoundsChangeMessageToClientForCall:v10];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
  [v6 sendCallDisconnectedMessageToClientForCall:v10];

  unsigned int v7 = [v10 isEndpointOnCurrentDevice];
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueProxyIdentifier]);
  if (v7) {
    [v8 stopConferenceForIdentifier:v9];
  }
  else {
    [v8 prepareToStopConferenceForIdentifier:v9];
  }
}

- (void)_updateBluetoothAudioFormatIfNecessaryDueToMVMChange:(BOOL)a3
{
  unsigned int v3 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned int v7 = [v6 expanseBTSwitchingEnabled];

  if (!v7) {
    return;
  }
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentAudioAndVideoCalls]);

  id v10 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (!v10)
  {
LABEL_10:

    goto LABEL_21;
  }

  id v11 = v10;
  uint64_t v12 = *(void *)v41;
LABEL_4:
  uint64_t v13 = 0LL;
  while (1)
  {
    if (*(void *)v41 != v12) {
      objc_enumerationMutation(v9);
    }
    int v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
    if (v11 == (id)++v13)
    {
      id v11 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (!v11) {
        goto LABEL_10;
      }
      goto LABEL_4;
    }
  }

  id v15 = v14;

  if (!v15)
  {
LABEL_21:
    -[CSDCallStateController setCurrentlyTrackedA2DPRouteIdentifier:]( self,  "setCurrentlyTrackedA2DPRouteIdentifier:",  0LL);
    [0 setBluetoothAudioFormat:0];
    return;
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController localRouteController](self, "localRouteController", 0LL));
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 routesByUniqueIdentifier]);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allValues]);

  id v19 = [v18 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (!v19) {
    goto LABEL_20;
  }
  id v20 = v19;
  uint64_t v21 = *(void *)v37;
  while (2)
  {
    for (i = 0LL; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v37 != v21) {
        objc_enumerationMutation(v18);
      }
      unsigned int v23 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
      if ([v23 isCurrentlyPicked])
      {
        id v24 = v23;

        if (!v24) {
          goto LABEL_39;
        }
        if (v3) {
          unsigned int v3 = [v24 isBluetoothLE];
        }
        if ((([v24 isA2DPRoute] & 1) != 0 || v3)
          && [v15 bluetoothAudioFormat] != (id)1)
        {
          [v15 setBluetoothAudioFormat:1];
          id v25 = sub_1001704C4();
          __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Picked route %@ changed to A2DP, so muting",  buf,  0xCu);
          }

          [v15 setUplinkMuted:1];
        }

        int v27 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallStateController currentlyTrackedA2DPRouteIdentifier]( self,  "currentlyTrackedA2DPRouteIdentifier"));
        if ([v27 length])
        {
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v24 uniqueIdentifier]);
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallStateController currentlyTrackedA2DPRouteIdentifier]( self,  "currentlyTrackedA2DPRouteIdentifier"));
          if (([v28 isEqualToString:v29] & 1) == 0
            && ![v24 isA2DPRoute])
          {
            unsigned __int8 v31 = [v24 isBluetoothLE];

            if ((v31 & 1) == 0)
            {
              id v32 = sub_1001704C4();
              __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallStateController currentlyTrackedA2DPRouteIdentifier]( self,  "currentlyTrackedA2DPRouteIdentifier"));
                v35 = (void *)objc_claimAutoreleasedReturnValue([v24 uniqueIdentifier]);
                *(_DWORD *)buf = 138412546;
                id v45 = v34;
                __int16 v46 = 2112;
                v47 = v35;
                _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Picked route changed from %@ to %@, setting call's bluetooth audio format back to automatic",  buf,  0x16u);
              }

              [v15 setBluetoothAudioFormat:0];
            }

            goto LABEL_36;
          }
        }

LABEL_36:
        if (([v24 isA2DPRoute] & 1) != 0
          || ([v24 isBluetoothLE] & 1) != 0)
        {
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v24 uniqueIdentifier]);
          -[CSDCallStateController setCurrentlyTrackedA2DPRouteIdentifier:]( self,  "setCurrentlyTrackedA2DPRouteIdentifier:",  v30);
        }

        else
        {
          -[CSDCallStateController setCurrentlyTrackedA2DPRouteIdentifier:]( self,  "setCurrentlyTrackedA2DPRouteIdentifier:",  0LL);
        }

        goto LABEL_42;
      }
    }

    id v20 = [v18 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v20) {
      continue;
    }
    break;
  }

- (id)outgoingCallFromDialRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hostOnCurrentDevice];
  id v6 = off_1003D5E00;
  if (!v5) {
    id v6 = off_1003D5E08;
  }
  id v7 = [objc_alloc(*v6) initOutgoingWithDialRequest:v4];

  -[CSDCallStateController setCallDelegatesIfNeeded:](self, "setCallDelegatesIfNeeded:", v7);
  -[CSDCallStateController propertiesChangedForCall:](self, "propertiesChangedForCall:", v7);
  return v7;
}

- (id)outgoingCallFromJoinRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
  objc_msgSend( v4,  "setHostedOnCurrentDevice:",  objc_msgSend(v5, "_shouldRelayJoinConversationRequest:", v4) ^ 1);

  unsigned int v6 = [v4 hostedOnCurrentDevice];
  id v7 = off_1003D5E00;
  if (!v6) {
    id v7 = off_1003D5E08;
  }
  id v8 = [objc_alloc(*v7) initOutgoingWithJoinConversationRequest:v4];
  -[CSDCallStateController setCallDelegatesIfNeeded:](self, "setCallDelegatesIfNeeded:", v8);
  -[CSDCallStateController propertiesChangedForCall:](self, "propertiesChangedForCall:", v8);

  return v8;
}

- (void)setCallDelegatesIfNeeded:(id)a3
{
  id v19 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callServicesInterface]);
  [v6 registerCall:v19];

  [v19 setDelegate:self];
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CSDRelayCall, v7);
  if ((objc_opt_isKindOfClass(v19, v8) & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayCallDataSource](self, "relayCallDataSource"));
    [v19 setDataSource:v10];

    id v11 = v19;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 relayDelegate]);

    if (!v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayCallDelegate](self, "relayCallDelegate"));
      [v11 setRelayDelegate:v13];
    }
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___CSDProviderCall, v9);
  if ((objc_opt_isKindOfClass(v19, v14) & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController providerCallDataSource](self, "providerCallDataSource"));
    [v19 setDataSource:v15];

    id v16 = v19;
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 providerCallDelegate]);

    if (!v17)
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController providerCallDataSource](self, "providerCallDataSource"));
      [v16 setProviderCallDelegate:v18];
    }
  }
}

- (id)performDialCall:(id)a3 displayContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 frontmostCall]);

  if (v9 && [v9 isEmergency])
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Dial request rejected due to active emergency call",  v18,  2u);
    }

    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController outgoingCallFromDialRequest:](self, "outgoingCallFromDialRequest:", v6));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dateAnsweredOrDialed]);
    if (v13)
    {
      [v12 setDateAnsweredOrDialed:v13];
    }

    else
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 dateDialed]);
      [v12 setDateAnsweredOrDialed:v14];
    }

    -[CSDCallStateController setCallDelegatesIfNeeded:](self, "setCallDelegatesIfNeeded:", v12);
    if (v12)
    {
      -[CSDCallStateController sendAutomaticNameAndPhotoUsingDialRequestIfPossible:]( self,  "sendAutomaticNameAndPhotoUsingDialRequestIfPossible:",  v6);
      [v12 dialWithRequest:v6 displayContext:v7];
    }

    else
    {
      id v15 = sub_1001704C4();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1002B6FC0();
      }
    }
  }

  return v12;
}

+ (void)sanitizeJoinConversationRequest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceForProvider:v5]);

  __int128 v33 = v6;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
    unsigned int v8 = [v7 isDefaultProvider];

    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 allAliases]);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_100129A0C;
      v38[3] = &unk_1003DAB28;
      id v12 = v9;
      id v39 = v12;
      [v11 enumerateObjectsUsingBlock:v38];

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteMembers]);
      id v14 = [v13 count];

      if (v14 == (id)1)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteMembers]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 anyObject]);
        [v10 addObject:v16];
      }

      else
      {
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        id v32 = v3;
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteMembers]);
        id v18 = [v17 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v35;
          do
          {
            for (i = 0LL; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(v17);
              }
              __int16 v22 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
              unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 handle]);
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 normalizedValue]);
              unsigned __int8 v25 = [v12 containsObject:v24];

              if ((v25 & 1) != 0)
              {
                id v26 = sub_1001704C4();
                int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  __int128 v41 = v22;
                  __int16 v42 = 2112;
                  __int128 v43 = v33;
                  _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Removing %@ from sanitized join request since it matches a local alias on the ids service: %@",  buf,  0x16u);
                }
              }

              else
              {
                [v10 addObject:v22];
              }
            }

            id v19 = [v17 countByEnumeratingWithState:&v34 objects:v44 count:16];
          }

          while (v19);
        }

        id v3 = v32;
      }

      [v3 setRemoteMembers:v10];
      if ([v3 avMode] == (id)1)
      {
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteMembers]);
        if ((unint64_t)[v28 count] <= 1)
        {
        }

        else
        {
          unsigned int v29 = [v3 supportsAVMode:2];

          if (v29)
          {
            id v30 = sub_1001704C4();
            unsigned __int8 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Setting join request to TUConversationAVModeVideo from Audio since this is a GFT conversation",  buf,  2u);
            }

            [v3 setAvMode:2];
            [v3 setVideoEnabled:0];
          }
        }
      }
    }
  }
}

- (id)performJoinConversation:(id)a3
{
  id v4 = a3;
  objc_msgSend((id)objc_opt_class(self, v5), "sanitizeJoinConversationRequest:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 callWithCallUUID:v8]);

  if (v9)
  {
    -[CSDCallStateController _launchInCallApplicationForAnsweringCallIfNecessary:]( self,  "_launchInCallApplicationForAnsweringCallIfNecessary:",  v9);
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController outgoingCallFromJoinRequest:](self, "outgoingCallFromJoinRequest:", v4));
    -[CSDCallStateController setCallDelegatesIfNeeded:](self, "setCallDelegatesIfNeeded:", v9);
  }

  -[CSDCallStateController sendAutomaticNameAndPhotoUsingJoinRequestIfPossible:]( self,  "sendAutomaticNameAndPhotoUsingJoinRequestIfPossible:",  v4);
  if ((objc_opt_respondsToSelector(v9, "joinConversationWithRequest:") & 1) != 0) {
    [v9 joinConversationWithRequest:v4];
  }

  return v9;
}

- (void)performHoldCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 callsWithGroupUUID:v11]);
  }

  else
  {
    id v14 = v4;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSource]);
  [v13 holdCalls:v12 whileUnholdingCalls:&__NSArray0__struct];
}

- (void)performUnholdCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 callsWithGroupUUID:v11]);
  }

  else
  {
    id v14 = v4;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSource]);
  [v13 holdCalls:&__NSArray0__struct whileUnholdingCalls:v12];
}

- (void)performGroupCall:(id)a3 withCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    id v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 callGroupUUID]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 callGroupUUID]);

  if (v12)
  {
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 callGroupUUID]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 callsWithGroupUUID:v15]);
    }

    else
    {
      id v28 = v6;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v7 callGroupUUID]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v21 callsWithGroupUUID:v22]);
  }

  else
  {
    if (v13)
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 callGroupUUID]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 callsWithGroupUUID:v18]);

      id v27 = v7;
      uint64_t v20 = &v27;
    }

    else
    {
      id v26 = v7;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
      id v25 = v6;
      uint64_t v20 = &v25;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 1LL, v25));
  }

  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dataSource]);
  [v24 groupCalls:v16 withCalls:v19];
}

- (void)performUngroupCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    unsigned int v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer", 0LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentCalls]);

    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(id *)(*((void *)&v23 + 1) + 8LL * (void)v16);
          if (v17 != v4)
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
            unsigned int v20 = [v18 isEqual:v19];

            if (v20) {
              [v10 addObject:v17];
            }
          }

          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v14);
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSource]);
    [v21 ungroupCall:v4 fromOtherCallsInGroup:v10];
  }

  else
  {
    id v22 = sub_1001704C4();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to performUngroupCall because the call is not grouped",  buf,  2u);
    }
  }
}

- (void)performSwapCalls
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    *(void *)__int128 v43 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callsPassingTest:&stru_1003DAB48]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callsPassingTest:&stru_1003DAB68]);

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v39;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v38 + 1) + 8 * (void)i) model]);
        unsigned int v17 = [v16 supportsHolding];

        if (!v17)
        {
          int v18 = 1;
          goto LABEL_13;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  int v18 = 0;
LABEL_13:

  if ([v11 count] && (!objc_msgSend(v10, "count") ? (char v19 = 1) : (char v19 = v18), (v19 & 1) == 0))
  {
    uint64_t v21 = objc_alloc_init(&OBJC_CLASS___CSDCallDataSourceMap);
    id v32 = v11;
    -[CSDCallDataSourceMap addCalls:forIdentifier:](v21, "addCalls:forIdentifier:", v11, @"callsToHold");
    __int128 v33 = v10;
    -[CSDCallDataSourceMap addCalls:forIdentifier:](v21, "addCalls:forIdentifier:", v10, @"callsToUnhold");
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSourceMap dataSources](v21, "dataSources"));
    id v25 = [v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          unsigned int v29 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
          id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v21,  "callsForDataSource:identifier:",  v29,  @"callsToHold"));
          unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v21,  "callsForDataSource:identifier:",  v29,  @"callsToUnhold"));
          [v29 holdCalls:v30 whileUnholdingCalls:v31];
        }

        id v26 = [v24 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }

      while (v26);
    }

    id v11 = v32;
    id v10 = v33;
  }

  else
  {
    id v20 = sub_1001704C4();
    uint64_t v21 = (CSDCallDataSourceMap *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v22 = [v11 count] == 0;
      id v23 = [v10 count];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)__int128 v43 = v22;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = v23 == 0LL;
      __int16 v44 = 1024;
      int v45 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to performSwapCalls because either there is no active call (%d), there is no held call(%d), or an active call exists that cannot be held (%d)",  buf,  0x14u);
    }
  }
}

- (void)performAnswerCall:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[CSDCallStateController _launchInCallApplicationForAnsweringCallIfNecessary:]( self,  "_launchInCallApplicationForAnsweringCallIfNecessary:",  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointIDSDestination]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v9 requestAnswerForRequest:v7 forCall:v6];
  }

  else
  {
    switch((unint64_t)[v7 behavior])
    {
      case 0uLL:
        -[CSDCallStateController performEndActiveAndAnswerCall:withRequest:]( self,  "performEndActiveAndAnswerCall:withRequest:",  v6,  v7);
        break;
      case 1uLL:
        -[CSDCallStateController performEndHeldAndAnswerCall:withRequest:]( self,  "performEndHeldAndAnswerCall:withRequest:",  v6,  v7);
        break;
      case 2uLL:
        -[CSDCallStateController performHoldActiveAndAnswerCall:withRequest:]( self,  "performHoldActiveAndAnswerCall:withRequest:",  v6,  v7);
        break;
      case 3uLL:
        -[CSDCallStateController performAnswerCallAsVideoUpgrade:withRequest:]( self,  "performAnswerCallAsVideoUpgrade:withRequest:",  v6,  v7);
        break;
      case 4uLL:
        -[CSDCallStateController performAnswerCallAsAudioDowngrade:withRequest:]( self,  "performAnswerCallAsAudioDowngrade:withRequest:",  v6,  v7);
        break;
      default:
        break;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointRapportEffectiveIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointRapportMediaSystemIdentifier]);
    if ([v10 length] || objc_msgSend(v11, "length"))
    {
      id v12 = sub_1001704C4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueProxyIdentifier]);
        int v16 = 138412802;
        unsigned int v17 = v11;
        __int16 v18 = 2112;
        char v19 = v10;
        __int16 v20 = 2112;
        uint64_t v21 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "An endpointRapportMediaSystemIdentifier=%@ or endpointRapportEffectiveIdentifier=%@ is present on answ er request for call with identifier %@ so attempting to pick matching route",  (uint8_t *)&v16,  0x20u);
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
      [v15 pickRouteForRapportDeviceWithMediaSystemIdentifier:v11 effectiveIdentifier:v10];
    }
  }
}

- (id)callWithUniqueProxyIdentifier:(id)a3 fromCallsToAnswer:(id)a4
{
  id v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueProxyIdentifier", (void)v14));
        unsigned int v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)performEndActiveAndAnswerCall:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v52 = v6;
    __int16 v53 = 2112;
    id v54 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Performing end active calls and answer ringing call %@ for answer request %@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueProxyIdentifier]);
  if ([v10 length])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 audioAndVideoCallsWithStatus:4]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 screeningCall]);

    if ([v12 count] || (objc_msgSend(v7, "sendToScreening") & 1) != 0 || v14)
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallStateController callWithUniqueProxyIdentifier:fromCallsToAnswer:]( self,  "callWithUniqueProxyIdentifier:fromCallsToAnswer:",  v10,  v12));
      if (v15
        || ([v7 sendToScreening] & 1) != 0
        || (__int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueProxyIdentifier]),
            unsigned __int8 v17 = [v16 isEqualToString:v10],
            v16,
            (v17 & 1) != 0))
      {
        if (([v15 isEqualToCall:v6] & 1) != 0
          || ([v7 sendToScreening] & 1) != 0
          || ([v14 isEqualToCall:v6] & 1) != 0)
        {
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 dataSource]);
          if (v18)
          {
            id v44 = v7;
            char v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 audioAndVideoCallsWithStatus:1]);

            if ([v21 count]) {
              -[NSMutableArray addObjectsFromArray:](v19, "addObjectsFromArray:", v21);
            }
            __int128 v40 = v21;
            __int16 v42 = v15;
            __int128 v43 = v10;
            BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 audioAndVideoCallsWithStatus:3]);

            if ([v23 count]) {
              -[NSMutableArray addObjectsFromArray:](v19, "addObjectsFromArray:", v23);
            }
            __int128 v39 = v23;
            id v45 = v6;
            -[NSMutableArray removeObject:](v19, "removeObject:", v6);
            __int128 v24 = objc_alloc_init(&OBJC_CLASS___CSDCallDataSourceMap);
            __int128 v41 = v19;
            -[CSDCallDataSourceMap addCalls:forIdentifier:]( v24,  "addCalls:forIdentifier:",  v19,  @"callsToDisconnect");
            __int128 v48 = 0u;
            __int128 v49 = 0u;
            __int128 v46 = 0u;
            __int128 v47 = 0u;
            id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSourceMap dataSources](v24, "dataSources"));
            id v26 = [v25 countByEnumeratingWithState:&v46 objects:v50 count:16];
            if (v26)
            {
              id v27 = v26;
              uint64_t v28 = *(void *)v47;
              do
              {
                for (i = 0LL; i != v27; i = (char *)i + 1)
                {
                  if (*(void *)v47 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  id v30 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
                  if (v30 != v18)
                  {
                    unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v24,  "callsForDataSource:identifier:",  *(void *)(*((void *)&v46 + 1) + 8LL * (void)i),  @"callsToDisconnect"));
                    [v30 disconnectCalls:v31 whileHoldingCalls:&__NSArray0__struct andUnholdingCalls:&__NSArray0__struct andUngroupingCalls:&__NSArray0__struct];
                  }
                }

                id v27 = [v25 countByEnumeratingWithState:&v46 objects:v50 count:16];
              }

              while (v27);
            }

            id v32 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v24,  "callsForDataSource:identifier:",  v18,  @"callsToDisconnect"));
            id v7 = v44;
            id v6 = v45;
            [v18 answerCall:v45 withRequest:v44 whileDisconnectingActiveCalls:v32];

            id v10 = v43;
            __int128 v15 = v42;
            __int128 v33 = (os_log_s *)v41;
          }

          else
          {
            id v36 = sub_1001704C4();
            __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              sub_1002B704C();
            }
          }
        }

        else
        {
          id v37 = sub_1001704C4();
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
            sub_1002B70AC();
          }
        }
      }

      else
      {
        id v38 = sub_1001704C4();
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
          sub_1002B710C();
        }
      }
    }

    else
    {
      id v35 = sub_1001704C4();
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        sub_1002B716C();
      }
    }
  }

  else
  {
    id v34 = sub_1001704C4();
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B7020();
    }
  }
}

- (void)performEndHeldAndAnswerCall:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v56 = v6;
    __int16 v57 = 2112;
    id v58 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Performing end held calls and answer ringing call %@ for answer request %@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueProxyIdentifier]);
  if ([v10 length])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 audioAndVideoCallsWithStatus:4]);

    if ([v12 count])
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDCallStateController callWithUniqueProxyIdentifier:fromCallsToAnswer:]( self,  "callWithUniqueProxyIdentifier:fromCallsToAnswer:",  v10,  v12));
      __int128 v14 = v13;
      if (v13)
      {
        if ((-[os_log_s isEqualToCall:](v13, "isEqualToCall:", v6) & 1) != 0)
        {
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v6 dataSource]);
          if (v49)
          {
            id v44 = v14;
            __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
            __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 audioAndVideoCallsWithStatus:1]);

            if ([v18 count]) {
              -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:", v18);
            }
            id v47 = v7;
            char v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
            __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 audioAndVideoCallsWithStatus:2]);

            if ([v20 count]) {
              -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v20);
            }
            __int128 v41 = v18;
            id v45 = v12;
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
            BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v21 audioAndVideoCallsWithStatus:3]);

            if ([v22 count]) {
              -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v22);
            }
            __int128 v40 = v20;
            __int128 v46 = v10;
            -[NSMutableArray removeObject:](v15, "removeObject:", v6);
            id v48 = v6;
            -[NSMutableArray removeObject:](v16, "removeObject:", v6);
            id v23 = objc_alloc_init(&OBJC_CLASS___CSDCallDataSourceMap);
            __int128 v43 = v15;
            -[CSDCallDataSourceMap addCalls:forIdentifier:]( v23,  "addCalls:forIdentifier:",  v15,  @"callsToDisconnect");
            __int16 v42 = v16;
            -[CSDCallDataSourceMap addCalls:forIdentifier:](v23, "addCalls:forIdentifier:", v16, @"callsToHold");
            __int128 v52 = 0u;
            __int128 v53 = 0u;
            __int128 v50 = 0u;
            __int128 v51 = 0u;
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSourceMap dataSources](v23, "dataSources"));
            id v25 = [v24 countByEnumeratingWithState:&v50 objects:v54 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v51;
              do
              {
                for (i = 0LL; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v51 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  unsigned int v29 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
                  if (v29 != v49)
                  {
                    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v23,  "callsForDataSource:identifier:",  *(void *)(*((void *)&v50 + 1) + 8LL * (void)i),  @"callsToDisconnect"));
                    unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v23,  "callsForDataSource:identifier:",  v29,  @"callsToHold"));
                    [v29 disconnectCalls:v30 whileHoldingCalls:v31 andUnholdingCalls:&__NSArray0__struct andUngroupingCalls:&__NSArray0__struct];
                  }
                }

                id v26 = [v24 countByEnumeratingWithState:&v50 objects:v54 count:16];
              }

              while (v26);
            }

            id v32 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v23,  "callsForDataSource:identifier:",  v49,  @"callsToDisconnect"));
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v23,  "callsForDataSource:identifier:",  v49,  @"callsToHold"));
            id v7 = v47;
            id v6 = v48;
            [v49 answerCall:v48 withRequest:v47 whileDisconnectingHeldCalls:v32 andHoldingCalls:v33];

            unsigned int v12 = v45;
            id v10 = v46;
            id v34 = (os_log_s *)v43;
            __int128 v14 = v44;
          }

          else
          {
            id v39 = sub_1001704C4();
            id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              sub_1002B7250();
            }
          }
        }

        else
        {
          id v38 = sub_1001704C4();
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR)) {
            sub_1002B72B0();
          }
        }
      }

      else
      {
        id v37 = sub_1001704C4();
        __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR)) {
          sub_1002B71F0();
        }
      }
    }

    else
    {
      id v36 = sub_1001704C4();
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1002B71C4();
      }
    }
  }

  else
  {
    id v35 = sub_1001704C4();
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B7198();
    }
  }
}

- (void)performHoldActiveAndAnswerCall:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v57 = v6;
    __int16 v58 = 2112;
    id v59 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Performing hold active calls and answer ringing call %@ for answer request %@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueProxyIdentifier]);
  if ([v10 length])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 audioAndVideoCallsWithStatus:4]);

    if ([v12 count])
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDCallStateController callWithUniqueProxyIdentifier:fromCallsToAnswer:]( self,  "callWithUniqueProxyIdentifier:fromCallsToAnswer:",  v10,  v12));
      __int128 v14 = v13;
      if (v13)
      {
        if ((-[os_log_s isEqualToCall:](v13, "isEqualToCall:", v6) & 1) != 0)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 dataSource]);
          if (v15)
          {
            id v45 = v14;
            __int128 v46 = v12;
            id v47 = v10;
            __int128 v50 = v7;
            __int128 v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
            __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 audioAndVideoCallsWithStatus:1]);

            __int128 v49 = v18;
            if ([v18 count])
            {
              char v19 = (void *)objc_claimAutoreleasedReturnValue([v18 lastObject]);
              if (v19)
              {
                __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sharedAudioSystemController]( &OBJC_CLASS___TUAudioSystemController,  "sharedAudioSystemController"));
                uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 audioCategory]);
                BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v19 audioMode]);
                id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 currentlyPickedRouteIdForCategory:v21 andMode:v22]);

                if (v23)
                {
                  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v50 sourceIdentifier]);

                  if (!v24)
                  {
                    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[TUAudioSystemController sourceIdentifierForRouteID:]( &OBJC_CLASS___TUAudioSystemController,  "sourceIdentifierForRouteID:",  v23));
                    [v50 setSourceIdentifier:v25];

                    id v26 = sub_1001704C4();
                    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v50 sourceIdentifier]);
                      *(_DWORD *)buf = 138412290;
                      id v57 = v28;
                      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Changed sourceIdentifier of answerRequest to %@",  buf,  0xCu);
                    }
                  }
                }

                __int16 v18 = v49;
              }

              -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:", v18);
            }

            id v48 = v6;
            -[NSMutableArray removeObject:](v16, "removeObject:", v6);
            unsigned int v29 = objc_alloc_init(&OBJC_CLASS___CSDCallDataSourceMap);
            id v44 = v16;
            -[CSDCallDataSourceMap addCalls:forIdentifier:](v29, "addCalls:forIdentifier:", v16, @"callsToHold");
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSourceMap dataSources](v29, "dataSources"));
            id v31 = [v30 countByEnumeratingWithState:&v51 objects:v55 count:16];
            if (v31)
            {
              id v32 = v31;
              uint64_t v33 = *(void *)v52;
              do
              {
                for (i = 0LL; i != v32; i = (char *)i + 1)
                {
                  if (*(void *)v52 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  id v35 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
                  if (v35 != v15)
                  {
                    id v36 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v29,  "callsForDataSource:identifier:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)i),  @"callsToHold"));
                    [v35 holdCalls:v36 whileUnholdingCalls:&__NSArray0__struct];
                  }
                }

                id v32 = [v30 countByEnumeratingWithState:&v51 objects:v55 count:16];
              }

              while (v32);
            }

            id v37 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v29,  "callsForDataSource:identifier:",  v15,  @"callsToHold"));
            id v6 = v48;
            id v7 = v50;
            [v15 answerCall:v48 withRequest:v50 whileHoldingActiveCalls:v37];

            unsigned int v12 = v46;
            id v10 = v47;
            id v38 = (os_log_s *)v44;
            __int128 v14 = v45;
          }

          else
          {
            id v43 = sub_1001704C4();
            id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              sub_1002B73C8();
            }
          }
        }

        else
        {
          id v42 = sub_1001704C4();
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
            sub_1002B7428();
          }
        }
      }

      else
      {
        id v41 = sub_1001704C4();
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
          sub_1002B7368();
        }
      }
    }

    else
    {
      id v40 = sub_1001704C4();
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1002B733C();
      }
    }
  }

  else
  {
    id v39 = sub_1001704C4();
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B7310();
    }
  }
}

- (void)performAnswerCallAsVideoUpgrade:(id)a3 withRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 dataSource]);
  [v7 answerCall:v6 withRequest:v5 whileDisconnectingActiveCalls:&__NSArray0__struct];
}

- (void)performAnswerCallAsAudioDowngrade:(id)a3 withRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 dataSource]);
  [v7 answerCall:v6 withRequest:v5 whileDisconnectingActiveCalls:&__NSArray0__struct];
}

- (void)performDisconnectCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    unsigned int v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);

  if (v10)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer", 0LL));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentCalls]);

    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        __int128 v16 = 0LL;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(id *)(*((void *)&v23 + 1) + 8LL * (void)v16);
          if (v17 != v4)
          {
            char v19 = (void *)objc_claimAutoreleasedReturnValue([v4 callGroupUUID]);
            unsigned int v20 = [v18 isEqual:v19];

            if (v20) {
              [v9 addObject:v17];
            }
          }

          __int128 v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v14);
    }
  }

  if ([v9 count] == (id)1)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSource]);
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    [v21 disconnectCall:v4 whileUngroupingCall:v22];
  }

  else
  {
    [v4 disconnectCallWithReason:41];
  }
}

- (void)performDisconnectCurrentCallAndActivateHeld
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    v84 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  v64 = objc_alloc_init(&OBJC_CLASS___CSDCallDataSourceMap);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 audioAndVideoCallsWithStatus:3]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 audioAndVideoCallsWithStatus:1]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 audioAndVideoCallsWithStatus:2]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 audioAndVideoCallsWithStatus:4]);

  id v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v59 = v8;
  if (![v8 count])
  {
    if (![v10 count])
    {
      if (![v12 count]) {
        goto LABEL_25;
      }
      id v23 = sub_1001704C4();
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v84 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "   ... no sending or active calls were found so adding all held calls to list of calls to disconnect: %@",  buf,  0xCu);
      }

      __int128 v25 = v65;
      goto LABEL_24;
    }

    id v19 = sub_1001704C4();
    unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "   ... no sending calls were found so adding all active calls to list of calls to disconnect: %@",  buf,  0xCu);
    }

    [v65 addObjectsFromArray:v10];
    id v21 = sub_1001704C4();
    BOOL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v12;
LABEL_22:
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "   ... and adding held calls to the list of calls to unhold: %@",  buf,  0xCu);
    }

- (void)performDisconnectAllCallsWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    __int128 v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___CSDCallDataSourceMap);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentAudioAndVideoCalls]);

  -[CSDCallDataSourceMap addCalls:forIdentifier:](v9, "addCalls:forIdentifier:", v11, @"callsToDisconnect");
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallDataSourceMap dataSources](v9, "dataSources", 0LL));
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallDataSourceMap callsForDataSource:identifier:]( v9,  "callsForDataSource:identifier:",  v17,  @"callsToDisconnect"));
        [v17 disconnectAllCalls:v18 withReason:v3];
      }

      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }
}

- (void)performPullRelayingCallsFromClientAndUpdateEndpoint:(BOOL)a3 updateExpectedDestination:(BOOL)a4
{
}

- (void)performPullRelayingCallsFromClientAndUpdateEndpoint:(BOOL)a3 updateExpectedDestination:(BOOL)a4 onlyIfNeedsEndpointConversationRelaySupport:(BOOL)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3, a4, a5));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
  __int128 v20 = (void *)v8;
  [v9 sendPullRelayingCallsMessageToClientAndDisconnectCallsWithUPI:v8];

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentAudioAndVideoCalls]);

  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        [v16 setRelayClientTransport:0];
        if (v6) {
          [v16 setEndpointOnCurrentDevice:1];
        }
        if (v5) {
          [v16 setExpectedRelayClientDestination:0];
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
        [v17 prepareToDisconnectMessagingConnectionForCall:v16];

        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSDRelayConferenceInterface sharedInstance]( &OBJC_CLASS___CSDRelayConferenceInterface,  "sharedInstance"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueProxyIdentifier]);
        [v18 prepareToStopConferenceForIdentifier:v19];
      }

      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }
}

- (void)performSendMMIOrUSSDCodeWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallStateController providerCallDataSource](self, "providerCallDataSource"));
  [v5 sendMMIOrUSSDCodeWithRequest:v4];
}

- (void)performPlayDTMFToneForCall:(id)a3 key:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [v6 playRemoteDTMFToneForKey:v4];
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
  [v7 sendPlayDTMFToneForKeyMessageForCall:v6 DTMFKey:v4];
}

- (void)performSetTTYType:(int)a3 forCall:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    __int128 v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  if (![v6 isHostedOnCurrentDevice]
    || ([v6 isEndpointOnCurrentDevice] & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v11 sendSetTTYTypeCallMessageForCall:v6 ttyType:v4];
  }

  if (v6)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController providerCallDataSource](self, "providerCallDataSource"));
    id v14 = v6;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    [v12 setTTYType:v4 forCalls:v13];
  }
}

- (void)performSetLiveVoicemailUnavailableReason:(int64_t)a3 forCall:(id)a4
{
  if (a4) {
    _[a4 setLiveVoicemailUnavailableReason:a3];
  }
}

- (void)performSetUplinkMuted:(BOOL)a3 forCall:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentAudioAndVideoCalls]);
    *(_DWORD *)buf = 138412290;
    __int128 v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "current calls are %@", buf, 0xCu);
  }

  if (![v6 isHostedOnCurrentDevice]
    || ([v6 isEndpointOnCurrentDevice] & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v11 sendSetUplinkMutedCallMessageForCall:v6 uplinkMuted:v4];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 callGroupUUID]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 callGroupUUID]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 callsWithGroupUUID:v14]);
  }

  else
  {
    id v17 = v6;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 dataSource]);
  [v16 setUplinkMuted:v4 forCalls:v15];
}

- (void)performPullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController providerCallDataSource](self, "providerCallDataSource"));
    [v8 pullCallWithHandoffActivityUserInfo:v6 completion:v7];
  }

  else
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Handoff context did not include any handoff payload. Assuming this is for a relay call",  v11,  2u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)performPushRelayingCallsToHostWithSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
  [v5 sendPushRelayingCallsMessageToHostForSourceIdentifier:v4];
}

- (void)performPushHostedCallsToDestination:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  unsigned int v6 = [v5 allCallsPassTest:&stru_1003DAB88];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callsWithAnEndpointElsewhere]);
    id v9 = [v8 count];

    if (v9) {
      -[CSDCallStateController performPullRelayingCallsFromClientAndUpdateEndpoint:updateExpectedDestination:]( self,  "performPullRelayingCallsFromClientAndUpdateEndpoint:updateExpectedDestination:",  0LL,  1LL);
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
    [v10 sendPushCallsMessageToClientDestination:v4];
  }

  else
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 _allCalls]);
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      __int16 v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to performPushHostedCallsToDestination %@ because not all calls are hosted here and rela yable. All calls: %@",  (uint8_t *)&v15,  0x16u);
    }
  }
}

- (void)performPullHostedCallsFromPairedHostDevice
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  unsigned int v4 = [v3 pairedDeviceExists];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    unsigned int v6 = [v5 allCallsPassTest:&stru_1003DABA8];

    if (v6)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallStateController relayMessagingController](self, "relayMessagingController"));
      [v13 sendPullCallsMessageToHost];
    }

    else
    {
      id v9 = sub_1001704C4();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 _allCalls]);
        *(_DWORD *)buf = 138412290;
        int v15 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to performPullHostedCallsFromPairedHostDevice because not all calls are not hosted her e and not an endpoint here and relayable. All calls: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v7 = sub_1001704C4();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring request to performPullHostedCallsFromPairedHostDevice because no paired device exists",  buf,  2u);
    }
  }

- (void)performUpdateCallWithProxy:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueProxyIdentifier]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 callWithUniqueProxyIdentifier:v6]);

  [v7 updateWithProxyCall:v4];
}

- (void)_handleMessagingConnectionEndForCalls:(id)a3 withDisconnectedReason:(int)a4 didStartConnecting:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
    *(void *)&__int128 v10 = 67109378LL;
    __int128 v21 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        unsigned __int8 v15 = objc_msgSend(v14, "isOutgoing", v21);
        id v16 = sub_1001704C4();
        __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        __int16 v18 = v17;
        if ((v15 & 1) != 0 || v5)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            unsigned int v27 = v6;
            __int16 v28 = 2112;
            v29[0] = v14;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Disconnecting call with disconnected reason %d: %@",  buf,  0x12u);
          }

          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
          [v20 disconnectCall:v14 withReason:v6];
          goto LABEL_15;
        }

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v19 = [v14 isOutgoing];
          *(_DWORD *)buf = 67109634;
          unsigned int v27 = v19;
          __int16 v28 = 1024;
          LODWORD(v29[0]) = 0;
          WORD2(v29[0]) = 2112;
          *(void *)((char *)v29 + 6) = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Disconnecting call normally since it was outgoing (%d) or was never connecting to relay (%d): %@",  buf,  0x18u);
        }

        if ([v14 isHostedOnCurrentDevice])
        {
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callCenter](self, "callCenter"));
          [v20 disconnectCall:v14];
LABEL_15:

          continue;
        }

        [v14 setLocallyDisconnectedWithReasonIfNone:0];
      }

      id v11 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v11);
  }
}

- (void)fetchCurrentCallUpdates:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = sub_1001704C4();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetchCurrentCallUpdates", buf, 2u);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController pendingCallInfoDict](self, "pendingCallInfoDict"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10012D52C;
  v12[3] = &unk_1003DABD0;
  id v13 = v8;
  __int128 v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];

  id v11 = -[NSMutableArray copy](v10, "copy");
  v4[2](v4, v11);
}

- (void)screenWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "screenWithRequest", buf, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10012D6EC;
  v11[3] = &unk_1003D7758;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  sub_1001544C8(v9, @"screen-calls", v11, 0LL, (uint64_t)"-[CSDCallStateController screenWithRequest:]");
}

- (void)registerAnonymousXPCEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "registerAnonymousXPCEndpoint", buf, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10012DAF8;
  v12[3] = &unk_1003D7758;
  void v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  sub_1001544C8(v9, v10, v12, 0LL, (uint64_t)"-[CSDCallStateController registerAnonymousXPCEndpoint:]");
}

- (void)fetchAnonymousXPCEndpoint:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fetchAnonymousXPCEndpoint", v9, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController uiXPCEndpoint](self, "uiXPCEndpoint"));
  v4[2](v4, v8, 0LL);
}

- (void)screenUpdate:(id)a3 withProvider:(id)a4 callSource:(id)a5 callUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  id v15 = sub_1001704C4();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "screenUpdate for callUpdate: %@",  (uint8_t *)&v19,  0xCu);
  }

  __int16 v17 = -[CSDPendingCallInfo initWithCallSource:withCallUpdate:withProvider:callUUID:]( objc_alloc(&OBJC_CLASS___CSDPendingCallInfo),  "initWithCallSource:withCallUpdate:withProvider:callUUID:",  v12,  v10,  v13,  v11);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController pendingCallInfoDict](self, "pendingCallInfoDict"));
  [v18 setObject:v17 forKeyedSubscript:v11];

  -[CSDCallStateController _launchICSForScreeningIfNeeded](self, "_launchICSForScreeningIfNeeded");
}

- (void)dialWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10012DFC0;
  v17[3] = &unk_1003D9E20;
  id v18 = v6;
  int v19 = self;
  id v21 = v7;
  id v20 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10012E148;
  v14[3] = &unk_1003D9EE8;
  id v15 = v20;
  id v16 = v21;
  v14[4] = self;
  id v11 = v20;
  id v12 = v21;
  id v13 = v6;
  sub_1001544C8(v11, v10, v17, v14, (uint64_t)"-[CSDCallStateController dialWithRequest:reply:]");
}

- (void)dialWithRequest:(id)a3 displayContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012E288;
  v13[3] = &unk_1003D7828;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v11 = v7;
  id v12 = v6;
  sub_1001544C8(v9, v10, v13, 0LL, (uint64_t)"-[CSDCallStateController dialWithRequest:displayContext:]");
}

- (void)_dial:(id)a3 displayContext:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallStateController performDialCall:displayContext:]( self,  "performDialCall:displayContext:",  a3,  a4));
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dialed call: %@", (uint8_t *)&v12, 0xCu);
  }

  if (v8) {
    v8[2](v8, v9);
  }
}

- (void)answerCallWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (__CFString *)TUEntitlementsModifyCallsCapability;
  if ([v4 sendToScreening])
  {
    id v8 = @"screen-calls";

    id v7 = v8;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10012E534;
  v10[3] = &unk_1003D7758;
  id v11 = v4;
  int v12 = self;
  id v9 = v4;
  sub_1001544C8(v6, v7, v10, 0LL, (uint64_t)"-[CSDCallStateController answerCallWithRequest:]");
}

- (void)holdCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10012E7F0;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController holdCallWithUniqueProxyIdentifier:]");
}

- (void)unholdCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10012EA24;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController unholdCallWithUniqueProxyIdentifier:]");
}

- (void)requestVideoUpgradeForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10012EC58;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8( v6,  v7,  v9,  0LL,  (uint64_t)"-[CSDCallStateController requestVideoUpgradeForCallWithUniqueProxyIdentifier:]");
}

- (void)disconnectCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10012F084;
  v10[3] = &unk_1003D7828;
  id v11 = v4;
  id v12 = v6;
  id v13 = self;
  id v8 = v6;
  id v9 = v4;
  sub_1001544C8(v8, v7, v10, 0LL, (uint64_t)"-[CSDCallStateController disconnectCallWithUniqueProxyIdentifier:]");
}

- (void)groupCallWithUniqueProxyIdentifier:(id)a3 withOtherCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012F2F4;
  v13[3] = &unk_1003D7828;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v11 = v7;
  id v12 = v6;
  sub_1001544C8( v9,  v10,  v13,  0LL,  (uint64_t)"-[CSDCallStateController groupCallWithUniqueProxyIdentifier:withOtherCallWithUniqueProxyIdentifier:]");
}

- (void)ungroupCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10012F5F4;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController ungroupCallWithUniqueProxyIdentifier:]");
}

- (void)swapCalls
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentClient]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10012F804;
  v5[3] = &unk_1003D7730;
  v5[4] = self;
  sub_1001544C8(v4, TUEntitlementsModifyCallsCapability, v5, 0LL, (uint64_t)"-[CSDCallStateController swapCalls]");
}

- (void)playDTMFToneForCallWithUniqueProxyIdentifier:(id)a3 key:(unsigned __int8)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10012F948;
  v11[3] = &unk_1003D7918;
  unsigned __int8 v14 = a4;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController playDTMFToneForCallWithUniqueProxyIdentifier:key:]");
}

- (void)disconnectCurrentCallAndActivateHeld
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentClient]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10012FB6C;
  v5[3] = &unk_1003D7730;
  v5[4] = self;
  sub_1001544C8( v4,  TUEntitlementsModifyCallsCapability,  v5,  0LL,  (uint64_t)"-[CSDCallStateController disconnectCurrentCallAndActivateHeld]");
}

- (void)disconnectAllCalls
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentClient]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10012FC7C;
  v5[3] = &unk_1003D7730;
  v5[4] = self;
  sub_1001544C8( v4,  TUEntitlementsModifyCallsCapability,  v5,  0LL,  (uint64_t)"-[CSDCallStateController disconnectAllCalls]");
}

- (void)setTTYType:(int)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10012FDC4;
  v11[3] = &unk_1003D9D80;
  int v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1001544C8(v8, v9, v11, 0LL, (uint64_t)"-[CSDCallStateController setTTYType:forCallWithUniqueProxyIdentifier:]");
}

- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10012FF8C;
  v11[3] = &unk_1003D78F0;
  id v13 = self;
  int64_t v14 = a3;
  id v12 = v6;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController setLiveVoicemailUnavailableReason:forCallWithUniqueProxyIdentifier:]");
}

- (void)pullRelayingCallsFromClient
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentClient]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100130128;
  v5[3] = &unk_1003D7730;
  v5[4] = self;
  sub_1001544C8( v4,  TUEntitlementsModifyCallsCapability,  v5,  0LL,  (uint64_t)"-[CSDCallStateController pullRelayingCallsFromClient]");
}

- (void)pullRelayingGFTCallsFromClientIfNecessary
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentClient]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100130240;
  v5[3] = &unk_1003D7730;
  v5[4] = self;
  sub_1001544C8( v4,  TUEntitlementsModifyCallsCapability,  v5,  0LL,  (uint64_t)"-[CSDCallStateController pullRelayingGFTCallsFromClientIfNecessary]");
}

- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100130380;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController pushRelayingCallsToHostWithSourceIdentifier:]");
}

- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1001305A0;
  v22[3] = &unk_1003DABF8;
  id v23 = v9;
  id v24 = v7;
  v22[4] = self;
  id v10 = v9;
  id v11 = v7;
  id v12 = objc_retainBlock(v22);
  id v13 = (void *)TUEntitlementsModifyCallsCapability;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10013060C;
  v18[3] = &unk_1003D8410;
  id v19 = v6;
  id v20 = self;
  id v21 = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001306BC;
  v16[3] = &unk_1003D7E90;
  id v17 = v21;
  int64_t v14 = v21;
  id v15 = v6;
  sub_1001544C8( v10,  v13,  v18,  v16,  (uint64_t)"-[CSDCallStateController pullCallFromClientUsingHandoffActivityUserInfo:reply:]");
}

- (void)sendMMIOrUSSDCodeWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100130790;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController sendMMIOrUSSDCodeWithRequest:]");
}

- (void)setUplinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100130910;
  v11[3] = &unk_1003D7918;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1001544C8(v8, v9, v11, 0LL, (uint64_t)"-[CSDCallStateController setUplinkMuted:forCallWithUniqueProxyIdentifier:]");
}

- (void)setDownlinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100130B68;
  v11[3] = &unk_1003D7918;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController setDownlinkMuted:forCallWithUniqueProxyIdentifier:]");
}

- (void)setIsSendingVideo:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100130DBC;
  v11[3] = &unk_1003D7918;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController setIsSendingVideo:forCallWithUniqueProxyIdentifier:]");
}

- (void)setMixesVoiceWithMedia:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100131050;
  v11[3] = &unk_1003D7918;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController setMixesVoiceWithMedia:forCallWithUniqueProxyIdentifier:]");
}

- (void)setSharingScreen:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001312A4;
  v11[3] = &unk_1003D7918;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController setSharingScreen:forCallWithUniqueProxyIdentifier:]");
}

- (void)setHasEmergencyVideoStream:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001314F8;
  v11[3] = &unk_1003D7918;
  BOOL v14 = a3;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController setHasEmergencyVideoStream:forCallWithUniqueProxyIdentifier:]");
}

- (void)setEmergencyMediaItems:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100131768;
  v13[3] = &unk_1003D7828;
  id v14 = v6;
  id v15 = v7;
  id v16 = self;
  id v11 = v7;
  id v12 = v6;
  sub_1001544C8( v9,  v10,  v13,  0LL,  (uint64_t)"-[CSDCallStateController setEmergencyMediaItems:forCallWithUniqueProxyIdentifier:]");
}

- (void)pushHostedCallsToDestination:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001319B4;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController pushHostedCallsToDestination:]");
}

- (void)pullHostedCallsFromPairedHostDevice
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentClient]);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100131B00;
  v5[3] = &unk_1003D7730;
  v5[4] = self;
  sub_1001544C8( v4,  TUEntitlementsModifyCallsCapability,  v5,  0LL,  (uint64_t)"-[CSDCallStateController pullHostedCallsFromPairedHostDevice]");
}

- (void)sendHardPauseDigitsForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100131C34;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8( v6,  v7,  v9,  0LL,  (uint64_t)"-[CSDCallStateController sendHardPauseDigitsForCallWithUniqueProxyIdentifier:]");
}

- (void)updateCallWithProxy:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100131DCC;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController updateCallWithProxy:]");
}

- (void)enteredForegroundForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100131F3C;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  sub_1001544C8( v6,  v7,  v9,  0LL,  (uint64_t)"-[CSDCallStateController enteredForegroundForCallWithUniqueProxyIdentifier:]");
}

- (void)willEnterBackgroundForAllCalls
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 currentClient]);

  sub_1001544C8( v3,  TUEntitlementsModifyCallsCapability,  &stru_1003DAC18,  0LL,  (uint64_t)"-[CSDCallStateController willEnterBackgroundForAllCalls]");
}

- (void)enteredBackgroundForAllCalls
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 currentClient]);

  sub_1001544C8( v3,  TUEntitlementsModifyCallsCapability,  &stru_1003DAC38,  0LL,  (uint64_t)"-[CSDCallStateController enteredBackgroundForAllCalls]");
}

- (void)setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10013230C;
  v12[3] = &unk_1003DA1E0;
  CGFloat v15 = width;
  CGFloat v16 = height;
  id v13 = v7;
  id v14 = self;
  id v11 = v7;
  sub_1001544C8( v9,  v10,  v12,  0LL,  (uint64_t)"-[CSDCallStateController setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:size:]");
}

- (void)setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:(id)a3 presentationState:(int)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001324E0;
  v11[3] = &unk_1003D9D80;
  int v14 = a4;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:presentationState:]");
}

- (void)setScreenShareAttributesForCallWithUniqueProxyIdentifier:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  id v10 = (void *)TUEntitlementsModifyCallsCapability;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001326C0;
  v13[3] = &unk_1003D7828;
  id v14 = v7;
  id v15 = v6;
  CGFloat v16 = self;
  id v11 = v6;
  id v12 = v7;
  sub_1001544C8( v9,  v10,  v13,  0LL,  (uint64_t)"-[CSDCallStateController setScreenShareAttributesForCallWithUniqueProxyIdentifier:attributes:]");
}

- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4 forCallWithUniqueProxyIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentClient]);

  id v12 = (void *)TUEntitlementsModifyCallsCapability;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001328A4;
  v15[3] = &unk_1003D8FE0;
  BOOL v19 = a3;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v13 = v9;
  id v14 = v8;
  sub_1001544C8( v11,  v12,  v15,  0LL,  (uint64_t)"-[CSDCallStateController setSharingScreen:attributes:forCallWithUniqueProxyIdentifier:]");
}

- (void)setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:(id)a3 bluetoothAudioFormat:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100132A74;
  v11[3] = &unk_1003D78F0;
  id v13 = self;
  int64_t v14 = a4;
  id v12 = v6;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:bluetoothAudioFormat:]");
}

- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CSDCallStateController: sendUserScoreToRTCReporting with UUID: %@ and Score: %d",  (uint8_t *)&v9,  0x12u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
  [v8 sendUserScoreToRTCReporting:v5 withScore:v4];
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100132D68;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  __int16 v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController joinConversationWithRequest:]");
}

- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100132EE0;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  __int16 v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController setCurrentAudioInputDeviceToDeviceWithUID:]");
}

- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = (void *)TUEntitlementsModifyCallsCapability;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10013307C;
  v9[3] = &unk_1003D7758;
  id v10 = v4;
  __int16 v11 = self;
  id v8 = v4;
  sub_1001544C8(v6, v7, v9, 0LL, (uint64_t)"-[CSDCallStateController setCurrentAudioOutputDeviceToDeviceWithUID:]");
}

- (void)localRoutesByUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100133218;
  v8[3] = &unk_1003DAC60;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  sub_1001544C8(v6, @"access-calls", v8, 0LL, (uint64_t)"-[CSDCallStateController localRoutesByUniqueIdentifier:]");
}

- (void)pairedHostDeviceRoutesByUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100133330;
  v8[3] = &unk_1003DAC60;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  sub_1001544C8( v6,  @"access-calls",  v8,  0LL,  (uint64_t)"-[CSDCallStateController pairedHostDeviceRoutesByUniqueIdentifier:]");
}

- (void)pickLocalRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100133458;
  v11[3] = &unk_1003D7918;
  id v12 = v6;
  id v13 = self;
  BOOL v14 = a4;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController pickLocalRouteWithUniqueIdentifier:shouldWaitUntilAvailable:]");
}

- (void)pickPairedHostDeviceRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  id v9 = (void *)TUEntitlementsModifyCallsCapability;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001335F0;
  v11[3] = &unk_1003D7918;
  id v12 = v6;
  id v13 = self;
  BOOL v14 = a4;
  id v10 = v6;
  sub_1001544C8( v8,  v9,  v11,  0LL,  (uint64_t)"-[CSDCallStateController pickPairedHostDeviceRouteWithUniqueIdentifier:shouldWaitUntilAvailable:]");
}

- (void)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentClient]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001337D4;
  v18[3] = &unk_1003DAC88;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  BOOL v22 = a5;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  sub_1001544C8( v14,  @"access-calls",  v18,  0LL,  (uint64_t)"-[CSDCallStateController containsRestrictedHandle:forBundleIdentifier:performSynchronously:reply:]");
}

- (void)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v6 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentClient]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100133908;
  v10[3] = &unk_1003D7E90;
  id v11 = v6;
  id v9 = v6;
  sub_1001544C8( v8,  @"access-calls",  v10,  0LL,  (uint64_t)"-[CSDCallStateController policyForAddresses:forBundleIdentifier:reply:]");
}

- (void)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentClient]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100133A2C;
  v16[3] = &unk_1003DACB0;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  sub_1001544C8( v12,  @"access-calls",  v16,  0LL,  (uint64_t)"-[CSDCallStateController willRestrictAddresses:forBundleIdentifier:reply:]");
}

- (void)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5 reply:(id)a6
{
  id v7 = a6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentClient]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100133B78;
  v11[3] = &unk_1003D7E90;
  id v12 = v7;
  id v10 = v7;
  sub_1001544C8( v9,  @"access-calls",  v11,  0LL,  (uint64_t)"-[CSDCallStateController shouldRestrictAddresses:forBundleIdentifier:performSynchronously:reply:]");
}

- (void)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 currentClient]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100133CC4;
  v20[3] = &unk_1003DACD8;
  id v23 = v12;
  id v24 = v13;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v13;
  sub_1001544C8( v15,  @"access-calls",  v20,  0LL,  (uint64_t)"-[CSDCallStateController isUnknownAddress:normalizedAddress:forBundleIdentifier:reply:]");
}

- (void)filterStatusForAddresses:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentClient]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100133E44;
  v16[3] = &unk_1003DACB0;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  sub_1001544C8( v12,  @"access-calls",  v16,  0LL,  (uint64_t)"-[CSDCallStateController filterStatusForAddresses:forBundleIdentifier:reply:]");
}

- (void)setClientCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "clientCapabilities: %@", (uint8_t *)&v9, 0xCu);
  }

  [v6 setCapabilities:v4];
}

- (void)messagingConnectionEndedForCalls:(id)a3 didStartConnecting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Messaging connection ended for calls %@. Disconnecting calls that are an endpoint here but are not hosted here.",  (uint8_t *)&v11,  0xCu);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_1003DAD18));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 filteredArrayUsingPredicate:v9]);

  -[CSDCallStateController _handleMessagingConnectionEndForCalls:withDisconnectedReason:didStartConnecting:]( self,  "_handleMessagingConnectionEndForCalls:withDisconnectedReason:didStartConnecting:",  v10,  8LL,  v4);
}

- (void)messagingConnectionFailedForCalls:(id)a3 didStartConnecting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1002B74FC();
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_1003DAD38));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 filteredArrayUsingPredicate:v9]);

  -[CSDCallStateController _handleMessagingConnectionEndForCalls:withDisconnectedReason:didStartConnecting:]( self,  "_handleMessagingConnectionEndForCalls:withDisconnectedReason:didStartConnecting:",  v10,  8LL,  v4);
}

- (void)messagingConnectionCouldNotEstablishLinkForCalls:(id)a3 didStartConnecting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1002B755C();
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_1003DAD58));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 filteredArrayUsingPredicate:v9]);

  -[CSDCallStateController _handleMessagingConnectionEndForCalls:withDisconnectedReason:didStartConnecting:]( self,  "_handleMessagingConnectionEndForCalls:withDisconnectedReason:didStartConnecting:",  v10,  13LL,  v4);
}

- (void)propertiesChangedForCall:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callController](self, "callController"));
  [v5 registerCall:v4];
}

- (BOOL)multipleCallsActiveOrHeld
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v3 = [v2 countOfCallsPassingTest:&stru_1003DAD78];

  return (unint64_t)v3 > 1;
}

- (id)currentProxyCalls
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _allCalls]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      int v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TUProxyCall proxyCallWithCall:]( &OBJC_CLASS___TUProxyCall,  "proxyCallWithCall:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9),  (void)v13));
        [v4 addObject:v10];

        int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return v11;
}

- (id)callForClient:(id)a3 usingCall:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    else {
      id v7 = v6;
    }
    uint64_t v8 = v7;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)currentCallsForClient:(id)a3
{
  id v4 = a3;
  if ([v4 isRemote])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController currentProxyCalls](self, "currentProxyCalls"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[CSDCallStateController eligibleCallsByFilteringCalls:forClient:]( self,  "eligibleCallsByFilteringCalls:forClient:",  v5,  v4));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 _allCalls]);
  }

  id v7 = (void *)v6;

  return v7;
}

- (BOOL)isTrackingVoIPCallForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001346F4;
  block[3] = &unk_1003D9238;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)requestInitialState:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController clientManager](self, "clientManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentClient]);

  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Requesting initial state for client %@",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController currentCallsForClient:](self, "currentCallsForClient:", v6));
  v4[2](v4, v9);
}

- (void)reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "uniqueProxyIdentifier %@",  (uint8_t *)&v10,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callContainer](self, "callContainer"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 callWithUniqueProxyIdentifier:v4]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 postNotificationName:@"CSDCallLocalPreviewStoppedNotification" object:v8];
  }
}

- (void)saveCustomSandboxedURLGreeting:(id)a3 forAccountUUID:(id)a4
{
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "saveCustomGreeting", v6, 2u);
  }
}

- (void)deleteCustomGreetingForAccountUUID:(id)a3
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "deleteCustomGreetingForAccountUUID", v5, 2u);
  }
}

- (void)customSandboxedURLGreetingForAccountUUID:(id)a3 withCompletion:(id)a4
{
  id v4 = (void (**)(id, void))a4;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "customGreetingForAccountUUID:withCompletion:",  v7,  2u);
  }

  v4[2](v4, 0LL);
}

- (void)defaultGreeting:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "defaultGreeting", v6, 2u);
  }

  v3[2](v3, 0LL);
}

- (void)callHistoryManager:(id)a3 recentCallRequestedFor:(id)a4 withStartDate:(id)a5 avMode:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CSDCallStateController recentsController](self, "recentsController"));
  [v11 reportRecentCallForConversation:v10 withStartDate:v9 avMode:a6];
}

- (void)didChangeRelayCallingCapabilities
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }

  -[CSDCallStateController _handleRelayCallingChanged](self, "_handleRelayCallingChanged");
}

- (IMNicknameProvider)nicknameProvider
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned int v4 = [v3 nameAndPhotoEnabled];

  if (v4)
  {
    nicknameProvider = self->_nicknameProvider;
    if (!nicknameProvider)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___IMNicknameProvider);
      id v7 = self->_nicknameProvider;
      self->_nicknameProvider = v6;

      nicknameProvider = self->_nicknameProvider;
    }

    uint64_t v8 = nicknameProvider;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)fetchPreferredFaceTimeAccountID
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](&OBJC_CLASS___IMService, "facetimeService"));
  uint64_t v3 = IMPreferredAccountForService();
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayName]);
  return v5;
}

+ (id)automaticNameAndPhotoQueue
{
  if (qword_10044D068 != -1) {
    dispatch_once(&qword_10044D068, &stru_1003DAD98);
  }
  return (id)qword_10044D060;
}

- (void)sendAutomaticNameAndPhotoUsingDialRequestIfPossible:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 nameAndPhotoEnabled];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
    uint64_t v8 = TUNormalizedHandleForTUHandle(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[CSDCallStateController automaticNameAndPhotoQueue]( &OBJC_CLASS___CSDCallStateController,  "automaticNameAndPhotoQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100134F34;
      block[3] = &unk_1003D7828;
      void block[4] = self;
      id v12 = v9;
      id v13 = v4;
      dispatch_async(v10, block);
    }
  }
}

- (void)sendAutomaticNameAndPhotoUsingJoinRequestIfPossible:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 nameAndPhotoEnabled];

  if (v6)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[CSDCallStateController automaticNameAndPhotoQueue]( &OBJC_CLASS___CSDCallStateController,  "automaticNameAndPhotoQueue"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100135098;
    v8[3] = &unk_1003D7758;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)sendNameAndPhotoUsingDialRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 nameAndPhotoEnabled];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
    uint64_t v8 = TUNormalizedHandleForTUHandle(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
      unsigned int v11 = [v10 isTelephonyProvider];

      if (v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentity]);
        id v13 = sub_1001704C4();
        char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 138412290;
          id v30 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SNAP: Using localSenderIdentity %@",  (uint8_t *)&v29,  0xCu);
        }

        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 handle]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 normalizedValue]);

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 handle]);
        id v18 = v17;
        if (v16)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 normalizedValue]);
          id v20 = v18;
        }

        else
        {
          uint64_t v21 = TUNormalizedHandleForTUHandle(v17);
          id v20 = (void *)objc_claimAutoreleasedReturnValue(v21);

          id v22 = sub_1001704C4();
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            int v29 = 138412290;
            id v30 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "SNAP: Normalized senderIdentity handle to be %@",  (uint8_t *)&v29,  0xCu);
          }

          id v24 = (void *)objc_claimAutoreleasedReturnValue([v20 normalizedValue]);
          __int128 v25 = v24;
          if (v24) {
            id v26 = v24;
          }
          else {
            id v26 = (id)objc_claimAutoreleasedReturnValue([v20 value]);
          }
          id v19 = v26;
        }
      }

      else
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDCallStateController fetchPreferredFaceTimeAccountID]( self,  "fetchPreferredFaceTimeAccountID"));
      }

      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v9 value]);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v27));
      -[CSDCallStateController sendNameAndPhotoToHandles:fromID:](self, "sendNameAndPhotoToHandles:fromID:", v28, v19);
    }
  }
}

- (void)sendNameAndPhotoUsingJoinRequest:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 sanitizedHandles]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController fetchPreferredFaceTimeAccountID](self, "fetchPreferredFaceTimeAccountID"));
  -[CSDCallStateController sendNameAndPhotoToHandles:fromID:](self, "sendNameAndPhotoToHandles:fromID:", v5, v4);
}

- (void)sendNameAndPhotoToHandles:(id)a3 fromID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned int v9 = [v8 nameAndPhotoEnabled];

  if (v9)
  {
    id v10 = sub_1001704C4();
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SNAP: Requesting to send Name+Photo to handles %@ fromID %@",  buf,  0x16u);
    }

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        __int128 v16 = 0LL;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v16);
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController nicknameProvider](self, "nicknameProvider", (void)v19));
          [v18 sendPersonalNicknameToHandleID:v17 fromHandleID:v7];

          __int128 v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v14);
    }
  }
}

- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 callProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned int v9 = [v8 nameAndPhotoEnabled];

  if (v9) {
    BOOL v10 = -[CSDCallStateController shouldAutomaticallySendNameAndPhotoToHandles:isDefaultProvider:]( self,  "shouldAutomaticallySendNameAndPhotoToHandles:isDefaultProvider:",  v6,  [v7 isSystemProvider]);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 conversationProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned int v9 = [v8 nameAndPhotoEnabled];

  if (v9) {
    BOOL v10 = -[CSDCallStateController shouldAutomaticallySendNameAndPhotoToHandles:isDefaultProvider:]( self,  "shouldAutomaticallySendNameAndPhotoToHandles:isDefaultProvider:",  v6,  [v7 isDefaultProvider]);
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)shouldAutomaticallySendNameAndPhotoToHandles:(id)a3 isDefaultProvider:(BOOL)a4
{
  BOOL v4 = a4;
  id v46 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController featureFlags](self, "featureFlags"));
  unsigned int v7 = [v6 nameAndPhotoEnabled];

  if (!v7) {
    goto LABEL_26;
  }
  if (!-[CSDCallStateController _nameAndPhotoSharingEnabled](self, "_nameAndPhotoSharingEnabled"))
  {
    id v29 = sub_1001704C4();
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "SNAP: Shouldnt automatically send Name+Photo because sharing is disabled",  buf,  2u);
    }

    BOOL v8 = 0;
    goto LABEL_30;
  }

  if (-[CSDCallStateController _sharingAudienceAllowsAutoSendNameAndPhoto]( self,  "_sharingAudienceAllowsAutoSendNameAndPhoto"))
  {
    BOOL v8 = 0;
    if (!-[CSDCallStateController _hasAlreadyDeniedSendingNameAndPhotoToHandles:]( self,  "_hasAlreadyDeniedSendingNameAndPhotoToHandles:",  v46)
      && v4)
    {
      id v42 = self;
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDCallStateController callProviderManager](self, "callProviderManager"));
      BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 providersByIdentifierForRemoteClients:0]);

      id v40 = v10;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      id v41 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v10,  "objectForKeyedSubscript:",  @"com.apple.coretelephony"));
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v41 prioritizedSenderIdentities]);
      id v12 = [v11 countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v12)
      {
        id v13 = v12;
        char v44 = 0;
        uint64_t v45 = *(void *)v56;
        id obj = v11;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v56 != v45) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            id v16 = v46;
            id v17 = [v16 countByEnumeratingWithState:&v51 objects:v64 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v52;
              while (2)
              {
                for (j = 0LL; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v52 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)j);
                  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v15 handle]);
                  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 normalizedValue]);
                  LOBYTE(v21) = TUStringsAreEqualOrNil(v21, v23);

                  if ((v21 & 1) != 0)
                  {
                    char v44 = 1;
                    goto LABEL_21;
                  }
                }

                id v18 = [v16 countByEnumeratingWithState:&v51 objects:v64 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }

- (id)_contactForHandle:(id)a3 contactStore:(id)a4
{
  return _[a4 contactForDestinationId:a3];
}

- (BOOL)_nameAndPhotoSharingEnabled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[IMMeCardSharingStateController sharedInstance]( &OBJC_CLASS___IMMeCardSharingStateController,  "sharedInstance"));
  unsigned __int8 v3 = [v2 sharingEnabled];

  return v3;
}

- (BOOL)_sharingAudienceAllowsAutoSendNameAndPhoto
{
  return 1;
}

- (BOOL)_hasAlreadyDeniedSendingNameAndPhotoToHandles:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMServiceImpl iMessageService](&OBJC_CLASS___IMServiceImpl, "iMessageService"));
  uint64_t v5 = IMPreferredAccountForService();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 imHandleWithID:*(void *)(*((void *)&v27 + 1) + 8 * (void)i)]);
        if (v13) {
          [v7 addObject:v13];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v10);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v14 = v7;
  uint64_t v15 = (os_log_s *)[v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    while (2)
    {
      for (j = 0LL; j != v15; j = (os_log_s *)((char *)j + 1))
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)j);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMNicknameController sharedInstance](&OBJC_CLASS___IMNicknameController, "sharedInstance"));
        LODWORD(v18) = [v19 handleIsDeniedForSharing:v18];

        if ((_DWORD)v18)
        {
          id v20 = sub_1001704C4();
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 v22 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "SNAP: Shouldnt automatically send Name+Photo because has previously denied sending to handle",  v22,  2u);
          }

          LOBYTE(v15) = 1;
          goto LABEL_22;
        }
      }

      uint64_t v15 = (os_log_s *)[v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

- (BOOL)isInCallUIActive
{
  return 1;
}

- (BOOL)hasCustomGreetingFor:(id)a3
{
  return 0;
}

- (CSDCallHistoryManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (CSDCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CSDCallController)callController
{
  return self->_callController;
}

- (CSDVoIPApplicationController)voipApplicationController
{
  return self->_voipApplicationController;
}

- (void)setVoipApplicationController:(id)a3
{
}

- (CSDRelayMessagingController)relayMessagingController
{
  return self->_relayMessagingController;
}

- (CSDRecentsController)recentsController
{
  return self->_recentsController;
}

- (CSDAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
}

- (CSDAudioArbitrationController)audioArbitrationController
{
  return self->_audioArbitrationController;
}

- (void)setAudioArbitrationController:(id)a3
{
}

- (CSDRouteController)localRouteController
{
  return self->_localRouteController;
}

- (CSDRouteController)pairedHostDeviceRouteController
{
  return self->_pairedHostDeviceRouteController;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (NSString)currentlyTrackedA2DPRouteIdentifier
{
  return self->_currentlyTrackedA2DPRouteIdentifier;
}

- (void)setCurrentlyTrackedA2DPRouteIdentifier:(id)a3
{
}

- (CSDCallHistoryManagerXPCServer)callHistoryManagerXPCServer
{
  return self->_callHistoryManagerXPCServer;
}

- (CSDCallProviderManagerXPCServer)callProviderManagerXPCServer
{
  return self->_callProviderManagerXPCServer;
}

- (CSDRelayCallDataSource)relayCallDataSource
{
  return self->_relayCallDataSource;
}

- (CSDRelayCallDelegate)relayCallDelegate
{
  return self->_relayCallDelegate;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (TUHardwareControlsBroadcaster)hardwareControlsBroadcaster
{
  return self->_hardwareControlsBroadcaster;
}

- (CSDProcessObserverProtocol)processObserver
{
  return self->_processObserver;
}

- (CSDApplicationInstallationObserver)applicationInstallationObserver
{
  return self->_applicationInstallationObserver;
}

- (void)setNicknameProvider:(id)a3
{
}

- (NSArray)currentUpdatesForScreening
{
  return self->_currentUpdatesForScreening;
}

- (void)setCurrentUpdatesForScreening:(id)a3
{
}

- (NSMutableDictionary)pendingCallInfoDict
{
  return self->_pendingCallInfoDict;
}

- (void)setPendingCallInfoDict:(id)a3
{
}

- (NSXPCListenerEndpoint)uiXPCEndpoint
{
  return self->_uiXPCEndpoint;
}

- (void)setUiXPCEndpoint:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setClientInvalidationHandler:(id)a3
{
}

- (CSDProviderCallDataSource)providerCallDataSource
{
  return self->_providerCallDataSource;
}

- (void)setShouldHandleSecureMicrophoneEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end