@interface TVSettingsSiriTCCController
- (id)facade;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
@end

@implementation TVSettingsSiriTCCController

- (id)facade
{
  return +[TVSettingsSiriAccessFacade sharedInstance](&OBJC_CLASS___TVSettingsSiriAccessFacade, "sharedInstance");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSiriTCCController facade](self, "facade"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v2,  @"infoArray",  &stru_100193600));
  uint64_t v4 = TSKLocString(@"SiriTCCGroupDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setLocalizedDescription:v5];

  v8 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v6;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsSiriTCCController;
  id v4 = -[TVSettingsSiriTCCController previewForItemAtIndexPath:](&v13, "previewForItemAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSiriTCCController facade](self, "facade"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 infoArray]);
    id v9 = [v8 count];

    if (!v9)
    {
      uint64_t v10 = TSKLocString(@"SiriTCCNoAppsDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      [v5 setDescriptionText:v11];
    }
  }

  return v5;
}

@end