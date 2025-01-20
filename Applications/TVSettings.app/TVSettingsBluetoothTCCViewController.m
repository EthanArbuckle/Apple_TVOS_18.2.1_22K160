@interface TVSettingsBluetoothTCCViewController
- (id)facade;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
@end

@implementation TVSettingsBluetoothTCCViewController

- (id)facade
{
  return +[TVSettingsBluetoothPrivacyFacade whileUsingSharedInstance]( &OBJC_CLASS___TVSettingsBluetoothPrivacyFacade,  "whileUsingSharedInstance");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothTCCViewController facade](self, "facade"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v2,  @"infoArray",  &stru_100192098));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

  return v4;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsBluetoothTCCViewController;
  id v4 = -[TVSettingsBluetoothTCCViewController previewForItemAtIndexPath:](&v13, "previewForItemAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsBluetoothTCCViewController facade](self, "facade"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 infoArray]);
    id v9 = [v8 count];

    if (!v9)
    {
      uint64_t v10 = TSKLocString(@"BluetoothServiceDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      [v5 setDescriptionText:v11];
    }
  }

  return v5;
}

@end