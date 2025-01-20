@interface LaunchServicesCatalog
- (LibraryCatalogObserver)observer;
- (id)resultsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)resultsWithBundleIDs:(id)a3 error:(id *)a4;
- (id)resultsWithItemIDs:(id)a3 error:(id *)a4;
- (void)_handleAppRegisteredNotification:(id)a3;
- (void)_handleAppUnregisteredNotification:(id)a3;
- (void)_handleBagChangedNotification:(id)a3;
- (void)_handleBagInvalidatedNotification:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5;
- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5;
- (void)launchApp:(id)a3 extensionType:(int64_t)a4 withResultHandler:(id)a5;
- (void)launchApp:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5;
- (void)launchApp:(id)a3 withResultHandler:(id)a4;
- (void)setObserver:(id)a3;
@end

@implementation LaunchServicesCatalog

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  [v3 removeObserver:self name:AMSBagChangedNotification object:0];
  [v3 removeObserver:self name:AMSBagInvalidatedNotification object:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LaunchServicesCatalog;
  -[LaunchServicesCatalog dealloc](&v5, "dealloc");
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002619FC;
  v7[3] = &unk_1003E9DC0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002620C4;
  v7[3] = &unk_1003E9DC0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)executeQuery:(id)a3 excludingBundleIDs:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_1002617F4;
  v27 = sub_100261804;
  id v28 = &__NSArray0__struct;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_100262370;
  v19 = &unk_1003E9780;
  v22 = &v23;
  v20 = self;
  id v12 = v8;
  id v21 = v12;
  dispatch_sync(dispatchQueue, &block);
  if ([v9 count])
  {
    v13 = (void *)v24[5];
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"NOT bundleID IN %@",  v9,  block,  v17,  v18,  v19,  v20));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 filteredArrayUsingPredicate:v14]);
    v10[2](v10, v15, 0LL);
  }

  else
  {
    id v14 = [(id)v24[5] copy];
    v10[2](v10, v14, 0LL);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)executeQueryForUpdatesReloadingFromServer:(BOOL)a3 logKey:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc(&OBJC_CLASS____TtC9appstored14UpdatesContext);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002624B4;
  v16[3] = &unk_1003EEEB8;
  id v11 = v8;
  v16[4] = self;
  id v17 = v11;
  LOBYTE(v15) = 0;
  id v12 = -[UpdatesContext initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:]( v10,  "initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:",  0LL,  0LL,  v9,  v16,  0LL,  0LL,  v15,  0LL);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  id v14 = v13;
  if (v6) {
    [v13 reloadUpdatesWithContext:v12];
  }
  else {
    [v13 getUpdatesWithContext:v12];
  }
}

- (void)launchApp:(id)a3 extensionType:(int64_t)a4 withResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100262988;
  v13[3] = &unk_1003EEEE0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)launchApp:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5
{
}

- (void)launchApp:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100262D24;
  block[3] = &unk_1003EA390;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (id)resultsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc(&OBJC_CLASS___LibraryLazyResultsEnumerator);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100263244;
  v10[3] = &unk_1003EEF58;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  id v8 = sub_1001F5724(v6, 1LL, v10);

  return v8;
}

- (id)resultsWithBundleIDs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc(&OBJC_CLASS___LibraryLazyResultsEnumerator);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002633E0;
  v10[3] = &unk_1003EEF58;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  id v8 = sub_1001F5724(v6, 0LL, v10);

  return v8;
}

- (id)resultsWithItemIDs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  sub_1002618A4((uint64_t)self, @"item identifier lookup");
  id v6 = objc_alloc(&OBJC_CLASS___LibraryLazyResultsEnumerator);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100263604;
  v10[3] = &unk_1003EEF58;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  id v8 = sub_1001F5724(v6, 0LL, v10);

  return v8;
}

- (void)_handleAppRegisteredNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"isPlaceholder"]);
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100263FD0;
    v9[3] = &unk_1003E9DC0;
    id v10 = v4;
    id v11 = self;
    dispatch_async(dispatchQueue, v9);
  }
}

- (void)_handleAppUnregisteredNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"bundleIDs"]);
  id v6 = [v5 copy];

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100264278;
  v9[3] = &unk_1003E9DC0;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, v9);
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002644F0;
  block[3] = &unk_1003E9880;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleBagInvalidatedNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100264568;
  block[3] = &unk_1003E9880;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
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