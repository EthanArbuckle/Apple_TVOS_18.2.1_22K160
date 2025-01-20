@interface IMDaemonCloudSyncRequestHandler
- (id)rampStateDictionaryFromPromoted:(BOOL)a3 featureHadServerError:(BOOL)a4;
- (void)broadcastCloudKitState;
- (void)broadcastCloudKitStateAfterClearingErrors;
- (void)broadcastCloudKitStateAfterFetchingAccountStatus;
- (void)cancelSync:(id)a3;
- (void)clearAnalyticDefaultsAndLocalSyncState;
- (void)clearChatZoneSyncToken;
- (void)clearDataFromCloudKit;
- (void)clearLocalCloudKitSyncState;
- (void)createAttachmentZone;
- (void)createChatZone;
- (void)currentStorageOnDeviceWithReply:(id)a3;
- (void)deleteAttachmentZone;
- (void)deleteChatZone;
- (void)deleteExitRecord;
- (void)deleteMessagesZone;
- (void)deleteSalt;
- (void)downloadAttachmentAssets;
- (void)fetchAccountStatusAndUpdateMiCSwitchEligibility;
- (void)fetchCloudKitSyncStateDebuggingInfo:(id)a3;
- (void)fetchExitRecord;
- (void)fetchLatestRampState;
- (void)fetchLatestSalt;
- (void)fetchSyncStateStatistics;
- (void)initiatePeriodicSync;
- (void)initiateSync:(id)a3 forceRunNow:(BOOL)a4 reply:(id)a5;
- (void)loadDeletedMessagesWithLimit:(int64_t)a3;
- (void)loadDirtyMessagesWithLimit:(int64_t)a3;
- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4;
- (void)markAllChatsAsDirty;
- (void)metricAttachments:(int64_t)a3;
- (void)performAdditionalStorageRequiredCheck;
- (void)printCachedRampState;
- (void)printCachedSalt;
- (void)purgeAttachments:(int64_t)a3;
- (void)reportMetricToCK:(id)a3 withDict:(id)a4;
- (void)sendRestoreFailuresLogDumps;
- (void)setCloudKitEnabled:(BOOL)a3;
- (void)simulateCloudKitSyncWithSyncState:(id)a3;
- (void)startUserInitiatedSync;
- (void)syncAttachments;
- (void)syncChats;
- (void)syncDeletesToCloudKit;
- (void)syncMessages;
- (void)tryToAutoCollectLogsWithErrorString:(id)a3 sendLogsTo:(id)a4;
- (void)tryToDisableAllDevices;
- (void)updateAttachmentFileSizes;
- (void)uploadDailyAnalyticstoCloudKit;
- (void)writeAttachments;
- (void)writeCloudKitSyncCounts:(id)a3;
- (void)writeDirtyChats;
- (void)writeDirtyMessages;
- (void)writeExitRecord;
@end

@implementation IMDaemonCloudSyncRequestHandler

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v6 logDumpAndSendMessageTo:v5 forHours:v4 reason:@"IMToolRequest"];
}

- (void)createChatZone
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to create chat zone", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDRecordZoneManager sharedInstance](&OBJC_CLASS___IMDRecordZoneManager, "sharedInstance"));
  [v4 createChatZoneIfNeededWithCompletionBlock:&stru_100065668];
}

- (void)writeDirtyChats
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to write all dirty chats", v4, 2u);
    }
  }

- (void)deleteChatZone
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Request to delet chat zone and nuke chat sync token",  v5,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKChatSyncController sharedInstance](&OBJC_CLASS___IMDCKChatSyncController, "sharedInstance"));
  [v4 deleteChatZone];
}

- (void)fetchAccountStatusAndUpdateMiCSwitchEligibility
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Request to fetch security level and update MiC switch eligibility",  v5,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v4 fetchAccountStatusAndUpdateMiCSwitchEligibility];
}

- (void)syncChats
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  [v2 beginChatSyncPeriodic:0 activity:0];
}

- (void)markAllChatsAsDirty
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to mark all chats as dirty", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
  [v4 enumerateBatchedChatsFilteredUsingPredicate:0 block:&stru_1000656A8];
}

- (void)clearChatZoneSyncToken
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to clear chat sync token", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKChatSyncController sharedInstance](&OBJC_CLASS___IMDCKChatSyncController, "sharedInstance"));
  [v4 deleteChatSyncToken];
}

- (void)createAttachmentZone
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to create attachment zone", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDRecordZoneManager sharedInstance](&OBJC_CLASS___IMDRecordZoneManager, "sharedInstance"));
  [v4 createAttachmentZoneIfNeededWithCompletionBlock:&stru_1000656C8];
}

- (void)deleteAttachmentZone
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to delete attachment zone", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDRecordZoneManager sharedInstance](&OBJC_CLASS___IMDRecordZoneManager, "sharedInstance"));
  [v4 deleteAttachmentZone];
}

- (void)writeAttachments
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to write all attachments", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKAttachmentSyncController sharedInstance]( &OBJC_CLASS___IMDCKAttachmentSyncController,  "sharedInstance"));
  [v4 syncAttachmentsWithSyncType:2 deviceConditionsToCheck:0 activity:0 completionBlock:0];
}

- (void)syncAttachments
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to sync all attachments", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKAttachmentSyncController sharedInstance]( &OBJC_CLASS___IMDCKAttachmentSyncController,  "sharedInstance"));
  [v4 syncAttachmentsWithSyncType:0 deviceConditionsToCheck:0 activity:0 completionBlock:0];
}

- (void)downloadAttachmentAssets
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Request to download CloudKit attachment assets",  v5,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKAttachmentSyncController sharedInstance]( &OBJC_CLASS___IMDCKAttachmentSyncController,  "sharedInstance"));
  [v4 downloadAttachmentAssetsWithActivity:0 restoringAttachments:1 completion:0];
}

- (void)writeDirtyMessages
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to write all dirty messages", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKMessageSyncController sharedInstance]( &OBJC_CLASS___IMDCKMessageSyncController,  "sharedInstance"));
  [v4 syncMessagesWithSyncType:2 deviceConditionsToCheck:0 activity:0 completionBlock:0];
}

- (void)deleteMessagesZone
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to delete message zone", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKMessageSyncController sharedInstance]( &OBJC_CLASS___IMDCKMessageSyncController,  "sharedInstance"));
  [v4 deleteMessagesZone];
}

- (void)syncMessages
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Request to sync with messages zone", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKMessageSyncController sharedInstance]( &OBJC_CLASS___IMDCKMessageSyncController,  "sharedInstance"));
  [v4 syncMessagesWithSyncType:1 deviceConditionsToCheck:0 activity:0 completionBlock:0];
}

- (void)writeExitRecord
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Requesting to write Exit record for current date",  v6,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKExitManager sharedInstance](&OBJC_CLASS___IMDCKExitManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 writeExitRecordWithDate:v5 completion:&stru_1000656E8];
}

- (void)fetchExitRecord
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Requesting to fetch exit record", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKExitManager sharedInstance](&OBJC_CLASS___IMDCKExitManager, "sharedInstance"));
  [v4 exitRecordDateWithCompletion:&stru_100065728];
}

- (void)deleteExitRecord
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Requesting to delete exit record", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKExitManager sharedInstance](&OBJC_CLASS___IMDCKExitManager, "sharedInstance"));
  [v4 deleteExitRecordWithCompletion:&stru_100065748];
}

- (void)setCloudKitEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v4 setCloudKitEnabled:v3];
}

- (void)tryToDisableAllDevices
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v2 disableAllDevicesWithCompletion:&stru_100065788];
}

- (void)initiateSync:(id)a3 forceRunNow:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, _UNKNOWN **))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
  unsigned int v10 = [v9 isMessagesIniCloudVersion2];

  int v13 = IMOSLoggingEnabled(v11, v12);
  if (v10)
  {
    if (v13)
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory("IMDaemonCloudSyncRequestHandler");
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = @"NO";
        if (v6) {
          v16 = @"YES";
        }
        int v20 = 138412546;
        id v21 = v7;
        __int16 v22 = 2112;
        v23 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Trying to initiate sync for %@ forceRunNow %@",  (uint8_t *)&v20,  0x16u);
      }
    }

    +[IMDMessagesSyncCoordinator initiateSync:forceRunNow:reply:]( &OBJC_CLASS___IMDMessagesSyncCoordinator,  "initiateSync:forceRunNow:reply:",  v7,  v6,  v8);
  }

  else
  {
    if (v13)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory("IMDaemonCloudSyncRequestHandler");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "beginning initial sync", (uint8_t *)&v20, 2u);
      }
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
    [v19 beginInitialSyncWithActivity:0];

    if (v8) {
      v8[2](v8, 1LL, &off_1000675D8);
    }
  }
}

- (void)cancelSync:(id)a3
{
  BOOL v3 = (void (**)(id, uint64_t, id))a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMDaemonCloudSyncRequestHandler");
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Attempting to cancel sync", v9, 2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 syncState]);

  [v8 setSyncCancelled:1];
  v3[2](v3, 1, [v8 syncType]);
}

- (void)initiatePeriodicSync
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemonCloudSyncRequestHandler");
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "beginning periodic sync and setting priority ramp request default",  v5,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  [v4 beginPeriodicSyncWithChecks:2 priority:XPC_ACTIVITY_PRIORITY_UTILITY reason:@"SPI_initiated"];
}

- (void)startUserInitiatedSync
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemonCloudSyncRequestHandler");
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "beginning user initiated sync", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  [v4 beginUserInitiatedSync];
}

- (void)loadDirtyMessagesWithLimit:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
}

- (void)loadDeletedMessagesWithLimit:(int64_t)a3
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      int64_t v8 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "loadDeleted messages with limit %ld",  (uint8_t *)&v7,  0xCu);
    }
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
}

- (void)clearLocalCloudKitSyncState
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v2 clearLocalCloudKitSyncState:3];

  id v3 = (id)objc_claimAutoreleasedReturnValue( +[IMCoreAutomationNotifications sharedInstance]( &OBJC_CLASS___IMCoreAutomationNotifications,  "sharedInstance"));
  [v3 postCoreAutomationNotificationWithAction:@"clearLocalCloudKitSyncState"];
}

- (void)sendRestoreFailuresLogDumps
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  [v2 sendRestoreFailuresLogDumps];
}

- (void)clearDataFromCloudKit
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDRecordZoneManager sharedInstance](&OBJC_CLASS___IMDRecordZoneManager, "sharedInstance"));
  [v2 deleteAllZones];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKChatSyncController sharedInstance](&OBJC_CLASS___IMDCKChatSyncController, "sharedInstance"));
  [v3 deleteChatZone];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKMessageSyncController sharedInstance]( &OBJC_CLASS___IMDCKMessageSyncController,  "sharedInstance"));
  [v4 deleteMessagesZone];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKAttachmentSyncController sharedInstance]( &OBJC_CLASS___IMDCKAttachmentSyncController,  "sharedInstance"));
  [v5 deleteAttachmentZone];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKRecordSaltManager sharedInstance](&OBJC_CLASS___IMDCKRecordSaltManager, "sharedInstance"));
  [v6 deleteDeDupeRecordZone];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUpdateSyncController sharedInstance](&OBJC_CLASS___IMDCKUpdateSyncController, "sharedInstance"));
  [v7 deleteUpdateZone];

  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKRecoverableMessageSyncController sharedInstance]( &OBJC_CLASS___IMDCKRecoverableMessageSyncController,  "sharedInstance"));
  [v8 deleteRecoverableMessageZone];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  [v9 clearCKRelatedDefaults];

  id v10 = (id)objc_claimAutoreleasedReturnValue( +[IMCoreAutomationNotifications sharedInstance]( &OBJC_CLASS___IMCoreAutomationNotifications,  "sharedInstance"));
  [v10 postCoreAutomationNotificationWithAction:@"clearDataFromCloudKit"];
}

- (void)currentStorageOnDeviceWithReply:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001EEF8;
  block[3] = &unk_1000657B0;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

- (void)performAdditionalStorageRequiredCheck
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v2 estimateQuotaAvailability:&stru_1000657F0];
}

- (void)broadcastCloudKitState
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Requested to broadcast CloudKit state", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v4 broadcastCloudKitState];
}

- (void)broadcastCloudKitStateAfterFetchingAccountStatus
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Requested to broadcast CloudKit state after fetching account status",  v5,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v4 broadcastCloudKitStateAfterFetchingAccountStatus];
}

- (void)broadcastCloudKitStateAfterClearingErrors
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Requested to clear sync errors and broadcast CloudKit state",  v5,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v4 broadcastCloudKitStateAfterClearingErrors];
}

- (void)uploadDailyAnalyticstoCloudKit
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Requested to upload daily syncing analytics to CK",  buf,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  unsigned int v5 = [v4 logCloudKitAnalytics];

  int v8 = IMOSLoggingEnabled(v6, v7);
  if (v5)
  {
    if (!v8) {
      return;
    }
    uint64_t v9 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v15 = 0;
    uint64_t v11 = "Uploaded analytics to CK.";
    uint64_t v12 = (uint8_t *)&v15;
    goto LABEL_12;
  }

  if (!v8) {
    return;
  }
  uint64_t v13 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = 0;
    uint64_t v11 = "Did not upload analytics to CK.";
    uint64_t v12 = (uint8_t *)&v14;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
  }

- (void)clearAnalyticDefaultsAndLocalSyncState
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Requested to clear analytic defaults and local sync state",  v5,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  [v4 clearAnalyticDefaultsAndLocalSyncState];
}

- (void)printCachedRampState
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKRampManager sharedInstance](&OBJC_CLASS___IMDCKRampManager, "sharedInstance"));
  [v2 cachedRampState:&stru_100065830];
}

- (void)updateAttachmentFileSizes
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Calling to update attachment file sizes", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKCacheDeleteManager sharedInstance](&OBJC_CLASS___IMDCKCacheDeleteManager, "sharedInstance"));
  [v4 updateAttachmentFileSizesWithActivity:0];
}

- (void)fetchSyncStateStatistics
{
  uint64_t v2 = IMDMessageRecordCalculateLocalCloudKitStatistics(self, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDefaults sharedInstance](&OBJC_CLASS___IMDefaults, "sharedInstance"));
    [v4 setValue:v3 forDomain:IMCloudKitDefinesDomain forKey:IMDCKLocalDBStatsKey];

    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
    unsigned int v6 = [v5 isMessagesIniCloudVersion2];

    if (v6)
    {
      id v9 = [v3 mutableCopy];
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[IMDMessagesSyncCoordinator readServerCountsFromDefaults]( &OBJC_CLASS___IMDMessagesSyncCoordinator,  "readServerCountsFromDefaults"));
      uint64_t v11 = (void *)v10;
      if (v10)
      {
        uint64_t v42 = IMDMessageRecordCloudKitStatisticServerCountsKey;
        uint64_t v43 = v10;
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
        [v9 addEntriesFromDictionary:v12];
      }

      else
      {
        uint64_t v25 = IMLogHandleForCategory("IMDaemon_CloudKit");
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000425C4(v12, v26, v27, v28, v29, v30, v31, v32);
        }
      }

      if (IMOSLoggingEnabled(v33, v34))
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
          int v40 = 138412290;
          v41 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "Fetching sync stats: %@",  (uint8_t *)&v40,  0xCu);
        }
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 broadcasterForAllListeners]);
      [v39 didFetchSyncStateStats:v9];
    }

    else
    {
      if (IMOSLoggingEnabled(v7, v8))
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
        __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
          int v40 = 138412290;
          v41 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Fetching sync stats: %@",  (uint8_t *)&v40,  0xCu);
        }
      }

      id v9 = (id)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 broadcasterForAllListeners]);
      [v24 didFetchSyncStateStats:v3];
    }
  }

  else
  {
    uint64_t v13 = IMLogHandleForCategory("IMDaemon_CloudKit");
    id v9 = (id)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_100042590((os_log_s *)v9, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)writeCloudKitSyncCounts:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_100066EE8]);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "set sync counts: %@", (uint8_t *)&v9, 0xCu);
    }
  }

  _IMDMessageRecordSetCloudKitSyncCounts(v3);
}

- (void)reportMetricToCK:(id)a3 withDict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "post metric to analytic zone with opGroupName: %@, dict: %@",  (uint8_t *)&v11,  0x16u);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKExitManager sharedInstance](&OBJC_CLASS___IMDCKExitManager, "sharedInstance"));
  [v10 submitCloudKitAnalyticWithOperationGroupName:v5 analyticDictionary:v6];
}

- (void)fetchCloudKitSyncStateDebuggingInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 syncStateDebuggingInfo:v3]);

  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      __int16 v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "fetched cloudkit sync state debugging info: %@",  (uint8_t *)&v12,  0xCu);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 broadcasterForAllListeners]);
  [v11 didFetchCloudKitSyncDebuggingInfo:v5];
}

- (void)tryToAutoCollectLogsWithErrorString:(id)a3 sendLogsTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "tryToAutoCollectLogsWithErrorString called with error: %@ sendto:%@",  (uint8_t *)&v11,  0x16u);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v10 reportMOCDebuggingErrorWithString:v5 internalOnly:1 initialSync:0 sendToHandle:v6];
}

- (void)simulateCloudKitSyncWithSyncState:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "simulateCloudKitSyncWithSyncState called with sync state %@",  (uint8_t *)&v9,  0xCu);
    }
  }

  if (v3)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 broadcasterForCloudSyncListeners]);
    [v8 updateCloudKitStateWithDictionary:v3];
  }
}

- (void)metricAttachments:(int64_t)a3
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      int64_t v8 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Calling to metric attachments with bytes: %lld",  (uint8_t *)&v7,  0xCu);
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKCacheDeleteManager sharedInstance](&OBJC_CLASS___IMDCKCacheDeleteManager, "sharedInstance"));
  [v6 metricAttachmentsToPurge:a3 withActivity:0];
}

- (void)purgeAttachments:(int64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  unsigned __int8 v5 = [v4 cacheDeleteEnabled];

  int v8 = IMOSLoggingEnabled(v6, v7);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 134217984;
        int64_t v15 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Calling to purge attachments with bytes: %lld",  (uint8_t *)&v14,  0xCu);
      }
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKCacheDeleteManager sharedInstance](&OBJC_CLASS___IMDCKCacheDeleteManager, "sharedInstance"));
    [v11 purgeAttachments:a3];
    goto LABEL_13;
  }

  if (v8)
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory("Warning");
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Tried to purge attachments without proper default ---- please set them: defaults write com.apple.madrid EnableCa cheDelete -BOOL YES",  (uint8_t *)&v14,  2u);
    }
  }

  if (IMIsRunningInAutomation())
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMCoreAutomationNotifications sharedInstance]( &OBJC_CLASS___IMCoreAutomationNotifications,  "sharedInstance"));
    [v11 postCoreAutomationNotificationFinishedPurgingAttachments:0 withErrorString:@"EnableCacheDelete default not enabled"];
LABEL_13:
  }

- (void)fetchLatestSalt
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKRecordSaltManager sharedInstance](&OBJC_CLASS___IMDCKRecordSaltManager, "sharedInstance"));
  [v2 fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:0];
}

- (void)printCachedSalt
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKRecordSaltManager sharedInstance](&OBJC_CLASS___IMDCKRecordSaltManager, "sharedInstance"));
      unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cachedSalt]);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Current cached salt %@", (uint8_t *)&v6, 0xCu);
    }
  }

- (void)deleteSalt
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned __int8 v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Deleting salt locally and from cloudKit", v5, 2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKRecordSaltManager sharedInstance](&OBJC_CLASS___IMDCKRecordSaltManager, "sharedInstance"));
  [v4 deleteDeDupeRecordZone];
}

- (void)fetchLatestRampState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKRampManager sharedInstance](&OBJC_CLASS___IMDCKRampManager, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000203DC;
  v4[3] = &unk_100065858;
  v4[4] = self;
  [v3 fetchLatestRampStateFromCK:v4];
}

- (id)rampStateDictionaryFromPromoted:(BOOL)a3 featureHadServerError:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  uint64_t v6 = IMCloudKitRampStateFeaturePromoted;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v5,  v6,  v7,  IMCloudKitRampStateFetchHadServerError,  0LL));

  return v8;
}

- (void)syncDeletesToCloudKit
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned __int8 v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Request from client to sync deletes to cloudkit",  v5,  2u);
    }
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
  [v4 syncDeletesToCloudKitWithActivity:0 completion:&stru_100065878];
}

@end