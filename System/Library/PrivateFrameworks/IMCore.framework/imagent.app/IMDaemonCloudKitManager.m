@interface IMDaemonCloudKitManager
+ (IMDaemonCloudKitManager)sharedManager;
- (BOOL)_hasFinishedTelemetrySync;
- (int64_t)_attachmentFileSizeUpdateIntervalBagValue;
- (int64_t)_chatSyncingIntervalBagValue;
- (int64_t)_messageSyncingDelayBagValue;
- (int64_t)_messageSyncingIntervalBagValue;
- (int64_t)_metricsLoggingUpdateIntervalBagValue;
- (void)_registerForAttachmentFileSizeUpdate;
- (void)_registerForAutoLogDump;
- (void)_registerForBackupSyncing;
- (void)_registerForChatSyncing;
- (void)_registerForMessageSyncing;
- (void)_registerForMetricsLogging;
- (void)_registerForTelemetrySyncing;
- (void)fetchLatestSaltWithMessageContext:(id)a3;
- (void)registerForCloudKitSyncing;
- (void)uploadDailyAnalyticstoCloudKit;
@end

@implementation IMDaemonCloudKitManager

+ (IMDaemonCloudKitManager)sharedManager
{
  if (qword_100071080 != -1) {
    dispatch_once(&qword_100071080, &stru_1000659C0);
  }
  return (IMDaemonCloudKitManager *)(id)qword_100071088;
}

- (void)registerForCloudKitSyncing
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Registering for cloudKitSyncing", v6, 2u);
    }
  }

  -[IMDaemonCloudKitManager fetchLatestSaltWithMessageContext:](self, "fetchLatestSaltWithMessageContext:", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKRampManager sharedInstance](&OBJC_CLASS___IMDCKRampManager, "sharedInstance"));
  [v5 fetchLatestRampStateFromCK:0];

  -[IMDaemonCloudKitManager _registerForBackupSyncing](self, "_registerForBackupSyncing");
  -[IMDaemonCloudKitManager _registerForChatSyncing](self, "_registerForChatSyncing");
  -[IMDaemonCloudKitManager _registerForMessageSyncing](self, "_registerForMessageSyncing");
  -[IMDaemonCloudKitManager _registerForAttachmentFileSizeUpdate](self, "_registerForAttachmentFileSizeUpdate");
  -[IMDaemonCloudKitManager _registerForMetricsLogging](self, "_registerForMetricsLogging");
  -[IMDaemonCloudKitManager _registerForAutoLogDump](self, "_registerForAutoLogDump");
  if (!-[IMDaemonCloudKitManager _hasFinishedTelemetrySync](self, "_hasFinishedTelemetrySync")) {
    -[IMDaemonCloudKitManager _registerForTelemetrySyncing](self, "_registerForTelemetrySyncing");
  }
}

- (BOOL)_hasFinishedTelemetrySync
{
  uint64_t v2 = IMGetDomainIntForKey(IMCloudKitDefinesDomain, IMCloudKitTelemetrySyncVersion);
  return v2 >= (uint64_t)+[IMDMessagesSyncCoordinator currentTelemetryVersion]( &OBJC_CLASS___IMDMessagesSyncCoordinator,  "currentTelemetryVersion");
}

- (void)_registerForBackupSyncing
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "**** WE ARE NOT ON IOS, not registering for backup triggered syncing",  v4,  2u);
    }
  }

- (void)_registerForChatSyncing
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
  unsigned __int8 v4 = [v3 isMessagesIniCloudVersion2];

  if ((v4 & 1) == 0)
  {
    int64_t v5 = -[IMDaemonCloudKitManager _chatSyncingIntervalBagValue](self, "_chatSyncingIntervalBagValue");
    if (IMOSLoggingEnabled(v5, v6))
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "com.apple.messages.chatSyncing";
        __int16 v12 = 2048;
        int64_t v13 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Registering for chat syncing using identifier %s interval %lld",  buf,  0x16u);
      }
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100024E28;
    v9[3] = &unk_1000659E0;
    v9[4] = v5;
    IMRegisterSADAwareXPCActivity("com.apple.messages.chatSyncing", XPC_ACTIVITY_CHECK_IN, v9);
  }

- (void)_registerForMessageSyncing
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
  unsigned int v4 = [v3 isMessagesIniCloudVersion2];

  if (v4)
  {
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
    [v5 registerCloudSyncDependencies];

    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[IMDMessagesSyncCoordinator schedulePeriodicSyncWithDelegate:]( &OBJC_CLASS___IMDMessagesSyncCoordinator,  "schedulePeriodicSyncWithDelegate:",  0LL));
    v8 = (void *)v6;
    if (v6 && IMOSLoggingEnabled(v6, v7))
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315394;
        v22 = "-[IMDaemonCloudKitManager _registerForMessageSyncing]";
        __int16 v23 = 2112;
        int64_t v24 = (int64_t)v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s: Tried to schedule periodic sync but encountered error %@",  (uint8_t *)&v21,  0x16u);
      }
    }

- (void)_registerForTelemetrySyncing
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
  unsigned int v3 = [v2 isMessagesIniCloudVersion2];

  if (v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
    [v4 registerCloudSyncDependencies];

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[IMDMessagesSyncCoordinator scheduleTelemetrySyncWithDelegate:]( &OBJC_CLASS___IMDMessagesSyncCoordinator,  "scheduleTelemetrySyncWithDelegate:",  0LL));
    uint64_t v7 = (void *)v5;
    if (v5 && IMOSLoggingEnabled(v5, v6))
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315394;
        v11 = "-[IMDaemonCloudKitManager _registerForTelemetrySyncing]";
        __int16 v12 = 2112;
        uint64_t v13 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: Tried to schedule telemetry sync but encountered error %@",  (uint8_t *)&v10,  0x16u);
      }
    }
  }

- (void)_registerForAttachmentFileSizeUpdate
{
  int64_t v2 = -[IMDaemonCloudKitManager _attachmentFileSizeUpdateIntervalBagValue]( self,  "_attachmentFileSizeUpdateIntervalBagValue");
  if (IMOSLoggingEnabled(v2, v3))
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v8 = "com.apple.messages.attachmentFileSizeUpdate";
      __int16 v9 = 2048;
      int64_t v10 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Registering for filesize update using identifier %s interval %lld",  buf,  0x16u);
    }
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100025B78;
  v6[3] = &unk_1000659E0;
  v6[4] = v2;
  IMRegisterSADAwareXPCActivity("com.apple.messages.attachmentFileSizeUpdate", XPC_ACTIVITY_CHECK_IN, v6);
}

- (void)_registerForMetricsLogging
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = "com.apple.messages.ckMetricsLogging";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Registering for metrics logging using identifier %s",  buf,  0xCu);
    }
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100025F90;
  v5[3] = &unk_100065A08;
  v5[4] = self;
  v5[5] = -[IMDaemonCloudKitManager _metricsLoggingUpdateIntervalBagValue]( self,  "_metricsLoggingUpdateIntervalBagValue");
  IMRegisterSADAwareXPCActivity("com.apple.messages.ckMetricsLogging", XPC_ACTIVITY_CHECK_IN, v5);
}

- (void)_registerForAutoLogDump
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v3 = [v2 isInternalInstall];

  if (v3)
  {
    if (IMOSLoggingEnabled(v4, v5))
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315138;
        __int16 v9 = "com.apple.messages.ckLogDumping";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Registering for auto log dumping using identifier %s",  (uint8_t *)&v8,  0xCu);
      }
    }

    IMRegisterSADAwareXPCActivity("com.apple.messages.ckLogDumping", XPC_ACTIVITY_CHECK_IN, &stru_100065A48);
  }

- (void)fetchLatestSaltWithMessageContext:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKRecordSaltManager sharedInstance](&OBJC_CLASS___IMDCKRecordSaltManager, "sharedInstance", a3));
  [v3 fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:0];
}

- (void)uploadDailyAnalyticstoCloudKit
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
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
    uint64_t v9 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
    int64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v15 = 0;
    v11 = "Uploaded analytics to CK.";
    __int16 v12 = (uint8_t *)&v15;
    goto LABEL_12;
  }

  if (!v8) {
    return;
  }
  uint64_t v13 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
  int64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v14 = 0;
    v11 = "Did not upload analytics to CK.";
    __int16 v12 = (uint8_t *)&v14;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
  }

- (int64_t)_chatSyncingIntervalBagValue
{
  return IMBagIntValueWithDefault(14400LL, @"imessage-chat-sync-interval");
}

- (int64_t)_attachmentFileSizeUpdateIntervalBagValue
{
  return IMBagIntValueWithDefault(86400LL, @"imessage-attachment-filesize-update-interval");
}

- (int64_t)_metricsLoggingUpdateIntervalBagValue
{
  return IMBagIntValueWithDefault(86400LL, @"imessage-chat-sync-interval");
}

- (int64_t)_messageSyncingIntervalBagValue
{
  return IMBagIntValueWithDefault(XPC_ACTIVITY_INTERVAL_1_DAY, @"imessage-message-sync-interval");
}

- (int64_t)_messageSyncingDelayBagValue
{
  return IMBagIntValueWithDefault(XPC_ACTIVITY_INTERVAL_1_DAY, @"imessage-message-sync-delay");
}

@end