@interface AppStoreService
- (AppStoreService)init;
- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4;
- (void)allBadgeIDsWithReplyHandler:(id)a3;
- (void)allBadgeMetricsWithReplyHandler:(id)a3;
- (void)badgeIDCountWithReplyHandler:(id)a3;
- (void)launchAppStoreWithURL:(id)a3 withReplyHandler:(id)a4;
- (void)removeAllBadgeIDsWithReplyHandler:(id)a3;
- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4;
- (void)removeBadgeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4;
@end

@implementation AppStoreService

- (AppStoreService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AppStoreService;
  v2 = -[AppStoreService init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.AppStoreService", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)launchAppStoreWithURL:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v9 = ASDLogHandleForCategory(14LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = sub_1001DB80C((uint64_t)self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    __int16 v25 = 2114;
    v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@] launchAppStoreWithURL for client: %{public}@",  buf,  0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v14 = v13;
  if (v6
    && ([v13 setObject:v6 forKeyedSubscript:FBSOpenApplicationOptionKeyPayloadURL],
        (v15 = (void *)objc_claimAutoreleasedReturnValue( +[ApplicationProxy proxyForBundleID:]( &OBJC_CLASS___ApplicationProxy,  "proxyForBundleID:",  @"com.apple.TVAppStore"))) != 0LL))
  {
    v16 = v15;
    v17 = (void *)sub_1001BF610(objc_alloc(&OBJC_CLASS___ApplicationContext), v15);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001DB870;
    v21[3] = &unk_1003E9C30;
    id v22 = v7;
    [v17 launchApplicationWithOptions:v14 completionHandler:v21];
  }

  else
  {
    uint64_t v18 = ASDLogHandleForCategory(14LL);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] could not find App Store", buf, 0xCu);
    }

    uint64_t v20 = ASDErrorWithDescription(ASDErrorDomain, 507LL, @"Could not find App Store");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v20);
    (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 2LL, v16);
  }
}

- (void)addBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  objc_super v8 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v9 = ASDLogHandleForCategory(14LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = sub_1001DB80C((uint64_t)self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v20 = 138412546;
    v21 = v8;
    __int16 v22 = 2114;
    v23[0] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@] addHardwareOfferIDs for client: %{public}@",  (uint8_t *)&v20,  0x16u);
  }

  id v13 = sub_1001B782C((uint64_t)&OBJC_CLASS___BadgingCoordinator);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = sub_1001B83A0((uint64_t)v14, v7, v8);

  if (v6) {
    v6[2](v6, v15, 0LL);
  }
  uint64_t v16 = ASDLogHandleForCategory(14LL);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = sub_1001DB80C((uint64_t)self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    int v20 = 138412802;
    v21 = v8;
    __int16 v22 = 1024;
    LODWORD(v23[0]) = v15;
    WORD2(v23[0]) = 2114;
    *(void *)((char *)v23 + 6) = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] addHardwareOfferIDs complete with result: %d for client: %{public}@ ",  (uint8_t *)&v20,  0x1Cu);
  }
}

- (void)allBadgeIDsWithReplyHandler:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v6 = ASDLogHandleForCategory(14LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_1001DB80C((uint64_t)self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v19 = 138412546;
    int v20 = v5;
    __int16 v21 = 2114;
    __int16 v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%@] allHardwareOffersIDsWithReplyHandler for client: %{public}@",  (uint8_t *)&v19,  0x16u);
  }

  id v10 = sub_1001B782C((uint64_t)&OBJC_CLASS___BadgingCoordinator);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = sub_1001B8BC4(v11, v5);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v4) {
    v4[2](v4, v13, 0LL);
  }
  uint64_t v14 = ASDLogHandleForCategory(14LL);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", @", "));
    id v17 = sub_1001DB80C((uint64_t)self);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    int v19 = 138412802;
    int v20 = v5;
    __int16 v21 = 2114;
    __int16 v22 = v16;
    __int16 v23 = 2114;
    v24 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] allHardwareOffersIDsWithReplyHandler complete with [%{public}@] for client: %{public}@",  (uint8_t *)&v19,  0x20u);
  }
}

- (void)allBadgeMetricsWithReplyHandler:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v6 = ASDLogHandleForCategory(14LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_1001DB80C((uint64_t)self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v21 = 138412546;
    __int16 v22 = v5;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%@] allHardwareOfferMetricsWithReplyHandler for client: %{public}@",  (uint8_t *)&v21,  0x16u);
  }

  id v10 = sub_1001B782C((uint64_t)&OBJC_CLASS___BadgingCoordinator);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = sub_1001B8E58(v11, v5);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v4) {
    v4[2](v4, v13, 0LL);
  }
  uint64_t v14 = ASDLogHandleForCategory(14LL);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 keyEnumerator]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allObjects]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", @", "));
    id v19 = sub_1001DB80C((uint64_t)self);
    int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    int v21 = 138412802;
    __int16 v22 = v5;
    __int16 v23 = 2114;
    v24 = v18;
    __int16 v25 = 2114;
    v26 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%@] allHardwareOfferMetricsWithReplyHandler complete with [%{public}@] for client: %{public}@",  (uint8_t *)&v21,  0x20u);
  }
}

- (void)badgeIDCountWithReplyHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v6 = ASDLogHandleForCategory(14LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_1001DB80C((uint64_t)self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v17 = 138412546;
    id v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = (uint64_t)v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%@] badgeIDCountWithReplyHandler for client: %{public}@",  (uint8_t *)&v17,  0x16u);
  }

  id v10 = sub_1001B782C((uint64_t)&OBJC_CLASS___BadgingCoordinator);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = sub_1001B8F78((uint64_t)v11, v5);

  if (v4) {
    v4[2](v4, v12, 0LL);
  }
  uint64_t v13 = ASDLogHandleForCategory(14LL);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = sub_1001DB80C((uint64_t)self);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    int v17 = 138412802;
    id v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = v12;
    __int16 v21 = 2114;
    __int16 v22 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%@] badgeIDCountWithReplyHandler complete with count: %ld for client: %{public}@ ",  (uint8_t *)&v17,  0x20u);
  }
}

- (void)removeAllBadgeIDsWithReplyHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v6 = ASDLogHandleForCategory(14LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = sub_1001DB80C((uint64_t)self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v17 = 138412546;
    id v18 = v5;
    __int16 v19 = 2114;
    v20[0] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%@] removeAllBadgeIDsWithReplyHandler for client: %{public}@",  (uint8_t *)&v17,  0x16u);
  }

  id v10 = sub_1001B782C((uint64_t)&OBJC_CLASS___BadgingCoordinator);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = sub_1001B9298((uint64_t)v11, v5);

  if (v4) {
    v4[2](v4, v12, 0LL);
  }
  uint64_t v13 = ASDLogHandleForCategory(14LL);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = sub_1001DB80C((uint64_t)self);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    int v17 = 138412802;
    id v18 = v5;
    __int16 v19 = 1024;
    LODWORD(v20[0]) = v12;
    WORD2(v20[0]) = 2114;
    *(void *)((char *)v20 + 6) = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%@] removeAllBadgeIDsWithReplyHandler complete with result: %d for client: %{public}@ ",  (uint8_t *)&v17,  0x1Cu);
  }
}

- (void)removeBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v9 = ASDLogHandleForCategory(14LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
    id v12 = sub_1001DB80C((uint64_t)self);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v23 = 138412802;
    v24 = v8;
    __int16 v25 = 2114;
    *(void *)v26 = v11;
    *(_WORD *)&v26[8] = 2114;
    *(void *)&v26[10] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@] removeBadgeIDs: [%{public}@] for client: %{public}@",  (uint8_t *)&v23,  0x20u);
  }

  id v14 = sub_1001B782C((uint64_t)&OBJC_CLASS___BadgingCoordinator);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = sub_1001DB80C((uint64_t)self);
  int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = sub_1001B9480((uint64_t)v15, v6, v17, v8);

  if (v7) {
    v7[2](v7, v18, 0LL);
  }
  uint64_t v19 = ASDLogHandleForCategory(14LL);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = sub_1001DB80C((uint64_t)self);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    int v23 = 138412802;
    v24 = v8;
    __int16 v25 = 1024;
    *(_DWORD *)v26 = v18;
    *(_WORD *)&v26[4] = 2114;
    *(void *)&v26[6] = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[%@] removeBadgeIDs complete with result: %d for client: %{public}@ ",  (uint8_t *)&v23,  0x1Cu);
  }
}

- (void)removeBadgeMetricsForBadgeIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
  uint64_t v9 = ASDLogHandleForCategory(14LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
    id v12 = sub_1001DB80C((uint64_t)self);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v21 = 138412802;
    __int16 v22 = v8;
    __int16 v23 = 2114;
    *(void *)v24 = v11;
    *(_WORD *)&v24[8] = 2114;
    *(void *)&v24[10] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@] removeBadgeMetricsForBadgeIDs: [%{public}@] for client: %{public}@",  (uint8_t *)&v21,  0x20u);
  }

  id v14 = sub_1001B782C((uint64_t)&OBJC_CLASS___BadgingCoordinator);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = sub_1001B916C((uint64_t)v15, v6, v8);

  if (v7) {
    v7[2](v7, v16, 0LL);
  }
  uint64_t v17 = ASDLogHandleForCategory(14LL);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = sub_1001DB80C((uint64_t)self);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    int v21 = 138412802;
    __int16 v22 = v8;
    __int16 v23 = 1024;
    *(_DWORD *)v24 = v16;
    *(_WORD *)&v24[4] = 2114;
    *(void *)&v24[6] = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%@] removeBadgeMetricsForOfferIDs complete with result: %d for client: %{public}@ ",  (uint8_t *)&v21,  0x1Cu);
  }
}

- (void).cxx_destruct
{
}

@end