@interface WLDMercuryPushHandler
+ (id)_addMercurySilentNotifOfferSource:(id)a3 badgeId:(id)a4;
+ (id)_getBadgeID:(id)a3;
- (AMSMetrics)metricsController;
- (BOOL)shouldHandleNotification:(id)a3;
- (int64_t)_getBadgeAlertType:(id)a3;
- (void)handleNotification:(id)a3 shouldBadge:(BOOL)a4;
- (void)setMetricsController:(id)a3;
@end

@implementation WLDMercuryPushHandler

- (BOOL)shouldHandleNotification:(id)a3
{
  return -[WLDMercuryPushHandler _getBadgeAlertType:](self, "_getBadgeAlertType:", a3) != 0;
}

- (void)handleNotification:(id)a3 shouldBadge:(BOOL)a4
{
  BOOL v4 = a4;
  id v22 = a3;
  int64_t v6 = -[WLDMercuryPushHandler _getBadgeAlertType:](self, "_getBadgeAlertType:", v22);
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "_getBadgeID:", v22);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)v9;
  v11 = (void *)WLKNotificationsBadgingIdentifierDefaultValue;
  if (v9) {
    v11 = (void *)v9;
  }
  id v12 = v11;

  switch(v6)
  {
    case 3LL:
      goto LABEL_9;
    case 2LL:
      if (+[WLKBadgingUtilities removeBadgeIdentifier:]( &OBJC_CLASS___WLKBadgingUtilities,  "removeBadgeIdentifier:",  v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[WLKBadgingUtilities currentBadgeNumber]( &OBJC_CLASS___WLKBadgingUtilities,  "currentBadgeNumber"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[WLKNotificationCenter defaultCenter](&OBJC_CLASS___WLKNotificationCenter, "defaultCenter"));
        [v21 setBadgeNumber:v15 withCompletionHandler:0];

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[WLKOfferManager defaultOfferManager](&OBJC_CLASS___WLKOfferManager, "defaultOfferManager"));
        [v16 removeOfferByBadgeId:v12 completionHandler:0];
        goto LABEL_12;
      }

      break;
    case 1LL:
      if (v4
        && +[WLKBadgingUtilities addBadgeIdentifier:]( &OBJC_CLASS___WLKBadgingUtilities,  "addBadgeIdentifier:",  v12))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[WLKBadgingUtilities currentBadgeNumber]( &OBJC_CLASS___WLKBadgingUtilities,  "currentBadgeNumber"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[WLKNotificationCenter defaultCenter](&OBJC_CLASS___WLKNotificationCenter, "defaultCenter"));
        [v14 setBadgeNumber:v13 withCompletionHandler:0];
      }

- (int64_t)_getBadgeAlertType:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "wlk_dictionaryForKey:", @"aps"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wlk_stringForKey:", @"payloadType"));
  if ([v4 isEqualToString:@"mercury:tvapp:BadgeAlertAdd"])
  {
    int64_t v5 = 1LL;
  }

  else if ([v4 isEqualToString:@"mercury:tvapp:BadgeAlertRemove"])
  {
    int64_t v5 = 2LL;
  }

  else if ([v4 isEqualToString:@"mercury:tvapp:BadgeAlertNoBadge"])
  {
    int64_t v5 = 3LL;
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

+ (id)_getBadgeID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "wlk_dictionaryForKey:", @"aps"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wlk_stringForKey:", WLKOfferManagerKeyBadgeId));

  return v4;
}

+ (id)_addMercurySilentNotifOfferSource:(id)a3 badgeId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v5 && [v5 count]) {
    -[NSMutableDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v5);
  }
  -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  @"MercurySilentNotification",  @"offerSource");
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v6, WLKOfferManagerKeyBadgeId);

  id v8 = -[NSMutableDictionary copy](v7, "copy");
  return v8;
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