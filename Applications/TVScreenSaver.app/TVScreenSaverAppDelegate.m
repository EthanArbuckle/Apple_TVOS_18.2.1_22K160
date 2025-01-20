@interface TVScreenSaverAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)application:(id)a3 didDiscardSceneSessions:(id)a4;
- (void)applicationDidEnterBackground:(id)a3;
@end

@implementation TVScreenSaverAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = a4;
  id v6 = objc_alloc(&OBJC_CLASS___UISceneConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 role]);

  id v8 = [v6 initWithName:@"Default Configuration" sessionRole:v7];
  return v8;
}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  id v4 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v8);
        id v10 = [[UIDismissSceneAction alloc] initWithInfo:0 responder:0];
        v11 = (void *)objc_claimAutoreleasedReturnValue([v9 scene]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 _FBSScene]);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
        [v12 sendActions:v13];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }
}

@end