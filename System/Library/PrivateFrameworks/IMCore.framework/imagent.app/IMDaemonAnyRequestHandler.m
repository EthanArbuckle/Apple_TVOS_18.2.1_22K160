@interface IMDaemonAnyRequestHandler
- (BOOL)_clientCapabilitiesSupportAccounts:(unint64_t)a3;
- (BOOL)_shouldContinueDownloadingPurgedAttachments:(unint64_t)a3;
- (IMDaemonAnyRequestHandler)init;
- (NSMutableDictionary)downloadingCountDictionary;
- (id)_pinnedChatIdentifiersFromContext:(id)a3;
- (id)_setupInfoForCapabilities:(unint64_t)a3 context:(id)a4;
- (id)valueOfPersistentProperty:(id)a3;
- (id)valueOfProperty:(id)a3;
- (int64_t)_numberOfChatsToLoadDuringInitialSetupFromContext:(id)a3;
- (int64_t)_precacheChatCountWithCapabilities:(unint64_t)a3;
- (unint64_t)_broadcastedUncachedAttachmentCountForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 services:(id)a5 broadcaster:(id)a6;
- (void)_addAccountsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addApprovedCapabilitiesToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addChatCountsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addChatsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addGroupPhotoTransfersToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addKeyTransparencyToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addTransfersToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_cacheChatsWithPinningIdentifiers:(id)a3;
- (void)_downloadPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 retryCount:(unint64_t)a7 broadcaster:(id)a8;
- (void)_initiateScreenSharingWithID:(id)a3 isContact:(BOOL)a4 sharingMyScreen:(BOOL)a5;
- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4;
- (void)allowHandleIDsForNicknameSharing:(id)a3 onChatGUIDs:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6;
- (void)askHandleIDToShareTheirScreen:(id)a3 isContact:(BOOL)a4;
- (void)clearPendingNicknamePhotoUpdateForHandleIDs:(id)a3;
- (void)clearPendingNicknameUpdatesForHandleIDs:(id)a3;
- (void)conference:(id)a3 account:(id)a4 notifyInvitationCancelledFromPerson:(id)a5;
- (void)consumeCodeWithMessageGUID:(id)a3;
- (void)denyHandleIDsForNicknameSharing:(id)a3;
- (void)downloadPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6;
- (void)downloadStickerPackWithGUID:(id)a3 isIncomingMessage:(BOOL)a4 ignoreCache:(BOOL)a5;
- (void)downloadStickerWithGUID:(id)a3;
- (void)eagerUploadCancel:(id)a3;
- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4;
- (void)fetchActiveNicknamesWithReply:(id)a3;
- (void)fetchAutoDeletionPreferenceWithReply:(id)a3;
- (void)fetchGroupPhotoPathsForChatsWithGroupIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchHandleSharingStateWithReply:(id)a3;
- (void)fetchIgnoredNicknameHandlesWithReply:(id)a3;
- (void)fetchNicknamesWithReply:(id)a3;
- (void)fetchPersonalNicknameWithReply:(id)a3;
- (void)fetchTransitionedNicknameHandlesWithReply:(id)a3;
- (void)fetchUnknownSenderRecordsWithReply:(id)a3;
- (void)fetchiCloudAccountStatusWithReply:(id)a3;
- (void)forceReloadChatRegistryWithQueryID:(id)a3;
- (void)holdBuddyUpdatesAccount:(id)a3;
- (void)ignorePendingNicknameUpdatesForHandleIDs:(id)a3;
- (void)initiateQuickSwitch;
- (void)inviteHandleIDToShareMyScreen:(id)a3 isContact:(BOOL)a4;
- (void)markAllNicknamesAsPending;
- (void)markMessageAsReadWithGUID:(id)a3 callerOrigin:(int64_t)a4 reply:(id)a5;
- (void)markNicknamesAsTransitionedForHandleIDs:(id)a3 isAutoUpdate:(BOOL)a4;
- (void)markPlayedForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6;
- (void)markPlayedForMessageGUID:(id)a3;
- (void)markProfileRecords:(id)a3 asActive:(BOOL)a4;
- (void)markProfileRecordsAsIgnored:(id)a3;
- (void)markReadForMessageGUID:(id)a3 callerOrigin:(int64_t)a4 queryID:(id)a5;
- (void)markUnreadForMessageGUID:(id)a3 IDs:(id)a4 style:(unsigned __int8)a5 services:(id)a6;
- (void)nicknamePreferencesDidChange;
- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 reply:(id)a4;
- (void)onboardDeleteVerificationCodesIfNeededWithReply:(id)a3;
- (void)playSendSoundForMessageGUID:(id)a3 callerOrigin:(int64_t)a4;
- (void)preWarm;
- (void)requestBuddyPicturesAndPropertiesForAccount:(id)a3;
- (void)requestGroupsAccount:(id)a3;
- (void)requestNetworkDataAvailability;
- (void)requestOneTimeCodeStatus;
- (void)requestPendingACInvites;
- (void)requestPendingVCInvites;
- (void)requestProperty:(id)a3 ofPerson:(id)a4 account:(id)a5;
- (void)requestQOSClassWhileServicingRequestsWithID:(id)a3;
- (void)requestSetupWithClientID:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 reply:(id)a6;
- (void)requestSetupXPCObjectWithClientID:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 reply:(id)a6;
- (void)resumeBuddyUpdatesAccount:(id)a3;
- (void)sendClearNotice:(id)a3 toHandles:(id)a4 reply:(id)a5;
- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4;
- (void)sendNotice:(id)a3 toHandles:(id)a4 fromHandle:(id)a5 reply:(id)a6;
- (void)sendNotificationMessageToUniqueID:(id)a3 withCommand:(int64_t)a4;
- (void)setAutoDeletionPreference:(BOOL)a3;
- (void)setNewPersonalNickname:(id)a3;
- (void)setValue:(id)a3 ofPersistentProperty:(id)a4;
- (void)setValue:(id)a3 ofProperty:(id)a4;
- (void)setValue:(id)a3 ofProperty:(id)a4 ofPerson:(id)a5 account:(id)a6;
- (void)simulateOneTimeCodeArriving:(id)a3;
- (void)startWatchingBuddy:(id)a3 account:(id)a4;
- (void)stopWatchingBuddy:(id)a3 account:(id)a4;
- (void)terminateForcingIfNeeded:(BOOL)a3;
@end

@implementation IMDaemonAnyRequestHandler

- (IMDaemonAnyRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IMDaemonAnyRequestHandler;
  v2 = -[IMDaemonAnyRequestHandler init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    downloadingCountDictionary = v2->_downloadingCountDictionary;
    v2->_downloadingCountDictionary = v3;
  }

  return v2;
}

- (id)_setupInfoForCapabilities:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8 = objc_autoreleasePoolPush();
  -[IMDaemonAnyRequestHandler _addAccountsToSetupInfo:capabilities:context:]( self,  "_addAccountsToSetupInfo:capabilities:context:",  v7,  a3,  v6);
  -[IMDaemonAnyRequestHandler _addGroupPhotoTransfersToSetupInfo:capabilities:context:]( self,  "_addGroupPhotoTransfersToSetupInfo:capabilities:context:",  v7,  a3,  v6);
  -[IMDaemonAnyRequestHandler _addTransfersToSetupInfo:capabilities:context:]( self,  "_addTransfersToSetupInfo:capabilities:context:",  v7,  a3,  v6);
  -[IMDaemonAnyRequestHandler _addChatCountsToSetupInfo:capabilities:context:]( self,  "_addChatCountsToSetupInfo:capabilities:context:",  v7,  a3,  v6);
  -[IMDaemonAnyRequestHandler _addChatsToSetupInfo:capabilities:context:]( self,  "_addChatsToSetupInfo:capabilities:context:",  v7,  a3,  v6);
  -[IMDaemonAnyRequestHandler _addKeyTransparencyToSetupInfo:capabilities:context:]( self,  "_addKeyTransparencyToSetupInfo:capabilities:context:",  v7,  a3,  v6);
  -[IMDaemonAnyRequestHandler _addApprovedCapabilitiesToSetupInfo:capabilities:context:]( self,  "_addApprovedCapabilitiesToSetupInfo:capabilities:context:",  v7,  a3,  v6);
  objc_autoreleasePoolPop(v8);

  return v7;
}

- (void)_addApprovedCapabilitiesToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  id v6 = (__CFDictionary *)a3;
  id v7 = +[IMDeviceUtilities isMessagesInstalled](&OBJC_CLASS___IMDeviceUtilities, "isMessagesInstalled");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  if (v8)
  {
    CFDictionarySetValue(v6, IMSetupInfoApprovedClientCapabilitiesKey, v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004250C();
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  if (v9)
  {
    CFDictionarySetValue(v6, IMSetupInfoIsMessagesInstalledKey, v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100042488();
  }
}

- (BOOL)_clientCapabilitiesSupportAccounts:(unint64_t)a3
{
  return (a3 & 0x8800000) == 0 && a3 != 0x20000000;
}

- (void)_addAccountsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  v8 = (__CFDictionary *)a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDServiceController sharedController](&OBJC_CLASS___IMDServiceController, "sharedController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allServices]);

  v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[IMDaemonAnyRequestHandler _clientCapabilitiesSupportAccounts:](self, "_clientCapabilitiesSupportAccounts:", a4))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 arrayByApplyingSelector:"internalName"]);
    if (v13) {
      CFDictionarySetValue(v8, IMSetupInfoServiceNamesKey, v13);
    }
    v67 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDaemonPropertyManager sharedManager](&OBJC_CLASS___IMDDaemonPropertyManager, "sharedManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 properties]);
    id v16 = [v15 count];

    if (v16)
    {
      v17 = (const void *)IMSetupInfoPropertiesKey;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDaemonPropertyManager sharedManager](&OBJC_CLASS___IMDDaemonPropertyManager, "sharedManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 properties]);
      CFDictionarySetValue(v8, v17, v19);
    }

    id v63 = v9;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDaemonPropertyManager sharedManager](&OBJC_CLASS___IMDDaemonPropertyManager, "sharedManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 persistentProperties]);
    id v22 = [v21 count];

    if (v22)
    {
      v23 = (const void *)IMSetupInfoPersistentPropertiesKey;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDaemonPropertyManager sharedManager](&OBJC_CLASS___IMDDaemonPropertyManager, "sharedManager"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 persistentProperties]);
      CFDictionarySetValue(v8, v23, v25);
    }

    v64 = v8;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    v62 = v11;
    id obj = v11;
    id v68 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    if (v68)
    {
      uint64_t v66 = *(void *)v76;
      v26 = (void **)&_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      do
      {
        for (i = 0LL; i != v68; i = (char *)i + 1)
        {
          if (*(void *)v76 != v66) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
          context = objc_autoreleasePoolPush();
          v29 = (void *)objc_claimAutoreleasedReturnValue([v26[282] sharedAccountController]);
          v30 = (void *)objc_claimAutoreleasedReturnValue([v29 accountsForService:v28]);

          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 arrayByApplyingSelector:"accountID"]);
          v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v28 internalName]);
          if (v33) {
            CFDictionarySetValue((CFMutableDictionaryRef)v32, IMServiceInfoInternalNameKey, v33);
          }

          v34 = (void *)objc_claimAutoreleasedReturnValue([v28 serviceProperties]);
          id v35 = [v34 count];

          if (v35)
          {
            v36 = (const void *)IMServiceInfoPropertiesKey;
            v37 = (void *)objc_claimAutoreleasedReturnValue([v28 serviceProperties]);
            CFDictionarySetValue((CFMutableDictionaryRef)v32, v36, v37);
          }

          v38 = (void *)objc_claimAutoreleasedReturnValue([v28 serviceDefaultsForSetup]);
          id v39 = [v38 count];

          if (v39)
          {
            v40 = (const void *)IMServiceInfoDefaultsKey;
            v41 = (void *)objc_claimAutoreleasedReturnValue([v28 serviceDefaultsForSetup]);
            CFDictionarySetValue((CFMutableDictionaryRef)v32, v40, v41);
          }

          v42 = (void *)objc_claimAutoreleasedReturnValue([v28 defaultAccountSettings]);
          id v43 = [v42 count];

          if (v43)
          {
            v44 = (const void *)IMServiceInfoDefaultAccountSettingsKey;
            v45 = (void *)objc_claimAutoreleasedReturnValue([v28 defaultAccountSettings]);
            CFDictionarySetValue((CFMutableDictionaryRef)v32, v44, v45);
          }

          if ([v31 count]) {
            CFDictionarySetValue((CFMutableDictionaryRef)v32, IMServiceInfoAccountsKey, v31);
          }
          v69 = v31;
          v46 = (void *)objc_claimAutoreleasedReturnValue([v26[282] sharedAccountController]);
          v47 = (void *)objc_claimAutoreleasedReturnValue([v46 activeAccountsForService:v28]);
          v48 = v26;
          v49 = (void *)objc_claimAutoreleasedReturnValue([v47 arrayByApplyingSelector:"accountID"]);
          id v50 = [v49 count];

          if (v50)
          {
            v51 = (const void *)IMServiceInfoActiveAccountsKey;
            v52 = (void *)objc_claimAutoreleasedReturnValue([v48[282] sharedAccountController]);
            v53 = (void *)objc_claimAutoreleasedReturnValue([v52 activeAccountsForService:v28]);
            v54 = (void *)objc_claimAutoreleasedReturnValue([v53 arrayByApplyingSelector:"accountID"]);
            CFDictionarySetValue((CFMutableDictionaryRef)v32, v51, v54);
          }

          -[NSMutableArray addObject:](v67, "addObject:", v32);
          v55 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          id v56 = v30;
          id v57 = [v56 countByEnumeratingWithState:&v71 objects:v79 count:16];
          if (v57)
          {
            id v58 = v57;
            uint64_t v59 = *(void *)v72;
            do
            {
              for (j = 0LL; j != v58; j = (char *)j + 1)
              {
                if (*(void *)v72 != v59) {
                  objc_enumerationMutation(v56);
                }
                if ([v61 count]) {
                  -[NSMutableArray addObject:](v55, "addObject:", v61);
                }
              }

              id v58 = [v56 countByEnumeratingWithState:&v71 objects:v79 count:16];
            }

            while (v58);
          }

          if (-[NSMutableArray count](v55, "count")) {
            CFDictionarySetValue((CFMutableDictionaryRef)v32, IMServiceInfoAccountInfoKey, v55);
          }

          objc_autoreleasePoolPop(context);
          v26 = v48;
        }

        id v68 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
      }

      while (v68);
    }

    v12 = v67;
    id v9 = v63;
    v8 = v64;
    v11 = v62;
    if (-[NSMutableArray count](v67, "count")) {
      CFDictionarySetValue(v64, IMSetupInfoServicesKey, v67);
    }
  }
}

- (void)_addGroupPhotoTransfersToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  int v5 = a4;
  id v6 = (__CFDictionary *)a3;
  if ((v5 & 0x1000000) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _allFileTransfers]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);
    if ([v9 count])
    {
      id v22 = v8;
      theDict = v6;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      v21 = v9;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v26;
        uint64_t v14 = IMFileTransferFilenameKey;
        uint64_t v15 = IMFileTransferGroupPhotoName;
        uint64_t v16 = IMFileTransferGUIDKey;
        do
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", v14, v21));
            if ([v19 containsString:v15])
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue([v18 valueForKey:v16]);
              if (v20) {
                [v24 setValue:v18 forKey:v20];
              }
            }
          }

          id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }

        while (v12);
      }

      id v6 = theDict;
      if ([v24 count] && v24) {
        CFDictionarySetValue(theDict, IMSetupInfoGroupPhotoFileTransfersKey, v24);
      }

      id v9 = v21;
      v8 = v22;
    }
  }
}

- (void)_addTransfersToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  int v5 = a4;
  id v6 = (__CFDictionary *)a3;
  if ((v5 & 0x1000100) == 0x100LL)
  {
    theDict = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contextStamp]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 _allFileTransfers]);

    if (v10) {
      CFDictionarySetValue(theDict, IMSetupInfoFileTransfersKey, v10);
    }

    if (v8) {
      CFDictionarySetValue(theDict, IMSetupInfoFileTransfersStampKey, v8);
    }

    id v6 = theDict;
  }
}

- (void)_addChatCountsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  __int16 v6 = a4;
  id v7 = (__CFDictionary *)a3;
  id v8 = a5;
  id v10 = v8;
  if ((v6 & 0x8004) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v11 unreadMessagesCount]));

    if (v12) {
      CFDictionarySetValue(v7, IMSetupInfoUnreadMessageCountKey, v12);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v13 lastFailedMessageDate]));

    if (v14) {
      CFDictionarySetValue(v7, IMSetupInfoLastFailedMessageDateKey, v14);
    }

    if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory("UnreadMessageCount");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v7, "valueForKey:", @"unreadMessageCount"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary valueForKey:](v7, "valueForKey:", @"lastFailedMessageDate"));
        int v22 = 134218240;
        v23 = v19;
        __int16 v24 = 2048;
        __int128 v25 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Adding unread message count (%ld) and lastFailedMessageDate (%ld) to setup info.",  (uint8_t *)&v22,  0x16u);
      }

- (void)_addChatsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  id v8 = (__CFDictionary *)a3;
  id v9 = a5;
  id v11 = v9;
  if ((a4 & 0x4000000) == 0 && (((a4 & 0x2400000) != 0) & (a4 >> 2)) == 0)
  {
    if (IMOSLoggingEnabled(v9, v10))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("Daemon");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v42[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Client does not want initial chat load",  (uint8_t *)v42,  2u);
      }
    }

    goto LABEL_39;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[IMDaemonAnyRequestHandler _pinnedChatIdentifiersFromContext:]( self,  "_pinnedChatIdentifiersFromContext:",  v9));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 modificationStamp]);

  -[IMDaemonAnyRequestHandler _cacheChatsWithPinningIdentifiers:](self, "_cacheChatsWithPinningIdentifiers:", v14);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  [v17 performInitialSyncOnFirstConnectionOfImagentIfNeeded];

  uint64_t v18 = -[IMDaemonAnyRequestHandler _numberOfChatsToLoadDuringInitialSetupFromContext:]( self,  "_numberOfChatsToLoadDuringInitialSetupFromContext:",  v11);
  if (v18 <= 0)
  {
    if ((a4 & 0x100000000LL) != 0)
    {
      uint64_t v18 = IMDChatPrecacheCountClientRemote;
    }

    else
    {
      if ((a4 & 0x2400000) == 0)
      {
        [v14 count];
        goto LABEL_13;
      }

      uint64_t v18 = -[IMDaemonAnyRequestHandler _precacheChatCountWithCapabilities:]( self,  "_precacheChatCountWithCapabilities:",  a4);
    }
  }

  id v19 = [v14 count];
  if (v18 <= (unint64_t)v19)
  {
LABEL_13:
    id v19 = [v14 count];
    uint64_t v18 = (uint64_t)v19;
  }

  if (IMOSLoggingEnabled(v19, v20))
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory("Daemon");
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = IMStringFromClientCapabilities(a4);
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v42[0] = 67109378;
      v42[1] = v18;
      __int16 v43 = 2112;
      v44 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Precaching %d chats for client with capabilities %@",  (uint8_t *)v42,  0x12u);
    }
  }

  if ((a4 & 0x4000000) != 0)
  {
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 _blackholedChatInfoForNumberOfChats:0x7FFFFFFFFFFFFFFFLL]);

    if (v26) {
      CFDictionarySetValue(v8, IMSetupInfoChatsKey, v26);
    }

    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v27 blackholedChatsExist]));
  }

  else
  {
    int v29 = IMSharedHelperPersonCentricMergingEnabled();
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    v31 = v30;
    if (v29)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v30 chats]);

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
      v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 personCentricGroupedChatsArrayWithMaximumNumberOfChats:v18 skipsLastMessageLoading:(a4 >> 24) & 1 usingChats:v32 useCac hedChatGroups:1 includingPinnedChatIdentifiers:v14 repairInconsistentMergedChats:1]);

      if (v34) {
        CFDictionarySetValue(v8, IMSetupInfoPersonMergedChatsKey, v34);
      }
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 aliasToCNIDMap]);

      if (v36) {
        CFDictionarySetValue(v8, IMSetupInfoAliasToCNIDMapKey, v36);
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v37 filterediMessageChatsExist]));

      if (v38) {
        CFDictionarySetValue(v8, IMSetupInfoFilteredIMessageChatsExistKey, v38);
      }
    }

    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v30 _chatInfoForNumberOfChats:v18]);

      if (v32) {
        CFDictionarySetValue(v8, IMSetupInfoChatsKey, v32);
      }
    }

    id v39 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v39 blackholedChatsExist]));
  }

  if (v28) {
    CFDictionarySetValue(v8, IMSetupInfoBlackholedChatsExistKey, v28);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 modificationStamp]);

  if (v41) {
    CFDictionarySetValue(v8, IMSetupInfoDBModificationStampKey, v41);
  }

LABEL_39:
}

- (void)_addKeyTransparencyToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  char v6 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v10 = v8;
  if ((v6 & 4) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IMDKeyTransparencyController sharedController]( &OBJC_CLASS___IMDKeyTransparencyController,  "sharedController"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 setupInfo]);
    [v7 setObject:v13 forKeyedSubscript:IMSetupInfoKeyTransparencyInfoKey];

LABEL_6:
    goto LABEL_7;
  }

  if (IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Daemon");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_INFO,  "Client does not want KT info",  v14,  2u);
    }

    goto LABEL_6;
  }

- (int64_t)_precacheChatCountWithCapabilities:(unint64_t)a3
{
  v3 = &IMDChatPrecacheCountClientVeryRecent;
  if ((a3 & 0x2000000) == 0) {
    v3 = &IMDChatPrecacheCountClientRecent;
  }
  return IMGetCachedDomainIntForKeyWithDefaultValue( @"com.apple.MobileSMS",  @"listenerCapTruncatedChatRegistryCount",  *v3);
}

- (void)_cacheChatsWithPinningIdentifiers:(id)a3
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v18;
    *(void *)&__int128 v5 = 134218242LL;
    __int128 v16 = v5;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v7);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[IMDChatRegistry sharedInstance]( &OBJC_CLASS___IMDChatRegistry,  "sharedInstance",  v16,  (void)v17));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 existingChatsWithPinningIdentifier:v8]);

        if (IMOSLoggingEnabled(v11, v12))
        {
          uint64_t v13 = OSLogHandleForIMFoundationCategory("Daemon");
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            id v15 = [v10 count];
            *(_DWORD *)buf = v16;
            id v22 = v15;
            __int16 v23 = 2112;
            uint64_t v24 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Found %llu pinned chats for pinning identifier %@",  buf,  0x16u);
          }
        }

        id v7 = (char *)v7 + 1;
      }

      while (v4 != v7);
      id v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v4);
  }
}

- (int64_t)_numberOfChatsToLoadDuringInitialSetupFromContext:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100010CF8;
  v6[3] = &unk_1000654D8;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_pinnedChatIdentifiersFromContext:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010E04;
  v7[3] = &unk_100065500;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int64_t v4 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = -[NSMutableArray copy](v4, "copy");
  return v5;
}

- (void)setValue:(id)a3 ofProperty:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[IMDDaemonPropertyManager sharedManager](&OBJC_CLASS___IMDDaemonPropertyManager, "sharedManager"));
  [v7 setValue:v6 ofProperty:v5];
}

- (id)valueOfProperty:(id)a3
{
  id v3 = a3;
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDaemonPropertyManager sharedManager](&OBJC_CLASS___IMDDaemonPropertyManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueOfProperty:v3]);

  return v5;
}

- (void)setValue:(id)a3 ofPersistentProperty:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[IMDDaemonPropertyManager sharedManager](&OBJC_CLASS___IMDDaemonPropertyManager, "sharedManager"));
  [v7 setValue:v6 ofPersistentProperty:v5];
}

- (id)valueOfPersistentProperty:(id)a3
{
  id v3 = a3;
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDaemonPropertyManager sharedManager](&OBJC_CLASS___IMDDaemonPropertyManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueOfPersistentProperty:v3]);

  return v5;
}

- (void)markUnreadForMessageGUID:(id)a3 IDs:(id)a4 style:(unsigned __int8)a5 services:(id)a6
{
  id v8 = a3;
  id v47 = a4;
  id v45 = a6;
  if (IMOSLoggingEnabled(v45, v9))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IMDClientRequestContext currentContext]( &OBJC_CLASS___IMDClientRequestContext,  "currentContext",  v45,  v47));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 listenerID]);
      *(_DWORD *)buf = 138412546;
      id v54 = v13;
      __int16 v55 = 2112;
      id v56 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Request from %@ to mark message as unread with GUID %@",  buf,  0x16u);
    }
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___IMTimingCollection);
  [v14 startTimingForKey:@"total-time-to-mark-unread"];
  if (![v8 length])
  {
    [v14 startTimingForKey:@"search-for-guid"];
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v16 = v47;
    __int128 v17 = 0LL;
    id v18 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
          if ((-[NSMutableSet containsObject:](v15, "containsObject:", v21, v45) & 1) == 0)
          {
            -[NSMutableSet addObject:](v15, "addObject:", v21);
            uint64_t MessageForChatIdentifier = IMDMessageRecordCopyLastReadMessageForChatIdentifier(v21);
            __int16 v23 = (const void *)MessageForChatIdentifier;
            if (MessageForChatIdentifier)
            {
              AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef( MessageForChatIdentifier,  0LL,  1LL,  0LL);
              CFRelease(v23);
              if (!v17 || [v17 isOlderThanItem:AttachmentIfNeededRef])
              {
                id v25 = [AttachmentIfNeededRef copy];

                __int128 v17 = v25;
              }
            }
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }

      while (v18);

      if (!v17) {
        goto LABEL_26;
      }
      if (IMOSLoggingEnabled(v26, v27))
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory("History");
        int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "We found a message guid to mark unread %@",  buf,  0xCu);
        }
      }

      id v16 = v8;
      id v8 = (id)objc_claimAutoreleasedReturnValue([v17 guid]);
    }

LABEL_26:
    objc_msgSend(v14, "stopTimingForKey:", @"search-for-guid", v45);
  }

  id v30 = objc_msgSend(v8, "length", v45);
  if (v30)
  {
    if (IMOSLoggingEnabled(v30, v31))
    {
      uint64_t v32 = OSLogHandleForIMFoundationCategory("History");
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v8;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Marking message as unread %@", buf, 0xCu);
      }
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    [v34 markMessageGUIDUnread:v8];

    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 anySessionForServiceName:IMServiceNameiMessage]);

    if (v36)
    {
      [v36 reflectMarkUnreadToPeerDevicesForMessageGUID:v8];
    }

    else if (IMOSLoggingEnabled(v37, v38))
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory("Warning");
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "We could not find a service session for imessage to send that the message has been marked unread %@",  buf,  0xCu);
      }
    }
  }

  id v41 = [v14 stopTimingForKey:@"total-time-to-mark-unread"];
  if (IMOSLoggingEnabled(v41, v42))
  {
    uint64_t v43 = OSLogHandleForIMFoundationCategory("History");
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v14;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "total time to mark unread %@", buf, 0xCu);
    }
  }
}

- (void)markMessageAsReadWithGUID:(id)a3 callerOrigin:(int64_t)a4 reply:(id)a5
{
  id v36 = a3;
  v34 = (void (**)(id, void))a5;
  if (IMOSLoggingEnabled(v34, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("History");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 listenerID]);
      uint64_t v11 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v47 = v10;
      __int16 v48 = 2112;
      if (a4 == 1) {
        uint64_t v11 = @"YES";
      }
      id v49 = v36;
      __int16 v50 = 2112;
      __int128 v51 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Request from %@ to mark message as read with GUID: %@ isFromSiri %@",  buf,  0x20u);
    }
  }

  if (![v36 length])
  {
    v34[2](v34, 0LL);
    goto LABEL_25;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 chatsForMessageGUID:v36]);

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v13;
  char v14 = 0;
  id v15 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (!v15) {
    goto LABEL_23;
  }
  uint64_t v16 = *(void *)v39;
  do
  {
    for (i = 0LL; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v39 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 serviceName]);
      if ([v19 length])
      {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 chatIdentifier]);
        BOOL v21 = [v20 length] == 0;

        if (!v21)
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v18 chatIdentifier]);
          v44 = v24;
          id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v44,  1LL));
          id v26 = [v18 style];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v18 serviceName]);
          uint64_t v43 = v27;
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v43,  1LL));
          id v42 = v36;
          int v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v42,  1LL));
          sub_10001A778(v25, (uint64_t)v26, v28, v29, 0LL, a4, 0LL);

          char v14 = 1;
          continue;
        }
      }

      else
      {
      }

      if (IMOSLoggingEnabled(v22, v23))
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory("Warning");
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v18 chatIdentifier]);
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 serviceName]);
          *(_DWORD *)buf = 138412802;
          id v47 = v18;
          __int16 v48 = 2112;
          id v49 = v32;
          __int16 v50 = 2112;
          __int128 v51 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Empty IDs or services for chat: %@ (IDs: %@  Services: %@)",  buf,  0x20u);
        }
      }
    }

    id v15 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  }

  while (v15);
LABEL_23:

  v34[2](v34, v14 & 1);
LABEL_25:
}

- (void)markReadForMessageGUID:(id)a3 callerOrigin:(int64_t)a4 queryID:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100011A04;
  v11[3] = &unk_100065528;
  id v12 = a5;
  id v13 = v8;
  id v9 = v8;
  id v10 = v12;
  -[IMDaemonAnyRequestHandler markMessageAsReadWithGUID:callerOrigin:reply:]( self,  "markMessageAsReadWithGUID:callerOrigin:reply:",  v9,  a4,  v11);
}

- (void)markPlayedForMessageGUID:(id)a3
{
  id v30 = a3;
  if (IMOSLoggingEnabled(v30, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 listenerID]);
      *(_DWORD *)buf = 138412546;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Request from %@ to mark message as played with GUID: %@",  buf,  0x16u);
    }
  }

  if ([v30 length])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 chatsForMessageGUID:v30]);

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v32;
      *(void *)&__int128 v13 = 138412802LL;
      __int128 v29 = v13;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "chatIdentifier", v29));
          uint64_t v18 = IMSingleObjectArray(v17);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceName]);
          uint64_t v21 = IMSingleObjectArray(v20);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

          id v23 = [v22 count];
          if (v23 && (id v23 = [v19 count]) != 0)
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 messageWithGUID:v30]);

            -[IMDaemonAnyRequestHandler markPlayedForIDs:style:onServices:message:]( self,  "markPlayedForIDs:style:onServices:message:",  v19,  [v16 style],  v22,  v26);
          }

          else if (IMOSLoggingEnabled(v23, v24))
          {
            uint64_t v27 = OSLogHandleForIMFoundationCategory("Warning");
            uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v29;
              id v36 = v16;
              __int16 v37 = 2112;
              id v38 = v19;
              __int16 v39 = 2112;
              __int128 v40 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "Empty IDs or services for chat: %@ (IDs: %@  Services: %@)",  buf,  0x20u);
            }
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }

      while (v12);
    }
  }
}

- (void)markPlayedForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6
{
  unsigned int v79 = a4;
  id v82 = a3;
  id v81 = a5;
  id v8 = a6;
  if (IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("History");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 listenerID]);
      *(_DWORD *)buf = 138412802;
      id v91 = v13;
      __int16 v92 = 2112;
      id v93 = v82;
      __int16 v94 = 2112;
      id v95 = v81;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Request from %@ to mark message as played with IDs: %@  services: %@",  buf,  0x20u);
    }
  }

  if ([v82 count] && objc_msgSend(v81, "count"))
  {
    id v14 = [v82 count];
    id v15 = [v81 count];
    if (v14 == v15)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 guid]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 messageWithGUID:v18]);

      if (v19)
      {
        objc_msgSend(v19, "setFlags:", (unint64_t)objc_msgSend(v19, "flags") | 0x400000);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v19 setTimePlayed:v22];

        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        v84 = (void *)objc_claimAutoreleasedReturnValue( [v23 storeMessage:v19 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:0x400000]);
      }

      else
      {
        v84 = 0LL;
      }

      if (IMOSLoggingEnabled(v20, v21))
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory("History");
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v91 = v84;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Found message to mark as played: %@",  buf,  0xCu);
        }
      }

      v80 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      if ([v82 count])
      {
        unint64_t v28 = 0LL;
        do
        {
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v82 objectAtIndex:v28]);
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v81 objectAtIndex:v28]);
          __int128 v31 = (void *)IMCopyGUIDForChat(v29, v30, v79);

          -[NSMutableSet addObject:](v80, "addObject:", v31);
          ++v28;
        }

        while (v28 < (unint64_t)[v82 count]);
      }

      if (v84)
      {
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        v83 = (void *)objc_claimAutoreleasedReturnValue([v32 chatForMessage:v84]);

        BOOL v33 = [v83 style] == 45;
        id v34 = [v82 count];
        if (v33)
        {
          if (v34)
          {
            unint64_t v35 = 0LL;
            do
            {
              id v36 = (void *)objc_claimAutoreleasedReturnValue([v82 objectAtIndex:v35]);
              __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v81 objectAtIndex:v35]);
              id v38 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
              __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 chatsWithHandle:v36 onService:v37]);

              __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 arrayByApplyingSelector:"guid"]);
              -[NSMutableSet addObjectsFromArray:](v80, "addObjectsFromArray:", v40);

              ++v35;
            }

            while (v35 < (unint64_t)[v82 count]);
          }
        }

        else if (v34)
        {
          unint64_t v41 = 0LL;
          do
          {
            id v42 = (void *)objc_claimAutoreleasedReturnValue([v82 objectAtIndex:v41]);
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v81 objectAtIndex:v41]);
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
            id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 chatsWithRoomname:v42 onService:v43]);

            v46 = (void *)objc_claimAutoreleasedReturnValue([v45 arrayByApplyingSelector:"guid"]);
            -[NSMutableSet addObjectsFromArray:](v80, "addObjectsFromArray:", v46);

            ++v41;
          }

          while (v41 < (unint64_t)[v82 count]);
        }

        id v47 = (void *)objc_claimAutoreleasedReturnValue([v84 guid]);
        __int128 v87 = 0u;
        __int128 v88 = 0u;
        __int128 v85 = 0u;
        __int128 v86 = 0u;
        __int16 v48 = v80;
        id v49 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v85,  v89,  16LL);
        if (v49)
        {
          uint64_t v50 = *(void *)v86;
          do
          {
            for (i = 0LL; i != v49; i = (char *)i + 1)
            {
              if (*(void *)v86 != v50) {
                objc_enumerationMutation(v48);
              }
              uint64_t v52 = *(void *)(*((void *)&v85 + 1) + 8LL * (void)i);
              v53 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
              id v54 = (void *)objc_claimAutoreleasedReturnValue([v53 existingChatWithGUID:v52]);

              __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 lastMessage]);
              id v56 = (void *)objc_claimAutoreleasedReturnValue([v55 guid]);
              LODWORD(v53) = [v56 isEqualToString:v47];

              if ((_DWORD)v53)
              {
                id v57 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                [v57 updateStateForChat:v83 hintMessage:v84 shouldRebuildFailedMessageDate:0];
              }
            }

            id v49 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v85,  v89,  16LL);
          }

          while (v49);
        }

        id v58 = (void *)objc_claimAutoreleasedReturnValue([v84 accountID]);
        uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
        v60 = (void *)objc_claimAutoreleasedReturnValue([v59 sessionForAccount:v58]);

        if (IMOSLoggingEnabled(v61, v62))
        {
          uint64_t v63 = OSLogHandleForIMFoundationCategory("History");
          v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v91 = v84;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_INFO,  "Sending played receipt for: %@",  buf,  0xCu);
          }
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue([v83 chatIdentifier]);
        objc_msgSend( v60,  "sendPlayedReceiptForMessage:toChatID:identifier:style:",  v84,  0,  v65,  objc_msgSend(v83, "style"));

        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        v67 = (void *)objc_claimAutoreleasedReturnValue([v84 guid]);
        id v8 = (id)objc_claimAutoreleasedReturnValue([v66 messageWithGUID:v67]);

        id v68 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
        v69 = (void *)objc_claimAutoreleasedReturnValue([v68 broadcasterForChatListeners]);

        if (IMOSLoggingEnabled(v70, v71))
        {
          uint64_t v72 = OSLogHandleForIMFoundationCategory("History");
          __int128 v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v91 = v8;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "Notifying about message: %@", buf, 0xCu);
          }
        }

        [v69 account:v58 chat:0 style:0 chatProperties:0 messageUpdated:v8];
      }

      else
      {
        id v8 = 0LL;
      }

      uint64_t ShouldAutomaticallySave = IMMessageItemShouldAutomaticallySave(v8);
      if ((_DWORD)ShouldAutomaticallySave)
      {
        if (IMOSLoggingEnabled(ShouldAutomaticallySave, v75))
        {
          uint64_t v76 = OSLogHandleForIMFoundationCategory("History");
          __int128 v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v91 = v82;
            __int16 v92 = 2112;
            id v93 = v81;
            _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_INFO,  "Automatically marking played messages as saved with IDs: %@  services: %@",  buf,  0x16u);
          }
        }

        __int128 v78 = objc_alloc_init(&OBJC_CLASS___IMDaemonChatModifyReadStateRequestHandler);
        -[IMDaemonChatModifyReadStateRequestHandler markSavedForIDs:style:onServices:message:]( v78,  "markSavedForIDs:style:onServices:message:",  v82,  v79,  v81,  v8);
      }
    }

    else if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory("Warning");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v91 = v82;
        __int16 v92 = 2112;
        id v93 = v81;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Mismatched IDs and serviceNames array to mark as played (IDs: %@   Service names: %@)",  buf,  0x16u);
      }
    }
  }
}

- (void)playSendSoundForMessageGUID:(id)a3 callerOrigin:(int64_t)a4
{
  id v5 = a3;
  if (IMOSLoggingEnabled(v5, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("History");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"NO";
      if (a4 == 1) {
        uint64_t v9 = @"YES";
      }
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Request to play send sound for message with GUID: %@ isFromSiri %@",  (uint8_t *)&v16,  0x16u);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 messageWithGUID:v5]);

  if (v11)
  {
    +[IMDSoundUtilities playMessageSentSoundIfNeeded:]( &OBJC_CLASS___IMDSoundUtilities,  "playMessageSentSoundIfNeeded:",  v11);
  }

  else if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Warning");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Could not find message item matching guid, not playing send sound. GUID: %@",  (uint8_t *)&v16,  0xCu);
    }
  }
}

- (void)requestNetworkDataAvailability
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("Daemon");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "requesting network data availability", v7, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 broadcasterForAllListeners]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  objc_msgSend(v5, "networkDataAvailabilityChanged:", objc_msgSend(v6, "networkDataAvailable"));
}

- (void)requestBuddyPicturesAndPropertiesForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accountForAccountID:v3]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 session]);
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Daemon");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412802;
      int v16 = v5;
      __int16 v17 = 2112;
      __int16 v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "requestBuddyPicturesAndPropertiesForAccount: %@   session: %@  account: %@",  (uint8_t *)&v15,  0x20u);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 service]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 broadcasterForListenersSupportingService:v11]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 buddyProperties]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 buddyPictures]);
  [v12 account:v3 buddyProperties:v13 buddyPictures:v14];
}

- (void)forceReloadChatRegistryWithQueryID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Forcing reload chats", v10, 2u);
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  [v7 _forceReloadChats:1];

  if (v3)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyProxy]);
    [v9 forcedReloadingChatRegistryWithQueryID:v3];
  }
}

- (void)requestOneTimeCodeStatus
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("ChatOTC");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to get one time codes", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDOneTimeCodeManager sharedInstance](&OBJC_CLASS___IMDOneTimeCodeManager, "sharedInstance"));
  [v4 broadcastCodeStatusToClients];
}

- (void)consumeCodeWithMessageGUID:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("ChatOTC");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Request to consume code with message guid: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  -[IMDaemonAnyRequestHandler markReadForMessageGUID:callerOrigin:queryID:]( self,  "markReadForMessageGUID:callerOrigin:queryID:",  v4,  0LL,  0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDOneTimeCodeManager sharedInstance](&OBJC_CLASS___IMDOneTimeCodeManager, "sharedInstance"));
  [v8 consumeCodeWithGuid:v4];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"));
  [v9 trackEvent:IMMetricsCollecterEventConsumedOTC];
}

- (void)onboardDeleteVerificationCodesIfNeededWithReply:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("ChatOTC");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Processing request to onboarding delete verification codes if needed",  v8,  2u);
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDOneTimeCodeManager sharedInstance](&OBJC_CLASS___IMDOneTimeCodeManager, "sharedInstance"));
  [v7 onboardDeleteVerificationCodesIfNeededWithCompletionHandler:v3];
}

- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[IMDOneTimeCodeManager sharedInstance](&OBJC_CLASS___IMDOneTimeCodeManager, "sharedInstance"));
  [v7 onboardDeleteVerificationCodesIfNeededWithMessage:v6 completionHandler:v5];
}

- (void)setAutoDeletionPreference:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IMDOneTimeCodeManager sharedInstance](&OBJC_CLASS___IMDOneTimeCodeManager, "sharedInstance"));
  [v4 setAutoDeletionPreference:v3];
}

- (void)fetchAutoDeletionPreferenceWithReply:(id)a3
{
  if (a3)
  {
    id v5 = (void (**)(id, id))a3;
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDOneTimeCodeManager sharedInstance](&OBJC_CLASS___IMDOneTimeCodeManager, "sharedInstance"));
    id v4 = [v3 autoDeletionPreference];

    v5[2](v5, v4);
  }

- (void)simulateOneTimeCodeArriving:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("ChatOTC");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Recevied request to simulate a One Time Code. Passing on to listeners.",  v8,  2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDOneTimeCodeManager sharedInstance](&OBJC_CLASS___IMDOneTimeCodeManager, "sharedInstance"));
  [v7 startTrackingCode:v3];
}

- (void)preWarm
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 anySessionForServiceName:IMServiceNameiMessage]);

  id v3 = v5;
  if (v5)
  {
    char v4 = objc_opt_respondsToSelector(v5, "preWarm");
    id v3 = v5;
    if ((v4 & 1) != 0)
    {
      [v5 preWarm];
      id v3 = v5;
    }
  }
}

- (void)downloadPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v8));
      int v27 = 138413058;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Request to download attachments for chatIdentifiers %@ style %@ services %@ chat guid %@",  (uint8_t *)&v27,  0x2Au);
    }
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyProxy]);

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDChatUtilities _stringForChatIDs:onServices:]( &OBJC_CLASS___IMDChatUtilities,  "_stringForChatIDs:onServices:",  v10,  v11));
  unint64_t v20 = -[IMDaemonAnyRequestHandler _broadcastedUncachedAttachmentCountForChatWithGUID:chatIdentifiers:services:broadcaster:]( self,  "_broadcastedUncachedAttachmentCountForChatWithGUID:chatIdentifiers:services:broadcaster:",  v12,  v10,  v11,  v18);
  if (IMOSLoggingEnabled(v20, v21))
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v20));
      int v27 = 138412546;
      id v28 = v24;
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Purged count starts at %@ for key %@",  (uint8_t *)&v27,  0x16u);
    }
  }

  downloadingCountDictionary = self->_downloadingCountDictionary;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v20));
  -[NSMutableDictionary setObject:forKey:](downloadingCountDictionary, "setObject:forKey:", v26, v19);

  -[IMDaemonAnyRequestHandler _downloadPurgedAttachmentsForIDs:style:onServices:chatID:retryCount:broadcaster:]( self,  "_downloadPurgedAttachmentsForIDs:style:onServices:chatID:retryCount:broadcaster:",  v10,  v8,  v11,  v12,  0LL,  v18);
}

- (BOOL)_shouldContinueDownloadingPurgedAttachments:(unint64_t)a3
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"ck-client-download-purged-attachments-max-retry-count"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v5, v6);
  if ((isKindOfClass & 1) != 0 && (uint64_t isKindOfClass = (uint64_t)[v5 intValue], (int)isKindOfClass >= 1))
  {
    uint64_t isKindOfClass = (uint64_t)[v5 intValue];
    unint64_t v9 = (int)isKindOfClass;
  }

  else
  {
    unint64_t v9 = 5LL;
  }

  if (v9 <= a3 && IMOSLoggingEnabled(isKindOfClass, v8))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9));
      int v14 = 138412290;
      int v15 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Cannot continue downloading purged attachments becaused reach max retry count of %@",  (uint8_t *)&v14,  0xCu);
    }
  }

  return v9 > a3;
}

- (void)_downloadPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 retryCount:(unint64_t)a7 broadcaster:(id)a8
{
  uint64_t v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v12));
      *(_DWORD *)buf = 138413058;
      id v40 = v14;
      __int16 v41 = 2112;
      id v42 = v21;
      __int16 v43 = 2112;
      id v44 = v15;
      __int16 v45 = 2112;
      id v46 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Request to download attachments for chatIdentifiers %@ style %@ services %@ chat guid %@",  buf,  0x2Au);
    }
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[IMDChatUtilities _stringForChatIDs:onServices:]( &OBJC_CLASS___IMDChatUtilities,  "_stringForChatIDs:onServices:",  v14,  v15));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatUtilities sharedUtilities](&OBJC_CLASS___IMDChatUtilities, "sharedUtilities"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 currentlyDownloadingSet]);
  [v24 addObject:v22];

  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKAttachmentSyncController sharedInstance]( &OBJC_CLASS___IMDCKAttachmentSyncController,  "sharedInstance"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100013808;
  v31[3] = &unk_100065578;
  v31[4] = self;
  id v32 = v16;
  id v33 = v14;
  id v34 = v15;
  id v35 = v17;
  id v36 = v22;
  unint64_t v37 = a7;
  char v38 = v12;
  id v26 = v22;
  id v27 = v17;
  id v28 = v15;
  id v29 = v14;
  id v30 = v16;
  [v25 downloadAttachmentAssetsForChatIDs:v29 services:v28 style:v12 completion:v31];
}

- (unint64_t)_broadcastedUncachedAttachmentCountForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 services:(id)a5 broadcaster:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  unsigned __int8 v14 = [v13 cloudKitSyncingEnabled];

  if ((v14 & 1) != 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKAttachmentSyncController sharedInstance]( &OBJC_CLASS___IMDCKAttachmentSyncController,  "sharedInstance"));
    id v18 = [v17 purgedAttachmentsCountForChatsWithChatIdentifiers:v10 services:v11];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v18));
    [v12 chat:v9 uncachedAttachmentCountUpdated:v19];
  }

  else
  {
    if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412546;
        id v24 = v10;
        __int16 v25 = 2112;
        id v26 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "CloudKit syncing disabled, not broadcasting uncached attachment count for %@ on %@",  (uint8_t *)&v23,  0x16u);
      }
    }

    id v18 = 0LL;
  }

  return (unint64_t)v18;
}

- (void)initiateQuickSwitch
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMDQuickSwitchController sharedInstance](&OBJC_CLASS___IMDQuickSwitchController, "sharedInstance"));
  [v2 dummyMethod];
}

- (void)requestQOSClassWhileServicingRequestsWithID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = qos_class_self();
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 broadcasterForChatListeners]);
  [v5 qosClassWhileServicingRequestsResponse:v4 identifier:v3];
}

- (void)fetchGroupPhotoPathsForChatsWithGroupIDs:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Daemon");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Fetching group photo paths for chats with group IDs from the database.",  buf,  2u);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDatabase synchronousDatabase](&OBJC_CLASS___IMDDatabase, "synchronousDatabase"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100014224;
  v12[3] = &unk_1000654B0;
  id v13 = v6;
  id v11 = v6;
  [v10 fetchGroupPhotoPathsForChatsWithGroupIDs:v5 completionHandler:v12];
}

- (void)fetchNicknamesWithReply:(id)a3
{
  id v3 = (void (**)(id, id, void *, void *))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 pendingNicknameUpdates]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handledNicknames]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 archivedNicknames]);

  v3[2](v3, v9, v6, v8);
}

- (void)fetchHandleSharingStateWithReply:(id)a3
{
  id v3 = (void (**)(id, id, void *))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 allowListedHandlesForSharing]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 denyListedHandlesForSharing]);

  v3[2](v3, v7, v6);
}

- (void)fetchTransitionedNicknameHandlesWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 transitionedHandles]);

  v3[2](v3, v5);
}

- (void)fetchActiveNicknamesWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 activeRecords]);

  v3[2](v3, v5);
}

- (void)fetchIgnoredNicknameHandlesWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 ignoredRecords]);

  v3[2](v3, v5);
}

- (void)fetchUnknownSenderRecordsWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 unknownSenderRecordInfo]);

  v3[2](v3, v5);
}

- (void)clearPendingNicknameUpdatesForHandleIDs:(id)a3
{
  id v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
        [v9 clearPendingNicknameForHandleID:v8];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }
}

- (void)ignorePendingNicknameUpdatesForHandleIDs:(id)a3
{
  id v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
        [v9 ignorePendingNicknameForHandleID:v8];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }
}

- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v6 acceptPendingNicknameForHandleID:v5 updateType:a4];
}

- (void)clearPendingNicknamePhotoUpdateForHandleIDs:(id)a3
{
  id v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
        [v9 clearPendingNicknamePhotoForHandleID:v8];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }
}

- (void)allowHandleIDsForNicknameSharing:(id)a3 onChatGUIDs:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v12 allowHandlesForSharing:v11 onChatGUIDs:v10 fromHandle:v9 forceSend:v6];
}

- (void)denyHandleIDsForNicknameSharing:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v4 denyHandlesForSharing:v3];
}

- (void)markNicknamesAsTransitionedForHandleIDs:(id)a3 isAutoUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v6 markNicknamesAsTransitionedForHandleIDs:v5 isAutoUpdate:v4];
}

- (void)markProfileRecords:(id)a3 asActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v6 markProfileRecords:v5 asActive:v4];
}

- (void)markProfileRecordsAsIgnored:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v4 markProfileRecordsAsIgnored:v3 broadcastUpdates:1];
}

- (void)nicknamePreferencesDidChange
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v2 sendNicknamePreferencesDidChange];
}

- (void)setNewPersonalNickname:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v4 setPersonalNickname:v3 completionBlock:&stru_1000655B8];
}

- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v7 sendNameOnlyToHandleIDs:v6 fromHandleID:v5];
}

- (void)fetchPersonalNicknameWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 personalNickname]);

  v3[2](v3, v5);
}

- (void)fetchiCloudAccountStatusWithReply:(id)a3
{
  id v6 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  id v4 = [v3 evaluateAccountStateForFeatureEligibility];

  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, id))v6 + 2))(v6, v4);
    id v5 = v6;
  }
}

- (void)markAllNicknamesAsPending
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
  [v2 markAllNicknamesAsPending];
}

- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 anySessionForServiceName:IMServiceNameiMessage]);

  [v8 eagerUploadTransfer:v6 recipients:v5];
}

- (void)eagerUploadCancel:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 anySessionForServiceName:IMServiceNameiMessage]);

  [v5 eagerUploadCancel:v3];
}

- (void)downloadStickerWithGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMDSticker");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDStickerRegistry sharedInstance](&OBJC_CLASS___IMDStickerRegistry, "sharedInstance"));
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Got a request to download sticker with GUID %@ stickerStore %@",  (uint8_t *)&v8,  0x16u);
    }
  }
}

- (void)downloadStickerPackWithGUID:(id)a3 isIncomingMessage:(BOOL)a4 ignoreCache:(BOOL)a5
{
  id v5 = a3;
  if (IMOSLoggingEnabled(v5, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("IMDSticker");
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDStickerRegistry sharedInstance](&OBJC_CLASS___IMDStickerRegistry, "sharedInstance"));
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      __int128 v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Got a request to download sticker pack with GUID %@ stickerStore %@",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (void)holdBuddyUpdatesAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 holdBuddyUpdates];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)resumeBuddyUpdatesAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 resumeBuddyUpdates];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)startWatchingBuddy:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 startWatchingBuddy:v5];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)stopWatchingBuddy:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 stopWatchingBuddy:v5];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)requestProperty:(id)a3 ofPerson:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sessionForAccount:v9]);

  if (v11) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      id v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v25,  0xCu);
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 accountForAccountID:v9]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 service]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 internalName]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v16 anySessionForServiceName:v20]);

  if (v11)
  {
LABEL_7:
    [v11 requestProperty:v7 ofPerson:v8];
  }

  else if (IMOSLoggingEnabled(v21, v22))
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory("Warning");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      id v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v25,  0xCu);
    }
  }
}

- (void)setValue:(id)a3 ofProperty:(id)a4 ofPerson:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionForAccount:v12]);

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountForAccountID:v12]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 internalName]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v23]);

  if (v14)
  {
LABEL_7:
    [v14 setValue:v9 ofProperty:v10 ofPerson:v11];
  }

  else if (IMOSLoggingEnabled(v24, v25))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)requestGroupsAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 requestGroups];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)sendNotificationMessageToUniqueID:(id)a3 withCommand:(int64_t)a4
{
  id v5 = a3;
  if (IMOSLoggingEnabled(v5, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("IMDaemon_Notifications");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Calling sendNotificationMessageToUniqueID with uniqueId %@ and command %@",  (uint8_t *)&v11,  0x16u);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMMessageNotificationController sharedInstance]( &OBJC_CLASS___IMMessageNotificationController,  "sharedInstance"));
  [v10 sendNotificationMessageToUniqueID:v5 withCommmand:a4];
}

- (void)_initiateScreenSharingWithID:(id)a3 isContact:(BOOL)a4 sharingMyScreen:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v9 = v7;
  if (qword_100071050 != -1) {
    dispatch_once(&qword_100071050, &stru_1000655D8);
  }
  if (off_100071048)
  {
    id v10 = v9;
    id v12 = v10;
    __int16 v13 = v10;
    if (v6)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @":"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 invertedSet]);
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAddingPercentEncodingWithAllowedCharacters:v15]);
    }

    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory("CKCatalystScreenSharing");
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        uint64_t v23 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Initiating screen sharing with %@",  (uint8_t *)&v22,  0xCu);
      }
    }

    uint64_t v18 = (void (*)(id, BOOL, BOOL))off_100071048;
    id v19 = v13;
    v18([v19 UTF8String], v6, v5);
  }

  else if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("CKCatalystScreenSharing");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Unable to weak link RFBStartAppleIDScreenSharingConnection. Screen sharing will be unavailable.",  (uint8_t *)&v22,  2u);
    }
  }
}

- (void)inviteHandleIDToShareMyScreen:(id)a3 isContact:(BOOL)a4
{
}

- (void)askHandleIDToShareTheirScreen:(id)a3 isContact:(BOOL)a4
{
}

- (void)requestPendingVCInvites
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemonAnyRequestHandler");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      BOOL v5 = "-[IMDaemonAnyRequestHandler requestPendingVCInvites]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Ignoring request for %s", (uint8_t *)&v4, 0xCu);
    }
  }

- (void)requestPendingACInvites
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemonAnyRequestHandler");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      BOOL v5 = "-[IMDaemonAnyRequestHandler requestPendingACInvites]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Ignoring request for %s", (uint8_t *)&v4, 0xCu);
    }
  }

- (void)conference:(id)a3 account:(id)a4 notifyInvitationCancelledFromPerson:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("IMDaemonAnyRequestHandler");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[IMDaemonAnyRequestHandler conference:account:notifyInvitationCancelledFromPerson:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Ignoring request for %s", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)terminateForcingIfNeeded:(BOOL)a3
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("IMDaemonAnyRequestHandler");
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      BOOL v6 = "-[IMDaemonAnyRequestHandler terminateForcingIfNeeded:]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ignoring request for %s", (uint8_t *)&v5, 0xCu);
    }
  }

- (void)sendNotice:(id)a3 toHandles:(id)a4 fromHandle:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t))a6;
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Daemon");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412802;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Client request to send notice %@ toHandles %@ fromHandle: %@",  (uint8_t *)&v16,  0x20u);
    }
  }

  v12[2](v12, 1LL);
}

- (void)sendClearNotice:(id)a3 toHandles:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Daemon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Client request to send clear notice %@ toHandles %@",  (uint8_t *)&v13,  0x16u);
    }
  }

  v9[2](v9, 1LL);
}

- (NSMutableDictionary)downloadingCountDictionary
{
  return self->_downloadingCountDictionary;
}

- (void).cxx_destruct
{
}

- (void)requestSetupWithClientID:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 reply:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v11);
  unint64_t v14 = v13;
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  _Block_copy(v10);
  id v16 = self;
  sub_10003C758(v12, v14, a4, v15, v16, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease(v14, v17);
  swift_bridgeObjectRelease(v15, v18);
}

- (void)requestSetupXPCObjectWithClientID:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 reply:(id)a6
{
  id v9 = _Block_copy(a6);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v10);
  uint64_t v12 = v11;
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  uint64_t v14 = swift_allocObject(&unk_1000668A0, 24LL, 7LL);
  *(void *)(v14 + 16) = v9;
  uint64_t v15 = self;
  NSString v16 = String._bridgeToObjectiveC()();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t v18 = swift_allocObject(&unk_1000668C8, 32LL, 7LL);
  *(void *)(v18 + 16) = sub_10003C740;
  *(void *)(v18 + 24) = v14;
  aBlock[4] = sub_10003CBE0;
  uint64_t v25 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10003C430;
  aBlock[3] = &unk_1000668E0;
  id v19 = _Block_copy(aBlock);
  uint64_t v20 = v25;
  swift_retain(v14);
  swift_release(v20);
  -[IMDaemonAnyRequestHandler requestSetupWithClientID:capabilities:context:reply:]( v15,  "requestSetupWithClientID:capabilities:context:reply:",  v16,  a4,  isa,  v19);
  _Block_release(v19);

  swift_bridgeObjectRelease(v12, v21);
  swift_bridgeObjectRelease(v13, v22);
  swift_release(v14);
}

@end