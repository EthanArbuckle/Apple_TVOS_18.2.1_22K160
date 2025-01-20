@interface FBUpdateSceneTransaction
+ (id)pb_updateSceneTransactionWithScene:(id)a3 foreground:(BOOL)a4;
@end

@implementation FBUpdateSceneTransaction

+ (id)pb_updateSceneTransactionWithScene:(id)a3 foreground:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
  id v7 = [v6 mutableCopy];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 definition]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 specification]);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(v11, "settingsClass"), "settings"));
    id v9 = [v12 mutableCopy];
  }

  [v9 setForeground:v4];
  [v9 setInterfaceOrientation:1];
  if ([v9 isUISubclass])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemAppearanceManager sharedInstance]( &OBJC_CLASS___PBSystemAppearanceManager,  "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcess]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
    objc_msgSend( v9,  "setUserInterfaceStyle:",  objc_msgSend(v13, "effectiveUserInterfaceStyleForBundleIdentifier:", v15));
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 clientSettings]);
  id v17 = [v16 mutableCopy];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v5 definition]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 specification]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(v21, "clientSettingsClass"), "settings"));
    id v19 = [v22 mutableCopy];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v5 definition]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 specification]);
  v25 = v24;
  if (v24) {
    id v26 = v24;
  }
  else {
    id v26 = (id)objc_claimAutoreleasedReturnValue( +[UIApplicationSceneSpecification specification]( &OBJC_CLASS___UIApplicationSceneSpecification,  "specification"));
  }
  v27 = v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[FBSMutableSceneParameters parametersForSpecification:]( &OBJC_CLASS___FBSMutableSceneParameters,  "parametersForSpecification:",  v27));
  [v28 setSettings:v9];
  [v28 setClientSettings:v19];
  id v29 = objc_alloc(&OBJC_CLASS___FBUpdateSceneTransaction);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v5 clientProcess]);
  id v32 = [v29 initWithSceneIdentifier:v30 process:v31 parameters:v28 transitionContext:0];

  [v32 setWaitsForSceneCommit:v4];
  return v32;
}

@end