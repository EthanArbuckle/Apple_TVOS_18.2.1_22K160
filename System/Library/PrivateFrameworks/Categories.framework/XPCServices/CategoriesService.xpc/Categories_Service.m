@interface Categories_Service
+ (id)_AppStoreIDToDHIDCategoriesMap;
+ (id)_macAppStoreIDToDHIDCategoriesMap;
+ (void)_lookupAppStoreUsing:(id)a3 platform:(id)a4 clientApplication:(id)a5 withCompletionHandler:(id)a6;
+ (void)_lookupGenreIDAndCounterpartIdentifiersInPlist:(id)a3 withCompletionHandler:(id)a4;
- (Categories_Service)init;
- (void)dealloc;
- (void)genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:(id)a3 replyHandler:(id)a4;
- (void)lookupAppStoreForBundleIDs:(id)a3 platform:(id)a4 replyHandler:(id)a5;
@end

@implementation Categories_Service

- (Categories_Service)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___Categories_Service;
  v2 = -[Categories_Service init](&v11, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.ctcategories.service", "service");
    v4 = (void *)qword_10000CE08;
    qword_10000CE08 = (uint64_t)v3;

    v5 = (os_log_s *)qword_10000CE08;
    if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[Categories_Service init]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.ctcategories.service", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
  }

  return v2;
}

- (void)dealloc
{
  os_log_t v3 = (os_log_s *)qword_10000CE08;
  if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_attr_t v6 = "-[Categories_Service dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___Categories_Service;
  -[Categories_Service dealloc](&v4, "dealloc");
}

- (void)genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForEntitlement:@"application-identifier"]);

  v10 = (os_log_s *)qword_10000CE08;
  if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412803;
    v20 = v9;
    __int16 v21 = 2080;
    v22 = "-[Categories_Service genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:replyHandler:]";
    __int16 v23 = 2113;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "<%@>::%s = %{private}@", buf, 0x20u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100001738;
  block[3] = &unk_1000083A8;
  id v16 = v6;
  id v17 = v9;
  id v18 = v7;
  id v12 = v7;
  id v13 = v9;
  id v14 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)lookupAppStoreForBundleIDs:(id)a3 platform:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForEntitlement:@"application-identifier"]);

  id v13 = (os_log_s *)qword_10000CE08;
  if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412803;
    v25 = v12;
    __int16 v26 = 2080;
    v27 = "-[Categories_Service lookupAppStoreForBundleIDs:platform:replyHandler:]";
    __int16 v28 = 2113;
    id v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "<%@>::%s = %{private}@", buf, 0x20u);
  }

  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100001B18;
  v19[3] = &unk_1000083D0;
  id v20 = v8;
  id v21 = v9;
  id v22 = v12;
  id v23 = v10;
  id v15 = v10;
  id v16 = v12;
  id v17 = v9;
  id v18 = v8;
  dispatch_async((dispatch_queue_t)queue, v19);
}

+ (id)_AppStoreIDToDHIDCategoriesMap
{
  if (qword_10000CE18 != -1) {
    dispatch_once(&qword_10000CE18, &stru_100008410);
  }
  return (id)qword_10000CE10;
}

+ (id)_macAppStoreIDToDHIDCategoriesMap
{
  if (qword_10000CE28 != -1) {
    dispatch_once(&qword_10000CE28, &stru_100008430);
  }
  return (id)qword_10000CE20;
}

+ (void)_lookupGenreIDAndCounterpartIdentifiersInPlist:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2020000000LL;
  char v14 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100002328;
  v9[3] = &unk_100008458;
  objc_super v11 = v13;
  id v12 = a1;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v10 = v8;
  [v6 enumerateObjectsUsingBlock:v9];
  v7[2](v7, 0LL, v8);

  _Block_object_dispose(v13, 8);
}

+ (void)_lookupAppStoreUsing:(id)a3 platform:(id)a4 clientApplication:(id)a5 withCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = sub_100002980;
  v44 = sub_100002990;
  id v45 = 0LL;
  if (+[CTNetworkReachability networkReachable](&OBJC_CLASS___CTNetworkReachability, "networkReachable"))
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100002998;
    v35[3] = &unk_100008480;
    id v14 = v9;
    id v36 = v14;
    id v15 = v13;
    v37 = v15;
    v39 = &v40;
    id v38 = v12;
    v27 = objc_retainBlock(v35);
    id v16 = -[CTAppStoreSearch initWithCallingProcess:]( objc_alloc(&OBJC_CLASS___CTAppStoreSearch),  "initWithCallingProcess:",  v11);
    if ([v10 isEqualToString:CTOSPlatformmacOS])
    {
      id v17 = v10;
      id v18 = v11;
      uint64_t v19 = 1LL;
    }

    else if ((objc_msgSend(v10, "isEqualToString:", CTOSPlatformiOS, v27) & 1) != 0 {
           || ([v10 isEqualToString:CTOSPlatformwatchOS] & 1) != 0)
    }
    {
      id v17 = v10;
      id v18 = v11;
      uint64_t v19 = 6LL;
    }

    else
    {
      unsigned int v23 = [v10 isEqualToString:CTOSPlatformtvOS];
      id v17 = v10;
      id v18 = v11;
      if (v23) {
        uint64_t v19 = 8LL;
      }
      else {
        uint64_t v19 = 15LL;
      }
    }

    v33[0] = 0LL;
    v33[1] = v33;
    v33[2] = 0x3032000000LL;
    v33[3] = sub_100002980;
    v33[4] = sub_100002990;
    id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v14, v27));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@","]);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100002DD0;
    v29[3] = &unk_1000084F8;
    v32 = v33;
    id v25 = v28;
    id v31 = v25;
    __int16 v26 = v16;
    v30 = v26;
    -[CTAppStoreSearch lookupAppWithBundleIDs:deviceFamily:completionHandler:]( v26,  "lookupAppWithBundleIDs:deviceFamily:completionHandler:",  v24,  v19,  v29);

    id v11 = v18;
    id v10 = v17;

    _Block_object_dispose(v33, 8);
  }

  else
  {
    id v20 = (os_log_s *)qword_10000CE08;
    if (os_log_type_enabled((os_log_t)qword_10000CE08, OS_LOG_TYPE_ERROR)) {
      sub_100005484((uint64_t)v9, v20);
    }
    v46 = @"FailedLookupBundleIDs";
    id v47 = v9;
    id v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CTErrorDomain,  -3001LL,  v15));
    id v22 = (void *)v41[5];
    v41[5] = v21;

    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, v41[5], 0LL);
  }

  _Block_object_dispose(&v40, 8);
}

- (void).cxx_destruct
{
}

@end