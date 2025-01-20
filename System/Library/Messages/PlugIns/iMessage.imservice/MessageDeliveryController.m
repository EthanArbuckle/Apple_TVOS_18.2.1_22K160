@interface MessageDeliveryController
- (BOOL)_hasRecentlyMessaged:(id)a3;
- (BOOL)_shouldSendAuxXML:(id)a3;
- (BOOL)_transferIsUserGeneratedOrEmojiSticker:(id)a3;
- (BOOL)forceBackwardsCompatibleMessageForBundleID:(id)a3;
- (BOOL)handleScheduledMessageSend:(id)a3 sentSuccessfully:(BOOL)a4 idsMessage:(id)a5 messageDictionary:(id)a6 canInlineAttachments:(BOOL)a7 msgPayloadUploadDictionary:(id)a8 fromID:(id)a9 fromAccount:(id)a10 originalIDSIdentifier:(id)a11;
- (BOOL)sendToLocalPeers:(id)a3;
- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4;
- (BOOL)shouldSendBackwardsCompatibleMessageForBundleID:(id)a3;
- (MessageDeliveryController)initWithSession:(id)a3;
- (MessageDeliveryControllerDelegate)delegate;
- (MessageServiceSession)session;
- (id)_appendFilePathsWithGUIDs:(id)a3;
- (id)_associatedMessageFallbackHashForMessageItem:(id)a3;
- (id)_chatForChatIdentifier:(id)a3;
- (id)_compressedAttributionInfoForMessage:(id)a3;
- (id)_computeRegPropertiesForNewFeatures:(id)a3 currentRegProperties:(id)a4 currentInterestingProp:(id)a5;
- (id)_copyGenmojiHEICFileToTemporaryDirectory:(id)a3;
- (id)_fallbackHashForMessageItemWithGUID:(id)a3;
- (id)_fallbackMessageItemFromLinkMetadata:(id)a3 originalMessageItem:(id)a4;
- (id)_fallbackMesssageItemByConvertingGenmojiToUnknownEmojiCharacterInOriginalMessageItem:(id)a3;
- (id)_fileTransferGUIDsInMessageBody:(id)a3;
- (id)_getQueueIdentifierFromGUID:(id)a3;
- (id)_keyTransparencyEnforcementDictionaryForChatIdentifier:(id)a3;
- (id)_nonAdaptiveFileTransferForAdaptiveImageFileTransfer:(id)a3;
- (id)_propertyForExpressiveSendStyle:(id)a3;
- (id)_receivingDevicesForHandle:(id)a3 skippedDestinations:(id)a4;
- (id)_receivingDevicesForParticipants:(id)a3 skippedDestinations:(id)a4;
- (id)_replicationSourceIDForSending;
- (id)_threadOriginatorFallbackHashForMessageItem:(id)a3;
- (id)_updateSuccessfulEditsForScheduledMessage:(id)a3;
- (id)_updateSuccessfulRetractionsForScheduledMessage:(id)a3;
- (id)activeDeviceForHandle:(id)a3;
- (id)attachmentController;
- (id)groupController;
- (id)idsDeviceForFromID:(id)a3;
- (id)idsDeviceFromPushToken:(id)a3;
- (id)idsOptionsWithMessageItem:(id)a3 toID:(id)a4 fromID:(id)a5 sendGUIDData:(id)a6 alternateCallbackID:(id)a7 isBusinessMessage:(BOOL)a8 chatIdentifier:(id)a9 requiredRegProperties:(id)value interestingRegProperties:(id)a11 requiresLackOfRegProperties:(id)a12 deliveryContext:(id)a13 isGroupChat:(BOOL)a14 canInlineAttachments:(BOOL)a15 msgPayloadUploadDictionary:(id)a16 messageDictionary:(id)a17;
- (id)localDevice;
- (id)messageDictionaryWithMessageItem:(id)a3 isBusiness:(BOOL)a4 chatIdentifier:(id)a5 toParticipants:(id)a6 originallyToParticipants:(id)a7 additionalContext:(id)a8 msgPayloadUploadDictionary:(id)a9 originalPayload:(id)a10;
- (id)messageStore;
- (id)pairedDevice;
- (void)_addIdentifierToPendingTimestampUpdateMap:(id)a3 alternateCallbackId:(id)a4;
- (void)_appendMyNicknameToMessageDictionary:(id)a3 forMessage:(id)a4 chat:(id)a5;
- (void)_appendOffGridAvailabilityPropertiesToMessageDictionary:(id)a3 participantHandleID:(id)a4;
- (void)_appendRecipientAvailabilityVerificationInfoToMessageDictionary:(id)a3 forChat:(id)a4;
- (void)_appendRecipientNicknameTruncatedRecordIDToMessageDictionary:(id)a3 forChat:(id)a4;
- (void)_appendSeenOffGridStatusToMessageDictionary:(id)a3 forChat:(id)a4;
- (void)_checkStickerRepositioningMetadata:(id)a3;
- (void)_enqueueSendMessageWorkBlock:(id)a3 forURIs:(id)a4;
- (void)_enqueueUpdateBlock:(id)a3 willSendBlock:(id)a4 identifier:(id)a5 callbackID:(id)a6 messageCommandOption:(id)a7;
- (void)_sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 fromID:(id)a7 recipients:(id)a8 uploadStartTime:(id)a9 fromAccount:(id)a10 completionBlock:(id)a11;
- (void)_sendBackwardCompatibilityMessageForEditedMessage:(id)a3 usingMessageGUID:(id)a4 toBackwardCompatabilityDestinations:(id)a5 withOriginalDestinations:(id)a6 chatIdentifier:(id)a7 fromAccount:(id)a8 fromID:(id)a9 backwardCompatabilityText:(id)a10 completionBlock:(id)a11;
- (void)_sendIDSMessageWithTransferGUID:(id)a3 andTransfer:(id)a4 fromAccount:(id)a5 fromID:(id)a6 toRecipient:(id)a7 withCompletion:(id)a8;
- (void)_sendMessage:(id)a3 context:(id)a4 deliveryContext:(id)a5 fromID:(id)a6 fromAccount:(id)a7 toID:(id)a8 chatIdentifier:(id)a9 toSessionToken:(id)a10 toGroup:(id)a11 toParticipants:(id)a12 originallyToParticipants:(id)a13 requiredRegProperties:(id)a14 interestingRegProperties:(id)a15 requiresLackOfRegProperties:(id)a16 canInlineAttachments:(BOOL)a17 type:(int64_t)a18 msgPayloadUploadDictionary:(id)a19 originalPayload:(id)a20 replyToMessageGUID:(id)a21 willSendBlock:(id)a22 completionBlock:(id)a23;
- (void)_sendNicknameToRecipientsIfNeededForChat:(id)a3 forMessage:(id)a4;
- (void)_setReplyToGUIDForMessage:(id)a3 messageDictionary:(id)a4;
- (void)_updateIDSServiceForTesting:(id)a3;
- (void)_updateTimeStampForMessageIdentifierIfNeeded:(id)a3 pendingTimeStampUpdateIdentifier:(id)a4 alternateCallbackID:(id)a5 messageContext:(id)a6;
- (void)appendChatRelatedPropertiesToMessageDictionary:(id)a3 forMessage:(id)a4 chatIdentifier:(id)a5;
- (void)cancelScheduledMessageWithGUID:(id)a3 fromID:(id)a4;
- (void)cancelScheduledMessageWithGUID:(id)a3 fromID:(id)a4 destinations:(id)a5 cancelType:(unint64_t)a6;
- (void)dealloc;
- (void)failMessageSendWithMessageDictionary:(id)a3 URIs:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)handleScheduledMessageSendFailure:(id)a3;
- (void)noteRecentMessageForPeople:(id)a3;
- (void)sendBubblePayloadMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 completionBlock:(id)a10;
- (void)sendCloseSessionMessageDictionary:(id)a3 toBusinessURI:(id)a4 fromURI:(id)a5 fromAccount:(id)a6 completionBlock:(id)a7;
- (void)sendEditedMessage:(id)a3 partIndex:(int64_t)a4 editType:(unint64_t)a5 destinations:(id)a6 chatIdentifier:(id)a7 account:(id)a8 fromID:(id)a9 backwardCompatabilityText:(id)a10 unsupportedDestinationsHandler:(id)a11 completionBlock:(id)a12;
- (void)sendLogDumpMessageAtFilePath:(id)a3 fromAccount:(id)a4 fromID:(id)a5 toRecipient:(id)a6 shouldDeleteFile:(BOOL)a7 withCompletion:(id)a8;
- (void)sendMessage:(id)a3 context:(id)a4 groupContext:(id)a5 toGroup:(id)a6 toParticipants:(id)a7 originallyToParticipants:(id)a8 fromID:(id)a9 fromAccount:(id)a10 chatIdentifier:(id)a11 originalPayload:(id)a12 replyToMessageGUID:(id)a13 fakeSavedReceiptBlock:(id)a14 completionBlock:(id)a15;
- (void)sendMessageDictionary:(id)a3 encryptDictionary:(BOOL)a4 fromID:(id)a5 fromAccount:(id)a6 toURIs:(id)a7 toGroup:(id)a8 priority:(int64_t)a9 options:(id)a10 willSendBlock:(id)a11 callCompletionOnSuccess:(BOOL)a12 completionBlock:(id)a13;
- (void)sendMessageDictionary:(id)a3 encryptDictionary:(BOOL)a4 fromID:(id)a5 fromAccount:(id)a6 toURIs:(id)a7 toGroup:(id)a8 priority:(int64_t)a9 options:(id)a10 willSendBlock:(id)a11 completionBlock:(id)a12;
- (void)sendMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 completionBlock:(id)a10;
- (void)sendMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 willSendBlock:(id)a10 completionBlock:(id)a11;
- (void)sendMessageError:(int64_t)a3 toToken:(id)a4 toID:(id)a5 toGroup:(id)a6 fromID:(id)a7 fromAccount:(id)a8 forMessageID:(id)a9 completionBlock:(id)a10;
- (void)sendMessageErrorWithInfo:(int64_t)a3 toToken:(id)a4 toID:(id)a5 toGroup:(id)a6 fromID:(id)a7 fromAccount:(id)a8 forMessageID:(id)a9 additionalInfo:(id)a10 fileSize:(id)value failureTimeSeconds:(double)a12 failReasonMessage:(id)a13 completionBlock:(id)a14;
- (void)sendRepositionedStickerMetadata:(id)a3 forEditedMessage:(id)a4 destinations:(id)a5 account:(id)a6 fromID:(id)a7 completionBlock:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 alternateCallbackID:(id)a6 willSendToDestinations:(id)a7 skippedDestinations:(id)a8 registrationPropertyToDestinations:(id)a9;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 messageIdentifier:(id)a5 alternateCallbackID:(id)a6 updatedWithResponseCode:(int64_t)a7 error:(id)a8 lastCall:(BOOL)a9 messageContext:(id)a10;
- (void)service:(id)a3 didCancelMessageWithSuccess:(BOOL)a4 error:(id)a5 identifier:(id)a6;
- (void)service:(id)a3 didFlushCacheForKTPeerURI:(id)a4;
- (void)service:(id)a3 didFlushCacheForRemoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6;
- (void)setDelegate:(id)a3;
- (void)updateLatestActiveDestination:(id)a3 ForHandle:(id)a4 incomingType:(unsigned __int8)a5;
@end

@implementation MessageDeliveryController

- (MessageDeliveryController)initWithSession:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MessageDeliveryController;
  v4 = -[MessageDeliveryController init](&v11, "init");
  if (v4)
  {
    unsigned int v5 = objc_msgSend( +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"),  "manuallyAckMessagesEnabled");
    v6 = objc_alloc(&OBJC_CLASS___IDSService);
    if (v5) {
      v7 = -[IDSService initWithService:manuallyAckMessages:]( v6,  "initWithService:manuallyAckMessages:",  IDSServiceNameiMessage,  1LL);
    }
    else {
      v7 = -[IDSService initWithService:](v6, "initWithService:", IDSServiceNameiMessage);
    }
    v4->_idsService = v7;
    -[IDSService addDelegate:queue:](v7, "addDelegate:queue:", v4, &_dispatch_main_q);
    v8 = objc_alloc(&OBJC_CLASS___IDSService);
    v9 = -[IDSService initWithService:](v8, "initWithService:", IDSServiceNameiMessageForBusiness);
    v4->_idsBizService = v9;
    -[IDSService addDelegate:queue:](v9, "addDelegate:queue:", v4, &_dispatch_main_q);
    objc_storeWeak((id *)&v4->_session, a3);
  }

  return v4;
}

- (id)_keyTransparencyEnforcementDictionaryForChatIdentifier:(id)a3
{
  id v4 = -[IDSService serviceIdentifier](self->_idsService, "serviceIdentifier");
  if ([v4 isEqualToString:IDSServiceNameiMessage]) {
    return _objc_msgSend( -[IMDChatRegistry existingSMSChatForID:]( +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance"),  "existingSMSChatForID:",  a3),  "keyTransparencyURIToUUIDMapping");
  }
  else {
    return 0LL;
  }
}

- (void)dealloc
{
  -[IDSService removeDelegate:](self->_idsBizService, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MessageDeliveryController;
  -[MessageDeliveryController dealloc](&v3, "dealloc");
}

- (id)attachmentController
{
  return -[MessageServiceSession attachmentController]( -[MessageDeliveryController session](self, "session"),  "attachmentController");
}

- (id)groupController
{
  return -[MessageServiceSession groupController]( -[MessageDeliveryController session](self, "session"),  "groupController");
}

- (id)messageStore
{
  return +[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance");
}

- (void)_updateTimeStampForMessageIdentifierIfNeeded:(id)a3 pendingTimeStampUpdateIdentifier:(id)a4 alternateCallbackID:(id)a5 messageContext:(id)a6
{
  if ([a6 serverReceivedTime]
    && [a4 length]
    && [a4 isEqualToString:a3])
  {
    id v11 = objc_msgSend(-[MessageDeliveryController messageStore](self, "messageStore"), "messageWithGUID:", a3);
    id v12 = [v11 messageSummaryInfo];
    uint64_t v13 = IMMessageSummaryInfoUpdatedDateWithServerTime;
    unsigned int v14 = objc_msgSend( objc_msgSend(v12, "objectForKey:", IMMessageSummaryInfoUpdatedDateWithServerTime),  "BOOLValue");
    id v15 = [v11 messageSummaryInfo];
    id v16 = objc_msgSend(objc_msgSend(v15, "objectForKey:", IMMessageSummaryInfoHasBeenRetried), "BOOLValue");
    int v18 = (int)v16;
    if (!v11 || (v14 & 1) != 0 || (v16 & 1) != 0 || (id v16 = [v11 scheduleType]) != 0)
    {
      if (IMOSLoggingEnabled(v16, v17))
      {
        v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = [v11 scheduleType];
          v21 = @"NO";
          int v28 = 138413058;
          id v29 = a3;
          if (v18) {
            v22 = @"YES";
          }
          else {
            v22 = @"NO";
          }
          __int16 v30 = 2112;
          if (v14) {
            v21 = @"YES";
          }
          v31 = v21;
          __int16 v32 = 2112;
          id v33 = (id)v22;
          __int16 v34 = 2048;
          id v35 = v20;
          _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "We already updated the time on message %@ with a server time (%@) or this message has been retried (%@) or t his is a future scheduled message (%lu) -- skipping server time update",  (uint8_t *)&v28,  0x2Au);
        }
      }
    }

    else
    {
      if (IMOSLoggingEnabled(0LL, v17))
      {
        v23 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(objc_msgSend(v11, "time"), "timeIntervalSinceReferenceDate");
          v25 = v24;
          objc_msgSend(objc_msgSend(a6, "serverReceivedTime"), "timeIntervalSinceReferenceDate");
          int v28 = 134218498;
          id v29 = v25;
          __int16 v30 = 2048;
          v31 = v26;
          __int16 v32 = 2112;
          id v33 = a3;
          _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_INFO,  "Going to update message time from: %f to: %f for identifier: %@",  (uint8_t *)&v28,  0x20u);
        }
      }

      CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)objc_msgSend(objc_msgSend(v11, "messageSummaryInfo"), "mutableCopy");
      if (!Mutable) {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      -[__CFDictionary setObject:forKey:]( Mutable,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  v13);
      objc_msgSend(v11, "setTime:", objc_msgSend(a6, "serverReceivedTime"));
      [v11 setMessageSummaryInfo:Mutable];

      objc_msgSend( -[MessageDeliveryController messageStore](self, "messageStore"),  "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:",  v11,  1,  0,  0,  objc_msgSend(v11, "flags"));
      -[MessageDeliveryControllerDelegate messageDeliveryController:serverUpdatedTimestampMessage:]( -[MessageDeliveryController delegate](self, "delegate"),  "messageDeliveryController:serverUpdatedTimestampMessage:",  self,  v11);
      -[NSMutableDictionary removeObjectForKey:](self->_pendingTimestampUpdate, "removeObjectForKey:", a5);
    }
  }

- (void)service:(id)a3 didFlushCacheForRemoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6
{
  if (IMOSLoggingEnabled(self, a2))
  {
    id v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138413058;
      id v13 = a4;
      __int16 v14 = 2112;
      id v15 = a5;
      __int16 v16 = 2112;
      id v17 = a6;
      __int16 v18 = 2112;
      v19 = -[MessageDeliveryController delegate](self, "delegate");
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "Received flushed cached message from %@ to %@ guid %@ delegate %@",  (uint8_t *)&v12,  0x2Au);
    }
  }

  -[MessageDeliveryControllerDelegate messageDeliveryController:service:didFlushCacheForRemoteURI:fromURI:guid:]( -[MessageDeliveryController delegate](self, "delegate"),  "messageDeliveryController:service:didFlushCacheForRemoteURI:fromURI:guid:",  self,  a3,  a4,  a5,  a6);
}

- (void)service:(id)a3 didFlushCacheForKTPeerURI:(id)a4
{
  if (IMOSLoggingEnabled(self, a2))
  {
    v7 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = a4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Received flushed cache for KT Peer URI %@", (uint8_t *)&v8, 0xCu);
    }
  }

  -[MessageDeliveryControllerDelegate messageDeliveryController:service:didFlushCacheForKTPeerURI:]( -[MessageDeliveryController delegate](self, "delegate"),  "messageDeliveryController:service:didFlushCacheForKTPeerURI:",  self,  a3,  a4);
}

- (void)service:(id)a3 account:(id)a4 messageIdentifier:(id)a5 alternateCallbackID:(id)a6 updatedWithResponseCode:(int64_t)a7 error:(id)a8 lastCall:(BOOL)a9 messageContext:(id)a10
{
  if (a5)
  {
    id v15 = objc_msgSend(a6, "length", a3, a4);
    if (v15)
    {
      id v15 = -[NSMutableDictionary objectForKey:](self->_pendingTimestampUpdate, "objectForKey:", a6);
      id v17 = v15;
    }

    else
    {
      id v17 = 0LL;
    }

    if (IMOSLoggingEnabled(v15, v16))
    {
      __int16 v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = @"NO";
        if (a9) {
          v19 = @"YES";
        }
        objc_msgSend(objc_msgSend(a10, "serverReceivedTime", v19), "timeIntervalSinceReferenceDate");
        *(_DWORD *)buf = 134219522;
        int64_t v40 = a7;
        __int16 v41 = 2112;
        id v42 = a5;
        __int16 v43 = 2112;
        id v44 = a6;
        __int16 v45 = 2112;
        id v46 = a8;
        __int16 v47 = 2112;
        uint64_t v48 = v36;
        __int16 v49 = 2112;
        v50 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
        __int16 v51 = 2112;
        id v52 = v17;
        _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Received responseCode %ld for IDS identifier %@ callbackID %@ error %@ lastCall? %@  messageContext serverRece ivedTime: %@ _pendingTimestampUpdate contains identifier: %@",  buf,  0x48u);
      }
    }

    id v20 = -[NSMutableDictionary objectForKey:](self->_pendingSends, "objectForKey:", a5);
    if ([v20 count])
    {
      -[MessageDeliveryController _updateTimeStampForMessageIdentifierIfNeeded:pendingTimeStampUpdateIdentifier:alternateCallbackID:messageContext:]( self,  "_updateTimeStampForMessageIdentifierIfNeeded:pendingTimeStampUpdateIdentifier:alternateCallbackID:messageContext:",  a5,  v17,  a6,  a10);
      uint64_t v22 = sub_7A070(a7, a8);
      uint64_t v23 = v22;
      if (a6)
      {
        v24 = (void (**)(id, void))[v20 objectForKey:a6];
        if (v24) {
          v24[2](v24, v23);
        }
        if (a9)
        {
          [v20 removeObjectForKey:a6];
          if (![v20 count])
          {
            -[NSMutableDictionary removeObjectForKey:](self->_pendingSends, "removeObjectForKey:", a5);
            if (!-[NSMutableDictionary count](self->_pendingSends, "count"))
            {

              self->_pendingSends = 0LL;
            }
          }

          id v25 = -[NSMutableDictionary objectForKey:](self->_pendingWillSendBlocks, "objectForKey:", a5);
          if ([v25 objectForKey:a6])
          {
            [v25 removeObjectForKey:a6];
            id v26 = [v25 count];
            if (!v26)
            {
              -[NSMutableDictionary removeObjectForKey:](self->_pendingWillSendBlocks, "removeObjectForKey:", a5);
              id v26 = -[NSMutableDictionary count](self->_pendingWillSendBlocks, "count");
              if (!v26)
              {

                self->_pendingWillSendBlocks = 0LL;
              }
            }

            if ((_DWORD)v23 && IMOSLoggingEnabled(v26, v27))
            {
              int v28 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                int64_t v40 = (int64_t)a5;
                _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "Delivery got lastCall update for %@ without having gotten a willSend update.",  buf,  0xCu);
              }
            }
          }

          -[NSMutableDictionary removeObjectForKey:](self->_pendingTimestampUpdate, "removeObjectForKey:", a6);
          if (!-[NSMutableDictionary count](self->_pendingTimestampUpdate, "count"))
          {
            pendingTimestampUpdate = self->_pendingTimestampUpdate;
            p_pendingTimestampUpdate = &self->_pendingTimestampUpdate;

LABEL_39:
            *p_pendingTimestampUpdate = 0LL;
          }
        }
      }

      else
      {
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_37754;
        v37[3] = &unk_D62F8;
        int v38 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v37];
        if (a9)
        {
          id v32 = objc_msgSend( -[NSMutableDictionary objectForKey:](self->_pendingWillSendBlocks, "objectForKey:", a5),  "count");
          if (v32)
          {
            if ((_DWORD)v23)
            {
              if (IMOSLoggingEnabled(v32, v33))
              {
                __int16 v34 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  int64_t v40 = (int64_t)a5;
                  _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "Delivery got lastCall update for %@ without having gotten a willSend update.",  buf,  0xCu);
                }
              }
            }
          }

          -[NSMutableDictionary removeObjectForKey:](self->_pendingWillSendBlocks, "removeObjectForKey:", a5);
          if (!-[NSMutableDictionary count](self->_pendingWillSendBlocks, "count"))
          {
            pendingWillSendBlocks = self->_pendingWillSendBlocks;
            p_pendingTimestampUpdate = &self->_pendingWillSendBlocks;

            goto LABEL_39;
          }
        }
      }
    }

    else if (IMOSLoggingEnabled(0LL, v21))
    {
      v31 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v40 = (int64_t)a5;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "No pending sends for identifier %@", buf, 0xCu);
      }
    }
  }

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 alternateCallbackID:(id)a6 willSendToDestinations:(id)a7 skippedDestinations:(id)a8 registrationPropertyToDestinations:(id)a9
{
  if (a5)
  {
    if (IMOSLoggingEnabled(self, a2))
    {
      __int16 v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v19 = 138413314;
        id v20 = a5;
        __int16 v21 = 2112;
        id v22 = a6;
        __int16 v23 = 2112;
        id v24 = a7;
        __int16 v25 = 2112;
        id v26 = a8;
        __int16 v27 = 2112;
        id v28 = a9;
        _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "Received %@ callbackID %@ willSendTo %@ skipped %@ propertyMap %@",  (uint8_t *)&v19,  0x34u);
      }
    }

    id v15 = -[NSMutableDictionary objectForKey:](self->_pendingWillSendBlocks, "objectForKey:", a5);
    if ([v15 count])
    {
      if (a6)
      {
        id v17 = (void (**)(id, id, id, id))[v15 objectForKey:a6];
        if (v17) {
          v17[2](v17, a7, a8, a9);
        }
        [v15 removeObjectForKey:a6];
        if (![v15 count])
        {
          -[NSMutableDictionary removeObjectForKey:](self->_pendingWillSendBlocks, "removeObjectForKey:", a5);
          if (!-[NSMutableDictionary count](self->_pendingWillSendBlocks, "count"))
          {

            self->_pendingWillSendBlocks = 0LL;
          }
        }
      }
    }

    else if (IMOSLoggingEnabled(0LL, v16))
    {
      __int16 v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        id v20 = a5;
        _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "No pending will send blocks for identifier %@",  (uint8_t *)&v19,  0xCu);
      }
    }
  }

- (void)_enqueueUpdateBlock:(id)a3 willSendBlock:(id)a4 identifier:(id)a5 callbackID:(id)a6 messageCommandOption:(id)a7
{
  if (a5 && a6)
  {
    if (a7 && [a7 integerValue] == &stru_20.flags)
    {
      if (IMOSLoggingEnabled(100LL, v12))
      {
        id v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412546;
          id v26 = a5;
          __int16 v27 = 2112;
          id v28 = a6;
          _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "We have a command 100 we need to update the timestamp for identifier: %@ alternateCallbackID: %@",  (uint8_t *)&v25,  0x16u);
        }
      }

      pendingTimestampUpdate = self->_pendingTimestampUpdate;
      if (!pendingTimestampUpdate)
      {
        pendingTimestampUpdate = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        self->_pendingTimestampUpdate = pendingTimestampUpdate;
      }

      id v15 = -[NSMutableDictionary objectForKey:](pendingTimestampUpdate, "objectForKey:", a6);
      if (v15)
      {
        if (IMOSLoggingEnabled(v15, v16))
        {
          id v17 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v25 = 138412546;
            id v26 = a5;
            __int16 v27 = 2112;
            id v28 = a6;
            _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "We already have identifier (%@) to update the timestamp for callbackID (%@)",  (uint8_t *)&v25,  0x16u);
          }
        }
      }

      -[NSMutableDictionary setObject:forKey:](self->_pendingTimestampUpdate, "setObject:forKey:", a5, a6);
    }

    __int16 v18 = _Block_copy(a3);
    int v19 = _Block_copy(a4);
    if (v18)
    {
      pendingSends = self->_pendingSends;
      if (!pendingSends)
      {
        pendingSends = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        self->_pendingSends = pendingSends;
      }

      __int16 v21 = (NSMutableDictionary *)-[NSMutableDictionary objectForKey:](pendingSends, "objectForKey:", a5);
      if (!v21)
      {
        __int16 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        if (v21)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_pendingSends, a5, v21);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_8F7F4();
          }
          __int16 v21 = 0LL;
        }
      }

      CFDictionarySetValue((CFMutableDictionaryRef)v21, a6, v18);
    }

    if (v19)
    {
      pendingWillSendBlocks = self->_pendingWillSendBlocks;
      if (!pendingWillSendBlocks)
      {
        pendingWillSendBlocks = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        self->_pendingWillSendBlocks = pendingWillSendBlocks;
      }

      id v24 = (NSMutableDictionary *)-[NSMutableDictionary objectForKey:](pendingWillSendBlocks, "objectForKey:", a5);
      if (!v24)
      {
        id v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        if (v24)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_pendingWillSendBlocks, a5, v24);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_8F780();
          }
          id v24 = 0LL;
        }
      }

      CFDictionarySetValue((CFMutableDictionaryRef)v24, a6, v19);
    }
  }

  else if (IMOSLoggingEnabled(self, a2))
  {
    id v22 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412546;
      id v26 = a5;
      __int16 v27 = 2112;
      id v28 = a6;
      _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "Nil identifier %@ or callbackID %@ passed into _enqueueUpdateBlock -- we won't be able to process IDS send feedback!",  (uint8_t *)&v25,  0x16u);
    }
  }

- (id)messageDictionaryWithMessageItem:(id)a3 isBusiness:(BOOL)a4 chatIdentifier:(id)a5 toParticipants:(id)a6 originallyToParticipants:(id)a7 additionalContext:(id)a8 msgPayloadUploadDictionary:(id)a9 originalPayload:(id)a10
{
  BOOL value = a4;
  if (IMOSLoggingEnabled(self, a2))
  {
    __int16 v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v132 = a3;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Creating message dictionary for message item: %@", buf, 0xCu);
    }
  }

  if (a3)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ((([a3 isAudioMessage] & 1) != 0
       || objc_msgSend(objc_msgSend(a3, "balloonBundleID"), "length"))
      && ([a3 isFinished] & 1) == 0)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v15, @"u", &__kCFBooleanTrue);
    }

    -[MessageDeliveryController _setReplyToGUIDForMessage:messageDictionary:]( self,  "_setReplyToGUIDForMessage:messageDictionary:",  a3,  v15);
    id v16 = [a3 threadIdentifier];
    if (v16)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v15, @"tg", v16);
      if (-[MessageServiceSession isReplicating]( -[MessageDeliveryController session](self, "session"),  "isReplicating"))
      {
        id v17 = -[MessageDeliveryController _threadOriginatorFallbackHashForMessageItem:]( self,  "_threadOriginatorFallbackHashForMessageItem:",  a3);
        int v19 = v17;
        if (v17) {
          CFDictionarySetValue((CFMutableDictionaryRef)v15, @"tgf", v17);
        }
        if (IMOSLoggingEnabled(v17, v18))
        {
          id v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = [v19 length];
            *(_DWORD *)buf = 134217984;
            id v132 = v21;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "setThreadOriginatorFallbackHash: len %llu", buf, 0xCu);
          }
        }
      }
    }

    if (objc_msgSend(a3, "associatedMessageGUID", v16))
    {
      id v22 = [a3 associatedMessageGUID];
      if (v22) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"amk", v22);
      }
      if (IMOSLoggingEnabled(v22, v23))
      {
        id v24 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = [a3 associatedMessageGUID];
          *(_DWORD *)buf = 138412290;
          id v132 = v25;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "setAssociatedMessageGUID: %@", buf, 0xCu);
        }
      }

      if (-[MessageServiceSession isReplicating]( -[MessageDeliveryController session](self, "session"),  "isReplicating"))
      {
        id v26 = -[MessageDeliveryController _associatedMessageFallbackHashForMessageItem:]( self,  "_associatedMessageFallbackHashForMessageItem:",  a3);
        id v28 = v26;
        if (v26) {
          CFDictionarySetValue((CFMutableDictionaryRef)v15, @"amf", v26);
        }
        if (IMOSLoggingEnabled(v26, v27))
        {
          id v29 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v30 = [v28 length];
            *(_DWORD *)buf = 134217984;
            id v132 = v30;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "setAssociatedMessageFallbackHash: len %llu", buf, 0xCu);
          }
        }
      }
    }

    if ([a3 associatedMessageType])
    {
      v31 = +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [a3 associatedMessageType]);
      if (v31) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"amt", v31);
      }
      if (IMOSLoggingEnabled(v31, v32))
      {
        uint64_t v33 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          id v34 = [a3 associatedMessageType];
          *(_DWORD *)buf = 134217984;
          id v132 = v34;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "setAssociatedMessageType: %lld", buf, 0xCu);
        }
      }
    }

    id v35 = [a3 associatedMessageRange];
    NSUInteger v37 = v36;
    if (v36 && !value)
    {
      NSUInteger v38 = (NSUInteger)v35;
      v39 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v35);
      if (v39) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"amrlc", v39);
      }
      int64_t v40 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v37);
      if (v40) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"amrln", v40);
      }
      if (IMOSLoggingEnabled(v40, v41))
      {
        id v42 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v135.location = v38;
          v135.length = v37;
          __int16 v43 = NSStringFromRange(v135);
          *(_DWORD *)buf = 138412290;
          id v132 = v43;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "setAssociatedMessageRange: %@", buf, 0xCu);
        }
      }
    }

    if ([a3 associatedMessageEmoji])
    {
      id v44 = [a3 associatedMessageEmoji];
      if (v44) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"ame", v44);
      }
      if (IMOSLoggingEnabled(v44, v45))
      {
        id v46 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "setAssociatedMessageEmoji", buf, 2u);
        }
      }
    }

    id v47 = [a3 messageSummaryInfoForSending];
    if ([v47 count])
    {
      uint64_t v48 = +[NSData dataWithMessageSummaryInfoDictionary:]( &OBJC_CLASS___NSData,  "dataWithMessageSummaryInfoDictionary:",  v47);
      if (v48) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"msi", v48);
      }
    }

    if (objc_msgSend(objc_msgSend(a3, "balloonBundleID", v48), "length"))
    {
      id v49 = [a3 balloonBundleID];
      if (v49) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"bid", v49);
      }
      if (IMOSLoggingEnabled(v49, v50))
      {
        __int16 v51 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          id v52 = [a3 balloonBundleID];
          *(_DWORD *)buf = 138412290;
          id v132 = v52;
          _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Set balloonBundleID: %@", buf, 0xCu);
        }
      }
    }

    if (objc_msgSend(objc_msgSend(a3, "expressiveSendStyleID"), "length"))
    {
      id v53 = [a3 expressiveSendStyleID];
      if (v53) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"iid", v53);
      }
      if (IMOSLoggingEnabled(v53, v54))
      {
        v55 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          id v56 = [a3 expressiveSendStyleID];
          *(_DWORD *)buf = 138412290;
          id v132 = v56;
          _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "Set expressiveSendStyleID: %@", buf, 0xCu);
        }
      }
    }

    if (objc_msgSend(objc_msgSend(a3, "typingIndicatorIcon"), "length"))
    {
      id v57 = objc_msgSend(objc_msgSend(a3, "typingIndicatorIcon"), "_FTCopyGzippedData");
      if (v57) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"tic", v57);
      }

      if (IMOSLoggingEnabled(v58, v59))
      {
        v60 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          id v61 = [a3 guid];
          *(_DWORD *)buf = 138412290;
          id v132 = v61;
          _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "Set typing indicator data for guid %@", buf, 0xCu);
        }
      }
    }

    id v62 = -[MessageDeliveryController _compressedAttributionInfoForMessage:]( self,  "_compressedAttributionInfoForMessage:",  a3);
    v64 = v62;
    if (v62)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v15, @"ati", v62);
      if (IMOSLoggingEnabled(v65, v66))
      {
        v67 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          id v68 = [v64 length];
          id v69 = [a3 guid];
          *(_DWORD *)buf = 134218242;
          id v132 = v68;
          __int16 v133 = 2112;
          id v134 = v69;
          _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "set attribution info data (%tu bytes) for guid %@", buf, 0x16u);
        }
      }
    }

    if (!a7) {
      a7 = a6;
    }
    if (IMOSLoggingEnabled(v62, v63))
    {
      v70 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v132 = a7;
        _os_log_impl(&dword_0, v70, OS_LOG_TYPE_INFO, "participants: %@", buf, 0xCu);
      }
    }

    unsigned int v71 = -[MessageDeliveryController _shouldSendAuxXML:](self, "_shouldSendAuxXML:", a3);
    id v72 = [a3 isTypingMessage];
    if ((v72 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v72, v73))
      {
        v74 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          v75 = @"NO";
          if (v71) {
            v75 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          id v132 = (id)v75;
          _os_log_impl(&dword_0, v74, OS_LOG_TYPE_INFO, "sendAuxXMLVersion: %@", buf, 0xCu);
        }
      }
    }

    if ([a3 isFinished])
    {
      v76 = -[SuperToMessageParserContext initWithAttributedString:includeMessageParts:isAudioMessage:]( [SuperToMessageParserContext alloc],  "initWithAttributedString:includeMessageParts:isAudioMessage:",  [a3 body],  objc_msgSend(a3, "shouldSendPartIndexesInMessageBody"),  objc_msgSend(a3, "isAudioMessage"));
      -[IMAttributedStringParser parseContext:]( +[IMAttributedStringParser sharedInstance](&OBJC_CLASS___IMAttributedStringParser, "sharedInstance"),  "parseContext:",  v76);
      id v77 = objc_msgSend(objc_msgSend(a3, "body"), "string");
      if (-[SuperToMessageParserContext isSimpleString](v76, "isSimpleString"))
      {
        int v78 = 0;
      }

      else
      {
        if (objc_msgSend(objc_msgSend(a3, "body"), "length")) {
          BOOL v79 = v77 == 0LL;
        }
        else {
          BOOL v79 = 1;
        }
        int v78 = !v79;
      }

      v80 = -[SuperToMessageParserContext outHTML](v76, "outHTML");
      v81 = -[SuperToMessageParserContext AuxHTML](v76, "AuxHTML");
      if (@"1") {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"v", @"1");
      }
      id v82 = -[MessageDeliveryController _replicationSourceIDForSending](self, "_replicationSourceIDForSending");
      if (v82) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"rp", v82);
      }
      if (v80) {
        int v83 = v78;
      }
      else {
        int v83 = 0;
      }
      if (v83 == 1) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"x", v80);
      }
      if (v81) {
        unsigned int v84 = v71;
      }
      else {
        unsigned int v84 = 0;
      }
      if (v84 == 1) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"ix", v81);
      }
      if (v77) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"t", v77);
      }
      id v85 = [a3 subject];
      if (v85) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"s", v85);
      }
      if (a7) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"p", a7);
      }
    }

    if ((([a3 isTypingMessage] | value) & 1) == 0)
    {
      id v86 = [a3 contactsAvatarRecipeData];
      if (v86)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"sld", v86);
        if (IMOSLoggingEnabled(v87, v88))
        {
          v89 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v89, OS_LOG_TYPE_INFO, "set avatar likeness", buf, 2u);
          }
        }
      }

      -[MessageDeliveryController _sendNicknameToRecipientsIfNeededForChat:forMessage:]( self,  "_sendNicknameToRecipientsIfNeededForChat:forMessage:",  -[MessageDeliveryController _chatForChatIdentifier:](self, "_chatForChatIdentifier:", a5),  a3);
      -[MessageDeliveryController appendChatRelatedPropertiesToMessageDictionary:forMessage:chatIdentifier:]( self,  "appendChatRelatedPropertiesToMessageDictionary:forMessage:chatIdentifier:",  v15,  a3,  a5);
    }

    id v90 = [a3 bizIntent];
    v91 = v90;
    if (v90)
    {
      id v92 = [v90 objectForKey:@"biz-intent-id"];
      id v93 = [v91 objectForKey:@"biz-group-id"];
      if (v92) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"bint", v92);
      }
      if (v93) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"bgrp", v93);
      }
    }

    if ([a3 locale])
    {
      id v94 = [a3 locale];
      if (v94) {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"bloc", v94);
      }
    }

    if (objc_msgSend( +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags", v94),  "isBIAEnabled"))
    {
      id v95 = -[MessageDeliveryController _chatForChatIdentifier:](self, "_chatForChatIdentifier:", a5);
      if ([v95 containsActiveBIASession])
      {
        id v96 = [v95 lastUsedBIAUserID];
        if ([v96 length])
        {
          if (v96) {
            CFDictionarySetValue((CFMutableDictionaryRef)v15, @"buid", v96);
          }
          id v97 = [v95 lastUsedBIAReferenceID];
          id v98 = [v97 length];
          if (v97 && v98) {
            CFDictionarySetValue((CFMutableDictionaryRef)v15, @"brid", v97);
          }
        }
      }
    }

    id v99 = objc_msgSend(objc_msgSend(a3, "payloadData"), "length");
    if (v99)
    {
      if (a9)
      {
        if (IMOSLoggingEnabled(v99, v100))
        {
          v101 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
          if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v101, OS_LOG_TYPE_INFO, "Set balloon payload attachment dictionary", buf, 2u);
          }
        }

        CFDictionarySetValue((CFMutableDictionaryRef)v15, @"bpdi", a9);
      }

      else
      {
        id v102 = a10;
        if (!a10) {
          id v102 = [a3 payloadData];
        }
        id valuea = [v102 _FTCopyGzippedData];
        id v103 = [a3 balloonBundleID];
        id v104 = [v103 isEqualToString:IMBalloonPluginIdentifierRichLinks];
        if ((_DWORD)v104)
        {
          id v104 = objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count");
          if (v104)
          {
            if (IMOSLoggingEnabled(v104, v105))
            {
              v106 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
              if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
              {
                id v107 = [a3 guid];
                *(_DWORD *)buf = 138412290;
                id v132 = v107;
                _os_log_impl( &dword_0,  v106,  OS_LOG_TYPE_INFO,  "Trying to recombine rich link payload from attachments for msg guid %@",  buf,  0xCu);
              }
            }

            v108 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            __int128 v128 = 0u;
            __int128 v129 = 0u;
            __int128 v126 = 0u;
            __int128 v127 = 0u;
            id v109 = [a3 fileTransferGUIDs];
            id v110 = [v109 countByEnumeratingWithState:&v126 objects:v130 count:16];
            if (v110)
            {
              uint64_t v111 = *(void *)v127;
              do
              {
                for (i = 0LL; i != v110; i = (char *)i + 1)
                {
                  if (*(void *)v127 != v111) {
                    objc_enumerationMutation(v109);
                  }
                  id v113 = -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance"),  "transferForGUID:",  *(void *)(*((void *)&v126 + 1) + 8LL * (void)i));
                  if (v108)
                  {
                    v114 = v113;
                    if ([v113 localURL]) {
                      CFArrayAppendValue((CFMutableArrayRef)v108, [v114 localURL]);
                    }
                  }
                }

                id v110 = [v109 countByEnumeratingWithState:&v126 objects:v130 count:16];
              }

              while (v110);
            }

            id valuea = objc_msgSend( (id)IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs( objc_msgSend(a3, "payloadData"),  v108),  "_FTCopyGzippedData");
          }
        }

        if (valuea) {
          CFDictionarySetValue((CFMutableDictionaryRef)v15, @"bp", valuea);
        }
        if (IMOSLoggingEnabled(v104, v105))
        {
          v115 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
          if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
          {
            id v116 = [a3 guid];
            *(_DWORD *)buf = 138412290;
            id v132 = v116;
            _os_log_impl(&dword_0, v115, OS_LOG_TYPE_INFO, "set balloon payload for msg guid %@", buf, 0xCu);
          }
        }
      }
    }

    if (objc_msgSend(objc_msgSend(a3, "replicatedFallbackGUIDs"), "count")) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  [a3 replicatedFallbackGUIDs],  @"rf");
    }
    if (-[NSMutableDictionary count](v15, "count"))
    {
      if ([a8 count])
      {
        id v117 = -[NSMutableDictionary addEntriesFromDictionary:](v15, "addEntriesFromDictionary:", a8);
        if (IMOSLoggingEnabled(v117, v118))
        {
          v119 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
          if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v132 = a8;
            _os_log_impl(&dword_0, v119, OS_LOG_TYPE_INFO, " => Adding context: %@", buf, 0xCu);
          }
        }
      }
    }
  }

  else
  {
    v120 = (os_log_s *)IMLogHandleForCategory("MessageServiceSession");
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
      sub_8F868();
    }
    return 0LL;
  }

  return v15;
}

- (id)idsOptionsWithMessageItem:(id)a3 toID:(id)a4 fromID:(id)a5 sendGUIDData:(id)a6 alternateCallbackID:(id)a7 isBusinessMessage:(BOOL)a8 chatIdentifier:(id)a9 requiredRegProperties:(id)value interestingRegProperties:(id)a11 requiresLackOfRegProperties:(id)a12 deliveryContext:(id)a13 isGroupChat:(BOOL)a14 canInlineAttachments:(BOOL)a15 msgPayloadUploadDictionary:(id)a16 messageDictionary:(id)a17
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v23 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v69 = a3;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Setting IDS options with messageItem: %@", buf, 0xCu);
    }
  }

  unsigned int v24 = [a4 isEqualToString:a5];
  id v25 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 100LL);
  if ((v24 & 1) != 0) {
    uint64_t v26 = 0LL;
  }
  else {
    uint64_t v26 = [a3 isTypingMessage] ^ 1;
  }
  uint64_t v27 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26);
  id v28 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v25,  IDSSendMessageOptionCommandKey,  v27,  IDSSendMessageOptionWantsResponseKey,  a5,  IDSSendMessageOptionFromIDKey,  a6,  IDSSendMessageOptionUUIDKey,  a7,  IDSSendMessageOptionAlternateCallbackIdentifierKey,  0LL);
  if (!a8)
  {
    id v29 = -[MessageDeliveryController _keyTransparencyEnforcementDictionaryForChatIdentifier:]( self,  "_keyTransparencyEnforcementDictionaryForChatIdentifier:",  a9);
    if (v29) {
      CFDictionarySetValue((CFMutableDictionaryRef)v28, @"IDSSendMessageOptionKTVerificationUUIDKey", v29);
    }
  }

  if (value) {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionRequireAllRegistrationPropertiesKey, value);
  }
  if (a11) {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionInterestingRegistrationPropertiesKey, a11);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
  if (a13)
  {
    if (IMOSLoggingEnabled(v30, v31))
    {
      uint64_t v32 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        id v33 = [a3 guid];
        *(_DWORD *)buf = 138412802;
        *(void *)id v69 = v33;
        *(_WORD *)&v69[8] = 2112;
        id v70 = a13;
        __int16 v71 = 1024;
        BOOL v72 = a14;
        _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  "Requsting delivery status for message GUID %@ due to delivery context %@ isGroupChat %{BOOL}d",  buf,  0x1Cu);
      }
    }

    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionDeliveryStatusContextKey, a13);
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionWantsDeliveryStatusKey, &__kCFBooleanTrue);
  }

  if (((a14 | v24) & 1) == 0)
  {
    id v34 = [a3 isTypingMessage];
    if ((v34 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v34, v35))
      {
        NSUInteger v36 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          id v37 = [a3 guid];
          *(_DWORD *)buf = 138412290;
          *(void *)id v69 = v37;
          _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "Requsting delivery status for message GUID %@ because !isGroupChat",  buf,  0xCu);
        }
      }

      CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionWantsDeliveryStatusKey, &__kCFBooleanTrue);
    }
  }

  if (a12) {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey, a12);
  }
  if (([a3 isTypingMessage] & 1) == 0
    && objc_msgSend( +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"),  "certifiedDeliveryEnabled")
    && !a8)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionWantsCertifiedDeliveryKey, &__kCFBooleanTrue);
  }

  if ([a17 count])
  {
    id v38 = [a17 valueForKey:@"oe"];
    if (v38) {
      CFDictionarySetValue((CFMutableDictionaryRef)v28, @"IDSSendMessageOptionOriginalTimestampKey", v38);
    }
    v39 = (void *)JWEncodeDictionary(a17);
    id v40 = objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count");
    if (v40 && !a15 || (id v40 = objc_msgSend(objc_msgSend(a3, "payloadData"), "length"), a16) && v40)
    {
      if (IMOSLoggingEnabled(v40, v41))
      {
        id v42 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          id v43 = [a3 fileTransferGUIDs];
          id v44 = @"NO";
          if (a15) {
            id v44 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)id v69 = v43;
          *(_WORD *)&v69[8] = 2112;
          id v70 = (id)v44;
          _os_log_impl( &dword_0,  v42,  OS_LOG_TYPE_INFO,  "Not compressing data, %@, canInlineAttachments: %@",  buf,  0x16u);
        }
      }

      id v45 = v39;
    }

    else
    {
      if (IMOSLoggingEnabled(v40, v41))
      {
        id v47 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          id v48 = [a3 fileTransferGUIDs];
          id v49 = @"NO";
          if (a15) {
            id v49 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)id v69 = v48;
          *(_WORD *)&v69[8] = 2112;
          id v70 = (id)v49;
          _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "Compressing data, %@, canInlineAttachments: %@", buf, 0x16u);
        }
      }

      id v45 = [v39 _FTCopyGzippedData];
    }

    uint64_t v50 = v45;
    uint64_t v51 = IMOSLoggingEnabled(v45, v46);
    if ((_DWORD)v51)
    {
      id v53 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      uint64_t v51 = os_log_type_enabled(v53, OS_LOG_TYPE_INFO);
      if ((_DWORD)v51)
      {
        unsigned int v54 = [v39 length];
        unsigned int v55 = [v50 length];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)id v69 = v54;
        *(_WORD *)&v69[4] = 1024;
        *(_DWORD *)&v69[6] = v55;
        _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "Compressed message data from: %u  to: %u", buf, 0xEu);
      }
    }

    if (IMOSLoggingEnabled(v51, v52))
    {
      id v56 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        unsigned int v57 = [v50 length];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)id v69 = v57;
        _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "Adding data to be encrypted of size: %u", buf, 8u);
      }
    }

    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v50, IDSSendMessageOptionDataToEncryptKey);
  }

  uint64_t v58 = (const void **)&IDSSendMessageOptionTimeoutKey;
  if (![a3 scheduleType])
  {
    v64 = (NSSet *)&off_DB768;
    goto LABEL_77;
  }

  uint64_t v59 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout);
  if (v59) {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionTimeoutKey, v59);
  }
  objc_msgSend(objc_msgSend(a3, "time", v59), "timeIntervalSinceNow");
  double v61 = v60;
  if ([a3 scheduleType] == (char *)&dword_0 + 1)
  {
    if (v61 > 0.0)
    {
      id v62 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v61);
      if (v62) {
        CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionDeliveryMinimumTimeDelayKey, v62);
      }
    }

    CFDictionarySetValue((CFMutableDictionaryRef)v28, IMIDSSendMessageOptionAlwaysIncludeSelfKey, &__kCFBooleanTrue);
    id v63 = -[MessageDeliveryController _getQueueIdentifierFromGUID:]( self,  "_getQueueIdentifierFromGUID:",  [a3 guid]);
    if (v63) {
      CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionQueueOneIdentifierKey, v63);
    }
    v64 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSRegistrationPropertySupportsEmojiStickers);
    if (v64)
    {
      uint64_t v58 = (const void **)&IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
LABEL_77:
      CFDictionarySetValue((CFMutableDictionaryRef)v28, *v58, v64);
    }
  }

  else if ([a3 scheduleType] == (char *)&dword_0 + 2)
  {
    if (v61 > 0.0)
    {
      objc_msgSend(objc_msgSend(a3, "time"), "timeIntervalSince1970");
      uint64_t v65 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
      if (v65) {
        CFDictionarySetValue((CFMutableDictionaryRef)v28, IMIDSSendMessageOptionDeliveryMinimumTimeKey, v65);
      }
    }

    CFDictionarySetValue((CFMutableDictionaryRef)v28, IMIDSSendMessageOptionAlwaysIncludeSelfKey, &__kCFBooleanTrue);
    v64 = -[MessageDeliveryController _getQueueIdentifierFromGUID:]( self,  "_getQueueIdentifierFromGUID:",  [a3 guid]);
    if (v64)
    {
      uint64_t v58 = (const void **)&IDSSendMessageOptionQueueOneIdentifierKey;
      goto LABEL_77;
    }
  }

  return v28;
}

- (id)_getQueueIdentifierFromGUID:(id)a3
{
  id v3 = [a3 dataUsingEncoding:4];
  id v4 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 32LL);
  CC_SHA256( [v3 bytes],  (CC_LONG)objc_msgSend(v3, "length"),  (unsigned __int8 *)-[NSMutableData mutableBytes](v4, "mutableBytes"));
  id v5 = -[NSMutableData base64EncodedStringWithOptions:](v4, "base64EncodedStringWithOptions:", 0LL);

  return v5;
}

- (BOOL)_shouldSendAuxXML:(id)a3
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = [a3 fileTransferGUIDs];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  id v7 = v4;
  if (v4)
  {
    uint64_t v8 = *(void *)v19;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v17 = v6;
    while (2)
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v9);
        id v11 = (__CFString *)-[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance",  v17),  "transferForGUID:",  v10);
        if (-[__CFString isAuxImage](v11, "isAuxImage"))
        {
          id v4 = -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"),  "transferForGUID:",  +[IMFileTransfer AuxGUIDFromFileTransferGUID:]( &OBJC_CLASS___IMFileTransfer,  "AuxGUIDFromFileTransferGUID:",  v10));
          if (v4)
          {
            BOOL v13 = 1;
            goto LABEL_15;
          }

          if (IMOSLoggingEnabled(0LL, v5))
          {
            uint64_t v12 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v17;
              uint64_t v23 = v11;
              _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "shouldSendAuxXML we expected to find an Aux video for transfer %@",  buf,  0xCu);
            }
          }
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
      id v7 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 0;
LABEL_15:
  if (IMOSLoggingEnabled(v4, v5))
  {
    __int16 v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = @"NO";
      if (v13) {
        id v15 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "shouldSendAuxXML %@", buf, 0xCu);
    }
  }

  return v13;
}

- (id)_compressedAttributionInfoForMessage:(id)a3
{
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = [a3 fileTransferGUIDs];
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v6) {
    return 0LL;
  }
  char v8 = 0;
  uint64_t v9 = *(void *)v24;
  *(void *)&__int128 v7 = 138412290LL;
  __int128 v21 = v7;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
      id v12 = -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance", v21),  "transferForGUID:",  v11);
      if ([v12 attributionInfo])
      {
        __int16 v14 = (NSNull *)[v12 attributionInfo];
        char v8 = 1;
      }

      else
      {
        if (IMOSLoggingEnabled(0LL, v13))
        {
          id v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            uint64_t v28 = v11;
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "attributionInfo is nil for transferGUID %@", buf, 0xCu);
          }
        }

        __int16 v14 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
      }

      [v4 addObject:v14];
    }

    id v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  }

  while (v6);
  if ((v8 & 1) == 0) {
    return 0LL;
  }
  uint64_t v22 = 0LL;
  id v16 = -[NSData _FTCopyGzippedData]( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  0LL,  &v22),  "_FTCopyGzippedData");
  __int128 v18 = v16;
  if (v22)
  {
    if (IMOSLoggingEnabled(v16, v17))
    {
      __int128 v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v21;
        uint64_t v28 = v22;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Failed to unarchive attributionInfo. Error: %@", buf, 0xCu);
      }
    }
  }

  return v18;
}

- (BOOL)forceBackwardsCompatibleMessageForBundleID:(id)a3
{
  v15[0] = IMBalloonExtensionIDWithSuffix(IMBalloonPluginIdentifierSurf);
  v15[1] = IMBalloonExtensionIDWithSuffix(IMBalloonPluginIdentifierSurfDeprecated);
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      char v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) isEqualToString:a3])
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }

        char v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return (char)v5;
}

- (BOOL)shouldSendBackwardsCompatibleMessageForBundleID:(id)a3
{
  if ([a3 hasPrefix:@"com.apple.messages.MSMessageExtensionBalloonPlugin"]) {
    return -[MessageDeliveryController forceBackwardsCompatibleMessageForBundleID:]( self,  "forceBackwardsCompatibleMessageForBundleID:",  a3);
  }
  else {
    return 1;
  }
}

- (id)_chatForChatIdentifier:(id)a3
{
  id result = -[MessageServiceSession chatForChatIdentifier:style:]( -[MessageDeliveryController session](self, "session"),  "chatForChatIdentifier:style:",  a3,  45LL);
  if (!result) {
    return -[MessageServiceSession chatForChatIdentifier:style:]( -[MessageDeliveryController session](self, "session"),  "chatForChatIdentifier:style:",  a3,  43LL);
  }
  return result;
}

- (void)_sendNicknameToRecipientsIfNeededForChat:(id)a3 forMessage:(id)a4
{
  id v5 = [a4 shouldSendMeCard];
  if ((_DWORD)v5)
  {
    if (0xCCCCCCCCCCCCCCCDLL * (unint64_t)[a3 numMessagesSent] <= 0x3333333333333333)
    {
      [a3 meCardUpdated];
    }

    else
    {
      uint64_t v7 = (char *)[a3 numMessagesSent];
      id v8 = [a3 meCardUpdated];
      if (v7 != (_BYTE *)&dword_0 + 1 && !(_DWORD)v8)
      {
        if (IMOSLoggingEnabled(v8, v9))
        {
          __int128 v10 = (os_log_s *)OSLogHandleForIMFoundationCategory("Nicknames");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            __int16 v17 = 0;
            __int128 v11 = "Not appending me card to message dictionary";
LABEL_11:
            _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v17, 2u);
            return;
          }
        }

        return;
      }
    }

    id v12 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v13 = [a3 participants];
    id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)i), "ID"));
        }

        id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v14);
    }

    -[IMDNicknameController markHandlesAsAllowed:]( +[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"),  "markHandlesAsAllowed:",  v12);
    -[IMDNicknameController sendPersonalNicknameToRecipients:chatGUID:fromHandle:onlySendToThoseLoggedOutOfIMessage:]( +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance"),  "sendPersonalNicknameToRecipients:chatGUID:fromHandle:onlySendToThoseLoggedOutOfIMessage:",  [a3 participants],  objc_msgSend(a3, "guid"),  objc_msgSend(a3, "lastAddressedLocalHandle"),  1);
    return;
  }

  if (IMOSLoggingEnabled(v5, v6))
  {
    __int128 v10 = (os_log_s *)OSLogHandleForIMFoundationCategory("Nicknames");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = 0;
      __int128 v11 = "Not appending me card, message.shouldSendMeCard is false, indicating recipient is not in the allowed audienc"
            "e for nickname sharing";
      goto LABEL_11;
    }
  }

- (void)_appendMyNicknameToMessageDictionary:(id)a3 forMessage:(id)a4 chat:(id)a5
{
  id v8 = [a4 shouldSendMeCard];
  if ((_DWORD)v8)
  {
    if (0xCCCCCCCCCCCCCCCDLL * (unint64_t)[a5 numMessagesSent] <= 0x3333333333333333)
    {
      unsigned int v13 = [a5 meCardUpdated];
    }

    else
    {
      __int128 v10 = (char *)[a5 numMessagesSent];
      id v11 = [a5 meCardUpdated];
      unsigned int v13 = v11;
      if (v10 != (_BYTE *)&dword_0 + 1 && !(_DWORD)v11)
      {
        if (IMOSLoggingEnabled(v11, v12))
        {
          id v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("Nicknames");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            LOWORD(v31) = 0;
            uint64_t v15 = "Not appending me card to message dictionary";
LABEL_11:
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v31, 2u);
            return;
          }
        }

        return;
      }
    }

    id v16 = -[IMDNicknameController newNicknameInfoToSend]( +[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"),  "newNicknameInfoToSend");
    int v18 = IMOSLoggingEnabled(v16, v17);
    if (v16)
    {
      if (v18)
      {
        __int128 v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("Nicknames");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v31 = 138412290;
          id v32 = [a4 guid];
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Including me card in this message %@", (uint8_t *)&v31, 0xCu);
        }
      }

      if (objc_msgSend( objc_msgSend( +[IDSServerBag sharedInstanceForBagType:]( IDSServerBag,  "sharedInstanceForBagType:",  0),  "objectForKey:",  @"enable-snap-v2-back-compat"),  "BOOLValue"))
      {
        id v20 = +[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v21 = objc_msgSend(a5, "participants", 0);
        id v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v27;
          do
          {
            for (i = 0LL; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v27 != v23) {
                objc_enumerationMutation(v21);
              }
              objc_msgSend(v20, "addObject:", objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)i), "ID"));
            }

            id v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }

          while (v22);
        }

        -[IMDNicknameController markHandlesAsAllowed:]( +[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"),  "markHandlesAsAllowed:",  v20);
        [a3 addEntriesFromDictionary:v16];
      }
    }

    else if (v18)
    {
      __int128 v25 = (os_log_s *)OSLogHandleForIMFoundationCategory("Nicknames");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        int v31 = 138412290;
        id v32 = [a4 guid];
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "Me card data not available, not including in message %@",  (uint8_t *)&v31,  0xCu);
      }
    }

    if (v13) {
      [a5 setMeCardUpdated:0];
    }
    return;
  }

  if (IMOSLoggingEnabled(v8, v9))
  {
    id v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("Nicknames");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      uint64_t v15 = "Not appending me card, message.shouldSendMeCard is false, indicating recipient is not in the allowed audienc"
            "e for nickname sharing";
      goto LABEL_11;
    }
  }

- (void)_appendRecipientAvailabilityVerificationInfoToMessageDictionary:(id)a3 forChat:(id)a4
{
  id v7 = [a4 style];
  if ((_DWORD)v7 != 45)
  {
    uint64_t v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v39) = 0;
    id v16 = "Not appending availability verification info for non 1-1 chat";
    goto LABEL_11;
  }

  id v9 = objc_msgSend(objc_msgSend(a4, "participants"), "lastObject");
  if (v9)
  {
    id v10 = objc_msgSend(objc_msgSend(v9, "ID"), "_stripFZIDPrefix");
    if ([v10 length])
    {
      id v11 = +[IMDAvailabilityVerificationManager deviceSupportsSubscriptionValidationTokens]( &OBJC_CLASS___IMDAvailabilityVerificationManager,  "deviceSupportsSubscriptionValidationTokens");
      if ((v11 & 1) != 0)
      {
        if (objc_msgSend( +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"),  "isCarrierPigeonEnabled"))
        {
          id v13 = [a4 numMessagesSent];
          if (0xAAAAAAAAAAAAAAABLL * (unint64_t)v13 + 0x5555555555555555LL >= 0x5555555555555555LL)
          {
            if (IMOSLoggingEnabled(v13, v14))
            {
              __int128 v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                int v39 = 134217984;
                uint64_t v40 = 3LL;
                _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "Not appending off grid availability verification info to this message. Info is only included in one of every %ld messages.",  (uint8_t *)&v39,  0xCu);
              }
            }

            -[IMDOffGridAvailabilityVerificationManager populateCacheForHandleID:]( +[IMDOffGridAvailabilityVerificationManager sharedInstance]( &OBJC_CLASS___IMDOffGridAvailabilityVerificationManager,  "sharedInstance"),  "populateCacheForHandleID:",  v10);
          }

          else
          {
            -[MessageDeliveryController _appendOffGridAvailabilityPropertiesToMessageDictionary:participantHandleID:]( self,  "_appendOffGridAvailabilityPropertiesToMessageDictionary:participantHandleID:",  a3,  v10);
          }
        }

        id v20 = [a4 numMessagesSent];
        if (0xAAAAAAAAAAAAAAABLL * (unint64_t)v20 < 0x5555555555555556LL)
        {
          id v23 = -[IMDAvailabilityVerificationManager cachedAvailabilityVerificationTokensForHandleID:]( +[IMDAvailabilityVerificationManager sharedInstance]( &OBJC_CLASS___IMDAvailabilityVerificationManager,  "sharedInstance"),  "cachedAvailabilityVerificationTokensForHandleID:",  v10);
          __int128 v24 = v23;
          if (v23)
          {
            id v25 = [v23 subscriptionValidationToken];
            if (IMOSLoggingEnabled(v25, v26))
            {
              __int128 v27 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                int v39 = 138412546;
                uint64_t v40 = (uint64_t)v25;
                __int16 v41 = 2112;
                id v42 = v10;
                _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "Appending subscriptionValidationToken \"%@\" to message for handleID \"%@\"",  (uint8_t *)&v39,  0x16u);
              }
            }

            [a3 setObject:v25 forKey:@"arc"];
            id v28 = [v24 encryptionValidationToken];
            id v30 = v28;
            if (v28)
            {
              if (IMOSLoggingEnabled(v28, v29))
              {
                int v31 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  int v39 = 138412546;
                  uint64_t v40 = (uint64_t)v30;
                  __int16 v41 = 2112;
                  id v42 = v10;
                  _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_INFO,  "Appending encryptionValidationToken \"%@\" to message for handleID \"%@\"",  (uint8_t *)&v39,  0x16u);
                }
              }

              [a3 setObject:v30 forKey:@"are"];
            }
          }

          else
          {
            id v32 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_8F8EC((uint64_t)v10, v32, v33, v34, v35, v36, v37, v38);
            }
          }
        }

        else
        {
          if (IMOSLoggingEnabled(v20, v21))
          {
            id v22 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              int v39 = 134217984;
              uint64_t v40 = 3LL;
              _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "Not appending availability verification info to this message. Info is only included in one of every %ld messages.",  (uint8_t *)&v39,  0xCu);
            }
          }

          -[IMDAvailabilityVerificationManager populateCacheWithAvailabilityVerificationTokensForHandleID:]( +[IMDAvailabilityVerificationManager sharedInstance]( &OBJC_CLASS___IMDAvailabilityVerificationManager,  "sharedInstance"),  "populateCacheWithAvailabilityVerificationTokensForHandleID:",  v10);
        }

        return;
      }

      uint64_t v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        return;
      }
      LOWORD(v39) = 0;
      id v16 = "Not appending availability verification info to this message. Device does not support validation tokens.";
LABEL_11:
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v39, 2u);
      return;
    }

    int v18 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_8F8C0();
    }
  }

  else
  {
    uint64_t v17 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_8F894();
    }
  }

- (void)_appendOffGridAvailabilityPropertiesToMessageDictionary:(id)a3 participantHandleID:(id)a4
{
  if (objc_msgSend( +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"),  "isCarrierPigeonEnabled"))
  {
    id v6 = -[IMDOffGridAvailabilityVerificationManager cachedAvailabilityTokensForHandleID:]( +[IMDOffGridAvailabilityVerificationManager sharedInstance]( &OBJC_CLASS___IMDOffGridAvailabilityVerificationManager,  "sharedInstance"),  "cachedAvailabilityTokensForHandleID:",  a4);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 subscriptionValidationToken];
      id v9 = [v7 encryptionValidationToken];
      if (IMOSLoggingEnabled(v9, v10))
      {
        id v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412546;
          id v23 = v8;
          __int16 v24 = 2112;
          id v25 = a4;
          _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "Appending offGridRecipientSubscriptionValidationTokenKey %@ to message for handleID %@",  (uint8_t *)&v22,  0x16u);
        }
      }

      id v12 = [a3 setObject:v8 forKeyedSubscript:@"aogrs"];
      if (v9)
      {
        if (IMOSLoggingEnabled(v12, v13))
        {
          uint64_t v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v22 = 138412546;
            id v23 = v9;
            __int16 v24 = 2112;
            id v25 = a4;
            _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "Appending offGridRecipientEncryptionValidationTokenKey %@ to message for handleID %@",  (uint8_t *)&v22,  0x16u);
          }
        }

        [a3 setObject:v9 forKeyedSubscript:@"aogre"];
      }
    }

    else
    {
      uint64_t v15 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_8F950((uint64_t)a4, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }

- (void)appendChatRelatedPropertiesToMessageDictionary:(id)a3 forMessage:(id)a4 chatIdentifier:(id)a5
{
  id v9 = -[MessageDeliveryController _chatForChatIdentifier:](self, "_chatForChatIdentifier:", a5);
  if (v9)
  {
    uint64_t v10 = v9;
    if (-[MessageDeliveryController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
    {
      -[MessageDeliveryController _appendMyNicknameToMessageDictionary:forMessage:chat:]( self,  "_appendMyNicknameToMessageDictionary:forMessage:chat:",  a3,  a4,  v10);
      -[MessageDeliveryController _appendRecipientNicknameTruncatedRecordIDToMessageDictionary:forChat:]( self,  "_appendRecipientNicknameTruncatedRecordIDToMessageDictionary:forChat:",  a3,  v10);
    }

    -[MessageDeliveryController _appendRecipientAvailabilityVerificationInfoToMessageDictionary:forChat:]( self,  "_appendRecipientAvailabilityVerificationInfoToMessageDictionary:forChat:",  a3,  v10);
    -[MessageDeliveryController _appendSeenOffGridStatusToMessageDictionary:forChat:]( self,  "_appendSeenOffGridStatusToMessageDictionary:forChat:",  a3,  v10);
    _objc_msgSend(v10, "setNumMessagesSent:", (char *)objc_msgSend(v10, "numMessagesSent") + 1);
  }

  else
  {
    id v11 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8F9B4((uint64_t)a5, v11, v12, v13, v14, v15, v16, v17);
    }
  }

- (void)_appendRecipientNicknameTruncatedRecordIDToMessageDictionary:(id)a3 forChat:(id)a4
{
  if ([a4 style] == 45)
  {
    id v6 = objc_msgSend(objc_msgSend(a4, "participants"), "lastObject");
    if (v6)
    {
      id v7 = v6;
      id v8 = -[IMDNicknameController nicknameForHandleURI:]( +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance"),  "nicknameForHandleURI:",  [v6 ID]);
      int v10 = IMOSLoggingEnabled(v8, v9);
      if (v8)
      {
        if (v10)
        {
          id v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("Nicknames");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            int v17 = 138412546;
            id v18 = [v7 ID];
            __int16 v19 = 2112;
            id v20 = v8;
            _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "We have a nickname for handle id %@ nickname %@",  (uint8_t *)&v17,  0x16u);
          }
        }

        id v12 = -[IMDNicknameController substringRecordIDForNickname:]( +[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"),  "substringRecordIDForNickname:",  v8);
        id v13 = [v12 length];
        if (v13)
        {
          if (IMOSLoggingEnabled(v13, v14))
          {
            uint64_t v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("Nicknames");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              int v17 = 138412290;
              id v18 = v12;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Setting truncated record ID %@", (uint8_t *)&v17, 0xCu);
            }
          }

          [a3 setObject:v12 forKey:MessageDictionaryNicknameParticipantTruncatedRIDKey];
        }
      }

      else if (v10)
      {
        uint64_t v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("Nicknames");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412546;
          id v18 = [v7 ID];
          __int16 v19 = 2112;
          id v20 = 0LL;
          _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "No nickname or record id did not  exist for handle ID %@ nickname %@",  (uint8_t *)&v17,  0x16u);
        }
      }
    }
  }

- (void)_appendSeenOffGridStatusToMessageDictionary:(id)a3 forChat:(id)a4
{
  if (IMOSLoggingEnabled(self, a2))
  {
    id v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "Attempting to append off grid status to message dictionary",  buf,  2u);
    }
  }

  id v7 = [a4 style];
  if ((_DWORD)v7 == 45)
  {
    id v9 = objc_msgSend(objc_msgSend(a4, "participants"), "lastObject");
    if (v9)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_3B1C8;
      v13[3] = &unk_D6320;
      v13[4] = v9;
      v13[5] = a3;
      [v9 cachedOffGridModeAndLastPublisherWithCompletion:v13];
      return;
    }

    if (IMOSLoggingEnabled(0LL, v10))
    {
      id v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v12 = "No participant found, not appending off grid status";
        goto LABEL_13;
      }
    }
  }

  else if (IMOSLoggingEnabled(v7, v8))
  {
    id v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v12 = "Not appending off grid status, not a 1:1 chat";
LABEL_13:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
    }
  }

- (id)_computeRegPropertiesForNewFeatures:(id)a3 currentRegProperties:(id)a4 currentInterestingProp:(id)a5
{
  if (a4) {
    id v7 = +[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", a4);
  }
  else {
    id v7 = (NSMutableSet *)+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  }
  uint64_t v8 = v7;
  if (a5) {
    id v9 = +[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", a5);
  }
  else {
    id v9 = (NSMutableSet *)+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set");
  }
  uint64_t v10 = v9;
  id v11 = [a3 isTypingMessage];
  id v41 = a3;
  id v42 = v10;
  if ((v11 & 1) != 0)
  {
    if (IMOSLoggingEnabled(v11, v12))
    {
      id v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = [a3 guid];
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "Not adding required reg properties for typing message msg %@",  buf,  0xCu);
      }
    }

    LOBYTE(v14) = 0;
    goto LABEL_67;
  }

  if ([a3 associatedMessageType] && (uint64_t)objc_msgSend(a3, "associatedMessageType") >= 1001)
  {
    -[NSMutableSet addObject:](v8, "addObject:", IDSRegistrationPropertySupportsAcknowledgementsV1);
    id v15 = objc_msgSend(objc_msgSend(a3, "messageSummaryInfo"), "__im_associatedMessagePluginBundleID");
    int v14 = 1;
  }

  else
  {
    int v14 = 0;
  }

  uint64_t v16 = (char *)[a3 associatedMessageType];
  if (v16 == (_BYTE *)&stru_790.reserved1 + 2
    || v16 == &stru_BA0.segname[14]
    || (int v17 = (char *)[a3 associatedMessageType], v17 == &stru_BA0.segname[15])
    || v17 == (_BYTE *)&stru_790.reserved1 + 3)
  {
    -[NSMutableSet addObject:](v8, "addObject:", @"supports-stick-moji-backs");
    int v14 = 1;
  }

  if (objc_msgSend(objc_msgSend(a3, "balloonBundleID"), "length"))
  {
    id v18 = [a3 balloonBundleID];
    if (([v18 isEqualToString:IMBalloonPluginIdentifierRichLinks] & 1) == 0)
    {
      int IsBusinessID = IMStringIsBusinessID([a3 handle]);
      id v20 = [a3 balloonBundleID];
      if (IsBusinessID)
      {
        if (-[MessageDeliveryController shouldSendBackwardsCompatibleMessageForBundleID:]( self,  "shouldSendBackwardsCompatibleMessageForBundleID:",  v20))
        {
          uint64_t v21 = @"supports-biz-forward-compat-apps-v1";
LABEL_32:
          -[NSMutableSet addObject:](v8, "addObject:", v21);
        }
      }

      else if ([v20 isEqualToString:IMBalloonExtensionIDWithSuffix(IMBalloonPluginIdentifierActivity)])
      {
        -[NSMutableSet addObject:](v8, "addObject:", IDSRegistrationPropertySupportsActivitySharing);
      }

      else
      {
        id v22 = [a3 balloonBundleID];
        if ([v22 isEqualToString:IMBalloonExtensionIDWithSuffix(IMBalloonPluginIdentifierPhotosExtension)])
        {
          uint64_t v21 = (const __CFString *)IDSRegistrationPropertySupportsPhotosExtensionV1;
          goto LABEL_32;
        }
      }

      -[NSMutableSet addObject:](v8, "addObject:", IDSRegistrationPropertySupportsChatAppsV1);
      int v14 = 1;
    }
  }

  id v23 = (void *)IMBalloonPluginRequiredCapabilitiesWithMessageData([a3 payloadData]);
  if ([v23 count])
  {
    -[NSMutableSet addObjectsFromArray:](v8, "addObjectsFromArray:", v23);
    int v14 = 1;
  }

  if ([a3 isAudioMessage]
    && ([a3 backwardsCompatibleVersion] & 1) == 0)
  {
    -[NSMutableSet addObject:](v8, "addObject:", @"supports-audio-messaging-v2");
    int v14 = 1;
  }

  id v24 = [a3 expressiveSendStyleID];
  uint64_t v25 = IMImpactEffectID_InvisibleInk;
  if ([v24 isEqualToString:IMImpactEffectID_InvisibleInk])
  {
    -[NSMutableSet addObject:](v8, "addObject:", IDSRegistrationPropertySupportsInvisibleInkV1);
    int v14 = 1;
  }

  if (objc_msgSend(objc_msgSend(a3, "expressiveSendStyleID"), "length"))
  {
    if ((objc_msgSend(objc_msgSend(a3, "expressiveSendStyleID"), "isEqualToString:", v25) & 1) == 0)
    {
      id v26 = -[MessageDeliveryController _propertyForExpressiveSendStyle:]( self,  "_propertyForExpressiveSendStyle:",  [a3 expressiveSendStyleID]);
      if (v26)
      {
        id v27 = v26;
        if (v14) {
          id v28 = v10;
        }
        else {
          id v28 = v8;
        }
        -[NSMutableSet addObject:](v28, "addObject:", v27);
        LOBYTE(v14) = 1;
      }
    }
  }

  if (objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count"))
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v29 = [a3 fileTransferGUIDs];
    id v30 = [v29 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v47;
      uint64_t v44 = IDSRegistrationPropertySupportsAnimojiV2;
      uint64_t v32 = IDSRegistrationPropertySupportsAutoloopVideoV1;
      uint64_t v43 = IDSRegistrationPropertySupportsEmojiStickers;
      do
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v29);
          }
          id v34 = -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"),  "transferForGUID:",  *(void *)(*((void *)&v46 + 1) + 8LL * (void)i));
          unsigned __int8 v35 = [v34 isAutoloopVideo];
          uint64_t v36 = v32;
          if ((v35 & 1) != 0
            || objc_msgSend(v34, "isAnimojiV2", v32)
            && (v37 = [v34 wantsAlphaRemoved], uint64_t v36 = v44, (v37 & 1) == 0))
          {
            -[NSMutableSet addObject:](v8, "addObject:", v36);
            LOBYTE(v14) = 1;
          }

          if (objc_msgSend(v34, "isAdaptiveImageGlyph", v36))
          {
            -[NSMutableSet addObject:](v8, "addObject:", @"supports-emoji-images");
            LOBYTE(v14) = 1;
          }

          if ((objc_msgSend( +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"),  "isClingBackwardsCompatibilityEnabled") & 1) == 0 && -[MessageDeliveryController _transferIsUserGeneratedOrEmojiSticker:]( self,  "_transferIsUserGeneratedOrEmojiSticker:",  v34))
          {
            -[NSMutableSet addObject:](v8, "addObject:", v43);
            LOBYTE(v14) = 1;
          }
        }

        id v30 = [v29 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }

      while (v30);
    }
  }

- (BOOL)_transferIsUserGeneratedOrEmojiSticker:(id)a3
{
  LODWORD(v4) = [a3 isSticker];
  if ((_DWORD)v4)
  {
    id v5 = [a3 attributionInfo];
    id v6 = [v5 objectForKeyedSubscript:IMFileTransferAttributionInfoBundleIDKey];
    id v4 = [v6 length];
    if (v4)
    {
      unsigned __int8 v7 = [v6 isEqualToString:+[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:%@", IMBalloonBundleIdentifierCling)];
      LOBYTE(v4) = v7 | objc_msgSend( v6,  "isEqualToString:",  +[IMEmojiSticker defaultEmojiStickerPackID]( IMEmojiSticker,  "defaultEmojiStickerPackID"));
    }
  }

  return (char)v4;
}

- (id)_propertyForExpressiveSendStyle:(id)a3
{
  if (![a3 length]
    || ([a3 isEqualToString:IMImpactEffectID_InvisibleInk] & 1) != 0)
  {
    return 0LL;
  }

  id v4 = (void *)IDSRegistrationPropertySupportsImpactEffectsV1;
  if (([a3 hasSuffix:@"CKSparklesEffect"] & 1) != 0
    || [a3 hasSuffix:@"CKHeartEffect"])
  {
    id v6 = (id *)&IDSRegistrationPropertySupportsFullScreenMomentsV2;
    return *v6;
  }

  if (([a3 hasSuffix:@"CKEchoEffect"] & 1) != 0
    || [a3 hasSuffix:@"CKSpotlightEffect"])
  {
    id v6 = (id *)&IDSRegistrationPropertySupportsFullScreenMomentsV3;
    return *v6;
  }

  return v4;
}

- (void)_setReplyToGUIDForMessage:(id)a3 messageDictionary:(id)a4
{
  if (([a3 isTypingMessage] & 1) == 0
    && objc_msgSend(objc_msgSend(a3, "replyToGUID"), "length"))
  {
    id v6 = [a3 replyToGUID];
    if (v6) {
      CFDictionarySetValue((CFMutableDictionaryRef)a4, @"r", v6);
    }
    if (IMOSLoggingEnabled(v6, v7))
    {
      uint64_t v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412546;
        id v10 = [a3 replyToGUID];
        __int16 v11 = 2112;
        id v12 = [a3 guid];
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "setReplyToMessageGUID: %@ for message: %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }

- (void)_sendMessage:(id)a3 context:(id)a4 deliveryContext:(id)a5 fromID:(id)a6 fromAccount:(id)a7 toID:(id)a8 chatIdentifier:(id)a9 toSessionToken:(id)a10 toGroup:(id)a11 toParticipants:(id)a12 originallyToParticipants:(id)a13 requiredRegProperties:(id)a14 interestingRegProperties:(id)a15 requiresLackOfRegProperties:(id)a16 canInlineAttachments:(BOOL)a17 type:(int64_t)a18 msgPayloadUploadDictionary:(id)a19 originalPayload:(id)a20 replyToMessageGUID:(id)a21 willSendBlock:(id)a22 completionBlock:(id)a23
{
  v108 = (void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a23;
  id v103 = a22;
  id v23 = a13;
  if (![a13 count] && objc_msgSend(a12, "count")) {
    id v23 = a12;
  }
  id v24 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  if ([a12 count])
  {
    id v25 = [a7 serviceName];
    id v26 = [v25 isEqualToString:IDSServiceNameiMessageForBusiness];
    switch(a18)
    {
      case 0LL:
        id v28 = v26;
        if (IMOSLoggingEnabled(v26, v27))
        {
          id v29 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = [a3 guid];
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = a12;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Send message action guid %@ (URIs: %@)", buf, 0x16u);
          }
        }

        id v30 = -[MessageDeliveryController messageDictionaryWithMessageItem:isBusiness:chatIdentifier:toParticipants:originallyToParticipants:additionalContext:msgPayloadUploadDictionary:originalPayload:]( self,  "messageDictionaryWithMessageItem:isBusiness:chatIdentifier:toParticipants:originallyToParticipants:addit ionalContext:msgPayloadUploadDictionary:originalPayload:",  a3,  v28,  a9,  a12,  v23,  a4,  a19,  a20);
        uint64_t v32 = v30;
        BOOL v33 = a7 == 0LL;
        if (a7)
        {
          id v34 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", a12);
          id v99 = [v23 count];
          id v35 = [a8 isEqualToString:a6];
          int v36 = (int)v35;
          if (IMOSLoggingEnabled(v35, v37))
          {
            unsigned int v38 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              unsigned int v39 = [a3 isTypingMessage];
              uint64_t v40 = @"NO";
              *(_DWORD *)buf = 138413570;
              *(void *)&uint8_t buf[4] = v34;
              else {
                id v41 = @"YES";
              }
              if (v39) {
                id v42 = @"YES";
              }
              else {
                id v42 = @"NO";
              }
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a6;
              *(_WORD *)&buf[22] = 2112;
              if (v36) {
                uint64_t v40 = @"YES";
              }
              id v129 = a8;
              __int16 v130 = 2112;
              id v131 = (id)v41;
              __int16 v132 = 2112;
              __int16 v133 = v42;
              __int16 v134 = 2112;
              NSRange v135 = v40;
              _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_INFO,  "Sending to destinations %@   from: %@   to: %@   isGroup: %@  isTyping: %@  toMe: %@",  buf,  0x3Eu);
            }
          }

          theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v43 = [a3 guid];
          uint64_t v98 = IDSGetUUIDData(v43);
          id v100 = +[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID");
          if (IMOSLoggingEnabled(v100, v44))
          {
            id v45 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v43;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v98;
              *(_WORD *)&buf[22] = 2112;
              id v129 = v100;
              _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_INFO,  "Setting send guid to %@  %@ (with alternate callback guid %@)",  buf,  0x20u);
            }
          }

          if ([a3 isTapToRetry])
          {
            CFDictionarySetValue((CFMutableDictionaryRef)theDict, @"tr", &__kCFBooleanTrue);
            [a3 setIsTapToRetry:0];
          }

          id v46 = -[MessageDeliveryController _computeRegPropertiesForNewFeatures:currentRegProperties:currentInterestingProp:]( self,  "_computeRegPropertiesForNewFeatures:currentRegProperties:currentInterestingProp:",  a3,  a14,  a15);
          id v47 = [v46 objectForKey:@"req"];
          id v48 = [v46 objectForKey:@"int"];
          id v49 = objc_msgSend(objc_msgSend(v46, "objectForKey:", @"newFeature"), "BOOLValue");
          int v50 = (int)v49;
          if (IMOSLoggingEnabled(v49, v51))
          {
            uint64_t v52 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              id v53 = [a3 guid];
              unsigned int v54 = @"NO";
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v53;
              *(_WORD *)&buf[12] = 2112;
              if (v50) {
                unsigned int v54 = @"YES";
              }
              *(void *)&buf[14] = v47;
              *(_WORD *)&buf[22] = 2112;
              id v129 = v48;
              __int16 v130 = 2112;
              id v131 = (id)v54;
              _os_log_impl( &dword_0,  v52,  OS_LOG_TYPE_INFO,  "msg guid %@ Required reg properties %@ interesting properties %@ newFeature %@",  buf,  0x2Au);
            }
          }

          if (v50)
          {
            uint64_t v55 = IMBalloonPluginFallbackLinkMetadata([a3 payloadData]);
            v124[0] = _NSConcreteStackBlock;
            v124[1] = 3221225472LL;
            v124[2] = sub_3D190;
            v124[3] = &unk_D6410;
            v124[4] = a3;
            v124[5] = self;
            v124[6] = a6;
            v124[7] = a4;
            v124[8] = a5;
            v124[9] = a7;
            v124[10] = a9;
            v124[11] = v23;
            v124[12] = a20;
            v124[13] = a21;
            id v103 = v124;
            v124[15] = a23;
            v124[14] = v55;
          }

          BYTE1(v97) = a17;
          LOBYTE(v97) = (unint64_t)v99 > 2;
          id v56 = -[MessageDeliveryController idsOptionsWithMessageItem:toID:fromID:sendGUIDData:alternateCallbackID:isBusinessMessage:chatIdentifier:requiredRegProperties:interestingRegProperties:requiresLackOfRegProperties:deliveryContext:isGroupChat:canInlineAttachments:msgPayloadUploadDictionary:messageDictionary:]( self,  "idsOptionsWithMessageItem:toID:fromID:sendGUIDData:alternateCallbackID:isBusinessMessage:chatIdentifie r:requiredRegProperties:interestingRegProperties:requiresLackOfRegProperties:deliveryContext:isGroupCh at:canInlineAttachments:msgPayloadUploadDictionary:messageDictionary:",  a3,  a8,  a6,  v98,  v100,  v28,  a9,  v47,  v48,  a16,  a5,  v97,  a19,  v32);
          uint64_t v58 = IMOSLoggingEnabled(v56, v57);
          if ((_DWORD)v58)
          {
            double v60 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
            uint64_t v58 = os_log_type_enabled(v60, OS_LOG_TYPE_INFO);
            if ((_DWORD)v58)
            {
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = theDict;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a7;
              *(_WORD *)&buf[22] = 2112;
              id v129 = v56;
              __int16 v130 = 2112;
              id v131 = a11;
              _os_log_impl( &dword_0,  v60,  OS_LOG_TYPE_INFO,  "Sending IDS message: %@  from account: %@   options: %@  group: %@",  buf,  0x2Au);
            }
          }

          if (a11)
          {
            if (IMOSLoggingEnabled(v58, v59))
            {
              double v61 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
              if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = a11;
                _os_log_impl(&dword_0, v61, OS_LOG_TYPE_INFO, "Setting toDestinations to be group: %@", buf, 0xCu);
              }
            }
          }

          uint64_t v123 = 0LL;
          uint64_t v122 = 0LL;
          uint64_t v62 = 5LL;
          if ((_DWORD)v28) {
            uint64_t v62 = 6LL;
          }
          Class v63 = (&self->super.isa)[v62];
          v64 = v34;
          if (a11) {
            v64 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:");
          }
          id v65 = +[IMIDSService service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:]( &OBJC_CLASS___IMIDSService,  "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:",  v63,  theDict,  a7,  v64,  300LL,  v56,  &v122,  &v123);
          if ((v65 & 1) == 0)
          {
            if (IMOSLoggingEnabled(v65, v66))
            {
              v67 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
              if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v123;
                _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "IDS sendMessage did not succeed, error %@", buf, 0xCu);
              }
            }

            if ([a3 scheduleType] == (char *)&dword_0 + 2) {
              -[MessageDeliveryController handleScheduledMessageSendFailure:]( self,  "handleScheduledMessageSendFailure:",  a3);
            }
            (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a23 + 2))( a23,  self,  v23,  0,  4,  [a3 backwardsCompatibleVersion]);
          }

          if (v122)
          {
            v108 = (void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))[a23 copy];
            if (IMOSLoggingEnabled(v108, v68))
            {
              id v69 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                id v70 = v34;
                uint64_t v71 = v122;
                unsigned int v72 = +[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread");
                uint64_t v73 = @"NO";
                if (v72) {
                  uint64_t v73 = @"YES";
                }
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v71;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v73;
                _os_log_impl( &dword_0,  v69,  OS_LOG_TYPE_INFO,  "Enqueuing completion block for IDS identifier %@ is main thread? %@",  buf,  0x16u);
                id v34 = v70;
              }
            }

            *(void *)buf = 0LL;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x2020000000LL;
            LOBYTE(v129) = 0;
            v120[0] = _NSConcreteStackBlock;
            v120[1] = 3221225472LL;
            v120[2] = sub_3E928;
            v120[3] = &unk_D6438;
            v120[14] = buf;
            v120[4] = v122;
            v120[5] = self;
            v120[6] = a3;
            v120[7] = theDict;
            BOOL v121 = a17;
            v120[8] = v32;
            v120[9] = a19;
            v120[10] = a6;
            v120[11] = a7;
            v120[13] = v108;
            v120[12] = v23;
            if ([v32 count]) {
              v74 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 100LL);
            }
            else {
              v74 = 0LL;
            }
            -[MessageDeliveryController _enqueueUpdateBlock:willSendBlock:identifier:callbackID:messageCommandOption:]( self,  "_enqueueUpdateBlock:willSendBlock:identifier:callbackID:messageCommandOption:",  v120,  v103,  v122,  v100,  v74);
            _Block_object_dispose(buf, 8);
          }
        }

        else
        {
          if (IMOSLoggingEnabled(v30, v31))
          {
            id v95 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
            if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = a6;
              _os_log_impl(&dword_0, v95, OS_LOG_TYPE_INFO, "We found no account for fromID %@", buf, 0xCu);
            }
          }

          (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a23 + 2))( a23,  self,  v23,  0,  31,  [a3 backwardsCompatibleVersion]);
        }

        goto LABEL_109;
      case 1LL:
        id v75 = [a3 isTypingMessage];
        if ((v75 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v75, v76))
          {
            id v77 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
            if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = [a3 guid];
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a12;
              _os_log_impl(&dword_0, v77, OS_LOG_TYPE_INFO, "Send attachments action  guid %@ (URIs: %@)", buf, 0x16u);
            }
          }
        }

        v125[0] = _NSConcreteStackBlock;
        v125[1] = 3221225472LL;
        v125[2] = sub_3CEBC;
        v125[3] = &unk_D6348;
        v125[4] = a3;
        v125[5] = self;
        v125[6] = a5;
        v125[7] = a6;
        v125[8] = a7;
        v125[9] = a8;
        v125[10] = a9;
        v125[11] = a11;
        v125[12] = a12;
        v125[13] = v23;
        v125[14] = a14;
        v125[15] = a15;
        BOOL v126 = a17;
        v125[16] = a16;
        v125[17] = a19;
        v125[18] = a20;
        v125[19] = a21;
        v125[20] = a22;
        v125[21] = a23;
        if (objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count")) {
          -[MessageDeliveryController _sendAttachmentsForMessage:canSendInline:displayIDs:additionalContext:fromID:recipients:uploadStartTime:fromAccount:completionBlock:]( self,  "_sendAttachmentsForMessage:canSendInline:displayIDs:additionalContext:fromID:recipients:uploadStartTime:from Account:completionBlock:",  a3,  a17,  v23,  a4,  a6,  a12,  v24,  a7,  v125);
        }
        else {
          sub_3CEBC((uint64_t)v125, a3, (uint64_t)v23, (uint64_t)a4, 1, 0);
        }
        break;
      case 2LL:
        id v78 = [a3 isTypingMessage];
        if ((v78 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v78, v79))
          {
            v80 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
            if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = [a3 guid];
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a12;
              _os_log_impl(&dword_0, v80, OS_LOG_TYPE_INFO, "Send payload action  guid %@ (URIs: %@)", buf, 0x16u);
            }
          }
        }

        id v81 = a20;
        if (!a20) {
          id v81 = [a3 payloadData];
        }
        CFMutableDictionaryRef theDicta = (CFMutableDictionaryRef)[v81 _FTCopyGzippedData];
        id v82 = [a3 balloonBundleID];
        if ([v82 isEqualToString:IMBalloonPluginIdentifierRichLinks])
        {
          int v83 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v118 = 0u;
          __int128 v119 = 0u;
          __int128 v116 = 0u;
          __int128 v117 = 0u;
          id v84 = [a3 fileTransferGUIDs];
          id v85 = [v84 countByEnumeratingWithState:&v116 objects:v127 count:16];
          if (v85)
          {
            uint64_t v86 = *(void *)v117;
            do
            {
              for (i = 0LL; i != v85; i = (char *)i + 1)
              {
                if (*(void *)v117 != v86) {
                  objc_enumerationMutation(v84);
                }
                id v88 = -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"),  "transferForGUID:",  *(void *)(*((void *)&v116 + 1) + 8LL * (void)i));
                if (!([v88 isFromMomentShare] & 1 | (v83 == 0))
                  && [v88 localURL])
                {
                  CFArrayAppendValue((CFMutableArrayRef)v83, [v88 localURL]);
                }
              }

              id v85 = [v84 countByEnumeratingWithState:&v116 objects:v127 count:16];
            }

            while (v85);
          }

          if (-[NSMutableArray count](v83, "count"))
          {
            v89 = objc_autoreleasePoolPush();

            CFMutableDictionaryRef theDicta = (CFMutableDictionaryRef)objc_msgSend( (id)IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs( objc_msgSend(a3, "payloadData"),  v83),  "_FTCopyGzippedData");
            if (IMOSLoggingEnabled(theDicta, v90))
            {
              v91 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
              if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
              {
                unsigned int v92 = [a20 isEqual:theDicta];
                id v93 = @"NO";
                if (v92) {
                  id v93 = @"YES";
                }
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v93;
                _os_log_impl(&dword_0, v91, OS_LOG_TYPE_INFO, "Updated payload to send %@", buf, 0xCu);
              }
            }

            objc_autoreleasePoolPop(v89);
          }
        }

        v114[0] = _NSConcreteStackBlock;
        v114[1] = 3221225472LL;
        v114[2] = sub_3EC38;
        v114[3] = &unk_D6460;
        v114[4] = a3;
        v114[5] = self;
        v114[6] = a4;
        v114[7] = a5;
        v114[8] = a6;
        v114[9] = a7;
        v114[10] = a8;
        v114[11] = a9;
        v114[12] = a11;
        v114[13] = a12;
        v114[14] = v23;
        v114[15] = a14;
        v114[16] = a15;
        v114[17] = a16;
        BOOL v115 = a17;
        v114[18] = a20;
        v114[19] = a21;
        v114[20] = a22;
        v114[21] = a23;
        objc_msgSend( -[MessageDeliveryController attachmentController](self, "attachmentController"),  "sendPayloadData:messageGUID:fromID:recipients:completionBlock:",  theDicta,  objc_msgSend(a3, "guid"),  a6,  a12,  v114);

        break;
      case 3LL:
        if (IMOSLoggingEnabled(v26, v27))
        {
          id v94 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
          if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = a12;
            _os_log_impl(&dword_0, v94, OS_LOG_TYPE_INFO, "Send fallback action (Peers: %@)", buf, 0xCu);
          }
        }

        v112[0] = _NSConcreteStackBlock;
        v112[1] = 3221225472LL;
        v112[2] = sub_3EEA0;
        v112[3] = &unk_D6488;
        v112[4] = self;
        v112[5] = a5;
        v112[6] = a6;
        v112[7] = a7;
        v112[8] = a8;
        v112[9] = a9;
        v112[10] = a11;
        v112[11] = a12;
        v112[12] = v23;
        v112[13] = a14;
        v112[14] = a15;
        v112[15] = a16;
        BOOL v113 = a17;
        v112[16] = a19;
        v112[17] = a20;
        v112[20] = a22;
        v112[21] = a23;
        v112[18] = a21;
        v112[19] = a3;
        objc_msgSend( -[MessageDeliveryController attachmentController](self, "attachmentController"),  "sendFallbackAttachmentsForMessage:displayIDs:additionalContext:completionBlock:",  a3,  v23,  a4,  v112);
        break;
      default:
        BOOL v33 = 1;
LABEL_109:
        if (v33 && v108)
        {
          if (IMOSLoggingEnabled(v26, v27))
          {
            id v96 = (os_log_s *)OSLogHandleForIMFoundationCategory("@MessageDelivery");
            if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v96, OS_LOG_TYPE_INFO, "Did not send anything. Failing message", buf, 2u);
            }
          }

          v108[2](v108, self, v23, 0, 22, [a3 backwardsCompatibleVersion]);
        }

        break;
    }
  }

  else if (a23)
  {
    (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a23 + 2))( a23,  self,  v23,  0,  4,  [a3 backwardsCompatibleVersion]);
  }

- (void)handleScheduledMessageSendFailure:(id)a3
{
  id v5 = -[IMDMessageStore messageWithGUID:]( +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"),  "messageWithGUID:",  [a3 guid]);
  if ([v5 scheduleType] == (char *)&dword_0 + 2
    && [v5 scheduleState] == (char *)&dword_0 + 2)
  {
    id v6 = [a3 editedPartIndexes];
    id v7 = [a3 retractedPartIndexes];
    if ([v6 count])
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_3F3A0;
      v19[3] = &unk_D64B0;
      v19[4] = a3;
      id v8 = [v6 enumerateIndexesUsingBlock:v19];
      if (IMOSLoggingEnabled(v8, v9))
      {
        id v10 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "Failed to update the scheduled message. Keeping edit history as is and adding failed part indexes",  buf,  2u);
        }
      }
    }

    if ([v7 count])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_3F3AC;
      v17[3] = &unk_D64B0;
      v17[4] = a3;
      [v7 enumerateIndexesUsingBlock:v17];
      id v11 = objc_msgSend(a3, "setFileTransferGUIDs:", objc_msgSend(a3, "scheduledMessageOriginalTransferGUIDs"));
      if (IMOSLoggingEnabled(v11, v12))
      {
        id v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "Failed to update the scheduled message. Keeping retract history as is and adding failed part indexes",  buf,  2u);
        }
      }
    }

    id v14 = objc_msgSend( -[MessageDeliveryController messageStore](self, "messageStore"),  "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:",  a3,  1,  1,  0,  objc_msgSend(a3, "flags"));
    if (IMOSLoggingEnabled(v14, v15))
    {
      uint64_t v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "Failed to Send Scheduled Message, not updating peer devices with scheduled message.",  buf,  2u);
      }
    }
  }

  else
  {
    objc_msgSend(a3, "setScheduleType:", objc_msgSend(v5, "scheduleType"));
    objc_msgSend(a3, "setScheduleState:", objc_msgSend(v5, "scheduleState"));
    objc_msgSend(a3, "setMessageSummaryInfo:", objc_msgSend(v5, "messageSummaryInfo"));
    objc_msgSend(a3, "setBody:", objc_msgSend(v5, "body"));
    objc_msgSend(a3, "setErrorCode:", objc_msgSend(v5, "errorCode"));
  }

- (BOOL)handleScheduledMessageSend:(id)a3 sentSuccessfully:(BOOL)a4 idsMessage:(id)a5 messageDictionary:(id)a6 canInlineAttachments:(BOOL)a7 msgPayloadUploadDictionary:(id)a8 fromID:(id)a9 fromAccount:(id)a10 originalIDSIdentifier:(id)a11
{
  BOOL v12 = a7;
  id v16 = a3;
  id v18 = [a3 editedPartIndexes];
  id v19 = [v16 retractedPartIndexes];
  if (!a4)
  {
    -[MessageDeliveryController handleScheduledMessageSendFailure:](self, "handleScheduledMessageSendFailure:", v16);
    return 0;
  }

  id v20 = v19;
  if ([v18 count] || (id v21 = objc_msgSend(v20, "count")) != 0)
  {
    id v16 = -[MessageDeliveryController _updateSuccessfulRetractionsForScheduledMessage:]( self,  "_updateSuccessfulRetractionsForScheduledMessage:",  -[MessageDeliveryController _updateSuccessfulEditsForScheduledMessage:]( self,  "_updateSuccessfulEditsForScheduledMessage:",  v16));
    id v21 = objc_msgSend( -[MessageDeliveryController messageStore](self, "messageStore"),  "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:",  v16,  1,  0,  0,  objc_msgSend(v16, "flags"));
  }

  if (IMOSLoggingEnabled(v21, v22))
  {
    id v23 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Preparing to send scheduled message to peer devices.", buf, 2u);
    }
  }

  id v24 = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v16 scheduleType]);
  if (v24) {
    CFDictionarySetValue((CFMutableDictionaryRef)a6, @"st", v24);
  }
  id v25 = objc_msgSend(v16, "time", v24);
  if (v25) {
    CFDictionarySetValue((CFMutableDictionaryRef)a6, @"sd", v25);
  }
  id v26 = (void *)JWEncodeDictionary(a6);
  id v27 = objc_msgSend(objc_msgSend(v16, "fileTransferGUIDs"), "count");
  if (v27 && !v12 || (id v27 = objc_msgSend(objc_msgSend(v16, "payloadData"), "length"), a8) && v27)
  {
    if (IMOSLoggingEnabled(v27, v28))
    {
      id v29 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = [v16 fileTransferGUIDs];
        uint64_t v31 = @"NO";
        if (v12) {
          uint64_t v31 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v30;
        __int16 v61 = 2112;
        uint64_t v62 = v31;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Not compressing data, %@, canInlineAttachments: %@", buf, 0x16u);
      }
    }

    id v32 = v26;
  }

  else
  {
    if (IMOSLoggingEnabled(v27, v28))
    {
      BOOL v33 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = [v16 fileTransferGUIDs];
        id v35 = @"NO";
        if (v12) {
          id v35 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v34;
        __int16 v61 = 2112;
        uint64_t v62 = v35;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Compressing data, %@, canInlineAttachments: %@", buf, 0x16u);
      }
    }

    id v32 = [v26 _FTCopyGzippedData];
  }

  int v36 = v32;
  uint64_t v37 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 100LL);
  uint64_t v38 = IDSGetUUIDData([v16 guid]);
  unsigned int v39 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout);
  uint64_t v40 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v37,  IDSSendMessageOptionCommandKey,  &__kCFBooleanTrue,  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  &__kCFBooleanTrue,  IDSSendMessageOptionWantsResponseKey,  v38,  IDSSendMessageOptionUUIDKey,  v36,  IDSSendMessageOptionDataToEncryptKey,  v39,  IDSSendMessageOptionTimeoutKey,  &__kCFBooleanFalse,  IDSSendMessageOptionEnforceRemoteTimeoutsKey,  0LL);
  uint64_t v67 = IDSRegistrationPropertySupportsSendLaterMessages;
  id v41 = +[NSSet setWithArray:]( &OBJC_CLASS___NSSet,  "setWithArray:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v67, 1LL));
  if (v41) {
    CFDictionarySetValue((CFMutableDictionaryRef)v40, IDSSendMessageOptionRequireAllRegistrationPropertiesKey, v41);
  }
  id v42 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v43 = (void *)IDSCopyBestGuessIDForID(a9);
  if (v43) {
    -[NSMutableSet addObject:](v42, "addObject:", v43);
  }
  else {
    -[IMMetricsCollector forceAutoBugCaptureWithSubType:errorPayload:type:context:]( +[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"),  "forceAutoBugCaptureWithSubType:errorPayload:type:context:",  @"Null IDS Identifier",  0LL,  @"SendLater",  @"IDSCopyBestGuessIDForID returned a null token while trying to send scheduled message to peer devices");
  }
  if (a9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v40, IDSSendMessageOptionFromIDKey, a9);
  }
  id v44 = -[NSMutableSet count](v42, "count");
  id v45 = objc_msgSend(objc_msgSend(objc_msgSend(a10, "devices"), "__imArrayByFilteringWithBlock:", &stru_D64F0), "count");
  uint64_t v47 = (uint64_t)v45;
  if (a10) {
    BOOL v48 = v44 != 0LL;
  }
  else {
    BOOL v48 = 0;
  }
  if ((uint64_t)v45 < 1 || !v48 || (id v45 = [a10 devices]) == 0)
  {
    if (IMOSLoggingEnabled(v45, v46))
    {
      id v53 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        id v54 = [a10 devices];
        uint64_t v55 = @"NO";
        *(_DWORD *)buf = 138413058;
        if (v47 <= 0) {
          id v56 = @"NO";
        }
        else {
          id v56 = @"YES";
        }
        if (v44) {
          uint64_t v55 = @"YES";
        }
        *(void *)&uint8_t buf[4] = v55;
        __int16 v61 = 2112;
        uint64_t v62 = v56;
        __int16 v63 = 2112;
        id v64 = a10;
        __int16 v65 = 2112;
        id v66 = v54;
        _os_log_impl( &dword_0,  v53,  OS_LOG_TYPE_INFO,  "We did not have ids accounts to send scheduled messages out -- bailing {haveTokenURISToSendTo %@ hasPeerDevice sSupportingSendLater %@ idsAccount %@ devices %@}",  buf,  0x2Au);
      }
    }

    return 0;
  }

  *(void *)buf = 0LL;
  id v49 = +[IMIDSService service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:]( &OBJC_CLASS___IMIDSService,  "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:",  self->_idsService,  a5,  a10,  v42,  300LL,  v40,  0LL,  buf);
  BOOL v51 = (char)v49;
  if ((_DWORD)v49)
  {
    if (IMOSLoggingEnabled(v49, v50))
    {
      uint64_t v52 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v59 = 0;
        _os_log_impl( &dword_0,  v52,  OS_LOG_TYPE_INFO,  "IDS successfully sent scheduled message to peer devices",  v59,  2u);
      }
    }
  }

  else
  {
    uint64_t v58 = (os_log_s *)IMLogHandleForCategory("MessageDelivery");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_8FA18();
    }
  }

  return v51;
}

- (id)_updateSuccessfulRetractionsForScheduledMessage:(id)a3
{
  id v5 = [a3 retractedPartIndexes];
  id v6 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_3FCCC;
  v11[3] = &unk_D6518;
  v11[4] = a3;
  v11[5] = self;
  v11[6] = v6;
  [v5 enumerateIndexesUsingBlock:v11];
  id v7 = [v6 count];
  if (v7)
  {
    if (IMOSLoggingEnabled(v7, v8))
    {
      uint64_t v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v6;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "Deleting retracted transfer GUIDs for scheduled message: %@",  buf,  0xCu);
      }
    }

    -[IMDAttachmentStore deleteAttachmentsWithGUIDs:]( +[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"),  "deleteAttachmentsWithGUIDs:",  v6);
  }

  objc_msgSend(a3, "setRetractedPartIndexes:", +[NSIndexSet indexSet](NSIndexSet, "indexSet"));
  return a3;
}

- (id)_updateSuccessfulEditsForScheduledMessage:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_3FDC8;
  v5[3] = &unk_D64B0;
  v5[4] = a3;
  objc_msgSend(objc_msgSend(a3, "editedPartIndexes"), "enumerateIndexesUsingBlock:", v5);
  objc_msgSend(a3, "setEditedPartIndexes:", +[NSIndexSet indexSet](NSIndexSet, "indexSet"));
  return a3;
}

- (id)_fileTransferGUIDsInMessageBody:(id)a3
{
  id v4 = [a3 length];
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_3FE78;
  v7[3] = &unk_D6540;
  v7[4] = v5;
  objc_msgSend(a3, "enumerateAttribute:inRange:options:usingBlock:", IMFileTransferGUIDAttributeName, 0, v4, 0, v7);
  return -[NSMutableOrderedSet array](v5, "array");
}

- (id)_associatedMessageFallbackHashForMessageItem:(id)a3
{
  uint64_t v4 = IMAssociatedMessageDecodeGUID([a3 associatedMessageGUID]);
  return -[MessageDeliveryController _fallbackHashForMessageItemWithGUID:]( self,  "_fallbackHashForMessageItemWithGUID:",  v4);
}

- (id)_threadOriginatorFallbackHashForMessageItem:(id)a3
{
  uint64_t OriginatorGUID = IMMessageThreadIdentifierGetOriginatorGUID([a3 threadIdentifier]);
  return -[MessageDeliveryController _fallbackHashForMessageItemWithGUID:]( self,  "_fallbackHashForMessageItemWithGUID:",  OriginatorGUID);
}

- (id)_fallbackHashForMessageItemWithGUID:(id)a3
{
  id v4 = objc_msgSend( -[IMDMessageStore messageWithGUID:]( +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"),  "messageWithGUID:",  a3),  "fallbackHash");
  if (IMOSLoggingEnabled(v4, v5))
  {
    id v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 134218242;
      id v9 = [v4 length];
      __int16 v10 = 2112;
      id v11 = a3;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "Using fallback hash with length %llu for message GUID %@",  (uint8_t *)&v8,  0x16u);
    }
  }

  return v4;
}

- (BOOL)_hasRecentlyMessaged:(id)a3
{
  return -[IMDRecentsController hasRecentlyMessaged:]( +[IMDRecentsController sharedInstance](&OBJC_CLASS___IMDRecentsController, "sharedInstance"),  "hasRecentlyMessaged:",  a3);
}

- (void)noteRecentMessageForPeople:(id)a3
{
}

- (void)updateLatestActiveDestination:(id)a3 ForHandle:(id)a4 incomingType:(unsigned __int8)a5
{
}

- (id)activeDeviceForHandle:(id)a3
{
  return -[IMDRecentsController activeDeviceForHandle:]( +[IMDRecentsController sharedInstance](&OBJC_CLASS___IMDRecentsController, "sharedInstance"),  "activeDeviceForHandle:",  a3);
}

- (id)_receivingDevicesForHandle:(id)a3 skippedDestinations:(id)a4
{
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = -[MessageDeliveryController activeDeviceForHandle:](self, "activeDeviceForHandle:", a3);
  if (v8)
  {
    id v9 = v8;
    id v10 = [v8 idsDestination];
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v11 = [a4 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v11)
    {
      uint64_t v13 = *(void *)v32;
      *(void *)&__int128 v12 = 138412290LL;
      __int128 v26 = v12;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(a4);
          }
          id v15 = objc_msgSend(v10, "isEqualToString:", *(void *)(*((void *)&v31 + 1) + 8 * (void)i), v26);
          if ((_DWORD)v15)
          {
            if (IMOSLoggingEnabled(v15, v16))
            {
              int v17 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v26;
                uint64_t v37 = v9;
                _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Found skipped active device %@", buf, 0xCu);
              }
            }

            id v18 = [v9 shouldSendTypingIndicator];
            if ((_DWORD)v18)
            {
              if (IMOSLoggingEnabled(v18, v19))
              {
                id v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("Delivery");
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v26;
                  uint64_t v37 = v9;
                  _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Sending typing indicator to device %@", buf, 0xCu);
                }
              }

              -[NSMutableSet addObject:](v7, "addObject:", v10);
            }
          }
        }

        id v11 = [a4 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }

      while (v11);
    }
  }

  else
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v21 = [a4 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v28;
      do
      {
        for (j = 0LL; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(a4);
          }
          id v24 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)j);
        }

        id v21 = [a4 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }

      while (v21);
    }
  }

  return -[NSMutableSet copy](v7, "copy");
}

- (id)_receivingDevicesForParticipants:(id)a3 skippedDestinations:(id)a4
{
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_40450;
  v9[3] = &unk_D6568;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = v7;
  [a3 enumerateObjectsUsingBlock:v9];
  return -[NSMutableSet copy](v7, "copy");
}

- (void)_enqueueSendMessageWorkBlock:(id)a3 forURIs:(id)a4
{
  if (a3)
  {
    id v7 = [a4 count];
    if (v7)
    {
      if (IMOSLoggingEnabled(v7, v8))
      {
        id v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("Delivery");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          id v12 = a4;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Enqueueing block for set: %@", (uint8_t *)&v11, 0xCu);
        }
      }

      deliveryQueues = self->_deliveryQueues;
      if (!deliveryQueues)
      {
        deliveryQueues = objc_alloc_init(&OBJC_CLASS___IMMultiQueue);
        self->_deliveryQueues = deliveryQueues;
      }

      -[IMMultiQueue addBlock:withTimeout:forKey:description:]( deliveryQueues,  "addBlock:withTimeout:forKey:description:",  a3,  a4,  @"enqueued message",  300.0);
    }

    else
    {
      (*((void (**)(id, void))a3 + 2))(a3, 0LL);
    }
  }

- (void)sendMessage:(id)a3 context:(id)a4 groupContext:(id)a5 toGroup:(id)a6 toParticipants:(id)a7 originallyToParticipants:(id)a8 fromID:(id)a9 fromAccount:(id)a10 chatIdentifier:(id)a11 originalPayload:(id)a12 replyToMessageGUID:(id)a13 fakeSavedReceiptBlock:(id)a14 completionBlock:(id)a15
{
  if (IMOSLoggingEnabled(self, a2))
  {
    id v20 = (os_log_s *)OSLogHandleForIMEventCategory("MessageDelivery");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413570;
      id v50 = [a3 guid];
      __int16 v51 = 2112;
      id v52 = a7;
      __int16 v53 = 2112;
      id v54 = a9;
      __int16 v55 = 2112;
      id v56 = a10;
      __int16 v57 = 2112;
      id v58 = a4;
      __int16 v59 = 2112;
      id v60 = a11;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Send Message: %@  to people: %@  fromPeer: %@ fromAccount %@ context: %@, chat identifier %@",  buf,  0x3Eu);
    }
  }

  id v21 = [a3 isTypingMessage];
  if ((v21 & 1) == 0)
  {
    uint64_t v23 = IMOSLoggingEnabled(v21, v22);
    if ((_DWORD)v23)
    {
      id v25 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      uint64_t v23 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
      if ((_DWORD)v23)
      {
        unsigned int v26 = -[NetworkChangeNotifier linkQualityValueForInterfaceType:]( +[NetworkChangeNotifier sharedInstance]( &OBJC_CLASS___NetworkChangeNotifier,  "sharedInstance"),  "linkQualityValueForInterfaceType:",  3LL);
        *(_DWORD *)buf = 67109120;
        LODWORD(v50) = v26;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "  Cell Link Quality: %d", buf, 8u);
      }
    }

    if (IMOSLoggingEnabled(v23, v24))
    {
      __int128 v27 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        unsigned int v28 = -[NetworkChangeNotifier linkQualityValueForInterfaceType:]( +[NetworkChangeNotifier sharedInstance]( &OBJC_CLASS___NetworkChangeNotifier,  "sharedInstance"),  "linkQualityValueForInterfaceType:",  2LL);
        *(_DWORD *)buf = 67109120;
        LODWORD(v50) = v28;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "  WiFi Link Quality: %d", buf, 8u);
      }
    }
  }

  id v29 = [a7 count];
  if (v29)
  {
    if (a9 && a10)
    {
      BOOL v31 = -[MessageDeliveryController _hasRecentlyMessaged:](self, "_hasRecentlyMessaged:", a7);
      if (v31) {
        goto LABEL_31;
      }
      if (IMOSLoggingEnabled(v31, v32))
      {
        __int128 v33 = (os_log_s *)OSLogHandleForIMFoundationCategory("Delivery");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = a7;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "We have no session to %@", buf, 0xCu);
        }
      }

      id v34 = [a3 isTypingMessage];
      if (!(_DWORD)v34)
      {
LABEL_31:
        unsigned __int8 v39 = [a3 isTypingMessage];
        id v40 = PeopleSetByAddingMyID(a9, a8);
        id v41 = a7;
        if ((v39 & 1) == 0) {
          id v41 = PeopleSetByAddingMyID(a9, a7);
        }
        id v42 = [a3 balloonBundleID];
        id v43 = [v42 isEqualToString:IMBalloonPluginIdentifierRichLinks];
        if ((_DWORD)v43)
        {
          if (IMOSLoggingEnabled(v43, v44))
          {
            id v45 = (os_log_s *)OSLogHandleForIMFoundationCategory("Delivery");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Refreshing rich link message", buf, 2u);
            }
          }

          a3 = -[IMDMessageStore messageWithGUID:]( +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"),  "messageWithGUID:",  [a3 guid]);
        }

        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_40BCC;
        v48[3] = &unk_D65E0;
        v48[4] = a3;
        v48[5] = a9;
        v48[6] = a5;
        v48[7] = self;
        v48[8] = a4;
        v48[9] = a10;
        v48[10] = a11;
        v48[11] = a6;
        v48[12] = v40;
        v48[13] = a12;
        v48[14] = a13;
        v48[16] = a14;
        v48[17] = a15;
        v48[15] = v41;
        -[MessageDeliveryController _enqueueSendMessageWorkBlock:forURIs:]( self,  "_enqueueSendMessageWorkBlock:forURIs:",  v48,  v40);
        -[MessageDeliveryController noteRecentMessageForPeople:](self, "noteRecentMessageForPeople:", a7);
      }

      else
      {
        if (IMOSLoggingEnabled(v34, v35))
        {
          int v36 = (os_log_s *)OSLogHandleForIMFoundationCategory("Delivery");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            id v37 = [a3 guid];
            *(_DWORD *)buf = 138412290;
            id v50 = v37;
            _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "%@ is a typing indicator, marking as delivery success",  buf,  0xCu);
          }
        }

        if (a15) {
          (*((void (**)(id, MessageDeliveryController *, id, uint64_t, void, id))a15 + 2))( a15,  self,  a7,  1,  0,  [a3 backwardsCompatibleVersion]);
        }
      }
    }

    else
    {
      if (IMOSLoggingEnabled(v29, v30))
      {
        uint64_t v38 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v50 = a3;
          __int16 v51 = 2112;
          id v52 = a9;
          __int16 v53 = 2112;
          id v54 = a10;
          _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_INFO,  "*********** Failing message: %@    empty source ID or idsAccount supplied (%@:%@)",  buf,  0x20u);
        }
      }

      if (a15) {
        (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a15 + 2))( a15,  self,  a7,  0,  33,  [a3 backwardsCompatibleVersion]);
      }
    }
  }

  else if (a15)
  {
    (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a15 + 2))( a15,  self,  a7,  0,  21,  [a3 backwardsCompatibleVersion]);
  }

- (void)sendMessageError:(int64_t)a3 toToken:(id)a4 toID:(id)a5 toGroup:(id)a6 fromID:(id)a7 fromAccount:(id)a8 forMessageID:(id)a9 completionBlock:(id)a10
{
  if (IMOSLoggingEnabled(self, a2))
  {
    int v17 = (os_log_s *)OSLogHandleForIMEventCategory("MessageDelivery");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219010;
      int64_t v25 = a3;
      __int16 v26 = 2112;
      id v27 = a9;
      __int16 v28 = 2112;
      id v29 = a4;
      __int16 v30 = 2112;
      id v31 = a5;
      __int16 v32 = 2112;
      id v33 = a7;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "Sending MessageError: %ld  forMessageID: %@  to token: %@  toPeer: %@  fromPeer: %@",  buf,  0x34u);
    }
  }

  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v19 = (const void *)IDSGetUUIDData(a9);
  if (v19) {
    CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSFailedUUIDKey, v19);
  }
  if (a9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSFailedMessageIDKey, a9);
  }
  id v20 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3);
  if (v20) {
    CFDictionarySetValue((CFMutableDictionaryRef)v18, IDSFailureReasonKey, v20);
  }
  id v21 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 120LL);
  uint64_t v22 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  &__kCFBooleanTrue,  IDSSendMessageOptionWantsResponseKey,  v21,  IDSSendMessageOptionCommandKey,  0LL);
  if (a4) {
    a5 = (id)IDSCopyIDForTokenWithID(a4, a5);
  }
  else {
    id v23 = a5;
  }
  -[MessageDeliveryController sendMessageDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:completionBlock:]( self,  "sendMessageDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:completionBlock:",  v18,  a7,  a8,  +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a5),  a6,  300LL,  v22,  a10);
}

- (void)sendMessageErrorWithInfo:(int64_t)a3 toToken:(id)a4 toID:(id)a5 toGroup:(id)a6 fromID:(id)a7 fromAccount:(id)a8 forMessageID:(id)a9 additionalInfo:(id)a10 fileSize:(id)value failureTimeSeconds:(double)a12 failReasonMessage:(id)a13 completionBlock:(id)a14
{
  if (IMOSLoggingEnabled(self, a2))
  {
    id v21 = (os_log_s *)OSLogHandleForIMEventCategory("MessageDelivery");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219266;
      int64_t v31 = a3;
      __int16 v32 = 2112;
      id v33 = a9;
      __int16 v34 = 2112;
      id v35 = a4;
      __int16 v36 = 2112;
      id v37 = a5;
      __int16 v38 = 2112;
      id v39 = a7;
      __int16 v40 = 2112;
      id v41 = a10;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "Sending MessageError: %ld  forMessageID: %@  to token: %@  toPeer: %@  fromPeer: %@ additionalInfo: %@",  buf,  0x3Eu);
    }
  }

  uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v23 = (const void *)IDSGetUUIDData(a9);
  if (v23) {
    CFDictionarySetValue((CFMutableDictionaryRef)v22, IDSFailedUUIDKey, v23);
  }
  if (a9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v22, IDSFailedMessageIDKey, a9);
  }
  uint64_t v24 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3);
  if (v24) {
    CFDictionarySetValue((CFMutableDictionaryRef)v22, IDSFailureReasonKey, v24);
  }
  if (a10) {
    CFDictionarySetValue((CFMutableDictionaryRef)v22, @"aDI", a10);
  }
  if (value) {
    CFDictionarySetValue((CFMutableDictionaryRef)v22, @"fFS", value);
  }
  if (IMSendAdditionalMMCSErrorInfoToMadrid())
  {
    if (a13) {
      CFDictionarySetValue((CFMutableDictionaryRef)v22, @"fRM", a13);
    }
    int64_t v25 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", llround(a12 * 1000.0));
    if (v25) {
      CFDictionarySetValue((CFMutableDictionaryRef)v22, @"fTE", v25);
    }
  }

  __int16 v26 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 120LL);
  id v27 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  &__kCFBooleanTrue,  IDSSendMessageOptionWantsResponseKey,  v26,  IDSSendMessageOptionCommandKey,  0LL);
  if (a4) {
    a5 = (id)IDSCopyIDForTokenWithID(a4, a5);
  }
  else {
    id v28 = a5;
  }
  -[MessageDeliveryController sendMessageDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:completionBlock:]( self,  "sendMessageDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:completionBlock:",  v22,  a7,  a8,  +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a5),  a6,  300LL,  v27,  a14);
}

- (void)sendBubblePayloadMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 completionBlock:(id)a10
{
  id v17 = PeopleSetByAddingMyID(a4, [a6 allObjects]);
  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v17;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Enqueing message payload block for people %@", buf, 0xCu);
    }
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_42464;
  v20[3] = &unk_D6608;
  v20[4] = v17;
  v20[5] = self;
  v20[6] = a3;
  v20[7] = a4;
  v20[8] = a5;
  v20[9] = a6;
  v20[10] = a7;
  v20[11] = a9;
  v20[12] = a10;
  v20[13] = a8;
  -[MessageDeliveryController _enqueueSendMessageWorkBlock:forURIs:]( self,  "_enqueueSendMessageWorkBlock:forURIs:",  v20,  v17);
}

- (void)sendMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 willSendBlock:(id)a10 completionBlock:(id)a11
{
}

- (void)sendMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 completionBlock:(id)a10
{
}

- (void)failMessageSendWithMessageDictionary:(id)a3 URIs:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  if (IMOSLoggingEnabled(self, a2))
  {
    int v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageService");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412802;
      id v13 = a3;
      __int16 v14 = 2112;
      id v15 = a4;
      __int16 v16 = 2112;
      id v17 = a5;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "IDS sendMessage for message %@ to URIs %@ did not succeed, error %@",  (uint8_t *)&v12,  0x20u);
    }
  }

  if (a6) {
    (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, void))a6 + 2))( a6,  self,  [a4 allObjects],  0,  4,  0);
  }
}

- (void)sendMessageDictionary:(id)a3 encryptDictionary:(BOOL)a4 fromID:(id)a5 fromAccount:(id)a6 toURIs:(id)a7 toGroup:(id)a8 priority:(int64_t)a9 options:(id)a10 willSendBlock:(id)a11 callCompletionOnSuccess:(BOOL)a12 completionBlock:(id)a13
{
  uint64_t v55 = 0LL;
  uint64_t v56 = 0LL;
  if (a6)
  {
    BOOL v18 = a4;
    [a10 objectForKeyedSubscript:IDSSendMessageOptionCommandKey];
    uint64_t v19 = (NSMutableDictionary *)[a10 mutableCopy];
    if (!v19) {
      uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v20 = +[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID");
    if (v20)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v19, IDSSendMessageOptionAlternateCallbackIdentifierKey, v20);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_8FBFC();
    }

    if (a5) {
      CFDictionarySetValue((CFMutableDictionaryRef)v19, IDSSendMessageOptionFromIDKey, a5);
    }
    CFDictionarySetValue((CFMutableDictionaryRef)v19, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
    CFDictionarySetValue((CFMutableDictionaryRef)v19, IDSSendMessageOptionTimeoutKey, &off_DB768);
    if (v18 && [a3 count])
    {
      id v21 = (void *)JWEncodeDictionary(a3);
      id v22 = [v21 _FTCopyGzippedData];
      uint64_t v24 = IMOSLoggingEnabled(v22, v23);
      if ((_DWORD)v24)
      {
        __int16 v26 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        uint64_t v24 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
        if ((_DWORD)v24)
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)__int16 v59 = [v21 length];
          *(_WORD *)&v59[4] = 1024;
          *(_DWORD *)&v59[6] = [v22 length];
          _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_INFO,  "Compressed message data from: %u to: %u in sendMessageDictionary",  buf,  0xEu);
        }
      }

      if (IMOSLoggingEnabled(v24, v25))
      {
        id v27 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          unsigned int v28 = [v22 length];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)__int16 v59 = v28;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Adding data to be encrypted of size %u", buf, 8u);
        }
      }

      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v22, IDSSendMessageOptionDataToEncryptKey);
    }

    id v29 = [a6 serviceName];
    id v30 = [v29 isEqualToString:IDSServiceNameiMessageForBusiness];
    int v32 = (int)v30;
    uint64_t v33 = 5LL;
    if ((_DWORD)v30) {
      uint64_t v33 = 6LL;
    }
    Class v34 = (&self->super.isa)[v33];
    if (IMOSLoggingEnabled(v30, v31))
    {
      id v35 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        __int16 v36 = @"NO";
        *(_DWORD *)buf = 138413058;
        *(void *)__int16 v59 = a6;
        *(_WORD *)&v59[8] = 2112;
        if (v32) {
          __int16 v36 = @"YES";
        }
        id v60 = a8;
        __int16 v61 = 2112;
        Class v62 = v34;
        __int16 v63 = 2112;
        id v64 = v36;
        _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "sendMessageDictionary - got account %@ to engroup: %@ using IDSService: %@ isBusinessMessage: %@",  buf,  0x2Au);
      }
    }

    id v37 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  a3);
    v57[0] = MessageDictionaryMeCardSharingAudienceKey;
    v57[1] = MessageDictionaryMeCardSharingEnabledKey;
    v57[2] = MessageDictionaryMeCardSharingNameForkedKey;
    v57[3] = MessageDictionaryMeCardSharingImageForkedKey;
    v57[4] = MessageDictionaryPendingNicknameUpdatesHandlesKey;
    v57[5] = MessageDictionaryPendingNicknameUpdatesRecordIDsKey;
    v57[6] = MessageDictionaryCurrentNicknameUpdatesRecordIDsKey;
    v57[7] = MessageDictionaryArchivedNicknameUpdatesRecordIDsKey;
    v57[8] = MessageDictionaryPersonalNicknameRecordIDKey;
    v57[9] = MessageDictionaryPersonalNicknameDecryptKeyKey;
    v57[10] = MessageDictionaryNicknameDenyAllowListVersionKey;
    v57[11] = MessageDictionaryNicknameDenyListKey;
    v57[12] = MessageDictionaryNicknameAllowListKey;
    v57[13] = MessageDictionaryNicknameTransitionedListKey;
    v57[14] = MessageDictionaryNicknameActiveListKey;
    v57[15] = MessageDictionaryNicknameIgnoredListKey;
    v57[16] = MessageDictionaryNicknameRequestPersonalNicknameInfoKey;
    v57[17] = MessageDictionaryNicknameParticipantTruncatedRIDKey;
    v57[18] = MessageDictionaryNicknameTransitionedListVersionKey;
    v57[19] = MessageDictionaryNicknameActiveListVersionKey;
    v57[20] = MessageDictionaryNicknameIgnoredListVersionKey;
    v57[21] = MessageDictionaryNicknameWallpaperTagKey;
    v57[22] = MessageDictionaryNicknameLowResWallpaperTagKey;
    v57[23] = MessageDictionaryNicknameWallpaperMetadataTagKey;
    v57[24] = MessageDictionaryNicknameCloudKitRecordKey;
    v57[25] = MessageDictionaryNicknameCloudKitDecryptionRecordKey;
    v57[26] = MessageDictionaryNicknameUpdateInfoIncluded;
    v57[27] = MessageDictionaryWallpaperUpdateKey;
    v57[28] = @"cID";
    __int16 v38 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 29LL);
    -[NSMutableDictionary removeObjectsForKeys:](v37, "removeObjectsForKeys:", v38);
    if (-[NSMutableDictionary objectForKey:](v37, "objectForKey:", @"pID"))
    {
      id v39 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  -[NSMutableDictionary objectForKey:](v37, "objectForKey:", @"pID"));
      -[NSMutableDictionary removeObjectsForKeys:](v39, "removeObjectsForKeys:", v38);
      -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:", v39, @"pID");
    }

    __int16 v40 = (NSSet *)a7;
    if (a8) {
      __int16 v40 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a8);
    }
    unsigned int v41 = +[IMIDSService service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:]( &OBJC_CLASS___IMIDSService,  "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:",  v34,  v37,  a6,  v40,  a9,  v19,  &v55,  &v56);

    if (a13 && ((v41 ^ 1) & 1) == 0 && v55)
    {
      id v42 = [a7 allObjects];
      if (IMOSLoggingEnabled(v42, v43))
      {
        uint64_t v44 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          id v45 = [v42 count];
          *(_DWORD *)buf = 134217984;
          *(void *)__int16 v59 = v45;
          _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "Result URIs Size: %lu", buf, 0xCu);
        }
      }

      id v46 = [a13 copy];
      if (IMOSLoggingEnabled(v46, v47))
      {
        BOOL v48 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)__int16 v59 = v55;
          _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "Enqueuing completion block for IDS identifier %@", buf, 0xCu);
        }
      }

      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_42FA4;
      v53[3] = &unk_D6630;
      BOOL v54 = a12;
      v53[4] = v55;
      v53[5] = self;
      v53[6] = v42;
      v53[7] = v46;
      id v49 = -[MessageDeliveryController _enqueueUpdateBlock:willSendBlock:identifier:callbackID:messageCommandOption:]( self,  "_enqueueUpdateBlock:willSendBlock:identifier:callbackID:messageCommandOption:",  v53,  a11);
      if (IMOSLoggingEnabled(v49, v50))
      {
        __int16 v51 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageService");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)__int16 v59 = v55;
          *(_WORD *)&v59[8] = 2112;
          id v60 = a3;
          _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Received IDS identifier %@ for message %@", buf, 0x16u);
        }
      }
    }

    else
    {
      -[MessageDeliveryController failMessageSendWithMessageDictionary:URIs:error:completionHandler:]( self,  "failMessageSendWithMessageDictionary:URIs:error:completionHandler:",  a3,  a7,  v56,  a13);
    }
  }

  else
  {
    -[MessageDeliveryController failMessageSendWithMessageDictionary:URIs:error:completionHandler:]( self,  "failMessageSendWithMessageDictionary:URIs:error:completionHandler:",  a3,  a7,  0LL,  a13,  a7,  a8);
  }

- (void)sendMessageDictionary:(id)a3 encryptDictionary:(BOOL)a4 fromID:(id)a5 fromAccount:(id)a6 toURIs:(id)a7 toGroup:(id)a8 priority:(int64_t)a9 options:(id)a10 willSendBlock:(id)a11 completionBlock:(id)a12
{
  LOBYTE(v12) = 0;
  -[MessageDeliveryController sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:callCompletionOnSuccess:completionBlock:]( self,  "sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:callComplet ionOnSuccess:completionBlock:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  v12,  a12);
}

- (void)sendCloseSessionMessageDictionary:(id)a3 toBusinessURI:(id)a4 fromURI:(id)a5 fromAccount:(id)a6 completionBlock:(id)a7
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v12 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = a4;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "sendCloseSessionMessageDictionary for biz URI: %@", buf, 0xCu);
    }
  }

  uint64_t IsBusinessID = IMStringIsBusinessID(a4);
  if ((IsBusinessID & 1) != 0)
  {
    id v15 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", a4, a5, 0LL);
    id v16 = +[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID");
    id v17 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 170LL);
    uint64_t v18 = IDSGetUUIDData(v16);
    uint64_t v19 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IDSMaxMessageTimeout);
    id v20 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v17,  IDSSendMessageOptionCommandKey,  v18,  IDSSendMessageOptionUUIDKey,  v19,  IDSSendMessageOptionTimeoutKey,  a5,  IDSSendMessageOptionFromIDKey,  &__kCFBooleanTrue,  IDSSendMessageOptionWantsResponseKey,  &__kCFBooleanFalse,  IDSSendMessageOptionEnforceRemoteTimeoutsKey,  0LL);
    id v21 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3);
    if (objc_msgSend( +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"),  "isBIAEnabled"))
    {
      id v22 = -[MessageDeliveryController _chatForChatIdentifier:](self, "_chatForChatIdentifier:", a4);
      if ([v22 containsActiveBIASession])
      {
        id v23 = [v22 BIAContext];
        if ([v23 count])
        {
          if ([v23 count]) {
            CFDictionarySetValue((CFMutableDictionaryRef)v21, @"bcon", v23);
          }
        }
      }
    }

    -[MessageDeliveryController sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:completionBlock:]( self,  "sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:completionBlock:",  -[NSMutableDictionary copy](v21, "copy"),  1LL,  a5,  a6,  v15,  0LL,  300LL,  v20,  0LL,  0LL);
    if (a7) {
      (*((void (**)(id, MessageDeliveryController *, NSArray *, void, uint64_t, void))a7 + 2))( a7,  self,  -[NSSet allObjects](v15, "allObjects"),  0LL,  4LL,  0LL);
    }
  }

  else if (IMOSLoggingEnabled(IsBusinessID, v14))
  {
    uint64_t v24 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = a4;
      _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_INFO,  "sendCloseSessionMessageDictionary called for non biz URI: %@",  buf,  0xCu);
    }
  }

- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4
{
  if (IMOSLoggingEnabled(self, a2))
  {
    id v7 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Sending message to local device", buf, 2u);
    }
  }

  if (-[MessageDeliveryController localDevice](self, "localDevice"))
  {
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    id v9 = objc_alloc(&OBJC_CLASS___NSSet);
    id v10 = -[NSSet initWithObjects:](v9, "initWithObjects:", IDSDefaultPairedDevice, 0LL);
    uint64_t v32 = IDSSendMessageOptionLocalDeliveryKey;
    uint64_t v33 = &__kCFBooleanTrue;
    int v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL);
    if (a3)
    {
      id v12 = [a4 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryDictKey];
      v30[0] = IMDRelayLocalMessageDictionaryGUIDKey;
      v31[0] = objc_msgSend(v12, "objectForKeyedSubscript:");
      v30[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
      v31[1] = objc_msgSend(v12, "objectForKeyedSubscript:");
      v30[2] = IMDRelayLocalMessageDictionaryTypeKey;
      v31[2] = IMDRelayLocalMessageTypeRemoteFileResponse;
      id v13 = -[IDSService sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:]( self->_idsService,  "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:",  a3,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL),  v10,  300LL,  v11,  &v23,  &v22);
      id v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      id v16 = @"NO";
      if ((_DWORD)v13) {
        id v16 = @"YES";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v22;
      __int16 v26 = 2112;
      id v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      id v17 = "Sending message to local device using file transfer (error %@) success: %@ with Identifier %@";
    }

    else
    {
      id v13 = +[IMIDSService service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:]( &OBJC_CLASS___IMIDSService,  "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:",  self->_idsService,  a4,  0LL,  v10,  300LL,  v11,  &v23,  &v22);
      id v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      id v20 = @"NO";
      if ((_DWORD)v13) {
        id v20 = @"YES";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v22;
      __int16 v26 = 2112;
      id v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      id v17 = "Sending message to local device as data payload (error %@) success: %@ with Identifier %@";
    }

    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, v17, buf, 0x20u);
LABEL_21:

    return (char)v13;
  }

  if (IMOSLoggingEnabled(0LL, v8))
  {
    uint64_t v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "No Local Device Found, unable to send message", buf, 2u);
    }
  }

  LOBYTE(v13) = 0;
  return (char)v13;
}

- (BOOL)sendToLocalPeers:(id)a3
{
  return -[MessageDeliveryController sendToLocalPeersFile:dictionary:]( self,  "sendToLocalPeersFile:dictionary:",  0LL,  a3);
}

- (id)localDevice
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v2 = -[IDSService devices](self->_idsService, "devices", 0LL);
  uint64_t v3 = (uint64_t)[v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  uint64_t v5 = v3;
  if (v3)
  {
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      if ([v8 isDefaultPairedDevice])
      {
        id v9 = [v8 isConnected];
        if ((_DWORD)v9) {
          break;
        }
      }

      if (v5 == ++v7)
      {
        uint64_t v3 = (uint64_t)[v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
        uint64_t v5 = v3;
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }

    uint64_t v3 = IMOSLoggingEnabled(v9, v10);
    if ((_DWORD)v3)
    {
      int v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      uint64_t v3 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if ((_DWORD)v3)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v8;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Found default paired device which is connected: %@", buf, 0xCu);
      }
    }

    if (v8) {
      return v8;
    }
  }

- (id)pairedDevice
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v2 = -[IDSService devices](self->_idsService, "devices", 0LL);
  uint64_t v3 = (uint64_t)[v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  uint64_t v5 = v3;
  if (v3)
  {
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      id v9 = [v8 isActive];
      if ((_DWORD)v9) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v3 = (uint64_t)[v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
        uint64_t v5 = v3;
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }

    uint64_t v3 = IMOSLoggingEnabled(v9, v10);
    if ((_DWORD)v3)
    {
      int v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      uint64_t v3 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if ((_DWORD)v3)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v8;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Found paired device: %@", buf, 0xCu);
      }
    }

    if (v8) {
      return v8;
    }
  }

- (id)idsDeviceFromPushToken:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = -[IDSService devices](self->_idsService, "devices", 0LL);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (id)idsDeviceForFromID:(id)a3
{
  return -[IDSService deviceForFromID:](self->_idsService, "deviceForFromID:", a3);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  if (IMOSLoggingEnabled(self, a2))
  {
    __int128 v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int128 v12 = @"NO";
      int v13 = 138413058;
      id v14 = a3;
      __int16 v15 = 2112;
      if (v8) {
        __int128 v12 = @"YES";
      }
      id v16 = a5;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = a7;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "Service %@ sent Message with ID %@ and sucess %@ with Error %@",  (uint8_t *)&v13,  0x2Au);
    }
  }

- (void)service:(id)a3 didCancelMessageWithSuccess:(BOOL)a4 error:(id)a5 identifier:(id)a6
{
  BOOL v8 = a4;
  if (IMOSLoggingEnabled(self, a2))
  {
    __int128 v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int128 v12 = @"NO";
      *(_DWORD *)id v20 = 138413058;
      *(void *)&v20[4] = a3;
      *(_WORD *)&v20[12] = 2112;
      if (v8) {
        __int128 v12 = @"YES";
      }
      *(void *)&void v20[14] = a6;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = a5;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "Service %@ tried to cancel Message with ID %@ and sucess %@ with Error %@",  v20,  0x2Au);
    }
  }

  if (-[NSMutableDictionary objectForKey:]( self->_pendingCancelScheduledMessageGUIDs,  "objectForKey:",  a6,  *(_OWORD *)v20))
  {
    id v14 = -[NSMutableDictionary objectForKey:](self->_pendingCancelScheduledMessageGUIDs, "objectForKey:", a6);
    id v15 = [v14 objectAtIndexedSubscript:0];
    id v16 = objc_msgSend(objc_msgSend(v14, "objectAtIndexedSubscript:", 1), "integerValue");
    id v17 = -[IMDMessageStore messageWithGUID:]( +[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"),  "messageWithGUID:",  v15);
    if (v17)
    {
      uint64_t v18 = (char *)[v17 scheduleType];
      if (v18 == (_BYTE *)&dword_0 + 2)
      {
        objc_msgSend( objc_msgSend(objc_loadWeak((id *)&self->_session), "scheduledMessageCoordinator"),  "informOfCancelledMessageWithMessageGUID:success:cancelType:error:",  v15,  v8,  v16,  a5);
      }

      else if (v18 == (_BYTE *)&dword_0 + 1)
      {
        objc_msgSend( +[IMSafetyMonitorCoordinator sharedCoordinator](IMSafetyMonitorCoordinator, "sharedCoordinator"),  "informOfCancelledScheduledMessageSendWithMessageGUID:sentSuccessfully:error:",  v15,  v8,  a5);
      }
    }

    -[NSMutableDictionary removeObjectForKey:](self->_pendingCancelScheduledMessageGUIDs, "removeObjectForKey:", a6);
    if (!-[NSMutableDictionary count](self->_pendingCancelScheduledMessageGUIDs, "count"))
    {

      self->_pendingCancelScheduledMessageGUIDs = 0LL;
    }
  }

  else if (IMOSLoggingEnabled(0LL, v13))
  {
    __int16 v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v20 = 138412290;
      *(void *)&v20[4] = a6;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Failed to find a messageGUID for idsIdentifier: %@", v20, 0xCu);
    }
  }

- (void)_sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 fromID:(id)a7 recipients:(id)a8 uploadStartTime:(id)a9 fromAccount:(id)a10 completionBlock:(id)a11
{
  v11[1] = 3221225472LL;
  v11[2] = sub_44104;
  v11[3] = &unk_D6658;
  v11[4] = a9;
  v11[5] = self;
  v11[6] = a10;
  v11[0] = _NSConcreteStackBlock;
  objc_msgSend( -[MessageDeliveryController attachmentController](self, "attachmentController"),  "sendAttachmentsForMessage:canSendInline:displayIDs:additionalContext:mode:fromID:recipients:completionBlock:uploadFailureBlock:",  a3,  a4,  a5,  a6,  0,  a7,  a8,  a11,  v11);
}

- (void)sendEditedMessage:(id)a3 partIndex:(int64_t)a4 editType:(unint64_t)a5 destinations:(id)a6 chatIdentifier:(id)a7 account:(id)a8 fromID:(id)a9 backwardCompatabilityText:(id)a10 unsupportedDestinationsHandler:(id)a11 completionBlock:(id)a12
{
  id v17 = +[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID");
  id v18 = [a3 guid];
  if (![v18 length]) {
    -[IMMetricsCollector forceAutoBugCaptureWithSubType:errorPayload:]( +[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"),  "forceAutoBugCaptureWithSubType:errorPayload:",  @"Sending Edited Message with no GUID",  0LL);
  }
  id v19 = [a10 length];
  if (v19)
  {
    id v19 = +[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID");
    id v50 = v19;
  }

  else
  {
    id v50 = 0LL;
  }

  if (IMOSLoggingEnabled(v19, v20))
  {
    __int16 v21 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "Sending edit command with guid %@ for edit of message with guid %@",  buf,  0x16u);
    }
  }

  id v53 = a3;
  id v22 = [a3 body];
  __int16 v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v24 = (__CFDictionary *)v23;
  if (@"1") {
    CFDictionarySetValue((CFMutableDictionaryRef)v23, @"v", @"1");
  }
  id v25 = -[MessageDeliveryController _replicationSourceIDForSending](self, "_replicationSourceIDForSending");
  if (v25) {
    CFDictionarySetValue(v24, @"rp", v25);
  }
  if (v18) {
    CFDictionarySetValue(v24, @"emg", v18);
  }
  __int16 v26 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4);
  if (v26) {
    CFDictionarySetValue(v24, @"epi", v26);
  }
  id v27 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5);
  if (v27) {
    CFDictionarySetValue(v24, @"et", v27);
  }
  if (a5 == 2)
  {
    id v30 = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(objc_msgSend(a3, "subject", v27), "length") == 0);
    if (v30) {
      CFDictionarySetValue(v24, @"rs", v30);
    }
  }

  else if (a5 == 1)
  {
    __int16 v28 = -[SuperToMessageParserContext initWithAttributedString:includeMessageParts:]( [SuperToMessageParserContext alloc],  "initWithAttributedString:includeMessageParts:",  objc_msgSend(objc_msgSend(v22, "__im_messagePartMatchingPartIndex:", a4), "messagePartBody"),  1);
    -[IMAttributedStringParser parseContext:]( +[IMAttributedStringParser sharedInstance](&OBJC_CLASS___IMAttributedStringParser, "sharedInstance"),  "parseContext:",  v28);
    uint64_t v29 = -[SuperToMessageParserContext outHTML](v28, "outHTML");
    if (v29) {
      CFDictionarySetValue(v24, @"epb", v29);
    }
  }

  uint64_t v31 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsRetractAndEditMessages);
  if (-[MessageServiceSession isReplicating]( -[MessageDeliveryController session](self, "session"),  "isReplicating"))
  {
    unsigned int v32 = [a3 isSOS];
    uint64_t v33 = &IDSRegistrationPropertySupportsSOSAlerting;
    if (!v32) {
      uint64_t v33 = &IDSRegistrationPropertySupportsHybridGroupsV1;
    }
    uint64_t v31 = -[NSSet setByAddingObject:](v31, "setByAddingObject:", *v33);
  }

  uint64_t v34 = IDSGetUUIDData(v17);
  id v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v35 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 118LL);
  __int16 v36 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &__kCFBooleanTrue,  IDSSendMessageOptionTopLevelDictionaryKey,  v35,  IDSSendMessageOptionCommandKey,  v31,  IDSSendMessageOptionRequireAllRegistrationPropertiesKey,  v34,  IDSSendMessageOptionUUIDKey,  0LL);
  if (-[__CFDictionary count](v24, "count"))
  {
    id v37 = (void *)JWEncodeDictionary(v24);
    id v38 = [v37 _FTCopyGzippedData];
    uint64_t v40 = IMOSLoggingEnabled(v38, v39);
    if ((_DWORD)v40)
    {
      id v42 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      uint64_t v40 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
      if ((_DWORD)v40)
      {
        id v43 = [v37 length];
        id v44 = [v38 length];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v43;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(void *)&buf[14] = v44;
        _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Compressed edited message data from: %lu  to: %lu", buf, 0x16u);
      }
    }

    if (IMOSLoggingEnabled(v40, v41))
    {
      id v45 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        id v46 = [v38 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v46;
        _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Adding data to be encrypted of size: %lu", buf, 0xCu);
      }
    }

    -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v38, IDSSendMessageOptionDataToEncryptKey);
  }

  uint64_t v47 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", a6);
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  char v61 = 1;
  v58[0] = 0LL;
  v58[1] = v58;
  v58[2] = 0x2020000000LL;
  int v59 = 0;
  BOOL v48 = dispatch_group_create();
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_4498C;
  v57[3] = &unk_D6680;
  v57[5] = buf;
  v57[6] = v58;
  v57[4] = v48;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_44AE4;
  v56[3] = &unk_D66A8;
  v56[4] = a9;
  v56[5] = v50;
  v56[6] = a10;
  v56[7] = v48;
  v56[8] = self;
  v56[9] = v53;
  v56[10] = a6;
  v56[11] = a7;
  v56[13] = a11;
  v56[12] = a8;
  v56[14] = v57;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_44D08;
  v55[3] = &unk_D66D0;
  v55[6] = buf;
  v55[7] = v58;
  v55[4] = v17;
  v55[5] = v48;
  dispatch_group_enter(v48);
  -[MessageDeliveryController sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:completionBlock:]( self,  "sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:completionBlock:",  v49,  1LL,  a9,  a8,  v47,  0LL,  300LL,  v36,  v56,  v55);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_44E2C;
  block[3] = &unk_D66F8;
  block[6] = buf;
  block[7] = v58;
  block[4] = self;
  block[5] = a12;
  dispatch_group_notify(v48, &_dispatch_main_q, block);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_sendBackwardCompatibilityMessageForEditedMessage:(id)a3 usingMessageGUID:(id)a4 toBackwardCompatabilityDestinations:(id)a5 withOriginalDestinations:(id)a6 chatIdentifier:(id)a7 fromAccount:(id)a8 fromID:(id)a9 backwardCompatabilityText:(id)a10 completionBlock:(id)a11
{
  if (IMOSLoggingEnabled(self, a2))
  {
    id v17 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = a5;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Sending backwards compatible edit message text to %@", buf, 0xCu);
    }
  }

  id v18 = objc_msgSend( [IMMessageItem alloc],  "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:",  objc_msgSend(a3, "sender"),  objc_msgSend(a3, "dateEdited"),  a10,  0,  0,  objc_msgSend(a3, "flags"),  0,  a4,  objc_msgSend(a3, "threadIdentifier"));
  objc_msgSend(v18, "setDestinationCallerID:", objc_msgSend(a9, "_stripFZIDPrefix"));
  id v19 = -[MessageDeliveryController _chatForChatIdentifier:](self, "_chatForChatIdentifier:", a7);
  uint64_t v20 = -[MessageDeliveryController session](self, "session");
  id v21 = -[MessageDeliveryController groupController](self, "groupController");
  idsService = self->_idsService;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_4511C;
  v24[3] = &unk_D6748;
  v24[4] = self;
  v24[5] = a7;
  v24[6] = a5;
  v24[7] = a6;
  v24[9] = v18;
  v24[10] = a11;
  v24[8] = a3;
  [v21 sendMessage:v18 toChat:v19 fromID:a9 fromAccount:a8 session:v20 service:idsService completionBlock:v24];
}

- (void)sendRepositionedStickerMetadata:(id)a3 forEditedMessage:(id)a4 destinations:(id)a5 account:(id)a6 fromID:(id)a7 completionBlock:(id)a8
{
  id v12 = +[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID");
  id v13 = [a4 guid];
  if (IMOSLoggingEnabled(v13, v14))
  {
    id v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Sending sticker reposition command with guid %@ for sticker chat item with guid %@",  buf,  0x16u);
    }
  }

  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v17 = (__CFDictionary *)v16;
  if (@"1") {
    CFDictionarySetValue((CFMutableDictionaryRef)v16, @"v", @"1");
  }
  id v18 = -[MessageDeliveryController _replicationSourceIDForSending](self, "_replicationSourceIDForSending");
  if (v18) {
    CFDictionarySetValue(v17, @"rp", v18);
  }
  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Sticker repositioning is not supported.", buf, 2u);
    }
  }

  id v21 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsRetractAndEditMessages);
  if (-[MessageServiceSession isReplicating]( -[MessageDeliveryController session](self, "session"),  "isReplicating")) {
    id v21 = -[NSSet setByAddingObject:](v21, "setByAddingObject:", IDSRegistrationPropertySupportsHybridGroupsV1);
  }
  uint64_t v22 = IDSGetUUIDData(v12);
  id v37 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int16 v23 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 122LL);
  id v24 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &__kCFBooleanTrue,  IDSSendMessageOptionTopLevelDictionaryKey,  v23,  IDSSendMessageOptionCommandKey,  v21,  IDSSendMessageOptionRequireAllRegistrationPropertiesKey,  v22,  IDSSendMessageOptionUUIDKey,  0LL);
  if (-[__CFDictionary count](v17, "count"))
  {
    id v25 = (void *)JWEncodeDictionary(v17);
    id v26 = [v25 _FTCopyGzippedData];
    uint64_t v28 = IMOSLoggingEnabled(v26, v27);
    if ((_DWORD)v28)
    {
      id v30 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      uint64_t v28 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
      if ((_DWORD)v28)
      {
        id v31 = [v25 length];
        id v32 = [v26 length];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(void *)&buf[14] = v32;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Compressed edited message data from: %lu  to: %lu", buf, 0x16u);
      }
    }

    if (IMOSLoggingEnabled(v28, v29))
    {
      uint64_t v33 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDelivery");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = [v26 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v34;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Adding data to be encrypted of size: %lu", buf, 0xCu);
      }
    }

    -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v26, IDSSendMessageOptionDataToEncryptKey);
  }

  id v35 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", a5);
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  char v47 = 1;
  v44[0] = 0LL;
  v44[1] = v44;
  v44[2] = 0x2020000000LL;
  char v45 = 0;
  v42[0] = 0LL;
  v42[1] = v42;
  v42[2] = 0x2020000000LL;
  int v43 = 0;
  __int16 v36 = dispatch_group_create();
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_45930;
  v41[3] = &unk_D6770;
  v41[6] = buf;
  v41[7] = v44;
  v41[8] = v42;
  v41[4] = v12;
  v41[5] = v36;
  dispatch_group_enter(v36);
  -[MessageDeliveryController sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:completionBlock:]( self,  "sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:completionBlock:",  v37,  1LL,  a7,  a6,  v35,  0LL,  300LL,  v24,  0LL,  v41);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_45A70;
  block[3] = &unk_D6798;
  block[6] = buf;
  block[7] = v42;
  block[4] = self;
  block[5] = a8;
  void block[8] = v44;
  dispatch_group_notify(v36, &_dispatch_main_q, block);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_checkStickerRepositioningMetadata:(id)a3
{
  uint64_t v3 = (os_log_s *)IMLogHandleForCategory("MessageDelivery");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_8FDB8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
  id v12 = @"[MessageDeliveryController] Attempting sticker repositioning is macro disabled.";
  -[IMMetricsCollector forceAutoBugCaptureWithSubType:errorPayload:type:context:]( +[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"),  "forceAutoBugCaptureWithSubType:errorPayload:type:context:",  @"AttemptedInvalidStickerReposition",  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IMChatErrorDomain,  0LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL)),  @"DisabledStickerReposition",  0LL);
}

- (void)cancelScheduledMessageWithGUID:(id)a3 fromID:(id)a4
{
  id v22 = 0LL;
  uint64_t v23 = 0LL;
  id v7 = -[MessageDeliveryController _getQueueIdentifierFromGUID:](self, "_getQueueIdentifierFromGUID:");
  idsService = self->_idsService;
  v33[0] = IDSSendMessageOptionQueueOneIdentifierKey;
  v33[1] = IDSSendMessageOptionFromIDKey;
  v34[0] = v7;
  v34[1] = a4;
  unsigned int v9 = -[IDSService cancelMessageWithOptions:identifier:error:]( idsService,  "cancelMessageWithOptions:identifier:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  2LL),  &v22,  &v23);
  if ([v22 length])
  {
    pendingCancelScheduledMessageGUIDs = self->_pendingCancelScheduledMessageGUIDs;
    if (!pendingCancelScheduledMessageGUIDs)
    {
      pendingCancelScheduledMessageGUIDs = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      self->_pendingCancelScheduledMessageGUIDs = pendingCancelScheduledMessageGUIDs;
    }

    id v12 = -[NSMutableDictionary objectForKey:](pendingCancelScheduledMessageGUIDs, "objectForKey:", v22);
    if (v12)
    {
      if (IMOSLoggingEnabled(v12, v13))
      {
        uint64_t v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v25 = v22;
          __int16 v26 = 2112;
          id v27 = a3;
          _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "We already have identifier (%@) for messageGUID (%@)",  buf,  0x16u);
        }
      }
    }

    id v15 = self->_pendingCancelScheduledMessageGUIDs;
    v32[0] = a3;
    v32[1] = &off_DB588;
    id v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL);
    uint64_t v17 = (uint64_t)-[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, v22);
  }

  else
  {
    uint64_t v17 = IMOSLoggingEnabled(0LL, v10);
    if ((_DWORD)v17)
    {
      uint64_t v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      uint64_t v17 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if ((_DWORD)v17)
      {
        *(_DWORD *)buf = 138412290;
        id v25 = a3;
        _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "Failed to get identifier from IDS for cancel scheduled message with GUID: %@",  buf,  0xCu);
      }
    }
  }

  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = @"NO";
      *(_DWORD *)buf = 138413058;
      if (v9) {
        id v21 = @"YES";
      }
      id v25 = a3;
      __int16 v26 = 2112;
      id v27 = a4;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Cancelling scheduled message with GUID: %@ handleID: %@, cancelSuccess: %@ idsIdentifier: %@",  buf,  0x2Au);
    }
  }

- (void)cancelScheduledMessageWithGUID:(id)a3 fromID:(id)a4 destinations:(id)a5 cancelType:(unint64_t)a6
{
  id v39 = 0LL;
  uint64_t v40 = 0LL;
  id v11 = -[MessageDeliveryController _getQueueIdentifierFromGUID:](self, "_getQueueIdentifierFromGUID:");
  v57[0] = IDSSendMessageOptionQueueOneIdentifierKey;
  v57[1] = IDSSendMessageOptionFromIDKey;
  v58[0] = v11;
  v58[1] = a4;
  id v12 = -[NSDictionary mutableCopy]( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  2LL),  "mutableCopy");
  uint64_t v13 = v12;
  if (a6 != 2) {
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionAlwaysIncludeSelfKey];
  }
  uint64_t v14 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [a5 count]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v15 = [a5 countByEnumeratingWithState:&v35 objects:v56 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v36;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(a5);
        }
        -[NSMutableSet addObject:]( v14,  "addObject:",  IMChatCanonicalIDSIDsForAddress(*(void *)(*((void *)&v35 + 1) + 8LL * (void)v17)));
        uint64_t v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [a5 countByEnumeratingWithState:&v35 objects:v56 count:16];
    }

    while (v15);
  }

  char v18 = objc_opt_respondsToSelector(self->_idsService, "cancelMessageWithOptions:destinations:identifier:error:");
  idsService = self->_idsService;
  if ((v18 & 1) != 0) {
    unsigned int v20 = -[IDSService cancelMessageWithOptions:destinations:identifier:error:]( idsService,  "cancelMessageWithOptions:destinations:identifier:error:",  v13,  v14,  &v39,  &v40);
  }
  else {
    unsigned int v20 = -[IDSService cancelMessageWithOptions:identifier:error:]( idsService,  "cancelMessageWithOptions:identifier:error:",  v13,  &v39,  &v40);
  }
  unsigned int v21 = v20;

  if (IMOSLoggingEnabled(v22, v23))
  {
    id v24 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6);
      __int16 v26 = @"NO";
      *(_DWORD *)buf = 138413826;
      if (v21) {
        __int16 v26 = @"YES";
      }
      id v43 = a3;
      __int16 v44 = 2112;
      id v45 = a4;
      __int16 v46 = 2112;
      id v47 = a5;
      __int16 v48 = 2112;
      id v49 = v25;
      __int16 v50 = 2112;
      __int16 v51 = v26;
      __int16 v52 = 2112;
      id v53 = v39;
      __int16 v54 = 2112;
      uint64_t v55 = v40;
      _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_INFO,  "Cancelling scheduled message with GUID: %@, fromID:%@, destination: %@, cancelType: %@ cancelSuccess: %@ idsIden tifier: %@ error: %@",  buf,  0x48u);
    }
  }

  if ([v39 length])
  {
    pendingCancelScheduledMessageGUIDs = self->_pendingCancelScheduledMessageGUIDs;
    if (!pendingCancelScheduledMessageGUIDs)
    {
      pendingCancelScheduledMessageGUIDs = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      self->_pendingCancelScheduledMessageGUIDs = pendingCancelScheduledMessageGUIDs;
    }

    id v29 = -[NSMutableDictionary objectForKey:](pendingCancelScheduledMessageGUIDs, "objectForKey:", v39);
    if (v29 && IMOSLoggingEnabled(v29, v30))
    {
      id v31 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v43 = v39;
        __int16 v44 = 2112;
        id v45 = a3;
        _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_INFO,  "We already have identifier (%@) for messageGUID (%@)",  buf,  0x16u);
      }
    }

    id v32 = self->_pendingCancelScheduledMessageGUIDs;
    v41[0] = a3;
    v41[1] = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6);
    uint64_t v33 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 2LL);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v33, v39);
  }

  else if (IMOSLoggingEnabled(0LL, v27))
  {
    id v34 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = a3;
      _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "Failed to get identifier from IDS for cancel scheduled message with GUID: %@",  buf,  0xCu);
    }
  }

- (id)_appendFilePathsWithGUIDs:(id)a3
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableAttributedString);
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ([a3 count])
  {
    unint64_t v6 = 0LL;
    int v7 = 0;
    uint64_t v8 = IMMessagePartAttributeName;
    uint64_t v9 = IMFileTransferGUIDAttributeName;
    do
    {
      id v10 = [a3 objectAtIndex:v6];
      if (v10)
      {
        id v11 = v10;
        -[NSMutableDictionary setObject:forKey:]( v5,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7),  v8);
        -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v11, v9);
        ++v7;
        __int16 v15 = -4;
        id v12 = -[NSString initWithCharacters:length:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCharacters:length:",  &v15,  1LL);
        uint64_t v13 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v12,  v5);
        -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v13);
      }

      ++v6;
    }

    while ((unint64_t)[a3 count] > v6);
  }

  return v4;
}

- (void)sendLogDumpMessageAtFilePath:(id)a3 fromAccount:(id)a4 fromID:(id)a5 toRecipient:(id)a6 shouldDeleteFile:(BOOL)a7 withCompletion:(id)a8
{
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  __int16 v26 = sub_468F4;
  uint64_t v27 = &unk_D67C0;
  BOOL v29 = a7;
  id v28 = a3;
  uint64_t v14 = IMOSLoggingEnabled(self, a2);
  if ((_DWORD)v14)
  {
    uint64_t v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    uint64_t v14 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if ((_DWORD)v14)
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = a3;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2112;
      id v33 = a5;
      __int16 v34 = 2112;
      id v35 = a6;
      _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "SendLogDump: Request to send log dump file at path %@ from idsaccount %@ from %@ to recipient %@",  buf,  0x2Au);
    }
  }

  if (a4)
  {
    id v17 = -[IMDFileTransferCenter guidForNewOutgoingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:]( +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"),  "guidForNewOutgoingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:",  [a3 lastPathComponent],  0,  100,  10,  11,  13);
    id v18 = objc_msgSend( -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"),  "transferForGUID:",  v17),  "_setLocalPath:",  a3);
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    LOBYTE(v33) = 0;
    if (IMOSLoggingEnabled(v18, v19))
    {
      unsigned int v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v30 = 138412290;
        id v31 = v17;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "SendLogDump: Uploading file directly for file transfer guid %@",  v30,  0xCu);
      }
    }

    unsigned int v21 = +[IMTransferServicesController sharedInstance](&OBJC_CLASS___IMTransferServicesController, "sharedInstance");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_46A64;
    v24[3] = &unk_D67E8;
    v24[4] = v17;
    v24[5] = self;
    v24[6] = a4;
    v24[7] = a5;
    v24[8] = a6;
    v24[9] = a8;
    v24[10] = v25;
    void v24[11] = buf;
    -[IMTransferServicesController sendFilePath:topic:userInfo:transferID:encryptFile:progressBlock:completionBlock:]( v21,  "sendFilePath:topic:userInfo:transferID:encryptFile:progressBlock:completionBlock:",  a3,  IDSServiceNameiMessage,  &off_DB7B8,  v17,  1LL,  0LL,  v24);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_46DDC;
    v23[3] = &unk_D6810;
    v23[4] = v17;
    v23[5] = buf;
    im_dispatch_after(v23, 900.0);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    if (IMOSLoggingEnabled(v14, v15))
    {
      uint64_t v22 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "SendLogDump:Account is nil, returning early", buf, 2u);
      }
    }

    v26((uint64_t)v25);
    if (a8) {
      (*((void (**)(id, void))a8 + 2))(a8, 0LL);
    }
  }

- (void)_sendIDSMessageWithTransferGUID:(id)a3 andTransfer:(id)a4 fromAccount:(id)a5 fromID:(id)a6 toRecipient:(id)a7 withCompletion:(id)a8
{
  id v62 = a3;
  id v11 = -[MessageDeliveryController _appendFilePathsWithGUIDs:]( self,  "_appendFilePathsWithGUIDs:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v62, 1LL));
  id v12 = -[SuperToMessageParserContext initWithAttributedString:includeMessageParts:]( objc_alloc(&OBJC_CLASS___SuperToMessageParserContext),  "initWithAttributedString:includeMessageParts:",  v11,  1LL);
  -[IMAttributedStringParser parseContext:]( +[IMAttributedStringParser sharedInstance](&OBJC_CLASS___IMAttributedStringParser, "sharedInstance"),  "parseContext:",  v12);
  id v13 = [v11 string];
  BOOL value = -[SuperToMessageParserContext outHTML](v12, "outHTML");
  if (-[SuperToMessageParserContext isSimpleString](v12, "isSimpleString"))
  {
    int v14 = 0;
  }

  else
  {
    if ([v11 length]) {
      BOOL v15 = v13 == 0LL;
    }
    else {
      BOOL v15 = 1;
    }
    int v14 = !v15;
  }

  uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (IMOSLoggingEnabled(v16, v17))
  {
    id v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = @"NO";
      if (v14) {
        uint64_t v19 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)int v59 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "SendLogDump: sendXMLVersion %@ ", buf, 0xCu);
    }
  }

  else {
    uint64_t v20 = IDSCopyIDForPhoneNumber(a7);
  }
  unsigned int v21 = (void *)v20;
  else {
    __int16 v54 = (void *)IDSCopyIDForPhoneNumber(a6);
  }
  v61[0] = v21;
  v61[1] = v54;
  uint64_t v22 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 2LL);
  if (IMOSLoggingEnabled(v22, v23))
  {
    id v24 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)int v59 = v22;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "SendLogDump: participants: %@", buf, 0xCu);
    }
  }

  if (@"1") {
    CFDictionarySetValue((CFMutableDictionaryRef)v16, @"v", @"1");
  }
  id v25 = -[MessageDeliveryController _replicationSourceIDForSending](self, "_replicationSourceIDForSending");
  if (v25) {
    CFDictionarySetValue((CFMutableDictionaryRef)v16, @"rp", v25);
  }
  if (value) {
    int v26 = v14;
  }
  else {
    int v26 = 0;
  }
  if (v26 == 1) {
    CFDictionarySetValue((CFMutableDictionaryRef)v16, @"x", value);
  }
  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v16, @"t", v13);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v16, @"s", &stru_D8640);
  if (v22) {
    CFDictionarySetValue((CFMutableDictionaryRef)v16, @"p", v22);
  }
  id v27 = +[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID");
  uint64_t v28 = IDSGetUUIDData(v27);
  BOOL v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v30 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 100LL);
  id v31 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  id v32 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  IDSSendMessageOptionTopLevelDictionaryKey,  &__kCFBooleanTrue,  IDSSendMessageOptionSkipPayloadCheckKey,  v30,  IDSSendMessageOptionCommandKey,  v31,  IDSSendMessageOptionWantsResponseKey,  v28,  IDSSendMessageOptionUUIDKey,  v27,  IDSSendMessageOptionAlternateCallbackIdentifierKey,  0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)v32, IDSSendMessageOptionWantsDeliveryStatusKey, &__kCFBooleanFalse);
  CFDictionarySetValue((CFMutableDictionaryRef)v32, IDSSendMessageOptionFireAndForgetKey, &__kCFBooleanTrue);
  CFDictionarySetValue((CFMutableDictionaryRef)v32, IDSSendMessageOptionTimeoutKey, &off_DB768);
  if (-[NSMutableDictionary count](v16, "count"))
  {
    id v33 = (void *)JWEncodeDictionary(v16);
    id v34 = [v33 _FTCopyGzippedData];
    uint64_t v36 = IMOSLoggingEnabled(v34, v35);
    if ((_DWORD)v36)
    {
      __int128 v38 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      uint64_t v36 = os_log_type_enabled(v38, OS_LOG_TYPE_INFO);
      if ((_DWORD)v36)
      {
        unsigned int v39 = [v33 length];
        unsigned int v40 = [v34 length];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v59 = v39;
        *(_WORD *)&v59[4] = 1024;
        *(_DWORD *)&v59[6] = v40;
        _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_INFO,  "SendLogDump: Compressed message data from: %u  to: %u",  buf,  0xEu);
      }
    }

    if (IMOSLoggingEnabled(v36, v37))
    {
      uint64_t v41 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        unsigned int v42 = [v34 length];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)int v59 = v42;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "SendLogDump: Adding data to be encrypted of size: %u", buf, 8u);
      }
    }

    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v34, IDSSendMessageOptionDataToEncryptKey);
  }

  uint64_t v56 = 0LL;
  uint64_t v57 = 0LL;
  id v43 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v21, 0LL);
  if (IMOSLoggingEnabled(v43, v44))
  {
    id v45 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)int v59 = v27;
      *(_WORD *)&v59[8] = 2112;
      id v60 = v43;
      _os_log_impl( &dword_0,  v45,  OS_LOG_TYPE_INFO,  "SendLogDump: Sending IDS message with guid: %@ to destinations: %@",  buf,  0x16u);
    }
  }

  id v46 = +[IMIDSService service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:]( &OBJC_CLASS___IMIDSService,  "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:",  self->_idsService,  v29,  a5,  v43,  300LL,  v32,  &v56,  &v57);
  int v48 = IMOSLoggingEnabled(v46, v47);
  if ((v46 & 1) != 0)
  {
    id v49 = (void (**)(id, id))a8;
    if (v48)
    {
      __int16 v50 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "SendLogDump: IDS sendMessage succeeded!", buf, 2u);
        if (!a8) {
          goto LABEL_57;
        }
        goto LABEL_56;
      }
    }
  }

  else
  {
    id v49 = (void (**)(id, id))a8;
    if (v48)
    {
      __int16 v51 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageDeliveryController");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)int v59 = v57;
        _os_log_impl( &dword_0,  v51,  OS_LOG_TYPE_INFO,  "SendLogDump: IDS sendMessage did not succeed, error %@",  buf,  0xCu);
      }
    }
  }

  if (v49) {
LABEL_56:
  }
    v49[2](v49, v46);
LABEL_57:
}

- (id)_fallbackMessageItemFromLinkMetadata:(id)a3 originalMessageItem:(id)a4
{
  unint64_t v6 = -[NSAttributedString initWithString:]( [NSAttributedString alloc],  "initWithString:",  objc_msgSend(objc_msgSend(a3, "URL"), "absoluteString"));
  id v7 = -[NSAttributedString __im_attributedStringByAssigningMessagePartNumbers]( v6,  "__im_attributedStringByAssigningMessagePartNumbers");
  id v8 = objc_alloc_init(&OBJC_CLASS___LPMessagesPayload);
  [v8 setMetadata:a3];
  uint64_t v13 = 0LL;
  id v9 = [v8 dataRepresentationWithOutOfLineAttachments:&v13];
  uint64_t v10 = IMSharedHelperCombinedPluginPayloadDictionaryData(v9, v13);
  id v11 = objc_msgSend( [IMMessageItem alloc],  "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:",  objc_msgSend(a4, "sender"),  objc_msgSend(a4, "time"),  v7,  0,  0,  objc_msgSend(a4, "flags"),  0,  objc_msgSend(a4, "guid"),  0);
  [v11 setBalloonBundleID:IMBalloonPluginIdentifierRichLinks];
  [v11 setPayloadData:v10];

  return v11;
}

- (id)_fallbackMesssageItemByConvertingGenmojiToUnknownEmojiCharacterInOriginalMessageItem:(id)a3
{
  id v3 = a3;
  id v5 = [a3 body];
  if (v5)
  {
    unint64_t v6 = v5;
    id v7 = objc_msgSend(v3, "copyWithFlags:", objc_msgSend(v3, "flags"));
    objc_msgSend(v7, "_setMessageID:", objc_msgSend(v3, "messageID"));
    id v8 = +[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance");
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_47B4C;
    void v31[3] = &unk_D6838;
    v31[4] = v8;
    uint64_t v25 = 0LL;
    int v26 = &v25;
    uint64_t v27 = 0x3052000000LL;
    uint64_t v28 = sub_47B64;
    BOOL v29 = sub_47B74;
    uint64_t v30 = 0LL;
    uint64_t v30 = objc_alloc_init(&OBJC_CLASS___NSAttributedString);
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_47B80;
    v24[3] = &unk_D68A0;
    v24[6] = &stru_D6878;
    v24[7] = &v25;
    v24[4] = v9;
    v24[5] = v31;
    objc_msgSend(v6, "__im_visitMessageParts:", v24);
    id v10 = objc_msgSend(objc_msgSend(v3, "fileTransferGUIDs"), "mutableCopy");
    if (-[NSMutableOrderedSet count](v9, "count"))
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v32,  16LL);
      if (v12)
      {
        uint64_t v13 = *(void *)v21;
        do
        {
          int v14 = 0LL;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v9);
            }
            id v15 = objc_msgSend( -[MessageDeliveryController _nonAdaptiveFileTransferForAdaptiveImageFileTransfer:]( self,  "_nonAdaptiveFileTransferForAdaptiveImageFileTransfer:",  -[IMDFileTransferCenter transferForGUID:]( v8,  "transferForGUID:",  *(void *)(*((void *)&v20 + 1) + 8 * (void)v14))),  "guid");
            if (v15) {
              -[NSMutableArray addObject:](v11, "addObject:", v15);
            }
            int v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v32,  16LL);
        }

        while (v12);
      }

      id v16 = -[NSMutableArray copy](v11, "copy");

      objc_msgSend(v10, "removeObjectsInArray:", -[NSMutableOrderedSet array](v9, "array"));
      [v10 addObjectsFromArray:v16];
      id v17 = objc_msgSend((id)v26[5], "__im_attributedStringByAppendingFileTransfers:", v16);
      v26[5] = (uint64_t)v17;
    }

    id v18 = [v10 copy];
    [v7 setBody:v26[5]];
    [v7 setFileTransferGUIDs:v18];
    [v7 setBackwardsCompatibleVersion:1];

    id v3 = v7;
    _Block_object_dispose(&v25, 8);
  }

  return v3;
}

- (id)_nonAdaptiveFileTransferForAdaptiveImageFileTransfer:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = -[MessageDeliveryController _copyGenmojiHEICFileToTemporaryDirectory:]( self,  "_copyGenmojiHEICFileToTemporaryDirectory:",  [a3 localPath]);
    if (v4)
    {
      id v5 = v4;
      id v6 = [v4 lastPathComponent];
      id v7 = [v3 totalBytes];
      id v8 = [v3 hfsType];
      id v9 = [v3 hfsCreator];
      id v10 = [v3 hfsFlags];
      id v11 = +[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance");
      id v3 = -[IMDFileTransferCenter transferForGUID:]( v11,  "transferForGUID:",  -[IMDFileTransferCenter guidForNewOutgoingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:]( v11,  "guidForNewOutgoingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:",  v6,  0LL,  v7,  v8,  v9,  v10));
      [v3 _setLocalPath:v5];
      [v3 setIsTemporaryBackwardCompatibilityAsset:1];
      [v3 setIsGenmojiFallback:1];
    }

    else
    {
      id v12 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_8FE28();
      }
      return 0LL;
    }
  }

  return v3;
}

- (id)_copyGenmojiHEICFileToTemporaryDirectory:(id)a3
{
  id v4 = [a3 lastPathComponent];
  if (!v4)
  {
    id v10 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_8FE54();
    }
    return 0LL;
  }

  id v15 = v4;
  id v5 = objc_msgSend( objc_msgSend( (id)IMSafeTemporaryDirectory(),  "im_URLByAppendingPathComponents:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1)),  "path");
  id v6 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (-[NSFileManager fileExistsAtPath:](v6, "fileExistsAtPath:", v5))
  {
    id v7 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "Copying genmoji to temporary path, but file already exists at that path, deleting old item.",  buf,  2u);
    }

    *(void *)buf = 0LL;
    if (!-[NSFileManager removeItemAtPath:error:](v6, "removeItemAtPath:error:", v5, buf))
    {
      id v8 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_8FEE4();
      }
    }
  }

  *(void *)buf = 0LL;
  if (!-[NSFileManager copyItemAtPath:toPath:error:](v6, "copyItemAtPath:toPath:error:", a3, v5, buf))
  {
    if (objc_msgSend(objc_msgSend(*(id *)buf, "domain"), "isEqual:", NSCocoaErrorDomain)
      && [*(id *)buf code] == &stru_1F8.sectname[12])
    {
      id v9 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "Copying genmoji to temporary path failed, because file is already there.",  v13,  2u);
      }

      return v5;
    }

    id v11 = (os_log_s *)IMLogHandleForCategory("MessageDeliveryController");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8FE80();
    }
    return 0LL;
  }

  return v5;
}

- (id)_replicationSourceIDForSending
{
  if (-[MessageServiceSession isReplicating]( -[MessageDeliveryController session](self, "session"),  "isReplicating")) {
    return +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend( -[MessageServiceSession service](-[MessageDeliveryController session](self, "session"), "service"),  "replicationSourceIDForSending"));
  }
  else {
    return 0LL;
  }
}

- (void)_updateIDSServiceForTesting:(id)a3
{
  self->_idsService = 0LL;
  self->_idsService = (IDSService *)a3;
}

- (void)_addIdentifierToPendingTimestampUpdateMap:(id)a3 alternateCallbackId:(id)a4
{
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](self->_pendingTimestampUpdate, "setObject:forKey:", a3, a4);
  }
}

- (MessageServiceSession)session
{
  return (MessageServiceSession *)objc_loadWeak((id *)&self->_session);
}

- (MessageDeliveryControllerDelegate)delegate
{
  return (MessageDeliveryControllerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end