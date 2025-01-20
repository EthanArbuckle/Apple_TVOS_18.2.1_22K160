@interface TVSettingsHomeKitActivityNotificationsViewController
- (TVSettingsHomeKitActivityNotificationsViewController)initWithCameraProfile:(id)a3;
- (TVSettingsHomeKitCameraProfile)cameraProfile;
- (id)alertTitleForEventType:(unint64_t)a3;
- (id)loadSettingGroups;
- (id)title;
- (void)_selectedItem:(id)a3;
- (void)_selectedTime:(id)a3;
- (void)_toggledSignificantEventType:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsHomeKitActivityNotificationsViewController

- (TVSettingsHomeKitActivityNotificationsViewController)initWithCameraProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitActivityNotificationsViewController;
  v6 = -[TVSettingsHomeKitActivityNotificationsViewController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cameraProfile, a3);
  }

  return v7;
}

- (id)title
{
  return (id)TSKLocString(@"HomeKitActivityNotificationsTitle");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitActivityNotificationsViewController;
  -[TVSettingsHomeKitActivityNotificationsViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[TVSettingsHomeKitCameraProfile addObserver:forKeyPath:options:context:]( self->_cameraProfile,  "addObserver:forKeyPath:options:context:",  self,  @"smartNotificationsState",  0LL,  off_1001DF870);
  -[TVSettingsHomeKitCameraProfile addObserver:forKeyPath:options:context:]( self->_cameraProfile,  "addObserver:forKeyPath:options:context:",  self,  @"significantEventTypes",  0LL,  off_1001DF878);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitActivityNotificationsViewController;
  -[TVSettingsHomeKitActivityNotificationsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVSettingsHomeKitCameraProfile removeObserver:forKeyPath:context:]( self->_cameraProfile,  "removeObserver:forKeyPath:context:",  self,  @"smartNotificationsState",  off_1001DF870);
  -[TVSettingsHomeKitCameraProfile removeObserver:forKeyPath:context:]( self->_cameraProfile,  "removeObserver:forKeyPath:context:",  self,  @"significantEventTypes",  off_1001DF878);
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitActivityNotificationsViewController cameraProfile](self, "cameraProfile"));
  objc_initWeak(&location, self);
  uint64_t v5 = TSKLocString(@"HomeKitMotionNotificationsSectionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000387EC;
  v34[3] = &unk_10018FEF0;
  id v7 = v3;
  id v35 = v7;
  objc_copyWeak(&v37, &location);
  id v8 = v4;
  id v36 = v8;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v6,  v7,  @"smartNotificationsOptions",  v34));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10003897C;
  v30[3] = &unk_10018FEF0;
  id v10 = v7;
  id v31 = v10;
  objc_copyWeak(&v33, &location);
  id v11 = v8;
  id v32 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v10,  @"significantEventTypes",  v30));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100038B10;
  v28[3] = &unk_10018E608;
  id v13 = v11;
  id v29 = v13;
  [v12 setUpdateBlock:v28];
  uint64_t v14 = TSKLocString(@"HomeKitMotionNotificationsTimeSectionTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100038B88;
  v24[3] = &unk_10018FF18;
  id v16 = v10;
  id v25 = v16;
  objc_copyWeak(&v27, &location);
  id v17 = v13;
  id v26 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v15,  v16,  @"times",  v24));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100038D18;
  v22[3] = &unk_10018E608;
  id v19 = v17;
  id v23 = v19;
  [v18 setUpdateBlock:v22];
  v39[0] = v9;
  v39[1] = v12;
  v39[2] = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 3LL));

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

  return v20;
}

- (void)_selectedItem:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  unint64_t v5 = (unint64_t)[v4 integerValue];

  id v22 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitActivityNotificationsViewController cameraProfile](self, "cameraProfile"));
  unsigned __int8 v6 = [v22 recordingDisabled];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v22 cameraItem]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 profile]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userSettings]);
  id v10 = [v9 recordingEventTriggers];

  if ((v5 | 2) != 3) {
    goto LABEL_8;
  }
  if ((v6 & 1) == 0)
  {
    if (v5 == 3 && v10 == (id)1)
    {
      id v11 = @"HomeKitSpecificMotionRecordingOffAlertMessage";
      v12 = @"HomeKitSpecificMotionRecordingOffAlertTitle";
      goto LABEL_7;
    }

- (void)_selectedTime:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  id v5 = [v4 integerValue];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitActivityNotificationsViewController cameraProfile](self, "cameraProfile"));
  [v6 setTriggerTime:v5];
}

- (void)_toggledSignificantEventType:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  unint64_t v5 = (unint64_t)[v4 unsignedIntegerValue];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitActivityNotificationsViewController cameraProfile](self, "cameraProfile"));
  unint64_t v7 = (unint64_t)[v6 significantEventTypes];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitActivityNotificationsViewController cameraProfile](self, "cameraProfile"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cameraItem]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 profile]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userSettings]);
  unint64_t v12 = (unint64_t)[v11 recordingEventTriggers];

  if ((v5 & ~v7) == 0 || (v12 & v5) == v5)
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitActivityNotificationsViewController cameraProfile](self, "cameraProfile"));
    [v19 toggledSignificantEventType:v5];
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeKitActivityNotificationsViewController alertTitleForEventType:]( self,  "alertTitleForEventType:",  v5));
    uint64_t v14 = TSKLocString(@"HomeKitRecordingOffAlertMessage");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v13,  v15,  1LL));

    uint64_t v16 = TSKLocString(@"HomeKitRecordingOffAlertButtonTitle");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v17,  0LL,  0LL));
    [v19 addAction:v18];

    -[TVSettingsHomeKitActivityNotificationsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v19,  1LL,  0LL);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DF870 == a6 || off_1001DF878 == a6)
  {
    -[TVSettingsHomeKitActivityNotificationsViewController reloadSettingsIfNeeded]( self,  "reloadSettingsIfNeeded",  a3,  a4,  a5);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitActivityNotificationsViewController;
    -[TVSettingsHomeKitActivityNotificationsViewController observeValueForKeyPath:ofObject:change:context:]( &v7,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)alertTitleForEventType:(unint64_t)a3
{
  *((void *)&v4 + 1) = a3;
  *(void *)&__int128 v4 = a3 - 2;
  unint64_t v3 = v4 >> 1;
  if (v3 <= 7 && ((0x8Bu >> v3) & 1) != 0)
  {
    uint64_t v6 = TSKLocString(off_10018FF38[v3]);
    unint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    unint64_t v5 = &stru_100195DD8;
  }

  return v5;
}

- (TVSettingsHomeKitCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void).cxx_destruct
{
}

@end