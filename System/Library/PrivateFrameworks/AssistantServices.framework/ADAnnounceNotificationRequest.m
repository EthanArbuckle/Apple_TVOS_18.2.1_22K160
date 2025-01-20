@interface ADAnnounceNotificationRequest
- (ADAnnounceNotificationRequest)initWithNotification:(id)a3 appID:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6 summary:(id)a7 completion:(id)a8;
- (AFSiriUserNotificationSummary)summary;
- (BOOL)_supportsBargeInForAnnounceNotificationType:(int64_t)a3;
- (BOOL)supportsImmediateBurstMode;
- (NSString)appID;
- (UNNotification)notification;
- (int64_t)_announceNotificationRequestTypeForNotification:(id)a3 appID:(id)a4 platform:(int64_t)a5;
- (int64_t)announcementType;
- (int64_t)summaryDecision;
- (void)setAnnouncementType:(int64_t)a3;
- (void)setAppID:(id)a3;
- (void)setNotification:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryDecision:(int64_t)a3;
@end

@implementation ADAnnounceNotificationRequest

- (ADAnnounceNotificationRequest)initWithNotification:(id)a3 appID:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6 summary:(id)a7 completion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ADAnnounceNotificationRequest;
  v18 = -[ADAnnouncementRequest initWithAnnouncementRequestType:platform:completion:]( &v23,  "initWithAnnouncementRequestType:platform:completion:",  1LL,  a5,  a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_notification, a3);
    v20 = (NSString *)[v16 copy];
    appID = v19->_appID;
    v19->_appID = v20;

    v19->_announcementType = -[ADAnnounceNotificationRequest _announceNotificationRequestTypeForNotification:appID:platform:]( v19,  "_announceNotificationRequestTypeForNotification:appID:platform:",  v15,  v16,  a5);
    objc_storeStrong((id *)&v19->_summary, a7);
    v19->_summaryDecision = a6;
    -[ADAnnouncementRequest setRequiresOpportuneTime:](v19, "setRequiresOpportuneTime:", a5 == 1);
    if (a5 == 1) {
      -[ADAnnouncementRequest setRequestSupportsBargeIn:]( v19,  "setRequestSupportsBargeIn:",  -[ADAnnounceNotificationRequest _supportsBargeInForAnnounceNotificationType:]( v19,  "_supportsBargeInForAnnounceNotificationType:",  v19->_announcementType));
    }
  }

  return v19;
}

- (int64_t)_announceNotificationRequestTypeForNotification:(id)a3 appID:(id)a4 platform:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 request]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 content]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 intentIdentifiers]);
  int64_t v13 = +[AFSiriAnnouncementRequestCapabilityManager notificationAnnouncementTypeForNotificationFromApp:withIntentIDs:notificationContent:onPlatform:]( &OBJC_CLASS___AFSiriAnnouncementRequestCapabilityManager,  "notificationAnnouncementTypeForNotificationFromApp:withIntentIDs:notificationContent:onPlatform:",  v8,  v12,  v11,  a5);

  if (a5 != 2
    && v13 != 3
    && !-[NSString hasPrefix:](self->_appID, "hasPrefix:", @"com.apple")
    && (sub_1001EC160((uint64_t)v8) & 1) == 0)
  {
    v14 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      id v17 = "-[ADAnnounceNotificationRequest _announceNotificationRequestTypeForNotification:appID:platform:]";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Siri TCC not enabled for app: %@ using generic notification announcement",  (uint8_t *)&v16,  0x16u);
    }

    int64_t v13 = 3LL;
  }

  return v13;
}

- (BOOL)_supportsBargeInForAnnounceNotificationType:(int64_t)a3
{
  return ((unint64_t)a3 > 9) | (0x17Eu >> a3) & 1;
}

- (BOOL)supportsImmediateBurstMode
{
  if ((id)-[ADAnnouncementRequest platform](self, "platform") == (id)2) {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnnounceNotificationRequest summary](self, "summary"));

  if (v3) {
    return 0;
  }
  if ((+[AFFeatureFlags isAnnouncePolicyEnhancementsEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isAnnouncePolicyEnhancementsEnabled") & 1) != 0)
  {
    unint64_t v5 = -[ADAnnounceNotificationRequest announcementType](self, "announcementType");
    if (v5 <= 9) {
      return (0x3Au >> v5) & 1;
    }
    else {
      return 1;
    }
  }

  else
  {
    v6 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v7 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v7)
    {
      int v8 = 136315138;
      id v9 = "-[ADAnnounceNotificationRequest supportsImmediateBurstMode]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s isAnnouncePolicyEnhancementsEnabled is disabled, no immediateBurstMode",  (uint8_t *)&v8,  0xCu);
      return 0;
    }
  }

  return result;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (int64_t)announcementType
{
  return self->_announcementType;
}

- (void)setAnnouncementType:(int64_t)a3
{
  self->_announcementType = a3;
}

- (AFSiriUserNotificationSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (int64_t)summaryDecision
{
  return self->_summaryDecision;
}

- (void)setSummaryDecision:(int64_t)a3
{
  self->_summaryDecision = a3;
}

- (void).cxx_destruct
{
}

@end