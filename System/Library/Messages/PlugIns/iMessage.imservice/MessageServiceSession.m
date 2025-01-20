@interface MessageServiceSession
- (AttachmentRefreshDeliveryController)attachmentRefreshDeliveryController;
- (BOOL)_amIMentioned:(id)a3 inMentions:(id)a4;
- (BOOL)_convergesDisplayNames;
- (BOOL)_failSendingMessageIfNeeded:(id)a3 withContext:(id)a4;
- (BOOL)_handleDeviceRegistrationForMessage:(id)a3 withContext:(id)a4;
- (BOOL)_handleTypingIndicatorMessage:(id)a3 withContext:(id)a4;
- (BOOL)_isAllowlistedUnencryptedSender:(id)a3;
- (BOOL)_isDeviceRegisteredForAccount:(id)a3;
- (BOOL)_isFromLinkedID:(id)a3 fromID:(id)a4;
- (BOOL)_isRegisteredURI:(id)a3;
- (BOOL)_originalTimestampWithinAcceptableWindow:(id)a3 timestamp:(id)a4;
- (BOOL)_richLinkPendSendingWithGUID:(id)a3;
- (BOOL)_sendCertifiedDeliveryReceiptIfPossible:(id)a3 messageContext:(id)a4 guid:(id)a5 messageWasStored:(BOOL)a6 needsDeliveryReceipt:(BOOL)a7 failureReason:(id)a8;
- (BOOL)_shouldBlackholeChatFromSender:(id)a3 toRecipient:(id)a4 forAccount:(id)a5;
- (BOOL)_shouldBlackholeGroupChatFromSender:(id)a3 toRecipient:(id)a4 withOtherParticipants:(id)a5 forAccount:(id)a6;
- (BOOL)_shouldIgnoreMessageFromSender:(id)a3 balloonBID:(id)a4 fromMe:(BOOL)a5;
- (BOOL)_shouldInitiateTelephonyConversationForMessage:(id)a3;
- (BOOL)_shouldOptimizedDeliveryReceiptForConversation:(id)a3 withMessageTimeStamp:(id)a4;
- (BOOL)_shouldOverrideTypingIndicator;
- (BOOL)_shouldSendAppTypingIndicator;
- (BOOL)_transferIsValidForServiceSession:(id)a3;
- (BOOL)_updateReadReceiptProperties:(id)a3 withIncomingProperties:(id)a4;
- (BOOL)canMakeExpireStateChecks;
- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7;
- (BOOL)networkConditionsAllowLogin;
- (BOOL)overrideNetworkAvailability;
- (BOOL)reflectMarkUnreadToPeerDevicesForMessageGUID:(id)a3;
- (BOOL)reflectRecoverChatToPeerDevicesForMessageGUID:(id)a3;
- (BOOL)sendNicknameUpdatesToPeerDevices:(id)a3 toDestinations:(id)a4;
- (BOOL)shouldDownloadGroupPhoto:(id)a3;
- (BOOL)shouldUploadGroupPhoto:(id)a3;
- (IMDCKUtilities)ckUtilities;
- (IMDCallManager)callManager;
- (IMDGroupPhotoRefreshController)groupPhotoRefreshController;
- (IMDMessageStore)messageStore;
- (IMDScheduledMessageCoordinator)scheduledMessageCoordinator;
- (MessageAttachmentController)attachmentController;
- (MessageDeliveryController)deliveryController;
- (MessageGroupController)groupController;
- (MessageServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (NSMutableDictionary)pendingGroupPhotoDownloads;
- (double)_richLinkDelayTimeInterval;
- (id)_URIsFromHandles:(id)a3;
- (id)_buildSendMessageContextWithChatIdentifier:(id)a3 withChatStyle:(unsigned __int8)a4 withServiceSession:(id)a5 withMessage:(id)a6;
- (id)_buildSendMessageContextWithChatIdentifier:(id)a3 withChatStyle:(unsigned __int8)a4 withServiceSession:(id)a5 withMessage:(id)a6 destinations:(id)a7;
- (id)_firstiMessageChat;
- (id)_generateAndStoreGroupActionItemForChat:(id)a3 sender:(id)a4;
- (id)_handleIDsForDestinations:(id)a3;
- (id)_lastAddressedURIForChatLogMetricIfNeededOnChat:(id)a3 withIDSAccount:(id *)a4 withServiceSession:(id)a5 shouldLog:(BOOL)a6;
- (id)_messageDictionaryForDeleteCommandShouldResetPreference:(BOOL)a3;
- (id)_messageDictionaryToReflectWithDeliveryReceipt:(id)a3;
- (id)_messageItemToConsumeForNewBreadcrumbMessage:(id)a3 outBreadcrumbItems:(id *)a4;
- (id)_processMessageForSending:(id)a3 withContext:(id)a4;
- (id)_processMessageForSendingToGroupIfNeeded:(id)a3 withContext:(id)a4;
- (id)_pushHandlerForIDSAccount:(id)a3;
- (id)_setCallerIDOnMessage:(id)a3 onChat:(id)a4 withIDSAccount:(id *)a5 withServiceSession:(id)a6;
- (id)bizIDSAccountFromMadridIDSAccount:(id)a3;
- (id)callerURI;
- (id)callerURIForMessageServiceType:(unsigned int)a3;
- (id)callerURIUsingCalleeURI:(id)a3;
- (id)chatStore;
- (id)fallBackBizIDSAccount;
- (id)fileTransferDictionaryForChat:(id)a3;
- (id)generateAndStoreGroupPhotoChangeStatusItemForChat:(id)a3 sender:(id)a4 fileTransferGuid:(id)a5 isHidden:(BOOL)a6;
- (id)getMessagePushHandlers;
- (id)idsAccountForFromURI:(id)a3 toURI:(id)a4;
- (id)idsServiceForIDSAccount:(id)a3;
- (id)pendingSendBlockQueue;
- (id)storeBreadcrumbAndSetConsumedPayloadsForNewMessageItemIfNecessary:(id)a3 inChatWithIdentifier:(id)a4;
- (unint64_t)_computeFlagsForIncomingMessage:(unint64_t)a3 isFromMe:(BOOL)a4 unfinished:(BOOL)a5 isAudioMessage:(BOOL)a6 isAutoReply:(BOOL)a7 isExpirable:(BOOL)a8 messageSource:(unint64_t)a9 participants:(id)a10 hasUnseenMention:(BOOL)a11 isSOS:(BOOL)a12 isCritical:(BOOL)a13;
- (unint64_t)_failuresForID:(id)a3;
- (unint64_t)_maxFailuresAllowed;
- (unint64_t)_numberOfOffGridCapableDevicesForDestination:(id)a3;
- (unint64_t)_replicationEditDelay;
- (unsigned)messageServiceTypeForURI:(id)a3;
- (void)_FTAWDLogForMessage:(id)a3 withContext:(id)a4;
- (void)_UpdateLastAddressedSIMIDForOtherServicesIfNeededWithChatIdentifier:(id)a3 style:(unsigned __int8)a4;
- (void)_autoReportChatAsUnknown:(id)a3 chatIsNew:(BOOL)a4;
- (void)_automation_sendDictionary:(id)a3 options:(id)a4 toHandles:(id)a5;
- (void)_blastDoorProcessingWithIMMessageItem:(id)a3 chat:(id)a4 account:(id)a5 fromToken:(id)a6 fromIDSID:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 participants:(id)a10 groupName:(id)a11 groupID:(id)a12 isFromMe:(BOOL)a13 isLastFromStorage:(BOOL)a14 isFromStorage:(BOOL)a15 hideLockScreenNotification:(BOOL)a16 wantsCheckpointing:(BOOL)a17 needsDeliveryReceipt:(id)a18 messageBalloonPayloadAttachmentDictionary:(id)a19 inlineAttachments:(id)a20 attributionInfoArray:(id)a21 nicknameDictionary:(id)a22 availabilityVerificationRecipientChannelIDPrefix:(id)a23 availabilityVerificationRecipientEncryptionValidationToken:(id)a24 availabilityOffGridRecipientSubscriptionValidationToken:(id)a25 availabilityOffGridRecipientEncryptionValidationToken:(id)a26 idsService:(id)a27 messageContext:(id)a28 isFromTrustedSender:(BOOL)a29 isFromSnapTrustedSender:(BOOL)a30 completionBlock:(id)a31;
- (void)_checkGlobalReadReceiptValueAndUpdateIfNeeded:(id)a3;
- (void)_configurePrimaryServiceSessionWithAccount:(id)a3 service:(id)a4;
- (void)_deactivateServiceIfNeededForContext:(id)a3;
- (void)_deliverMessage:(id)a3 withContext:(id)a4 withBlock:(id)a5;
- (void)_didSendMessage:(id)a3 withContext:(id)a4 forceDate:(id)a5 fromStorage:(BOOL)a6;
- (void)_engroupForChat:(id)a3 idsAccount:(id)a4 completion:(id)a5;
- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4 description:(id)a5;
- (void)_fixParticipantsForChat:(id)a3;
- (void)_flushQueuedMessageWrapperBlocks;
- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6;
- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6 toToken:(id)a7;
- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6 toToken:(id)a7 messageID:(id)a8;
- (void)_handleDeleteCommandWithMessageDictionary:(id)a3;
- (void)_handleDeliveryFailureForMessage:(id)a3 withContext:(id)a4;
- (void)_handleFakeReceiptBlock:(id)a3 withContext:(id)a4 withMsg:(id)a5;
- (void)_handleFileTransferUpdated:(id)a3;
- (void)_handleIsMeToMeForMessage:(id)a3 withContext:(id)a4;
- (void)_handleMessageSentToSelf:(id)a3 chatIdentifier:(id)a4 style:(unsigned __int8)a5 isLocal:(BOOL)a6 account:(id)a7;
- (void)_handleMessageSentToSelf:(id)a3 withContext:(id)a4 isLocal:(BOOL)a5;
- (void)_handleNicknameReceived:(id)a3 fromIdentifier:(id)a4 withMessageItem:(id)a5 isSnapTrustedUser:(BOOL)a6;
- (void)_handleScheduledMessageSendFailure:(id)a3;
- (void)_handleUpdateNotificationTimeManagerForMessage:(id)a3 withContext:(id)a4;
- (void)_iMessageBagLoaded:(id)a3;
- (void)_incrementDecryptionFailureForID:(id)a3;
- (void)_initiateTelephonyConversationForMessage:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 onSession:(id)a6;
- (void)_logCompletedMessage:(id)a3 withContext:(id)a4;
- (void)_nicknameFetchCompletedMessage:(id)a3 synchronous:(BOOL)a4 profile:(id)a5 nickNameWasInCache:(BOOL)a6 nickNameDownloadError:(id)a7;
- (void)_notifyDidSendMessage:(id)a3 withContext:(id)a4;
- (void)_notifyNameAndPhotoControllerOfMessage:(id)a3 onChat:(id)a4;
- (void)_notifyOfSendMessage:(id)a3 withContext:(id)a4;
- (void)_primeServerBags;
- (void)_reAttemptMessageDeliveryForGUID:(id)a3 toIdentifier:(id)a4 fromIdentifier:(id)a5 fromIDSID:(id)a6 isReflection:(BOOL)a7 shouldShowError:(BOOL)a8 cacheFlushError:(BOOL)a9 imdAccount:(id)a10;
- (void)_refreshGroupPhotoTTLIfNecessary:(id)a3 withContext:(id)a4;
- (void)_registerKeepMessagesSettingReflection;
- (void)_registerReadReceiptSettingReflection;
- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5;
- (void)_resetFailureRetries;
- (void)_sendHighResolutionImagesForMessage:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toChat:(id)a7;
- (void)_sendSyndicationAction:(id)a3 toChat:(id)a4;
- (void)_setExpectedOffGridDeliveriesForMessage:(id)a3 context:(id)a4;
- (void)_setWeeklyFailureResetTimer;
- (void)_setupPushHandlerWithAccount:(id)a3;
- (void)_startTimingMessageSend;
- (void)_stopTimingMessageSend;
- (void)_storeSentMessage:(id)a3 withContext:(id)a4;
- (void)_updateBlackholeStatusIfNeededWithMessage:(id)a3 withContext:(id)a4;
- (void)_updateChatProperties:(id)a3 withProperties:(id)a4;
- (void)_updateGlobalReadReceiptValue:(BOOL)a3 withVersionID:(id)a4;
- (void)_updateLastDeviceActivityForCloudKit;
- (void)_updateNetworkOverride;
- (void)_updateOffGridStatusIfNeededWithMessage:(id)a3 context:(id)a4;
- (void)_updateOrRemoveGroupPhotoForChat:(id)a3 sender:(id)a4 completedTransfer:(id)a5 isHidden:(BOOL)a6;
- (void)_updateStoredBreadcrumbIfNeeded:(id)a3 onChat:(id)a4;
- (void)_updateTransfersForAttributionInfoArray:(id)a3 message:(id)a4;
- (void)addAccount:(id)a3;
- (void)addItemToRecentsIfApplicable:(id)a3;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)cancelScheduledMessageWithGUID:(id)a3;
- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5;
- (void)closeSessionForChat:(id)a3 chatGUID:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6;
- (void)dealloc;
- (void)didReplaceMessage:(id)a3 newMessage:(id)a4;
- (void)doneRetrievingAttachmentsForGroupPhotoForChat:(id)a3 fileTransferError:(id)a4 success:(BOOL)a5 transferGuid:(id)a6 sender:(id)a7 isHidden:(BOOL)a8;
- (void)eagerUploadCancel:(id)a3;
- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4;
- (void)enqueReplayMessageCallback:(id)a3;
- (void)forwardDeliveryReceiptForMessageID:(id)a3 withAccount:(id)a4 callerURI:(id)a5;
- (void)groupPhotoDownloadCompletedForChat:(id)a3 fileTransferError:(id)a4 success:(BOOL)a5 transferGuid:(id)a6 sender:(id)a7 isHidden:(BOOL)a8;
- (void)groupPhotoUploadCompletedForChat:(id)a3 fileTransferGuid:(id)a4 callerURI:(id)a5 fromAccount:(id)a6 message:(id)a7 displayIDs:(id)a8 additionalContext:(id)a9 success:(BOOL)a10 isPhotoRefresh:(BOOL)a11 error:(unsigned int)a12;
- (void)groupPhotoUploadFailedForChat:(id)a3 fileTransferGuid:(id)a4;
- (void)handleBreadcrumbForNewSentMessageItemIfNecessary:(id)a3 withContext:(id)a4;
- (void)handler:(id)a3 bubblePayloadData:(id)a4 forMessageID:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13;
- (void)handler:(id)a3 deleteCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 genericNotification:(id)a4 incomingMessage:(id)a5 userInfo:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14;
- (void)handler:(id)a3 groupMessageCommand:(id)a4 encryptedGroupCommand:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14;
- (void)handler:(id)a3 incomingMessage:(id)a4 originalEncryptionType:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 incomingEngroup:(id)a12 needsDeliveryReceipt:(id)a13 deliveryContext:(id)a14 storageContext:(id)a15 messageContext:(id)a16 isBeingReplayed:(BOOL)a17 mergeID:(id)a18 wantsCheckpointing:(BOOL)a19 isSnapTrustedUser:(BOOL)a20;
- (void)handler:(id)a3 locationShareInfo:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 messageIDDelivered:(id)a4 toIdentifier:(id)a5 status:(id)a6 deliveryContext:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 messageIDPlayed:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 messageIDRead:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 messageIDReflectedDelivered:(id)a4 incomingMessage:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 status:(id)a8 deliveryContext:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14;
- (void)handler:(id)a3 messageIDSaved:(id)a4 ofType:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 groupContext:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14;
- (void)handler:(id)a3 nicknameInfoReceived:(id)a4 userInfo:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13;
- (void)handler:(id)a3 payloadDataRequest:(id)a4;
- (void)handler:(id)a3 payloadDataResponse:(id)a4;
- (void)handler:(id)a3 receivedError:(id)a4 forMessageID:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13 additionalInfo:(id)a14 shouldShowPeerErrors:(BOOL)a15;
- (void)handler:(id)a3 recoverCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 remoteFileRequest:(id)a4;
- (void)handler:(id)a3 remoteFileResponse:(id)a4;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 joinProperties:(id)a8;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 joinProperties:(id)a6;
- (void)leaveChat:(id)a3 style:(unsigned __int8)a4;
- (void)messageDeliveryController:(id)a3 serverUpdatedTimestampMessage:(id)a4;
- (void)messageDeliveryController:(id)a3 service:(id)a4 didFlushCacheForKTPeerURI:(id)a5;
- (void)messageDeliveryController:(id)a3 service:(id)a4 didFlushCacheForRemoteURI:(id)a5 fromURI:(id)a6 guid:(id)a7;
- (void)networkMonitorDidUpdate:(id)a3;
- (void)preWarm;
- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 didReplaceMessageBlock:(id)a8 completionBlock:(id)a9;
- (void)processNetworkDataAvailabilityChange:(BOOL)a3;
- (void)receivedGroupPhotoUpdate:(id)a3 chat:(id)a4 sender:(id)a5 isHidden:(BOOL)a6;
- (void)refreshRegistration;
- (void)refreshServiceCapabilities;
- (void)removeAccount:(id)a3;
- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)renewTTLForScheduledAttachmentTransfer:(id)a3;
- (void)replayMessage:(id)a3;
- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationTime:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8;
- (void)requestProperty:(id)a3 ofPerson:(id)a4;
- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6;
- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5;
- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 toChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8;
- (void)sendCrossServiceAssociationMessageWithReplacementGUID:(id)a3 messageGUID:(id)a4 callerID:(id)a5 toID:(id)a6;
- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8;
- (void)sendDeliveryReceiptForMessageID:(id)a3 toID:(id)a4 deliveryContext:(id)a5 needsDeliveryReceipt:(id)a6 callerID:(id)a7 account:(id)a8;
- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)sendLocationSharingInfo:(id)a3 toID:(id)a4 completionBlock:(id)a5;
- (void)sendLogDumpMessageAtFilePath:(id)a3 toRecipient:(id)a4 shouldDeleteFile:(BOOL)a5 withCompletion:(id)a6;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 destinationHandles:(id)a7;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 destinationHandles:(id)a6;
- (void)sendNicknameInfoToURIs:(id)a3 chatGUID:(id)a4;
- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7;
- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6;
- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4;
- (void)sessionDidBecomeActive;
- (void)sessionWillBecomeInactiveWithAccount:(id)a3;
- (void)setCkUtilities:(id)a3;
- (void)setMessagePushHandlers:(id)a3;
- (void)setMessageStore:(id)a3;
- (void)setPendingGroupPhotoDownloads:(id)a3;
- (void)stageMessageWrapperBlock:(id)a3;
- (void)updateBalloonPayload:(id)a3 attachments:(id)a4 forMessageGUID:(id)a5;
- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9;
- (void)uploadGroupPhotoForChat:(id)a3 fileTransferGUID:(id)a4 itemGUID:(id)a5 callerURI:(id)a6 idsAccount:(id)a7 isPhotoRefresh:(BOOL)a8;
@end

@implementation MessageServiceSession

- (MessageServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  v10 = -[MessageServiceSession initWithAccount:service:replicatingForSession:]( &v31,  "initWithAccount:service:replicatingForSession:",  v8,  v9,  a5);
  v11 = v10;
  if (v10)
  {
    if (!a5) {
      -[MessageServiceSession _configurePrimaryServiceSessionWithAccount:service:]( v10,  "_configurePrimaryServiceSessionWithAccount:service:",  v8,  v9);
    }
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingSendBlockQueue = v11->_pendingSendBlockQueue;
    v11->_pendingSendBlockQueue = v12;

    v14 = -[MessageDeliveryController initWithSession:]( objc_alloc(&OBJC_CLASS___MessageDeliveryController),  "initWithSession:",  v11);
    deliveryController = v11->_deliveryController;
    v11->_deliveryController = v14;

    -[MessageDeliveryController setDelegate:](v11->_deliveryController, "setDelegate:", v11);
    v16 = -[MessageAttachmentController initWithSession:]( objc_alloc(&OBJC_CLASS___MessageAttachmentController),  "initWithSession:",  v11);
    attachmentController = v11->_attachmentController;
    v11->_attachmentController = v16;

    v18 = -[MessageGroupController initWithSession:]( objc_alloc(&OBJC_CLASS___MessageGroupController),  "initWithSession:",  v11);
    groupController = v11->_groupController;
    v11->_groupController = v18;

    v20 = -[AttachmentRefreshDeliveryController initWithSession:]( objc_alloc(&OBJC_CLASS___AttachmentRefreshDeliveryController),  "initWithSession:",  v11);
    attachmentRefreshDeliveryController = v11->_attachmentRefreshDeliveryController;
    v11->_attachmentRefreshDeliveryController = v20;

    v22 = -[IMDGroupPhotoRefreshController initWithSession:]( objc_alloc(&OBJC_CLASS___IMDGroupPhotoRefreshController),  "initWithSession:",  v11);
    groupPhotoRefreshController = v11->_groupPhotoRefreshController;
    v11->_groupPhotoRefreshController = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingGroupPhotoDownloads = v11->_pendingGroupPhotoDownloads;
    v11->_pendingGroupPhotoDownloads = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
    [v26 isScheduledMessagesCoreEnabled];

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 addObserver:v11 selector:"_handleFileTransferUpdated:" name:IMDFileTransferUpdatedNotification object:0];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v28 addObserver:v11 selector:"_handleFileTransferAccepted:" name:IMDFileTransferAcceptedNotification object:0];

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 addObserver:v11 selector:"_handleFileTransferBatchAccepted:" name:IMDFileTransferBatchAcceptedNotification object:0];
  }

  return v11;
}

- (void)_configurePrimaryServiceSessionWithAccount:(id)a3 service:(id)a4
{
  id v5 = a3;
  -[MessageServiceSession _primeServerBags](self, "_primeServerBags");
  -[MessageServiceSession _setupPushHandlerWithAccount:](self, "_setupPushHandlerWithAccount:", v5);

  -[MessageServiceSession _registerReadReceiptSettingReflection](self, "_registerReadReceiptSettingReflection");
  -[MessageServiceSession _registerKeepMessagesSettingReflection](self, "_registerKeepMessagesSettingReflection");
  if (qword_E4508 != -1) {
    dispatch_once(&qword_E4508, &stru_D5768);
  }
  if (+[IMDeviceUtilities supportsFaceTime](&OBJC_CLASS___IMDeviceUtilities, "supportsFaceTime"))
  {
    v6 = -[IMDCallManager initWithServiceSession:]( objc_alloc(&OBJC_CLASS___IMDCallManager),  "initWithServiceSession:",  self);
    callManager = self->_callManager;
    self->_callManager = v6;
  }

- (void)_primeServerBags
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("MessageService");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Priming Message Server bag", buf, 2u);
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:self selector:"_iMessageBagLoaded:" name:IDSServerBagFinishedLoadingNotification object:v5];
  }

  id v7 = -[MessageServiceSession _updateNetworkOverride](self, "_updateNetworkOverride");
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("MessageService");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Priming FaceTime Server bag", v16, 2u);
    }
  }

  id v11 = +[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL);
  if (IMOSLoggingEnabled(v11, v12))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("MessageService");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "...done", v15, 2u);
    }
  }
}

- (void)_setupPushHandlerWithAccount:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("MessageService");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Setting up push handler", v13, 2u);
    }
  }

  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  messagePushHandlers = self->_messagePushHandlers;
  self->_messagePushHandlers = v8;

  v10 = objc_alloc(&OBJC_CLASS___MessagePushHandler);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 idsAccount]);
  uint64_t v12 = -[MessagePushHandler initWithIDSAccount:](v10, "initWithIDSAccount:", v11);

  -[MessagePushHandler addListener:](v12, "addListener:", self);
  -[NSMutableArray addObject:](self->_messagePushHandlers, "addObject:", v12);
}

- (void)_registerReadReceiptSettingReflection
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("MessageService");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Setting up darwin notification observer for read receipts", buf, 2u);
    }
  }

  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  uint64_t v5 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_5BF8;
  v6[3] = &unk_D5790;
  objc_copyWeak(&v7, (id *)buf);
  v6[4] = self;
  dword_E4500 = IMDispatchForNotify( "com.apple.MobileSMS.ReadReceiptsEnabled.shouldUpdateDevices",  0LL,  &_dispatch_main_q,  v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)_registerKeepMessagesSettingReflection
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("MessageService");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "Setting up darwin notification observer for Keep Messages Updated",  buf,  2u);
    }
  }

  *(void *)buf = 0LL;
  objc_initWeak((id *)buf, self);
  uint64_t v5 = IMSettingsKeepMessagesPrefShouldUpdateNotification;
  uint64_t v6 = &_dispatch_main_q;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_6164;
  v15[3] = &unk_D57B8;
  objc_copyWeak(&v16, (id *)buf);
  dword_E4504 = IMDispatchForNotify(v5, 0LL, &_dispatch_main_q, v15);

  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("MessageService");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "Setting up darwin notification observer for Keep Messages Reset",  v14,  2u);
    }
  }

  uint64_t v11 = IMSettingsKeepMessagesShouldResetPrefNotification;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_62F8;
  v12[3] = &unk_D57B8;
  objc_copyWeak(&v13, (id *)buf);
  IMDispatchForNotify(v11, 0LL, &_dispatch_main_q, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)dealloc
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("Message");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Dealloc", buf, 2u);
    }
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v5 = self->_messagePushHandlers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v16,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)i) removeListener:self];
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v16,  16LL);
    }

    while (v6);
  }

  if (dword_E4500 != -1)
  {
    notify_cancel(dword_E4500);
    dword_E4500 = -1;
  }

  if (dword_E4504 != -1)
  {
    notify_cancel(dword_E4504);
    dword_E4504 = -1;
  }

  -[IMTimer invalidate](self->_resetFailureRetriesTimer, "invalidate");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 removeObserver:self name:0 object:0];

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  -[MessageServiceSession dealloc](&v10, "dealloc");
}

- (IMDMessageStore)messageStore
{
  messageStore = self->_messageStore;
  if (!messageStore)
  {
    id v4 = (IMDMessageStore *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    uint64_t v5 = self->_messageStore;
    self->_messageStore = v4;

    messageStore = self->_messageStore;
  }

  return messageStore;
}

- (id)chatStore
{
  return +[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance");
}

- (IMDCKUtilities)ckUtilities
{
  ckUtilities = self->_ckUtilities;
  if (!ckUtilities)
  {
    id v4 = (IMDCKUtilities *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
    uint64_t v5 = self->_ckUtilities;
    self->_ckUtilities = v4;

    ckUtilities = self->_ckUtilities;
  }

  return ckUtilities;
}

- (void)addAccount:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  id v4 = a3;
  -[MessageServiceSession addAccount:](&v8, "addAccount:", v4);
  uint64_t v5 = objc_alloc(&OBJC_CLASS___MessagePushHandler);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsAccount", v8.receiver, v8.super_class));

  uint64_t v7 = -[MessagePushHandler initWithIDSAccount:](v5, "initWithIDSAccount:", v6);
  -[MessagePushHandler addListener:](v7, "addListener:", self);
  -[NSMutableArray addObject:](self->_messagePushHandlers, "addObject:", v7);
}

- (void)removeAccount:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  -[MessageServiceSession removeAccount:](&v19, "removeAccount:", v4);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = self->_messagePushHandlers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v6)
  {
    id v7 = v6;
    objc_super v8 = 0LL;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 account]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 idsAccount]);

        if (v12 == v13)
        {
          id v14 = v11;

          objc_super v8 = v14;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v7);
  }

  else
  {
    objc_super v8 = 0LL;
  }

  [v8 removeListener:self];
  -[NSMutableArray removeObject:](self->_messagePushHandlers, "removeObject:", v8);
}

- (void)refreshRegistration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMUnlockMonitor sharedInstance](&OBJC_CLASS___IMUnlockMonitor, "sharedInstance"));
  unsigned __int8 v3 = [v2 isUnderFirstDataProtectionLock];

  if ((v3 & 1) == 0)
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v4 = [(id)objc_opt_class(self) idsAccounts];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = [v5 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v36;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v36 != v7) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v35 + 1) + 8 * (void)i) _validateIDSAccount])
          {
            uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
            [v9 idsAccountsDidChange];

            objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDNicknameController sharedInstance]( &OBJC_CLASS___IMDNicknameController,  "sharedInstance"));
            [v10 evaluateAccountStateForFeatureEligibility];

            goto LABEL_12;
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v35 objects:v46 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (id)fallBackBizIDSAccount
{
  id v2 = [(id)objc_opt_class(self) idsAccounts];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v17;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v3);
      }
      objc_super v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
      if (objc_msgSend(v8, "serviceType", (void)v16) == 1)
      {
        BOOL v9 = [v8 accountType] == 0;
        id v10 = v8;

        uint64_t v5 = v10;
        if (v9) {
          break;
        }
      }

      if (v4 == (id)++v7)
      {
        id v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
        id v10 = v5;
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    id v10 = 0LL;
  }

  if (IMOSLoggingEnabled(v11, v12))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "MessageServiceSession: Using fallbackBizIDSAccount %@", buf, 0xCu);
    }
  }

  return v10;
}

- (id)idsAccountForFromURI:(id)a3 toURI:(id)a4
{
  id v6 = a3;
  int IsBusinessID = IMStringIsBusinessID(a4);
  objc_super v8 = &IDSServiceNameiMessageForBusiness;
  if (!IsBusinessID) {
    objc_super v8 = &IDSServiceNameiMessage;
  }
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession idsAccountForURI:IDSServiceName:]( self,  "idsAccountForURI:IDSServiceName:",  v6,  *v8));

  return v9;
}

- (id)bizIDSAccountFromMadridIDSAccount:(id)a3
{
  id v4 = a3;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v5 = objc_msgSend((id)objc_opt_class(self), "idsAccounts", 0);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ([v10 isBizAccount])
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 loginID]);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 loginID]);
          unsigned int v13 = [v11 isEqualToString:v12];

          if (v13)
          {
            if (IMOSLoggingEnabled(v14, v15))
            {
              uint64_t v17 = OSLogHandleForIMFoundationCategory("MessageService");
              __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                id v19 = (id)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
                v20 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
                *(_DWORD *)buf = 138412546;
                id v27 = v19;
                __int16 v28 = 2112;
                v29 = v20;
                _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Found Biz IDSAccount %@ for Madrid IDSAccount %@",  buf,  0x16u);
              }
            }

            id v16 = v10;
            goto LABEL_16;
          }
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v16 = 0LL;
LABEL_16:

  return v16;
}

- (id)_firstiMessageChat
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 chats]);

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
        unsigned int v9 = [v8 isEqualToString:IMServiceNameiMessage];

        if (v9)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)sessionDidBecomeActive
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  -[MessageServiceSession sessionDidBecomeActive](&v13, "sessionDidBecomeActive");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMUnlockMonitor sharedInstance](&OBJC_CLASS___IMUnlockMonitor, "sharedInstance"));
  unsigned __int8 v4 = [v3 isUnderFirstDataProtectionLock];

  int v7 = IMOSLoggingEnabled(v5, v6);
  if ((v4 & 1) == 0)
  {
    if (v7)
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory("IMDServiceSession");
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 v12 = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Scheduling routing, expire timer before first unlock", v12, 2u);
      }
    }

    -[MessageServiceSession _updateRoutingTimerWithInterval:](self, "_updateRoutingTimerWithInterval:", 60.0);
    -[MessageServiceSession _updateExpireStateTimerWithInterval:](self, "_updateExpireStateTimerWithInterval:", 60.0);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession scheduledMessageCoordinator](self, "scheduledMessageCoordinator"));
    [v9 updateTimerForTimeInterval:60.0];
    goto LABEL_10;
  }

  if (v7)
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("IMDServiceSession");
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 v12 = 0;
      _os_log_impl( &dword_0,  (os_log_t)v9,  OS_LOG_TYPE_INFO,  "Not scheduling routing and expire timer before first unlock",  v12,  2u);
    }

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("Message");
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[MessageServiceSession sessionWillBecomeInactiveWithAccount:]";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  -[MessageServiceSession sessionWillBecomeInactiveWithAccount:](&v8, "sessionWillBecomeInactiveWithAccount:", v4);
  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
}

- (void)refreshServiceCapabilities
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession accounts](self, "accounts", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      int v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v7);
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcaster](self, "broadcaster"));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 accountID]);
        objc_msgSend( v9,  "account:capabilitiesChanged:",  v10,  -[MessageServiceSession capabilities](self, "capabilities"));

        int v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }
}

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession accountID](self, "accountID"));
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2048;
      double v17 = a4;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEBUG,  " Enqueued item for key: %@    timeout: %f",  (uint8_t *)&v14,  0x16u);
    }
  }

  +[IMMultiQueue im_enqueuiMessageBlock:withTimeout:description:]( &OBJC_CLASS___IMMultiQueue,  "im_enqueuiMessageBlock:withTimeout:description:",  v8,  v9,  a4);
}

- (BOOL)_updateReadReceiptProperties:(id)a3 withIncomingProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = IMChatPropertyReadReceiptsSettingVersionKey;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 _numberForKey:IMChatPropertyReadReceiptsSettingVersionKey]);
  uint64_t v9 = IMChatPropertyEnableReadReceiptForChatKey;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 _numberForKey:IMChatPropertyEnableReadReceiptForChatKey]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 _numberForKey:@"vR"]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 _numberForKey:@"eR"]);
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v23 = 138413058;
      __int128 v24 = v8;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      __int16 v28 = v11;
      __int16 v29 = 2112;
      objc_super v30 = v12;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "trying to update chat properties: localReadReceiptVersionID: %@ localReadReceiptValue: %@ incomingReadReceiptVer sionID: %@ incomingReadReceiptValue: %@",  (uint8_t *)&v23,  0x2Au);
    }
  }

  if ((v8 || (id v17 = [v11 integerValue], (uint64_t)v17 <= 0))
    && (id v16 = [v11 integerValue], v17 = objc_msgSend(v8, "integerValue"), (uint64_t)v16 <= (uint64_t)v17))
  {
    BOOL v19 = 0;
  }

  else
  {
    if (IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory("MessageService");
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v23 = 138413058;
        __int128 v24 = v8;
        __int16 v25 = 2112;
        id v26 = v11;
        __int16 v27 = 2112;
        __int16 v28 = v10;
        __int16 v29 = 2112;
        objc_super v30 = v12;
        _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "Updated read receipt version number from %@ to %@ and read receipt value from %@ to %@",  (uint8_t *)&v23,  0x2Au);
      }
    }

    if (v11) {
      [v5 setObject:v11 forKey:v7];
    }
    if (v12) {
      [v5 setObject:v12 forKey:v9];
    }
    BOOL v19 = 1;
  }

  return v19;
}

- (void)_updateChatProperties:(id)a3 withProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 properties]);
  id v9 = [v8 mutableCopy];

  if (-[MessageServiceSession _updateReadReceiptProperties:withIncomingProperties:]( self,  "_updateReadReceiptProperties:withIncomingProperties:",  v9,  v7))
  {
    [v6 updateProperties:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
    [v10 chat:v11 propertiesUpdated:v9];

    if (IMOSLoggingEnabled(v12, v13))
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412546;
        id v17 = v6;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Updated chat properties for chat: %@ properties: %@",  (uint8_t *)&v16,  0x16u);
      }
    }
  }
}

- (void)_checkGlobalReadReceiptValueAndUpdateIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession globalReadReceiptSettingVersion](self, "globalReadReceiptSettingVersion"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"gV"]);
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("MessageService");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "Local global read receipt id: %@ incoming global read receipt id: %@",  (uint8_t *)&v16,  0x16u);
    }
  }

  id v10 = [v6 integerValue];
  id v11 = [v5 integerValue];
  if ((uint64_t)v10 > (uint64_t)v11)
  {
    if (IMOSLoggingEnabled(v11, v12))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "Incoming global id is higher than local...so updating",  (uint8_t *)&v16,  2u);
      }
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"gR"]);
    -[MessageServiceSession _updateGlobalReadReceiptValue:withVersionID:]( self,  "_updateGlobalReadReceiptValue:withVersionID:",  [v15 BOOLValue],  v6);
  }
}

- (void)_updateGlobalReadReceiptValue:(BOOL)a3 withVersionID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = -[MessageServiceSession readReceiptsGloballyEnabled](self, "readReceiptsGloballyEnabled");
  int v8 = (int)v7;
  if (IMOSLoggingEnabled(v7, v9))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("MessageService");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109376;
      v13[1] = v4;
      __int16 v14 = 1024;
      int v15 = v8;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "Updating global read receipt value to: %d from: %d",  (uint8_t *)v13,  0xEu);
    }
  }

  -[MessageServiceSession setGlobalReadReceiptSettingVersion:](self, "setGlobalReadReceiptSettingVersion:", v6);
  -[MessageServiceSession setReadReceiptsGloballyEnabled:](self, "setReadReceiptsGloballyEnabled:", v4);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.MobileSMS.ReadReceiptsEnabled.changed",  0LL,  0LL,  1u);
  -[MessageServiceSession overwritePerChatReadReceiptSettingsWithGlobalValue:]( self,  "overwritePerChatReadReceiptSettingsWithGlobalValue:",  v4);
}

- (id)_URIsFromHandles:(id)a3
{
  return URIsFromHandles(a3);
}

- (void)_UpdateLastAddressedSIMIDForOtherServicesIfNeededWithChatIdentifier:(id)a3 style:(unsigned __int8)a4
{
}

- (void)_reAttemptMessageDeliveryForGUID:(id)a3 toIdentifier:(id)a4 fromIdentifier:(id)a5 fromIDSID:(id)a6 isReflection:(BOOL)a7 shouldShowError:(BOOL)a8 cacheFlushError:(BOOL)a9 imdAccount:(id)a10
{
  BOOL v91 = a8;
  id v15 = a3;
  id v92 = a4;
  id v16 = a5;
  id v17 = a6;
  id v93 = a10;
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession messageStore](self, "messageStore"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 messageWithGUID:v15]);

  int v22 = IMOSLoggingEnabled(v20, v21);
  if (!v19)
  {
    if (v22)
    {
      uint64_t v43 = OSLogHandleForIMEventCategory("MessageService");
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v101 = v15;
        _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, " Unable to find message with ID: %@", buf, 0xCu);
      }

      goto LABEL_23;
    }

- (void)handler:(id)a3 receivedError:(id)a4 forMessageID:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13 additionalInfo:(id)a14 shouldShowPeerErrors:(BOOL)a15
{
  id v21 = a3;
  v113 = (__CFString *)a4;
  int v22 = (__CFString *)a5;
  id v23 = a6;
  __int128 v24 = (__CFString *)a7;
  v109 = (__CFString *)a8;
  id v106 = a9;
  __int16 v25 = self;
  v112 = (__CFString *)a10;
  id v110 = a11;
  id v111 = a12;
  id v26 = a13;
  v108 = (__CFString *)a14;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](self, "registeredURIs"));
  if (!v28 && IMOSLoggingEnabled(0LL, v27))
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "receivedError - No bindings !!", buf, 2u);
    }
  }

  if ([v28 containsObject:v23])
  {
    unsigned int v31 = 0;
    if (v23 && v24) {
      unsigned int v31 = [v23 isEqualToString:v24];
    }
    unsigned __int8 v32 = [v26 unsignedIntValue];
    id v33 = [v26 unsignedIntValue];
    char v107 = (char)v33;
    id v35 = (id)IMOSLoggingEnabled(v33, v34);
    if ((_DWORD)v35)
    {
      uint64_t v37 = OSLogHandleForIMEventCategory("MessageService");
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        uint64_t v39 = @"NO";
        *(_DWORD *)buf = 138414338;
        v115 = v113;
        if (a15) {
          uint64_t v40 = @"YES";
        }
        else {
          uint64_t v40 = @"NO";
        }
        if (v31) {
          __int16 v41 = @"YES";
        }
        else {
          __int16 v41 = @"NO";
        }
        if ((v32 & 1) != 0) {
          id v42 = @"YES";
        }
        else {
          id v42 = @"NO";
        }
        if ((v107 & 2) != 0) {
          uint64_t v39 = @"YES";
        }
        __int16 v116 = 2112;
        v117 = v24;
        __int16 v118 = 2112;
        id v119 = v23;
        __int16 v120 = 2112;
        v121 = v109;
        __int16 v122 = 2112;
        v123 = v22;
        __int16 v124 = 2112;
        v125 = v40;
        __int16 v126 = 2112;
        v127 = v41;
        __int16 v128 = 2112;
        v129 = v42;
        __int16 v130 = 2112;
        v131 = v39;
        _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_INFO,  "Received error: %@ from ID: %@ to ID: %@ from token: %@  for messageID: %@  showError: %@  reflection: %@  fro m storage: %@  last from storage: %@",  buf,  0x5Cu);
      }
    }

    if (v31)
    {
      if (IMOSLoggingEnabled(v35, v36))
      {
        uint64_t v43 = OSLogHandleForIMEventCategory("MessageService");
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "Early returning for reflected error", buf, 2u);
        }
      }

      goto LABEL_140;
    }

    if ((v107 & 2) != 0)
    {
      id v35 = -[MessageServiceSession noteLastItemFromStorage:](v25, "noteLastItemFromStorage:", v22);
    }

    else if ((v32 & 1) != 0)
    {
      id v35 = -[MessageServiceSession noteItemFromStorage:](v25, "noteItemFromStorage:", v22);
    }

    if (IMOSLoggingEnabled(v35, v36))
    {
      uint64_t v45 = OSLogHandleForIMFoundationCategory("MessageService");
      unint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        unint64_t v47 = @"YES";
        *(_DWORD *)buf = 138412802;
        v115 = v112;
        __int16 v116 = 2112;
        if (!v110) {
          unint64_t v47 = @"NO";
        }
        v117 = v47;
        __int16 v118 = 2112;
        id v119 = v111;
        _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_INFO,  "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@",  buf,  0x20u);
      }
    }

    signed int v48 = -[__CFString intValue](v113, "intValue");
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v21 account]);
    __int16 v104 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](v25, "imdAccountForIDSAccount:", v49));

    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](v25, "deliveryController"));
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString _stripFZIDPrefix](v24, "_stripFZIDPrefix"));
    v105 = (__CFString *)objc_claimAutoreleasedReturnValue([v50 activeDeviceForHandle:v51]);

    uint64_t v52 = objc_claimAutoreleasedReturnValue(-[__CFString idsDestination](v105, "idsDestination"));
    id v103 = (void *)v52;
    if (v48 <= 399LL)
    {
      if (v48 > 199LL)
      {
        if (v48 == 200LL)
        {
          if (IMOSLoggingEnabled(v52, v53))
          {
            uint64_t v82 = OSLogHandleForIMEventCategory("MessageService");
            uint64_t v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
            if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              v115 = v22;
              __int16 v116 = 2112;
              v117 = v105;
              __int16 v118 = 2112;
              id v119 = v103;
              __int16 v120 = 2112;
              v121 = v112;
              _os_log_impl( &dword_0,  v83,  OS_LOG_TYPE_INFO,  " => Pair decryption failure for messageID: %@ activeDevice: %@ activeIDSdestination: %@ fromIDSID: %@",  buf,  0x2Au);
            }
          }

          id v84 = -[MessageServiceSession isReplicating](v25, "isReplicating");
          if ((v84 & 1) == 0)
          {
            LOBYTE(v101) = 0;
            -[MessageServiceSession _reAttemptMessageDeliveryForGUID:toIdentifier:fromIdentifier:fromIDSID:isReflection:shouldShowError:cacheFlushError:imdAccount:]( v25,  "_reAttemptMessageDeliveryForGUID:toIdentifier:fromIdentifier:fromIDSID:isReflection:shouldShowError:cacheF lushError:imdAccount:",  v22,  v23,  v24,  v112,  0LL,  a15,  v101,  v104);
            goto LABEL_137;
          }

          if (IMOSLoggingEnabled(v84, v85))
          {
            uint64_t v86 = OSLogHandleForIMFoundationCategory("MessageService");
            uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v115 = v22;
              _os_log_impl( &dword_0,  v81,  OS_LOG_TYPE_INFO,  "Not reattempting delivery of guid %@, this is a replicating session",  buf,  0xCu);
            }

            goto LABEL_130;
          }

          goto LABEL_137;
        }

        if (v48 != 201LL)
        {
          if (v48 == 250LL)
          {
            if (IMOSLoggingEnabled(v52, v53))
            {
              uint64_t v68 = OSLogHandleForIMEventCategory("MessageService");
              v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v115 = v22;
                _os_log_impl( &dword_0,  v69,  OS_LOG_TYPE_INFO,  " => Remote encryption credentials are invalid failure for messageID: %@",  buf,  0xCu);
              }
            }

            -[MessageServiceSession didReceiveError:forMessageID:forceError:account:]( v25,  "didReceiveError:forMessageID:forceError:account:",  40LL,  v22,  a15,  v104);
            goto LABEL_137;
          }

          goto LABEL_127;
        }

        if (IMOSLoggingEnabled(v52, v53))
        {
          uint64_t v87 = OSLogHandleForIMEventCategory("MessageService");
          uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v115 = v22;
            _os_log_impl(&dword_0, v88, OS_LOG_TYPE_INFO, " => Pair encryption failure for messageID: %@", buf, 0xCu);
          }
        }

- (void)handler:(id)a3 messageIDDelivered:(id)a4 toIdentifier:(id)a5 status:(id)a6 deliveryContext:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v49 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v48 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  uint64_t v26 = IMOSLoggingEnabled(v24, v25);
  if ((_DWORD)v26)
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v17;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_INFO,  "Received delivery receipt control message for message: %@",  buf,  0xCu);
    }
  }

  uint64_t v30 = IMOSLoggingEnabled(v26, v27);
  if ((_DWORD)v30)
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory("DeliveryStatus");
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v20;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "context: %@", buf, 0xCu);
    }
  }

  if (IMOSLoggingEnabled(v30, v31))
  {
    uint64_t v34 = OSLogHandleForIMFoundationCategory("MessageService");
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = @"YES";
      *(_DWORD *)buf = 138412802;
      id v63 = v21;
      __int16 v64 = 2112;
      if (!v22) {
        uint64_t v36 = @"NO";
      }
      uint64_t v65 = v36;
      __int16 v66 = 2112;
      id v67 = v23;
      _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@",  buf,  0x20u);
    }
  }

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_9D20;
  v51[3] = &unk_D5808;
  v51[4] = self;
  id v52 = v19;
  id v53 = v17;
  id v54 = v49;
  id v55 = v24;
  id v56 = v20;
  uint64_t v37 = v24;
  id v57 = v48;
  id v58 = v18;
  id v59 = v21;
  id v60 = v22;
  id v61 = v23;
  id v47 = v23;
  id v46 = v22;
  id v45 = v21;
  id v38 = v18;
  id v39 = v48;
  id v40 = v20;
  id v41 = v37;
  id v42 = v49;
  id v43 = v17;
  id v44 = v19;
  -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v51,  @"delivery receipt",  45.0);
}

- (void)handler:(id)a3 messageIDReflectedDelivered:(id)a4 incomingMessage:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 status:(id)a8 deliveryContext:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14
{
  id v60 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v55 = a7;
  id v57 = a8;
  id v58 = a9;
  id v61 = a10;
  id v62 = a11;
  id v63 = a12;
  id v23 = a13;
  id v59 = a14;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](self, "registeredURIs"));
  if (!v25 && IMOSLoggingEnabled(0LL, v24))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "messageIDRead - No bindings !!", buf, 2u);
    }
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession loginID](self, "loginID", v55));
  unsigned int v29 = [v28 isEqualToIgnoringCase:@"e:___TESTACCOUNT___@___TESTACCOUNT___.com"];

  LODWORD(v28) = [v22 isEqualToIgnoringCase:IDSDefaultPairedDevice];
  if (([v25 containsObject:v22] | v29 | v28) == 1)
  {
    if ([v21 length])
    {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v21 _FTOptionallyDecompressData]);
      uint64_t v31 = ((uint64_t (*)(void))JWDecodeDictionary)();
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

      if (IMOSLoggingEnabled(v33, v34))
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v74 = v32;
          _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "Decrypted message from reflected delivery receipt handler messageDictionary: %@",  buf,  0xCu);
        }
      }

      id v37 = [v32 count];
      if (!v37)
      {
        uint64_t v39 = JWDecodeDictionary(v21);
        uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);

        id v37 = (id)IMOSLoggingEnabled(v41, v42);
        if ((_DWORD)v37)
        {
          uint64_t v43 = OSLogHandleForIMFoundationCategory("MessageService");
          id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v44,  OS_LOG_TYPE_INFO,  "Faild to decrypt, trying a simpler decode for reflected delivery receipt",  buf,  2u);
          }
        }

        uint64_t v32 = (void *)v40;
        if (!v40)
        {
          id v37 = (id)IMOSLoggingEnabled(v37, v38);
          if ((_DWORD)v37)
          {
            uint64_t v45 = OSLogHandleForIMFoundationCategory("MessageService");
            id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "BAD DATA for reflected delivery receipt", buf, 2u);
            }
          }

          uint64_t v32 = 0LL;
        }
      }

      if (IMOSLoggingEnabled(v37, v38))
      {
        uint64_t v47 = OSLogHandleForIMFoundationCategory("MessageService");
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v48,  OS_LOG_TYPE_INFO,  "Checking if we need to update the global read receipt value and updating if necessary",  buf,  2u);
        }
      }

      id v49 = -[MessageServiceSession _checkGlobalReadReceiptValueAndUpdateIfNeeded:]( self,  "_checkGlobalReadReceiptValueAndUpdateIfNeeded:",  v32);
      if (IMOSLoggingEnabled(v49, v50))
      {
        uint64_t v51 = OSLogHandleForIMFoundationCategory("MessageService");
        id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "Updating chat properties upon reflected delivery", buf, 2u);
        }
      }

      id v53 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
      id v54 = (void *)objc_claimAutoreleasedReturnValue([v53 chatForMessageGUID:v20]);

      -[MessageServiceSession _updateChatProperties:withProperties:]( self,  "_updateChatProperties:withProperties:",  v54,  v32);
    }

    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_A990;
    v64[3] = &unk_D5830;
    id v65 = v20;
    id v66 = v23;
    id v67 = v62;
    id v68 = v63;
    v69 = self;
    id v70 = v61;
    id v71 = v60;
    id v72 = v22;
    -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v64,  @"reflected delivery receipt",  45.0);
  }
}

- (void)handler:(id)a3 messageIDRead:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v45 = a3;
  id v18 = a4;
  id v19 = a5;
  id v46 = a6;
  id v47 = a7;
  id v48 = a8;
  id v20 = a9;
  id v49 = a10;
  id v21 = (uint64_t (*)(uint64_t, uint64_t))a11;
  id v22 = a12;
  uint64_t v23 = objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](self, "registeredURIs"));
  uint64_t v25 = (void *)v23;
  if (!v23)
  {
    uint64_t v23 = IMOSLoggingEnabled(0LL, v24);
    if ((_DWORD)v23)
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "messageIDRead - No bindings !!", buf, 2u);
      }
    }
  }

  uint64_t v28 = IMOSLoggingEnabled(v23, v24);
  if ((_DWORD)v28)
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Received read receipt for guid:%@ fromIDSID:%@", buf, 0x16u);
    }
  }

  if (IMOSLoggingEnabled(v28, v29))
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = @"YES";
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      if (!v49) {
        uint64_t v34 = @"NO";
      }
      *(void *)&buf[14] = v34;
      *(_WORD *)&buf[22] = 2112;
      __int16 v64 = v21;
      _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@",  buf,  0x20u);
    }
  }

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession loginID](self, "loginID"));
  unsigned int v36 = [v35 isEqualToIgnoringCase:@"e:___TESTACCOUNT___@___TESTACCOUNT___.com"];

  LODWORD(v35) = [v19 isEqualToIgnoringCase:IDSDefaultPairedDevice];
  if (([v25 containsObject:v19] | v36 | v35) == 1)
  {
    unsigned __int8 v37 = [v22 unsignedIntValue];
    id v38 = [v22 unsignedIntValue];
    char v40 = (char)v38;
    int v41 = v37 & 1;
    if ((v38 & 2) != 0)
    {
      id v38 = -[MessageServiceSession noteLastItemFromStorage:](self, "noteLastItemFromStorage:", v18);
    }

    else if ((v37 & 1) != 0)
    {
      id v38 = -[MessageServiceSession noteItemFromStorage:](self, "noteItemFromStorage:", v18);
    }

    if (IMOSLoggingEnabled(v38, v39))
    {
      uint64_t v42 = OSLogHandleForIMFoundationCategory("MessageSuppression");
      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "Message Read message", buf, 2u);
      }
    }

    unsigned int v44 = v40 & 2;
    if (v44 | v41) {
      -[MessageServiceSession incrementPendingReadReceiptFromStorageCount]( self,  "incrementPendingReadReceiptFromStorageCount");
    }
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    __int16 v64 = sub_B17C;
    id v65 = sub_B18C;
    id v66 = 0LL;
    id v66 = [[IMPowerAssertion alloc] initWithIdentifier:@"IncomingReadReceiptAssertion" timeout:10.0];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_B194;
    v50[3] = &unk_D5858;
    char v61 = v41;
    char v62 = v44 >> 1;
    v50[4] = self;
    id v51 = v46;
    id v52 = v19;
    id v53 = v18;
    id v54 = v47;
    id v55 = v48;
    id v56 = v20;
    id v57 = v21;
    id v58 = v49;
    id v59 = v45;
    id v60 = buf;
    -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v50,  @"reflected read receipt",  45.0);

    _Block_object_dispose(buf, 8);
  }
}

- (void)handler:(id)a3 messageIDPlayed:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v41 = a3;
  id v18 = a4;
  id v19 = a5;
  id v43 = a6;
  id v44 = a7;
  id v45 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = (uint64_t (*)(uint64_t, uint64_t))a11;
  id v23 = a12;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](self, "registeredURIs"));
  if (!v25 && IMOSLoggingEnabled(0LL, v24))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "messageIDPlayed - No bindings !!", buf, 2u);
    }
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession loginID](self, "loginID", v41));
  unsigned int v29 = [v28 isEqualToIgnoringCase:@"e:___TESTACCOUNT___@___TESTACCOUNT___.com"];

  LODWORD(v28) = [v19 isEqualToIgnoringCase:IDSDefaultPairedDevice];
  if (([v25 containsObject:v19] | v29 | v28) == 1)
  {
    unsigned __int8 v30 = [v23 unsignedIntValue];
    id v31 = [v23 unsignedIntValue];
    char v33 = (char)v31;
    if ((v31 & 2) != 0)
    {
      id v31 = -[MessageServiceSession noteLastItemFromStorage:](self, "noteLastItemFromStorage:", v18);
    }

    else if ((v30 & 1) != 0)
    {
      id v31 = -[MessageServiceSession noteItemFromStorage:](self, "noteItemFromStorage:", v18);
    }

    uint64_t v34 = IMOSLoggingEnabled(v31, v32);
    if ((_DWORD)v34)
    {
      uint64_t v36 = OSLogHandleForIMFoundationCategory("MessageSuppression");
      unsigned __int8 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Message Played message", buf, 2u);
      }
    }

    if (IMOSLoggingEnabled(v34, v35))
    {
      uint64_t v38 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        char v40 = @"YES";
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        if (!v21) {
          char v40 = @"NO";
        }
        *(void *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2112;
        id v60 = v22;
        _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_INFO,  "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@",  buf,  0x20u);
      }
    }

    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    id v60 = sub_B17C;
    char v61 = sub_B18C;
    id v62 = 0LL;
    id v62 = [[IMPowerAssertion alloc] initWithIdentifier:@"IncomingPlayedReceiptAssertion" timeout:10.0];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_B9F0;
    v46[3] = &unk_D5880;
    id v47 = v43;
    id v48 = v19;
    id v49 = v18;
    id v50 = v44;
    id v51 = self;
    id v52 = v45;
    id v53 = v20;
    id v54 = v22;
    id v55 = v21;
    char v58 = (v33 & 2) >> 1;
    id v56 = v42;
    id v57 = buf;
    -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v46,  @"reflected played receipt",  45.0);

    _Block_object_dispose(buf, 8);
  }
}

- (void)handler:(id)a3 messageIDSaved:(id)a4 ofType:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 groupContext:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14
{
  id v42 = a3;
  id v20 = a4;
  id v43 = a5;
  id v21 = a6;
  id v44 = a7;
  id v45 = a8;
  id v46 = a9;
  id v47 = a10;
  id v48 = a11;
  id v22 = a12;
  id v23 = (uint64_t (*)(uint64_t, uint64_t))a13;
  id v24 = a14;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](self, "registeredURIs"));
  if (!v26 && IMOSLoggingEnabled(0LL, v25))
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "messageIDSaved - No bindings !!", buf, 2u);
    }
  }

  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession loginID](self, "loginID"));
  unsigned int v30 = [v29 isEqualToIgnoringCase:@"e:___TESTACCOUNT___@___TESTACCOUNT___.com"];

  LODWORD(v29) = [v21 isEqualToIgnoringCase:IDSDefaultPairedDevice];
  if (([v26 containsObject:v21] | v30 | v29) == 1)
  {
    unsigned __int8 v31 = [v24 unsignedIntValue];
    id v32 = [v24 unsignedIntValue];
    char v34 = (char)v32;
    if ((v32 & 2) != 0)
    {
      id v32 = -[MessageServiceSession noteLastItemFromStorage:](self, "noteLastItemFromStorage:", v20);
    }

    else if ((v31 & 1) != 0)
    {
      id v32 = -[MessageServiceSession noteItemFromStorage:](self, "noteItemFromStorage:", v20);
    }

    uint64_t v35 = IMOSLoggingEnabled(v32, v33);
    if ((_DWORD)v35)
    {
      uint64_t v37 = OSLogHandleForIMFoundationCategory("MessageSuppression");
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "Message Saved message", buf, 2u);
      }
    }

    if (IMOSLoggingEnabled(v35, v36))
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory("MessageService");
      char v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = @"YES";
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        if (!v22) {
          id v41 = @"NO";
        }
        *(void *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2112;
        id v65 = v23;
        _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@",  buf,  0x20u);
      }
    }

    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    id v65 = sub_B17C;
    id v66 = sub_B18C;
    id v67 = 0LL;
    id v67 = [[IMPowerAssertion alloc] initWithIdentifier:@"IncomingSavedReceiptAssertion" timeout:10.0];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_C140;
    v49[3] = &unk_D58A8;
    id v50 = v44;
    id v51 = v21;
    id v52 = v20;
    id v53 = v46;
    id v54 = self;
    id v55 = v45;
    id v56 = v43;
    id v57 = v47;
    id v58 = v42;
    id v59 = v48;
    id v60 = v23;
    char v63 = (v34 & 2) >> 1;
    id v61 = v22;
    id v62 = buf;
    -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v49,  @"reflected saved receipt",  45.0);

    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)_isAllowlistedUnencryptedSender:(id)a3
{
  id v3 = a3;
  if (IMStringIsEmail(v3)
    && ((id v4 = [v3 hasSuffix:@".apple.com"], (v4 & 1) != 0)
     || (id v4 = [v3 hasSuffix:@"@apple.com"], (_DWORD)v4)))
  {
    if (IMOSLoggingEnabled(v4, v5))
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory("MessageService");
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v3;
        _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "Received message from allowlisted unencrypted sender %@",  (uint8_t *)&v10,  0xCu);
      }
    }

    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldIgnoreMessageFromSender:(id)a3 balloonBID:(id)a4 fromMe:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = (![v7 length] || !a5)
    && (![v7 length]
     || (IMStringIsBusinessID(v7) & 1) == 0
     && [v8 containsString:IMBalloonPluginIdentifierBusiness]);

  return v9;
}

- (BOOL)_isRegisteredURI:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v5 = [(id)objc_opt_class(self) idsAccounts];
    id obj = (id)objc_claimAutoreleasedReturnValue(v5);
    id v27 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v27)
    {
      uint64_t v6 = *(void *)v34;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "im_registeredURIs"));
          id v10 = [v9 countByEnumeratingWithState:&v29 objects:v41 count:16];
          id v12 = v10;
          if (v10)
          {
            uint64_t v13 = *(void *)v30;
            while (2)
            {
              __int16 v14 = 0LL;
              do
              {
                if (*(void *)v30 != v13) {
                  objc_enumerationMutation(v9);
                }
                id v15 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v14);
                if (IMOSLoggingEnabled(v10, v11))
                {
                  uint64_t v16 = OSLogHandleForIMFoundationCategory("MessageService");
                  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v38 = v15;
                    __int16 v39 = 2112;
                    char v40 = v8;
                    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Registered URI %@ for account %@", buf, 0x16u);
                  }
                }

                id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 _stripFZIDPrefix]);
                unsigned __int8 v19 = [v15 isEqualToIgnoringCase:v18];

                if ((v19 & 1) != 0)
                {

                  BOOL v24 = 1;
                  goto LABEL_27;
                }

                __int16 v14 = (char *)v14 + 1;
              }

              while (v12 != v14);
              id v10 = [v9 countByEnumeratingWithState:&v29 objects:v41 count:16];
              id v12 = v10;
              if (v10) {
                continue;
              }
              break;
            }
          }

          uint64_t v6 = v26;
        }

        id v27 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
        uint64_t v6 = v26;
      }

      while (v27);
    }

    if (IMOSLoggingEnabled(v20, v21))
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory("MessageService");
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v4;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "URI %@ is not in registered URI set", buf, 0xCu);
      }
    }
  }

  BOOL v24 = 0;
LABEL_27:

  return v24;
}

- (BOOL)_isFromLinkedID:(id)a3 fromID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "Checking isFromLinkedID toID %@ and fromID %@",  (uint8_t *)&v13,  0x16u);
    }
  }

  BOOL v11 = 0;
  if (v6 && v7)
  {
    if (-[MessageServiceSession _isRegisteredURI:](self, "_isRegisteredURI:", v6)) {
      BOOL v11 = -[MessageServiceSession _isRegisteredURI:](self, "_isRegisteredURI:", v7);
    }
    else {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)_computeFlagsForIncomingMessage:(unint64_t)a3 isFromMe:(BOOL)a4 unfinished:(BOOL)a5 isAudioMessage:(BOOL)a6 isAutoReply:(BOOL)a7 isExpirable:(BOOL)a8 messageSource:(unint64_t)a9 participants:(id)a10 hasUnseenMention:(BOOL)a11 isSOS:(BOOL)a12 isCritical:(BOOL)a13
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  BOOL v15 = a6;
  BOOL v16 = a5;
  if (a4)
  {
    id v18 = [a10 count];
    uint64_t v19 = 32772LL;
    a3 |= v19;
  }

  unint64_t v20 = a3 | !v16;
  if (v15) {
    v20 |= 0x200000uLL;
  }
  if (v14) {
    v20 |= 0x40uLL;
  }
  if (v13) {
    v20 |= 0x1000000uLL;
  }
  if (a9 == 1) {
    v20 |= 0x2000000uLL;
  }
  if (a11) {
    v20 |= 0x10000000uLL;
  }
  if (a12) {
    v20 |= 0x8000000000uLL;
  }
  if (a13) {
    return v20 | 0x4000000000LL;
  }
  else {
    return v20;
  }
}

- (BOOL)_originalTimestampWithinAcceptableWindow:(id)a3 timestamp:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate __im_iMessageDateFromTimeStamp:](&OBJC_CLASS___NSDate, "__im_iMessageDateFromTimeStamp:", a3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate __im_iMessageDateFromTimeStamp:](&OBJC_CLASS___NSDate, "__im_iMessageDateFromTimeStamp:", v6));

  unint64_t v9 = (unint64_t)[v7 compare:v8];
  -[MessageServiceSession _messageRetryTimeout](self, "_messageRetryTimeout");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:"));
  unint64_t v11 = v9 & (unint64_t)[v8 compare:v10];

  return v11 == -1LL;
}

- (BOOL)_amIMentioned:(id)a3 inMentions:(id)a4
{
  id v5 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)i),  "componentsSeparatedByString:",  @"|",  (void)v18));
        if ((unint64_t)[v11 count] >= 2)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByRemovingURLEscapes]);

          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v5 _stripFZIDPrefix]);
          unsigned __int8 v15 = [v13 isEqualToString:v14];

          if ((v15 & 1) != 0)
          {

            BOOL v16 = 1;
            goto LABEL_12;
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (void)handler:(id)a3 incomingMessage:(id)a4 originalEncryptionType:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 incomingEngroup:(id)a12 needsDeliveryReceipt:(id)a13 deliveryContext:(id)a14 storageContext:(id)a15 messageContext:(id)a16 isBeingReplayed:(BOOL)a17 mergeID:(id)a18 wantsCheckpointing:(BOOL)a19 isSnapTrustedUser:(BOOL)a20
{
  id v108 = a3;
  id v25 = a4;
  id v106 = a5;
  v112 = (__CFString *)a6;
  id v110 = a7;
  id v111 = a8;
  id v100 = a9;
  uint64_t v26 = v25;
  id v99 = a10;
  id v101 = a11;
  id v98 = a12;
  id v102 = a13;
  id v103 = a14;
  id v107 = a15;
  id v104 = a16;
  id v105 = a18;
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDefaults sharedInstance](&OBJC_CLASS___IMDefaults, "sharedInstance"));
  if (([v27 getBoolFromDomain:@"com.apple.madrid" forKey:@"FailToDecryptMessages"] & 1) == 0)
  {

LABEL_14:
    id v38 = (void *)objc_claimAutoreleasedReturnValue( +[IMMessageNotificationTimeManager sharedInstance]( &OBJC_CLASS___IMMessageNotificationTimeManager,  "sharedInstance"));
    [v38 acquireAssertionToUnsuspendProcess];

    kdebug_trace(733872128LL, 0LL, 0LL, 0LL, 0LL);
    -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
    char v95 = sub_2DA04();
    unsigned int v96 = [v111 isEqualToString:v110];
    int v39 = ([v107 unsignedIntValue] | a17) & 1;
    unsigned __int8 v40 = [v107 unsignedIntValue];
    char v94 = v39;
    if ((v40 & 2) != 0)
    {
      -[MessageServiceSession noteLastItemFromStorage:](self, "noteLastItemFromStorage:", v112);
      id v41 = v106;
    }

    else
    {
      id v41 = v106;
      if (v39) {
        -[MessageServiceSession noteItemFromStorage:](self, "noteItemFromStorage:", v112);
      }
    }

    if (v41) {
      unsigned int v97 = [v41 isEqualToString:@"none"] ^ 1;
    }
    else {
      unsigned int v97 = 0;
    }
    uint64_t v137 = 0LL;
    v138 = &v137;
    uint64_t v139 = 0x3032000000LL;
    v140 = sub_B17C;
    v141 = sub_B18C;
    id v142 = 0LL;
    id v42 = [[IMPowerAssertion alloc] initWithIdentifier:@"IncomingMessageProcessing" timeout:60.0];
    id v142 = v42;
    if (qword_E32B0 != -1) {
      dispatch_once(&qword_E32B0, &stru_D5930);
    }
    id v44 = (void (*)(uint64_t, const __CFString *, NSDictionary *, void))off_E32A8;
    if (off_E32A8)
    {
      id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v97 ^ 1));
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v111 _stripFZIDPrefix]);
      id v47 = (void *)objc_claimAutoreleasedReturnValue([v110 _stripFZIDPrefix]);
      v44( 7LL,  @"iMessageReceived",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v45,  @"IsTypingIndicator",  v112,  @"MessageGUID",  v46,  @"Source",  v47,  @"Target",  0LL),  0LL);
    }

    if (IMOSLoggingEnabled(v42, v43))
    {
      uint64_t v48 = OSLogHandleForIMEventCategory("MessageService");
      id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        if (v96) {
          id v50 = @"YES";
        }
        else {
          id v50 = @"NO";
        }
        id v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v51 timeIntervalSinceReferenceDate];
        if (a17) {
          id v53 = @"YES";
        }
        else {
          id v53 = @"NO";
        }
        *(_DWORD *)buf = 134220802;
        uint64_t v149 = (uint64_t)v25;
        __int16 v150 = 2112;
        v151 = v112;
        __int16 v152 = 2112;
        id v153 = v111;
        __int16 v154 = 2112;
        id v155 = v110;
        __int16 v156 = 2048;
        id v157 = v104;
        __int16 v158 = 2112;
        v159 = v50;
        __int16 v160 = 2048;
        uint64_t v161 = v52;
        __int16 v162 = 2112;
        id v163 = v102;
        __int16 v164 = 2112;
        id v165 = v103;
        __int16 v166 = 2112;
        id v167 = v101;
        __int16 v168 = 2112;
        v169 = v53;
        __int16 v170 = 2112;
        id v171 = v105;
        _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_INFO,  "Incoming message data: %p ID: %@  from: %@   to: %@  context: %p  (from me: %@) at time: %f, needsDeliveryRece ipt: %@, deliveryContext: %@, fromIDSID %@ isBeingReplayed %@ MergeID:%@",  buf,  0x7Au);
      }
    }

    uint64_t v54 = im_checkpointIDSService();
    id v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    im_sendMessageCheckpointIfNecessary(v55, 10100LL, v112, a19);

    id v56 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v57 = [v56 isInternalInstall];

    if (v57
      && (id v60 = (void *)objc_claimAutoreleasedReturnValue(+[IMDefaults sharedInstance](&OBJC_CLASS___IMDefaults, "sharedInstance")),
          id v61 = (void *)objc_claimAutoreleasedReturnValue( [v60 getValueFromDomain:@"com.apple.madrid" forKey:@"numMessagesToDrop"]),  v62 = (char *)objc_msgSend(v61, "integerValue"),  v61,  v60,  v63 = v62 - 1,  (uint64_t)v62 >= 1))
    {
      __int16 v64 = (void *)objc_claimAutoreleasedReturnValue(+[IMDefaults sharedInstance](&OBJC_CLASS___IMDefaults, "sharedInstance"));
      id v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v62 - 1));
      [v64 setValue:v65 forDomain:@"com.apple.madrid" forKey:@"numMessagesToDrop"];

      if (IMOSLoggingEnabled(v66, v67))
      {
        uint64_t v68 = OSLogHandleForIMFoundationCategory("MessageService");
        v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          id v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v63));
          *(_DWORD *)buf = 138412290;
          uint64_t v149 = (uint64_t)v70;
          _os_log_impl( &dword_0,  v69,  OS_LOG_TYPE_INFO,  "***** Dropping message due to user default. Will drop %@ more messages after this one *****",  buf,  0xCu);
        }
      }
    }

    else
    {
      uint64_t v71 = IMOSLoggingEnabled(v58, v59);
      if ((_DWORD)v71)
      {
        uint64_t v73 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        {
          v75 = @"NO";
          if (v97) {
            v75 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          uint64_t v149 = (uint64_t)v25;
          __int16 v150 = 2112;
          v151 = v75;
          _os_log_impl(&dword_0, v74, OS_LOG_TYPE_DEBUG, "Decrypted data %@  isEncrypted? %@", buf, 0x16u);
        }
      }

      if (v25 || !v97)
      {
        id v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        if (IMOSLoggingEnabled(v93, v79))
        {
          uint64_t v80 = OSLogHandleForIMFoundationCategory("Group New");
          uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v149 = (uint64_t)v99;
            _os_log_impl( &dword_0,  v81,  OS_LOG_TYPE_DEBUG,  "Timestamp: %@ before calling receive message data",  buf,  0xCu);
          }
        }

        uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
        uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v108 account]);
        id v84 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v83));
        uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue([v108 service]);
        if ((v40 & 2) != 0) {
          char v85 = 1;
        }
        else {
          char v85 = v94;
        }
        char v91 = v85;
        v113[0] = _NSConcreteStackBlock;
        v113[1] = 3221225472LL;
        v113[2] = sub_DBC8;
        v113[3] = &unk_D5AC0;
        id v114 = v111;
        char v129 = v96;
        id v115 = v99;
        __int16 v116 = self;
        char v130 = (v40 & 2) >> 1;
        id v117 = v110;
        __int16 v128 = &v137;
        __int16 v118 = v112;
        id v119 = v104;
        id v120 = v108;
        char v131 = v97;
        id v121 = v100;
        BOOL v132 = a20;
        id v122 = v26;
        char v133 = v95;
        id v78 = v93;
        id v123 = v78;
        char v134 = v94;
        id v124 = v101;
        BOOL v135 = a19;
        id v125 = v105;
        BOOL v136 = a17;
        id v126 = v102;
        id v127 = v103;
        LOBYTE(v90) = v91;
        [v82 receiveMessageData:v122 account:v84 session:self toIdentifier:v117 fromIdentifier:v114 incomingEngroup:v98 service:v92 timestamp:v115 fromStorage:v90 completionBlock:v113];

        goto LABEL_64;
      }

      if (IMOSLoggingEnabled(v71, v72))
      {
        uint64_t v76 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v77,  OS_LOG_TYPE_DEBUG,  "We received an incoming message but it has no data, ignoring",  buf,  2u);
        }
      }

      if ((v40 & 2) != 0) {
        -[MessageServiceSession noteLastItemProcessed](self, "noteLastItemProcessed");
      }
    }

    id v78 = (id)v138[5];
    v138[5] = 0LL;
LABEL_64:

    _Block_object_dispose(&v137, 8);
    goto LABEL_65;
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v29 = [v28 isInternalInstall];

  if (!v29) {
    goto LABEL_14;
  }
  uint64_t v32 = IMOSLoggingEnabled(v30, v31);
  if (v25)
  {
    if ((_DWORD)v32)
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory("Warning");
      __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v149 = 0x4028000000000000LL;
        _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  " ** FailToDecryptMessages is enabled, sending decryption failure message with delay %f",  buf,  0xCu);
      }
    }

    if (IMOSLoggingEnabled(v32, v33))
    {
      uint64_t v36 = OSLogHandleForIMEventCategory("MessageService");
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v149 = 0x4028000000000000LL;
        _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_INFO,  " ** FailToDecryptMessages is enabled, sending decryption failure message with delay %f",  buf,  0xCu);
      }
    }

    v143[0] = _NSConcreteStackBlock;
    v143[1] = 3221225472LL;
    v143[2] = sub_DA90;
    v143[3] = &unk_D5910;
    v143[4] = self;
    id v144 = v100;
    id v145 = v111;
    id v146 = v110;
    v147 = v112;
    im_dispatch_after(v143, 12.0);
  }

  else
  {
    if ((_DWORD)v32)
    {
      uint64_t v86 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v87,  OS_LOG_TYPE_INFO,  " ** FailToDecryptMessages is enabled, but this is a typing indicator. Dropping message without sending 120",  buf,  2u);
      }
    }

    if (IMOSLoggingEnabled(v32, v33))
    {
      uint64_t v88 = OSLogHandleForIMEventCategory("MessageService");
      uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v89,  OS_LOG_TYPE_INFO,  " ** FailToDecryptMessages is enabled, but this is a typing indicator. Dropping message without sending 120",  buf,  2u);
      }
    }
  }

- (BOOL)_shouldOptimizedDeliveryReceiptForConversation:(id)a3 withMessageTimeStamp:(id)a4
{
  return 0;
}

- (void)handler:(id)a3 nicknameInfoReceived:(id)a4 userInfo:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13
{
  id v42 = a3;
  id v19 = a4;
  id v43 = a5;
  id v20 = a6;
  id v21 = a7;
  id v41 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v40 = a13;
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](self, "registeredURIs"));
  if (!v27 && IMOSLoggingEnabled(0LL, v26))
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory("Warning");
    unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "nicknameInfoReceived - No bindings !!", buf, 2u);
    }
  }

  if ([v27 containsObject:v20])
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v19 _FTOptionallyDecompressData]);
    uint64_t v31 = JWDecodeDictionary(v30);
    id v39 = v20;
    id v32 = v25;
    id v33 = v24;
    id v34 = v23;
    id v35 = v22;
    id v36 = v19;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v31);

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_14128;
    v44[3] = &unk_D5AE8;
    v44[4] = self;
    id v45 = v37;
    id v46 = v21;
    id v47 = v43;
    id v38 = v37;
    -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v44,  @"nickname received block",  45.0);

    id v19 = v36;
    id v22 = v35;
    id v23 = v34;
    id v24 = v33;
    id v25 = v32;
    id v20 = v39;
  }
}

- (void)handler:(id)a3 locationShareInfo:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v39 = a3;
  id v18 = a4;
  id v19 = a5;
  id v41 = (__CFString *)a6;
  id v20 = a7;
  id v40 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](self, "registeredURIs"));
  if (!v26 && IMOSLoggingEnabled(0LL, v25))
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "genericNotification - No bindings !!", buf, 2u);
    }
  }

  if ([v26 containsObject:v19])
  {
    id v29 = -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
    uint64_t v31 = IMOSLoggingEnabled(v29, v30);
    if ((_DWORD)v31)
    {
      uint64_t v33 = OSLogHandleForIMEventCategory("MessageService");
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v43 = v18;
        __int16 v44 = 2112;
        id v45 = v41;
        __int16 v46 = 2112;
        id v47 = v20;
        _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "Received location share info: %@ from: %@   token: %@",  buf,  0x20u);
      }
    }

    if (IMOSLoggingEnabled(v31, v32))
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory("MessageService");
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        uint64_t v37 = @"YES";
        *(_DWORD *)buf = 138412802;
        id v43 = v21;
        __int16 v44 = 2112;
        if (!v22) {
          uint64_t v37 = @"NO";
        }
        id v45 = v37;
        __int16 v46 = 2112;
        id v47 = v23;
        _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@",  buf,  0x20u);
      }
    }

    id v38 = (void *)objc_claimAutoreleasedReturnValue( +[IMDLocationSharingController sharedInstance]( &OBJC_CLASS___IMDLocationSharingController,  "sharedInstance"));
    [v38 receivedIncomingLocationSharePacket:v18];
  }
}

- (void)handler:(id)a3 genericNotification:(id)a4 incomingMessage:(id)a5 userInfo:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14
{
  id v96 = a3;
  id v20 = a4;
  id v21 = a5;
  id v102 = a6;
  id v22 = a7;
  id v104 = (__CFString *)a8;
  id v103 = a9;
  id v97 = a10;
  id v23 = self;
  id v101 = a11;
  id v99 = a12;
  id v100 = a13;
  id v98 = a14;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](self, "registeredURIs"));
  if (!v25 && IMOSLoggingEnabled(0LL, v24))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "genericNotification - No bindings !!", buf, 2u);
    }
  }

  if ([v25 containsObject:v22])
  {
    id v28 = -[MessageServiceSession _logLocalInfo](v23, "_logLocalInfo");
    if (!v20)
    {
      id v28 = v102;
      id v20 = v28;
    }

    uint64_t v30 = IMOSLoggingEnabled(v28, v29);
    if ((_DWORD)v30)
    {
      uint64_t v32 = OSLogHandleForIMEventCategory("MessageService");
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v106 = v20;
        __int16 v107 = 2112;
        id v108 = v104;
        __int16 v109 = 2112;
        id v110 = v103;
        _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "Received generic notification: %@ from: %@ token: %@",  buf,  0x20u);
      }
    }

    if (IMOSLoggingEnabled(v30, v31))
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = @"YES";
        *(_DWORD *)buf = 138412802;
        id v106 = v101;
        __int16 v107 = 2112;
        if (!v99) {
          id v36 = @"NO";
        }
        id v108 = v36;
        __int16 v109 = 2112;
        id v110 = v100;
        _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@",  buf,  0x20u);
      }
    }

    theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString _stripFZIDPrefix](v104, "_stripFZIDPrefix"));
    if (v37) {
      CFDictionarySetValue((CFMutableDictionaryRef)theDict, kFZPersonID, v37);
    }

    id v38 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"c"]);
    char v95 = (__CFString *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"p"]);
    id v39 = [v21 length];
    if (v39)
    {
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v21 _FTOptionallyDecompressData]);
      uint64_t v42 = JWDecodeDictionary(v41);
      id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);

      if (IMOSLoggingEnabled(v44, v45))
      {
        uint64_t v46 = OSLogHandleForIMFoundationCategory("MessageService");
        id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v106 = v43;
          _os_log_impl( &dword_0,  v47,  OS_LOG_TYPE_INFO,  "Decrypted message from generic notification messageDictionary: %@",  buf,  0xCu);
        }
      }

      if (![v43 count])
      {
        uint64_t v48 = JWDecodeDictionary(v21);
        uint64_t v49 = objc_claimAutoreleasedReturnValue(v48);

        uint64_t v52 = IMOSLoggingEnabled(v50, v51);
        if ((_DWORD)v52)
        {
          uint64_t v54 = OSLogHandleForIMFoundationCategory("MessageService");
          id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v55,  OS_LOG_TYPE_INFO,  "Faild to decrypt, trying a simpler decode for generic notification",  buf,  2u);
          }
        }

        id v43 = (void *)v49;
        if (!v49)
        {
          if (IMOSLoggingEnabled(v52, v53))
          {
            uint64_t v56 = OSLogHandleForIMFoundationCategory("MessageService");
            unsigned int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "BAD DATA for generic notification", buf, 2u);
            }
          }

          id v43 = 0LL;
        }
      }

      if (!v38
        || (uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 180LL)),
            unsigned int v59 = [v38 isEqualToNumber:v58],
            v58,
            v59))
      {
        uint64_t v60 = objc_claimAutoreleasedReturnValue([v43 objectForKey:@"gC"]);

        id v38 = (void *)v60;
      }

      if (!v95) {
        char v95 = (__CFString *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"pID"]);
      }
    }

    else
    {
      id v43 = v20;
    }

    if (IMOSLoggingEnabled(v39, v40))
    {
      uint64_t v61 = OSLogHandleForIMFoundationCategory("MessageService");
      id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v106 = v38;
        __int16 v107 = 2112;
        id v108 = v95;
        _os_log_impl( &dword_0,  v62,  OS_LOG_TYPE_INFO,  "Received generic notification with command: %@ properties: %@",  buf,  0x16u);
      }
    }

    if (!v38) {
      goto LABEL_91;
    }
    id v63 = [v38 intValue];
    switch((_DWORD)v63)
    {
      case 0x11170:
        if (IMOSLoggingEnabled(v63, v64))
        {
          uint64_t v74 = OSLogHandleForIMFoundationCategory("MessageService");
          v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v75, OS_LOG_TYPE_INFO, "Received generic command for nickname updates", buf, 2u);
          }
        }

        uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](v23, "deliveryController"));
        uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v76 idsDeviceFromPushToken:v103]);

        if (v77)
        {
          uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
          [v80 handleNicknameUpdatesFromPeerDevice:v95 fromPeerDevice:v101];
        }

        else if (IMOSLoggingEnabled(v78, v79))
        {
          uint64_t v90 = OSLogHandleForIMFoundationCategory("Warning");
          char v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v91,  OS_LOG_TYPE_INFO,  "Received a nickname update message from a device that was not one of our own",  buf,  2u);
          }
        }

        goto LABEL_91;
      case 0xEA61:
        if (IMOSLoggingEnabled(v63, v64))
        {
          uint64_t v81 = OSLogHandleForIMFoundationCategory("MessageService");
          uint64_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v82,  OS_LOG_TYPE_INFO,  "Received generic notification to update global read receipt",  buf,  2u);
          }
        }

        uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](v23, "deliveryController"));
        id v84 = (os_log_s *)objc_claimAutoreleasedReturnValue([v83 idsDeviceFromPushToken:v103]);

        if (v84)
        {
          -[MessageServiceSession _checkGlobalReadReceiptValueAndUpdateIfNeeded:]( v23,  "_checkGlobalReadReceiptValueAndUpdateIfNeeded:",  v95);
        }

        else if (IMOSLoggingEnabled(v85, v86))
        {
          uint64_t v92 = OSLogHandleForIMFoundationCategory("Warning");
          id v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
          if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v93,  OS_LOG_TYPE_INFO,  "Received a read receipt change message from a device that was not one of our own",  buf,  2u);
          }
        }

        break;
      case 0xEA60:
        if (IMOSLoggingEnabled(v63, v64))
        {
          uint64_t v65 = OSLogHandleForIMFoundationCategory("MessageService");
          uint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v66,  OS_LOG_TYPE_INFO,  "Received generic notification to update chat properties",  buf,  2u);
          }
        }

        uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](v23, "deliveryController"));
        uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v67 idsDeviceFromPushToken:v103]);

        v69 = (__CFString *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"cID"]);
        id v70 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
        uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v70 existingChatWithGUID:v69]);

        if (v68 && v71)
        {
          -[MessageServiceSession _updateChatProperties:withProperties:]( v23,  "_updateChatProperties:withProperties:",  v71,  v95);
        }

        else if (IMOSLoggingEnabled(v72, v73))
        {
          uint64_t v88 = OSLogHandleForIMFoundationCategory("Warning");
          uint64_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v106 = v68;
            __int16 v107 = 2112;
            id v108 = v69;
            _os_log_impl( &dword_0,  v89,  OS_LOG_TYPE_INFO,  "Received a chat property update message from a device that was not one of our own %@, or the chat GUID was unknown %@",  buf,  0x16u);
          }
        }

        goto LABEL_91;
      default:
        if (!IMOSLoggingEnabled(v63, v64))
        {
LABEL_91:

          goto LABEL_92;
        }

        uint64_t v87 = OSLogHandleForIMFoundationCategory("Warning");
        id v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v106 = v38;
          _os_log_impl( &dword_0,  v84,  OS_LOG_TYPE_INFO,  "Trying to handle generic message that we don't have support for: %@",  buf,  0xCu);
        }

        break;
    }

    goto LABEL_91;
  }

  id v43 = v20;
LABEL_92:
}

- (void)_handleDeleteCommandWithMessageDictionary:(id)a3
{
  id v4 = a3;
  -[MessageServiceSession deleteChatsForCommandDictionary:](self, "deleteChatsForCommandDictionary:", v4);
  uint64_t v64 = v4;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"chat-clear"]);
  id v67 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
  if (v67)
  {
    uint64_t v66 = *(void *)v78;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v78 != v66)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }

        uint64_t v68 = v5;
        id v7 = *(void **)(*((void *)&v77 + 1) + 8 * v5);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"guids"]);
        id v10 = [v9 countByEnumeratingWithState:&v73 objects:v90 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v74;
          do
          {
            for (i = 0LL; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v74 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v73 + 1) + 8LL * (void)i);
              BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatRegistry](self, "chatRegistry"));
              unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 existingChatWithGUID:v13]);

              if (v15) {
                [v8 addObject:v15];
              }
            }

            id v10 = [v9 countByEnumeratingWithState:&v73 objects:v90 count:16];
          }

          while (v10);
        }

        if (![v8 count])
        {
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatRegistry](self, "chatRegistry"));
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"groupID"]);
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 existingChatsWithGroupID:v17]);

          id v8 = (void *)v18;
        }

        if ([v8 count])
        {
          id v19 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
          id v20 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          id v21 = v8;
          id v22 = [v21 countByEnumeratingWithState:&v69 objects:v89 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v70;
            do
            {
              for (j = 0LL; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v70 != v23) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v25 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)j);
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 chatIdentifier]);
                -[NSMutableArray addObject:](v19, "addObject:", v26);

                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 serviceName]);
                -[NSMutableArray addObject:](v20, "addObject:", v27);

                id v28 = [v25 style];
              }

              uint64_t v29 = (uint64_t)v28;
              id v22 = [v21 countByEnumeratingWithState:&v69 objects:v89 count:16];
            }

            while (v22);
          }

          else
          {
            uint64_t v29 = 45LL;
          }

          if (IMOSLoggingEnabled(v30, v31))
          {
            uint64_t v32 = OSLogHandleForIMFoundationCategory("MessageService");
            uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v82 = v19;
              __int16 v83 = 2112;
              id v84 = v20;
              _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "clearing messages for chat IDS:%@ on services:%@",  buf,  0x16u);
            }
          }

          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 deleteMessagesWithChatIdentifiers:v19 style:v29 onServices:v20]);

          id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
          [v36 historicalMessageGUIDsDeleted:v35 chatGUIDs:0 queryID:0];

          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession broadcasterForChatListenersWithBlackholeStatus:]( self,  "broadcasterForChatListenersWithBlackholeStatus:",  1LL));
          [v37 historicalMessageGUIDsDeleted:v35 chatGUIDs:0 queryID:0];
        }

        uint64_t v5 = v68 + 1;
      }

      while ((id)(v68 + 1) != v67);
      id v67 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
    }

    while (v67);
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:@"message"]);
  id v39 = [v38 count];
  if (v39)
  {
    if (IMOSLoggingEnabled(v39, v40))
    {
      uint64_t v41 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        id v43 = (NSMutableArray *)[v38 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v82 = v43;
        _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "deleteing %lu: messages", buf, 0xCu);
      }
    }

    -[MessageServiceSession deleteMessagesForCommandDictionary:](self, "deleteMessagesForCommandDictionary:", v64);
  }

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:@"parts"]);
  if ([v44 count]) {
    -[MessageServiceSession deleteMessagePartsForCommandDictionary:]( self,  "deleteMessagePartsForCommandDictionary:",  v64);
  }
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:@"KeepMessages"]);
  uint64_t v46 = v45;
  if (v45)
  {
    id v47 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"days"]);
    uint64_t v48 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"ID"]);
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"resetPreference"]);
    uint64_t v50 = IMSettingsKeepMessagesDomain;
    uint64_t v51 = IMSettingsKeepMessagesKey;
    uint64_t v52 = IMGetDomainValueForKey(IMSettingsKeepMessagesDomain, IMSettingsKeepMessagesKey);
    uint64_t v53 = objc_claimAutoreleasedReturnValue(v52);
    id v55 = (void *)v53;
    if (v47 && v48)
    {
      if (IMOSLoggingEnabled(v53, v54))
      {
        uint64_t v56 = OSLogHandleForIMFoundationCategory("MessageService");
        unsigned int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v82 = v47;
          __int16 v83 = 2112;
          id v84 = v48;
          __int16 v85 = 2112;
          uint64_t v86 = v49;
          __int16 v87 = 2112;
          uint64_t v88 = v55;
          _os_log_impl( &dword_0,  v57,  OS_LOG_TYPE_INFO,  "Updated Keep Message Defaults Days:%@ Version:%@ resettingPreference: %@ currentKeepMessagesValue %@",  buf,  0x2Au);
        }
      }

      IMSetDomainValueForKey(v50, IMSettingsKeepMessagesVersionIDKey, v48);
      IMSetDomainValueForKey(v50, v51, v47);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, IMSettingsKeepMessagesChangedNotification, 0LL, 0LL, 1u);
      if ([v49 BOOLValue])
      {
        id v59 = [v55 unsignedIntegerValue];
        if (v59)
        {
          if (IMOSLoggingEnabled(v59, v60))
          {
            uint64_t v61 = OSLogHandleForIMFoundationCategory("MessageService");
            id v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_0,  v62,  OS_LOG_TYPE_INFO,  "Received resetting keep messages preference. Writing default to show UI",  buf,  2u);
            }
          }

          IMSetDomainValueForKey(v50, IMSettingsKeepMessagesResetKey, &__kCFBooleanTrue);
          id v63 = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(v63, IMSettingsKeepMessagesWasResetNotification, 0LL, 0LL, 1u);
        }
      }
    }
  }
}

- (void)handler:(id)a3 deleteCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v48 = a3;
  id v18 = a4;
  id v49 = a5;
  id v50 = a6;
  id v19 = a7;
  id v54 = a8;
  id v55 = a9;
  id v51 = a10;
  id v52 = a11;
  id v53 = a12;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 idsDeviceFromPushToken:v19]);

  if (v21
    || (id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController", v48, v49, v50, v51, v52)),
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v22 idsDeviceForFromID:v55]),
        v22,
        v21))
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_FTOptionallyDecompressData", v48));
    uint64_t v26 = JWDecodeDictionary(v25);
    id v27 = (id)objc_claimAutoreleasedReturnValue(v26);

    unsigned int v28 = [v21 isActive];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"chat"]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndex:0]);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:IMDChatWasReportedAsJunkKey]);
    unsigned int v32 = [v31 BOOLValue];

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:IMDDeleteCommandIsScheduledMessageKey]);
    unsigned int v34 = [v33 BOOLValue];

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession ckUtilities](self, "ckUtilities"));
    unsigned int v36 = [v35 cloudKitSyncingEnabled];

    int v39 = IMOSLoggingEnabled(v37, v38);
    if ((((v28 | v36 | v32) | v34) & 1) != 0)
    {
      if (v39)
      {
        uint64_t v40 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413314;
          id v59 = v27;
          __int16 v60 = 1024;
          *(_DWORD *)uint64_t v61 = v36;
          *(_WORD *)&v61[4] = 1024;
          *(_DWORD *)&v61[6] = v32;
          __int16 v62 = 1024;
          unsigned int v63 = v28;
          __int16 v64 = 1024;
          unsigned int v65 = v34;
          _os_log_impl( &dword_0,  v41,  OS_LOG_TYPE_INFO,  "Handling delete command: %@ (cloudkitSyncEnabled: %d, wasReportedAsJunk: %d, senderIsPairedWatch: %d, isSche duledMessage: %d)",  buf,  0x24u);
        }
      }

      if (-[MessageServiceSession shouldInferRecoverableDeleteForCommandDictionary:]( self,  "shouldInferRecoverableDeleteForCommandDictionary:",  v27))
      {
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate __im_iMessageDateFromTimeStamp:]( &OBJC_CLASS___NSDate,  "__im_iMessageDateFromTimeStamp:",  v54));
        uint64_t v43 = objc_claimAutoreleasedReturnValue( -[MessageServiceSession deleteCommandDictionaryWithIncomingDictionary:inferredRecoverableDeleteForLegacyCommandsWithDate:]( self,  "deleteCommandDictionaryWithIncomingDictionary:inferredRecoverableDeleteForLegacyCommandsWithDate:",  v27,  v42));

        id v27 = (id)v43;
      }

      -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = sub_15C20;
      v56[3] = &unk_D5B10;
      v56[4] = self;
      id v27 = v27;
      id v57 = v27;
      -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v56,  @"deleteCommand block",  45.0);
    }

    else if (v39)
    {
      uint64_t v44 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v59 = v27;
        _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_INFO,  "sender is not watch and iCloudSync not enabled and not reported as junk and is not a scheduled message, droppi ng delete command: %@",  buf,  0xCu);
      }
    }
  }

  else if (IMOSLoggingEnabled(v23, v24))
  {
    uint64_t v46 = OSLogHandleForIMFoundationCategory("MessageService");
    id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v59 = v19;
      __int16 v60 = 2112;
      *(void *)uint64_t v61 = v55;
      _os_log_impl( &dword_0,  v47,  OS_LOG_TYPE_INFO,  "Received a delete command, but it was not from one of our own devices From: %@, ID:%@",  buf,  0x16u);
    }
  }
}

- (void)handler:(id)a3 recoverCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v42 = a3;
  id v18 = a4;
  id v43 = a5;
  id v44 = a6;
  id v19 = a7;
  id v45 = a8;
  id v20 = a9;
  id v46 = a10;
  id v21 = a11;
  id v22 = a12;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 idsDeviceFromPushToken:v19]);

  if (v24
    || (uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController")),
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v25 idsDeviceForFromID:v20]),
        v25,
        v24))
  {
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v18 _FTOptionallyDecompressData]);
    uint64_t v29 = JWDecodeDictionary(v28);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession ckUtilities](self, "ckUtilities"));
    unsigned __int8 v32 = [v31 cloudKitSyncingEnabled];

    int v35 = IMOSLoggingEnabled(v33, v34);
    if ((v32 & 1) != 0)
    {
      if (v35)
      {
        uint64_t v36 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v30;
          _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_INFO,  "Handling recover command: %@ cloudkitSyncEnabled: YES)",  buf,  0xCu);
        }
      }

      -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_15FF8;
      v47[3] = &unk_D5B10;
      v47[4] = self;
      id v48 = v30;
      -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v47,  @"recoverCommand block",  45.0);
    }

    else if (v35)
    {
      uint64_t v38 = OSLogHandleForIMFoundationCategory("MessageService");
      int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v50 = v30;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "iCloudSync not enabled dropping recover command: %@", buf, 0xCu);
      }
    }
  }

  else if (IMOSLoggingEnabled(v26, v27))
  {
    uint64_t v40 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v19;
      __int16 v51 = 2112;
      id v52 = v20;
      _os_log_impl( &dword_0,  v41,  OS_LOG_TYPE_INFO,  "Received a recover command, but it was not from one of our own devices From: %@, ID:%@",  buf,  0x16u);
    }
  }
}

- (void)handler:(id)a3 groupMessageCommand:(id)a4 encryptedGroupCommand:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14
{
  id v31 = a3;
  id v30 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v32 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](self, "registeredURIs"));
  if (!v27 && IMOSLoggingEnabled(0LL, v26))
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "genericNotification - No bindings !!", buf, 2u);
    }
  }

  if ([v27 containsObject:v22])
  {
    -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_16318;
    v36[3] = &unk_D5B38;
    id v37 = v30;
    id v38 = v35;
    id v39 = v34;
    id v40 = v32;
    id v41 = v23;
    id v42 = v24;
    id v43 = v20;
    id v44 = self;
    id v45 = v31;
    id v46 = v21;
    id v47 = v22;
    id v48 = v33;
    id v49 = v25;
    -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v36,  @"groupMessageCommand block",  45.0);
  }
}

- (void)handler:(id)a3 bubblePayloadData:(id)a4 forMessageID:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13
{
  id v44 = a3;
  id v19 = a4;
  id v46 = a5;
  id v20 = a6;
  id v45 = a7;
  id v21 = a8;
  id v22 = self;
  id v38 = a9;
  id v40 = a10;
  id v41 = a11;
  id v42 = a12;
  id v23 = a13;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession registeredURIs](v22, "registeredURIs"));
  if (!v25 && IMOSLoggingEnabled(0LL, v24))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "bubblePayload - No bindings !!", buf, 2u);
    }
  }

  if (objc_msgSend(v25, "containsObject:", v20, v38))
  {
    uint64_t v28 = JWDecodeDictionary(v19);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"bid"]);
    if (v31)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"p"]);
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"bpdi"]);
      if (v32 || [v43 count])
      {
        -[MessageServiceSession _logLocalInfo](v22, "_logLocalInfo");
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_16B68;
        v47[3] = &unk_D5830;
        id v48 = v46;
        id v49 = v31;
        id v50 = v22;
        id v51 = v44;
        id v52 = v32;
        id v53 = v43;
        id v54 = v45;
        id v55 = v21;
        -[MessageServiceSession _enqueueBlock:withTimeout:description:]( v22,  "_enqueueBlock:withTimeout:description:",  v47,  @"bubble payload block",  45.0);
      }

      else if (IMOSLoggingEnabled(0LL, v33))
      {
        uint64_t v36 = OSLogHandleForIMFoundationCategory("Warning");
        id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v57 = v46;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Did not get any data for message guid %@", buf, 0xCu);
        }
      }
    }

    else if (IMOSLoggingEnabled(0LL, v30))
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory("Warning");
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "bubblePayload - No bundle id !!", buf, 2u);
      }
    }
  }
}

- (void)handler:(id)a3 remoteFileResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("LocalAttachment");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, " Incomming Remote File response %@", (uint8_t *)&v12, 0xCu);
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
  [v11 remoteFileResponse:v7];
}

- (void)handler:(id)a3 remoteFileRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("LocalAttachment");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, " Incomming Remote File Request %@", (uint8_t *)&v12, 0xCu);
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
  [v11 remotefileRequest:v7 attempts:0 shouldRetry:1];
}

- (void)networkMonitorDidUpdate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  -[MessageServiceSession networkMonitorDidUpdate:](&v3, "networkMonitorDidUpdate:", a3);
}

- (void)messageDeliveryController:(id)a3 service:(id)a4 didFlushCacheForRemoteURI:(id)a5 fromURI:(id)a6 guid:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = -[MessageServiceSession isReplicating](self, "isReplicating");
  if ((_DWORD)v17)
  {
    if (IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageService");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v16;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Not reattempting delivery of guid %@, this is a replicating session",  buf,  0xCu);
      }
    }
  }

  else
  {
    LOBYTE(v21) = 1;
    -[MessageServiceSession _reAttemptMessageDeliveryForGUID:toIdentifier:fromIdentifier:fromIDSID:isReflection:shouldShowError:cacheFlushError:imdAccount:]( self,  "_reAttemptMessageDeliveryForGUID:toIdentifier:fromIdentifier:fromIDSID:isReflection:shouldShowError:cacheFlushError:imdAccount:",  v16,  v15,  v14,  0LL,  0LL,  0LL,  v21,  0LL);
  }
}

- (void)messageDeliveryController:(id)a3 serverUpdatedTimestampMessage:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 guid]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatRegistry](self, "chatRegistry", 0LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 chats]);

  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastMessage]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 guid]);
        unsigned int v16 = [v15 isEqualToIgnoringCase:v6];

        if (v16)
        {
          [v13 setLastMessage:v5];
          goto LABEL_11;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

- (void)messageDeliveryController:(id)a3 service:(id)a4 didFlushCacheForKTPeerURI:(id)a5
{
  id v5 = a5;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 broadcasterForKeyTransparencyListeners]);
  [v6 refreshStatusForKTPeerURI:v5];
}

- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6
{
}

- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6 toToken:(id)a7
{
}

- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6 toToken:(id)a7 messageID:(id)a8
{
  id v14 = (__CFDictionary *)a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v61 = (__CFDictionary *)a6;
  id v62 = a7;
  id v17 = a8;
  if (v15 && v14 && v16)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 _stripFZIDPrefix]);

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 _stripFZIDPrefix]);
    __int16 v60 = (void *)objc_claimAutoreleasedReturnValue([v19 _bestGuessURI]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsAccountForFromURI:toURI:](self, "idsAccountForFromURI:toURI:", v60, v18));
    uint64_t v21 = v20;
    if (v20) {
      id v59 = v20;
    }
    else {
      id v59 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsAccount](self, "idsAccount"));
    }

    if (IMOSLoggingEnabled(v22, v23))
    {
      uint64_t v24 = OSLogHandleForIMEventCategory("MessageService");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v67 = v14;
        __int16 v68 = 2112;
        __int128 v69 = v19;
        __int16 v70 = 2112;
        __int128 v71 = v18;
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "Request to forward P2P group command: %@  fromID: %@ to person: %@",  buf,  0x20u);
      }
    }

    -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
    BOOL v26 = -[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v59);
    if (v26)
    {
      if (-[MessageServiceSession isReplicating](self, "isReplicating"))
      {
        theDict = (__CFDictionary *)-[__CFDictionary mutableCopy](v14, "mutableCopy");
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession service](self, "service"));
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v28 replicationSourceID]));

        if (v29) {
          CFDictionarySetValue(theDict, @"rp", v29);
        }
      }

      else
      {
        theDict = v14;
      }

      uint64_t v56 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 190LL));
      if (v32)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v56, @"c", v32);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_8F458();
      }

      id v33 = v18;
      if (v33)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v56, @"id", v33);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_8F3D8();
      }

      if (theDict) {
        CFDictionarySetValue((CFMutableDictionaryRef)v56, @"p", theDict);
      }
      id v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      if (-[MessageServiceSession isReplicating](self, "isReplicating"))
      {
        uint64_t v65 = IDSRegistrationPropertySupportsHybridGroupsV1;
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v65, 1LL));
        uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v34));

        id v57 = (void *)v35;
      }

      uint64_t v36 = JWEncodeDictionary(theDict);
      id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
      unsigned int v39 = [v38 shouldCompressGroupPayload:theDict];

      if (v39)
      {
        id v40 = [v37 _FTCopyGzippedData];

        id v37 = v40;
      }

      id v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v63[0] = IDSSendMessageOptionTopLevelDictionaryKey;
      v63[1] = IDSSendMessageOptionSkipPayloadCheckKey;
      v64[0] = &__kCFBooleanTrue;
      v64[1] = &__kCFBooleanTrue;
      v63[2] = IDSSendMessageOptionCommandKey;
      id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 190LL));
      v64[2] = v42;
      v63[3] = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
      v63[4] = IDSSendMessageOptionDataToEncryptKey;
      v64[3] = v57;
      void v64[4] = v37;
      v63[5] = IDSSendMessageOptionWantsResponseKey;
      v64[5] = &off_DB4B0;
      id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  6LL));
      -[NSMutableDictionary addEntriesFromDictionary:](v41, "addEntriesFromDictionary:", v43);

      if (v17)
      {
        uint64_t v44 = IDSGetUUIDData(v17);
        id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v41,  "setObject:forKeyedSubscript:",  v45,  IDSSendMessageOptionUUIDKey);
      }

      id v46 = (id)objc_claimAutoreleasedReturnValue([v33 _bestGuessURI]);
      id v48 = v46;
      id v49 = v46;
      if (v62)
      {
        id v49 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithAlias:pushToken:]( &OBJC_CLASS___IDSDestination,  "destinationWithAlias:pushToken:",  v46,  v62));
      }

      if (IMOSLoggingEnabled(v46, v47))
      {
        uint64_t v50 = OSLogHandleForIMFoundationCategory("MessageService");
        id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v67 = v61;
          _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Sending P2P command to engroup: %@", buf, 0xCu);
        }
      }

      id v52 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
      id v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
      id v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v49));
      id v55 = -[NSMutableDictionary copy](v41, "copy");
      [v52 sendMessageDictionary:v53 fromID:v60 fromAccount:v59 toURIs:v54 toGroup:v61 priority:300 options:v55 completionBlock:&stru_D5B80];

      id v14 = theDict;
    }

    else if (IMOSLoggingEnabled(v26, v27))
    {
      uint64_t v30 = OSLogHandleForIMEventCategory("MessageService");
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, " ** Not sending command, device is not registered", buf, 2u);
      }
    }
  }

  else
  {
    __int128 v18 = v16;
    __int128 v19 = v15;
  }
}

- (void)sendLocationSharingInfo:(id)a3 toID:(id)a4 completionBlock:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMEventCategory("MessageService");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v29;
      __int16 v35 = 2112;
      id v36 = v8;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Request to send location sharing info: %@   to person: %@",  buf,  0x16u);
    }
  }

  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession callerURIUsingCalleeURI:](self, "callerURIUsingCalleeURI:", v8));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsAccountForFromURI:toURI:](self, "idsAccountForFromURI:toURI:", v13, v8));
  BOOL v15 = -[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v14);
  if (v15)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsLocationSharing));
    uint64_t v17 = IDSGetUUIDData(v28);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 195LL));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v18,  IDSSendMessageOptionUUIDKey,  v19,  IDSSendMessageOptionCommandKey,  v27,  IDSSendMessageOptionRequireAllRegistrationPropertiesKey,  0LL));

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v29,  @"p",  0LL));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 _bestGuessURI]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v23));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_182FC;
    v30[3] = &unk_D5BA8;
    id v31 = v8;
    id v32 = v9;
    [v21 sendMessageDictionary:v22 fromID:v13 fromAccount:v14 toURIs:v24 toGroup:0 priority:300 options:v20 completionBlock:v30];
  }

  else
  {
    if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v25 = OSLogHandleForIMEventCategory("MessageService");
      BOOL v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, " ** Not sending command, device is not registered", buf, 2u);
      }
    }

    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }
}

- (id)idsServiceForIDSAccount:(id)a3
{
  id v4 = a3;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v5 = self->_messagePushHandlers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v34;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v34 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 account]);
      unsigned __int8 v11 = [v10 isEqual:v4];

      if ((v11 & 1) != 0) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v38,  16LL);
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v12 = v9;

    if (v12) {
      goto LABEL_21;
    }
  }

  else
  {
LABEL_9:
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v13 = self->_messagePushHandlers;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
LABEL_13:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(v13);
      }
      uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * v16);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 account]);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 loginID]);
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v4 loginID]);
      unsigned __int8 v21 = [v19 isEqual:v20];

      if ((v21 & 1) != 0) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v29,  v37,  16LL);
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }

    id v12 = v17;

    if (!v12) {
      goto LABEL_22;
    }
LABEL_21:
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  }

  else
  {
LABEL_19:

LABEL_22:
    if (IMOSLoggingEnabled(v22, v23))
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory("Warning");
      BOOL v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Couldn't find push handler", v28, 2u);
      }
    }

    id v12 = 0LL;
    uint64_t v24 = 0LL;
  }

  return v24;
}

- (void)_engroupForChat:(id)a3 idsAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = (void (**)(void, void, void))v10;
  if (!v8)
  {
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
      unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Trying to look up an engroup on a nil chat", buf, 2u);
      }
    }

    goto LABEL_9;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 engramID]);
  id v14 = [v13 length];

  if (!v14)
  {
    if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_INFO,  "Trying to look up an engroup for a chat that does not have an engram ID",  buf,  2u);
      }
    }

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6
{
  id v45 = a3;
  id v44 = a4;
  id v9 = a5;
  unsigned __int8 v67 = a6;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v45;
      __int16 v71 = 2112;
      id v72 = v9;
      __int16 v73 = 1024;
      int v74 = v67;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Request to invite person: %@   chat: %@  style: %c", buf, 0x1Cu);
    }
  }

  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  id v66 = v9;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v66, &v67);
  id v51 = v66;

  id v13 = v51;
  if (v51)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession chatForChatIdentifier:style:]( self,  "chatForChatIdentifier:style:",  v51,  v67));
    id v65 = 0LL;
    id v15 = _LastAddressedURIForChatLogMetricIfNeeded(v14, 0LL, self, &v65, 0);
    id v49 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v50 = v65;
    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsServiceForIDSAccount:](self, "idsServiceForIDSAccount:"));
    -[MessageServiceSession _fixParticipantsForChat:](self, "_fixParticipantsForChat:", v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 groupPhotoGuid]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 transferForGUID:v17]);
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v18 _dictionaryToSend]);

    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v45 count]));
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v20 = v45;
    id v21 = [v20 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v62;
      uint64_t v23 = kFZPersonID;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v62 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v61 + 1) + 8 * (void)i) objectForKeyedSubscript:v23]);
          if (v25) {
            [v19 addObject:v25];
          }
        }

        id v21 = [v20 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }

      while (v21);
    }

    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_190C4;
    v57[3] = &unk_D5BF8;
    id v41 = v19;
    id v58 = v41;
    objc_copyWeak(&v60, (id *)buf);
    id v59 = v14;
    id v40 = v59;
    objc_msgSend( v26,  "addParticipants:toChat:fromID:fromAccount:session:service:groupPhoto:completionBlock:",  v41,  v42,  v57);

    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = v20;
    id v27 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v54;
      uint64_t v29 = kFZPersonID;
      uint64_t v48 = kFZPersonUnformattedName;
      uint64_t v47 = kFZPersonCountryCode;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v54 != v28) {
            objc_enumerationMutation(obj);
          }
          __int128 v31 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)j);
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v29]);
          if (v32)
          {
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v48]);
            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKey:v47]);
            unsigned __int8 v35 = v67;
            __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v50));
            id v37 = (void *)objc_claimAutoreleasedReturnValue([v49 _stripFZIDPrefix]);
            LOBYTE(v39) = v35;
            id v38 =  -[MessageServiceSession didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:destinationCallerID:]( self,  "didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:des tinationCallerID:",  2LL,  v32,  0LL,  v33,  v34,  v51,  v39,  v36,  v37);
          }
        }

        id v27 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
      }

      while (v27);
    }

    objc_destroyWeak(&v60);
    objc_destroyWeak((id *)buf);

    id v13 = v51;
  }
}

- (id)generateAndStoreGroupPhotoChangeStatusItemForChat:(id)a3 sender:(id)a4 fileTransferGuid:(id)a5 isHidden:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v14 = IMOSLoggingEnabled(v12, v13);
  if (v10)
  {
    if ((_DWORD)v14)
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 guid]);
        __int128 v19 = @"NO";
        *(_DWORD *)__int128 v62 = 138413058;
        *(void *)&v62[4] = v18;
        if (v6) {
          __int128 v19 = @"YES";
        }
        *(_WORD *)&v62[12] = 2112;
        *(void *)&v62[14] = v11;
        __int16 v63 = 2112;
        id v64 = v12;
        __int16 v65 = 2112;
        id v66 = v19;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "Generating IMGroupActionItem for group photo update. chatGuid %@ sender %@ fileTransferGuid %@ isHidden %@",  v62,  0x2Au);
      }
    }

    if (IMOSLoggingEnabled(v14, v15))
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 v62 = 138412290;
        *(void *)&v62[4] = v10;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, " => chat: %@", v62, 0xCu);
      }
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastAddressedLocalHandle", *(_OWORD *)v62));
    if ([v11 isEqualToString:v22])
    {
    }

    else
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 loginID]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 _stripFZIDPrefix]);
      unsigned int v31 = [v11 isEqualToString:v30];

      if (!v31)
      {
LABEL_25:
        uint64_t v34 = IMMessageGuidFromIMFileTransferGuid(v12);
        unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        __int128 v36 = v35;
        if (v35) {
          id v37 = v35;
        }
        else {
          id v37 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
        }
        id v38 = v37;

        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession messageStore](self, "messageStore"));
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 itemWithGUID:v38]);
        if (v40) {
          BOOL v41 = v6;
        }
        else {
          BOOL v41 = 0;
        }

        if (v41)
        {
          if (IMOSLoggingEnabled(v42, v43))
          {
            uint64_t v44 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
            id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)__int128 v62 = 0;
              _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_INFO,  "We've already created a status item for this transfer, and the new one is hidden, don't show anything new.",  v62,  2u);
            }
          }

          id v27 = 0LL;
        }

        else
        {
          id v46 = objc_alloc(&OBJC_CLASS___IMGroupActionItem);
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          id v48 = [v46 initWithSender:v11 time:v47 guid:v38 type:3];

          id v49 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession service](self, "service"));
          id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 internalName]);
          [v48 setService:v50];

          id v51 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
          id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 accountID]);
          [v48 setAccountID:v52];

          __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 loginID]);
          [v48 setAccount:v54];

          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v10 chatIdentifier]);
          [v48 setRoomName:v55];

          uint64_t v56 = 3LL;
          if (!v6) {
            uint64_t v56 = 1LL;
          }
          if (v12) {
            uint64_t v57 = v56;
          }
          else {
            uint64_t v57 = 2LL;
          }
          [v48 setActionType:v57];
          id v58 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession messageStore](self, "messageStore"));
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v58 storeItem:v48 forceReplace:0]);

          id v59 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatStore](self, "chatStore"));
          id v60 = (void *)objc_claimAutoreleasedReturnValue([v27 guid]);
          [v59 addMessageWithGUID:v60 toChat:v10];
        }

        goto LABEL_44;
      }
    }

    if (IMOSLoggingEnabled(v23, v24))
    {
      uint64_t v32 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 v62 = 138412290;
        *(void *)&v62[4] = v11;
        _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "Setting sender to nil (myself) because sender %@ is the lastAddressedLocalHandle or the current account's login ID",  v62,  0xCu);
      }
    }

    id v11 = 0LL;
    goto LABEL_25;
  }

  if ((_DWORD)v14)
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory("Warning");
    BOOL v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 v62 = 0;
      _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_INFO,  "generateAndStoreGroupPhotoChangeStatusItemForChat passed a nil chat. early returning nil",  v62,  2u);
    }
  }

  id v27 = 0LL;
LABEL_44:

  return v27;
}

- (void)groupPhotoUploadCompletedForChat:(id)a3 fileTransferGuid:(id)a4 callerURI:(id)a5 fromAccount:(id)a6 message:(id)a7 displayIDs:(id)a8 additionalContext:(id)a9 success:(BOOL)a10 isPhotoRefresh:(BOOL)a11 error:(unsigned int)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  uint64_t v25 = IMOSLoggingEnabled(v23, v24);
  if ((_DWORD)v25)
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = objc_claimAutoreleasedReturnValue([v17 guid]);
      id v30 = (void *)v29;
      unsigned int v31 = @"NO";
      *(_DWORD *)buf = 138413058;
      if (a10) {
        unsigned int v31 = @"YES";
      }
      uint64_t v43 = v29;
      __int16 v44 = 2112;
      id v45 = v18;
      __int16 v46 = 2112;
      uint64_t v47 = v31;
      __int16 v48 = 1024;
      unsigned int v49 = a12;
      _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "upload group photo complete. chatGuid %@ fileTransferGuid %@ success %@ error %u",  buf,  0x26u);
    }
  }

  if (IMOSLoggingEnabled(v25, v26))
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = (uint64_t)v17;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }

  if (v17 && [v17 style] != 45)
  {
    if (a10)
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
      unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 transferForGUID:v18]);

      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v35 setRefreshDate:v36];

      id v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v21 guid]);
      [v37 storeAttachment:v35 associateWithMessageWithGUID:v38];

      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v35 _dictionaryToSend]);
      [v39 setGroupPhoto:v40 forChat:v17 fromID:v19 fromAccount:v20 session:self isPhotoRefresh:a11];
    }

    else
    {
      -[MessageServiceSession groupPhotoUploadFailedForChat:fileTransferGuid:]( self,  "groupPhotoUploadFailedForChat:fileTransferGuid:",  v17,  v18);
    }
  }
}

- (void)groupPhotoUploadFailedForChat:(id)a3 fileTransferGuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = IMOSLoggingEnabled(v6, v7);
  if ((_DWORD)v8)
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 guid]);
      int v34 = 138412546;
      id v35 = v6;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "group photo %@ upload failed for chatGuid %@",  (uint8_t *)&v34,  0x16u);
    }
  }

  if (IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v34 = 138412290;
      id v35 = v5;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, " => chat: %@", (uint8_t *)&v34, 0xCu);
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 groupPhotoGuid]);
  unsigned int v16 = [v15 isEqualToString:v6];

  if (v16)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 groupPhotoUploadFailureCount]);
    id v20 = (char *)[v19 integerValue];

    id v21 = v20 + 1;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v20 + 1));
    [v5 updateGroupPhotoUploadFailureCount:v22];

    LOBYTE(v20) = (uint64_t)v20 < IMGroupPhotoMaxUploadCount;
    int v25 = IMOSLoggingEnabled(v23, v24);
    if ((v20 & 1) != 0)
    {
      if (v25)
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          int v34 = 134217984;
          id v35 = v21;
          _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  " => ready to retry group photo. new failure count: %zd",  (uint8_t *)&v34,  0xCu);
        }
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
      [v28 setRecoverableErrorForTransfer:v6 error:27];
    }

    else
    {
      if (v25)
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          int v34 = 134217984;
          id v35 = v21;
          _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  " => too many upload failures (%zd). failing transfer",  (uint8_t *)&v34,  0xCu);
        }
      }

      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
      [v33 failTransfer:v6 reason:27];
    }
  }

  else if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      LOWORD(v34) = 0;
      _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_INFO,  " => This chat has a different group photo guid now. not retrying",  (uint8_t *)&v34,  2u);
    }
  }
}

- (BOOL)shouldUploadGroupPhoto:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transferForGUID:v3]);

  id v6 = [v5 totalBytes];
  unint64_t v8 = (unint64_t)v6;
  if ((unint64_t)v6 > 0x200000 && IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      id v13 = [v5 totalBytes];
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "**Not** uploading group photo, too big. Size: %llu",  (uint8_t *)&v12,  0xCu);
    }
  }

  return v8 <= 0x200000;
}

- (void)uploadGroupPhotoForChat:(id)a3 fileTransferGUID:(id)a4 itemGUID:(id)a5 callerURI:(id)a6 idsAccount:(id)a7 isPhotoRefresh:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v43 = a5;
  id v44 = a6;
  id v45 = a7;
  uint64_t v16 = IMOSLoggingEnabled(v45, v15);
  if ((_DWORD)v16)
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 guid]);
      *(_DWORD *)buf = 138413314;
      id v58 = v20;
      __int16 v59 = 2112;
      id v60 = v14;
      __int16 v61 = 2112;
      id v62 = v43;
      __int16 v63 = 2112;
      id v64 = v44;
      __int16 v65 = 2112;
      id v66 = v45;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "uploading group photo. chatGuid: %@ fileTransferGUID: %@ itemGUID: %@ callerURI: %@ idsAccount: %@",  buf,  0x34u);
    }
  }

  if (IMOSLoggingEnabled(v16, v17))
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v13;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 participants]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 arrayByApplyingSelector:"ID"]);

  unsigned int v25 = -[MessageServiceSession shouldUploadGroupPhoto:](self, "shouldUploadGroupPhoto:", v14);
  if (v14) {
    unsigned int v26 = v25;
  }
  else {
    unsigned int v26 = 0;
  }
  if (v26 == 1)
  {
    id v27 = objc_alloc(&OBJC_CLASS___IMMessageItem);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 loginID]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v56 = v14;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
    id v32 = [v27 initWithSender:v29 time:v30 body:0 attributes:0 fileTransferGUIDs:v31 flags:5 error:0 guid:v43 threadIdentifier:0];

    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1A560;
    v50[3] = &unk_D5C20;
    v50[4] = self;
    id v33 = v13;
    id v51 = v33;
    id v34 = v14;
    id v52 = v34;
    id v53 = v44;
    id v54 = v45;
    BOOL v55 = a8;
    id v35 = objc_retainBlock(v50);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_1A5B4;
    v46[3] = &unk_D5C48;
    id v47 = v33;
    id v48 = v34;
    unsigned int v49 = self;
    __int16 v36 = objc_retainBlock(v46);
    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v32 sender]);
    [v37 sendAttachmentsForMessage:v32 canSendInline:0 displayIDs:v24 additionalContext:0 mode:2 fromID:v38 recipients:v24 completionBlock:v35 uploadFailureBlock:v36];
  }

  else if (v14 || ((v25 ^ 1) & 1) != 0)
  {
    uint64_t v39 = IMLogHandleForCategory("MessageService_GroupPhoto");
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_8F4D8();
    }
  }

  else
  {
    BYTE1(v41) = a8;
    LOBYTE(v41) = 1;
    -[MessageServiceSession groupPhotoUploadCompletedForChat:fileTransferGuid:callerURI:fromAccount:message:displayIDs:additionalContext:success:isPhotoRefresh:error:]( self,  "groupPhotoUploadCompletedForChat:fileTransferGuid:callerURI:fromAccount:message:displayIDs:additionalContext:succe ss:isPhotoRefresh:error:",  v13,  0LL,  v44,  v45,  0LL,  v24,  0LL,  v41);
  }
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  BOOL v46 = a8;
  id v13 = a3;
  id v45 = a4;
  id v14 = a5;
  unsigned __int8 v50 = a6;
  id v44 = a7;
  if (IMOSLoggingEnabled(v44, v15))
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v52 = v13;
      __int16 v53 = 2112;
      id v54 = v45;
      __int16 v55 = 2112;
      id v56 = v14;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "Request to send group photo update %@ to chatID %@ identifier %@",  buf,  0x20u);
    }
  }

  id v49 = v14;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v49, &v50);
  id v47 = v49;

  if (v47)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession chatForChatIdentifier:style:]( self,  "chatForChatIdentifier:style:",  v47,  v50));
    id v48 = 0LL;
    id v21 = _LastAddressedURIForChatLogMetricIfNeeded(v20, 0LL, self, &v48, 0);
    id v43 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v42 = v48;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession generateAndStoreGroupPhotoChangeStatusItemForChat:sender:fileTransferGuid:isHidden:]( self,  "generateAndStoreGroupPhotoChangeStatusItemForChat:sender:fileTransferGuid:isHidden:",  v20,  0LL,  v13,  v46));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v20 groupPhotoGuid]);
    unsigned __int8 v24 = [v23 isEqualToString:v13];

    if ((v24 & 1) == 0)
    {
      unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accountID]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v20 chatIdentifier]);
      id v28 = [v20 style];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v20 groupID]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v20 personCentricID]);
      [v41 account:v26 chat:v27 style:v28 chatProperties:0 groupID:v29 chatPersonCentricID:v30 messageReceived:v22];
    }

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v22 guid]);
    -[MessageServiceSession uploadGroupPhotoForChat:fileTransferGUID:itemGUID:callerURI:idsAccount:isPhotoRefresh:]( self,  "uploadGroupPhotoForChat:fileTransferGUID:itemGUID:callerURI:idsAccount:isPhotoRefresh:",  v20,  v13,  v31,  v43,  v42,  v46);

    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v22 guid]);
    [v32 updateGroupPhoto:v13 forChat:v20 messageGuid:v33];

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v20 chatIdentifier]);
    id v36 = [v20 style];
    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 accountID]);
    [v34 groupPhotoUpdatedForChatIdentifier:v35 style:v36 account:v38 userInfo:0];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v39 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "sendGroupPhotoUpdate early return -- no chat identifier", buf, 2u);
    }
  }
}

- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 existingChatWithGUID:v8]);

  if (v12)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v15 requestGroupPhotoIfNecessary:v12 incomingParticipantVersion:0x7FFFFFFFFFFFFFFFLL incomingGroupPhotoCreationDate:v16 toIdentifier:v10 fromIdentifier :v9 messageIsFromStorage:0 session:self];
  }

  else if (IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Failed to find a chat for chatGUID: %@", buf, 0xCu);
    }
  }
}

- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  unsigned __int8 v49 = a6;
  id v17 = a7;
  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      id v51 = v14;
      __int16 v52 = 2112;
      id v53 = v15;
      __int16 v54 = 2112;
      id v55 = v16;
      __int16 v56 = 1024;
      int v57 = v49;
      __int16 v58 = 2112;
      id v59 = v17;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Reuploading group photo. file transfer guid: %@ chatID: %@ chatIdentifier: %@ chat style: %c account: %@",  buf,  0x30u);
    }
  }

  id v48 = v16;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v48, &v49);
  id v21 = v48;

  if (v21)
  {
    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession chatForChatIdentifier:style:]( self,  "chatForChatIdentifier:style:",  v21,  v49));
    if (![v24 state])
    {
      if (IMOSLoggingEnabled(0LL, v25))
      {
        uint64_t v39 = OSLogHandleForIMFoundationCategory("Warning");
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  "*** Failed send group photo update because we've left the chat",  buf,  2u);
        }
      }

      goto LABEL_29;
    }

    id v47 = 0LL;
    id v26 = _LastAddressedURIForChatLogMetricIfNeeded(v24, 0LL, self, &v47, 0);
    BOOL v46 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v45 = v47;
    uint64_t v27 = IMMessageGuidFromIMFileTransferGuid(v14);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v24 groupPhotoGuid]);
    unsigned __int8 v30 = [v14 isEqualToString:v29];

    if ((v30 & 1) != 0)
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 transferForGUID:v14]);

      id v35 = (char *)[v34 transferState];
      if (v35 == (_BYTE *)&dword_4 + 3 && (id v35 = (char *)[v34 error], v35 == (_BYTE *)&dword_18 + 3))
      {
        -[MessageServiceSession uploadGroupPhotoForChat:fileTransferGUID:itemGUID:callerURI:idsAccount:isPhotoRefresh:]( self,  "uploadGroupPhotoForChat:fileTransferGUID:itemGUID:callerURI:idsAccount:isPhotoRefresh:",  v24,  v14,  v28,  v46,  v45,  v8);
      }

      else if (IMOSLoggingEnabled(v35, v36))
      {
        uint64_t v43 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
        id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v51 = v34;
          _os_log_impl( &dword_0,  v44,  OS_LOG_TYPE_INFO,  "not retrying transfer -- it is not in recoverableErrorState or does not have group photo error %@",  buf,  0xCu);
        }
      }
    }

    else
    {
      if (!IMOSLoggingEnabled(v31, v32))
      {
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }

      uint64_t v41 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_INFO))
      {
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v24 groupPhotoGuid]);
        *(_DWORD *)buf = 138412546;
        id v51 = v14;
        __int16 v52 = 2112;
        id v53 = v42;
        _os_log_impl( &dword_0,  (os_log_t)v34,  OS_LOG_TYPE_INFO,  "Trying to reupload group photo with wrong guid for chat. upload guid %@ chat group photo guid %@",  buf,  0x16u);
      }
    }

    goto LABEL_28;
  }

  if (IMOSLoggingEnabled(v22, v23))
  {
    uint64_t v37 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "sendGroupPhotoUpdate early return -- no chat identifier", buf, 2u);
    }
  }

- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  int v6 = a6;
  id v42 = a3;
  id v41 = a4;
  id v9 = a5;
  unsigned __int8 v65 = v6;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v69 = v42;
      __int16 v70 = 2112;
      id v71 = v9;
      __int16 v72 = 1024;
      int v73 = v6;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Request to remove person: %@   chat: %@  style: %c", buf, 0x1Cu);
    }
  }

  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  id v64 = v9;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v64, &v65);
  id v49 = v64;

  uint64_t v13 = v49;
  if (v49)
  {
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession chatForChatIdentifier:style:]( self,  "chatForChatIdentifier:style:",  v49,  v65));
    if ([v43 state])
    {
      id v63 = 0LL;
      id v15 = _LastAddressedURIForChatLogMetricIfNeeded(v43, 0LL, self, &v63, 0);
      id v47 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v48 = v63;
      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsServiceForIDSAccount:](self, "idsServiceForIDSAccount:"));
      -[MessageServiceSession _fixParticipantsForChat:](self, "_fixParticipantsForChat:", v43);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v42 count]));
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v17 = v42;
      id v18 = [v17 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v60;
        uint64_t v20 = kFZPersonID;
        do
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v60 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v59 + 1) + 8 * (void)i) objectForKeyedSubscript:v20]);
            if (v22) {
              [v16 addObject:v22];
            }
          }

          id v18 = [v17 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }

        while (v18);
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_1B710;
      v55[3] = &unk_D5C70;
      id v56 = v16;
      int v57 = self;
      id v58 = v43;
      id v39 = v56;
      [v23 removeParticipants:v56 toChat:v58 fromID:v47 fromAccount:v48 session:self service:v40 completionBlock:v55];

      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      id obj = v17;
      id v24 = [obj countByEnumeratingWithState:&v51 objects:v66 count:16];
      if (v24)
      {
        uint64_t v45 = kFZPersonID;
        uint64_t v46 = *(void *)v52;
        uint64_t v25 = kFZPersonUnformattedName;
        uint64_t v26 = kFZPersonCountryCode;
        do
        {
          for (j = 0LL; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v52 != v46) {
              objc_enumerationMutation(obj);
            }
            id v28 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)j);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v45]);
            unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v25]);
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:v26]);
            unsigned __int8 v32 = v65;
            id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v48));
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v47 _stripFZIDPrefix]);
            LOBYTE(v38) = v32;
            id v35 =  -[MessageServiceSession didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:destinationCallerID:]( self,  "didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:des tinationCallerID:",  3LL,  v29,  0LL,  v30,  v31,  v49,  v38,  v33,  v34);
          }

          id v24 = [obj countByEnumeratingWithState:&v51 objects:v66 count:16];
        }

        while (v24);
      }
    }

    else if (IMOSLoggingEnabled(0LL, v14))
    {
      uint64_t v36 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_INFO,  "*** Failed to remove person because we have already left the chat",  buf,  2u);
      }
    }

    uint64_t v13 = v49;
  }
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 joinProperties:(id)a6
{
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7
{
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 joinProperties:(id)a8
{
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9
{
  uint64_t v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (IMOSLoggingEnabled(v20, v21))
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v15;
      __int16 v26 = 1024;
      int v27 = v12;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Request to join chat: %@  style: %c  handleInfo: %@", buf, 0x1Cu);
    }
  }

  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  -[MessageServiceSession didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:]( self,  "didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:",  v15,  v12,  0LL,  v17,  v18,  v19,  v16);
}

- (void)leaveChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("MessageService");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 1024;
      int v21 = v4;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Request to leave chat: %@  style: %c", buf, 0x12u);
    }
  }

  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v6, v4));
  id v17 = 0LL;
  id v11 = _LastAddressedURIForChatLogMetricIfNeeded(v10, 0LL, self, &v17, 0);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v17;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsServiceForIDSAccount:](self, "idsServiceForIDSAccount:", v13));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
  [v15 leaveChat:v10 fromID:v12 fromAccount:v13 session:self service:v14 completionBlock:&stru_D5CB0];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v13));
  -[MessageServiceSession didLeaveChat:style:account:](self, "didLeaveChat:style:account:", v6, v4, v16);
}

- (double)_richLinkDelayTimeInterval
{
  return 5.0;
}

- (id)pendingSendBlockQueue
{
  return self->_pendingSendBlockQueue;
}

- (void)stageMessageWrapperBlock:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "stageMessageWrapperBlock blockWrapper %@", buf, 0xCu);
    }
  }

  if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 block]);
    BOOL v9 = v8 == 0LL;

    if (!v9)
    {
      pendingSendBlockQueue = self->_pendingSendBlockQueue;
      if (!pendingSendBlockQueue)
      {
        id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        uint64_t v12 = self->_pendingSendBlockQueue;
        self->_pendingSendBlockQueue = v11;

        pendingSendBlockQueue = self->_pendingSendBlockQueue;
      }

      id v13 = -[NSMutableArray count](pendingSendBlockQueue, "count");
      if (v13 || (id v13 = [v4 isDelayedRichLinkBlock], (v13 & 1) != 0))
      {
        if (IMOSLoggingEnabled(v13, v14))
        {
          uint64_t v15 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableArray count](self->_pendingSendBlockQueue, "count")));
            *(_DWORD *)buf = 138412546;
            id v30 = v4;
            __int16 v31 = 2112;
            unsigned __int8 v32 = v17;
            _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "stageMessageWrapperBlock enqueing block %@, pending block count %@",  buf,  0x16u);
          }
        }

        id v18 = self->_pendingSendBlockQueue;
        if (v18) {
          CFArrayAppendValue((CFMutableArrayRef)v18, v4);
        }
        id v19 = [v4 isDelayedRichLinkBlock];
        if ((_DWORD)v19)
        {
          if (IMOSLoggingEnabled(v19, v20))
          {
            uint64_t v21 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "stageMessageWrapperBlock dispatching _flushQueuedMessageWrapperBlocks",  buf,  2u);
            }
          }

          -[MessageServiceSession _richLinkDelayTimeInterval](self, "_richLinkDelayTimeInterval");
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_1C1D8;
          v28[3] = &unk_D5CD8;
          v28[4] = self;
          im_dispatch_after(v28, v23);
        }
      }

      else
      {
        if (IMOSLoggingEnabled(v13, v14))
        {
          uint64_t v24 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
          id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableArray count](self->_pendingSendBlockQueue, "count")));
            *(_DWORD *)buf = 138412546;
            id v30 = v4;
            __int16 v31 = 2112;
            unsigned __int8 v32 = v26;
            _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "stageMessageWrapperBlock calling block immediately %@ [_pendingSendBlockQueue count]:%@ ",  buf,  0x16u);
          }
        }

        int v27 = (void (**)(void))objc_claimAutoreleasedReturnValue([v4 block]);
        v27[2]();
      }
    }
  }
}

- (BOOL)_richLinkPendSendingWithGUID:(id)a3
{
  id v4 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v5 = self->_pendingSendBlockQueue;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "GUID", (void)v18));
        if ([v10 isEqualToString:v4])
        {
          unsigned __int8 v11 = [v9 isDelayedRichLinkBlock];

          if ((v11 & 1) != 0)
          {
            LODWORD(v6) = 1;
            goto LABEL_12;
          }
        }

        else
        {
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
    }

    while (v6);
  }

- (void)_flushQueuedMessageWrapperBlocks
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableArray count](self->_pendingSendBlockQueue, "count")));
      *(_DWORD *)buf = 138412290;
      id v39 = v4;
      _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_INFO,  "_flushQueuedMessageWrapperBlocks _pendingSendBlockQueue %@",  buf,  0xCu);
    }
  }

  if (-[NSMutableArray count](self->_pendingSendBlockQueue, "count", 128LL))
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v5 = *(id *)&self->IMDAppleServiceSession_opaque[v32];
    uint64_t v6 = 0LL;
    id v7 = [v5 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v35;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 block]);
          uint64_t v13 = (void (**)(void))v11;
          if ((char *)i + v6)
          {
            uint64_t v11 = (uint64_t)[v10 isDelayedRichLinkBlock];
            if ((v11 & 1) != 0)
            {
              v6 += (uint64_t)i;
              if (IMOSLoggingEnabled(v11, v12))
              {
                uint64_t v17 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
                __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v6));
                  *(_DWORD *)buf = 138412546;
                  id v39 = v10;
                  __int16 v40 = 2112;
                  id v41 = v19;
                  _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "_flushQueuedMessageWrapperBlocks stopped dequeuing at block %@ index %@",  buf,  0x16u);
                }
              }

              goto LABEL_27;
            }
          }

          if (IMOSLoggingEnabled(v11, v12))
          {
            uint64_t v14 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
            uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (char *)i + v6));
              *(_DWORD *)buf = 138412290;
              id v39 = v16;
              _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "_flushQueuedMessageWrapperBlocks dequeing block at index %@",  buf,  0xCu);
            }
          }

          if (v13) {
            v13[2](v13);
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v34 objects:v42 count:16];
        v6 += (uint64_t)i;
        if (v7) {
          continue;
        }
        break;
      }
    }

- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
  [v8 eagerUploadTransfer:v7 recipients:v6];
}

- (void)eagerUploadCancel:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
  [v5 eagerUploadCancel:v4];
}

- (void)_sendHighResolutionImagesForMessage:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toChat:(id)a7
{
  id v11 = a3;
  id v36 = a4;
  id v37 = a5;
  id v38 = a6;
  id v39 = a7;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int16 v40 = v12;
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v13,  @"fileTransferUpdates");
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue([v11 fileTransferGUIDs]);
  id v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (!v15)
  {
LABEL_17:

    goto LABEL_18;
  }

  char v16 = 0;
  uint64_t v17 = *(void *)v49;
  do
  {
    for (i = 0LL; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v49 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 transferForGUID:v19]);

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 userInfo]);
      id v23 = v22;
      if (v22 && [v22 count])
      {
        -[NSMutableArray addObject:](v13, "addObject:", v23);
        char v16 = 1;
      }
    }

    id v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
  }

  while (v15);

  if ((v16 & 1) != 0)
  {
    if (IMOSLoggingEnabled(v24, v25))
    {
      uint64_t v26 = OSLogHandleForIMEventCategory("MessageService");
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Sending a FTCommandIDUpdateAttachmentsMessage command", buf, 2u);
      }
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 108LL));
    uint64_t v29 = JWEncodeDictionary(v40);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
    uint64_t v32 = IDSGetUUIDData(v31);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v28,  IDSSendMessageOptionCommandKey,  &__kCFBooleanTrue,  IDSSendMessageOptionWantsDeliveryStatusKey,  v30,  IDSSendMessageOptionDataToEncryptKey,  v33,  IDSSendMessageOptionUUIDKey,  0LL));

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1CEC4;
    v41[3] = &unk_D5D20;
    v41[4] = self;
    id v42 = v36;
    id v43 = v37;
    id v44 = v38;
    id v45 = v34;
    uint64_t v46 = &stru_D5CF8;
    id v14 = v34;
    -[MessageServiceSession _engroupForChat:idsAccount:completion:]( self,  "_engroupForChat:idsAccount:completion:",  v39,  v43,  v41);

    goto LABEL_17;
  }

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7
{
  id v52 = a3;
  id v51 = a4;
  unsigned __int8 v61 = a6;
  id v11 = a5;
  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  id v60 = v11;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v60, &v61);
  id v55 = v60;

  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v55, v61));
  id v59 = 0LL;
  id v12 = _LastAddressedURIForChatLogMetricIfNeeded(v54, 0LL, self, &v59, 0);
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v13 = v59;
  if (-[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v13))
  {
    id v14 = -[MessageServiceSession shouldSendReadReceiptsForChat:style:]( self,  "shouldSendReadReceiptsForChat:style:",  v55,  v61);
    if (v61 == 45)
    {
      int v16 = (int)v14;
      id v17 = [v54 isOscarChat];
      int v18 = (int)v17;
      int v20 = IMOSLoggingEnabled(v17, v19);
      if (!v18)
      {
        if (v20)
        {
          uint64_t v48 = OSLogHandleForIMEventCategory("MessageService");
          __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v63 = v52;
            __int16 v64 = 2112;
            id v65 = v55;
            _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_INFO,  "send read receipt for message: %@   to identifier: %@",  buf,  0x16u);
          }
        }

        goto LABEL_17;
      }

      if (v20)
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v63 = v54;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Not sending remote read receipt for junk chat: %@", buf, 0xCu);
        }

- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v54 = a3;
  id v53 = a4;
  unsigned __int8 v64 = a6;
  id v10 = a5;
  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  id v63 = v10;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v63, &v64);
  id v57 = v63;

  id v58 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v57, v64));
  id v62 = 0LL;
  id v11 = _LastAddressedURIForChatLogMetricIfNeeded(v58, 0LL, self, &v62, 0);
  id v55 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v56 = v62;
  if (-[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:"))
  {
    id v12 = -[MessageServiceSession shouldSendReadReceiptsForChat:style:]( self,  "shouldSendReadReceiptsForChat:style:",  v57,  v64);
    if (v64 == 45)
    {
      int v14 = (int)v12;
      id v15 = [v58 isOscarChat];
      int v16 = (int)v15;
      int v18 = IMOSLoggingEnabled(v15, v17);
      if (!v16)
      {
        if (v18)
        {
          uint64_t v51 = OSLogHandleForIMEventCategory("MessageService");
          id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v66 = v54;
            __int16 v67 = 2112;
            id v68 = v57;
            _os_log_impl( &dword_0,  v52,  OS_LOG_TYPE_INFO,  "send played receipt for message: %@   to identifier: %@",  buf,  0x16u);
          }
        }

        goto LABEL_17;
      }

      if (v18)
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageService");
        int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v66 = v58;
          _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Not sending remote played read receipt for junk chat: %@",  buf,  0xCu);
        }

- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8
{
  id v57 = a3;
  id v52 = a4;
  id v51 = a5;
  unsigned __int8 v67 = a7;
  id v53 = a8;
  id v14 = a6;
  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  id v66 = v14;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v66, &v67);
  id v55 = v66;

  id v54 = (void *)objc_claimAutoreleasedReturnValue([v57 guid]);
  id v58 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v55, v67));
  id v65 = 0LL;
  id v15 = _LastAddressedURIForChatLogMetricIfNeeded(v58, 0LL, self, &v65, 0);
  id v56 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v16 = v65;
  BOOL v17 = -[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v16);
  if (v17)
  {
    BOOL v19 = v67 == 45;
    if (v67 != 45 && IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v69) = v67;
        _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "Not sending delivered quietly receipt for non 1-1 chat style: %c",  buf,  8u);
      }
    }

    id v22 = [v58 isBlackholed];
    if ((_DWORD)v22)
    {
      if (IMOSLoggingEnabled(v22, v23))
      {
        uint64_t v24 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v69 = v58;
          _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "Not sending delivered quietly receipt for blackholed chat: %@",  buf,  0xCu);
        }
      }

      BOOL v19 = 0;
    }

    uint64_t v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v27 = v26;
    if (v56) {
      -[NSMutableArray addObject:](v26, "addObject:", v56);
    }
    if (v19)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v58 participants]);
      id v29 = URIsFromHandles(v28);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

      -[NSMutableArray addObjectsFromArray:](v27, "addObjectsFromArray:", v30);
    }

    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_1E5D4;
    v62[3] = &unk_D5D48;
    id v31 = v54;
    id v63 = v31;
    unsigned __int8 v64 = v27;
    __int128 v50 = v27;
    uint64_t v32 = objc_retainBlock(v62);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 112LL));
    uint64_t v34 = IDSGetUUIDData(v31);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsDeliveredQuietlyAndNotifyRecipient));
    id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v33,  IDSSendMessageOptionCommandKey,  v35,  IDSSendMessageOptionUUIDKey,  v36,  IDSSendMessageOptionTimeoutKey,  v37,  IDSSendMessageOptionRequireAllRegistrationPropertiesKey,  0LL));

    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_1E764;
    v59[3] = &unk_D5D70;
    id v60 = v52;
    id v61 = v53;
    uint64_t v39 = objc_retainBlock(v59);
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
    id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v50));
    [v40 sendMessageDictionary:v41 fromID:v56 fromAccount:v16 toURIs:v42 toGroup:0 priority:300 options:v38 willSendBlock:v39 completionBlock:v32];

    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v16));
    -[MessageServiceSession didSendDeliveredQuietlyReceiptForMessageID:account:]( self,  "didSendDeliveredQuietlyReceiptForMessageID:account:",  v31,  v43);
  }

  else
  {
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v57 guid]);
    id v45 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v16));
    -[MessageServiceSession didSendMessagePlayedReceiptForMessageID:account:]( self,  "didSendMessagePlayedReceiptForMessageID:account:",  v44,  v45);

    if (IMOSLoggingEnabled(v46, v47))
    {
      uint64_t v48 = OSLogHandleForIMEventCategory("MessageService");
      __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_INFO,  " ** Device is not regisistered, failing delivered quietly receipt",  buf,  2u);
      }
    }
  }
}

- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v50 = a3;
  id v46 = a4;
  unsigned __int8 v57 = a6;
  id v10 = a5;
  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  id v56 = v10;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v56, &v57);
  id v48 = v56;

  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v50 guid]);
  id v51 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v48, v57));
  id v55 = 0LL;
  id v11 = _LastAddressedURIForChatLogMetricIfNeeded(v51, 0LL, self, &v55, 0);
  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v12 = v55;
  BOOL v13 = -[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v12);
  if (v13)
  {
    BOOL v15 = v57 == 45;
    if (v57 != 45 && IMOSLoggingEnabled(v13, v14))
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory("MessageService");
      BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v59) = v57;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "Not sending notify recipient receipt for non 1-1 chat style: %c",  buf,  8u);
      }
    }

    id v18 = [v51 isBlackholed];
    if ((_DWORD)v18)
    {
      if (IMOSLoggingEnabled(v18, v19))
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v59 = v51;
          _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "Not sending notify recipient receipt for blackholed chat: %@",  buf,  0xCu);
        }
      }

      BOOL v15 = 0;
    }

    id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v23 = v22;
    if (v49) {
      -[NSMutableArray addObject:](v22, "addObject:", v49);
    }
    if (v15)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v51 participants]);
      id v25 = URIsFromHandles(v24);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

      -[NSMutableArray addObjectsFromArray:](v23, "addObjectsFromArray:", v26);
    }

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1EF8C;
    v52[3] = &unk_D5D48;
    id v27 = v47;
    id v53 = v27;
    id v54 = v23;
    id v45 = v23;
    id v28 = objc_retainBlock(v52);
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 113LL));
    uint64_t v30 = IDSGetUUIDData(v27);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsDeliveredQuietlyAndNotifyRecipient));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v29,  IDSSendMessageOptionCommandKey,  v31,  IDSSendMessageOptionUUIDKey,  v32,  IDSSendMessageOptionTimeoutKey,  v33,  IDSSendMessageOptionRequireAllRegistrationPropertiesKey,  0LL));

    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v45));
    [v35 sendMessageDictionary:v36 fromID:v49 fromAccount:v12 toURIs:v37 toGroup:0 priority:300 options:v34 willSendBlock:0 completionBlock:v28];

    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v12));
    -[MessageServiceSession didSendNotifyRecipientCommandForMessageID:account:]( self,  "didSendNotifyRecipientCommandForMessageID:account:",  v27,  v38);
  }

  else
  {
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v50 guid]);
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v12));
    -[MessageServiceSession didSendMessagePlayedReceiptForMessageID:account:]( self,  "didSendMessagePlayedReceiptForMessageID:account:",  v39,  v40);

    if (IMOSLoggingEnabled(v41, v42))
    {
      uint64_t v43 = OSLogHandleForIMEventCategory("MessageService");
      id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v44,  OS_LOG_TYPE_INFO,  " ** Device is not regisistered, failing notify recipient receipt",  buf,  2u);
      }
    }
  }
}

- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10
{
  id v55 = a3;
  id v54 = a4;
  unsigned __int8 v82 = a8;
  id v49 = a9;
  id v51 = a10;
  id v81 = a7;
  id v16 = a7;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v81, &v82);
  id v56 = v81;

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v56, v82));
  if (v18)
  {
    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession messageStore](self, "messageStore"));
    id v80 = 0LL;
    id v53 = (void *)objc_claimAutoreleasedReturnValue( [v48 storeEditedMessage:v55 editedPartIndex:a5 editType:a6 previousMessage:v54 chat:v18 updatedAssociatedMessageItems:&v80]);
    id v50 = v80;
    id v52 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v53) {
      -[NSMutableArray addObject:](v52, "addObject:", v53);
    }
    if ([v50 count]) {
      -[NSMutableArray addObjectsFromArray:](v52, "addObjectsFromArray:", v50);
    }
    id v19 = -[NSMutableArray copy](v52, "copy");
    uint64_t v47 = (void *)IMCreateSerializedItemsFromArray();

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 accountID]);
    [v20 account:v22 chat:v56 style:v82 chatProperties:0 messagesUpdated:v47];

    id v79 = 0LL;
    id v23 = _LastAddressedURIForChatLogMetricIfNeeded(v18, 0LL, self, &v79, 0);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    id v44 = v79;
    id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v26 = v25;
    if (v24) {
      -[NSMutableArray addObject:](v25, "addObject:", v24);
    }
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v18 participants]);
    id v28 = URIsFromHandles(v27);
    id v46 = (void *)objc_claimAutoreleasedReturnValue(v28);

    -[NSMutableArray addObjectsFromArray:](v26, "addObjectsFromArray:", v46);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v55 guid]);
    id location = 0LL;
    objc_initWeak(&location, self);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472LL;
    v74[2] = sub_1F7E8;
    v74[3] = &unk_D5D98;
    objc_copyWeak(v77, &location);
    id v30 = v29;
    id v75 = v30;
    v77[1] = (id)a5;
    id v76 = v54;
    id v45 = objc_retainBlock(v74);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_1F99C;
    v71[3] = &unk_D5DC0;
    objc_copyWeak(v73, &location);
    id v43 = v30;
    id v72 = v43;
    v73[1] = (id)a5;
    v73[2] = (id)a6;
    id v31 = objc_retainBlock(v71);
    if (-[MessageServiceSession isReplicating](self, "isReplicating")
      && (unint64_t v32 = -[MessageServiceSession _replicationEditDelay](self, "_replicationEditDelay"), (v34 = v32) != 0))
    {
      if (IMOSLoggingEnabled(v32, v33))
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = objc_claimAutoreleasedReturnValue([v55 guid]);
          *(_DWORD *)buf = 138412546;
          uint64_t v84 = v37;
          __int16 v85 = 1024;
          LODWORD(v86) = v34;
          when = (void *)v37;
          _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "Deferring message edit of %@ for replication by %u seconds",  buf,  0x12u);
        }
      }

      dispatch_time_t whena = dispatch_time(0LL, 1000000000 * v34);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1FACC;
      block[3] = &unk_D5DE8;
      unint64_t v68 = v34;
      id v58 = v55;
      id v59 = self;
      id v60 = v53;
      int64_t v69 = a5;
      unint64_t v70 = a6;
      id v61 = v26;
      id v62 = v56;
      id v63 = v44;
      id v64 = v24;
      id v65 = v51;
      id v66 = v45;
      unsigned __int8 v67 = v31;
      dispatch_after(whena, &_dispatch_main_q, block);

      id v38 = v58;
    }

    else
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
      [v38 sendEditedMessage:v53 partIndex:a5 editType:a6 destinations:v26 chatIdentifier:v56 account:v44 fromID:v24 backwardCompatabilityText:v51 unsupp ortedDestinationsHandler:v45 completionBlock:v31];
    }

    objc_destroyWeak(v73);
    objc_destroyWeak(v77);
    objc_destroyWeak(&location);
  }

  else if (IMOSLoggingEnabled(0LL, v17))
  {
    uint64_t v39 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v84 = (uint64_t)v55;
      __int16 v85 = 2112;
      uint64_t v86 = 0LL;
      _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  "Could not find chat for edited message. message: %@ chat: %@",  buf,  0x16u);
    }
  }
}

- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6
{
  id v48 = a3;
  id v45 = a5;
  unsigned __int8 v54 = a6;
  id v53 = a4;
  id v10 = a4;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v53, &v54);
  id v11 = v53;

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v11, v54));
  if (v13)
  {
    id v46 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession messageStore](self, "messageStore"));
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 storeRepositionedStickerLocally:v48]);
    id v44 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if (v47)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v48 guid]);
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v46 messageWithGUID:v14]);

      if (!v15)
      {
        uint64_t v35 = IMLogHandleForCategory("MessageServiceSession");
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        unint64_t v32 = v36;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          sub_8F56C((uint64_t)v48, v36, v37, v38, v39, v40, v41, v42);
          unint64_t v32 = v36;
        }

        goto LABEL_8;
      }

      -[NSMutableArray addObject:](v44, "addObject:", v15);
    }

    id v16 = -[NSMutableArray copy](v44, "copy");
    uint64_t v43 = IMCreateSerializedItemsFromArray();

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountID]);
    [v17 account:v19 chat:v11 style:v54 chatProperties:0 messagesUpdated:v43];

    id v52 = 0LL;
    id v20 = _LastAddressedURIForChatLogMetricIfNeeded(v13, 0LL, self, &v52, 0);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = v52;
    id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v24 = v23;
    if (v21) {
      -[NSMutableArray addObject:](v23, "addObject:", v21);
    }
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v13 participants]);
    id v26 = URIsFromHandles(v25);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    -[NSMutableArray addObjectsFromArray:](v24, "addObjectsFromArray:", v27);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_1FFD8;
    v49[3] = &unk_D5D48;
    id v28 = v48;
    id v50 = v28;
    id v51 = v24;
    id v29 = v24;
    id v30 = objc_retainBlock(v49);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
    [v31 sendRepositionedStickerMetadata:v47 forEditedMessage:v28 destinations:v29 account:v22 fromID:v21 completionBlock:v30];

    unint64_t v32 = (void *)v43;
LABEL_8:

    goto LABEL_13;
  }

  if (IMOSLoggingEnabled(0LL, v12))
  {
    uint64_t v33 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    unint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v56 = v48;
      __int16 v57 = 2112;
      uint64_t v58 = 0LL;
      _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "Could not find chat for sticker reposition. message: %@ chat: %@",  buf,  0x16u);
    }
  }

- (unint64_t)_replicationEditDelay
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"replication-edit-delay"]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    && (uint64_t v5 = objc_opt_respondsToSelector(v3, "unsignedIntegerValue"), (v5 & 1) != 0))
  {
    if (IMOSLoggingEnabled(v5, v6))
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory("SMS");
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11[0] = 67109120;
        v11[1] = [v3 unsignedIntegerValue];
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "Server bag value for replication edit delay: %u",  (uint8_t *)v11,  8u);
      }
    }

    id v9 = [v3 unsignedIntegerValue];
  }

  else
  {
    id v9 = &dword_1C + 2;
  }

  return (unint64_t)v9;
}

- (id)_handleIDsForDestinations:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
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
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)IDSCopyRawAddressForDestination(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v9));
        if (objc_msgSend(v10, "length", (void)v13)) {
          -[NSMutableOrderedSet addObject:](v4, "addObject:", v10);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v4, "array"));
  return v11;
}

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v10 = a3;
  id v11 = a4;
  v71[0] = a6;
  id v12 = a5;
  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  id v70 = v12;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v70, v71);
  id v13 = v70;

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession chatForChatIdentifier:style:]( self,  "chatForChatIdentifier:style:",  v13,  v71[0]));
  id v69 = 0LL;
  id v15 = _LastAddressedURIForChatLogMetricIfNeeded(v14, 0LL, self, &v69, 0);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = v69;
  if (-[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v17))
  {
    id v58 = v17;
    id v61 = v11;
    -[MessageServiceSession _fixParticipantsForChat:](self, "_fixParticipantsForChat:", v14);
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v19 = v18;
    if (v16) {
      -[NSMutableArray addObject:](v18, "addObject:", v16);
    }
    id v59 = v16;
    id v60 = v13;
    id v64 = v14;
    if (([v10 isFromMe] & 1) == 0)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 sender]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v20));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 _URIsFromIDs]);
      -[NSMutableArray addObjectsFromArray:](v19, "addObjectsFromArray:", v22);
    }

    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = sub_20948;
    v65[3] = &unk_D5D48;
    id v62 = v10;
    id v23 = v10;
    id v66 = v23;
    __int16 v57 = v19;
    unsigned __int8 v67 = v57;
    id v56 = objc_retainBlock(v65);
    uint64_t v24 = IDSSendMessageOptionTopLevelDictionaryKey;
    uint64_t v25 = IDSSendMessageOptionSkipPayloadCheckKey;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 106LL));
    uint64_t v27 = IDSSendMessageOptionCommandKey;
    id v63 = v23;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v23 guid]);
    uint64_t v29 = IDSGetUUIDData(v28);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v31 = IDSSendMessageOptionUUIDKey;
    unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    id v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v24,  &__kCFBooleanTrue,  v25,  v26,  v27,  v30,  v31,  v32,  IDSSendMessageOptionTimeoutKey,  0LL));

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
    __int128 v16 = v59;
    id v34 = [v33 newGroupMessagePayloadForChat:v64 fromID:v59];

    uint64_t v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v36 = (__CFDictionary *)v35;
    if (v34) {
      CFDictionarySetValue((CFMutableDictionaryRef)v35, @"p", v34);
    }
    unsigned __int8 v54 = v34;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    if ([v63 isAudioMessage])
    {
      uint64_t v38 = 0LL;
    }

    else
    {
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v63 balloonBundleID]);
      id v46 = [v45 length];

      if (!v46)
      {
LABEL_17:
        if (v37) {
          CFDictionarySetValue(v36, @"aT", v37);
        }
        id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
        id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v57));
        id v50 = v36;
        id v51 = v36;
        id v17 = v58;
        [v48 sendMessageDictionary:v50 fromID:v59 fromAccount:v58 toURIs:v49 toGroup:0 priority:300 options:v55 completionBlock:v56];

        id v52 = (void *)objc_claimAutoreleasedReturnValue([v63 guid]);
        id v53 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v58));
        -[MessageServiceSession didSendMessageSavedReceiptForMessageID:account:]( self,  "didSendMessageSavedReceiptForMessageID:account:",  v52,  v53);

        id v11 = v61;
        id v10 = v62;
        id v13 = v60;
        __int128 v14 = v64;
        goto LABEL_20;
      }

      uint64_t v38 = 2LL;
    }

    uint64_t v47 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v38));

    uint64_t v37 = (void *)v47;
    goto LABEL_17;
  }

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v10 guid]);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v17));
  -[MessageServiceSession didSendMessageSavedReceiptForMessageID:account:]( self,  "didSendMessageSavedReceiptForMessageID:account:",  v39,  v40);

  if (IMOSLoggingEnabled(v41, v42))
  {
    uint64_t v43 = OSLogHandleForIMEventCategory("MessageService");
    id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, " ** Device is not regisistered, failing saved receipt", buf, 2u);
    }
  }

- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    uint64_t v27 = IMLogHandleForCategory("SyndicationActions");
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_8F5D0();
    }
    goto LABEL_25;
  }

  if (![v7 count])
  {
    uint64_t v29 = IMLogHandleForCategory("SyndicationActions");
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_8F5FC();
    }
LABEL_25:

    goto LABEL_33;
  }

  id v9 = [v6 syndicationActionType];
  if ((v9 & 0x20) != 0)
  {
    if (IMOSLoggingEnabled(v9, v10))
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory("SyndicationActions");
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_INFO,  "Not sending Syndication action for SMS Spoof detected content",  buf,  2u);
      }
    }
  }

  else
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    unint64_t v32 = v8;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allExistingChatsWithIdentifier:v15]);

          if (IMOSLoggingEnabled(v18, v19))
          {
            uint64_t v20 = OSLogHandleForIMFoundationCategory("SyndicationActions");
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              id v22 = [v17 count];
              *(_DWORD *)buf = 134217984;
              id v43 = v22;
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Sending syndication actions to %ld chats", buf, 0xCu);
            }
          }

          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          id v23 = v17;
          id v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v34;
            do
            {
              for (j = 0LL; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v34 != v25) {
                  objc_enumerationMutation(v23);
                }
                -[MessageServiceSession _sendSyndicationAction:toChat:]( self,  "_sendSyndicationAction:toChat:",  v6,  *(void *)(*((void *)&v33 + 1) + 8LL * (void)j));
              }

              id v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }

            while (v24);
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }

      while (v12);
    }

    uint64_t v8 = v32;
  }

- (void)_sendSyndicationAction:(id)a3 toChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    id v49 = 0LL;
    id v9 = _LastAddressedURIForChatLogMetricIfNeeded(v7, 0LL, self, &v49, 0);
    id v45 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v10 = (os_log_s *)v49;
    if (-[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v10))
    {
      if (v45)
      {
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v6 addParametersToSendMessageDictionary:v11];
        [v8 addGroupContextToSendMessageDictionary:v11 callerID:v45];
        uint64_t v12 = JWEncodeDictionary(v11);
        id v43 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v44 = [v43 _FTCopyGzippedData];
        uint64_t v14 = IMOSLoggingEnabled(v44, v13);
        if ((_DWORD)v14)
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory("SyndicationActions");
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            unsigned int v18 = [v43 length];
            unsigned int v19 = [v44 length];
            *(_DWORD *)buf = 67109376;
            unsigned int v54 = v18;
            __int16 v55 = 1024;
            unsigned int v56 = v19;
            _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "Compressed SyndicationAction from: %u to: %u in sendSyndicationAction",  buf,  0xEu);
          }
        }

        if (IMOSLoggingEnabled(v14, v15))
        {
          uint64_t v20 = OSLogHandleForIMFoundationCategory("SyndicationActions");
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            unsigned int v22 = [v44 length];
            *(_DWORD *)buf = 67109120;
            unsigned int v54 = v22;
            _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "Adding SyndicationAction data to be encrypted of size %u",  buf,  8u);
          }
        }

        v51[0] = IDSSendMessageOptionTopLevelDictionaryKey;
        v51[1] = IDSSendMessageOptionSkipPayloadCheckKey;
        v52[0] = &__kCFBooleanTrue;
        v52[1] = &__kCFBooleanTrue;
        v52[2] = &off_DB4C8;
        v51[2] = IDSSendMessageOptionCommandKey;
        v51[3] = IDSSendMessageOptionUUIDKey;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
        uint64_t v24 = IDSGetUUIDData(v23);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v52[3] = v25;
        v51[4] = IDSSendMessageOptionTimeoutKey;
        id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
        void v52[4] = v26;
        void v51[5] = IDSSendMessageOptionDataToEncryptKey;
        v52[5] = v44;
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  6LL));

        id v50 = v45;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v50, 1LL));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_2133C;
        v46[3] = &unk_D5D48;
        id v28 = v6;
        id v47 = v28;
        id v48 = v27;
        id v29 = v27;
        uint64_t v30 = objc_retainBlock(v46);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
        unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v29));
        [v31 sendMessageDictionary:&__NSDictionary0__struct fromID:v45 fromAccount:v10 toURIs:v32 toGroup:0 priority:300 options:v42 completionBlock:v30];

        -[MessageServiceSession didSendSyndicationActionItem:forChat:]( self,  "didSendSyndicationActionItem:forChat:",  v28,  v8);
      }

      else
      {
        uint64_t v41 = IMLogHandleForCategory("SyndicationActions");
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_8F68C();
        }
      }
    }

    else
    {
      uint64_t v40 = IMLogHandleForCategory("SyndicationActions");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_8F6B8();
      }
    }
  }

  else
  {
    uint64_t v33 = IMLogHandleForCategory("SyndicationActions");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_8F628((uint64_t)v6, v10, v34, v35, v36, v37, v38, v39);
    }
  }
}

- (void)updateBalloonPayload:(id)a3 attachments:(id)a4 forMessageGUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 messageWithGUID:v10]);

    if (v13)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 chatForMessage:v13]);

      if (v17)
      {
        [v13 setPayloadData:v8];
        if ([v9 count])
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 guidsForStoredAttachmentPayloadData:v9 messageGUID:v10]);
          [v13 setFileTransferGUIDs:v21];
        }

        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v17 chatIdentifier]);
        id v23 = [v17 style];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 accountID]);
        -[MessageServiceSession didReceiveBalloonPayload:forChat:style:messageGUID:account:]( self,  "didReceiveBalloonPayload:forChat:style:messageGUID:account:",  v13,  v22,  v23,  v10,  v24);
      }

      else if (IMOSLoggingEnabled(v18, v19))
      {
        uint64_t v27 = OSLogHandleForIMFoundationCategory("Warning");
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          int v29 = 138412290;
          id v30 = v13;
          _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "Chat: Could not find a chat for message: %@",  (uint8_t *)&v29,  0xCu);
        }
      }
    }

    else
    {
      if (!IMOSLoggingEnabled(v14, v15))
      {
LABEL_20:

        goto LABEL_21;
      }

      uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO))
      {
        int v29 = 138412290;
        id v30 = v10;
        _os_log_impl( &dword_0,  (os_log_t)v17,  OS_LOG_TYPE_INFO,  "Chat: Could not update balloon payload for missing message GUID: %@",  (uint8_t *)&v29,  0xCu);
      }
    }

    goto LABEL_20;
  }

  if (IMOSLoggingEnabled(0LL, v11))
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      id v30 = v10;
      _os_log_impl( &dword_0,  (os_log_t)v13,  OS_LOG_TYPE_INFO,  "Chat: Could not update balloon payload for missing payload: %@",  (uint8_t *)&v29,  0xCu);
    }

    goto LABEL_20;
  }

- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v15 = (id)IMOSLoggingEnabled(v13, v14);
  if ((_DWORD)v15)
  {
    uint64_t v17 = OSLogHandleForIMEventCategory("MessageService");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 length]));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v11 count]));
      *(_DWORD *)buf = 138413058;
      id v75 = v19;
      __int16 v76 = 2112;
      __int128 v77 = v20;
      __int16 v78 = 2112;
      id v79 = v12;
      __int16 v80 = 2112;
      id v81 = v13;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "sendBalloonPayload [payload length] %@ [attachments count] %@ GUID %@ bundleID %@",  buf,  0x2Au);
    }
  }

  if (v13)
  {
    if (v10 && (id v15 = [v10 length]) != 0)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  1LL));
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"md-balloon-transport-override"]);
      BOOL v23 = [v22 intValue] == 0;

      if (v23)
      {
        int v29 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        id v63 = (void *)objc_claimAutoreleasedReturnValue([v29 messageWithGUID:v12]);

        if (v63)
        {
          unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
          id v62 = (void *)objc_claimAutoreleasedReturnValue([v32 chatForMessage:v63]);

          if (v62)
          {
            id v73 = 0LL;
            id v34 = _LastAddressedURIForChatLogMetricIfNeeded(v62, 0LL, self, &v73, 0);
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            id v36 = v73;
            id v61 = v36;
            if (!v36 || !v35)
            {
              id v36 = (id)IMOSLoggingEnabled(v36, v37);
              if ((_DWORD)v36)
              {
                uint64_t v38 = OSLogHandleForIMFoundationCategory("Warning");
                uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v75 = v62;
                  __int16 v76 = 2112;
                  __int128 v77 = v61;
                  _os_log_impl( &dword_0,  v39,  OS_LOG_TYPE_INFO,  "Could not find IDSAccount for chat: %@, idsAccount %@",  buf,  0x16u);
                }
              }
            }

            if (IMOSLoggingEnabled(v36, v37))
            {
              uint64_t v40 = OSLogHandleForIMFoundationCategory("MessageService");
              uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v75 = v12;
                __int16 v76 = 2112;
                __int128 v77 = v62;
                _os_log_impl( &dword_0,  v41,  OS_LOG_TYPE_INFO,  "Found chat to send bubble message (%@) on: %@",  buf,  0x16u);
              }
            }

            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance"));
            id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 guidsForStoredAttachmentPayloadData:v11 messageGUID:v12]);
            [v63 setFileTransferGUIDs:v43];

            [v63 setPayloadData:v10];
            id v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            id v45 = v44;
            if (v35) {
              [v44 addObject:v35];
            }
            id v46 = (void *)objc_claimAutoreleasedReturnValue([v62 participants]);
            id v47 = URIsFromHandles(v46);
            id v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
            [v45 addObjectsFromArray:v48];

            id v49 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession imdAccountForIDSAccount:](self, "imdAccountForIDSAccount:", v61));
            id v60 = (void *)objc_claimAutoreleasedReturnValue([v62 chatIdentifier]);
            unsigned int v59 = [v62 style];
            id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 accountID]);
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472LL;
            v64[2] = sub_21FB0;
            v64[3] = &unk_D5E58;
            void v64[4] = self;
            id v65 = v12;
            id v66 = v13;
            id v67 = v10;
            id v68 = v11;
            id v69 = v62;
            id v70 = v61;
            id v71 = v35;
            id v72 = v45;
            id v51 = v45;
            id v52 = v35;
            id v53 = v61;
            -[MessageServiceSession didSendBalloonPayload:forChat:style:messageGUID:account:completionBlock:]( self,  "didSendBalloonPayload:forChat:style:messageGUID:account:completionBlock:",  v63,  v60,  v59,  v65,  v50,  v64);
          }

          else if (IMOSLoggingEnabled(0LL, v33))
          {
            uint64_t v56 = OSLogHandleForIMFoundationCategory("Warning");
            __int16 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v75 = v63;
              _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "Chat: Could not find a chat for message: %@", buf, 0xCu);
            }
          }
        }

        else if (IMOSLoggingEnabled(v30, v31))
        {
          uint64_t v54 = OSLogHandleForIMFoundationCategory("Warning");
          __int16 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v75 = v12;
            _os_log_impl( &dword_0,  v55,  OS_LOG_TYPE_INFO,  "Chat: Could not send balloon payload for missing message GUID: %@",  buf,  0xCu);
          }
        }
      }

      else if (IMOSLoggingEnabled(v24, v25))
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "The server has disabled balloon to balloon via the iMessage config bag!",  buf,  2u);
        }

- (void)sendCrossServiceAssociationMessageWithReplacementGUID:(id)a3 messageGUID:(id)a4 callerID:(id)a5 toID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("MessageService");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v35 = v9;
      __int16 v36 = 2112;
      id v37 = v10;
      __int16 v38 = 2112;
      id v39 = v11;
      __int16 v40 = 2112;
      id v41 = v12;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "In cross service association method for replacementGUID: %@ messageGUID: %@, toID %@ callerID: %@",  buf,  0x2Au);
    }
  }

  if (!v11) {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession callerURIUsingCalleeURI:](self, "callerURIUsingCalleeURI:", v12));
  }
  int v29 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsAccountForFromURI:toURI:](self, "idsAccountForFromURI:toURI:", v11, v12));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_22BF4;
  v31[3] = &unk_D5D48;
  id v16 = v9;
  id v32 = v16;
  id v17 = v10;
  id v33 = v17;
  uint64_t v18 = objc_retainBlock(v31);
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v20 = v19;
  if (v12) {
    -[NSMutableArray addObject:](v19, "addObject:", v12);
  }
  if (v11) {
    -[NSMutableArray addObject:](v20, "addObject:", v11);
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 135LL));
  uint64_t v22 = IDSGetUUIDData(v17);
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionSkipPayloadCheckKey,  v21,  IDSSendMessageOptionCommandKey,  v23,  IDSSendMessageOptionUUIDKey,  v24,  IDSSendMessageOptionTimeoutKey,  &__kCFBooleanTrue,  IDSSendMessageOptionWantsCertifiedDeliveryKey,  0LL));

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v16,  @"Ur"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v20));
  [v26 sendMessageDictionary:v27 fromID:v11 fromAccount:v29 toURIs:v28 toGroup:0 priority:300 options:v25 completionBlock:v18];
}

- (void)_automation_sendDictionary:(id)a3 options:(id)a4 toHandles:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession callerURIForMessageServiceType:](self, "callerURIForMessageServiceType:", 0LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsAccountForFromURI:toURI:](self, "idsAccountForFromURI:toURI:", v16, v11));

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "__im_canonicalIDSIDsFromAddresses"));

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
  [v13 sendMessageDictionary:v10 fromID:v16 fromAccount:v12 toURIs:v15 toGroup:0 priority:300 options:v9 completionBlock:&stru_D5E78];
}

- (void)sendDeliveryReceiptForMessageID:(id)a3 toID:(id)a4 deliveryContext:(id)a5 needsDeliveryReceipt:(id)a6 callerID:(id)a7 account:(id)a8
{
  id v34 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v38 = v34;
      __int16 v39 = 2112;
      id v40 = v13;
      __int16 v41 = 2112;
      id v42 = v14;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "In delivery receipt method for messageID: %@ toID %@ deliveryContext: %@, needsDeliveryReceipt :%@ ",  buf,  0x2Au);
    }
  }

  if ([v15 BOOLValue])
  {
    if (v16)
    {
      if (!v17) {
        goto LABEL_10;
      }
    }

    else
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession callerURIUsingCalleeURI:](self, "callerURIUsingCalleeURI:", v13));
      if (!v17) {
LABEL_10:
      }
        id v17 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsAccount](self, "idsAccount"));
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_23364;
    v35[3] = &unk_D5958;
    id v21 = v34;
    id v36 = v21;
    id v32 = objc_retainBlock(v35);
    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    BOOL v23 = v22;
    if (v13) {
      -[NSMutableArray addObject:](v22, "addObject:", v13);
    }
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 101LL));
    uint64_t v25 = IDSGetUUIDData(v21);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v24,  IDSSendMessageOptionCommandKey,  v26,  IDSSendMessageOptionUUIDKey,  v27,  IDSSendMessageOptionTimeoutKey,  0LL));

    if (v14) {
      [v28 setObject:v14 forKey:@"Dc"];
    }
    int v29 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));
    [v29 sendMessageDictionary:v30 fromID:v16 fromAccount:v17 toURIs:v31 toGroup:0 priority:300 options:v28 completionBlock:v32];
  }
}

- (id)_messageDictionaryToReflectWithDeliveryReceipt:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 properties]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:IMChatPropertyEnableReadReceiptForChatKey]);
  if (!v7) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:IMChatPropertyReadReceiptsSettingVersionKey]);
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
  }
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[MessageServiceSession globalReadReceiptSettingVersion](self, "globalReadReceiptSettingVersion"));
  id v10 = (void *)v9;
  id v11 = &off_DB4E0;
  if (v9) {
    id v11 = (_UNKNOWN **)v9;
  }
  id v12 = v11;

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MessageServiceSession readReceiptsGloballyEnabled](self, "readReceiptsGloballyEnabled")));
  if (v7) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"eR", v7);
  }
  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"vR", v8);
  }
  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"gR", v13);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v5, @"gV", v12);

  return v5;
}

- (void)sendNicknameInfoToURIs:(id)a3 chatGUID:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"enable-snap-v2-back-compat"]);
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    uint64_t v11 = IMSharedHelperNickNameEnabled();
    if ((v11 & 1) != 0)
    {
      if (v7)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 existingChatWithGUID:v7]);

        if (!v14)
        {
          if (IMOSLoggingEnabled(v15, v16))
          {
            uint64_t v42 = OSLogHandleForIMFoundationCategory("Warning");
            __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v54 = v7;
              _os_log_impl( &dword_0,  v43,  OS_LOG_TYPE_INFO,  "We did not have a chat to send nickname info to %@",  buf,  0xCu);
            }
          }

          id v19 = 0LL;
          uint64_t v18 = 0LL;
          goto LABEL_35;
        }

        id v52 = 0LL;
        id v17 = _LastAddressedURIForChatLogMetricIfNeeded(v14, 0LL, self, &v52, 0);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        id v19 = v52;
      }

      else
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession callerURIForMessageServiceType:]( self,  "callerURIForMessageServiceType:",  0LL));
        id v19 = (id)objc_claimAutoreleasedReturnValue( -[MessageServiceSession idsAccountForURI:IDSServiceName:]( self,  "idsAccountForURI:IDSServiceName:",  v18,  IDSServiceNameiMessage));
      }

      id v22 = (id)-[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v19);
      int v24 = (int)v22;
      if ((_DWORD)v22 && (id v22 = [v18 length]) != 0)
      {
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472LL;
        v49[2] = sub_23C6C;
        v49[3] = &unk_D5D48;
        id v48 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
        id v50 = v48;
        id v46 = v6;
        id v51 = v46;
        id v47 = objc_retainBlock(v49);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 131LL));
        uint64_t v26 = IDSGetUUIDData(v48);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
        int v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v25,  IDSSendMessageOptionCommandKey,  v27,  IDSSendMessageOptionUUIDKey,  v28,  IDSSendMessageOptionTimeoutKey,  0LL));

        uint64_t v30 = objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
        id v31 = [(id)v30 newNicknameInfoToSend];

        id v32 = [v31 count];
        LOBYTE(v30) = v32 == 0LL;
        int v34 = IMOSLoggingEnabled(v32, v33);
        if ((v30 & 1) != 0)
        {
          if (v34)
          {
            uint64_t v44 = OSLogHandleForIMFoundationCategory("MessageService");
            id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "No nickname info to send to others", buf, 2u);
            }
          }
        }

        else
        {
          if (v34)
          {
            uint64_t v35 = OSLogHandleForIMFoundationCategory("MessageService");
            id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v54 = v48;
              __int16 v55 = 2112;
              id v56 = v46;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Sending nickname info %@ to participants %@", buf, 0x16u);
            }
          }

          id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
          id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v46));
          [v37 sendMessageDictionary:v31 encryptDictionary:1 fromID:v18 fromAccount:v19 toURIs:v38 toGroup:0 priority:300 options:v29 willSendBlock:0 completionBlock:v47];
        }
      }

      else if (IMOSLoggingEnabled(v22, v23))
      {
        uint64_t v39 = OSLogHandleForIMEventCategory("MessageService");
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          __int16 v41 = @"NO";
          if (v24) {
            __int16 v41 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          uint64_t v54 = v41;
          __int16 v55 = 2112;
          id v56 = v18;
          _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  "** Device is not registered %@, failing nickname info or we don't have a callerURI %@",  buf,  0x16u);
        }
      }

- (BOOL)sendNicknameUpdatesToPeerDevices:(id)a3 toDestinations:(id)a4
{
  __int16 v57 = (__CFString *)a3;
  id v58 = a4;
  if (IMOSLoggingEnabled(v58, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("MessageService");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v66 = v57;
      __int16 v67 = 2112;
      id v68 = v58;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "Sending nickname updates to my other devices %@ and peers %@",  buf,  0x16u);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsAccount](self, "idsAccount"));
  BOOL v10 = -[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v9);
  if (v10)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    if ([v58 count])
    {
      -[NSMutableSet addObjectsFromArray:](v12, "addObjectsFromArray:", v58);
    }

    else
    {
      id v56 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsServiceForIDSAccount:](self, "idsServiceForIDSAccount:", v9));
      if (IMOSLoggingEnabled(v56, v18))
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v56 devices]);
          id v22 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v21 count]));
          *(_DWORD *)buf = 138412290;
          id v66 = v22;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Going to send nickname updates to %@ accounts", buf, 0xCu);
        }
      }

      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v56 devices]);
      id v24 = [v23 countByEnumeratingWithState:&v59 objects:v73 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v60;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v60 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = (void *)IDSCopyIDForDevice(*(void *)(*((void *)&v59 + 1) + 8LL * (void)i));
            -[NSMutableSet addObject:](v12, "addObject:", v27);
          }

          id v24 = [v23 countByEnumeratingWithState:&v59 objects:v73 count:16];
        }

        while (v24);
      }

      id v28 = -[NSMutableSet count](v12, "count");
      int v29 = (void *)objc_claimAutoreleasedReturnValue([v9 devices]);
      id v30 = [v29 count];

      if (v9) {
        BOOL v33 = v28 != 0LL;
      }
      else {
        BOOL v33 = 0;
      }
      if (v30 == 0LL
        || !v33
        || (int v34 = (void *)objc_claimAutoreleasedReturnValue([v9 devices]),
            BOOL v35 = v34 == 0LL,
            v34,
            v35))
      {
        if (IMOSLoggingEnabled(v31, v32))
        {
          uint64_t v49 = OSLogHandleForIMFoundationCategory("Warning");
          id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            uint64_t v51 = objc_claimAutoreleasedReturnValue([v9 devices]);
            id v52 = (void *)v51;
            id v53 = @"NO";
            *(_DWORD *)buf = 138413058;
            if (v30) {
              uint64_t v54 = @"YES";
            }
            else {
              uint64_t v54 = @"NO";
            }
            if (v28) {
              id v53 = @"YES";
            }
            id v66 = v53;
            __int16 v67 = 2112;
            id v68 = (id)v54;
            __int16 v69 = 2112;
            id v70 = v9;
            __int16 v71 = 2112;
            uint64_t v72 = v51;
            _os_log_impl( &dword_0,  v50,  OS_LOG_TYPE_INFO,  "We did not have ids accounts to send nickname info out -- bailing {haveIDSDevicesToSendTo %@ haveTokenURIS ToSendTo %@ idsAccount %@ devices %@}",  buf,  0x2Au);
          }
        }

        BOOL v17 = 0;
        goto LABEL_49;
      }
    }

    id v56 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession callerURIForIDSAccount:](self, "callerURIForIDSAccount:", v9));
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 70000LL));
    if (v14)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v13, @"c", v14);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_8F458();
    }

    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 180LL));
    uint64_t v38 = IDSGetUUIDData(v36);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v37,  IDSSendMessageOptionCommandKey,  v39,  IDSSendMessageOptionUUIDKey,  v40,  IDSSendMessageOptionTimeoutKey,  &__kCFBooleanTrue,  IDSSendMessageOptionWantsDeliveryStatusKey,  v13,  IDSSendMessageOptionDeliveryStatusContextKey,  0LL));

    v63[0] = @"gC";
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 70000LL));
    v63[1] = @"pID";
    v64[0] = v42;
    v64[1] = v57;
    __int16 v43 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  2LL));

    if (IMOSLoggingEnabled(v44, v45))
    {
      uint64_t v46 = OSLogHandleForIMFoundationCategory("MessageService");
      id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v66 = v43;
        __int16 v67 = 2112;
        id v68 = v12;
        _os_log_impl( &dword_0,  v47,  OS_LOG_TYPE_INFO,  "Sending generic command to update nickname properties with message dictionary %@ to destinations %@",  buf,  0x16u);
      }
    }

    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
    [v48 sendMessageDictionary:v43 encryptDictionary:1 fromID:v56 fromAccount:v9 toURIs:v12 toGroup:0 priority:300 options:v41 willSendBlock:0 completionBlock:&stru_D5E98];

    BOOL v17 = 1;
LABEL_49:

    goto LABEL_50;
  }

  if (IMOSLoggingEnabled(v10, v11))
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "**Not sending nick name update as device is not registered",  buf,  2u);
    }
  }

  BOOL v17 = 0;
LABEL_50:

  return v17;
}

- (void)forwardDeliveryReceiptForMessageID:(id)a3 withAccount:(id)a4 callerURI:(id)a5
{
  id v8 = a3;
  id v35 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v8;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Forwarding delivery receipt to all other devices  (messageID %@)",  buf,  0xCu);
    }
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v13, "addObject:", v9);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 chatForMessageGUID:v8]);

  if (v15)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession _messageDictionaryToReflectWithDeliveryReceipt:]( self,  "_messageDictionaryToReflectWithDeliveryReceipt:",  v15));
    uint64_t v20 = IMOSLoggingEnabled(v18, v19);
    if ((_DWORD)v20)
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v18;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Reflecting delivery receipt with chat properties: %@", buf, 0xCu);
      }
    }
  }

  else
  {
    uint64_t v20 = IMOSLoggingEnabled(v16, v17);
    if ((_DWORD)v20)
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v8;
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "IMDChat not found for forwarding a delivery receipt with messageID: %@",  buf,  0xCu);
      }
    }

    uint64_t v18 = &__NSDictionary0__struct;
  }

  if (IMOSLoggingEnabled(v20, v21))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v18;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Forwarding delivery receipt with messageDictionary: %@", buf, 0xCu);
    }
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 107LL));
  uint64_t v29 = IDSGetUUIDData(v8);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v28,  IDSSendMessageOptionCommandKey,  v30,  IDSSendMessageOptionUUIDKey,  v31,  IDSSendMessageOptionTimeoutKey,  0LL));

  BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
  [v33 sendMessageDictionary:v18 encryptDictionary:1 fromID:v9 fromAccount:v35 toURIs:v34 toGroup:0 priority:300 options:v32 willSendBlock:0 completionBlock:&stru_D5EB8];
}

- (void)_handleFileTransferUpdated:(id)a3
{
  id v4 = a3;
  uint64_t isKindOfClass = objc_claimAutoreleasedReturnValue([v4 object]);
  uint64_t v7 = (void *)isKindOfClass;
  if (isKindOfClass)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___IMFileTransfer);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v7, v8);
    if ((isKindOfClass & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession pendingGroupPhotoDownloads](self, "pendingGroupPhotoDownloads"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

      if (v11)
      {
        if (IMOSLoggingEnabled(v12, v13))
        {
          uint64_t v14 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            int v49 = 138412546;
            id v50 = v7;
            __int16 v51 = 2112;
            id v52 = v11;
            _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Processing pending group photo download %@ %@",  (uint8_t *)&v49,  0x16u);
          }
        }

        id v16 = [v7 transferState];
        if ((uint64_t)v16 < 6)
        {
          id v23 = [v7 transferState];
          BOOL v24 = (uint64_t)v23 > 3;
          int v26 = IMOSLoggingEnabled(v23, v25);
          if (v24)
          {
            if (v26)
            {
              uint64_t v27 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
              id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                LOWORD(v49) = 0;
                _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  " => transfer in finalizing/finished state. Sending through download completion and removing from map",  (uint8_t *)&v49,  2u);
              }
            }

            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v11 _stringForKey:@"chat"]);
            id v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 existingChatWithGUID:v29]);

            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v11 _stringForKey:@"sender"]);
            BOOL v33 = (void *)objc_claimAutoreleasedReturnValue([v11 _numberForKey:@"isHidden"]);
            id v34 = [v33 BOOLValue];

            id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession pendingGroupPhotoDownloads](self, "pendingGroupPhotoDownloads"));
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
            [v35 removeObjectForKey:v36];

            if (v31)
            {
              id v37 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
              -[MessageServiceSession groupPhotoDownloadCompletedForChat:fileTransferError:success:transferGuid:sender:isHidden:]( self,  "groupPhotoDownloadCompletedForChat:fileTransferError:success:transferGuid:sender:isHidden:",  v31,  0LL,  1LL,  v37,  v32,  v34);
            }
          }

          else if (v26)
          {
            uint64_t v38 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
            uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              LOWORD(v49) = 0;
              _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, " => transfer still in process", (uint8_t *)&v49, 2u);
            }
          }
        }

        else
        {
          if (IMOSLoggingEnabled(v16, v17))
          {
            uint64_t v18 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              LOWORD(v49) = 0;
              _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  " => transfer in error state. removing from map",  (uint8_t *)&v49,  2u);
            }
          }

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession pendingGroupPhotoDownloads](self, "pendingGroupPhotoDownloads"));
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
          [v20 removeObjectForKey:v21];
        }
      }

      unsigned int v40 = [v7 isFromMomentShare];
      else {
        unsigned int v41 = 0;
      }
      if (v41 == 1)
      {
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession messageStore](self, "messageStore"));
        __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v7 messageGUID]);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v42 messageWithGUID:v43]);

        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
        id v47 = (void *)objc_claimAutoreleasedReturnValue([v46 accountID]);
        id v48 = (void *)objc_claimAutoreleasedReturnValue([v44 parentChatID]);
        [v45 account:v47 chat:v48 style:0 chatProperties:0 messageUpdated:v44];
      }

- (void)doneRetrievingAttachmentsForGroupPhotoForChat:(id)a3 fileTransferError:(id)a4 success:(BOOL)a5 transferGuid:(id)a6 sender:(id)a7 isHidden:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  uint64_t v19 = IMOSLoggingEnabled(v17, v18);
  if ((_DWORD)v19)
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 guid]);
      BOOL v24 = @"NO";
      *(_DWORD *)uint64_t v54 = 138413058;
      *(void *)&v54[4] = v23;
      if (v11) {
        uint64_t v25 = @"YES";
      }
      else {
        uint64_t v25 = @"NO";
      }
      *(void *)&v54[14] = v25;
      *(_WORD *)&v54[12] = 2112;
      if (v8) {
        BOOL v24 = @"YES";
      }
      *(_WORD *)&v54[22] = 2112;
      id v55 = v15;
      __int16 v56 = 2112;
      __int16 v57 = v24;
      _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "Finished retrieving attachments for group photo update. chatGuid %@ success %@ error %@ isHidden %@",  v54,  0x2Au);
    }
  }

  uint64_t v26 = IMOSLoggingEnabled(v19, v20);
  if ((_DWORD)v26)
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v54 = 138412290;
      *(void *)&v54[4] = v14;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, " => chat: %@", v54, 0xCu);
    }
  }

  if (v11)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 transferForGUID:v16]);

    id v32 = [v31 transferState];
    if ((uint64_t)v32 < 6)
    {
      id v36 = [v31 transferState];
      BOOL v37 = (uint64_t)v36 > 3;
      int v39 = IMOSLoggingEnabled(v36, v38);
      if (v37)
      {
        if (v39)
        {
          uint64_t v40 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
          unsigned int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v54 = 138412290;
            *(void *)&v54[4] = v31;
            _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Transfer for group photo finalizing/finished %@", v54, 0xCu);
          }
        }

        -[MessageServiceSession groupPhotoDownloadCompletedForChat:fileTransferError:success:transferGuid:sender:isHidden:]( self,  "groupPhotoDownloadCompletedForChat:fileTransferError:success:transferGuid:sender:isHidden:",  v14,  v15,  1LL,  v16,  v17,  v8,  *(_OWORD *)v54,  *(void *)&v54[16]);
      }

      else
      {
        if (v39)
        {
          uint64_t v42 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
          __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v54 = 138412290;
            *(void *)&v54[4] = v31;
            _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "Transfer for group photo not yet finalizing %@", v54, 0xCu);
          }
        }

        uint64_t v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v14 guid]);
        if (v45) {
          CFDictionarySetValue((CFMutableDictionaryRef)v44, @"chat", v45);
        }

        if (v17) {
          CFDictionarySetValue((CFMutableDictionaryRef)v44, @"sender", v17);
        }
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v8,  *(void *)v54,  *(_OWORD *)&v54[8]));
        if (v46) {
          CFDictionarySetValue((CFMutableDictionaryRef)v44, @"isHidden", v46);
        }

        if (IMOSLoggingEnabled(v47, v48))
        {
          uint64_t v49 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
          id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v54 = 138412546;
            *(void *)&v54[4] = v31;
            *(_WORD *)&v54[12] = 2112;
            *(void *)&v54[14] = v44;
            _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "Adding pending group photo download %@ %@", v54, 0x16u);
          }
        }

        __int16 v51 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession pendingGroupPhotoDownloads](self, "pendingGroupPhotoDownloads"));
        [v51 setObject:v44 forKey:v16];
      }
    }

    else if (IMOSLoggingEnabled(v32, v33))
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v54 = 138412290;
        *(void *)&v54[4] = v31;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Transfer for group photo in error state %@", v54, 0xCu);
      }
    }
  }

  else if (IMOSLoggingEnabled(v26, v27))
  {
    uint64_t v52 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v54 = 0;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, " => failed retrieving attachments for group photo change", v54, 2u);
    }
  }
}

- (void)_updateOrRemoveGroupPhotoForChat:(id)a3 sender:(id)a4 completedTransfer:(id)a5 isHidden:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v53 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled(v11, v12))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
      id v16 = @"NO";
      if (!v15) {
        id v16 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      id v55 = v16;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "Generating chatItem for group photo change. Was group photo removal: %@",  buf,  0xCu);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
  uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession generateAndStoreGroupPhotoChangeStatusItemForChat:sender:fileTransferGuid:isHidden:]( self,  "generateAndStoreGroupPhotoChangeStatusItemForChat:sender:fileTransferGuid:isHidden:",  v10,  v53,  v17,  v6));

  if (v18)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString guid](v18, "guid"));
    [v21 storeAttachment:v11 associateWithMessageWithGUID:v22];

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString guid](v18, "guid"));
    [v23 updateGroupPhoto:v24 forChat:v10 messageGuid:v25];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString sender](v18, "sender"));
    if (v26) {
      char v27 = v6;
    }
    else {
      char v27 = 1;
    }

    if ((v27 & 1) != 0)
    {
      uint64_t v52 = 0LL;
    }

    else
    {
      id v58 = @"sender";
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString sender](v18, "sender"));
      __int128 v59 = v32;
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
    }

    if (IMOSLoggingEnabled(v28, v29))
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 chatIdentifier]);
        *(_DWORD *)buf = 138412546;
        id v55 = v35;
        __int16 v56 = 2112;
        __int16 v57 = v52;
        _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "Broadcasting groupPhotoUpdatedForChatIdentifier: %@ userInfo: %@",  buf,  0x16u);
      }
    }

    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
    BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v10 chatIdentifier]);
    id v38 = [v10 style];
    int v39 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 accountID]);
    [v36 groupPhotoUpdatedForChatIdentifier:v37 style:v38 account:v40 userInfo:v52];

    if (IMOSLoggingEnabled(v41, v42))
    {
      uint64_t v43 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v18;
        _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "Broadcasting messageReceived %@", buf, 0xCu);
      }
    }

    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 accountID]);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v10 chatIdentifier]);
    id v49 = [v10 style];
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v10 groupID]);
    __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v10 personCentricID]);
    [v45 account:v47 chat:v48 style:v49 chatProperties:0 groupID:v50 chatPersonCentricID:v51 messageReceived:v18];
  }

  else if (IMOSLoggingEnabled(v19, v20))
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Did not generate a message item, bailing early", buf, 2u);
    }
  }
}

- (void)groupPhotoDownloadCompletedForChat:(id)a3 fileTransferError:(id)a4 success:(BOOL)a5 transferGuid:(id)a6 sender:(id)a7 isHidden:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v45 = a3;
  id v44 = a4;
  id v13 = a6;
  id v14 = a7;
  uint64_t v16 = IMOSLoggingEnabled(v14, v15);
  if ((_DWORD)v16)
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v45 guid]);
      uint64_t v21 = @"NO";
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v20;
      if (v11) {
        uint64_t v22 = @"YES";
      }
      else {
        uint64_t v22 = @"NO";
      }
      *(void *)&buf[14] = v22;
      *(_WORD *)&_BYTE buf[12] = 2112;
      if (v8) {
        uint64_t v21 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      *(void *)&_BYTE buf[24] = v44;
      LOWORD(v55[0]) = 2112;
      *(void *)((char *)v55 + 2) = v21;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "Group photo download completed. chatGuid %@ success %@ error %@ isHidden %@",  buf,  0x2Au);
    }
  }

  uint64_t v23 = IMOSLoggingEnabled(v16, v17);
  if ((_DWORD)v23)
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v45;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }

  if (v11)
  {
    if (v13)
    {
      char v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 transferForGUID:v13]);

      uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 localURL]);
      uint64_t v31 = (void *)v29;
      if (!v29) {
        goto LABEL_32;
      }
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v28 localURL]);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 path]);
      unsigned int v35 = [v32 fileExistsAtPath:v34];

      if (v35)
      {
        v55[0] = 0LL;
        memset(buf, 0, sizeof(buf));
        IMPreviewConstraintsZero(buf);
        *(_OWORD *)buf = xmmword_9E080;
        *(_OWORD *)&uint8_t buf[16] = xmmword_9E090;
        LOWORD(v55[0]) = 0;
        BYTE2(v55[0]) = 0;
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v28 localURL]);
        BOOL v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMTranscodeController sharedInstance](&OBJC_CLASS___IMTranscodeController, "sharedInstance"));
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_25FAC;
        v48[3] = &unk_D5EE0;
        v48[4] = self;
        id v49 = v45;
        id v50 = v14;
        BOOL v53 = v8;
        id v51 = v28;
        id v52 = v36;
        v46[0] = *(_OWORD *)buf;
        v46[1] = *(_OWORD *)&buf[16];
        uint64_t v47 = v55[0];
        id v38 = v36;
        [v37 replaceTransferWithSafeTransfer:v38 constraints:v46 completionBlock:v48];
      }

      else
      {
LABEL_32:
        if (IMOSLoggingEnabled(v29, v30))
        {
          uint64_t v39 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
          uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v28;
            _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_INFO,  " => completed transfer had nil or missing localURL: %@",  buf,  0xCu);
          }
        }
      }
    }

    else
    {
      -[MessageServiceSession _updateOrRemoveGroupPhotoForChat:sender:completedTransfer:isHidden:]( self,  "_updateOrRemoveGroupPhotoForChat:sender:completedTransfer:isHidden:",  v45,  v14,  0LL,  v8);
    }
  }

  else if (IMOSLoggingEnabled(v23, v24))
  {
    uint64_t v41 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, " => failed retrieving attachments for group photo change", buf, 2u);
    }
  }
}

- (BOOL)shouldDownloadGroupPhoto:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _stringForKey:@"file-size"]);

  BOOL v6 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v6, "numberFromString:", v5));
  id v8 = [v7 unsignedIntegerValue];

  if ((unint64_t)v8 >= 0x20C801 && IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 134217984;
      id v15 = v8;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "**Not** downloading group photo, too big. Size: %lu",  (uint8_t *)&v14,  0xCu);
    }
  }

  return (unint64_t)v8 < 0x20C801;
}

- (void)receivedGroupPhotoUpdate:(id)a3 chat:(id)a4 sender:(id)a5 isHidden:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v77 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[IMFileTransfer guidForFileTransferDictionary:]( &OBJC_CLASS___IMFileTransfer,  "guidForFileTransferDictionary:",  v9));
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 groupPhotoGuid]);
  uint64_t v14 = IMOSLoggingEnabled(v12, v13);
  if ((_DWORD)v14)
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Received group photo update.", buf, 2u);
    }
  }

  if (v12 | v11)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    __int16 v76 = (void *)objc_claimAutoreleasedReturnValue([v25 transferForGUID:v11]);

    if (!v76) {
      goto LABEL_29;
    }
    id v26 = [v76 existsAtLocalPath];
    if (!(_DWORD)v26) {
      goto LABEL_29;
    }
    if (IMOSLoggingEnabled(v26, v27))
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v76 localPath]);
        *(_DWORD *)buf = 138412290;
        uint64_t v86 = (uint64_t)v30;
        _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_INFO,  "The existingTransfer has group photo at local path: %@",  buf,  0xCu);
      }
    }

    uint64_t v31 = IMAreObjectsLogicallySame(v11, v12);
    if ((_DWORD)v31)
    {
      uint64_t v33 = IMOSLoggingEnabled(v31, v32);
      if ((_DWORD)v33)
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
        id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          BOOL v37 = (void *)objc_claimAutoreleasedReturnValue([v10 guid]);
          *(_DWORD *)buf = 138412802;
          uint64_t v86 = v11;
          __int16 v87 = 2112;
          uint64_t v88 = v12;
          __int16 v89 = 2112;
          uint64_t v90 = v37;
          _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "Received group photo with the same guid as we have -- dropping this message. Incoming guid: %@ existing guid : %@ chatGuid: %@",  buf,  0x20u);
        }
      }

      if (IMOSLoggingEnabled(v33, v34))
      {
        uint64_t v38 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v86 = (uint64_t)v10;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
        }
      }
    }

    else
    {
LABEL_29:
      id v40 = [v9 count];
      BOOL v41 = v40 == 0LL;
      int v43 = IMOSLoggingEnabled(v40, v42);
      if (v41)
      {
        if (v43)
        {
          uint64_t v53 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
          uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v54,  OS_LOG_TYPE_INFO,  "Received group photo update with empty file transfer dict -- deleting group photo",  buf,  2u);
          }
        }

        -[MessageServiceSession groupPhotoDownloadCompletedForChat:fileTransferError:success:transferGuid:sender:isHidden:]( self,  "groupPhotoDownloadCompletedForChat:fileTransferError:success:transferGuid:sender:isHidden:",  v10,  0LL,  1LL,  0LL,  v77,  0LL);
      }

      else
      {
        if (v43)
        {
          uint64_t v44 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
          id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v86 = (uint64_t)v77;
            _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_INFO,  "Received group photo update with non-empty fileTransferDict, from %@",  buf,  0xCu);
          }
        }

        uint64_t v46 = objc_alloc_init(&OBJC_CLASS___IMFileTransfer);
        -[IMFileTransfer _updateWithDictionaryRepresentationForWhitelistedKeys:]( v46,  "_updateWithDictionaryRepresentationForWhitelistedKeys:",  v9);
        int v74 = (void *)objc_claimAutoreleasedReturnValue(-[IMFileTransfer guid](v46, "guid"));
        if (-[MessageServiceSession shouldDownloadGroupPhoto:](self, "shouldDownloadGroupPhoto:", v46))
        {
          if ([v74 length])
          {
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance"));
            id v49 = (void *)objc_claimAutoreleasedReturnValue(-[IMFileTransfer guid](v46, "guid"));
            [v48 addTransfer:v46 forGUID:v49];

            uint64_t v50 = IMMessageGuidFromIMFileTransferGuid(v11);
            id v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
            id v52 = v51;
            if (v51) {
              id v72 = v51;
            }
            else {
              id v72 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
            }

            id v57 = objc_alloc(&OBJC_CLASS___IMMessageItem);
            id v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            uint64_t v84 = v74;
            __int128 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v84,  1LL));
            id v73 = [v57 initWithSender:v77 time:v58 body:0 attributes:0 fileTransferGUIDs:v59 flags:1 error:0 guid:v72 threadIdentifier:0];

            if ([v73 isFromMe])
            {
              __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v73 service]);
              __int16 v71 = (void *)objc_claimAutoreleasedReturnValue( +[IMSenderContext fromMeContextWithServiceName:]( &OBJC_CLASS___IMSenderContext,  "fromMeContextWithServiceName:",  v60));
            }

            else
            {
              __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
              __int128 v62 = (void *)objc_claimAutoreleasedReturnValue([v73 sender]);
              id v63 = [v61 hasKnownSenderChatWithChatIdentifier:v62];

              __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v73 service]);
              __int16 v71 = (void *)objc_claimAutoreleasedReturnValue( +[IMSenderContext contextWithKnownSender:serviceName:]( &OBJC_CLASS___IMSenderContext,  "contextWithKnownSender:serviceName:",  v63,  v60));
            }

            id v64 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
            id v65 = (void *)objc_claimAutoreleasedReturnValue([v77 _stripFZIDPrefix]);
            id v83 = v77;
            id v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v83,  1LL));
            uint64_t v67 = IMServiceNameForCanonicalIDSAddresses();
            id v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
            v78[0] = _NSConcreteStackBlock;
            v78[1] = 3221225472LL;
            v78[2] = sub_26BA0;
            v78[3] = &unk_D5F08;
            v78[4] = self;
            id v79 = v10;
            id v80 = v74;
            id v81 = v77;
            BOOL v82 = a6;
            [v64 retrieveAttachmentsForMessage:v73 inlineAttachments:0 displayID:v65 topic:v68 comingFromStorage:0 shouldForceAutoDownload:1  senderContext:v71 completionBlock:v78];

            __int16 v69 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
            id v70 = (void *)objc_claimAutoreleasedReturnValue([v73 guid]);
            [v69 storeAttachment:v46 associateWithMessageWithGUID:v70];
          }

          else if (IMOSLoggingEnabled(0LL, v47))
          {
            uint64_t v55 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
            __int16 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_0,  v56,  OS_LOG_TYPE_INFO,  " No group photo update file transfer transferGuid for some reason, doing nothing.",  buf,  2u);
            }
          }
        }

        else
        {
        }
      }
    }
  }

  else
  {
    uint64_t v18 = IMOSLoggingEnabled(v14, v15);
    if ((_DWORD)v18)
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v10 guid]);
        *(_DWORD *)buf = 138412290;
        uint64_t v86 = (uint64_t)v22;
        _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "Received no GUID, and we already don't have one -- dropping this message. ChatGuid: %@",  buf,  0xCu);
      }
    }

    if (IMOSLoggingEnabled(v18, v19))
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v86 = (uint64_t)v10;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
      }
    }
  }
}

- (id)fileTransferDictionaryForChat:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 groupPhotoGuid]);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 transferForGUID:v5]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _dictionaryToSend]);

  return v7;
}

- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationTime:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8
{
  BOOL v8 = a8;
  id v19 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  if ([v19 unsignedLongLongValue]) {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate __im_iMessageDateFromTimeStamp:]( &OBJC_CLASS___NSDate,  "__im_iMessageDateFromTimeStamp:",  v19));
  }
  else {
    uint64_t v17 = 0LL;
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
  [v18 requestGroupPhotoIfNecessary:v16 incomingParticipantVersion:a4 incomingGroupPhotoCreationDate:v17 toIdentifier:v15 fromIdentifier:v14 m essageIsFromStorage:v8 session:self];
}

- (id)_messageDictionaryForDeleteCommandShouldResetPreference:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
  uint64_t v5 = IMSettingsKeepMessagesDomain;
  uint64_t v6 = IMGetDomainValueForKey(IMSettingsKeepMessagesDomain, IMSettingsKeepMessagesVersionIDKey);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = IMGetDomainValueForKey(v5, IMSettingsKeepMessagesKey);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)v9;
  if (v7) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    [v4 setObject:v9 forKey:@"days"];
    [v4 setObject:v7 forKey:@"ID"];
  }

  if (v3) {
    [v4 setObject:&__kCFBooleanTrue forKey:@"resetPreference"];
  }
  id v14 = @"KeepMessages";
  id v15 = v4;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));

  return v12;
}

- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 existingChatWithGUID:v7]);

  unsigned int v10 = [v9 wasReportedAsJunk];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession ckUtilities](self, "ckUtilities"));
  unsigned int v12 = [v11 cloudKitSyncingEnabled];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:IMDDeleteCommandIsScheduledMessageKey]);
  if (v13) {
    int v16 = 1;
  }
  else {
    int v16 = v12 | v10;
  }
  if ((v16 & 1) != 0)
  {
    if (IMOSLoggingEnabled(v14, v15))
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)id v51 = v12;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&void v51[6] = v10;
        *(_WORD *)id v52 = 1024;
        *(_DWORD *)&v52[2] = v13 != 0LL;
        _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Forwarding delete command to all other devices: cloudKitSyncingEnabled: %d wasReportedJunk: %d isScheduledMessage: %d",  buf,  0x14u);
      }
    }

    goto LABEL_14;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevice]);

  int v23 = IMOSLoggingEnabled(v21, v22);
  if (v20)
  {
    if (v23)
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Send delete command only to the paired device", buf, 2u);
      }
    }

- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4
{
  id v44 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession ckUtilities](self, "ckUtilities"));
  unsigned int v8 = [v7 cloudKitSyncingEnabled];

  if ((v8 & 1) != 0)
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Recently Deleted | Forwarding Recover command to all other devices: cloudKitSyncingEnabled: YES",  buf,  2u);
    }

    goto LABEL_10;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pairedDevice]);

  int v17 = IMOSLoggingEnabled(v15, v16);
  if (v14)
  {
    if (!v17) {
      goto LABEL_11;
    }
    uint64_t v18 = OSLogHandleForIMFoundationCategory("MessageService");
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Send recover command only to the paired device", buf, 2u);
    }

- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9
{
  id v32 = a3;
  id v33 = a4;
  id v34 = a5;
  id v15 = a6;
  unsigned __int8 v43 = a8;
  id v16 = a9;
  id v42 = a7;
  id v17 = a7;
  -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v42, &v43);
  id v18 = v42;

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 existingChatWithGUID:v15]);

    if (!v20) {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession chatForChatIdentifier:style:]( self,  "chatForChatIdentifier:style:",  v18,  v43));
    }
    id v41 = 0LL;
    id v21 = _LastAddressedURIForChatLogMetricIfNeeded(v20, v34, self, &v41, 0);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v30 = v41;
    id v22 = -[MessageServiceSession _fixParticipantsForChat:](self, "_fixParticipantsForChat:", v20);
    if (IMOSLoggingEnabled(v22, v23))
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory("Group");
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413570;
        id v45 = v32;
        __int16 v46 = 2112;
        uint64_t v47 = v20;
        __int16 v48 = 2112;
        id v49 = v15;
        __int16 v50 = 2112;
        id v51 = v31;
        __int16 v52 = 2112;
        id v53 = v18;
        __int16 v54 = 1024;
        int v55 = v43;
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "Request to update name: %@   forChat: %@ lastAddressed: %@  (GUID: %@  Identifier: %@  Style: %c)",  buf,  0x3Au);
      }
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession groupController](self, "groupController"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_27FF0;
    v36[3] = &unk_D5F70;
    id v27 = v32;
    id v37 = v27;
    id v28 = v15;
    id v38 = v28;
    id v29 = v18;
    id v39 = v29;
    unsigned __int8 v40 = v43;
    [v26 setName:v27 fromName:v33 forChat:v20 fromID:v31 fromAccount:v30 messageID:v16 session:self completionBlock:v36];

    v35.receiver = self;
    v35.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
    -[MessageServiceSession updateDisplayName:fromDisplayName:fromID:forChatID:identifier:style:messageID:]( &v35,  "updateDisplayName:fromDisplayName:fromID:forChatID:identifier:style:messageID:",  v27,  v33,  v34,  v28,  v29,  v43,  v16);
  }
}

- (void)closeSessionForChat:(id)a3 chatGUID:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v27 = a4;
  if (IMOSLoggingEnabled(v27, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v9;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Request to close business session for chat identifier: %@",  buf,  0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v9, 45LL));
  id v30 = 0LL;
  id v14 = _LastAddressedURIForChatLogMetricIfNeeded(v13, 0LL, self, &v30, 0);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v28 = v30;
  v31[0] = @"sV";
  v31[1] = @"cID";
  v32[0] = &off_DB4B0;
  v32[1] = v9;
  v31[2] = @"dc";
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  v32[2] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  [v17 sendCloseSessionMessageDictionary:v16 toBusinessURI:v9 fromURI:v29 fromAccount:v28 completionBlock:&stru_D5F90];

  [v13 deleteBIAContext];
  if (!v6)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession _generateAndStoreGroupActionItemForChat:sender:]( self,  "_generateAndStoreGroupActionItemForChat:sender:",  v13,  v9));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountID]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v13 chatIdentifier]);
    id v21 = [v13 style];
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 chatProperties]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 groupID]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v13 personCentricID]);
    [v25 account:v19 chat:v20 style:v21 chatProperties:v22 groupID:v23 chatPersonCentricID:v24 messageReceived:v26];
  }
}

- (id)_generateAndStoreGroupActionItemForChat:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
  unsigned int v9 = [v8 isBIAEnabled];

  if (!v9)
  {
LABEL_8:
    uint64_t v23 = 0LL;
    goto LABEL_9;
  }

  if (!v6)
  {
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v29 = 0;
        _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "_generateAndStoreGroupActionItemForChat passed a nil chat. Early returning",  v29,  2u);
      }
    }

    goto LABEL_8;
  }

  id v12 = objc_alloc(&OBJC_CLASS___IMGroupActionItem);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  id v15 = [v12 initWithSender:v7 time:v13 guid:v14 type:3];

  [v15 setActionType:0];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession service](self, "service"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  [v15 setService:v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountID]);
  [v15 setAccountID:v19];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 loginID]);
  [v15 setAccount:v21];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession messageStore](self, "messageStore"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 storeItem:v15 forceReplace:0]);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatStore](self, "chatStore"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 guid]);
  [v24 addMessageWithGUID:v25 toChat:v6];

LABEL_9:
  return v23;
}

- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5
{
}

- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 toChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8
{
  id v88 = a3;
  id v14 = a4;
  id v87 = a5;
  id v86 = a6;
  id v15 = a7;
  unsigned __int8 v97 = a8;
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMEventCategory("MessageService");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v108 = v88;
      __int16 v109 = 2112;
      id v110 = v14;
      __int16 v111 = 2112;
      id v112 = v87;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Request to send command: %@   with properties: %@   to person: %@",  buf,  0x20u);
    }
  }

  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  if (v15)
  {
    id v96 = v15;
    -[MessageServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v96, &v97);
    id v89 = v96;

    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession chatForChatIdentifier:style:]( self,  "chatForChatIdentifier:style:",  v89,  v97));
    id v95 = 0LL;
    id v20 = _LastAddressedURIForChatLogMetricIfNeeded(v19, 0LL, self, &v95, 0);
    uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v21 = v95;

    if (v90 && v21)
    {
LABEL_12:
      id v85 = v21;
      BOOL v26 = -[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v21);
      if (v26)
      {
        id v28 = [v88 unsignedIntValue];
        if ((_DWORD)v28 == 60001)
        {
          if (IMOSLoggingEnabled(v28, v29))
          {
            uint64_t v37 = OSLogHandleForIMEventCategory("MessageService");
            id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_INFO,  "Sending a generic notification to update global read receipt value and updating local chats",  buf,  2u);
            }
          }

          id v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:"));
          -[MessageServiceSession overwritePerChatReadReceiptSettingsWithGlobalValue:]( self,  "overwritePerChatReadReceiptSettingsWithGlobalValue:",  [v39 BOOLValue]);

          unsigned __int8 v40 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v88 unsignedIntValue]));
          if (v41)
          {
            CFDictionarySetValue((CFMutableDictionaryRef)v40, @"c", v41);
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_8F458();
          }

          CFMutableDictionaryRef theDicta = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
          id v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 180LL));
          uint64_t v66 = IDSGetUUIDData(theDicta);
          uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
          id v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  IDSMaxMessageTimeout));
          BOOL v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v65,  IDSSendMessageOptionCommandKey,  v67,  IDSSendMessageOptionUUIDKey,  v68,  IDSSendMessageOptionTimeoutKey,  &__kCFBooleanTrue,  IDSSendMessageOptionWantsDeliveryStatusKey,  v40,  IDSSendMessageOptionDeliveryStatusContextKey,  0LL));

          v100[0] = @"gR";
          __int16 v69 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"GlobalReadReceiptChangedValue"]);
          v100[1] = @"gV";
          v101[0] = v69;
          id v70 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"GlobalReadReceiptVersionIDKey"]);
          v101[1] = v70;
          __int16 v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v101,  v100,  2LL));

          v98[0] = @"gC";
          id v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v88 unsignedIntValue]));
          v98[1] = @"pID";
          v99[0] = v72;
          v99[1] = v71;
          id v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v99,  v98,  2LL));

          if (IMOSLoggingEnabled(v74, v75))
          {
            uint64_t v76 = OSLogHandleForIMFoundationCategory("MessageService");
            id v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v108 = v73;
              _os_log_impl( &dword_0,  v77,  OS_LOG_TYPE_INFO,  "Sending generic notification to update global read receipt value with messageDictionary: %@",  buf,  0xCu);
            }
          }

          __int16 v78 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
          id v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v90));
          [v78 sendMessageDictionary:v73 encryptDictionary:1 fromID:v90 fromAccount:v85 toURIs:v79 toGroup:0 priority:300 options:v82 willSendBlock:0 completionBlock:&stru_D5FD0];

          goto LABEL_66;
        }

        if ((_DWORD)v28 == 60000)
        {
          if (IMOSLoggingEnabled(v28, v29))
          {
            uint64_t v30 = OSLogHandleForIMEventCategory("MessageService");
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_INFO,  "Sending a generic notification to update chat properties",  buf,  2u);
            }
          }

          theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v88 unsignedIntValue]));
          if (v32)
          {
            CFDictionarySetValue((CFMutableDictionaryRef)theDict, @"c", v32);
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_8F458();
          }

          id v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
          unsigned __int8 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 180LL));
          uint64_t v44 = IDSGetUUIDData(v81);
          id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          __int16 v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  IDSMaxMessageTimeout));
          id v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v43,  IDSSendMessageOptionCommandKey,  v45,  IDSSendMessageOptionUUIDKey,  v46,  IDSSendMessageOptionTimeoutKey,  &__kCFBooleanTrue,  IDSSendMessageOptionWantsDeliveryStatusKey,  theDict,  IDSSendMessageOptionDeliveryStatusContextKey,  0LL));

          v105[0] = IMChatPropertyReadReceiptsSettingVersionKey;
          v105[1] = IMChatPropertyEnableReadReceiptForChatKey;
          v106[0] = @"vR";
          v106[1] = @"eR";
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v106,  v105,  2LL));
          __int16 v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          __int128 v93 = 0u;
          __int128 v94 = 0u;
          __int128 v91 = 0u;
          __int128 v92 = 0u;
          id v49 = (void *)objc_claimAutoreleasedReturnValue([v47 allKeys]);
          id v50 = [v49 countByEnumeratingWithState:&v91 objects:v104 count:16];
          if (v50)
          {
            uint64_t v51 = *(void *)v92;
            do
            {
              for (i = 0LL; i != v50; i = (char *)i + 1)
              {
                if (*(void *)v92 != v51) {
                  objc_enumerationMutation(v49);
                }
                uint64_t v53 = *(void *)(*((void *)&v91 + 1) + 8LL * (void)i);
                __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKey:v53]);
                int v55 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v53]);
                if (v55) {
                  BOOL v56 = v54 == 0LL;
                }
                else {
                  BOOL v56 = 1;
                }
                if (!v56) {
                  [v48 setObject:v55 forKey:v54];
                }
              }

              id v50 = [v49 countByEnumeratingWithState:&v91 objects:v104 count:16];
            }

            while (v50);
          }

          v102[0] = @"gC";
          id v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v88 unsignedIntValue]));
          v103[0] = v57;
          v103[1] = v48;
          v102[1] = @"pID";
          v102[2] = @"cID";
          v103[2] = v86;
          id v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v103,  v102,  3LL));

          if (IMOSLoggingEnabled(v59, v60))
          {
            uint64_t v61 = OSLogHandleForIMFoundationCategory("MessageService");
            __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v108 = v58;
              _os_log_impl( &dword_0,  v62,  OS_LOG_TYPE_INFO,  "Sending generic notification to update chat properties with messageDictionary: %@",  buf,  0xCu);
            }
          }

          id v63 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
          id v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v90));
          [v63 sendMessageDictionary:v58 encryptDictionary:1 fromID:v90 fromAccount:v85 toURIs:v64 toGroup:0 priority:300 options:v80 willSendBlock:0 completionBlock:&stru_D5FB0];

          goto LABEL_66;
        }

        if (IMOSLoggingEnabled(v28, v29))
        {
          uint64_t v42 = OSLogHandleForIMFoundationCategory("MessageService");
          id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v108 = v88;
            _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "Not sending message type: %@   => not supported", buf, 0xCu);
          }

- (id)getMessagePushHandlers
{
  return self->_messagePushHandlers;
}

- (void)setMessagePushHandlers:(id)a3
{
}

- (void)_updateNetworkOverride
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"md-network-override"]);
  unsigned int v5 = [v4 intValue];

  if (v5)
  {
    if (self->_networkOverride) {
      return;
    }
    if (IMOSLoggingEnabled(v6, v7))
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory("MessageService");
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Enabling network override", buf, 2u);
      }
    }

    self->_networkOverride = 1;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession accounts](self, "accounts"));
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          -[MessageServiceSession logoutServiceSessionWithAccount:]( self,  "logoutServiceSessionWithAccount:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)i));
        }

        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }

      while (v11);
    }
  }

  else
  {
    if (!self->_networkOverride) {
      return;
    }
    if (IMOSLoggingEnabled(v6, v7))
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory("MessageService");
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Disabling network override", buf, 2u);
      }
    }

    self->_networkOverride = 0;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession accounts](self, "accounts", 0LL));
    id v16 = [v10 countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v20;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v10);
          }
          -[MessageServiceSession loginServiceSessionWithAccount:]( self,  "loginServiceSessionWithAccount:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)j));
        }

        id v16 = [v10 countByEnumeratingWithState:&v19 objects:v28 count:16];
      }

      while (v16);
    }
  }
}

- (void)_iMessageBagLoaded:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Bag finished loading", v8, 2u);
    }
  }

  -[MessageServiceSession _updateNetworkOverride](self, "_updateNetworkOverride");
}

- (BOOL)networkConditionsAllowLogin
{
  if (IMSMSFallbackEnabled(self, a2))
  {
    if (self->_networkOverride)
    {
      int v3 = IMOSLoggingEnabled();
      if (v3)
      {
        uint64_t v4 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Network override is in place, forcing network down", buf, 2u);
        }

        LOBYTE(v3) = 0;
      }
    }

    else
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
      LOBYTE(v3) = -[MessageServiceSession networkConditionsAllowLogin](&v7, "networkConditionsAllowLogin");
    }
  }

  else
  {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (BOOL)overrideNetworkAvailability
{
  return IMSMSFallbackEnabled(self, a2) ^ 1;
}

- (void)requestProperty:(id)a3 ofPerson:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Requesting property: %@   for person: %@", (uint8_t *)&v20, 0x16u);
    }
  }

  -[MessageServiceSession _logLocalInfo](self, "_logLocalInfo");
  if ([v6 length])
  {
    id v12 = [v7 length];
    BOOL v13 = v12 == 0LL;
    int v15 = IMOSLoggingEnabled(v12, v14);
    if (v13)
    {
      if (v15)
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, " => Empty person ID", (uint8_t *)&v20, 2u);
        }

        goto LABEL_18;
      }
    }

    else if (v15)
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        id v21 = v6;
        __int16 v22 = 2112;
        id v23 = v7;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "** Unknown property type query: %@ for person ID: %@",  (uint8_t *)&v20,  0x16u);
      }

- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7
{
  uint64_t v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  id v16 = (id)-[MessageServiceSession didReceiveMessages:forChat:style:account:fromIDSID:]( &v22,  "didReceiveMessages:forChat:style:account:fromIDSID:",  v12,  v13,  v9,  v14,  v15);
  BOOL v18 = (char)v16;
  if ((_DWORD)v9 == 45)
  {
    if (IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageService");
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v13;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Clearing downgrade markers for chat due to incoming message: %@",  buf,  0xCu);
      }
    }

    -[MessageServiceSession _clearDowngradeMarkersForChat:](self, "_clearDowngradeMarkersForChat:", v13);
  }

  return v18;
}

- (void)_resetFailureRetries
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      failureMap = self->_failureMap;
      int v7 = 138412290;
      uint64_t v8 = failureMap;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Resetting failure map: %@", (uint8_t *)&v7, 0xCu);
    }
  }

  id v6 = self->_failureMap;
  self->_failureMap = 0LL;
}

- (unint64_t)_failuresForID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  if (v5)
  {
    if (IMOSLoggingEnabled(v5, v6))
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_failureMap, "objectForKey:", v4));
        int v13 = 138412546;
        id v14 = v4;
        __int16 v15 = 2048;
        id v16 = [v9 unsignedIntegerValue];
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Failures For ID %@ are %lu", (uint8_t *)&v13, 0x16u);
      }
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_failureMap, "objectForKey:", v4));
    id v11 = [v10 unsignedIntegerValue];
  }

  else
  {
    id v11 = 0LL;
  }

  return (unint64_t)v11;
}

- (void)_incrementDecryptionFailureForID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    failureMap = self->_failureMap;
    if (!failureMap)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      uint64_t v7 = self->_failureMap;
      self->_failureMap = Mutable;

      failureMap = self->_failureMap;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](failureMap, "objectForKey:", v4));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (int)([v8 intValue] + 1)));

    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("MessageService");
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412546;
        id v15 = v4;
        __int16 v16 = 1024;
        unsigned int v17 = [v9 intValue];
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Incrementing failure for ID: %@ to %d", (uint8_t *)&v14, 0x12u);
      }
    }

    -[NSMutableDictionary setObject:forKey:](self->_failureMap, "setObject:forKey:", v9, v4);
    -[MessageServiceSession _setWeeklyFailureResetTimer](self, "_setWeeklyFailureResetTimer");
  }
}

- (unint64_t)_maxFailuresAllowed
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"md-decryption-failure-retries-per-week"]);

  if (v3)
  {
    id v6 = [v3 intValue];
    LODWORD(v7) = (_DWORD)v6;
    uint64_t v9 = IMOSLoggingEnabled(v6, v8);
    if ((_DWORD)v9)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v21 = 67109120;
        int v22 = v7;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Server Bag provided us with: %d retries", (uint8_t *)&v21, 8u);
      }
    }

    int v13 = IMOSLoggingEnabled(v9, v10);
    if ((v7 & 0x80000000) != 0LL)
    {
      if (v13)
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v21 = 67109120;
          int v22 = v7;
          _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "Server Bag provided negative value: %d, returning 0",  (uint8_t *)&v21,  8u);
        }
      }

      unint64_t v7 = 0LL;
    }

    else
    {
      if (v13)
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory("MessageService");
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v21 = 67109120;
          int v22 = v7;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, " => returning retries: %d", (uint8_t *)&v21, 8u);
        }
      }

      unint64_t v7 = v7;
    }
  }

  else
  {
    if (IMOSLoggingEnabled(v4, v5))
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory("MessageService");
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v21 = 67109120;
        int v22 = 10;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "Server Bag has no value for retries, using the default: %d retries",  (uint8_t *)&v21,  8u);
      }
    }

    unint64_t v7 = 10LL;
  }

  return v7;
}

- (void)_setWeeklyFailureResetTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_2A624;
  block[3] = &unk_D5CD8;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)addItemToRecentsIfApplicable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 balloonBundleID]);
  unsigned int v5 = [v4 isEqualToString:IMBalloonPluginIdentifierHandwriting];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadData]);
    uint64_t v7 = IMSharedHelperMD5OfData();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMRecentItemsList sharedInstance](&OBJC_CLASS___IMRecentItemsList, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 balloonBundleID]);
    [v9 addRecentItemWithData:v6 GUID:v8 infoDictionary:0 forDomain:v10];
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 fileTransferGUIDs]);
    id v12 = [v11 count];

    if (v12)
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v3 fileTransferGUIDs]);
      id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v26;
        while (2)
        {
          uint64_t v16 = 0LL;
          do
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v16);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance"));
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 transferForGUID:v17]);
            LOBYTE(v17) = [v19 isSticker];

            if ((v17 & 1) != 0)
            {

              if (IMOSLoggingEnabled(v20, v21))
              {
                uint64_t v22 = OSLogHandleForIMFoundationCategory("MessageService");
                id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)id v24 = 0;
                  _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_INFO,  "Posting IMRecentItemsListUpdatedNotification for sticker",  v24,  2u);
                }
              }

              notify_post((const char *)[kIMRecentItemsListUpdatedNotification UTF8String]);
              goto LABEL_18;
            }

            uint64_t v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
  }

- (BOOL)_transferIsValidForServiceSession:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountID]);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession accounts](self, "accounts", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 accountID]);
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 accountID]);
      unsigned __int8 v14 = [v12 isEqualToString:v13];

      if ((v14 & 1) != 0) {
        goto LABEL_12;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!v5)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession service](self, "service"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v16 activeAccountsForService:v17]);

    if ([v6 count] != (char *)&dword_0 + 1)
    {
      if ((unint64_t)[v6 count] < 2)
      {
        char v15 = 0;
      }

      else
      {
        uint64_t v19 = (MessageServiceSession *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);
        char v15 = v19 == self;
      }

      goto LABEL_13;
    }

- (BOOL)canMakeExpireStateChecks
{
  return 1;
}

- (id)callerURI
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("Warning");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_INFO,  "CallerID callerURI is DEPRECATED: Use callerURIForMessageServiceType: instead.",  v6,  2u);
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( -[MessageServiceSession callerURIForMessageServiceType:]( self,  "callerURIForMessageServiceType:",  0LL));
}

- (id)callerURIUsingCalleeURI:(id)a3
{
  return -[MessageServiceSession callerURIForMessageServiceType:]( self,  "callerURIForMessageServiceType:",  -[MessageServiceSession messageServiceTypeForURI:](self, "messageServiceTypeForURI:", a3));
}

- (id)callerURIForMessageServiceType:(unsigned int)a3
{
  uint64_t v4 = IMPreferredAccountMap(self, a2);
  id v63 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v63 objectForKey:IMServiceNameiMessage]);
  id v65 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"guid"]);

  id v6 = [(id)objc_opt_class(self) idsAccounts];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v64 = v7;
  if (v65)
  {
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v75 objects:v87 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v76;
LABEL_4:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v76 != v11) {
          objc_enumerationMutation(v9);
        }
        int v13 = *(void **)(*((void *)&v75 + 1) + 8 * v12);
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uniqueID]);
        unsigned int v15 = [v14 isEqualToString:v65];

        if (v15) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v9 countByEnumeratingWithState:&v75 objects:v87 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      if (IMOSLoggingEnabled(v16, v17))
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory("CallerID");
        __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v80 = v13;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, " Found preferred account for caller id: %@", buf, 0xCu);
        }
      }

      id v22 = v13;

      if (a3 == 1 && v22)
      {
        id v23 = v22;
        id v22 = (id)objc_claimAutoreleasedReturnValue( -[MessageServiceSession bizIDSAccountFromMadridIDSAccount:]( self,  "bizIDSAccountFromMadridIDSAccount:",  v23));
      }

      if (v22) {
        goto LABEL_52;
      }
    }

    else
    {
LABEL_10:
    }
  }

  else
  {
    uint64_t v18 = IMOSLoggingEnabled(v7, v8);
    if ((_DWORD)v18)
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory("CallerID");
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v80 = v63;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "No account id found in prefs: %@", buf, 0xCu);
      }
    }
  }

  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("CallerID");
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession accounts](self, "accounts"));
      *(_DWORD *)buf = 138412546;
      id v80 = v65;
      __int16 v81 = 2112;
      id v82 = v28;
      _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "No ids account found with that account id: %@, accounts: %@",  buf,  0x16u);
    }
  }

  uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  id v30 = v64;
  id v31 = [v30 countByEnumeratingWithState:&v71 objects:v86 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v72;
    do
    {
      for (i = 0LL; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v72 != v32) {
          objc_enumerationMutation(v30);
        }
        id v34 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
        if (![v34 accountType])
        {
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession callerURIForIDSAccount:](self, "callerURIForIDSAccount:", v34));
          BOOL v36 = v35 == 0LL;

          if (!v36)
          {
            if (IMOSLoggingEnabled(v37, v38))
            {
              uint64_t v39 = OSLogHandleForIMFoundationCategory("CallerID");
              unsigned __int8 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Found phone number account", buf, 2u);
              }
            }

            -[NSMutableArray addObject:](v29, "addObject:", v34);
          }
        }
      }

      id v31 = [v30 countByEnumeratingWithState:&v71 objects:v86 count:16];
    }

    while (v31);
  }

  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_2B55C;
  v70[3] = &unk_D5FF8;
  v70[4] = self;
  -[NSMutableArray sortUsingComparator:](v29, "sortUsingComparator:", v70);
  id v22 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v29, "firstObject"));
  if (v22)
  {
  }

  else
  {
    if (IMOSLoggingEnabled(0LL, v41))
    {
      uint64_t v42 = OSLogHandleForIMFoundationCategory("CallerID");
      unsigned __int8 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v43,  OS_LOG_TYPE_INFO,  "No phone number account found, falling back to whatever we have",  buf,  2u);
      }
    }

    if (a3) {
      uint64_t v44 = objc_claimAutoreleasedReturnValue(-[MessageServiceSession fallBackBizIDSAccount](self, "fallBackBizIDSAccount"));
    }
    else {
      uint64_t v44 = objc_claimAutoreleasedReturnValue([v30 anyObject]);
    }
    id v22 = (id)v44;

    if (!v22)
    {
      if (IMOSLoggingEnabled(v45, v46))
      {
        uint64_t v60 = OSLogHandleForIMFoundationCategory("CallerID");
        uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v61, OS_LOG_TYPE_INFO, "- no caller id at all", buf, 2u);
        }
      }

      uint64_t v47 = 0LL;
      goto LABEL_69;
    }
  }

- (unsigned)messageServiceTypeForURI:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    unsigned int IsBusinessID = IMStringIsBusinessID(v3);
  }

  else
  {
    if (IMOSLoggingEnabled(0LL, v4))
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory("Warning");
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "CallerID -messageServiceTypeForURI: - Did not find serviceType. Using MessageServiceTypeiMessage.",  v9,  2u);
      }
    }

    unsigned int IsBusinessID = 0;
  }

  return IsBusinessID;
}

- (void)replayMessage:(id)a3
{
  id v52 = a3;
  uint64_t v4 = IMOSLoggingEnabled(v52, v3);
  if ((_DWORD)v4)
  {
    uint64_t v6 = OSLogHandleForIMEventCategory("MessageServiceSession");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v52;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Replaying message %@", buf, 0xCu);
    }
  }

  if (!v52 && IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = 0LL;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "MessageServiceSession replay message was nil %@", buf, 0xCu);
    }
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___IDSTransactionLogMessage);
  if ((objc_opt_isKindOfClass(v52, v10) & 1) != 0)
  {
    id v50 = v52;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v50 loginID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v50 accountUniqueID]);
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    uint64_t v49 = 96LL;
    int v13 = self->_messagePushHandlers;
    id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v57,  v66,  16LL);
    if (v14)
    {
      uint64_t v15 = *(void *)v58;
LABEL_13:
      uint64_t v16 = 0LL;
      while (1)
      {
        if (*(void *)v58 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void **)(*((void *)&v57 + 1) + 8 * v16);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "account", v49));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uniqueID]);
        unsigned int v20 = [v19 isEqualToIgnoringCase:v12];

        if (v20) {
          break;
        }
        if (v14 == (id)++v16)
        {
          id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v57,  v66,  16LL);
          if (v14) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }

      if (IMOSLoggingEnabled(v21, v22))
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v17 account]);
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 loginID]);
          *(_DWORD *)buf = 138412546;
          id v63 = v28;
          __int16 v64 = 2112;
          id v65 = v11;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Got push handler account %@ %@", buf, 0x16u);
        }
      }

      id v29 = v17;

      if (v29) {
        goto LABEL_47;
      }
    }

    else
    {
LABEL_19:
    }

    if (IMOSLoggingEnabled(v23, v24))
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory("Warning");
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_INFO,  "MessageReplay: Could not find account using unique ID. Falling back to login ID",  buf,  2u);
      }
    }

    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v32 = *(id *)&self->IMDAppleServiceSession_opaque[v49];
    id v33 = [v32 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v54;
LABEL_31:
      uint64_t v35 = 0LL;
      while (1)
      {
        if (*(void *)v54 != v34) {
          objc_enumerationMutation(v32);
        }
        BOOL v36 = *(void **)(*((void *)&v53 + 1) + 8 * v35);
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "account", v49));
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 loginID]);
        unsigned int v39 = [v38 isEqualToIgnoringCase:v11];

        if (v39) {
          break;
        }
        if (v33 == (id)++v35)
        {
          id v33 = [v32 countByEnumeratingWithState:&v53 objects:v61 count:16];
          if (v33) {
            goto LABEL_31;
          }
          goto LABEL_37;
        }
      }

      if (IMOSLoggingEnabled(v40, v41))
      {
        uint64_t v42 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
        unsigned __int8 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v36 account]);
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 loginID]);
          *(_DWORD *)buf = 138412546;
          id v63 = v45;
          __int16 v64 = 2112;
          id v65 = v11;
          _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "Got push handler account %@ %@", buf, 0x16u);
        }
      }

      id v29 = v36;

      if (v29) {
        goto LABEL_47;
      }
    }

    else
    {
LABEL_37:
    }

    id v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->IMDAppleServiceSession_opaque[v49], "firstObject", v49));
    if (IMOSLoggingEnabled(v29, v46))
    {
      uint64_t v47 = OSLogHandleForIMFoundationCategory("Warning");
      id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v29;
        _os_log_impl( &dword_0,  v48,  OS_LOG_TYPE_INFO,  "MessageReplay: Could not fine account using loginID. Picking a random push handler %@",  buf,  0xCu);
      }
    }

- (void)enqueReplayMessageCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_2BD04;
    v6[3] = &unk_D6020;
    id v7 = v4;
    -[MessageServiceSession _enqueueBlock:withTimeout:description:]( self,  "_enqueueBlock:withTimeout:description:",  v6,  @"Callback block for message replay batch",  10.0);
  }
}

- (void)handler:(id)a3 payloadDataRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMEventCategory("PayloadDataAttachments");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Got payload Data request %@", (uint8_t *)&v12, 0xCu);
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
  [v11 handlePayloadDataRequest:v7 attempts:0];
}

- (void)handler:(id)a3 payloadDataResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMEventCategory("PayloadDataAttachments");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"guid"]);
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Got payload Data response for message %@", (uint8_t *)&v13, 0xCu);
    }
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
  [v12 handlePayloadDataResponse:v7];
}

- (void)sendLogDumpMessageAtFilePath:(id)a3 toRecipient:(id)a4 shouldDeleteFile:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v37 = v10;
      __int16 v38 = 2112;
      if (v7) {
        uint64_t v16 = @"YES";
      }
      id v39 = v11;
      __int16 v40 = 2112;
      uint64_t v41 = v16;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "sendLogDumpMessageAtFilePath: %@ to recipient %@ shouldDeleteFile %@",  buf,  0x20u);
    }
  }

  id v35 = 0LL;
  id v17 = _LastAddressedURIForChatLogMetricIfNeeded(0LL, 0LL, self, &v35, 0);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = v35;
  unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v18 _stripFZIDPrefix]);

  if (v19 && v20)
  {
    id v23 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
    [v23 sendLogDumpMessageAtFilePath:v10 fromAccount:v19 fromID:v20 toRecipient:v11 shouldDeleteFile:v7 withCompletion:v12];
LABEL_10:

    goto LABEL_22;
  }

  if (IMOSLoggingEnabled(v21, v22))
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "sendLogDumpMessageAtFilePath: Could not find an ids account or fromID, returning early",  buf,  2u);
    }
  }

  if (v7)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v27 = [v26 fileExistsAtPath:v10];

    if (v27)
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v34 = 0LL;
      unsigned __int8 v29 = [v28 removeItemAtPath:v10 error:&v34];
      id v23 = v34;

      if ((v29 & 1) == 0 && IMOSLoggingEnabled(v30, v31))
      {
        uint64_t v32 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v37 = v10;
          __int16 v38 = 2112;
          id v39 = v23;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Deleting file at path %@ failed with error %@", buf, 0x16u);
        }
      }

      goto LABEL_10;
    }
  }

- (void)preWarm
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[IMTransferServicesController sharedInstance]( &OBJC_CLASS___IMTransferServicesController,  "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession GUID](self, "GUID"));
  [v4 preWarmMMCSForOwnerID:v3];
}

- (void)processNetworkDataAvailabilityChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "networkDataAvailable, %@", (uint8_t *)&v8, 0xCu);
    }
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  [v7 setNetworkDataAvailable:v3];
}

- (void)renewTTLForScheduledAttachmentTransfer:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 guid]);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v8;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "Scheduled Message | Renewing TTL for scheduled message attachment %@",  buf,  0xCu);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v10 = objc_alloc_init(&OBJC_CLASS___FTiMessageRequestMMCSFileRefreshToken);
  AttachmentRefreshUtilConfigureStickerToken(v10, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession attachmentRefreshDeliveryController]( self,  "attachmentRefreshDeliveryController"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  _DWORD v13[2] = sub_2C598;
  v13[3] = &unk_D6048;
  id v14 = v4;
  id v12 = v4;
  [v11 sendFTMessage:v10 attempts:0 withCompletionBlock:v13];
}

- (void)didReplaceMessage:(id)a3 newMessage:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 scheduleType] == (char *)&dword_0 + 2
    || [v6 scheduleType] == (char *)&dword_0 + 2)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession scheduledMessageCoordinator](self, "scheduledMessageCoordinator"));
    [v7 handleMessageDidReplace:v8 newMessage:v6];
  }
}

- (MessageGroupController)groupController
{
  return self->_groupController;
}

- (MessageDeliveryController)deliveryController
{
  return self->_deliveryController;
}

- (MessageAttachmentController)attachmentController
{
  return self->_attachmentController;
}

- (AttachmentRefreshDeliveryController)attachmentRefreshDeliveryController
{
  return self->_attachmentRefreshDeliveryController;
}

- (IMDGroupPhotoRefreshController)groupPhotoRefreshController
{
  return self->_groupPhotoRefreshController;
}

- (IMDScheduledMessageCoordinator)scheduledMessageCoordinator
{
  return self->_scheduledMessageCoordinator;
}

- (void)setMessageStore:(id)a3
{
}

- (void)setCkUtilities:(id)a3
{
}

- (NSMutableDictionary)pendingGroupPhotoDownloads
{
  return self->_pendingGroupPhotoDownloads;
}

- (void)setPendingGroupPhotoDownloads:(id)a3
{
}

- (IMDCallManager)callManager
{
  return self->_callManager;
}

- (void).cxx_destruct
{
}

- (BOOL)_convergesDisplayNames
{
  if (-[MessageServiceSession isReplicating](self, "isReplicating"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
    unsigned int v5 = [v4 supportsCapability:IMServiceCapabilityGroupIdentity] ^ 1;
  }

  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_blastDoorProcessingWithIMMessageItem:(id)a3 chat:(id)a4 account:(id)a5 fromToken:(id)a6 fromIDSID:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 participants:(id)a10 groupName:(id)a11 groupID:(id)a12 isFromMe:(BOOL)a13 isLastFromStorage:(BOOL)a14 isFromStorage:(BOOL)a15 hideLockScreenNotification:(BOOL)a16 wantsCheckpointing:(BOOL)a17 needsDeliveryReceipt:(id)a18 messageBalloonPayloadAttachmentDictionary:(id)a19 inlineAttachments:(id)a20 attributionInfoArray:(id)a21 nicknameDictionary:(id)a22 availabilityVerificationRecipientChannelIDPrefix:(id)a23 availabilityVerificationRecipientEncryptionValidationToken:(id)a24 availabilityOffGridRecipientSubscriptionValidationToken:(id)a25 availabilityOffGridRecipientEncryptionValidationToken:(id)a26 idsService:(id)a27 messageContext:(id)a28 isFromTrustedSender:(BOOL)a29 isFromSnapTrustedSender:(BOOL)a30 completionBlock:(id)a31
{
  id v162 = a3;
  id v157 = a4;
  id v155 = a5;
  id v153 = a6;
  id v151 = a7;
  id v160 = a8;
  id v36 = a9;
  id v164 = a10;
  id v149 = a11;
  id v133 = a12;
  id v135 = a18;
  id v37 = a19;
  id v38 = a20;
  id v136 = a21;
  id v139 = a22;
  id v142 = a23;
  id v144 = a24;
  id v141 = a25;
  id v138 = a26;
  id v146 = a27;
  id v147 = a28;
  id v39 = a31;
  uint64_t v41 = IMOSLoggingEnabled(v39, v40);
  if ((_DWORD)v41)
  {
    uint64_t v43 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v162;
      _os_log_impl( &dword_0,  v44,  OS_LOG_TYPE_INFO,  "Starting processing post blastdoor for messageItem: %@",  (uint8_t *)&buf,  0xCu);
    }
  }

  uint64_t v45 = IMOSLoggingEnabled(v41, v42);
  if ((_DWORD)v45)
  {
    uint64_t v47 = OSLogHandleForIMFoundationCategory("MessageService");
    id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v157;
      _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "   Chat: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v49 = IMOSLoggingEnabled(v45, v46);
  if ((_DWORD)v49)
  {
    uint64_t v51 = OSLogHandleForIMFoundationCategory("MessageService");
    id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v155;
      _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "   Account: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v53 = IMOSLoggingEnabled(v49, v50);
  if ((_DWORD)v53)
  {
    uint64_t v55 = OSLogHandleForIMFoundationCategory("MessageService");
    __int128 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v153;
      _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "   fromToken: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v57 = IMOSLoggingEnabled(v53, v54);
  if ((_DWORD)v57)
  {
    uint64_t v59 = OSLogHandleForIMFoundationCategory("MessageService");
    __int128 v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v151;
      _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "   fromIDSID: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v61 = IMOSLoggingEnabled(v57, v58);
  if ((_DWORD)v61)
  {
    uint64_t v63 = OSLogHandleForIMFoundationCategory("MessageService");
    __int16 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v160;
      _os_log_impl(&dword_0, v64, OS_LOG_TYPE_INFO, "   fromIdentifier: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v65 = IMOSLoggingEnabled(v61, v62);
  if ((_DWORD)v65)
  {
    uint64_t v67 = OSLogHandleForIMFoundationCategory("MessageService");
    __int128 v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v36;
      _os_log_impl(&dword_0, v68, OS_LOG_TYPE_INFO, "   toIdentifier: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v69 = IMOSLoggingEnabled(v65, v66);
  if ((_DWORD)v69)
  {
    uint64_t v71 = OSLogHandleForIMFoundationCategory("MessageService");
    __int128 v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v164;
      _os_log_impl(&dword_0, v72, OS_LOG_TYPE_INFO, "   participants: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v73 = IMOSLoggingEnabled(v69, v70);
  if ((_DWORD)v73)
  {
    uint64_t v75 = OSLogHandleForIMFoundationCategory("MessageService");
    __int128 v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v149;
      _os_log_impl(&dword_0, v76, OS_LOG_TYPE_INFO, "   groupName: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v77 = IMOSLoggingEnabled(v73, v74);
  if ((_DWORD)v77)
  {
    uint64_t v79 = OSLogHandleForIMFoundationCategory("MessageService");
    id v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      unsigned int v81 = [v162 isTypingMessage];
      id v82 = @"NO";
      if (v81) {
        id v82 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v82;
      _os_log_impl(&dword_0, v80, OS_LOG_TYPE_INFO, "   isTypingIndicator: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v83 = IMOSLoggingEnabled(v77, v78);
  if ((_DWORD)v83)
  {
    uint64_t v85 = OSLogHandleForIMFoundationCategory("MessageService");
    id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      id v87 = @"NO";
      if (a13) {
        id v87 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v87;
      _os_log_impl(&dword_0, v86, OS_LOG_TYPE_INFO, "   isFromMe: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  uint64_t v88 = IMOSLoggingEnabled(v83, v84);
  if ((_DWORD)v88)
  {
    uint64_t v90 = OSLogHandleForIMFoundationCategory("MessageService");
    __int128 v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
    {
      __int128 v92 = @"NO";
      if (a14) {
        __int128 v92 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v92;
      _os_log_impl(&dword_0, v91, OS_LOG_TYPE_INFO, "   isLastFromStorage: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  if (IMOSLoggingEnabled(v88, v89))
  {
    uint64_t v93 = OSLogHandleForIMFoundationCategory("MessageService");
    __int128 v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
    {
      id v95 = @"NO";
      if (a15) {
        id v95 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v95;
      _os_log_impl(&dword_0, v94, OS_LOG_TYPE_INFO, "   isFromStorage: %@", (uint8_t *)&buf, 0xCu);
    }
  }

  id v96 = (void *)objc_claimAutoreleasedReturnValue( +[IMMessageNotificationTimeManager sharedInstance]( &OBJC_CLASS___IMMessageNotificationTimeManager,  "sharedInstance"));
  [v96 acquireAssertionToUnsuspendProcess];

  uint64_t v97 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  char v98 = sub_2DA04();
  char v131 = (void *)objc_claimAutoreleasedReturnValue([v162 guid]);
  v204[0] = _NSConcreteStackBlock;
  v204[1] = 3221225472LL;
  v204[2] = sub_2DA50;
  v204[3] = &unk_D6090;
  id v99 = v36;
  id v205 = v99;
  id v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "__imArrayByApplyingBlock:", v204));
  id v101 = (void *)objc_claimAutoreleasedReturnValue([v160 _stripFZIDPrefix]);
  char v129 = v39;
  char v130 = v38;
  if ((unint64_t)[v164 count] <= 2 && a13 && objc_msgSend(v100, "count"))
  {
    id v102 = (void *)objc_claimAutoreleasedReturnValue([v100 lastObject]);
    uint64_t v103 = objc_claimAutoreleasedReturnValue([v102 _stripFZIDPrefix]);

    id v104 = v100;
    id v105 = (void *)v97;
    id v101 = (void *)v103;
  }

  else
  {
    id v104 = v100;
    id v105 = (void *)v97;
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v208 = 0x3032000000LL;
  v209 = sub_2DAC4;
  v210 = sub_2DAD4;
  id v211 = 0LL;
  id v123 = v157;
  id v211 = v123;
  v171[0] = _NSConcreteStackBlock;
  v171[1] = 3221225472LL;
  v171[2] = sub_2DADC;
  v171[3] = &unk_D6108;
  BOOL v196 = a14;
  v171[4] = self;
  id v137 = v136;
  id v172 = v137;
  id v106 = v162;
  id v173 = v106;
  id v163 = v131;
  id v174 = v163;
  id v127 = v164;
  id v175 = v127;
  p___int128 buf = &buf;
  id v126 = v99;
  id v176 = v126;
  BOOL v197 = a13;
  id v132 = v149;
  id v177 = v132;
  id v178 = v101;
  id v124 = v155;
  id v179 = v124;
  id v125 = v153;
  id v180 = v125;
  BOOL v198 = a29;
  id v165 = v160;
  id v181 = v165;
  char v199 = v98;
  id v107 = v178;
  id v159 = v105;
  id v182 = v159;
  id v161 = v104;
  id v183 = v161;
  id v134 = v133;
  id v184 = v134;
  BOOL v200 = a15;
  id v140 = v139;
  id v185 = v140;
  BOOL v201 = a30;
  BOOL v202 = a16;
  id v128 = v151;
  id v186 = v128;
  BOOL v203 = a17;
  id v154 = v138;
  id v187 = v154;
  id v152 = v141;
  id v188 = v152;
  id v143 = v142;
  id v189 = v143;
  id v150 = v144;
  id v190 = v150;
  id v145 = v135;
  id v191 = v145;
  id v156 = v146;
  id v192 = v156;
  id v158 = v147;
  id v193 = v158;
  id v148 = v37;
  id v194 = v148;
  id v108 = objc_retainBlock(v171);
  uint64_t v109 = im_checkpointIDSService();
  id v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
  im_sendMessageCheckpointIfNecessary(v110, 10200LL, v163, a17);

  v167[0] = _NSConcreteStackBlock;
  v167[1] = 3221225472LL;
  v167[2] = sub_31490;
  v167[3] = &unk_D5A70;
  __int16 v111 = v108;
  id v168 = v111;
  id v112 = v129;
  BOOL v170 = a14;
  id v169 = v112;
  v167[4] = self;
  v113 = objc_retainBlock(v167);
  if (a14) {
    -[MessageServiceSession noteLastItemProcessed](self, "noteLastItemProcessed");
  }
  if ([v106 isFromMe])
  {
    id v114 = (void *)objc_claimAutoreleasedReturnValue([v106 service]);
    uint64_t v115 = objc_claimAutoreleasedReturnValue( +[IMSenderContext fromMeContextWithServiceName:]( &OBJC_CLASS___IMSenderContext,  "fromMeContextWithServiceName:",  v114));
  }

  else
  {
    __int16 v116 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    id v117 = [v116 hasKnownSenderChatWithChatIdentifier:v107];

    id v114 = (void *)objc_claimAutoreleasedReturnValue([v106 service]);
    uint64_t v115 = objc_claimAutoreleasedReturnValue( +[IMSenderContext contextWithKnownSender:serviceName:]( &OBJC_CLASS___IMSenderContext,  "contextWithKnownSender:serviceName:",  v117,  v114));
  }

  __int16 v118 = (void *)v115;

  id v119 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession attachmentController](self, "attachmentController"));
  id v206 = v165;
  id v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v206, 1LL));
  uint64_t v121 = IMServiceNameForCanonicalIDSAddresses();
  id v122 = (void *)objc_claimAutoreleasedReturnValue(v121);
  [v119 retrieveAttachmentsForMessage:v106 inlineAttachments:v130 displayID:v107 topic:v122 comingFromStorage:a15 shouldForceAutoDownload:0 senderCont ext:v118 completionBlock:v113];

  _Block_object_dispose(&buf, 8);
}

- (void)_updateTransfersForAttributionInfoArray:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fileTransferGUIDs]);
    id v8 = [v7 count];
    id v9 = [v5 count];

    if (v8 == v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 fileTransferGUIDs]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_31A14;
      v18[3] = &unk_D6130;
      id v19 = v5;
      [v12 enumerateObjectsUsingBlock:v18];
    }

    else if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("Warning");
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 fileTransferGUIDs]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 count]));
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 count]));
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        id v23 = v17;
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "MessageServiceSession: not updating attribution info: number of guids %@ does not match number of attribution infos %@",  buf,  0x16u);
      }
    }
  }
}

- (void)_handleNicknameReceived:(id)a3 fromIdentifier:(id)a4 withMessageItem:(id)a5 isSnapTrustedUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (IMSharedHelperNickNameEnabled())
  {
    uint64_t v30 = self;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 _stringForKey:MessageDictionaryNicknameCloudKitRecordKey]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 _dataForKey:MessageDictionaryNicknameCloudKitDecryptionRecordKey]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 _stringForKey:MessageDictionaryWallpaperUpdateKey]);
    uint64_t v16 = (void *)v15;
    if (v15) {
      id v17 = (__CFString *)v15;
    }
    else {
      id v17 = @"NO";
    }
    uint64_t v18 = v17;

    __int128 v28 = v18;
    char v29 = NSBOOLFromString(v18);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 _dataForKey:MessageDictionaryNicknameWallpaperTagKey]);
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v10 _dataForKey:MessageDictionaryNicknameLowResWallpaperTagKey]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v10 _dataForKey:MessageDictionaryNicknameWallpaperMetadataTagKey]);
    if (IMOSLoggingEnabled(v21, v22))
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory("Nicknames");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = @"YES";
        if (!v6) {
          uint64_t v25 = @"NO";
        }
        *(_DWORD *)__int128 buf = 138412546;
        id v34 = v13;
        __int16 v35 = 2112;
        id v36 = v25;
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_INFO,  "This message came from user with nickname cloudKitRecord  %@, SNaP trusted user: %@",  buf,  0x16u);
      }
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_31DD0;
    void v31[3] = &unk_D6158;
    void v31[4] = v30;
    id v32 = v12;
    BYTE1(v27) = !v6;
    LOBYTE(v27) = v29;
    objc_msgSend( v26,  "NicknameWithRecordID:URI:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:hasWallpaperUp date:dropNicknameForUnknownContacts:withCompletionBlock:",  v13,  v11,  v14,  v19,  v20,  v21,  v27,  v31);
  }
}

- (void)_nicknameFetchCompletedMessage:(id)a3 synchronous:(BOOL)a4 profile:(id)a5 nickNameWasInCache:(BOOL)a6 nickNameDownloadError:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  int v15 = IMOSLoggingEnabled(v13, v14);
  if (!v12 || v13)
  {
    if (v15)
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory("Nicknames");
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v32 = 134218242;
        *(void *)&v32[4] = v12;
        *(_WORD *)&v32[12] = 2112;
        *(void *)&v32[14] = v13;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Ignoring nickname update (profile: %p) (error: %@)", v32, 0x16u);
      }
    }
  }

  else
  {
    if (v15)
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory("Nicknames");
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = @"NO";
        *(_DWORD *)id v32 = 138412802;
        *(void *)&v32[4] = v12;
        *(_WORD *)&v32[12] = 2112;
        if (v8) {
          uint64_t v18 = @"YES";
        }
        *(void *)&v32[14] = 0LL;
        __int16 v33 = 2112;
        id v34 = v18;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Got NickName Object  %@ error %@ wasInCache %@", v32, 0x20u);
      }
    }

    if (!v8)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 displayName]);
      id v20 = [v19 length];
      if (v20)
      {
        int v22 = IMSharedHelperNickNameEnabled(v20, v21);

        if (v22)
        {
          if (IMOSLoggingEnabled(v23, v24))
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory("Nicknames");
            uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v12 displayName]);
              *(_DWORD *)id v32 = 138412290;
              *(void *)&v32[4] = v27;
              _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Profile display name %@", v32, 0xCu);
            }
          }

          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession broadcaster](self, "broadcaster", *(_OWORD *)v32));
          char v29 = (void *)objc_claimAutoreleasedReturnValue([v12 dataRepresentation]);
          [v28 updateNicknameData:v29];
        }
      }

      else
      {
      }
    }
  }
}

- (void)_autoReportChatAsUnknown:(id)a3 chatIsNew:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = v6;
  if (v6 && v4 && [v6 isBlackholed])
  {
    BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "participants", 0));
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v13) ID]);
          -[NSMutableArray addObject:](v8, "addObject:", v14);

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v11);
    }

    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession chatRegistry](self, "chatRegistry"));
    id v16 = [v7 style];
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 internalName]);
    uint64_t v25 = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
    [v15 markAsSpamForIDs:v8 style:v16 onServices:v19 chatID:v20 queryID:0 autoReport:1];
  }
}

- (BOOL)_sendCertifiedDeliveryReceiptIfPossible:(id)a3 messageContext:(id)a4 guid:(id)a5 messageWasStored:(BOOL)a6 needsDeliveryReceipt:(BOOL)a7 failureReason:(id)a8
{
  if (a6) {
    return im_sendCertifiedDeliveryReceiptIfPossible(a3, a4, a5, a7, a8, 0LL);
  }
  else {
    return 0;
  }
}

- (BOOL)reflectMarkUnreadToPeerDevicesForMessageGUID:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("MessageService");
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)uint64_t v45 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Begin reflecting mark unread for message (%@)", buf, 0xCu);
    }
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsAccount](self, "idsAccount"));
  id v10 = (void *)v8;
  if (v8
    && (uint64_t v8 = -[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v8),
        (v8 & 1) != 0))
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession callerURIForIDSAccount:](self, "callerURIForIDSAccount:", v10));
    if (IMOSLoggingEnabled(v39, v11))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("MessageService");
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)uint64_t v45 = v4;
        *(_WORD *)&v45[8] = 2112;
        uint64_t v46 = v39;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "  Reflect mark as unread for guid: %@ to peer devices using callerID: %@",  buf,  0x16u);
      }
    }

    uint64_t v42 = @"uG";
    id v43 = v4;
    id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
    uint64_t v14 = JWEncodeDictionary(v37);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v15 = [v38 _FTCopyGzippedData];
    if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        unsigned int v19 = [v38 length];
        unsigned int v20 = [v15 length];
        *(_DWORD *)__int128 buf = 67109376;
        *(_DWORD *)uint64_t v45 = v19;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = v20;
        _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "  Compressed message data from: %u to: %u in sendMessageDictionary",  buf,  0xEu);
      }
    }

    v41[0] = v15;
    v40[0] = IDSSendMessageOptionDataToEncryptKey;
    v40[1] = IDSSendMessageOptionUUIDKey;
    uint64_t v21 = IDSGetUUIDData(v4);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v41[1] = v22;
    v40[2] = IDSSendMessageOptionTopLevelDictionaryKey;
    v40[3] = IDSSendMessageOptionSkipPayloadCheckKey;
    v41[2] = &__kCFBooleanTrue;
    v41[3] = &__kCFBooleanTrue;
    v41[4] = &off_DB510;
    v40[4] = IDSSendMessageOptionCommandKey;
    v40[5] = IDSSendMessageOptionTimeoutKey;
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    void v41[5] = v23;
    v41[6] = &__kCFBooleanTrue;
    v40[6] = IDSSendMessageOptionWantsDeliveryStatusKey;
    v40[7] = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsRetractAndEditMessages));
    v41[7] = v24;
    v40[8] = IDSSendMessageOptionAlwaysSkipSelfKey;
    v41[8] = &__kCFBooleanTrue;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  9LL));

    if (IMOSLoggingEnabled(v26, v27))
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory("MessageService");
      char v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)uint64_t v45 = v37;
        _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_INFO,  "  Sending FTCommandIDMarkAsUnreadMessage (c=111) with messageDictionary:%@",  buf,  0xCu);
      }
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v39));
    [v30 sendMessageDictionary:v31 encryptDictionary:1 fromID:v39 fromAccount:v10 toURIs:v32 toGroup:0 priority:300 options:v25 willSendBlock:0 completionBlock:&stru_D6178];

    BOOL v33 = 1;
  }

  else
  {
    if (IMOSLoggingEnabled(v8, v9))
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory("MessageService");
      __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)uint64_t v45 = v4;
        *(_WORD *)&v45[8] = 2112;
        uint64_t v46 = v10;
        _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "  Unable to reflect mark unread for message (%@), device is not registered for account: %@, bailing.",  buf,  0x16u);
      }
    }

    BOOL v33 = 0;
  }

  return v33;
}

- (BOOL)reflectRecoverChatToPeerDevicesForMessageGUID:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("MessageService");
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v33 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Begin reflecting recover junk chat for message guid %@", buf, 0xCu);
    }
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MessageServiceSession idsAccount](self, "idsAccount"));
  id v10 = (void *)v8;
  if (v8
    && (uint64_t v8 = -[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v8),
        (v8 & 1) != 0))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession callerURIForIDSAccount:](self, "callerURIForIDSAccount:", v10));
    if (IMOSLoggingEnabled(v11, v12))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        id v33 = v4;
        __int16 v34 = 2112;
        __int16 v35 = v11;
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "  Reflect recover junk chat for message guid: %@ to peer devices using callerID: %@",  buf,  0x16u);
      }
    }

    v30[0] = IDSSendMessageOptionUUIDKey;
    uint64_t v15 = IDSGetUUIDData(v4);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v31[0] = v16;
    v31[1] = &__kCFBooleanTrue;
    v30[1] = IDSSendMessageOptionTopLevelDictionaryKey;
    v30[2] = IDSSendMessageOptionSkipPayloadCheckKey;
    v31[2] = &__kCFBooleanTrue;
    void v31[3] = &off_DB528;
    v30[3] = IDSSendMessageOptionCommandKey;
    void v30[4] = IDSSendMessageOptionTimeoutKey;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    void v31[4] = v17;
    v30[5] = IDSSendMessageOptionWantsDeliveryStatusKey;
    v30[6] = IDSSendMessageOptionAlwaysSkipSelfKey;
    void v31[5] = &__kCFBooleanTrue;
    v31[6] = &__kCFBooleanTrue;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  7LL));

    if (IMOSLoggingEnabled(v19, v20))
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory("MessageService");
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "  Sending FTCommandIDRecoverJunkMessage (c=119)", buf, 2u);
      }
    }

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v11));
    objc_msgSend( v23,  "sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:completionBlock:",  v24,  1,  v11,  v10,  v25,  0,  300,  v18,  0,  &stru_D6198,  v30[0]);

    BOOL v26 = 1;
  }

  else
  {
    if (IMOSLoggingEnabled(v8, v9))
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        id v33 = v4;
        __int16 v34 = 2112;
        __int16 v35 = v10;
        _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "  Unable to reflect recover junk chat for message guid (%@), device is not registered for account: %@, bailing.",  buf,  0x16u);
      }
    }

    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)_shouldBlackholeChatFromSender:(id)a3 toRecipient:(id)a4 forAccount:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 existingSMSChatForID:v6]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastSentMessageDate]);
    BOOL v11 = v10 != 0LL;
  }

  else
  {
    BOOL v11 = 0LL;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v13 = [v12 activeAccountsAreEligibleForHawking];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v15 = [v14 receiverIsCandidateForHawking:v7];

  unsigned __int8 v16 = +[IMSpamFilterHelper shouldBlackholeMessageFromSender:toRecipient:ifRecipientIsCandidate:givenHistory:forEligibleAccounts:]( &OBJC_CLASS___IMSpamFilterHelper,  "shouldBlackholeMessageFromSender:toRecipient:ifRecipientIsCandidate:givenHistory:forEligibleAccounts:",  v6,  v7,  v15,  v11,  v13);
  return v16;
}

- (BOOL)_shouldBlackholeGroupChatFromSender:(id)a3 toRecipient:(id)a4 withOtherParticipants:(id)a5 forAccount:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v43[0] = v9;
  v43[1] = v10;
  id v36 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMSpamFilterHelper sanitizeParticipants:excludingHandles:]( &OBJC_CLASS___IMSpamFilterHelper,  "sanitizeParticipants:excludingHandles:",  v11,  v13));

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v37 = v9;
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 _stripFZIDPrefix]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 existingChatForID:v16 account:v12]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lastSeenMessageGuid]);
  BOOL v19 = v18 != 0LL;

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v20 = v14;
  id v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        if (v19)
        {
          BOOL v19 = 1LL;
        }

        else
        {
          uint64_t v25 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 _stripFZIDPrefix]);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 existingChatForID:v27 account:v12]);
          char v29 = (void *)objc_claimAutoreleasedReturnValue([v28 lastSeenMessageGuid]);
          BOOL v19 = v29 != 0LL;
        }
      }

      id v22 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v22);
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v31 = [v30 activeAccountsAreEligibleForHawking];

  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v33 = [v32 receiverIsCandidateForHawking:v36];

  unsigned __int8 v34 = +[IMSpamFilterHelper shouldBlackholeGroupMessageFromSender:toRecipient:ifRecipientIsCandidate:withOtherParticipants:givenHistory:forEligibleAccounts:]( &OBJC_CLASS___IMSpamFilterHelper,  "shouldBlackholeGroupMessageFromSender:toRecipient:ifRecipientIsCandidate:withOtherParticipant s:givenHistory:forEligibleAccounts:",  v37,  v36,  v33,  v20,  v19,  v31);
  return v34;
}

- (id)_pushHandlerForIDSAccount:(id)a3
{
  id v4 = a3;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v5 = self->_messagePushHandlers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 account]);
      unsigned __int8 v11 = [v10 isEqual:v4];

      if ((v11 & 1) != 0) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v32,  v37,  16LL);
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v12 = v9;

    if (v12) {
      goto LABEL_26;
    }
  }

  else
  {
LABEL_9:
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v13 = self->_messagePushHandlers;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v36,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
LABEL_13:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(v13);
      }
      uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 account]);
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 loginID]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 loginID]);
      unsigned __int8 v21 = [v19 isEqual:v20];

      if ((v21 & 1) != 0) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v36,  16LL);
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }

    id v12 = v17;

    if (v12) {
      goto LABEL_26;
    }
  }

  else
  {
LABEL_19:
  }

  if (IMOSLoggingEnabled(v22, v23))
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Couldn't find push handler", v27, 2u);
    }
  }

  id v12 = 0LL;
LABEL_26:

  return v12;
}

- (void)_handleMessageSentToSelf:(id)a3 chatIdentifier:(id)a4 style:(unsigned __int8)a5 isLocal:(BOOL)a6 account:(id)a7
{
  uint64_t v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!v14) {
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
  }
  if ([v12 isFromMe])
  {
    if (([v12 isTypingMessage] & 1) == 0)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 handle]);
      BOOL v16 = sub_336AC(v15);

      if (!v16)
      {
        if (IMOSLoggingEnabled(v17, v18))
        {
          uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageService");
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 138412802;
            id v31 = v12;
            __int16 v32 = 2112;
            id v33 = v13;
            __int16 v34 = 1024;
            int v35 = v9;
            _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Need to handle message sent to myself: %@   chat: %@  style: %d",  buf,  0x1Cu);
          }
        }

        unsigned __int8 v21 = -[MessageServiceSession shouldSendReadReceiptsForChat:style:]( self,  "shouldSendReadReceiptsForChat:style:",  v13,  v9);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_337E0;
        v22[3] = &unk_D61C0;
        id v23 = v12;
        BOOL v27 = a6;
        id v24 = v13;
        uint64_t v25 = self;
        char v28 = v9;
        id v26 = v14;
        unsigned __int8 v29 = v21;
        im_dispatch_after(v22, 2.0);
      }
    }
  }
}

- (void)handleBreadcrumbForNewSentMessageItemIfNecessary:(id)a3 withContext:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 chatIdentifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession storeBreadcrumbAndSetConsumedPayloadsForNewMessageItemIfNecessary:inChatWithIdentifier:]( self,  "storeBreadcrumbAndSetConsumedPayloadsForNewMessageItemIfNecessary:inChatWithIdentifier:",  v13,  v8));

  if ([v13 isBreadcrumb] && _IMWillLog(@"Breadcrumbs"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 consumedSessionPayloads]);
    [v10 count];
    _IMAlwaysLog(0LL, @"Breadcrumbs", @"Sending breadcrumb %@ with payload history: %tu items.");
  }

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 chatIdentifier]);
  -[MessageServiceSession _updateStoredBreadcrumbIfNeeded:onChat:]( self,  "_updateStoredBreadcrumbIfNeeded:onChat:",  v9,  v12);
}

- (id)storeBreadcrumbAndSetConsumedPayloadsForNewMessageItemIfNecessary:(id)a3 inChatWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isTypingMessage] & 1) == 0 && !objc_msgSend(v6, "scheduleType"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 breadcrumbText]);
    if (![v10 length])
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 balloonBundleID]);
      id v12 = [v11 length];

      if (!v12)
      {
        uint64_t v8 = 0LL;
LABEL_50:

        goto LABEL_6;
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 balloonBundleID]);
    unsigned int v14 = [v13 isEqualToString:IMBalloonPluginIdentifierDT];

    if ([v10 length])
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 balloonBundleID]);
      BOOL v16 = [v15 length] == 0;
    }

    else
    {
      BOOL v16 = 0;
    }

    id v77 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession _messageItemToConsumeForNewBreadcrumbMessage:outBreadcrumbItems:]( self,  "_messageItemToConsumeForNewBreadcrumbMessage:outBreadcrumbItems:",  v6,  &v77));
    id v18 = v77;
    if ([v6 associatedMessageType] == (char *)&dword_0 + 2)
    {
      uint64_t v19 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      uint64_t v20 = IMGetConsumedSessionPayloadsForBreadcrumbItems(v18);
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = -[NSMutableArray initWithArray:](v19, "initWithArray:", v21);

      uint64_t v23 = objc_claimAutoreleasedReturnValue([v17 payloadData]);
      if (v23)
      {
        id v24 = (void *)v23;
        uint64_t v25 = (char *)[v17 associatedMessageType];

        if (v25 != (_BYTE *)&dword_0 + 3)
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v17 payloadData]);
          -[NSMutableArray addObject:](v22, "addObject:", v26);
        }
      }

      [v6 setConsumedSessionPayloads:v22];
    }

    if ((v16 | v14) == 1) {
      id v27 = v10;
    }
    else {
      id v27 = (id)objc_claimAutoreleasedReturnValue([v17 breadcrumbText]);
    }
    char v28 = v27;
    if (_IMWillLog(@"Breadcrumbs"))
    {
      id v52 = v17;
      _IMAlwaysLog(0LL, @"Breadcrumbs", @"Found item to consume: %@");
    }

    if (v17)
    {
      id v29 = [[IMAssociatedMessageItem alloc] initWithMessageItem:v17];
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedMessageGUID]);
      [v29 setAssociatedMessageGUID:v30];

      [v29 setAssociatedMessageType:3];
      [v29 setBody:v28];
      id v31 = v17;
    }

    else
    {
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v6 balloonBundleID]);

      if (v44)
      {
LABEL_23:
        uint64_t v8 = 0LL;
LABEL_49:

        goto LABEL_50;
      }

      id v68 = objc_alloc(&OBJC_CLASS___IMAssociatedMessageItem);
      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v6 senderInfo]);
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v6 time]);
      unsigned int v45 = [v6 isFromMe];
      uint64_t v46 = 12289LL;
      if (v45) {
        uint64_t v46 = 45061LL;
      }
      uint64_t v64 = v46;
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v6 account]);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v6 accountID]);
      uint64_t v63 = IMServiceNameiMessage;
      uint64_t v48 = objc_claimAutoreleasedReturnValue([v6 handle]);
      uint64_t v67 = (void *)v48;
      if (v48) {
        uint64_t v49 = v48;
      }
      else {
        uint64_t v49 = (uint64_t)v7;
      }
      id v62 = (id)v49;
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v6 roomName]);
      __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v6 unformattedID]);
      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v6 countryCode]);
      id v50 = [v6 expireState];
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v6 balloonBundleID]);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v6 biaReferenceID]);
      LODWORD(v56) = 0;
      id v29 = objc_msgSend( v68,  "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUI Ds:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:ba lloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:errorType:associatedMessageGUID:a ssociatedMessageType:associatedMessageRange:bizIntent:locale:biaReferenceID:messageSummaryInfo:partCount:t hreadIdentifier:",  v66,  v65,  0,  0,  0,  0,  v28,  0,  0,  0,  v64,  0,  0,  v70,  v47,  v63,  v62,  v61,  v60,  v59,  v50,  v57,  0,  0,  0,  v56,  v58,  3,  0,  0x7FFFFFFFFFFFFFFFLL,  0,  0,  v51,  0,  0,  0);

      id v31 = v6;
    }

    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 destinationCallerID]);
    [v29 setDestinationCallerID:v32];

    id v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    LOBYTE(v53) = 1;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v33 storeMessage:v29 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:0 updateMessageCache:1 calculateUnreadCount:v53]);

    if (_IMWillLog(@"Breadcrumbs"))
    {
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v8 body]);
      uint64_t v54 = v8;
      id v55 = [v34 length];
      _IMAlwaysLog(0LL, @"Breadcrumbs", @"Stored breadcrumb: %@ with body length %tu");
    }

    if (v8)
    {
      if (!v17)
      {
        id v69 = v29;
        uint64_t v71 = v28;
        id v72 = v18;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        int v35 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 allExistingChatsWithIdentifier:v7]);

        id v37 = [v36 countByEnumeratingWithState:&v73 objects:v78 count:16];
        if (v37)
        {
          id v38 = v37;
          uint64_t v39 = *(void *)v74;
          do
          {
            for (i = 0LL; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v74 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void *)(*((void *)&v73 + 1) + 8LL * (void)i);
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[IMDChatRegistry sharedInstance]( &OBJC_CLASS___IMDChatRegistry,  "sharedInstance",  v54,  v55));
              [v42 addItem:v8 toChat:v41];
            }

            id v38 = [v36 countByEnumeratingWithState:&v73 objects:v78 count:16];
          }

          while (v38);
        }

        uint64_t v17 = 0LL;
        char v28 = v71;
        id v18 = v72;
        id v29 = v69;
      }

      id v43 = v8;
    }

    else
    {
      _IMWarn(@"Failed to store updated breadcrumb item %@");
    }

    goto LABEL_49;
  }

  if (_IMWillLog(@"Breadcrumbs"))
  {
    [v6 isTypingMessage];
    [v6 scheduleType];
    _IMAlwaysLog(0LL, @"Breadcrumbs", @"Not breadcrumbing, isTypingMessage: %@, scheduleType: %lu");
  }

  uint64_t v8 = 0LL;
LABEL_6:

  return v8;
}

- (id)_messageItemToConsumeForNewBreadcrumbMessage:(id)a3 outBreadcrumbItems:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedMessageGUID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 messagesWithAssociatedGUID:v6 shouldLoadAttachments:0]);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_48F6C;
  void v32[3] = &unk_D68C8;
  id v9 = v5;
  id v33 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "__imArrayByFilteringWithBlock:", v32));

  if (a4) {
    *a4 = v10;
  }
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    id v26 = v6;
    id v27 = 0LL;
    id v14 = 0LL;
    uint64_t v15 = *(void *)v29;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "guid", v26));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 guid]);
        unsigned __int8 v20 = [v18 isEqualToString:v19];

        if ((v20 & 1) == 0)
        {
          if ([v17 associatedMessageType] == (char *)&dword_0 + 2)
          {
            id v23 = v17;

            id v6 = v26;
            id v22 = v27;
            goto LABEL_22;
          }

          if ([v17 associatedMessageType] == (char *)&dword_0 + 3
            && (uint64_t)v14 < (uint64_t)[v17 messageID])
          {
            id v14 = [v17 messageID];
            id v21 = v17;

            id v27 = v21;
          }
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    id v6 = v26;
    if (v14)
    {
      id v22 = v27;
      id v23 = v22;
      goto LABEL_22;
    }

    id v22 = v27;
  }

  else
  {

    id v22 = 0LL;
  }

  if ([v9 associatedMessageType] == (char *)&dword_0 + 2)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    id v23 = (id)objc_claimAutoreleasedReturnValue([v24 messageWithGUID:v6]);
  }

  else
  {
    id v23 = 0LL;
  }

- (void)_updateStoredBreadcrumbIfNeeded:(id)a3 onChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v24 = v5;
  if (v5)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allExistingChatsWithIdentifier:v6]);

    id obj = v8;
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        id v12 = 0LL;
        id v25 = v10;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 chatIdentifier]);
          unsigned int v15 = [v14 isEqualToString:v6];

          if (v15)
          {
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDBroadcastController sharedProvider]( &OBJC_CLASS___IMDBroadcastController,  "sharedProvider"));
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "broadcasterForChatListenersUsingBlackholeRegistry:",  objc_msgSend(v13, "isBlackholed")));
            id v18 = v6;
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 accountID]);
            unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v13 chatIdentifier]);
            id v21 = [v13 style];
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 groupID]);
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 personCentricID]);
            [v17 account:v19 chat:v20 style:v21 chatProperties:0 groupID:v22 chatPersonCentricID:v23 messageReceived:v24];

            id v6 = v18;
            id v10 = v25;
          }

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v10);
    }
  }
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 destinationHandles:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
  -[MessageServiceSession sendMessage:toChat:style:account:destinationHandles:]( self,  "sendMessage:toChat:style:account:destinationHandles:",  v12,  v11,  v6,  v13,  v10);
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 destinationHandles:(id)a7
{
  uint64_t v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  BOOL v16 = -[MessageServiceSession _shouldInitiateTelephonyConversationForMessage:]( self,  "_shouldInitiateTelephonyConversationForMessage:",  v12);
  if (v16)
  {
    if (IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory("MessageServiceSessionSendHandler");
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v12 guid]);
        *(_DWORD *)__int128 buf = 138412290;
        __int128 v31 = v20;
        _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "Initiating TUConversation for message %@ and not actually sending the message",  buf,  0xCu);
      }
    }

    -[MessageServiceSession _initiateTelephonyConversationForMessage:chatIdentifier:chatStyle:onSession:]( self,  "_initiateTelephonyConversationForMessage:chatIdentifier:chatStyle:onSession:",  v12,  v13,  v9,  self);
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession _buildSendMessageContextWithChatIdentifier:withChatStyle:withServiceSession:withMessage:destinations:]( self,  "_buildSendMessageContextWithChatIdentifier:withChatStyle:withServiceSession:withMessage:destinations:",  v13,  v9,  self,  v12,  v15));
    if (v21)
    {
      -[MessageServiceSession _notifyOfSendMessage:withContext:](self, "_notifyOfSendMessage:withContext:", v12, v21);
      -[MessageServiceSession _startTimingMessageSend](self, "_startTimingMessageSend");
      -[MessageServiceSession handleBreadcrumbForNewSentMessageItemIfNecessary:withContext:]( self,  "handleBreadcrumbForNewSentMessageItemIfNecessary:withContext:",  v12,  v21);
      id v22 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession _processMessageForSending:withContext:]( self,  "_processMessageForSending:withContext:",  v12,  v21));

      if (v22)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession _processMessageForSendingToGroupIfNeeded:withContext:]( self,  "_processMessageForSendingToGroupIfNeeded:withContext:",  v22,  v21));
        if (v23)
        {
          [v21 setGroupMessageContext:v23];
          -[MessageServiceSession _refreshGroupPhotoTTLIfNecessary:withContext:]( self,  "_refreshGroupPhotoTTLIfNecessary:withContext:",  v22,  v21);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_7A990;
          v26[3] = &unk_D7990;
          id v24 = v21;
          id v27 = v24;
          __int128 v28 = self;
          id v25 = v22;
          id v29 = v25;
          -[MessageServiceSession _deliverMessage:withContext:withBlock:]( self,  "_deliverMessage:withContext:withBlock:",  v25,  v24,  v26);
          -[MessageServiceSession _storeSentMessage:withContext:](self, "_storeSentMessage:withContext:", v25, v24);
        }
      }
    }

    else
    {
      id v22 = v12;
    }

    id v12 = v22;
  }
}

- (void)cancelScheduledMessageWithGUID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  [v5 cancelScheduledMessageWithGUID:v4 fromID:@"0000000000"];
}

- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 chatsGUIDsForMessageWithGUID:v9]);
  id v17 = (id)objc_claimAutoreleasedReturnValue([v11 lastObject]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 existingChatWithGUID:v17]);

  id AddressedURIForChatLogMetricIfNeeded = _LastAddressedURIForChatLogMetricIfNeeded(v13, 0LL, self, 0LL, 0);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(AddressedURIForChatLogMetricIfNeeded);
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  [v16 cancelScheduledMessageWithGUID:v9 fromID:v15 destinations:v8 cancelType:a5];
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  uint64_t v9 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 chatWithGUID:v15]);
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( [v21 storeEditedMessage:v17 editedPartIndex:a5 editType:a6 previousMessage:v16 chat:v19 updatedAssociatedMessageItems:0]);

  -[MessageServiceSession sendMessage:toChat:style:](self, "sendMessage:toChat:style:", v20, v15, v9);
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  uint64_t v8 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 chatWithGUID:v13]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( [v20 storeEditedMessage:v16 editedPartIndexes:v14 editType:2 previousMessage:v15 chat:v18 updatedAssociatedMessageItems:0]);

  -[MessageServiceSession sendMessage:toChat:style:](self, "sendMessage:toChat:style:", v19, v13, v8);
}

- (void)_notifyOfSendMessage:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
  -[MessageServiceSession _notifyNameAndPhotoControllerOfMessage:onChat:]( self,  "_notifyNameAndPhotoControllerOfMessage:onChat:",  v8,  v7);

  -[MessageServiceSession _updateBlackholeStatusIfNeededWithMessage:withContext:]( self,  "_updateBlackholeStatusIfNeededWithMessage:withContext:",  v8,  v6);
  -[MessageServiceSession _updateLastDeviceActivityForCloudKit](self, "_updateLastDeviceActivityForCloudKit");
  -[MessageServiceSession _setExpectedOffGridDeliveriesForMessage:context:]( self,  "_setExpectedOffGridDeliveriesForMessage:context:",  v8,  v6);
}

- (void)_setExpectedOffGridDeliveriesForMessage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isTypingMessage] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
    unsigned int v9 = [v8 style];

    if (v9 == 45)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 participantURIs]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
      unint64_t v12 = -[MessageServiceSession _numberOfOffGridCapableDevicesForDestination:]( self,  "_numberOfOffGridCapableDevicesForDestination:",  v11);

      if (IMOSLoggingEnabled(v13, v14))
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory("MessageService");
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 chatIdentifier]);
          int v22 = 134218242;
          unint64_t v23 = v12;
          __int16 v24 = 2112;
          id v25 = v18;
          _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "Found %llu off grid capable devices for %@",  (uint8_t *)&v22,  0x16u);
        }
      }

      if (v12)
      {
        [v6 setExpectedOffGridCapableDeliveries:v12];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDOffGridAvailabilityTracker sharedTracker]( &OBJC_CLASS___IMDOffGridAvailabilityTracker,  "sharedTracker"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 recipient]);
        [v19 startTrackingHandle:v21];
      }
    }
  }
}

- (void)_notifyNameAndPhotoControllerOfMessage:(id)a3 onChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 isTypingMessage];
  if ((v7 & 1) == 0)
  {
    if (IMSharedHelperNickNameEnabled(v7, v8))
    {
      id v9 = [v5 shouldSendMeCard];
      if ((_DWORD)v9)
      {
        if (IMOSLoggingEnabled(v9, v10))
        {
          uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
          unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v14 = 0;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Queuing up nickname info to send if needed", v14, 2u);
          }
        }

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
        [v13 queueChatToSendNicknamePostUploadIfNeeded:v6];
      }
    }
  }
}

- (void)_updateBlackholeStatusIfNeededWithMessage:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isTypingMessage] & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
    unsigned int v8 = [v7 isBlackholed];

    if (v8)
    {
      if (IMOSLoggingEnabled(v9, v10))
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
        unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 guid]);
          int v22 = 138412290;
          unint64_t v23 = v14;
          _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Response is causing chat (%@) to be removed from blackhole.",  (uint8_t *)&v22,  0xCu);
        }
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
      [v15 updateIsBlackholed:0];

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 participants]);
      BOOL v18 = [v17 count] == (char *)&dword_0 + 1;

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"));
      id v20 = v19;
      if (v18) {
        uint64_t v21 = 22LL;
      }
      else {
        uint64_t v21 = 23LL;
      }
      [v19 trackSpamEvent:v21];
    }
  }
}

- (void)_updateLastDeviceActivityForCloudKit
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v3 = [v2 isInternalInstall];

  if (v3)
  {
    uint64_t v4 = IMCloudKitDefinesDomain;
    uint64_t v5 = IMCloudKitLastDeviceActivityDate;
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    IMSetDomainValueForKey(v4, v5, v6);
  }

- (void)_didSendMessage:(id)a3 withContext:(id)a4 forceDate:(id)a5 fromStorage:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v18 = (id)objc_claimAutoreleasedReturnValue([v11 serviceSession]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 chat]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 chatIdentifier]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 chat]);

  id v16 = [v15 style];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession account](self, "account"));
  [v18 didSendMessage:v12 forChat:v14 style:v16 account:v17 forceDate:v10 itemIsComingFromStorage:v6];
}

- (id)_setCallerIDOnMessage:(id)a3 onChat:(id)a4 withIDSAccount:(id *)a5 withServiceSession:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 guid]);
      int v35 = 138412290;
      id v36 = v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Picking callerID for guid %@", (uint8_t *)&v35, 0xCu);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession _lastAddressedURIForChatLogMetricIfNeededOnChat:withIDSAccount:withServiceSession:shouldLog:]( self,  "_lastAddressedURIForChatLogMetricIfNeededOnChat:withIDSAccount:withServiceSession:shouldLog:",  v11,  a5,  v12,  [v10 isTypingMessage] ^ 1));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 balloonBundleID]);
  uint64_t v19 = IMBalloonExtensionIDWithSuffix(@"com.apple.PeopleMessageService.ScreenTime");
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if ([v18 isEqualToString:v20])
  {
  }

  else
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v10 balloonBundleID]);
    uint64_t v22 = IMBalloonExtensionIDWithSuffix(@"com.apple.PeopleMessageService.AskToBuy");
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    unsigned int v24 = [v21 isEqualToString:v23];

    if (!v24) {
      goto LABEL_19;
    }
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 account]);
  id v26 = v25;
  if (v25)
  {
    if (([v25 hasPrefix:@"e:"] & 1) != 0
      || [v26 hasPrefix:@"E:"])
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 _stripFZIDPrefix]);

      uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 _bestGuessURI]);
      if (IMOSLoggingEnabled(v29, v30))
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory("MessageService");
        __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          int v35 = 138412290;
          id v36 = v27;
          _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  "Rewritting callerURI using %@ for PeopleMessageService balloon",  (uint8_t *)&v35,  0xCu);
        }
      }

      id v17 = (void *)v28;
    }

    else
    {
      id v27 = v26;
    }
  }

  else
  {
    id v27 = 0LL;
  }

LABEL_19:
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v17 _stripFZIDPrefix]);
  [v10 setDestinationCallerID:v33];

  return v17;
}

- (id)_lastAddressedURIForChatLogMetricIfNeededOnChat:(id)a3 withIDSAccount:(id *)a4 withServiceSession:(id)a5 shouldLog:(BOOL)a6
{
  return _LastAddressedURIForChatLogMetricIfNeeded(a3, 0LL, a5, a4, a6);
}

- (BOOL)_handleDeviceRegistrationForMessage:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsAccount]);
  BOOL v9 = -[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:", v8);

  if (!v9)
  {
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v12 = OSLogHandleForIMEventCategory("MessageService");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 idsAccount]);
        int v17 = 138412290;
        id v18 = v14;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  " ** Device is not regisistered for account %@, failing send message",  (uint8_t *)&v17,  0xCu);
      }
    }

    [v6 setErrorCode:33];
    -[MessageServiceSession _didSendMessage:withContext:forceDate:fromStorage:]( self,  "_didSendMessage:withContext:forceDate:fromStorage:",  v6,  v7,  0LL,  0LL);
    -[MessageServiceSession _FTAWDLogForMessage:withContext:](self, "_FTAWDLogForMessage:withContext:", v6, v7);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMPowerLog sharedInstance](&OBJC_CLASS___IMPowerLog, "sharedInstance"));
    [v15 logMessageSendFailureWithError:@"DeviceNotRegistered"];

    -[MessageServiceSession _stopTimingMessageSend](self, "_stopTimingMessageSend");
  }

  return v9;
}

- (BOOL)_failSendingMessageIfNeeded:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IMGetCachedDomainBoolForKey(@"com.apple.madrid", @"FailSendingMessages");
  BOOL v10 = v8;
  if ((_DWORD)v8)
  {
    uint64_t v11 = IMOSLoggingEnabled(v8, v9);
    if ((_DWORD)v11)
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 134217984;
        uint64_t v25 = 0x4010000000000000LL;
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  " ** FailSendingMessages is enabled, failing send message after %f seconds",  buf,  0xCu);
      }
    }

    if (IMOSLoggingEnabled(v11, v12))
    {
      uint64_t v15 = OSLogHandleForIMEventCategory("MessageService");
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 134217984;
        uint64_t v25 = 0x4010000000000000LL;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  " ** FailSendingMessages is enabled, failing send message after %f seconds",  buf,  0xCu);
      }
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_7BAF4;
    v20[3] = &unk_D7038;
    id v17 = v6;
    id v21 = v17;
    uint64_t v22 = self;
    id v18 = v7;
    id v23 = v18;
    im_dispatch_after(v20, 4.0);
    -[MessageServiceSession _storeSentMessage:withContext:](self, "_storeSentMessage:withContext:", v17, v18);
  }

  return v10;
}

- (BOOL)_handleTypingIndicatorMessage:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[MessageServiceSession _shouldOverrideTypingIndicator](self, "_shouldOverrideTypingIndicator");
  BOOL v10 = v8;
  if (v8 && IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v38) = 0;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "The server has disabled typing indicators via the iMessage config bag!",  (uint8_t *)&v38,  2u);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
  BOOL v14 = [v13 style] != 45;

  if (v10 || v14)
  {
    id v15 = [v6 isFinished];
    if ((v15 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v15, v16))
      {
        uint64_t v32 = OSLogHandleForIMFoundationCategory("MessageService");
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
          unsigned int v35 = [v34 style];
          id v36 = @"NO";
          if (v10) {
            id v36 = @"YES";
          }
          int v38 = 67109378;
          LODWORD(v39[0]) = v35;
          WORD2(v39[0]) = 2112;
          *(void *)((char *)v39 + 6) = v36;
          _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "Not sending typing indicator to chat style: %c typingIndicatorOverride: %@",  (uint8_t *)&v38,  0x12u);
        }
      }

      goto LABEL_34;
    }

    if ([v6 isFinished])
    {
      id v17 = [v6 isEmpty];
      if ((_DWORD)v17)
      {
        if (IMOSLoggingEnabled(v17, v18))
        {
          uint64_t v19 = OSLogHandleForIMFoundationCategory("MessageService");
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
            unsigned int v22 = [v21 style];
            id v23 = @"NO";
            if (v10) {
              id v23 = @"YES";
            }
            int v38 = 67109378;
            LODWORD(v39[0]) = v22;
            WORD2(v39[0]) = 2112;
            *(void *)((char *)v39 + 6) = v23;
            _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Not sending a cancel typing indicator to chat style: %c typingIndicatorOverride: %@",  (uint8_t *)&v38,  0x12u);
          }
        }

- (BOOL)_shouldOverrideTypingIndicator
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"md-typing-indicator-override"]);
  BOOL v4 = [v3 intValue] != 0;

  return v4;
}

- (BOOL)_shouldSendAppTypingIndicator
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"dont-send-app-typing-indicator"]);
  char v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (id)_processMessageForSending:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  BOOL v25 = sub_7C2E0;
  uint64_t v26 = sub_7C2F0;
  id v27 = 0LL;
  unsigned int v8 = [v6 isBeingRetried];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceSession]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 chatIdentifier]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
  id v13 = [v12 style];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v7 imdAccount]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_7C2F8;
  v21[3] = &unk_D79B8;
  v21[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_7C378;
  v18[3] = &unk_D79E0;
  void v18[4] = self;
  id v15 = v7;
  id v19 = v15;
  id v20 = &v22;
  [v9 processMessageForSending:v6 toChat:v11 style:v13 allowWatchdog:v8 ^ 1 account:v14 didReplaceMessageBlock:v21 completionBlock:v18];

  id v16 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 didReplaceMessageBlock:(id)a8 completionBlock:(id)a9
{
  BOOL v30 = a6;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v28 = a8;
  id v26 = a9;
  if ([v14 scheduleType] == (char *)&dword_0 + 2)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v14 setScheduledMessageLastModifiedTime:v17];
  }

  id v18 = v14;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v27 = self;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession serviceSessionDelegates](self, "serviceSessionDelegates"));
  id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  uint64_t v29 = v18;
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v24, "processMessageForSending:toChat:style:allowWatchdog:account:") & 1) != 0)
        {
          uint64_t v25 = objc_claimAutoreleasedReturnValue( [v24 processMessageForSending:v18 toChat:v15 style:v11 allowWatchdog:v30 account:v16]);

          id v18 = (id)v25;
        }
      }

      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v21);
  }

  v31.receiver = v27;
  v31.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  -[MessageServiceSession processMessageForSending:toChat:style:allowWatchdog:account:didReplaceMessageBlock:completionBlock:]( &v31,  "processMessageForSending:toChat:style:allowWatchdog:account:didReplaceMessageBlock:completionBlock:",  v18,  v15,  v11,  v30,  v16,  v28,  v26);
}

- (unint64_t)_numberOfOffGridCapableDevicesForDestination:(id)a3
{
  id v20 = a3;
  id v33 = v20;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
  char v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMIDSIDQueryController _currentCachedRemoteDevicesForDestinations:service:listenerID:]( &OBJC_CLASS___IMIDSIDQueryController,  "_currentCachedRemoteDevicesForDestinations:service:listenerID:",  v3,  @"com.apple.madrid",  @"MessageServiceSession+OffGrid"));

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v19 = v4;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 allValues]);
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0LL;
    uint64_t v22 = *(void *)v28;
    uint64_t v8 = IDSRegistrationPropertySupportsStewie;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              id v17 = [v16 valueForCapability:v8];

              if (v17) {
                ++v7;
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }

          while (v13);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v6);
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (id)_processMessageForSendingToGroupIfNeeded:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0LL;
  __int128 v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  __int128 v27 = sub_7C2E0;
  __int128 v28 = sub_7C2F0;
  id v29 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceSession]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 groupController]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 fromURI]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 idsAccount]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceSession]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 idsService]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_7CA18;
  v19[3] = &unk_D7A08;
  id v15 = v7;
  id v20 = v15;
  id v21 = self;
  id v16 = v6;
  id v22 = v16;
  __int128 v23 = &v24;
  [v9 sendMessage:v16 toChat:v10 fromID:v11 fromAccount:v12 session:v13 service:v14 completionBlock:v19];

  id v17 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v17;
}

- (void)_refreshGroupPhotoTTLIfNecessary:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 groupMessageContext]);
  BOOL v10 = (void *)v8;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 groupMessageContext]);
    unsigned __int8 v12 = [v11 isGroupChat];

    if ((v12 & 1) != 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 groupPhotoGuid]);
      if (IMOSLoggingEnabled(v13, v14))
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v35 = 138412546;
          id v36 = v7;
          __int16 v37 = 2112;
          int v38 = v13;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Chat: %@, groupPhotoGuid= %@ ", (uint8_t *)&v35, 0x16u);
        }
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 transferForGUID:v13]);

      if (v18) {
        goto LABEL_13;
      }
      if (IMOSLoggingEnabled(v19, v20))
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(v35) = 0;
          _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "Transfer from IMDFileTransferCenter is nil. Try the IMDAttachmentStore",  (uint8_t *)&v35,  2u);
        }
      }

      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 groupPhotoGuid]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v23 attachmentWithGUID:v25]);

      if (v18)
      {
LABEL_13:
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceSession]);
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 groupPhotoRefreshController]);
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
        [v29 refreshTTLForGroupPhoto:v18 chat:v30];
      }

      else if (IMOSLoggingEnabled(v26, v27))
      {
        uint64_t v33 = OSLogHandleForIMFoundationCategory("MessageService_GroupPhoto");
        __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          LOWORD(v35) = 0;
          _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "Transfer from IMDAttachmentStore is nil. Can't refresh the TTL for group photo.",  (uint8_t *)&v35,  2u);
        }
      }

- (void)_deliverMessage:(id)a3 withContext:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472LL;
  uint64_t v24 = sub_7D400;
  __int128 v25 = &unk_D7A80;
  id v11 = v9;
  id v26 = v11;
  id v12 = v8;
  id v27 = v12;
  __int128 v28 = self;
  id v13 = v10;
  id v29 = v13;
  uint64_t v14 = objc_retainBlock(&v22);
  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___MessageServiceSessionSendBlockWrapper);
  id v16 = objc_msgSend(v14, "copy", v22, v23, v24, v25);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 guid]);
  -[MessageServiceSessionSendBlockWrapper setGUID:](v15, "setGUID:", v17);

  -[MessageServiceSessionSendBlockWrapper setBlock:](v15, "setBlock:", v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 balloonBundleID]);
  if ([v18 isEqualToString:IMBalloonPluginIdentifierRichLinks])
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 fileTransferGUIDs]);
    if ([v19 count]) {
      uint64_t v20 = 0LL;
    }
    else {
      uint64_t v20 = [v12 isTypingMessage] ^ 1;
    }
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  -[MessageServiceSessionSendBlockWrapper setIsDelayedRichLinkBlock:](v15, "setIsDelayedRichLinkBlock:", v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceSession]);
  [v21 stageMessageWrapperBlock:v15];
}

- (void)_updateOffGridStatusIfNeededWithMessage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isTypingMessage] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
    unsigned int v9 = [v8 style];

    if (v9 == 45)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceName]);
      unsigned __int8 v12 = [v11 isEqualToString:IMServiceNameiMessageLite];

      if ((v12 & 1) == 0)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 chatIdentifier]);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 imdAccount]);
        int v36 = IMGetDomainBoolForKey(@"com.apple.messages", @"ForceOffGridParticipants");
        unsigned int v17 = [v6 isPendingSatelliteSend];
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 recipient]);
        unsigned int v20 = [v19 cachedOffGridMode];

        int v23 = IMOSLoggingEnabled(v21, v22);
        if (v17 == v20)
        {
          if (v23)
          {
            uint64_t v31 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
            __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              unsigned int v33 = [v6 isPendingSatelliteSend];
              __int128 v34 = @"NO";
              if (v20) {
                int v35 = @"YES";
              }
              else {
                int v35 = @"NO";
              }
              if (v33) {
                __int128 v34 = @"YES";
              }
              *(_DWORD *)__int128 buf = 138412546;
              uint64_t v44 = v35;
              __int16 v45 = 2112;
              uint64_t v46 = v34;
              _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  "Recipient is off grid (%@) message pending satellite send (%@) agree, treating as active off grid status",  buf,  0x16u);
            }
          }

          -[MessageServiceSession didReceiveOffGridStatus:forID:messageGUID:account:]( self,  "didReceiveOffGridStatus:forID:messageGUID:account:",  v36 | v20 | v17,  v14,  v15,  v16);
        }

        else
        {
          if (v23)
          {
            uint64_t v24 = OSLogHandleForIMFoundationCategory("MessageServiceSession");
            __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              unsigned int v26 = [v6 isPendingSatelliteSend];
              id v27 = @"NO";
              if (v20) {
                __int128 v28 = @"YES";
              }
              else {
                __int128 v28 = @"NO";
              }
              if (v26) {
                id v27 = @"YES";
              }
              *(_DWORD *)__int128 buf = 138412546;
              uint64_t v44 = v28;
              __int16 v45 = 2112;
              uint64_t v46 = v27;
              _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "Recipient is off grid (%@) message pending satellite send (%@) do not match, fetching off grid mode",  buf,  0x16u);
            }
          }

          id v29 = (void *)objc_claimAutoreleasedReturnValue([v7 chat]);
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 recipient]);
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472LL;
          v37[2] = sub_7DBC8;
          v37[3] = &unk_D7AD0;
          id v38 = v14;
          uint64_t v39 = self;
          char v42 = v36;
          id v40 = v15;
          id v41 = v16;
          [v30 isOffGridModeWithCompletion:v37];
        }
      }
    }
  }
}

- (void)_handleFakeReceiptBlock:(id)a3 withContext:(id)a4 withMsg:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 chat]);
  unsigned int v11 = [v10 style];

  if (v11 == 45)
  {
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 fromURI]);
    unsigned int v28 = [v12 isEqualToString:v7];

    if (IMOSLoggingEnabled(v13, v14))
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory("MessageService");
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);
        id v18 = @"NO";
        *(_DWORD *)__int128 buf = 138412802;
        __int128 v30 = v17;
        __int16 v31 = 2112;
        if (v28) {
          id v18 = @"YES";
        }
        id v32 = v7;
        __int16 v33 = 2112;
        __int128 v34 = v18;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "Received legacy saved receipt for: %@   from: %@  from me: %@",  buf,  0x20u);
      }
    }

    if ([v9 isAudioMessage])
    {
      uint64_t v19 = 0LL;
    }

    else
    {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v9 balloonBundleID]);
      BOOL v21 = [v20 length] == 0;

      if (v21) {
        uint64_t v19 = 1LL;
      }
      else {
        uint64_t v19 = 2LL;
      }
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceSession]);
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 chat]);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 chatIdentifier]);
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate __im_iMessageDateFromTimeStamp:]( &OBJC_CLASS___NSDate,  "__im_iMessageDateFromTimeStamp:",  0LL));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 imdAccount]);
    [v22 didReceiveMessageSavedForMessageID:v23 ofType:v19 forChat:v25 fromHandle:v7 fromMe:v28 date:v26 account:v27 completionBlock:0];
  }
}

- (void)_handleIsMeToMeForMessage:(id)a3 withContext:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 messageDeliveryContext]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 messageDeliveryContext]);
  unsigned __int8 v8 = [v7 success];

  if ((v8 & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 messageDeliveryContext]);
    unsigned int v10 = [v9 error];

    if (v10 - 21 <= 1)
    {
      unsigned int v11 = objc_alloc(&OBJC_CLASS___MessageDeliveryContext);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 messageDeliveryContext]);
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 displayIDs]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 messageDeliveryContext]);
      id v14 = [v13 fromMeToMe];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 messageDeliveryContext]);
      id v16 = -[MessageDeliveryContext initWithDisplayIDs:didSucceed:error:isFromMeToMe:shouldDeactivate:isBackwardsCompatibleMessage:]( v11,  "initWithDisplayIDs:didSucceed:error:isFromMeToMe:shouldDeactivate:isBackwardsCompatibleMessage:",  v12,  1,  0,  v14,  [v15 shouldDeactivate],  objc_msgSend(v17, "backwardsCompatibleVersion"));
      [v5 setMessageDeliveryContext:v16];

LABEL_5:
    }
  }
}

- (void)_handleDeliveryFailureForMessage:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 messageDeliveryContext]);
  id v8 = [v7 success];
  int v9 = (int)v8;
  int v11 = IMOSLoggingEnabled(v8, v10);
  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("MessageService");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v55 = (void *)objc_claimAutoreleasedReturnValue([v5 guid]);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v5 body]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v56 string]);
        uint64_t v15 = MarcoLoggingStringForMessageData(v14);
        id v16 = (id)objc_claimAutoreleasedReturnValue(v15);
        id v17 = (id)objc_claimAutoreleasedReturnValue([v7 displayIDs]);
        unsigned int v18 = [v7 error];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 groupMessageContext]);
        unsigned int v20 = [v19 isGroupChat];
        unsigned int v21 = [v7 fromMeToMe];
        uint64_t v22 = @"NO";
        *(_DWORD *)__int128 buf = 138413570;
        id v59 = v55;
        if (v20) {
          int v23 = @"YES";
        }
        else {
          int v23 = @"NO";
        }
        __int16 v60 = 2112;
        id v61 = v16;
        if (v21) {
          uint64_t v22 = @"YES";
        }
        __int16 v62 = 2112;
        id v63 = v17;
        __int16 v64 = 1024;
        unsigned int v65 = v18;
        __int16 v66 = 2112;
        uint64_t v67 = v23;
        __int16 v68 = 2112;
        id v69 = v22;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "Finished sending message: (guid: %@) %@ to people: %@ error: %d is chat: %@ from me - to me: %@",  buf,  0x3Au);
      }

- (void)_handleUpdateNotificationTimeManagerForMessage:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 notificationIDSTokenURI]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 messageDeliveryContext]);
  if (![v8 success] || (objc_msgSend(v5, "isTypingMessage") & 1) != 0)
  {

    goto LABEL_4;
  }

  id v24 = [v7 length];

  if (!v24)
  {
LABEL_4:
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 messageDeliveryContext]);
    if ([v9 success])
    {
      unsigned __int8 v10 = [v5 isTypingMessage];

      if ((v10 & 1) == 0)
      {
        int v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMMessageNotificationTimeManager sharedInstance]( &OBJC_CLASS___IMMessageNotificationTimeManager,  "sharedInstance"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 chatIdentifier]);
        [v11 tearDownSessionForChatIdentifier:v13];

        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance", 0LL));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 chatIdentifier]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "allExistingSupportedServiceChatsWithIdentifier:style:",  v16,  objc_msgSend(v17, "style")));

        id v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v38;
          do
          {
            unsigned int v21 = 0LL;
            do
            {
              if (*(void *)v38 != v20) {
                objc_enumerationMutation(v18);
              }
              uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v21);
              int v23 = (void *)objc_claimAutoreleasedReturnValue([v5 guid]);
              [v22 updateLastSeenMessageGuidIfNeeded:v23];

              unsigned int v21 = (char *)v21 + 1;
            }

            while (v19 != v21);
            id v19 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
          }

          while (v19);
        }
      }
    }

    else
    {
    }

    goto LABEL_21;
  }

  if (IMOSLoggingEnabled(v25, v26))
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory("MessageService");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = (id)objc_claimAutoreleasedReturnValue([v5 guid]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 chatIdentifier]);
      *(_DWORD *)__int128 buf = 138412802;
      id v43 = v29;
      __int16 v44 = 2112;
      __int16 v45 = v7;
      __int16 v46 = 2112;
      uint64_t v47 = v31;
      _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "Successfully sent message, setting message item with guid %@ notificationIDSTokenURI %@ for chatIdentifier %@",  buf,  0x20u);
    }
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue( +[IMMessageNotificationTimeManager sharedInstance]( &OBJC_CLASS___IMMessageNotificationTimeManager,  "sharedInstance"));
  [v32 setLatestNotificationIDSTokenURI:v7];

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[IMMessageNotificationTimeManager sharedInstance]( &OBJC_CLASS___IMMessageNotificationTimeManager,  "sharedInstance"));
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 chatIdentifier]);
  [v33 setDate:v34 forChatIdentifier:v36];

LABEL_21:
}

- (void)_deactivateServiceIfNeededForContext:(id)a3
{
  id v3 = a3;
  char v4 = (void *)objc_claimAutoreleasedReturnValue([v3 messageDeliveryContext]);
  unsigned int v5 = [v4 shouldDeactivate];

  if (v5)
  {
    if (IMOSLoggingEnabled(v6, v7))
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory("MessageService");
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "*** Told to deactivate service, deactivating", buf, 2u);
      }
    }

    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "***** Request to deactivate and purge my identity", v17, 2u);
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([v3 idsAccount]);
    [v11 deactivateAndPurgeIdentify];

    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, " => Deactivating", v16, 2u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 imdAccount]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountID]);
    [v13 deactivateAccount:v15];
  }
}

- (void)_notifyDidSendMessage:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isTypingMessage])
  {
    unsigned int v8 = 1;
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
    unsigned int v8 = [v9 hasStoredMessageWithGUID:v10];
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 messageDeliveryContext]);
  unsigned int v12 = [v11 fromMeToMe] | v8;

  if (v12 == 1)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 messageDeliveryContext]);
    unsigned int v16 = [v15 success];

    if (v16)
    {
      -[MessageServiceSession _didSendMessage:withContext:forceDate:fromStorage:]( self,  "_didSendMessage:withContext:forceDate:fromStorage:",  v6,  v7,  0LL,  0LL);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 messageDeliveryContext]);
      if ([v17 fromMeToMe])
      {
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v7 groupMessageContext]);
        unsigned __int8 v19 = [v18 isGroupChat];

        if ((v19 & 1) == 0) {
          -[MessageServiceSession _handleMessageSentToSelf:withContext:isLocal:]( self,  "_handleMessageSentToSelf:withContext:isLocal:",  v6,  v7,  1LL);
        }
      }

      else
      {
      }

      if ([v6 isFinished] && (objc_msgSend(v6, "isBeingRetried") & 1) == 0)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceSession]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 guid]);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 imdAccount]);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v7 messageDeliveryContext]);
        objc_msgSend( v24,  "notifyDidSendMessageID:account:shouldNotify:",  v25,  v26,  objc_msgSend(v27, "isBackwardsCompatibleMessage") ^ 1);

        uint64_t v39 = IMMetricsCollectorAttachmentCount;
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v6 fileTransferGUIDs]);
        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v28 count]));
        __int128 v40 = v29;
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));

        id v31 = (void *)objc_claimAutoreleasedReturnValue(+[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"));
        [v31 trackEvent:IMMetricsCollectorStatisticSentMessage withDictionary:v30];
      }
    }

    else
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 messageDeliveryContext]);
      int v23 = [v22 success];

      if ((v23 & 1) == 0) {
        -[MessageServiceSession _didSendMessage:withContext:forceDate:fromStorage:]( self,  "_didSendMessage:withContext:forceDate:fromStorage:",  v6,  v7,  0LL,  0LL);
      }
    }
  }

  else if (IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("MessageService");
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v37 = 138412290;
      id v38 = v6;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "Not reflecting this to the application, this message looks like it was deleted: %@",  (uint8_t *)&v37,  0xCu);
    }
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v7 sendDate]);
  [v32 timeIntervalSinceDate:v33];
  double v35 = v34;

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
  [v7 setSendDuration:v36];
  -[MessageServiceSession _FTAWDLogForMessage:withContext:](self, "_FTAWDLogForMessage:withContext:", v6, v7);
}

- (void)_handleMessageSentToSelf:(id)a3 withContext:(id)a4 isLocal:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isFromMe])
  {
    id v9 = [v7 isTypingMessage];
    if ((v9 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v9, v10))
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory("MessageService");
        unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 chat]);
          id v14 = (id)objc_claimAutoreleasedReturnValue([v13 chatIdentifier]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 chat]);
          *(_DWORD *)__int128 buf = 138412802;
          id v22 = v7;
          __int16 v23 = 2112;
          id v24 = v14;
          __int16 v25 = 1024;
          unsigned int v26 = [v15 style];
          _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "Need to handle message sent to myself: %@   chat: %@  style: %d",  buf,  0x1Cu);
        }
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_7F2D4;
      v16[3] = &unk_D7AF8;
      id v17 = v7;
      id v18 = v8;
      BOOL v19 = a5;
      char v20 = 1;
      im_dispatch_after(v16, 2.0);
    }
  }
}

- (BOOL)_isDeviceRegisteredForAccount:(id)a3
{
  return _[a3 canSend];
}

- (BOOL)_shouldInitiateTelephonyConversationForMessage:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 groupActivity]);
  if (v3)
  {
    char v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
    unsigned __int8 v5 = [v4 isAVLessSharePlayEnabled];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)_initiateTelephonyConversationForMessage:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 onSession:(id)a6
{
  uint64_t v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v69 = a6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 groupActivity]);

  if (v11)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 existingiMessageChatForID:v10 withChatStyle:v7]);

    if (v15)
    {
      __int16 v68 = (void *)objc_claimAutoreleasedReturnValue([v15 participants]);
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "__imArrayByApplyingBlock:", &stru_D7B38));
      if ([v67 count])
      {
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "__imArrayByApplyingBlock:", &stru_D7B78));
        __int16 v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "__imSetFromArray"));

        id v20 = [v66 count];
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v15 participants]);
        id v22 = [v21 count];

        if (v20 == v22)
        {
          id v25 = [v66 count];
          id v26 = [[TUJoinConversationRequest alloc] initWithRemoteMembers:v66];
          if ((unint64_t)v25 >= 2)
          {
            uint64_t v27 = objc_alloc(&OBJC_CLASS___NSUUID);
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
            id v29 = -[NSUUID initWithUUIDString:](v27, "initWithUUIDString:", v28);
            [v26 setMessagesGroupUUID:v29];

            id v30 = (void *)objc_claimAutoreleasedReturnValue([v15 displayName]);
            [v26 setMessagesGroupName:v30];
          }

          id v31 = (void *)objc_claimAutoreleasedReturnValue( +[TUConversationInvitationPreference invitationPreferencesForAllHandlesWithStyles:]( &OBJC_CLASS___TUConversationInvitationPreference,  "invitationPreferencesForAllHandlesWithStyles:",  1LL));
          [v26 setInvitationPreferences:v31];

          id v32 = (void *)objc_claimAutoreleasedReturnValue([v9 groupActivity]);
          [v26 setActivity:v32];

          [v26 setAvMode:0];
          [v26 setPresentationMode:1];
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v15 lastAddressedLocalHandle]);
          double v34 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedHandleWithDestinationID:]( &OBJC_CLASS___TUHandle,  "normalizedHandleWithDestinationID:",  v33));
          [v26 setCallerID:v34];

          double v35 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
          [v35 launchAppForJoinRequest:v26];

          uint64_t v38 = IMOSLoggingEnabled(v36, v37);
          if ((_DWORD)v38)
          {
            uint64_t v40 = OSLogHandleForIMFoundationCategory("MessageServiceSessionSendHandler");
            id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v71 = v26;
              _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Joining conversation with request %@", buf, 0xCu);
            }
          }

          if (IMOSLoggingEnabled(v38, v39))
          {
            uint64_t v42 = OSLogHandleForIMFoundationCategory("MessageServiceSessionSendHandler");
            id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 138412290;
              id v71 = v15;
              _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "Distributing invitation message for chat %@", buf, 0xCu);
            }
          }

          __int16 v44 = (void *)objc_claimAutoreleasedReturnValue([v15 guid]);
          [v69 invitePersonInfo:&off_DB810 withMessage:0 toChatID:v44 identifier:v10 style:v7];

          if (IMOSLoggingEnabled(v45, v46))
          {
            uint64_t v47 = OSLogHandleForIMFoundationCategory("MessageServiceSessionSendHandler");
            unsigned int v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              id v49 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);
              *(_DWORD *)__int128 buf = 138412290;
              id v71 = v49;
              _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "Message %@ being marked as sent", buf, 0xCu);
            }
          }

          objc_msgSend(v9, "setFlags:", (unint64_t)objc_msgSend(v9, "flags") | 0x8000);
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v69 broadcasterForChatListeners]);
          uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v15 account]);
          id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 accountID]);
          unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue([v15 groupID]);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v15 personCentricID]);
          [v50 account:v52 chat:v10 style:v7 chatProperties:0 groupID:v53 chatPersonCentricID:v54 messageSent:v9];
        }

        else if (IMOSLoggingEnabled(v23, v24))
        {
          uint64_t v63 = OSLogHandleForIMFoundationCategory("Warning");
          __int16 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            unsigned int v65 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);
            *(_DWORD *)__int128 buf = 138412546;
            id v71 = v65;
            __int16 v72 = 2112;
            __int128 v73 = v66;
            _os_log_impl( &dword_0,  v64,  OS_LOG_TYPE_INFO,  "Failed to generate TURemoteMembers while attempting to initiate TUConversation for msg guid %@ remote members %@",  buf,  0x16u);
          }
        }
      }

      else if (IMOSLoggingEnabled(0LL, v18))
      {
        uint64_t v60 = OSLogHandleForIMFoundationCategory("Warning");
        id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          __int16 v62 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);
          *(_DWORD *)__int128 buf = 138412290;
          id v71 = v62;
          _os_log_impl( &dword_0,  v61,  OS_LOG_TYPE_INFO,  "Failed to geenrate TUHandles while attempting to initiate TUConversation for msg guid %@",  buf,  0xCu);
        }
      }
    }

    else if (IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v57 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        id v59 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);
        *(_DWORD *)__int128 buf = 138412290;
        id v71 = v59;
        _os_log_impl( &dword_0,  v58,  OS_LOG_TYPE_INFO,  "Failed to find chat while attempting to initiate TUConversation for msg guid %@",  buf,  0xCu);
      }
    }

- (id)_buildSendMessageContextWithChatIdentifier:(id)a3 withChatStyle:(unsigned __int8)a4 withServiceSession:(id)a5 withMessage:(id)a6
{
  return -[MessageServiceSession _buildSendMessageContextWithChatIdentifier:withChatStyle:withServiceSession:withMessage:destinations:]( self,  "_buildSendMessageContextWithChatIdentifier:withChatStyle:withServiceSession:withMessage:destinations:",  a3,  a4,  a5,  a6,  0LL);
}

- (id)_buildSendMessageContextWithChatIdentifier:(id)a3 withChatStyle:(unsigned __int8)a4 withServiceSession:(id)a5 withMessage:(id)a6 destinations:(id)a7
{
  unsigned __int8 v63 = a4;
  id v11 = a5;
  id v12 = a6;
  id v60 = a7;
  id v62 = a3;
  id v13 = a3;
  [v11 canonicalizeChatIdentifier:&v62 style:&v63];
  id v14 = v62;

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 chatForChatIdentifier:v14 style:v63]);
    id v61 = 0LL;
    id v59 = (void *)objc_claimAutoreleasedReturnValue( -[MessageServiceSession _setCallerIDOnMessage:onChat:withIDSAccount:withServiceSession:]( self,  "_setCallerIDOnMessage:onChat:withIDSAccount:withServiceSession:",  v12,  v15,  &v61,  v11));
    id v16 = v61;
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v11 idsServiceForIDSAccount:v16]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 accounts]);
    uint64_t v18 = IMDAccountForIDSAccount(v16, v17, v11);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(v18);

    _UpdateLastAddressedHandle(v12, v59, v15);
    -[MessageServiceSession _fixParticipantsForChat:](self, "_fixParticipantsForChat:", v15);
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v15 participants]);
    id v20 = URIsFromHandles(v19);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    id v22 = v21;
    uint64_t v23 = v22;
    if ([v12 isBeingRetried])
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v12 retryToParticipant]);
      int v26 = IMOSLoggingEnabled(v24, v25);
      if (v24)
      {
        if (v26)
        {
          uint64_t v27 = OSLogHandleForIMFoundationCategory("MessageService");
          uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 138412546;
            id v65 = v24;
            __int16 v66 = 2112;
            id v67 = v22;
            _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "Sending retry message only to participant %@, instead of %@",  buf,  0x16u);
          }
        }

        id v86 = v24;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v86, 1LL));
      }

      else
      {
        uint64_t v23 = v22;
        if (v26)
        {
          uint64_t v30 = OSLogHandleForIMFoundationCategory("MessageService");
          id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_INFO,  "Sending retry message but couldn't find retryTo participant",  buf,  2u);
          }

          uint64_t v23 = v22;
        }
      }
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
    unsigned __int8 v33 = [v32 isScheduledMessagesCoreEnabled];

    char v36 = v33 ^ 1;
    if (!v60) {
      char v36 = 1;
    }
    if ((v36 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v34, v35))
      {
        uint64_t v37 = OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412546;
          id v65 = v60;
          __int16 v66 = 2112;
          id v67 = v23;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "Sending message to participants %@ instead of %@", buf, 0x16u);
        }
      }

      id v39 = URIsFromHandles(v60);
      uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);

      uint64_t v23 = (void *)v40;
    }

    if (IMOSLoggingEnabled(v34, v35))
    {
      uint64_t v41 = OSLogHandleForIMEventCategory("MessageService");
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        uint64_t v51 = self;
        unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue([v12 body]);
        id v52 = (void *)objc_claimAutoreleasedReturnValue([v53 string]);
        uint64_t v43 = MarcoLoggingStringForMessageData(v52);
        id v54 = (id)objc_claimAutoreleasedReturnValue(v43);
        id v55 = (id)objc_claimAutoreleasedReturnValue([v12 guid]);
        id v56 = (id)objc_claimAutoreleasedReturnValue([v12 associatedMessageGUID]);
        id v50 = [v12 associatedMessageType];
        __int16 v44 = (objc_class *)objc_opt_class(v12);
        uint64_t v45 = NSStringFromClass(v44);
        id v46 = (id)objc_claimAutoreleasedReturnValue(v45);
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v12 fileTransferGUIDs]);
        *(_DWORD *)__int128 buf = 138414850;
        id v65 = v54;
        __int16 v66 = 2112;
        id v67 = v55;
        __int16 v68 = 2112;
        id v69 = v14;
        __int16 v70 = 2112;
        id v71 = v15;
        __int16 v72 = 2112;
        __int128 v73 = v59;
        __int16 v74 = 2112;
        __int128 v75 = v51;
        __int16 v76 = 2112;
        id v77 = v58;
        __int16 v78 = 2112;
        id v79 = v56;
        __int16 v80 = 2048;
        id v81 = v50;
        __int16 v82 = 2112;
        id v83 = v46;
        __int16 v84 = 2112;
        uint64_t v85 = v47;
        _os_log_impl( &dword_0,  v42,  OS_LOG_TYPE_INFO,  "send message: %@  guid: %@  to identifier: %@   chat: %@   callerURI: %@   self: %@   account: %@ associatedMe ssageGUID: %@  associatedMessageType: %lld  messageItemClass: %@ fileTransferGUID %@",  buf,  0x70u);
      }
    }

    id v29 = -[SendMessageContext initWithChat:withIMDAccount:withIDSAccount:withCallerURI:serviceSession:withIDSService:withParticipantURIs:withOriginalParticipantURIs:]( objc_alloc(&OBJC_CLASS___SendMessageContext),  "initWithChat:withIMDAccount:withIDSAccount:withCallerURI:serviceSession:withIDSService:withParticipantURIs:w ithOriginalParticipantURIs:",  v15,  v58,  v16,  v59,  v11,  v57,  v23,  v22);
    unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[SendMessageContext setSendDate:](v29, "setSendDate:", v48);
  }

  else
  {
    id v29 = 0LL;
  }

  return v29;
}

- (void)_fixParticipantsForChat:(id)a3
{
  id v15 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v15 participants]);
  id v4 = [v3 count];

  if (!v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDServiceController sharedController](&OBJC_CLASS___IMDServiceController, "sharedController"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceWithName:IMServiceNameSMS]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 accountsForService:v7]);

    if ([v8 count])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 chatIdentifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lastObject]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 existingChatWithIdentifier:v10 account:v11]);

      LODWORD(v9) = [v15 style];
      if ((_DWORD)v9 == [v12 style])
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 participants]);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 participants]);
          [v15 addParticipants:v14];
        }
      }
    }
  }

  [v15 recoverParticipantsIfNeeded];
}

- (void)_storeSentMessage:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 chatIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);
  id v11 = [v10 style];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 chat]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 account]);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MessageServiceSession;
  -[MessageServiceSession sendMessage:toChat:style:account:]( &v14,  "sendMessage:toChat:style:account:",  v7,  v9,  v11,  v13);
}

- (void)_handleScheduledMessageSendFailure:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 editedPartIndexes]);
  if ([v4 count])
  {
  }

  else
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v8 retractedPartIndexes]);
    id v6 = [v5 count];

    if (!v6)
    {
      [v8 setScheduleState:4];
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 guid]);
      +[IMDScheduledMessageCoordinator notifyPeersWithScheduledMessageUpdate:scheduleState:]( &OBJC_CLASS___IMDScheduledMessageCoordinator,  "notifyPeersWithScheduledMessageUpdate:scheduleState:",  v7,  4LL);
      goto LABEL_5;
    }
  }

  [v8 setErrorCode:0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageServiceSession deliveryController](self, "deliveryController"));
  [v7 handleScheduledMessageSendFailure:v8];
LABEL_5:
}

- (void)_startTimingMessageSend
{
}

- (void)_stopTimingMessageSend
{
}

- (void)_logCompletedMessage:(id)a3 withContext:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMPowerLog sharedInstance](&OBJC_CLASS___IMPowerLog, "sharedInstance"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v19 guid]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 fromURI]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _stripFZIDPrefix]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 groupMessageContext]);
  unsigned __int8 v7 = [v6 isGroupChat];
  if ((v7 & 1) != 0) {
    id v8 = @"Group";
  }
  else {
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 handle]);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 chat]);
  id v10 = [v9 powerLogConversationType];
  id v11 = [v19 powerLogMessageType];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 sendDuration]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v19 errorCode]));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v19 service]);
  [v18 logMessageSentWithGUID:v17 fromIdentifier:v16 toIdentifier:v8 conversationType:v10 messageType:v11 sendDuration:v12 errorCode:v13 messageProtocol:v14];

  if ((v7 & 1) == 0) {
}
  }

- (void)_FTAWDLogForMessage:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v56 = a4;
  uint64_t v69 = IMMetricsCollectorError;
  uint64_t v57 = v5;
  id v6 = +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  sub_81188((uint64_t)[v5 errorCode]));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int16 v70 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
  id v54 = [v8 mutableCopy];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"));
  [v9 trackEvent:IMMetricsCollectorEventOutgoingMessage withDictionary:v54];

  id v10 = [v57 isTypingMessage];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v56 chat]);
  unsigned int v12 = [v11 style];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v57 handle]);
  uint64_t IsEmail = IMStringIsEmail(v13);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v57 fileTransferGUIDs]);
  id v16 = [v15 count];

  if (([v57 isTypingMessage] & 1) == 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v56 sendDuration]);
    BOOL v18 = v17 == 0LL;

    if (!v18)
    {
      if (IMOSLoggingEnabled(v19, v20))
      {
        uint64_t v21 = OSLogHandleForIMEventCategory("MessageService");
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = (id)objc_claimAutoreleasedReturnValue([v56 sendDuration]);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v57 guid]);
          *(_DWORD *)__int128 buf = 138412546;
          id v66 = v23;
          __int16 v67 = 2112;
          __int16 v68 = v24;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Send Duration: %@ GUID %@", buf, 0x16u);
        }
      }
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
  unsigned __int8 v26 = [v25 wiFiActiveAndReachable];

  if ((v26 & 1) != 0)
  {
    uint64_t v27 = 2LL;
  }

  else
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance"));
    unsigned int v29 = [v28 dataActiveAndReachable];

    if (v29) {
      uint64_t v27 = 8LL;
    }
    else {
      uint64_t v27 = 1LL;
    }
  }

  BOOL v53 = v16 != 0LL;
  BOOL v30 = v12 != 45;
  v63[0] = IMMetricsCollectorFzErrorKey;
  id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v57 errorCode]));
  v64[0] = v31;
  v63[1] = IMMetricsCollectorMessageErrorKey;
  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 0LL));
  v64[1] = v32;
  void v63[2] = IMMetricsCollectorIsTypingIndicatorKey;
  unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
  void v64[2] = v33;
  v63[3] = IMMetricsCollectorIsGroupMessageKey;
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v30));
  v64[3] = v34;
  v63[4] = IMMetricsCollectorIsToPhoneNumberKey;
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", IsEmail ^ 1));
  void v64[4] = v35;
  v63[5] = IMMetricsCollectorIsToEmailKey;
  char v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", IsEmail));
  void v64[5] = v36;
  void v63[6] = IMMetricsCollectorHasAttachmentsKey;
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16 != 0LL));
  void v64[6] = v37;
  v63[7] = IMMetricsCollectorSendDurationKey;
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v56 sendDuration]);
  v64[7] = v38;
  v63[8] = IMMetricsCollectorConnectionTypeKey;
  id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v27));
  v64[8] = v39;
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  9LL));
  id v55 = [v40 mutableCopy];

  if (v53)
  {
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v57 fileTransferGUIDs]);
    id v42 = [v41 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v59;
      while (2)
      {
        for (i = 0LL; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v59 != v43) {
            objc_enumerationMutation(v41);
          }
          uint64_t v45 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)i);
          id v46 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 transferForGUID:v45]);

          unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue([v47 type]);
          if ([v48 length])
          {
            id v49 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](&OBJC_CLASS___UTType, "typeWithIdentifier:", v48));
            if (v49 && ([UTTypeImage conformsToType:v49] & 1) != 0)
            {
              id v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:isSending:]( &OBJC_CLASS___IMDAttachmentUtilities,  "shouldEnablePreviewTranscodingQualityForTransfer:isSending:",  v47,  1LL)));
              [v55 setObject:v50 forKey:IMMetricsCollectorIsAttachmentSentWithLQMEnabledKey];

              goto LABEL_26;
            }
          }
        }

        id v42 = [v41 countByEnumeratingWithState:&v58 objects:v62 count:16];
        if (v42) {
          continue;
        }
        break;
      }
    }

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain(a4);
  unsigned __int8 v7 = self;
  MessageServiceSession.calculateReachability(with:responseHandler:)(v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

@end