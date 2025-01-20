@interface PBSAppInfo
- (BOOL)tvset_supportsBackgroundAppRefresh;
- (LSApplicationRecord)tvset_applicationRecord;
- (NSURL)tvset_dataContainerURL;
@end

@implementation PBSAppInfo

- (BOOL)tvset_supportsBackgroundAppRefresh
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSAppInfo tvset_applicationRecord](self, "tvset_applicationRecord"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UIBackgroundModes", 0));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (([v8 isEqualToString:@"remote-notification"] & 1) != 0
          || ([v8 isEqualToString:@"fetch"] & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

- (LSApplicationRecord)tvset_applicationRecord
{
  v3 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSAppInfo bundleIdentifier](self, "bundleIdentifier"));
  id v5 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v3,  "initWithBundleIdentifier:allowPlaceholder:error:",  v4,  1LL,  0LL);

  return v5;
}

- (NSURL)tvset_dataContainerURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSAppInfo tvset_applicationRecord](self, "tvset_applicationRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataContainerURL]);

  return (NSURL *)v3;
}

@end