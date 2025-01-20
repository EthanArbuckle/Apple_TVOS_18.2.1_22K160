@interface TVUNTopShelfProvider
- (BOOL)_showUpNext;
- (NSString)lastPageIdRecorded;
- (TVTopShelfContent)lastKnownContent;
- (TVUNTopShelfProvider)init;
- (_TtC17TVUpNextExtension23TopShelfContentProvider)contentProvider;
- (int64_t)contentProviderStartRetryCount;
- (int64_t)contentProviderState;
- (void)_accountsChanged:(id)a3;
- (void)_fetchFeaturedContentWithCompletionHandler:(id)a3;
- (void)_fetchUpNextContentWithCompletionHandler:(id)a3;
- (void)_gdprConsented;
- (void)_initializeTopShelfContentProvider;
- (void)_removeTopShelfItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)didSelectActionWithURL:(id)a3 actionUserInfo:(id)a4 forItemWithIdentifier:(id)a5 itemUserInfo:(id)a6;
- (void)didShowItemWithIdentifier:(id)a3 isFullScreen:(BOOL)a4 detailsVisible:(BOOL)a5 userInfo:(id)a6;
- (void)didStopShowingItemWithIdentifier:(id)a3 userInfo:(id)a4;
- (void)didUpdateShownItemWithIdentifier:(id)a3 isFullScreen:(BOOL)a4 detailsVisible:(BOOL)a5 userInfo:(id)a6;
- (void)loadTopShelfContentWithCompletionHandler:(id)a3;
- (void)networkHasBecomeAvailable:(id)a3;
- (void)performCustomActionWithURL:(id)a3 actionUserInfo:(id)a4 forItemWithIdentifier:(id)a5 itemUserInfo:(id)a6 completionHandler:(id)a7;
- (void)setContentProvider:(id)a3;
- (void)setContentProviderStartRetryCount:(int64_t)a3;
- (void)setContentProviderState:(int64_t)a3;
- (void)setLastKnownContent:(id)a3;
- (void)setLastPageIdRecorded:(id)a3;
- (void)startTopShelfContentProvider;
@end

@implementation TVUNTopShelfProvider

- (TVUNTopShelfProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVUNTopShelfProvider;
  v2 = -[TVUNTopShelfProvider init](&v10, "init");
  if (v2)
  {
    id v3 = +[VUIMetricsController sharedInstance](&OBJC_CLASS___VUIMetricsController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v4 addObserver:v2 selector:"_gdprConsented" name:VUIGDPRUserDidConsentNotification object:0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_accountsChanged:" name:SSAccountStoreActiveAccountChangedNotification object:0];

    id v6 = sub_1000084A0();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - TVUNTopShelfProvider init",  v9,  2u);
    }

    -[TVUNTopShelfProvider _initializeTopShelfContentProvider](v2, "_initializeTopShelfContentProvider");
  }

  return v2;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVUNTopShelfProvider;
  -[TVUNTopShelfProvider dealloc](&v5, "dealloc");
}

- (void)_initializeTopShelfContentProvider
{
  id v3 = sub_1000084A0();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Creating Top Shelf Content Provider",  buf,  2u);
  }

  objc_super v5 = objc_opt_new(&OBJC_CLASS____TtC17TVUpNextExtension23TopShelfContentProvider);
  -[TVUNTopShelfProvider setContentProvider:](self, "setContentProvider:", v5);

  -[TVUNTopShelfProvider setContentProviderStartRetryCount:](self, "setContentProviderStartRetryCount:", 0LL);
  +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
  unsigned int v6 = +[TVSNetworkUtilities physicalNetworkAvailable]( &OBJC_CLASS___TVSNetworkUtilities,  "physicalNetworkAvailable");
  id v7 = sub_1000084A0();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - We have network on start up",  v12,  2u);
    }

    -[TVUNTopShelfProvider setContentProviderState:](self, "setContentProviderState:", 1LL);
    -[TVUNTopShelfProvider startTopShelfContentProvider](self, "startTopShelfContentProvider");
  }

  else
  {
    if (v9)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - We do not have network on start up",  v11,  2u);
    }

    -[TVUNTopShelfProvider setContentProviderState:](self, "setContentProviderState:", 0LL);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:self selector:"networkHasBecomeAvailable:" name:kATVPhysicalNetworkStateChanged object:0];
  }

- (void)networkHasBecomeAvailable:(id)a3
{
  id v4 = sub_1000084A0();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - We have gained network",  buf,  2u);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:kATVPhysicalNetworkStateChanged object:0];

  dispatch_time_t v7 = dispatch_time(0LL, 1000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005454;
  block[3] = &unk_100030EA0;
  block[4] = self;
  dispatch_after(v7, &_dispatch_main_q, block);
}

- (void)startTopShelfContentProvider
{
  if ((id)-[TVUNTopShelfProvider contentProviderState](self, "contentProviderState") == (id)1)
  {
    id v3 = sub_1000084A0();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Starting Top Shelf Content Provider",  buf,  2u);
    }

    -[TVUNTopShelfProvider setContentProviderState:](self, "setContentProviderState:", 2LL);
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVUNTopShelfProvider contentProvider](self, "contentProvider"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100005550;
    v6[3] = &unk_100030EC8;
    v6[4] = self;
    [v5 startWithDeveloperMode:0 completionHandler:v6];
  }

- (void)_fetchUpNextContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVUNTopShelfProvider contentProvider](self, "contentProvider"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000577C;
  v7[3] = &unk_100030EF0;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchUpNextContentWithCompletion:v7];
}

- (void)_accountsChanged:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[VUIMetricsController sharedInstance](&OBJC_CLASS___VUIMetricsController, "sharedInstance", a3));
  [v3 updateGDPRConsentStatus];
}

- (void)_gdprConsented
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[VUIMetricsController sharedInstance](&OBJC_CLASS___VUIMetricsController, "sharedInstance"));
  [v2 forceGDPRConsentStatus:1];
}

- (void)_fetchFeaturedContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVUNTopShelfProvider contentProvider](self, "contentProvider"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005954;
  v7[3] = &unk_100030F18;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchFeaturedContentWithCompletion:v7];
}

- (BOOL)_showUpNext
{
  if (!+[VUIAuthenticationManager lightWeightUserHasActiveAccount]( &OBJC_CLASS___VUIAuthenticationManager,  "lightWeightUserHasActiveAccount")) {
    return 0;
  }
  id v2 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
  uint64_t v3 = WLKTVAppBundleID();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = -[NSUserDefaults initWithSuiteName:](v2, "initWithSuiteName:", v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](v5, "valueForKey:", @"TopShelfShowUpNext"));
  dispatch_time_t v7 = v6;
  if (v6) {
    unsigned __int8 v8 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)_removeTopShelfItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005B6C;
  v7[3] = &unk_100030F40;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async(&_dispatch_main_q, v7);
}

- (void)loadTopShelfContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = sub_1000084A0();
  dispatch_time_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Received topShelfItems request: %@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100005ECC;
  v19[3] = &unk_100030F68;
  objc_copyWeak(&v22, (id *)buf);
  id v8 = v5;
  id v20 = v8;
  id v9 = v4;
  id v21 = v9;
  objc_super v10 = objc_retainBlock(v19);
  -[TVUNTopShelfProvider startTopShelfContentProvider](self, "startTopShelfContentProvider");
  if (-[TVUNTopShelfProvider _showUpNext](self, "_showUpNext"))
  {
    id v11 = sub_1000084A0();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Will show Up Next UI",  v18,  2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100005FE8;
    v17[3] = &unk_100030F90;
    v13 = v17;
    v17[4] = v10;
    -[TVUNTopShelfProvider _fetchUpNextContentWithCompletionHandler:]( self,  "_fetchUpNextContentWithCompletionHandler:",  v17);
  }

  else
  {
    id v14 = sub_1000084A0();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Will show Featured UI",  v18,  2u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100005FF4;
    v16[3] = &unk_100030FB8;
    v13 = v16;
    v16[4] = v10;
    -[TVUNTopShelfProvider _fetchFeaturedContentWithCompletionHandler:]( self,  "_fetchFeaturedContentWithCompletionHandler:",  v16);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (void)didSelectActionWithURL:(id)a3 actionUserInfo:(id)a4 forItemWithIdentifier:(id)a5 itemUserInfo:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (-[TVUNTopShelfProvider _showUpNext](self, "_showUpNext"))
  {
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VUIMetricsController sharedInstance](&OBJC_CLASS___VUIMetricsController, "sharedInstance"));
    v16[0] = VUIMetricsKeyPageId;
    v16[1] = VUIMetricsKeyPageType;
    v17[0] = v11;
    v17[1] = @"topShelfUpNextPage";
    v16[2] = VUIMetricsKeyPageContext;
    v16[3] = VUIMetricsActionUrlKey;
    id v14 = &stru_100032790;
    if (v12) {
      id v14 = v12;
    }
    v17[2] = @"topShelf";
    v17[3] = v14;
    v16[4] = VUIMetricsActionTypeKey;
    void v16[5] = VUIMetricsTargetIdKey;
    v17[4] = VUIMetricsActionTypeNavigate;
    void v17[5] = v11;
    v16[6] = VUIMetricsTargetTypeKey;
    v17[6] = VUIMetricsTargetTypeButton;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  7LL));

    [v13 recordClick:v15];
  }

  else
  {
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_dictionaryForKey:", @"metricsData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VUIMetricsController sharedInstance](&OBJC_CLASS___VUIMetricsController, "sharedInstance"));

    [v13 recordClick:v12];
  }
}

- (void)didShowItemWithIdentifier:(id)a3 isFullScreen:(BOOL)a4 detailsVisible:(BOOL)a5 userInfo:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = sub_1000084A0();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413058;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v7;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - didShowItemWithIdentifier: itemIdentifier:%@, fullscreen:%d, detailsVisible:%d, itemUserInfo:%@",  (uint8_t *)&v13,  0x22u);
  }
}

- (void)didUpdateShownItemWithIdentifier:(id)a3 isFullScreen:(BOOL)a4 detailsVisible:(BOOL)a5 userInfo:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = sub_1000084A0();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v23 = v10;
    __int16 v24 = 1024;
    BOOL v25 = v8;
    __int16 v26 = 1024;
    BOOL v27 = v7;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - didUpdateShownItemWithIdentifier: itemIdentifier:%@, fullscreen:%d, detailsVisible:%d, itemUserInfo:%@",  buf,  0x22u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVUNTopShelfProvider lastPageIdRecorded](self, "lastPageIdRecorded"));
  unsigned int v15 = [v14 isEqualToString:v10];

  if (!v15 && v7)
  {
    uint64_t v20 = VUIMetricsKeyPageContext;
    id v21 = @"topShelf";
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[VUIMetricsPageEventData createWithPageId:andPageType:andEventData:]( &OBJC_CLASS___VUIMetricsPageEventData,  "createWithPageId:andPageType:andEventData:",  v10,  @"topShelfProductPage",  v16));

    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[VUIMetricsController sharedInstance](&OBJC_CLASS___VUIMetricsController, "sharedInstance"));
    [v18 recordPage:v17];

    -[TVUNTopShelfProvider setLastPageIdRecorded:](self, "setLastPageIdRecorded:", v10);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVUNTopShelfProvider contentProvider](self, "contentProvider"));
    [v19 saveToTrackerWithUserInfo:v11 completionHandler:&stru_100030FF8];
  }
}

- (void)didStopShowingItemWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000084A0();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - didStopShowingItemWithIdentifier: itemIdentifier:%@, itemUserInfo:%@",  (uint8_t *)&v11,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVUNTopShelfProvider contentProvider](self, "contentProvider"));
  [v10 recordImpressionsWithCompletionHandler:&stru_100031018];
}

- (void)performCustomActionWithURL:(id)a3 actionUserInfo:(id)a4 forItemWithIdentifier:(id)a5 itemUserInfo:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"TVUNFeaturedItemUserInfoKeyCustomAction"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"TVUNItemUserInfoKeyCustomAction"]);
  if ([v13 length])
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_dictionaryForKey:", @"metricsData"));
    if ([v13 isEqualToString:@"TVUNFeaturedItemCustomActionTypeSubscription"])
    {
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_stringForKey:", @"TVUNFeaturedItemUserInfoKeyBuyParams"));
      if (v16)
      {
LABEL_4:
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472LL;
        v77[2] = sub_100006F2C;
        v77[3] = &unk_100031040;
        id v78 = v10;
        id v79 = v12;
        +[TVUNPurchaseHandler purchaseItemWithBuyParams:completion:]( &OBJC_CLASS___TVUNPurchaseHandler,  "purchaseItemWithBuyParams:completion:",  v16,  v77);
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[VUIMetricsController sharedInstance](&OBJC_CLASS___VUIMetricsController, "sharedInstance"));
        [v17 recordClick:v15];

LABEL_59:
        goto LABEL_60;
      }

      uint64_t v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_dictionaryForKey:", @"TVUNFeaturedItemUserInfoKeyOfferDictionary"));
      if (v40)
      {
        v41 = (void *)v40;
        v42 = v15;
        id v43 = [[WLKStoreOffer alloc] initWithSubscriptionDictionary:v40];
        if (v43)
        {
          v44 = v43;
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v43 buyParameters]);

          unsigned int v15 = v42;
          if (v16) {
            goto LABEL_4;
          }
        }

        else
        {
        }
      }
    }

    else
    {
      if ([v13 isEqualToString:@"TVUNFeaturedItemCustomActionTypeUpNext"])
      {
        v63 = v15;
        v65 = v14;
        v68 = v13;
        uint64_t v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_stringForKey:", @"TVUNFeaturedItemUserInfoKeyCanonicalID"));
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVUNTopShelfProvider lastKnownContent](self, "lastKnownContent"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 items]);

        id v30 = [v29 countByEnumeratingWithState:&v73 objects:v82 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v74;
LABEL_17:
          v33 = v12;
          uint64_t v34 = 0LL;
          while (1)
          {
            if (*(void *)v74 != v32) {
              objc_enumerationMutation(v29);
            }
            v35 = *(void **)(*((void *)&v73 + 1) + 8 * v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue([v35 identifier]);
            unsigned __int8 v37 = [v36 isEqualToString:v11];

            if ((v37 & 1) != 0) {
              break;
            }
            if (v31 == (id)++v34)
            {
              id v31 = [v29 countByEnumeratingWithState:&v73 objects:v82 count:16];
              id v12 = v33;
              if (v31) {
                goto LABEL_17;
              }
              goto LABEL_23;
            }
          }

          id v53 = v35;

          id v12 = v33;
          if (!v53) {
            goto LABEL_41;
          }
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472LL;
          v71[2] = sub_1000070B4;
          v71[3] = &unk_100031068;
          id v72 = v33;
          +[TVUNUpNextActionHandler toggleUpNextStateForItem:completion:]( &OBJC_CLASS___TVUNUpNextActionHandler,  "toggleUpNextStateForItem:completion:",  v53,  v71);

          id v14 = v65;
          __int16 v13 = v68;
          v54 = (void *)v62;
          unsigned int v15 = v63;
        }

        else
        {
LABEL_23:

LABEL_41:
          id v55 = sub_1000084A0();
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
          id v14 = v65;
          v54 = (void *)v62;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v81 = v62;
            _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Could not find data source item: %@",  buf,  0xCu);
          }

          __int16 v13 = v68;
          unsigned int v15 = v63;
          if (v12) {
            (*((void (**)(id, void))v12 + 2))(v12, 0LL);
          }
        }

        goto LABEL_59;
      }

      id v38 = sub_1000084A0();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v81 = (uint64_t)v13;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Unknown action type: %@",  buf,  0xCu);
      }
    }

    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0LL);
    }
    goto LABEL_59;
  }

  if ([v14 length])
  {
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_stringForKey:", @"TVUNItemUserInfoKeyCanonicalID"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_stringForKey:", @"TVUNItemUserInfoKeyShowID"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_stringForKey:", @"TVUNItemUserInfoKeyURL"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "wlk_stringForKey:", @"TVUNItemUserInfoKeyShowURL"));
    if ([v14 isEqualToString:@"ViewDetails"])
    {
      v64 = v19;
      id v21 = v18;
      id v22 = v14;
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v20));
      id v70 = 0LL;
      [v23 openURL:v24 withOptions:0 error:&v70];
      id v25 = v70;

      if (v25)
      {
        id v26 = sub_1000084A0();
        BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v81 = (uint64_t)v25;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Failed to launch URL with error %@",  buf,  0xCu);
        }
      }

      if (v12) {
        (*((void (**)(id, void))v12 + 2))(v12, 0LL);
      }

      id v14 = v22;
      BOOL v18 = v21;
      __int16 v19 = v64;
      goto LABEL_55;
    }

    if ([v14 isEqualToString:@"ViewDetails_Show"])
    {
      v66 = v20;
      v45 = v19;
      v46 = v18;
      v47 = v14;
      v48 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v67));
      id v69 = 0LL;
      [v48 openURL:v49 withOptions:0 error:&v69];
      id v50 = v69;

      if (v50)
      {
        id v51 = sub_1000084A0();
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v81 = (uint64_t)v50;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Failed to launch show URL with error %@",  buf,  0xCu);
        }
      }

      if (v12) {
        (*((void (**)(id, void))v12 + 2))(v12, 0LL);
      }

      id v14 = v47;
      BOOL v18 = v46;
      __int16 v19 = v45;
      uint64_t v20 = v66;
      goto LABEL_55;
    }

    if ([v14 isEqualToString:@"RemoveFromUpNext"])
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[VUIUpNextRequestManager sharedInstance](&OBJC_CLASS___VUIUpNextRequestManager, "sharedInstance"));
      if ([v19 length]) {
        v58 = v19;
      }
      else {
        v58 = v18;
      }
      [v57 sendRequestForCanonicalID:v58 action:1 confirmationShouldWaitCompletion:0];
      goto LABEL_51;
    }

    if ([v14 isEqualToString:@"RemoveFromPlayHistory"])
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[VUIRemoveFromPlayHistoryRequestManager sharedInstance]( &OBJC_CLASS___VUIRemoveFromPlayHistoryRequestManager,  "sharedInstance"));
      [v57 sendRequestForDeleteID:v18 isContinueWatching:1];
LABEL_51:

      -[TVUNTopShelfProvider _removeTopShelfItemWithIdentifier:completionHandler:]( self,  "_removeTopShelfItemWithIdentifier:completionHandler:",  v11,  v12);
LABEL_55:

      goto LABEL_60;
    }

    if ([v14 isEqualToString:@"MarkAllEpisodesAsWatched"])
    {
LABEL_53:
      v59 = (void *)objc_claimAutoreleasedReturnValue( +[VUIMarkAsWatchedRequestManager sharedInstance]( &OBJC_CLASS___VUIMarkAsWatchedRequestManager,  "sharedInstance"));
      [v59 sendRequestForItemID:v18 itemType:&stru_100032790 channelID:0 adamID:0];

      +[TVTopShelfContentProvider topShelfContentDidChange]( &OBJC_CLASS___TVTopShelfContentProvider,  "topShelfContentDidChange");
      if (!v12) {
        goto LABEL_55;
      }
    }

    else
    {
      id v60 = sub_1000084A0();
      v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v81 = (uint64_t)v14;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "--- TVUNTopShelfProvider - Unknown action type: %@",  buf,  0xCu);
      }

      if (!v12) {
        goto LABEL_55;
      }
    }

    (*((void (**)(id, void))v12 + 2))(v12, 0LL);
    goto LABEL_55;
  }

- (TVTopShelfContent)lastKnownContent
{
  return self->_lastKnownContent;
}

- (void)setLastKnownContent:(id)a3
{
}

- (NSString)lastPageIdRecorded
{
  return self->_lastPageIdRecorded;
}

- (void)setLastPageIdRecorded:(id)a3
{
}

- (_TtC17TVUpNextExtension23TopShelfContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
}

- (int64_t)contentProviderState
{
  return self->_contentProviderState;
}

- (void)setContentProviderState:(int64_t)a3
{
  self->_contentProviderState = a3;
}

- (int64_t)contentProviderStartRetryCount
{
  return self->_contentProviderStartRetryCount;
}

- (void)setContentProviderStartRetryCount:(int64_t)a3
{
  self->_contentProviderStartRetryCount = a3;
}

- (void).cxx_destruct
{
}

@end