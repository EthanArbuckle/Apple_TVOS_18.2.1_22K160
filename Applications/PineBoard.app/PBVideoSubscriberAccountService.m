@interface PBVideoSubscriberAccountService
+ (id)_purchasesForAppInstallMetadata:(id)a3 additionalInstalls:(id)a4;
+ (void)_setInstallPosition:(id)a3 forApplicationIdentifier:(id)a4;
- (void)installAppWithMetadata:(id)a3;
- (void)invalidate;
@end

@implementation PBVideoSubscriberAccountService

- (void)invalidate
{
  id v3 = sub_100084860();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "videoSubscriberAccountService invalidated %@",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)installAppWithMetadata:(id)a3
{
  id v4 = a3;
  id v5 = sub_100084860();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "installAppWithMetadata (service) will install app with metadata %@",  (uint8_t *)&v18,  0xCu);
  }

  id v7 = [[PBSVideoSubscriberAccountApplicationInstallMetadata alloc] initWithDictionary:v4];
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 installPosition]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  [v8 _setInstallPosition:v9 forApplicationIdentifier:v10];

  v11 = (void *)objc_opt_class(self);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 additionalInstalls]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _purchasesForAppInstallMetadata:v7 additionalInstalls:v12]);

  if ([v13 count])
  {
    id v14 = [[ASDPurchaseRequestOptions alloc] initWithPurchases:v13];
    id v15 = [[ASDPurchaseRequest alloc] initWithOptions:v14];
    id v16 = sub_100084860();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "installAppWithMetadata (service) will start request %@",  (uint8_t *)&v18,  0xCu);
    }

    [v15 startWithCompletionBlock:&stru_1003D8B18];
  }
}

+ (void)_setInstallPosition:(id)a3 forApplicationIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    CFPreferencesSetAppValue(@"VSProviderAppBundleID", v6, @"com.apple.HeadBoard");
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if (v5)
  {
LABEL_5:
    CFPreferencesSetAppValue(@"VSProviderAppInstallPosition", v5, @"com.apple.HeadBoard");
LABEL_6:
    CFPreferencesAppSynchronize(@"com.apple.HeadBoard");
  }
}

+ (id)_purchasesForAppInstallMetadata:(id)a3 additionalInstalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[v6 count] + 1));
  id v8 = sub_100137AA4(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "bs_safeAddObject:", v9);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = sub_100137AA4(*(void **)(*((void *)&v18 + 1) + 8LL * (void)v14));
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(v7, "bs_safeAddObject:", v16, (void)v18);

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  return v7;
}

@end