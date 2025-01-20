@interface IAPHistoryService
- (void)getAllIAPsForActiveAccountWithReplyHandler:(id)a3;
- (void)getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:(id)a3;
- (void)getCachedSubscriptionEntitlementsForSegment:(unint64_t)a3 withReplyHandler:(id)a4;
- (void)getIAPsForActiveAccountWithAdamIDs:(id)a3 withReplyHandler:(id)a4;
- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 isBackground:(BOOL)a5 requestingBundleId:(id)a6 withReplyHandler:(id)a7;
- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 requestingBundleId:(id)a5 withReplyHandler:(id)a6;
- (void)refreshIAPsForActiveAccountWithReplyHandler:(id)a3;
- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5;
@end

@implementation IAPHistoryService

- (void)getAllIAPsForActiveAccountWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100316B50((uint64_t)&OBJC_CLASS___XPCRequestToken, 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = ASDLogHandleForCategory(14LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class(self, v9);
    id v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 processInfo]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
    int v16 = 138412802;
    v17 = v10;
    __int16 v18 = 2114;
    v19 = v6;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@]: %{public}@ Getting IAPs for active account for client: %{public}@",  (uint8_t *)&v16,  0x20u);
  }

  id v14 = sub_10029C090((uint64_t)&OBJC_CLASS___IAPInfoManager);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  sub_10029D000((uint64_t)v15, v6, v4);
}

- (void)getIAPsForActiveAccountWithAdamIDs:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100316B50((uint64_t)&OBJC_CLASS___XPCRequestToken, 0LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v6 && [v6 count])
  {
    uint64_t v10 = ASDLogHandleForCategory(14LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class(self, v12);
      id v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 processInfo]);
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
      int v27 = 138412802;
      v28 = v13;
      __int16 v29 = 2114;
      v30 = v9;
      __int16 v31 = 2114;
      v32 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@]: %{public}@ Getting specific IAPs for active account for client: %{public}@",  (uint8_t *)&v27,  0x20u);
    }

    id v17 = sub_10029C090((uint64_t)&OBJC_CLASS___IAPInfoManager);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    sub_10029C3B0((uint64_t)v18, v6, v9, v7);
  }

  else
  {
    uint64_t v19 = ASDLogHandleForCategory(14LL);
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class(self, v21);
      id v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 processInfo]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
      int v27 = 138412802;
      v28 = v22;
      __int16 v29 = 2114;
      v30 = v9;
      __int16 v31 = 2114;
      v32 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%@]: %{public}@ Getting IAPs for active account for client: %{public}@",  (uint8_t *)&v27,  0x20u);
    }

    id v26 = sub_10029C090((uint64_t)&OBJC_CLASS___IAPInfoManager);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v26);
    sub_10029D000((uint64_t)v18, v9, v7);
  }
}

- (void)refreshIAPsForActiveAccountWithReplyHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100316B50((uint64_t)&OBJC_CLASS___XPCRequestToken, 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = ASDLogHandleForCategory(14LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_opt_class(self, v9);
    id v11 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 processInfo]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
    int v16 = 138412802;
    id v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@]: %{public}@ Refreshing IAPs for active account for client: %{public}@",  (uint8_t *)&v16,  0x20u);
  }

  id v14 = sub_10029C090((uint64_t)&OBJC_CLASS___IAPInfoManager);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  sub_10029D594((uint64_t)v15, v6, v4);
}

- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = sub_100316B50((uint64_t)&OBJC_CLASS___XPCRequestToken, 0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = ASDLogHandleForCategory(14LL);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class(self, v14);
    id v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 processInfo]);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleIdentifier]);
    int v20 = 138413058;
    uint64_t v21 = v15;
    __int16 v22 = 2114;
    id v23 = v18;
    __int16 v24 = 2114;
    id v25 = v8;
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%@]: Setting subscriptions for clientID: %{public}@ accountID: %{public}@ segment: %lu",  (uint8_t *)&v20,  0x2Au);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[SubscriptionEntitlementsCoordinator sharedInstance]( &OBJC_CLASS___SubscriptionEntitlementsCoordinator,  "sharedInstance"));
  [v19 setCachedSubscriptionEntitlements:v9 forAccountID:v8 segment:a5];
}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 requestingBundleId:(id)a5 withReplyHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = sub_100316B50((uint64_t)&OBJC_CLASS___XPCRequestToken, a5);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = ASDLogHandleForCategory(37LL);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_opt_class(self, v15);
    id v26 = v16;
    if (v12)
    {
      id v18 = objc_getProperty(v12, v17, 56LL, 1);
      id Property = objc_getProperty(v12, v19, 48LL, 1);
      id v25 = v18;
    }

    else
    {
      id v18 = 0LL;
      id v25 = 0LL;
      id Property = 0LL;
    }

    id v21 = Property;
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v12 processInfo]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
    *(_DWORD *)buf = 138413570;
    v28 = v16;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    __int16 v31 = 2114;
    id v32 = v18;
    __int16 v33 = 2114;
    id v34 = v21;
    __int16 v35 = 2114;
    v36 = v23;
    __int16 v37 = 1024;
    BOOL v38 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%@] Handling subscription entitlements request for segment: %lu requestingBundleId: %{public}@ clientID: %{public }@ processInfoID: %{public}@ ignore caches: %{BOOL}d",  buf,  0x3Au);
  }

  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[SubscriptionEntitlementsCoordinator sharedInstance]( &OBJC_CLASS___SubscriptionEntitlementsCoordinator,  "sharedInstance"));
  sub_100265464(v24, a3, v12, v7, 0, 1LL, v10);
}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 isBackground:(BOOL)a5 requestingBundleId:(id)a6 withReplyHandler:(id)a7
{
  LODWORD(v8) = a5;
  BOOL v9 = a4;
  id v12 = a7;
  uint64_t v13 = sub_100316B50((uint64_t)&OBJC_CLASS___XPCRequestToken, a6);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = ASDLogHandleForCategory(37LL);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = (int)v8;
    id v8 = (void *)objc_opt_class(self, v17);
    id v27 = v8;
    if (v14)
    {
      id v19 = objc_getProperty(v14, v18, 56LL, 1);
      id Property = objc_getProperty(v14, v20, 48LL, 1);
      id v26 = v19;
    }

    else
    {
      id v19 = 0LL;
      id v26 = 0LL;
      id Property = 0LL;
    }

    id v22 = Property;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 processInfo]);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleIdentifier]);
    *(_DWORD *)buf = 138413826;
    unint64_t v30 = v8;
    __int16 v31 = 2048;
    unint64_t v32 = a3;
    __int16 v33 = 2114;
    id v34 = v19;
    __int16 v35 = 2114;
    id v36 = v22;
    __int16 v37 = 2114;
    BOOL v38 = v24;
    __int16 v39 = 1024;
    BOOL v40 = v9;
    __int16 v41 = 1024;
    LOBYTE(v8) = v28;
    int v42 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%@] Handling subscription entitlements request for segment: %lu requestingBundleId: %{public}@ clientID: %{public }@ processInfoID: %{public}@ ignore caches: %{BOOL}d isBackground: %{BOOL}d",  buf,  0x40u);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[SubscriptionEntitlementsCoordinator sharedInstance]( &OBJC_CLASS___SubscriptionEntitlementsCoordinator,  "sharedInstance"));
  sub_100265464(v25, a3, v14, v9, (BOOL)v8, 1LL, v12);
}

- (void)getCachedSubscriptionEntitlementsForSegment:(unint64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = sub_100316B50((uint64_t)&OBJC_CLASS___XPCRequestToken, 0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = ASDLogHandleForCategory(37LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_opt_class(self, v11);
    id v14 = v12;
    if (v8) {
      id Property = objc_getProperty(v8, v13, 48LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v16 = Property;
    int v18 = 138412802;
    id v19 = v12;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    __int16 v22 = 2114;
    id v23 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@] Handling cached subscription entitlements request for segment: %lu clientID: %{public}@",  (uint8_t *)&v18,  0x20u);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[SubscriptionEntitlementsCoordinator sharedInstance]( &OBJC_CLASS___SubscriptionEntitlementsCoordinator,  "sharedInstance"));
  sub_1002656BC((uint64_t)v17, a3, v8, v6);
}

- (void)getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[SubscriptionEntitlementsCoordinator sharedInstance]( &OBJC_CLASS___SubscriptionEntitlementsCoordinator,  "sharedInstance"));
  sub_1002650FC((uint64_t)v4, v3);
}

@end