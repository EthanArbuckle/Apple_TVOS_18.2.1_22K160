@interface TVSettingsHomeKitCamerasViewController
- (NSArray)smartNotificationItems;
- (TVSettingsHomeKitCamerasViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setSmartNotificationItems:(id)a3;
@end

@implementation TVSettingsHomeKitCamerasViewController

- (TVSettingsHomeKitCamerasViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitCamerasViewController;
  v3 = -[TVSettingsHomeKitCamerasViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"cameraProfiles" options:0 context:off_1001E0610];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"cameraProfiles" context:off_1001E0610];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitCamerasViewController;
  -[TVSettingsHomeKitCamerasViewController dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001E0610 == a6)
  {
    -[TVSettingsHomeKitCamerasViewController reloadSettings](self, "reloadSettings", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitCamerasViewController;
    -[TVSettingsHomeKitCamerasViewController observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 cameraProfiles]);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v2 cameraProfiles]);
  id v39 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[v4 count] + 1));

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  v36 = v2;
  id obj = (id)objc_claimAutoreleasedReturnValue([v2 cameraProfiles]);
  id v40 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v46;
    do
    {
      v5 = 0LL;
      do
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(obj);
        }
        objc_super v6 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 4LL));
        uint64_t v8 = TSKLocString(@"HomeKitCamerasEnabledToggleTitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        uint64_t v10 = TSKLocString(@"SettingsON");
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        uint64_t v12 = TSKLocString(@"SettingsOFF");
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v9,  0LL,  v6,  @"controlCenterAndSiriEnabled",  v11,  v13));

        [v7 addObject:v14];
        id v15 = [v6 controlCenterAndSiriEnabled];
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        if ([v6 supportsDoorbellNotifications])
        {
          uint64_t v17 = TSKLocString(@"HomeKitDoorbellNotificationsTitle");
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v18,  0LL,  v6,  @"doorbellNotificationsEnabled",  0LL,  0LL));

          [v19 setEnabled:v15];
          [v19 setHidden:v15 ^ 1];
          [v7 addObject:v19];
          [v16 addObject:v19];
        }

        if ([v6 supportsSmartNotifications])
        {
          uint64_t v20 = TSKLocString(@"HomeKitActivityNotificationsTitle");
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          uint64_t v22 = TSKLocString(@"HomeKitActivityNotificationsDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_1000BFF18;
          v44[3] = &unk_10018EC30;
          v44[4] = v6;
          v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v21,  v23,  v6,  @"smartNotificationsState",  v44));

          v25 = (void *)objc_claimAutoreleasedReturnValue([v36 smartNotificationsShortFormatter]);
          [v24 setLocalizedValueFormatter:v25];

          [v24 setEnabled:v15];
          [v24 setHidden:v15 ^ 1];
          [v7 addObject:v24];
          [v35 addObject:v24];
          [v16 addObject:v24];
        }

        else if ([v6 supportsLegacyMotionNotifications])
        {
          uint64_t v26 = TSKLocString(@"HomeKitActivityNotificationsTitle");
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v27,  0LL,  v6,  @"legacyMotionNotificationsEnabled",  0LL,  0LL));

          [v28 setEnabled:v15];
          [v28 setHidden:v15 ^ 1];
          [v7 addObject:v28];
          [v16 addObject:v28];
        }

        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_1000BFF48;
        v41[3] = &unk_10018ED70;
        id v42 = v16;
        v43 = v6;
        id v29 = v16;
        [v14 setUpdateBlock:v41];
        v30 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v30,  v7));

        [v39 addObject:v31];
        v5 = (char *)v5 + 1;
      }

      while (v40 != v5);
      id v40 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }

    while (v40);
  }

  id v32 = [v35 copy];
  -[TVSettingsHomeKitCamerasViewController setSmartNotificationItems:](self, "setSmartNotificationItems:", v32);

  return v39;
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitCamerasViewController;
  -[TVSettingsHomeKitCamerasViewController editingController:didProvideValue:forSettingItem:]( &v23,  "editingController:didProvideValue:forSettingItem:",  a3,  v8,  v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitCamerasViewController smartNotificationItems](self, "smartNotificationItems"));
  unsigned int v11 = [v10 containsObject:v9];

  if (v11)
  {
    id v12 = [v8 unsignedIntegerValue];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
    v14 = v13;
    if (v12 == (id)1 && [v13 recordingDisabled])
    {
      uint64_t v15 = TSKLocString(@"HomeKitRecordingOffAlertTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = TSKLocString(@"HomeKitRecordingOffAlertMessage");
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v16,  v18,  1LL));

      uint64_t v20 = TSKLocString(@"HomeKitRecordingOffAlertButtonTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v21,  0LL,  0LL));
      [v19 addAction:v22];

      -[TVSettingsHomeKitCamerasViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v19,  1LL,  0LL);
    }
  }
}

- (NSArray)smartNotificationItems
{
  return self->_smartNotificationItems;
}

- (void)setSmartNotificationItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end