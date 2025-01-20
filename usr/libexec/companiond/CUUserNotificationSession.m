@interface CUUserNotificationSession
+ (id)cad_sessionWithContent:(id)a3;
@end

@implementation CUUserNotificationSession

+ (id)cad_sessionWithContent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  [v5 setBundleID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 categoryIdentifier]);
  [v5 setCategoryID:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v5 setIdentifier:v8];

  objc_msgSend(v5, "setFlags:", objc_msgSend(v4, "flags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 iconSystemName]);
  [v5 setIconSystemName:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 iconName]);
  [v5 setIconName:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 titleKey]);
  [v5 setTitleKey:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 titleArguments]);
  [v5 setTitleArguments:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 bodyKey]);
  [v5 setBodyKey:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 bodyArguments]);
  [v5 setBodyArguments:v14];

  return v5;
}

@end