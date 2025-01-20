@interface TVSettingsCameraTCCViewController
- (id)facade;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
@end

@implementation TVSettingsCameraTCCViewController

- (id)facade
{
  return +[TVSettingsCameraAccessFacade sharedInstance](&OBJC_CLASS___TVSettingsCameraAccessFacade, "sharedInstance");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCameraTCCViewController facade](self, "facade"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v2,  @"infoArray",  &stru_10018E700));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  return v4;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSettingsCameraTCCViewController;
  id v4 = -[TVSettingsCameraTCCViewController previewForItemAtIndexPath:](&v14, "previewForItemAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCameraTCCViewController facade](self, "facade"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 infoArray]);
    id v9 = [v8 count];

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v11 = TSKLocStringFromBundleCachingKey( @"CameraServiceDescription",  v10,  1LL,  0LL,  @"Localizable-Laguna");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      [v5 setDescriptionText:v12];
    }
  }

  return v5;
}

@end