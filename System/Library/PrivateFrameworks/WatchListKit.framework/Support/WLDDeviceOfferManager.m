@interface WLDDeviceOfferManager
+ (BOOL)_hasProcessedDeviceOfferForCurrentUser:(id)a3;
+ (id)amsDeviceOffertoDictionary:(id)a3;
- (AMSMetrics)metricsController;
- (WLDDeviceOfferManager)init;
- (void)_reportAMSDeviceOfferMetrics;
- (void)processDeviceOffers;
@end

@implementation WLDDeviceOfferManager

- (WLDDeviceOfferManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WLDDeviceOfferManager;
  v2 = -[WLDDeviceOfferManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___AMSMetrics);
    uint64_t v4 = WLKTVAppBundleID(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag wlk_defaultBag](&OBJC_CLASS___AMSBag, "wlk_defaultBag"));
    v7 = -[AMSMetrics initWithContainerID:bag:](v3, "initWithContainerID:bag:", v5, v6);
    metricsController = v2->_metricsController;
    v2->_metricsController = v7;
  }

  return v2;
}

- (void)processDeviceOffers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceOffers](&OBJC_CLASS___AMSDevice, "deviceOffers"));

  uint64_t v5 = WLKSystemLogObject(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceOffers](&OBJC_CLASS___AMSDevice, "deviceOffers"));
      *(_DWORD *)buf = 134217984;
      id v53 = [v8 count];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDDeviceOfferManager - Found %lu offer(s) in [AMSDevice deviceOffers]",  buf,  0xCu);
    }
  }

  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDDeviceOfferManager - [AMSDevice deviceOffers] returns nil",  buf,  2u);
  }

  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceOffers](&OBJC_CLASS___AMSDevice, "deviceOffers"));
  id v10 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v10)
  {
    id v12 = v10;
    v45 = v9;
    v46 = 0LL;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___AMSDeviceOffer, v11);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 offerIdentifier]);
          if (v17)
          {
            v18 = (void *)v17;
            v19 = (void *)objc_claimAutoreleasedReturnValue([v15 offerIdentifier]);
            unsigned int v20 = [v19 isEqualToString:@"com.apple.TV"];

            if (v20)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue([v15 adamId]);
              v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v21));
              if ((objc_msgSend( (id)objc_opt_class(self, v23),  "_hasProcessedDeviceOfferForCurrentUser:",  v22) & 1) == 0)
              {
                v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                -[NSMutableDictionary setObject:forKey:]( v24,  "setObject:forKey:",  @"AMSDeviceOfferTypeTV",  @"offerSource");
                v25 = self;
                id v27 = objc_msgSend((id)objc_opt_class(self, v26), "amsDeviceOffertoDictionary:", v15);
                v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
                if (v28) {
                  -[NSMutableDictionary addEntriesFromDictionary:](v24, "addEntriesFromDictionary:", v28);
                }
                ++v46;
                v29 = (void *)objc_claimAutoreleasedReturnValue( +[WLKOfferManager defaultOfferManager]( &OBJC_CLASS___WLKOfferManager,  "defaultOfferManager"));
                [v29 saveOffer:v24 completionHandler:0];

                self = v25;
                v9 = v45;
              }
            }
          }
        }
      }

      id v12 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }

    while (v12);
  }

  else
  {
    v46 = 0LL;
  }

  uint64_t v31 = WLKSystemLogObject(v30);
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v53 = v46;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "WLDDeviceOfferManager - Found %lu TV offer(s)",  buf,  0xCu);
  }

  if (v46)
  {
    -[WLDDeviceOfferManager _reportAMSDeviceOfferMetrics](self, "_reportAMSDeviceOfferMetrics");
    id v33 = +[WLKBadgingUtilities addBadgeIdentifier:]( &OBJC_CLASS___WLKBadgingUtilities,  "addBadgeIdentifier:",  WLKNotificationsBadgingIdentifierDefaultValue);
    if ((_DWORD)v33)
    {
      uint64_t v34 = WLKSystemLogObject(v33);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "WLDDeviceOfferManager - [processDeviceOffers] badging TV App",  buf,  2u);
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[WLKBadgingUtilities currentBadgeNumber](&OBJC_CLASS___WLKBadgingUtilities, "currentBadgeNumber"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[WLKNotificationCenter defaultCenter](&OBJC_CLASS___WLKNotificationCenter, "defaultCenter"));
      [v37 setBadgeNumber:v36 withCompletionHandler:0];
    }
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "ams_activeiTunesAccount"));

  if (!v39)
  {
    uint64_t v41 = WLKSystemLogObject(v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "WLDDeviceOfferManager - Inactive iTunes account",  buf,  2u);
    }
  }

  uint64_t v43 = AMSDeviceOfferIdentifierTV;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag wlk_defaultBag](&OBJC_CLASS___AMSBag, "wlk_defaultBag"));
  +[AMSDevice removeDeviceOfferWithIdentifier:account:bag:logKey:]( &OBJC_CLASS___AMSDevice,  "removeDeviceOfferWithIdentifier:account:bag:logKey:",  v43,  v39,  v44,  @"WLDDeviceOfferManager");
}

+ (id)amsDeviceOffertoDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 adamId]);
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 description]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 isDowngrading]));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 isSubscribed]));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 serialNumbers]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v9));

  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 offerIdentifier]);
  id v12 = (char *)[v3 offerType];

  else {
    uint64_t v13 = *(&off_10003D9A0 + (void)(v12 - 1));
  }
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v4, @"adamId");
  if (v5) {
    v15 = v5;
  }
  else {
    v15 = &stru_10003F7E0;
  }
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, @"description");
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v6, @"downgrading");
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v7, @"subscribed");
  if (v10) {
    uint64_t v16 = v10;
  }
  else {
    uint64_t v16 = &__NSArray0__struct;
  }
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v16, @"serialNumbers");
  if (v11) {
    uint64_t v17 = v11;
  }
  else {
    uint64_t v17 = &stru_10003F7E0;
  }
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v17, @"offerIdentifer");
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, @"offerType");
  id v18 = -[NSMutableDictionary copy](v14, "copy");

  return v18;
}

- (void)_reportAMSDeviceOfferMetrics
{
  v8[0] = @"eventType";
  v8[1] = @"eventVersion";
  v9[0] = @"notificationRequest";
  v9[1] = &off_1000417D8;
  v8[2] = @"notificationType";
  v9[2] = @"AMSDeviceOffer";
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDDeviceOfferManager._reportAMSDeviceOfferMetrics");
  id v6 = [[AMSMetricsEvent alloc] initWithTopic:@"xp_amp_notifications"];
  [v6 addPropertiesWithDictionary:v3];
  -[NSMutableArray addObject:](v4, "addObject:", v6);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[WLDDeviceOfferManager metricsController](self, "metricsController"));
  +[WLDMetricsUtilities sendMetricsEvents:metricsController:]( &OBJC_CLASS___WLDMetricsUtilities,  "sendMetricsEvents:metricsController:",  v4,  v7);
}

+ (BOOL)_hasProcessedDeviceOfferForCurrentUser:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WLKSystemLogObject(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "WLDDeviceOfferManager - Received device offer [%@] to check",  (uint8_t *)&v23,  0xCu);
  }

  if ([v3 length])
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    BOOL v7 = -[NSUserDefaults initWithSuiteName:](v6, "initWithSuiteName:", WLKDefaultsDomain);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v7, "objectForKey:", @"PreviouslyBadgedTVOffers"));
    v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v10 = v9;
    if (v8)
    {
      id v11 = [v8 containsObject:v3];
      int v12 = (int)v11;
      uint64_t v13 = WLKSystemLogObject(v11);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v15)
        {
          int v23 = 138412290;
          id v24 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "WLDDeviceOfferManager - Device TV offer [%@] has already been processed for current user",  (uint8_t *)&v23,  0xCu);
        }

        BOOL v16 = 1;
LABEL_24:

        goto LABEL_25;
      }

      if (v15)
      {
        int v23 = 138412290;
        id v24 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "WLDDeviceOfferManager - New device TV offer [%@] for current user",  (uint8_t *)&v23,  0xCu);
      }

      -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v8);
    }

    else
    {
      uint64_t v17 = WLKSystemLogObject(v9);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "WLDDeviceOfferManager - New device TV offer for current user",  (uint8_t *)&v23,  2u);
      }
    }

    -[NSMutableArray addObject:](v10, "addObject:", v3);
    id v19 = -[NSMutableArray count](v10, "count");
    if (v10)
    {
      -[NSUserDefaults setObject:forKey:](v7, "setObject:forKey:", v10, @"PreviouslyBadgedTVOffers");
    }

    else
    {
      uint64_t v20 = WLKSystemLogObject(v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[WLDDeviceOfferManager _hasProcessedDeviceOfferForCurrentUser:].cold.1((uint64_t)v3, v21);
      }
    }

    BOOL v16 = 0;
    goto LABEL_24;
  }

  BOOL v16 = 0;
LABEL_25:

  return v16;
}

- (AMSMetrics)metricsController
{
  return self->_metricsController;
}

- (void).cxx_destruct
{
}

+ (void)_hasProcessedDeviceOfferForCurrentUser:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "WLDDeviceOfferManager - Failed to save device TV offer [%@]",  (uint8_t *)&v2,  0xCu);
}

@end