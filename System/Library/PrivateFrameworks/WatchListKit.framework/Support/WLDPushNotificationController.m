@interface WLDPushNotificationController
- (AMSMetrics)metricsController;
- (BOOL)pushPaylod:(id)a3 shouldUpdateBadgeForBundleIdentifier:(id)a4 badgeIdentifier:(id)a5 enabled:(BOOL)a6;
- (WLDPushNotificationController)init;
- (id)_portNameForEnvironmentName:(id)a3;
- (void)_augmentCustomEventInfo:(id)a3;
- (void)_loadURLBagWithCompletionHandler:(id)a3;
- (void)_postNotificationToUser:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6;
- (void)_postNotificationWithPayload:(id)a3;
- (void)_registerOpportunisticTopics;
- (void)_reportBulletinMetrics:(id)a3;
- (void)_reportMercuryMetrics:(id)a3;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)handleAction:(id)a3;
@end

@implementation WLDPushNotificationController

- (WLDPushNotificationController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WLDPushNotificationController;
  v2 = -[WLDPushNotificationController init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingOpportunisticTopics = v2->_pendingOpportunisticTopics;
    v2->_pendingOpportunisticTopics = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___WLKNotificationCenter);
    notifCenter = v2->_notifCenter;
    v2->_notifCenter = v5;

    -[WLKNotificationCenter setDelegate:](v2->_notifCenter, "setDelegate:", v2);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __37__WLDPushNotificationController_init__block_invoke;
    v8[3] = &unk_10003D480;
    v9 = v2;
    -[WLDPushNotificationController _loadURLBagWithCompletionHandler:](v9, "_loadURLBagWithCompletionHandler:", v8);
  }

  return v2;
}

void __37__WLDPushNotificationController_init__block_invoke(uint64_t a1)
{
  id v2 = WLDDispatchQueue();
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = WLKPushNotificationsLogObject(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(*(void *)(a1 + 32) + 16LL);
    *(_DWORD *)buf = 138412290;
    v50 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Push environment: %@",  buf,  0xCu);
  }

  v8 = objc_alloc(&OBJC_CLASS___APSConnection);
  v9 = *(void **)(a1 + 32);
  uint64_t v10 = v9[2];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 _portNameForEnvironmentName:v10]);
  id v12 = WLDDispatchQueue();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v8,  "initWithEnvironmentName:namedDelegatePort:queue:",  v10,  v11,  v13);
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 8);
  *(void *)(v15 + 8) = v14;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
  v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) publicToken]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 base64EncodedStringWithOptions:0]);

  id v19 = [v18 length];
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
    [v20 setPushToken:v18];
  }

  uint64_t v21 = WLKPushNotificationsLogObject(v19);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ams_activeiTunesAccount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ams_DSID"));
    uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 8LL);
    *(_DWORD *)buf = 138412802;
    v50 = v18;
    __int16 v51 = 2112;
    v52 = v25;
    __int16 v53 = 2112;
    uint64_t v54 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Push token: %@, DSID: %@, connection: %@",  buf,  0x20u);
  }

  v48[0] = @"com.apple.watchList";
  v48[1] = @"com.apple.tv.favoriteTeams";
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));
  [*(id *)(*(void *)(a1 + 32) + 8) _setEnabledTopics:v27];
  if ([*(id *)(*(void *)(a1 + 32) + 32) count]) {
    [*(id *)(a1 + 32) _registerOpportunisticTopics];
  }
  v28 = objc_alloc(&OBJC_CLASS___AMSMetrics);
  uint64_t v29 = WLKTVAppBundleID();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag wlk_defaultBag](&OBJC_CLASS___AMSBag, "wlk_defaultBag"));
  v32 = -[AMSMetrics initWithContainerID:bag:](v28, "initWithContainerID:bag:", v30, v31);
  uint64_t v33 = *(void *)(a1 + 32);
  v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = v32;

  id v35 = [[AMSPushConfiguration alloc] initWithEnabledActionTypes:0];
  [v35 setUserNotificationExtensionId:@"com.apple.tv-default"];
  v36 = objc_alloc(&OBJC_CLASS___AMSPushHandler);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag wlk_defaultBag](&OBJC_CLASS___AMSBag, "wlk_defaultBag"));
  v38 = -[AMSPushHandler initWithConfiguration:bag:](v36, "initWithConfiguration:bag:", v35, v37);
  uint64_t v39 = *(void *)(a1 + 32);
  v40 = *(void **)(v39 + 64);
  *(void *)(v39 + 64) = v38;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
  v41 = objc_alloc_init(&OBJC_CLASS___WLDMercuryPushHandler);
  uint64_t v42 = *(void *)(a1 + 32);
  v43 = *(void **)(v42 + 72);
  *(void *)(v42 + 72) = v41;

  v44 = objc_alloc_init(&OBJC_CLASS___WLDUTSPushHandler);
  uint64_t v45 = *(void *)(a1 + 32);
  v46 = *(void **)(v45 + 56);
  *(void *)(v45 + 56) = v44;

  [*(id *)(*(void *)(a1 + 32) + 56) setMetricsController:*(void *)(*(void *)(a1 + 32) + 40)];
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[WLKBadgingUtilities sharedUtilities](&OBJC_CLASS___WLKBadgingUtilities, "sharedUtilities"));
  [v47 migrateToNewBadgingSystemIfNeeded];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WLDPushNotificationController;
  -[WLDPushNotificationController dealloc](&v3, "dealloc");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  uint64_t v6 = WLKPushNotificationsLogObject(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - didReceivePublicToken: %@",  (uint8_t *)&v11,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection publicToken](self->_connection, "publicToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 base64EncodedStringWithOptions:0]);

  if ([v9 length])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
    [v10 setPushToken:v9];
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  v62 = __Block_byref_object_copy__2;
  v63 = __Block_byref_object_dispose__2;
  v64 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPushNotificationController.didReceiveMessageForTopic");
  uint64_t v11 = WLKPushNotificationsLogObject(v64);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v66 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Received push notification: %@",  buf,  0xCu);
  }

  if (![v9 isEqualToString:@"com.apple.watchList"])
  {
    if ([v9 isEqualToString:@"com.apple.tv.upnext"])
    {
      BOOL v27 = -[WLDUTSPushHandler shouldHandleNotification:](self->_utsPushHandler, "shouldHandleNotification:", v10);
      if (!v27)
      {
        uint64_t v39 = WLKPushNotificationsLogObject(v27);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v66 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Notification is unhandled: %@",  buf,  0xCu);
        }

        goto LABEL_52;
      }
    }

    else
    {
      id v28 = [v9 isEqualToString:@"com.apple.tv.favoriteTeams"];
      if (!(_DWORD)v28)
      {
        uint64_t v41 = WLKPushNotificationsLogObject(v28);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v66 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Ignoring unknown topic: %@",  buf,  0xCu);
        }

        goto LABEL_52;
      }

      BOOL v29 = -[WLDUTSPushHandler shouldHandleNotification:](self->_utsPushHandler, "shouldHandleNotification:", v10);
      if (!v29)
      {
        uint64_t v49 = WLKPushNotificationsLogObject(v29);
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v66 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Notification is unhandled: %@",  buf,  0xCu);
        }

        goto LABEL_52;
      }
    }

    -[WLDUTSPushHandler handleNotification:](self->_utsPushHandler, "handleNotification:", v10);
LABEL_53:
    v18 = (void *)v60[5];
    v60[5] = 0LL;
    goto LABEL_54;
  }

  int64_t v13 = +[WLDPushParsing actionTypeForNotification:](&OBJC_CLASS___WLDPushParsing, "actionTypeForNotification:", v10);
  int64_t v14 = v13;
  if (v13 != 31 && v13 != 21)
  {
    id v30 = -[AMSPushHandler shouldHandleNotification:](self->_amsPushHandler, "shouldHandleNotification:", v10);
    if (!(_DWORD)v30)
    {
      BOOL v42 = -[WLDMercuryPushHandler shouldHandleNotification:]( self->_mercuryPushHandler,  "shouldHandleNotification:",  v10);
      if (v42)
      {
        uint64_t v43 = WLKPushNotificationsLogObject(v42);
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v66 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Handling mercury notification: %@",  buf,  0xCu);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_dictionaryForKey:", @"aps"));
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "wlk_dictionaryForKey:", @"payload"));
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKey:@"metrics"]);
        if (v46) {
          -[WLDPushNotificationController _reportMercuryMetrics:](self, "_reportMercuryMetrics:", v46);
        }
        if ((-[WLKNotificationCenter isCategoryEnabledByUser:]( self->_notifCenter,  "isCategoryEnabledByUser:",  1LL) & 1) != 0 || (id v47 = -[WLKNotificationCenter isCategoryEnabledByUser:]( self->_notifCenter,  "isCategoryEnabledByUser:",  2LL),  (v47 & 1) != 0))
        {
          uint64_t v48 = 1LL;
        }

        else
        {
          uint64_t v54 = WLKPushNotificationsLogObject(v47);
          v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - User has disabled Marketing notifs. Skip badging.",  buf,  2u);
          }

          uint64_t v48 = 0LL;
        }

        -[WLDMercuryPushHandler handleNotification:shouldBadge:]( self->_mercuryPushHandler,  "handleNotification:shouldBadge:",  v10,  v48);
        v56 = (void *)v60[5];
        v60[5] = 0LL;
      }

      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_dictionaryForKey:", @"payload"));
        -[WLDPushNotificationController _postNotificationWithPayload:](self, "_postNotificationWithPayload:", v18);
        v52 = (void *)v60[5];
        v60[5] = 0LL;
      }

      goto LABEL_54;
    }

    uint64_t v31 = WLKPushNotificationsLogObject(v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v66 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - AMS wants to handle notification: %@",  buf,  0xCu);
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"aps"]);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"_ss"]);
    BOOL v35 = v34 == 0LL;

    if (!v35)
    {
      -[AMSPushHandler handleNotification:](self->_amsPushHandler, "handleNotification:", v10);
      goto LABEL_53;
    }

    uint64_t v53 = WLKPushNotificationsLogObject(v36);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[WLDPushNotificationController connection:didReceiveMessageForTopic:userInfo:].cold.1(v40);
    }
LABEL_52:

    goto LABEL_53;
  }

  uint64_t v15 = WLKPushNotificationsLogObject(v13);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14));
    *(_DWORD *)buf = 138412290;
    id v66 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Received sync request of type: %@",  buf,  0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[WLDPushParsing accountIdentifierForNotification:]( &OBJC_CLASS___WLDPushParsing,  "accountIdentifierForNotification:",  v10));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ams_activeiTunesAccount"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ams_DSID"));
  unsigned int v22 = [v18 isEqual:v21];

  if (!v22)
  {
    uint64_t v37 = WLKPushNotificationsLogObject(v23);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - accountIdentifer missing or mismatched",  buf,  2u);
    }

    uint64_t v26 = (void *)v60[5];
    v60[5] = 0LL;
    goto LABEL_48;
  }

  if (v14 == 31)
  {
    uint64_t v50 = WLKPushNotificationsLogObject(v23);
    __int16 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Processing subscriptions sync request",  buf,  2u);
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[WLDSubscriptionStore sharedInstance](&OBJC_CLASS___WLDSubscriptionStore, "sharedInstance"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke_35;
    v57[3] = &unk_10003CCD8;
    v57[4] = &v59;
    [v26 fetchSubscriptionData:1 callerProcessID:getpid() completion:v57];
    goto LABEL_48;
  }

  if (v14 == 21)
  {
    uint64_t v24 = WLKPushNotificationsLogObject(v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Processing settings sync request",  buf,  2u);
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke;
    v58[3] = &unk_10003CAA0;
    v58[4] = &v59;
    [v26 synchronize:1 completion:v58];
LABEL_48:
  }

void __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke( uint64_t a1,  int a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString description](v5, "description"));
    v7 = v5;
  }

  else
  {
    v7 = &stru_10003F7E0;
  }

  uint64_t v8 = WLKPushNotificationsLogObject(v5);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (a2) {
      id v10 = @"YES";
    }
    int v13 = 138412546;
    int64_t v14 = v10;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Completed WLK settings sync with success:%@ %@",  (uint8_t *)&v13,  0x16u);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0LL;
}

void __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke_35( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  v7 = v6;
  if (v6)
  {
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString description](v6, "description"));
    uint64_t v8 = v6;
  }

  else
  {
    uint64_t v8 = &stru_10003F7E0;
  }

  uint64_t v9 = WLKPushNotificationsLogObject(v6);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"YES";
    if (!v5) {
      uint64_t v11 = @"NO";
    }
    int v14 = 138412546;
    __int16 v15 = v11;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Completed WLK subscription sync with success:%@ %@",  (uint8_t *)&v14,  0x16u);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0LL;
}

- (void)handleAction:(id)a3
{
  id v4 = a3;
  id v5 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPushNotificationController.handleAction");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:WLKNotificationsOnActionKeyReason]);
  uint64_t v7 = WLKNotificationsOnActionKeyReasonActivation;
  id v8 = [v6 isEqual:WLKNotificationsOnActionKeyReasonActivation];
  if ((_DWORD)v8)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 objectForKey:WLKNotificationsKeyActionURL]);
    uint64_t v10 = WLKPushNotificationsLogObject(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Might deactivate screen saver.",  buf,  2u);
      }

      uint64_t v24 = self;

      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
      int v13 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s systemServiceProxy](v11, "systemServiceProxy"));
      uint64_t v14 = WLKPushNotificationsLogObject([v13 deactivateScreenSaver]);
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v27 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Will open URL: %@",  buf,  0xCu);
      }

      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
      id v25 = 0LL;
      unsigned __int8 v17 = [v16 openURL:v9 withOptions:&__NSDictionary0__struct error:&v25];
      v18 = (os_log_s *)v25;

      if ((v17 & 1) == 0)
      {
        uint64_t v20 = WLKPushNotificationsLogObject(v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          BOOL v27 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Error opening URL: %@",  buf,  0xCu);
        }
      }

      self = v24;
    }

    else if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - No URL to open.",  buf,  2u);
    }
  }

  else
  {
    uint64_t v22 = WLKPushNotificationsLogObject(v8);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Notification was *not* activated.",  buf,  2u);
    }
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:WLKNotificationsKeyActionMetrics]);
}

- (BOOL)pushPaylod:(id)a3 shouldUpdateBadgeForBundleIdentifier:(id)a4 badgeIdentifier:(id)a5 enabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v6)
  {
    if (+[WLKBadgingUtilities addBadgeIdentifier:]( &OBJC_CLASS___WLKBadgingUtilities,  "addBadgeIdentifier:",  v11))
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[WLKBadgingUtilities currentBadgeNumber](&OBJC_CLASS___WLKBadgingUtilities, "currentBadgeNumber"));
      uint64_t v13 = WLKPushNotificationsLogObject(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        uint64_t v20 = v12;
        __int16 v15 = "WLDPushNotificationController - AMSPushHandler badge -- new badging number:%@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, 0xCu);
        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if (+[WLKBadgingUtilities removeBadgeIdentifier:]( &OBJC_CLASS___WLKBadgingUtilities,  "removeBadgeIdentifier:",  v11))
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[WLKBadgingUtilities currentBadgeNumber](&OBJC_CLASS___WLKBadgingUtilities, "currentBadgeNumber"));
    uint64_t v16 = WLKPushNotificationsLogObject(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      uint64_t v20 = v12;
      __int16 v15 = "WLDPushNotificationController - AMSPushHandler unbadge -- new badging number:%@";
      goto LABEL_8;
    }

- (void)_registerOpportunisticTopics
{
  id v3 = WLDDispatchQueue();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection opportunisticTopics](self->_connection, "opportunisticTopics"));
  id v6 = [v5 containsObject:@"com.apple.tv.upnext"];
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = WLKPushNotificationsLogObject(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      BOOL v12 = @"com.apple.tv.upnext";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Registering opportunistic topic: %@",  (uint8_t *)&v11,  0xCu);
    }

    connection = self->_connection;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", @"com.apple.tv.upnext"));
    -[APSConnection _setOpportunisticTopics:](connection, "_setOpportunisticTopics:", v10);

    -[NSMutableArray removeObject:](self->_pendingOpportunisticTopics, "removeObject:", @"com.apple.tv.upnext");
  }
}

- (void)_augmentCustomEventInfo:(id)a3
{
  id v23 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 optedIn]));
  [v23 setObject:v4 forKey:@"gac"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 consentedBrands]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:@","]);
  [v23 setObject:v6 forKey:@"cbids"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 deniedBrands]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:@","]);
  [v23 setObject:v8 forKey:@"dbids"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAppLibrary defaultAppLibrary](&OBJC_CLASS___WLKAppLibrary, "defaultAppLibrary"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 installedAppBundleIdentifiers]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@","]);
  [v23 setObject:v11 forKey:@"ibids"];

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v9 subscribedAppBundleIdentifiers]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@","]);
  [v23 setObject:v13 forKey:@"sbids"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[WLKStoredConfigurationManager sharedInstance]( &OBJC_CLASS___WLKStoredConfigurationManager,  "sharedInstance"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 storedConfiguration]);

  id v16 = (id)objc_claimAutoreleasedReturnValue([v15 vppaState]);
  unsigned __int8 v17 = v16;
  if (v16) {
    id v16 = [v23 setObject:v16 forKey:@"vppaState"];
  }
  uint64_t v18 = WLKTVAppBundleID(v16);
  int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v23 setObject:v19 forKey:@"app"];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVAppBag app](&OBJC_CLASS___TVAppBag, "app"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 dictionaryForKey:kBagKeyMetrics]);

  if (v21)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 valueForKey:@"metricsBase"]);
    if (v22) {
      [v23 addEntriesFromDictionary:v22];
    }
  }
}

- (void)_reportBulletinMetrics:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v8 = v4;
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0 || ![v4 count])
    {
      id v10 = 0LL;
      goto LABEL_8;
    }

    id v21 = v4;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  }

  id v10 = v8;
LABEL_8:
  int v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  objc_initWeak(&location, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __56__WLDPushNotificationController__reportBulletinMetrics___block_invoke;
  v16[3] = &unk_10003D2C0;
  objc_copyWeak(&v19, &location);
  id v17 = v10;
  uint64_t v18 = v11;
  uint64_t v14 = v11;
  id v15 = v10;
  dispatch_async(v13, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __56__WLDPushNotificationController__reportBulletinMetrics___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v17 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPushNotificationController._reportBulletinMetrics");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v20 = a1;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v19 = *(void *)v23;
    do
    {
      id v4 = 0LL;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v4);
        id v6 = [[AMSMetricsEvent alloc] initWithTopic:@"xp_amp_notifications"];
        uint64_t v7 = objc_alloc(&OBJC_CLASS___UNUserNotificationCenter);
        uint64_t v8 = WLKTVAppBundleID(v7);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        id v10 = -[UNUserNotificationCenter initWithBundleIdentifier:](v7, "initWithBundleIdentifier:", v9);

        int v11 = (void *)objc_claimAutoreleasedReturnValue(-[UNUserNotificationCenter notificationSettingsForTopics](v10, "notificationSettingsForTopics"));
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[UNUserNotificationCenter notificationSettings](v10, "notificationSettings"));
        id v13 = [[WLKPushNotificationMetricsManager alloc] initWithNotificationSettings:v12 notificationSettingsForTopic:v11];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 displayCriteria]);
        [WeakRetained _augmentCustomEventInfo:v14];
        [v14 addEntriesFromDictionary:v5];
        [v6 addPropertiesWithDictionary:v14];
        [*(id *)(v20 + 40) addObject:v6];

        id v4 = (char *)v4 + 1;
      }

      while (v3 != v4);
      id v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v3);
  }

  uint64_t v15 = *(void *)(v20 + 40);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained metricsController]);
  +[WLDMetricsUtilities sendMetricsEvents:metricsController:]( &OBJC_CLASS___WLDMetricsUtilities,  "sendMetricsEvents:metricsController:",  v15,  v16);
}

- (void)_reportMercuryMetrics:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v8 = v4;
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0 || ![v4 count])
    {
      id v10 = 0LL;
      goto LABEL_8;
    }

    id v20 = v4;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  }

  id v10 = v8;
LABEL_8:
  int v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __55__WLDPushNotificationController__reportMercuryMetrics___block_invoke;
  block[3] = &unk_10003D7D8;
  id v17 = v10;
  uint64_t v18 = v11;
  uint64_t v19 = self;
  uint64_t v14 = v11;
  id v15 = v10;
  dispatch_async(v13, block);
}

void __55__WLDPushNotificationController__reportMercuryMetrics___block_invoke(uint64_t a1)
{
  uint64_t v19 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPushNotificationController._reportMercuryMetrics");
  uint64_t v20 = a1;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v6);
        id v8 = objc_msgSend( [AMSMetricsEvent alloc],  "initWithTopic:",  @"xp_amp_notifications",  v19);
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
        if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
        {
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"eventVersion"]);
          if (v12
            && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v11),
                uint64_t isKindOfClass = objc_opt_isKindOfClass(v12, v13),
                (isKindOfClass & 1) == 0))
          {
            uint64_t v15 = WLKPushNotificationsLogObject(isKindOfClass);
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - eventVersion: value is invalid.",  buf,  2u);
            }
          }

          else
          {
            [v8 addPropertiesWithDictionary:v7];
            [*(id *)(v20 + 40) addObject:v8];
          }
        }

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v4);
  }

  uint64_t v17 = *(void *)(v20 + 40);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v20 + 48) metricsController]);
  +[WLDMetricsUtilities sendMetricsEvents:metricsController:]( &OBJC_CLASS___WLDMetricsUtilities,  "sendMetricsEvents:metricsController:",  v17,  v18);
}

- (void)_postNotificationWithPayload:(id)a3
{
  id v117 = a3;
  uint64_t v141 = 0LL;
  v142 = &v141;
  uint64_t v143 = 0x3032000000LL;
  v144 = __Block_byref_object_copy__2;
  v145 = __Block_byref_object_dispose__2;
  v146 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPushNotificationController._postNotificationWithPayload");
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_numberForKey:", @"interruptionLevel"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_stringForKey:", @"entityId"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_stringForKey:", @"coalescingId"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_stringForKey:", WLKNotificationsKeyType));
  v103 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  v108 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v110 isEqualToString:@"gameStartWithFollow"] & (objc_msgSend(v103, "isEqualToString:", @"iPad") ^ 1)));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_dictionaryForKey:", @"localizedTitle"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wlk_stringForKey:", @"AppleTv"));

  uint64_t v113 = kWLKInternalSubsystem;
  uint64_t v4 = ((uint64_t (*)(void))os_variant_has_internal_content)();
  if ((_DWORD)v4)
  {
    uint64_t v5 = WLKPushNotificationsLogObject(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v105;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v112;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Canonical ID: %@ Coalescing ID: %@",  buf,  0x16u);
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_dictionaryForKey:", @"localizedText"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wlk_stringForKey:", @"AppleTv"));

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", &off_1000417A8, WLKNotificationsKeySource);
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v8,  "wlk_setObjectUnlessNil:forKey:",  v109,  WLKNotificationsKeyInterruptionLevel);
  v116 = v8;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_stringForKey:", @"threadId"));
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v116,  "wlk_setObjectUnlessNil:forKey:",  v9,  WLKNotificationsKeyThreadID);
  v102 = (void *)v9;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_dateFromMillisecondsSince1970ForKey:", @"displayEndTime"));
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v116,  "wlk_setObjectUnlessNil:forKey:",  v10,  WLKNotificationsKeyExpirationDate);
  v101 = (void *)v10;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v117 objectForKey:@"metrics"]);
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v116,  "wlk_setObjectUnlessNil:forKey:",  v11,  WLKNotificationsKeyMetrics);
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v116,  "wlk_setObjectUnlessNil:forKey:",  v108,  WLKNotificationsKeyIsSession);
  v104 = (void *)v11;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_dictionaryForKey:", @"localizedBody"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "wlk_stringForKey:", @"AppleTv"));

  if (v107)
  {
    id v13 = v107;

    v114 = v13;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_dictionaryForKey:", @"localizedFooter"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "wlk_stringForKey:", @"AppleTv"));

  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v116,  "wlk_setObjectUnlessNil:forKey:",  v106,  WLKNotificationsKeyFooter);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_numberForKey:", @"displayTimeoutSeconds"));
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v116,  "wlk_setObjectUnlessNil:forKey:",  v15,  WLKNotificationsKeyTimeout);
  v100 = (void *)v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAppLibrary defaultAppLibrary](&OBJC_CLASS___WLKAppLibrary, "defaultAppLibrary"));
  v122 = (void *)objc_claimAutoreleasedReturnValue([v16 allAppBundleIdentifiers]);

  __int128 v139 = 0u;
  __int128 v140 = 0u;
  __int128 v137 = 0u;
  __int128 v138 = 0u;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_arrayForKey:", @"actions"));
  id v19 = [v17 countByEnumeratingWithState:&v137 objects:v152 count:16];
  id obj = v17;
  if (v19)
  {
    id v118 = 0LL;
    v119 = 0LL;
    v120 = 0LL;
    id v115 = 0LL;
    uint64_t v20 = *(void *)v138;
    while (1)
    {
      id v21 = 0LL;
      do
      {
        if (*(void *)v138 != v20) {
          objc_enumerationMutation(obj);
        }
        __int128 v22 = *(void **)(*((void *)&v137 + 1) + 8LL * (void)v21);
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary, v18);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
        {
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wlk_numberForKey:", @"isTvAppAction"));
          unsigned int v25 = [v24 BOOLValue];

          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wlk_stringForKey:", @"type"));
          if (([v26 isEqualToString:@"LiveActivityAutostart"] & 1) == 0)
          {
            if (v120) {
              unsigned int v27 = 0;
            }
            else {
              unsigned int v27 = v25;
            }
            if ((v27 & 1) != 0)
            {
LABEL_18:
              id v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wlk_dictionaryForKey:", @"clientActionDeepLinks"));
              BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "wlk_stringForKey:", @"AppleTv"));
              uint64_t v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "wlk_stringForKey:", @"Universal"));
              uint64_t v31 = (void *)v30;
              if (v27)
              {
                v32 = (void *)v30;
                if (v30 || (v32 = v29) != 0LL) {
                  v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v32));
                }
                else {
                  v120 = 0LL;
                }
                uint64_t v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wlk_dictionaryForKey:", @"metrics"));
                v34 = v118;
                id v118 = (id)v33;
LABEL_44:
              }

              else if (!v119 && v29)
              {
                v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v29));
                uint64_t v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wlk_dictionaryForKey:", @"metrics"));
                v34 = v115;
                id v115 = (id)v52;
                goto LABEL_44;
              }

              if (v119) {
                BOOL v53 = v120 == 0LL;
              }
              else {
                BOOL v53 = 1;
              }
              int v54 = v53;

              if (!v54)
              {

                v56 = obj;
                goto LABEL_63;
              }
            }

            else if (!v119)
            {
              BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wlk_arrayForKey:", @"bundleIds"));
              if (![v35 count])
              {
                uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wlk_stringForKey:", @"brandId"));
                uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[WLKChannelUtilities sharedInstance]( &OBJC_CLASS___WLKChannelUtilities,  "sharedInstance"));
                v38 = (void *)objc_claimAutoreleasedReturnValue([v37 channelForID:v36]);

                uint64_t v39 = objc_claimAutoreleasedReturnValue([v38 appBundleIDs]);
                BOOL v35 = (void *)v39;
              }

              __int128 v135 = 0u;
              __int128 v136 = 0u;
              __int128 v133 = 0u;
              __int128 v134 = 0u;
              id v40 = v35;
              id v41 = [v40 countByEnumeratingWithState:&v133 objects:v151 count:16];
              if (v41)
              {
                uint64_t v42 = *(void *)v134;
                while (2)
                {
                  for (i = 0LL; i != v41; i = (char *)i + 1)
                  {
                    if (*(void *)v134 != v42) {
                      objc_enumerationMutation(v40);
                    }
                    if ([v122 containsObject:*(void *)(*((void *)&v133 + 1) + 8 * (void)i)])
                    {

                      goto LABEL_18;
                    }
                  }

                  id v41 = [v40 countByEnumeratingWithState:&v133 objects:v151 count:16];
                  if (v41) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v45 = WLKPushNotificationsLogObject(v44);
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v40;
                _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Not inspecting action for bundleIDs: %@ because none are installed.",  buf,  0xCu);
              }

              uint64_t has_internal_content = os_variant_has_internal_content(v113);
              if ((_DWORD)has_internal_content)
              {
                uint64_t v48 = WLKPushNotificationsLogObject(has_internal_content);
                uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAppLibrary defaultAppLibrary](&OBJC_CLASS___WLKAppLibrary, "defaultAppLibrary"));
                  __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v50 dictionaryRepresentation]);
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v51;
                  _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - App library: %@",  buf,  0xCu);
                }
              }

              v119 = 0LL;
            }
          }
        }

        id v21 = (char *)v21 + 1;
      }

      while (v21 != v19);
      id v55 = [obj countByEnumeratingWithState:&v137 objects:v152 count:16];
      id v19 = v55;
      if (!v55)
      {

        if (v119) {
          goto LABEL_64;
        }
        goto LABEL_62;
      }
    }
  }

  id v115 = 0LL;
  v120 = 0LL;
  id v118 = 0LL;
LABEL_62:
  id v57 = v120;
  id v58 = v118;
  v56 = v115;
  id v118 = v58;
  v119 = v57;
  id v115 = v58;
  v120 = v57;
LABEL_63:

LABEL_64:
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v116,  "wlk_setObjectUnlessNil:forKey:",  v119,  WLKNotificationsKeyActionURL);
  -[NSMutableDictionary wlk_setObjectUnlessNil:forKey:]( v116,  "wlk_setObjectUnlessNil:forKey:",  v115,  WLKNotificationsKeyActionMetrics);
  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_stringForKey:", @"settingType"));
  if ([v59 isEqual:@"Explicit"])
  {
    int v60 = 0;
    uint64_t v61 = 1LL;
  }

  else if ([v59 isEqual:@"Implicit"])
  {
    int v60 = 0;
    uint64_t v61 = 2LL;
  }

  else
  {
    unsigned int v62 = [v59 isEqual:@"Marketing"];
    int v60 = v62 ^ 1;
    if (v62) {
      uint64_t v61 = 4LL;
    }
    else {
      uint64_t v61 = 0LL;
    }
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v61));
  -[NSMutableDictionary setObject:forKey:](v116, "setObject:forKey:", v63, WLKNotificationsKeyCategory);

  -[NSMutableDictionary setObject:forKey:](v116, "setObject:forKey:", &off_1000417C0, WLKNotificationsKeyButtonType);
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "wlk_numberForKey:", @"hasScore"));
  unsigned int v65 = [v64 BOOLValue];

  id v66 = [v112 length];
  BOOL v67 = v66 != 0LL;
  if (!v66)
  {
    uint64_t v68 = WLKPushNotificationsLogObject(0LL);
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Payload lacks an identifier.",  buf,  2u);
    }
  }

  if (![v111 length])
  {
    uint64_t v70 = WLKPushNotificationsLogObject(0LL);
    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Payload lacks a title.",  buf,  2u);
    }

    BOOL v67 = 0;
  }

  id v72 = [v114 length];
  if (!v72)
  {
    uint64_t v73 = WLKPushNotificationsLogObject(0LL);
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Payload lacks a message.",  buf,  2u);
    }

    BOOL v67 = 0;
  }

  if (v119)
  {
    if (!v65) {
      goto LABEL_95;
    }
    goto LABEL_89;
  }

  uint64_t v75 = WLKPushNotificationsLogObject(v72);
  v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Payload lacks an action.",  buf,  2u);
  }

  BOOL v67 = 0;
  if (v65)
  {
LABEL_89:
    uint64_t v77 = WLKPushNotificationsLogObject(v72);
    v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Payload has a score.",  buf,  2u);
    }

    v79 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSystemPreferencesStore sharedPreferences]( &OBJC_CLASS___WLKSystemPreferencesStore,  "sharedPreferences"));
    unsigned __int8 v80 = [v79 sportsScoreSpoilersAllowed];

    if ((v80 & 1) == 0)
    {
      uint64_t v82 = WLKPushNotificationsLogObject(v81);
      v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - User has sports scores disabled",  buf,  2u);
      }

      BOOL v67 = 0;
    }
  }

void __62__WLDPushNotificationController__postNotificationWithPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = __62__WLDPushNotificationController__postNotificationWithPayload___block_invoke_2;
  v17[3] = &unk_10003D800;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v18 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v17];

  uint64_t v6 = WLKPushNotificationsLogObject(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Now Playing Canonicals: %@",  buf,  0xCu);
  }

  id v8 = [v4 containsObject:*(void *)(a1 + 32)];
  if ((_DWORD)v8)
  {
    uint64_t v9 = WLKPushNotificationsLogObject(v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Discarding notification for current game %@",  buf,  0xCu);
    }
  }

  else
  {
    if (*(void *)(a1 + 40)) {
      id v8 = objc_msgSend(*(id *)(a1 + 48), "_reportBulletinMetrics:");
    }
    uint64_t v12 = WLKPushNotificationsLogObject(v8);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Will enqueue notification with action URL: %@",  buf,  0xCu);
    }

    [*(id *)(a1 + 48) _postNotificationToUser:*(void *)(a1 + 64) title:*(void *)(a1 + 72) body:*(void *)(a1 + 80) options:*(void *)(a1 + 88)];
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 96) + 8LL);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0LL;
}

void __62__WLDPushNotificationController__postNotificationWithPayload___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 canonicalID]);
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)_postNotificationToUser:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_alloc(&OBJC_CLASS___UNUserNotificationCenter);
  uint64_t v15 = WLKTVAppBundleID(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = -[UNUserNotificationCenter initWithBundleIdentifier:](v14, "initWithBundleIdentifier:", v16);

  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __76__WLDPushNotificationController__postNotificationToUser_title_body_options___block_invoke;
  v22[3] = &unk_10003D850;
  objc_copyWeak(&v27, &location);
  id v18 = v10;
  id v23 = v18;
  id v19 = v11;
  id v24 = v19;
  id v20 = v12;
  id v25 = v20;
  id v21 = v13;
  id v26 = v21;
  -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:]( v17,  "getNotificationSettingsWithCompletionHandler:",  v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __76__WLDPushNotificationController__postNotificationToUser_title_body_options___block_invoke( void *a1,  void *a2)
{
  id v3 = (id *)(a1 + 8);
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  NSLog(@"notification authorization status:%ld.", [v4 authorizationStatus]);
  id v6 = [v4 authorizationStatus];

  if (v6 == (id)2)
  {
    if (WeakRetained)
    {
      [WeakRetained[6] post:a1[4] title:a1[5] body:a1[6] options:a1[7]];
    }

    else
    {
      uint64_t v8 = WLKPushNotificationsLogObject(v7);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Push notification controller is nil. Notification not posted.",  buf,  2u);
      }
    }
  }
}

- (void)_loadURLBagWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3032000000LL;
  v19[3] = __Block_byref_object_copy__2;
  v19[4] = __Block_byref_object_dispose__2;
  id v20 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPushNotificationController._loadURLBagWithCompletionHandler");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVAppBag app](&OBJC_CLASS___TVAppBag, "app"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForKey:kBagKeyPushNotificationsEnvironment]);

  uint64_t v8 = WLKPushNotificationsLogObject(v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Configuration: %@",  buf,  0xCu);
  }

  id v10 = WLDDispatchQueue();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __66__WLDPushNotificationController__loadURLBagWithCompletionHandler___block_invoke;
  v14[3] = &unk_10003D878;
  id v15 = v6;
  id v16 = self;
  id v17 = v4;
  id v18 = v19;
  id v12 = v4;
  id v13 = v6;
  dispatch_async(v11, v14);

  _Block_object_dispose(v19, 8);
}

void __66__WLDPushNotificationController__loadURLBagWithCompletionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2)
  {
    id v3 = [v2 copy];
    uint64_t v4 = a1[5];
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;
  }

  else
  {
    uint64_t v6 = a1[5];
    id v7 = APSEnvironmentProduction;
    uint64_t v5 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v7;
  }

  id obj = (id)CFPreferencesCopyAppValue(@"APSEnvironment", @"com.apple.WatchListKit");
  if ([obj length]) {
    objc_storeStrong((id *)(a1[5] + 16LL), obj);
  }
  uint64_t v8 = a1[6];
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  uint64_t v9 = *(void *)(a1[7] + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0LL;
}

- (id)_portNameForEnvironmentName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:APSEnvironmentProduction])
  {
    uint64_t v4 = @"com.apple.aps.watchlistd";
  }

  else if ([v3 isEqualToString:APSEnvironmentDevelopment])
  {
    uint64_t v4 = @"com.apple.aps.watchlistd.dev";
  }

  else if ([v3 isEqualToString:APSEnvironmentDemo])
  {
    uint64_t v4 = @"com.apple.aps.watchlistd.demo";
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return (id)v4;
}

- (AMSMetrics)metricsController
{
  return self->_metricsController;
}

- (void).cxx_destruct
{
}

- (void)connection:(os_log_t)log didReceiveMessageForTopic:userInfo:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "WLDPushNotificationController - Suppressing AMS/Mercury notification. Payload lacks subsection",  v1,  2u);
}

@end