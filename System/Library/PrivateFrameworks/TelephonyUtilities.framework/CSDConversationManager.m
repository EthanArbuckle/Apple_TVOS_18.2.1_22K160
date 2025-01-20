@interface CSDConversationManager
- (BOOL)_isActiveRemoteMemberForHandle:(id)a3 conversation:(id)a4;
- (BOOL)_linksEnabled;
- (BOOL)_shouldNotifyDelegatesOfMessage:(id)a3 localHandleAdded:(BOOL)a4 isFromStorage:(BOOL)a5;
- (BOOL)_shouldRingForIncomingCallWithHandle:(id)a3 conversation:(id)a4 isFromPendingMessage:(BOOL)a5 isOldMessage:(BOOL)a6 isLetMeInApproved:(BOOL)a7;
- (BOOL)_shouldSkipManualApprovalForHandle:(id)a3 conversation:(id)a4 responseKeyData:(id)a5;
- (BOOL)allActiveConversationParticipantsSupportSharePlay;
- (BOOL)broadcastData:(id)a3 onConversation:(id)a4;
- (BOOL)broadcastData:(id)a3 onConversation:(id)a4 additionalOptions:(id)a5;
- (BOOL)broadcastFile:(id)a3 onConversation:(id)a4 additionalOptions:(id)a5;
- (BOOL)conversationContainsScreenShareRequest:(id)a3 localRequest:(BOOL)a4 requestHandle:(id)a5;
- (BOOL)isConversationWithUUIDRedirectingAudio:(id)a3;
- (BOOL)isConversationWithUUIDRelaying:(id)a3;
- (BOOL)isConversationWithUUIDScreening:(id)a3;
- (BOOL)isHandleLocalPseudonym:(id)a3 provider:(id)a4;
- (BOOL)isHandleStringLocalPseudonym:(id)a3;
- (BOOL)isHandleStringLocalPseudonym:(id)a3 provider:(id)a4;
- (BOOL)isScreenSharingAvailable;
- (BOOL)isScreenSharingInitiationAvailable;
- (BOOL)isSharePlayAvailable;
- (BOOL)isValidLocalHandle:(id)a3;
- (BOOL)isValidLocalHandle:(id)a3 activeLocalHandles:(id)a4 provider:(id)a5;
- (BOOL)isValidLocalHandle:(id)a3 forProvider:(id)a4;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5 fromMember:(id)a6;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5 fromMember:(id)a6 additionalOptions:(id)a7 isBlobResponse:(BOOL)a8 callback:(id)a9;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toHandle:(id)a5;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toHandle:(id)a5 isBlobResponse:(BOOL)a6;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toMember:(id)a5;
- (BOOL)sendData:(id)a3 onConversation:(id)a4 toMember:(id)a5 additionalOptions:(id)a6;
- (BOOL)sendMessagesForCreatedOrChangedLink:(id)a3 conversation:(id)a4 messageType:(int)a5;
- (BOOL)sendMessagesForInvalidatedLink:(id)a3;
- (BOOL)shouldAcceptMembershipUpdateFromHandle:(id)a3 joinContext:(id)a4 participantUpdate:(id)a5 existingConversation:(id)a6;
- (BOOL)shouldAcceptMessageFromHandle:(id)a3 messageContext:(id)a4 message:(id)a5 existingConversation:(id)a6;
- (BOOL)shouldCreatePendingChatForMessageType:(int64_t)a3 fromHandle:(id)a4;
- (BOOL)shouldIgnoreMessageForConversation:(id)a3;
- (BOOL)verifyActivitySessionOriginatorFromHandle:(id)a3 message:(id)a4;
- (BOOL)verifyAllLightweightmembersAssociated:(id)a3 remoteMembers:(id)a4;
- (BOOL)verifyBlobResponseFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5;
- (BOOL)verifyEndorseRepresentsMemberFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5;
- (BOOL)verifyGroupSessionParticipantUpdateAllowedFromHandle:(id)a3 participantUpdate:(id)a4 message:(id)a5 existingConversation:(id)a6 lightweightMembers:(id)a7;
- (BOOL)verifyKickMemberPermittedFromHandle:(id)a3 message:(id)a4;
- (BOOL)verifyLightweightMessageTypeFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5;
- (BOOL)verifyMessageIntentKeyFromContext:(id)a3 message:(id)a4;
- (CPActivityAuthorizationManager)activityAuthorizationManager;
- (CPApplicationController)cpApplicationController;
- (CPSystemStateObserver)sharePlaySystemStateObserver;
- (CSDConduitIDSProxy)messageProxy;
- (CSDConversationInvitationResolving)invitationResolver;
- (CSDConversationLinkManager)linkManager;
- (CSDConversationManager)init;
- (CSDConversationManager)initWithQueue:(id)a3 reportingController:(id)a4 persistenceController:(id)a5 linkManager:(id)a6 cpApplicationController:(id)a7 invitationResolver:(id)a8 pendingMembershipTracker:(id)a9 featureFlags:(id)a10 applicationPolicyManager:(id)a11;
- (CSDConversationManager)initWithQueue:(id)a3 reportingController:(id)a4 persistenceController:(id)a5 linkManager:(id)a6 invitationResolver:(id)a7 pendingMembershipTracker:(id)a8 featureFlags:(id)a9;
- (CSDConversationManager)initWithReportingController:(id)a3 cpApplicationController:(id)a4 invitationResolver:(id)a5;
- (CSDConversationNoticeManager)conversationNoticeManger;
- (CSDConversationPersistenceController)persistenceController;
- (CSDConversationProviderManager)conversationProviderManager;
- (CSDDeviceLockStateObserver)lockStateObserver;
- (CSDFileTransferController)fileTransferController;
- (CSDIDSService)service;
- (CSDParticipantUpdateSanitizer)participantUpdateSanitizer;
- (CSDPendingMembershipTracker)pendingMembershipTracker;
- (CSDReportingController)reportingController;
- (CSDScreenSharingActivityManager)screenSharingActivityManager;
- (CSDSecureImageTranscoder)imageTranscoder;
- (CSDSharedConversationServerBag)serverBag;
- (CSDVoucherManager)voucherManager;
- (FTDeviceSupport)deviceSupport;
- (NSDictionary)activityAuthorizedBundleIdentifierState;
- (NSDictionary)conversationsByGroupUUID;
- (NSDictionary)conversationsByUUID;
- (NSDictionary)incomingPendingConversationsByGroupUUID;
- (NSDictionary)pseudonymsByCallUUID;
- (NSMapTable)delegateToQueue;
- (NSMapTable)observerToQueue;
- (NSMutableDictionary)mutableConversationsByUUID;
- (NSMutableDictionary)mutableConversationsRequestingUpgradeWithPreferences;
- (NSMutableDictionary)mutablePendingConversationsByPseudonym;
- (NSMutableDictionary)mutablePseudonymsByCallUUID;
- (NSMutableDictionary)mutablePseudonymsByRequestIdentifiers;
- (NSMutableDictionary)mutableSendDataCallbacksByRequestIdentifiers;
- (NSMutableDictionary)outIdentifierToConversationInfo;
- (NSMutableDictionary)resourceTransferCallbacks;
- (NSMutableDictionary)screenCaptureQueue;
- (NSMutableSet)incomingPendingMessageGUIDs;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)pendingConversationCleanupTimer;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (id)_getActivatedLinkWithHandle:(id)a3 updateGroupUUID:(id)a4 updateInvitedHandles:(id)a5;
- (id)_inactiveRemoteMemberForHandle:(id)a3 conversation:(id)a4;
- (id)_incomingPendingConversationsByGroupUUID;
- (id)_kickedOrRejectedMemberForHandle:(id)a3 conversation:(id)a4;
- (id)_removePendingConversationWithPseudonym:(id)a3;
- (id)_removePendingConversationsWithTemporaryGroupUUIDIfNecessary:(id)a3;
- (id)activatedConversationLinksWithError:(id *)a3;
- (id)activeApprovedConversationWithLink:(id)a3;
- (id)activeConversation;
- (id)activeLocalHandles;
- (id)activeLocalHandlesForProvider;
- (id)callerIDForLocalMember:(id)a3;
- (id)callerIDForLocalMember:(id)a3 forProvider:(id)a4;
- (id)callerIDHandleForSenderIdentityUUID:(id)a3 callerID:(id)a4;
- (id)conversationCreationBlock;
- (id)conversationLinkForGroupUUID:(id)a3;
- (id)conversationLinkForPseudonym:(id)a3;
- (id)conversationRepresentedByRemoteMembers:(id)a3 andLink:(id)a4;
- (id)conversationWithGroupUUID:(id)a3;
- (id)conversationWithGroupUUID:(id)a3 andProvider:(id)a4;
- (id)conversationWithGroupUUID:(id)a3 orMemberIdentifiers:(id)a4 orRemoteMembers:(id)a5 andLink:(id)a6 andVideo:(BOOL)a7;
- (id)conversationWithGroupUUID:(id)a3 orRepresentedByRemoteMembers:(id)a4 andLink:(id)a5;
- (id)conversationsByUUIDIncludingStorageConversations:(BOOL)a3;
- (id)createActivitySession:(id)a3 onConversation:(id)a4 fromHandle:(id)a5;
- (id)createCPActivitySessionForActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (id)createConversationIfNecessaryWithUUID:(id)a3 groupUUID:(id)a4 messagesGroupUUID:(id)a5 locallyCreated:(BOOL)a6 localMember:(id)a7 remoteMembers:(id)a8 pendingMembers:(id)a9 otherInvitedHandles:(id)a10 remotePushTokens:(id)a11 lightweightMembers:(id)a12 link:(id)a13 activity:(id)a14 avMode:(unint64_t)a15 presentationMode:(unint64_t)a16 provider:(id)a17 screenSharingRequest:(id)a18;
- (id)createConversationWithUUID:(id)a3 groupUUID:(id)a4 messagesGroupUUID:(id)a5 locallyCreated:(BOOL)a6 localMember:(id)a7 initiator:(id)a8 remoteMembers:(id)a9 pendingMembers:(id)a10 otherInvitedHandles:(id)a11 remotePushTokens:(id)a12 lightweightMembers:(id)a13 activity:(id)a14 link:(id)a15 report:(id)a16 fromStorage:(BOOL)a17 avMode:(unint64_t)a18 presentationMode:(unint64_t)a19 provider:(id)a20 screenSharingRequest:(id)a21 isInitiator:(BOOL)a22 isOldMessage:(BOOL)a23;
- (id)deletedConversationLinksWithError:(id *)a3;
- (id)findConversationLinkMatchingPseudonym:(id)a3;
- (id)findOrCreateConversationWithGroupUUID:(id)a3 messagesGroupUUID:(id)a4 remoteMembers:(id)a5 otherInvitedHandles:(id)a6 localMember:(id)a7 remotePushTokens:(id)a8 link:(id)a9 activity:(id)a10 avMode:(unint64_t)a11 presentationMode:(unint64_t)a12 conversationProvider:(id)a13 screenSharingRequest:(id)a14;
- (id)getPersonalNicknameBlock;
- (id)groupSessionProviderCreationBlock;
- (id)initiatePendingConversationForLink:(id)a3 localMember:(id)a4 isVideoEnabled:(BOOL)a5;
- (id)isConversationRelayPreferred;
- (id)isHandleEligibleForScreenSharingRequestsBlock;
- (id)localCallerID;
- (id)localCallerIDForProvider;
- (id)localMemberForProvider:(id)a3 fromHandle:(id)a4 members:(id)a5 lightweightMembers:(id)a6 activeLocalHandles:(id)a7;
- (id)lockdownModeEnabled;
- (id)memberExistsForParticipantDestination:(id)a3 groupSessionParticipantUpdate:(id)a4;
- (id)memberExistsForParticipantDestination:(id)a3 members:(id)a4;
- (id)notifyPendingMembershipTrackerOfDelegatedMember;
- (id)pendingConversationUUIDWithPseudonym:(id)a3;
- (id)pendingConversationWithPseudonym:(id)a3;
- (id)pickInitiatorFromActiveParticipants:(id)a3 forUpdate:(id)a4;
- (id)pushTokenForSelf;
- (id)removePendingConversationWithPseudonym:(id)a3;
- (id)sendDataBlock;
- (id)senderIdentitiesBlock;
- (id)senderIdentityUUIDForCallerIDHandle:(id)a3;
- (id)temporaryFilePath;
- (int)presentationStateForConversationWithUUID:(id)a3;
- (void)_displaySharePlayUnableToStartWithMessage:(id)a3;
- (void)_leaveConversation:(id)a3;
- (void)_leaveConversation:(id)a3 withContext:(id)a4;
- (void)_runCallbackIfNecessaryForMessage:(id)a3;
- (void)_sendDelegationMessageTo:(id)a3 conversation:(id)a4 link:(id)a5 transactionUUID:(id)a6 forMember:(id)a7 withMessage:(id)a8;
- (void)_service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7 attemptCount:(unint64_t)a8;
- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4;
- (void)activateLink:(id)a3 completionHandler:(id)a4;
- (void)addAliasesToConversationContainer:(id)a3 forBundleIdentifier:(id)a4;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5;
- (void)addInvitedMemberHandlesFromAddedRemoteMembers:(id)a3 toConversationLink:(id)a4;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)addPseudonym:(id)a3 forCallUUID:(id)a4;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversationWithUUID:(id)a5;
- (void)addRemoteMembers:(id)a3 toConversationWithUUID:(id)a4;
- (void)addScreenSharingType:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)applicationPolicyManager:(id)a3 authorizationChangedForBundleIdentifier:(id)a4;
- (void)approvePendingMember:(id)a3 forConversationUUID:(id)a4;
- (void)beginListeningOnService:(id)a3;
- (void)broadcastImageForSession:(id)a3 onConversation:(id)a4;
- (void)broadcastLightweightEndorsementForAddedMembers:(id)a3 onConversation:(id)a4;
- (void)buzzMember:(id)a3 conversationUUID:(id)a4;
- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversationUUID:(id)a4;
- (void)cancelPreviouslySentScreenShareRequests:(id)a3;
- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4;
- (void)cleanupExpiredPendingConversations;
- (void)conversation:(id)a3 activityChangedOnSession:(id)a4;
- (void)conversation:(id)a3 activitySessionChanged:(id)a4;
- (void)conversation:(id)a3 activitySessionRemoved:(id)a4 userOriginated:(BOOL)a5;
- (void)conversation:(id)a3 addedActiveParticipant:(id)a4;
- (void)conversation:(id)a3 addedMembers:(id)a4 triggeredLocally:(BOOL)a5;
- (void)conversation:(id)a3 appLaunchState:(unint64_t)a4 forActivitySession:(id)a5;
- (void)conversation:(id)a3 changedBytesOfDataUsed:(int64_t)a4;
- (void)conversation:(id)a3 didChangeLocalParticipant:(id)a4 broadcastActivitySession:(BOOL)a5;
- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4;
- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4;
- (void)conversation:(id)a3 failedWithContext:(id)a4;
- (void)conversation:(id)a3 mediaPrioritiesChangedForParticipant:(id)a4;
- (void)conversation:(id)a3 participant:(id)a4 didReact:(id)a5;
- (void)conversation:(id)a3 participantDidStopReacting:(id)a4;
- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4;
- (void)conversation:(id)a3 remoteMembersChanged:(id)a4;
- (void)conversation:(id)a3 removedActiveParticipant:(id)a4 withLeaveReason:(unint64_t)a5;
- (void)conversation:(id)a3 requestBlobRecoveryForParticipantDestination:(id)a4 completion:(id)a5;
- (void)conversation:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6;
- (void)conversation:(id)a3 screenShareAttributesDidChange:(id)a4;
- (void)conversation:(id)a3 screenShareAttributesSelected:(id)a4;
- (void)conversation:(id)a3 screenShareAttributesUpdated:(id)a4;
- (void)conversation:(id)a3 sendDeclineMessageToParticipantDestination:(id)a4;
- (void)conversation:(id)a3 sendResourceAtURL:(id)a4 toParticipants:(id)a5 metadata:(id)a6 activitySessionUUID:(id)a7 completion:(id)a8;
- (void)conversation:(id)a3 updatedActiveParticipant:(id)a4;
- (void)conversation:(id)a3 updatedActiveParticipantWithScreenSharing:(id)a4;
- (void)conversationChanged:(id)a3;
- (void)conversationConnectionDidStart:(id)a3;
- (void)conversationDidLeave:(id)a3;
- (void)conversationDidStopScreenCapture:(id)a3;
- (void)conversationDidTriggerJoin:(id)a3;
- (void)conversationInvalidated:(id)a3;
- (void)createActivitySession:(id)a3 onConversationWithUUID:(id)a4 withCompletion:(id)a5;
- (void)denyScreenShareRequestFrom:(id)a3 screenShareRequest:(id)a4 conversation:(id)a5;
- (void)displaySharePlayUnableToStartAlert;
- (void)endActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)enqueueMessageRetryAttemptForMessageID:(id)a3 message:(id)a4 attemptCount:(unint64_t)a5 messageProcessingBlock:(id)a6;
- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3;
- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7;
- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 successfully:(BOOL)a5;
- (void)generateAllInactiveLinks;
- (void)generateLinkForConversationUUID:(id)a3 completionHandler:(id)a4;
- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5;
- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4;
- (void)getInactiveLinkWithCompletionHandler:(id)a3;
- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3;
- (void)handleConversation:(id)a3 addHighlight:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 participantUpdateMessage:(id)a4 fromNormalizedHandle:(id)a5;
- (void)handleConversation:(id)a3 receivedActivitySession:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 receivedBlobRecoveryRequest:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 receivedBlobRecoveryResponse:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 receivedEndorsementForMember:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 registerMessagesGroupUUIDMessage:(id)a4 fromNormalizedHandle:(id)a5;
- (void)handleConversation:(id)a3 removeActivitySession:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 removeHighlight:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 screenShareRequest:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 screenShareResponse:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 updateActivity:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 updateActivityImage:(id)a4 fromHandle:(id)a5;
- (void)handleConversation:(id)a3 updateGuestMode:(id)a4 fromHandle:(id)a5;
- (void)handleConversationHandoffRecommendationChangedNotification:(id)a3;
- (void)handleConversationHandoffRouteIdentifierChangedNotification:(id)a3;
- (void)handleDelegatedPendingMemberIfNecessary:(id)a3 conversation:(id)a4 groupUUID:(id)a5 fromHandle:(id)a6 transactionUUID:(id)a7;
- (void)handleEncryptedLetMeInRequest:(id)a3 fromHandle:(id)a4 context:(id)a5;
- (void)handleEncryptedLetMeInResponse:(id)a3 fromHandle:(id)a4 context:(id)a5;
- (void)handleEncryptedMessageWithin:(id)a3 fromHandle:(id)a4 context:(id)a5;
- (void)handleParticipantWithIdentifier:(unint64_t)a3 leftConversationWithGroupUUID:(id)a4 fromHandle:(id)a5 withGroupSessionUpdate:(id)a6;
- (void)handleParticipants:(id)a3 joinedConversationWithUpdate:(id)a4 joinContext:(id)a5 fromHandle:(id)a6 isFromPendingMessage:(BOOL)a7;
- (void)handleReceivedLMIDelegateMessage:(id)a3 fromHandle:(id)a4;
- (void)handleReceivedLetMeInRequest:(id)a3 toPseudonym:(id)a4 fromHandle:(id)a5 responseKeyData:(id)a6 dateInitiated:(id)a7;
- (void)handleReceivedLetMeInResponse:(id)a3 pendingConversation:(id)a4 fromHandle:(id)a5;
- (void)handleReceivedLinkCreatedOrChangedMessage:(id)a3 fromHandle:(id)a4;
- (void)handleReceivedLinkInvalidatedMessage:(id)a3 fromHandle:(id)a4;
- (void)handleReceivedUpdateJoinedMetadataMessage:(id)a3 fromHandle:(id)a4;
- (void)handleRemovedLinkDescriptors:(id)a3;
- (void)includeMetricsReport:(id)a3 onConversationWithUUID:(id)a4;
- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5;
- (void)joinConversationWithRequest:(id)a3;
- (void)joinExistingConversationWithUUID:(id)a3 context:(id)a4;
- (void)kickMember:(id)a3 conversationUUID:(id)a4;
- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6;
- (void)leaveActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)leaveAllConversations;
- (void)leaveConversationWithUUID:(id)a3;
- (void)leaveConversationWithUUID:(id)a3 withContext:(id)a4;
- (void)linkManager:(id)a3 removedLinkDescriptorsFromIDSSignal:(id)a4;
- (void)linkManager:(id)a3 removedLinkDescriptorsFromValidityCheck:(id)a4;
- (void)linkManager:(id)a3 updatedLinkDescriptorsFromIDSSignal:(id)a4;
- (void)linkManager:(id)a3 updatedLinkDescriptorsFromSync:(id)a4;
- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4;
- (void)maybeAddComplementaryAssociationVoucherFor:(id)a3 toLocalMemberOf:(id)a4 completion:(id)a5;
- (void)noticeManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6;
- (void)notifyDelegatesOfAVModeChanged:(unint64_t)a3 toAVMode:(unint64_t)a4 forConversation:(id)a5;
- (void)notifyDelegatesOfChangedLink:(id)a3 conversation:(id)a4;
- (void)notifyDelegatesOfChangedLinkDescriptors:(id)a3;
- (void)notifyDelegatesOfInvalidLinkForPendingConversation:(id)a3;
- (void)notifyDelegatesOfLetMeInRejectedForPendingConversation:(id)a3;
- (void)notifyDelegatesOfMessage:(id)a3 fromHandle:(id)a4 forConversation:(id)a5 withUpdate:(id)a6;
- (void)notifyDelegatesOfNewConversation:(id)a3 fromHandle:(id)a4;
- (void)notifyDelegatesOfRemoteScreenShareAttributes:(id)a3 isLocallySharing:(BOOL)a4;
- (void)notifyDelegatesOfRemoteScreenShareEndedWithReason:(id)a3;
- (void)notifyDelegatesOfRemovedConversationWithUUID:(id)a3;
- (void)notifyDelegatesOfTrackedPendingMember:(id)a3 forConversationLink:(id)a4;
- (void)notifyDelegatesOfUpdatePendingConversations;
- (void)pendingMembershipTracker:(id)a3 didTrack:(id)a4 forGroupUUID:(id)a5;
- (void)pendingMembershipTracker:(id)a3 willAdd:(id)a4 to:(id)a5 using:(id)a6;
- (void)pendingMembershipTracker:(id)a3 willNotAdd:(id)a4 to:(id)a5 using:(id)a6;
- (void)postEndEventForSession:(id)a3 originator:(id)a4 conversation:(id)a5;
- (void)postSessionStartedForSession:(id)a3 originator:(id)a4 conversation:(id)a5;
- (void)prepareAdditionOfActiveParticipant:(id)a3 toInvitedMembersForLinkOnConversation:(id)a4;
- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4;
- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3 onConversationWithUUID:(id)a4;
- (void)processGroupSessionParticipantUpdate:(id)a3 context:(id)a4;
- (void)processJoinUpdate:(id)a3 fromHandle:(id)a4 senderCorrelationIdentifier:(id)a5 isFromPendingMessage:(BOOL)a6;
- (void)processParticipantDataUpdate:(id)a3 fromHandle:(id)a4;
- (void)processProxiedGroupUpdate:(id)a3;
- (void)processProxiedMessage:(id)a3 fromID:(id)a4 context:(id)a5;
- (void)processProxiedResource:(id)a3 metadata:(id)a4 fromID:(id)a5 context:(id)a6;
- (void)processUpdateMembersUpdate:(id)a3 fromHandle:(id)a4;
- (void)processUpdatedNickname:(id)a3 forHandle:(id)a4 conversationUUID:(id)a5;
- (void)recoverLinksForPseudonyms:(id)a3;
- (void)refreshActiveParticipantsList;
- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3;
- (void)rejectPendingMember:(id)a3 forConversationUUID:(id)a4;
- (void)removeAllConversations;
- (void)removeAllPendingConversations;
- (void)removeConversationNoticeWithUUID:(id)a3;
- (void)removeConversationWithUUID:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeLink:(id)a3 reason:(int64_t)a4;
- (void)removeLink:(id)a3 reason:(int64_t)a4 withConversation:(id)a5;
- (void)removeNonIndefiniteLinks;
- (void)removePendingMemberMatchingActiveParticipant:(id)a3 conversation:(id)a4;
- (void)removePseudonym:(id)a3 forCallUUID:(id)a4;
- (void)removeRemoteMembers:(id)a3 fromConversationWithUUID:(id)a4;
- (void)removeScreenShareRequestFromParticipant:(id)a3 conversation:(id)a4 screenShareContext:(id)a5;
- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6;
- (void)renewLinkIfNeeded:(id)a3 completionHandler:(id)a4;
- (void)requestActivityAuthorizationForApplicationWithBundleIdentifier:(id)a3 overrides:(id)a4 completionHandler:(id)a5;
- (void)requestLetMeInApprovalForPseudonym:(id)a3;
- (void)requestParticipant:(id)a3 toCancelScreenShareRequest:(id)a4 conversation:(id)a5;
- (void)requestParticipant:(id)a3 toScreenShareWithRequest:(id)a4 conversation:(id)a5;
- (void)requestParticipantToShareScreen:(id)a3 forConversationUUID:(id)a4;
- (void)resetActivitySessionSceneAssociationsForBundleID:(id)a3;
- (void)retreiveActiveConversations;
- (void)revokeBackgroundPipAuthorizationsForBundleID:(id)a3;
- (void)sanitizeAndProcessParticipantUpdate:(id)a3 context:(id)a4;
- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3;
- (void)screenSharingActivityManager:(id)a3 invalidatedSessionWithReason:(id)a4 wasLocallySharing:(BOOL)a5;
- (void)screenSharingActivityManager:(id)a3 receivedUpdatedRemoteAttributes:(id)a4 isLocallySharing:(BOOL)a5;
- (void)sendDataForScreenShareMessage:(id)a3 toParticipant:(id)a4 conversation:(id)a5;
- (void)sendDelegationMessageTo:(id)a3 conversation:(id)a4 link:(id)a5 transactionUUID:(id)a6 forMember:(id)a7;
- (void)sendDelegationResponseMessageTo:(id)a3 conversation:(id)a4 transactionUUID:(id)a5 forMember:(id)a6 withResponse:(BOOL)a7;
- (void)sendInvitationMessageToMember:(id)a3 forConversation:(id)a4 includeAllAttributes:(BOOL)a5 invitationPreferences:(id)a6 additionalOptions:(id)a7;
- (void)sendLetMeInResponseToPendingMember:(id)a3 forConversation:(id)a4 usingResponseKeyData:(id)a5 approved:(BOOL)a6 callback:(id)a7;
- (void)sendMessage:(id)a3 forConversation:(id)a4 withActivitySession:(id)a5;
- (void)sendMessage:(id)a3 forConversation:(id)a4 withActivitySession:(id)a5 additionalOptions:(id)a6;
- (void)sendVideoUpgradeMessageforConversationWithUUID:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantDataUpdate:(id)a5;
- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5 context:(id)a6;
- (void)setActiveLocalHandles:(id)a3;
- (void)setActiveLocalHandlesForProvider:(id)a3;
- (void)setActivityAuthorization:(BOOL)a3 forBundleID:(id)a4;
- (void)setActivityAuthorizationManager:(id)a3;
- (void)setAudioInjectionAllowed:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setAudioPaused:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setAutoSharePlayEnabled:(BOOL)a3;
- (void)setCallProviderManager:(id)a3;
- (void)setConversationCreationBlock:(id)a3;
- (void)setConversationLink:(id)a3 forConversation:(id)a4 replyToCompletionHandler:(id)a5;
- (void)setConversationProviderManager:(id)a3;
- (void)setDelegateToQueue:(id)a3;
- (void)setDeviceSupport:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsOnConversationWithUUID:(id)a4;
- (void)setFeatureFlags:(id)a3;
- (void)setFileTransferController:(id)a3;
- (void)setGetPersonalNicknameBlock:(id)a3;
- (void)setGridDisplayMode:(unint64_t)a3 forConversationWithUUID:(id)a4;
- (void)setGroupSessionProviderCreationBlock:(id)a3;
- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversationUUID:(id)a4;
- (void)setImageTranscoder:(id)a3;
- (void)setIncomingPendingMessageGUIDs:(id)a3;
- (void)setInvitationResolver:(id)a3;
- (void)setIsConversationRelayPreferred:(id)a3;
- (void)setIsHandleEligibleForScreenSharingRequestsBlock:(id)a3;
- (void)setLinkManager:(id)a3;
- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5;
- (void)setLocalCallerID:(id)a3;
- (void)setLocalCallerIDForProvider:(id)a3;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4 presentationMode:(unint64_t)a5;
- (void)setLockdownModeEnabled:(id)a3;
- (void)setMessageProxy:(id)a3;
- (void)setMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4;
- (void)setNotifyPendingMembershipTrackerOfDelegatedMember:(id)a3;
- (void)setObserverToQueue:(id)a3;
- (void)setOutIdentifierToConversationInfo:(id)a3;
- (void)setParticipantUpdateSanitizer:(id)a3;
- (void)setPendingConversationCleanupTimer:(id)a3;
- (void)setPendingMembershipTracker:(id)a3;
- (void)setPresentationRect:(CGRect)a3 forConversationWithUUID:(id)a4;
- (void)setPresentationState:(int)a3 forConversationWithUUID:(id)a4;
- (void)setRelaying:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setResourceTransferCallbacks:(id)a3;
- (void)setScreenEnabled:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setScreenEnabled:(BOOL)a3 screenShareAttributes:(id)a4 forConversationWithUUID:(id)a5;
- (void)setScreenShareAttributes:(id)a3 forConversationWithUUID:(id)a4;
- (void)setScreening:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setSendDataBlock:(id)a3;
- (void)setSenderIdentitiesBlock:(id)a3;
- (void)setServerBag:(id)a3;
- (void)setService:(id)a3;
- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4;
- (void)setSharePlaySystemStateObserver:(id)a3;
- (void)setSplitSessionUserProfileState:(int64_t)a3 forConversationWithUUID:(id)a4;
- (void)setUplinkMuted:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setUplinkMuted:(BOOL)a3 forPendingConversationWithUUID:(id)a4;
- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5;
- (void)setVideo:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setVideoEnabled:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setVideoEnabled:(BOOL)a3 forPendingConversationWithUUID:(id)a4;
- (void)setVideoPaused:(BOOL)a3 forConversationWithUUID:(id)a4;
- (void)setVoucherManager:(id)a3;
- (void)setupPendingConversationCleanupTimer;
- (void)startAudioForConversationWithUUID:(id)a3;
- (void)systemStateObserver:(id)a3 screenSharingAllowedStateChanged:(BOOL)a4;
- (void)systemStateObserver:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4;
- (void)updateConversationHandoffEligibility:(id)a3;
- (void)updateLetMeInRequestState:(int64_t)a3 addLink:(id)a4 forConversationWithUUID:(id)a5;
- (void)updateLocalMemberNickname:(id)a3 conversationUUID:(id)a4;
- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)updateMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4;
- (void)updateMessagesGroupPhotoOnConversationWithUUID:(id)a3;
- (void)updateParticipantPresentationContexts:(id)a3 onConversationWithUUID:(id)a4;
@end

@implementation CSDConversationManager

- (CSDConversationManager)initWithReportingController:(id)a3 cpApplicationController:(id)a4 invitationResolver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.conversationmanager", 0LL);
  v12 = -[CSDConversationPersistenceController initWithQueue:]( objc_alloc(&OBJC_CLASS___CSDConversationPersistenceController),  "initWithQueue:",  v11);
  v13 = objc_alloc_init(&OBJC_CLASS___CSDConversationLinkManager);
  v14 = objc_alloc_init(&OBJC_CLASS___CSDPendingMembershipTracker);
  v15 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  v16 = -[CSDConversationManager initWithQueue:reportingController:persistenceController:linkManager:cpApplicationController:invitationResolver:pendingMembershipTracker:featureFlags:applicationPolicyManager:]( self,  "initWithQueue:reportingController:persistenceController:linkManager:cpApplicationController:invitationResolver :pendingMembershipTracker:featureFlags:applicationPolicyManager:",  v11,  v10,  v12,  v13,  v9,  v8,  v14,  v15,  0LL);

  return v16;
}

- (CSDConversationManager)init
{
  return 0LL;
}

- (CSDConversationManager)initWithQueue:(id)a3 reportingController:(id)a4 persistenceController:(id)a5 linkManager:(id)a6 invitationResolver:(id)a7 pendingMembershipTracker:(id)a8 featureFlags:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  else {
    v23 = 0LL;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[CPApplicationPolicyManager sharedInstance]( &OBJC_CLASS___CPApplicationPolicyManager,  "sharedInstance"));
  v25 = -[CSDConversationManager initWithQueue:reportingController:persistenceController:linkManager:cpApplicationController:invitationResolver:pendingMembershipTracker:featureFlags:applicationPolicyManager:]( self,  "initWithQueue:reportingController:persistenceController:linkManager:cpApplicationController:invitationResolver :pendingMembershipTracker:featureFlags:applicationPolicyManager:",  v22,  v21,  v20,  v19,  v23,  v18,  v17,  v16,  v24);

  return v25;
}

- (CSDConversationManager)initWithQueue:(id)a3 reportingController:(id)a4 persistenceController:(id)a5 linkManager:(id)a6 cpApplicationController:(id)a7 invitationResolver:(id)a8 pendingMembershipTracker:(id)a9 featureFlags:(id)a10 applicationPolicyManager:(id)a11
{
  id v106 = a3;
  id v107 = a4;
  id v108 = a5;
  id v109 = a6;
  id v110 = a7;
  id v111 = a8;
  id v112 = a9;
  id v113 = a10;
  id v115 = a11;
  v139.receiver = self;
  v139.super_class = (Class)&OBJC_CLASS___CSDConversationManager;
  id v18 = -[CSDConversationManager init](&v139, "init");
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_reportingController, a4);
    objc_storeStrong((id *)&v19->_linkManager, a6);
    -[CSDConversationLinkManager setDelegate:](v19->_linkManager, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_featureFlags, a10);
    objc_storeStrong((id *)&v19->_invitationResolver, a8);
    objc_storeStrong((id *)&v19->_pendingMembershipTracker, a9);
    -[CSDPendingMembershipTracker setMessenger:](v19->_pendingMembershipTracker, "setMessenger:", v19);
    -[CSDPendingMembershipTracker setDelegate:](v19->_pendingMembershipTracker, "setDelegate:", v19);
    id v20 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
    serverBag = v19->_serverBag;
    v19->_serverBag = v20;

    id v22 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
    callProviderManager = v19->_callProviderManager;
    v19->_callProviderManager = v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mutableConversationsByUUID = v19->_mutableConversationsByUUID;
    v19->_mutableConversationsByUUID = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mutablePendingConversationsByPseudonym = v19->_mutablePendingConversationsByPseudonym;
    v19->_mutablePendingConversationsByPseudonym = (NSMutableDictionary *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mutablePseudonymsByCallUUID = v19->_mutablePseudonymsByCallUUID;
    v19->_mutablePseudonymsByCallUUID = (NSMutableDictionary *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mutablePseudonymsByRequestIdentifiers = v19->_mutablePseudonymsByRequestIdentifiers;
    v19->_mutablePseudonymsByRequestIdentifiers = (NSMutableDictionary *)v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mutableSendDataCallbacksByRequestIdentifiers = v19->_mutableSendDataCallbacksByRequestIdentifiers;
    v19->_mutableSendDataCallbacksByRequestIdentifiers = (NSMutableDictionary *)v32;

    uint64_t v34 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
    delegateToQueue = v19->_delegateToQueue;
    v19->_delegateToQueue = (NSMapTable *)v34;

    uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mutableConversationsRequestingUpgradeWithPreferences = v19->_mutableConversationsRequestingUpgradeWithPreferences;
    v19->_mutableConversationsRequestingUpgradeWithPreferences = (NSMutableDictionary *)v36;

    uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    screenCaptureQueue = v19->_screenCaptureQueue;
    v19->_screenCaptureQueue = (NSMutableDictionary *)v38;

    uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    outIdentifierToConversationInfo = v19->_outIdentifierToConversationInfo;
    v19->_outIdentifierToConversationInfo = (NSMutableDictionary *)v40;

    v42 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    incomingPendingMessageGUIDs = v19->_incomingPendingMessageGUIDs;
    v19->_incomingPendingMessageGUIDs = v42;

    v44 = -[CSDConversationNoticeManager initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___CSDConversationNoticeManager),  "initWithDelegate:queue:",  v19,  v19->_queue);
    conversationNoticeManger = v19->_conversationNoticeManger;
    v19->_conversationNoticeManger = v44;

    uint64_t v46 = objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
    conversationProviderManager = v19->_conversationProviderManager;
    v19->_conversationProviderManager = (CSDConversationProviderManager *)v46;

    id lockdownModeEnabled = v19->_lockdownModeEnabled;
    v19->_id lockdownModeEnabled = &stru_1003D9858;

    id isConversationRelayPreferred = v19->_isConversationRelayPreferred;
    v19->_id isConversationRelayPreferred = &stru_1003D9878;

    int v50 = TUSimulatedModeEnabled();
    v51 = &off_1003D5E18;
    if (!v50) {
      v51 = off_1003D5DA0;
    }
    uint64_t v52 = objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v51, "sharedInstance"));
    service = v19->_service;
    v19->_service = (CSDIDSService *)v52;

    id v54 = sub_1001704C4();
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = v19->_service;
      *(_DWORD *)buf = 138412290;
      v141 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Initializing CSDConversationManager for service: %@",  buf,  0xCu);
    }

    v57 = objc_alloc(&OBJC_CLASS___CSDVoucherManagerImpl);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSService service](v19->_service, "service"));
    v59 = -[CSDVoucherManagerImpl initWithIdsService:](v57, "initWithIdsService:", v58);
    voucherManager = v19->_voucherManager;
    v19->_voucherManager = (CSDVoucherManager *)v59;

    v61 = -[CSDParticipantUpdateSanitizerImpl initWithVoucherManager:]( objc_alloc(&OBJC_CLASS___CSDParticipantUpdateSanitizerImpl),  "initWithVoucherManager:",  v19->_voucherManager);
    participantUpdateSanitizer = v19->_participantUpdateSanitizer;
    v19->_participantUpdateSanitizer = (CSDParticipantUpdateSanitizer *)v61;

    if (v115) {
      id v114 = v115;
    }
    else {
      id v114 = (id)objc_claimAutoreleasedReturnValue( +[CPApplicationPolicyManager sharedInstance]( &OBJC_CLASS___CPApplicationPolicyManager,  "sharedInstance"));
    }
    uint64_t v63 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
    observerToQueue = v19->_observerToQueue;
    v19->_observerToQueue = (NSMapTable *)v63;

    objc_storeStrong((id *)&v19->_cpApplicationController, a7);
    v65 = -[CPSystemStateObserver initWithQueue:]( objc_alloc(&OBJC_CLASS___CPSystemStateObserver),  "initWithQueue:",  v19->_queue);
    sharePlaySystemStateObserver = v19->_sharePlaySystemStateObserver;
    v19->_sharePlaySystemStateObserver = v65;

    -[CPSystemStateObserver addObserver:withQueue:]( v19->_sharePlaySystemStateObserver,  "addObserver:withQueue:",  v19,  v19->_queue);
    v67 = -[CPActivityAuthorizationManager initWithDataSource:queue:appPolicyManager:]( objc_alloc(&OBJC_CLASS___CPActivityAuthorizationManager),  "initWithDataSource:queue:appPolicyManager:",  v19,  v19->_queue,  v114);
    activityAuthorizationManager = v19->_activityAuthorizationManager;
    v19->_activityAuthorizationManager = v67;

    v69 = -[CSDScreenSharingActivityManager initWithFeatureFlags:]( objc_alloc(&OBJC_CLASS___CSDScreenSharingActivityManager),  "initWithFeatureFlags:",  v19->_featureFlags);
    screenSharingActivityManager = v19->_screenSharingActivityManager;
    v19->_screenSharingActivityManager = v69;

    -[CSDScreenSharingActivityManager setDelegate:](v19->_screenSharingActivityManager, "setDelegate:", v19);
    [v114 addDelegate:v19 withQueue:v19->_queue];
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](v19, "featureFlags"));
    unsigned int v72 = [v71 sharePlayInFaceTimeCanvasEnabled];

    if (v72)
    {
      v73 = -[CSDFileTransferController initWithService:]( objc_alloc(&OBJC_CLASS___CSDFileTransferController),  "initWithService:",  v19->_service);
      fileTransferController = v19->_fileTransferController;
      v19->_fileTransferController = v73;

      -[CSDFileTransferController setDelegate:](v19->_fileTransferController, "setDelegate:", v19);
    }

    uint64_t v75 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    resourceTransferCallbacks = v19->_resourceTransferCallbacks;
    v19->_resourceTransferCallbacks = (NSMutableDictionary *)v75;

    v77 = objc_alloc_init(&OBJC_CLASS___CSDSecureImageTranscoder);
    imageTranscoder = v19->_imageTranscoder;
    v19->_imageTranscoder = v77;

    objc_initWeak((id *)buf, v19);
    queue = (dispatch_queue_s *)v19->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D0298;
    block[3] = &unk_1003D98A0;
    v80 = v19;
    v137 = v80;
    objc_copyWeak(&v138, (id *)buf);
    dispatch_sync(queue, block);
    objc_storeStrong((id *)&v80->_persistenceController, a5);
    v134[0] = _NSConcreteStackBlock;
    v134[1] = 3221225472LL;
    v134[2] = sub_1000D0474;
    v134[3] = &unk_1003D98C8;
    objc_copyWeak(&v135, (id *)buf);
    v81 = objc_retainBlock(v134);
    id groupSessionProviderCreationBlock = v80->_groupSessionProviderCreationBlock;
    v80->_id groupSessionProviderCreationBlock = v81;

    id getPersonalNicknameBlock = v80->_getPersonalNicknameBlock;
    v80->_id getPersonalNicknameBlock = &stru_1003D9908;

    v132[0] = _NSConcreteStackBlock;
    v132[1] = 3221225472LL;
    v132[2] = sub_1000D05E0;
    v132[3] = &unk_1003D9930;
    objc_copyWeak(&v133, (id *)buf);
    v84 = objc_retainBlock(v132);
    id conversationCreationBlock = v80->_conversationCreationBlock;
    v80->_id conversationCreationBlock = v84;

    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472LL;
    v130[2] = sub_1000D0890;
    v130[3] = &unk_1003D9958;
    objc_copyWeak(&v131, (id *)buf);
    v86 = objc_retainBlock(v130);
    id sendDataBlock = v80->_sendDataBlock;
    v80->_id sendDataBlock = v86;

    v128[0] = _NSConcreteStackBlock;
    v128[1] = 3221225472LL;
    v128[2] = sub_1000D0E9C;
    v128[3] = &unk_1003D9980;
    objc_copyWeak(&v129, (id *)buf);
    v88 = objc_retainBlock(v128);
    id notifyPendingMembershipTrackerOfDelegatedMember = v80->_notifyPendingMembershipTrackerOfDelegatedMember;
    v80->_id notifyPendingMembershipTrackerOfDelegatedMember = v88;

    v126[0] = _NSConcreteStackBlock;
    v126[1] = 3221225472LL;
    v126[2] = sub_1000D0F5C;
    v126[3] = &unk_1003D99A8;
    objc_copyWeak(&v127, (id *)buf);
    v90 = objc_retainBlock(v126);
    id activeLocalHandlesForProvider = v80->_activeLocalHandlesForProvider;
    v80->_id activeLocalHandlesForProvider = v90;

    v124[0] = _NSConcreteStackBlock;
    v124[1] = 3221225472LL;
    v124[2] = sub_1000D1184;
    v124[3] = &unk_1003D99D0;
    objc_copyWeak(&v125, (id *)buf);
    v92 = objc_retainBlock(v124);
    id activeLocalHandles = v80->_activeLocalHandles;
    v80->_id activeLocalHandles = v92;

    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472LL;
    v122[2] = sub_1000D11FC;
    v122[3] = &unk_1003D99F8;
    objc_copyWeak(&v123, (id *)buf);
    v94 = objc_retainBlock(v122);
    id localCallerID = v80->_localCallerID;
    v80->_id localCallerID = v94;

    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472LL;
    v120[2] = sub_1000D12B0;
    v120[3] = &unk_1003D9A20;
    objc_copyWeak(&v121, (id *)buf);
    v96 = objc_retainBlock(v120);
    id senderIdentitiesBlock = v80->_senderIdentitiesBlock;
    v80->_id senderIdentitiesBlock = v96;

    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472LL;
    v118[2] = sub_1000D1310;
    v118[3] = &unk_1003D9A48;
    objc_copyWeak(&v119, (id *)buf);
    v98 = objc_retainBlock(v118);
    id localCallerIDForProvider = v80->_localCallerIDForProvider;
    v80->_id localCallerIDForProvider = v98;

    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472LL;
    v116[2] = sub_1000D1544;
    v116[3] = &unk_1003D9A70;
    objc_copyWeak(&v117, (id *)buf);
    v100 = objc_retainBlock(v116);
    id isHandleEligibleForScreenSharingRequestsBlock = v80->_isHandleEligibleForScreenSharingRequestsBlock;
    v80->_id isHandleEligibleForScreenSharingRequestsBlock = v100;

    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v102 addObserver:v80 selector:"handleConversationHandoffRecommendationChangedNotification:" name:@"CSDUserActivityConversationHandoffRecommendationChangedNotification" object:0];

    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v104 = (void *)objc_claimAutoreleasedReturnValue( +[CSDHandoffAudioController routeIdentifierChangedNotification]( &OBJC_CLASS___CSDHandoffAudioController,  "routeIdentifierChangedNotification"));
    [v103 addObserver:v80 selector:"handleConversationHandoffRouteIdentifierChangedNotification:" name:v104 object:0];

    objc_destroyWeak(&v117);
    objc_destroyWeak(&v119);
    objc_destroyWeak(&v121);
    objc_destroyWeak(&v123);
    objc_destroyWeak(&v125);
    objc_destroyWeak(&v127);
    objc_destroyWeak(&v129);
    objc_destroyWeak(&v131);
    objc_destroyWeak(&v133);
    objc_destroyWeak(&v135);
    objc_destroyWeak(&v138);

    objc_destroyWeak((id *)buf);
  }

  return v19;
}

- (BOOL)_shouldNotifyDelegatesOfMessage:(id)a3 localHandleAdded:(BOOL)a4 isFromStorage:(BOOL)a5
{
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    else {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  else {
    BOOL v10 = v9;
  }

  return v10;
}

- (BOOL)_shouldRingForIncomingCallWithHandle:(id)a3 conversation:(id)a4 isFromPendingMessage:(BOOL)a5 isOldMessage:(BOOL)a6 isLetMeInApproved:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 provider]);
  unsigned int v14 = -[CSDConversationManager isValidLocalHandle:forProvider:](self, "isValidLocalHandle:forProvider:", v12, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager invitationResolver](self, "invitationResolver"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 tuConversation]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 localMember]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 handle]);
  unsigned int v19 = [v15 shouldShowInvitationRingingUIForConversation:v16 handle:v18];

  if ((v14 & 1) != 0 || !v19)
  {
    id v21 = sub_1001704C4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = @"NO";
      if (v14) {
        uint64_t v24 = @"YES";
      }
      else {
        uint64_t v24 = @"NO";
      }
      if (v19) {
        v23 = @"YES";
      }
      int v33 = 138412546;
      uint64_t v34 = v24;
      __int16 v35 = 2112;
      uint64_t v36 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "isValidLocalHandle: %@, shouldShowInvitationRingingUIForConversation: %@",  (uint8_t *)&v33,  0x16u);
    }

    LOBYTE(v20) = 0;
  }

  else
  {
    int v20 = !v8;
    if (v7 && !v8)
    {
      if ([v11 isOneToOneModeEnabled])
      {
        int v20 = 0;
      }

      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v11 activeParticipantDestinationsByIdentifier]);
        int v20 = [v25 count] != 0;
      }
    }

    id v26 = sub_1001704C4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v27 = @"NO";
      if (v20) {
        uint64_t v28 = @"YES";
      }
      else {
        uint64_t v28 = @"NO";
      }
      if (v8) {
        v29 = @"YES";
      }
      else {
        v29 = @"NO";
      }
      if (v7) {
        uint64_t v30 = @"YES";
      }
      else {
        uint64_t v30 = @"NO";
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue([v11 activeParticipantDestinationsByIdentifier]);
      int v33 = 138413314;
      uint64_t v34 = v28;
      __int16 v35 = 2112;
      uint64_t v36 = v29;
      __int16 v37 = 2112;
      uint64_t v38 = v30;
      __int16 v39 = 2112;
      uint64_t v40 = v27;
      __int16 v41 = 2048;
      id v42 = [v31 count];
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "shouldRingForIncomingCall: %@, isFromPendingMessage: %@, isOldMessage: %@, isOneToOneModeEnabled: %@, activePart icipantDestinationsByIdentifier.count: %ld",  (uint8_t *)&v33,  0x34u);
    }
  }

  return v20;
}

- (id)_kickedOrRejectedMemberForHandle:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v7 kickedMembers]);
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
LABEL_3:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v35 != v12) {
        objc_enumerationMutation(v9);
      }
      unsigned int v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
      unsigned int v16 = [v15 isEquivalentToHandle:v6];

      if (v16) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v24 = sub_1001704C4();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 kickedMembers]);
    *(_DWORD *)buf = 138412546;
    id v40 = v6;
    __int16 v41 = 2112;
    id v42 = v26;
    v27 = "handle %@ has already been kicked, conversation.kickedMembers: %@";
  }

  else
  {
LABEL_9:

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rejectedMembers", 0));
    id v17 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (!v17)
    {
LABEL_17:
      id v23 = 0LL;
      goto LABEL_24;
    }

    id v18 = v17;
    uint64_t v19 = *(void *)v31;
LABEL_11:
    uint64_t v20 = 0LL;
    while (1)
    {
      if (*(void *)v31 != v19) {
        objc_enumerationMutation(v9);
      }
      unsigned int v14 = *(void **)(*((void *)&v30 + 1) + 8 * v20);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
      unsigned int v22 = [v21 isEquivalentToHandle:v6];

      if (v22) {
        break;
      }
      if (v18 == (id)++v20)
      {
        id v18 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v18) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }

    id v28 = sub_1001704C4();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 rejectedMembers]);
    *(_DWORD *)buf = 138412546;
    id v40 = v6;
    __int16 v41 = 2112;
    id v42 = v26;
    v27 = "handle %@ has already been rejected, conversation.rejectedMembers: %@";
  }

  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);

LABEL_23:
  id v23 = v14;
LABEL_24:

  return v23;
}

- (BOOL)_isActiveRemoteMemberForHandle:(id)a3 conversation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteMembers]);
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    uint64_t v23 = *(void *)v30;
    id v24 = v6;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)i), "handle", v23));
        unsigned int v13 = [v12 isEquivalentToHandle:v5];

        if (v13)
        {
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 activeRemoteParticipants]);
          id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v26;
            while (2)
            {
              for (j = 0LL; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v26 != v17) {
                  objc_enumerationMutation(v14);
                }
                unsigned __int8 v20 = [v19 isEquivalentToHandle:v5];

                if ((v20 & 1) != 0)
                {

                  BOOL v21 = 1;
                  id v6 = v24;
                  goto LABEL_21;
                }
              }

              id v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          uint64_t v10 = v23;
          id v6 = v24;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      BOOL v21 = 0;
    }

    while (v9);
  }

  else
  {
    BOOL v21 = 0;
  }

- (id)_inactiveRemoteMemberForHandle:(id)a3 conversation:(id)a4
{
  id v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "remoteMembers", 0));
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
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handle]);
        unsigned __int8 v12 = [v11 isEquivalentToHandle:v5];

        if ((v12 & 1) != 0)
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

- (BOOL)_shouldSkipManualApprovalForHandle:(id)a3 conversation:(id)a4 responseKeyData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager _kickedOrRejectedMemberForHandle:conversation:]( self,  "_kickedOrRejectedMemberForHandle:conversation:",  v8,  v9));
  if (v12)
  {
    id v13 = sub_1001704C4();
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Let me in requestor %@ is a handle that has already been kicked/rejected",  buf,  0xCu);
    }

    -[CSDConversationManager sendLetMeInResponseToPendingMember:forConversation:usingResponseKeyData:approved:callback:]( self,  "sendLetMeInResponseToPendingMember:forConversation:usingResponseKeyData:approved:callback:",  v12,  v9,  v10,  0LL,  0LL);
LABEL_9:
    BOOL v18 = 1;
    goto LABEL_10;
  }

  if (-[CSDConversationManager _isActiveRemoteMemberForHandle:conversation:]( self,  "_isActiveRemoteMemberForHandle:conversation:",  v8,  v9))
  {
    id v15 = sub_1001704C4();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteMembers]);
      *(_DWORD *)buf = 138412546;
      id v29 = v8;
      __int16 v30 = 2112;
      __int128 v31 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Let me in requestor %@ is active in the session. Ignore Let Me In Request,  conversation.remoteMembers: %@",  buf,  0x16u);
    }

    goto LABEL_9;
  }

  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager _inactiveRemoteMemberForHandle:conversation:]( self,  "_inactiveRemoteMemberForHandle:conversation:",  v8,  v9));
  BOOL v18 = v20 != 0LL;
  if (v20)
  {
    id v21 = sub_1001704C4();
    unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteMembers]);
      *(_DWORD *)buf = 138412546;
      id v29 = v8;
      __int16 v30 = 2112;
      __int128 v31 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Let me in requestor %@ is a handle that is already a member of the call; Let Me In not required, conversation.remoteMembers: %@",
        buf,
        0x16u);
    }

    objc_initWeak((id *)buf, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000D23B4;
    v24[3] = &unk_1003D8220;
    objc_copyWeak(&v27, (id *)buf);
    id v25 = v20;
    id v26 = v9;
    -[CSDConversationManager sendLetMeInResponseToPendingMember:forConversation:usingResponseKeyData:approved:callback:]( self,  "sendLetMeInResponseToPendingMember:forConversation:usingResponseKeyData:approved:callback:",  v25,  v26,  v10,  1LL,  v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }

LABEL_10:
  return v18;
}

- (BOOL)shouldIgnoreMessageForConversation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (![v4 state])
    {
      int v6 = (*((uint64_t (**)(void))self->_isConversationRelayPreferred + 2))();
      id v7 = sub_1001704C4();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v9)
        {
          LOWORD(v22) = 0;
          id v10 = "shouldIgnoreMessageForConversation: Ignore the message, will process messages through relay path";
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 2u);
          goto LABEL_10;
        }

        goto LABEL_10;
      }

      if (v9)
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSDCallCapabilities sharedInstance](&OBJC_CLASS___CSDCallCapabilities, "sharedInstance"));
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v17 callCapabilitiesState]);
        int v22 = 67109120;
        LODWORD(v23) = [v18 relayCallingAvailability];
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "shouldIgnoreMessageForConversation: Still process the message: %d",  (uint8_t *)&v22,  8u);
      }
    }

    id v19 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v5 state];
      int v22 = 134217984;
      id v23 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "shouldIgnoreMessageForConversation, state: %ld",  (uint8_t *)&v22,  0xCu);
    }

- (BOOL)isValidLocalHandle:(id)a3 forProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager activeLocalHandles](self, "activeLocalHandles"));
  uint64_t v9 = v8[2]();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = -[CSDConversationManager isValidLocalHandle:activeLocalHandles:provider:]( self,  "isValidLocalHandle:activeLocalHandles:provider:",  v6,  v10,  0LL);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  if ([v12 groupFacetimeAsAServiceEnabled])
  {
    BOOL v13 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDConversationManager activeLocalHandlesForProvider]( self,  "activeLocalHandlesForProvider"));
    uint64_t v14 = ((uint64_t (**)(void, id))v13)[2](v13, v7);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v11 = -[CSDConversationManager isValidLocalHandle:activeLocalHandles:provider:]( self,  "isValidLocalHandle:activeLocalHandles:provider:",  v6,  v15,  v7);
  }

  return v11;
}

- (BOOL)isValidLocalHandle:(id)a3
{
  id v4 = a3;
  id v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager activeLocalHandles](self, "activeLocalHandles"));
  uint64_t v6 = v5[2]();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  LOBYTE(self) = -[CSDConversationManager isValidLocalHandle:activeLocalHandles:provider:]( self,  "isValidLocalHandle:activeLocalHandles:provider:",  v4,  v7,  0LL);

  return (char)self;
}

- (BOOL)isValidLocalHandle:(id)a3 activeLocalHandles:(id)a4 provider:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  else {
    BOOL v10 = -[CSDConversationManager isHandleLocalPseudonym:provider:](self, "isHandleLocalPseudonym:provider:", v8, v9);
  }

  return v10;
}

- (BOOL)isHandleLocalPseudonym:(id)a3 provider:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 value]);
  LOBYTE(self) = -[CSDConversationManager isHandleStringLocalPseudonym:provider:]( self,  "isHandleStringLocalPseudonym:provider:",  v7,  v6);

  return (char)self;
}

- (BOOL)isHandleStringLocalPseudonym:(id)a3
{
  return -[CSDConversationManager isHandleStringLocalPseudonym:provider:]( self,  "isHandleStringLocalPseudonym:provider:",  a3,  0LL);
}

- (BOOL)isHandleStringLocalPseudonym:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v8 destinationIdIsPseudonym])
  {
    id v9 = (__CFString *)[[IDSURI alloc] initWithPrefixedURI:v8];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
    unsigned int v11 = [v10 groupFacetimeAsAServiceEnabled];

    if (v7 && v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceForProvider:v7]);
    }

    else
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pseudonymForPseudonymURI:v9]);
    BOOL v14 = v16 != 0LL;

    id v17 = sub_1001704C4();
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 pseudonymForPseudonymURI:v9]);
      int v27 = 138413314;
      id v28 = v8;
      __int16 v29 = 2112;
      __int16 v30 = v9;
      __int16 v31 = 2112;
      id v32 = v19;
      __int16 v33 = 2112;
      __int128 v34 = v20;
      __int16 v35 = 2112;
      __int128 v36 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "destinationID: %@, uri: %@, service: %@, self.service: %@, pseudonym: %@",  (uint8_t *)&v27,  0x34u);
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  id v23 = sub_1001704C4();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = @"NO";
    int v27 = 138412802;
    id v28 = v8;
    __int16 v29 = 2112;
    if (v14) {
      id v25 = @"YES";
    }
    __int16 v30 = v25;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "destinationID: %@, isLocalPseudonym: %@, provider: %@",  (uint8_t *)&v27,  0x20u);
  }

  return v14;
}

- (id)senderIdentityUUIDForCallerIDHandle:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager senderIdentitiesBlock](self, "senderIdentitiesBlock", 0LL));
  uint64_t v6 = v5[2]();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        unsigned int v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
        unsigned int v13 = [v12 isEqualToHandle:v4];

        if (v13)
        {
          id v8 = (id)objc_claimAutoreleasedReturnValue([v11 UUID]);
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)callerIDHandleForSenderIdentityUUID:(id)a3 callerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager senderIdentitiesBlock](self, "senderIdentitiesBlock", 0LL));
  uint64_t v9 = v8[2]();
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        BOOL v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
        unsigned int v16 = [v15 isEqual:v6];

        if (v16)
        {
          if ([v7 length])
          {
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 value]);
            unsigned int v19 = [v18 isEqualToString:v7];

            if (v19)
            {
              id v11 = (id)objc_claimAutoreleasedReturnValue([v14 handle]);
              goto LABEL_13;
            }
          }
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

- (id)callerIDForLocalMember:(id)a3 forProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
  LODWORD(self) = -[CSDConversationManager isValidLocalHandle:forProvider:]( self,  "isValidLocalHandle:forProvider:",  v8,  v7);

  if ((_DWORD)self)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
    BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 normalizedValue]);
  }

  else
  {
    id v11 = sub_1001704C4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B502C();
    }

    BOOL v10 = &stru_1003E7718;
  }

  return v10;
}

- (id)callerIDForLocalMember:(id)a3
{
  return -[CSDConversationManager callerIDForLocalMember:forProvider:]( self,  "callerIDForLocalMember:forProvider:",  a3,  0LL);
}

- (id)localMemberForProvider:(id)a3 fromHandle:(id)a4 members:(id)a5 lightweightMembers:(id)a6 activeLocalHandles:(id)a7
{
  id v47 = a3;
  id v45 = a4;
  id v12 = a5;
  id v13 = a6;
  id v46 = a7;
  id v44 = v12;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v12));
  id v43 = v13;
  [v14 unionSet:v13];
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v53;
LABEL_3:
    uint64_t v19 = 0LL;
    while (1)
    {
      if (*(void *)v53 != v18) {
        objc_enumerationMutation(v15);
      }
      id v20 = *(void **)(*((void *)&v52 + 1) + 8 * v19);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 handle]);
      int v22 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDConversationManager localCallerIDForProvider]( self,  "localCallerIDForProvider"));
      uint64_t v23 = ((uint64_t (**)(void, id))v22)[2](v22, v47);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      unsigned __int8 v25 = [v21 isEqual:v24];

      if ((v25 & 1) != 0) {
        break;
      }
      if (v17 == (id)++v19)
      {
        id v17 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v17) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v26 = v20;

    if (!v26) {
      goto LABEL_12;
    }
    id v27 = 0LL;
    goto LABEL_29;
  }

- (id)createConversationWithUUID:(id)a3 groupUUID:(id)a4 messagesGroupUUID:(id)a5 locallyCreated:(BOOL)a6 localMember:(id)a7 initiator:(id)a8 remoteMembers:(id)a9 pendingMembers:(id)a10 otherInvitedHandles:(id)a11 remotePushTokens:(id)a12 lightweightMembers:(id)a13 activity:(id)a14 link:(id)a15 report:(id)a16 fromStorage:(BOOL)a17 avMode:(unint64_t)a18 presentationMode:(unint64_t)a19 provider:(id)a20 screenSharingRequest:(id)a21 isInitiator:(BOOL)a22 isOldMessage:(BOOL)a23
{
  BOOL v134 = a6;
  id v27 = a3;
  id v28 = a4;
  id v148 = a5;
  id v152 = a7;
  id v144 = a8;
  id v149 = a9;
  id v29 = self;
  id v143 = a10;
  id v142 = a11;
  id v151 = a12;
  id v30 = a13;
  id v140 = a14;
  id v150 = a15;
  id v146 = a16;
  id v31 = a20;
  id v147 = a21;
  id v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v32);

  id v33 = sub_1001704C4();
  __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    uint64_t v173 = (uint64_t)v27;
    __int16 v174 = 2112;
    id v175 = v28;
    __int16 v176 = 2112;
    id v177 = v152;
    __int16 v178 = 1024;
    *(_DWORD *)v179 = a17;
    *(_WORD *)&v179[4] = 2112;
    *(void *)&v179[6] = v146;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "UUID: %@ groupUUID: %@ localMember: %@ fromStorage: %d report: %@",  buf,  0x30u);
  }

  v145 = v28;

  id v35 = sub_1001704C4();
  __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  unsigned int v37 = v149;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v173 = (uint64_t)v27;
    __int16 v174 = 2112;
    id v175 = v149;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "UUID: %@ remoteMembers: %@", buf, 0x16u);
  }

  BOOL v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int16 v39 = objc_alloc_init(&OBJC_CLASS___NSSet);
  v137 = v31;
  v141 = v30;
  if ([v151 count])
  {
    id v40 = sub_1001704C4();
    id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = (void *)objc_claimAutoreleasedReturnValue([v151 allObjects]);
      uint64_t v43 = TULoggableStringForHandles(v42);
      id v44 = v39;
      id v45 = (void *)objc_claimAutoreleasedReturnValue(v43);
      *(_DWORD *)buf = 138412546;
      uint64_t v173 = (uint64_t)v27;
      __int16 v174 = 2112;
      id v175 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Asked to invite specific conversationUUID: %@ participantDestinationIDs: %@",  buf,  0x16u);

      __int16 v39 = v44;
    }

    id v46 = (void *)objc_claimAutoreleasedReturnValue([v151 allObjects]);
    [v38 addObjectsFromArray:v46];

    id v47 = v39;
    id v133 = (NSSet *)[v38 copy];
  }

  else
  {
    id v133 = v39;
    if (v30) {
      id v48 = (id)objc_claimAutoreleasedReturnValue([v149 setByAddingObjectsFromSet:v30]);
    }
    else {
      id v48 = v149;
    }
    __int128 v167 = 0u;
    __int128 v168 = 0u;
    __int128 v165 = 0u;
    __int128 v166 = 0u;
    id v47 = (NSSet *)v48;
    id v49 = -[NSSet countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v165,  v171,  16LL);
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v166;
      do
      {
        for (i = 0LL; i != v50; i = (char *)i + 1)
        {
          if (*(void *)v166 != v51) {
            objc_enumerationMutation(v47);
          }
          __int128 v53 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationMember:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationMember:",  *(void *)(*((void *)&v165 + 1) + 8LL * (void)i)));
          [v38 addObject:v53];
        }

        id v50 = -[NSSet countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v165,  v171,  16LL);
      }

      while (v50);
    }

    id v29 = self;
  }

  v136 = v27;
  if ([v149 count] != (id)1) {
    goto LABEL_23;
  }
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](v29, "featureFlags"));
  if ([v54 uPlusOneSessionWithCapabilitiesEnabled])
  {
    __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager serverBag](v29, "serverBag"));
    unsigned __int8 v56 = [v55 isUPlusOneSessionCapabilitiesEnabled];

    if ((v56 & 1) != 0)
    {
LABEL_23:
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationMember:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationMember:",  v152));
      [v38 addObject:v57];
      goto LABEL_47;
    }
  }

  else
  {
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager pushTokenForSelf](v29, "pushTokenForSelf"));
  v59 = (void *)objc_claimAutoreleasedReturnValue([v152 idsDestination]);
  uint64_t v138 = IDSCopyIDForTokenWithID(v58, v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](v29, "service"));
  uint64_t v61 = IDSRegistrationPropertySupportsSelfOneToOneInvites;
  v62 = (void *)objc_claimAutoreleasedReturnValue([v152 handle]);
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v60 deviceDestinationsWithCapability:v61 localHandle:v62]);

  id v64 = sub_1001704C4();
  v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v66 = TULoggableStringForHandles(v63);
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    *(_DWORD *)buf = 138412546;
    uint64_t v173 = v138;
    __int16 v174 = 2112;
    id v175 = v67;
    _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "localDeviceDestination: %@ oneToOneModeCapableLocalDestinations: %@",  buf,  0x16u);
  }

  if ([v63 count])
  {
    __int128 v163 = 0u;
    __int128 v164 = 0u;
    __int128 v161 = 0u;
    __int128 v162 = 0u;
    id v131 = v63;
    id obj = v63;
    id v68 = [obj countByEnumeratingWithState:&v161 objects:v170 count:16];
    if (v68)
    {
      id v69 = v68;
      uint64_t v155 = *(void *)v162;
      do
      {
        for (j = 0LL; j != v69; j = (char *)j + 1)
        {
          if (*(void *)v162 != v155) {
            objc_enumerationMutation(obj);
          }
          v71 = *(void **)(*((void *)&v161 + 1) + 8LL * (void)j);
          __int128 v157 = 0u;
          __int128 v158 = 0u;
          __int128 v159 = 0u;
          __int128 v160 = 0u;
          unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue([v71 destinationURIs]);
          id v73 = [v72 countByEnumeratingWithState:&v157 objects:v169 count:16];
          if (v73)
          {
            id v74 = v73;
            uint64_t v75 = *(void *)v158;
            do
            {
              for (k = 0LL; k != v74; k = (char *)k + 1)
              {
                if (*(void *)v158 != v75) {
                  objc_enumerationMutation(v72);
                }
                v77 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v157 + 1) + 8 * (void)k) stringByReplacingOccurrencesOfString:@"self-token:" withString:@"token:"]);
                [v38 addObject:v77];
              }

              id v74 = [v72 countByEnumeratingWithState:&v157 objects:v169 count:16];
            }

            while (v74);
          }
        }

        id v69 = [obj countByEnumeratingWithState:&v161 objects:v170 count:16];
      }

      while (v69);
    }

    id v29 = self;
    unsigned int v37 = v149;
    id v31 = v137;
    uint64_t v63 = v131;
  }

  v57 = (void *)v138;
  if (v138)
  {
    [v38 addObject:v138];
  }

  else
  {
    v78 = v63;
    v79 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationMember:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationMember:",  v152));
    [v38 addObject:v79];

    uint64_t v63 = v78;
  }

LABEL_47:
  id v80 = sub_1001704C4();
  v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](v29, "service"));
    v83 = (void *)objc_claimAutoreleasedReturnValue([v38 allObjects]);
    uint64_t v84 = TULoggableStringForHandles(v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
    *(_DWORD *)buf = 138413058;
    uint64_t v173 = (uint64_t)v27;
    __int16 v174 = 2112;
    id v175 = v82;
    __int16 v176 = 2112;
    id v177 = v31;
    __int16 v178 = 2112;
    *(void *)v179 = v85;
    _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "conversationUUID: %@ service: %@, provider: %@, participantDestinationIDs: %@",  buf,  0x2Au);
  }

  v156 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager callerIDForLocalMember:forProvider:]( v29,  "callerIDForLocalMember:forProvider:",  v152,  v31));
  v86 = (void *)objc_claimAutoreleasedReturnValue([v148 UUIDString]);
  v87 = v86;
  if (v86) {
    id v88 = v86;
  }
  else {
    id v88 = (id)objc_claimAutoreleasedReturnValue([v145 UUIDString]);
  }
  id obja = v88;

  if ([v37 count] == (id)1)
  {
    v89 = (void *)objc_claimAutoreleasedReturnValue([v37 allObjects]);
    v90 = (void *)objc_claimAutoreleasedReturnValue([v89 firstObject]);
    v91 = (void *)objc_claimAutoreleasedReturnValue([v90 handle]);
    v92 = (void *)objc_claimAutoreleasedReturnValue([v91 value]);
    unsigned int v93 = [v92 destinationIdIsTemporary] ^ 1;
    if (v150) {
      BOOL v94 = 0;
    }
    else {
      BOOL v94 = v93;
    }
  }

  else
  {
    BOOL v94 = 0;
  }

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](v29, "featureFlags"));
  if ([v95 conversationOneToOneModeEnabled])
  {
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager serverBag](v29, "serverBag"));
    unsigned int v97 = [v96 isFaceTimeMyselfEnabled];

    if (((v94 | v97 ^ 1) & 1) == 0)
    {
      if ([v37 count]) {
        BOOL v94 = 0;
      }
      else {
        BOOL v94 = [v151 count] != 0;
      }
    }
  }

  else
  {
  }

  id v98 = sub_1001704C4();
  v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    v100 = @"NO";
    if (v94) {
      v100 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v173 = (uint64_t)v100;
    __int16 v174 = 2112;
    id v175 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_DEFAULT,  "isOneToOneModeEnabled: %@, remoteMembers: %@",  buf,  0x16u);
  }

  v101 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](v29, "featureFlags"));
  unsigned int v102 = [v101 groupFacetimeAsAServiceEnabled];

  if (v31 && v102)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
    v104 = (void *)objc_claimAutoreleasedReturnValue([v103 serviceForProvider:v31]);
  }

  else
  {
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](v29, "service"));
  }

  objc_super v139 = -[CSDConversationABTestConfiguration initWithGroupUUID:]( objc_alloc(&OBJC_CLASS___CSDConversationABTestConfiguration),  "initWithGroupUUID:",  v145);
  if (v147)
  {
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](v29, "featureFlags"));
    unsigned __int8 v130 = [v105 requestToScreenShareEnabled];
  }

  else
  {
    unsigned __int8 v130 = 0;
  }

  id v106 = (uint64_t (**)(void, void, void, void, void, void, void, void, _WORD, void, _BYTE))objc_claimAutoreleasedReturnValue(-[CSDConversationManager groupSessionProviderCreationBlock](v29, "groupSessionProviderCreationBlock"));
  id v107 = (void *)objc_claimAutoreleasedReturnValue([v38 allObjects]);
  id v108 = v29;
  id v109 = (void *)objc_claimAutoreleasedReturnValue([v104 accountWithCallerID:v156]);
  id v110 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](v108, "queue"));
  id v111 = -[CSDConversationABTestConfiguration copy](v139, "copy");
  HIBYTE(v129) = v130;
  LOBYTE(v129) = a18 == 0;
  uint64_t v112 = ((uint64_t (**)(void, id, void *, void *, void *, void *, BOOL, id, __int16, id, BOOL))v106)[2]( v106,  obja,  v107,  v156,  v109,  v110,  v94,  v152,  v129,  v111,  a22);
  uint64_t v113 = objc_claimAutoreleasedReturnValue(v112);

  v132 = (void *)v113;
  id v114 = -[CSDIDSGroupSession initWithGroupSessionProvider:]( objc_alloc(&OBJC_CLASS___CSDIDSGroupSession),  "initWithGroupSessionProvider:",  v113);
  id v115 = (uint64_t (**)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _BYTE, void, void, void, _BYTE))objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationCreationBlock](v108, "conversationCreationBlock"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](v108, "queue"));
  id v117 = -[CSDConversationABTestConfiguration copy](v139, "copy");
  uint64_t v118 = ((uint64_t (**)(void, void *, void *, void *, CSDIDSGroupSession *, id, BOOL, id, id, id, id, id, void *, id, id, id, id, id, BOOL, unint64_t, unint64_t, id, BOOL))v115)[2]( v115,  v116,  v136,  v145,  v114,  v148,  v134,  v152,  v144,  v149,  v143,  v142,  v141,  v151,  v140,  v150,  v147,  v146,  a17,  a18,  a19,  v117,  a23);
  id v119 = (void *)objc_claimAutoreleasedReturnValue(v118);

  [v119 setDelegate:v108];
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager reportingController](v108, "reportingController"));
  id v121 = (void *)objc_claimAutoreleasedReturnValue([v119 tuConversation]);
  [v120 createConversationReportingSession:v121];

  v122 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](v108, "mutableConversationsByUUID"));
  id v123 = (void *)objc_claimAutoreleasedReturnValue([v119 UUID]);
  [v122 setObject:v119 forKeyedSubscript:v123];

  v124 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager persistenceController](v108, "persistenceController"));
  [v124 updateConversation:v119];

  id v125 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](v108, "featureFlags"));
  else {
    char v126 = 0;
  }

  if (v150 && (v126 & 1) == 0)
  {
    id v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsGondola));
    [v119 addRequiredCapabilities:v127 requiredLackOfCapabilities:0];
  }

  return v119;
}

- (id)pendingConversationUUIDWithPseudonym:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1000D42D4;
  id v16 = sub_1000D42E4;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D42EC;
  block[3] = &unk_1003D9238;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)removePendingConversationWithPseudonym:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1000D42D4;
  id v16 = sub_1000D42E4;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D455C;
  block[3] = &unk_1003D9650;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_removePendingConversationWithPseudonym:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePendingConversationsByPseudonym]( self,  "mutablePendingConversationsByPseudonym"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePendingConversationsByPseudonym]( self,  "mutablePendingConversationsByPseudonym"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v4]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePendingConversationsByPseudonym]( self,  "mutablePendingConversationsByPseudonym"));
    [v10 setObject:0 forKeyedSubscript:v4];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)_removePendingConversationsWithTemporaryGroupUUIDIfNecessary:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePendingConversationsByPseudonym]( self,  "mutablePendingConversationsByPseudonym",  0LL));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePendingConversationsByPseudonym]( self,  "mutablePendingConversationsByPseudonym"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 temporaryGroupUUID]);
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v6 = (id)objc_claimAutoreleasedReturnValue( -[CSDConversationManager _removePendingConversationWithPseudonym:]( self,  "_removePendingConversationWithPseudonym:",  v9));
          -[CSDConversationManager notifyDelegatesOfRemovedConversationWithUUID:]( self,  "notifyDelegatesOfRemovedConversationWithUUID:",  v4);

          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)removeAllPendingConversations
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D4848;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (id)activeConversation
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 state] == (id)3)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)conversationWithGroupUUID:(id)a3 andProvider:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);

  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v13);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
        unsigned int v16 = [v15 groupFacetimeAsAServiceEnabled];

        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 groupUUID]);
        unsigned int v18 = [v17 isEqual:v6];
        if (v18) {
          BOOL v19 = v16 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          unsigned int v20 = v18;

          if (v20) {
            goto LABEL_17;
          }
        }

        else
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 provider]);
          unsigned __int8 v22 = [v21 isEqualToConversationProvider:v25];

          if ((v22 & 1) != 0)
          {
LABEL_17:
            id v23 = v14;
            goto LABEL_18;
          }
        }

        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v23 = 0LL;
LABEL_18:

  return v23;
}

- (id)conversationWithGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID", 0LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupUUID]);
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)conversationWithGroupUUID:(id)a3 orRepresentedByRemoteMembers:(id)a4 andLink:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationWithGroupUUID:](self, "conversationWithGroupUUID:", v8));
  if (!v12)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID", 0LL));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allValues]);

    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v15)
    {
      id v16 = v15;
      __int128 v17 = 0LL;
      uint64_t v18 = *(void *)v26;
LABEL_4:
      uint64_t v19 = 0LL;
      while (1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v14);
        }
        unsigned int v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
        if ([v20 isRepresentedByRemoteMembers:v9 andLink:v10])
        {
          id v12 = v20;

          __int128 v17 = v12;
        }

        if (v16 == (id)++v19)
        {
          id v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
          id v12 = v17;
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    else
    {
      id v12 = 0LL;
    }
  }

  id v21 = sub_1001704C4();
  unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (v12) {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 groupUUID]);
    }
    else {
      id v23 = 0LL;
    }
    *(_DWORD *)buf = 138412546;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "found conversation from groupUUID: %@, conversation: %@",  buf,  0x16u);
    if (v12) {
  }
    }

  return v12;
}

- (id)conversationRepresentedByRemoteMembers:(id)a3 andLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  unsigned int v20 = sub_1000D42D4;
  id v21 = sub_1000D42E4;
  id v22 = 0LL;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000D5048;
  v13[3] = &unk_1003D9AD8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)activeApprovedConversationWithLink:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_1000D42D4;
  id v16 = sub_1000D42E4;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D5280;
  block[3] = &unk_1003D9238;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)pendingConversationWithPseudonym:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePendingConversationsByPseudonym]( self,  "mutablePendingConversationsByPseudonym",  0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 link]);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pseudonym]);
        unsigned int v14 = [v13 isEqual:v4];

        if (v14)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (id)findConversationLinkMatchingPseudonym:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager activatedConversationLinksWithError:]( self,  "activatedConversationLinksWithError:",  0LL,  0LL));
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
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pseudonym]);
        unsigned int v12 = [v11 isEqual:v4];

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

- (id)conversationLinkForPseudonym:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  __int128 v15 = sub_1000D42D4;
  __int128 v16 = sub_1000D42E4;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D57E0;
  block[3] = &unk_1003D9650;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)conversationLinkForGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager activatedConversationLinksWithError:]( self,  "activatedConversationLinksWithError:",  0LL,  0LL));
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
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 groupUUID]);
        unsigned int v12 = [v11 isEqual:v4];

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

- (id)createConversationIfNecessaryWithUUID:(id)a3 groupUUID:(id)a4 messagesGroupUUID:(id)a5 locallyCreated:(BOOL)a6 localMember:(id)a7 remoteMembers:(id)a8 pendingMembers:(id)a9 otherInvitedHandles:(id)a10 remotePushTokens:(id)a11 lightweightMembers:(id)a12 link:(id)a13 activity:(id)a14 avMode:(unint64_t)a15 presentationMode:(unint64_t)a16 provider:(id)a17 screenSharingRequest:(id)a18
{
  BOOL v43 = a6;
  id v22 = a3;
  id v23 = a4;
  id v50 = a5;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v49 = a10;
  id v48 = a11;
  id v47 = a12;
  id v46 = a13;
  id v45 = a14;
  id v27 = a17;
  id v28 = a18;
  __int128 v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v29);

  id v30 = sub_1001704C4();
  __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v52 = v22;
    __int16 v53 = 2112;
    id v54 = v23;
    __int16 v55 = 2112;
    id v56 = v24;
    __int16 v57 = 2112;
    id v58 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "UUID: %@ groupUUD: %@ localMember: %@, provider: %@",  buf,  0x2Au);
  }

  id v32 = sub_1001704C4();
  id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v52 = v22;
    __int16 v53 = 2112;
    id v54 = v25;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "UUID: %@ remoteMembers: %@", buf, 0x16u);
  }

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID"));
  id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:v22]);

  if (!v35)
  {
    __int128 v36 = objc_alloc_init(&OBJC_CLASS___TUConversationReport);
    id v37 = v25;
    id v38 = v26;
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v24 handle]);
    LOWORD(v42) = 1;
    LOBYTE(v41) = 0;
    id v35 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager createConversationWithUUID:groupUUID:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:remotePushTokens:lightweightMembers:activity:link:report:fromStorage:avMode:presentationMode:provider:screenSharingRequest:isInitiator:isOldMessage:]( self,  "createConversationWithUUID:groupUUID:messagesGroupUUID:locallyCreated:localMember:initiator:remote Members:pendingMembers:otherInvitedHandles:remotePushTokens:lightweightMembers:activity:link:repor t:fromStorage:avMode:presentationMode:provider:screenSharingRequest:isInitiator:isOldMessage:",  v22,  v23,  v50,  v43,  v24,  v39,  v37,  v38,  v49,  v48,  v47,  v45,  v46,  v36,  v41,  a15,  a16,  v27,  v28,  v42));

    id v26 = v38;
    id v25 = v37;
  }

  return v35;
}

- (id)conversationWithGroupUUID:(id)a3 orMemberIdentifiers:(id)a4 orRemoteMembers:(id)a5 andLink:(id)a6 andVideo:(BOOL)a7
{
  int v35 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int128 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v15);

  id v16 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationWithGroupUUID:](self, "conversationWithGroupUUID:", v11));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager serverBag](self, "serverBag"));
  if ([v17 isParticipantIDToURIIncludedInPush])
  {
    unsigned __int8 v18 = 0;
  }

  else
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
    unsigned __int8 v18 = [v19 participantIDToURIRemovedEnabled];
  }

  if ((v18 & 1) == 0 && !v16)
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allValues]);

    id v16 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v16)
    {
      id v33 = self;
      id v34 = v11;
      uint64_t v22 = *(void *)v41;
      while (2)
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v21);
          }
          id v24 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 memberIdentifiers]);
          unsigned int v26 = [v25 isEqualToSet:v12];

          if (v26)
          {
            id v16 = v24;
            goto LABEL_16;
          }
        }

        id v16 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v16) {
          continue;
        }
        break;
      }

- (void)notifyDelegatesOfMessage:(id)a3 fromHandle:(id)a4 forConversation:(id)a5 withUpdate:(id)a6
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v21 = a6;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v16,  "conversationManager:conversation:receivedMessage:fromHandle:withUpdate:") & 1) != 0)
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v22 tuConversation]);
          unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          __int128 v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v16]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000D61CC;
          block[3] = &unk_1003D9B00;
          void block[4] = v16;
          id v26 = v17;
          id v27 = self;
          id v28 = v24;
          id v29 = v23;
          id v30 = v21;
          id v20 = v17;
          dispatch_async(v19, block);
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v13);
  }
}

- (void)notifyDelegatesOfNewConversation:(id)a3 fromHandle:(id)a4
{
  id v18 = a3;
  id v17 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
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
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "conversationManager:reportedNewIncomingConversation:fromHandle:") & 1) != 0)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v18 tuConversation]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          __int128 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000D650C;
          block[3] = &unk_1003D7B28;
          void block[4] = v12;
          id v20 = v13;
          id v21 = self;
          id v22 = v17;
          id v16 = v13;
          dispatch_async(v15, block);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v9);
  }
}

- (void)notifyDelegatesOfAVModeChanged:(unint64_t)a3 toAVMode:(unint64_t)a4 forConversation:(id)a5
{
  id v19 = a5;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "conversationManager:avModeChanged:toAVMode:forConversation:") & 1) != 0)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v19 tuConversation]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          __int128 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000D6830;
          block[3] = &unk_1003D9008;
          void block[4] = v12;
          id v21 = v13;
          id v22 = self;
          unint64_t v23 = a3;
          unint64_t v24 = a4;
          id v16 = v13;
          dispatch_async(v15, block);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v9);
  }
}

- (void)notifyDelegatesOfRemovedConversationWithUUID:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "conversationManager:removedConversationWithUUID:") & 1) != 0)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000D6B14;
          block[3] = &unk_1003D7828;
          void block[4] = v10;
          void block[5] = self;
          id v14 = v4;
          dispatch_async(v12, block);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }
}

- (void)notifyDelegatesOfTrackedPendingMember:(id)a3 forConversationLink:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "conversationManager:trackedPendingMember:forConversationLink:") & 1) != 0)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          __int128 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v13]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000D6D00;
          block[3] = &unk_1003D7B28;
          void block[4] = v13;
          void block[5] = self;
          id v18 = v16;
          id v19 = v6;
          dispatch_async(v15, block);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v10);
  }
}

- (void)notifyDelegatesOfUpdatePendingConversations
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager _incomingPendingConversationsByGroupUUID]( self,  "_incomingPendingConversationsByGroupUUID"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "conversationManager:updateIncomingPendingConversationsByGroupUUID:") & 1) != 0)
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000D6EC8;
          block[3] = &unk_1003D7828;
          void block[4] = v10;
          void block[5] = self;
          id v14 = v4;
          dispatch_async(v12, block);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }
}

- (void)notifyDelegatesOfChangedLinkDescriptors:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc(&OBJC_CLASS___TUConversationLink);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    id v7 = -[TUConversationLink initWithDescriptor:](v5, "initWithDescriptor:", v6);

    id v8 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "notifyDelegatesOfChangedLinkDescriptors: %@",  (uint8_t *)&v11,  0xCu);
    }

    -[CSDConversationManager notifyDelegatesOfChangedLink:conversation:]( self,  "notifyDelegatesOfChangedLink:conversation:",  v7,  0LL);
  }

  else
  {
    id v10 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "notifyDelegatesOfChangedLinkDescriptors: -- no link descriptors, not updating delegates",  (uint8_t *)&v11,  2u);
    }
  }
}

- (void)notifyDelegatesOfChangedLink:(id)a3 conversation:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  if (-[CSDConversationManager _linksEnabled](self, "_linksEnabled"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000D70DC;
    v8[3] = &unk_1003D9B28;
    v8[4] = self;
    id v9 = v5;
    [v7 activatedLinksWithCompletionHandler:v8];
  }
}

- (void)notifyDelegatesOfRemoteScreenShareAttributes:(id)a3 isLocallySharing:(BOOL)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v9 = [v8 supportsScreenSharing];

  if (v9)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
    id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v13);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          __int128 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v14]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000D772C;
          block[3] = &unk_1003D8FE0;
          void block[4] = v14;
          void block[5] = self;
          id v19 = v6;
          BOOL v20 = a4;
          dispatch_async(v16, block);

          uint64_t v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v11);
    }
  }
}

- (void)notifyDelegatesOfRemoteScreenShareEndedWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v7 = [v6 supportsScreenSharing];

  if (v7)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
    id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v11);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v12]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000D7934;
          block[3] = &unk_1003D7828;
          void block[4] = v12;
          void block[5] = self;
          id v17 = v4;
          dispatch_async(v14, block);

          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v9);
    }
  }
}

- (void)notifyDelegatesOfLetMeInRejectedForPendingConversation:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 tuConversation]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
        uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000D7B34;
        block[3] = &unk_1003D7828;
        void block[4] = v11;
        id v16 = v6;
        id v17 = self;
        dispatch_async(v13, block);
      }

      id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }
}

- (void)notifyDelegatesOfInvalidLinkForPendingConversation:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 tuConversation]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
        uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000D7E48;
        block[3] = &unk_1003D7828;
        void block[4] = v11;
        id v16 = v6;
        id v17 = self;
        dispatch_async(v13, block);
      }

      id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }
}

- (void)handleConversation:(id)a3 receivedBlobRecoveryRequest:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  unsigned int v12 = [v9 requestBlobRecoveryOptions];
  id v13 = sub_1001704C4();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 67109378;
    *(_DWORD *)id v29 = v12;
    *(_WORD *)&v29[4] = 2112;
    *(void *)&v29[6] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "handleConversation:receivedBlobRecoveryRequest:fromHandle: options: %u from: %@",  (uint8_t *)&v28,  0x12u);
  }

  uint64_t v15 = TUCopyIDSCanonicalAddressForHandle(v10);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v16));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 localConversationParticipantWithDataToSendToDestinationIDs:v17]);

  if (v18)
  {
    __int128 v19 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 groupUUID]);
    __int128 v21 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v19,  "initWithType:groupUUID:link:",  5LL,  v20,  0LL);

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationParticipant:",  v18));
    -[CSDMessagingConversationMessage addActiveParticipants:](v21, "addActiveParticipants:", v22);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v21, "data"));
    id v24 = sub_1001704C4();
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412546;
      *(void *)id v29 = v21;
      *(_WORD *)&v29[8] = 2112;
      *(void *)&v29[10] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "handleConversation:receivedBlobRecoveryRequest:fromHandle: Sending message: %@ to: %@",  (uint8_t *)&v28,  0x16u);
    }

    -[CSDConversationManager sendData:onConversation:toHandle:isBlobResponse:]( self,  "sendData:onConversation:toHandle:isBlobResponse:",  v23,  v8,  v10,  1LL);
  }

  else
  {
    id v26 = sub_1001704C4();
    __int128 v21 = (CSDMessagingConversationMessage *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
      int v28 = 138412290;
      *(void *)id v29 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] handleConversation:receivedBlobRecoveryRequest:fromHandle: No local participant for conversation UUID: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)handleConversation:(id)a3 receivedBlobRecoveryResponse:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412290;
    id v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "handleConversation:receivedBlobRecoveryResponse:fromHandle: from: %@",  (uint8_t *)&v29,  0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 activeParticipants]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 csdConversationParticipant]);

  if (!v16)
  {
    id v23 = sub_1001704C4();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412290;
      id v30 = v9;
      __int128 v25 = "[WARN] handleConversation:receivedBlobRecoveryResponse:fromHandle: Could not find participant in message: %@";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v29, 0xCu);
    }

- (void)handleConversationHandoffRecommendationChangedNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D85B8;
  v7[3] = &unk_1003D7758;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateConversationHandoffEligibility:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v51 = self;
  id v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager lockdownModeEnabled](self, "lockdownModeEnabled"));
  int v7 = v6[2]();

  if (v7)
  {
    id v8 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v66 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Not updating handoff eligibility %@ because lockdown mode is enabled",  buf,  0xCu);
    }

    goto LABEL_50;
  }

  id v10 = sub_1001704C4();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationGroupUUID]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 association]);
      id v15 = [v14 identifier];
      else {
        id v16 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      else {
        id v17 = @"NO";
      }
      id v66 = v13;
      __int16 v67 = 2048;
      id v68 = v15;
      __int16 v69 = 2112;
      v70 = v16;
      __int16 v71 = 2112;
      unsigned int v72 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Handoff changed to advertise %@ for identifier %llu, uplink muted %@, sending video %@",  buf,  0x2Au);
    }
  }

  else if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Handoff changed without eligibility, so stopping advertising",  buf,  2u);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v60 = 0u;
  __int128 v59 = 0u;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allValues]);

  id obj = v19;
  id v20 = [v19 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (!v20)
  {
    id v22 = 0LL;
    goto LABEL_42;
  }

  id v21 = v20;
  id v22 = 0LL;
  uint64_t v23 = *(void *)v60;
  do
  {
    for (i = 0LL; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v60 != v23) {
        objc_enumerationMutation(obj);
      }
      __int128 v25 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
      if ((+[TUConversationManager supportsConversations]( &OBJC_CLASS___TUConversationManager,  "supportsConversations") & 1) == 0)
      {
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v25 remoteMembers]);
        if ((unint64_t)[v34 count] >= 2)
        {

LABEL_29:
          id v36 = sub_1001704C4();
          __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v66 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Handoff eligibility set to nil for GreenTea device: %@",  buf,  0xCu);
          }

LABEL_32:
          [v25 setHandoffEligibility:0];
          continue;
        }

        unsigned __int8 v35 = [v25 isVideoEnabled];

        if ((v35 & 1) == 0) {
          goto LABEL_29;
        }
      }

      if (v4)
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 groupUUID]);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationGroupUUID]);
        unsigned int v28 = [v26 isEqual:v27];

        if (!v28) {
          goto LABEL_32;
        }
        [v25 setHandoffEligibility:v4];
        id v29 = v25;

        id v30 = sub_1001704C4();
        __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v66 = v29;
          id v32 = v31;
          __int128 v33 = "Handoff eligibility added to conversation: %@";
LABEL_36:
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
        }
      }

      else
      {
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v25 handoffEligibility]);

        if (!v38) {
          goto LABEL_32;
        }
        [v25 setHandoffEligibility:0];
        id v29 = v25;

        id v39 = sub_1001704C4();
        __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v66 = v29;
          id v32 = v31;
          __int128 v33 = "Handoff eligibility removed from conversation: %@";
          goto LABEL_36;
        }
      }

      id v22 = v29;
    }

    id v21 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  }

  while (v21);
LABEL_42:
  id v9 = (os_log_s *)v22;

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](v51, "delegateToQueue"));
  id v40 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v56;
    do
    {
      for (j = 0LL; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v56 != v42) {
          objc_enumerationMutation(obja);
        }
        uint64_t v44 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)j);
        id v45 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s tuConversation](v9, "tuConversation"));
        id v46 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](v51, "delegateToQueue"));
        id v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v46 objectForKey:v44]);

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000D8BA0;
        block[3] = &unk_1003D7828;
        void block[4] = v44;
        id v53 = v45;
        id v54 = v51;
        id v48 = v45;
        dispatch_async(v47, block);
      }

      id v41 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
    }

    while (v41);
  }

LABEL_50:
}

- (void)handleConversationHandoffRouteIdentifierChangedNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D8DC0;
  block[3] = &unk_1003D7CB0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)postSessionStartedForSession:(id)a3 originator:(id)a4 conversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Posting session started event from participant %@ for session %@",  (uint8_t *)&v19,  0x16u);
  }

  id v15 = objc_alloc(&OBJC_CLASS___TUConversationActivityEvent);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  id v17 = [v15 initWithSessionUUID:v16 originator:v9 type:12];

  [v17 setSession:v8];
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationNoticeManger](self, "conversationNoticeManger"));
  [v18 conversation:v10 receivedActivitySessionEvent:v17];
}

- (void)postEndEventForSession:(id)a3 originator:(id)a4 conversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
    int v19 = 138412546;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Posting session ended event from participant %@ for session %@",  (uint8_t *)&v19,  0x16u);
  }

  id v15 = objc_alloc(&OBJC_CLASS___TUConversationActivityEvent);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  id v17 = [v15 initWithSessionUUID:v16 originator:v9 type:13];

  [v17 setSession:v8];
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationNoticeManger](self, "conversationNoticeManger"));
  [v18 conversation:v10 receivedActivitySessionEvent:v17];
}

- (BOOL)_linksEnabled
{
  return TUDisableLinks(self, a2) ^ 1;
}

- (id)temporaryFilePath
{
  v2 = NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v4]);

  return v5;
}

- (id)createActivitySession:(id)a3 onConversation:(id)a4 fromHandle:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 memberWithHandle:v9]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 association]);
  if (v11
    && (id v12 = (void *)v11,
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 association]),
        unsigned __int8 v14 = [v13 isPrimary],
        v13,
        v12,
        (v14 & 1) == 0))
  {
    id v19 = sub_1001704C4();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 association]);
      int v30 = 138413058;
      id v31 = v7;
      __int16 v32 = 2112;
      __int128 v33 = v21;
      __int16 v34 = 2112;
      id v35 = v9;
      __int16 v36 = 2112;
      __int128 v37 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Asked to create ActivitySession %@ on conversation UUID: %@ for fromHandle: %@ using association: %@",  (uint8_t *)&v30,  0x2Au);
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 association]);
    id v18 = (id)objc_claimAutoreleasedReturnValue([v23 handle]);

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v18));
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v7 activity]);
    [v25 setOriginatorHandle:v24];
  }

  else
  {
    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
      int v30 = 138412802;
      id v31 = v7;
      __int16 v32 = 2112;
      __int128 v33 = v17;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Asked to create ActivitySession %@ on conversation UUID: %@ with trusted fromHandle: %@",  (uint8_t *)&v30,  0x20u);
    }

    id v18 = v9;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v18));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v7 activity]);
  [v27 setFromHandle:v26];

  unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v7 createActivitySessionOnConversation:v8]);
  return v28;
}

- (void)handleEncryptedMessageWithin:(id)a3 fromHandle:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 hasEncryptedMessage]
    || ([v8 hasEnclosedEncryptedType] & 1) == 0)
  {
    id v12 = sub_1001704C4();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_10;
    }

    LOWORD(v18[0]) = 0;
    unsigned __int8 v14 = "[WARN] Conversation message of type Encrypted received with either no encryptedMessage or enclosedEncryptedTyp"
          "e. Dropping message.";
    id v15 = (os_log_s *)v13;
    uint32_t v16 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)v18, v16);
    goto LABEL_9;
  }

  unsigned int v11 = [v8 enclosedEncryptedType];
  if (v11 == 16)
  {
    -[CSDConversationManager handleEncryptedLetMeInResponse:fromHandle:context:]( self,  "handleEncryptedLetMeInResponse:fromHandle:context:",  v8,  v9,  v10);
    goto LABEL_10;
  }

  if (v11 != 10)
  {
    id v17 = sub_1001704C4();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    v18[0] = 67109120;
    v18[1] = [v8 enclosedEncryptedType];
    unsigned __int8 v14 = "[WARN] ConversationMessage of type Encrypted with enclosed type of %d which we do not have support for, dropping.";
    id v15 = (os_log_s *)v13;
    uint32_t v16 = 8;
    goto LABEL_8;
  }

  -[CSDConversationManager handleEncryptedLetMeInRequest:fromHandle:context:]( self,  "handleEncryptedLetMeInRequest:fromHandle:context:",  v8,  v9,  v10);
LABEL_10:
}

- (void)handleEncryptedLetMeInRequest:(id)a3 fromHandle:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  if (-[CSDConversationManager _linksEnabled](self, "_linksEnabled"))
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received Encrypted message with enclosed type of LetMeInRequest from handle %@",  buf,  0xCu);
    }

    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "csd_pseudonym"));
    if ([v14 length])
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedGenericHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedGenericHandleForValue:",  v14));
      if (v15)
      {
        uint32_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 encryptedMessage]);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1000D9E14;
        v21[3] = &unk_1003D9B78;
        v21[4] = self;
        id v15 = v15;
        id v22 = v15;
        id v23 = v9;
        id v24 = v10;
        [v16 decryptLetMeInRequest:v17 pseudonym:v15 fromHandle:v23 completionHandler:v21];
      }

      else
      {
        id v19 = sub_1001704C4();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] Let Me In request was not sent to a pseudonym. Dropping message.",  buf,  2u);
        }
      }
    }

    else
    {
      id v18 = sub_1001704C4();
      id v15 = (id)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not retrieve a pseudonym string from the message context.",  buf,  2u);
      }
    }
  }
}

- (void)handleEncryptedLetMeInResponse:(id)a3 fromHandle:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  if (-[CSDConversationManager _linksEnabled](self, "_linksEnabled"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 tuConversationLink]);
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (!v10)
    {
      if (!v13)
      {
LABEL_26:

        goto LABEL_27;
      }

      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 link]);
      *(_DWORD *)buf = 138412290;
      id v45 = v20;
      __int128 v25 = "[WARN] Provided link is %@, which was not a valid TUConversationLink.";
      id v26 = v12;
      goto LABEL_24;
    }

    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received Encrypted message with enclosed type of LetMeInResponse from handle %@",  buf,  0xCu);
    }

    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 pseudonym]);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager pendingConversationWithPseudonym:]( self,  "pendingConversationWithPseudonym:",  v14));

    if (v12)
    {
      if (-[os_log_s letMeInRequestState](v12, "letMeInRequestState") == (id)2)
      {
        uint64_t v15 = objc_claimAutoreleasedReturnValue(-[os_log_s letMeInKeyAgreement](v12, "letMeInKeyAgreement"));
        if (!v15
          || (uint32_t v16 = (void *)v15,
              id v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s letMeInKeyAgreement](v12, "letMeInKeyAgreement")),
              unsigned int v18 = [v17 isExhausted],
              v17,
              v16,
              v18))
        {
          id v19 = sub_1001704C4();
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s letMeInKeyAgreement](v12, "letMeInKeyAgreement"));
            if (v21) {
              id v22 = @"NO";
            }
            else {
              id v22 = @"YES";
            }
            id v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s letMeInKeyAgreement](v12, "letMeInKeyAgreement"));
            if (v23)
            {
              __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s letMeInKeyAgreement](v12, "letMeInKeyAgreement"));
              else {
                id v24 = @"NO";
              }
            }

            else
            {
              id v24 = 0LL;
            }

            *(_DWORD *)buf = 138412546;
            id v45 = (id)v22;
            __int16 v46 = 2112;
            id v47 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] Pending conversation's let me in key agreement is either nil (%@) or exhausted (%@)",  buf,  0x16u);
            if (v23) {
          }
            }

          goto LABEL_25;
        }

        int v30 = (void *)objc_claimAutoreleasedReturnValue([v10 pseudonym]);
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedGenericHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedGenericHandleForValue:",  v30));

        if (!v20)
        {
          id v35 = sub_1001704C4();
          __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[WARN] Let Me In response was not sent to a pseudonym. Dropping message.",  buf,  2u);
          }

          goto LABEL_44;
        }

        id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v7 encryptedMessage]);
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s letMeInKeyAgreement](v12, "letMeInKeyAgreement"));
        __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 decryptLetMeInResponse:v32 pseudonym:v20 requestorKeyAgreement:v33]);

        if (v34)
        {
          if (-[os_log_s type](v34, "type") == 16)
          {
            -[CSDConversationManager handleReceivedLetMeInResponse:pendingConversation:fromHandle:]( self,  "handleReceivedLetMeInResponse:pendingConversation:fromHandle:",  v34,  v12,  v8);
LABEL_44:

            goto LABEL_25;
          }

          id v41 = sub_1001704C4();
          __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v42 = -[os_log_s type](v34, "type");
            *(_DWORD *)buf = 67109120;
            LODWORD(v45) = v42;
            __int128 v38 = "[WARN] Decrypted conversation message but was not a let me in response messageType: %d";
            id v39 = v37;
            uint32_t v40 = 8;
            goto LABEL_42;
          }
        }

        else
        {
          id v36 = sub_1001704C4();
          __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            __int128 v38 = "[WARN] Could not decrypt let me in response";
            id v39 = v37;
            uint32_t v40 = 2;
LABEL_42:
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
          }
        }

        goto LABEL_44;
      }

      id v28 = sub_1001704C4();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = -[os_log_s letMeInRequestState](v12, "letMeInRequestState");
        *(_DWORD *)buf = 134217984;
        id v45 = v29;
        __int128 v25 = "[WARN] Pending conversation's let me in request state is %ld instead of Requested";
        goto LABEL_23;
      }
    }

    else
    {
      id v27 = sub_1001704C4();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v10;
        __int128 v25 = "[WARN] No pending conversation found for link %@";
LABEL_23:
        id v26 = v20;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
      }
    }

- (void)handleReceivedLetMeInRequest:(id)a3 toPseudonym:(id)a4 fromHandle:(id)a5 responseKeyData:(id)a6 dateInitiated:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v17);

  if (-[CSDConversationManager _linksEnabled](self, "_linksEnabled"))
  {
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000DA6E4;
    v20[3] = &unk_1003D9BC8;
    v20[4] = self;
    id v21 = v13;
    id v22 = v14;
    id v23 = v15;
    id v24 = v12;
    id v25 = v16;
    [v18 getLinkDescriptorWithPseudonym:v19 includeInactive:0 completionHandler:v20];
  }
}

- (void)handleReceivedLetMeInResponse:(id)a3 pendingConversation:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  if (-[CSDConversationManager _linksEnabled](self, "_linksEnabled"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 tuConversationLink]);
    if (v12 && [v8 hasIsLetMeInApproved])
    {
      if ([v8 isLetMeInApproved])
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 conversationGroupUUID]);

        if (!v13) {
          goto LABEL_8;
        }
      }

      else
      {
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue([v9 link]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v8 tuConversationLink]);
      unsigned __int8 v26 = [v24 isEquivalentToConversationLink:v25];

      if ((v26 & 1) == 0)
      {
        id v34 = sub_1001704C4();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v45) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Let me in response is not for the provided pending conversation. Ignoring.",  (uint8_t *)&v45,  2u);
        }

        goto LABEL_21;
      }

      id v27 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);
      if ([v27 destinationIdIsPseudonym])
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v9 link]);
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 pseudonym]);
        int v30 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);
        unsigned __int8 v31 = [v29 isEqualToString:v30];

        if ((v31 & 1) == 0)
        {
          id v32 = sub_1001704C4();
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          id v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 link]);
          unsigned int v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString pseudonym](v16, "pseudonym"));
          __int128 v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 value]);
          int v45 = 138412546;
          __int16 v46 = v18;
          __int16 v47 = 2112;
          id v48 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Let me in response is not from the pseudonym defined in the link %@, instead is from %@",  (uint8_t *)&v45,  0x16u);

          goto LABEL_20;
        }
      }

      else
      {
      }

      if ([v8 isLetMeInApproved])
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v9 link]);
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v8 tuConversationLink]);
        unsigned __int8 v37 = [v35 isEqualToConversationLink:v36];

        if ((v37 & 1) == 0)
        {
          __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v8 tuConversationLink]);
          id v39 = [v38 copy];
          [v9 setLink:v39];
        }

        uint32_t v40 = (void *)objc_claimAutoreleasedReturnValue([v8 conversationGroupUUID]);
        [v9 setConversationGroupUUID:v40];

        id v41 = (void *)objc_claimAutoreleasedReturnValue([v8 tuConversationLink]);
        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v41 originatorHandle]);
        [v9 setApproverHandle:v42];
      }

      else
      {
        -[CSDConversationManager notifyDelegatesOfLetMeInRejectedForPendingConversation:]( self,  "notifyDelegatesOfLetMeInRejectedForPendingConversation:",  v9);
      }

      id v43 = sub_1001704C4();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      else {
        uint64_t v44 = @"NO";
      }
      id v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 conversationGroupUUID]);
      unsigned int v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 approverHandle]);
      int v45 = 138543874;
      __int16 v46 = v44;
      __int16 v47 = 2112;
      id v48 = v16;
      __int16 v49 = 2112;
      id v50 = v18;
      id v21 = "Finished processing let me in response (approved: %{public}@) for groupUUID: %@. Approver handle is %@.";
      id v22 = v15;
      uint32_t v23 = 32;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v45, v23);
LABEL_20:

      goto LABEL_21;
    }

LABEL_8:
    id v14 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      goto LABEL_22;
    }

    id v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 conversationGroupUUID]);
    if (v16) {
      id v17 = @"NO";
    }
    else {
      id v17 = @"YES";
    }
    unsigned int v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 tuConversationLink]);
    if (v18) {
      id v19 = @"NO";
    }
    else {
      id v19 = @"YES";
    }
    int v45 = 138544130;
    else {
      id v20 = @"YES";
    }
    __int16 v46 = v17;
    __int16 v47 = 2114;
    id v48 = v19;
    __int16 v49 = 2114;
    id v50 = v20;
    __int16 v51 = 2112;
    id v52 = v8;
    id v21 = "[WARN] Ignoring let me in response message, as it is missing a groupUUID (%{public}@), missing a link (%{publi"
          "c}@), or does not specify approval/rejection (%{public}@): %@";
    id v22 = v15;
    uint32_t v23 = 42;
    goto LABEL_19;
  }

- (void)handleReceivedLinkCreatedOrChangedMessage:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DB270;
  block[3] = &unk_1003D7828;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleReceivedLinkInvalidatedMessage:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DBDE8;
  block[3] = &unk_1003D7828;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeLink:(id)a3 reason:(int64_t)a4
{
}

- (void)removeLink:(id)a3 reason:(int64_t)a4 withConversation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000DC2D0;
  v13[3] = &unk_1003D9C40;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 removeLink:v12 deleteReason:a4 completionHandler:v13];
}

- (void)handleReceivedLMIDelegateMessage:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (-[CSDConversationManager _linksEnabled](self, "_linksEnabled"))
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 conversationGroupUUID]);
    if (!v9)
    {
      id v17 = sub_1001704C4();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v45) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Dismissing let me in delegation because no groupUUID was set",  (uint8_t *)&v45,  2u);
      }

      goto LABEL_38;
    }

    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationWithGroupUUID:](self, "conversationWithGroupUUID:", v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 letMeInDelegationHandle]);
    id v12 = (void *)IDSCopyRawAddressForDestination(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v12));

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUPrivacyManager sharedPrivacyManager](&OBJC_CLASS___TUPrivacyManager, "sharedPrivacyManager"));
    LODWORD(v12) = [v14 isIncomingCommunicationBlockedForHandle:v13];

    if ((_DWORD)v12)
    {
      id v15 = sub_1001704C4();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v45 = 138412546;
        __int16 v46 = v13;
        __int16 v47 = 2112;
        id v48 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[WARN] Dismissing let me in delegation because the forHandle is blocked {forHandle: %@, fromHandle: %@}",  (uint8_t *)&v45,  0x16u);
      }

      goto LABEL_37;
    }

    if (v13)
    {
      unsigned int v18 = objc_alloc(&OBJC_CLASS___TUConversationMember);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 nickname]);
      id v16 = -[TUConversationMember initWithHandle:nickname:joinedFromLetMeIn:]( v18,  "initWithHandle:nickname:joinedFromLetMeIn:",  v13,  v19,  1LL);

      if ([v6 type] == 14)
      {
        id v20 = objc_alloc(&OBJC_CLASS___NSUUID);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 letMeInDelegationUUID]);
        id v22 = -[NSUUID initWithUUIDString:](v20, "initWithUUIDString:", v21);

        id v23 = sub_1001704C4();
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v25)
          {
            int v45 = 138412802;
            __int16 v46 = v7;
            __int16 v47 = 2112;
            id v48 = v13;
            __int16 v49 = 2112;
            id v50 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received LMI delegation message! {fromHandle: %@, forHandle: %@, transactionUUID: %@}",  (uint8_t *)&v45,  0x20u);
          }

          -[CSDConversationManager handleDelegatedPendingMemberIfNecessary:conversation:groupUUID:fromHandle:transactionUUID:]( self,  "handleDelegatedPendingMemberIfNecessary:conversation:groupUUID:fromHandle:transactionUUID:",  v16,  v10,  v9,  v7,  v22);
          goto LABEL_36;
        }

        if (v25)
        {
          id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 letMeInDelegationUUID]);
          int v45 = 138412546;
          __int16 v46 = v7;
          __int16 v47 = 2112;
          id v48 = v41;
          unsigned int v42 = "Received LMI delegation, unable to parse transactionUUID -- ignoring! {fromHandle: %@, message.letMeInDe"
                "legationUUID: %@}";
LABEL_34:
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v45, 0x16u);

          goto LABEL_35;
        }

        goto LABEL_35;
      }

      if ([v6 type] == 15)
      {
        if (v10)
        {
          unsigned __int8 v31 = objc_alloc(&OBJC_CLASS___NSUUID);
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v6 letMeInDelegationUUID]);
          id v22 = -[NSUUID initWithUUIDString:](v31, "initWithUUIDString:", v32);

          if (v22)
          {
            unsigned __int8 v33 = [v6 hasIsLetMeInApproved];
            id v34 = sub_1001704C4();
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            BOOL v35 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
            if ((v33 & 1) != 0)
            {
              if (v35)
              {
                unsigned int v36 = [v6 isLetMeInApproved];
                unsigned __int8 v37 = @"NO";
                int v45 = 138413058;
                __int16 v46 = v7;
                __int16 v47 = 2112;
                if (v36) {
                  unsigned __int8 v37 = @"YES";
                }
                id v48 = v13;
                __int16 v49 = 2112;
                id v50 = v22;
                __int16 v51 = 2112;
                id v52 = v37;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received LMI delegation response message! {fromHandle: %@, forHandle: %@, transactionUUID: %@, message .letMeInApproval: %@}",  (uint8_t *)&v45,  0x2Au);
              }

              unsigned int v38 = [v6 isLetMeInApproved];
              id v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager pendingMembershipTracker](self, "pendingMembershipTracker"));
              uint32_t v40 = v39;
              if (v38) {
                [v39 handleRemoteApprovalOfMember:v16 forConversation:v10 from:v7 transactionUUID:v22];
              }
              else {
                [v39 handleRemoteRejectionOfMember:v16 forConversation:v10 from:v7 transactionUUID:v22];
              }

              goto LABEL_36;
            }

            if (v35)
            {
              int v45 = 138412802;
              __int16 v46 = v7;
              __int16 v47 = 2112;
              id v48 = v13;
              __int16 v49 = 2112;
              id v50 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received LMI delegation response message, without letMeInApproval -- dropping! {fromHandle: %@, forHandl e: %@, transactionUUID: %@}",  (uint8_t *)&v45,  0x20u);
            }

            goto LABEL_35;
          }

          id v44 = sub_1001704C4();
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 letMeInDelegationUUID]);
            int v45 = 138412546;
            __int16 v46 = v7;
            __int16 v47 = 2112;
            id v48 = v41;
            unsigned int v42 = "Received LMI delegation response, unable to parse transactionUUID -- ignoring! {fromHandle: %@, messag"
                  "e.letMeInDelegationUUID: %@}";
            goto LABEL_34;
          }

- (void)handleDelegatedPendingMemberIfNecessary:(id)a3 conversation:(id)a4 groupUUID:(id)a5 fromHandle:(id)a6 transactionUUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteMembers]);
  id v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    while (2)
    {
      id v19 = 0LL;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v31 + 1) + 8 * (void)v19) handle]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 handle]);
        unsigned __int8 v22 = [v20 isEquivalentToHandle:v21];

        if ((v22 & 1) != 0)
        {

          id v27 = sub_1001704C4();
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1002B5244(v12, v23);
          }
          BOOL v25 = v29;
          id v24 = v30;
          id v26 = v28;
          goto LABEL_13;
        }

        id v19 = (char *)v19 + 1;
      }

      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  [v13 setHasReceivedLetMeInRequest:1];
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager notifyPendingMembershipTrackerOfDelegatedMember]( self,  "notifyPendingMembershipTrackerOfDelegatedMember"));
  BOOL v25 = v29;
  id v24 = v30;
  id v26 = v28;
  (*((void (**)(os_log_s *, id, id, id, id, id))v23 + 2))(v23, v12, v13, v30, v29, v28);
LABEL_13:
}

- (BOOL)sendMessagesForCreatedOrChangedLink:(id)a3 conversation:(id)a4 messageType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  if (!v9
    || (id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 remoteMembers]),
        -[dispatch_queue_s count](v10, "count")))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 invitedMemberHandles]);
    id v12 = [v11 count];

    if (v9)
    {

      if (!v12) {
        goto LABEL_28;
      }
      id v13 = v9;
    }

    else
    {
      if (!v12) {
        goto LABEL_28;
      }
      id v13 = v8;
    }

    uint64_t v73 = objc_claimAutoreleasedReturnValue([v13 groupUUID]);
    id v14 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage),  "initWithType:groupUUID:link:",  v5,  v73,  v8);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage link](v14, "link"));
    [v15 setIsActivated:1];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 originatorHandle]);
    if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 originatorHandle]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v17));
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage link](v14, "link"));
      [v19 setOriginatorHandle:v18];
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDate]);

    if (v20)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDate]);
      [v21 timeIntervalSince1970];
      double v23 = v22;
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage link](v14, "link"));
      [v24 setCreationDateEpochTime:v23];
    }

    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v8 expirationDate]);

    if (v25)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v8 expirationDate]);
      [v26 timeIntervalSince1970];
      double v28 = v27;
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage link](v14, "link"));
      [v29 setPseudonymExpirationDateEpochTime:v28];
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 invitedMemberHandles]);

    id v74 = self;
    if (v30)
    {
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v8 invitedMemberHandles]);
      id v32 = [v31 countByEnumeratingWithState:&v83 objects:v89 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v84;
        do
        {
          for (i = 0LL; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v84 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v83 + 1) + 8LL * (void)i);
            unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage link](v14, "link"));
            unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v36));
            [v37 addInvitedHandles:v38];
          }

          id v33 = [v31 countByEnumeratingWithState:&v83 objects:v89 count:16];
        }

        while (v33);
      }

      self = v74;
    }

    id v39 = (void *)objc_claimAutoreleasedReturnValue([v8 linkName]);

    if (v39)
    {
      uint32_t v40 = (void *)objc_claimAutoreleasedReturnValue([v8 linkName]);
      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage link](v14, "link"));
      [v41 setLinkName:v40];
    }

    unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v14, "data"));
    if (v9)
    {
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v9 localMember]);
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 handle]);
      uint64_t v45 = objc_claimAutoreleasedReturnValue([v44 value]);
    }

    else
    {
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v8 originatorHandle]);
      uint64_t v45 = objc_claimAutoreleasedReturnValue([v43 value]);
    }

    id v50 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
    __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v50 accountWithCallerID:v45]);

    id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    unsigned int v72 = (void *)v45;
    if (v9)
    {
      __int128 v81 = 0uLL;
      __int128 v82 = 0uLL;
      __int128 v79 = 0uLL;
      __int128 v80 = 0uLL;
      id v53 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteMembers]);
      id v54 = [v53 countByEnumeratingWithState:&v79 objects:v88 count:16];
      if (v54)
      {
        id v55 = v54;
        __int16 v71 = v42;
        uint64_t v56 = *(void *)v80;
        do
        {
          for (j = 0LL; j != v55; j = (char *)j + 1)
          {
            if (*(void *)v80 != v56) {
              objc_enumerationMutation(v53);
            }
            __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v79 + 1) + 8 * (void)j) idsDestination]);
            [v52 addObject:v58];
          }

          id v55 = [v53 countByEnumeratingWithState:&v79 objects:v88 count:16];
        }

        while (v55);
LABEL_48:
        unsigned int v42 = v71;
      }
    }

    else
    {
      __int128 v77 = 0uLL;
      __int128 v78 = 0uLL;
      __int128 v75 = 0uLL;
      __int128 v76 = 0uLL;
      id v53 = (void *)objc_claimAutoreleasedReturnValue([v8 invitedMemberHandles]);
      id v59 = [v53 countByEnumeratingWithState:&v75 objects:v87 count:16];
      if (v59)
      {
        id v60 = v59;
        __int16 v71 = v42;
        uint64_t v61 = *(void *)v76;
        do
        {
          for (k = 0LL; k != v60; k = (char *)k + 1)
          {
            if (*(void *)v76 != v61) {
              objc_enumerationMutation(v53);
            }
            uint64_t v63 = TUCopyIDSCanonicalAddressForHandle(*(void *)(*((void *)&v75 + 1) + 8LL * (void)k));
            id v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
            [v52 addObject:v64];
          }

          id v60 = [v53 countByEnumeratingWithState:&v75 objects:v87 count:16];
        }

        while (v60);
        goto LABEL_48;
      }
    }

    if (v9)
    {
      v65 = (TUConversationMember *)objc_claimAutoreleasedReturnValue([v9 localMember]);
    }

    else
    {
      id v66 = objc_alloc(&OBJC_CLASS___TUConversationMember);
      __int16 v67 = (void *)objc_claimAutoreleasedReturnValue([v8 originatorHandle]);
      v65 = -[TUConversationMember initWithHandle:](v66, "initWithHandle:", v67);
    }

    id v68 = (uint64_t (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager sendDataBlock](v74, "sendDataBlock"));
    __int16 v69 = (void *)objc_claimAutoreleasedReturnValue([v9 capabilitySendMessageOptions]);
    char v49 = ((uint64_t (**)(void, void *, void *, void *, TUConversationMember *, void *, void, void, void))v68)[2]( v68,  v42,  v51,  v52,  v65,  v69,  0LL,  0LL,  0LL);

    __int16 v47 = (os_log_s *)v73;
    goto LABEL_53;
  }

LABEL_28:
  id v46 = sub_1001704C4();
  __int16 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    *(_DWORD *)buf = 138412546;
    id v91 = v8;
    __int16 v92 = 2112;
    unsigned int v93 = v48;
    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "No invited members or conversation members were specified; no need to send messages (link: %@, conversation UUID: %@)",
      buf,
      0x16u);
  }

  char v49 = 0;
LABEL_53:

  return v49;
}

- (BOOL)sendMessagesForInvalidatedLink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 groupUUID]);
  id v8 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:](v6, "initWithType:groupUUID:link:", 24LL, v7, v4);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 originatorHandle]);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 originatorHandle]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage link](v8, "link"));
    [v12 setOriginatorHandle:v11];
  }

  id v32 = v8;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v8, "data"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 originatorHandle]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 accountWithCallerID:v16]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 invitedMemberHandles]);
  id v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      double v23 = 0LL;
      do
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = TUCopyIDSCanonicalAddressForHandle(*(void *)(*((void *)&v33 + 1) + 8LL * (void)v23));
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        [v18 addObject:v25];

        double v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v21);
  }

  id v26 = objc_alloc(&OBJC_CLASS___TUConversationMember);
  double v27 = (void *)objc_claimAutoreleasedReturnValue([v4 originatorHandle]);
  double v28 = -[TUConversationMember initWithHandle:](v26, "initWithHandle:", v27);

  id v29 = (uint64_t (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager sendDataBlock](self, "sendDataBlock"));
  char v30 = ((uint64_t (**)(void, void *, void *, void *, TUConversationMember *, void, void, void, void))v29)[2]( v29,  v13,  v17,  v18,  v28,  0LL,  0LL,  0LL,  0LL);

  return v30;
}

- (void)requestParticipant:(id)a3 toScreenShareWithRequest:(id)a4 conversation:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v11 = [v10 requestToScreenShareEnabled];

  if (v11)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
    dispatch_assert_queue_V2(v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 groupUUID]);
    id v14 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage),  "initWithType:groupUUID:link:",  35LL,  v13,  0LL);
    id v15 = -[CSDMessagingScreenShareContext initOutgoingRequestWithScreenSharingRequest:]( objc_alloc(&OBJC_CLASS___CSDMessagingScreenShareContext),  "initOutgoingRequestWithScreenSharingRequest:",  v8);
    -[CSDMessagingConversationMessage setScreenShareContext:](v14, "setScreenShareContext:", v15);
    -[CSDConversationManager sendDataForScreenShareMessage:toParticipant:conversation:]( self,  "sendDataForScreenShareMessage:toParticipant:conversation:",  v14,  v16,  v9);
  }
}

- (void)requestParticipant:(id)a3 toCancelScreenShareRequest:(id)a4 conversation:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v11 = [v10 requestToScreenShareEnabled];

  if (v11)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
    dispatch_assert_queue_V2(v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 groupUUID]);
    id v14 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage),  "initWithType:groupUUID:link:",  35LL,  v13,  0LL);
    id v15 = -[CSDMessagingScreenShareContext initOutgoingRequestWithScreenSharingRequest:]( objc_alloc(&OBJC_CLASS___CSDMessagingScreenShareContext),  "initOutgoingRequestWithScreenSharingRequest:",  v8);
    [v15 setType:2];
    -[CSDMessagingConversationMessage setScreenShareContext:](v14, "setScreenShareContext:", v15);
    -[CSDConversationManager sendDataForScreenShareMessage:toParticipant:conversation:]( self,  "sendDataForScreenShareMessage:toParticipant:conversation:",  v14,  v16,  v9);
  }
}

- (void)denyScreenShareRequestFrom:(id)a3 screenShareRequest:(id)a4 conversation:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v11 = [v10 requestToScreenShareEnabled];

  if (v11)
  {
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
    dispatch_assert_queue_V2(v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 groupUUID]);
    id v14 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage),  "initWithType:groupUUID:link:",  36LL,  v13,  0LL);
    id v15 = -[CSDMessagingScreenShareContext initOutgoingRequestWithScreenSharingRequest:]( objc_alloc(&OBJC_CLASS___CSDMessagingScreenShareContext),  "initOutgoingRequestWithScreenSharingRequest:",  v8);
    [v15 setType:3];
    -[CSDMessagingConversationMessage setScreenShareContext:](v14, "setScreenShareContext:", v15);
    -[CSDConversationManager sendDataForScreenShareMessage:toParticipant:conversation:]( self,  "sendDataForScreenShareMessage:toParticipant:conversation:",  v14,  v16,  v9);
  }
}

- (void)sendDataForScreenShareMessage:(id)a3 toParticipant:(id)a4 conversation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 localMember]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountWithCallerID:v13]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 localMember]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 activeIDSDestination]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v17));
  id v19 = sub_1001704C4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v8;
    __int16 v26 = 2112;
    double v27 = v13;
    __int16 v28 = 2112;
    id v29 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Sending screen share request message %@ from handle %@ to handle %@",  buf,  0x20u);
  }

  id v21 = (void (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager sendDataBlock](self, "sendDataBlock"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);
  double v23 = (void *)objc_claimAutoreleasedReturnValue([v9 capabilitySendMessageOptions]);
  ((void (**)(void, void *, void *, void *, void *, void *, void, void, void))v21)[2]( v21,  v22,  v15,  v18,  v16,  v23,  0LL,  0LL,  0LL);
}

- (void)handleReceivedUpdateJoinedMetadataMessage:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v10 = [v9 conversationHandoffEnabled];

  if (v10)
  {
    if (!-[CSDConversationManager isValidLocalHandle:](self, "isValidLocalHandle:", v7))
    {
      id v39 = sub_1001704C4();
      unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v58 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] UpdateJoinedMetadata conversation message was sent by a non-local handle %@, dropping message.",  buf,  0xCu);
      }

      goto LABEL_37;
    }

    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 conversationGroupUUID]);
    if (!v11)
    {
      id v40 = sub_1001704C4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] UpdateJoinedMetadata conversation message was missing a group UUID, dropping message.",  buf,  2u);
      }

      goto LABEL_36;
    }

    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 joinedMetadata]);
    id v13 = v12;
    if (!v12)
    {
      id v41 = sub_1001704C4();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] UpdateJoinedMetadata conversation message was missing a joined metadata object, dropping message.",  buf,  2u);
      }

      goto LABEL_35;
    }

    id v52 = v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s sender](v12, "sender"));
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 csdConversationParticipant]);

    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s sender](v52, "sender"));
      if ([v16 hasIdentifier])
      {
        id v17 = -[os_log_s identifier](v15, "identifier");

        if (v17)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationWithGroupUUID:](self, "conversationWithGroupUUID:", v11));
          __int16 v51 = v18;
          if (!v18)
          {
            id v44 = sub_1001704C4();
            __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v58 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[WARN] No conversation was found for group UUID %@, dropping UpdateJoinedMetadata message.",  buf,  0xCu);
            }

            id v13 = v52;
            goto LABEL_50;
          }

          id v50 = v11;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 activeRemoteParticipants]);
          id v20 = [v19 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (v20)
          {
            id v21 = v20;
            id v48 = v7;
            id v49 = v6;
            char v22 = 0;
            uint64_t v23 = *(void *)v54;
            do
            {
              for (i = 0LL; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v54 != v23) {
                  objc_enumerationMutation(v19);
                }
                id v25 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
                __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s handle](v15, "handle"));
                double v27 = (void *)objc_claimAutoreleasedReturnValue([v25 handle]);
                if ([v26 isEquivalentToHandle:v27])
                {
                  id v28 = -[os_log_s identifier](v15, "identifier");
                  LOBYTE(v28) = v28 == [v25 identifier];

                  v22 |= v28;
                }

                else
                {
                }
              }

              id v21 = [v19 countByEnumeratingWithState:&v53 objects:v63 count:16];
            }

            while (v21);

            id v7 = v48;
            id v6 = v49;
            if ((v22 & 1) != 0)
            {
              id v13 = v52;
              id v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s audioRouteUniqueIdentifier](v52, "audioRouteUniqueIdentifier"));

              id v30 = sub_1001704C4();
              __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
              if (v29)
              {
                unsigned int v11 = v50;
                if (v32)
                {
                  __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s audioRouteUniqueIdentifier](v52, "audioRouteUniqueIdentifier"));
                  id v34 = -[os_log_s identifier](v15, "identifier");
                  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v51 UUID]);
                  *(_DWORD *)buf = 138412802;
                  __int128 v58 = v33;
                  __int16 v59 = 2048;
                  id v60 = v34;
                  __int16 v61 = 2112;
                  __int128 v62 = v35;
                  _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Per UpdateJoinedMetadata message, the local user was using %@ audio route from another device with p articipant identifier %llu in conversation UUID %@",  buf,  0x20u);

                  id v13 = v52;
                }

                __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s audioRouteUniqueIdentifier](v13, "audioRouteUniqueIdentifier"));
                unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v51 audioRoutesByParticipantIdentifier]);
                unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[os_log_s identifier](v15, "identifier")));
                [v37 setObject:v36 forKeyedSubscript:v38];
              }

              else
              {
                unsigned int v11 = v50;
                if (v32)
                {
                  id v46 = (os_log_s *)-[os_log_s identifier](v15, "identifier");
                  __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v51 UUID]);
                  *(_DWORD *)buf = 134218242;
                  __int128 v58 = v46;
                  __int16 v59 = 2112;
                  id v60 = v47;
                  _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Per UpdateJoinedMetadata message, the local user was using a default audio route from another device with participant identifier %llu in conversation UUID %@; no need to track a route.",
                    buf,
                    0x16u);
                }

                __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v51 audioRoutesByParticipantIdentifier]);
                unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[os_log_s identifier](v15, "identifier")));
                -[os_log_s setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", 0LL, v37);
              }

LABEL_50:
              id v43 = v51;
LABEL_34:

LABEL_35:
LABEL_36:

LABEL_37:
              goto LABEL_38;
            }
          }

          else
          {
          }

          id v45 = sub_1001704C4();
          __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          id v13 = v52;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            __int128 v58 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find a matching participant for sender %@, dropping UpdateJoinedMetadata message.",  buf,  0xCu);
          }

          unsigned int v11 = v50;
          goto LABEL_50;
        }
      }

      else
      {
      }
    }

    id v42 = sub_1001704C4();
    id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v43,  OS_LOG_TYPE_DEFAULT,  "[WARN] UpdateJoinedMetadata conversation message was missing a valid participant, dropping message.",  buf,  2u);
    }

    id v13 = v52;
    goto LABEL_34;
  }

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5 fromMember:(id)a6 additionalOptions:(id)a7 isBlobResponse:(BOOL)a8 callback:(id)a9
{
  BOOL v66 = a8;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  id v18 = a7;
  id v69 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  if ([v19 groupFacetimeAsAServiceEnabled])
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 provider]);

    if (v20)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
      char v22 = (void *)objc_claimAutoreleasedReturnValue([v14 provider]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 serviceForProvider:v22]);

      goto LABEL_6;
    }
  }

  else
  {
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
LABEL_6:
  v70 = v16;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v16 handle]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 value]);
  uint64_t v26 = objc_claimAutoreleasedReturnValue([v23 accountWithCallerID:v25]);

  id v27 = sub_1001704C4();
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = TULoggableStringForHandle(v15);
    id v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v29);
    *(_DWORD *)buf = 138412546;
    uint64_t v73 = v26;
    __int16 v74 = 2112;
    __int128 v75 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Sending data from: %@ to: %@", buf, 0x16u);
  }

  __int128 v31 = (NSMutableDictionary *)[v18 mutableCopy];
  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v14 capabilitySendMessageOptions]);

  __int16 v71 = v15;
  __int16 v67 = (void *)v26;
  id v68 = v23;
  if (v32)
  {
    if (!v31) {
      __int128 v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v14 capabilitySendMessageOptions]);
    uint64_t v34 = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( [v33 objectForKeyedSubscript:IDSSendMessageOptionRequireAllRegistrationPropertiesKey]);
    __int128 v36 = v35;
    if (v35) {
      id v37 = v35;
    }
    else {
      id v37 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    id v42 = v37;
    id v43 = self;

    id v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v34));
    id v45 = v17;
    if (v44)
    {
      id v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v34));
      uint64_t v47 = objc_claimAutoreleasedReturnValue([v42 setByAddingObjectsFromSet:v46]);

      id v42 = (void *)v47;
    }

    id v48 = (void *)objc_claimAutoreleasedReturnValue([v14 capabilitySendMessageOptions]);
    uint64_t v49 = IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey;
    id v50 = (void *)objc_claimAutoreleasedReturnValue( [v48 objectForKeyedSubscript:IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey]);
    __int16 v51 = v50;
    if (v50) {
      id v52 = v50;
    }
    else {
      id v52 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    __int128 v53 = v52;

    __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v49));
    if (v54)
    {
      __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v49));
      uint64_t v56 = objc_claimAutoreleasedReturnValue([v53 setByAddingObjectsFromSet:v55]);

      __int128 v53 = (void *)v56;
    }

    __int128 v57 = v45;
    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v14 capabilitySendMessageOptions]);
    -[NSMutableDictionary addEntriesFromDictionary:](v31, "addEntriesFromDictionary:", v58);

    self = v43;
    if ([v42 count]) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v42, v34);
    }
    if ([v53 count]) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v53, v49);
    }
    if (v66)
    {
      id v59 = sub_1001704C4();
      id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v73 = v34;
        __int16 v74 = 2112;
        __int128 v75 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "blob response, removing %@ from options: %@",  buf,  0x16u);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", 0LL, v34);
    }

    id v39 = v14;
    id v40 = v57;

    id v41 = v71;
  }

  else
  {
    id v38 = v15;
    id v39 = v14;
    id v40 = v17;
    id v41 = v38;
  }

  __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v39 groupUUID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v61,  @"kCSDConversationGroupUUID");

  __int128 v62 = (uint64_t (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager sendDataBlock](self, "sendDataBlock"));
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v41));
  id v64 = (void *)objc_claimAutoreleasedReturnValue([v39 provider]);
  LOBYTE(v61) = ((uint64_t (**)(void, id, void *, void *, void *, NSMutableDictionary *, void, void *, void *))v62)[2]( v62,  v69,  v67,  v63,  v70,  v31,  0LL,  v40,  v64);

  return (char)v61;
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5 fromMember:(id)a6
{
  return -[CSDConversationManager sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:]( self,  "sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:",  a3,  a4,  a5,  a6,  0LL,  0LL,  0LL);
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toDestinationID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 localMember]);
  LOBYTE(self) = -[CSDConversationManager sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:]( self,  "sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:",  v10,  v9,  v8,  v11,  0LL,  0LL,  0LL);

  return (char)self;
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toHandle:(id)a5
{
  return -[CSDConversationManager sendData:onConversation:toHandle:isBlobResponse:]( self,  "sendData:onConversation:toHandle:isBlobResponse:",  a3,  a4,  a5,  0LL);
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toHandle:(id)a5 isBlobResponse:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = TUCopyIDSCanonicalAddressForHandle(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 localMember]);
    BOOL v16 = -[CSDConversationManager sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:]( self,  "sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:",  v10,  v11,  v14,  v15,  0LL,  v6,  0LL);
  }

  else
  {
    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not convert %@ to IDS destination",  buf,  0xCu);
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toMember:(id)a5 additionalOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDestination]);
  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDestination]);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v11 localMember]);
    BOOL v17 = -[CSDConversationManager sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:]( self,  "sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:",  v10,  v11,  v15,  v16,  v13,  0LL,  0LL);
  }

  else
  {
    id v18 = sub_1001704C4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not convert %@ to IDS destination",  buf,  0xCu);
    }

    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)sendData:(id)a3 onConversation:(id)a4 toMember:(id)a5
{
  return -[CSDConversationManager sendData:onConversation:toMember:additionalOptions:]( self,  "sendData:onConversation:toMember:additionalOptions:",  a3,  a4,  a5,  0LL);
}

- (BOOL)broadcastFile:(id)a3 onConversation:(id)a4 additionalOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 localMember]);
  id v12 = v11;
  if (v11)
  {
    __int16 v61 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 idsDestination]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v13));

    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteMembers]);
    id v16 = [v15 countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v69;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v69 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v68 + 1) + 8 * (void)i) idsDestination]);
          [v14 addObject:v20];
        }

        id v17 = [v15 countByEnumeratingWithState:&v68 objects:v77 count:16];
      }

      while (v17);
    }

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 lightweightMembers]);
    id v22 = [v21 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v65;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v65 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v64 + 1) + 8 * (void)j) idsDestination]);
          [v14 addObject:v26];
        }

        id v23 = [v21 countByEnumeratingWithState:&v64 objects:v76 count:16];
      }

      while (v23);
    }

    id v27 = sub_1001704C4();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v61 idsFromID]);
      uint64_t v30 = TULoggableStringForHandle(v29);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v14 allObjects]);
      uint64_t v33 = TULoggableStringForHandles(v32);
      id v34 = v8;
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v33);
      *(_DWORD *)buf = 138412546;
      id v73 = v31;
      __int16 v74 = 2112;
      __int128 v75 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Broadcasting file from: %@ to: %@",  buf,  0x16u);

      id v8 = v34;
    }

    id v36 = [v10 mutableCopy];
    id v37 = v36;
    if (v36) {
      id v38 = (NSMutableDictionary *)v36;
    }
    else {
      id v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v41 = v38;

    id v42 = (void *)objc_claimAutoreleasedReturnValue([v9 capabilitySendMessageOptions]);
    if (v42)
    {
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v9 capabilitySendMessageOptions]);
      -[NSMutableDictionary addEntriesFromDictionary:](v41, "addEntriesFromDictionary:", v43);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v41,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  IDSSendMessageOptionAlwaysSkipSelfKey);
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v61 idsFromID]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v41,  "setObject:forKeyedSubscript:",  v44,  IDSSendMessageOptionFromIDKey);

    id v45 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
    id v60 = v10;
    if ([v45 groupFacetimeAsAServiceEnabled])
    {
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);

      if (v46)
      {
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
        id v48 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v47 serviceForProvider:v48]);

LABEL_31:
        id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 service]);
        id v51 = v8;
        id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
        id v62 = 0LL;
        id v63 = 0LL;
        unsigned __int8 v53 = [v50 sendResourceAtURL:v52 metadata:0 toDestinations:v14 priority:300 options:v41 identifier:&v63 error:&v62];
        id v54 = v63;
        id v55 = v62;

        if (v55) {
          BOOL v40 = 0;
        }
        else {
          BOOL v40 = v53;
        }
        id v56 = sub_1001704C4();
        __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        __int128 v58 = v57;
        if (v40)
        {
          id v12 = v61;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v73 = v54;
            _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Sent broadcast image message with id %@",  buf,  0xCu);
          }
        }

        else
        {
          id v12 = v61;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
            sub_1002B5324();
          }
        }

        id v8 = v51;
        id v10 = v60;
        goto LABEL_40;
      }
    }

    else
    {
    }

    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
    goto LABEL_31;
  }

  id v39 = sub_1001704C4();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
    sub_1002B52C4();
  }
  BOOL v40 = 0;
LABEL_40:

  return v40;
}

- (BOOL)broadcastData:(id)a3 onConversation:(id)a4 additionalOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v49 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  if ([v10 groupFacetimeAsAServiceEnabled])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceForProvider:v13]);

      goto LABEL_6;
    }
  }

  else
  {
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
LABEL_6:
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 localMember]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 handle]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 value]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 accountWithCallerID:v17]);

  if (v15)
  {
    uint64_t v47 = v14;
    id v48 = v8;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 idsDestination]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v19));

    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteMembers]);
    id v22 = [v21 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v55;
      do
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v55 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v54 + 1) + 8 * (void)i) idsDestination]);
          [v20 addObject:v26];
        }

        id v23 = [v21 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }

      while (v23);
    }

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v9 lightweightMembers]);
    id v28 = [v27 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v51;
      do
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v51 != v30) {
            objc_enumerationMutation(v27);
          }
          BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v50 + 1) + 8 * (void)j) idsDestination]);
          [v20 addObject:v32];
        }

        id v29 = [v27 countByEnumeratingWithState:&v50 objects:v62 count:16];
      }

      while (v29);
    }

    id v33 = sub_1001704C4();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v59 = v18;
      __int16 v60 = 2112;
      __int16 v61 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Broadcasting data from: %@ to: %@",  buf,  0x16u);
    }

    __int128 v35 = v49;
    id v36 = [v49 mutableCopy];
    id v37 = v36;
    if (v36) {
      id v38 = (NSMutableDictionary *)v36;
    }
    else {
      id v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v41 = v38;

    id v42 = (void *)objc_claimAutoreleasedReturnValue([v9 capabilitySendMessageOptions]);
    if (v42)
    {
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v9 capabilitySendMessageOptions]);
      -[NSMutableDictionary addEntriesFromDictionary:](v41, "addEntriesFromDictionary:", v43);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v41,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  IDSSendMessageOptionAlwaysSkipSelfKey);
    id v44 = (uint64_t (**)(void, void, void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager sendDataBlock](self, "sendDataBlock"));
    id v45 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);
    char v40 = ((uint64_t (**)(void, id, void *, void *, void *, NSMutableDictionary *, void, void, void *))v44)[2]( v44,  v48,  v18,  v20,  v15,  v41,  0LL,  0LL,  v45);

    id v8 = v48;
    id v14 = v47;
  }

  else
  {
    id v39 = sub_1001704C4();
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
      sub_1002B5384();
    }
    char v40 = 0;
    __int128 v35 = v49;
  }

  return v40;
}

- (BOOL)broadcastData:(id)a3 onConversation:(id)a4
{
  return -[CSDConversationManager broadcastData:onConversation:additionalOptions:]( self,  "broadcastData:onConversation:additionalOptions:",  a3,  a4,  0LL);
}

- (void)broadcastImageForSession:(id)a3 onConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v59 = v7;
    __int16 v60 = 2112;
    id v61 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "conversation: %@ broadcastImageForSession: %@",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 activity]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 imageData]);

  if (v13)
  {
    id v14 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 groupUUID]);
    id v16 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v14,  "initWithType:groupUUID:link:",  27LL,  v15,  0LL);

    id v17 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivitySession);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
    id v55 = v7;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
    -[CSDMessagingConversationActivitySession setIdentifierUUIDString:](v17, "setIdentifierUUIDString:", v19);

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 activity]);
    id v21 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivity);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 UUID]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
    -[CSDMessagingConversationActivity setIdentifierUUIDString:](v21, "setIdentifierUUIDString:", v23);

    uint64_t v24 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivityMetadata);
    __int128 v52 = v20;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 metadata]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 imageData]);
    id v27 = [v26 _FTCopyGzippedData];
    -[CSDMessagingConversationActivityMetadata setImage:](v24, "setImage:", v27);

    __int128 v54 = v24;
    -[CSDMessagingConversationActivity setActivityMetadata:](v21, "setActivityMetadata:", v24);
    -[CSDMessagingConversationActivitySession setActivity:](v17, "setActivity:", v21);
    __int128 v51 = v17;
    -[CSDMessagingConversationMessage addActivitySessions:](v16, "addActivitySessions:", v17);
    v64[0] = IDSSendMessageOptionPublicMessageIntentKey;
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[CSDMessagingConversationMessage type](v16, "type")));
    v65[0] = v28;
    v64[1] = IDSSendMessageOptionQueueOneIdentifierKey;
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 UUIDString]);
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[CSDMessagingConversationMessage type](v16, "type")));
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v30, v31));
    v65[1] = v32;
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v65,  v64,  2LL));

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager temporaryFilePath](self, "temporaryFilePath"));
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v16, "data"));
    id v57 = 0LL;
    [v35 writeToFile:v34 options:1073741825 error:&v57];
    id v36 = v57;

    __int128 v53 = (void *)v33;
    if (v36)
    {
      id v37 = sub_1001704C4();
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v49 = (void *)objc_claimAutoreleasedReturnValue([v6 activity]);
        __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 UUID]);
        *(_DWORD *)buf = 138412802;
        id v59 = v50;
        __int16 v60 = 2112;
        id v61 = v34;
        __int16 v62 = 2112;
        id v63 = v36;
        _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Error transmitting activity session %@ image. Failed to write to path %@ with error %@",  buf,  0x20u);
      }

      id v7 = v55;
      id v39 = v51;
      char v40 = v52;
    }

    else
    {
      id v7 = v55;
      unsigned int v41 = -[CSDConversationManager broadcastFile:onConversation:additionalOptions:]( self,  "broadcastFile:onConversation:additionalOptions:",  v34,  v55,  v33);
      id v42 = sub_1001704C4();
      id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = (void *)objc_claimAutoreleasedReturnValue([v6 activity]);
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 UUID]);
        *(_DWORD *)buf = 138412546;
        id v59 = v45;
        __int16 v60 = 1024;
        LODWORD(v61) = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "(broadcastImageForSession activity UUID: %@ success: %d).",  buf,  0x12u);

        id v7 = v55;
      }

      id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v56 = 0LL;
      [v46 removeItemAtPath:v34 error:&v56];
      id v38 = (os_log_s *)v56;

      id v39 = v51;
      if (v38)
      {
        id v47 = sub_1001704C4();
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        char v40 = v52;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_1002B53E4();
        }
      }

      else
      {
        char v40 = v52;
      }
    }
  }
}

- (void)broadcastLightweightEndorsementForAddedMembers:(id)a3 onConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "conversation: %@ broadcastLightweightEndorsementForAddedMembers: %@",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 localLightweightSecondaryMember]);
  if (v11)
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
      *(_DWORD *)buf = 138412546;
      id v28 = v14;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "conversation: %@ has a splitSessionSecondary (%@), sending verification push",  buf,  0x16u);
    }

    id v15 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 groupUUID]);
    id v17 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v15,  "initWithType:groupUUID:link:",  29LL,  v16,  0LL);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  v11));
    -[CSDMessagingConversationMessage addAddedMembers:](v17, "addAddedMembers:", v18);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v17, "data"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[CSDMessagingConversationMessage type](v17, "type", IDSSendMessageOptionPublicMessageIntentKey)));
    uint64_t v26 = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));

    unsigned int v22 = -[CSDConversationManager broadcastData:onConversation:additionalOptions:]( self,  "broadcastData:onConversation:additionalOptions:",  v19,  v7,  v21);
    id v23 = sub_1001704C4();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "(success: %d).", buf, 8u);
    }
  }
}

- (id)memberExistsForParticipantDestination:(id)a3 members:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = TUHandleForIDSCanonicalAddress(v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    id v19 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = TULoggableStringForHandle(v5);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138412290;
      id v34 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Couldn't create handle from participant destination identifier %@",  buf,  0xCu);
    }

- (id)memberExistsForParticipantDestination:(id)a3 groupSessionParticipantUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch((unint64_t)[v7 participantUpdateType])
  {
    case 0uLL:
      id v21 = sub_1001704C4();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received unknown participant update message",  (uint8_t *)&v29,  2u);
      }

      goto LABEL_11;
    case 1uLL:
    case 3uLL:
      id v8 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipantDidJoinContext);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 clientContextData]);
      id v10 = -[CSDMessagingConversationParticipantDidJoinContext initWithData:](v8, "initWithData:", v9);

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext data](v10, "data"));
      id v12 = [v11 length];

      if (v12)
      {
        if (-[CSDMessagingConversationParticipantDidJoinContext isLightweight](v10, "isLightweight")) {
          uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext tuLightweightMembers](v10, "tuLightweightMembers"));
        }
        else {
          uint64_t v13 = objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext tuConversationMembers]( v10,  "tuConversationMembers"));
        }
        id v15 = (void *)v13;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager memberExistsForParticipantDestination:members:]( self,  "memberExistsForParticipantDestination:members:",  v6,  v13));
LABEL_26:
      }

      else
      {
        id v24 = sub_1001704C4();
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Couldn't decode message due to invalid data length.",  (uint8_t *)&v29,  2u);
        }

LABEL_16:
        uint64_t v20 = 0LL;
      }

      return v20;
    case 2uLL:
    case 4uLL:
      id v10 = (CSDMessagingConversationParticipantDidJoinContext *)objc_claimAutoreleasedReturnValue([v7 groupUUID]);
      if (v10)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationWithGroupUUID:](self, "conversationWithGroupUUID:", v10));
        id v15 = v14;
        if (v14)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteMembers]);
          id v17 = [v16 mutableCopy];

          unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 localMember]);
          [v17 addObject:v18];

          id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 lightweightMembers]);
          [v17 unionSet:v19];

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager memberExistsForParticipantDestination:members:]( self,  "memberExistsForParticipantDestination:members:",  v6,  v17));
        }

        else
        {
          id v27 = sub_1001704C4();
          id v17 = (id)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
          {
            int v29 = 138412290;
            __int128 v30 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Couldn't find conversation with groupUUID %@",  (uint8_t *)&v29,  0xCu);
          }

          uint64_t v20 = 0LL;
        }
      }

      else
      {
        id v26 = sub_1001704C4();
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Couldn't decode message due to invalid groupUUID",  (uint8_t *)&v29,  2u);
        }

        uint64_t v20 = 0LL;
      }

      goto LABEL_26;
    default:
LABEL_11:
      id v23 = sub_1001704C4();
      id v10 = (CSDMessagingConversationParticipantDidJoinContext *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unable to find members from message",  (uint8_t *)&v29,  2u);
      }

      goto LABEL_16;
  }

- (BOOL)shouldAcceptMessageFromHandle:(id)a3 messageContext:(id)a4 message:(id)a5 existingConversation:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!-[CSDConversationManager verifyMessageIntentKeyFromContext:message:]( self,  "verifyMessageIntentKeyFromContext:message:",  a4,  v11))
  {
    id v14 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B5554();
    }
    goto LABEL_20;
  }

  if (!-[CSDConversationManager verifyKickMemberPermittedFromHandle:message:]( self,  "verifyKickMemberPermittedFromHandle:message:",  v10,  v11))
  {
    id v16 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B5528();
    }
    goto LABEL_20;
  }

  if (!-[CSDConversationManager verifyActivitySessionOriginatorFromHandle:message:]( self,  "verifyActivitySessionOriginatorFromHandle:message:",  v10,  v11))
  {
    id v17 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B54FC();
    }
    goto LABEL_20;
  }

  if (!-[CSDConversationManager verifyBlobResponseFromHandle:message:existingConversation:]( self,  "verifyBlobResponseFromHandle:message:existingConversation:",  v10,  v11,  v12))
  {
    id v18 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B54D0();
    }
    goto LABEL_20;
  }

  if (!-[CSDConversationManager verifyLightweightMessageTypeFromHandle:message:existingConversation:]( self,  "verifyLightweightMessageTypeFromHandle:message:existingConversation:",  v10,  v11,  v12))
  {
    id v19 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B54A4();
    }
    goto LABEL_20;
  }

  if (!-[CSDConversationManager verifyEndorseRepresentsMemberFromHandle:message:existingConversation:]( self,  "verifyEndorseRepresentsMemberFromHandle:message:existingConversation:",  v10,  v11,  v12))
  {
    id v20 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B5478();
    }
LABEL_20:

    BOOL v13 = 0;
    goto LABEL_21;
  }

  BOOL v13 = 1;
LABEL_21:

  return v13;
}

- (BOOL)shouldAcceptMembershipUpdateFromHandle:(id)a3 joinContext:(id)a4 participantUpdate:(id)a5 existingConversation:(id)a6
{
  id v42 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 message]);
  char v40 = self;
  unsigned int v41 = v11;
  if (v12)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 remoteMembers]);
    [v13 unionSet:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 lightweightMembers]);
    [v14 unionSet:v17];

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 localMember]);
    unsigned int v19 = [v18 isLightweightMember];

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 localMember]);
    if (v19) {
      id v21 = v14;
    }
    else {
      id v21 = v13;
    }
    [v21 addObject:v20];
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 tuConversationMembers]);
    [v13 unionSet:v22];

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 tuLightweightMembers]);
    [v14 unionSet:v20];
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 addedMembers]);
  id v24 = [v23 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v48 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v47 + 1) + 8 * (void)i) tuConversationMember]);
        [v13 addObject:v28];
      }

      id v25 = [v23 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }

    while (v25);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  int v29 = (void *)objc_claimAutoreleasedReturnValue([v15 lightweightMembers]);
  id v30 = [v29 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v44;
    do
    {
      for (j = 0LL; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v43 + 1) + 8 * (void)j) tuConversationMember]);
        [v14 addObject:v34];
      }

      id v31 = [v29 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }

    while (v31);
  }

  if (!-[CSDConversationManager verifyGroupSessionParticipantUpdateAllowedFromHandle:participantUpdate:message:existingConversation:lightweightMembers:]( v40,  "verifyGroupSessionParticipantUpdateAllowedFromHandle:participantUpdate:message:existingConversation:lightweightMembers:",  v42,  v41,  v15,  v12,  v14))
  {
    id v36 = sub_1001704C4();
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1002B5580();
    }
    goto LABEL_28;
  }

  if (!-[CSDConversationManager verifyAllLightweightmembersAssociated:remoteMembers:]( v40,  "verifyAllLightweightmembersAssociated:remoteMembers:",  v14,  v13))
  {
    id v38 = sub_1001704C4();
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Not all lightweightMembers have an associated lightweightPrimary in the conversation, dropping message fromHandle: %@",  buf,  0xCu);
    }

- (BOOL)verifyKickMemberPermittedFromHandle:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 type] == 19)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 removedMembers]);
    id v8 = [v7 count];

    if (v8)
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "removedMembers", 0));
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v22;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)i) handle]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 tuHandle]);

            if ([v15 isEquivalentToHandle:v5])
            {
              id v17 = sub_1001704C4();
              id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                sub_1002B5664();
              }

              goto LABEL_18;
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
          BOOL v16 = 1;
          if (v11) {
            continue;
          }
          break;
        }
      }

      else
      {
        BOOL v16 = 1;
      }
    }

    else
    {
      id v19 = sub_1001704C4();
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_1002B55E0();
      }
LABEL_18:
      BOOL v16 = 0;
    }
  }

  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)verifyActivitySessionOriginatorFromHandle:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 type] == 8 || objc_msgSend(v6, "type") == 23)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activitySessions]);
    id v8 = [v7 count];

    if (v8)
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activitySessions", 0));
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v10)
      {
        BOOL v17 = 1;
        goto LABEL_24;
      }

      id v11 = v10;
      uint64_t v12 = *(void *)v24;
LABEL_6:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * v13) activity]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 originatorHandle]);
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 tuHandle]);

        if (!v16) {
          break;
        }
        if (([v16 isEquivalentToHandle:v5] & 1) == 0)
        {
          id v21 = sub_1001704C4();
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_1002B5748();
          }
LABEL_22:

          goto LABEL_23;
        }

        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
          BOOL v17 = 1;
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_24;
        }
      }

      id v19 = sub_1001704C4();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1002B56C4();
      }
      goto LABEL_22;
    }

    id v18 = sub_1001704C4();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_1002B55E0();
    }
LABEL_23:
    BOOL v17 = 0;
LABEL_24:
  }

  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)verifyMessageIntentKeyFromContext:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v6 type];
  if (v7 <= 0x24)
  {
    if (((1LL << v7) & 0x18D569FE7FLL) != 0)
    {
      BOOL v8 = 1;
      goto LABEL_6;
    }

    if (((1LL << v7) & 0x62A800100LL) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 publicIntentAction]);
      id v10 = [v9 integerValue];
      BOOL v8 = v10 == (id)(int)[v6 type];

      goto LABEL_6;
    }
  }

  id v12 = sub_1001704C4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1002B57A8();
  }

  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)verifyBlobResponseFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v12 = sub_1001704C4();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002B57D4();
    }
    goto LABEL_24;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 activeParticipants]);
  if ([v11 count] == (id)1)
  {
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 activeLightweightParticipants]);
    id v15 = [v14 count];

    if (v15 != (id)1)
    {
      id v36 = sub_1001704C4();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1002B594C();
      }
      goto LABEL_24;
    }
  }

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v9 activeParticipants]);
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 csdConversationParticipant]);
  id v19 = v18;
  if (v18)
  {
    uint64_t v13 = v18;
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 activeLightweightParticipants]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 csdConversationParticipant]);
  }

  if (v13)
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s handle](v13, "handle"));
    unsigned __int8 v23 = [v22 isEquivalentToHandle:v8];

    if ((v23 & 1) != 0)
    {
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteMembers]);
      id v25 = [v24 mutableCopy];

      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v10 localMember]);
      [v25 addObject:v26];

      unsigned int v27 = -[os_log_s isLightweight](v13, "isLightweight");
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 value]);
      if (v27)
      {
        int v29 = (void *)objc_claimAutoreleasedReturnValue([v10 lightweightMembers]);
        id v30 = [v29 copy];
        id v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager memberExistsForParticipantDestination:members:]( self,  "memberExistsForParticipantDestination:members:",  v28,  v30));

        if (!v31)
        {
          id v32 = sub_1001704C4();
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_1002B582C();
          }
LABEL_31:

          goto LABEL_24;
        }
      }

      else
      {
        id v39 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager memberExistsForParticipantDestination:members:]( self,  "memberExistsForParticipantDestination:members:",  v28,  v25));

        if (!v39)
        {
          id v41 = sub_1001704C4();
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_1002B588C();
          }
          goto LABEL_31;
        }
      }

LABEL_27:
      BOOL v38 = 1;
      goto LABEL_28;
    }

    id v37 = sub_1001704C4();
    BOOL v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1002B58EC();
    }
  }

  else
  {
    id v34 = sub_1001704C4();
    BOOL v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1002B5800();
    }
  }

LABEL_24:
  BOOL v38 = 0;
LABEL_28:

  return v38;
}

- (BOOL)verifyAllLightweightmembersAssociated:(id)a3 remoteMembers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (!v9)
  {
    BOOL v18 = 1;
    goto LABEL_18;
  }

  id v10 = v9;
  uint64_t v11 = *(void *)v25;
  while (2)
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lightweightPrimary", (void)v24));

      if (!v14)
      {
        id v19 = sub_1001704C4();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int v29 = v13;
          id v21 = "Member: %@ doesn't have a primary";
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
        }

- (BOOL)verifyGroupSessionParticipantUpdateAllowedFromHandle:(id)a3 participantUpdate:(id)a4 message:(id)a5 existingConversation:(id)a6 lightweightMembers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager memberExistsForParticipantDestination:members:]( self,  "memberExistsForParticipantDestination:members:",  v16,  v15));

  id v18 = [v13 participantUpdateType];
  if (!v17)
  {
    if (v18 == (id)3)
    {
      id v37 = v14;
      id v38 = v13;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 lightweightMembers]);
      id v22 = [v21 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v40;
        while (2)
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v40 != v24) {
              objc_enumerationMutation(v21);
            }
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v39 + 1) + 8 * (void)i) lightweightPrimary]);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 tuHandle]);
            unsigned __int8 v28 = [v27 isEquivalentToHandle:v12];

            if ((v28 & 1) == 0)
            {
              id v29 = sub_1001704C4();
              id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                sub_1002B59D0();
              }

              BOOL v19 = 0;
              id v14 = v37;
              id v13 = v38;
              goto LABEL_28;
            }
          }

          id v23 = [v21 countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      id v14 = v37;
      id v13 = v38;
    }

- (BOOL)verifyLightweightMessageTypeFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    id v16 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002B5AF0();
    }
    goto LABEL_9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 value]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 lightweightMembers]);
  id v12 = [v11 copy];
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager memberExistsForParticipantDestination:members:]( self,  "memberExistsForParticipantDestination:members:",  v10,  v12));

  if (v13)
  {
    unsigned int v14 = [v8 type];
    if (v14 <= 0x23)
    {
      if (((1LL << v14) & 0xE2749FC6FLL) != 0)
      {
LABEL_9:
        BOOL v15 = 0;
        goto LABEL_10;
      }

      if (((1LL << v14) & 0x8A00310) != 0) {
        goto LABEL_6;
      }
    }

    id v18 = sub_1001704C4();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1002B57A8();
    }

    goto LABEL_9;
  }

- (BOOL)verifyEndorseRepresentsMemberFromHandle:(id)a3 message:(id)a4 existingConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v26 = sub_1001704C4();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B5AF0();
    }
    goto LABEL_23;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 addedMembers]);
  id v12 = [v11 count];

  if (v12 != (id)1)
  {
    id v27 = sub_1001704C4();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1002B5B1C(v9, v15);
    }
    goto LABEL_23;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 addedMembers]);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
  BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 tuConversationMember]);

  if (!-[os_log_s isLightweightMember](v15, "isLightweightMember")
    || (id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s lightweightPrimary](v15, "lightweightPrimary")),
        unsigned __int8 v17 = [v16 isEquivalentToHandle:v8],
        v16,
        (v17 & 1) == 0))
  {
    id v28 = sub_1001704C4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 138412546;
      id v37 = v8;
      __int16 v38 = 2112;
      __int128 v39 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "FromID: %@ attempting to vouch for an invalid member %@",  (uint8_t *)&v36,  0x16u);
    }

    goto LABEL_22;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s handle](v15, "handle"));
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 value]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 lightweightMembers]);
  id v21 = [v20 copy];
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager memberExistsForParticipantDestination:members:]( self,  "memberExistsForParticipantDestination:members:",  v19,  v21));

  if (!v22)
  {
    id v29 = sub_1001704C4();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      id v31 = "No local lightweightMember found for handle trying to be vouched";
      id v32 = v30;
      uint32_t v33 = 2;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v36, v33);
    }

- (void)refreshActiveParticipantsList
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Refreshing active pariticpants for active conversations",  buf,  2u);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E1A60;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_sync(v5, block);
}

- (NSDictionary)conversationsByGroupUUID
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1000D42D4;
  uint64_t v11 = sub_1000D42E4;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E1C50;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSDictionary)incomingPendingConversationsByGroupUUID
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1000D42D4;
  uint64_t v11 = sub_1000D42E4;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E1FB8;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)_incomingPendingConversationsByGroupUUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager pendingMembershipTracker](self, "pendingMembershipTracker"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pendingMembersByGroup]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
        uint64_t v11 = -[TUConversation initWithUUID:groupUUID:]( objc_alloc(&OBJC_CLASS___TUConversation),  "initWithUUID:groupUUID:",  v10,  v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v12));
        -[TUConversation setPendingMembers:](v11, "setPendingMembers:", v13);

        [v4 setObject:v11 forKeyedSubscript:v10];
      }

      id v7 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }

    while (v7);
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v37 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 conversationLinkDescriptorsWithGroupUUIDs:v15 error:&v37]);
  id v17 = v37;

  if (v17)
  {
    id v18 = sub_1001704C4();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] _incomingPendingConversationsByGroupUUID: issue fetching links for pending incoming {error: %@}",  buf,  0xCu);
    }
  }

  id v32 = v17;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v20 = v16;
  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        BOOL v25 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 groupUUID]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v26]);

        id v28 = -[TUConversationLink initWithDescriptor:]( objc_alloc(&OBJC_CLASS___TUConversationLink),  "initWithDescriptor:",  v25);
        [v27 setLink:v28];
      }

      id v22 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }

    while (v22);
  }

  id v29 = [v4 copy];
  return v29;
}

- (NSDictionary)conversationsByUUID
{
  return (NSDictionary *)-[CSDConversationManager conversationsByUUIDIncludingStorageConversations:]( self,  "conversationsByUUIDIncludingStorageConversations:",  0LL);
}

- (NSDictionary)pseudonymsByCallUUID
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_1000D42D4;
  uint64_t v11 = sub_1000D42E4;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E2424;
  v6[3] = &unk_1003D7850;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)conversationsByUUIDIncludingStorageConversations:(BOOL)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_1000D42D4;
  unsigned int v14 = sub_1000D42E4;
  id v15 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2570;
  block[3] = &unk_1003D9C68;
  void block[4] = self;
  void block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = [(id)v11[5] copy];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)activatedConversationLinksWithError:(id *)a3
{
  if (-[CSDConversationManager _linksEnabled](self, "_linksEnabled"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchActivatedLinksWithError:a3]);
  }

  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)deletedConversationLinksWithError:(id *)a3
{
  if (-[CSDConversationManager _linksEnabled](self, "_linksEnabled"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchDeletedLinksWithError:a3]);
  }

  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (NSDictionary)activityAuthorizedBundleIdentifierState
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CPApplicationPolicyManager sharedInstance]( &OBJC_CLASS___CPApplicationPolicyManager,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 autoSharePlayEnabled]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, @"gk");

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPApplicationPolicyManager sharedInstance]( &OBJC_CLASS___CPApplicationPolicyManager,  "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 authorizedBundleIdentifiers]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, @"bk");

  return (NSDictionary *)v2;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2A30;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2B08;
  block[3] = &unk_1003D7758;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2C04;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)beginListeningOnService:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E2CDC;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)retreiveActiveConversations
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 callerID]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager persistenceController](self, "persistenceController"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000E2F60;
    v9[3] = &unk_1003D9C90;
    v9[4] = self;
    [v5 enumerateActiveConversations:v9];
  }

  else
  {
    id v6 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "shouldClearDefaults: %d - Removing all conversations",  buf,  8u);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager persistenceController](self, "persistenceController"));
    [v8 removeAllConversations];
  }

- (void)removeAllConversations
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager persistenceController](self, "persistenceController"));
  [v2 removeAllConversations];
}

- (id)findOrCreateConversationWithGroupUUID:(id)a3 messagesGroupUUID:(id)a4 remoteMembers:(id)a5 otherInvitedHandles:(id)a6 localMember:(id)a7 remotePushTokens:(id)a8 link:(id)a9 activity:(id)a10 avMode:(unint64_t)a11 presentationMode:(unint64_t)a12 conversationProvider:(id)a13 screenSharingRequest:(id)a14
{
  id v43 = a3;
  id v41 = a4;
  id v42 = a5;
  id v36 = a6;
  id v39 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a13;
  id v24 = a14;
  uint64_t v59 = 0LL;
  __int16 v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  __int16 v62 = sub_1000D42D4;
  id v63 = sub_1000D42E4;
  id v64 = 0LL;
  queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E38A0;
  block[3] = &unk_1003D9CB8;
  id v45 = v43;
  id v46 = v42;
  id v47 = v23;
  __int128 v48 = self;
  id v49 = v21;
  BOOL v25 = v21;
  id v50 = v39;
  id v51 = v41;
  id v52 = v36;
  id v53 = v20;
  id v54 = v22;
  id v55 = v24;
  unint64_t v57 = a11;
  unint64_t v58 = a12;
  id v56 = &v59;
  id v40 = v24;
  id v38 = v22;
  id v34 = v20;
  id v37 = v36;
  id v26 = v41;
  id v27 = v39;
  id v28 = v25;
  id v29 = v23;
  id v30 = v42;
  id v31 = v43;
  dispatch_sync(queue, block);

  id v32 = (id)v60[5];
  _Block_object_dispose(&v59, 8);

  return v32;
}

- (void)joinExistingConversationWithUUID:(id)a3 context:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E4260;
  block[3] = &unk_1003D7828;
  id v11 = a3;
  id v12 = a4;
  id v13 = self;
  id v6 = v12;
  id v7 = v11;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_async(v9, v8);
}

- (id)initiatePendingConversationForLink:(id)a3 localMember:(id)a4 isVideoEnabled:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = sub_1000D42D4;
  BOOL v25 = sub_1000D42E4;
  id v26 = 0LL;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E4BA0;
  block[3] = &unk_1003D9D08;
  id v16 = v8;
  id v17 = v9;
  BOOL v20 = a5;
  id v18 = self;
  BOOL v19 = &v21;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, block);

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (void)requestLetMeInApprovalForPseudonym:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E50E4;
  v7[3] = &unk_1003D7758;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sendLetMeInResponseToPendingMember:(id)a3 forConversation:(id)a4 usingResponseKeyData:(id)a5 approved:(BOOL)a6 callback:(id)a7
{
  BOOL v8 = a6;
  id v12 = (CSDMessagingConversationMessage *)a3;
  id v13 = a4;
  id v14 = a5;
  id v58 = a7;
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v15);

  id v16 = sub_1001704C4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      id v18 = @"YES";
    }
    else {
      id v18 = @"NO";
    }
    id v19 = v14;
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v13 UUID]);
    *(_DWORD *)buf = 138412802;
    __int16 v62 = v12;
    __int16 v63 = 2112;
    id v64 = v18;
    __int16 v65 = 2112;
    __int128 v66 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "LMI: Notifying pending member %@ of our response (approved: %@) to their let me in for conversation UUID %@",  buf,  0x20u);

    id v14 = v19;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 link]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 pseudonym]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedGenericHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedGenericHandleForValue:",  v22));

  if (v14)
  {
    id v56 = v12;
    unint64_t v57 = v23;
    p_superclass = &OBJC_CLASS___CSDIDSGroupSession.superclass;
    BOOL v25 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
    id v26 = v25;
    if (v8)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v13 groupUUID]);
      id v28 = self;
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v13 link]);
      id v30 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v26,  "initWithType:groupUUID:link:",  16LL,  v27,  v29);

      id v31 = (void *)objc_claimAutoreleasedReturnValue([v13 localMember]);
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 handle]);
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v32));
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage link](v30, "link"));
      [v34 setOriginatorHandle:v33];

      self = v28;
      p_superclass = (__objc2_class **)(&OBJC_CLASS___CSDIDSGroupSession + 8);
    }

    else
    {
      id v30 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v25,  "initWithType:groupUUID:link:",  16LL,  0LL,  0LL);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v13 link]);
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationLink linkWithTUConversationLink:includeGroupUUID:]( &OBJC_CLASS___CSDMessagingConversationLink,  "linkWithTUConversationLink:includeGroupUUID:",  v31,  0LL));
      -[CSDMessagingConversationMessage setLink:](v30, "setLink:", v32);
    }

    -[CSDMessagingConversationMessage setIsLetMeInApproved:](v30, "setIsLetMeInApproved:", v8);
    id v37 = sub_1001704C4();
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v62 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "LetMeInResponse message assembled as %@",  buf,  0xCu);
    }

    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
    uint64_t v23 = v57;
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 encryptLetMeInResponse:v30 pseudonym:v57 responseKeyData:v14]);

    if (v40)
    {
      id v41 = objc_alloc((Class)p_superclass + 279);
      id v42 = (void *)objc_claimAutoreleasedReturnValue([v13 link]);
      id v54 = self;
      id v43 = [v41 initWithEncryptedMessage:v40 enclosedType:16 link:v42];

      id v44 = objc_alloc(&OBJC_CLASS___TUConversationMember);
      id v55 = v14;
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v13 link]);
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v45 pseudonym]);
      id v47 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedGenericHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedGenericHandleForValue:",  v46));
      __int128 v48 = -[TUConversationMember initWithHandle:nickname:](v44, "initWithHandle:nickname:", v47, 0LL);

      uint64_t v59 = @"kCSDConversationIsLetMeInApproved";
      id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
      __int16 v60 = v49;
      id v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));

      id v51 = (void *)objc_claimAutoreleasedReturnValue([v43 data]);
      id v52 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage idsDestination](v56, "idsDestination"));
      id v36 = v58;
      -[CSDConversationManager sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:]( v54,  "sendData:onConversation:toDestinationID:fromMember:additionalOptions:isBlobResponse:callback:",  v51,  v13,  v52,  v48,  v50,  0LL,  v58);

      id v12 = v56;
      id v14 = v55;

      uint64_t v23 = v57;
    }

    else
    {
      id v53 = sub_1001704C4();
      id v43 = (id)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR)) {
        sub_1002B5CF0();
      }
      id v12 = v56;
      id v36 = v58;
    }
  }

  else
  {
    id v35 = sub_1001704C4();
    id v30 = (CSDMessagingConversationMessage *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v30,  OS_LOG_TYPE_DEFAULT,  "[WARN] Response key missing from LMI response; cannot encrypt to send without. Aborting.",
        buf,
        2u);
    }

    id v36 = v58;
  }
}

- (void)updateLetMeInRequestState:(int64_t)a3 addLink:(id)a4 forConversationWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E6088;
  v13[3] = &unk_1003D8F98;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  int64_t v17 = a3;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)sendInvitationMessageToMember:(id)a3 forConversation:(id)a4 includeAllAttributes:(BOOL)a5 invitationPreferences:(id)a6 additionalOptions:(id)a7
{
  BOOL v9 = a5;
  id v55 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 groupUUID]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 link]);
  int64_t v17 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v14,  "initWithType:groupUUID:link:",  1LL,  v15,  v16);

  if (v9)
  {
    id v53 = v12;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 activeRemoteParticipants]);
    id v19 = [v18 countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v69;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v69 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationParticipant:",  *(void *)(*((void *)&v68 + 1) + 8LL * (void)i)));
          -[CSDMessagingConversationMessage addActiveParticipants:](v17, "addActiveParticipants:", v23);
        }

        id v20 = [v18 countByEnumeratingWithState:&v68 objects:v77 count:16];
      }

      while (v20);
    }

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 activeLightweightParticipants]);
    id v25 = [v24 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v65;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v65 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:]( &OBJC_CLASS___CSDMessagingConversationParticipant,  "participantWithCSDConversationParticipant:",  *(void *)(*((void *)&v64 + 1) + 8LL * (void)j)));
          -[CSDMessagingConversationMessage addActiveLightweightParticipants:]( v17,  "addActiveLightweightParticipants:",  v29);
        }

        id v26 = [v24 countByEnumeratingWithState:&v64 objects:v76 count:16];
      }

      while (v26);
    }

    id v52 = v13;

    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteMembers]);
    id v31 = [v30 countByEnumeratingWithState:&v60 objects:v75 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v61;
      do
      {
        for (k = 0LL; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v61 != v33) {
            objc_enumerationMutation(v30);
          }
          id v35 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationMember memberWithTUConversationMember:]( &OBJC_CLASS___CSDMessagingConversationMember,  "memberWithTUConversationMember:",  *(void *)(*((void *)&v60 + 1) + 8LL * (void)k),  v52));
          -[CSDMessagingConversationMessage addAddedMembers:](v17, "addAddedMembers:", v35);
        }

        id v32 = [v30 countByEnumeratingWithState:&v60 objects:v75 count:16];
      }

      while (v32);
    }

    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v11 activitySessions]);
    id v37 = [v36 countByEnumeratingWithState:&v56 objects:v74 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v57;
      do
      {
        for (m = 0LL; m != v38; m = (char *)m + 1)
        {
          if (*(void *)v57 != v39) {
            objc_enumerationMutation(v36);
          }
          id v41 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)m);
          id v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "activity", v52));
          unsigned __int8 v43 = [v42 isStaticActivity];

          if ((v43 & 1) == 0)
          {
            id v44 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivitySession activitySessionWithCSDConversationActivitySession:fromConversation:forStorage:]( &OBJC_CLASS___CSDMessagingConversationActivitySession,  "activitySessionWithCSDConversationActivitySession:fromConversation:forStorage:",  v41,  v11,  0LL));
            -[CSDMessagingConversationMessage addActivitySessions:](v17, "addActivitySessions:", v44);
          }
        }

        id v38 = [v36 countByEnumeratingWithState:&v56 objects:v74 count:16];
      }

      while (v38);
    }

    id v45 = (void *)objc_claimAutoreleasedReturnValue([v11 stagedActivitySession]);
    id v13 = v52;
    id v12 = v53;
    if (v45)
    {
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v11 stagedActivitySession]);
      id v47 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivitySession activitySessionWithTUConversationActivitySession:fromConversation:forStorage:]( &OBJC_CLASS___CSDMessagingConversationActivitySession,  "activitySessionWithTUConversationActivitySession:fromConversation:forStorage:",  v46,  v11,  0LL));
      -[CSDMessagingConversationMessage setStagedActivitySession:](v17, "setStagedActivitySession:", v47);
    }
  }

  if (v12)
  {
    -[CSDMessagingConversationMessage setTUInvitationPreferences:](v17, "setTUInvitationPreferences:", v12);
  }

  else
  {
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v11 invitationPreferences]);
    -[CSDMessagingConversationMessage setTUInvitationPreferences:](v17, "setTUInvitationPreferences:", v48);
  }

  id v49 = sub_1001704C4();
  id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v73 = v17;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Sending invitation message %@", buf, 0xCu);
  }

  id v51 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v17, "data"));
  -[CSDConversationManager sendData:onConversation:toMember:additionalOptions:]( self,  "sendData:onConversation:toMember:additionalOptions:",  v51,  v11,  v55,  v13);
}

- (void)startAudioForConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E6A24;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_leaveConversation:(id)a3 withContext:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  [v14 leaveUsingContext:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v14 link]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pseudonym]);
  id v10 = [v9 length];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 link]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pseudonym]);
    id v13 =  -[CSDConversationManager _removePendingConversationWithPseudonym:]( self,  "_removePendingConversationWithPseudonym:",  v12);
  }
}

- (void)_leaveConversation:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = -[CSDConversationLeaveContext initWithLeaveReason:]( objc_alloc(&OBJC_CLASS___CSDConversationLeaveContext),  "initWithLeaveReason:",  0LL);
  -[CSDConversationManager _leaveConversation:withContext:](self, "_leaveConversation:withContext:", v4, v6);
}

- (void)leaveConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = -[CSDConversationLeaveContext initWithLeaveReason:]( objc_alloc(&OBJC_CLASS___CSDConversationLeaveContext),  "initWithLeaveReason:",  0LL);
  -[CSDConversationManager leaveConversationWithUUID:withContext:]( self,  "leaveConversationWithUUID:withContext:",  v4,  v5);
}

- (void)leaveConversationWithUUID:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E6E04;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)leaveAllConversations
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E6EE8;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)addPseudonym:(id)a3 forCallUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E70AC;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removePseudonym:(id)a3 forCallUUID:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E718C;
  v8[3] = &unk_1003D7758;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)setUplinkMuted:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E726C;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setVideo:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E7364;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)sendVideoUpgradeMessageforConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E7454;
  v7[3] = &unk_1003D7758;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setVideoEnabled:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E7684;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setUplinkMuted:(BOOL)a3 forPendingConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E777C;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setVideoEnabled:(BOOL)a3 forPendingConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E7A80;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)requestParticipantToShareScreen:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v9 = [v8 requestToScreenShareEnabled];

  if (v9)
  {
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E7DE8;
    block[3] = &unk_1003D7828;
    id v14 = (os_log_s *)v6;
    id v15 = self;
    id v16 = v7;
    dispatch_async(v10, block);

    BOOL v11 = v14;
  }

  else
  {
    id v12 = sub_1001704C4();
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002B5D48();
    }
  }
}

- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8128;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)setScreenEnabled:(BOOL)a3 forConversationWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[TUCallScreenShareAttributes defaultAttributes]( &OBJC_CLASS___TUCallScreenShareAttributes,  "defaultAttributes"));
  -[CSDConversationManager setScreenEnabled:screenShareAttributes:forConversationWithUUID:]( self,  "setScreenEnabled:screenShareAttributes:forConversationWithUUID:",  v4,  v7,  v6);
}

- (void)setScreenEnabled:(BOOL)a3 screenShareAttributes:(id)a4 forConversationWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E8460;
  v13[3] = &unk_1003D8FE0;
  void v13[4] = self;
  id v14 = v9;
  BOOL v16 = a3;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)setVideoPaused:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8B94;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setAudioPaused:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8C8C;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setRelaying:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8D84;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setScreening:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8E7C;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setAudioInjectionAllowed:(BOOL)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8FB4;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)isConversationWithUUIDRedirectingAudio:(id)a3
{
  id v4 = a3;
  if (-[CSDConversationManager isConversationWithUUIDRelaying:](self, "isConversationWithUUIDRelaying:", v4)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = -[CSDConversationManager isConversationWithUUIDScreening:](self, "isConversationWithUUIDScreening:", v4);
  }

  return v5;
}

- (BOOL)isConversationWithUUIDRelaying:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E9144;
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

- (BOOL)isConversationWithUUIDScreening:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E9288;
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

- (void)setSplitSessionUserProfileState:(int64_t)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E9388;
  block[3] = &unk_1003D78F0;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (int)presentationStateForConversationWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 2;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E94C8;
  block[3] = &unk_1003D9238;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

- (void)setPresentationState:(int)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E95C8;
  block[3] = &unk_1003D9D80;
  void block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setPresentationRect:(CGRect)a3 forConversationWithUUID:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E96E0;
  v12[3] = &unk_1003D9DA8;
  v12[4] = self;
  id v13 = v9;
  CGFloat v14 = x;
  CGFloat v15 = y;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v11 = v9;
  dispatch_async(v10, v12);
}

- (void)setGridDisplayMode:(unint64_t)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E97DC;
  block[3] = &unk_1003D78F0;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)setScreenShareAttributes:(id)a3 forConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E98F0;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeRemoteMembers:(id)a3 fromConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E9A20;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = v6;
  CGFloat v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)addRemoteMembers:(id)a3 toConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  -[CSDConversationManager addRemoteMembers:otherInvitedHandles:toConversationWithUUID:]( self,  "addRemoteMembers:otherInvitedHandles:toConversationWithUUID:",  v7,  v8,  v6);
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversationWithUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E9D00;
  v15[3] = &unk_1003D7B28;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v19 = self;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EA3E8;
  block[3] = &unk_1003D7828;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EA8F8;
  block[3] = &unk_1003D7918;
  BOOL v12 = a3;
  id v10 = v6;
  unint64_t v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)maybeAddComplementaryAssociationVoucherFor:(id)a3 toLocalMemberOf:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v45 = self;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager voucherManager](self, "voucherManager"));

  if (v11)
  {
    block = v10;
    group = dispatch_group_create();
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v42 = v8;
    id obj = v8;
    id v12 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v52;
      uint64_t v43 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "association", block));
          if (v17)
          {
            id v18 = (void *)v17;
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 associationVoucher]);

            if (v19)
            {
              id v20 = objc_alloc_init(&OBJC_CLASS___CSDMessagingMemberAssociationClaim);
              id v21 = v13;
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 localMember]);
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 handle]);
              id v24 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v23));
              -[CSDMessagingMemberAssociationClaim setPrimaryHandle:](v20, "setPrimaryHandle:", v24);

              id v25 = (void *)objc_claimAutoreleasedReturnValue([v9 localParticipant]);
              -[CSDMessagingMemberAssociationClaim setPrimaryIdentifier:]( v20,  "setPrimaryIdentifier:",  [v25 identifier]);

              id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 localParticipant]);
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 avcIdentifier]);
              -[CSDMessagingMemberAssociationClaim setPrimaryAvcIdentifier:](v20, "setPrimaryAvcIdentifier:", v27);

              id v28 = (void *)objc_claimAutoreleasedReturnValue([v16 handle]);
              id v29 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v28));
              -[CSDMessagingMemberAssociationClaim setAssociatedPseudonym:](v20, "setAssociatedPseudonym:", v29);

              id v30 = (void *)objc_claimAutoreleasedReturnValue([v9 groupUUID]);
              id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);
              -[CSDMessagingMemberAssociationClaim setConversationGroupUUIDString:]( v20,  "setConversationGroupUUIDString:",  v31);

              id v32 = (void *)objc_claimAutoreleasedReturnValue([v16 association]);
              -[CSDMessagingMemberAssociationClaim setType:](v20, "setType:", [v32 type]);

              dispatch_group_enter(group);
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager voucherManager](v45, "voucherManager"));
              id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingMemberAssociationClaim data](v20, "data"));
              id v35 = (void *)objc_claimAutoreleasedReturnValue([v9 localMember]);
              id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 handle]);
              v47[0] = _NSConcreteStackBlock;
              v47[1] = 3221225472LL;
              v47[2] = sub_1000EAE90;
              v47[3] = &unk_1003D9DD0;
              v47[4] = v16;
              id v48 = v9;
              id v49 = v20;
              id v50 = group;
              id v37 = v20;
              [v33 sign:v34 as:v36 completion:v47];

              id v13 = v21;
              uint64_t v14 = v43;
            }
          }
        }

        id v13 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      }

      while (v13);
    }

    id v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](v45, "queue"));
    id v10 = block;
    dispatch_group_notify(group, v38, block);

    id v8 = v42;
  }

  else
  {
    id v39 = sub_1001704C4();
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      sub_1002B5F14();
    }

    v10[2](v10);
  }
}

- (void)addInvitedMemberHandlesFromAddedRemoteMembers:(id)a3 toConversationLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v43 = self;
  unsigned int v8 = -[CSDConversationManager _linksEnabled](self, "_linksEnabled");
  id v46 = v7;
  id v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v42 = v6;
  id v9 = v6;
  id v51 = [v9 countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (!v51) {
    goto LABEL_40;
  }
  uint64_t v50 = *(void *)v57;
  id obj = v9;
  do
  {
    id v10 = 0LL;
    do
    {
      if (*(void *)v57 != v50) {
        objc_enumerationMutation(obj);
      }
      unint64_t v11 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "handle", v42));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
      CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
      if ([v15 destinationIdIsPseudonym])
      {

LABEL_12:
LABEL_13:
        id v16 = sub_1001704C4();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        uint64_t v47 = objc_claimAutoreleasedReturnValue([v11 handle]);
        id v49 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
        id v48 = (void *)objc_claimAutoreleasedReturnValue([v49 value]);
        else {
          id v18 = @"NO";
        }
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 value]);
        else {
          id v21 = @"NO";
        }
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v46 originatorHandle]);
        unsigned int v24 = [v22 isEquivalentToHandle:v23];
        *(_DWORD *)buf = 138413058;
        if (v24) {
          id v25 = @"YES";
        }
        else {
          id v25 = @"NO";
        }
        id v26 = (void *)v47;
        uint64_t v62 = v47;
        __int16 v63 = 2112;
        __int128 v64 = v18;
        __int16 v65 = 2112;
        __int128 v66 = v21;
        __int16 v67 = 2112;
        __int128 v68 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not adding %@ to invited member handles of link because destinationIdIsTemporary(%@), destinationIdIsPseudonym (%@), or handle is the originator of link (%@)",  buf,  0x2Au);

LABEL_24:
        goto LABEL_25;
      }

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v46 originatorHandle]);
      unsigned __int8 v29 = [v27 isEquivalentToHandle:v28];

      if ((v29 & 1) != 0) {
        goto LABEL_13;
      }
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v46 invitedMemberHandles]);
      id v31 = [v30 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v53;
LABEL_30:
        uint64_t v34 = 0LL;
        while (1)
        {
          if (*(void *)v53 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v52 + 1) + 8 * v34);
          id v36 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
          LOBYTE(v35) = [v36 isEquivalentToHandle:v35];

          if ((v35 & 1) != 0) {
            break;
          }
          if (v32 == (id)++v34)
          {
            id v32 = [v30 countByEnumeratingWithState:&v52 objects:v60 count:16];
            if (v32) {
              goto LABEL_30;
            }
            goto LABEL_36;
          }
        }

        id v37 = sub_1001704C4();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v11 handle]);
        *(_DWORD *)buf = 138412290;
        uint64_t v62 = (uint64_t)v26;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Not adding %@ to invited member handles of link because it is already an invited member handle of the link",  buf,  0xCu);
        goto LABEL_24;
      }

- (BOOL)allActiveConversationParticipantsSupportSharePlay
{
  id v2 = self;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000EB630;
  v5[3] = &unk_1003D9288;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isSharePlayAvailable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager sharePlaySystemStateObserver](self, "sharePlaySystemStateObserver"));
  unsigned __int8 v3 = [v2 allowSharePlay];

  return v3;
}

- (BOOL)isScreenSharingAvailable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager sharePlaySystemStateObserver](self, "sharePlaySystemStateObserver"));
  unsigned __int8 v3 = [v2 allowScreenSharing];

  return v3;
}

- (BOOL)isScreenSharingInitiationAvailable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager sharePlaySystemStateObserver](self, "sharePlaySystemStateObserver"));
  unsigned __int8 v3 = [v2 allowScreenSharingInitiation];

  return v3;
}

- (void)displaySharePlayUnableToStartAlert
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EB784;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_displaySharePlayUnableToStartWithMessage:(id)a3
{
  id v4 = a3;
  if ((TUSharePlayForceDisabled() & 1) != 0)
  {
    id v5 = sub_1001704C4();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not displaying SharePlay not supported alert because SharePlay features are disabled.",  buf,  2u);
    }
  }

  else
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
    dispatch_assert_queue_V2(v7);

    id v8 = sub_1001704C4();
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Displaying SharePlay not supported alert with message: %@",  buf,  0xCu);
    }

    uint64_t v12 = TUBundle(v10, v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"OK" value:&stru_1003E7718 table:@"TelephonyUtilities"]);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    uint64_t v16 = TUBundle(v14, v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"SHAREPLAY_INCOMPATIBLE_TITLE" value:&stru_1003E7718 table:@"TelephonyUtilities"]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  v14,  v18,  v4,  v6,  0LL,  0LL));

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EBA20;
    block[3] = &unk_1003D7730;
    id v22 = v19;
    id v20 = v19;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)updateMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EBB48;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)updateMessagesGroupPhotoOnConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EBFD8;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (FTDeviceSupport)deviceSupport
{
  deviceSupport = self->_deviceSupport;
  if (deviceSupport) {
    return deviceSupport;
  }
  else {
    return (FTDeviceSupport *)(id)objc_claimAutoreleasedReturnValue( +[FTDeviceSupport sharedInstance]( &OBJC_CLASS___FTDeviceSupport,  "sharedInstance"));
  }
}

- (id)createCPActivitySessionForActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138412546;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ConversationManager asked to create activitySession for activitySession: %@ on conversation UUID: %@",  (uint8_t *)&v30,  0x16u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v7]);

  if (!v12)
  {
    id v21 = sub_1001704C4();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allKeys]);
      int v30 = 138412546;
      id v31 = v7;
      __int16 v32 = 2112;
      id v33 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation with conversationUUID %@. All conversations UUIDs: %@",  (uint8_t *)&v30,  0x16u);
    }

    goto LABEL_14;
  }

  if ([v12 state] != (id)3 && objc_msgSend(v6, "isLocallyInitiated"))
  {
    id v13 = sub_1001704C4();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      id v31 = v7;
    }

- (void)createActivitySession:(id)a3 onConversationWithUUID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v9;
    __int16 v42 = 2112;
    id v43 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "conversationUUID: %@ activity: %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ECA9C;
  block[3] = &unk_1003D8488;
  id v13 = v8;
  id v36 = v13;
  id v37 = self;
  id v14 = v9;
  id v38 = v14;
  id v15 = v10;
  id v39 = v15;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class( DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT,  QOS_CLASS_USER_INITIATED,  0,  block);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000ECC0C;
  v30[3] = &unk_1003D9DF8;
  id v17 = v13;
  id v31 = v17;
  id v18 = v15;
  __int16 v32 = self;
  id v33 = v18;
  id v19 = v16;
  id v34 = v19;
  id v20 = objc_retainBlock(v30);
  if ([v17 isSystemActivity])
  {
    ((void (*)(void *, uint64_t, void))v20[2])(v20, 1LL, 0LL);
  }

  else if ([v17 isPlaceholderActivity])
  {
    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000ECD04;
    v26[3] = &unk_1003D9E20;
    v26[4] = self;
    id v27 = v14;
    id v29 = v18;
    id v28 = v17;
    dispatch_sync(v21, v26);
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager activityAuthorizationManager](self, "activityAuthorizationManager"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleIdentifier]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager screenSharingActivityManager](self, "screenSharingActivityManager"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 localScreenShareAttributes]);
    [v22 requestAuthorizationForApplicationWithBundleIdentifier:v23 preparing:0 overrides:0 currentScreenShareAttributes:v25 completionHandler:v20];
  }
}

- (void)leaveActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ECF04;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)endActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ED150;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000ED3A0;
  block[3] = &unk_1003D7828;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)cancelPreviouslySentScreenShareRequests:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 screenSharingRequests]);
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v15 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "isLocallyOriginated", v15))
        {
          id v12 = sub_1001704C4();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            id v21 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Cancelling existing locally originated screen share request: %@",  buf,  0xCu);
          }

          id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
          -[CSDConversationManager cancelOrDenyScreenShareRequest:forConversationUUID:]( self,  "cancelOrDenyScreenShareRequest:forConversationUUID:",  v11,  v14);
        }
      }

      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v8);
  }
}

- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000ED77C;
  v13[3] = &unk_1003D8FE0;
  BOOL v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)sendMessage:(id)a3 forConversation:(id)a4 withActivitySession:(id)a5
{
}

- (void)sendMessage:(id)a3 forConversation:(id)a4 withActivitySession:(id)a5 additionalOptions:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivitySession activitySessionWithCSDConversationActivitySession:fromConversation:forStorage:]( &OBJC_CLASS___CSDMessagingConversationActivitySession,  "activitySessionWithCSDConversationActivitySession:fromConversation:forStorage:",  v11,  v9,  0LL));
  [v12 addActivitySessions:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 data]);
  v29[0] = IDSSendMessageOptionPublicMessageIntentKey;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 type]));
  v30[0] = v15;
  v29[1] = IDSSendMessageOptionQueueOneIdentifierKey;
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
  id v18 = [v12 type];

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v18));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v17, v19));
  v30[1] = v20;
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  id v22 = [v21 mutableCopy];

  if (v10) {
    [v22 addEntriesFromDictionary:v10];
  }
  unsigned int v23 = -[CSDConversationManager broadcastData:onConversation:additionalOptions:]( self,  "broadcastData:onConversation:additionalOptions:",  v14,  v9,  v22);
  id v24 = sub_1001704C4();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v28 = v23;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "(success: %d).", buf, 8u);
  }
}

- (void)setActivityAuthorization:(BOOL)a3 forBundleID:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = sub_1001704C4();
  __int128 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting activity authorization %d for %@",  (uint8_t *)v9,  0x12u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CPApplicationPolicyManager sharedInstance]( &OBJC_CLASS___CPApplicationPolicyManager,  "sharedInstance"));
  [v8 setAuthorization:v4 forBundleID:v5];
}

- (void)setAutoSharePlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting auto expanse enabled %@",  (uint8_t *)&v8,  0xCu);
  }

  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue( +[CPApplicationPolicyManager sharedInstance]( &OBJC_CLASS___CPApplicationPolicyManager,  "sharedInstance"));
  [v7 setAutoSharePlayEnabled:v3];
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EDE4C;
  v7[3] = &unk_1003D7758;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EE0C4;
  block[3] = &unk_1003D9E70;
  BOOL v19 = a5;
  id v16 = v10;
  __int128 v17 = self;
  id v18 = v11;
  BOOL v20 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync(v12, block);
}

- (void)requestActivityAuthorizationForApplicationWithBundleIdentifier:(id)a3 overrides:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Requesting activity authorization for %@",  (uint8_t *)&v16,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager activityAuthorizationManager](self, "activityAuthorizationManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager screenSharingActivityManager](self, "screenSharingActivityManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localScreenShareAttributes]);
  [v13 requestAuthorizationForApplicationWithBundleIdentifier:v8 preparing:1 overrides:v10 currentScreenShareAttributes:v15 completionHandler:v9];
}

- (void)revokeBackgroundPipAuthorizationsForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EEDF0;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)resetActivitySessionSceneAssociationsForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000EF00C;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleConversation:(id)a3 participantUpdateMessage:(id)a4 fromNormalizedHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (__CFString *)a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v144 = (unint64_t)v9;
    __int16 v145 = 2112;
    id v146 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Handling participant update message: %@ from: %@",  buf,  0x16u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 activeParticipants]);
  id v15 = [v14 count];

  int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 activeParticipants]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

  if (v15 && v17 && [v17 identifier])
  {
    if ((unint64_t)v15 >= 2)
    {
      id v18 = sub_1001704C4();
      BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v144 = (unint64_t)v9;
        BOOL v20 = "[WARN] Ignoring message %@ because multiple participants were specified.";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
        goto LABEL_103;
      }

      goto LABEL_103;
    }

    BOOL v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 localParticipant]);
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationParticipant:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationParticipant:",  v22));
    -[os_log_s addObject:](v19, "addObject:", v23);

    __int128 v139 = 0u;
    __int128 v140 = 0u;
    __int128 v137 = 0u;
    __int128 v138 = 0u;
    id v114 = v8;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 activeRemoteParticipants]);
    id v25 = [v24 countByEnumeratingWithState:&v137 objects:v151 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v113 = v9;
      id v118 = 0LL;
      id v119 = self;
      uint64_t v27 = *(void *)v138;
      while (2)
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v138 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v137 + 1) + 8LL * (void)i);
          id v30 = [v29 identifier];
          if (v30 == [v17 identifier])
          {
            id v31 = v17;
            __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v29 handle]);
            id v33 = v10;
            unsigned __int8 v34 = [v32 isEquivalentToHandle:v10];

            if ((v34 & 1) == 0)
            {
              id v41 = sub_1001704C4();
              __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
              id v10 = v33;
              id v17 = v31;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                id v43 = (__CFString *)objc_claimAutoreleasedReturnValue([v29 handle]);
                *(_DWORD *)buf = 138412802;
                unint64_t v144 = (unint64_t)v31;
                __int16 v145 = 2112;
                id v146 = v43;
                __int16 v147 = 2112;
                unint64_t v148 = (unint64_t)v10;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring participant update message %@ because participant handle %@ does not match message sender %@.",  buf,  0x20u);
              }

              goto LABEL_32;
            }

            if (v118)
            {
              id v35 = sub_1001704C4();
              id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
              id v10 = v33;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v144 = (unint64_t)v114;
                _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Trying to update participant, but one is already found... duplicate participants on conversation? conversation: %@",  buf,  0xCu);
              }

              id v37 = (void *)objc_claimAutoreleasedReturnValue([v29 tuConversationParticipant]);
              id v38 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationParticipant:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationParticipant:",  v37));
              -[os_log_s addObject:](v19, "addObject:", v38);
            }

            else
            {
              id v118 = v29;
              id v10 = v33;
            }

            id v17 = v31;
          }

          else
          {
            id v39 = (void *)objc_claimAutoreleasedReturnValue([v29 tuConversationParticipant]);
            id v40 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationParticipant:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationParticipant:",  v39));
            -[os_log_s addObject:](v19, "addObject:", v40);
          }
        }

        id v26 = [v24 countByEnumeratingWithState:&v137 objects:v151 count:16];
        if (v26) {
          continue;
        }
        break;
      }

- (void)handleConversation:(id)a3 registerMessagesGroupUUIDMessage:(id)a4 fromNormalizedHandle:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received message from %@ to associate conversation %@ with messages group",  (uint8_t *)&v12,  0x16u);
  }

  [v7 registerMessagesGroupAssociation];
}

- (void)handleConversation:(id)a3 removeActivitySession:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 activitySessions]);
  id v13 = [v12 count];

  id v14 = sub_1001704C4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Received remove activity session message %@ from %@",  buf,  0x16u);
    }

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 activitySessions]);
    id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
    if (v17)
    {
      id v18 = v17;
      id v27 = v9;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v15);
          }
          id v21 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v22 = objc_alloc(&OBJC_CLASS___NSUUID);
          unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v21 identifierUUIDString]);
          id v24 = -[NSUUID initWithUUIDString:](v22, "initWithUUIDString:", v23);

          if (v24)
          {
            [v8 removeActivitySessionWithUUID:v24 usingTerminatingHandle:v10];
          }

          else
          {
            id v25 = sub_1001704C4();
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v34 = v21;
              _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Unable to decode UUID from activitySession %@",  buf,  0xCu);
            }
          }
        }

        id v18 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v28,  v32,  16LL);
      }

      while (v18);
      id v9 = v27;
    }
  }

  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Message did not contain a valid activitySession.",  buf,  2u);
  }
}

- (void)handleConversation:(id)a3 updateActivity:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 activitySessions]);
  id v13 = [v12 count];

  id v14 = sub_1001704C4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Updating activities from message: %@",  buf,  0xCu);
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 activitySessions]);
    id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
    if (v17)
    {
      id v18 = v17;
      id v29 = v9;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v15);
          }
          id v21 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          id v22 = objc_alloc(&OBJC_CLASS___NSUUID);
          unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v21 identifierUUIDString]);
          id v24 = -[NSUUID initWithUUIDString:](v22, "initWithUUIDString:", v23);

          if (v24)
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 activity]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 tuConversationActivity]);

            [v26 setTrustedFromHandle:v10];
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 activitySessionManager]);
            [v27 updateActivitySessionWithUUID:v24 activity:v26];
          }

          else
          {
            id v28 = sub_1001704C4();
            id v26 = (void *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v21;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v26,  OS_LOG_TYPE_ERROR,  "Unable to decode UUID from activitySession %@",  buf,  0xCu);
            }
          }
        }

        id v18 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
      }

      while (v18);
      id v9 = v29;
    }
  }

  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Message did not contain a valid activitySession.",  buf,  2u);
  }
}

- (void)handleConversation:(id)a3 addHighlight:(id)a4 fromHandle:(id)a5
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue", a3, a4, a5));
  dispatch_assert_queue_V2(v5);
}

- (void)handleConversation:(id)a3 removeHighlight:(id)a4 fromHandle:(id)a5
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue", a3, a4, a5));
  dispatch_assert_queue_V2(v5);
}

- (void)handleConversation:(id)a3 screenShareRequest:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v12 = [v11 requestToScreenShareEnabled];

  if (v12)
  {
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
    dispatch_assert_queue_V2(v13);

    id v14 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Received screen share request for conversation %@ with message %@ from handle %@",  buf,  0x20u);
    }

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v9 screenShareContext]);
    if (!v16)
    {
      id v23 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Message did not contain a valid screen share context.",  buf,  2u);
      }

      goto LABEL_18;
    }

    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 remoteParticipantForHandle:v10]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 screenShareContext]);
    unsigned int v19 = [v18 type];

    if (v19)
    {
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v9 screenShareContext]);
      unsigned int v21 = [v20 type];

      if (v21 != 2)
      {
LABEL_18:

        goto LABEL_19;
      }

      id v22 = (id)objc_claimAutoreleasedReturnValue([v9 screenShareContext]);
      -[CSDConversationManager removeScreenShareRequestFromParticipant:conversation:screenShareContext:]( self,  "removeScreenShareRequestFromParticipant:conversation:screenShareContext:",  v17,  v8,  v22);
    }

    else
    {
      if (-[CSDConversationManager conversationContainsScreenShareRequest:localRequest:requestHandle:]( self,  "conversationContainsScreenShareRequest:localRequest:requestHandle:",  v8,  0LL,  v10))
      {
        id v24 = sub_1001704C4();
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1002B615C();
        }

        goto LABEL_18;
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 screenShareContext]);
      id isHandleEligibleForScreenSharingRequestsBlock = self->_isHandleEligibleForScreenSharingRequestsBlock;
      id v29 = 0LL;
      id v28 = (void *)objc_claimAutoreleasedReturnValue( [v26 incomingScreenShareRequestFromParticipant:v17 handleEligibilityBlock:isHandleEligibleForScreenSharingRequestsBlock error:&v29]);
      id v22 = v29;

      if (v28) {
        [v8 addScreenSharingRequest:v28];
      }
    }

    goto LABEL_18;
  }

- (void)handleConversation:(id)a3 screenShareResponse:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v12 = [v11 requestToScreenShareEnabled];

  if (v12)
  {
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
    dispatch_assert_queue_V2(v13);

    id v14 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412802;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Received screen share response for conversation %@ with message %@ from handle %@",  (uint8_t *)&v23,  0x20u);
    }

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v9 screenShareContext]);
    if (v16)
    {
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 remoteParticipantForHandle:v10]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 screenShareContext]);
      unsigned int v19 = [v18 type];

      if ((v19 & 0xFFFFFFFE) == 2)
      {
        BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 screenShareContext]);
        -[CSDConversationManager removeScreenShareRequestFromParticipant:conversation:screenShareContext:]( self,  "removeScreenShareRequestFromParticipant:conversation:screenShareContext:",  v17,  v8,  v20);
      }

      else
      {
        id v22 = sub_1001704C4();
        BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412290;
          id v24 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received screen share response with invalid type %@",  (uint8_t *)&v23,  0xCu);
        }
      }
    }

    else
    {
      id v21 = sub_1001704C4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] Message did not contain a valid screen share context.",  (uint8_t *)&v23,  2u);
      }
    }
  }
}

- (void)removeScreenShareRequestFromParticipant:(id)a3 conversation:(id)a4 screenShareContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 screenShareUUID]);
  unsigned int v12 = -[NSUUID initWithUUIDString:](v10, "initWithUUIDString:", v11);

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 screenSharingRequests]);
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v24 = v9;
    id v15 = v7;
    uint64_t v16 = *(void *)v27;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUID]);
        unsigned int v20 = [v19 isEqual:v12];

        if (v20)
        {
          id v14 = v18;
          goto LABEL_11;
        }
      }

      id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }

- (void)handleConversation:(id)a3 updateActivityImage:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = (NSUUID *)a4;
  __int16 v63 = (NSUUID *)a5;
  __int128 v60 = self;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  __int128 v59 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID activitySessions](v9, "activitySessions"));
  id v12 = [v11 count];

  id v13 = sub_1001704C4();
  log = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v14 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    id v15 = v9;
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Updating activity images from message: %@",  buf,  0xCu);
    }

    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    log = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSUUID activitySessions](v9, "activitySessions"));
    id v67 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v82,  v93,  16LL);
    if (v67)
    {
      __int128 v58 = &v87;
      uint64_t v66 = *(void *)v83;
      __int128 v64 = v8;
      while (1)
      {
        for (i = 0LL; i != v67; i = (char *)i + 1)
        {
          if (*(void *)v83 != v66) {
            objc_enumerationMutation(log);
          }
          id v17 = *(NSUUID **)(*((void *)&v82 + 1) + 8LL * (void)i);
          id v18 = objc_alloc(&OBJC_CLASS___NSUUID);
          unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID identifierUUIDString](v17, "identifierUUIDString"));
          unsigned int v20 = -[NSUUID initWithUUIDString:](v18, "initWithUUIDString:", v19);

          if (v20)
          {
            __int128 v80 = 0u;
            __int128 v81 = 0u;
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 activitySessions]);
            id v22 = [v21 countByEnumeratingWithState:&v78 objects:v92 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v79;
              while (2)
              {
                for (j = 0LL; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v79 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  __int128 v26 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)j);
                  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier", v58));
                  unsigned int v28 = [v27 isEqual:v20];

                  if (v28)
                  {
                    uint64_t v29 = v26;
                    goto LABEL_20;
                  }
                }

                id v23 = [v21 countByEnumeratingWithState:&v78 objects:v92 count:16];
                if (v23) {
                  continue;
                }
                break;
              }

              uint64_t v29 = 0LL;
LABEL_20:
              id v8 = v64;
            }

            else
            {
              uint64_t v29 = 0LL;
            }

            id v31 = (void *)objc_claimAutoreleasedReturnValue([v8 stagedActivitySession]);
            __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUID]);
            unsigned int v33 = [v32 isEqual:v20];

            if (v33) {
              uint64_t v34 = objc_claimAutoreleasedReturnValue([v8 stagedActivitySession]);
            }
            else {
              uint64_t v34 = 0LL;
            }
            if (v29 | v34)
            {
              id v35 = objc_alloc(&OBJC_CLASS___NSUUID);
              id v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID activity](v17, "activity"));
              id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 identifierUUIDString]);
              id v38 = -[NSUUID initWithUUIDString:](v35, "initWithUUIDString:", v37);

              if (v38)
              {
                if (v29) {
                  id v39 = (void *)v29;
                }
                else {
                  id v39 = (void *)v34;
                }
                __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "activity", v58));
                id v43 = (NSUUID *)objc_claimAutoreleasedReturnValue([v42 originator]);
                if (!v43)
                {
                  id v44 = (void *)objc_claimAutoreleasedReturnValue([v8 localMember]);
                  id v43 = (NSUUID *)objc_claimAutoreleasedReturnValue([v44 handle]);
                }

                if ((-[NSUUID isEquivalentToHandle:](v43, "isEquivalentToHandle:", v63) & 1) != 0)
                {
                  __int128 v61 = v42;
                  id v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID activity](v17, "activity"));
                  unint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 activityMetadata]);

                  uint64_t v62 = v46;
                  if ((-[os_log_s hasImage](v46, "hasImage") & 1) != 0)
                  {
                    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s image](v46, "image"));
                    id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 _FTOptionallyDecompressData]);

                    v70[0] = _NSConcreteStackBlock;
                    v70[1] = 3221225472LL;
                    v70[2] = sub_1000F1678;
                    v70[3] = &unk_1003D9EC0;
                    id v71 = (id)v29;
                    id v72 = v38;
                    id v73 = v20;
                    id v74 = v48;
                    id v75 = (id)v34;
                    id v76 = v60;
                    id v77 = v64;
                    id v49 = v48;
                    id v50 = objc_retainBlock(v70);
                    id v51 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager imageTranscoder](v60, "imageTranscoder"));
                    v68[0] = _NSConcreteStackBlock;
                    v68[1] = 3221225472LL;
                    v68[2] = sub_1000F18F0;
                    v68[3] = &unk_1003D9F10;
                    v68[4] = v60;
                    id v69 = v50;
                    BOOL v52 = v50;
                    [v51 generatePreviewImageFromData:v49 completionHandler:v68];

                    id v8 = v64;
                    id v53 = v49;
                    __int128 v54 = v62;
                  }

                  else
                  {
                    id v56 = sub_1001704C4();
                    id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                      sub_1002B61BC((uint64_t)v86, (uint64_t)v17);
                    }
                    id v8 = v64;
                    __int128 v54 = v62;
                    id v53 = v57;
                  }

                  __int16 v42 = v61;
                }

                else
                {
                  id v55 = sub_1001704C4();
                  __int128 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v89 = v63;
                    __int16 v90 = 2112;
                    id v91 = v43;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "Not updating activity because handle: %@ isn't the originator of the activity: %@",  buf,  0x16u);
                  }
                }

LABEL_48:
              }

              else
              {
                id v41 = sub_1001704C4();
                __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
                {
                  id v43 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NSUUID activity](v17, "activity"));
                  *(_DWORD *)buf = 138412290;
                  id v89 = v43;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v42,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not updating activity, no activity UUID was provided in message: %@",  buf,  0xCu);
                  goto LABEL_48;
                }
              }
            }

            else
            {
              id v40 = sub_1001704C4();
              id v38 = (NSUUID *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v89 = v20;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not updating activity, couldn't find activitySession || stagedActivitySession with UUID: %@",  buf,  0xCu);
              }
            }

            goto LABEL_51;
          }

          id v30 = sub_1001704C4();
          uint64_t v29 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v89 = v17;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  OS_LOG_TYPE_ERROR,  "Unable to decode UUID from activitySession %@",  buf,  0xCu);
          }

- (void)handleConversation:(id)a3 receivedEndorsementForMember:(id)a4 fromHandle:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received endorsement message: %@",  (uint8_t *)&v15,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 addedMembers]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 tuConversationMember]);

  [v8 updateMemberValidationSource:v14 source:1];
}

- (void)handleConversation:(id)a3 receivedActivitySession:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 activitySessions]);
  id v13 = [v12 count];

  id v14 = sub_1001704C4();
  log = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v15 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Received new activity for conversation %@",  buf,  0xCu);
    }

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    log = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 activitySessions]);
    id v16 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v37,  v45,  16LL);
    if (v16)
    {
      id v17 = v16;
      id v36 = v10;
      id v34 = v9;
      uint64_t v18 = *(void *)v38;
      while (2)
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(log);
          }
          unsigned int v20 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 activity]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 tuConversationActivity]);

          if (v22)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 metadata]);
            if ([v23 supportsContinuationOnTV])
            {
            }

            else
            {
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 localMember]);
              unsigned int v25 = [v24 isLightweightMember];

              if (v25)
              {
                id v32 = sub_1001704C4();
                unsigned int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v42 = v20;
                  _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Sending conversation back since new activitySession doesn't support aTV handoff. session: %@",  buf,  0xCu);
                }

                [v8 leave];
                goto LABEL_29;
              }
            }
          }

          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager createActivitySession:onConversation:fromHandle:]( self,  "createActivitySession:onConversation:fromHandle:",  v20,  v8,  v36));
          if (v26)
          {
            __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 remoteParticipantForHandle:v36]);
            if (v27)
            {
              unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 tuConversationActivitySession]);
              -[CSDConversationManager postSessionStartedForSession:originator:conversation:]( self,  "postSessionStartedForSession:originator:conversation:",  v28,  v27,  v8);
            }

            else
            {
              id v31 = sub_1001704C4();
              unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v42 = v36;
                __int16 v43 = 2112;
                id v44 = v26;
                _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Not posting start session event. Could not find participant for handle %@ for session %@",  buf,  0x16u);
              }
            }
          }

          else
          {
            id v29 = sub_1001704C4();
            __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
              *(_DWORD *)buf = 138412546;
              id v42 = v20;
              __int16 v43 = 2112;
              id v44 = v30;
              _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "Failed to add activitySession: %@ to conversation UUID: %@",  buf,  0x16u);
            }
          }
        }

        id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v37,  v45,  16LL);
        if (v17) {
          continue;
        }
        break;
      }

- (void)handleConversation:(id)a3 updateGuestMode:(id)a4 fromHandle:(id)a5
{
  id v40 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager serverBag](self, "serverBag"));
  unsigned __int8 v12 = [v11 isGuestModeSupported];

  if ((v12 & 1) != 0)
  {
    unsigned __int8 v13 = [v8 hasGuestModeEnabled];
    id v14 = sub_1001704C4();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received guest mode update for participant in conversation %@",  buf,  0xCu);
      }

      id v39 = v8;
      id v17 = [v8 guestModeEnabled];
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v40 activeRemoteParticipants]);
      id v19 = [v18 countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v49;
LABEL_7:
        uint64_t v22 = 0LL;
        while (1)
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v48 + 1) + 8 * v22);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 handle]);
          unsigned int v25 = [v24 isEquivalentToHandle:v9];

          if (v25) {
            break;
          }
          if (v20 == (id)++v22)
          {
            id v20 = [v18 countByEnumeratingWithState:&v48 objects:v57 count:16];
            if (v20) {
              goto LABEL_7;
            }
            goto LABEL_13;
          }
        }

        [v23 setGuestModeEnabled:v17];

        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
        id v29 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
        if (!v29) {
          goto LABEL_27;
        }
        id v30 = v29;
        id v38 = v9;
        uint64_t v31 = *(void *)v45;
        do
        {
          for (i = 0LL; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v45 != v31) {
              objc_enumerationMutation(v16);
            }
            uint64_t v33 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
            id v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "tuConversation", v38));
            id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
            id v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v35 objectForKey:v33]);

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1000F231C;
            block[3] = &unk_1003D7828;
            void block[4] = v33;
            id v42 = v34;
            __int16 v43 = self;
            id v37 = v34;
            dispatch_async(v36, block);
          }

          id v30 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
        }

        while (v30);
        id v9 = v38;
        id v8 = v39;
      }

      else
      {
LABEL_13:

        id v26 = sub_1001704C4();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v40 activeRemoteParticipants]);
          *(_DWORD *)buf = 138412546;
          id v54 = v9;
          __int16 v55 = 2112;
          id v56 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Ignoring guest mode update message because the from-handle %@ did not match any active remote participants %@",  buf,  0x16u);
        }

- (void)updateParticipantPresentationContexts:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F251C;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)buzzMember:(id)a3 conversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F2758;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)kickMember:(id)a3 conversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F2C74;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (BOOL)conversationContainsScreenShareRequest:(id)a3 localRequest:(BOOL)a4 requestHandle:(id)a5
{
  int v5 = a4;
  id v7 = a5;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "screenSharingRequests", 0));
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v13 isLocallyOriginated] == v5)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handle]);
          unsigned __int8 v15 = [v14 isEquivalentToHandle:v7];

          if ((v15 & 1) != 0)
          {
            BOOL v16 = 1;
            goto LABEL_12;
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (void)processUpdatedNickname:(id)a3 forHandle:(id)a4 conversationUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F3078;
  v15[3] = &unk_1003D7B28;
  void v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)noticeManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000F36A8;
  v16[3] = &unk_1003D7B28;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsOnConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F3A64;
  block[3] = &unk_1003D7918;
  BOOL v12 = a3;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)updateLocalMemberNickname:(id)a3 conversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F3CA0;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager screenSharingActivityManager](self, "screenSharingActivityManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 latestRemoteAttributes]);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Asked to get latest remote attributes, returning: %@",  (uint8_t *)&v9,  0xCu);
  }

  v4[2](v4, v6);
}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F4088;
  block[3] = &unk_1003D9F60;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)generateLinkForConversationUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F4410;
  block[3] = &unk_1003D9FD8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (id)_getActivatedLinkWithHandle:(id)a3 updateGroupUUID:(id)a4 updateInvitedHandles:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 getInactiveLinkForHandle:v8]);

  if (!v12)
  {
    id v19 = sub_1001704C4();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Failed to fetch inactive link, generating new links for %@",  (uint8_t *)&v24,  0xCu);
    }

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
    [v21 generateAllInactiveLinksFor:v8];
    goto LABEL_10;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pseudonym]);
  unsigned int v14 = -[CSDConversationManager isHandleStringLocalPseudonym:](self, "isHandleStringLocalPseudonym:", v13);

  if (!v14)
  {
    id v22 = sub_1001704C4();
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "Fetched non-local inactive link %@",  (uint8_t *)&v24,  0xCu);
    }

- (void)setConversationLink:(id)a3 forConversation:(id)a4 replyToCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  unsigned int v11 = [v9 setConversationLink:v8 allowUpdate:0];
  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      int v17 = 138412290;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "setConversationLink %@ completed",  (uint8_t *)&v17,  0xCu);
    }

    if (v10) {
      v10[2](v10, v8, 0LL);
    }
    -[CSDConversationManager notifyDelegatesOfChangedLink:conversation:]( self,  "notifyDelegatesOfChangedLink:conversation:",  v8,  v9);
    -[CSDConversationManager sendMessagesForCreatedOrChangedLink:conversation:messageType:]( self,  "sendMessagesForCreatedOrChangedLink:conversation:messageType:",  v8,  v9,  11LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsGondola));
    [v9 addRequiredCapabilities:v15 requiredLackOfCapabilities:0];
    goto LABEL_11;
  }

  if (v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 link]);
    int v17 = 138412290;
    id v18 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Did not set conversation link as one already existed: %@",  (uint8_t *)&v17,  0xCu);
  }

  if (v10)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 link]);
    v10[2](v10, v15, 0LL);
LABEL_11:
  }
}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F5014;
  v13[3] = &unk_1003DA000;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F5954;
  v15[3] = &unk_1003DA078;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F5DDC;
  v13[3] = &unk_1003DA000;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)renewLinkIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F62C8;
  block[3] = &unk_1003D9FD8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F6828;
  block[3] = &unk_1003DA168;
  id v20 = v12;
  unint64_t v21 = a5;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(v13, block);
}

- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F6D70;
  block[3] = &unk_1003D9FD8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)generateAllInactiveLinks
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F6E7C;
  block[3] = &unk_1003D7730;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)getInactiveLinkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F7000;
  v7[3] = &unk_1003D82B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)activateLink:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F7350;
  block[3] = &unk_1003D9FD8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000F75BC;
  v15[3] = &unk_1003DA078;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F7A58;
  v6[3] = &unk_1003D7878;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)recoverLinksForPseudonyms:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F7BD4;
  v7[3] = &unk_1003D7758;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4
{
  id v6 = a4;
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F7D40;
  block[3] = &unk_1003D9F60;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)approvePendingMember:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F7EE4;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)rejectPendingMember:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8150;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8394;
  block[3] = &unk_1003D7918;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)addScreenSharingType:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8834;
  block[3] = &unk_1003D78F0;
  BOOL v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F8CD4;
  v7[3] = &unk_1003D82B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8DEC;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F8EC4;
  v7[3] = &unk_1003D7758;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8FC0;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeNonIndefiniteLinks
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F91B0;
  v4[3] = &unk_1003DA1B8;
  v4[4] = self;
  [v3 getActiveLinksWithCreatedOnly:1 completionHandler:v4];
}

- (void)removeConversationWithUUID:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F9644;
  v7[3] = &unk_1003D7758;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addAliasesToConversationContainer:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F9870;
  block[3] = &unk_1003D7828;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)includeMetricsReport:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F9A74;
  block[3] = &unk_1003D7828;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  -[CSDConversationManager setLocalParticipantAudioVideoMode:forConversationUUID:presentationMode:]( self,  "setLocalParticipantAudioVideoMode:forConversationUUID:presentationMode:",  a3,  a4,  a3 == 0);
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4 presentationMode:(unint64_t)a5
{
  id v8 = a4;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000F9CE4;
  v11[3] = &unk_1003DA1E0;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a3;
  unint64_t v14 = a5;
  id v10 = v8;
  dispatch_async(v9, v11);
}

- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4
{
}

- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FA1EC;
  v7[3] = &unk_1003D7758;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setupPendingConversationCleanupTimer
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager pendingConversationCleanupTimer](self, "pendingConversationCleanupTimer"));

  if (v3)
  {
    id v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager pendingConversationCleanupTimer]( self,  "pendingConversationCleanupTimer"));
    dispatch_source_cancel(v4);
  }

  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v5);
  -[CSDConversationManager setPendingConversationCleanupTimer:](self, "setPendingConversationCleanupTimer:", v6);

  id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager pendingConversationCleanupTimer]( self,  "pendingConversationCleanupTimer"));
  dispatch_time_t v8 = dispatch_time(0LL, 300000000000LL);
  dispatch_source_set_timer(v7, v8, 0x45D964B800uLL, 0x4A817C800uLL);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager pendingConversationCleanupTimer](self, "pendingConversationCleanupTimer"));
    *(_DWORD *)buf = 134218498;
    uint64_t v17 = 0x4072C00000000000LL;
    __int16 v18 = 2048;
    uint64_t v19 = 0x4034000000000000LL;
    __int16 v20 = 2112;
    unint64_t v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "setupPendingConversationCleanupTimer: %f %f %@",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, self);
  id v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager pendingConversationCleanupTimer]( self,  "pendingConversationCleanupTimer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000FA670;
  handler[3] = &unk_1003D7DF0;
  objc_copyWeak(&v15, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);

  unint64_t v13 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager pendingConversationCleanupTimer]( self,  "pendingConversationCleanupTimer"));
  dispatch_resume(v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)cleanupExpiredPendingConversations
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  int v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePendingConversationsByPseudonym]( self,  "mutablePendingConversationsByPseudonym"));
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v9);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePendingConversationsByPseudonym]( self,  "mutablePendingConversationsByPseudonym"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dateCreated]);
        [v13 timeIntervalSinceNow];
        double v15 = v14;

        double v16 = -v15;
        if (v15 >= 0.0) {
          double v16 = v15;
        }
        if (v16 > 7200.0) {
          -[NSMutableArray addObject:](v4, "addObject:", v10);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }

    while (v7);
  }

  id v17 = sub_1001704C4();
  __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v36 = 0x40BC200000000000LL;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "cleanupExpiredPendingConversations: %f %@",  buf,  0x16u);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v19 = v4;
  id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      id v23 = 0LL;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v23);
        id v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePendingConversationsByPseudonym]( self,  "mutablePendingConversationsByPseudonym",  (void)v26));
        [v25 setObject:0 forKeyedSubscript:v24];

        id v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v26,  v34,  16LL);
    }

    while (v21);
  }
}

- (void)conversationChanged:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "conversationChanged: %@", buf, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 activeRemoteParticipants]);
  if ([v8 count])
  {
    BOOL v9 = 0;
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 activeLightweightParticipants]);
    BOOL v9 = [v10 count] == 0;
  }

  if ([v4 state] || !v9)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager persistenceController](self, "persistenceController"));
    [v11 updateConversation:v4];
  }

  else
  {
    -[CSDConversationManager conversationInvalidated:](self, "conversationInvalidated:", v4);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tuConversation", v4));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v14 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      id v17 = 0LL;
      do
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)v17);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
        id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v18]);

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000FACD0;
        block[3] = &unk_1003D7828;
        void block[4] = v18;
        id v37 = v12;
        id v38 = self;
        dispatch_async(v20, block);

        id v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }

    while (v15);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager observerToQueue](self, "observerToQueue"));
  id v22 = [v21 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      id v25 = 0LL;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v25);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager observerToQueue](self, "observerToQueue"));
        __int128 v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v27 objectForKey:v26]);

        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        void v30[2] = sub_1000FAE14;
        v30[3] = &unk_1003D7828;
        void v30[4] = v26;
        v30[5] = self;
        id v31 = v12;
        dispatch_async(v28, v30);

        id v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v32 objects:v43 count:16];
    }

    while (v23);
  }
}

- (void)conversationConnectionDidStart:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
    *(_DWORD *)buf = 138412290;
    __int128 v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "conversationConnectionDidStart UUID: %@",  buf,  0xCu);
  }

  uint64_t v18 = v4;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v4 tuConversation]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "conversationManager:connectionDidStartForConversation:") & 1) != 0)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v15]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FB058;
          block[3] = &unk_1003D7828;
          void block[4] = v15;
          id v20 = v9;
          id v21 = self;
          dispatch_async(v17, block);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v12);
  }
}

- (void)conversationInvalidated:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  id v7 = sub_1001704C4();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    uint64_t v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "conversationInvalidated UUID: %@",  (uint8_t *)&v18,  0xCu);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID"));
  [v9 setObject:0 forKeyedSubscript:v6];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager persistenceController](self, "persistenceController"));
  [v10 removeConversation:v4];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager pendingMembershipTracker](self, "pendingMembershipTracker"));
  [v11 clearPendingMembershipFor:v4];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 link]);
  uint64_t v13 = v12;
  if (v12 && [v12 linkLifetimeScope] == (id)1)
  {
    id v14 = sub_1001704C4();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      uint64_t v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "conversationLink should be removed after call was invalidated %@",  (uint8_t *)&v18,  0xCu);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager linkManager](self, "linkManager"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 pseudonym]);
    [v16 invalidateLinkWithPseudonym:v17 deleteReason:7 completionHandler:&stru_1003DA200];
  }

  -[CSDConversationManager notifyDelegatesOfRemovedConversationWithUUID:]( self,  "notifyDelegatesOfRemovedConversationWithUUID:",  v6);
}

- (void)conversationDidLeave:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "conversationDidLeave: %@",  (uint8_t *)&v13,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localMember]);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 association]);

  if (v9) {
    unsigned int v10 = [v9 isPrimary] ^ 1;
  }
  else {
    unsigned int v10 = 0;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localMember]);
  unsigned __int8 v12 = [v11 isLightweightMember];

  if ((v12 & 1) != 0 || v10) {
    -[CSDConversationManager conversationInvalidated:](self, "conversationInvalidated:", v4);
  }
}

- (void)conversation:(id)a3 addedActiveParticipant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v106 = v6;
    __int16 v107 = 2112;
    id v108 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "conversation: %@ addedActiveParticipant: %@",  buf,  0x16u);
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 association]);
  id v82 = v6;
  __int128 v83 = self;
  if (v11)
  {
    unsigned __int8 v12 = (void *)v11;
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
    if ([v13 conversationHandoffEnabled])
    {
      id v14 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CSDConversationManager lockdownModeEnabled](self, "lockdownModeEnabled"));
      char v15 = v14[2]();

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 handle]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 localMember]);
        int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 handle]);
        if ([v16 isEquivalentToHandle:v18])
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v7 association]);
          id v20 = [v19 identifier];
          if (v20 == [v6 localParticipantIdentifier])
          {
            id v21 = [v6 state];

            if (v21 == (id)3)
            {
              id v22 = sub_1001704C4();
              __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
                *(_DWORD *)buf = 138412546;
                id v106 = v24;
                __int16 v107 = 2112;
                id v108 = v7;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Conversation UUID %@ was continued on another device as participant %@, leaving...",  buf,  0x16u);
              }

              __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
              if ([v25 groupFacetimeAsAServiceEnabled])
              {
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);

                if (v26)
                {
                  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
                  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v6 provider]);
                  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v27 serviceForProvider:v28]);

LABEL_43:
                  __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v7 activeIDSDestination]);
                  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v29 deviceForFromID:v60]);

                  if (v61) {
                    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "csd_localizedDeviceCategory"));
                  }
                  else {
                    uint64_t v62 = 0LL;
                  }
                  v99[0] = _NSConcreteStackBlock;
                  v99[1] = 3221225472LL;
                  v99[2] = sub_1000FBE9C;
                  v99[3] = &unk_1003D7B28;
                  v99[4] = self;
                  id v63 = v6;
                  id v100 = v63;
                  id v101 = v7;
                  id v102 = v62;
                  id v64 = v62;
                  unsigned int v65 = objc_retainBlock(v99);
                  if (([v63 supportsLeaveContext] & 1) != 0
                    || (uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v63 activeRemoteParticipants]),
                        id v67 = v7,
                        id v68 = [v66 count],
                        v66,
                        BOOL v69 = (unint64_t)v68 >= 4,
                        id v7 = v67,
                        v69))
                  {
                    id v70 = sub_1001704C4();
                    id v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                    {
                      id v72 = (void *)objc_claimAutoreleasedReturnValue([v63 UUID]);
                      *(_DWORD *)buf = 138412290;
                      id v106 = v72;
                      _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "Leaving immediately due to handoff since the conversation with UUID: %@ supports leave context o r was GFT before handoff",  buf,  0xCu);
                    }

                    ((void (*)(void *))v65[2])(v65);
                  }

                  else
                  {
                    id v73 = sub_1001704C4();
                    id v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
                    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                    {
                      id v76 = (void *)objc_claimAutoreleasedReturnValue([v63 UUID]);
                      *(_DWORD *)buf = 138412290;
                      id v106 = v76;
                      _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "Delaying leaving due to handoff since the conversation with UUID: %@ does not support leave cont ext and was 1:1 before handoff",  buf,  0xCu);
                    }

                    id v77 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager serverBag](self, "serverBag"));
                    dispatch_time_t v78 = dispatch_time(0, 1000000000 * (void)[v77 handoffUPlusOneLeaveDelay]);
                    __int128 v79 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
                    dispatch_after(v78, v79, v65);
                  }

                  id v6 = v82;
                  goto LABEL_17;
                }
              }

              else
              {
              }

              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
              goto LABEL_43;
            }

            goto LABEL_29;
          }
        }

LABEL_29:
        id v45 = sub_1001704C4();
        id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v7 association]);
          id v48 = [v47 identifier];
          id v49 = [v6 localParticipantIdentifier];
          id v50 = [v6 state];
          *(_DWORD *)buf = 138413058;
          id v106 = v7;
          __int16 v107 = 2048;
          id v108 = v48;
          __int16 v109 = 2048;
          id v110 = v49;
          __int16 v111 = 2048;
          id v112 = v50;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Added participant %@ is a handoff continuation for identifier %llu, but my local identifier is %llu. Not lea ving, state: %ld",  buf,  0x2Au);
        }

        [v6 updateReportInfoForHandoffParticipant:v7];
        __int128 v97 = 0u;
        __int128 v98 = 0u;
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
        id v51 = [v29 countByEnumeratingWithState:&v95 objects:v104 count:16];
        if (v51)
        {
          id v52 = v51;
          id obja = v7;
          uint64_t v53 = *(void *)v96;
          do
          {
            for (i = 0LL; i != v52; i = (char *)i + 1)
            {
              if (*(void *)v96 != v53) {
                objc_enumerationMutation(v29);
              }
              uint64_t v55 = *(void *)(*((void *)&v95 + 1) + 8LL * (void)i);
              if ((objc_opt_respondsToSelector(v55, "conversationManager:reportedRemoteDoesHandedOffForConversation:") & 1) != 0)
              {
                id v56 = (void *)objc_claimAutoreleasedReturnValue([v6 tuConversation]);
                id v57 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](v83, "delegateToQueue"));
                __int128 v58 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v57 objectForKey:v55]);

                id v6 = v82;
                v92[0] = _NSConcreteStackBlock;
                v92[1] = 3221225472LL;
                v92[2] = sub_1000FC1E4;
                v92[3] = &unk_1003D7828;
                v92[4] = v55;
                id v93 = v56;
                uint64_t v94 = v83;
                id v59 = v56;
                dispatch_async(v58, v92);
              }
            }

            id v52 = [v29 countByEnumeratingWithState:&v95 objects:v104 count:16];
          }

          while (v52);
          self = v83;
          id v7 = obja;
        }

        goto LABEL_17;
      }
    }

    else
    {
    }
  }

  id v30 = sub_1001704C4();
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v106 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v29,  OS_LOG_TYPE_DEFAULT,  "There was no participant association for added participant: %@",  buf,  0xCu);
  }

- (void)conversation:(id)a3 didChangeLocalParticipant:(id)a4 broadcastActivitySession:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (CSDMessagingConversationMessage *)a3;
  id v9 = a4;
  unsigned int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  if (-[CSDMessagingConversationMessage state](v8, "state") == (id)3
    || -[CSDMessagingConversationMessage state](v8, "state") == (id)2)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager screenCaptureQueue](self, "screenCaptureQueue"));
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage UUID](v8, "UUID"));
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

    if ([v9 audioVideoMode] && v13)
    {
      id v14 = sub_1001704C4();
      char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "executing queued up screenEnabled block since local participant mode changed",  buf,  2u);
      }

      (*((void (**)(os_log_s *))v13 + 2))(v13);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager screenCaptureQueue](self, "screenCaptureQueue"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage UUID](v8, "UUID"));
      [v16 setObject:0 forKeyedSubscript:v17];
    }

    int v18 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationParticipant);
    -[CSDMessagingConversationParticipant setAvMode:](v18, "setAvMode:", [v9 audioVideoMode]);
    -[CSDMessagingConversationParticipant setPresentationMode:]( v18,  "setPresentationMode:",  [v9 presentationMode]);
    -[CSDMessagingConversationParticipant setIdentifier:](v18, "setIdentifier:", [v9 identifier]);
    if (-[CSDMessagingConversationParticipant identifier](v18, "identifier"))
    {
      BOOL v55 = v5;
      id v58 = v9;
      uint64_t v19 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage groupUUID](v8, "groupUUID"));
      id v21 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v19,  "initWithType:groupUUID:link:",  33LL,  v20,  0LL);

      id v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutableConversationsRequestingUpgradeWithPreferences]( self,  "mutableConversationsRequestingUpgradeWithPreferences"));
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage UUID](v8, "UUID"));
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 objectForKey:v23]);

      if (v24)
      {
        -[CSDMessagingConversationMessage setTUInvitationPreferences:](v21, "setTUInvitationPreferences:", v24);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutableConversationsRequestingUpgradeWithPreferences]( self,  "mutableConversationsRequestingUpgradeWithPreferences"));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage UUID](v8, "UUID"));
        [v25 removeObjectForKey:v26];
      }

      id v57 = (void *)v24;
      -[CSDMessagingConversationMessage addActiveParticipants:](v21, "addActiveParticipants:", v18);
      v66[0] = IDSSendMessageOptionPublicMessageIntentKey;
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 33LL));
      v66[1] = IDSSendMessageOptionQueueOneIdentifierKey;
      v67[0] = v27;
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CSDMessagingConversationParticipant identifier](v18, "identifier")));
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 33LL));
      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v28,  v29));
      v67[1] = v30;
      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  2LL));

      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v21, "data"));
      -[CSDConversationManager broadcastData:onConversation:additionalOptions:]( self,  "broadcastData:onConversation:additionalOptions:",  v32,  v8,  v31);

      if (v55)
      {
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage activitySessions](v8, "activitySessions"));
        id v34 = [v33 countByEnumeratingWithState:&v59 objects:v65 count:16];
        if (v34)
        {
          id v35 = v34;
          id v54 = v31;
          id v56 = v21;
          uint64_t v53 = v13;
          uint64_t v36 = *(void *)v60;
LABEL_14:
          uint64_t v37 = 0LL;
          while (1)
          {
            if (*(void *)v60 != v36) {
              objc_enumerationMutation(v33);
            }
            id v38 = *(void **)(*((void *)&v59 + 1) + 8 * v37);
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 activity]);
            unsigned int v40 = [v39 isSystemActivity];

            if (!v40) {
              break;
            }
            if (v35 == (id)++v37)
            {
              id v35 = [v33 countByEnumeratingWithState:&v59 objects:v65 count:16];
              if (v35) {
                goto LABEL_14;
              }
              id v41 = v33;
              int v13 = v53;
              goto LABEL_28;
            }
          }

          id v41 = v38;

          int v13 = v53;
          id v31 = v54;
          id v21 = v56;
          if (!v41) {
            goto LABEL_31;
          }
          id v43 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
          id v44 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage groupUUID](v8, "groupUUID"));
          id v45 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v43,  "initWithType:groupUUID:link:",  8LL,  v44,  0LL);

          v63[0] = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
          id v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsCo));
          v64[0] = v46;
          v63[1] = IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey;
          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsAVLess));
          v64[1] = v47;
          id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  2LL));

          id v49 = sub_1001704C4();
          id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            id v51 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage UUID](v8, "UUID"));
            *(_DWORD *)buf = 138412546;
            id v69 = v51;
            __int16 v70 = 2112;
            id v71 = v45;
            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "For AVLess to AV upgrade of conversation UUID %@, sending an AddActivitySession message to devices lacking AVLess support: %@",  buf,  0x16u);
          }

          -[CSDConversationManager sendMessage:forConversation:withActivitySession:additionalOptions:]( self,  "sendMessage:forConversation:withActivitySession:additionalOptions:",  v45,  v8,  v41,  v48);
          id v52 = (void *)objc_claimAutoreleasedReturnValue([v41 tuConversationActivitySession]);
          -[CSDConversationManager broadcastImageForSession:onConversation:]( self,  "broadcastImageForSession:onConversation:",  v52,  v8);

LABEL_28:
          id v31 = v54;
          id v21 = v56;
        }

        else
        {
          id v41 = v33;
        }
      }

- (void)conversation:(id)a3 removedActiveParticipant:(id)a4 withLeaveReason:(unint64_t)a5
{
  unint64_t v18 = a5;
  id v22 = a3;
  id v21 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v22;
    __int16 v39 = 2112;
    id v40 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "conversation: %@ removedActiveParticipant: %@",  buf,  0x16u);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v20 = *(void *)v33;
    do
    {
      unsigned __int8 v12 = 0LL;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tuConversation", v18));
        char v15 = (void *)objc_claimAutoreleasedReturnValue([v21 tuConversationParticipant]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
        id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v13]);

        if ((objc_opt_respondsToSelector(v13, "conversationManager:conversation:removedActiveParticipant:") & 1) != 0)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FCE0C;
          block[3] = &unk_1003D7B28;
          void block[4] = v13;
          id v29 = v14;
          id v30 = self;
          id v31 = v15;
          dispatch_async(v17, block);
        }

        if ((objc_opt_respondsToSelector(v13, "conversationManager:conversation:removedActiveParticipant:withReason:") & 1) != 0)
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_1000FCF50;
          v23[3] = &unk_1003D7D28;
          v23[4] = v13;
          id v24 = v14;
          __int128 v25 = self;
          id v26 = v15;
          unint64_t v27 = v18;
          dispatch_async(v17, v23);
        }

        unsigned __int8 v12 = (char *)v12 + 1;
      }

      while (v11 != v12);
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v11);
  }
}

- (void)conversation:(id)a3 updatedActiveParticipant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "conversation: %@ participant: %@", buf, 0x16u);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 tuConversation]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
        unint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v15]);

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000FD2C8;
        block[3] = &unk_1003D7828;
        void block[4] = v15;
        id v22 = v16;
        __int128 v23 = self;
        id v19 = v16;
        dispatch_async(v18, block);
      }

      id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v12);
  }
}

- (void)conversation:(id)a3 updatedActiveParticipantWithScreenSharing:(id)a4
{
  id v18 = a3;
  id v17 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
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
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "conversationManager:conversationScreenSharingChanged:forParticipant:") & 1) != 0)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v18 tuConversation]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FD604;
          block[3] = &unk_1003D7B28;
          void block[4] = v12;
          id v20 = v13;
          id v21 = self;
          id v22 = v17;
          id v16 = v13;
          dispatch_async(v15, block);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v9);
  }
}

- (void)conversationDidStopScreenCapture:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  unsigned int v6 = [v5 sckSystemPickerEnabled];

  if (v6)
  {
    id v7 = sub_1001704C4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Requesting to stop the screensharing activity session since screen capture ended",  v10,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager screenSharingActivityManager](self, "screenSharingActivityManager"));
    [v9 stopActivitySession];
  }

- (void)conversation:(id)a3 mediaPrioritiesChangedForParticipant:(id)a4
{
  id v19 = a3;
  id v18 = a4;
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v11,  "conversationManager:conversation:mediaPrioritiesDidChangeForParticipant:") & 1) != 0)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v19 tuConversation]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v18 tuConversationParticipant]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v11]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FDA30;
          block[3] = &unk_1003D7B28;
          void block[4] = v11;
          id v22 = v12;
          __int128 v23 = self;
          id v24 = v13;
          id v16 = v13;
          id v17 = v12;
          dispatch_async(v15, block);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v8);
  }
}

- (void)conversation:(id)a3 participant:(id)a4 didReact:(id)a5
{
  id v22 = a3;
  id v21 = a4;
  id v20 = a5;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "conversationManager:conversation:participant:didReact:") & 1) != 0)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v22 tuConversation]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v21 tuConversationParticipant]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v13]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FDDA8;
          block[3] = &unk_1003D7B00;
          void block[4] = v13;
          id v25 = v14;
          __int128 v26 = self;
          id v27 = v15;
          id v28 = v20;
          id v18 = v15;
          id v19 = v14;
          dispatch_async(v17, block);
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v10);
  }
}

- (void)conversation:(id)a3 participantDidStopReacting:(id)a4
{
  id v19 = a3;
  id v18 = a4;
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "conversationManager:conversation:participantDidStopReacting:") & 1) != 0)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v19 tuConversation]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v18 tuConversationParticipant]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v11]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FE0FC;
          block[3] = &unk_1003D7B28;
          void block[4] = v11;
          id v22 = v12;
          __int128 v23 = self;
          id v24 = v13;
          id v16 = v13;
          id v17 = v12;
          dispatch_async(v15, block);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v8);
  }
}

- (void)conversation:(id)a3 requestBlobRecoveryForParticipantDestination:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, BOOL))a5;
  id v10 = a3;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = TULoggableStringForHandle(v8);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v21 = 138412290;
    id v22 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Requesting blob recovery for %@",  (uint8_t *)&v21,  0xCu);
  }

  id v16 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 groupUUID]);
  id v18 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v16,  "initWithType:groupUUID:link:",  4LL,  v17,  0LL);

  -[CSDMessagingConversationMessage setRequestBlobRecoveryOptions:](v18, "setRequestBlobRecoveryOptions:", 1LL);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v18, "data"));
  BOOL v20 = -[CSDConversationManager sendData:onConversation:toDestinationID:]( self,  "sendData:onConversation:toDestinationID:",  v19,  v10,  v8);

  v9[2](v9, v20);
}

- (void)conversation:(id)a3 sendDeclineMessageToParticipantDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = TULoggableStringForHandle(v6);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v17 = 138412290;
    id v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Sending decline message for %@",  (uint8_t *)&v17,  0xCu);
  }

  uint64_t v13 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 groupUUID]);
  uint64_t v15 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v13,  "initWithType:groupUUID:link:",  9LL,  v14,  0LL);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v15, "data"));
  -[CSDConversationManager sendData:onConversation:toDestinationID:]( self,  "sendData:onConversation:toDestinationID:",  v16,  v7,  v6);
}

- (void)conversation:(id)a3 failedWithContext:(id)a4
{
  id v18 = a3;
  id v17 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
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
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "conversationManager:conversation:failedWithContext:") & 1) != 0)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v18 tuConversation]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FE728;
          block[3] = &unk_1003D7B28;
          void block[4] = v12;
          id v20 = v13;
          int v21 = self;
          id v22 = v17;
          id v16 = v13;
          dispatch_async(v15, block);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v9);
  }
}

- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationNoticeManger](self, "conversationNoticeManger"));
  id v20 = v7;
  int v21 = v6;
  [v9 conversation:v6 receivedActivitySessionEvent:v7];

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "conversationManager:conversation:receivedActivitySessionEvent:") & 1) != 0)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v21 tuConversation]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v15]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FEA88;
          block[3] = &unk_1003D7B28;
          void block[4] = v15;
          id v23 = v16;
          __int128 v24 = self;
          id v25 = v20;
          id v19 = v16;
          dispatch_async(v18, block);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v12);
  }
}

- (void)conversation:(id)a3 activitySessionChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
    int v12 = 138412546;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "conversation UUID: %@ activitySessionChanged: %@",  (uint8_t *)&v12,  0x16u);
  }

  -[CSDConversationManager conversationChanged:](self, "conversationChanged:", v6);
}

- (void)conversation:(id)a3 didChangeStateForActivitySession:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v19 = v6;
  if ([v6 state] == (id)4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 postNotificationName:@"CSDSharePlayMediaDidHandoffNotification" object:v20];
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, "conversationManager:conversation:didChangeStateForActivitySession:") & 1) != 0)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v20 tuConversation]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v14]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FEF14;
          block[3] = &unk_1003D7B28;
          void block[4] = v14;
          id v22 = v15;
          id v23 = self;
          id v24 = v19;
          id v18 = v15;
          dispatch_async(v17, block);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v11);
  }
}

- (void)conversation:(id)a3 didChangeSceneAssociationForActivitySession:(id)a4
{
  id v19 = a3;
  id v20 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Scene association changed for activity session: %@",  buf,  0xCu);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector( v14,  "conversationManager:conversation:didChangeSceneAssociationForActivitySession:") & 1) != 0)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v19 tuConversation]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v14]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FF2A4;
          block[3] = &unk_1003D7B28;
          void block[4] = v14;
          id v22 = v15;
          id v23 = self;
          id v24 = v20;
          id v18 = v15;
          dispatch_async(v17, block);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v11);
  }
}

- (void)conversation:(id)a3 appLaunchState:(unint64_t)a4 forActivitySession:(id)a5
{
  id v23 = a3;
  id v22 = a5;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v23 UUID]);
    *(_DWORD *)buf = 134218498;
    unint64_t v35 = a4;
    __int16 v36 = 2112;
    id v37 = v22;
    __int16 v38 = 2112;
    __int16 v39 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "App launch state changed to: %lu for activity session: %@ on conversation with UUID: %@",  buf,  0x20u);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v16, "conversationManager:conversation:appLaunchState:forActivitySession:") & 1) != 0)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v23 tuConversation]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v16]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FF66C;
          block[3] = &unk_1003D7D28;
          void block[4] = v16;
          id v25 = v17;
          __int128 v26 = self;
          unint64_t v28 = a4;
          id v27 = v22;
          id v20 = v17;
          dispatch_async(v19, block);
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v13);
  }
}

- (void)conversation:(id)a3 activityChangedOnSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v6;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "conversation: %@ activityChangedOnSession: %@",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 activity]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 originator]);

  if (!v12)
  {
    id v13 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUUID]);
    id v15 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v13,  "initWithType:groupUUID:link:",  23LL,  v14,  0LL);

    uint64_t v16 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivitySession);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 activity]);
    id v18 = [v17 copy];

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
    -[CSDMessagingConversationActivitySession setIdentifierUUIDString:](v16, "setIdentifierUUIDString:", v20);

    int v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingConversationActivity activityWithCSDConversationActivity:fromConversation:forStorage:]( &OBJC_CLASS___CSDMessagingConversationActivity,  "activityWithCSDConversationActivity:fromConversation:forStorage:",  v18,  v6,  0LL));
    -[CSDMessagingConversationActivitySession setActivity:](v16, "setActivity:", v21);

    -[CSDMessagingConversationMessage addActivitySessions:](v15, "addActivitySessions:", v16);
    v30[0] = IDSSendMessageOptionPublicMessageIntentKey;
    v30[1] = IDSSendMessageOptionQueueOneIdentifierKey;
    v31[0] = &off_1003F1780;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v23,  &off_1003F1780));
    v31[1] = v24;
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v15, "data"));
    unsigned int v27 = -[CSDConversationManager broadcastData:onConversation:additionalOptions:]( self,  "broadcastData:onConversation:additionalOptions:",  v26,  v6,  v25);

    id v28 = sub_1001704C4();
    __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = v27;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "(success: %d)", buf, 8u);
    }

    -[CSDConversationManager broadcastImageForSession:onConversation:]( self,  "broadcastImageForSession:onConversation:",  v7,  v6);
    -[CSDConversationManager conversationChanged:](self, "conversationChanged:", v6);
  }
}

- (void)conversation:(id)a3 changedBytesOfDataUsed:(int64_t)a4
{
  id v17 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "conversationManager:conversation:changedBytesOfDataUsed:") & 1) != 0)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v17 tuConversation]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v11]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000FFCC8;
          block[3] = &unk_1003D8F98;
          void block[4] = v11;
          id v19 = v12;
          id v20 = self;
          int64_t v21 = a4;
          id v15 = v12;
          dispatch_async(v14, block);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v8);
  }
}

- (void)conversation:(id)a3 activitySessionRemoved:(id)a4 userOriginated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  if (v5)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 activity]);
    unsigned __int8 v12 = [v11 isStaticActivity];

    if ((v12 & 1) == 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 terminatingHandle]);

      if (v13)
      {
        uint64_t v14 = (CSDMessagingConversationMessage *)objc_claimAutoreleasedReturnValue([v9 terminatingHandle]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteParticipantForHandle:v14]);
      }

      else
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 localParticipant]);
        uint64_t v16 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 groupUUID]);
        uint64_t v14 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v16,  "initWithType:groupUUID:link:",  21LL,  v17,  0LL);

        id v18 = objc_alloc_init(&OBJC_CLASS___CSDMessagingConversationActivitySession);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
        -[CSDMessagingConversationActivitySession setIdentifierUUIDString:](v18, "setIdentifierUUIDString:", v20);

        -[CSDMessagingConversationMessage addActivitySessions:](v14, "addActivitySessions:", v18);
        int64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage data](v14, "data"));
        uint64_t v30 = IDSSendMessageOptionPublicMessageIntentKey;
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[CSDMessagingConversationMessage type](v14, "type")));
        __int128 v31 = v22;
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
        unsigned int v24 = -[CSDConversationManager broadcastData:onConversation:additionalOptions:]( self,  "broadcastData:onConversation:additionalOptions:",  v21,  v8,  v23);

        id v25 = sub_1001704C4();
        __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v29[0] = 67109120;
          v29[1] = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Did send activity removal message successfully? %d",  (uint8_t *)v29,  8u);
        }
      }

      if (v15)
      {
        -[CSDConversationManager postEndEventForSession:originator:conversation:]( self,  "postEndEventForSession:originator:conversation:",  v9,  v15,  v8);
      }

      else
      {
        id v27 = sub_1001704C4();
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_1002B63DC();
        }
      }
    }
  }
}

- (void)conversation:(id)a3 sendResourceAtURL:(id)a4 toParticipants:(id)a5 metadata:(id)a6 activitySessionUUID:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *))a8;
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v20);

  id v21 = sub_1001704C4();
  __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v15 URL]);
    *(_DWORD *)buf = 138412290;
    id v58 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending resource at url %@", buf, 0xCu);
  }

  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager resourceTransferCallbacks](self, "resourceTransferCallbacks"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 URL]);
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v25]);

  if (v26)
  {
    id v27 = sub_1001704C4();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1002B6468(v15, v28);
    }

    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CSDResourceTransferErrorDomain",  1LL,  0LL));
    v19[2](v19, v29);
  }

  else
  {
    id v49 = v18;
    id v50 = v17;
    id v51 = v14;
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v16 count]));
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v47 = v16;
    id v30 = v16;
    id v31 = [v30 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v53 != v33) {
            objc_enumerationMutation(v30);
          }
          id v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * (void)i), "activeIDSDestination", v47));
          [v29 addObject:v35];
        }

        id v32 = [v30 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }

      while (v32);
    }

    if ([v29 count])
    {
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v51 groupUUID]);
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 UUIDString]);
      [v36 setObject:v38 forKey:@"resourceTransferConversationIDKey"];

      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v49 UUIDString]);
      [v36 setObject:v39 forKey:@"resourceTransferActivitySessionIDKey"];

      if (v50) {
        [v36 setObject:v50 forKey:@"resourceTransferClientMetadataKey"];
      }
      if (v19)
      {
        id v40 = objc_retainBlock(v19);
        id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager resourceTransferCallbacks](self, "resourceTransferCallbacks"));
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v15 URL]);
        [v41 setObject:v40 forKeyedSubscript:v42];
      }

      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager fileTransferController](self, "fileTransferController", v47));
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v51 localMember]);
      [v43 transferFileAtSandboxExtendedURL:v15 toDestinations:v29 withMetadata:v36 fromMember:v44];

      id v14 = v51;
      id v16 = v48;
      id v17 = v50;
    }

    else
    {
      id v45 = sub_1001704C4();
      id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      id v17 = v50;
      id v14 = v51;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_1002B643C();
      }

      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CSDResourceTransferErrorDomain",  2LL,  0LL));
      v19[2](v19, v36);
      id v16 = v47;
    }

    id v18 = v49;
  }
}

- (void)conversation:(id)a3 addedMembers:(id)a4 triggeredLocally:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v34 = v8;
    __int16 v35 = 2112;
    if (v5) {
      id v13 = @"YES";
    }
    id v36 = v9;
    __int16 v37 = 2112;
    __int16 v38 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "conversation: %@ addedMembers: %@ triggeredLocally: %@",  buf,  0x20u);
  }

  -[CSDConversationManager broadcastLightweightEndorsementForAddedMembers:onConversation:]( self,  "broadcastLightweightEndorsementForAddedMembers:onConversation:",  v9,  v8);
  if (v5)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 stagedActivitySession]);

    if (v14)
    {
      id v15 = sub_1001704C4();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 stagedActivitySession]);
        *(_DWORD *)buf = 138412290;
        id v34 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Found staged ActivitySession on conversation. Distributing image. %@",  buf,  0xCu);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 stagedActivitySession]);
      -[CSDConversationManager broadcastImageForSession:onConversation:]( self,  "broadcastImageForSession:onConversation:",  v18,  v8);
    }

    id v27 = v9;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 tuActivitySessions]);
    id v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          unsigned int v24 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v25 = sub_1001704C4();
          __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Found ActivitySession on conversation. Distributing image. %@",  buf,  0xCu);
          }

          -[CSDConversationManager broadcastImageForSession:onConversation:]( self,  "broadcastImageForSession:onConversation:",  v24,  v8);
        }

        id v21 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v21);
    }

    id v9 = v27;
  }

  -[CSDConversationManager conversationChanged:](self, "conversationChanged:", v8);
}

- (void)conversationDidTriggerJoin:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "conversation: %@ triggered join.",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 stagedActivitySession]);
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 stagedActivitySession]);
    unsigned int v11 = [v10 isLocallyInitiated];

    if (v11)
    {
      id v12 = sub_1001704C4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 stagedActivitySession]);
        int v16 = 138412290;
        id v17 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Found staged ActivitySession on conversation. Distributing image. %@",  (uint8_t *)&v16,  0xCu);
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 stagedActivitySession]);
      -[CSDConversationManager broadcastImageForSession:onConversation:]( self,  "broadcastImageForSession:onConversation:",  v15,  v4);
    }
  }
}

- (void)conversation:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6
{
  id v20 = a3;
  id v23 = a4;
  id v22 = a5;
  id v21 = a6;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x3032000000LL;
  v34[3] = sub_100100CF4;
  v34[4] = sub_100100D1C;
  id v35 = objc_retainBlock(v21);
  unsigned int v11 = dispatch_group_create();
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager observerToQueue](self, "observerToQueue"));
  id v13 = [v12 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v31;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v15);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager observerToQueue](self, "observerToQueue"));
        id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v16]);

        if ((objc_opt_respondsToSelector( v16,  "conversationManager:requestedEndpointWithIdentifier:activitySession:completion:") & 1) != 0)
        {
          dispatch_group_enter(v11);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100100D24;
          block[3] = &unk_1003DA278;
          void block[4] = v16;
          void block[5] = self;
          id v26 = v23;
          id v27 = v22;
          __int128 v29 = v34;
          __int128 v28 = v11;
          dispatch_async(v18, block);
        }

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }

    while (v13);
  }

  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100100EC8;
  v24[3] = &unk_1003DA2A0;
  void v24[4] = v34;
  dispatch_group_notify(v11, v19, v24);

  _Block_object_dispose(v34, 8);
}

- (void)conversation:(id)a3 screenShareAttributesSelected:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 UUID]);
  -[CSDConversationManager setScreenEnabled:screenShareAttributes:forConversationWithUUID:]( self,  "setScreenEnabled:screenShareAttributes:forConversationWithUUID:",  1LL,  v6,  v9);
}

- (void)conversation:(id)a3 screenShareAttributesUpdated:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 UUID]);
  -[CSDConversationManager setScreenShareAttributes:forConversationWithUUID:]( self,  "setScreenShareAttributes:forConversationWithUUID:",  v6,  v9);
}

- (void)conversation:(id)a3 screenShareAttributesDidChange:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversationManager screenSharingActivityManager](self, "screenSharingActivityManager"));
  [v7 broadcastAttributes:v5];
}

- (void)conversation:(id)a3 remoteMembersChanged:(id)a4
{
  id v17 = a3;
  id v16 = a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "conversationManager:remoteMembersChanged:forConversation:") & 1) != 0)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v17 tuConversation]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v11]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100101240;
          block[3] = &unk_1003D7B28;
          void block[4] = v11;
          id v19 = v12;
          id v20 = self;
          id v21 = v16;
          id v15 = v12;
          dispatch_async(v14, block);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v8);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = (__CFString *)a5;
  id v11 = a7;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  if (a6)
  {
    id v13 = sub_1001704C4();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138412546;
      id v42 = v10;
      __int16 v43 = 2112;
      id v44 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "sent %@ with error: %@",  (uint8_t *)&v41,  0x16u);
    }

    -[CSDConversationManager _runCallbackIfNecessaryForMessage:](self, "_runCallbackIfNecessaryForMessage:", v10);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutablePseudonymsByRequestIdentifiers]( self,  "mutablePseudonymsByRequestIdentifiers"));
    id v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v10]);

    if (v16 && [v11 code] == (id)3)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager pendingConversationWithPseudonym:]( self,  "pendingConversationWithPseudonym:",  v16));
      if (v17)
      {
        id v18 = sub_1001704C4();
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v41 = 138412290;
          id v42 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Let me in request was sent to invalid pseudonym %@, ending pending conversation",  (uint8_t *)&v41,  0xCu);
        }

        -[CSDConversationManager notifyDelegatesOfInvalidLinkForPendingConversation:]( self,  "notifyDelegatesOfInvalidLinkForPendingConversation:",  v17);
      }
    }
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager outIdentifierToConversationInfo](self, "outIdentifierToConversationInfo"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v10]);

  if (v21)
  {
    id v22 = sub_1001704C4();
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager outIdentifierToConversationInfo](self, "outIdentifierToConversationInfo"));
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v10]);
      int v41 = 138412546;
      id v42 = v10;
      __int16 v43 = 2112;
      id v44 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "outIdentifierToConversationInfo[%@] = %@",  (uint8_t *)&v41,  0x16u);
    }

    if (a6)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager outIdentifierToConversationInfo](self, "outIdentifierToConversationInfo"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v10]);

      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"kCSDConversationIsLetMeInApproved"]);
      id v29 = [v28 BOOLValue];

      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"kCSDConversationGroupUUID"]);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationWithGroupUUID:](self, "conversationWithGroupUUID:", v30));

      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 tuConversation]);
      id v33 = sub_1001704C4();
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      if (v32)
      {
        if (v35)
        {
          id v36 = @"NO";
          if ((_DWORD)v29) {
            id v36 = @"YES";
          }
          int v41 = 138412290;
          id v42 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Report sent let me in response (approved: %@)",  (uint8_t *)&v41,  0xCu);
        }

        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager reportingController](self, "reportingController"));
        __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v31 tuConversation]);
        -[os_log_s sentLetMeInRequestForConversation:isApproved:]( v34,  "sentLetMeInRequestForConversation:isApproved:",  v37,  v29);
      }

      else if (v35)
      {
        __int16 v39 = @"NO";
        if ((_DWORD)v29) {
          __int16 v39 = @"YES";
        }
        int v41 = 138412546;
        id v42 = v39;
        __int16 v43 = 2112;
        id v44 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Not report sent let me in response (approved: %@) because TUConversation is null for %@",  (uint8_t *)&v41,  0x16u);
      }
    }

    else
    {
      id v38 = sub_1001704C4();
      id v27 = (void *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR)) {
        sub_1002B64E8();
      }
    }

    id v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager outIdentifierToConversationInfo](self, "outIdentifierToConversationInfo"));
    [v40 removeObjectForKey:v10];
  }
}

- (void)_runCallbackIfNecessaryForMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutableSendDataCallbacksByRequestIdentifiers]( self,  "mutableSendDataCallbacksByRequestIdentifiers"));
  id v6 = (void (**)(void))objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager mutableSendDataCallbacksByRequestIdentifiers]( self,  "mutableSendDataCallbacksByRequestIdentifiers"));
    [v7 removeObjectForKey:v4];

    id v8 = sub_1001704C4();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Running callback for message %@, which has been received by the IDS daemon",  (uint8_t *)&v10,  0xCu);
    }

    v6[2](v6);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v14 length])
  {
    id v16 = (void *)IDSCopyAddressDestinationForDestination(v14);
    id v17 = (os_log_s *)IDSCopyRawAddressForDestination(v16);

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v17));
    id v19 = sub_1001704C4();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v12 serviceIdentifier]);
      id v44 = v17;
      id v22 = self;
      __int128 v23 = v18;
      id v24 = v12;
      id v25 = v13;
      id v26 = (void *)v21;
      uint64_t v27 = IDSLoggableDescriptionForHandleOnService(v14, v21);
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 134219010;
      int64_t v48 = a5;
      __int16 v49 = 2112;
      id v50 = v24;
      __int16 v51 = 2112;
      id v52 = v25;
      __int16 v53 = 2112;
      __int128 v54 = v28;
      __int16 v55 = 2112;
      id v56 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Group Session update %ld received for service %@ account %@ from (fromID=%@) with context: %@",  buf,  0x34u);

      id v13 = v25;
      id v12 = v24;
      id v18 = v23;
      self = v22;
      id v17 = v44;
    }

    unsigned int v29 = -[CSDConversationManager shouldCreatePendingChatForMessageType:fromHandle:]( self,  "shouldCreatePendingChatForMessageType:fromHandle:",  a5,  v18);
    id v30 = sub_1001704C4();
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v32)
      {
        *(_DWORD *)buf = 134217984;
        int64_t v48 = a5;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Recieved pending message of type %ld",  buf,  0xCu);
      }

      id v33 = (void *)objc_claimAutoreleasedReturnValue([v15 originalGUID]);
      id v34 = sub_1001704C4();
      BOOL v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v33)
      {
        if (v36)
        {
          __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v15 originalGUID]);
          *(_DWORD *)buf = 138412290;
          int64_t v48 = (int64_t)v37;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Added %@ to the incomingPendingMessageGUIDs",  buf,  0xCu);
        }

        BOOL v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager incomingPendingMessageGUIDs](self, "incomingPendingMessageGUIDs"));
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v15 originalGUID]);
        -[os_log_s addObject:](v35, "addObject:", v38);
      }

      else if (v36)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "[WARN] No originalGUID in the context",  buf,  2u);
      }

      id v40 = objc_alloc(&OBJC_CLASS___CSDGroupIDSPendingChat);
      int v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      __int128 v31 = -[CSDGroupIDSPendingChat initWithUUID:handle:](v40, "initWithUUID:handle:", v41, v18);

      id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v45 = @"CSDIDSPendingChatKey";
      id v46 = v31;
      __int16 v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
      [v42 postNotificationName:@"CSDGroupIDSPendingMessageDidReceiveInviteNotification" object:0 userInfo:v43];
    }

    else if (v32)
    {
      *(_DWORD *)buf = 134217984;
      int64_t v48 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Not handling pending message of type: %ld",  buf,  0xCu);
    }
  }

  else
  {
    id v39 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[WARN] service:account:incomingData:fromID:context: Empty from ID. Dropping message.",  buf,  2u);
    }
  }
}

- (BOOL)shouldCreatePendingChatForMessageType:(int64_t)a3 fromHandle:(id)a4
{
  if (a3 == 8) {
    return !-[CSDConversationManager isValidLocalHandle:](self, "isValidLocalHandle:", a4, v4, v5);
  }
  else {
    return 0;
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a6;
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v20);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager messageProxy](self, "messageProxy"));
  unsigned int v22 = [v21 shouldIgnoreIDSResource:v16 metadata:v19 fromID:v17 context:v18];

  id v23 = sub_1001704C4();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v25)
    {
      LOWORD(v39) = 0;
      id v26 = "Ignoring IDS resource; already received via conduit IDS proxy.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v39, 2u);
      goto LABEL_22;
    }

    goto LABEL_22;
  }

  if (v25)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v18 outgoingResponseIdentifier]);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v14 serviceIdentifier]);
    uint64_t v29 = IDSLoggableDescriptionForHandleOnService(v17, v28);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    int v39 = 138412546;
    id v40 = v27;
    __int16 v41 = 2112;
    id v42 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received resource URL with identifier %@ from %@",  (uint8_t *)&v39,  0x16u);
  }

  if ([v17 length])
  {
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v16));
    if (!-[os_log_s length](v24, "length"))
    {
      id v34 = sub_1001704C4();
      BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[WARN] service:account:incomingResourceAtURL:fromID:context: Empty data. Dropping message.",  (uint8_t *)&v39,  2u);
      }

      goto LABEL_21;
    }

    __int128 v31 = -[CSDMessagingConversationMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage),  "initWithData:",  v24);
    BOOL v32 = (os_log_s *)v31;
    if (v31)
    {
      if (-[CSDMessagingConversationMessage type](v31, "type") == 27)
      {
        -[CSDConversationManager _service:account:incomingData:fromID:context:attemptCount:]( self,  "_service:account:incomingData:fromID:context:attemptCount:",  v14,  v15,  v24,  v17,  v18,  0LL);
LABEL_21:

        goto LABEL_22;
      }

      id v37 = sub_1001704C4();
      BOOL v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[os_log_s type](v32, "type")));
        int v39 = 138412290;
        id v40 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[WARN] service:account:incomingResourceAtURL:fromID:context: Got unsupported messaged type %@. Dropping message.",  (uint8_t *)&v39,  0xCu);
      }
    }

    else
    {
      id v35 = sub_1001704C4();
      BOOL v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[WARN] service:account:incomingResourceAtURL:fromID:context: Empty CSDMessagingConversationMessage. Dropping message.",  (uint8_t *)&v39,  2u);
      }
    }

    goto LABEL_21;
  }

  id v33 = sub_1001704C4();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v39) = 0;
    id v26 = "[WARN] service:account:incomingResourceAtURL:fromID:context: Empty from ID. Dropping message.";
    goto LABEL_13;
  }

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager messageProxy](self, "messageProxy"));
  unsigned int v18 = [v17 shouldIgnoreIDSMessage:v14 fromID:v15 context:v16];

  id v19 = sub_100170534();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v21)
    {
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v16 storageGuid]);
      int v27 = 141558274;
      uint64_t v28 = 1752392040LL;
      __int16 v29 = 2112;
      id v30 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "service:account:incomingData:fromID:context: already proxied IDS message with ID %{mask.hash}@, ignoring.",  (uint8_t *)&v27,  0x16u);
    }
  }

  else
  {
    if (v21)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceIdentifier]);
      uint64_t v24 = IDSLoggableDescriptionForHandleOnService(v15, v23);
      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v16 storageGuid]);
      int v27 = 141558786;
      uint64_t v28 = 1752392040LL;
      __int16 v29 = 2112;
      id v30 = v25;
      __int16 v31 = 2160;
      uint64_t v32 = 1752392040LL;
      __int16 v33 = 2112;
      id v34 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "service:account:incomingData:fromID:context: receiving IDS message from %{mask.hash}@ with ID %{mask.hash}@",  (uint8_t *)&v27,  0x2Au);
    }

    -[CSDConversationManager _service:account:incomingData:fromID:context:attemptCount:]( self,  "_service:account:incomingData:fromID:context:attemptCount:",  v12,  v13,  v14,  v15,  v16,  0LL);
  }
}

- (void)processProxiedMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = sub_100170534();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1002B6514();
  }

  -[CSDConversationManager _service:account:incomingData:fromID:context:attemptCount:]( self,  "_service:account:incomingData:fromID:context:attemptCount:",  0LL,  0LL,  v10,  v8,  v9,  0LL);
}

- (void)processProxiedResource:(id)a3 metadata:(id)a4 fromID:(id)a5 context:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = sub_100170534();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1002B65A4();
  }

  -[CSDConversationManager service:account:incomingResourceAtURL:fromID:context:]( self,  "service:account:incomingResourceAtURL:fromID:context:",  0LL,  0LL,  v11,  v9,  v10);
}

- (void)processProxiedGroupUpdate:(id)a3
{
  id v4 = a3;
  id v5 = sub_100170534();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1002B6634();
  }

  -[CSDConversationManager processGroupSessionParticipantUpdate:context:]( self,  "processGroupSessionParticipantUpdate:context:",  v4,  0LL);
}

- (void)enqueueMessageRetryAttemptForMessageID:(id)a3 message:(id)a4 attemptCount:(unint64_t)a5 messageProcessingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 conversationGroupUUID]);
  if (!v14)
  {
    id v26 = sub_1001704C4();
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_1002B6660();
    }
    goto LABEL_12;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager serverBag](self, "serverBag"));
  id v16 = [v15 messageRetryMaxAttempts];

  id v17 = sub_1001704C4();
  unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v16 > a5)
  {
    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager serverBag](self, "serverBag"));
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v20 messageRetryIntervalMillis]));
      *(_DWORD *)buf = 138412546;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Will retry message (%@) again after %@ ms",  buf,  0x16u);
    }

    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager serverBag](self, "serverBag"));
    dispatch_time_t v23 = dispatch_time(0, 1000000 * (void)[v22 messageRetryIntervalMillis]);
    uint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001027C8;
    block[3] = &unk_1003D8438;
    id v30 = (os_log_s *)v10;
    unint64_t v34 = a5;
    id v31 = v14;
    id v32 = v11;
    id v33 = v12;
    dispatch_after(v23, v24, block);

    BOOL v25 = v30;
    goto LABEL_12;
  }

  if (v19)
  {
    int v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
    *(_DWORD *)buf = 138412546;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[WARN] Exhausted retry attempts for message (%@). Dropping message after %@ attempts",  buf,  0x16u);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
  [v28 messageRetryFailedForConversationGroupUUID:v14];

  if ([v11 type] == 4)
  {
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
    -[os_log_s avcBlobRequestMessageRetryFailedForConversationGroupUUID:]( v25,  "avcBlobRequestMessageRetryFailedForConversationGroupUUID:",  v14);
LABEL_12:
  }
}

- (void)_service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7 attemptCount:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v117 = self;
  unsigned int v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v18);

  id v19 = sub_1001704C4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v17 outgoingResponseIdentifier]);
    id v22 = v13;
    dispatch_time_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceIdentifier]);
    uint64_t v24 = IDSLoggableDescriptionForHandleOnService(v16, v23);
    id v25 = v17;
    id v26 = v15;
    id v27 = v14;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v24);
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a8));
    *(_DWORD *)buf = 138412802;
    id v131 = v21;
    __int16 v132 = 2112;
    *(void *)__int128 v133 = v28;
    *(_WORD *)&v133[8] = 2112;
    __int128 v134 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Received message with identifier %@ from %@ Attempt count %@",  buf,  0x20u);

    id v13 = v22;
    id v14 = v27;
    id v15 = v26;
    id v17 = v25;
  }

  if ([v16 length])
  {
    if ([v15 length])
    {
      id v30 = -[CSDMessagingConversationMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage),  "initWithData:",  v15);
      id v31 = sub_1001704C4();
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (!v30)
      {
        if (v33)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[WARN] service:account:incomingData:fromID:context: Empty CSDMessagingConversationMessage. Dropping message.",  buf,  2u);
        }

        goto LABEL_111;
      }

      if (v33)
      {
        id v34 = v13;
        id v35 = (id)-[CSDMessagingConversationMessage type](v30, "type");
        else {
          id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v35));
        }
        *(_DWORD *)buf = 138412290;
        id v131 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received CSDMessagingConversationMessage with Type of %@",  buf,  0xCu);

        id v13 = v34;
      }

      id v40 = (void *)IDSCopyAddressDestinationForDestination(v16);
      id v32 = (os_log_s *)IDSCopyRawAddressForDestination(v40);

      if (!-[os_log_s length](v32, "length"))
      {
        id v45 = sub_1001704C4();
        __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "[WARN] service:account:incomingData:fromID:context: Empty destinationID after IDSCopyRawAddressForDestinatio n. Dropping message.",  buf,  2u);
        }

        goto LABEL_110;
      }

      __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v32));
      if (!v41)
      {
        id v46 = v13;
        id v47 = sub_1001704C4();
        int64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "[WARN] service:account:incomingData:fromID:context: Could not create TUHandle from destinationID. Dropping message.",  buf,  2u);
        }

        id v13 = v46;
        goto LABEL_110;
      }

      unint64_t v115 = v14;
      v116 = v13;
      if ([v17 fromServerStorage])
      {
        id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -1800.0));
        __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v17 serverReceivedTime]);
        BOOL v44 = [v42 compare:v43] == (id)1;
      }

      else
      {
        BOOL v44 = 0;
      }

      __int16 v49 = (void *)objc_claimAutoreleasedReturnValue([v17 publicIntentAction]);
      id v50 = [v49 integerValue];

      if (-[CSDConversationManager _linksEnabled](v117, "_linksEnabled"))
      {
        switch(-[CSDMessagingConversationMessage type](v30, "type"))
        {
          case 0xA:
          case 0x10:
            id v51 = sub_1001704C4();
            id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_34;
            }
            *(_WORD *)buf = 0;
            __int16 v53 = "[WARN] Dropping let me in request or response because it was not encrypted";
            goto LABEL_33;
          case 0xB:
          case 0x1A:
            -[CSDConversationManager handleReceivedLinkCreatedOrChangedMessage:fromHandle:]( v117,  "handleReceivedLinkCreatedOrChangedMessage:fromHandle:",  v30,  v41);
            goto LABEL_60;
          case 0xD:
            -[CSDConversationManager handleEncryptedMessageWithin:fromHandle:context:]( v117,  "handleEncryptedMessageWithin:fromHandle:context:",  v30,  v41,  v17);
            goto LABEL_60;
          case 0xE:
          case 0xF:
            id v119 = v17;
            if (!v44 || -[CSDMessagingConversationMessage type](v30, "type") != 14) {
              goto LABEL_52;
            }
            id v63 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationMessage conversationGroupUUID](v30, "conversationGroupUUID"));
            id v64 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager conversationWithGroupUUID:]( v117,  "conversationWithGroupUUID:",  v63));

            if (v64)
            {

LABEL_52:
              id v65 = sub_1001704C4();
              uint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
              BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
              if (v50 == (id)20001)
              {
                id v14 = v115;
                id v13 = v116;
                if (v67)
                {
                  id v68 = (void *)objc_claimAutoreleasedReturnValue([v119 publicIntentAction]);
                  *(_DWORD *)buf = 138412546;
                  id v131 = v68;
                  __int16 v132 = 2048;
                  *(void *)__int128 v133 = 20001LL;
                  _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "[WARN] Received LetMeInDelegation with Intent of {publicIntentAction: %@, messageIntent: %llu}",  buf,  0x16u);
                }

                -[CSDConversationManager handleReceivedLMIDelegateMessage:fromHandle:]( v117,  "handleReceivedLMIDelegateMessage:fromHandle:",  v30,  v41);
              }

              else
              {
                id v14 = v115;
                id v13 = v116;
                if (v67)
                {
                  __int16 v70 = (void *)objc_claimAutoreleasedReturnValue([v119 publicIntentAction]);
                  *(_DWORD *)buf = 138412290;
                  id v131 = v70;
                  _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "[WARN] Dropping let me in delegation request or response because it has the wrong intent {publicIntentAction: %@}",  buf,  0xCu);
                }
              }

              id v17 = v119;
            }

            else
            {
              id v99 = sub_1001704C4();
              id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
              id v17 = v119;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                __int16 v53 = "[WARN] Dropping let me in delegation request because it is from server storage, older than 30m, an"
                      "d not for an ongoing conversation.";
LABEL_33:
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, v53, buf, 2u);
              }

- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5 context:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_100170534();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1002B6768();
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager messageProxy](self, "messageProxy"));
  [v13 proxyGroupUpdate:v9 forConversationManager:self];

  -[CSDConversationManager sanitizeAndProcessParticipantUpdate:context:]( self,  "sanitizeAndProcessParticipantUpdate:context:",  v9,  v8);
}

- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantDataUpdate:(id)a5
{
  id v6 = a5;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_100170534();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1002B6768();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager messageProxy](self, "messageProxy"));
  [v10 proxyGroupUpdate:v6 forConversationManager:self];

  -[CSDConversationManager sanitizeAndProcessParticipantUpdate:context:]( self,  "sanitizeAndProcessParticipantUpdate:context:",  v6,  0LL);
}

- (void)sanitizeAndProcessParticipantUpdate:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager participantUpdateSanitizer](self, "participantUpdateSanitizer"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager participantUpdateSanitizer](self, "participantUpdateSanitizer"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100103C10;
    v12[3] = &unk_1003DA2C8;
    v12[4] = self;
    id v13 = v6;
    [v9 sanitize:v7 completion:v12];
  }

  else
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1002B6794();
    }

    -[CSDConversationManager processGroupSessionParticipantUpdate:context:]( self,  "processGroupSessionParticipantUpdate:context:",  v7,  v6);
  }
}

- (void)processGroupSessionParticipantUpdate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    id v43 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    BOOL v44 = "[WARN] processGroupSessionParticipantUpdate: Empty groupSessionParticipantUpdate";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v44, buf, 2u);
    goto LABEL_51;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 participantDestinationID]);

  if (!v9)
  {
    id v45 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    BOOL v44 = "[WARN] processGroupSessionParticipantUpdate: Empty groupSessionParticipantUpdate.participantDestinationID";
    goto LABEL_20;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUUID]);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationWithGroupUUID:](self, "conversationWithGroupUUID:", v10));

  if (!-[CSDConversationManager shouldIgnoreMessageForConversation:](self, "shouldIgnoreMessageForConversation:", v11))
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 participantIDs]);
      uint64_t v15 = TULoggableStringForObject(v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 members]);
      *(_DWORD *)buf = 138412802;
      id v64 = (os_log_s *)v6;
      __int16 v65 = 2112;
      id v66 = v16;
      __int16 v67 = 2112;
      id v68 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Group session participant update received: %@, participantIDs: %@, members: %@",  buf,  0x20u);
    }

    id v18 = sub_100170534();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 participantDestinationID]);
      BOOL v21 = (void *)IDSCopyAddressDestinationForDestination(v20);
      uint64_t v22 = TULoggableStringForHandle(v21);
      dispatch_time_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      id v24 = [v6 participantUpdateType];
      id v61 = v7;
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 participantIDs]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 allKeys]);
      *(_DWORD *)buf = 138412802;
      id v64 = v23;
      __int16 v65 = 2048;
      id v66 = v24;
      __int16 v67 = 2112;
      id v68 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Participant update from %@, type: %lu, participants: %@",  buf,  0x20u);

      id v7 = v61;
    }

    id v27 = [v6 participantUpdateType];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v6 participantDestinationID]);
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager memberExistsForParticipantDestination:groupSessionParticipantUpdate:]( self,  "memberExistsForParticipantDestination:groupSessionParticipantUpdate:",  v28,  v6));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 handle]);

    if (!v30)
    {
      id v46 = sub_1001704C4();
      id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int64_t v48 = "[WARN] Unable to find fromHandle.";
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, v48, buf, 2u);
      }

- (void)processJoinUpdate:(id)a3 fromHandle:(id)a4 senderCorrelationIdentifier:(id)a5 isFromPendingMessage:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  id v14 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipantDidJoinContext);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 clientContextData]);
  id v16 = -[CSDMessagingConversationParticipantDidJoinContext initWithData:](v14, "initWithData:", v15);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext data](v16, "data"));
  id v18 = [v17 length];

  id v19 = sub_1001704C4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = v20;
  if (v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received participant join context", buf, 2u);
    }

    +[CSDSignposts trace:](&OBJC_CLASS___CSDSignposts, "trace:", 5LL);
    uint64_t v22 = objc_alloc(&OBJC_CLASS___CSDConversationParticipant);
    id v23 = [v10 participantIdentifier];
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v10 participantData]);
    BOOL v21 = -[CSDConversationParticipant initWithIdentifier:handle:avcData:senderCorrelationIdentifier:]( v22,  "initWithIdentifier:handle:avcData:senderCorrelationIdentifier:",  v23,  v11,  v24,  v12);

    id v25 = objc_alloc_init(&OBJC_CLASS___TUConversationParticipantCapabilities);
    -[TUConversationParticipantCapabilities setMomentsAvailable:]( v25,  "setMomentsAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isMomentsAvailable](v16, "isMomentsAvailable"));
    -[TUConversationParticipantCapabilities setScreenSharingAvailable:]( v25,  "setScreenSharingAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isScreenSharingAvailable](v16, "isScreenSharingAvailable"));
    -[TUConversationParticipantCapabilities setGondolaCallingAvailable:]( v25,  "setGondolaCallingAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isGondolaCallingAvailable](v16, "isGondolaCallingAvailable"));
    -[TUConversationParticipantCapabilities setSupportsLeaveContext:]( v25,  "setSupportsLeaveContext:",  -[CSDMessagingConversationParticipantDidJoinContext supportsLeaveContext](v16, "supportsLeaveContext"));
    -[TUConversationParticipantCapabilities setSupportsRequestToScreenShare:]( v25,  "setSupportsRequestToScreenShare:",  -[CSDMessagingConversationParticipantDidJoinContext supportsRequestToScreenShare]( v16,  "supportsRequestToScreenShare"));
    -[TUConversationParticipantCapabilities setPersonaAvailable:]( v25,  "setPersonaAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isPersonaAvailable](v16, "isPersonaAvailable"));
    -[TUConversationParticipantCapabilities setGftDowngradeToOneToOneAvailable:]( v25,  "setGftDowngradeToOneToOneAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isGFTDowngradeToOneToOneAvailable]( v16,  "isGFTDowngradeToOneToOneAvailable"));
    -[TUConversationParticipantCapabilities setUPlusOneScreenShareAvailable:]( v25,  "setUPlusOneScreenShareAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isUPlusOneScreenSharingAvailable]( v16,  "isUPlusOneScreenSharingAvailable"));
    -[TUConversationParticipantCapabilities setUPlusOneAVLessAvailable:]( v25,  "setUPlusOneAVLessAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isUPlusOneAVLessAvailable](v16, "isUPlusOneAVLessAvailable"));
    -[TUConversationParticipantCapabilities setUPlusNDowngradeAvailable:]( v25,  "setUPlusNDowngradeAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isUPlusNDowngradeAvailable](v16, "isUPlusNDowngradeAvailable"));
    -[TUConversationParticipantCapabilities setSharePlayProtocolVersion:]( v25,  "setSharePlayProtocolVersion:",  -[CSDMessagingConversationParticipantDidJoinContext sharePlayProtocolVersion](v16, "sharePlayProtocolVersion"));
    -[TUConversationParticipantCapabilities setVisionFeatureVersion:]( v25,  "setVisionFeatureVersion:",  -[CSDMessagingConversationParticipantDidJoinContext visionFeatureVersion](v16, "visionFeatureVersion"));
    -[TUConversationParticipantCapabilities setVisionCallEstablishmentVersion:]( v25,  "setVisionCallEstablishmentVersion:",  -[CSDMessagingConversationParticipantDidJoinContext visionCallEstablishmentVersion]( v16,  "visionCallEstablishmentVersion"));
    -[TUConversationParticipantCapabilities setUPlusOneVisionToVisionAvailable:]( v25,  "setUPlusOneVisionToVisionAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isUPlusOneVisionToVisionAvailable]( v16,  "isUPlusOneVisionToVisionAvailable"));
    -[TUConversationParticipantCapabilities setPhotosSharePlayAvailable:]( v25,  "setPhotosSharePlayAvailable:",  -[CSDMessagingConversationParticipantDidJoinContext isPhotosSharePlayAvailable](v16, "isPhotosSharePlayAvailable"));
    -[os_log_s setCapabilities:](v21, "setCapabilities:", v25);
    -[os_log_s setLightweight:]( v21,  "setLightweight:",  -[CSDMessagingConversationParticipantDidJoinContext isLightweight](v16, "isLightweight"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 participantDestinationID]);
    -[os_log_s setActiveIDSDestination:](v21, "setActiveIDSDestination:", v26);

    if (-[CSDMessagingConversationParticipantDidJoinContext hasVideoEnabled](v16, "hasVideoEnabled")) {
      uint64_t v27 = -[CSDMessagingConversationParticipantDidJoinContext videoEnabled](v16, "videoEnabled");
    }
    else {
      uint64_t v27 = 1LL;
    }
    -[os_log_s setVideoEnabled:](v21, "setVideoEnabled:", v27);
    id v46 = v12;
    BOOL v45 = v6;
    if (-[CSDMessagingConversationParticipantDidJoinContext hasParticipantAssociation]( v16,  "hasParticipantAssociation"))
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext participantAssociation]( v16,  "participantAssociation"));
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 tuConversationParticipantAssociation]);
      -[os_log_s setAssociation:](v21, "setAssociation:", v29);
    }

    else
    {
      -[os_log_s setAssociation:](v21, "setAssociation:", 0LL);
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext providerIdentifier](v16, "providerIdentifier"));
    unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v30 tuConversationProviderForIdentifier:v31]);

    else {
      uint64_t v33 = 1LL;
    }
    -[os_log_s setAudioVideoMode:](v21, "setAudioVideoMode:", v33);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext message](v16, "message"));
    unsigned int v35 = [v34 hasAvMode];

    if (v35)
    {
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext message](v16, "message"));
      -[os_log_s setAudioVideoMode:](v21, "setAudioVideoMode:", (int)[v36 avMode]);
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext message](v16, "message"));
    -[os_log_s setPresentationMode:](v21, "setPresentationMode:", [v37 resolvedPresentationMode]);

    -[os_log_s setSpatialPersonaEnabled:]( v21,  "setSpatialPersonaEnabled:",  -[CSDMessagingConversationParticipantDidJoinContext isSpatialPersonaEnabled](v16, "isSpatialPersonaEnabled"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
    unsigned int v39 = [v38 groupFacetimeAsAServiceEnabled];

    if (v39 && v32)
    {
      id v40 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 serviceForProvider:v32]);
    }

    else
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
    }

    id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 allAliases]);
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
    -[os_log_s setLocalAccountHandle:](v21, "setLocalAccountHandle:", [v42 containsObject:v43]);

    BOOL v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v21));
    -[CSDConversationManager handleParticipants:joinedConversationWithUpdate:joinContext:fromHandle:isFromPendingMessage:]( self,  "handleParticipants:joinedConversationWithUpdate:joinContext:fromHandle:isFromPendingMessage:",  v44,  v10,  v16,  v11,  v45);

    id v12 = v46;
  }

  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    sub_1002B67C0();
  }
}

- (id)pushTokenForSelf
{
  if (TUSimulatedModeEnabled(self))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }

  else
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance"));
    id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 pushToken]);
  }

  return v2;
}

- (void)processUpdateMembersUpdate:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 clientContextData]);
  if (v9)
  {
    id v10 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipantDidJoinContext);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 clientContextData]);
    id v12 = -[CSDMessagingConversationParticipantDidJoinContext initWithData:](v10, "initWithData:", v11);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext data](v12, "data"));
    id v14 = [v13 length];

    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Received participant join context",  buf,  2u);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext message](v12, "message"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 activeParticipants]);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v19 count]));

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext message](v12, "message"));
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 activeParticipants]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingConversationParticipantDidJoinContext message](v12, "message"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 activeLightweightParticipants]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 arrayByAddingObjectsFromArray:v23]);

      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      id v25 = v24;
      id v26 = [v25 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v33;
        do
        {
          __int16 v29 = 0LL;
          do
          {
            if (*(void *)v33 != v28) {
              objc_enumerationMutation(v25);
            }
            id v30 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v32 + 1) + 8 * (void)v29),  "csdConversationParticipant",  (void)v32));
            -[os_log_s addObject:](v17, "addObject:", v30);

            __int16 v29 = (char *)v29 + 1;
          }

          while (v27 != v29);
          id v27 = [v25 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }

        while (v27);
      }

      -[CSDConversationManager handleParticipants:joinedConversationWithUpdate:joinContext:fromHandle:isFromPendingMessage:]( self,  "handleParticipants:joinedConversationWithUpdate:joinContext:fromHandle:isFromPendingMessage:",  v17,  v6,  v12,  v7,  0LL);
    }

    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      sub_1002B67EC();
    }
  }

  else
  {
    id v31 = sub_1001704C4();
    id v12 = (CSDMessagingConversationParticipantDidJoinContext *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] processUpdateMembersUpdate: Empty updateMembersUpdate.clientContextData",  buf,  2u);
    }
  }
}

- (void)processParticipantDataUpdate:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUUID]);
  if (!v9)
  {
    id v22 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    id v23 = "[WARN] processParticipantDataUpdate: Empty participantDataUpdate.groupUUID";
LABEL_13:
    id v25 = v13;
    uint32_t v26 = 2;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v23, buf, v26);
    goto LABEL_41;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 participantDestinationID]);
  id v11 = [v10 length];

  if (!v11)
  {
    id v24 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    id v23 = "[WARN] processParticipantDataUpdate: Empty participantDataUpdate.participantDestinationID";
    goto LABEL_13;
  }

  if ([v6 participantIdentifier])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUUID]);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationWithGroupUUID:](self, "conversationWithGroupUUID:", v12));

    if (!v13)
    {
      id v28 = sub_1001704C4();
      BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUUID]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager mutableConversationsByUUID](self, "mutableConversationsByUUID"));
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 allKeys]);
        *(_DWORD *)buf = 138412546;
        id v59 = v29;
        __int16 v60 = 2112;
        id v61 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation with groupUUID %@. All conversation UUIDs: %@",  buf,  0x16u);
      }

      goto LABEL_40;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 clientContextData]);
    id v15 = [v14 length];

    id v52 = v7;
    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 clientContextData]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 participantData]);
      id v18 = sub_1001704C4();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v59 = v16;
        __int16 v60 = 2112;
        id v61 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "processParticipantDataUpdate: contextData: %@, participantData: %@",  buf,  0x16u);
      }

      id v20 = -[CSDMessagingConversationParticipant initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipant),  "initWithData:",  v16);
      -[CSDMessagingConversationParticipant setAvcData:](v20, "setAvcData:", v17);
      BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipant csdConversationParticipant]( v20,  "csdConversationParticipant"));
    }

    else
    {
      __int128 v32 = objc_alloc(&OBJC_CLASS___CSDConversationParticipant);
      id v33 = [v6 participantIdentifier];
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v6 participantData]);
      BOOL v21 = -[CSDConversationParticipant initWithIdentifier:handle:avcData:]( v32,  "initWithIdentifier:handle:avcData:",  v33,  v7,  v34);
    }

    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s activeRemoteParticipants](v13, "activeRemoteParticipants"));
    id v36 = [v35 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v35);
          }
          id v40 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
          id v41 = [v40 identifier];
          if (v41 == [v6 participantIdentifier])
          {
            id v42 = (void *)objc_claimAutoreleasedReturnValue([v40 capabilities]);
            -[os_log_s setCapabilities:](v21, "setCapabilities:", v42);

            -[os_log_s setPresentationMode:](v21, "setPresentationMode:", [v40 presentationMode]);
          }
        }

        id v37 = [v35 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }

      while (v37);
    }

    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
    if ([v43 groupFacetimeAsAServiceEnabled])
    {
      BOOL v44 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s provider](v13, "provider"));

      id v7 = v52;
      if (v44)
      {
        BOOL v45 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
        id v46 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s provider](v13, "provider"));
        id v47 = (void *)objc_claimAutoreleasedReturnValue([v45 serviceForProvider:v46]);

LABEL_34:
        -[os_log_s updateConversationParticipantToHaveMatchingSiriDisplayName:]( v13,  "updateConversationParticipantToHaveMatchingSiriDisplayName:",  v21);
        int64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 allAliases]);
        id v49 = (void *)objc_claimAutoreleasedReturnValue([v7 value]);
        -[os_log_s setLocalAccountHandle:](v21, "setLocalAccountHandle:", [v48 containsObject:v49]);

        if (v21)
        {
          -[os_log_s addActiveParticipant:](v13, "addActiveParticipant:", v21);
        }

        else
        {
          id v50 = sub_1001704C4();
          id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "[WARN] processParticipantDataUpdate: Empty participant",  buf,  2u);
          }
        }

LABEL_40:
        goto LABEL_41;
      }
    }

    else
    {

      id v7 = v52;
    }

    id v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
    goto LABEL_34;
  }

  id v27 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v59 = [v6 participantIdentifier];
    id v23 = "[WARN] processParticipantDataUpdate: Invalid participantDataUpdate.participantIdentifier %llu";
    id v25 = v13;
    uint32_t v26 = 12;
    goto LABEL_14;
  }

- (void)handleParticipants:(id)a3 joinedConversationWithUpdate:(id)a4 joinContext:(id)a5 fromHandle:(id)a6 isFromPendingMessage:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v377 = a6;
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 providerIdentifier]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversationProvider providerForIdentifier:]( &OBJC_CLASS___TUConversationProvider,  "providerForIdentifier:",  v16));

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  LODWORD(v16) = [v18 groupFacetimeAsAServiceEnabled];

  if ((_DWORD)v16)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 providerIdentifier]);
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 tuConversationProviderForIdentifier:v20]);

    id v17 = (void *)v21;
  }

  if (v14)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v14 message]);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v13 groupUUID]);
    id v24 = (void *)v23;
    if (!v23)
    {
      id v56 = sub_1001704C4();
      id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "[WARN] handleParticipants:joinedConversationWithUpdate:joinContext: Empty participantUpdate.groupUUID",  buf,  2u);
      }

      goto LABEL_377;
    }

    v369 = self;
    v354 = (void *)v23;
    id v25 = sub_100170534();
    uint32_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_1002B68D0();
    }

    uint64_t v355 = objc_claimAutoreleasedReturnValue([v22 tuConversationLink]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v14 tuConversationMembers]);
    id v363 = [v27 mutableCopy];

    v359 = v14;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v14 tuLightweightMembers]);
    id v362 = [v28 mutableCopy];

    __int16 v29 = v22;
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v22 addedMembers]);
    id v31 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v30 count]));

    __int128 v426 = 0u;
    __int128 v425 = 0u;
    __int128 v424 = 0u;
    __int128 v423 = 0u;
    v357 = v29;
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v29 addedMembers]);
    id v33 = [v32 countByEnumeratingWithState:&v423 objects:v446 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v424;
      do
      {
        for (i = 0LL; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v424 != v35) {
            objc_enumerationMutation(v32);
          }
          id v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v423 + 1) + 8 * (void)i) tuConversationMember]);
          -[__CFString addObject:](v31, "addObject:", v37);
        }

        id v34 = [v32 countByEnumeratingWithState:&v423 objects:v446 count:16];
      }

      while (v34);
    }

    if (-[__CFString count](v31, "count")) {
      [v363 unionSet:v31];
    }
    v364 = v17;
    v358 = v13;
    id v38 = sub_1001704C4();
    unsigned int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = -[__CFString count](v31, "count");
      id v41 = [v363 count];
      id v42 = @"NO";
      *(_DWORD *)buf = 134218754;
      *(void *)v435 = v40;
      *(_WORD *)&v435[8] = 2048;
      if (v7) {
        id v42 = @"YES";
      }
      *(void *)v436 = v41;
      *(_WORD *)&v436[8] = 2112;
      v437 = v31;
      __int16 v438 = 2112;
      *(void *)v439 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "addedMembers count: %lu, members count: %lu, addedMembers: %@, isFromPendingMessage: %@",  buf,  0x2Au);
    }

    id v43 = (void *)objc_claimAutoreleasedReturnValue([v357 lightweightMembers]);
    BOOL v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v43 count]));

    __int128 v422 = 0u;
    __int128 v421 = 0u;
    __int128 v420 = 0u;
    __int128 v419 = 0u;
    BOOL v45 = (void *)objc_claimAutoreleasedReturnValue([v357 lightweightMembers]);
    id v46 = [v45 countByEnumeratingWithState:&v419 objects:v445 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v420;
      do
      {
        for (j = 0LL; j != v47; j = (char *)j + 1)
        {
          if (*(void *)v420 != v48) {
            objc_enumerationMutation(v45);
          }
          id v50 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v419 + 1) + 8 * (void)j) tuConversationMember]);
          id v51 = (void *)objc_claimAutoreleasedReturnValue([v50 lightweightPrimary]);
          id v52 = v51;
          [v44 addObject:v50];
        }

        id v47 = [v45 countByEnumeratingWithState:&v419 objects:v445 count:16];
      }

      while (v47);
    }

    [v362 unionSet:v44];
    id v14 = v359;
    v353 = v12;
    if ([v359 hasMessagesGroupUUIDString])
    {
      __int128 v53 = objc_alloc(&OBJC_CLASS___NSUUID);
      __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v359 messagesGroupUUIDString]);
      v352 = -[NSUUID initWithUUIDString:](v53, "initWithUUIDString:", v54);
    }

    else
    {
      v352 = 0LL;
    }

    id v13 = v358;
    v351 = (void *)objc_claimAutoreleasedReturnValue([v359 messagesGroupName]);
    id v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v59 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager serverBag](v369, "serverBag"));
    if ([v59 isParticipantIDToURIIncludedInPush])
    {
    }

    else
    {
      __int16 v60 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](v369, "featureFlags"));
      unsigned __int8 v61 = [v60 participantIDToURIRemovedEnabled];

      if ((v61 & 1) != 0) {
        goto LABEL_48;
      }
    }

    __int128 v418 = 0u;
    __int128 v416 = 0u;
    __int128 v417 = 0u;
    __int128 v415 = 0u;
    id v62 = (void *)objc_claimAutoreleasedReturnValue([v358 participantIDs]);
    id v63 = (void *)objc_claimAutoreleasedReturnValue([v62 allValues]);

    id v64 = [v63 countByEnumeratingWithState:&v415 objects:v444 count:16];
    if (v64)
    {
      id v65 = v64;
      uint64_t v66 = *(void *)v416;
      do
      {
        for (k = 0LL; k != v65; k = (char *)k + 1)
        {
          if (*(void *)v416 != v66) {
            objc_enumerationMutation(v63);
          }
          [v58 addObjectsFromArray:*(void *)(*((void *)&v415 + 1) + 8 * (void)k)];
        }

        id v65 = [v63 countByEnumeratingWithState:&v415 objects:v444 count:16];
      }

      while (v65);
    }

    id v14 = v359;
LABEL_48:
    if (![v363 count])
    {
      id v86 = sub_1001704C4();
      v368 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
      id v24 = v354;
      if (os_log_type_enabled(v368, OS_LOG_TYPE_ERROR)) {
        sub_1002B6818();
      }
      id v22 = v357;
      goto LABEL_376;
    }

    BOOL v360 = v7;
    id v68 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDConversationManager activeLocalHandlesForProvider]( v369,  "activeLocalHandlesForProvider"));
    uint64_t v69 = ((uint64_t (**)(void, void *))v68)[2](v68, v364);
    uint64_t v70 = objc_claimAutoreleasedReturnValue(v69);

    v368 = (os_log_s *)v70;
    v356 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager localMemberForProvider:fromHandle:members:lightweightMembers:activeLocalHandles:]( v369,  "localMemberForProvider:fromHandle:members:lightweightMembers:activeLocalHandles:",  v364,  v377,  v363,  v362,  v70));
    __int128 v411 = 0u;
    __int128 v412 = 0u;
    __int128 v413 = 0u;
    __int128 v414 = 0u;
    id v71 = v31;
    id v72 = -[__CFString countByEnumeratingWithState:objects:count:]( v71,  "countByEnumeratingWithState:objects:count:",  &v411,  v443,  16LL);
    v370 = v71;
    if (v72)
    {
      id v73 = v72;
      uint64_t v74 = *(void *)v412;
      while (2)
      {
        for (m = 0LL; m != v73; m = (char *)m + 1)
        {
          if (*(void *)v412 != v74) {
            objc_enumerationMutation(v71);
          }
          id v76 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v411 + 1) + 8 * (void)m) handle]);
          unsigned __int8 v77 = -[os_log_s containsObject:](v368, "containsObject:", v76);

          if ((v77 & 1) != 0)
          {
            dispatch_time_t v78 = v71;
            int v85 = 1;
            goto LABEL_72;
          }
        }

        id v73 = -[__CFString countByEnumeratingWithState:objects:count:]( v71,  "countByEnumeratingWithState:objects:count:",  &v411,  v443,  16LL);
        id v14 = v359;
        if (v73) {
          continue;
        }
        break;
      }
    }

    __int128 v409 = 0u;
    __int128 v410 = 0u;
    __int128 v407 = 0u;
    __int128 v408 = 0u;
    dispatch_time_t v78 = v44;
    id v79 = -[__CFString countByEnumeratingWithState:objects:count:]( v78,  "countByEnumeratingWithState:objects:count:",  &v407,  v442,  16LL);
    if (v79)
    {
      id v80 = v79;
      uint64_t v81 = *(void *)v408;
      while (2)
      {
        for (n = 0LL; n != v80; n = (char *)n + 1)
        {
          if (*(void *)v408 != v81) {
            objc_enumerationMutation(v78);
          }
          __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v407 + 1) + 8 * (void)n) handle]);
          unsigned __int8 v84 = -[CSDConversationManager isValidLocalHandle:activeLocalHandles:provider:]( v369,  "isValidLocalHandle:activeLocalHandles:provider:",  v83,  v368,  v364);

          if ((v84 & 1) != 0)
          {
            int v85 = 1;
            goto LABEL_71;
          }
        }

        id v80 = -[__CFString countByEnumeratingWithState:objects:count:]( v78,  "countByEnumeratingWithState:objects:count:",  &v407,  v442,  16LL);
        if (v80) {
          continue;
        }
        break;
      }

      int v85 = 0;
LABEL_71:
      id v13 = v358;
LABEL_72:
      id v14 = v359;
    }

    else
    {
      int v85 = 0;
    }

    id v87 = sub_100170534();
    id v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      *(void *)v435 = v363;
      *(_WORD *)&v435[8] = 2112;
      *(void *)v436 = v362;
      *(_WORD *)&v436[8] = 2112;
      v437 = v370;
      __int16 v438 = 2112;
      *(void *)v439 = v44;
      *(_WORD *)&v439[8] = 2112;
      *(void *)&v439[10] = v368;
      __int16 v440 = 2112;
      v441 = v356;
      _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "members: %@\n lightweightMembers: %@\n addedMembers: %@\n addedLightweightMembers: %@\n activeLocalHandles: %@\n receivedLocalMember: %@",  buf,  0x3Eu);
    }

    LODWORD(v365) = -[CSDConversationManager isValidLocalHandle:activeLocalHandles:provider:]( v369,  "isValidLocalHandle:activeLocalHandles:provider:",  v377,  v368,  v364);
    id v89 = sub_1001704C4();
    uint64_t v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v435 = v356;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Received local member: %@", buf, 0xCu);
    }

    id v91 = (void *)objc_claimAutoreleasedReturnValue([v14 otherInvitedHandles]);
    v376 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v91 count]));

    __int128 v405 = 0u;
    __int128 v406 = 0u;
    __int128 v403 = 0u;
    __int128 v404 = 0u;
    __int16 v92 = (void *)objc_claimAutoreleasedReturnValue([v14 otherInvitedTUHandles]);
    id v93 = [v92 countByEnumeratingWithState:&v403 objects:v433 count:16];
    if (v93)
    {
      id v94 = v93;
      uint64_t v95 = *(void *)v404;
      do
      {
        for (ii = 0LL; ii != v94; ii = (char *)ii + 1)
        {
          if (*(void *)v404 != v95) {
            objc_enumerationMutation(v92);
          }
          [v376 addObject:*(void *)(*((void *)&v403 + 1) + 8 * (void)ii)];
        }

        id v94 = [v92 countByEnumeratingWithState:&v403 objects:v433 count:16];
      }

      while (v94);
    }

    id v97 = [v363 mutableCopy];
    __int128 v98 = v97;
    if (v356) {
      objc_msgSend(v97, "removeObject:");
    }
    v350 = v98;
    id v99 = [v98 count];
    id v24 = v354;
    id v100 = v369;
    if (v99 > +[TUConversationManager maximumNumberOfInvitedMembers]( &OBJC_CLASS___TUConversationManager,  "maximumNumberOfInvitedMembers"))
    {
      id v101 = sub_1001704C4();
      id v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        id v103 = v350;
        uint64_t v104 = v102;
        id v105 = [v350 count];
        id v106 = (const __CFString *)+[TUConversationManager maximumNumberOfInvitedMembers]( &OBJC_CLASS___TUConversationManager,  "maximumNumberOfInvitedMembers");
        *(_DWORD *)buf = 138412802;
        *(void *)v435 = v354;
        *(_WORD *)&v435[8] = 2048;
        *(void *)v436 = v105;
        id v102 = v104;
        *(_WORD *)&v436[8] = 2048;
        v437 = v106;
        _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "[WARN] Dropping conversation with groupUUID %@ since it has %tu remote members which is greater than the maxim um allowed of %tu.",  buf,  0x20u);
        id v22 = v357;
      }

      else
      {
        id v22 = v357;
        id v103 = v350;
      }

      goto LABEL_375;
    }

    else {
      uint64_t v107 = 1LL;
    }
    id v22 = v357;
    id v108 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDConversationManager conversationWithGroupUUID:orMemberIdentifiers:orRemoteMembers:andLink:andVideo:]( v369,  "conversationWithGroupUUID:orMemberIdentifiers:orRemoteMembers:andLink:andVideo:",  v354,  v58,  v350,  v355,  v107));
    id v102 = v108;
    if (v108 && (-[os_log_s containsMemberWithHandle:](v108, "containsMemberWithHandle:", v377) & 1) == 0)
    {
      id v122 = sub_1001704C4();
      id v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v435 = v377;
        *(_WORD *)&v435[8] = 2112;
        *(void *)v436 = v102;
        _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_DEFAULT,  "[WARN] We received a message from %@, which was in the remote members list given in the message, but not in th e existing conversation UUID: %@. Dropping message.",  buf,  0x16u);
      }

      id v103 = v350;
      goto LABEL_374;
    }

    v374 = v102;
    id v109 = sub_1001704C4();
    id v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v435 = v374;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "find existing conversation: %@", buf, 0xCu);
    }

    id v102 = v374;
    unsigned int v346 = v85;
    if (!v374)
    {
      int obj = 1;
      id v13 = v358;
      goto LABEL_158;
    }

    __int16 v111 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s remoteMembers](v374, "remoteMembers"));
    if ([v111 count] == (id)1)
    {
      id v112 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s activeRemoteParticipants](v374, "activeRemoteParticipants"));
      id v113 = [v112 count];

      id v102 = v374;
      if (v113 && !v355)
      {
        __int128 v401 = 0u;
        __int128 v402 = 0u;
        __int128 v399 = 0u;
        __int128 v400 = 0u;
        id v114 = v362;
        id v115 = [v114 countByEnumeratingWithState:&v399 objects:v432 count:16];
        if (v115)
        {
          id v116 = v115;
          char v117 = 0;
          uint64_t v118 = *(void *)v400;
          do
          {
            for (jj = 0LL; jj != v116; jj = (char *)jj + 1)
            {
              if (*(void *)v400 != v118) {
                objc_enumerationMutation(v114);
              }
              unsigned __int8 v121 = [v120 isEqualToHandle:v377];

              v117 |= v121;
            }

            id v116 = [v114 countByEnumeratingWithState:&v399 objects:v432 count:16];
          }

          while (v116);
        }

        else
        {
          char v117 = 0;
        }

        __int128 v397 = 0u;
        __int128 v398 = 0u;
        __int128 v395 = 0u;
        __int128 v396 = 0u;
        id v102 = v374;
        id obja = (id)objc_claimAutoreleasedReturnValue(-[os_log_s activeRemoteParticipants](v374, "activeRemoteParticipants"));
        id v124 = [obja countByEnumeratingWithState:&v395 objects:v431 count:16];
        if (v124)
        {
          id v125 = v124;
          uint64_t v126 = *(void *)v396;
          while (2)
          {
            for (kk = 0LL; kk != v125; kk = (char *)kk + 1)
            {
              if (*(void *)v396 != v126) {
                objc_enumerationMutation(obja);
              }
              id v129 = (void *)objc_claimAutoreleasedReturnValue([v358 participantDestinationID]);
              unsigned __int8 v130 = [v128 isEqualToString:v129];

              if ((v130 & 1) != 0)
              {
                id v14 = v359;
                id v22 = v357;
                id v102 = v374;
                __int16 v111 = obja;
                goto LABEL_129;
              }

              id v102 = v374;
            }

            id v125 = [obja countByEnumeratingWithState:&v395 objects:v431 count:16];
            if (v125) {
              continue;
            }
            break;
          }
        }

        id v14 = v359;
        id v22 = v357;
        if ((v117 & 1) == 0)
        {
          if ([v358 isInitiator])
          {
            id v131 = sub_1001704C4();
            __int16 v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v435 = v377;
              _os_log_impl( (void *)&_mh_execute_header,  v132,  OS_LOG_TYPE_DEFAULT,  "[WARN] We received a message from %@, which was in the remote members list but from a different device; "
                "treating as new conversation",
                buf,
                0xCu);
            }

            id v102 = 0LL;
            int obj = 1;
            id v13 = v358;
            goto LABEL_153;
          }
        }
      }
    }

    else
    {
LABEL_129:
    }

    __int128 v133 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s groupUUID](v102, "groupUUID"));
    __int128 v134 = (void *)objc_claimAutoreleasedReturnValue([v133 UUIDString]);
    id v24 = v354;
    __int128 v135 = (void *)objc_claimAutoreleasedReturnValue([v354 UUIDString]);
    unsigned __int8 v136 = [v134 isEqualToString:v135];

    if ((v136 & 1) == 0)
    {
      uint64_t v155 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
      v156 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s tuConversation](v374, "tuConversation"));
      [v155 transitionAttemptForConversation:v156];

      id v157 = sub_1001704C4();
      __int128 v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v157);
      if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v435 = v377;
        *(_WORD *)&v435[8] = 2112;
        *(void *)v436 = v374;
        _os_log_impl( (void *)&_mh_execute_header,  v158,  OS_LOG_TYPE_DEFAULT,  "We received a message from %@, and we found same converastion: %@ with remote members with a different groupUU ID; treating as new conversation",
          buf,
          0x16u);
      }

      id v102 = 0LL;
      int obj = 1;
      id v13 = v358;
      goto LABEL_157;
    }

    __int128 v393 = 0u;
    __int128 v394 = 0u;
    __int128 v391 = 0u;
    __int128 v392 = 0u;
    id v137 = v350;
    id v138 = [v137 countByEnumeratingWithState:&v391 objects:v430 count:16];
    if (v138)
    {
      id v139 = v138;
      uint64_t v140 = *(void *)v392;
      do
      {
        for (mm = 0LL; mm != v139; mm = (char *)mm + 1)
        {
          if (*(void *)v392 != v140) {
            objc_enumerationMutation(v137);
          }
          id v142 = *(void **)(*((void *)&v391 + 1) + 8LL * (void)mm);
          id v143 = (void *)objc_claimAutoreleasedReturnValue([v142 associationVoucher]);

          if (v143) {
            -[os_log_s updateRemoteMember:](v374, "updateRemoteMember:", v142);
          }
        }

        id v139 = [v137 countByEnumeratingWithState:&v391 objects:v430 count:16];
      }

      while (v139);
    }

    __int128 v389 = 0u;
    __int128 v390 = 0u;
    __int128 v387 = 0u;
    __int128 v388 = 0u;
    id v144 = v362;
    id v145 = [v144 countByEnumeratingWithState:&v387 objects:v429 count:16];
    if (v145)
    {
      id v146 = v145;
      uint64_t v147 = *(void *)v388;
      do
      {
        for (nn = 0LL; nn != v146; nn = (char *)nn + 1)
        {
          if (*(void *)v388 != v147) {
            objc_enumerationMutation(v144);
          }
          __int16 v149 = *(void **)(*((void *)&v387 + 1) + 8LL * (void)nn);
          id v150 = (void *)objc_claimAutoreleasedReturnValue([v149 associationVoucher]);

          if (v150) {
            -[os_log_s updateLightweightMember:](v374, "updateLightweightMember:", v149);
          }
        }

        id v146 = [v144 countByEnumeratingWithState:&v387 objects:v429 count:16];
      }

      while (v146);
    }

    if (!v356)
    {
      int obj = 0;
      id v22 = v357;
      id v13 = v358;
      id v24 = v354;
      id v100 = v369;
      id v102 = v374;
LABEL_158:
      if (!-[CSDConversationManager shouldAcceptMembershipUpdateFromHandle:joinContext:participantUpdate:existingConversation:]( v100,  "shouldAcceptMembershipUpdateFromHandle:joinContext:participantUpdate:existingConversation:",  v377,  v14,  v13,  v102))
      {
        id v160 = sub_1001704C4();
        id v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v160);
        id v103 = v350;
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR)) {
          sub_1002B6870();
        }
        goto LABEL_374;
      }

      else {
        unsigned int v159 = 1;
      }
      uint64_t v161 = 1LL;
      if (v159) {
        uint64_t v161 = 2LL;
      }
      uint64_t v344 = v161;
      v375 = v102;
      __int128 v162 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentServerTime sharedInstance](&OBJC_CLASS___IDSCurrentServerTime, "sharedInstance"));
      id v123 = (os_log_s *)objc_claimAutoreleasedReturnValue([v162 currentServerTimeDate]);

      __int128 v163 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v123,  -30.0));
      __int128 v164 = (void *)objc_claimAutoreleasedReturnValue([v13 serverDate]);
      id v341 = [v163 compare:v164];

      if (!obj)
      {
        id v175 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s groupUUID](v375, "groupUUID"));
        unsigned int v176 = [v175 isEqual:v24];

        if (v176)
        {
          id v177 = v375;
          id v13 = v358;
          if (-[__CFString count](v370, "count")) {
            -[os_log_s addRemoteMembers:otherInvitedHandles:triggeredLocally:]( v177,  "addRemoteMembers:otherInvitedHandles:triggeredLocally:",  v370,  v376,  0LL);
          }
          __int16 v178 = v369;
          if ([v44 count]) {
            -[os_log_s addRemoteMembers:otherInvitedHandles:triggeredLocally:]( v177,  "addRemoteMembers:otherInvitedHandles:triggeredLocally:",  v44,  v376,  0LL);
          }
        }

        else
        {
          id v179 = sub_1001704C4();
          v180 = (os_log_s *)objc_claimAutoreleasedReturnValue(v179);
          id v13 = v358;
          if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v435 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v180,  OS_LOG_TYPE_DEFAULT,  "Ignoring message for group UUID %@",  buf,  0xCu);
          }

          id v177 = 0LL;
          __int16 v178 = v369;
        }

- (void)handleParticipantWithIdentifier:(unint64_t)a3 leftConversationWithGroupUUID:(id)a4 fromHandle:(id)a5 withGroupSessionUpdate:(id)a6
{
  id v10 = (CSDMessagingConversationParticipantDidLeaveContext *)a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  id v14 = sub_1001704C4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 134218242;
    unint64_t v30 = a3;
    __int16 v31 = 2112;
    __int128 v32 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Participant with identifier: %llu left conversation with groupUUID: %@",  (uint8_t *)&v29,  0x16u);
  }

  if (v10)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 clientContextData]);

    if (v16)
    {
      id v17 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipantDidLeaveContext);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 clientContextData]);
      id v19 = -[CSDMessagingConversationParticipantDidLeaveContext initWithData:](v17, "initWithData:", v18);

      uint64_t v20 = -[CSDMessagingConversationParticipantDidLeaveContext leaveReason](v19, "leaveReason");
      id v21 = sub_1001704C4();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 134218242;
        unint64_t v30 = a3;
        __int16 v31 = 2112;
        __int128 v32 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Participant with identifier %llu left with leave context %@",  (uint8_t *)&v29,  0x16u);
      }
    }

    else
    {
      id v25 = sub_1001704C4();
      id v19 = (CSDMessagingConversationParticipantDidLeaveContext *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 134217984;
        unint64_t v30 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "Participant with identifier %llu left without providing a leave context",  (uint8_t *)&v29,  0xCu);
      }

      uint64_t v20 = 0LL;
    }

    uint32_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationWithGroupUUID:](self, "conversationWithGroupUUID:", v10));
    id v24 = v26;
    if (v26)
    {
      -[os_log_s removeParticipantWithIdentifier:fromHandle:withReason:]( v26,  "removeParticipantWithIdentifier:fromHandle:withReason:",  a3,  v11,  v20);
    }

    else
    {
      id v27 = sub_1001704C4();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412290;
        unint64_t v30 = (unint64_t)v10;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for group UUID %@",  (uint8_t *)&v29,  0xCu);
      }
    }
  }

  else
  {
    id v23 = sub_1001704C4();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[WARN] handleParticipantWithIdentifier:leftConversationWithGroupUUID: empty groupUUID",  (uint8_t *)&v29,  2u);
    }
  }
}

- (void)removePendingMemberMatchingActiveParticipant:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 pendingMembers]);
  id v10 = [v9 count];

  if (v10)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 pendingMembers]);
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (!v12)
    {
      id v14 = v11;
LABEL_16:

      goto LABEL_17;
    }

    id v13 = v12;
    uint32_t v26 = self;
    id v27 = v7;
    id v14 = 0LL;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "handle", v26, v27));
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
        unsigned int v20 = [v18 isEquivalentToHandle:v19];

        if (v20)
        {
          id v21 = v17;

          id v14 = v21;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }

    while (v13);

    id v7 = v27;
    if (v14)
    {
      id v22 = sub_1001704C4();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v27 UUID]);
        *(_DWORD *)buf = 138412802;
        id v33 = v6;
        __int16 v34 = 2112;
        uint64_t v35 = v14;
        __int16 v36 = 2112;
        id v37 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Active participant %@ was still listed as a pending member %@ for conversation UUID %@; did we miss an approva"
          "l delegation notice?",
          buf,
          0x20u);
      }

      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager pendingMembershipTracker](v26, "pendingMembershipTracker"));
      [v25 stopTrackingPendingMember:v14 forConversation:v27 triggeredLocally:0];

      goto LABEL_16;
    }
  }

- (void)prepareAdditionOfActiveParticipant:(id)a3 toInvitedMembersForLinkOnConversation:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v28 link]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v28 link]);
    if ([v9 isLocallyCreated])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v28 memberHandlesAwaitingInvitesToLink]);
      id v11 = [v10 count];

      if (v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue([v28 memberHandlesAwaitingInvitesToLink]);
        id v13 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v13)
        {
          uint64_t v15 = *(void *)v36;
          *(void *)&__int128 v14 = 138412290LL;
          __int128 v27 = v14;
          do
          {
            id v16 = 0LL;
            do
            {
              if (*(void *)v36 != v15) {
                objc_enumerationMutation(obj);
              }
              id v17 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v16);
              id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handle", v27));
              unsigned int v19 = [v17 isEquivalentToHandle:v18];

              if (v19)
              {
                id inited = objc_initWeak(&location, self);
                uint64_t v21 = TUKickMemberTimeout(inited);
                dispatch_time_t v22 = dispatch_time(0LL, 1000000000 * v21);
                id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472LL;
                block[2] = sub_1001085CC;
                block[3] = &unk_1003D8220;
                objc_copyWeak(&v33, &location);
                id v31 = v28;
                __int128 v32 = v17;
                dispatch_after(v22, v23, block);

                id v24 = sub_1001704C4();
                id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v27;
                  id v40 = v12;
                  _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Removing handles %@ from handles awaiting link invites as we have scheduled the block to add them if not kicked",  buf,  0xCu);
                }

                [v12 addObject:v17];
                objc_destroyWeak(&v33);
                objc_destroyWeak(&location);
              }

              id v16 = (char *)v16 + 1;
            }

            while (v13 != v16);
            id v13 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
          }

          while (v13);
        }

        uint32_t v26 = (void *)objc_claimAutoreleasedReturnValue([v28 memberHandlesAwaitingInvitesToLink]);
        [v26 removeObjectsInArray:v12];
      }
    }

    else
    {
    }
  }
}

- (id)pickInitiatorFromActiveParticipants:(id)a3 forUpdate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  id v9 = 0LL;
  if (v8)
  {
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v12, "isLightweight", (void)v24) & 1) == 0
          && ([v12 isPseudonym] & 1) == 0)
        {
          if ([v6 isInitiator])
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activeIDSDestination]);
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 participantDestinationID]);
            unsigned int v15 = [v13 isEqualToString:v14];

            if (v15)
            {
              id v16 = sub_1001704C4();
              id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                __int128 v29 = v12;
                _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Using group session initiator as conversation initiator: %@",  buf,  0xCu);
              }

              id v8 = v12;
              goto LABEL_18;
            }
          }

          if (!v9) {
            id v9 = v12;
          }
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)linkManager:(id)a3 updatedLinkDescriptorsFromSync:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100108B20;
  v8[3] = &unk_1003D7758;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)linkManager:(id)a3 removedLinkDescriptorsFromIDSSignal:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100108C68;
  v8[3] = &unk_1003D7758;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)linkManager:(id)a3 updatedLinkDescriptorsFromIDSSignal:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100108DB0;
  v8[3] = &unk_1003D7758;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)linkManager:(id)a3 removedLinkDescriptorsFromValidityCheck:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100108F08;
  v8[3] = &unk_1003D7758;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)handleRemovedLinkDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDConversationManager notifyDelegatesOfChangedLinkDescriptors:]( self,  "notifyDelegatesOfChangedLinkDescriptors:",  v4);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10);
        id v12 = objc_alloc(&OBJC_CLASS___TUConversationLink);
        id v13 = -[TUConversationLink initWithDescriptor:](v12, "initWithDescriptor:", v11, (void)v14);
        -[CSDConversationManager sendMessagesForInvalidatedLink:](self, "sendMessagesForInvalidatedLink:", v13);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (void)pendingMembershipTracker:(id)a3 willAdd:(id)a4 to:(id)a5 using:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_1001704C4();
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
    *(_DWORD *)buf = 138412546;
    id v24 = v11;
    __int16 v25 = 2112;
    __int128 v26 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Membership tracker prompted response for pending member! {member: %@, conversation UUID: %@}",  buf,  0x16u);
  }

  objc_initWeak((id *)buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001092D4;
  v19[3] = &unk_1003D8220;
  objc_copyWeak(&v22, (id *)buf);
  id v17 = v12;
  id v20 = v17;
  id v18 = v11;
  id v21 = v18;
  -[CSDConversationManager sendLetMeInResponseToPendingMember:forConversation:usingResponseKeyData:approved:callback:]( self,  "sendLetMeInResponseToPendingMember:forConversation:usingResponseKeyData:approved:callback:",  v18,  v17,  v13,  1LL,  v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (void)pendingMembershipTracker:(id)a3 didTrack:(id)a4 forGroupUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Membership tracker retained pending member because conversation does not yet exist {member: %@, groupUUID: %@}",  (uint8_t *)&v14,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager conversationLinkForGroupUUID:](self, "conversationLinkForGroupUUID:", v8));
  if (v11)
  {
    -[CSDConversationManager notifyDelegatesOfTrackedPendingMember:forConversationLink:]( self,  "notifyDelegatesOfTrackedPendingMember:forConversationLink:",  v7,  v11);
    -[CSDConversationManager notifyDelegatesOfUpdatePendingConversations]( self,  "notifyDelegatesOfUpdatePendingConversations");
  }

  else
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No link was found; ignoring tracked pending member {member: %@, groupUUID: %@}",
        (uint8_t *)&v14,
        0x16u);
    }
  }
}

- (void)pendingMembershipTracker:(id)a3 willNotAdd:(id)a4 to:(id)a5 using:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = sub_1001704C4();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Membership not adding pending member! {member: %@}",  buf,  0xCu);
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager featureFlags](self, "featureFlags"));
  if (([v14 groupFacetimeAsAServiceEnabled] & 1) == 0)
  {

    goto LABEL_7;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 provider]);

  if (!v15)
  {
LABEL_7:
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager service](self, "service"));
    goto LABEL_8;
  }

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 provider]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceForProvider:v17]);

LABEL_8:
  -[CSDConversationManager sendLetMeInResponseToPendingMember:forConversation:usingResponseKeyData:approved:callback:]( self,  "sendLetMeInResponseToPendingMember:forConversation:usingResponseKeyData:approved:callback:",  v9,  v10,  v11,  0LL,  0LL);

  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v9 handle]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100109710;
  v21[3] = &unk_1003D8600;
  id v22 = v9;
  id v20 = v9;
  [v18 noteDismissedHandle:v19 completionHandle:v21];
}

- (void)sendDelegationMessageTo:(id)a3 conversation:(id)a4 link:(id)a5 transactionUUID:(id)a6 forMember:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = sub_1001704C4();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Asked to send delegation message!", v23, 2u);
  }

  unsigned int v19 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 groupUUID]);
  id v21 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v19,  "initWithType:groupUUID:link:",  14LL,  v20,  0LL);

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 nickname]);
  -[CSDMessagingConversationMessage setNickname:](v21, "setNickname:", v22);

  -[CSDConversationManager _sendDelegationMessageTo:conversation:link:transactionUUID:forMember:withMessage:]( self,  "_sendDelegationMessageTo:conversation:link:transactionUUID:forMember:withMessage:",  v16,  v15,  v14,  v13,  v12,  v21);
}

- (void)sendDelegationResponseMessageTo:(id)a3 conversation:(id)a4 transactionUUID:(id)a5 forMember:(id)a6 withResponse:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = sub_1001704C4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = @"NO";
    if (v7) {
      id v18 = @"YES";
    }
    int v23 = 138412290;
    id v24 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Asked to send delegation response message! {withResponse: %@}",  (uint8_t *)&v23,  0xCu);
  }

  unsigned int v19 = objc_alloc(&OBJC_CLASS___CSDMessagingConversationMessage);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 groupUUID]);
  id v21 = -[CSDMessagingConversationMessage initWithType:groupUUID:link:]( v19,  "initWithType:groupUUID:link:",  15LL,  v20,  0LL);

  -[CSDMessagingConversationMessage setIsLetMeInApproved:](v21, "setIsLetMeInApproved:", v7);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 nickname]);
  -[CSDMessagingConversationMessage setNickname:](v21, "setNickname:", v22);

  -[CSDConversationManager _sendDelegationMessageTo:conversation:link:transactionUUID:forMember:withMessage:]( self,  "_sendDelegationMessageTo:conversation:link:transactionUUID:forMember:withMessage:",  v15,  v14,  0LL,  v13,  v12,  v21);
}

- (void)_sendDelegationMessageTo:(id)a3 conversation:(id)a4 link:(id)a5 transactionUUID:(id)a6 forMember:(id)a7 withMessage:(id)a8
{
  id v14 = a3;
  unint64_t v15 = (unint64_t)a4;
  unint64_t v16 = (unint64_t)a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (-[CSDConversationManager _linksEnabled](self, "_linksEnabled"))
  {
    if (v15 | v16)
    {
      if (v15)
      {
        id v21 = (void *)v15;
        goto LABEL_9;
      }
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([0 groupUUID]);
      if (v20)
      {
      }

      else
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([0 originatorHandle]);

        if (!v22)
        {
          id v56 = sub_1001704C4();
          __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_1002B693C();
          }
          goto LABEL_39;
        }
      }
    }

    id v21 = (void *)v16;
LABEL_9:
    uint64_t v64 = objc_claimAutoreleasedReturnValue([v21 groupUUID]);
    id v23 = [v14 count];
    id v24 = sub_1001704C4();
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (!v23)
    {
      if (v26)
      {
        *(_DWORD *)buf = 138412802;
        __int128 v29 = (os_log_s *)v64;
        uint64_t v73 = v64;
        __int16 v74 = 2112;
        uint64_t v75 = (uint64_t)v17;
        __int16 v76 = 2112;
        id v77 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Not sending delegation message because no handles were specified! {groupUUID: %@, transactionUUID: %@, pendingMember: %@}",  buf,  0x20u);
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }

- (void)screenSharingActivityManager:(id)a3 receivedUpdatedRemoteAttributes:(id)a4 isLocallySharing:(BOOL)a5
{
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010A11C;
  block[3] = &unk_1003D7918;
  BOOL v13 = a5;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)screenSharingActivityManager:(id)a3 invalidatedSessionWithReason:(id)a4 wasLocallySharing:(BOOL)a5
{
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010A29C;
  block[3] = &unk_1003D7918;
  BOOL v12 = a5;
  void block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)applicationPolicyManager:(id)a3 authorizationChangedForBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "conversationManager:activityAuthorizationChangedForBundleIdentifier:") & 1) != 0)
        {
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v12]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10010A670;
          block[3] = &unk_1003D7828;
          void block[4] = v12;
          void block[5] = self;
          id v16 = v5;
          dispatch_async(v14, block);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }
}

- (void)systemStateObserver:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue", a3));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v4) {
      id v9 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SharePlay allowed: %@", buf, 0xCu);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "conversationManager:sharePlayAvailableChanged:") & 1) != 0)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v15]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10010A994;
          block[3] = &unk_1003D7918;
          void block[4] = v15;
          void block[5] = self;
          BOOL v33 = v4;
          dispatch_async(v17, block);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v12);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager observerToQueue](self, "observerToQueue"));
  id v19 = [v18 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)j);
        if ((objc_opt_respondsToSelector(v23, "conversationManager:sharePlayAllowedChanged:") & 1) != 0)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager observerToQueue](self, "observerToQueue"));
          __int16 v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v23]);

          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_10010A9A4;
          v26[3] = &unk_1003D7918;
          v26[4] = v23;
          void v26[5] = self;
          BOOL v27 = v4;
          dispatch_async(v25, v26);
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }

    while (v20);
  }
}

- (void)systemStateObserver:(id)a3 screenSharingAllowedStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue", a3));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v4) {
      id v9 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Screen sharing allowed: %@", buf, 0xCu);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "conversationManager:screenSharingAvailableChanged:") & 1) != 0)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager delegateToQueue](self, "delegateToQueue"));
          __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v15]);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10010ACC8;
          block[3] = &unk_1003D7918;
          void block[4] = v15;
          void block[5] = self;
          BOOL v33 = v4;
          dispatch_async(v17, block);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v12);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager observerToQueue](self, "observerToQueue"));
  id v19 = [v18 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)j);
        if ((objc_opt_respondsToSelector(v23, "conversationManager:screenSharingAllowedChanged:") & 1) != 0)
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager observerToQueue](self, "observerToQueue"));
          __int16 v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v23]);

          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_10010ACD8;
          v26[3] = &unk_1003D7918;
          v26[4] = v23;
          void v26[5] = self;
          BOOL v27 = v4;
          dispatch_async(v25, v26);
        }
      }

      id v20 = [v18 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }

    while (v20);
  }
}

- (void)fileTransferer:(id)a3 didReceiveResourcesAtURL:(id)a4 withMetadata:(id)a5 isZipped:(BOOL)a6 fromIDSDestination:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10010ADCC;
  v17[3] = &unk_1003D7B28;
  id v18 = v10;
  id v19 = v11;
  id v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);
}

- (void)fileTransferer:(id)a3 didTransferFileAtURL:(id)a4 successfully:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Resource transfer did initiate successfully: %d",  buf,  8u);
  }

  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversationManager queue](self, "queue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10010B2AC;
  v12[3] = &unk_1003D7758;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, v12);
}

- (CSDPendingMembershipTracker)pendingMembershipTracker
{
  return self->_pendingMembershipTracker;
}

- (void)setPendingMembershipTracker:(id)a3
{
}

- (NSMutableDictionary)mutableConversationsByUUID
{
  return self->_mutableConversationsByUUID;
}

- (NSMutableDictionary)mutablePendingConversationsByPseudonym
{
  return self->_mutablePendingConversationsByPseudonym;
}

- (NSMutableDictionary)mutablePseudonymsByCallUUID
{
  return self->_mutablePseudonymsByCallUUID;
}

- (NSMutableDictionary)mutablePseudonymsByRequestIdentifiers
{
  return self->_mutablePseudonymsByRequestIdentifiers;
}

- (NSMutableDictionary)mutableSendDataCallbacksByRequestIdentifiers
{
  return self->_mutableSendDataCallbacksByRequestIdentifiers;
}

- (NSMutableDictionary)mutableConversationsRequestingUpgradeWithPreferences
{
  return self->_mutableConversationsRequestingUpgradeWithPreferences;
}

- (OS_dispatch_source)pendingConversationCleanupTimer
{
  return self->_pendingConversationCleanupTimer;
}

- (void)setPendingConversationCleanupTimer:(id)a3
{
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void)setDelegateToQueue:(id)a3
{
}

- (NSMutableSet)incomingPendingMessageGUIDs
{
  return self->_incomingPendingMessageGUIDs;
}

- (void)setIncomingPendingMessageGUIDs:(id)a3
{
}

- (NSMapTable)observerToQueue
{
  return self->_observerToQueue;
}

- (void)setObserverToQueue:(id)a3
{
}

- (CSDScreenSharingActivityManager)screenSharingActivityManager
{
  return self->_screenSharingActivityManager;
}

- (CPSystemStateObserver)sharePlaySystemStateObserver
{
  return self->_sharePlaySystemStateObserver;
}

- (void)setSharePlaySystemStateObserver:(id)a3
{
}

- (CSDFileTransferController)fileTransferController
{
  return self->_fileTransferController;
}

- (void)setFileTransferController:(id)a3
{
}

- (NSMutableDictionary)resourceTransferCallbacks
{
  return self->_resourceTransferCallbacks;
}

- (void)setResourceTransferCallbacks:(id)a3
{
}

- (CSDConversationPersistenceController)persistenceController
{
  return self->_persistenceController;
}

- (CSDDeviceLockStateObserver)lockStateObserver
{
  return self->_lockStateObserver;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (void)setCallProviderManager:(id)a3
{
}

- (CSDConversationLinkManager)linkManager
{
  return self->_linkManager;
}

- (void)setLinkManager:(id)a3
{
}

- (CSDReportingController)reportingController
{
  return self->_reportingController;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (CSDConversationNoticeManager)conversationNoticeManger
{
  return self->_conversationNoticeManger;
}

- (CSDSharedConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (CSDConversationInvitationResolving)invitationResolver
{
  return self->_invitationResolver;
}

- (void)setInvitationResolver:(id)a3
{
}

- (NSMutableDictionary)screenCaptureQueue
{
  return self->_screenCaptureQueue;
}

- (CSDVoucherManager)voucherManager
{
  return self->_voucherManager;
}

- (void)setVoucherManager:(id)a3
{
}

- (CSDParticipantUpdateSanitizer)participantUpdateSanitizer
{
  return self->_participantUpdateSanitizer;
}

- (void)setParticipantUpdateSanitizer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (id)groupSessionProviderCreationBlock
{
  return self->_groupSessionProviderCreationBlock;
}

- (void)setGroupSessionProviderCreationBlock:(id)a3
{
}

- (void)setDeviceSupport:(id)a3
{
}

- (id)conversationCreationBlock
{
  return self->_conversationCreationBlock;
}

- (void)setConversationCreationBlock:(id)a3
{
}

- (id)sendDataBlock
{
  return self->_sendDataBlock;
}

- (void)setSendDataBlock:(id)a3
{
}

- (id)getPersonalNicknameBlock
{
  return self->_getPersonalNicknameBlock;
}

- (void)setGetPersonalNicknameBlock:(id)a3
{
}

- (CSDConversationProviderManager)conversationProviderManager
{
  return self->_conversationProviderManager;
}

- (void)setConversationProviderManager:(id)a3
{
}

- (id)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(id)a3
{
}

- (id)activeLocalHandles
{
  return self->_activeLocalHandles;
}

- (void)setActiveLocalHandles:(id)a3
{
}

- (id)activeLocalHandlesForProvider
{
  return self->_activeLocalHandlesForProvider;
}

- (void)setActiveLocalHandlesForProvider:(id)a3
{
}

- (id)senderIdentitiesBlock
{
  return self->_senderIdentitiesBlock;
}

- (void)setSenderIdentitiesBlock:(id)a3
{
}

- (id)localCallerID
{
  return self->_localCallerID;
}

- (void)setLocalCallerID:(id)a3
{
}

- (id)notifyPendingMembershipTrackerOfDelegatedMember
{
  return self->_notifyPendingMembershipTrackerOfDelegatedMember;
}

- (void)setNotifyPendingMembershipTrackerOfDelegatedMember:(id)a3
{
}

- (id)localCallerIDForProvider
{
  return self->_localCallerIDForProvider;
}

- (void)setLocalCallerIDForProvider:(id)a3
{
}

- (CSDSecureImageTranscoder)imageTranscoder
{
  return self->_imageTranscoder;
}

- (void)setImageTranscoder:(id)a3
{
}

- (id)isConversationRelayPreferred
{
  return self->_isConversationRelayPreferred;
}

- (void)setIsConversationRelayPreferred:(id)a3
{
}

- (id)isHandleEligibleForScreenSharingRequestsBlock
{
  return self->_isHandleEligibleForScreenSharingRequestsBlock;
}

- (void)setIsHandleEligibleForScreenSharingRequestsBlock:(id)a3
{
}

- (NSMutableDictionary)outIdentifierToConversationInfo
{
  return self->_outIdentifierToConversationInfo;
}

- (void)setOutIdentifierToConversationInfo:(id)a3
{
}

- (CPApplicationController)cpApplicationController
{
  return self->_cpApplicationController;
}

- (CPActivityAuthorizationManager)activityAuthorizationManager
{
  return self->_activityAuthorizationManager;
}

- (void)setActivityAuthorizationManager:(id)a3
{
}

- (CSDConduitIDSProxy)messageProxy
{
  return (CSDConduitIDSProxy *)objc_loadWeakRetained((id *)&self->_messageProxy);
}

- (void)setMessageProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end