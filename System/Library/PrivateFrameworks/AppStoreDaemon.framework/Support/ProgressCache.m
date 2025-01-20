@interface ProgressCache
- (LibraryCatalogObserver)observer;
- (ProgressCache)init;
- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5;
- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5;
- (void)setObserver:(id)a3;
@end

@implementation ProgressCache

- (ProgressCache)init
{
  id v3 = sub_1002E78A4((uint64_t)&OBJC_CLASS___XPCNotificationCenter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (self)
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___ProgressCache;
    v6 = -[ProgressCache init](&v16, "init");
    self = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_notificationCenter, v4);
      dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.appstored.ProgressCache", v8);
      dispatchQueue = self->_dispatchQueue;
      self->_dispatchQueue = v9;

      v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      placeholders = self->_placeholders;
      self->_placeholders = v11;

      v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      progressStore = self->_progressStore;
      self->_progressStore = v13;
    }
  }

  return self;
}

- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002B2B28;
  block[3] = &unk_1003EA5C0;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(dispatchQueue, block);
}

- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5
{
}

- (LibraryCatalogObserver)observer
{
  return (LibraryCatalogObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end