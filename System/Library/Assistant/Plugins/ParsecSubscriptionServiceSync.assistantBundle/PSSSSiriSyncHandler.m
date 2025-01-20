@interface PSSSSiriSyncHandler
- (void)_startSubscriptionFetch;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
@end

@implementation PSSSSiriSyncHandler

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v8 = a6;
  -[PSSSSiriSyncHandler _startSubscriptionFetch](self, "_startSubscriptionFetch");
}

- (void)_startSubscriptionFetch
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_2A48;
  v16[3] = &unk_4188;
  v17 = v3;
  v5 = v3;
  [v4 enumerateBundlesOfType:1 block:v16];

  id v15 = 0LL;
  v6 = (AFFuture *)-[AFFuture initAndGetSetterBlock:]( objc_alloc(&OBJC_CLASS___AFFuture),  "initAndGetSetterBlock:",  &v15);
  id v7 = v15;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_2A8C;
  v12[3] = &unk_41D8;
  id v13 = objc_alloc_init(&OBJC_CLASS___PSSSSubscriptionManagerInternal);
  id v14 = v7;
  id v8 = v13;
  id v9 = v7;
  [v8 getActiveSubscriptionServicesMatchingBundleIdentifiers:v5 domainIdentifiers:0 maximumExpirationLimit:v12 completionHandler:31104000.0];
  subscriptionsFuture = self->_subscriptionsFuture;
  self->_subscriptionsFuture = v6;
  v11 = v6;
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6 = a4;
  subscriptionsFuture = self->_subscriptionsFuture;
  id v8 = a3;
  id v9 = -[AFFuture waitForValue:](subscriptionsFuture, "waitForValue:", dispatch_time(0LL, 10000000000LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_pssSiriSync_anchorValue"));
    unsigned __int8 v13 = [v8 isEqualToString:v12];

    if ((v13 & 1) == 0)
    {
      [v6 setPostAnchor:v12];
      [v6 setObject:v11];
    }
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      v16 = "-[PSSSSiriSyncHandler getChangeAfterAnchor:changeInfo:]";
      _os_log_error_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "%s Timed out. Leaving sync state as is.",  (uint8_t *)&v15,  0xCu);
    }

    [v6 setPostAnchor:v8];

    [v6 setObject:0];
  }
}

- (void).cxx_destruct
{
}

@end