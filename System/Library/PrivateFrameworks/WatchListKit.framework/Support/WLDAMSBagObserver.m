@interface WLDAMSBagObserver
+ (id)sharedObserver;
- (WLDAMSBagObserver)init;
- (void)_amsBagDidChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation WLDAMSBagObserver

+ (id)sharedObserver
{
  if (sharedObserver___once != -1) {
    dispatch_once(&sharedObserver___once, &__block_literal_global_12);
  }
  return (id)sharedObserver___sharedObserver;
}

void __35__WLDAMSBagObserver_sharedObserver__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___WLDAMSBagObserver);
  v2 = (void *)sharedObserver___sharedObserver;
  sharedObserver___sharedObserver = (uint64_t)v1;
}

- (WLDAMSBagObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WLDAMSBagObserver;
  v2 = -[WLDAMSBagObserver init](&v6, "init");
  if (v2)
  {
    id v3 = +[WLKSettingsAMSBagTracker sharedTracker](&OBJC_CLASS___WLKSettingsAMSBagTracker, "sharedTracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v2 selector:"_amsBagDidChangeNotification:" name:AMSBagChangedNotification object:0];
  }

  return v2;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WLDAMSBagObserver;
  -[WLDAMSBagObserver dealloc](&v4, "dealloc");
}

- (void)_amsBagDidChangeNotification:(id)a3
{
  id v3 = a3;
  id v4 = _BagObserverLog();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Bag did change notifications", buf, 2u);
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:AMSBagChangedNotificationUserInfoChangedKeys]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsAMSBagTracker sharedTracker](&OBJC_CLASS___WLKSettingsAMSBagTracker, "sharedTracker"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __50__WLDAMSBagObserver__amsBagDidChangeNotification___block_invoke;
  v13[3] = &unk_10003CDC0;
  id v14 = v8;
  id v15 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, v13);
}

id __50__WLDAMSBagObserver__amsBagDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = _BagObserverLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Update tracked bag values", v5, 2u);
  }

  return [*(id *)(a1 + 32) updateTrackedBagValuesWithChangedKeys:*(void *)(a1 + 40)];
}

@end