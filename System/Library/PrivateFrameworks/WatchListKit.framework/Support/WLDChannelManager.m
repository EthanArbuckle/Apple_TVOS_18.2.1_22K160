@interface WLDChannelManager
+ (id)defaultChannelManager;
- (void)vppaConsentedBundleIDsWithCompletion:(id)a3;
@end

@implementation WLDChannelManager

+ (id)defaultChannelManager
{
  if (defaultChannelManager_token != -1) {
    dispatch_once(&defaultChannelManager_token, &__block_literal_global_7);
  }
  return (id)defaultChannelManager_defaultChannelManager;
}

void __42__WLDChannelManager_defaultChannelManager__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___WLDChannelManager);
  v2 = (void *)defaultChannelManager_defaultChannelManager;
  defaultChannelManager_defaultChannelManager = (uint64_t)v1;
}

- (void)vppaConsentedBundleIDsWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 consentedBrands]);

  if (![v5 count])
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __58__WLDChannelManager_vppaConsentedBundleIDsWithCompletion___block_invoke;
    v20[3] = &unk_10003D480;
    dispatch_semaphore_t v21 = v6;
    v8 = v6;
    [v7 refreshWithCompletion:v20];

    dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
    dispatch_semaphore_wait(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 consentedBrands]);

    v5 = (void *)v11;
  }

  if (v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
    NSLog(@"Consented Channel IDs: %@", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[WLKChannelUtilities sharedInstance](&OBJC_CLASS___WLKChannelUtilities, "sharedInstance"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = __58__WLDChannelManager_vppaConsentedBundleIDsWithCompletion___block_invoke_2;
    v17[3] = &unk_10003CE38;
    v18 = v12;
    id v19 = v3;
    v14 = v12;
    [v13 loadIfNeededWithCompletion:v17];

    v15 = v18;
  }

  else
  {
    v14 = objc_alloc_init(&OBJC_CLASS___NSSet);
    uint64_t v16 = WLKError(-1LL, 0LL, @"Consented brands not found");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, NSSet *, void *))v3 + 2))(v3, v14, v15);
  }
}

uint64_t __58__WLDChannelManager_vppaConsentedBundleIDsWithCompletion___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __58__WLDChannelManager_vppaConsentedBundleIDsWithCompletion___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v15 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSSet);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = *(id *)(a1 + 32);
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      dispatch_time_t v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[WLKChannelUtilities sharedInstance](&OBJC_CLASS___WLKChannelUtilities, "sharedInstance"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 channelForID:v10]);

        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 appBundleIDs]);
        if (v13)
        {
          uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSSet setByAddingObjectsFromArray:](v4, "setByAddingObjectsFromArray:", v13));

          v4 = (NSSet *)v14;
        }

        dispatch_time_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  NSLog(@"Consented Bundle IDs: %@", v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

@end