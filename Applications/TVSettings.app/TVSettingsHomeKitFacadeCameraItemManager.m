@interface TVSettingsHomeKitFacadeCameraItemManager
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_homeFuture;
@end

@implementation TVSettingsHomeKitFacadeCameraItemManager

- (id)_homeFuture
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localAccessory]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localAccessory]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 home]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hmHome]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](&OBJC_CLASS___NAFuture, "futureWithResult:", v8));

    return v9;
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitFacadeCameraItemManager;
    id v11 = -[TVSettingsHomeKitFacadeCameraItemManager _homeFuture](&v12, "_homeFuture");
    return (id)objc_claimAutoreleasedReturnValue(v11);
  }

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  id v5 = [[HFHomeItem alloc] initWithHome:v4];
  -[TVSettingsHomeKitFacadeCameraItemManager setSourceItem:](self, "setSourceItem:", v5);

  id v6 = [[HFCameraItemProvider alloc] initWithHome:v4];
  id v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v7;
}

@end