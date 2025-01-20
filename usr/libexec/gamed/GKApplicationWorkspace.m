@interface GKApplicationWorkspace
- (BOOL)applicationIsInstalled:(id)a3;
- (id)availableGameIdentifiers;
- (id)availableGamesAndIdentifiers;
- (void)openSettings;
- (void)openURL:(id)a3;
@end

@implementation GKApplicationWorkspace

- (BOOL)applicationIsInstalled:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  unsigned __int8 v5 = [v4 applicationIsInstalled:v3];

  return v5;
}

- (id)availableGameIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004D434;
  v6[3] = &unk_10026DFB8;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateBundlesOfType:0 block:v6];

  return v4;
}

- (id)availableGamesAndIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004D63C;
  v6[3] = &unk_10026DFB8;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateBundlesOfType:4 block:v6];

  return v4;
}

- (void)openSettings
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=GAMECENTER"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)openURL:(id)a3
{
  id v3 = a3;
  uint64_t v11 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v12 = &__kCFBooleanTrue;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v10 = 0LL;
  [v5 openSensitiveURL:v3 withOptions:v4 error:&v10];
  id v6 = v10;

  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers(v7);
    }
    v9 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10004D8A8((uint64_t)v3, (uint64_t)v6, v9);
    }
  }
}

@end