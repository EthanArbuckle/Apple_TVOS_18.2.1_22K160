@interface WLDUTSPushHandler
- (AMSMetrics)metricsController;
- (BOOL)shouldHandleNotification:(id)a3;
- (id)_debugDescriptionForNotificationType:(int64_t)a3;
- (void)_handlePayload:(id)a3 forNotificationType:(int64_t)a4;
- (void)_handlePayloadExpiredForNotificationType:(int64_t)a3;
- (void)_handlePayloadInvalidatedForNotificationType:(int64_t)a3;
- (void)_reportMetrics:(id)a3;
- (void)handleNotification:(id)a3;
- (void)setMetricsController:(id)a3;
@end

@implementation WLDUTSPushHandler

- (BOOL)shouldHandleNotification:(id)a3
{
  id v3 = a3;
  if ((char *)+[WLDPushParsing actionTypeForNotification:]( &OBJC_CLASS___WLDPushParsing,  "actionTypeForNotification:",  v3)
     - 34 > (char *)3)
  {
    BOOL v6 = 0;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wlk_dictionaryForKey:", @"payload"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wlk_stringForKey:", @"type"));
    BOOL v6 = ([v5 isEqualToString:@"upNextChanges"] & 1) != 0
      || ([v5 isEqualToString:@"favoriteTeamsChanges"] & 1) != 0
      || ([v5 isEqualToString:@"favoritesSyncSettings"] & 1) != 0
      || [v5 isEqualToString:@"favoriteLeaguesChanges"];
  }

  return v6;
}

- (void)handleNotification:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[WLDPushParsing actionTypeForNotification:](&OBJC_CLASS___WLDPushParsing, "actionTypeForNotification:", v4);
  uint64_t v6 = WLKPushNotificationsLogObject(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[WLDUTSPushHandler _debugDescriptionForNotificationType:]( self,  "_debugDescriptionForNotificationType:",  v5));
    int v22 = 138412290;
    v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "WLDUTSPushHandler - Handling %@ notification",  (uint8_t *)&v22,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wlk_dictionaryForKey:", @"payload"));
  if (v9)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "wlk_dateFromMillisecondsSince1970ForKey:", @"expiresAt"));
    unsigned int v12 = objc_msgSend(v9, "wlk_BOOLForKey:defaultValue:", @"invalidate", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v14 = [v13 compare:v11];

    if (v14 == (id)1)
    {
      uint64_t v16 = WLKPushNotificationsLogObject(v15);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        v23 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "WLDUTSPushHandler - Payload is expired %@, ignoring and invalidating",  (uint8_t *)&v22,  0xCu);
      }

      -[WLDUTSPushHandler _handlePayloadExpiredForNotificationType:]( self,  "_handlePayloadExpiredForNotificationType:",  v5);
    }

    else if (v12)
    {
      uint64_t v19 = WLKPushNotificationsLogObject(v15);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "WLDUTSPushHandler - Payload indicates invalidation",  (uint8_t *)&v22,  2u);
      }

      -[WLDUTSPushHandler _handlePayloadInvalidatedForNotificationType:]( self,  "_handlePayloadInvalidatedForNotificationType:",  v5);
    }

    else
    {
      -[WLDUTSPushHandler _handlePayload:forNotificationType:](self, "_handlePayload:forNotificationType:", v9, v5);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "wlk_dictionaryForKey:", @"metrics"));
    if (v21) {
      -[WLDUTSPushHandler _reportMetrics:](self, "_reportMetrics:", v21);
    }
  }

  else
  {
    uint64_t v18 = WLKPushNotificationsLogObject(v10);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "WLDUTSPushHandler - No payload.",  (uint8_t *)&v22,  2u);
    }
  }
}

- (id)_debugDescriptionForNotificationType:(int64_t)a3
{
  else {
    return off_10003D190[a3 - 34];
  }
}

- (void)_handlePayloadExpiredForNotificationType:(int64_t)a3
{
  switch(a3)
  {
    case '""':
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[WLKUpNextDeltaStore sharedInstance](&OBJC_CLASS___WLKUpNextDeltaStore, "sharedInstance"));
      [v6 delete:&__block_literal_global_3];

      return;
    case '#':
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSportsFavoriteManager defaultManager]( &OBJC_CLASS___WLKSportsFavoriteManager,  "defaultManager"));
      [v3 handleRefreshCacheNotification];

      goto LABEL_4;
    case '$':
      int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSportsFavoriteManager defaultManager]( &OBJC_CLASS___WLKSportsFavoriteManager,  "defaultManager"));
      [v5 handleSyncSettingChangedNotification];

      uint64_t v4 = 0LL;
      goto LABEL_6;
    case '%':
LABEL_4:
      uint64_t v4 = 1LL;
LABEL_6:
      +[SportsFavoriteServiceObjC markCacheTopicDirty:]( &OBJC_CLASS___SportsFavoriteServiceObjC,  "markCacheTopicDirty:",  v4);
      break;
    default:
      return;
  }

void __62__WLDUTSPushHandler__handlePayloadExpiredForNotificationType___block_invoke( id a1,  BOOL a2,  NSError *a3)
{
}

- (void)_handlePayloadInvalidatedForNotificationType:(int64_t)a3
{
  switch(a3)
  {
    case '""':
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[WLKUpNextDeltaStore sharedInstance](&OBJC_CLASS___WLKUpNextDeltaStore, "sharedInstance"));
      [v6 delete:&__block_literal_global_31_0];

      return;
    case '#':
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSportsFavoriteManager defaultManager]( &OBJC_CLASS___WLKSportsFavoriteManager,  "defaultManager"));
      [v3 handleRefreshCacheNotification];

      goto LABEL_4;
    case '$':
      int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSportsFavoriteManager defaultManager]( &OBJC_CLASS___WLKSportsFavoriteManager,  "defaultManager"));
      [v5 handleSyncSettingChangedNotification];

      uint64_t v4 = 0LL;
      goto LABEL_6;
    case '%':
LABEL_4:
      uint64_t v4 = 1LL;
LABEL_6:
      +[SportsFavoriteServiceObjC markCacheTopicDirty:]( &OBJC_CLASS___SportsFavoriteServiceObjC,  "markCacheTopicDirty:",  v4);
      break;
    default:
      return;
  }

void __66__WLDUTSPushHandler__handlePayloadInvalidatedForNotificationType___block_invoke( id a1,  BOOL a2,  NSError *a3)
{
}

- (void)_handlePayload:(id)a3 forNotificationType:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case '""':
      id v6 = [[WLKUpNextDelta alloc] initWithDictionary:v5];
      v7 = v6;
      if (v6)
      {
        uint64_t v8 = WLKPushNotificationsLogObject(v6);
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
          int v15 = 134217984;
          id v16 = [v10 count];
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "WLDUTSPushHandler - Processed Up Next delta with %lu items",  (uint8_t *)&v15,  0xCu);
        }

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[WLKUpNextDeltaStore sharedInstance](&OBJC_CLASS___WLKUpNextDeltaStore, "sharedInstance"));
        [v11 merge:v7 completion:&__block_literal_global_33];
      }

      break;
    case '#':
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSportsFavoriteManager defaultManager]( &OBJC_CLASS___WLKSportsFavoriteManager,  "defaultManager"));
      [v12 handleRefreshCacheNotification];

      goto LABEL_8;
    case '$':
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSportsFavoriteManager defaultManager]( &OBJC_CLASS___WLKSportsFavoriteManager,  "defaultManager"));
      [v14 handleSyncSettingChangedNotification];

      uint64_t v13 = 0LL;
      goto LABEL_10;
    case '%':
LABEL_8:
      uint64_t v13 = 1LL;
LABEL_10:
      +[SportsFavoriteServiceObjC markCacheTopicDirty:]( &OBJC_CLASS___SportsFavoriteServiceObjC,  "markCacheTopicDirty:",  v13);
      break;
    default:
      break;
  }
}

void __56__WLDUTSPushHandler__handlePayload_forNotificationType___block_invoke(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  uint64_t v5 = WLKPushNotificationsLogObject(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDUTSPushHandler - Successfully saved Up Next delta, requesting reload",  (uint8_t *)&v8,  2u);
    }

    +[WLKUpNextWidgetCacheManager requestReload](&OBJC_CLASS___WLKUpNextWidgetCacheManager, "requestReload");
  }

  else
  {
    if (v7)
    {
      int v8 = 138412290;
      v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDUTSPushHandler - Failed to save Up Next delta: %@",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)_reportMetrics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WLKPushNotificationsLogObject(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WLDUTSPushHandler - Reporting metrics", v11, 2u);
  }

  id v7 = [[AMSMetricsEvent alloc] initWithTopic:@"xp_amp_notifications"];
  int v8 = v7;
  if (v7)
  {
    [v7 addPropertiesWithDictionary:v4];
    unsigned int v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WLDUTSPushHandler metricsController](self, "metricsController"));
    +[WLDMetricsUtilities sendMetricsEvents:metricsController:]( &OBJC_CLASS___WLDMetricsUtilities,  "sendMetricsEvents:metricsController:",  v9,  v10);
  }
}

- (AMSMetrics)metricsController
{
  return self->_metricsController;
}

- (void)setMetricsController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end