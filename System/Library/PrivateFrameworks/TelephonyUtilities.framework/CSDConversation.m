@interface CSDConversation
- (BOOL)_endScreenCallIfNecessary;
- (BOOL)_expanseEnabled;
- (BOOL)activitySessionManager:(id)a3 activitySessionIsJoinable:(id)a4;
- (BOOL)allParticipantsSupportSharePlay;
- (BOOL)allowsScreenSharing;
- (BOOL)avcSessionInProgress;
- (BOOL)containsMemberWithHandle:(id)a3;
- (BOOL)expectedUplinkMuted;
- (BOOL)forceExpanseEnabled;
- (BOOL)hasJoined;
- (BOOL)hasReceivedLetMeInRequest;
- (BOOL)ignoreLMIRequests;
- (BOOL)isAnyOtherAccountDeviceActive;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioInjectionAllowed;
- (BOOL)isAudioPaused;
- (BOOL)isAudioReady;
- (BOOL)isCameraMixedWithScreen;
- (BOOL)isCaptioningEnable;
- (BOOL)isFromStorage;
- (BOOL)isLocallyCreated;
- (BOOL)isOneToOneHandoffOngoing;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isRedirectingAudio;
- (BOOL)isRelaying;
- (BOOL)isRepresentedByRemoteMembers:(id)a3 andLink:(id)a4;
- (BOOL)isScreenEnabled;
- (BOOL)isScreenSharingInitiationAvailable;
- (BOOL)isScreening;
- (BOOL)isSpatialPersonaEnabled;
- (BOOL)isUnderlyingLinksConnected;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (BOOL)isWaitingToPruneParticipants;
- (BOOL)remoteJoinedActivity:(id)a3;
- (BOOL)setConversationLink:(id)a3 allowUpdate:(BOOL)a4;
- (BOOL)setStagedActivitySessionForActivitySession:(id)a3;
- (BOOL)shouldRespondToLetMeInRequestForMember:(id)a3;
- (BOOL)supportsLeaveContext;
- (BOOL)usesAudioSession;
- (CGRect)presentationRect;
- (CGSize)localPortraitAspectRatio;
- (CPActivitySessionManager)activitySessionManager;
- (CPApplicationPolicyManager)applicationLaunchPolicyManager;
- (CPAudioRoutePolicyManager)audioRoutePolicyManager;
- (CPSystemStateObserver)sharePlaySystemStateObserver;
- (CSDAVCSession)avcSession;
- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 activity:(id)a15 link:(id)a16 report:(id)a17 fromStorage:(BOOL)a18 avMode:(unint64_t)a19 presentationMode:(unint64_t)a20 applicationController:(id)a21;
- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 remotePushTokens:(id)a15 activity:(id)a16 link:(id)a17 report:(id)a18 fromStorage:(BOOL)a19 avMode:(unint64_t)a20 presentationMode:(unint64_t)a21 applicationController:(id)a22 featureFlags:(id)a23 systemStateObserver:(id)a24 applicationPolicyManager:(id)a25 screenSharingRequest:(id)a26 testConfiguration:(id)a27;
- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 remotePushTokens:(id)a15 activity:(id)a16 link:(id)a17 report:(id)a18 fromStorage:(BOOL)a19 avMode:(unint64_t)a20 presentationMode:(unint64_t)a21 applicationController:(id)a22 featureFlags:(id)a23 systemStateObserver:(id)a24 applicationPolicyManager:(id)a25 screenSharingRequest:(id)a26 testConfiguration:(id)a27 isOldMessage:(BOOL)a28;
- (CSDConversationABTestConfiguration)ABTestConfiguration;
- (CSDConversationDelegate)delegate;
- (CSDConversationLocalParticipantBlobTracker)localParticipantBlobTracker;
- (CSDConversationParticipant)localCSDParticipant;
- (CSDConversationParticipant)splitSessionSecondary;
- (CSDConversationServerBag)serverBag;
- (CSDFaceTimeInviteDemuxer)faceTimeInviteDemuxer;
- (CSDIDSGroupSession)idsSession;
- (CXCallFailureContext)failureContext;
- (FTDeviceSupport)deviceSupport;
- (NSArray)currentParticipantPresentationContexts;
- (NSArray)supportedMediaTypes;
- (NSDate)lastRebroadcastTime;
- (NSDictionary)activeLightweightParticipantDestinationsByIdentifier;
- (NSDictionary)activeParticipantDestinationsByIdentifier;
- (NSDictionary)capabilitySendMessageOptions;
- (NSMutableArray)addedHandoffParticipants;
- (NSMutableArray)memberHandlesAwaitingInvitesToLink;
- (NSMutableArray)removedHandoffParticipants;
- (NSMutableDictionary)activeLightweightParticipantsByIdentifier;
- (NSMutableDictionary)activeRemoteParticipantsByIdentifier;
- (NSMutableDictionary)addedHandoffParticipantToTime;
- (NSMutableDictionary)audioRoutesByParticipantIdentifier;
- (NSMutableDictionary)inflightAVCBlobRecoveryBlocksByIdentifier;
- (NSMutableDictionary)pendingConversationParticipantsByIdentifier;
- (NSMutableDictionary)pendingKickedMembersByIdentifier;
- (NSMutableDictionary)removedHandoffParticipantToTime;
- (NSMutableDictionary)screenSharingRequestsByUUID;
- (NSMutableDictionary)startAddingHandoffParticipantToTime;
- (NSMutableDictionary)virtualParticipantsByPluginName;
- (NSMutableSet)kickedParticipants;
- (NSMutableSet)pendingAllowedMembers;
- (NSMutableSet)pendingRemoteMembers;
- (NSMutableSet)recentlyLeftParticipantIdentifiers;
- (NSNumber)expectedAudioEnabled;
- (NSNumber)expectedAudioPaused;
- (NSNumber)expectedScreenEnabled;
- (NSNumber)expectedVideoEnabled;
- (NSNumber)expectedVideoPaused;
- (NSObject)reportingHierarchySubToken;
- (NSObject)reportingHierarchyToken;
- (NSSet)activeLightweightParticipants;
- (NSSet)activeRemoteParticipants;
- (NSSet)activitySessions;
- (NSSet)invitationPreferences;
- (NSSet)kickedMembers;
- (NSSet)lightweightMembers;
- (NSSet)memberHandlesEligibleForLinkApproval;
- (NSSet)memberIdentifiers;
- (NSSet)otherInvitedHandles;
- (NSSet)pendingMemberHandles;
- (NSSet)pendingMembers;
- (NSSet)rejectedMembers;
- (NSSet)remoteMemberHandles;
- (NSSet)remoteMembers;
- (NSSet)remotePushTokens;
- (NSSet)screenSharingRequests;
- (NSSet)serverProvidedLightweightParticipantIdentifiers;
- (NSSet)serverProvidedParticipantIdentifiers;
- (NSSet)tuActivitySessions;
- (NSSet)virtualParticipants;
- (NSString)description;
- (NSString)messagesGroupName;
- (NSUUID)UUID;
- (NSUUID)groupUUID;
- (NSUUID)messagesGroupUUID;
- (OS_dispatch_queue)queue;
- (TUCallScreenShareAttributes)screenShareAttributes;
- (TUConversation)tuConversation;
- (TUConversationActivitySession)stagedActivitySession;
- (TUConversationHandoffContext)handoffContext;
- (TUConversationHandoffEligibility)handoffEligibility;
- (TUConversationLink)link;
- (TUConversationMember)localLightweightSecondaryMember;
- (TUConversationMember)localMember;
- (TUConversationParticipant)localParticipant;
- (TUConversationParticipantAssociation)localParticipantAssociation;
- (TUConversationProvider)provider;
- (TUConversationReport)report;
- (TUFeatureFlags)featureFlags;
- (TUHandle)initiator;
- (TUVideoDeviceController)videoDeviceController;
- (_TtC13callservicesd36CSDActivitySessionParticipantMonitor)activitySessionParticipantMonitor;
- (double)sessionSwitchTimeout;
- (id)_allMembers;
- (id)_stableExpanseIdentifier;
- (id)activeParticipants;
- (id)activitySessionManager:(id)a3 activeRemoteParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5;
- (id)activitySessionManager:(id)a3 localParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5;
- (id)activitySessionManagerRequestedCallTypeStringForLogging:(id)a3;
- (id)avcSessionCreationBlock;
- (id)avcSessionIdentifier;
- (id)createActivitySession:(id)a3;
- (id)createStagedActivitySessionForActivity:(id)a3;
- (id)downgradeToOneToOneAfterDelayBlock;
- (id)letMeInRequestUINotificationBlock;
- (id)localCSDConversationParticipant;
- (id)localConversationParticipantWithData;
- (id)localConversationParticipantWithDataToSendToDestinationIDs:(id)a3;
- (id)localParticipantCapabilities;
- (id)localParticipantData;
- (id)localParticipantDataToSendToDestinationIDs:(id)a3;
- (id)memberWithHandle:(id)a3;
- (id)noConversationParticipantTimeoutBlock;
- (id)onlyAvailableSessionConversationParticipant:(id)a3;
- (id)participantRefreshBlock;
- (id)personaHandshakeBlobCreationBlock;
- (id)reducedInfoMembers:(id)a3;
- (id)remoteMemberForHandle:(id)a3;
- (id)remoteParticipantForHandle:(id)a3;
- (id)remoteParticipantForIdentifier:(unint64_t)a3;
- (id)session:(id)a3 conversationParticipantWithParticipantIdentifier:(unint64_t)a4;
- (id)setupNewAVCSession:(BOOL)a3;
- (id)timeoutBlock;
- (id)tuSystemActivitySessions;
- (id)videoDeviceControllerCreationBlock;
- (int)_errorToAVCProviderEndedReason:(id)a3 defaultProviderReason:(int)a4;
- (int)presentationState;
- (int64_t)activeRemoteParticipantCountMinusEligibleAVLess;
- (int64_t)avcLocalCaptionsToken;
- (int64_t)avcSessionToken;
- (int64_t)letMeInRequestState;
- (int64_t)maxVideoDecodesAllowed;
- (int64_t)splitSessionUserProfileState;
- (int64_t)state;
- (unint64_t)avMode;
- (unint64_t)kickMemberRetryCount;
- (unint64_t)localParticipantIdentifier;
- (unint64_t)presentationMode;
- (unint64_t)rebroadcastTimeThreshold;
- (unint64_t)screenSharingType;
- (unint64_t)setScreenSharingRetryCount;
- (void)_addParticipantsWaitingToBeAddedToAVCSession;
- (void)_addRemoteParticipantToAVCSessionIfPossible:(id)a3;
- (void)_allowMember:(id)a3;
- (void)_applyUpdateFromDataBlobForRemoteParticipant:(id)a3 participantIdentifier:(unint64_t)a4;
- (void)_beginTimeoutForLeavingConversationWithReason:(id)a3;
- (void)_cancelInFlightAVCBlobRecoveryIfNecessary;
- (void)_cancelTimeoutForLeavingConversation;
- (void)_cleanUpConversation;
- (void)_cleanUpFromAVCSessionFailure;
- (void)_cleanUpHandoffMetricsIfNecessary;
- (void)_emitRTCConnectionSetupEvent:(int64_t)a3 participantIdentifier:(unint64_t)a4;
- (void)_emitRTCConnectionSetupEventForAddActiveParticipant:(id)a3;
- (void)_endCallIfNecessary;
- (void)_generateHandoffReportIfNecessaryForUpdatedParticipantID:(unint64_t)a3 isAddParticipant:(BOOL)a4;
- (void)_handleStateChanged:(int64_t)a3 oldState:(int64_t)a4;
- (void)_launchApplicationDueToActivityCreation:(id)a3;
- (void)_launchApplicationForActivityIfNecessary:(id)a3;
- (void)_launchApplicationForActivityIfNecessary:(id)a3 shouldForeground:(BOOL)a4;
- (void)_launchApplicationsForActivitiesIfNecessary;
- (void)_launchApplicationsForActivitiesIfNecessary:(BOOL)a3;
- (void)_pruneRemoteParticipantsIfNecessary;
- (void)_registerPluginsIfNecessary;
- (void)_removeMemberFromPendingMemberListForParticipant:(id)a3;
- (void)_reportConversationFailedWithFailureReason:(int64_t)a3 providerEndedReason:(unint64_t)a4;
- (void)_reportConversationFailedWithProviderEndedReason:(unint64_t)a3;
- (void)_requestAVCBlobsIfNecessary;
- (void)_restartIDSSessionIfNecessary;
- (void)_showLetMeInUIIfNecessary;
- (void)_startAVCSessionIfNecessary;
- (void)_startIDSSessionWithContext:(id)a3;
- (void)_stopAVCSession;
- (void)_updateParticipantTypesForAddedParticipant:(id)a3;
- (void)activitySessionManager:(id)a3 activeRemoteParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)activitySessionManager:(id)a3 activityChangedOnSession:(id)a4;
- (void)activitySessionManager:(id)a3 activitySessionAssociatedSceneChanged:(id)a4;
- (void)activitySessionManager:(id)a3 activitySessionChanged:(id)a4;
- (void)activitySessionManager:(id)a3 activitySessionRemoved:(id)a4 userOriginated:(BOOL)a5;
- (void)activitySessionManager:(id)a3 activitySessionStateChanged:(id)a4 oldState:(unint64_t)a5;
- (void)activitySessionManager:(id)a3 fetchDataCryptorForTopic:(id)a4 completionHandler:(id)a5;
- (void)activitySessionManager:(id)a3 receivedActivitySessionEvent:(id)a4;
- (void)activitySessionManager:(id)a3 requestEncryptionKeysForParticipants:(id)a4 topicName:(id)a5;
- (void)activitySessionManager:(id)a3 requestForegroundPresentationForActivity:(id)a4;
- (void)activitySessionManager:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6;
- (void)activitySessionManager:(id)a3 sendResourceAtURL:(id)a4 toParticipants:(id)a5 metadata:(id)a6 activitySessionUUID:(id)a7 completion:(id)a8;
- (void)activitySessionManager:(id)a3 sessionUnjoined:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (void)activitySessionManager:(id)a3 shouldRegisterPlugin:(id)a4;
- (void)activitySessionManager:(id)a3 tuActivitySessionsDidChange:(id)a4;
- (void)addActiveParticipant:(id)a3;
- (void)addAliasesToConversationContainer:(id)a3 forBundleIdentifier:(id)a4;
- (void)addPendingMembers:(id)a3 triggeredLocally:(BOOL)a4;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 invitationPreferences:(id)a5 addingFromLetMeIn:(BOOL)a6 triggeredLocally:(BOOL)a7;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 triggeredLocally:(BOOL)a5;
- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)addScreenSharingRequest:(id)a3;
- (void)addScreenSharingType:(unint64_t)a3;
- (void)addVirtualParticipant:(id)a3;
- (void)addedRemoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioEnabled:(BOOL)a4 updatedVideoEnabled:(BOOL)a5 streamToken:(int64_t)a6 screenToken:(int64_t)a7 captionsToken:(int64_t)a8;
- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4;
- (void)broadcastLocalParticipantData;
- (void)cleanUpIDSSessionState;
- (void)continueHandoffAudioRouteForIdentifier:(unint64_t)a3 participantLeft:(BOOL)a4;
- (void)executeSessionDidStart;
- (void)fulfillLocalScreenShareRequests;
- (void)fulfillPendingScreenSharingRequestsForRemoteParticipant:(id)a3;
- (void)joinUsingContext:(id)a3;
- (void)kickMember:(id)a3;
- (void)leave;
- (void)leaveActivitySessionWithUUID:(id)a3;
- (void)leaveUsingContext:(id)a3;
- (void)leaveWithReason:(unint64_t)a3;
- (void)postSharePlayActivityDidChangeNotificationIfNecessary:(id)a3;
- (void)postUserNotificationForUnsupportedScreenSharingActivity:(id)a3 alternateReponseHandler:(id)a4;
- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3;
- (void)refreshActiveParticipantsList;
- (void)registerMessagesGroupAssociation;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 cameraMixedWithScreenDidChange:(BOOL)a4;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 didChangeAudioPriority:(int64_t)a4 videoPriority:(int64_t)a5;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 didReact:(id)a4;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioPaused:(BOOL)a4 streamToken:(int64_t)a5;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedScreenEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7;
- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedVideoEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7;
- (void)removeActivitySessionIfNecessary;
- (void)removeActivitySessionWithUUID:(id)a3 usingTerminatingHandle:(id)a4;
- (void)removeParticipantWithIdentifier:(unint64_t)a3 fromHandle:(id)a4 withReason:(unint64_t)a5;
- (void)removeParticipantsForMember:(id)a3;
- (void)removePendingMembers:(id)a3 triggeredLocally:(BOOL)a4;
- (void)removeRemoteMembers:(id)a3 triggeredLocally:(BOOL)a4;
- (void)removeScreenSharingRequest:(id)a3;
- (void)removeVirtualParticipant:(id)a3;
- (void)removedRemoteParticipantWithIdentifier:(unint64_t)a3 didSucceed:(BOOL)a4;
- (void)resetActivitySessionSceneAssociationsForBundleID:(id)a3;
- (void)reviveOrInvalidateCachedConversationIfNecessary;
- (void)serverDisconnectedForSession:(id)a3;
- (void)session:(id)a3 cameraMixedWithScreenDidChange:(BOOL)a4;
- (void)session:(id)a3 changedBytesOfDataUsed:(int64_t)a4;
- (void)session:(id)a3 changedLocalAudioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 changedLocalAudioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 changedLocalVideoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 changedLocalVideoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 changedScreenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 didDetectError:(id)a4;
- (void)session:(id)a3 didJoinGroup:(BOOL)a4 participantIdentifiers:(id)a5 error:(id)a6;
- (void)session:(id)a3 didLeaveGroupWithError:(id)a4;
- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6;
- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5;
- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveKickedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7;
- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveLocalParticipantType:(unsigned __int16)a4 error:(id)a5;
- (void)session:(id)a3 didReceiveReport:(id)a4;
- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4;
- (void)session:(id)a3 didReceiveUnderlyingLinksStatus:(BOOL)a4;
- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)session:(id)a3 didStopWithError:(id)a4;
- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 endedWithError:(id)a4 reason:(unsigned int)a5;
- (void)session:(id)a3 localParticipantDidReact:(id)a4;
- (void)session:(id)a3 receivedActiveLightweightParticipantDestinationsByIdentifier:(id)a4;
- (void)session:(id)a3 receivedActiveParticipantDestinationsByIdentifier:(id)a4;
- (void)session:(id)a3 requestedOneToOneModeEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)session:(id)a3 screenCaptureDidStart:(BOOL)a4 withError:(id)a5;
- (void)session:(id)a3 screenCaptureDidStop:(BOOL)a4 withError:(id)a5;
- (void)session:(id)a3 screenShareAttributesUpdated:(id)a4;
- (void)sessionDidReceiveKeyUpdate:(id)a3;
- (void)sessionDidTerminate:(id)a3;
- (void)sessionLocalParticipantDidStopReacting:(id)a3;
- (void)sessionShouldReconnect:(id)a3;
- (void)setABTestConfiguration:(id)a3;
- (void)setActiveLightweightParticipantDestinationsByIdentifier:(id)a3;
- (void)setActiveLightweightParticipantsByIdentifier:(id)a3;
- (void)setActiveParticipantDestinationsByIdentifier:(id)a3;
- (void)setActivitySessionManager:(id)a3;
- (void)setActivitySessionParticipantMonitor:(id)a3;
- (void)setAddedHandoffParticipantToTime:(id)a3;
- (void)setAddedHandoffParticipants:(id)a3;
- (void)setApplicationLaunchPolicyManager:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioInjectionAllowed:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setAudioRoutePolicyManager:(id)a3;
- (void)setAudioRoutesByParticipantIdentifier:(id)a3;
- (void)setAvMode:(unint64_t)a3;
- (void)setAvcSession:(id)a3;
- (void)setAvcSessionCreationBlock:(id)a3;
- (void)setAvcSessionInProgress:(BOOL)a3;
- (void)setCameraMixedWithScreen:(BOOL)a3;
- (void)setConversationGridDisplayMode:(unint64_t)a3;
- (void)setCurrentParticipantPresentationContexts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceSupport:(id)a3;
- (void)setDowngradeToOneToOneAfterDelayBlock:(id)a3;
- (void)setExpectedAudioEnabled:(id)a3;
- (void)setExpectedAudioPaused:(id)a3;
- (void)setExpectedScreenEnabled:(id)a3;
- (void)setExpectedUplinkMuted:(BOOL)a3;
- (void)setExpectedVideoEnabled:(id)a3;
- (void)setExpectedVideoPaused:(id)a3;
- (void)setFailureContext:(id)a3;
- (void)setForceExpanseEnabled:(BOOL)a3;
- (void)setFromStorage:(BOOL)a3;
- (void)setHandoffContext:(id)a3;
- (void)setHandoffEligibility:(id)a3;
- (void)setHasJoined:(BOOL)a3;
- (void)setHasReceivedLetMeInRequest:(BOOL)a3;
- (void)setIDSAliasingSalt:(id)a3 onContainer:(id)a4;
- (void)setIgnoreLMIRequests:(BOOL)a3;
- (void)setInvitationPreferences:(id)a3;
- (void)setKickMemberRetryCount:(unint64_t)a3;
- (void)setKickedMembers:(id)a3;
- (void)setKickedParticipants:(id)a3;
- (void)setLastRebroadcastTime:(id)a3;
- (void)setLetMeInRequestState:(int64_t)a3;
- (void)setLetMeInRequestUINotificationBlock:(id)a3;
- (void)setLightweightMembers:(id)a3;
- (void)setLink:(id)a3;
- (void)setLocalLightweightSecondaryMember:(id)a3;
- (void)setLocalParticipantAssociation:(id)a3;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 presentationMode:(unint64_t)a4;
- (void)setMemberHandlesAwaitingInvitesToLink:(id)a3;
- (void)setMemberIdentifiers:(id)a3;
- (void)setMessagesGroupName:(id)a3;
- (void)setMessagesGroupUUID:(id)a3;
- (void)setNoConversationParticipantTimeoutBlock:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setOtherInvitedHandles:(id)a3;
- (void)setParticipantAudioVideoMode:(unint64_t)a3 presentationMode:(unint64_t)a4 forParticipant:(id)a5;
- (void)setParticipantRefreshBlock:(id)a3;
- (void)setPendingAllowedMembers:(id)a3;
- (void)setPendingConversationParticipantsByIdentifier:(id)a3;
- (void)setPendingKickedMembersByIdentifier:(id)a3;
- (void)setPendingMemberHandles:(id)a3;
- (void)setPendingMembers:(id)a3;
- (void)setPendingRemoteMembers:(id)a3;
- (void)setPersonaHandshakeBlobCreationBlock:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setPresentationRect:(CGRect)a3;
- (void)setPresentationState:(int)a3;
- (void)setProvider:(id)a3;
- (void)setRebroadcastTimeThreshold:(unint64_t)a3;
- (void)setRecentlyLeftParticipantIdentifiers:(id)a3;
- (void)setRejectedMembers:(id)a3;
- (void)setRelaying:(BOOL)a3;
- (void)setRemoteMemberHandles:(id)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setRemoteParticipantType:(unsigned __int16)a3 participant:(id)a4;
- (void)setRemoteParticipantsDownlinkMuted:(BOOL)a3;
- (void)setRemotePushTokens:(id)a3;
- (void)setRemovedHandoffParticipantToTime:(id)a3;
- (void)setRemovedHandoffParticipants:(id)a3;
- (void)setReportingHierarchySubToken:(id)a3;
- (void)setReportingHierarchyToken:(id)a3;
- (void)setScreenEnabled:(BOOL)a3 attributes:(id)a4;
- (void)setScreenShareAttributes:(id)a3;
- (void)setScreenSharingRequestsByUUID:(id)a3;
- (void)setScreenSharingType:(unint64_t)a3;
- (void)setScreening:(BOOL)a3;
- (void)setServerBag:(id)a3;
- (void)setServerProvidedLightweightParticipantIdentifiers:(id)a3;
- (void)setServerProvidedParticipantIdentifiers:(id)a3;
- (void)setSessionSwitchTimeout:(double)a3;
- (void)setSetScreenSharingRetryCount:(unint64_t)a3;
- (void)setSharePlayHandedOff:(BOOL)a3;
- (void)setSharePlaySystemStateObserver:(id)a3;
- (void)setSpatialPersonaEnabled:(BOOL)a3;
- (void)setSplitSessionSecondary:(id)a3;
- (void)setSplitSessionUserProfileState:(int64_t)a3;
- (void)setStagedActivitySession:(id)a3;
- (void)setStartAddingHandoffParticipantToTime:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSupportedMediaTypes:(id)a3;
- (void)setTimeoutBlock:(id)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setUsingAirplay:(BOOL)a3 forActivitySessionUUID:(id)a4;
- (void)setVideo:(BOOL)a3;
- (void)setVideoDeviceControllerCreationBlock:(id)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setWaitingToPruneParticipants:(BOOL)a3;
- (void)startAudio;
- (void)stopContentSharingSession;
- (void)switchBackToOneToOneIfPossible;
- (void)switchBackToOneToOneIfPossibleUsingDelay:(BOOL)a3;
- (void)systemStateObserver:(id)a3 screenSharingAllowedStateChanged:(BOOL)a4;
- (void)systemStateObserver:(id)a3 screenSharingInitiationAllowedStateChanged:(BOOL)a4;
- (void)updateConversationParticipantToHaveMatchingSiriDisplayName:(id)a3;
- (void)updateLightweightMember:(id)a3;
- (void)updateLocalAspectRatios;
- (void)updateLocalMember:(id)a3;
- (void)updateLocalParticipantInfo;
- (void)updateMemberValidationSource:(id)a3 source:(int64_t)a4;
- (void)updateMessagesGroupName:(id)a3;
- (void)updateOneToOneModeForParticipantUpdateType:(unsigned __int16)a3 participant:(id)a4;
- (void)updateParticipantPresentationContexts:(id)a3;
- (void)updateParticipantsWithDestinationIdentifiers:(id)a3;
- (void)updateRemoteMember:(id)a3;
- (void)updateReportInfoForHandoffParticipant:(id)a3;
- (void)updateScreenEnabledForRemoteParticipants:(BOOL)a3;
@end

@implementation CSDConversation

- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 activity:(id)a15 link:(id)a16 report:(id)a17 fromStorage:(BOOL)a18 avMode:(unint64_t)a19 presentationMode:(unint64_t)a20 applicationController:(id)a21
{
  BOOL v41 = a8;
  id v36 = a21;
  id v34 = a17;
  id v32 = a16;
  id v31 = a15;
  id v30 = a14;
  id v46 = a13;
  id v45 = a12;
  id v44 = a11;
  id v43 = a10;
  id v28 = a9;
  id v29 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v39 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
  LOBYTE(v27) = a18;
  v42 = -[CSDConversation initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avMode:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenSharingRequest:testConfiguration:]( self,  "initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers :pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avMod e:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenShari ngRequest:testConfiguration:",  v25,  v24,  v23,  v22,  v29,  v41,  v28,  v43,  v44,  v45,  v46,  v30,  0LL,  v31,  v32,  v34,  v27,  a19,  a20,  v36,  v39,  0LL,  0LL,  0LL,  0LL);

  return v42;
}

- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 remotePushTokens:(id)a15 activity:(id)a16 link:(id)a17 report:(id)a18 fromStorage:(BOOL)a19 avMode:(unint64_t)a20 presentationMode:(unint64_t)a21 applicationController:(id)a22 featureFlags:(id)a23 systemStateObserver:(id)a24 applicationPolicyManager:(id)a25 screenSharingRequest:(id)a26 testConfiguration:(id)a27
{
  LOBYTE(v29) = 0;
  LOBYTE(v28) = a19;
  return -[CSDConversation initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMembers:pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avMode:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenSharingRequest:testConfiguration:isOldMessage:]( self,  "initWithQueue:UUID:groupUUID:groupSession:messagesGroupUUID:locallyCreated:localMember:initiator:remoteMember s:pendingMembers:otherInvitedHandles:lightweightMembers:remotePushTokens:activity:link:report:fromStorage:avM ode:presentationMode:applicationController:featureFlags:systemStateObserver:applicationPolicyManager:screenSh aringRequest:testConfiguration:isOldMessage:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  v28,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  v29);
}

- (CSDConversation)initWithQueue:(id)a3 UUID:(id)a4 groupUUID:(id)a5 groupSession:(id)a6 messagesGroupUUID:(id)a7 locallyCreated:(BOOL)a8 localMember:(id)a9 initiator:(id)a10 remoteMembers:(id)a11 pendingMembers:(id)a12 otherInvitedHandles:(id)a13 lightweightMembers:(id)a14 remotePushTokens:(id)a15 activity:(id)a16 link:(id)a17 report:(id)a18 fromStorage:(BOOL)a19 avMode:(unint64_t)a20 presentationMode:(unint64_t)a21 applicationController:(id)a22 featureFlags:(id)a23 systemStateObserver:(id)a24 applicationPolicyManager:(id)a25 screenSharingRequest:(id)a26 testConfiguration:(id)a27 isOldMessage:(BOOL)a28
{
  BOOL v138 = a8;
  id v152 = a3;
  v156 = (NSUUID *)a4;
  id v136 = a5;
  id v157 = a5;
  id v135 = a6;
  id v147 = a6;
  id v139 = a7;
  id v140 = a9;
  id v146 = a10;
  id v155 = a11;
  id v150 = a12;
  id v149 = a13;
  id v151 = a14;
  id v141 = a15;
  id v158 = a16;
  id v142 = a17;
  id v143 = a18;
  id v154 = a22;
  id v153 = a23;
  id v160 = a24;
  id v148 = a25;
  id v159 = a26;
  id v144 = a27;
  v170.receiver = self;
  v170.super_class = (Class)&OBJC_CLASS___CSDConversation;
  id v32 = -[CSDConversation init](&v170, "init");
  if (v32)
  {
    id v33 = sub_1001704C4();
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = @"NO";
      *(_DWORD *)buf = 138413570;
      v173 = v156;
      if (v138) {
        id v36 = @"YES";
      }
      else {
        id v36 = @"NO";
      }
      if (a28) {
        v35 = @"YES";
      }
      __int16 v174 = 2112;
      id v175 = v157;
      __int16 v176 = 2112;
      v177 = v36;
      __int16 v178 = 2112;
      id v179 = v146;
      __int16 v180 = 2112;
      id v181 = v155;
      __int16 v182 = 2112;
      v183 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "init CSDConversation: %@, %@, %@, initiator: %@, remoteMembers: %@, isOldMessage: %@",  buf,  0x3Eu);
    }

    objc_storeStrong((id *)&v32->_queue, a3);
    objc_storeStrong((id *)&v32->_featureFlags, a23);
    objc_storeStrong((id *)&v32->_UUID, a4);
    objc_storeStrong((id *)&v32->_groupUUID, v136);
    objc_storeStrong((id *)&v32->_messagesGroupUUID, a7);
    v32->_state = 0LL;
    v32->_letMeInRequestState = 0LL;
    v32->_locallyCreated = v138;
    objc_storeStrong((id *)&v32->_initiator, a10);
    objc_storeStrong((id *)&v32->_localMember, a9);
    uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    activeParticipantDestinationsByIdentifier = v32->_activeParticipantDestinationsByIdentifier;
    v32->_activeParticipantDestinationsByIdentifier = (NSDictionary *)v37;

    uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    activeRemoteParticipantsByIdentifier = v32->_activeRemoteParticipantsByIdentifier;
    v32->_activeRemoteParticipantsByIdentifier = (NSMutableDictionary *)v39;

    BOOL v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    activeLightweightParticipantsByIdentifier = v32->_activeLightweightParticipantsByIdentifier;
    v32->_activeLightweightParticipantsByIdentifier = v41;

    id v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    screenSharingRequestsByUUID = v32->_screenSharingRequestsByUUID;
    v32->_screenSharingRequestsByUUID = v43;

    id v45 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    recentlyLeftParticipantIdentifiers = v32->_recentlyLeftParticipantIdentifiers;
    v32->_recentlyLeftParticipantIdentifiers = v45;

    v47 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    kickedParticipants = v32->_kickedParticipants;
    v32->_kickedParticipants = v47;

    v49 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    pendingRemoteMembers = v32->_pendingRemoteMembers;
    v32->_pendingRemoteMembers = v49;

    v51 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    removedHandoffParticipants = v32->_removedHandoffParticipants;
    v32->_removedHandoffParticipants = v51;

    v53 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    addedHandoffParticipants = v32->_addedHandoffParticipants;
    v32->_addedHandoffParticipants = v53;

    uint64_t v55 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    startAddingHandoffParticipantToTime = v32->_startAddingHandoffParticipantToTime;
    v32->_startAddingHandoffParticipantToTime = (NSMutableDictionary *)v55;

    uint64_t v57 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    addedHandoffParticipantToTime = v32->_addedHandoffParticipantToTime;
    v32->_addedHandoffParticipantToTime = (NSMutableDictionary *)v57;

    uint64_t v59 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    removedHandoffParticipantToTime = v32->_removedHandoffParticipantToTime;
    v32->_removedHandoffParticipantToTime = (NSMutableDictionary *)v59;

    currentParticipantPresentationContexts = v32->_currentParticipantPresentationContexts;
    v32->_currentParticipantPresentationContexts = (NSArray *)&__NSArray0__struct;

    v62 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
    serverBag = v32->_serverBag;
    v32->_serverBag = (CSDConversationServerBag *)v62;

    v32->_fromStorage = a19;
    uint64_t v64 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    lastRebroadcastTime = v32->_lastRebroadcastTime;
    v32->_lastRebroadcastTime = (NSDate *)v64;

    v32->_rebroadcastTimeThreshold = 0LL;
    objc_storeStrong((id *)&v32->_report, a18);
    v32->_avMode = a20;
    v32->_presentationMode = a21;
    v32->_video = a20 == 2;
    objc_storeStrong((id *)&v32->_link, a17);
    objc_storeStrong((id *)&v32->_sharePlaySystemStateObserver, a24);
    if (v160)
    {
      -[CPSystemStateObserver addObserver:withQueue:]( v32->_sharePlaySystemStateObserver,  "addObserver:withQueue:",  v32,  v32->_queue);
    }

    else
    {
      id v66 = sub_1001704C4();
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
        sub_1002B1F38();
      }
    }

    v68 = objc_alloc(&OBJC_CLASS___CPActivitySessionManager);
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    v70 = -[CPActivitySessionManager initWithIdentifier:groupUUID:activities:applicationController:delegate:queue:systemStateObserver:]( v68,  "initWithIdentifier:groupUUID:activities:applicationController:delegate:queue:systemStateObserver:",  v156,  v157,  v69,  v154,  v32,  v152,  v160);
    activitySessionManager = v32->_activitySessionManager;
    v32->_activitySessionManager = v70;

    if ([v153 sharePlayCanEndWhenInitiatorLeaves])
    {
      v72 = -[CSDActivitySessionParticipantMonitor initWithActivitySessionManager:]( objc_alloc(&OBJC_CLASS____TtC13callservicesd36CSDActivitySessionParticipantMonitor),  "initWithActivitySessionManager:",  v32->_activitySessionManager);
      activitySessionParticipantMonitor = v32->_activitySessionParticipantMonitor;
      v32->_activitySessionParticipantMonitor = v72;
    }

    if (v158) {
      id v74 =  -[CSDConversation createStagedActivitySessionForActivity:]( v32,  "createStagedActivitySessionForActivity:",  v158);
    }
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](v32, "featureFlags"));
    unsigned int v76 = [v75 usesModernScreenSharingFromMessages];
    if (v159) {
      unsigned int v77 = v76;
    }
    else {
      unsigned int v77 = 0;
    }

    if (v77)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](v32, "screenSharingRequestsByUUID"));
      v79 = (void *)objc_claimAutoreleasedReturnValue([v159 UUID]);
      [v78 setObject:v159 forKeyedSubscript:v79];
    }

    uint64_t v80 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    inflightAVCBlobRecoveryBlocksByIdentifier = v32->_inflightAVCBlobRecoveryBlocksByIdentifier;
    v32->_inflightAVCBlobRecoveryBlocksByIdentifier = (NSMutableDictionary *)v80;

    objc_storeStrong((id *)&v32->_ABTestConfiguration, a27);
    -[CSDConversation setRemoteMembers:](v32, "setRemoteMembers:", v155);
    v82 = (NSSet *)[v151 mutableCopy];
    lightweightMembers = v32->_lightweightMembers;
    v32->_lightweightMembers = v82;

    if (v150) {
      v84 = (NSSet *)[v150 copy];
    }
    else {
      v84 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    pendingMembers = v32->_pendingMembers;
    v32->_pendingMembers = v84;

    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v169 = 0u;
    __int128 v167 = 0u;
    __int128 v168 = 0u;
    __int128 v166 = 0u;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMembers](v32, "pendingMembers"));
    id v88 = [v87 countByEnumeratingWithState:&v166 objects:v171 count:16];
    if (v88)
    {
      uint64_t v89 = *(void *)v167;
      do
      {
        for (i = 0LL; i != v88; i = (char *)i + 1)
        {
          if (*(void *)v167 != v89) {
            objc_enumerationMutation(v87);
          }
          v91 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v166 + 1) + 8 * (void)i) handle]);
          [v86 addObject:v91];
        }

        id v88 = [v87 countByEnumeratingWithState:&v166 objects:v171 count:16];
      }

      while (v88);
    }

    v92 = (NSSet *)[v86 copy];
    pendingMemberHandles = v32->_pendingMemberHandles;
    v32->_pendingMemberHandles = v92;

    uint64_t v94 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    kickedMembers = v32->_kickedMembers;
    v32->_kickedMembers = (NSSet *)v94;

    objc_storeStrong((id *)&v32->_remotePushTokens, a15);
    uint64_t v96 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingKickedMembersByIdentifier = v32->_pendingKickedMembersByIdentifier;
    v32->_pendingKickedMembersByIdentifier = (NSMutableDictionary *)v96;

    uint64_t v98 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    pendingAllowedMembers = v32->_pendingAllowedMembers;
    v32->_pendingAllowedMembers = (NSMutableSet *)v98;

    uint64_t v100 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    rejectedMembers = v32->_rejectedMembers;
    v32->_rejectedMembers = (NSSet *)v100;

    -[CSDConversation setOtherInvitedHandles:](v32, "setOtherInvitedHandles:", v149);
    uint64_t v102 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    memberHandlesAwaitingInvitesToLink = v32->_memberHandlesAwaitingInvitesToLink;
    v32->_memberHandlesAwaitingInvitesToLink = (NSMutableArray *)v102;

    objc_storeStrong((id *)&v32->_idsSession, v135);
    -[CSDIDSGroupSession setDelegate:](v32->_idsSession, "setDelegate:", v32);
    v104 = objc_alloc_init(&OBJC_CLASS___CSDFaceTimeInviteDemuxer);
    faceTimeInviteDemuxer = v32->_faceTimeInviteDemuxer;
    v32->_faceTimeInviteDemuxer = v104;

    v106 = +[RTCReporting newHierarchyTokenFromParentToken:]( &OBJC_CLASS___RTCReporting,  "newHierarchyTokenFromParentToken:",  0LL);
    reportingHierarchyToken = v32->_reportingHierarchyToken;
    v32->_reportingHierarchyToken = v106;

    objc_initWeak(&location, v32);
    v163[0] = _NSConcreteStackBlock;
    v163[1] = 3221225472LL;
    v163[2] = sub_10002389C;
    v163[3] = &unk_1003D7BF8;
    objc_copyWeak(&v164, &location);
    v108 = objc_retainBlock(v163);
    id avcSessionCreationBlock = v32->_avcSessionCreationBlock;
    v32->_id avcSessionCreationBlock = v108;

    v161[0] = _NSConcreteStackBlock;
    v161[1] = 3221225472LL;
    v161[2] = sub_100023A40;
    v161[3] = &unk_1003D7C20;
    objc_copyWeak(&v162, &location);
    v110 = objc_retainBlock(v161);
    id videoDeviceControllerCreationBlock = v32->_videoDeviceControllerCreationBlock;
    v32->_id videoDeviceControllerCreationBlock = v110;

    if (v32->_fromStorage || a28)
    {
      id v112 = sub_1001704C4();
      v113 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        UUID = v32->_UUID;
        *(_DWORD *)buf = 138412290;
        v173 = UUID;
        _os_log_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_DEFAULT,  "Requesting remote active participants for cached conversation with UUID: %@",  buf,  0xCu);
      }

      -[CSDIDSGroupSession requestActiveParticipants](v32->_idsSession, "requestActiveParticipants");
    }

    uint64_t v115 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    virtualParticipantsByPluginName = v32->_virtualParticipantsByPluginName;
    v32->_virtualParticipantsByPluginName = (NSMutableDictionary *)v115;

    uint64_t v117 = objc_claimAutoreleasedReturnValue(+[TUConversationProvider unknownProvider](&OBJC_CLASS___TUConversationProvider, "unknownProvider"));
    provider = v32->_provider;
    v32->_provider = (TUConversationProvider *)v117;

    if (v148) {
      v119 = (CPApplicationPolicyManager *)v148;
    }
    else {
      v119 = (CPApplicationPolicyManager *)objc_claimAutoreleasedReturnValue( +[CPApplicationPolicyManager sharedInstance]( &OBJC_CLASS___CPApplicationPolicyManager,  "sharedInstance"));
    }
    applicationLaunchPolicyManager = v32->_applicationLaunchPolicyManager;
    v32->_applicationLaunchPolicyManager = v119;

    uint64_t v121 = objc_claimAutoreleasedReturnValue(+[CPAudioRoutePolicyManager sharedInstance](&OBJC_CLASS___CPAudioRoutePolicyManager, "sharedInstance"));
    audioRoutePolicyManager = v32->_audioRoutePolicyManager;
    v32->_audioRoutePolicyManager = (CPAudioRoutePolicyManager *)v121;

    -[CPAudioRoutePolicyManager addObserver:withQueue:]( v32->_audioRoutePolicyManager,  "addObserver:withQueue:",  v32,  v32->_queue);
    uint64_t v123 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    audioRoutesByParticipantIdentifier = v32->_audioRoutesByParticipantIdentifier;
    v32->_audioRoutesByParticipantIdentifier = (NSMutableDictionary *)v123;

    uint64_t v125 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingConversationParticipantsByIdentifier = v32->_pendingConversationParticipantsByIdentifier;
    v32->_pendingConversationParticipantsByIdentifier = (NSMutableDictionary *)v125;

    id personaHandshakeBlobCreationBlock = v32->_personaHandshakeBlobCreationBlock;
    v32->_id personaHandshakeBlobCreationBlock = &stru_1003D7C60;

    v128 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](v32, "localMember"));
    unsigned int v129 = [v128 isLightweightMember];

    if (v129)
    {
      v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSRegistrationPropertySupportsCo));
      -[CSDConversation addRequiredCapabilities:requiredLackOfCapabilities:]( v32,  "addRequiredCapabilities:requiredLackOfCapabilities:",  v130,  0LL);
    }

    if (!v32->_avMode)
    {
      v131 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsAVLess));
      -[CSDConversation addRequiredCapabilities:requiredLackOfCapabilities:]( v32,  "addRequiredCapabilities:requiredLackOfCapabilities:",  v131,  0LL);
    }

    v32->_sessionSwitchTimeout = 3.0;
    v132 = -[CSDConversationLocalParticipantBlobTracker initWithConversation:idsGroupSession:queue:]( objc_alloc(&OBJC_CLASS___CSDConversationLocalParticipantBlobTracker),  "initWithConversation:idsGroupSession:queue:",  v32,  v147,  v32->_queue);
    localParticipantBlobTracker = v32->_localParticipantBlobTracker;
    v32->_localParticipantBlobTracker = v132;

    v32->_screenSharingType = 0LL;
    objc_destroyWeak(&v162);
    objc_destroyWeak(&v164);
    objc_destroyWeak(&location);
  }

  return v32;
}

- (TUVideoDeviceController)videoDeviceController
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  videoDeviceController = self->_videoDeviceController;
  if (!videoDeviceController)
  {
    v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue( -[CSDConversation videoDeviceControllerCreationBlock]( self,  "videoDeviceControllerCreationBlock"));
    uint64_t v6 = v5[2]();
    v7 = (TUVideoDeviceController *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_videoDeviceController;
    self->_videoDeviceController = v7;

    -[TUVideoDeviceController setIgnoreStartPreview:](self->_videoDeviceController, "setIgnoreStartPreview:", 1LL);
    videoDeviceController = self->_videoDeviceController;
  }

  return videoDeviceController;
}

- (NSString)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p",  objc_opt_class(self, a2),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
  [v4 appendFormat:@" UUID=%@", v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation groupUUID](self, "groupUUID"));
  [v4 appendFormat:@" groupUUID=%@", v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
    [v4 appendFormat:@" link=%@", v8];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation messagesGroupUUID](self, "messagesGroupUUID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation messagesGroupUUID](self, "messagesGroupUUID"));
    [v4 appendFormat:@" messagesGroupUUID=%@", v10];
  }

  objc_msgSend(v4, "appendFormat:", @" state=%ld", -[CSDConversation state](self, "state"));
  objc_msgSend( v4,  "appendFormat:",  @" hasReceivedLetMeInRequest=%ld",  -[CSDConversation hasReceivedLetMeInRequest](self, "hasReceivedLetMeInRequest"));
  objc_msgSend( v4,  "appendFormat:",  @" letMeInRequestState=%ld",  -[CSDConversation letMeInRequestState](self, "letMeInRequestState"));
  objc_msgSend( v4,  "appendFormat:",  @" ignoreLMIRequests=%d",  -[CSDConversation ignoreLMIRequests](self, "ignoreLMIRequests"));
  objc_msgSend( v4,  "appendFormat:",  @" avcSessionToken=%ld",  -[CSDConversation avcSessionToken](self, "avcSessionToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSessionIdentifier](self, "avcSessionIdentifier"));
  [v4 appendFormat:@" avcSessionIdentifier=%@", v11];

  objc_msgSend( v4,  "appendFormat:",  @" isLocallyCreated=%d",  -[CSDConversation isLocallyCreated](self, "isLocallyCreated"));
  objc_msgSend(v4, "appendFormat:", @" hasJoined=%d", -[CSDConversation hasJoined](self, "hasJoined"));
  objc_msgSend( v4,  "appendFormat:",  @" isAudioInjectionAllowed=%d",  -[CSDConversation isAudioInjectionAllowed](self, "isAudioInjectionAllowed"));
  objc_msgSend( v4,  "appendFormat:",  @" isUnderlyingLinksConnected=%d",  -[CSDConversation isUnderlyingLinksConnected](self, "isUnderlyingLinksConnected"));
  objc_msgSend(v4, "appendFormat:", @" isUplinkMuted=%d", -[CSDConversation isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v4, "appendFormat:", @" video=%d", -[CSDConversation isVideo](self, "isVideo"));
  objc_msgSend( v4,  "appendFormat:",  @" isAudioEnabled=%d",  -[CSDConversation isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend( v4,  "appendFormat:",  @" isVideoEnabled=%d",  -[CSDConversation isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend( v4,  "appendFormat:",  @" isScreenEnabled=%d",  -[CSDConversation isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend( v4,  "appendFormat:",  @" oneToOneModeEnabled=%d",  -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  [v4 appendFormat:@" localMember=%@", v12];

  objc_msgSend( v4,  "appendFormat:",  @" splitSessionUserProfileState=%ld",  -[CSDConversation splitSessionUserProfileState](self, "splitSessionUserProfileState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  [v4 appendFormat:@" remoteMembers=%@", v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
  [v4 appendFormat:@" localMemberHandle=%@", v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMembers](self, "pendingMembers"));
  id v17 = [v16 count];

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMembers](self, "pendingMembers"));
    [v4 appendFormat:@" pendingMembers=%@", v18];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation kickedMembers](self, "kickedMembers"));
  id v20 = [v19 count];

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation kickedMembers](self, "kickedMembers"));
    [v4 appendFormat:@" kickedMembers=%@", v21];
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation rejectedMembers](self, "rejectedMembers"));
  id v23 = [v22 count];

  if (v23)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation rejectedMembers](self, "rejectedMembers"));
    [v4 appendFormat:@" rejectedMembers=%@", v24];
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation otherInvitedHandles](self, "otherInvitedHandles"));
  id v26 = [v25 count];

  if (v26)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation otherInvitedHandles](self, "otherInvitedHandles"));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 allObjects]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "componentsJoinedByString:", @", "));
    [v4 appendFormat:@" otherInvitedHandles=%@", v29];
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
  id v31 = [v30 count];

  if (v31)
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
    [v4 appendFormat:@" lightweightMembers=%@", v32];
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation memberIdentifiers](self, "memberIdentifiers"));
  id v34 = [v33 count];

  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation memberIdentifiers](self, "memberIdentifiers"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 allObjects]);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsJoinedByString:", @", "));
    [v4 appendFormat:@" memberIdentifiers=%@", v37];
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequests](self, "screenSharingRequests"));
  id v39 = [v38 count];

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequests](self, "screenSharingRequests"));
    BOOL v41 = (void *)objc_claimAutoreleasedReturnValue([v40 allObjects]);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "componentsJoinedByString:", @", "));
    [v4 appendFormat:@" screenSharingRequests=%@", v42];
  }

  id v43 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  [v4 appendFormat:@" activeRemoteParticipants=%@", v43];

  id v44 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeLightweightParticipants](self, "activeLightweightParticipants"));
  id v45 = [v44 count];

  if (v45)
  {
    id v46 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeLightweightParticipants](self, "activeLightweightParticipants"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v46 allObjects]);
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "componentsJoinedByString:", @", "));
    [v4 appendFormat:@" activeLightweightParticipants=%@", v48];
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation report](self, "report"));
  [v4 appendFormat:@" report=%@", v49];

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipants](self, "virtualParticipants"));
  id v51 = [v50 count];

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipants](self, "virtualParticipants"));
    [v4 appendFormat:@" virtualParticipants=%@", v52];
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation provider](self, "provider"));
  [v4 appendFormat:@" provider=%@", v53];

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuActivitySessions](self, "tuActivitySessions"));
  id v55 = [v54 count];

  if (v55)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuActivitySessions](self, "tuActivitySessions"));
    [v4 appendFormat:@" tuActivitySessions=%@", v56];
  }

  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuSystemActivitySessions](self, "tuSystemActivitySessions"));
  id v58 = [v57 count];

  if (v58)
  {
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuSystemActivitySessions](self, "tuSystemActivitySessions"));
    [v4 appendFormat:@" tuSystemActivitySessions=%@", v59];
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation handoffEligibility](self, "handoffEligibility"));

  if (v60)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation handoffEligibility](self, "handoffEligibility"));
    [v4 appendFormat:@" handoffEligibility=%@", v61];
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation splitSessionSecondary](self, "splitSessionSecondary"));

  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation splitSessionSecondary](self, "splitSessionSecondary"));
    [v4 appendFormat:@" splitSessionSecondary=%@", v63];
  }

  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localLightweightSecondaryMember](self, "localLightweightSecondaryMember"));

  if (v64)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localLightweightSecondaryMember](self, "localLightweightSecondaryMember"));
    [v4 appendFormat:@" localLightweightSecondaryMember=%@", v65];
  }

  id v66 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation invitationPreferences](self, "invitationPreferences"));

  if (v66)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation invitationPreferences](self, "invitationPreferences"));
    [v4 appendFormat:@" invitationPreferences=%@", v67];
  }

  objc_msgSend(v4, "appendFormat:", @" avMode=%ld", -[CSDConversation avMode](self, "avMode"));
  objc_msgSend( v4,  "appendFormat:",  @" presentationMode=%ld",  -[CSDConversation presentationMode](self, "presentationMode"));
  objc_msgSend(v4, "appendFormat:", @" screening=%d", -[CSDConversation isScreening](self, "isScreening"));
  uint64_t v68 = objc_opt_self(self);
  v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
  unsigned int v70 = [v69 isFromStorage];

  if (v70)
  {
    uint64_t v71 = objc_opt_self(self);
    v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
    objc_msgSend(v4, "appendFormat:", @" self.isFromStorage=%d", objc_msgSend(v72, "isFromStorage"));
  }

  if (-[CSDConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen")) {
    objc_msgSend( v4,  "appendFormat:",  @" isCameraMixedWithScreen=%d",  -[CSDConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation handoffContext](self, "handoffContext"));

  if (v73)
  {
    id v74 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation handoffContext](self, "handoffContext"));
    [v4 appendFormat:@" handoffContext=%@", v74];
  }

  uint64_t v75 = objc_opt_self(self);
  unsigned int v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
  unsigned int v77 = (void *)objc_claimAutoreleasedReturnValue([v76 ABTestConfiguration]);

  if (v77)
  {
    uint64_t v78 = objc_opt_self(self);
    v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
    uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v79 ABTestConfiguration]);
    [v4 appendFormat:@" self.ABTestConfiguration=%@", v80];
  }

  objc_msgSend( v4,  "appendFormat:",  @" screenSharingType=%ld",  -[CSDConversation screenSharingType](self, "screenSharingType"));
  [v4 appendString:@">"];
  id v81 = [v4 copy];

  return (NSString *)v81;
}

- (void)setProvider:(id)a3
{
  id v8 = a3;
  provider = self->_provider;
  if (!provider
    || (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversationProvider unknownProvider]( &OBJC_CLASS___TUConversationProvider,  "unknownProvider")),  v7 = -[TUConversationProvider isEqual:](provider, "isEqual:", v6),  v6,  v7))
  {
    objc_storeStrong((id *)&self->_provider, a3);
  }
}

- (void)setActiveParticipantDestinationsByIdentifier:(id)a3
{
  v4 = (NSDictionary *)a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  activeParticipantDestinationsByIdentifier = self->_activeParticipantDestinationsByIdentifier;
  self->_activeParticipantDestinationsByIdentifier = v4;
  unsigned int v7 = v4;

  -[CSDConversation updateParticipantsWithDestinationIdentifiers:]( self,  "updateParticipantsWithDestinationIdentifiers:",  v7);
}

- (void)setActiveLightweightParticipantDestinationsByIdentifier:(id)a3
{
  v4 = (NSDictionary *)a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  activeLightweightParticipantDestinationsByIdentifier = self->_activeLightweightParticipantDestinationsByIdentifier;
  self->_activeLightweightParticipantDestinationsByIdentifier = v4;
  unsigned int v7 = v4;

  -[CSDConversation updateParticipantsWithDestinationIdentifiers:]( self,  "updateParticipantsWithDestinationIdentifiers:",  v7);
}

- (BOOL)usesAudioSession
{
  return 1;
}

- (id)activeParticipants
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeLightweightParticipants](self, "activeLightweightParticipants"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 setByAddingObjectsFromSet:v5]);

  return v6;
}

- (NSSet)activeRemoteParticipants
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return (NSSet *)v6;
}

- (NSSet)activeLightweightParticipants
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantsByIdentifier]( self,  "activeLightweightParticipantsByIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return (NSSet *)v6;
}

- (BOOL)isAnyOtherAccountDeviceActive
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) isLocalAccountHandle])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (NSSet)screenSharingRequests
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return (NSSet *)v6;
}

- (TUConversation)tuConversation
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc(&OBJC_CLASS___TUMutableConversation);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation groupUUID](self, "groupUUID"));
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation provider](self, "provider"));
  id v8 = [v4 initWithUUID:v5 groupUUID:v6 provider:v7];

  objc_msgSend(v8, "setState:", -[CSDConversation state](self, "state"));
  objc_msgSend( v8,  "setHasReceivedLetMeInRequest:",  -[CSDConversation hasReceivedLetMeInRequest](self, "hasReceivedLetMeInRequest"));
  objc_msgSend(v8, "setLetMeInRequestState:", -[CSDConversation letMeInRequestState](self, "letMeInRequestState"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
  [v8 setLink:v9];

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation messagesGroupUUID](self, "messagesGroupUUID"));
  [v8 setMessagesGroupUUID:v10];

  objc_msgSend(v8, "setAvcSessionToken:", -[CSDConversation avcSessionToken](self, "avcSessionToken"));
  objc_msgSend(v8, "setLocalCaptionToken:", -[CSDConversation avcLocalCaptionsToken](self, "avcLocalCaptionsToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSessionIdentifier](self, "avcSessionIdentifier"));
  [v8 setAvcSessionIdentifier:v11];

  objc_msgSend(v8, "setAudioEnabled:", -[CSDConversation isAudioEnabled](self, "isAudioEnabled"));
  objc_msgSend(v8, "setVideoEnabled:", -[CSDConversation isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v8, "setVideoPaused:", -[CSDConversation isVideoPaused](self, "isVideoPaused"));
  objc_msgSend(v8, "setScreenEnabled:", -[CSDConversation isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v8, "setLocallyCreated:", -[CSDConversation isLocallyCreated](self, "isLocallyCreated"));
  objc_msgSend( v8,  "setSplitSessionUserProfileState:",  -[CSDConversation splitSessionUserProfileState](self, "splitSessionUserProfileState"));
  objc_msgSend(v8, "setHasJoined:", -[CSDConversation hasJoined](self, "hasJoined"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation initiator](self, "initiator"));
  [v8 setInitiator:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  [v8 setRemoteMembers:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMembers](self, "pendingMembers"));
  [v8 setPendingMembers:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation kickedMembers](self, "kickedMembers"));
  [v8 setKickedMembers:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation rejectedMembers](self, "rejectedMembers"));
  [v8 setRejectedMembers:v16];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation otherInvitedHandles](self, "otherInvitedHandles"));
  [v8 setOtherInvitedHandles:v17];

  objc_msgSend(v8, "setIgnoreLMIRequests:", -[CSDConversation ignoreLMIRequests](self, "ignoreLMIRequests"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation messagesGroupName](self, "messagesGroupName"));
  [v8 setMessagesGroupName:v18];

  objc_msgSend( v8,  "setMaxVideoDecodesAllowed:",  -[CSDConversation maxVideoDecodesAllowed](self, "maxVideoDecodesAllowed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation report](self, "report"));
  [v8 setReport:v19];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation reportingHierarchyToken](self, "reportingHierarchyToken"));
  [v8 setReportingHierarchyToken:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation reportingHierarchySubToken](self, "reportingHierarchySubToken"));
  [v8 setReportingHierarchySubToken:v21];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  [v8 setLocalMember:v22];

  objc_msgSend( v8,  "setLocalParticipantIdentifier:",  -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  LODWORD(v6) = [v23 conversationHandoffEnabled];

  if ((_DWORD)v6)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantAssociation](self, "localParticipantAssociation"));
    [v8 setLocalParticipantAssociation:v24];

    objc_msgSend( v8,  "setOneToOneHandoffOngoing:",  -[CSDConversation isOneToOneHandoffOngoing](self, "isOneToOneHandoffOngoing"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation handoffEligibility](self, "handoffEligibility"));
    [v8 setHandoffEligibility:v25];
  }

  objc_msgSend(v8, "setOneToOneModeEnabled:", -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuActivitySessions](self, "tuActivitySessions"));
  [v8 setActivitySessions:v26];

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuSystemActivitySessions](self, "tuSystemActivitySessions"));
  [v8 setSystemActivitySessions:v27];

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation stagedActivitySession](self, "stagedActivitySession"));
  [v8 setStagedActivitySession:v28];

  objc_msgSend(v8, "setVideo:", -[CSDConversation isVideo](self, "isVideo"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipants](self, "virtualParticipants"));
  [v8 setVirtualParticipants:v29];

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation invitationPreferences](self, "invitationPreferences"));
  [v8 setInvitationPreferences:v30];

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
  [v8 setLightweightMembers:v31];

  objc_msgSend(v8, "setFromStorage:", -[CSDConversation isFromStorage](self, "isFromStorage"));
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation failureContext](self, "failureContext"));
  [v8 setConversationFailureContext:v32];

  objc_msgSend( v8,  "setIsAnyOtherAccountDeviceActive:",  -[CSDConversation isAnyOtherAccountDeviceActive](self, "isAnyOtherAccountDeviceActive"));
  objc_msgSend(v8, "setAvMode:", -[CSDConversation avMode](self, "avMode"));
  objc_msgSend(v8, "setPresentationMode:", -[CSDConversation presentationMode](self, "presentationMode"));
  objc_msgSend(v8, "setScreening:", -[CSDConversation isScreening](self, "isScreening"));
  objc_msgSend(v8, "setRelaying:", -[CSDConversation isRelaying](self, "isRelaying"));
  objc_msgSend(v8, "setEndpointOnCurrentDevice:", -[CSDConversation isRelaying](self, "isRelaying") ^ 1);
  objc_msgSend( v8,  "setSpatialPersonaEnabled:",  -[CSDConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  objc_msgSend( v8,  "setCameraMixedWithScreen:",  -[CSDConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v33 count]));

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  id v36 = [v35 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v62;
    do
    {
      id v39 = 0LL;
      do
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v61 + 1) + 8 * (void)v39) tuConversationParticipant]);
        [v34 addObject:v40];

        id v39 = (char *)v39 + 1;
      }

      while (v37 != v39);
      id v37 = [v35 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }

    while (v37);
  }

  BOOL v41 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantsByIdentifier]( self,  "activeLightweightParticipantsByIdentifier"));
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v41 count]));

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v43 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeLightweightParticipants](self, "activeLightweightParticipants", 0LL));
  id v44 = [v43 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v58;
    do
    {
      v47 = 0LL;
      do
      {
        if (*(void *)v58 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v57 + 1) + 8 * (void)v47) tuConversationParticipant]);
        [v42 addObject:v48];

        v47 = (char *)v47 + 1;
      }

      while (v45 != v47);
      id v45 = [v43 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }

    while (v45);
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned __int8 v50 = [v49 aTVHandoff];

  if ((v50 & 1) == 0) {
    [v34 unionSet:v42];
  }
  [v8 setActiveRemoteParticipants:v34];
  [v8 setActiveLightweightParticipants:v42];
  id v51 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequests](self, "screenSharingRequests"));
  [v8 setScreenSharingRequests:v51];

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation supportedMediaTypes](self, "supportedMediaTypes"));
  [v8 setSupportedMediaTypes:v52];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation handoffContext](self, "handoffContext"));
  [v8 setHandoffContext:v53];

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequests](self, "screenSharingRequests"));
  [v8 setScreenSharingRequests:v54];

  objc_msgSend(v8, "setScreenSharingType:", -[CSDConversation screenSharingType](self, "screenSharingType"));
  id v55 = [v8 copy];

  return (TUConversation *)v55;
}

- (id)avcSessionIdentifier
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionIdentifier]);

  return v5;
}

- (int64_t)avcSessionToken
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  id v5 = [v4 sessionToken];

  return (int64_t)v5;
}

- (int64_t)avcLocalCaptionsToken
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  id v5 = [v4 localCaptionsToken];

  return (int64_t)v5;
}

- (unint64_t)localParticipantIdentifier
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  id v5 = [v4 localParticipantIdentifier];

  return (unint64_t)v5;
}

- (int64_t)maxVideoDecodesAllowed
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  id v5 = [v4 maxVideoDecodesAllowed];

  return (int64_t)v5;
}

- (BOOL)isAudioReady
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  LOBYTE(v3) = [v4 isAudioReady];

  return (char)v3;
}

- (void)setRemoteMembers:(id)a3
{
  if (self->_remoteMembers != a3)
  {
    id v4 = (NSSet *)[a3 copy];
    remoteMembers = self->_remoteMembers;
    self->_remoteMembers = v4;

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) handle]);
          [v6 addObject:v12];

          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v9);
    }

    -[CSDConversation setRemoteMemberHandles:](self, "setRemoteMemberHandles:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v13 conversation:self remoteMembersChanged:self->_remoteMembers];
  }

- (id)localParticipantCapabilities
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TUMutableConversationParticipantCapabilities);
  [v3 setScreenSharingAvailable:1];
  [v3 setGondolaCallingAvailable:1];
  [v3 setSupportsLeaveContext:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  objc_msgSend(v3, "setGftDowngradeToOneToOneAvailable:", objc_msgSend(v4, "gftDowngradeToOneToOne"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  objc_msgSend(v3, "setUPlusOneScreenShareAvailable:", objc_msgSend(v5, "uPlusOneScreenSharing"));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  objc_msgSend(v3, "setUPlusNDowngradeAvailable:", objc_msgSend(v6, "uPlusNDowngrade"));

  id v7 = [v3 setSharePlayProtocolVersion:TUSharePlayProtocolVersion()];
  id v8 = [v3 setPersonaAvailable:TUIsPersonaAvailable(v7)];
  id v9 = [v3 setVisionCallEstablishmentVersion:TUVisionCallEstablishmentVersion(v8)];
  [v3 setVisionFeatureVersion:TUVisionFeatureVersion(v9)];
  [v3 setUPlusOneAVLessAvailable:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  objc_msgSend( v3,  "setSupportsRequestToScreenShare:",  TUIsRequestToScreenShareAvailable( v10,  -[CSDConversation isRelaying](self, "isRelaying"),  -[CSDConversation isScreenSharingInitiationAvailable](self, "isScreenSharingInitiationAvailable")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSDMomentsController localCapabilities](&OBJC_CLASS___CSDMomentsController, "localCapabilities"));
  objc_msgSend(v3, "setMomentsAvailable:", objc_msgSend(v11, "isEnabled"));

  [v3 setPhotosSharePlayAvailable:TUIsPhotosSharePlayAvailable()];
  return v3;
}

- (id)localConversationParticipantWithData
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v5 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [v4 count]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) handle]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
        -[NSMutableArray addObject:](v5, "addObject:", v12);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation localConversationParticipantWithDataToSendToDestinationIDs:]( self,  "localConversationParticipantWithDataToSendToDestinationIDs:",  v5));
  return v13;
}

- (id)localConversationParticipantWithDataToSendToDestinationIDs:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation localParticipantDataToSendToDestinationIDs:]( self,  "localParticipantDataToSendToDestinationIDs:",  a3));
  id v5 = 0LL;
  if (-[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier") && v4)
  {
    uint64_t v6 = objc_alloc(&OBJC_CLASS___CSDConversationParticipant);
    unint64_t v7 = -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handle]);
    id v5 = -[CSDConversationParticipant initWithIdentifier:handle:avcData:]( v6,  "initWithIdentifier:handle:avcData:",  v7,  v9,  v4);

    -[CSDConversationParticipant setAudioVideoMode:]( v5,  "setAudioVideoMode:",  -[CSDConversation avMode](self, "avMode"));
    -[CSDConversationParticipant setSpatialPersonaEnabled:]( v5,  "setSpatialPersonaEnabled:",  -[CSDConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantCapabilities](self, "localParticipantCapabilities"));
    -[CSDConversationParticipant setCapabilities:](v5, "setCapabilities:", v10);
  }

  return v5;
}

- (id)localParticipantData
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v5 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [v4 count]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) handle]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 value]);
        -[NSMutableArray addObject:](v5, "addObject:", v12);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation localParticipantDataToSendToDestinationIDs:]( self,  "localParticipantDataToSendToDestinationIDs:",  v5));
  return v13;
}

- (id)localParticipantDataToSendToDestinationIDs:(id)a3
{
  id v4 = a3;
  if (-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
  {
    uint64_t v5 = 2LL;
  }

  else if ([v4 count])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation faceTimeInviteDemuxer](self, "faceTimeInviteDemuxer"));
    else {
      uint64_t v5 = 1LL;
    }
  }

  else
  {
    uint64_t v5 = 1LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localParticipantDataWithVersion:v5]);

  return v8;
}

- (BOOL)_expanseEnabled
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  else {
    BOOL v4 = -[CSDConversation forceExpanseEnabled](self, "forceExpanseEnabled");
  }

  return v4;
}

- (void)setForceExpanseEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[CSDConversation _expanseEnabled](self, "_expanseEnabled");
  if (v3)
  {
    if ((v5 & 1) == 0)
    {
      uint64_t v6 = objc_alloc(&OBJC_CLASS___CPActivitySessionManager);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation groupUUID](self, "groupUUID"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___CPApplicationController);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation sharePlaySystemStateObserver](self, "sharePlaySystemStateObserver"));
      v13 = -[CPActivitySessionManager initWithIdentifier:groupUUID:activities:applicationController:delegate:queue:systemStateObserver:]( v6,  "initWithIdentifier:groupUUID:activities:applicationController:delegate:queue:systemStateObserver:",  v7,  v8,  v9,  v10,  self,  v11,  v12);
      -[CSDConversation setActivitySessionManager:](self, "setActivitySessionManager:", v13);
    }
  }

  else if (v5)
  {
    -[CSDConversation setActivitySessionManager:](self, "setActivitySessionManager:", 0LL);
  }

  self->_forceExpanseEnabled = v3;
}

- (NSSet)virtualParticipants
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipantsByPluginName](self, "virtualParticipantsByPluginName"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  return (NSSet *)v6;
}

- (NSSet)memberHandlesEligibleForLinkApproval
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));

  if (!v5)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMemberHandles](self, "remoteMemberHandles", 0LL));
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (!v10) {
      goto LABEL_14;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (1)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
        if ([v15 destinationIdIsPhoneNumber])
        {
        }

        else
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
          unsigned int v17 = [v16 destinationIdIsEmailAddress];

          if (!v17) {
            continue;
          }
        }

        [v4 addObject:v14];
      }

      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v11)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 invitedMemberHandles]);
  id v8 = [v7 mutableCopy];

  BOOL v4 = v8;
LABEL_15:
  id v18 = [v4 copy];

  return (NSSet *)v18;
}

- (BOOL)isUplinkMuted
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  LOBYTE(v3) = [v4 isUplinkMuted];

  return (char)v3;
}

- (void)setUplinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v6 setUplinkMuted:v3];
}

- (void)setAudioInjectionAllowed:(BOOL)a3
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v3);
}

- (BOOL)isUnderlyingLinksConnected
{
  return -[CSDIDSGroupSession isUnderlyingLinksConnected](self->_idsSession, "isUnderlyingLinksConnected");
}

- (BOOL)isAudioEnabled
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioEnabled](self, "expectedAudioEnabled"));
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioEnabled](self, "expectedAudioEnabled"));
    unsigned __int8 v6 = [v5 BOOLValue];
  }

  else
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    unsigned __int8 v6 = [v5 isAudioEnabled];
  }

  BOOL v7 = v6;

  return v7;
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting audioEnabled to %d", (uint8_t *)v11, 8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioEnabled](self, "expectedAudioEnabled"));
  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    [v9 setAudioEnabled:v3];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[CSDConversation setExpectedAudioEnabled:](self, "setExpectedAudioEnabled:", v10);
}

- (BOOL)isVideoEnabled
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
    unsigned __int8 v6 = [v5 BOOLValue];
  }

  else
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    unsigned __int8 v6 = [v5 isVideoEnabled];
  }

  BOOL v7 = v6;

  return v7;
}

- (BOOL)isScreenEnabled
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled"));
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled"));
    unsigned __int8 v6 = [v5 BOOLValue];
  }

  else
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    unsigned __int8 v6 = [v5 isScreenEnabled];
  }

  BOOL v7 = v6;

  return v7;
}

- (void)setVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = -[CSDConversation isRedirectingAudio](self, "isRedirectingAudio");
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 && v3)
  {
    if (v9)
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Ignoring to set videoEnabled since conversation is relaying or being screened",  (uint8_t *)v12,  2u);
    }

    goto LABEL_9;
  }

  if (v9)
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting videoEnabled to %d", (uint8_t *)v12, 8u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[CSDConversation setExpectedVideoEnabled:](self, "setExpectedVideoEnabled:", v11);

  if (!v10)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    -[os_log_s setVideoEnabled:](v8, "setVideoEnabled:", v3);
LABEL_9:
  }

- (void)setScreenEnabled:(BOOL)a3 attributes:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109378;
    v17[1] = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Setting screenEnabled to %d, screenShareAttributes: %@",  (uint8_t *)v17,  0x12u);
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled"));
  if (!v10
    || (id v11 = (void *)v10,
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled")),
        unsigned int v13 = [v12 BOOLValue],
        v12,
        v11,
        v13 != v4))
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    [v14 setScreenEnabled:v4 attributes:v6];
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  -[CSDConversation setExpectedScreenEnabled:](self, "setExpectedScreenEnabled:", v15);

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v16 conversationChanged:self];
}

- (void)addScreenSharingType:(unint64_t)a3
{
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t screenSharingType = self->_screenSharingType;
    int v10 = 134218240;
    unint64_t v11 = a3;
    __int16 v12 = 2048;
    unint64_t v13 = screenSharingType;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Adding %lu to screenSharingType %lu",  (uint8_t *)&v10,  0x16u);
  }

  self->_screenSharingType |= a3;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v9 conversationChanged:self];
}

- (BOOL)isVideoPaused
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoPaused](self, "expectedVideoPaused"));
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoPaused](self, "expectedVideoPaused"));
    unsigned __int8 v6 = [v5 BOOLValue];
  }

  else
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    unsigned __int8 v6 = [v5 isVideoPaused];
  }

  BOOL v7 = v6;

  return v7;
}

- (void)setVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting videoPaused to %d", (uint8_t *)v11, 8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoPaused](self, "expectedVideoPaused"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[CSDConversation setExpectedVideoPaused:](self, "setExpectedVideoPaused:", v9);

  if (!v8)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    [v10 setVideoPaused:v3];
  }

- (void)setScreenShareAttributes:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting screenShareAttributes to %@",  (uint8_t *)&v10,  0xCu);
  }

  if (-[CSDConversation isScreenEnabled](self, "isScreenEnabled"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    [v8 setScreenShareAttributes:v4];
  }

  else
  {
    id v9 = sub_1001704C4();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_1002B1F70();
    }
  }
}

- (BOOL)isAudioPaused
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioPaused](self, "expectedAudioPaused"));
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioPaused](self, "expectedAudioPaused"));
    unsigned __int8 v6 = [v5 BOOLValue];
  }

  else
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    unsigned __int8 v6 = [v5 isAudioPaused];
  }

  BOOL v7 = v6;

  return v7;
}

- (void)setAudioPaused:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting audioPaused to %d", buf, 8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioPaused](self, "expectedAudioPaused"));
  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    [v9 setAudioPaused:v3];

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        __int128 v14 = 0LL;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          __int128 v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v14);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
          objc_msgSend(v16, "setAudioPaused:forParticipantWithIdentifier:", v3, objc_msgSend(v15, "identifier"));

          __int128 v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v12);
    }
  }

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[CSDConversation setExpectedAudioPaused:](self, "setExpectedAudioPaused:", v17);
}

- (BOOL)isRedirectingAudio
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[CSDConversation isRelaying](self, "isRelaying")) {
    return 1;
  }
  else {
    return -[CSDConversation isScreening](self, "isScreening");
  }
}

- (BOOL)isRelaying
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_relaying;
}

- (BOOL)isScreening
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_screening;
}

- (void)setRelaying:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v3) {
      id v8 = @"YES";
    }
    int v16 = 136315394;
    unsigned int v17 = "-[CSDConversation setRelaying:]";
    __int16 v18 = 2112;
    __int128 v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:  %@", (uint8_t *)&v16, 0x16u);
  }

  if (v3)
  {
    id v9 = sub_1001704C4();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Turning off video since we are requesting to relay this conversation",  (uint8_t *)&v16,  2u);
    }

    -[CSDConversation setVideoEnabled:](self, "setVideoEnabled:", 0LL);
  }

  unsigned int v11 = -[CSDConversation isRelaying](self, "isRelaying");
  self->_relaying = v3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v12 setRelaying:v3];

  if (v11 != v3)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
    unsigned int v14 = [v13 requestToScreenShareEnabled];

    if (v14) {
      -[CSDConversation broadcastLocalParticipantData](self, "broadcastLocalParticipantData");
    }
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v15 conversationChanged:self];
  }

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  self->_screening = v3;
  id v6 = sub_1001704C4();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v3) {
      id v8 = @"YES";
    }
    int v12 = 138412290;
    uint64_t v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setScreening: %@", (uint8_t *)&v12, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v9 setScreening:v3];

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  [v10 setScreening:v3];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v11 conversationChanged:self];
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3
{
  -[CSDConversation setLocalParticipantAudioVideoMode:presentationMode:]( self,  "setLocalParticipantAudioVideoMode:presentationMode:",  a3,  a3 == 0);
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 presentationMode:(unint64_t)a4
{
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  self->_avMode = a3;
  self->_presentationMode = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation _allMembers](self, "_allMembers"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localCSDConversationParticipant](self, "localCSDConversationParticipant"));
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
      [v12 setParticipantType:0 forParticipant:v9 members:v8 isLocalParticipant:1];

      id v13 = sub_1001704C4();
      unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Stopping session since local av mode is switching to none",  v18,  2u);
      }

      if (-[CSDConversation avcSessionInProgress](self, "avcSessionInProgress"))
      {
        -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 0LL);
        -[CSDConversation _stopAVCSession](self, "_stopAVCSession");
      }
    }
  }

  else
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    unsigned int v11 = [v10 localParticipantType];

    if (v11 == 1)
    {
      -[CSDConversation setVideo:](self, "setVideo:", a3 == 2);
    }

    else
    {
      BOOL v15 = a3 == 2 && -[CSDConversation isVideoEnabled](self, "isVideoEnabled");
      int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v15));
      -[CSDConversation setExpectedVideoEnabled:](self, "setExpectedVideoEnabled:", v16);

      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
      [v17 setParticipantType:1 forParticipant:v9 members:v8 isLocalParticipant:1];
    }
  }
}

- (void)registerMessagesGroupAssociation
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    int v9 = 138412290;
    int v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Conversation UUID: %@ asked to register messages group association",  (uint8_t *)&v9,  0xCu);
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation groupUUID](self, "groupUUID"));
  -[CSDConversation setMessagesGroupUUID:](self, "setMessagesGroupUUID:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v8 conversationChanged:self];
}

- (void)setVideo:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (!-[CSDConversation _endScreenCallIfNecessary](self, "_endScreenCallIfNecessary") && self->_video != v3)
  {
    unint64_t v6 = 1LL;
    if (v3) {
      unint64_t v6 = 2LL;
    }
    self->_avMode = v6;
    self->_video = v3;
    if (!v3) {
      -[CSDConversation setVideoEnabled:](self, "setVideoEnabled:", 0LL);
    }
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    [v7 setVideo:v3];

    id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipant](self, "localParticipant"));
    [v9 conversation:self didChangeLocalParticipant:v8 broadcastActivitySession:1];

    [v9 conversationChanged:self];
  }

- (BOOL)isVideo
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned int v5 = [v4 avLessSharePlayEnabled];

  if (v5) {
    return (id)-[CSDConversation avMode](self, "avMode") == (id)2;
  }
  else {
    return self->_video;
  }
}

- (int64_t)activeRemoteParticipantCountMinusEligibleAVLess
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v18;
    char v8 = 1;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        int v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 capabilities]);
        unsigned int v12 = [v11 isUPlusOneAVLessAvailable];

        if (v12)
        {
          if (![v10 audioVideoMode]) {
            ++v6;
          }
        }

        else
        {
          char v8 = 0;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

  else
  {
    uint64_t v6 = 0LL;
    char v8 = 1;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v14 = [v13 count];

  else {
    uint64_t v15 = 0LL;
  }
  return (int64_t)v14 - v15;
}

- (BOOL)isOneToOneModeEnabled
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    unsigned __int8 v6 = [v5 isOneToOneModeEnabled];
    goto LABEL_48;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned int v8 = [v7 conversationHandoffEnabled];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantAssociation](self, "localParticipantAssociation"));
    if (v9)
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
      BOOL v11 = (unint64_t)[v10 count] < 2;
    }

    else
    {
      BOOL v11 = 1;
    }
  }

  else
  {
    BOOL v11 = 1;
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  unsigned int v13 = [v12 isLightweightMember];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v15 = [v14 count];

  if (v15 == (id)1)
  {
    LODWORD(v16) = v13 ^ 1;
    goto LABEL_35;
  }

  if (-[CSDConversation state](self, "state") > 1)
  {
    LODWORD(v16) = (id)-[CSDConversation activeRemoteParticipantCountMinusEligibleAVLess]( self,  "activeRemoteParticipantCountMinusEligibleAVLess") == (id)1;
    goto LABEL_35;
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v18 = [v17 count];

  if (v18)
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversation mergedRemoteMembers:withLocalMember:removingLocallyAssociatedMember:]( &OBJC_CLASS___TUConversation,  "mergedRemoteMembers:withLocalMember:removingLocallyAssociatedMember:",  v16,  v19,  0LL));

    LODWORD(v16) = 0;
    if ((v13 & 1) == 0)
    {
      if ([v20 count] == (id)1)
      {
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
        LODWORD(v16) = [v21 count] == 0;
      }

      else
      {
        LODWORD(v16) = 0;
      }
    }

    goto LABEL_35;
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  if (([v22 oneToOneFaceTimeMyselfEnabled] & 1) == 0)
  {

    goto LABEL_32;
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
  unsigned int v24 = [v23 isFaceTimeMyselfEnabled];

  if (!v24)
  {
LABEL_32:
    LODWORD(v16) = 0;
    goto LABEL_35;
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remotePushTokens](self, "remotePushTokens"));
  id v16 = [v25 count];

  if (!v16) {
    goto LABEL_35;
  }
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation remotePushTokens](self, "remotePushTokens"));
  id v26 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (!v26) {
    goto LABEL_30;
  }
  id v27 = v26;
  uint64_t v63 = *(void *)v65;
  while (2)
  {
    for (i = 0LL; i != v27; i = (char *)i + 1)
    {
      if (*(void *)v65 != v63) {
        objc_enumerationMutation(obj);
      }
      uint64_t v29 = TUHandleForIDSCanonicalAddress(*(void *)(*((void *)&v64 + 1) + 8LL * (void)i));
      id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      uint64_t v31 = TUCopyIDSFromIDForHandle(v30);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      uint64_t v33 = TUHandleForIDSCanonicalAddress(v32);
      id v34 = (__CFString *)objc_claimAutoreleasedReturnValue(v33);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 handle]);
      unsigned __int8 v37 = -[__CFString isEqualToHandle:](v34, "isEqualToHandle:", v36);

      if ((v37 & 1) == 0)
      {
        id v53 = sub_1001704C4();
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          id v55 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString value](v34, "value"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
          __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v56 handle]);
          __int128 v58 = (__CFString *)objc_claimAutoreleasedReturnValue([v57 value]);
          *(_DWORD *)buf = 138412546;
          v69 = v55;
          __int16 v70 = 2112;
          uint64_t v71 = v58;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "not local handle: %@, %@", buf, 0x16u);
        }

        goto LABEL_56;
      }

      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString value](v34, "value"));
      unsigned int v39 = [v38 destinationIdIsPseudonym];

      if (v39)
      {
        id v59 = sub_1001704C4();
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v34;
          __int128 v60 = "handle is pseudonym: %@";
LABEL_55:
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, v60, buf, 0xCu);
        }

- (BOOL)isOneToOneHandoffOngoing
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned int v4 = [v3 conversationHandoffEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  if ([v5 count] != (id)1)
  {

    return 0;
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  id v7 = [v6 count];

  if (v7 != (id)2) {
    return 0;
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantAssociation](self, "localParticipantAssociation"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantAssociation](self, "localParticipantAssociation"));
    id v10 = [v9 identifier];

    if (v10 != (id)-[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier"))
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier"));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v10));
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);
      BOOL v14 = v13 != 0LL;

      return v14;
    }

    return 0;
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v29;
LABEL_12:
    uint64_t v20 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v19) {
        objc_enumerationMutation(v16);
      }
      __int128 v21 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 association]);

      if (v22) {
        break;
      }
      if (v18 == (id)++v20)
      {
        id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v18) {
          goto LABEL_12;
        }
        goto LABEL_20;
      }
    }

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v21 association]);
    id v24 = [v23 identifier];

    if (v24 == [v21 identifier]) {
      goto LABEL_20;
    }
    if (v24 == (id)-[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier"))
    {
      BOOL v14 = 1;
    }

    else
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v24));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v26]);
      BOOL v14 = v27 != 0LL;
    }
  }

  else
  {
LABEL_20:
    BOOL v14 = 0;
  }

  return v14;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled") != v3)
  {
    id v6 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting oneToOneModeEnabled to %d",  (uint8_t *)v9,  8u);
    }

    -[CSDConversation updateLocalAspectRatios](self, "updateLocalAspectRatios");
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    [v8 setOneToOneModeEnabled:v3];
  }

- (void)setSplitSessionSecondary:(id)a3
{
  id v5 = a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = self->_splitSessionSecondary;
  if ((TUObjectsAreEqualOrNil(v7, v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_splitSessionSecondary, a3);
    if (v7)
    {
      id v20 = v5;
      id v8 = sub_1001704C4();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
        *(_DWORD *)buf = 138412546;
        id v27 = v10;
        __int16 v28 = 2112;
        __int128 v29 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Kicking previous participant on conversation UUID: %@ participant: %@",  buf,  0x16u);
      }

      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
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
            id v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handle]);
            id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationParticipant handle](v7, "handle"));
            unsigned int v19 = [v17 isEquivalentToHandle:v18];

            if (v19) {
              -[CSDConversation kickMember:](self, "kickMember:", v16);
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v13);
      }

      id v5 = v20;
    }

    -[CSDConversation setSharePlayHandedOff:](self, "setSharePlayHandedOff:", v5 != 0LL);
  }
}

- (void)setSharePlayHandedOff:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sharePlayHandedOff: %d", buf, 8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  unsigned int v9 = [v8 handedOff];

  if (v9 != v3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
    [v10 setHandedOff:v3];

    if ((id)-[CSDConversation state](self, "state") == (id)3)
    {
      if (!v3)
      {
        -[CSDConversation _launchApplicationsForActivitiesIfNecessary]( self,  "_launchApplicationsForActivitiesIfNecessary");
        return;
      }

      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation splitSessionSecondary](self, "splitSessionSecondary"));

      if (!v11) {
        return;
      }
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSURL faceTimeShowInCallUIURL](&OBJC_CLASS___NSURL, "faceTimeShowInCallUIURL"));
      if (-[CSDConversation isVideo](self, "isVideo"))
      {
        TUOpenURL(v12);
      }

      else
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL faceTimeShowSystemCallControlsURL]( &OBJC_CLASS___NSURL,  "faceTimeShowSystemCallControlsURL"));

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        _DWORD v17[2] = sub_100028470;
        v17[3] = &unk_1003D7C88;
        id v12 = v16;
        id v18 = v12;
        TUOpenHomeScreenWithCompletion(v17);
      }
    }

    else
    {
      id v13 = sub_1001704C4();
      id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
        int64_t v15 = -[CSDConversation state](self, "state");
        *(_DWORD *)buf = 138412546;
        id v20 = v14;
        __int16 v21 = 2048;
        int64_t v22 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "Ignoring splitSessionSecondary since we aren't joined into the conversation UUID: %@ state: (%tu)",  buf,  0x16u);
      }
    }
  }

- (int)presentationState
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  LODWORD(v3) = [v4 presentationState];

  return (int)v3;
}

- (void)setPresentationState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v6 setPresentationState:v3];
}

- (void)setPresentationMode:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipant](self, "localParticipant"));
    [v7 conversation:self didChangeLocalParticipant:v6 broadcastActivitySession:0];
  }

- (CGRect)presentationRect
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v4 presentationRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  objc_msgSend(v9, "setPresentationRect:", x, y, width, height);
}

- (void)setConversationGridDisplayMode:(unint64_t)a3
{
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v6 setGridDisplayMode:a3];
}

- (void)updateLocalAspectRatios
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[CSDConversation localPortraitAspectRatio](self, "localPortraitAspectRatio");
  double v5 = v4;
  double v7 = v6;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation videoDeviceController](self, "videoDeviceController"));
  objc_msgSend(v8, "setLocalPortraitAspectRatio:localLandscapeAspectRatio:", v5, v7, v7, v5);
}

- (BOOL)isFromStorage
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_fromStorage;
}

- (void)setFromStorage:(BOOL)a3
{
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  self->_fromStorage = a3;
}

- (void)setSplitSessionUserProfileState:(int64_t)a3
{
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (self->_splitSessionUserProfileState != a3)
  {
    self->_splitSessionUserProfileState = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v6 conversationChanged:self];
  }

- (NSSet)memberIdentifiers
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_memberIdentifiers;
}

- (void)setMemberIdentifiers:(id)a3
{
  id v4 = a3;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (NSSet *)[v4 copy];
  memberIdentifiers = self->_memberIdentifiers;
  self->_memberIdentifiers = v6;
}

- (void)addActiveParticipant:(id)a3
{
  id v4 = a3;
  val = self;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v80 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding active participant: %@", buf, 0xCu);
  }

  if (!_TUIsInternalInstall())
  {
LABEL_11:
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](val, "activeRemoteParticipantsByIdentifier"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 identifier]));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v20]);

    if ([v4 isLightweight])
    {
      if ([v4 audioVideoMode]) {
        +[CSDCrashReporter simulateCrashReportWithFormat:]( &OBJC_CLASS___CSDCrashReporter,  "simulateCrashReportWithFormat:",  @"Attempting to add lightweight participant with invalid AVMode. Please file a bug to [FaceTime | (New Bugs)]");
      }
      [v4 setAudioVideoMode:0];
      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantsByIdentifier]( val,  "activeLightweightParticipantsByIdentifier"));
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 identifier]));
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v23]);

      __int16 v21 = (void *)v24;
    }

    uint64_t v71 = v21;
    if (v21)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 avcData]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 avcData]);
      if ([v25 isEqual:v26])
      {

        goto LABEL_19;
      }

      unsigned __int8 v27 = [v4 isLightweight];

      if ((v27 & 1) != 0)
      {
LABEL_19:
        id v28 = sub_1001704C4();
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](val, "UUID"));
          *(_DWORD *)buf = 138412290;
          id v80 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[WARN] Conversation already contains participant with no change in AVC data: %@",  buf,  0xCu);
        }

- (void)removeParticipantsForMember:(id)a3
{
  id v4 = a3;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeParticipants](self, "activeParticipants"));
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    *(_DWORD *)buf = 138412802;
    id v27 = v4;
    __int16 v28 = 2112;
    __int128 v29 = v9;
    __int16 v30 = 2112;
    __int128 v31 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Removing participants for member: %@ on conversation UUID: %@ participants: %@",  buf,  0x20u);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned __int8 v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "handle", (void)v21));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
        unsigned int v18 = [v16 isEquivalentToHandle:v17];

        if (v18)
        {
          id v19 = [v15 identifier];
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 handle]);
          -[CSDConversation removeParticipantWithIdentifier:fromHandle:withReason:]( self,  "removeParticipantWithIdentifier:fromHandle:withReason:",  v19,  v20,  0LL);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v12);
  }
}

- (void)setParticipantAudioVideoMode:(unint64_t)a3 presentationMode:(unint64_t)a4 forParticipant:(id)a5
{
  id v8 = a5;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
LABEL_3:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v9);
      }
      double v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
      id v15 = [v14 identifier];
      if (v15 == [v8 identifier]) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v16 = v14;

    if (!v16) {
      goto LABEL_12;
    }
    [v16 setAudioVideoMode:a3];
    [v16 setPresentationMode:a4];
  }

  else
  {
LABEL_9:

LABEL_12:
    id v17 = sub_1001704C4();
    id v16 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_1002B1FFC();
    }
  }
}

- (void)updateReportInfoForHandoffParticipant:(id)a3
{
  id v8 = a3;
  if ((id)-[CSDConversation state](self, "state") == (id)3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation addedHandoffParticipants](self, "addedHandoffParticipants"));
    [v4 addObject:v8];

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation startAddingHandoffParticipantToTime](self, "startAddingHandoffParticipantToTime"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 handle]);
    [v5 setObject:v6 forKey:v7];
  }
}

- (BOOL)allowsScreenSharing
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  if ([v3 supportsScreenSharing] && (TUSharePlayForceDisabled() & 1) == 0)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation audioRoutePolicyManager](self, "audioRoutePolicyManager"));
    if ([v5 sharePlaySupported])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation sharePlaySystemStateObserver](self, "sharePlaySystemStateObserver"));
      unsigned __int8 v4 = [v6 allowScreenSharing];
    }

    else
    {
      unsigned __int8 v4 = 0;
    }
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)removeParticipantWithIdentifier:(unint64_t)a3 fromHandle:(id)a4 withReason:(unint64_t)a5
{
  id v8 = a4;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (CSDConversation *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a5));
    *(_DWORD *)buf = 134218498;
    unint64_t v123 = a3;
    __int16 v124 = 2112;
    unint64_t v125 = (unint64_t)v8;
    __int16 v126 = 2112;
    v127 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Removing participant with identifier: %lu handle: %@ withReason: %@",  buf,  0x20u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v14]);

  if (v15
    || (v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantsByIdentifier]( self,  "activeLightweightParticipantsByIdentifier")),  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  a3)),  v15 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]),  v17,  v16,  v15))
  {
    v110 = v15;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 handle]);
    unsigned int v19 = [v18 isEqualToHandle:v8];

    id v20 = sub_1001704C4();
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      unint64_t v107 = a5;
      if (v22)
      {
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v110 handle]);
        *(_DWORD *)buf = 134218242;
        unint64_t v123 = a3;
        __int16 v124 = 2112;
        unint64_t v125 = (unint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found matching handle %lu: %@", buf, 0x16u);
      }

      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation recentlyLeftParticipantIdentifiers](self, "recentlyLeftParticipantIdentifiers"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
      [v25 addObject:v26];

      unint64_t v106 = a3;
      if ([v110 isLightweight])
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation splitSessionSecondary](self, "splitSessionSecondary"));

        if (v27 == v110)
        {
          id v43 = sub_1001704C4();
          id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          __int16 v30 = v110;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v123 = (unint64_t)v110;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Removing splitSessionSecondary: %@",  buf,  0xCu);
          }

          -[CSDConversation setSplitSessionSecondary:](self, "setSplitSessionSecondary:", 0LL);
        }

        else
        {
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantsByIdentifier]( self,  "activeLightweightParticipantsByIdentifier"));
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3));
          [v28 setObject:0 forKeyedSubscript:v29];

          __int16 v30 = v110;
        }
      }

      else
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier"));
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3));
        [v32 setObject:0 forKeyedSubscript:v33];

        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        [v34 removeParticipant:v110];

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
        id v36 = [v35 lightweightPrimaryParticipantIdentifier];

        __int16 v30 = v110;
        if (v36 == (id)a3)
        {
          id v37 = sub_1001704C4();
          unsigned int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            id v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
            v40 = (CSDConversation *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
            *(_DWORD *)buf = 138412802;
            unint64_t v123 = (unint64_t)v39;
            __int16 v124 = 2112;
            unint64_t v125 = (unint64_t)v110;
            __int16 v126 = 2112;
            v127 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Leaving conversation because lightweightPrimary left on conversation UUID: %@ participant: %@ localMember: %@",  buf,  0x20u);
          }

          -[CSDConversation leave](self, "leave");
        }
      }

      if ([v30 isScreenEnabled])
      {
        __int128 v118 = 0u;
        __int128 v119 = 0u;
        __int128 v116 = 0u;
        __int128 v117 = 0u;
        id v45 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
        id v46 = [v45 countByEnumeratingWithState:&v116 objects:v121 count:16];
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v117;
          int v49 = 1;
          do
          {
            for (i = 0LL; i != v47; i = (char *)i + 1)
            {
              if (*(void *)v117 != v48) {
                objc_enumerationMutation(v45);
              }
              v49 &= [*(id *)(*((void *)&v116 + 1) + 8 * (void)i) isScreenEnabled] ^ 1;
            }

            id v47 = [v45 countByEnumeratingWithState:&v116 objects:v121 count:16];
          }

          while (v47);

          __int16 v30 = v110;
          if ((v49 & 1) == 0) {
            goto LABEL_37;
          }
        }

        else
        {
        }

        id v51 = sub_1001704C4();
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Removing screen sharing activity sessions since screen sharing participant was removed and no other screen s haring participant is active.",  buf,  2u);
        }

        id v53 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
        [v53 removeScreenSharingSessions];
      }

- (void)updateParticipantPresentationContexts:(id)a3
{
  id v4 = a3;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v6 beginParticipantUpdates];

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        id v13 = [v11 videoQuality];
        double v14 = (void *)objc_claimAutoreleasedReturnValue([v11 visibility]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 prominence]);
        [v11 spatialPosition];
        objc_msgSend( v12,  "setVideoQuality:visibility:prominence:spatialPosition:isInCanvas:forParticipantWithIdentifier:",  v13,  v14,  v15,  objc_msgSend(v11, "isInCanvas"),  objc_msgSend(v11, "participantIdentifier"),  v16,  v17,  v18,  v19);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v8);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v20 commitParticipantUpdates];

  -[CSDConversation setCurrentParticipantPresentationContexts:](self, "setCurrentParticipantPresentationContexts:", obj);
}

- (void)addVirtualParticipant:(id)a3
{
  id v4 = a3;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Adding virtual participant: %@",  (uint8_t *)&v17,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipantsByPluginName](self, "virtualParticipantsByPluginName"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 pluginName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    if (([v10 isEqual:v4] & 1) == 0)
    {
      id v11 = sub_1001704C4();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_1002B2068(v4, (uint64_t)self, v12);
      }
      goto LABEL_9;
    }
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipantsByPluginName](self, "virtualParticipantsByPluginName"));
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 pluginName]);
    [v13 setObject:v4 forKeyedSubscript:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v15 conversationChanged:self];

    double v16 = (void *)objc_claimAutoreleasedReturnValue([v4 pluginName]);
    LODWORD(v14) = [v16 isEqualToString:@"PubSub"];

    if ((_DWORD)v14)
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
      -[os_log_s updateVirtualParticipantIdentifier:]( v12,  "updateVirtualParticipantIdentifier:",  [v4 identifier]);
LABEL_9:
    }
  }
}

- (void)removeVirtualParticipant:(id)a3
{
  id v4 = a3;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing virtual participant: %@",  (uint8_t *)&v25,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipantsByPluginName](self, "virtualParticipantsByPluginName"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 pluginName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (!v10)
  {
    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v4 pluginName]);
      int v25 = 138412546;
      id v26 = v19;
      __int16 v27 = 2112;
      __int16 v28 = self;
      id v20 = "[WARN] Could not find virtual participant for plugin %@: %@";
      __int128 v21 = v18;
      uint32_t v22 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, v22);
    }

- (void)removeRemoteMembers:(id)a3 triggeredLocally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v95 = self;
    __int16 v96 = 1024;
    LODWORD(v97) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "conversation: %@ remove remoteMembers triggeredLocally: %d",  buf,  0x12u);
  }

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (CSDConversation *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    *(_DWORD *)buf = 138412546;
    v95 = v12;
    __int16 v96 = 2112;
    id v97 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UUID: %@ remove remoteMembers: %@", buf, 0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v14 = [v13 mutableCopy];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
  id v16 = [v15 mutableCopy];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v18 = [v17 mutableCopy];

  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  [v18 addObject:v19];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
  [v18 unionSet:v20];

  if ([v6 count])
  {
    id v70 = v18;
    BOOL v68 = v4;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation kickedMembers](self, "kickedMembers"));
    uint32_t v22 = v14;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 setByAddingObjectsFromSet:v6]);
    -[CSDConversation setKickedMembers:](self, "setKickedMembers:", v23);

    [v22 minusSet:v6];
    unint64_t v67 = v22;
    -[CSDConversation setRemoteMembers:](self, "setRemoteMembers:", v22);
    [v16 minusSet:v6];
    id v66 = v16;
    id v24 = [v16 copy];
    -[CSDConversation setLightweightMembers:](self, "setLightweightMembers:", v24);

    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    id v69 = v6;
    id v25 = v6;
    id v26 = [v25 countByEnumeratingWithState:&v86 objects:v93 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v87;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v87 != v28) {
            objc_enumerationMutation(v25);
          }
          __int16 v30 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localLightweightSecondaryMember](self, "localLightweightSecondaryMember"));
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 handle]);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v30 handle]);
          unsigned int v34 = [v32 isEqual:v33];

          if (v34) {
            -[CSDConversation setLocalLightweightSecondaryMember:](self, "setLocalLightweightSecondaryMember:", 0LL);
          }
          -[CSDConversation removeParticipantsForMember:](self, "removeParticipantsForMember:", v30);
        }

        id v27 = [v25 countByEnumeratingWithState:&v86 objects:v93 count:16];
      }

      while (v27);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    id v36 = v25;
    id v37 = [v36 countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v83;
      do
      {
        for (j = 0LL; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v83 != v39) {
            objc_enumerationMutation(v36);
          }
          id v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v82 + 1) + 8 * (void)j) handle]);
          [v35 addObject:v41];
        }

        id v38 = [v36 countByEnumeratingWithState:&v82 objects:v92 count:16];
      }

      while (v38);
    }

    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    id obj = v70;
    id v42 = [obj countByEnumeratingWithState:&v78 objects:v91 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v79;
      do
      {
        for (k = 0LL; k != v43; k = (char *)k + 1)
        {
          if (*(void *)v79 != v44) {
            objc_enumerationMutation(obj);
          }
          id v46 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)k);
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v46 association]);

          if (v47)
          {
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v46 association]);
            int v49 = (void *)objc_claimAutoreleasedReturnValue([v48 handle]);
            unsigned int v50 = [v35 containsObject:v49];

            if (v50)
            {
              [v46 setAssociation:0];
              [v46 setAssociationVoucher:0];
              [v46 setValidationSource:0];
            }
          }
        }

        id v43 = [obj countByEnumeratingWithState:&v78 objects:v91 count:16];
      }

      while (v43);
    }

    id v65 = v36;

    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    id v72 = (id)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
    id v51 = [v72 countByEnumeratingWithState:&v74 objects:v90 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v75;
      do
      {
        for (m = 0LL; m != v52; m = (char *)m + 1)
        {
          if (*(void *)v75 != v53) {
            objc_enumerationMutation(v72);
          }
          uint64_t v55 = *(void *)(*((void *)&v74 + 1) + 8LL * (void)m);
          unsigned int v56 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
          BOOL v57 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:v55]);
          __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v57 handle]);
          unsigned __int8 v59 = [v35 containsObject:v58];

          if ((v59 & 1) == 0)
          {
            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
            id v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:v55]);
            [v71 setObject:v61 forKeyedSubscript:v55];
          }
        }

        id v52 = [v72 countByEnumeratingWithState:&v74 objects:v90 count:16];
      }

      while (v52);
    }

    -[CSDConversation setPendingConversationParticipantsByIdentifier:]( self,  "setPendingConversationParticipantsByIdentifier:",  v71);
    -[CSDConversation removeActivitySessionIfNecessary](self, "removeActivitySessionIfNecessary");
    BOOL v62 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    [v62 removeMembers:v65 fromExistingMembers:obj activeParticipants:0 triggeredLocally:v68];

    id v63 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v63 conversationChanged:self];

    id v6 = v69;
    id v18 = v70;
    id v16 = v66;
    id v14 = v67;
  }

  else
  {
    id v64 = sub_1001704C4();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v95 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v35,  OS_LOG_TYPE_DEFAULT,  "[WARN] No members were removed to conversation: %@",  buf,  0xCu);
    }
  }
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 triggeredLocally:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
  if (v10) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversationInvitationPreference incomingCallAndNotificationInvitationPreferences]( &OBJC_CLASS___TUConversationInvitationPreference,  "incomingCallAndNotificationInvitationPreferences"));
  }
  -[CSDConversation addRemoteMembers:otherInvitedHandles:invitationPreferences:addingFromLetMeIn:triggeredLocally:]( self,  "addRemoteMembers:otherInvitedHandles:invitationPreferences:addingFromLetMeIn:triggeredLocally:",  v11,  v8,  v10,  0LL,  v5);
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 invitationPreferences:(id)a5 addingFromLetMeIn:(BOOL)a6 triggeredLocally:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v168 = a6;
  id v11 = a3;
  id v12 = a4;
  id v156 = a5;
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  id v14 = sub_1001704C4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation groupUUID](self, "groupUUID"));
    *(_DWORD *)buf = 138413058;
    v192 = v16;
    __int16 v193 = 2112;
    id v194 = v17;
    __int16 v195 = 2112;
    id v196 = v11;
    __int16 v197 = 1024;
    BOOL v198 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "addRemoteMembers - UUID: %@ groupUUID: %@ remoteMembers: %@ triggeredLocally: %d",  buf,  0x26u);
  }

  id v18 = sub_1001704C4();
  double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    *(_DWORD *)buf = 138412546;
    v192 = v20;
    __int16 v193 = 2112;
    id v194 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "addRemoteMembers - UUID: %@ otherInvitedHandles: %@",  buf,  0x16u);
  }

  v163 = v12;

  id v21 = sub_1001704C4();
  uint32_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    *(_DWORD *)buf = 138412546;
    v192 = v23;
    __int16 v193 = 2112;
    id v194 = v156;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "addRemoteMembers - UUID: %@ invitationPreferences: %@",  buf,  0x16u);
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v162 = [v24 mutableCopy];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v26 = [v25 mutableCopy];

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
  id v28 = [v27 mutableCopy];

  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  unsigned int v30 = [v29 isLightweightMember];

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  id v160 = v28;
  v161 = v26;
  if (v30) {
    id v32 = v28;
  }
  else {
    id v32 = v26;
  }
  [v32 addObject:v31];

  v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v183 = 0u;
  __int128 v184 = 0u;
  __int128 v185 = 0u;
  __int128 v186 = 0u;
  id v33 = v11;
  id v34 = [v33 countByEnumeratingWithState:&v183 objects:v190 count:16];
  BOOL v170 = v7;
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v184;
    do
    {
      id v37 = 0LL;
      do
      {
        if (*(void *)v184 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = *(void **)(*((void *)&v183 + 1) + 8LL * (void)v37);
        if (([v38 isLightweightMember] & 1) == 0)
        {
          if (v7)
          {
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation kickedMembers](self, "kickedMembers"));
            unsigned int v40 = [v39 containsObject:v38];

            if (v40)
            {
              -[CSDConversation _allowMember:](self, "_allowMember:", v38);
              goto LABEL_33;
            }
          }

          id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMemberHandles](self, "remoteMemberHandles"));
          id v42 = (void *)objc_claimAutoreleasedReturnValue([v38 handle]);
          unsigned int v43 = [v41 containsObject:v42];

          if (v43) {
            BOOL v44 = !v168;
          }
          else {
            BOOL v44 = 1;
          }
          if (v44)
          {
            if ((v43 & 1) != 0) {
              goto LABEL_30;
            }
          }

          else
          {
            id v45 = sub_1001704C4();
            id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v38 handle]);
              *(_DWORD *)buf = 138412290;
              v192 = v48;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Handle is part of remoteMembers list, but trying to add them as part of LMI. Allowing this handle to be added: %@",  buf,  0xCu);
            }
          }

          int v49 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
          unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue([v49 handle]);
          id v51 = (void *)objc_claimAutoreleasedReturnValue([v38 handle]);
          unsigned __int8 v52 = [v50 isEquivalentToHandle:v51];

          if ((v52 & 1) != 0)
          {
LABEL_30:
            id v53 = sub_1001704C4();
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
              unsigned int v56 = (void *)objc_claimAutoreleasedReturnValue([v38 handle]);
              *(_DWORD *)buf = 138412546;
              v192 = v55;
              __int16 v193 = 2112;
              id v194 = v56;
              _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Conversation UUID %@ already contains member with handle %@, filtering out.",  buf,  0x16u);
            }

            BOOL v7 = v170;
            goto LABEL_33;
          }

          id v57 = [v38 copy];
          [v165 addObject:v57];

          if ([v38 joinedFromLetMeIn])
          {
            __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v38 handle]);
            unsigned __int8 v59 = (void *)objc_claimAutoreleasedReturnValue([v58 value]);
            unsigned __int8 v60 = [v59 destinationIdIsTemporary];

            if ((v60 & 1) == 0)
            {
              id v61 = sub_1001704C4();
              BOOL v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                id v63 = (void *)objc_claimAutoreleasedReturnValue([v38 handle]);
                *(_DWORD *)buf = 138412290;
                v192 = v63;
                _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Handle %@ should be considered for addition as an invited member handle if not kicked",  buf,  0xCu);
              }

              id v64 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation memberHandlesAwaitingInvitesToLink]( self,  "memberHandlesAwaitingInvitesToLink"));
              id v65 = (void *)objc_claimAutoreleasedReturnValue([v38 handle]);
              [v64 addObject:v65];
            }
          }

          uint64_t v66 = objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
          BOOL v7 = v170;
          if (v66)
          {
            unint64_t v67 = (void *)v66;
            BOOL v68 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMembers](self, "pendingMembers"));
            unsigned int v69 = [v68 containsObject:v38];

            if (v69)
            {
              id v70 = sub_1001704C4();
              uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v192 = v38;
                _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "addRemoteMembers, remove pending member: %@",  buf,  0xCu);
              }

              id v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v38));
              -[CSDConversation removePendingMembers:triggeredLocally:]( self,  "removePendingMembers:triggeredLocally:",  v72,  v170);
            }
          }

          uint64_t v73 = objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
          if (v73)
          {
            __int128 v74 = (void *)v73;
            __int128 v75 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingRemoteMembers](self, "pendingRemoteMembers"));
            unsigned int v76 = [v75 containsObject:v38];

            if (v76)
            {
              id v77 = sub_1001704C4();
              __int128 v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v79 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingRemoteMembers](self, "pendingRemoteMembers"));
                *(_DWORD *)buf = 138412546;
                v192 = v38;
                __int16 v193 = 2112;
                id v194 = v79;
                _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "addRemoteMembers, remove pending remote member: %@ from: %@",  buf,  0x16u);
              }

              __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingRemoteMembers](self, "pendingRemoteMembers"));
              [v80 removeObject:v38];
            }
          }
        }

- (void)updateMemberValidationSource:(id)a3 source:(int64_t)a4
{
  id v38 = (os_log_s *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v53 = v38;
    __int16 v54 = 2048;
    int64_t v55 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updating member validation source for: %@ to source: %ld",  buf,  0x16u);
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v37 = self;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
  id v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v10)
  {
LABEL_11:

    goto LABEL_31;
  }

  id v11 = v10;
  uint64_t v12 = *(void *)v47;
LABEL_5:
  uint64_t v13 = 0LL;
  while (1)
  {
    if (*(void *)v47 != v12) {
      objc_enumerationMutation(v9);
    }
    id v14 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s handle](v38, "handle"));
    unsigned int v17 = [v15 isEquivalentToHandle:v16];

    if (v17) {
      break;
    }
    if (v11 == (id)++v13)
    {
      id v11 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (!v11) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
  }

  id v18 = sub_1001704C4();
  double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = (os_log_s *)v14;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Found member to update validation state: %@",  buf,  0xCu);
  }

  id v20 = v14;
  if (!v20)
  {
LABEL_31:
    id v36 = sub_1001704C4();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1002B212C();
    }
    goto LABEL_33;
  }

  -[os_log_s setValidationSource:](v20, "setValidationSource:", a4);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s lightweightPrimary](v20, "lightweightPrimary"));
  if (!v39) {
    goto LABEL_30;
  }
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessions](v37, "activitySessions"));
  id v21 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (!v21) {
    goto LABEL_29;
  }
  id v22 = v21;
  uint64_t v41 = *(void *)v43;
  do
  {
    for (i = 0LL; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v43 != v41) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 activity]);
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 trustedFromHandle]);
      if (v26)
      {
        id v27 = (void *)v26;
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v24 activity]);
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 trustedFromHandle]);
        unsigned int v30 = v20;
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s handle](v20, "handle"));
        unsigned int v32 = [v29 isEquivalentToHandle:v31];

        id v20 = v30;
        if (!v32) {
          continue;
        }
        id v33 = sub_1001704C4();
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "We found an activity originated from now validated member %@ updating activity",  buf,  0xCu);
        }

        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 activity]);
        [v25 setTrustedFromHandle:v39];
      }
    }

    id v22 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  }

  while (v22);
LABEL_29:

LABEL_30:
  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](v37, "delegate"));
  [v35 conversationChanged:v37];

LABEL_33:
}

- (void)updateMessagesGroupName:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v4 conversationChanged:self];
}

- (void)addPendingMembers:(id)a3 triggeredLocally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v45 = v6;
    __int16 v46 = 1024;
    LODWORD(v47) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "add pendingMembers: %@ triggeredLocally: %d",  buf,  0x12u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMembers](self, "pendingMembers"));
  id v36 = [v10 mutableCopy];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMemberHandles](self, "pendingMemberHandles"));
  id v38 = [v11 mutableCopy];

  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        unsigned int v17 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 handle]);
        if (v18
          && (double v19 = (void *)v18,
              id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMemberHandles](self, "pendingMemberHandles")),
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v17 handle]),
              unsigned __int8 v22 = [v20 containsObject:v21],
              v21,
              v20,
              v19,
              (v22 & 1) == 0))
        {
          id v27 = objc_alloc(&OBJC_CLASS___TUConversationMember);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v17 handle]);
          __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v17 nickname]);
          unsigned int v30 = -[TUConversationMember initWithHandle:nickname:](v27, "initWithHandle:nickname:", v28, v29);
          [v37 addObject:v30];

          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 handle]);
          [v38 addObject:v24];
        }

        else
        {
          id v23 = sub_1001704C4();
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v17 handle]);
            *(_DWORD *)buf = 138412546;
            id v45 = v25;
            __int16 v46 = 2112;
            __int128 v47 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Conversation UUID %@ already contains pending member with handle %@, filtering out from addition list.",  buf,  0x16u);
          }
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }

    while (v14);
  }

  [v36 unionSet:v37];
  id v31 = [v36 copy];
  -[CSDConversation setPendingMembers:](self, "setPendingMembers:", v31);

  id v32 = [v38 copy];
  -[CSDConversation setPendingMemberHandles:](self, "setPendingMemberHandles:", v32);

  if ([v37 count])
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
    id v34 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v33 queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002CD40;
    block[3] = &unk_1003D7730;
    block[4] = self;
    dispatch_async(v34, block);
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v35 conversationChanged:self];
}

- (BOOL)shouldRespondToLetMeInRequestForMember:(id)a3
{
  id v4 = a3;
  if ([v4 isLightweightMember])
  {
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      id v7 = "No need to add lightweight member to the session";
      id v8 = v6;
      uint32_t v9 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v27, v9);
      goto LABEL_12;
    }

    goto LABEL_12;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMemberHandles](self, "pendingMemberHandles"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
  unsigned __int8 v12 = [v10 containsObject:v11];

  if ((v12 & 1) == 0)
  {
    id v16 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMemberHandles](self, "pendingMemberHandles"));
    int v27 = 138412546;
    id v28 = v4;
    __int16 v29 = 2112;
    unsigned int v30 = v17;
    uint64_t v18 = "member: %@ is not in pendingMemberHandles: %@";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v27, 0x16u);

    goto LABEL_12;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMemberForHandle:](self, "remoteMemberForHandle:", v13));

  if (v14)
  {
    id v15 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v4;
      id v7 = "member: %@ is in remoteMemberForHandle";
      id v8 = v6;
      uint32_t v9 = 12;
      goto LABEL_8;
    }

- (void)removePendingMembers:(id)a3 triggeredLocally:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = sub_1001704C4();
  uint32_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v6;
    __int16 v42 = 1024;
    LODWORD(v43) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "removePendingMembers: %@ triggeredLocally: %d",  buf,  0x12u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMemberHandles](self, "pendingMemberHandles"));
  id v35 = [v10 mutableCopy];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v37;
    *(void *)&__int128 v14 = 138412546LL;
    __int128 v34 = v14;
    do
    {
      unsigned int v17 = 0LL;
      do
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v17);
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMemberHandles](self, "pendingMemberHandles", v34));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 handle]);
        unsigned int v21 = [v19 containsObject:v20];

        if (v21)
        {
          uint64_t v22 = objc_alloc(&OBJC_CLASS___TUConversationMember);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 handle]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v18 nickname]);
          id v25 = -[TUConversationMember initWithHandle:nickname:](v22, "initWithHandle:nickname:", v23, v24);
          [v11 addObject:v25];

          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 handle]);
          [v35 removeObject:v26];
        }

        else
        {
          id v27 = sub_1001704C4();
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
            __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v18 handle]);
            *(_DWORD *)buf = v34;
            id v41 = v28;
            __int16 v42 = 2112;
            __int128 v43 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Conversation with UUID %@ does not have pending member with handle %@, filtering out from removal list.",  buf,  0x16u);
          }
        }

        unsigned int v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }

    while (v15);
  }

  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingMembers](self, "pendingMembers"));
  id v31 = [v30 mutableCopy];

  [v31 minusSet:v11];
  id v32 = [v31 copy];
  -[CSDConversation setPendingMembers:](self, "setPendingMembers:", v32);

  id v33 = [v35 copy];
  -[CSDConversation setPendingMemberHandles:](self, "setPendingMemberHandles:", v33);
}

- (BOOL)setConversationLink:(id)a3 allowUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
  if (v7) {
    BOOL v8 = v4;
  }
  else {
    BOOL v8 = 1;
  }

  if (v8)
  {
    uint32_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));

    if (!v9 || !v4)
    {
      uint64_t v22 = (os_log_s *)[v6 copy];
      -[CSDConversation setLink:](self, "setLink:", v22);
      goto LABEL_14;
    }

    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 linkName]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 expirationDate]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 invitedMemberHandles]);
      int v26 = 138413314;
      id v27 = v12;
      __int16 v28 = 2112;
      __int16 v29 = v13;
      __int16 v30 = 2112;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v15;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Link on conversation UUID %@ was already set to %@, but this setting allows for updates, setting the link name t o %@, the expiration date to %@, and the invited handles to %@",  (uint8_t *)&v26,  0x34u);
    }

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 linkName]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
    [v18 setLinkName:v17];

    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v6 expirationDate]);
    id v20 = [v19 copy];
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
    [v21 setExpirationDate:v20];

    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 invitedMemberHandles]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
    [v23 setInvitedMemberHandles:v22];
    goto LABEL_12;
  }

  id v24 = sub_1001704C4();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
    int v26 = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    __int16 v29 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[WARN] Ignoring new link %@ as conversation link already set to %@",  (uint8_t *)&v26,  0x16u);
LABEL_12:
  }

- (void)addScreenSharingRequest:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  [v6 setObject:v4 forKeyedSubscript:v7];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v8 conversationChanged:self];
}

- (void)removeScreenSharingRequest:(id)a3
{
  id v10 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequests](self, "screenSharingRequests"));
  unsigned int v6 = [v5 containsObject:v10];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
    [v7 setObject:0 forKeyedSubscript:v8];

    uint32_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v9 conversationChanged:self];
  }
}

- (void)fulfillLocalScreenShareRequests
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);

  id v7 = [v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);

        if ([v13 type] == (id)4) {
          [v4 addObject:v13];
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }

    while (v8);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v14 = v4;
  id v15 = [v14 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        BOOL v19 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v18);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID", (void)v25));
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 UUID]);
        [v20 setObject:0 forKeyedSubscript:v21];

        uint64_t v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }

    while (v16);
  }

  id v22 = sub_1001704C4();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Fulfilled screen sharing requests %@",  buf,  0xCu);
  }

  if ([v14 count])
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v24 conversationChanged:self];
  }
}

- (void)fulfillPendingScreenSharingRequestsForRemoteParticipant:(id)a3
{
  id v29 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);

  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);

        if ([v14 type] == (id)1)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v29 handle]);
          unsigned int v17 = [v15 isEqualToHandle:v16];

          if (v17) {
            [v5 addObject:v14];
          }
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }

    while (v9);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v18 = v5;
  id v19 = [v18 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      id v22 = 0LL;
      do
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v22);
        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID"));
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v23 UUID]);
        [v24 setObject:0 forKeyedSubscript:v25];

        id v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }

    while (v20);
  }

  id v26 = sub_1001704C4();
  __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Fulfilled remote screen sharing requests %@",  buf,  0xCu);
  }

  if ([v18 count])
  {
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v28 conversationChanged:self];
  }
}

- (void)leaveActivitySessionWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "leaveActivitySessionWithUUID: %@",  (uint8_t *)&v10,  0xCu);
  }

  if (-[CSDConversation _expanseEnabled](self, "_expanseEnabled"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
    [v8 leaveActivitySessionWithUUID:v4];
  }

  else
  {
    id v9 = sub_1001704C4();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Dropping request to remove activitySession because Expanse features are disabled. Please enable the exp anseEnabled feature flag in TelephonyUtilities.",  (uint8_t *)&v10,  2u);
    }
  }
}

- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Finding activitySession with UUID: %@ to present dismissal alert",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002E074;
  v10[3] = &unk_1003D7CD8;
  id v11 = v4;
  id v9 = v4;
  [v8 presentSessionDismissalAlertForActivitySessionUUID:v9 allowingCancellation:1 completionHandler:v10];
}

- (void)removeActivitySessionWithUUID:(id)a3 usingTerminatingHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "removeActivitySessionWithUUID: %@",  (uint8_t *)&v13,  0xCu);
  }

  if (-[CSDConversation _expanseEnabled](self, "_expanseEnabled"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
    [v11 removeActivitySessionWithUUID:v6 usingHandle:v7];
  }

  else
  {
    id v12 = sub_1001704C4();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Dropping request to remove activitySession because Expanse features are disabled. Please enable the exp anseEnabled feature flag in TelephonyUtilities.",  (uint8_t *)&v13,  2u);
    }
  }
}

- (void)_launchApplicationDueToActivityCreation:(id)a3
{
}

- (id)createActivitySession:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v48 = 138412290;
    id v49 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "activitySession: %@", (uint8_t *)&v48, 0xCu);
  }

  if (TUSharePlayForceDisabled())
  {
    id v8 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v48) = 0;
      int v10 = "[WARN] Dropping new activitySession because Expanse features are disabled. Please upgrade to a later release"
            " to re-enable Expanse features.";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v48, 2u);
      goto LABEL_16;
    }

    goto LABEL_16;
  }

  if (!-[CSDConversation _expanseEnabled](self, "_expanseEnabled"))
  {
    id v19 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v48) = 0;
      int v10 = "[WARN] Dropping new activitySession because Expanse features are disabled. Please enable the expanseEnable"
            "d feature flag in TelephonyUtilities.";
      goto LABEL_15;
    }

- (void)setUsingAirplay:(BOOL)a3 forActivitySessionUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  [v7 setUsingAirplay:v4 forActivitySessionWithUUID:v6];
}

- (void)resetActivitySessionSceneAssociationsForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  [v5 resetSceneAssociationsForBundleID:v4];
}

- (id)createStagedActivitySessionForActivity:(id)a3
{
  id v4 = (TUConversationActivitySession *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    __int128 v25 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asked to create staged activitySession for activity: %@",  (uint8_t *)&v24,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessions](self, "activitySessions"));
  id v9 = [v8 count];

  if (!v9)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentServerTime sharedInstance](&OBJC_CLASS___IDSCurrentServerTime, "sharedInstance"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentServerTimeDate]);

    -[TUConversationActivitySession setTimestamp:](v4, "setTimestamp:", v14);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUConversationActivitySession metadata](v4, "metadata"));
    [v15 saveImageToDisk];

    id v16 = -[TUConversationActivitySession initWithActivity:locallyInitiated:timestamp:isFirstJoin:]( objc_alloc(&OBJC_CLASS___TUConversationActivitySession),  "initWithActivity:locallyInitiated:timestamp:isFirstJoin:",  v4,  1LL,  v14,  1LL);
    if (-[TUConversationActivitySession startWhenStaged](v4, "startWhenStaged"))
    {
      id v17 = sub_1001704C4();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        __int128 v25 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Skipping staging activity %@",  (uint8_t *)&v24,  0xCu);
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
      id v20 = [v19 createActivitySessionWithTuActivitySession:v16];
    }

    else
    {
      if (!-[CSDConversation setStagedActivitySessionForActivitySession:]( self,  "setStagedActivitySessionForActivitySession:",  v16))
      {
LABEL_16:
        id v11 = v16;

        id v12 = v11;
        goto LABEL_17;
      }

      id v21 = sub_1001704C4();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        __int128 v25 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Successfully created staged activitySession: %@",  (uint8_t *)&v24,  0xCu);
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
      [v19 conversationChanged:self];
    }

    goto LABEL_16;
  }

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Failed to create staged activitySession since we can't replace an activitySession with a staged activitySession.",  (uint8_t *)&v24,  2u);
  }

  id v12 = 0LL;
LABEL_17:

  return v12;
}

- (BOOL)setStagedActivitySessionForActivitySession:(id)a3
{
  id v4 = (os_log_s *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Attempting to set staged activitySession: %@",  (uint8_t *)&v19,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessions](self, "activitySessions"));
  id v9 = [v8 count];

  if (v9)
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[WARN] Failed to create staged activitySession since we can't replace an activitySession with a staged activitySession.",  (uint8_t *)&v19,  2u);
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s activity](v4, "activity"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 activityIdentifier]);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 localBundleIDForActivityIdentifier:v14]);

    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "BundleID override: %@",  (uint8_t *)&v19,  0xCu);
    }

    if (v11)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s activity](v4, "activity"));
      [v17 setBundleIdentifier:v11];
    }

    -[CSDConversation setStagedActivitySession:](self, "setStagedActivitySession:", v4);
  }

  return v9 == 0LL;
}

- (void)_launchApplicationsForActivitiesIfNecessary
{
}

- (void)removeActivitySessionIfNecessary
{
  if ((id)-[CSDConversation state](self, "state") == (id)2 || (id)-[CSDConversation state](self, "state") == (id)3)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessions](self, "activitySessions"));
    id v4 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = *(void *)v18;
      *(void *)&__int128 v5 = 138412802LL;
      __int128 v16 = v5;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activity", v16));
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 trustedFromHandle]);

          if (v11 && !-[CSDConversation containsMemberWithHandle:](self, "containsMemberWithHandle:", v11))
          {
            id v12 = sub_1001704C4();
            int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
              *(_DWORD *)buf = v16;
              id v22 = v11;
              __int16 v23 = 2112;
              int v24 = v15;
              __int16 v25 = 2112;
              id v26 = self;
              _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Trusted from handle %@ not found in membership list for activitySession ID: %@ on conversation %@",  buf,  0x20u);
            }

            id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
            -[CSDConversation removeActivitySessionWithUUID:usingTerminatingHandle:]( self,  "removeActivitySessionWithUUID:usingTerminatingHandle:",  v14,  v11);
          }
        }

        id v6 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
      }

      while (v6);
    }
  }

- (void)_launchApplicationsForActivitiesIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessions](self, "activitySessions"));
  if (![obj count])
  {

    return;
  }

  unsigned __int8 v5 = -[CSDConversation isScreening](self, "isScreening");

  if ((v5 & 1) != 0) {
    return;
  }
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessions](self, "activitySessions"));
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v7)
  {
    id v9 = v6;
    goto LABEL_17;
  }

  id v8 = v7;
  __int128 v19 = self;
  BOOL v20 = v3;
  id v9 = 0LL;
  uint64_t v10 = *(void *)v24;
  id obja = v6;
  do
  {
    for (i = 0LL; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(obja);
      }
      id v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      if (!v9) {
        goto LABEL_10;
      }
      int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * (void)i) tuConversationActivitySession]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 timestamp]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 tuConversationActivitySession]);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 timestamp]);
      id v17 = [v14 compare:v16];

      if (v17 == (id)1)
      {
LABEL_10:
        id v18 = v12;

        id v9 = v18;
      }
    }

    id v8 = [obja countByEnumeratingWithState:&v23 objects:v27 count:16];
  }

  while (v8);

  if (v9)
  {
    -[CSDConversation _launchApplicationForActivityIfNecessary:shouldForeground:]( v19,  "_launchApplicationForActivityIfNecessary:shouldForeground:",  v9,  v20);
LABEL_17:
  }

- (void)_launchApplicationForActivityIfNecessary:(id)a3
{
  id v5 = a3;
  -[CSDConversation _launchApplicationForActivityIfNecessary:shouldForeground:]( self,  "_launchApplicationForActivityIfNecessary:shouldForeground:",  v5,  TUShouldForegroundLaunchForActivity(v5, v4));
}

- (void)_launchApplicationForActivityIfNecessary:(id)a3 shouldForeground:(BOOL)a4
{
  id v5 = a3;
  if ((id)-[CSDConversation state](self, "state") == (id)3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation sharePlaySystemStateObserver](self, "sharePlaySystemStateObserver"));
    unsigned __int8 v7 = [v6 allowSharePlay];

    if ((v7 & 1) != 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 tuConversationActivitySession]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activity]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationContext]);

      if (!v10)
      {
        id v17 = sub_1001704C4();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
          *(_DWORD *)buf = 138412290;
          id v58 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Activity with identifier %@ is missing application context.",  buf,  0xCu);
        }

        goto LABEL_21;
      }

      if ([v9 isStaticActivity])
      {
        id v11 = sub_1001704C4();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v58 = v8;
          int v13 = "Not launching app for static activity: %@";
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
        }
      }

      else if ([v9 isSupported])
      {
        __int128 v19 = (char *)[v8 state];
        if ((unint64_t)(v19 - 2) >= 3)
        {
          if (v19 != (char *)1)
          {
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
            unsigned int v24 = [v23 isLightweightMember];

            if (v24)
            {
              id v25 = sub_1001704C4();
              __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v58 = v5;
                _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Auto-launching application for session on TV: %@",  buf,  0xCu);
              }

              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 applicationLauncher]);
              v54[0] = _NSConcreteStackBlock;
              v54[1] = 3221225472LL;
              v54[2] = sub_10002F924;
              v54[3] = &unk_1003D7D00;
              id v55 = v5;
              unsigned int v56 = self;
              [v28 launchAppForActivitySession:v55 options:0 completion:v54];

              id v29 = v55;
            }

            else
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation applicationLaunchPolicyManager](self, "applicationLaunchPolicyManager"));
              __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
              if ([v30 shouldAutoLaunchAppForActivity:v9 onConversation:v31])
              {
                __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation audioRoutePolicyManager](self, "audioRoutePolicyManager"));
                unsigned int v33 = [v32 sharePlaySupported];
              }

              else
              {
                unsigned int v33 = 0;
              }

              id v34 = sub_1001704C4();
              __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
                uint64_t v37 = objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
                id v38 = (void *)v37;
                id v39 = @"NO";
                *(_DWORD *)buf = 138412802;
                id v58 = v36;
                __int16 v59 = 2112;
                if (v33) {
                  id v39 = @"YES";
                }
                uint64_t v60 = v37;
                __int16 v61 = 2112;
                BOOL v62 = v39;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Request to launch %@ for conversation with UUID: %@ allowing auto-launch: %@",  buf,  0x20u);
              }

              if ((v33 & 1) == 0)
              {
                +[CSDAnalyticsReporter sendManualLaunchNeededEventWithActivitySession:]( &OBJC_CLASS___CSDAnalyticsReporter,  "sendManualLaunchNeededEventWithActivitySession:",  v8);
                __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
                [v47 conversation:self appLaunchState:1 forActivitySession:v8];

                goto LABEL_22;
              }

              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472LL;
              v51[2] = sub_10002F9FC;
              v51[3] = &unk_1003D7D50;
              v51[4] = self;
              id v40 = v5;
              id v52 = v40;
              id v53 = v8;
              id v41 = objc_retainBlock(v51);
              id v42 = sub_1001704C4();
              __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Attempting to launch app in background w/ PiP",  buf,  2u);
              }

              [v40 permitJoin];
              __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
              id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 applicationLauncher]);
              v48[0] = _NSConcreteStackBlock;
              v48[1] = 3221225472LL;
              v48[2] = sub_10002FB24;
              v48[3] = &unk_1003D7D78;
              id v49 = v40;
              id v50 = v41;
              __int16 v46 = v41;
              [v45 launchAppForActivitySession:v49 options:1 completion:v48];

              id v29 = v52;
            }

LABEL_22:
            goto LABEL_23;
          }

          id v22 = sub_1001704C4();
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v58 = v8;
            int v13 = "Not launching app as the activitySession has already been joined: %@";
            goto LABEL_20;
          }
        }

        else
        {
          id v20 = sub_1001704C4();
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v58 = v8;
            int v13 = "Not launching app as we are not in an eligible activitySession state: %@";
            goto LABEL_20;
          }
        }
      }

      else
      {
        id v21 = sub_1001704C4();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v58 = v8;
          int v13 = "Not launching app for unsupported activity: %@";
          goto LABEL_20;
        }
      }

- (NSSet)activitySessions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activitySessions]);
  id v4 = [v3 copy];

  return (NSSet *)v4;
}

- (NSSet)tuActivitySessions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tuActivitySessions]);

  return (NSSet *)v3;
}

- (id)tuSystemActivitySessions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tuSystemActivitySessions]);

  return v3;
}

- (CGSize)localPortraitAspectRatio
{
  id v2 = objc_msgSend((id)CUTWeakLinkClass(@"CADisplay", @"QuartzCore"), "mainDisplay");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v3 bounds];
  if (v4 <= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  if (v4 <= v5) {
    double v7 = v4;
  }
  else {
    double v7 = v5;
  }
  unsigned int v8 = TUBinaryGCD((int)v7, (int)v6);
  double v9 = v7 / (double)v8;
  double v10 = v6 / (double)v8;

  double v11 = v9;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)stopContentSharingSession
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessions](self, "activitySessions"));
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v15 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activity", v15));
        if ([v10 isScreenSharingActivity])
        {
          double v11 = (void *)objc_claimAutoreleasedReturnValue([v9 tuConversationActivitySession]);
          unsigned int v12 = [v11 isLocallyInitiated];

          if (!v12) {
            continue;
          }
          id v13 = sub_1001704C4();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            id v21 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found locally initiated screen sharing activity session %@, ending session",  buf,  0xCu);
          }

          double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
          -[CSDConversation removeActivitySessionWithUUID:usingTerminatingHandle:]( self,  "removeActivitySessionWithUUID:usingTerminatingHandle:",  v10,  0LL);
        }
      }

      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v6);
  }
}

- (id)setupNewAVCSession:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));

  id v6 = sub_1001704C4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1002B21FC();
    }

    +[CSDCrashReporter simulateCrashReportWithFormat:]( &OBJC_CLASS___CSDCrashReporter,  "simulateCrashReportWithFormat:",  @"Trying to setup new AVCSession without tearing down previous session first. Please file a bug to [FaceTime Core - TelephonyUtilities | All].");
    -[CSDConversation leave](self, "leave");
    return 0LL;
  }

  else
  {
    os_signpost_id_t v10 = os_signpost_id_generate(v7);

    id v11 = sub_1001704C4();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "avcSessionCreationBlock",  "",  buf,  2u);
    }

    id v14 = (uint64_t (**)(void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[CSDConversation avcSessionCreationBlock]( self,  "avcSessionCreationBlock"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 idsDestination]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
    BOOL v18 = -[CSDConversation isVideoEnabled](self, "isVideoEnabled");
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation report](self, "report"));
    uint64_t v20 = ((uint64_t (**)(void, void *, CSDConversation *, void *, BOOL, BOOL, void *))v14)[2]( v14,  v16,  self,  v17,  v18,  v3,  v19);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    id v22 = sub_1001704C4();
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    unsigned int v24 = v23;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_END,  v10,  "avcSessionCreationBlock",  "",  buf,  2u);
    }

    if (v21)
    {
      if (-[CSDConversation avMode](self, "avMode"))
      {
        [v21 setAudioEnabled:1];
        if (-[CSDConversation isRelaying](self, "isRelaying")) {
          objc_msgSend(v21, "setRelaying:", -[CSDConversation isRelaying](self, "isRelaying"));
        }
        if (-[CSDConversation isScreening](self, "isScreening")) {
          objc_msgSend(v21, "setScreening:", -[CSDConversation isScreening](self, "isScreening"));
        }
      }

      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
      id v26 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v31;
        do
        {
          for (i = 0LL; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v31 != v28) {
              objc_enumerationMutation(v25);
            }
            -[CSDConversation _addRemoteParticipantToAVCSessionIfPossible:]( self,  "_addRemoteParticipantToAVCSessionIfPossible:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)i));
          }

          id v27 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }

        while (v27);
      }
    }

    return v21;
  }

- (void)joinUsingContext:(id)a3
{
  id v4 = a3;
  __int128 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v98 = self;
    __int16 v99 = 2112;
    id v100 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Joining CSDConversation self: %@ context: %@",  buf,  0x16u);
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
  -[CSDConversation setRebroadcastTimeThreshold:]( self,  "setRebroadcastTimeThreshold:",  [v8 rebroadcastTimeThreshold]);

  -[CSDConversation setFailureContext:](self, "setFailureContext:", 0LL);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation messagesGroupUUID](self, "messagesGroupUUID"));
  [v4 setMessagesGroupUUID:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation messagesGroupName](self, "messagesGroupName"));
  [v4 setMessagesGroupName:v11];

  if (!+[TUConversationManager allowsVideo](&OBJC_CLASS___TUConversationManager, "allowsVideo"))
  {
LABEL_6:
    [v4 setVideoEnabled:0];
    goto LABEL_8;
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  if ([v12 groupFacetimeAsAServiceEnabled])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 provider]);
    unsigned __int8 v14 = [v13 supportsVideo];

    if ((v14 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }

LABEL_8:
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSDMomentsController localCapabilities](&OBJC_CLASS___CSDMomentsController, "localCapabilities"));
  objc_msgSend(v4, "setMomentsAvailable:", objc_msgSend(v15, "isEnabled"));

  [v4 setPersonaAvailable:TUIsPersonaAvailable(v16)];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  objc_msgSend(v4, "setInitiator:", objc_msgSend(v17, "count") == 0);

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  id v19 = [v18 avLessSharePlayEnabled];

  if ((_DWORD)v19)
  {
    -[CSDConversation setAvMode:](self, "setAvMode:", [v4 avMode]);
    if (-[CSDConversation avMode](self, "avMode")) {
      -[CSDConversation setVideo:](self, "setVideo:", [v4 avMode] == (id)2);
    }
    -[CSDConversation setPresentationMode:](self, "setPresentationMode:", [v4 presentationMode]);
    if (![v4 avMode] && objc_msgSend(v4, "isVideo"))
    {
      id v20 = sub_1001704C4();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_1002B2394();
      }
    }

    if ([v4 avMode] && objc_msgSend(v4, "presentationMode"))
    {
      id v22 = sub_1001704C4();
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        sub_1002B2334();
      }
    }

    if (![v4 avMode] && !objc_msgSend(v4, "presentationMode"))
    {
      id v24 = sub_1001704C4();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_1002B22D4();
      }
    }
  }

  else
  {
    -[CSDConversation setVideo:](self, "setVideo:", [v4 isVideo]);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  if ([v26 usesModernScreenSharingFromMessages])
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue([v4 screenSharingRequest]);

    if (!v19) {
      goto LABEL_31;
    }
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 screenSharingRequest]);
    id v19 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequestsByUUID](self, "screenSharingRequestsByUUID"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v4 screenSharingRequest]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 UUID]);
    [v19 setObject:v26 forKeyedSubscript:v28];
  }

LABEL_31:
  self->_spatialPersonaEnabled = [v4 isSpatialPersonaEnabled];
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  objc_msgSend(v4, "setLightweight:", objc_msgSend(v29, "isLightweightMember"));

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation deviceSupport](self, "deviceSupport"));
  if ([v30 isGreenTea])
  {
    unsigned __int8 v31 = -[CSDConversation isVideo](self, "isVideo");
    if ((v31 & 1) == 0)
    {
      id v19 = (id)objc_claimAutoreleasedReturnValue([v4 provider]);
      if ([v19 isDefaultProvider])
      {

LABEL_61:
        id v45 = sub_1001704C4();
        __int16 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_1002B2228(self);
        }

        -[CSDConversation _reportConversationFailedWithProviderEndedReason:]( self,  "_reportConversationFailedWithProviderEndedReason:",  519LL);
        goto LABEL_107;
      }
    }

    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
    id v42 = [v41 count];

    if ((v31 & 1) != 0)
    {
    }

    else
    {
    }
  }

  else
  {
  }

  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation invitationPreferences](self, "invitationPreferences"));
  if (![v32 count])
  {
    id v33 = (id)objc_claimAutoreleasedReturnValue([v4 invitationPreferences]);
    if ([v33 count] && !-[CSDConversation hasJoined](self, "hasJoined"))
    {
      unsigned int v34 = -[CSDConversation isLocallyCreated](self, "isLocallyCreated");

      if (!v34) {
        goto LABEL_45;
      }
      id v35 = sub_1001704C4();
      __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = (CSDConversation *)objc_claimAutoreleasedReturnValue([v4 invitationPreferences]);
        *(_DWORD *)buf = 138412290;
        id v98 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Copying invitation preferences to locally-created conversation from join context: %@",  buf,  0xCu);
      }

      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v4 invitationPreferences]);
      id v33 = [v32 copy];
      -[CSDConversation setInvitationPreferences:](self, "setInvitationPreferences:", v33);
    }
  }

LABEL_45:
  if ([v4 isLightweight])
  {
    id v38 = sub_1001704C4();
    id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = (CSDConversation *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
      *(_DWORD *)buf = 138412290;
      id v98 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Bypassing AVCSession creation because localMember is lightweight %@",  buf,  0xCu);
    }

    -[CSDConversation setState:](self, "setState:", 2LL);
    -[CSDConversation _startIDSSessionWithContext:](self, "_startIDSSessionWithContext:", v4);
    goto LABEL_106;
  }

  if (!-[CSDConversation state](self, "state"))
  {
    id v47 = sub_1001704C4();
    int v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      id v49 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
      id v50 = (CSDConversation *)objc_claimAutoreleasedReturnValue([v49 idsDestination]);
      *(_DWORD *)buf = 138412290;
      id v98 = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Creating CSDAVCSession with transport token %@",  buf,  0xCu);
    }

    uint64_t v51 = -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
    id v52 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
    if (([v52 conversationHandoffEnabled] & 1) == 0)
    {

      goto LABEL_85;
    }

    id v53 = (void *)objc_claimAutoreleasedReturnValue([v4 participantAssociation]);

    if (!v53) {
      goto LABEL_85;
    }
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int16 v54 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
    id v55 = [v54 countByEnumeratingWithState:&v92 objects:v96 count:16];
    BOOL v56 = v55 != 0LL;
    if (v55)
    {
      id v57 = v55;
      BOOL v88 = v55 != 0LL;
      unsigned int v89 = v51;
      uint64_t v90 = v9;
      v91 = self;
      char v58 = 0;
      uint64_t v59 = *(void *)v93;
      do
      {
        for (i = 0LL; i != v57; i = (char *)i + 1)
        {
          if (*(void *)v93 != v59) {
            objc_enumerationMutation(v54);
          }
          __int16 v61 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)i);
          id v62 = [v61 identifier];
          id v63 = (void *)objc_claimAutoreleasedReturnValue([v4 participantAssociation]);
          id v64 = [v63 identifier];

          if (v62 == v64)
          {
            id v65 = (void *)objc_claimAutoreleasedReturnValue([v61 avcIdentifier]);
            id v66 = [v65 copy];
            unint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v4 participantAssociation]);
            [v67 setAvcIdentifier:v66];

            char v58 = 1;
          }
        }

        id v57 = [v54 countByEnumeratingWithState:&v92 objects:v96 count:16];
      }

      while (v57);

      if ((v58 & 1) == 0)
      {
        BOOL v56 = 0;
        double v9 = v90;
        self = v91;
        uint64_t v51 = v89;
        if (!v89) {
          goto LABEL_85;
        }
        goto LABEL_109;
      }

      __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v4 participantAssociation]);
      self = v91;
      -[CSDConversation setLocalParticipantAssociation:](v91, "setLocalParticipantAssociation:", v54);
      double v9 = v90;
      BOOL v56 = v88;
      uint64_t v51 = v89;
    }

    if (!(_DWORD)v51) {
      goto LABEL_85;
    }
LABEL_109:
    __int128 v83 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
    id v84 = [v83 count];

    char v85 = !v56;
    if ((v85 & 1) != 0)
    {
      uint64_t v51 = 1LL;
    }

    else
    {
      id v86 = sub_1001704C4();
      __int128 v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "This device is joining a U+1 FaceTime call to complete a handoff from a different participant, setting oneToOn eModeEnabled to NO.",  buf,  2u);
      }

      [v4 setOneToOneModeEnabled:0];
      uint64_t v51 = 0LL;
    }

- (void)updateLocalParticipantInfo
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantBlobTracker](self, "localParticipantBlobTracker"));
  [v4 invalidateLocalParticipantBlobWantsDeliveryOverPush:0];
}

- (void)broadcastLocalParticipantData
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  if (v4)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantBlobTracker](self, "localParticipantBlobTracker"));
    [v8 invalidateLocalParticipantBlobWantsDeliveryOverPush:1];
  }

  else
  {
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v10 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not sending local participant data, no AVCSession: %@",  buf,  0xCu);
    }
  }

- (void)startAudio
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    int v13 = 138413058;
    unsigned __int8 v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = -[CSDConversation isAudioReady](self, "isAudioReady");
    __int16 v17 = 1024;
    unsigned int v18 = -[CSDConversation isAudioPaused](self, "isAudioPaused");
    __int16 v19 = 1024;
    unsigned int v20 = -[CSDConversation isAudioEnabled](self, "isAudioEnabled");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Requested to mark conversation as audioReady UUID: %@ audioReady: %d audioPaused: %d audioEnabled: %d",  (uint8_t *)&v13,  0x1Eu);
  }

  -[CSDConversation _addParticipantsWaitingToBeAddedToAVCSession](self, "_addParticipantsWaitingToBeAddedToAVCSession");
  if (-[CSDConversation avMode](self, "avMode"))
  {
    if ((id)-[CSDConversation state](self, "state") == (id)2 || (id)-[CSDConversation state](self, "state") == (id)3)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
      [v7 setAudioReady:1];

      -[CSDConversation _startAVCSessionIfNecessary](self, "_startAVCSessionIfNecessary");
      return;
    }

    id v12 = sub_1001704C4();
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      int v13 = 138412290;
      unsigned __int8 v14 = v10;
      id v11 = "[WARN] Not starting audio for conversation because it isn't joining/joined: %@";
      goto LABEL_11;
    }
  }

  else
  {
    id v8 = sub_1001704C4();
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      int v13 = 138412290;
      unsigned __int8 v14 = v10;
      id v11 = "[WARN] Not starting audio for conversation because avmode is .none %@";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
  }
}

- (BOOL)supportsLeaveContext
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    unsigned __int8 v6 = 1;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if ((v6 & 1) != 0)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v10 + 1) + 8 * (void)i) capabilities]);
          unsigned __int8 v6 = [v8 supportsLeaveContext];
        }

        else
        {
          unsigned __int8 v6 = 0;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }

  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (void)leave
{
}

- (void)leaveWithReason:(unint64_t)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = -[CSDConversationLeaveContext initWithLeaveReason:]( objc_alloc(&OBJC_CLASS___CSDConversationLeaveContext),  "initWithLeaveReason:",  a3);
  -[CSDConversation leaveUsingContext:](self, "leaveUsingContext:", v6);
}

- (void)leaveUsingContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    *(_DWORD *)buf = 138412290;
    id v63 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "leaveUsingContext: self UUID: %@", buf, 0xCu);
  }

  -[CSDConversation setUplinkMuted:](self, "setUplinkMuted:", 1LL);
  -[CSDConversation setAudioEnabled:](self, "setAudioEnabled:", 0LL);
  -[CSDConversation setVideoEnabled:](self, "setVideoEnabled:", 0LL);
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[TUCallScreenShareAttributes defaultAttributes]( &OBJC_CLASS___TUCallScreenShareAttributes,  "defaultAttributes"));
  -[CSDConversation setScreenEnabled:attributes:](self, "setScreenEnabled:attributes:", 0LL, v9);

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mergedActiveRemoteParticipants]);

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mergedRemoteMembers]);

  if ((id)-[CSDConversation state](self, "state") == (id)2 || (id)-[CSDConversation state](self, "state") == (id)3)
  {
    id v50 = v14;
    __int16 v15 = v12;
    -[CSDConversation setState:](self, "setState:", 4LL);
    -[CSDConversation _beginTimeoutForLeavingConversationWithReason:]( self,  "_beginTimeoutForLeavingConversationWithReason:",  @"Calling -[CSDConversation leave]");
    -[CSDConversation setUplinkMuted:](self, "setUplinkMuted:", 1LL);
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier"));
    id v17 = [v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
          objc_msgSend( v22,  "setDownlinkMuted:forParticipantWithIdentifier:",  1,  objc_msgSend(v21, "unsignedLongLongValue"));
        }

        id v18 = [v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }

      while (v18);
    }

    -[CSDConversation setSplitSessionSecondary:](self, "setSplitSessionSecondary:", 0LL);
    id v23 = sub_1001704C4();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
      *(_DWORD *)buf = 138412290;
      id v63 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Leaving CSDIDSGroupSession: %@", buf, 0xCu);
    }

    id v26 = sub_1001704C4();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    __int128 v12 = v15;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v28 = -[CSDConversation supportsLeaveContext](self, "supportsLeaveContext");
      id v29 = @"NO";
      if (v28) {
        id v29 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v63 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Conversation participants support leave context: %@",  buf,  0xCu);
    }

    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    if (-[CSDConversation supportsLeaveContext](self, "supportsLeaveContext")) {
      id v31 = v4;
    }
    else {
      id v31 = 0LL;
    }
    [v30 leaveGroupSessionWithContext:v31];

    -[CSDConversation stopContentSharingSession](self, "stopContentSharingSession");
    -[CSDConversation destroyScreenCapturePickerIfNecessary](self, "destroyScreenCapturePickerIfNecessary");
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
    [v32 resetSessions];

    self->_spatialPersonaEnabled = 0;
    [v10 conversationChanged:self];
    unsigned __int8 v14 = v50;
    goto LABEL_22;
  }

  if ((id)-[CSDConversation state](self, "state") == (id)1)
  {
    -[CSDConversation setState:](self, "setState:", 0LL);
    -[CSDConversation setAvcSession:](self, "setAvcSession:", 0LL);
    -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 0LL);
    [v10 conversationChanged:self];
    goto LABEL_22;
  }

  if (!-[CSDConversation state](self, "state"))
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
    if (v33 || [v14 count] != (id)1)
    {
    }

    else if ([v12 count] == (id)1)
    {
      id v49 = v12;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
      id v35 = [v34 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v53;
        do
        {
          id v38 = 0LL;
          do
          {
            if (*(void *)v53 != v37) {
              objc_enumerationMutation(v34);
            }
            id v39 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v38);
            id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 activeIDSDestination]);
            if (v40) {
              goto LABEL_36;
            }
            id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
            v51[0] = _NSConcreteStackBlock;
            v51[1] = 3221225472LL;
            v51[2] = sub_100031A64;
            v51[3] = &unk_1003D7DA0;
            v51[4] = v39;
            id v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "tu_anyObjectPassingTest:", v51));

            id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 idsDestination]);
            if (v40)
            {
LABEL_36:
              [v10 conversation:self sendDeclineMessageToParticipantDestination:v40];
            }

            else
            {
              id v43 = sub_1001704C4();
              id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v44 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
                *(_DWORD *)buf = 138412290;
                id v63 = v44;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "[WARN] No IDS destination to send decline message: %@",  buf,  0xCu);
              }
            }

            id v38 = (char *)v38 + 1;
          }

          while (v36 != v38);
          id v45 = [v34 countByEnumeratingWithState:&v52 objects:v60 count:16];
          id v36 = v45;
        }

        while (v45);
      }

      __int128 v12 = v49;
      goto LABEL_22;
    }
  }

  id v46 = sub_1001704C4();
  id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    int v48 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    *(_DWORD *)buf = 138412290;
    id v63 = v48;
    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not leaving conversation because it isn't joining/joined: %@",  buf,  0xCu);
  }

LABEL_22:
}

- (void)kickMember:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v7;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Kicking member on conversation UUID: %@ member: %@",  buf,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeParticipants](self, "activeParticipants"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100031CB4;
  v16[3] = &unk_1003D7DC8;
  id v10 = v4;
  id v17 = v10;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tu_firstObjectPassingTest:", v16));

  if (v11)
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingKickedMembersByIdentifier](self, "pendingKickedMembersByIdentifier"));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v11 identifier]));
    [v12 setObject:v10 forKeyedSubscript:v13];
  }

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  [v14 kickMember:v10];

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
  -[CSDConversation removeRemoteMembers:triggeredLocally:](self, "removeRemoteMembers:triggeredLocally:", v15, 1LL);
}

- (void)_allowMember:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingAllowedMembers](self, "pendingAllowedMembers"));
  [v5 addObject:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  [v6 allowMember:v4];
}

- (void)setRemoteParticipantsDownlinkMuted:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier",  0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v9);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        objc_msgSend( v11,  "setAudioAndVideoMuted:forParticipantWithIdentifier:",  v3,  objc_msgSend(v10, "unsignedLongLongValue"));

        double v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

- (id)reducedInfoMembers:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v3 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v9), "handle", (void)v16));
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v10));

        __int128 v12 = objc_alloc(&OBJC_CLASS___TUConversationMember);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 tuHandle]);
        __int128 v14 = -[TUConversationMember initWithHandle:](v12, "initWithHandle:", v13);

        [v4 addObject:v14];
        double v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return v4;
}

- (BOOL)isRepresentedByRemoteMembers:(id)a3 andLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation reducedInfoMembers:](self, "reducedInfoMembers:", v9));

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation reducedInfoMembers:](self, "reducedInfoMembers:", v7));
  if ([v10 isEqualToSet:v11]
    && ((__int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link")), v12, v6)
     || !v12))
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));

    if (!v6 || v15)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));

      unsigned __int8 v13 = 1;
      if (v6 && v16)
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 pseudonym]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 pseudonym]);
        unsigned __int8 v13 = [v18 isEqualToString:v19];
      }
    }

    else
    {
      unsigned __int8 v13 = 1;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)updateRemoteMember:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        id v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 handle]);
        int v13 = TUHandlesAreCanonicallyEqual(v11, v12);

        if (v13)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
          id v15 = [v14 mutableCopy];

          [v15 removeObject:v10];
          [v15 addObject:v4];
          id v16 = [v15 copy];
          -[CSDConversation setRemoteMembers:](self, "setRemoteMembers:", v16);

          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)updateLightweightMember:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        id v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 handle]);
        int v13 = TUHandlesAreCanonicallyEqual(v11, v12);

        if (v13)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
          id v15 = [v14 mutableCopy];

          [v15 removeObject:v10];
          [v15 addObject:v4];
          id v16 = [v15 copy];
          -[CSDConversation setLightweightMembers:](self, "setLightweightMembers:", v16);

          goto LABEL_11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)updateLocalMember:(id)a3
{
}

- (id)memberWithHandle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
  int v7 = TUHandlesAreCanonicallyEqual(v4, v6);

  if (v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  }

  else
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
    id v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v31;
LABEL_5:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 handle]);
        char v16 = TUHandlesAreCanonicallyEqual(v4, v15);

        if ((v16 & 1) != 0) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v11) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }

      id v8 = v14;

      if (v8) {
        goto LABEL_24;
      }
    }

    else
    {
LABEL_11:
    }

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers", 0LL));
    id v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v27;
      while (2)
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 handle]);
          int v24 = TUHandlesAreCanonicallyEqual(v4, v23);

          if (v24)
          {
            id v8 = v22;
            goto LABEL_23;
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    id v8 = 0LL;
LABEL_23:
  }

- (BOOL)containsMemberWithHandle:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation memberWithHandle:](self, "memberWithHandle:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (NSDictionary)capabilitySendMessageOptions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 requiredCapabilities]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requiredLackOfCapabilities]);

  if ([v4 count] || objc_msgSend(v6, "count"))
  {
    int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ([v4 count]) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v4,  IDSSendMessageOptionRequireAllRegistrationPropertiesKey);
    }
    if ([v6 count]) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v6,  IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey);
    }
    id v8 = -[NSMutableDictionary copy](v7, "copy");
  }

  else
  {
    id v8 = 0LL;
  }

  return (NSDictionary *)v8;
}

- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  [v8 addRequiredCapabilities:v7 requiredLackOfCapabilities:v6];
}

- (id)remoteParticipantForHandle:(id)a3
{
  id v4 = a3;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handle]);
      unsigned __int8 v12 = [v11 isEquivalentToHandle:v4];

      if ((v12 & 1) != 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v13 = v10;

    if (v13) {
      goto LABEL_22;
    }
  }

  else
  {
LABEL_9:
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeLightweightParticipants](self, "activeLightweightParticipants", 0LL));
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 handle]);
        unsigned int v21 = [v20 isEquivalentToHandle:v4];

        if (v21)
        {
          id v13 = v19;
          goto LABEL_21;
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v13 = 0LL;
LABEL_21:

LABEL_22:
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 tuConversationParticipant]);

  return v22;
}

- (id)remoteParticipantForIdentifier:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tuConversationParticipant]);
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantsByIdentifier]( self,  "activeLightweightParticipantsByIdentifier"));
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v13 tuConversationParticipant]);
  }

  return v10;
}

- (id)remoteMemberForHandle:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 handle]);
        unsigned int v11 = [v10 isEquivalentToHandle:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (TUConversationParticipant)localParticipant
{
  id v3 = objc_alloc(&OBJC_CLASS___TUConversationParticipant);
  unint64_t v4 = -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handle]);
  uint64_t v7 = -[TUConversationParticipant initWithIdentifier:handle:](v3, "initWithIdentifier:handle:", v4, v6);

  -[TUConversationParticipant setAudioVideoMode:](v7, "setAudioVideoMode:", -[CSDConversation avMode](self, "avMode"));
  -[TUConversationParticipant setPresentationMode:]( v7,  "setPresentationMode:",  -[CSDConversation presentationMode](self, "presentationMode"));
  -[TUConversationParticipant setLocalAccountHandle:](v7, "setLocalAccountHandle:", 1LL);
  -[TUConversationParticipant setSpatialPersonaEnabled:]( v7,  "setSpatialPersonaEnabled:",  -[CSDConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  -[TUConversationParticipant setCameraMixedWithScreen:]( v7,  "setCameraMixedWithScreen:",  -[CSDConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  return v7;
}

- (id)localCSDConversationParticipant
{
  id v3 = objc_alloc(&OBJC_CLASS___CSDConversationParticipant);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  id v5 = [v4 localParticipantIdentifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 handle]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantData](self, "localParticipantData"));
  uint64_t v9 = -[CSDConversationParticipant initWithIdentifier:handle:avcData:]( v3,  "initWithIdentifier:handle:avcData:",  v5,  v7,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantCapabilities](self, "localParticipantCapabilities"));
  -[CSDConversationParticipant setCapabilities:](v9, "setCapabilities:", v10);

  -[CSDConversationParticipant setVideoEnabled:]( v9,  "setVideoEnabled:",  -[CSDConversation isVideoEnabled](self, "isVideoEnabled"));
  -[CSDConversationParticipant setAudioVideoMode:](v9, "setAudioVideoMode:", -[CSDConversation avMode](self, "avMode"));
  -[CSDConversationParticipant setPresentationMode:]( v9,  "setPresentationMode:",  -[CSDConversation presentationMode](self, "presentationMode"));
  -[CSDConversationParticipant setSpatialPersonaEnabled:]( v9,  "setSpatialPersonaEnabled:",  -[CSDConversation isSpatialPersonaEnabled](self, "isSpatialPersonaEnabled"));
  -[CSDConversationParticipant setCameraMixedWithScreen:]( v9,  "setCameraMixedWithScreen:",  -[CSDConversation isCameraMixedWithScreen](self, "isCameraMixedWithScreen"));
  -[CSDConversationParticipant setCaptionsToken:]( v9,  "setCaptionsToken:",  -[CSDConversation avcLocalCaptionsToken](self, "avcLocalCaptionsToken"));
  return v9;
}

- (void)addAliasesToConversationContainer:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stableBundleIdentifierForLocalBundleIdentifier:v7]);

  if (v9)
  {
    id v10 = v9;

    id v7 = v10;
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 dataUsingEncoding:4]);
  -[CSDConversation setIDSAliasingSalt:onContainer:](self, "setIDSAliasingSalt:onContainer:", v11, v6);
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  [v12 addAliasesToConversationContainer:v6 withSalt:v11];

  id v13 = sub_1001704C4();
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation groupUUID](self, "groupUUID"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 groupUUID]);
    int v17 = 138412802;
    id v18 = v15;
    __int16 v19 = 2112;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Aliased session %@ to %@ for bundle identifier %@",  (uint8_t *)&v17,  0x20u);
  }
}

- (void)setIDSAliasingSalt:(id)a3 onContainer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 virtualParticipantConfig]);
  [v8 setIdsAliasingSalt:v6];
  [v5 setVirtualParticipantConfig:v8];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 unreliableMessengerConfig]);
  [v7 setIdsAliasingSalt:v6];

  [v5 setUnreliableMessengerConfig:v7];
}

- (BOOL)allParticipantsSupportSharePlay
{
  return 1;
}

- (BOOL)_endScreenCallIfNecessary
{
  BOOL v3 = -[CSDConversation isScreening](self, "isScreening");
  if (!v3) {
    return v3;
  }
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeParticipantDestinationsByIdentifier]( self,  "activeParticipantDestinationsByIdentifier"));
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 3)
  {
    id v6 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeParticipantDestinationsByIdentifier]( self,  "activeParticipantDestinationsByIdentifier"));
    *(_DWORD *)buf = 134217984;
    id v41 = [v8 count];
    uint64_t v9 = "Ending the screening call because a new participant joins, count: %ld";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_12:

    goto LABEL_13;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeLightweightParticipants](self, "activeLightweightParticipants"));
  id v11 = [v10 count];

  if (v11)
  {
    id v12 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeLightweightParticipants](self, "activeLightweightParticipants"));
    *(_DWORD *)buf = 134217984;
    id v41 = [v8 count];
    uint64_t v9 = "Ending the screening call because a lightweight participant joins, count: %ld";
    goto LABEL_11;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  id v14 = [v13 count];

  if ((unint64_t)v14 >= 2)
  {
    id v15 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
    *(_DWORD *)buf = 134217984;
    id v41 = [v8 count];
    uint64_t v9 = "Ending the screening call because active remote participants, count: %ld";
    goto LABEL_11;
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  if ((unint64_t)[v16 count] >= 2)
  {

LABEL_22:
    id v20 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
      id v21 = [v8 count];
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
      *(_DWORD *)buf = 134218240;
      id v41 = v21;
      __int16 v42 = 2048;
      id v43 = [v22 count];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ending the screening call because a new member is added, remoteMembers: %ld, lightweightMembers: %ld",  buf,  0x16u);

      goto LABEL_12;
    }

- (id)_allMembers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v4 = [v3 mutableCopy];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
  id v6 = [v5 mutableCopy];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  [v4 addObject:v7];

  [v4 unionSet:v6];
  id v8 = [v4 copy];

  return v8;
}

- (void)_restartIDSSessionIfNecessary
{
  if (!-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled")) {
    goto LABEL_11;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  if ([v3 count] != (id)1)
  {

    goto LABEL_11;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));

  if (v4)
  {
LABEL_11:
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    [v9 restart];

    return;
  }

  -[CSDConversation _cleanUpConversation](self, "_cleanUpConversation");
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled")) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
    *(_DWORD *)buf = 138412546;
    id v11 = v7;
    __int16 v12 = 2048;
    id v13 = [v8 count];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "restartIDSSessionIfNecessary: No need to restart IDS Session since it's U + 1, %@, %lu",  buf,  0x16u);
  }
}

- (void)_stopAVCSession
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation failureContext](self, "failureContext"));
  id v4 = [v3 providerEndedReason];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation failureContext](self, "failureContext"));
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"callservicesd.ConversationErrorType",  [v5 providerEndedReason],  0));

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    [v6 stopWithError:v7];
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
    [v7 stopWithError:0];
  }
}

- (void)_cleanUpConversation
{
  BOOL v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  activeParticipantDestinationsByIdentifier = self->_activeParticipantDestinationsByIdentifier;
  self->_activeParticipantDestinationsByIdentifier = v3;

  id v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  activeRemoteParticipantsByIdentifier = self->_activeRemoteParticipantsByIdentifier;
  self->_activeRemoteParticipantsByIdentifier = v5;

  id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  activeLightweightParticipantsByIdentifier = self->_activeLightweightParticipantsByIdentifier;
  self->_activeLightweightParticipantsByIdentifier = v7;

  id v9 = objc_alloc_init(&OBJC_CLASS___NSSet);
  -[CSDConversation setRemoteMembers:](self, "setRemoteMembers:", v9);

  id v10 = objc_alloc_init(&OBJC_CLASS___NSSet);
  -[CSDConversation setRemotePushTokens:](self, "setRemotePushTokens:", v10);

  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[CSDConversation setPendingRemoteMembers:](self, "setPendingRemoteMembers:", v11);

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation letMeInRequestUINotificationBlock](self, "letMeInRequestUINotificationBlock"));
  if (v12)
  {
    id v13 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "cleanUpConversation: cancel letMeInRequestUINotificationBlock",  v16,  2u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation letMeInRequestUINotificationBlock](self, "letMeInRequestUINotificationBlock"));
    dispatch_block_cancel(v15);

    -[CSDConversation setLetMeInRequestUINotificationBlock:](self, "setLetMeInRequestUINotificationBlock:", 0LL);
  }

  -[CSDConversation setABTestConfiguration:](self, "setABTestConfiguration:", 0LL);
}

- (void)_emitRTCConnectionSetupEventForAddActiveParticipant:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation report](self, "report"));
  -[CSDConversation _emitRTCConnectionSetupEvent:participantIdentifier:]( self,  "_emitRTCConnectionSetupEvent:participantIdentifier:",  5,  objc_msgSend(v5, "hashForParticipantIdentifier:", objc_msgSend(v4, "identifier")));

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[Metrics] Adding active participant: %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)_emitRTCConnectionSetupEvent:(int64_t)a3 participantIdentifier:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRTCConnectionSetup rtcKey:](&OBJC_CLASS___CSDRTCConnectionSetup, "rtcKey:", 1LL));
  v18[0] = v7;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v19[0] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRTCConnectionSetup rtcKey:](&OBJC_CLASS___CSDRTCConnectionSetup, "rtcKey:", 2LL));
  v18[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation report](self, "report"));
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 timebase]);
  [v10 timeIntervalSinceDate:v12];
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unint64_t)(v13 * 1000.0)));
  v19[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
  [v16 connectionSetupReportReceived:v15 eventType:a3 forConversation:v17];
}

- (void)_startIDSSessionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if ((id)-[CSDConversation state](self, "state") != (id)2)
  {
    id v12 = sub_1001704C4();
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v14 = -[CSDConversation state](self, "state");
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      *(_DWORD *)buf = 134218242;
      int64_t v87 = v14;
      __int16 v88 = 2112;
      unsigned int v89 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not joining IDS session as state (%tu) is not joining on conversation: %@",  buf,  0x16u);
    }

    goto LABEL_42;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v6));

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
  [v7 unionSet:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  uint64_t v71 = (os_log_s *)v7;
  [v7 addObject:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v75 = v4;
  if (-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled")
    && ([v4 isInitiator] & 1) == 0)
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 participantDestinationIDs]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v17));

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithTUConversationMember:]( &OBJC_CLASS___IDSDestination,  "destinationWithTUConversationMember:",  v18));
    [v11 removeObject:v19];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 idsDestination]);
    [v11 removeObject:v21];

    id v22 = sub_1001704C4();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v87 = (int64_t)v11;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Sending U+1 join context to subset of participants: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v11 = v10;
  }

  if (-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
    if ([v24 uPlusOneSessionWithCapabilitiesEnabled])
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
      unsigned int v26 = [v25 isUPlusOneSessionCapabilitiesEnabled];

      if (!v26) {
        goto LABEL_17;
      }
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation screenSharingRequests](self, "screenSharingRequests"));
      id v28 = [v27 count];

      if (v28)
      {
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsSSRC));
        -[CSDConversation addRequiredCapabilities:requiredLackOfCapabilities:]( self,  "addRequiredCapabilities:requiredLackOfCapabilities:",  v29,  0LL);
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsModernGFT));
      -[CSDConversation addRequiredCapabilities:requiredLackOfCapabilities:]( self,  "addRequiredCapabilities:requiredLackOfCapabilities:",  v24,  0LL);
    }
  }

- (void)_addRemoteParticipantToAVCSessionIfPossible:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  unsigned int v7 = [v6 isAudioReady];

  unsigned int v8 = -[CSDConversation isRedirectingAudio](self, "isRedirectingAudio");
  if (v8) {
    unsigned int v8 = -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
  }
  if ((v7 | v8) != 1)
  {
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      id v15 = [v4 identifier];
      id v12 = "AVAudioClient not set up yet, delaying adding participant to AVCSession: %llu";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
    }

- (void)_addParticipantsWaitingToBeAddedToAVCSession
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&__int128 v6 = 134217984LL;
    __int128 v22 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession", v22));
        unsigned __int8 v12 = objc_msgSend( v11,  "containsRemoteParticipantWithIdentifier:",  objc_msgSend(v10, "identifier"));

        id v13 = sub_1001704C4();
        int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if ((v12 & 1) != 0)
        {
          if (!v15) {
            goto LABEL_16;
          }
          id v16 = [v10 identifier];
          *(_DWORD *)buf = v22;
          id v28 = v16;
          int v17 = v14;
          id v18 = "Not adding participant %llu to AVCSession now that AVAudioClient is set up because they're already in the AVCSession";
          goto LABEL_15;
        }

        if (v15)
        {
          id v19 = [v10 identifier];
          *(_DWORD *)buf = v22;
          id v28 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Adding participant to AVCSession now that AVAudioClient is set up: %llu",  buf,  0xCu);
        }

        if ([v10 audioVideoMode])
        {
          int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
          -[os_log_s addParticipant:withVideoEnabled:audioPaused:screenEnabled:]( v14,  "addParticipant:withVideoEnabled:audioPaused:screenEnabled:",  v10,  +[TUConversationManager allowsVideo](&OBJC_CLASS___TUConversationManager, "allowsVideo"),  -[CSDConversation isAudioPaused](self, "isAudioPaused"),  -[CSDConversation allowsScreenSharing](self, "allowsScreenSharing"));
          goto LABEL_16;
        }

        id v20 = sub_1001704C4();
        int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [v10 identifier];
          *(_DWORD *)buf = v22;
          id v28 = v21;
          int v17 = v14;
          id v18 = "Participant has no AV configured, ignoring to add the participant to the session: %llu";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
        }

- (void)_startAVCSessionIfNecessary
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  unsigned int v5 = [v4 isAudioReady];

  if (-[CSDConversation isRedirectingAudio](self, "isRedirectingAudio")) {
    unsigned int v6 = -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
  }
  else {
    unsigned int v6 = 0;
  }
  unint64_t v7 = -[CSDConversation avMode](self, "avMode");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  unsigned int v9 = [v8 localParticipantType];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  unsigned int v11 = [v10 isJoined];

  if (v11 && v5 | v6 && v7 && v9 == 1)
  {
    unsigned __int8 v12 = -[CSDConversation avcSessionInProgress](self, "avcSessionInProgress");
    id v13 = sub_1001704C4();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((v12 & 1) != 0)
    {
      if (v15)
      {
        id v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        int v36 = 138412290;
        __int128 v37 = v16;
        int v17 = "Skipped starting session since session start is already in progress %@";
        id v18 = v14;
        uint32_t v19 = 12;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v36, v19);
      }
    }

    else
    {
      if (v15)
      {
        __int128 v27 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        int v36 = 138412290;
        __int128 v37 = v27;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting %@", (uint8_t *)&v36, 0xCu);
      }

      -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 1LL);
      id v28 = sub_1001704C4();
      __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
      os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v29, v30);

      id v32 = sub_1001704C4();
      os_signpost_id_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      id v34 = v33;
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        LOWORD(v36) = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v34,  OS_SIGNPOST_INTERVAL_BEGIN,  v31,  "avcSessionStart",  "",  (uint8_t *)&v36,  2u);
      }

      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation report](self, "report"));
      -[CSDConversation _emitRTCConnectionSetupEvent:participantIdentifier:]( self,  "_emitRTCConnectionSetupEvent:participantIdentifier:",  3,  objc_msgSend( v35,  "hashForParticipantIdentifier:",  -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier")));

      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
      -[os_log_s start](v14, "start");
    }
  }

  else
  {
    id v20 = sub_1001704C4();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
      unsigned int v21 = -[__CFString isJoined](v16, "isJoined");
      __int128 v22 = @"NO";
      if (v21) {
        __int128 v23 = @"YES";
      }
      else {
        __int128 v23 = @"NO";
      }
      if (v5) {
        __int128 v24 = @"YES";
      }
      else {
        __int128 v24 = @"NO";
      }
      int v36 = 138413314;
      __int128 v37 = v23;
      if (v6) {
        __int128 v25 = @"YES";
      }
      else {
        __int128 v25 = @"NO";
      }
      __int16 v38 = 2112;
      id v39 = v24;
      if (v7) {
        __int128 v26 = @"NO";
      }
      else {
        __int128 v26 = @"YES";
      }
      __int16 v40 = 2112;
      id v41 = v25;
      __int16 v42 = 2112;
      if (v9 == 1) {
        __int128 v22 = @"YES";
      }
      id v43 = v26;
      __int16 v44 = 2112;
      id v45 = v22;
      int v17 = "Skipped starting session since isJoined:%@ audioReady:%@ isRedirectingAudio :%@ isAVLess:%@ isLocalParticipantNormal: %@";
      id v18 = v14;
      uint32_t v19 = 52;
      goto LABEL_27;
    }
  }
}

- (void)_cleanUpFromAVCSessionFailure
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  [v4 resetSessions];

  self->_spatialPersonaEnabled = 0;
  -[CSDConversation refreshActiveParticipantsList](self, "refreshActiveParticipantsList");
  -[CSDConversation cleanUpIDSSessionState](self, "cleanUpIDSSessionState");
  -[CSDConversation _cleanUpHandoffMetricsIfNecessary](self, "_cleanUpHandoffMetricsIfNecessary");
}

- (void)setState:(int64_t)a3
{
  id v5 = sub_1001704C4();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t state = self->_state;
    int v9 = 134218240;
    int64_t v10 = a3;
    __int16 v11 = 2048;
    int64_t v12 = state;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "setting state to: %ld, from: %ld",  (uint8_t *)&v9,  0x16u);
  }

  int64_t v8 = self->_state;
  self->_int64_t state = a3;
  -[CSDConversation _handleStateChanged:oldState:](self, "_handleStateChanged:oldState:", a3, v8);
}

- (void)_handleStateChanged:(int64_t)a3 oldState:(int64_t)a4
{
  if (a3 != a4)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantBlobTracker](self, "localParticipantBlobTracker"));
    [v4 handleConversationStateUpdated];
  }

- (void)_cleanUpHandoffMetricsIfNecessary
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation addedHandoffParticipantToTime](self, "addedHandoffParticipantToTime"));
  id v4 = [v3 count];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation removedHandoffParticipantToTime](self, "removedHandoffParticipantToTime"));
  id v6 = [v5 count];

  id v7 = sub_1001704C4();
  int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134218240;
    id v25 = v4;
    __int16 v26 = 2048;
    id v27 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "cleanUpHandoffMetrics: addedHandoffParticipantToTimeCount: %lu, removedHandoffParticipantToTimeCount: %lu",  (uint8_t *)&v24,  0x16u);
  }

  int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v4)
  {
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v4));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v10,  @"kCSDConversationAddedParticipantCount");
  }

  if (v6)
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v6));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v11,  @"kCSDConversationRemovedParticipantCount");
  }

  if (-[NSMutableDictionary count](v9, "count"))
  {
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
    [v12 handoffReportReceived:v9 forConversation:v13];
  }

  int v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  removedHandoffParticipants = self->_removedHandoffParticipants;
  self->_removedHandoffParticipants = v14;

  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  addedHandoffParticipants = self->_addedHandoffParticipants;
  self->_addedHandoffParticipants = v16;

  id v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  startAddingHandoffParticipantToTime = self->_startAddingHandoffParticipantToTime;
  self->_startAddingHandoffParticipantToTime = v18;

  id v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  addedHandoffParticipantToTime = self->_addedHandoffParticipantToTime;
  self->_addedHandoffParticipantToTime = v20;

  __int128 v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  removedHandoffParticipantToTime = self->_removedHandoffParticipantToTime;
  self->_removedHandoffParticipantToTime = v22;
}

- (void)cleanUpIDSSessionState
{
  if ((id)-[CSDConversation state](self, "state") == (id)4)
  {
    -[CSDConversation _cancelTimeoutForLeavingConversation](self, "_cancelTimeoutForLeavingConversation");
    -[CSDConversation _restartIDSSessionIfNecessary](self, "_restartIDSSessionIfNecessary");
    -[CSDConversation setState:](self, "setState:", 0LL);
  }

  else if (-[CSDConversation state](self, "state"))
  {
    -[CSDConversation setState:](self, "setState:", 4LL);
    -[CSDConversation _beginTimeoutForLeavingConversationWithReason:]( self,  "_beginTimeoutForLeavingConversationWithReason:",  @"Cleaning up from AVCSession failure.");
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    [v3 leaveGroupSessionWithContext:0];
  }

- (void)_beginTimeoutForLeavingConversationWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation timeoutBlock](self, "timeoutBlock"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation timeoutBlock](self, "timeoutBlock"));
    dispatch_block_cancel(v7);
  }

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000351DC;
  block[3] = &unk_1003D7CB0;
  objc_copyWeak(&v16, &location);
  id v8 = v4;
  id v15 = v8;
  dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
  -[CSDConversation setTimeoutBlock:](self, "setTimeoutBlock:", v9);

  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
  dispatch_time_t v11 = dispatch_time(0, 1000000000 * (void)[v10 sessionCleanupTimeout]);
  int64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation timeoutBlock](self, "timeoutBlock"));
  dispatch_after(v11, v12, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_cancelTimeoutForLeavingConversation
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation timeoutBlock](self, "timeoutBlock"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation timeoutBlock](self, "timeoutBlock"));
    dispatch_block_cancel(v5);

    -[CSDConversation setTimeoutBlock:](self, "setTimeoutBlock:", 0LL);
  }

- (void)_endCallIfNecessary
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
  unsigned __int8 v5 = [v4 isNoConversationParticipantEndCallEnabled];

  if ((v5 & 1) != 0)
  {
    if ((id)-[CSDConversation state](self, "state") != (id)3) {
      return;
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
    if ([v6 count])
    {

LABEL_9:
      dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation noConversationParticipantTimeoutBlock]( self,  "noConversationParticipantTimeoutBlock"));

      if (!v11) {
        return;
      }
      int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation noConversationParticipantTimeoutBlock]( self,  "noConversationParticipantTimeoutBlock"));
      dispatch_block_cancel(v12);

      -[CSDConversation setNoConversationParticipantTimeoutBlock:]( self,  "setNoConversationParticipantTimeoutBlock:",  0LL);
      id v13 = sub_1001704C4();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "_endCallIfNecessary: Cancel noConversationParticipantTimeoutBlock",  (uint8_t *)buf,  2u);
      }

      goto LABEL_12;
    }

    dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeParticipantDestinationsByIdentifier]( self,  "activeParticipantDestinationsByIdentifier"));
    id v10 = [v9 count];

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation noConversationParticipantTimeoutBlock]( self,  "noConversationParticipantTimeoutBlock"));
    if (v15)
    {
      id v16 = sub_1001704C4();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "_endCallIfNecessary: noConversationParticipantTimeout is running, return",  (uint8_t *)buf,  2u);
      }

- (void)_showLetMeInUIIfNecessary
{
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
  unsigned __int8 v4 = [v3 isLetMeInRequestUIForUnknownParticipantEnabled];

  if ((v4 & 1) == 0)
  {
    id v39 = sub_1001704C4();
    __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "disable showLetMeInUI due to server over-ride",  buf,  2u);
    }

    goto LABEL_40;
  }

  if ((id)-[CSDConversation state](self, "state") == (id)3)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));

    if (v5)
    {
      id v49 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue( -[CSDConversation activeParticipantDestinationsByIdentifier]( self,  "activeParticipantDestinationsByIdentifier"));
      id v52 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
      if (v52)
      {
        uint64_t v51 = *(void *)v58;
        do
        {
          for (i = 0LL; i != v52; i = (char *)i + 1)
          {
            if (*(void *)v58 != v51) {
              objc_enumerationMutation(obj);
            }
            id v7 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
            id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeParticipantDestinationsByIdentifier]( self,  "activeParticipantDestinationsByIdentifier"));
            dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

            id v10 = -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier");
            if (v10 != [v7 unsignedLongLongValue])
            {
              dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier"));
              int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v7]);
              BOOL v13 = v12 || v9 == 0LL;
              BOOL v14 = !v13;

              if (v14)
              {
                id v56 = 0LL;
                uint64_t v15 = IDSCopyTokenAndIDForTokenWithID(v9, &v56);
                id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
                id v17 = v56;
                id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 _stripFZIDPrefix]);
                uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v18));

                id v20 = -[TUConversationMember initWithHandle:]( objc_alloc(&OBJC_CLASS___TUConversationMember),  "initWithHandle:",  v19);
                unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
                __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 handle]);
                dispatch_time_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v9));
                unsigned __int8 v24 = [v22 isEquivalentToHandle:v23];

                if ((v24 & 1) == 0)
                {
                  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMemberHandles](self, "remoteMemberHandles"));
                  unsigned __int8 v26 = [v25 containsObject:v19];

                  if ((v26 & 1) == 0) {
                    -[NSMutableSet addObject:](v49, "addObject:", v20);
                  }
                }
              }
            }
          }

          id v52 = [obj countByEnumeratingWithState:&v57 objects:v67 count:16];
        }

        while (v52);
      }

      if (-[NSMutableSet count](v49, "count"))
      {
        id v27 = sub_1001704C4();
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingRemoteMembers](self, "pendingRemoteMembers"));
          unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
          os_signpost_id_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 handle]);
          *(_DWORD *)buf = 138412802;
          id v62 = v49;
          __int16 v63 = 2112;
          id v64 = v29;
          __int16 v65 = 2112;
          id v66 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "add pending remote members: %@ to %@, localMember: %@",  buf,  0x20u);
        }

        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingRemoteMembers](self, "pendingRemoteMembers"));
        id v33 = -[NSMutableSet copy](v49, "copy");
        [v32 unionSet:v33];
      }

      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingRemoteMembers](self, "pendingRemoteMembers"));
      BOOL v35 = [v34 count] == 0;

      int v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation letMeInRequestUINotificationBlock](self, "letMeInRequestUINotificationBlock"));
      if (v35)
      {
        if (v36)
        {
          id v41 = sub_1001704C4();
          __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "No pendingRemoteMembers, cancel letMeInRequestUINotificationBlock",  buf,  2u);
          }

          id v43 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation letMeInRequestUINotificationBlock]( self,  "letMeInRequestUINotificationBlock"));
          dispatch_block_cancel(v43);

          -[CSDConversation setLetMeInRequestUINotificationBlock:](self, "setLetMeInRequestUINotificationBlock:", 0LL);
        }
      }

      else if (v36)
      {
        id v37 = sub_1001704C4();
        __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "waiting till existing letMeInRequestUINotification completes",  buf,  2u);
        }
      }

      else
      {
        objc_initWeak((id *)buf, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100035EB0;
        block[3] = &unk_1003D7DF0;
        objc_copyWeak(&v55, (id *)buf);
        dispatch_block_t v44 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
        -[CSDConversation setLetMeInRequestUINotificationBlock:](self, "setLetMeInRequestUINotificationBlock:", v44);

        id v45 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
        dispatch_time_t v46 = dispatch_time(0, 1000000000 * (void)[v45 letMeInRequestUINotificationGracePeriod]);
        unsigned int v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
        int v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation letMeInRequestUINotificationBlock](self, "letMeInRequestUINotificationBlock"));
        dispatch_after(v46, v47, v48);

        objc_destroyWeak(&v55);
        objc_destroyWeak((id *)buf);
      }

      __int16 v40 = (os_log_s *)v49;
LABEL_40:
    }
  }

- (void)_requestAVCBlobsIfNecessary
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if ((id)-[CSDConversation state](self, "state") == (id)3)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeParticipantDestinationsByIdentifier]( self,  "activeParticipantDestinationsByIdentifier"));
    id v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v23;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v7);
          dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier"));
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);
          if (v10
            || (id v11 = -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier"),
                v11 == [v8 unsignedLongLongValue]))
          {
          }

          else
          {
            int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation inflightAVCBlobRecoveryBlocksByIdentifier]( self,  "inflightAVCBlobRecoveryBlocksByIdentifier"));
            BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);
            BOOL v14 = v13 == 0LL;

            if (v14)
            {
              objc_initWeak(&location, self);
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
              dispatch_time_t v16 = dispatch_time(0, 1000000000 * (void)[v15 AVCBlobRecoveryGracePeriod]);
              id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_10003657C;
              block[3] = &unk_1003D7CB0;
              objc_copyWeak(&v20, &location);
              void block[4] = v8;
              dispatch_after(v16, v17, block);

              objc_destroyWeak(&v20);
              objc_destroyWeak(&location);
            }
          }

          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v18 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
        id v5 = v18;
      }

      while (v18);
    }
  }

- (void)_removeMemberFromPendingMemberListForParticipant:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation link](self, "link"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation memberWithHandle:](self, "memberWithHandle:", v7));

    if (v8)
    {
      dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingRemoteMembers](self, "pendingRemoteMembers"));
      unsigned int v10 = [v9 containsObject:v8];

      if (v10)
      {
        id v11 = sub_1001704C4();
        int64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingRemoteMembers](self, "pendingRemoteMembers"));
          int v15 = 138412546;
          dispatch_time_t v16 = v8;
          __int16 v17 = 2112;
          id v18 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "remove %@ from pendingRemoteMembers: %@",  (uint8_t *)&v15,  0x16u);
        }

        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingRemoteMembers](self, "pendingRemoteMembers"));
        [v14 removeObject:v8];
      }
    }
  }
}

- (void)_cancelInFlightAVCBlobRecoveryIfNecessary
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation inflightAVCBlobRecoveryBlocksByIdentifier]( self,  "inflightAVCBlobRecoveryBlocksByIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);

  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v20 = v7;
    do
    {
      unsigned int v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v10);
        int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation serverProvidedParticipantIdentifiers]( self,  "serverProvidedParticipantIdentifiers",  v20));
        if ([v12 containsObject:v11])
        {
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier"));
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

          if (!v14) {
            goto LABEL_13;
          }
        }

        else
        {
        }

        id v15 = sub_1001704C4();
        dispatch_time_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v20;
          uint64_t v26 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Cancelling in flight AVC blob recovery for participant with identifier %@",  buf,  0xCu);
        }

        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation inflightAVCBlobRecoveryBlocksByIdentifier]( self,  "inflightAVCBlobRecoveryBlocksByIdentifier"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v11]);
        dispatch_block_cancel(v18);

        uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation inflightAVCBlobRecoveryBlocksByIdentifier]( self,  "inflightAVCBlobRecoveryBlocksByIdentifier"));
        [v19 setObject:0 forKeyedSubscript:v11];

LABEL_13:
        unsigned int v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v8);
  }
}

- (void)_pruneRemoteParticipantsIfNecessary
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (!-[CSDConversation isWaitingToPruneParticipants](self, "isWaitingToPruneParticipants"))
  {
    -[CSDConversation setWaitingToPruneParticipants:](self, "setWaitingToPruneParticipants:", 1LL);
    objc_initWeak(&location, self);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
    dispatch_time_t v5 = dispatch_time(0, 1000000000 * (void)[v4 activeParticipantPruningTimeout]);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100036F48;
    block[3] = &unk_1003D7CB0;
    objc_copyWeak(&v8, &location);
    void block[4] = self;
    dispatch_after(v5, v6, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

- (void)refreshActiveParticipantsList
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation participantRefreshBlock](self, "participantRefreshBlock"));
  if (v4)
  {
    dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation participantRefreshBlock](self, "participantRefreshBlock"));
    dispatch_block_cancel(v5);
  }

  objc_initWeak(&location, self);
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  BOOL v13 = sub_1000373F4;
  BOOL v14 = &unk_1003D7DF0;
  objc_copyWeak(&v15, &location);
  dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0LL, &v11);
  -[CSDConversation setParticipantRefreshBlock:](self, "setParticipantRefreshBlock:", v6, v11, v12, v13, v14);

  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
  dispatch_time_t v8 = dispatch_time(0, (int64_t)[v7 activeParticipantRefreshDelay]);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation participantRefreshBlock](self, "participantRefreshBlock"));
  dispatch_after(v8, v9, v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_reportConversationFailedWithFailureReason:(int64_t)a3 providerEndedReason:(unint64_t)a4
{
  __int128 v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
  -[CXCallFailureContext setFailureReason:](v9, "setFailureReason:", a3);
  -[CXCallFailureContext setProviderEndedReason:](v9, "setProviderEndedReason:", a4);
  -[CSDConversation setFailureContext:](self, "setFailureContext:", v9);
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v8 conversation:self failedWithContext:v9];
}

- (void)_reportConversationFailedWithProviderEndedReason:(unint64_t)a3
{
  dispatch_time_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v7 = objc_alloc_init(&OBJC_CLASS___CXCallFailureContext);
  -[CXCallFailureContext setProviderEndedReason:](v7, "setProviderEndedReason:", a3);
  -[CXCallFailureContext setFailureReason:](v7, "setFailureReason:", a3);
  -[CSDConversation setFailureContext:](self, "setFailureContext:", v7);
  dispatch_block_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v6 conversation:self failedWithContext:v7];
}

- (id)_stableExpanseIdentifier
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation messagesGroupUUID](self, "messagesGroupUUID"));
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  if ([v5 length])
  {
    unsigned __int8 v6 = -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled");

    if ((v6 & 1) == 0)
    {
      __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation messagesGroupUUID](self, "messagesGroupUUID"));
      dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      -[NSMutableArray addObject:](v3, "addObject:", v8);

      goto LABEL_12;
    }
  }

  else
  {
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMemberHandles](self, "remoteMemberHandles", 0LL));
  id v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) normalizedValue]);
        -[NSMutableArray addObject:](v3, "addObject:", v13);

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v10);
  }

- (void)_registerPluginsIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  unsigned int v4 = [v3 isJoined];

  if (v4)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipantsByPluginName](self, "virtualParticipantsByPluginName"));
    dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"PubSub"]);
    if (v5)
    {
    }

    else
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessions](self, "activitySessions"));
      id v7 = [v6 count];

      if (v7)
      {
        uint64_t v11 = IDSGroupSessionPluginNameKey;
        uint64_t v12 = @"PubSub";
        dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
        [v9 registerPluginWithOptions:v8];
      }
    }
  }

- (void)switchBackToOneToOneIfPossible
{
}

- (void)switchBackToOneToOneIfPossibleUsingDelay:(BOOL)a3
{
  BOOL v72 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation downgradeToOneToOneAfterDelayBlock](self, "downgradeToOneToOneAfterDelayBlock"));

  unsigned int v4 = self;
  if (v3)
  {
    dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation downgradeToOneToOneAfterDelayBlock](self, "downgradeToOneToOneAfterDelayBlock"));
    dispatch_block_cancel(v5);

    unsigned int v4 = self;
    -[CSDConversation setDowngradeToOneToOneAfterDelayBlock:](self, "setDowngradeToOneToOneAfterDelayBlock:", 0LL);
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](v4, "remoteMembers"));
  id v73 = [v6 count];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
  dispatch_time_t v8 = (char *)[v7 count];
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantsByIdentifier]( self,  "activeLightweightParticipantsByIdentifier"));
  id v10 = [v9 count];

  int64_t v74 = -[CSDConversation activeRemoteParticipantCountMinusEligibleAVLess]( self,  "activeRemoteParticipantCountMinusEligibleAVLess");
  id v11 = sub_1001704C4();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219264;
    *(void *)unsigned int v89 = -[CSDConversation state](self, "state");
    *(_WORD *)&v89[8] = 1024;
    unsigned int v90 = -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
    __int16 v91 = 2048;
    id v92 = v73;
    __int16 v93 = 2048;
    __int128 v94 = &v8[(void)v10];
    __int16 v95 = 2048;
    int64_t v96 = v74;
    __int16 v97 = 1024;
    BOOL v98 = v72;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Checking if oneToOne->1 downgrade available with state: %tu oneToOneMode: %d remoteMemberCount: %lu activeRemotePa rticipantCount: %lu activeRemoteParticipantCountMinusEligibleAVLess: %lu useDelay: %d",  buf,  0x36u);
  }

  id v13 = sub_1001704C4();
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants"));
    *(_DWORD *)buf = 138412290;
    *(void *)unsigned int v89 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "activeRemoteParticipantsByIdentifier: %@",  buf,  0xCu);
  }

  if (-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
  {
    id v16 = sub_1001704C4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Returning - isOneToOneModeEnabled is already true",  buf,  2u);
    }

- (void)continueHandoffAudioRouteForIdentifier:(unint64_t)a3 participantLeft:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation audioRoutesByParticipantIdentifier](self, "audioRoutesByParticipantIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  id v11 = sub_1001704C4();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v13)
    {
      int v17 = 134217984;
      unint64_t v18 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Did not retrieve a route identifier for participant identifier %llu",  (uint8_t *)&v17,  0xCu);
    }

    goto LABEL_8;
  }

  if (v13)
  {
    int v17 = 138412546;
    unint64_t v18 = (unint64_t)v10;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Retrieved route identifier %@ for participant identifier %llu",  (uint8_t *)&v17,  0x16u);
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSDHandoffAudioController continueHandoffAudioRouteNotification]( &OBJC_CLASS___CSDHandoffAudioController,  "continueHandoffAudioRouteNotification"));
  [v14 postNotificationName:v15 object:v10];

  if (v4)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDConversation audioRoutesByParticipantIdentifier]( self,  "audioRoutesByParticipantIdentifier"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    -[os_log_s setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", 0LL, v16);

LABEL_8:
  }
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

- (void)updateConversationParticipantToHaveMatchingSiriDisplayName:(id)a3
{
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 handle]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
        if ([v10 isEquivalentToHandle:v11])
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 handle]);
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 siriDisplayName]);
          id v14 = [v13 length];

          if (v14)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 handle]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 siriDisplayName]);
            int v17 = (void *)objc_claimAutoreleasedReturnValue([v4 handle]);
            [v17 setSiriDisplayName:v16];

            goto LABEL_12;
          }
        }

        else
        {
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }

- (void)_generateHandoffReportIfNecessaryForUpdatedParticipantID:(unint64_t)a3 isAddParticipant:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    __int128 v53 = 0uLL;
    __int128 v54 = 0uLL;
    __int128 v51 = 0uLL;
    __int128 v52 = 0uLL;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation addedHandoffParticipants](self, "addedHandoffParticipants"));
    id v8 = [v7 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v52;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          if ([v12 identifier] == (id)a3)
          {
            uint64_t v18 = objc_claimAutoreleasedReturnValue(-[CSDConversation addedHandoffParticipantToTime](self, "addedHandoffParticipantToTime"));
            goto LABEL_22;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v51 objects:v64 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    __int128 v49 = 0uLL;
    __int128 v50 = 0uLL;
    *((void *)&v47 + 1) = 0LL;
    __int128 v48 = 0uLL;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation removedHandoffParticipants](self, "removedHandoffParticipants", 0LL));
    id v13 = [v7 countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v48;
      while (2)
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v48 != v15) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
          if ([v12 identifier] == (id)a3)
          {
            uint64_t v18 = objc_claimAutoreleasedReturnValue(-[CSDConversation removedHandoffParticipantToTime](self, "removedHandoffParticipantToTime"));
LABEL_22:
            __int128 v19 = (void *)v18;
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 handle]);
            [v19 setObject:v20 forKey:v21];

            id v17 = v12;
            goto LABEL_23;
          }
        }

        id v14 = [v7 countByEnumeratingWithState:&v47 objects:v63 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }

  id v17 = 0LL;
LABEL_23:

  if (v17)
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v17 handle]);
    id v23 = sub_1001704C4();
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v25 = @"NO";
      *(_DWORD *)buf = 134218498;
      unint64_t v58 = a3;
      __int16 v59 = 2112;
      if (v4) {
        BOOL v25 = @"YES";
      }
      __int128 v60 = v25;
      __int16 v61 = 2112;
      unsigned int v62 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "updatedParticipantID: %llu, isAddParticipant: %@, handle: %@",  buf,  0x20u);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation addedHandoffParticipantToTime](self, "addedHandoffParticipantToTime"));
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allKeys]);
    if ([v27 containsObject:v22])
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation removedHandoffParticipantToTime](self, "removedHandoffParticipantToTime"));
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allKeys]);
      if ([v29 containsObject:v22])
      {
        unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation startAddingHandoffParticipantToTime]( self,  "startAddingHandoffParticipantToTime"));
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 allKeys]);
        unsigned int v32 = [v31 containsObject:v22];

        if (!v32)
        {
LABEL_36:

          goto LABEL_37;
        }

        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation addedHandoffParticipants](self, "addedHandoffParticipants"));
        [v33 removeObject:v17];

        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation removedHandoffParticipants](self, "removedHandoffParticipants"));
        [v34 removeObject:v17];

        v55[0] = @"kCSDConversationStartAddingParticipant";
        BOOL v35 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation startAddingHandoffParticipantToTime]( self,  "startAddingHandoffParticipantToTime"));
        int v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v22]);
        v56[0] = v36;
        v55[1] = @"kCSDConversationAddedParticipant";
        unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation addedHandoffParticipantToTime](self, "addedHandoffParticipantToTime"));
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v22]);
        v56[1] = v38;
        v55[2] = @"kCSDConversationRemovedParticipant";
        id v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation removedHandoffParticipantToTime](self, "removedHandoffParticipantToTime"));
        __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v22]);
        v56[2] = v40;
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  3LL));

        id v41 = sub_1001704C4();
        __int16 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v58 = (unint64_t)v26;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "handoff report: %@", buf, 0xCu);
        }

        unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
        int v44 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
        [v43 handoffReportReceived:v26 forConversation:v44];

        id v45 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation startAddingHandoffParticipantToTime]( self,  "startAddingHandoffParticipantToTime"));
        [v45 removeObjectForKey:v22];

        id v46 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation addedHandoffParticipantToTime](self, "addedHandoffParticipantToTime"));
        [v46 removeObjectForKey:v22];

        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation removedHandoffParticipantToTime](self, "removedHandoffParticipantToTime"));
        [v27 removeObjectForKey:v22];
      }

      else
      {
      }
    }

    goto LABEL_36;
  }

- (void)postSharePlayActivityDidChangeNotificationIfNecessary:(id)a3
{
  id v9 = a3;
  if ((id)-[CSDConversation state](self, "state") == (id)3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v9 activity]);
    unsigned __int8 v5 = [v4 isSystemActivity];

    if ((v5 & 1) == 0)
    {
      if (![v9 isLocallyInitiated]
        || (id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 activity]),
            unsigned __int8 v7 = [v6 isScreenSharingActivity],
            v6,
            (v7 & 1) == 0))
      {
        if (([v9 isLocallyInitiated] & 1) == 0)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          [v8 postNotificationName:@"CSDSharePlayRemoteActivityDidChangeNotification" object:self];
        }
      }
    }
  }
}

- (void)_applyUpdateFromDataBlobForRemoteParticipant:(id)a3 participantIdentifier:(unint64_t)a4
{
  id v15 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  if (v8)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 capabilities]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v15 capabilities]);
    if ([v10 isEqualToCapabilities:v11])
    {
      unsigned int v12 = [v8 isSpatialPersonaEnabled];
      unsigned int v13 = [v15 isSpatialPersonaEnabled];

      if (v12 == v13) {
        goto LABEL_7;
      }
    }

    else
    {
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v15 capabilities]);
    [v8 setCapabilities:v14];

    objc_msgSend(v8, "setSpatialPersonaEnabled:", objc_msgSend(v15, "isSpatialPersonaEnabled"));
    objc_msgSend(v8, "setSpatialPersonaGenerationCounter:", objc_msgSend(v15, "spatialPersonaGenerationCounter"));
    [v9 conversation:self updatedActiveParticipant:v8];
  }

- (BOOL)isScreenSharingInitiationAvailable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation sharePlaySystemStateObserver](self, "sharePlaySystemStateObserver"));
  unsigned __int8 v3 = [v2 allowScreenSharingInitiation];

  return v3;
}

- (void)session:(id)a3 didJoinGroup:(BOOL)a4 participantIdentifiers:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001704C4();
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v13, v14);

  id v16 = sub_1001704C4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = v17;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v30[0]) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_END,  v15,  "idsSessionJoin",  "",  (uint8_t *)v30,  2u);
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation report](self, "report"));
  -[CSDConversation _emitRTCConnectionSetupEvent:participantIdentifier:]( self,  "_emitRTCConnectionSetupEvent:participantIdentifier:",  2,  objc_msgSend( v19,  "hashForParticipantIdentifier:",  -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier")));

  id v20 = sub_1001704C4();
  __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v30[0] = 67109378;
    v30[1] = v7;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "didJoinGroup: %d error: %@",  (uint8_t *)v30,  0x12u);
  }

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  if (v7)
  {
    -[CSDConversation setMemberIdentifiers:](self, "setMemberIdentifiers:", v9);
    -[CSDConversation _startAVCSessionIfNecessary](self, "_startAVCSessionIfNecessary");
    -[CSDConversation setLocalParticipantAudioVideoMode:presentationMode:]( self,  "setLocalParticipantAudioVideoMode:presentationMode:",  -[CSDConversation avMode](self, "avMode"),  -[CSDConversation presentationMode](self, "presentationMode"));
    -[CSDConversation createScreenCapturePickerIfNecessary](self, "createScreenCapturePickerIfNecessary");
    if ((id)-[CSDConversation state](self, "state") == (id)2)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
      if ([v23 isLightweightMember])
      {

LABEL_14:
        id v27 = sub_1001704C4();
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v30[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Joining conversation without AVC session for lightweight device",  (uint8_t *)v30,  2u);
        }

        -[CSDConversation setState:](self, "setState:", 3LL);
        -[CSDConversation setHasJoined:](self, "setHasJoined:", 1LL);
        -[CSDConversation createContentSharingSessionIfNecessary](self, "createContentSharingSessionIfNecessary");
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained conversationChanged:self];

        -[CSDConversation _launchApplicationsForActivitiesIfNecessary]( self,  "_launchApplicationsForActivitiesIfNecessary");
        goto LABEL_17;
      }

      unint64_t v26 = -[CSDConversation avMode](self, "avMode");

      if (!v26) {
        goto LABEL_14;
      }
    }

- (void)session:(id)a3 didLeaveGroupWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didLeaveGroupWithError: %@", buf, 0xCu);
  }

  if (v7)
  {
    id v12 = sub_1001704C4();
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      *(_DWORD *)buf = 138412802;
      id v40 = v6;
      __int16 v41 = 2112;
      __int16 v42 = v33;
      __int16 v43 = 2112;
      id v44 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "CSDIDSGroupSession %@ failed to leave group for conversation UUID %@: %@",  buf,  0x20u);
    }
  }

  [v9 conversationDidLeave:self];
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        __int128 v19 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        [v19 setStreamToken:0];
        [v19 setScreenToken:0];
        [v19 setCaptionsToken:0];
      }

      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v16);
  }

  id v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  virtualParticipantsByPluginName = self->_virtualParticipantsByPluginName;
  self->_virtualParticipantsByPluginName = v20;

  -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 0LL);
  -[CSDConversation _stopAVCSession](self, "_stopAVCSession");
  -[CSDConversation setSplitSessionSecondary:](self, "setSplitSessionSecondary:", 0LL);
  __int128 v22 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[CSDConversation setPendingRemoteMembers:](self, "setPendingRemoteMembers:", v22);

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation letMeInRequestUINotificationBlock](self, "letMeInRequestUINotificationBlock"));
  if (v23)
  {
    id v24 = sub_1001704C4();
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Cancel letMeInRequestUINotificationBlock",  buf,  2u);
    }

    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation letMeInRequestUINotificationBlock](self, "letMeInRequestUINotificationBlock"));
    dispatch_block_cancel(v26);

    -[CSDConversation setLetMeInRequestUINotificationBlock:](self, "setLetMeInRequestUINotificationBlock:", 0LL);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  [v27 resetSessions];

  self->_spatialPersonaEnabled = 0;
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  unsigned int v29 = [v28 isLightweightMember];

  if (v29) {
    [v9 conversationInvalidated:self];
  }
  uint64_t v30 = objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  if (!v30
    || (__int16 v31 = (void *)v30, v32 = -[CSDConversation isAudioReady](self, "isAudioReady"),
                           v31,
                           (v32 & 1) == 0))
  {
    -[CSDConversation setAvcSession:](self, "setAvcSession:", 0LL);
    -[CSDConversation setState:](self, "setState:", 0LL);
    -[CSDConversation _cancelTimeoutForLeavingConversation](self, "_cancelTimeoutForLeavingConversation");
    if (!v7) {
      -[CSDConversation _reportConversationFailedWithProviderEndedReason:]( self,  "_reportConversationFailedWithProviderEndedReason:",  528LL);
    }
    -[CSDConversation _cleanUpHandoffMetricsIfNecessary](self, "_cleanUpHandoffMetricsIfNecessary");
    -[CSDConversation _restartIDSSessionIfNecessary](self, "_restartIDSSessionIfNecessary");
  }

  [v9 conversationChanged:self];
}

- (void)session:(id)a3 endedWithError:(id)a4 reason:(unsigned int)a5
{
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    unsigned int v24 = -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
    int v26 = 138413058;
    id v27 = v7;
    __int16 v28 = 1024;
    unsigned int v29 = a5;
    __int16 v30 = 1024;
    unsigned int v31 = v24;
    __int16 v32 = 2048;
    id v33 = [v25 count];
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "endedWithError: %@ reason: %d, isOneToOneModeEnabled: %d, remoteMembers count: %lu",  (uint8_t *)&v26,  0x22u);
  }

  -[CSDConversation setAvcSession:](self, "setAvcSession:", 0LL);
  -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 0LL);
  id v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  virtualParticipantsByPluginName = self->_virtualParticipantsByPluginName;
  self->_virtualParticipantsByPluginName = v12;

  -[CSDConversation _cancelTimeoutForLeavingConversation](self, "_cancelTimeoutForLeavingConversation");
  -[CSDConversation _cleanUpHandoffMetricsIfNecessary](self, "_cleanUpHandoffMetricsIfNecessary");
  -[CSDConversation setSplitSessionSecondary:](self, "setSplitSessionSecondary:", 0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  [v14 resetSessions];

  self->_spatialPersonaEnabled = 0;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  unsigned int v16 = [v15 isLightweightMember];

  if (v16) {
    [v9 conversationInvalidated:self];
  }
  if (a5 == 44)
  {
    id v17 = sub_1001704C4();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Kicked from the conversation, cleaning up",  (uint8_t *)&v26,  2u);
    }

    -[CSDConversation _cleanUpConversation](self, "_cleanUpConversation");
    -[CSDConversation _reportConversationFailedWithFailureReason:providerEndedReason:]( self,  "_reportConversationFailedWithFailureReason:providerEndedReason:",  7LL,  2044LL);
  }

  else if (-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled") {
         && (__int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers")),
  }
             id v20 = [v19 count],
             v19,
             v20 == (id)1))
  {
    id v21 = sub_1001704C4();
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "U + 1, no need to recreate session, cleaning up",  (uint8_t *)&v26,  2u);
    }

    -[CSDConversation _cleanUpConversation](self, "_cleanUpConversation");
  }

  else
  {
    -[CSDConversation _reportConversationFailedWithProviderEndedReason:]( self,  "_reportConversationFailedWithProviderEndedReason:",  a5 + 2000);
    if (v7)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
      [v23 restart];
    }
  }

  -[CSDConversation setState:](self, "setState:", 0LL);
  [v9 conversationChanged:self];
}

- (void)updateParticipantsWithDestinationIdentifiers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeParticipants](self, "activeParticipants", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v11 identifier]));
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v12]);

        if (v13) {
          [v11 setActiveIDSDestination:v13];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

- (void)reviveOrInvalidateCachedConversationIfNecessary
{
  id v2 = self;
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[CSDConversation isFromStorage](v2, "isFromStorage"))
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[CSDConversation serverProvidedParticipantIdentifiers](v2, "serverProvidedParticipantIdentifiers"));
    if (v4)
    {
      unsigned __int8 v5 = (void *)v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation serverProvidedLightweightParticipantIdentifiers]( v2,  "serverProvidedLightweightParticipantIdentifiers"));

      if (v6)
      {
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](v2, "delegate"));
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue( -[CSDConversation serverProvidedLightweightParticipantIdentifiers]( v2,  "serverProvidedLightweightParticipantIdentifiers"));
        id v39 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v39)
        {
          uint64_t v38 = *(void *)v46;
          __int128 v36 = v2;
          do
          {
            for (i = 0LL; i != v39; i = (char *)i + 1)
            {
              if (*(void *)v46 != v38) {
                objc_enumerationMutation(obj);
              }
              uint64_t v8 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)i);
              uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantDestinationsByIdentifier]( v2,  "activeLightweightParticipantDestinationsByIdentifier"));
              id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

              if (v10)
              {
                uint64_t v40 = v8;
                __int128 v43 = 0u;
                __int128 v44 = 0u;
                __int128 v41 = 0u;
                __int128 v42 = 0u;
                id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](v2, "lightweightMembers"));
                id v12 = [v11 countByEnumeratingWithState:&v41 objects:v53 count:16];
                if (v12)
                {
                  id v13 = v12;
                  uint64_t v14 = *(void *)v42;
LABEL_12:
                  uint64_t v15 = 0LL;
                  while (1)
                  {
                    if (*(void *)v42 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    __int128 v16 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
                    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handle]);
                    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v10));
                    unsigned __int8 v19 = [v17 isEquivalentToHandle:v18];

                    if ((v19 & 1) != 0) {
                      break;
                    }
                    if (v13 == (id)++v15)
                    {
                      id v13 = [v11 countByEnumeratingWithState:&v41 objects:v53 count:16];
                      if (v13) {
                        goto LABEL_12;
                      }
                      goto LABEL_18;
                    }
                  }

                  id v20 = v16;

                  id v2 = v36;
                  uint64_t v8 = v40;
                  if (v20) {
                    goto LABEL_21;
                  }
                }

                else
                {
LABEL_18:

                  id v2 = v36;
                  uint64_t v8 = v40;
                }
              }

              [v37 addObject:v8];
              id v20 = 0LL;
LABEL_21:
            }

            id v39 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
          }

          while (v39);
        }

        id v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation serverProvidedParticipantIdentifiers]( v2,  "serverProvidedParticipantIdentifiers"));
        if ([v21 count])
        {
        }

        else
        {
          id v22 = [v37 count];

          if (!v22)
          {
            id v31 = sub_1001704C4();
            __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            __int16 v30 = v34;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](v2, "UUID"));
              *(_DWORD *)buf = 138412290;
              __int128 v50 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Invalidating cached conversation: %@, no remote active participants were found.",  buf,  0xCu);
            }

            [v34 conversationInvalidated:v2];
            goto LABEL_29;
          }
        }

        id v23 = sub_1001704C4();
        unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](v2, "UUID"));
          int v26 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeParticipantDestinationsByIdentifier]( v2,  "activeParticipantDestinationsByIdentifier"));
          id v27 = (char *)[v26 count];
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation serverProvidedLightweightParticipantIdentifiers]( v2,  "serverProvidedLightweightParticipantIdentifiers"));
          id v29 = [v28 count];
          *(_DWORD *)buf = 138412546;
          __int128 v50 = v25;
          __int16 v51 = 2048;
          __int128 v52 = &v27[(void)v29];
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Activating cached conversation with UUID: %@ since %lu remote participants were still found to be active.",  buf,  0x16u);
        }

        -[CSDConversation setFromStorage:](v2, "setFromStorage:", 0LL);
        __int16 v30 = v34;
        [v34 conversationChanged:v2];
LABEL_29:
      }
    }
  }

- (void)session:(id)a3 receivedActiveParticipantDestinationsByIdentifier:(id)a4
{
  id v35 = a3;
  id v36 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v36 allKeys]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  -[CSDConversation setServerProvidedParticipantIdentifiers:](self, "setServerProvidedParticipantIdentifiers:", v8);

  -[CSDConversation setActiveParticipantDestinationsByIdentifier:]( self,  "setActiveParticipantDestinationsByIdentifier:",  v36);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation recentlyLeftParticipantIdentifiers](self, "recentlyLeftParticipantIdentifiers"));
  [v9 removeAllObjects];

  if (!-[CSDConversation _endScreenCallIfNecessary](self, "_endScreenCallIfNecessary"))
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v10 = v36;
    id v11 = [v10 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (!v11) {
      goto LABEL_21;
    }
    uint64_t v12 = *(void *)v41;
    while (1)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v14]);

        if (v16)
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v14]);
          [v16 setActiveIDSDestination:v17];

          id v18 = -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier");
          if (v18 == [v16 identifier])
          {
            id v19 = sub_1001704C4();
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v45 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Found cached pending-participant, do not add local participant: %@",  buf,  0xCu);
            }

            id v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
            [v21 removeObjectForKey:v14];
          }

          else
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
            if ([v22 controlMessageOverQREnabled])
            {
              id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
              unsigned __int8 v24 = [v23 isControlMessageOverQREnabled];

              if ((v24 & 1) != 0)
              {
                objc_initWeak((id *)buf, self);
                BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
                dispatch_time_t v26 = dispatch_time(0, 1000000 * (void)[v25 addParticipantFromQRTime]);
                id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472LL;
                block[2] = sub_10003A31C;
                block[3] = &unk_1003D7E40;
                objc_copyWeak(&v39, (id *)buf);
                void block[4] = self;
                void block[5] = v14;
                id v38 = v16;
                dispatch_after(v26, v27, block);

                objc_destroyWeak(&v39);
                objc_destroyWeak((id *)buf);
                goto LABEL_19;
              }
            }

            else
            {
            }

            id v28 = sub_1001704C4();
            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v45 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Found cached pending-participant, adding as active-participant, csdParticipant: %@",  buf,  0xCu);
            }

            -[CSDConversation addActiveParticipant:](self, "addActiveParticipant:", v16);
            __int16 v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
            [v30 removeObjectForKey:v14];
          }
        }

- (void)session:(id)a3 receivedActiveLightweightParticipantDestinationsByIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  -[CSDConversation setServerProvidedLightweightParticipantIdentifiers:]( self,  "setServerProvidedLightweightParticipantIdentifiers:",  v8);

  -[CSDConversation setActiveLightweightParticipantDestinationsByIdentifier:]( self,  "setActiveLightweightParticipantDestinationsByIdentifier:",  v5);
  if (!-[CSDConversation _endScreenCallIfNecessary](self, "_endScreenCallIfNecessary"))
  {
    -[CSDConversation reviveOrInvalidateCachedConversationIfNecessary]( self,  "reviveOrInvalidateCachedConversationIfNecessary");
    -[CSDConversation _pruneRemoteParticipantsIfNecessary](self, "_pruneRemoteParticipantsIfNecessary");
  }

- (void)sessionDidTerminate:(id)a3
{
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  -[CSDConversation setState:](self, "setState:", 0LL);
  -[CSDConversation _cancelTimeoutForLeavingConversation](self, "_cancelTimeoutForLeavingConversation");
  -[CSDConversation _cleanUpHandoffMetricsIfNecessary](self, "_cleanUpHandoffMetricsIfNecessary");
  -[CSDConversation _restartIDSSessionIfNecessary](self, "_restartIDSSessionIfNecessary");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v5 conversationChanged:self];
}

- (void)session:(id)a3 didReceiveLocalParticipantType:(unsigned __int16)a4 error:(id)a5
{
  int v5 = a4;
  id v7 = (__CFString *)a5;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      int v49 = 138412546;
      __int128 v50 = v11;
      __int16 v51 = 2112;
      __int128 v52 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Requested audio/video mode changed for conversation %@ failed with error %@",  (uint8_t *)&v49,  0x16u);
    }

    goto LABEL_54;
  }

  if ((id)-[CSDConversation state](self, "state") == (id)2 || (id)-[CSDConversation state](self, "state") == (id)3)
  {
    if (v5 == 1)
    {
      if ((id)-[CSDConversation avMode](self, "avMode") == (id)1
        || (id)-[CSDConversation avMode](self, "avMode") == (id)2)
      {
        id v18 = sub_1001704C4();
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v49) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Configuring session since local participant type is Normal",  (uint8_t *)&v49,  2u);
        }

        unint64_t v20 = -[CSDConversation avMode](self, "avMode");
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        [v21 setAudioEnabled:1];
        [v21 setVideo:v20 == 2];
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));

        if (v22)
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
          objc_msgSend(v21, "setVideoEnabled:", objc_msgSend(v23, "BOOLValue"));
        }

        id v24 = sub_1001704C4();
        BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v49) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "broadcastLocalParticipantData since we transitioned to AVMode",  (uint8_t *)&v49,  2u);
        }

        -[CSDConversation broadcastLocalParticipantData](self, "broadcastLocalParticipantData");
        if (-[CSDConversation usesAudioSession](self, "usesAudioSession")
          && (dispatch_time_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession")),
              unsigned int v27 = [v26 isAudioReady],
              v26,
              !v27))
        {
          id v36 = sub_1001704C4();
          __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            if (-[CSDConversation usesAudioSession](self, "usesAudioSession")) {
              id v38 = @"YES";
            }
            else {
              id v38 = @"NO";
            }
            id v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
            else {
              __int128 v40 = @"NO";
            }
            int v49 = 138412546;
            __int128 v50 = v38;
            __int16 v51 = 2112;
            __int128 v52 = v40;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Not starting audio, usesAudioSession: %@, audioReady: %@",  (uint8_t *)&v49,  0x16u);
          }
        }

        else
        {
          id v28 = sub_1001704C4();
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            if (-[CSDConversation usesAudioSession](self, "usesAudioSession")) {
              __int16 v30 = @"YES";
            }
            else {
              __int16 v30 = @"NO";
            }
            id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
            else {
              __int16 v32 = @"NO";
            }
            int v49 = 138412546;
            __int128 v50 = v30;
            __int16 v51 = 2112;
            __int128 v52 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Starting audio, usesAudioSession: %@, audioReady: %@",  (uint8_t *)&v49,  0x16u);
          }

          -[CSDConversation startAudio](self, "startAudio");
        }

        goto LABEL_53;
      }
    }

    else if (!v5 && !-[CSDConversation avMode](self, "avMode"))
    {
      id v12 = sub_1001704C4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (-[CSDConversation avcSessionInProgress](self, "avcSessionInProgress")) {
          uint64_t v14 = @"YES";
        }
        else {
          uint64_t v14 = @"NO";
        }
        uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        int v49 = 138412546;
        __int128 v50 = v14;
        __int16 v51 = 2112;
        __int128 v52 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Stopping session since local participant type is Lightweight avcSessionInProgress %@ avcSession: %@",  (uint8_t *)&v49,  0x16u);
      }

      if (-[CSDConversation avcSessionInProgress](self, "avcSessionInProgress"))
      {
        -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 0LL);
        -[CSDConversation _stopAVCSession](self, "_stopAVCSession");
      }

      else
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        if (v35)
        {
        }

        else
        {
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
          unsigned __int8 v43 = [v42 isLightweightMember];

          if ((v43 & 1) == 0)
          {
            id v44 = sub_1001704C4();
            __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v49) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Downgraded from AV -> AVLess, but didn't have AVCSession yet. Creating an AVCSession.",  (uint8_t *)&v49,  2u);
            }

            __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation setupNewAVCSession:]( self,  "setupNewAVCSession:",  -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled")));
            -[CSDConversation setAvcSession:](self, "setAvcSession:", v46);

            -[CSDConversation setExpectedVideoPaused:](self, "setExpectedVideoPaused:", 0LL);
            -[CSDConversation setExpectedAudioEnabled:](self, "setExpectedAudioEnabled:", 0LL);
            -[CSDConversation setExpectedVideoEnabled:](self, "setExpectedVideoEnabled:", 0LL);
            -[CSDConversation setExpectedScreenEnabled:](self, "setExpectedScreenEnabled:", 0LL);
            id v47 = sub_1001704C4();
            __int128 v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v49) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Rebroadcasting AVC data to other members of this group to since we transitioned to lightweight and setup a new AVCSession.",  (uint8_t *)&v49,  2u);
            }

            -[CSDConversation broadcastLocalParticipantData](self, "broadcastLocalParticipantData");
          }
        }
      }

- (void)_updateParticipantTypesForAddedParticipant:(id)a3
{
  id v4 = a3;
  -[CSDConversation setRemoteParticipantType:participant:]( self,  "setRemoteParticipantType:participant:",  [v4 audioVideoMode] != 0,  v4);
}

- (void)setRemoteParticipantType:(unsigned __int16)a3 participant:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned int v8 = [v7 avLessSharePlayEnabled];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation _allMembers](self, "_allMembers"));
    id v10 = sub_1001704C4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "setRemoteParticipantType for existing members: %@",  (uint8_t *)&v13,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    [v12 setParticipantType:v4 forParticipant:v6 members:v9 isLocalParticipant:0];

    -[CSDConversation _addParticipantsWaitingToBeAddedToAVCSession]( self,  "_addParticipantsWaitingToBeAddedToAVCSession");
  }
}

- (void)updateOneToOneModeForParticipantUpdateType:(unsigned __int16)a3 participant:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 identifier]));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier"));
    id v11 = [v10 count];
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantsByIdentifier]( self,  "activeLightweightParticipantsByIdentifier"));
    int v13 = (char *)[v12 count];

    if (&v13[(void)v11]) {
      BOOL v14 = (id)-[CSDConversation activeRemoteParticipantCountMinusEligibleAVLess]( self,  "activeRemoteParticipantCountMinusEligibleAVLess") == (id)1;
    }
    else {
      BOOL v14 = -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
    }
    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 67109634;
      *(_DWORD *)__int16 v32 = v4;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v6;
      __int16 v33 = 1024;
      BOOL v34 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "type: %d participant: %@, shouldSetOneToOneModeEnabled: %d",  (uint8_t *)&v31,  0x18u);
    }

    if (v4 == 1)
    {
      id v29 = sub_1001704C4();
      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 138412290;
        *(void *)__int16 v32 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Adding participant: %@",  (uint8_t *)&v31,  0xCu);
      }

      -[CSDConversation _addRemoteParticipantToAVCSessionIfPossible:]( self,  "_addRemoteParticipantToAVCSessionIfPossible:",  v6);
      if (-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled") && !v14) {
        -[CSDConversation setOneToOneModeEnabled:](self, "setOneToOneModeEnabled:", 0LL);
      }
    }

    else if (!v4)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pendingRemovedRemoteParticipantByIdentififer:", objc_msgSend(v6, "identifier")));

      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
      unsigned int v22 = objc_msgSend(v21, "containsRemoteParticipantWithIdentifier:", objc_msgSend(v6, "identifier"));

      id v23 = sub_1001704C4();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 67109376;
        *(_DWORD *)__int16 v32 = v20 != 0LL;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "isRemovingParticipantWithIdentifier: %d containsRemoteParticipantWithIdentifier: %d",  (uint8_t *)&v31,  0xEu);
      }

      id v25 = sub_1001704C4();
      dispatch_time_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v20 || ((v22 ^ 1) & 1) != 0)
      {
        if (v27)
        {
          int v31 = 138412290;
          *(void *)__int16 v32 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Ignoring to remove participant %@ since its in pending list",  (uint8_t *)&v31,  0xCu);
        }
      }

      else
      {
        if (v27)
        {
          int v31 = 138412290;
          *(void *)__int16 v32 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Removing participant %@",  (uint8_t *)&v31,  0xCu);
        }

        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        [v28 removeParticipant:v6];

        if (!-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled") && v14) {
          -[CSDConversation switchBackToOneToOneIfPossibleUsingDelay:]( self,  "switchBackToOneToOneIfPossibleUsingDelay:",  1LL);
        }
      }
    }
  }

  else
  {
    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No participant found on the conversation",  (uint8_t *)&v31,  2u);
    }
  }
}

- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  if ([v9 controlMessageOverQREnabled])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
    unsigned __int8 v11 = [v10 isControlMessageOverQREnabled];

    if ((v11 & 1) != 0)
    {
      if (-[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier") == a4)
      {
        id v12 = sub_1001704C4();
        int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v46 = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Do not add local participant: %llu",  buf,  0xCu);
        }

        BOOL v14 = (CSDMessagingConversationParticipant *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a4));
        -[CSDMessagingConversationParticipant removeObjectForKey:](v14, "removeObjectForKey:", v15);
        goto LABEL_16;
      }

      if (v7)
      {
        BOOL v14 = -[CSDMessagingConversationParticipant initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipant),  "initWithData:",  v7);
        -[CSDMessagingConversationParticipant setIdentifier:](v14, "setIdentifier:", a4);
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeParticipantDestinationsByIdentifier]( self,  "activeParticipantDestinationsByIdentifier"));
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a4));
        unsigned int v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v21]);

        id v44 = 0LL;
        uint64_t v23 = IDSCopyTokenAndIDForTokenWithID(v22, &v44);
        id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        id v25 = v44;
        dispatch_time_t v26 = (void *)objc_claimAutoreleasedReturnValue([v24 _stripFZIDPrefix]);
        BOOL v27 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v26));

        if (v27)
        {
          id v43 = v25;
          id v28 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v27));
          -[CSDMessagingConversationParticipant setHandle:](v14, "setHandle:", v28);

          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipant csdConversationParticipant]( v14,  "csdConversationParticipant"));
          id v30 = sub_1001704C4();
          int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          __int16 v32 = v31;
          if (v29)
          {
            __int128 v42 = v22;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v46 = (unint64_t)v29;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "add csdParticipant: %@ to active participant",  buf,  0xCu);
            }

            -[CSDConversation addActiveParticipant:](self, "addActiveParticipant:", v29);
            __int16 v33 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
            BOOL v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a4));
            __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v34]);

            if (v32)
            {
              id v35 = sub_1001704C4();
              id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v37 = (__CFString *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
                *(_DWORD *)buf = 134218242;
                unint64_t v46 = a4;
                __int16 v47 = 2112;
                __int128 v48 = v37;
                _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "remove participantID: %llu from pendingConversationParticipantsByIdentifier %@",  buf,  0x16u);
              }

              id v38 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
              id v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a4));
              [v38 removeObjectForKey:v39];
            }

            unsigned int v22 = v42;
          }

          else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            sub_1002B2620((uint64_t)v14, a4, v32);
          }

          id v25 = v43;
        }

        else
        {
          id v41 = sub_1001704C4();
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218754;
            unint64_t v46 = a4;
            __int16 v47 = 2112;
            __int128 v48 = v22;
            __int16 v49 = 2112;
            id v50 = v25;
            __int16 v51 = 2112;
            __int128 v52 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Couldn't find handle for participantID: %llu, participantDestination: %@, participantToken: %@, participantURI: %@",  buf,  0x2Au);
          }
        }
      }

      else
      {
        id v40 = sub_1001704C4();
        BOOL v14 = (CSDMessagingConversationParticipant *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "no valid clientContext, return",  buf,  2u);
        }
      }

      goto LABEL_17;
    }
  }

  else
  {
  }

  id v16 = sub_1001704C4();
  BOOL v14 = (CSDMessagingConversationParticipant *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
    else {
      id v17 = @"NO";
    }
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
    else {
      id v19 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    unint64_t v46 = (unint64_t)v17;
    __int16 v47 = 2112;
    __int128 v48 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "didReceiveJoinedParticipantID: feature flag of controlMessageOverQREnabled: %@, server bag of isControlMessageOver QREnabled: %@, return",  buf,  0x16u);

LABEL_16:
  }

- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  if (([v9 controlMessageOverQREnabled] & 1) == 0)
  {

LABEL_7:
    id v15 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
      else {
        id v17 = @"NO";
      }
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
      else {
        id v19 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      unint64_t v39 = (unint64_t)v17;
      __int16 v40 = 2112;
      id v41 = (id)v19;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "feature flag of controlMessageOverQREnabled: %@, server bag of isControlMessageOverQREnabled: %@, return",  buf,  0x16u);
    }

    goto LABEL_30;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
  unsigned __int8 v11 = [v10 isControlMessageOverQREnabled];

  if ((v11 & 1) == 0) {
    goto LABEL_7;
  }
  if (v7)
  {
    id v12 = -[CSDMessagingConversationParticipantDidLeaveContext initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipantDidLeaveContext),  "initWithData:",  v7);
    uint64_t v32 = (int)-[os_log_s leaveReason](v12, "leaveReason");
    id v13 = sub_1001704C4();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v39 = a4;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "ParticipantId %llu left with leave context %@",  buf,  0x16u);
    }
  }

  else
  {
    id v20 = sub_1001704C4();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v39 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "ParticipantID %llu left without providing leave context",  buf,  0xCu);
    }

    uint64_t v32 = 0LL;
    id v12 = 0LL;
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation activeParticipants](self, "activeParticipants"));
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    while (2)
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        dispatch_time_t v26 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        if ([v26 identifier] == (id)a4)
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingConversationParticipantsByIdentifier]( self,  "pendingConversationParticipantsByIdentifier"));
          id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a4));
          [v29 removeObjectForKey:v30];

          int v31 = (void *)objc_claimAutoreleasedReturnValue([v26 handle]);
          -[CSDConversation removeParticipantWithIdentifier:fromHandle:withReason:]( self,  "removeParticipantWithIdentifier:fromHandle:withReason:",  a4,  v31,  v32);

          id v28 = (os_log_s *)v21;
          goto LABEL_29;
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  id v27 = sub_1001704C4();
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v39 = a4;
    __int16 v40 = 2112;
    id v41 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Couldn't find participantID %llu from active participant list: %@",  buf,  0x16u);
  }

- (void)session:(id)a3 didReceiveReport:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
  [v8 idsReportsReceived:v5 forConversation:v7];
}

- (void)session:(id)a3 didReceiveKickedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7
{
  int v7 = a6;
  id v102 = a4;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v132 = (unint64_t)v102;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didReceiveKickedParticipantIDs: %@", buf, 0xCu);
  }

  if (a5 - 4 < 2)
  {
    id v36 = sub_1001704C4();
    __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v132) = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[WARN] resetting state, IDSGroupSessionMemberManagementCode: %d",  buf,  8u);
    }

    -[CSDConversation setKickMemberRetryCount:](self, "setKickMemberRetryCount:", 0LL);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[CSDConversation setPendingKickedMembersByIdentifier:](self, "setPendingKickedMembersByIdentifier:", v38);
    goto LABEL_70;
  }

  if (a5 == 2)
  {
    unint64_t v39 = -[CSDConversation kickMemberRetryCount](self, "kickMemberRetryCount");
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
    id v41 = [v40 maxKickMemberRetries];

    if (v39 >= (unint64_t)v41)
    {
      id v55 = sub_1001704C4();
      id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
        id v58 = [v57 maxActiveParticipantFetchRetries];
        *(_DWORD *)buf = 134217984;
        unint64_t v132 = (unint64_t)v58;
        _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not retrying to kickMembers, max retry count (%lu) reached",  buf,  0xCu);
      }

      goto LABEL_71;
    }

    if (v7 == 2)
    {
      id v88 = sub_1001704C4();
      unsigned int v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v90 = -[CSDConversation kickMemberRetryCount](self, "kickMemberRetryCount");
        __int16 v91 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingAllowedMembers](self, "pendingAllowedMembers"));
        *(_DWORD *)buf = 134218242;
        unint64_t v132 = v90;
        __int16 v133 = 2112;
        id v134 = v91;
        _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "Retrying allowed members: retries: %lu pendingAllowedMembers: %@",  buf,  0x16u);
      }

      __int128 v107 = 0u;
      __int128 v108 = 0u;
      __int128 v105 = 0u;
      __int128 v106 = 0u;
      id v92 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingAllowedMembers](self, "pendingAllowedMembers"));
      id v46 = [v92 copy];

      id v93 = [v46 countByEnumeratingWithState:&v105 objects:v127 count:16];
      if (v93)
      {
        id v94 = v93;
        uint64_t v95 = *(void *)v106;
        do
        {
          for (i = 0LL; i != v94; i = (char *)i + 1)
          {
            if (*(void *)v106 != v95) {
              objc_enumerationMutation(v46);
            }
            -[CSDConversation _allowMember:]( self,  "_allowMember:",  *(void *)(*((void *)&v105 + 1) + 8LL * (void)i));
          }

          id v94 = [v46 countByEnumeratingWithState:&v105 objects:v127 count:16];
        }

        while (v94);
      }
    }

    else
    {
      if (v7 != 1)
      {
LABEL_82:
        -[CSDConversation setKickMemberRetryCount:]( self,  "setKickMemberRetryCount:",  (char *)-[CSDConversation kickMemberRetryCount](self, "kickMemberRetryCount") + 1);
        goto LABEL_71;
      }

      id v42 = sub_1001704C4();
      id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v44 = -[CSDConversation kickMemberRetryCount](self, "kickMemberRetryCount");
        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingKickedMembersByIdentifier](self, "pendingKickedMembersByIdentifier"));
        *(_DWORD *)buf = 134218242;
        unint64_t v132 = v44;
        __int16 v133 = 2112;
        id v134 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Retrying kicked members: retries: %lu pendingKickedMembers: %@",  buf,  0x16u);
      }

      __int128 v111 = 0u;
      __int128 v112 = 0u;
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      id v46 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingKickedMembersByIdentifier](self, "pendingKickedMembersByIdentifier"));
      id v47 = [v46 countByEnumeratingWithState:&v109 objects:v128 count:16];
      if (v47)
      {
        id v48 = v47;
        uint64_t v49 = *(void *)v110;
        do
        {
          for (j = 0LL; j != v48; j = (char *)j + 1)
          {
            if (*(void *)v110 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v109 + 1) + 8LL * (void)j);
            __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingKickedMembersByIdentifier]( self,  "pendingKickedMembersByIdentifier"));
            __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v51]);

            __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
            [v54 kickMember:v53];
          }

          id v48 = [v46 countByEnumeratingWithState:&v109 objects:v128 count:16];
        }

        while (v48);
      }
    }

    goto LABEL_82;
  }

  if (!a5)
  {
    -[CSDConversation setKickMemberRetryCount:](self, "setKickMemberRetryCount:", 0LL);
    if (v7 == 2)
    {
      __int16 v59 = objc_alloc(&OBJC_CLASS___NSMutableSet);
      __int128 v60 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingAllowedMembers](self, "pendingAllowedMembers"));
      v104 = -[NSMutableSet initWithSet:](v59, "initWithSet:", v60);

      id obja = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v102 count]);
      __int16 v99 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v102 count]);
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      __int128 v119 = 0u;
      __int128 v120 = 0u;
      __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation kickedParticipants](self, "kickedParticipants"));
      id v62 = [v61 countByEnumeratingWithState:&v117 objects:v130 count:16];
      if (v62)
      {
        id v63 = v62;
        uint64_t v64 = *(void *)v118;
        do
        {
          for (k = 0LL; k != v63; k = (char *)k + 1)
          {
            if (*(void *)v118 != v64) {
              objc_enumerationMutation(v61);
            }
            id v66 = *(void **)(*((void *)&v117 + 1) + 8LL * (void)k);
            unint64_t v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v66 identifier]));
            unsigned int v68 = [v102 containsObject:v67];

            if (v68)
            {
              unsigned int v69 = objc_alloc(&OBJC_CLASS___TUConversationMember);
              id v70 = (void *)objc_claimAutoreleasedReturnValue([v66 handle]);
              uint64_t v71 = -[TUConversationMember initWithHandle:](v69, "initWithHandle:", v70);

              -[NSMutableSet addObject:](v99, "addObject:", v66);
              -[NSMutableSet addObject:](obja, "addObject:", v71);
              -[NSMutableSet removeObject:](v104, "removeObject:", v71);
            }
          }

          id v63 = [v61 countByEnumeratingWithState:&v117 objects:v130 count:16];
        }

        while (v63);
      }

      -[CSDConversation setKickedMembers:](self, "setKickedMembers:", obja);
      BOOL v72 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingAllowedMembers](self, "pendingAllowedMembers"));
      [v72 minusSet:v104];

      id v73 = sub_1001704C4();
      int64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        id v75 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation kickedMembers](self, "kickedMembers"));
        *(_DWORD *)buf = 138412290;
        unint64_t v132 = (unint64_t)v75;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "updating kickedMembers to %@", buf, 0xCu);
      }

      id v76 = sub_1001704C4();
      id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v78 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingAllowedMembers](self, "pendingAllowedMembers"));
        *(_DWORD *)buf = 138412290;
        unint64_t v132 = (unint64_t)v78;
        _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "updating pendingAllowedMembers to %@",  buf,  0xCu);
      }

      __int128 v79 = objc_alloc_init(&OBJC_CLASS___NSSet);
      id v19 = v104;
      -[CSDConversation addRemoteMembers:otherInvitedHandles:triggeredLocally:]( self,  "addRemoteMembers:otherInvitedHandles:triggeredLocally:",  v104,  v79,  1LL);

      __int128 v115 = 0u;
      __int128 v116 = 0u;
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingAllowedMembers](self, "pendingAllowedMembers"));
      id v81 = [v80 copy];

      id v82 = [v81 countByEnumeratingWithState:&v113 objects:v129 count:16];
      if (v82)
      {
        id v83 = v82;
        uint64_t v84 = *(void *)v114;
        do
        {
          for (m = 0LL; m != v83; m = (char *)m + 1)
          {
            if (*(void *)v114 != v84) {
              objc_enumerationMutation(v81);
            }
            -[CSDConversation _allowMember:]( self,  "_allowMember:",  *(void *)(*((void *)&v113 + 1) + 8LL * (void)m));
          }

          id v83 = [v81 countByEnumeratingWithState:&v113 objects:v129 count:16];
        }

        while (v83);
      }
    }

    else if (v7 == 1)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lightweightMembers](self, "lightweightMembers"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 setByAddingObjectsFromSet:v14]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 allObjects]);

      BOOL v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v102 count]));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation memberIdentifiers](self, "memberIdentifiers"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v17));

      id v19 = (void *)v16;
      __int128 v125 = 0u;
      __int128 v126 = 0u;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      id obj = v102;
      id v20 = [obj countByEnumeratingWithState:&v123 objects:v137 count:16];
      if (v20)
      {
        id v22 = v20;
        uint64_t v23 = *(void *)v124;
        *(void *)&__int128 v21 = 138412802LL;
        __int128 v97 = v21;
        v103 = v19;
        do
        {
          for (n = 0LL; n != v22; n = (char *)n + 1)
          {
            if (*(void *)v124 != v23) {
              objc_enumerationMutation(obj);
            }
            id v25 = *(void **)(*((void *)&v123 + 1) + 8LL * (void)n);
            dispatch_time_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier",  v97));
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v25]);
            id v28 = v27;
            if (v27)
            {
              id v29 = v27;
            }

            else
            {
              id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeLightweightParticipantsByIdentifier]( self,  "activeLightweightParticipantsByIdentifier"));
              id v29 = (id)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v25]);

              id v19 = v103;
            }

            [v18 removeObject:v25];
            int v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation pendingKickedMembersByIdentifier]( self,  "pendingKickedMembersByIdentifier"));
            [v31 removeObjectForKey:v25];

            if (v29)
            {
              v121[0] = _NSConcreteStackBlock;
              v121[1] = 3221225472LL;
              v121[2] = sub_10003C714;
              v121[3] = &unk_1003D7E68;
              id v32 = v29;
              id v122 = v32;
              __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tu_firstObjectPassingTest:", v121));
              if (v33)
              {
                [v98 addObject:v33];
              }

              else
              {
                id v34 = sub_1001704C4();
                __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v97;
                  unint64_t v132 = (unint64_t)v25;
                  __int16 v133 = 2112;
                  id v134 = v32;
                  __int16 v135 = 2112;
                  unint64_t v136 = v103;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "When kicking participantID %@ we found participant %@ with no member in %@",  buf,  0x20u);
                }

                id v19 = v103;
              }
            }
          }

          id v22 = [obj countByEnumeratingWithState:&v123 objects:v137 count:16];
        }

        while (v22);
      }

      -[CSDConversation setMemberIdentifiers:](self, "setMemberIdentifiers:", v18);
      -[CSDConversation removeRemoteMembers:triggeredLocally:](self, "removeRemoteMembers:triggeredLocally:", v98, 0LL);
    }

    else
    {
      id v86 = sub_1001704C4();
      int64_t v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v132) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "[WARN] didReceiveKickedParticipantIDstype: %hu unexpected",  buf,  8u);
      }

      id v19 = v87;
    }

    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v38 conversationChanged:self];
LABEL_70:
  }

- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IDSGroupSessionParticipantIdentifierKey]);
  id v8 = [v7 unsignedLongLongValue];

  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IDSGroupSessionPluginNameKey]);
  if (!-[__CFString length](v10, "length"))
  {

    id v10 = @"PubSub";
  }

  id v9 = [[TUConversationVirtualParticipant alloc] initWithIdentifier:v8 pluginName:v10];
  -[CSDConversation addVirtualParticipant:](self, "addVirtualParticipant:", v9);
}

- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IDSGroupSessionParticipantIdentifierKey]);
  id v8 = [v7 unsignedLongLongValue];

  id v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IDSGroupSessionPluginNameKey]);
  if (!-[__CFString length](v13, "length"))
  {

    id v13 = @"PubSub";
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipantsByPluginName](self, "virtualParticipantsByPluginName"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v13]);
  id v11 = [v10 identifier];

  if (v11 == v8)
  {
    id v12 = [[TUConversationVirtualParticipant alloc] initWithIdentifier:v8 pluginName:v13];
    -[CSDConversation removeVirtualParticipant:](self, "removeVirtualParticipant:", v12);
  }
}

- (void)sessionDidReceiveKeyUpdate:(id)a3
{
  int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
  [v5 refreshDataCryptors];
}

- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5
{
  id v7 = a4;
  id v8 = (os_log_s *)a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v58 = v8;
    __int16 v59 = 2112;
    id v60 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "didReceiveDataBlob for participant: %@, blob %@",  buf,  0x16u);
  }

  id v12 = -[CSDMessagingConversationParticipant initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipant),  "initWithData:",  v7);
  -[CSDMessagingConversationParticipant setIdentifier:]( v12,  "setIdentifier:",  -[os_log_s participantIdentifier](v8, "participantIdentifier"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s participantURI](v8, "participantURI"));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 _stripFZIDPrefix]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v14));

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation pendingKickedMembersByIdentifier](self, "pendingKickedMembersByIdentifier"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[os_log_s participantIdentifier](v8, "participantIdentifier")));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

    if (v18)
    {
      id v19 = sub_1001704C4();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v21 = (os_log_s *)-[os_log_s participantIdentifier](v8, "participantIdentifier");
        *(_DWORD *)buf = 134217984;
        id v58 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[WARN] didReceiveDataBlob not processing because we have a pendingKickedMember with the same identifier: %llu",  buf,  0xCu);
      }

      goto LABEL_34;
    }

    dispatch_time_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation kickedMembers](self, "kickedMembers"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allObjects]);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_10003D04C;
    void v55[3] = &unk_1003D7E68;
    id v28 = v15;
    id v56 = v28;
    unsigned int v29 = objc_msgSend(v27, "tu_containsObjectPassingTest:", v55);

    if (v29)
    {
      id v30 = sub_1001704C4();
      int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[WARN] didReceiveDataBlob not processing because we have a kickedMember with the same handle: %@",  buf,  0xCu);
      }

      goto LABEL_33;
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[CSDMessagingHandle handleWithTUHandle:]( &OBJC_CLASS___CSDMessagingHandle,  "handleWithTUHandle:",  v28));
    -[CSDMessagingConversationParticipant setHandle:](v12, "setHandle:", v32);

    int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipant csdConversationParticipant]( v12,  "csdConversationParticipant"));
    if (!v31)
    {
      id v36 = sub_1001704C4();
      __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1002B2690();
      }
      goto LABEL_32;
    }

    -[CSDConversation _applyUpdateFromDataBlobForRemoteParticipant:participantIdentifier:]( self,  "_applyUpdateFromDataBlobForRemoteParticipant:participantIdentifier:",  v31,  -[os_log_s participantIdentifier](v8, "participantIdentifier"));
    -[CSDConversation updateConversationParticipantToHaveMatchingSiriDisplayName:]( self,  "updateConversationParticipantToHaveMatchingSiriDisplayName:",  v31);
    id v33 = -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier");
    if (v33 == -[os_log_s identifier](v31, "identifier"))
    {
      id v34 = sub_1001704C4();
      __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "didReceiveDataBlob skipped adding local-participant's datablob to the cache, csdConversationParticipant: %@",  buf,  0xCu);
      }

- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6
{
  int v6 = a5;
  id v8 = a6;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "didReceiveData dataType: %u for participant: %@",  (uint8_t *)v14,  0x12u);
  }

  if (v6 != 1)
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002B26F0(v6, v13);
    }
  }
}

- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "didReceiveServerErrorCode: %u",  (uint8_t *)v13,  8u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuActivitySessions](self, "tuActivitySessions"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 anyObject]);

  if (v10)
  {
    +[CSDAnalyticsReporter sendSessionServerTerminatedEventWithActivitySession:code:]( &OBJC_CLASS___CSDAnalyticsReporter,  "sendSessionServerTerminatedEventWithActivitySession:code:",  v10,  v4);
  }

  else
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B2760();
    }
  }
}

- (id)session:(id)a3 conversationParticipantWithParticipantIdentifier:(unint64_t)a4
{
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  return v9;
}

- (id)onlyAvailableSessionConversationParticipant:(id)a3
{
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v8 identifier]));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v9]);

  return v10;
}

- (void)session:(id)a3 didReceiveUnderlyingLinksStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v4) {
      id v8 = @"YES";
    }
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[CSDConversation] didReceiveUnderlyingLinksStatus: %@",  (uint8_t *)&v11,  0xCu);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v10 conversationChanged:self];
}

- (int)_errorToAVCProviderEndedReason:(id)a3 defaultProviderReason:(int)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    id v15 = sub_1001704C4();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67109120;
      int v18 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No error with a failed start from AVC using %d",  (uint8_t *)&v17,  8u);
    }

    goto LABEL_12;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"NSErrorUserInfoDetailedError"]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"NSErrorUserInfoDetailedError"]);
    LODWORD(v8) = [v10 intValue];
  }

  a4 = (_DWORD)v8 + 100 * [v6 code];
  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109632;
    int v18 = a4;
    __int16 v19 = 1024;
    unsigned int v20 = [v6 code];
    __int16 v21 = 1024;
    int v22 = (int)v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "AVCProviderEndReason=%d error.code=%d detailedError=%d",  (uint8_t *)&v17,  0x14u);
  }

  if (!a4)
  {
    id v13 = sub_1001704C4();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67109120;
      int v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "AVCProviderEndReason=%d, this should not happen",  (uint8_t *)&v17,  8u);
    }

    a4 = 518;
LABEL_12:
  }

  return a4;
}

- (void)executeSessionDidStart
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  if (!v3) {
    sub_1002B278C();
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
  if (v4)
  {
    id v5 = sub_1001704C4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Found expectedVideoEnabled: %@, updating value to match state",  (uint8_t *)&v10,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
    id v9 = [v8 BOOLValue];

    -[CSDConversation setExpectedVideoEnabled:](self, "setExpectedVideoEnabled:", 0LL);
    -[CSDConversation setVideoEnabled:](self, "setVideoEnabled:", v9);
  }

  -[CSDConversation switchBackToOneToOneIfPossibleUsingDelay:](self, "switchBackToOneToOneIfPossibleUsingDelay:", 1LL);
  -[CSDConversation createContentSharingSessionIfNecessary](self, "createContentSharingSessionIfNecessary");
  -[CSDConversation _launchApplicationsForActivitiesIfNecessary:]( self,  "_launchApplicationsForActivitiesIfNecessary:",  0LL);
}

- (void)session:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v35[0] = 67109378;
    v35[1] = v5;
    __int16 v36 = 2112;
    id v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didStart: %d error: %@", (uint8_t *)v35, 0x12u);
  }

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v12, v13);

  id v15 = sub_1001704C4();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  int v17 = v16;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v35[0]) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_INTERVAL_END,  v14,  "avcSessionStart",  "",  (uint8_t *)v35,  2u);
  }

  int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation report](self, "report"));
  -[CSDConversation _emitRTCConnectionSetupEvent:participantIdentifier:]( self,  "_emitRTCConnectionSetupEvent:participantIdentifier:",  4,  objc_msgSend( v18,  "hashForParticipantIdentifier:",  -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier")));

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  if (v5)
  {
    if ((id)-[CSDConversation state](self, "state") == (id)2 || (id)-[CSDConversation state](self, "state") == (id)3)
    {
      -[CSDConversation setState:](self, "setState:", 3LL);
      -[CSDConversation setHasJoined:](self, "setHasJoined:", 1LL);
      -[CSDConversation executeSessionDidStart](self, "executeSessionDidStart");
    }

    else
    {
      id v29 = sub_1001704C4();
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1002B27B4();
      }

      -[CSDConversation setState:](self, "setState:", 4LL);
      -[CSDConversation _beginTimeoutForLeavingConversationWithReason:]( self,  "_beginTimeoutForLeavingConversationWithReason:",  @"AVCSession started but we weren't trying to join the conversation.");
      -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 0LL);
      -[CSDConversation _reportConversationFailedWithProviderEndedReason:]( self,  "_reportConversationFailedWithProviderEndedReason:",  -[CSDConversation _errorToAVCProviderEndedReason:defaultProviderReason:]( self,  "_errorToAVCProviderEndedReason:defaultProviderReason:",  v7,  515LL));
      -[CSDConversation _stopAVCSession](self, "_stopAVCSession");
    }

    goto LABEL_29;
  }

  id v20 = sub_1001704C4();
  __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1002B280C();
  }

  -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 0LL);
  -[CSDConversation setAvcSession:](self, "setAvcSession:", 0LL);
  int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  if ([v22 conversationOneToOneModeEnabled]
    && -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
  {
    int64_t v23 = -[CSDConversation state](self, "state");

    if (v23 == 4)
    {
      id v24 = sub_1001704C4();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1002B27E0();
      }

      -[CSDConversation setState:](self, "setState:", 0LL);
      goto LABEL_29;
    }
  }

  else
  {
  }

  dispatch_time_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned int v27 = [v26 avLessSharePlayEnabled];
  if (v7 || !v27 || (id)-[CSDConversation state](self, "state") != (id)3 || -[CSDConversation avMode](self, "avMode"))
  {

    goto LABEL_24;
  }

  int v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteMembers](self, "remoteMembers"));
  id v32 = [v31 count];

  if (v32 != (id)1)
  {
LABEL_24:
    if ((id)-[CSDConversation state](self, "state") != (id)4)
    {
      -[CSDConversation setState:](self, "setState:", 4LL);
      -[CSDConversation _beginTimeoutForLeavingConversationWithReason:]( self,  "_beginTimeoutForLeavingConversationWithReason:",  @"AVCSession failed to start.");
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
      [v28 leaveGroupSessionWithContext:0];

      -[CSDConversation _reportConversationFailedWithProviderEndedReason:]( self,  "_reportConversationFailedWithProviderEndedReason:",  -[CSDConversation _errorToAVCProviderEndedReason:defaultProviderReason:]( self,  "_errorToAVCProviderEndedReason:defaultProviderReason:",  v7,  516LL));
    }

    goto LABEL_29;
  }

  id v33 = sub_1001704C4();
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v35[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "CSDAVCSession failed to start, but there is no error, Ignoring the start failure and leaving conversation intact",  (uint8_t *)v35,  2u);
  }

LABEL_29:
  [v19 conversationChanged:self];
}

- (void)session:(id)a3 didDetectError:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1002B286C();
  }

  if ((id)-[CSDConversation state](self, "state") == (id)3)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation lastRebroadcastTime](self, "lastRebroadcastTime"));
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    if (v12 > (double)-[CSDConversation rebroadcastTimeThreshold](self, "rebroadcastTimeThreshold"))
    {
      id v13 = sub_1001704C4();
      os_signpost_id_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        float v15 = v12;
        int v18 = 134217984;
        double v19 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rebroadcasting AVC data to other members of this group to attempt to recover from error (last rebroadcast time was %f).",  (uint8_t *)&v18,  0xCu);
      }

      -[CSDConversation setLastRebroadcastTime:](self, "setLastRebroadcastTime:", v9);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
      -[CSDConversation setRebroadcastTimeThreshold:]( self,  "setRebroadcastTimeThreshold:",  -[CSDConversation rebroadcastTimeThreshold](self, "rebroadcastTimeThreshold")
      * (void)[v16 rebroadcastTimeThreshold]);

      -[CSDConversation broadcastLocalParticipantData](self, "broadcastLocalParticipantData");
    }
  }

  else
  {
    id v17 = sub_1001704C4();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109120;
      LODWORD(v19) = -[CSDConversation state](self, "state");
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Not attempting to rebroadcast message since state was not in join (was %d)",  (uint8_t *)&v18,  8u);
    }
  }
}

- (void)session:(id)a3 didStopWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    id v29 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CSDAVCSession didStopWithError: %@",  (uint8_t *)&v28,  0xCu);
  }

  if (v7)
  {
    id v11 = [v7 code];
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    os_signpost_id_t v14 = v13;
    if (v11 == (id)32003)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138412290;
        id v29 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "AVCSession %@ stopped for remote hangup. Ignoring this signal.",  (uint8_t *)&v28,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
        int v28 = 138412802;
        id v29 = v6;
        __int16 v30 = 2112;
        int v31 = v27;
        __int16 v32 = 2112;
        id v33 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "AVCSession %@ stopped in failure for conversation UUID %@: %@",  (uint8_t *)&v28,  0x20u);
      }

      -[CSDConversation _cleanUpFromAVCSessionFailure](self, "_cleanUpFromAVCSessionFailure");
      -[CSDConversation _reportConversationFailedWithProviderEndedReason:]( self,  "_reportConversationFailedWithProviderEndedReason:",  -[CSDConversation _errorToAVCProviderEndedReason:defaultProviderReason:]( self,  "_errorToAVCProviderEndedReason:defaultProviderReason:",  v7,  518LL));
    }
  }

  else if (-[CSDConversation avMode](self, "avMode"))
  {
    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "AVCSession %@ stopped, cleaning up IDSSession state",  (uint8_t *)&v28,  0xCu);
    }

    -[CSDConversation cleanUpIDSSessionState](self, "cleanUpIDSSessionState");
  }

  -[CSDConversation setAvcSession:](self, "setAvcSession:", 0LL);
  -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 0LL);
  -[CSDConversation setSetScreenSharingRetryCount:](self, "setSetScreenSharingRetryCount:", 0LL);
  if (!-[CSDConversation avMode](self, "avMode") && (id)-[CSDConversation state](self, "state") == (id)3)
  {
    id v17 = sub_1001704C4();
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "CSDAVCSession stopped for downgrade to AVModeNone, setting up new not started AVCSession",  (uint8_t *)&v28,  2u);
    }

    double v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation setupNewAVCSession:]( self,  "setupNewAVCSession:",  -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled")));
    -[CSDConversation setAvcSession:](self, "setAvcSession:", v19);

    -[CSDConversation setExpectedVideoPaused:](self, "setExpectedVideoPaused:", 0LL);
    -[CSDConversation setExpectedAudioEnabled:](self, "setExpectedAudioEnabled:", 0LL);
    -[CSDConversation setExpectedVideoEnabled:](self, "setExpectedVideoEnabled:", 0LL);
    -[CSDConversation setExpectedScreenEnabled:](self, "setExpectedScreenEnabled:", 0LL);
    id v20 = sub_1001704C4();
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Rebroadcasting AVC data to other members of this group to since we transitioned to lightweight and setup a new AVCSession.",  (uint8_t *)&v28,  2u);
    }

    -[CSDConversation broadcastLocalParticipantData](self, "broadcastLocalParticipantData");
  }

  if (!-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled")
    && !-[CSDConversation isVideo](self, "isVideo"))
  {
    int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
    if ([v22 avLessSharePlayEnabled])
    {
      unint64_t v23 = -[CSDConversation avMode](self, "avMode");

      if (!v23) {
        goto LABEL_31;
      }
    }

    else
    {
    }

    id v24 = sub_1001704C4();
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Setting GFT conversation back to default state of video=1",  (uint8_t *)&v28,  2u);
    }

    -[CSDConversation setVideo:](self, "setVideo:", 1LL);
  }

- (void)serverDisconnectedForSession:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1002B28CC((uint64_t)v4, self);
  }

  -[CSDConversation setAvcSession:](self, "setAvcSession:", 0LL);
  -[CSDConversation setAvcSessionInProgress:](self, "setAvcSessionInProgress:", 0LL);
  if (-[CSDConversation avMode](self, "avMode") || (id)-[CSDConversation state](self, "state") != (id)3)
  {
    -[CSDConversation _cleanUpFromAVCSessionFailure](self, "_cleanUpFromAVCSessionFailure");
    -[CSDConversation _reportConversationFailedWithProviderEndedReason:]( self,  "_reportConversationFailedWithProviderEndedReason:",  13LL);
  }

  else
  {
    id v8 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Detected AVCSession server disconnect, but we're in AVLess. Re-creating an AVCSession and re-distributing blob.",  buf,  2u);
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation setupNewAVCSession:]( self,  "setupNewAVCSession:",  -[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled")));
    -[CSDConversation setAvcSession:](self, "setAvcSession:", v10);

    -[CSDConversation setExpectedVideoPaused:](self, "setExpectedVideoPaused:", 0LL);
    -[CSDConversation setExpectedAudioEnabled:](self, "setExpectedAudioEnabled:", 0LL);
    -[CSDConversation setExpectedVideoEnabled:](self, "setExpectedVideoEnabled:", 0LL);
    -[CSDConversation setExpectedScreenEnabled:](self, "setExpectedScreenEnabled:", 0LL);
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_signpost_id_t v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "serverDisconnectedForSession: broadcastLocalParticipantData",  v14,  2u);
    }

    -[CSDConversation broadcastLocalParticipantData](self, "broadcastLocalParticipantData");
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v13 conversationChanged:self];
}

- (void)session:(id)a3 changedLocalAudioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 67109120;
    int v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "changedLocalAudioEnabled=%d",  (uint8_t *)&v26,  8u);
  }

  if (v9 || !v6)
  {
    id v23 = sub_1001704C4();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109634;
      int v27 = v7;
      __int16 v28 = 1024;
      *(_DWORD *)id v29 = v6;
      *(_WORD *)&uint8_t v29[4] = 2112;
      *(void *)&v29[6] = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to set localAudioEnabled (%d): didSucceed (%d): error: %@",  (uint8_t *)&v26,  0x18u);
    }

    goto LABEL_14;
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioEnabled](self, "expectedAudioEnabled"));
  if (!v13
    || (os_signpost_id_t v14 = (void *)v13,
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioEnabled](self, "expectedAudioEnabled")),
        unsigned int v16 = [v15 BOOLValue],
        v15,
        v14,
        v16 == v7))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v25 conversationChanged:self];

LABEL_14:
    -[CSDConversation setExpectedAudioEnabled:](self, "setExpectedAudioEnabled:", 0LL);
    goto LABEL_15;
  }

  id v17 = sub_1001704C4();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioEnabled](self, "expectedAudioEnabled"));
    int v26 = 67109378;
    int v27 = v7;
    __int16 v28 = 2112;
    *(void *)id v29 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Audio was set to audioEnabled: %d self.expectedAudioEnabled.BOOLValue: %@. Setting audioEnabled to self.expectedAu dioEnabled.BOOLValue",  (uint8_t *)&v26,  0x12u);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioEnabled](self, "expectedAudioEnabled"));
  id v21 = [v20 BOOLValue];
  int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v22 setAudioEnabled:v21];

LABEL_15:
}

- (void)session:(id)a3 changedLocalVideoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 67109120;
    int v34 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "changedLocalVideoEnabled=%d",  (uint8_t *)&v33,  8u);
  }

  if (v9 || !v6)
  {
    id v18 = sub_1001704C4();
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v33 = 67109634;
      int v34 = v7;
      __int16 v35 = 1024;
      *(_DWORD *)__int16 v36 = v6;
      *(_WORD *)&v36[4] = 2112;
      *(void *)&v36[6] = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to set localVideoEnabled (%d): didSucceed (%d): error: %@",  (uint8_t *)&v33,  0x18u);
    }

    if ((id)-[CSDConversation state](self, "state") == (id)3)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
      if (v20)
      {
        id v21 = (void *)v20;
        int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
        if ([v22 BOOLValue])
        {
          unsigned int v23 = +[TUConversationManager allowsVideo](&OBJC_CLASS___TUConversationManager, "allowsVideo");

          if (!v23) {
            goto LABEL_28;
          }
        }

        else
        {
        }

        goto LABEL_27;
      }
    }

    else
    {
      id v24 = sub_1001704C4();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 67109378;
        int v34 = v7;
        __int16 v35 = 2112;
        *(void *)__int16 v36 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Skipping to set localVideoEnabled (%d) error: %@",  (uint8_t *)&v33,  0x12u);
      }
    }
  }

  else
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
    if (v13)
    {
      os_signpost_id_t v14 = (void *)v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
      if ([v15 BOOLValue] == v7)
      {
      }

      else
      {
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
        if (([v16 BOOLValue] & 1) == 0)
        {

LABEL_24:
          id v27 = sub_1001704C4();
          __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
            int v33 = 67109378;
            int v34 = v7;
            __int16 v35 = 2112;
            *(void *)__int16 v36 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Video was set to videoEnabled: %d self.expectedVideoEnabled.BOOLValue: %@. Setting videoEnabled to self.ex pectedVideoEnabled.BOOLValue",  (uint8_t *)&v33,  0x12u);
          }

LABEL_27:
          __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoEnabled](self, "expectedVideoEnabled"));
          id v31 = [v30 BOOLValue];
          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
          [v32 setVideoEnabled:v31];

          goto LABEL_28;
        }

        unsigned int v17 = +[TUConversationManager allowsVideo](&OBJC_CLASS___TUConversationManager, "allowsVideo");

        if (v17) {
          goto LABEL_24;
        }
      }
    }

    int v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v26 conversationChanged:self];

    -[CSDConversation setExpectedVideoEnabled:](self, "setExpectedVideoEnabled:", 0LL);
  }

- (void)session:(id)a3 changedScreenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 67109634;
    int v38 = v7;
    __int16 v39 = 1024;
    *(_DWORD *)uint64_t v40 = v6;
    *(_WORD *)&v40[4] = 2112;
    *(void *)&v40[6] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "changedScreenEnabled=%d didSucceed=%d error %@",  (uint8_t *)&v37,  0x18u);
  }

  if (!v9 && v6)
  {
    -[CSDConversation setSetScreenSharingRetryCount:](self, "setSetScreenSharingRetryCount:", 0LL);
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
    if ([v13 requestToScreenShareEnabled])
    {
    }

    else
    {
      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
      unsigned int v20 = [v19 usesModernScreenSharingFromMessages];

      if (!v20) {
        goto LABEL_18;
      }
    }

    -[CSDConversation fulfillLocalScreenShareRequests](self, "fulfillLocalScreenShareRequests");
    -[CSDConversation addScreenSharingType:](self, "addScreenSharingType:", 1LL);
LABEL_18:
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled"));
    if (v21)
    {
      int v22 = (void *)v21;
      unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled"));
      unsigned int v24 = [v23 BOOLValue];

      if (v24 != v7)
      {
        id v25 = sub_1001704C4();
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled"));
          int v37 = 67109378;
          int v38 = v7;
          __int16 v39 = 2112;
          *(void *)uint64_t v40 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Screen was set to screenEnabled: %d self.expectedScreenEnabled.BOOLValue: %@. Setting screenEnabled to self. expectedScreenEnabled.BOOLValue",  (uint8_t *)&v37,  0x12u);
        }

        goto LABEL_23;
      }
    }

    if ((v7 & 1) == 0)
    {
      -[CSDConversation resetContentSharingSessionContent](self, "resetContentSharingSessionContent");
      -[CSDConversation switchBackToOneToOneIfPossible](self, "switchBackToOneToOneIfPossible");
    }

    int v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v34 conversationChanged:self];

    goto LABEL_28;
  }

  id v14 = sub_1001704C4();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    unint64_t v36 = -[CSDConversation setScreenSharingRetryCount](self, "setScreenSharingRetryCount");
    int v37 = 67109890;
    int v38 = v7;
    __int16 v39 = 1024;
    *(_DWORD *)uint64_t v40 = v6;
    *(_WORD *)&v40[4] = 2112;
    *(void *)&v40[6] = v9;
    __int16 v41 = 2048;
    unint64_t v42 = v36;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to set screenEnabled (%d): didSucceed (%d): error: %@ retry:%lu",  (uint8_t *)&v37,  0x22u);
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled"));
  if (v16)
  {
    if (-[CSDConversation setScreenSharingRetryCount](self, "setScreenSharingRetryCount") <= 2)
    {
      -[CSDConversation setSetScreenSharingRetryCount:]( self,  "setSetScreenSharingRetryCount:",  (char *)-[CSDConversation setScreenSharingRetryCount](self, "setScreenSharingRetryCount") + 1);
LABEL_23:
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled"));
      unsigned int v29 = [v28 BOOLValue];

      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedScreenEnabled](self, "expectedScreenEnabled"));
      id v32 = [v31 BOOLValue];
      if (v29) {
        uint64_t v33 = objc_claimAutoreleasedReturnValue(-[CSDConversation screenShareAttributes](self, "screenShareAttributes"));
      }
      else {
        uint64_t v33 = objc_claimAutoreleasedReturnValue( +[TUCallScreenShareAttributes defaultAttributes]( &OBJC_CLASS___TUCallScreenShareAttributes,  "defaultAttributes"));
      }
      __int16 v35 = (void *)v33;
      [v30 setScreenEnabled:v32 attributes:v33];

      goto LABEL_31;
    }

    id v17 = sub_1001704C4();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1002B2974();
    }

    -[CSDConversation setSetScreenSharingRetryCount:](self, "setSetScreenSharingRetryCount:", 0LL);
LABEL_28:
    -[CSDConversation setExpectedScreenEnabled:](self, "setExpectedScreenEnabled:", 0LL);
  }

- (void)session:(id)a3 changedLocalAudioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 67109120;
    int v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "changedLocalAudioPaused=%d",  (uint8_t *)&v26,  8u);
  }

  if (v9 || !v6)
  {
    id v23 = sub_1001704C4();
    unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109634;
      int v27 = v7;
      __int16 v28 = 1024;
      *(_DWORD *)unsigned int v29 = v6;
      *(_WORD *)&uint8_t v29[4] = 2112;
      *(void *)&v29[6] = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to set localAudioPaused (%d): didSucceed (%d): error: %@",  (uint8_t *)&v26,  0x18u);
    }

    goto LABEL_14;
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioPaused](self, "expectedAudioPaused"));
  if (!v13
    || (id v14 = (void *)v13,
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioPaused](self, "expectedAudioPaused")),
        unsigned int v16 = [v15 BOOLValue],
        v15,
        v14,
        v16 == v7))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v25 conversationChanged:self];

LABEL_14:
    -[CSDConversation setExpectedAudioPaused:](self, "setExpectedAudioPaused:", 0LL);
    goto LABEL_15;
  }

  id v17 = sub_1001704C4();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioPaused](self, "expectedAudioPaused"));
    int v26 = 67109378;
    int v27 = v7;
    __int16 v28 = 2112;
    *(void *)unsigned int v29 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Audio paused was set to audioPaused: %d self.expectedAudioPaused.BOOLValue: %@. Setting audioPaused to self.expect edAudioPaused.BOOLValue",  (uint8_t *)&v26,  0x12u);
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedAudioPaused](self, "expectedAudioPaused"));
  id v21 = [v20 BOOLValue];
  int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v22 setAudioPaused:v21];

LABEL_15:
}

- (void)session:(id)a3 changedLocalVideoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v7 = a4;
  id v9 = a6;
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 67109120;
    int v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "changedLocalVideoPaused=%d",  (uint8_t *)&v26,  8u);
  }

  if (v9 || !v6)
  {
    id v23 = sub_1001704C4();
    unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109634;
      int v27 = v7;
      __int16 v28 = 1024;
      *(_DWORD *)unsigned int v29 = v6;
      *(_WORD *)&uint8_t v29[4] = 2112;
      *(void *)&v29[6] = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to set localVideoPaused (%d): didSucceed (%d): error: %@",  (uint8_t *)&v26,  0x18u);
    }

    goto LABEL_14;
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoPaused](self, "expectedVideoPaused"));
  if (!v13
    || (id v14 = (void *)v13,
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoPaused](self, "expectedVideoPaused")),
        unsigned int v16 = [v15 BOOLValue],
        v15,
        v14,
        v16 == v7))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v25 conversationChanged:self];

LABEL_14:
    -[CSDConversation setExpectedVideoPaused:](self, "setExpectedVideoPaused:", 0LL);
    goto LABEL_15;
  }

  id v17 = sub_1001704C4();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoPaused](self, "expectedVideoPaused"));
    int v26 = 67109378;
    int v27 = v7;
    __int16 v28 = 2112;
    *(void *)unsigned int v29 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Video paused was set to videoPaused: %d self.expectedVideoPaused.BOOLValue: %@. Setting videoPaused to self.expect edVideoPaused.BOOLValue",  (uint8_t *)&v26,  0x12u);
  }

  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation expectedVideoPaused](self, "expectedVideoPaused"));
  id v21 = [v20 BOOLValue];
  int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
  [v22 setVideoPaused:v21];

LABEL_15:
}

- (void)session:(id)a3 requestedOneToOneModeEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = sub_1001704C4();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    LODWORD(v22) = 67109634;
    HIDWORD(v22) = v7;
    *(_WORD *)id v23 = 2112;
    if (v6) {
      uint64_t v13 = @"YES";
    }
    *(void *)&v23[2] = v13;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "requestedOneToOneModeEnabled: %d, didSucceed: %@, error: %@",  (uint8_t *)&v22,  0x1Cu);
  }

  if (v9 || !v6)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSDReportingController sharedInstance]( &OBJC_CLASS___CSDReportingController,  "sharedInstance",  v22,  *(void *)v23));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
    [v15 oneToOneModeSwitchFailureForConversation:v16 isOneToOneMode:v7];
  }

  else if (v7)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v14 conversationChanged:self];
  }

  else
  {
    if (-[CSDConversation isOneToOneHandoffOngoing](self, "isOneToOneHandoffOngoing"))
    {
      id v17 = sub_1001704C4();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "oneToOneModeEnabled is disabled because a 3rd participant that joined is replacing another participant for handoff",  (uint8_t *)&v22,  2u);
      }
    }

    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate", v22, *(void *)v23));
    [v19 conversationChanged:self];

    if (-[CSDConversation isVideoPaused](self, "isVideoPaused") && (id)-[CSDConversation state](self, "state") == (id)3)
    {
      id v20 = sub_1001704C4();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "User requested videoPaused=true in a U+1 call, since we're moving out of U+1 state, setting videoEnabled=false for parity",  (uint8_t *)&v22,  2u);
      }

      -[CSDConversation setVideoEnabled:](self, "setVideoEnabled:", 0LL);
    }
  }
}

- (void)session:(id)a3 changedBytesOfDataUsed:(int64_t)a4
{
  BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int64_t v11 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "changedBytesOfDataUsed=%ld",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v9 conversation:self changedBytesOfDataUsed:a4];
}

- (void)sessionShouldReconnect:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "sessionShouldReconnect=%@",  (uint8_t *)&v16,  0xCu);
  }

  if (!-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
  {
    id v14 = sub_1001704C4();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Skipping reconnect since one to one mode is disabled",  (uint8_t *)&v16,  2u);
    }

    goto LABEL_13;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverProvidedParticipantIdentifiers](self, "serverProvidedParticipantIdentifiers"));
  if ([v8 count] != (id)1)
  {

    goto LABEL_12;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverProvidedParticipantIdentifiers](self, "serverProvidedParticipantIdentifiers"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier")));
  unsigned int v11 = [v9 containsObject:v10];

  if (!v11)
  {
LABEL_12:
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    -[os_log_s reconnect](v15, "reconnect");
LABEL_13:

    goto LABEL_14;
  }

  id v12 = sub_1001704C4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Only local participant presents and media stall for U + 1, end the call",  (uint8_t *)&v16,  2u);
  }

  -[CSDConversation leaveWithReason:](self, "leaveWithReason:", 4LL);
LABEL_14:
}

- (void)session:(id)a3 cameraMixedWithScreenDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "cameraMixedWithScreenDidChange=%d",  (uint8_t *)v10,  8u);
  }

  -[CSDConversation setCameraMixedWithScreen:](self, "setCameraMixedWithScreen:", v4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v9 conversationChanged:self];
}

- (void)session:(id)a3 screenShareAttributesUpdated:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  if (-[CSDConversation isScreenEnabled](self, "isScreenEnabled"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v7 conversation:self screenShareAttributesUpdated:v5];
  }

  else
  {
    id v8 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1002B29A0();
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7
{
  BOOL v10 = a4;
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);

  if (v16)
  {
    [v16 setAudioEnabled:v10];
    [v16 setStreamToken:a5];
    [v16 setScreenToken:a6];
    [v16 setCaptionsToken:a7];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v17 conversation:self updatedActiveParticipant:v16];
  }

  else
  {
    id v18 = sub_1001704C4();
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      unint64_t v21 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unknown participant with identifier: %llu",  (uint8_t *)&v20,  0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedVideoEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7
{
  BOOL v10 = a4;
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);

  if (v16)
  {
    [v16 setVideoEnabled:v10];
    [v16 setStreamToken:a5];
    [v16 setScreenToken:a6];
    [v16 setCaptionsToken:a7];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v17 conversation:self updatedActiveParticipant:v16];

    -[CSDConversation _endScreenCallIfNecessary](self, "_endScreenCallIfNecessary");
  }

  else
  {
    id v18 = sub_1001704C4();
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      unint64_t v21 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unknown participant with identifier: %llu",  (uint8_t *)&v20,  0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedScreenEnabled:(BOOL)a4 streamToken:(int64_t)a5 screenToken:(int64_t)a6 captionsToken:(int64_t)a7
{
  BOOL v10 = a4;
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  if (!v10 || !-[CSDConversation isScreening](self, "isScreening"))
  {
    if (!v16)
    {
      id v24 = sub_1001704C4();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unint64_t v36 = 134217984;
        *(void *)&v36[4] = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unknown participant with identifier: %llu",  v36,  0xCu);
      }

      goto LABEL_29;
    }

    if ([v16 isScreenEnabled] != v10)
    {
      id v20 = sub_1001704C4();
      unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = @"NO";
        *(_DWORD *)unint64_t v36 = 138412802;
        if (v10) {
          uint64_t v22 = @"YES";
        }
        *(void *)&v36[4] = v22;
        __int16 v37 = 2112;
        int v38 = self;
        __int16 v39 = 2112;
        uint64_t v40 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Conversation screen sharing about to change to screen enabled: %@ conversation: %@ \n participant: %@",  v36,  0x20u);
      }

      [v16 setScreenEnabled:v10];
      [v17 conversation:self updatedActiveParticipantWithScreenSharing:v16];
    }

    objc_msgSend(v16, "setStreamToken:", a5, *(void *)v36);
    [v16 setScreenToken:a6];
    [v16 setCaptionsToken:a7];
    [v17 conversation:self updatedActiveParticipant:v16];
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
    if ([v23 requestToScreenShareEnabled])
    {

      if (!v10) {
        goto LABEL_30;
      }
    }

    else
    {
      int v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
      unsigned int v27 = [v26 usesModernScreenSharingFromMessages];

      if (!v27)
      {
        if (!v10) {
          goto LABEL_30;
        }
        goto LABEL_22;
      }

      if (!v10) {
        goto LABEL_30;
      }
    }

    -[CSDConversation fulfillPendingScreenSharingRequestsForRemoteParticipant:]( self,  "fulfillPendingScreenSharingRequestsForRemoteParticipant:",  v16);
LABEL_22:
    if (-[CSDConversation isScreenEnabled](self, "isScreenEnabled"))
    {
      id v28 = sub_1001704C4();
      unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
        *(_DWORD *)unint64_t v36 = 138412290;
        *(void *)&v36[4] = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[WARN] Stopping screen on local device since one of the remote participants sharing their screen %@",  v36,  0xCu);
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[TUCallScreenShareAttributes defaultAttributes]( &OBJC_CLASS___TUCallScreenShareAttributes,  "defaultAttributes"));
      -[CSDConversation setScreenEnabled:attributes:](self, "setScreenEnabled:attributes:", 0LL, v31);

      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
      [v32 removeLocalScreenSharingSessions];
    }

    id v33 = sub_1001704C4();
    int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      *(_DWORD *)unint64_t v36 = 138412290;
      *(void *)&v36[4] = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Resetting non screen sharing sessions as one of the remote participants started screen sharing %@",  v36,  0xCu);
    }

    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation activitySessionManager](self, "activitySessionManager"));
    -[os_log_s resetNonScreenSharingSessions](v25, "resetNonScreenSharingSessions");
LABEL_29:

    goto LABEL_30;
  }

  id v18 = sub_1001704C4();
  double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v36 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Conversation is currently being screened and screen sharing is enabled by remote, disallowing screen sharing",  v36,  2u);
  }

  -[CSDConversation updateScreenEnabledForRemoteParticipants:](self, "updateScreenEnabledForRemoteParticipants:", 0LL);
LABEL_30:
}

- (void)addedRemoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioEnabled:(BOOL)a4 updatedVideoEnabled:(BOOL)a5 streamToken:(int64_t)a6 screenToken:(int64_t)a7 captionsToken:(int64_t)a8
{
  BOOL v11 = a4;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3, a4, a5));
  dispatch_assert_queue_V2(v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);

  if (v17)
  {
    [v17 setAudioEnabled:v11];
    [v17 setStreamToken:a6];
    [v17 setScreenToken:a7];
    [v17 setCaptionsToken:a8];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v18 conversation:self updatedActiveParticipant:v17];

    -[CSDConversation _generateHandoffReportIfNecessaryForUpdatedParticipantID:isAddParticipant:]( self,  "_generateHandoffReportIfNecessaryForUpdatedParticipantID:isAddParticipant:",  [v17 identifier],  1);
    double v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation currentParticipantPresentationContexts]( self,  "currentParticipantPresentationContexts"));
    -[CSDConversation updateParticipantPresentationContexts:](self, "updateParticipantPresentationContexts:", v19);

    if ([v17 audioVideoMode])
    {
      -[CSDConversation switchBackToOneToOneIfPossibleUsingDelay:]( self,  "switchBackToOneToOneIfPossibleUsingDelay:",  1LL);
    }

    else
    {
      id v22 = sub_1001704C4();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[WARN] Retrying updating oneToOneMode since participant got added",  (uint8_t *)&v24,  2u);
      }

      -[CSDConversation updateOneToOneModeForParticipantUpdateType:participant:]( self,  "updateOneToOneModeForParticipantUpdateType:participant:",  0LL,  v17);
    }
  }

  else
  {
    id v20 = sub_1001704C4();
    unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 134217984;
      unint64_t v25 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unknown participant with identifier: %llu",  (uint8_t *)&v24,  0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 updatedAudioPaused:(BOOL)a4 streamToken:(int64_t)a5
{
  BOOL v5 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3, a4, a5));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (v11)
  {
    [v11 setAudioPaused:v5];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v12 conversation:self updatedActiveParticipant:v11];
  }

  else
  {
    id v13 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      unint64_t v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unknown participant with identifier: %llu",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 didChangeAudioPriority:(int64_t)a4 videoPriority:(int64_t)a5
{
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

  if (v12)
  {
    [v12 setAudioPriority:a4];
    [v12 setVideoPriority:a5];
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v13 conversation:self mediaPrioritiesChangedForParticipant:v12];
  }

  else
  {
    id v14 = sub_1001704C4();
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      unint64_t v17 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unknown participant with identifier: %llu",  (uint8_t *)&v16,  0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 cameraMixedWithScreenDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    [v10 setCameraMixedWithScreen:v4];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v11 conversation:self updatedActiveParticipant:v10];
  }

  else
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      unint64_t v15 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unknown participant with identifier: %llu",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (void)remoteParticipantWithIdentifier:(unint64_t)a3 didReact:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v11 conversation:self participant:v10 didReact:v6];
  }

  else
  {
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      unint64_t v15 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[WARN] Unknown participant with identifier: %llu",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (void)session:(id)a3 localParticipantDidReact:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = objc_alloc(&OBJC_CLASS___CSDConversationParticipant);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  id v9 = [v8 localParticipantIdentifier];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handle]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantData](self, "localParticipantData"));
  int v14 = -[CSDConversationParticipant initWithIdentifier:handle:avcData:]( v7,  "initWithIdentifier:handle:avcData:",  v9,  v11,  v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v13 conversation:self participant:v14 didReact:v5];
}

- (void)sessionLocalParticipantDidStopReacting:(id)a3
{
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc(&OBJC_CLASS___CSDConversationParticipant);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  id v7 = [v6 localParticipantIdentifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localMember](self, "localMember"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handle]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipantData](self, "localParticipantData"));
  id v12 = -[CSDConversationParticipant initWithIdentifier:handle:avcData:]( v5,  "initWithIdentifier:handle:avcData:",  v7,  v9,  v10);

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v11 conversation:self participantDidStopReacting:v12];
}

- (void)session:(id)a3 screenCaptureDidStart:(BOOL)a4 withError:(id)a5
{
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v8);

  if (a5 || !a4)
  {
    id v9 = sub_1001704C4();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      int v13 = 138412290;
      int v14 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Stopping screen on local device capture failed to start for conversation UUID: %@",  (uint8_t *)&v13,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TUCallScreenShareAttributes defaultAttributes]( &OBJC_CLASS___TUCallScreenShareAttributes,  "defaultAttributes"));
    -[CSDConversation setScreenEnabled:attributes:](self, "setScreenEnabled:attributes:", 0LL, v12);
  }

- (void)session:(id)a3 screenCaptureDidStop:(BOOL)a4 withError:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned int v10 = [v9 sckSystemPickerEnabled];

  if (v7 && v5 && v10)
  {
    id v11 = sub_1001704C4();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
      int v16 = 138412546;
      unint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Stopping screen on local device capture, capture stopped without calling stop for conversation UUID: %@ error: %@",  (uint8_t *)&v16,  0x16u);
    }

    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[TUCallScreenShareAttributes defaultAttributes]( &OBJC_CLASS___TUCallScreenShareAttributes,  "defaultAttributes"));
    -[CSDConversation setScreenEnabled:attributes:](self, "setScreenEnabled:attributes:", 0LL, v14);

    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v15 conversationDidStopScreenCapture:self];
  }
}

- (void)removedRemoteParticipantWithIdentifier:(unint64_t)a3 didSucceed:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (v4)
  {
    -[CSDConversation switchBackToOneToOneIfPossible](self, "switchBackToOneToOneIfPossible");
    -[CSDConversation _generateHandoffReportIfNecessaryForUpdatedParticipantID:isAddParticipant:]( self,  "_generateHandoffReportIfNecessaryForUpdatedParticipantID:isAddParticipant:",  a3,  0LL);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipantsByIdentifier](self, "activeRemoteParticipantsByIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    if (![v10 audioVideoMode])
    {
      id v11 = sub_1001704C4();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Retrying updating oneToOneMode since participant got added",  v15,  2u);
      }

      -[CSDConversation updateOneToOneModeForParticipantUpdateType:participant:]( self,  "updateOneToOneModeForParticipantUpdateType:participant:",  0LL,  v10);
    }
  }

  else
  {
    id v13 = sub_1001704C4();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No participant found on the conversation",  buf,  2u);
    }
  }
}

- (void)updateScreenEnabledForRemoteParticipants:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v3) {
      id v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating screenEnabled on all remote participants to: %@",  buf,  0xCu);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversation activeRemoteParticipantsByIdentifier]( self,  "activeRemoteParticipantsByIdentifier",  0LL));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);

  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      int v14 = 0LL;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v14);
        int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation avcSession](self, "avcSession"));
        objc_msgSend(v16, "setScreenEnabled:forParticipantWithIdentifier:", v3, objc_msgSend(v15, "identifier"));

        int v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }
}

- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004104C;
  v7[3] = &unk_1003D7878;
  BOOL v8 = a4;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)postUserNotificationForUnsupportedScreenSharingActivity:(id)a3 alternateReponseHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 groupUUID]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v9, v10));

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation audioRoutePolicyManager](self, "audioRoutePolicyManager"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPActivityAuthorizationManager notificationDisplayInformationForAudioPolicyManager:activity:conversation:]( &OBJC_CLASS___CPActivityAuthorizationManager,  "notificationDisplayInformationForAudioPolicyManager:activity:conversation:",  v12,  v7,  v8));

  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:",  v11,  3LL,  0LL,  v13,  0.0));
  [v14 setUsesNotificationCenter:0];
  [v14 setRepresentedApplicationBundle:TUBundleIdentifierTelephonyUtilitiesFramework];
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  _DWORD v17[2] = sub_100041550;
  v17[3] = &unk_1003D7EB8;
  void v17[4] = self;
  id v18 = v6;
  id v16 = v6;
  [v15 addUserNotification:v14 listener:0 completionHandler:v17];
}

- (BOOL)remoteJoinedActivity:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation activeRemoteParticipants](self, "activeRemoteParticipants", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 activeRemoteParticipants]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 tuConversationParticipant]);
        unsigned __int8 v12 = [v10 containsObject:v11];

        if ((v12 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)activitySessionManager:(id)a3 tuActivitySessionsDidChange:(id)a4
{
  id v6 = a4;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  -[CSDConversation checkAndSetTUActivityActive:](self, "checkAndSetTUActivityActive:", v6);
}

- (void)activitySessionManager:(id)a3 activitySessionChanged:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation applicationLaunchPolicyManager](self, "applicationLaunchPolicyManager"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation tuConversation](self, "tuConversation"));
  [v7 updateAllowedHandlesForConversation:v8];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v9 conversation:self activitySessionChanged:v5];
}

- (BOOL)activitySessionManager:(id)a3 activitySessionIsJoinable:(id)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3, a4));
  dispatch_assert_queue_V2(v5);

  return (id)-[CSDConversation state](self, "state") == (id)3;
}

- (void)activitySessionManager:(id)a3 receivedActivitySessionEvent:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v7 conversation:self receivedActivitySessionEvent:v5];
}

- (void)activitySessionManager:(id)a3 fetchDataCryptorForTopic:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  [v10 requestDataCryptorForTopic:v8 completionHandler:v7];
}

- (void)activitySessionManager:(id)a3 requestEncryptionKeysForParticipants:(id)a4 topicName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  [v10 requestEncryptionKeyForParticipants:v8 topic:v7];
}

- (id)activitySessionManager:(id)a3 localParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5
{
  id v7 = a5;
  if (-[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier") == a4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipant](self, "localParticipant"));
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stableBundleIdentifierForLocalBundleIdentifier:v7]);

    if (v10)
    {
      id v11 = v10;

      id v7 = v11;
    }

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 dataUsingEncoding:4]);
    id v14 = [v12 participantIDForAlias:a4 salt:v13];

    if (v14 == (id)-[CSDConversation localParticipantIdentifier](self, "localParticipantIdentifier")) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation localParticipant](self, "localParticipant"));
    }
    else {
      id v8 = 0LL;
    }
  }

  return v8;
}

- (id)activitySessionManager:(id)a3 activeRemoteParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteParticipantForIdentifier:](self, "remoteParticipantForIdentifier:", a4));
  if (v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 stableBundleIdentifierForLocalBundleIdentifier:v7]);
    unsigned __int8 v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (void *)v11;
    }
    else {
      uint64_t v13 = v7;
    }
    id v14 = v13;

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataUsingEncoding:4]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    id v17 = [v16 participantIDForAlias:a4 salt:v15];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteParticipantForIdentifier:](self, "remoteParticipantForIdentifier:", v17));
  }

  else
  {
    id v18 = 0LL;
  }

  if (v18) {
    __int128 v19 = v18;
  }
  else {
    __int128 v19 = v9;
  }
  id v20 = v19;

  return v20;
}

- (void)activitySessionManager:(id)a3 activeRemoteParticipantWithParticipantIdentifier:(unint64_t)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation remoteParticipantForIdentifier:](self, "remoteParticipantForIdentifier:", a4));
  if (v9)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation serverBag](self, "serverBag"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 stableBundleIdentifierForLocalBundleIdentifier:v9]);
    __int128 v15 = (void *)v14;
    if (v14) {
      __int128 v16 = (void *)v14;
    }
    else {
      __int128 v16 = v9;
    }
    id v17 = v16;

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dataUsingEncoding:4]);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100041E00;
    v20[3] = &unk_1003D7EE0;
    v20[4] = self;
    id v22 = v10;
    id v21 = v12;
    [v19 participantIDForAlias:a4 salt:v18 completion:v20];
  }

  else
  {
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }
}

- (void)activitySessionManager:(id)a3 activityChangedOnSession:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v7 conversation:self activityChangedOnSession:v5];
}

- (id)activitySessionManagerRequestedCallTypeStringForLogging:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue", a3));
  dispatch_assert_queue_V2(v4);

  if (-[CSDConversation isOneToOneModeEnabled](self, "isOneToOneModeEnabled")) {
    return @"1-1";
  }
  else {
    return @"GFT";
  }
}

- (void)activitySessionManager:(id)a3 sessionUnjoined:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  unsigned __int8 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  id v13 = sub_1001704C4();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Did get session unjoined callback startDate %@ endDate %@ session %@",  (uint8_t *)&v16,  0x20u);
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
  [v15 didEndSession:v9 startDate:v10 endDate:v11];
}

- (void)activitySessionManager:(id)a3 requestForegroundPresentationForActivity:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 activity]);
  unsigned __int8 v8 = [v7 isSystemActivity];

  if ((v8 & 1) == 0)
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CSDConversation setting appLaunchState to needsLaunch %@",  (uint8_t *)&v12,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
    [v11 conversation:self appLaunchState:1 forActivitySession:v5];
  }
}

- (void)activitySessionManager:(id)a3 activitySessionRemoved:(id)a4 userOriginated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  unsigned __int8 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CSDConversation received activity session removed: %@",  (uint8_t *)&v14,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v11 conversation:self activitySessionRemoved:v7 userOriginated:v5];

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 activity]);
  if ([v12 isScreenSharingActivity])
  {
    unsigned int v13 = [v7 isLocallyInitiated];

    if (v13) {
      -[CSDConversation switchBackToOneToOneIfPossible](self, "switchBackToOneToOneIfPossible");
    }
  }

  else
  {
  }
}

- (void)activitySessionManager:(id)a3 activitySessionStateChanged:(id)a4 oldState:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  -[CSDConversation activitySessionManager:activitySessionChanged:]( self,  "activitySessionManager:activitySessionChanged:",  v8,  v7);

  [v10 conversation:self didChangeStateForActivitySession:v7];
}

- (void)activitySessionManager:(id)a3 activitySessionAssociatedSceneChanged:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001704C4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CSDConversation associated scene changed for %@",  (uint8_t *)&v12,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  -[CSDConversation activitySessionManager:activitySessionChanged:]( self,  "activitySessionManager:activitySessionChanged:",  v7,  v6);

  [v11 conversation:self didChangeSceneAssociationForActivitySession:v6];
}

- (void)activitySessionManager:(id)a3 sendResourceAtURL:(id)a4 toParticipants:(id)a5 metadata:(id)a6 activitySessionUUID:(id)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  __int16 v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v18);

  id v19 = sub_1001704C4();
  __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation UUID](self, "UUID"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 URL]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
    int v25 = 138412546;
    int v26 = v21;
    __int16 v27 = 2112;
    id v28 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Conversation UUID: %@ sending resource url.path: %@",  (uint8_t *)&v25,  0x16u);
  }

  int v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v24 conversation:self sendResourceAtURL:v13 toParticipants:v17 metadata:v16 activitySessionUUID:v15 completion:v14];
}

- (void)activitySessionManager:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v12);

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[CSDConversation delegate](self, "delegate"));
  [v13 conversation:self requestedEndpointWithIdentifier:v11 activitySession:v10 completion:v9];
}

- (void)activitySessionManager:(id)a3 shouldRegisterPlugin:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned __int8 v7 = [v6 sharePlayInFaceTimeCanvasEnabled];

  if ((v7 & 1) == 0)
  {
    id v16 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v17 = "[WARN] Not registering plugin since featureFlag is disabled.";
    __int16 v18 = v14;
    uint32_t v19 = 2;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    goto LABEL_13;
  }

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDConversation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
  unsigned __int8 v10 = [v9 isJoined];

  if ((v10 & 1) == 0)
  {
    id v20 = sub_1001704C4();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 138412546;
    id v24 = v5;
    __int16 v25 = 2112;
    int v26 = self;
    id v17 = "Not registering plugin %@ since we're not joined. Conversation: %@";
    __int16 v18 = v14;
    uint32_t v19 = 22;
    goto LABEL_10;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation virtualParticipantsByPluginName](self, "virtualParticipantsByPluginName"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v5]);

  if (!v12)
  {
    uint64_t v21 = IDSGroupSessionPluginNameKey;
    id v22 = v5;
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    id v15 = (CSDConversation *)objc_claimAutoreleasedReturnValue(-[CSDConversation idsSession](self, "idsSession"));
    -[CSDConversation registerPluginWithOptions:](v15, "registerPluginWithOptions:", v14);
    goto LABEL_12;
  }

  id v13 = sub_1001704C4();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (CSDConversation *)objc_claimAutoreleasedReturnValue( -[CSDConversation virtualParticipantsByPluginName]( self,  "virtualParticipantsByPluginName"));
    *(_DWORD *)buf = 138412546;
    id v24 = v5;
    __int16 v25 = 2112;
    int v26 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not registering plugin %@ because it already exists. All current plugins: %@",  buf,  0x16u);
LABEL_12:
  }

- (void)systemStateObserver:(id)a3 screenSharingAllowedStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = sub_1001704C4();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v4) {
      id v8 = @"YES";
    }
    int v11 = 138412290;
    int v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "screenSharingAllowedStateChanged: %@",  (uint8_t *)&v11,  0xCu);
  }

  -[CSDConversation updateScreenEnabledForRemoteParticipants:](self, "updateScreenEnabledForRemoteParticipants:", v4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned int v10 = [v9 requestToScreenShareEnabled];

  if (v10) {
    -[CSDConversation broadcastLocalParticipantData](self, "broadcastLocalParticipantData");
  }
}

- (void)systemStateObserver:(id)a3 screenSharingInitiationAllowedStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = sub_1001704C4();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"NO";
    if (v4) {
      id v8 = @"YES";
    }
    int v11 = 138412290;
    int v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "screenSharingInitiationAllowedStateChanged: %@",  (uint8_t *)&v11,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversation featureFlags](self, "featureFlags"));
  unsigned int v10 = [v9 requestToScreenShareEnabled];

  if (v10) {
    -[CSDConversation broadcastLocalParticipantData](self, "broadcastLocalParticipantData");
  }
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (BOOL)isAudioInjectionAllowed
{
  return self->_audioInjectionAllowed;
}

- (CSDConversationDelegate)delegate
{
  return (CSDConversationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (TUConversationLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (NSUUID)messagesGroupUUID
{
  return self->_messagesGroupUUID;
}

- (void)setMessagesGroupUUID:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)hasReceivedLetMeInRequest
{
  return self->_hasReceivedLetMeInRequest;
}

- (void)setHasReceivedLetMeInRequest:(BOOL)a3
{
  self->_hasReceivedLetMeInRequest = a3;
}

- (int64_t)letMeInRequestState
{
  return self->_letMeInRequestState;
}

- (void)setLetMeInRequestState:(int64_t)a3
{
  self->_letMeInRequestState = a3;
}

- (BOOL)isLocallyCreated
{
  return self->_locallyCreated;
}

- (TUConversationMember)localLightweightSecondaryMember
{
  return self->_localLightweightSecondaryMember;
}

- (void)setLocalLightweightSecondaryMember:(id)a3
{
}

- (int64_t)splitSessionUserProfileState
{
  return self->_splitSessionUserProfileState;
}

- (BOOL)hasJoined
{
  return self->_hasJoined;
}

- (void)setHasJoined:(BOOL)a3
{
  self->_hasJoined = a3;
}

- (TUHandle)initiator
{
  return self->_initiator;
}

- (TUConversationMember)localMember
{
  return self->_localMember;
}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (NSSet)lightweightMembers
{
  return self->_lightweightMembers;
}

- (void)setLightweightMembers:(id)a3
{
}

- (NSSet)pendingMembers
{
  return self->_pendingMembers;
}

- (void)setPendingMembers:(id)a3
{
}

- (NSSet)kickedMembers
{
  return self->_kickedMembers;
}

- (void)setKickedMembers:(id)a3
{
}

- (NSSet)rejectedMembers
{
  return self->_rejectedMembers;
}

- (void)setRejectedMembers:(id)a3
{
}

- (NSSet)remotePushTokens
{
  return self->_remotePushTokens;
}

- (void)setRemotePushTokens:(id)a3
{
}

- (NSSet)otherInvitedHandles
{
  return self->_otherInvitedHandles;
}

- (void)setOtherInvitedHandles:(id)a3
{
}

- (BOOL)ignoreLMIRequests
{
  return self->_ignoreLMIRequests;
}

- (void)setIgnoreLMIRequests:(BOOL)a3
{
  self->_ignoreLMIRequests = a3;
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_unint64_t screenSharingType = a3;
}

- (NSArray)supportedMediaTypes
{
  return self->_supportedMediaTypes;
}

- (void)setSupportedMediaTypes:(id)a3
{
}

- (TUConversationActivitySession)stagedActivitySession
{
  return self->_stagedActivitySession;
}

- (void)setStagedActivitySession:(id)a3
{
}

- (NSString)messagesGroupName
{
  return self->_messagesGroupName;
}

- (void)setMessagesGroupName:(id)a3
{
}

- (BOOL)isCaptioningEnable
{
  return self->_captioningEnabled;
}

- (BOOL)isSpatialPersonaEnabled
{
  return self->_spatialPersonaEnabled;
}

- (void)setSpatialPersonaEnabled:(BOOL)a3
{
  self->_spatialPersonaEnabled = a3;
}

- (BOOL)isCameraMixedWithScreen
{
  return self->_cameraMixedWithScreen;
}

- (void)setCameraMixedWithScreen:(BOOL)a3
{
  self->_cameraMixedWithScreen = a3;
}

- (CPActivitySessionManager)activitySessionManager
{
  return self->_activitySessionManager;
}

- (void)setActivitySessionManager:(id)a3
{
}

- (TUConversationReport)report
{
  return self->_report;
}

- (TUConversationParticipantAssociation)localParticipantAssociation
{
  return self->_localParticipantAssociation;
}

- (void)setLocalParticipantAssociation:(id)a3
{
}

- (TUConversationHandoffEligibility)handoffEligibility
{
  return self->_handoffEligibility;
}

- (void)setHandoffEligibility:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)activeRemoteParticipantsByIdentifier
{
  return self->_activeRemoteParticipantsByIdentifier;
}

- (NSMutableDictionary)activeLightweightParticipantsByIdentifier
{
  return self->_activeLightweightParticipantsByIdentifier;
}

- (void)setActiveLightweightParticipantsByIdentifier:(id)a3
{
}

- (NSMutableSet)kickedParticipants
{
  return self->_kickedParticipants;
}

- (void)setKickedParticipants:(id)a3
{
}

- (NSMutableDictionary)screenSharingRequestsByUUID
{
  return self->_screenSharingRequestsByUUID;
}

- (void)setScreenSharingRequestsByUUID:(id)a3
{
}

- (CSDIDSGroupSession)idsSession
{
  return self->_idsSession;
}

- (CSDConversationLocalParticipantBlobTracker)localParticipantBlobTracker
{
  return self->_localParticipantBlobTracker;
}

- (NSNumber)expectedAudioEnabled
{
  return self->_expectedAudioEnabled;
}

- (void)setExpectedAudioEnabled:(id)a3
{
}

- (NSNumber)expectedVideoEnabled
{
  return self->_expectedVideoEnabled;
}

- (void)setExpectedVideoEnabled:(id)a3
{
}

- (NSNumber)expectedScreenEnabled
{
  return self->_expectedScreenEnabled;
}

- (void)setExpectedScreenEnabled:(id)a3
{
}

- (NSNumber)expectedVideoPaused
{
  return self->_expectedVideoPaused;
}

- (void)setExpectedVideoPaused:(id)a3
{
}

- (NSNumber)expectedAudioPaused
{
  return self->_expectedAudioPaused;
}

- (void)setExpectedAudioPaused:(id)a3
{
}

- (NSDictionary)activeLightweightParticipantDestinationsByIdentifier
{
  return self->_activeLightweightParticipantDestinationsByIdentifier;
}

- (NSSet)serverProvidedParticipantIdentifiers
{
  return self->_serverProvidedParticipantIdentifiers;
}

- (void)setServerProvidedParticipantIdentifiers:(id)a3
{
}

- (NSSet)serverProvidedLightweightParticipantIdentifiers
{
  return self->_serverProvidedLightweightParticipantIdentifiers;
}

- (void)setServerProvidedLightweightParticipantIdentifiers:(id)a3
{
}

- (BOOL)isWaitingToPruneParticipants
{
  return self->_waitingToPruneParticipants;
}

- (void)setWaitingToPruneParticipants:(BOOL)a3
{
  self->_waitingToPruneParticipants = a3;
}

- (NSDate)lastRebroadcastTime
{
  return self->_lastRebroadcastTime;
}

- (void)setLastRebroadcastTime:(id)a3
{
}

- (unint64_t)rebroadcastTimeThreshold
{
  return self->_rebroadcastTimeThreshold;
}

- (void)setRebroadcastTimeThreshold:(unint64_t)a3
{
  self->_rebroadcastTimeThreshold = a3;
}

- (NSMutableDictionary)virtualParticipantsByPluginName
{
  return self->_virtualParticipantsByPluginName;
}

- (CSDFaceTimeInviteDemuxer)faceTimeInviteDemuxer
{
  return self->_faceTimeInviteDemuxer;
}

- (NSMutableDictionary)pendingKickedMembersByIdentifier
{
  return self->_pendingKickedMembersByIdentifier;
}

- (void)setPendingKickedMembersByIdentifier:(id)a3
{
}

- (NSMutableSet)pendingAllowedMembers
{
  return self->_pendingAllowedMembers;
}

- (void)setPendingAllowedMembers:(id)a3
{
}

- (unint64_t)kickMemberRetryCount
{
  return self->_kickMemberRetryCount;
}

- (void)setKickMemberRetryCount:(unint64_t)a3
{
  self->_kickMemberRetryCount = a3;
}

- (unint64_t)setScreenSharingRetryCount
{
  return self->_setScreenSharingRetryCount;
}

- (void)setSetScreenSharingRetryCount:(unint64_t)a3
{
  self->_setScreenSharingRetryCount = a3;
}

- (NSArray)currentParticipantPresentationContexts
{
  return self->_currentParticipantPresentationContexts;
}

- (void)setCurrentParticipantPresentationContexts:(id)a3
{
}

- (CSDConversationParticipant)splitSessionSecondary
{
  return self->_splitSessionSecondary;
}

- (CSDConversationABTestConfiguration)ABTestConfiguration
{
  return self->_ABTestConfiguration;
}

- (void)setABTestConfiguration:(id)a3
{
}

- (NSMutableArray)addedHandoffParticipants
{
  return self->_addedHandoffParticipants;
}

- (void)setAddedHandoffParticipants:(id)a3
{
}

- (NSMutableArray)removedHandoffParticipants
{
  return self->_removedHandoffParticipants;
}

- (void)setRemovedHandoffParticipants:(id)a3
{
}

- (NSMutableDictionary)startAddingHandoffParticipantToTime
{
  return self->_startAddingHandoffParticipantToTime;
}

- (void)setStartAddingHandoffParticipantToTime:(id)a3
{
}

- (NSMutableDictionary)addedHandoffParticipantToTime
{
  return self->_addedHandoffParticipantToTime;
}

- (void)setAddedHandoffParticipantToTime:(id)a3
{
}

- (NSMutableDictionary)removedHandoffParticipantToTime
{
  return self->_removedHandoffParticipantToTime;
}

- (void)setRemovedHandoffParticipantToTime:(id)a3
{
}

- (CPApplicationPolicyManager)applicationLaunchPolicyManager
{
  return self->_applicationLaunchPolicyManager;
}

- (void)setApplicationLaunchPolicyManager:(id)a3
{
}

- (CPAudioRoutePolicyManager)audioRoutePolicyManager
{
  return self->_audioRoutePolicyManager;
}

- (void)setAudioRoutePolicyManager:(id)a3
{
}

- (CPSystemStateObserver)sharePlaySystemStateObserver
{
  return self->_sharePlaySystemStateObserver;
}

- (void)setSharePlaySystemStateObserver:(id)a3
{
}

- (_TtC13callservicesd36CSDActivitySessionParticipantMonitor)activitySessionParticipantMonitor
{
  return self->_activitySessionParticipantMonitor;
}

- (void)setActivitySessionParticipantMonitor:(id)a3
{
}

- (BOOL)expectedUplinkMuted
{
  return self->_expectedUplinkMuted;
}

- (void)setExpectedUplinkMuted:(BOOL)a3
{
  self->_expectedUplinkMuted = a3;
}

- (id)downgradeToOneToOneAfterDelayBlock
{
  return self->_downgradeToOneToOneAfterDelayBlock;
}

- (void)setDowngradeToOneToOneAfterDelayBlock:(id)a3
{
}

- (NSSet)remoteMemberHandles
{
  return self->_remoteMemberHandles;
}

- (void)setRemoteMemberHandles:(id)a3
{
}

- (NSSet)pendingMemberHandles
{
  return self->_pendingMemberHandles;
}

- (void)setPendingMemberHandles:(id)a3
{
}

- (NSMutableSet)pendingRemoteMembers
{
  return self->_pendingRemoteMembers;
}

- (void)setPendingRemoteMembers:(id)a3
{
}

- (NSMutableArray)memberHandlesAwaitingInvitesToLink
{
  return self->_memberHandlesAwaitingInvitesToLink;
}

- (void)setMemberHandlesAwaitingInvitesToLink:(id)a3
{
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (id)avcSessionCreationBlock
{
  return self->_avcSessionCreationBlock;
}

- (void)setAvcSessionCreationBlock:(id)a3
{
}

- (id)videoDeviceControllerCreationBlock
{
  return self->_videoDeviceControllerCreationBlock;
}

- (void)setVideoDeviceControllerCreationBlock:(id)a3
{
}

- (NSObject)reportingHierarchyToken
{
  return self->_reportingHierarchyToken;
}

- (void)setReportingHierarchyToken:(id)a3
{
}

- (NSObject)reportingHierarchySubToken
{
  return self->_reportingHierarchySubToken;
}

- (void)setReportingHierarchySubToken:(id)a3
{
}

- (NSMutableDictionary)inflightAVCBlobRecoveryBlocksByIdentifier
{
  return self->_inflightAVCBlobRecoveryBlocksByIdentifier;
}

- (id)timeoutBlock
{
  return self->_timeoutBlock;
}

- (void)setTimeoutBlock:(id)a3
{
}

- (id)participantRefreshBlock
{
  return self->_participantRefreshBlock;
}

- (void)setParticipantRefreshBlock:(id)a3
{
}

- (id)letMeInRequestUINotificationBlock
{
  return self->_letMeInRequestUINotificationBlock;
}

- (void)setLetMeInRequestUINotificationBlock:(id)a3
{
}

- (id)noConversationParticipantTimeoutBlock
{
  return self->_noConversationParticipantTimeoutBlock;
}

- (void)setNoConversationParticipantTimeoutBlock:(id)a3
{
}

- (double)sessionSwitchTimeout
{
  return self->_sessionSwitchTimeout;
}

- (void)setSessionSwitchTimeout:(double)a3
{
  self->_sessionSwitchTimeout = a3;
}

- (id)personaHandshakeBlobCreationBlock
{
  return self->_personaHandshakeBlobCreationBlock;
}

- (void)setPersonaHandshakeBlobCreationBlock:(id)a3
{
}

- (BOOL)avcSessionInProgress
{
  return self->_avcSessionInProgress;
}

- (void)setAvcSessionInProgress:(BOOL)a3
{
  self->_avcSessionInProgress = a3;
}

- (BOOL)forceExpanseEnabled
{
  return self->_forceExpanseEnabled;
}

- (NSSet)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
}

- (TUCallScreenShareAttributes)screenShareAttributes
{
  return self->_screenShareAttributes;
}

- (TUConversationProvider)provider
{
  return self->_provider;
}

- (NSDictionary)activeParticipantDestinationsByIdentifier
{
  return self->_activeParticipantDestinationsByIdentifier;
}

- (NSMutableDictionary)audioRoutesByParticipantIdentifier
{
  return self->_audioRoutesByParticipantIdentifier;
}

- (void)setAudioRoutesByParticipantIdentifier:(id)a3
{
}

- (CXCallFailureContext)failureContext
{
  return self->_failureContext;
}

- (void)setFailureContext:(id)a3
{
}

- (CSDAVCSession)avcSession
{
  return self->_avcSession;
}

- (void)setAvcSession:(id)a3
{
}

- (void)setDeviceSupport:(id)a3
{
}

- (TUConversationHandoffContext)handoffContext
{
  return self->_handoffContext;
}

- (void)setHandoffContext:(id)a3
{
}

- (NSMutableSet)recentlyLeftParticipantIdentifiers
{
  return self->_recentlyLeftParticipantIdentifiers;
}

- (void)setRecentlyLeftParticipantIdentifiers:(id)a3
{
}

- (NSMutableDictionary)pendingConversationParticipantsByIdentifier
{
  return self->_pendingConversationParticipantsByIdentifier;
}

- (void)setPendingConversationParticipantsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (CSDConversationParticipant)localCSDParticipant
{
  id v2 = self;
  id v3 = sub_100210EE0();

  return (CSDConversationParticipant *)v3;
}

@end