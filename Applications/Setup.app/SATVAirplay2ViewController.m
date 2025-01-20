@interface SATVAirplay2ViewController
+ (id)_trimCustomRoomName:(id)a3;
- (BOOL)isInUpdateFlow;
- (BOOL)isProceedingToNextStep;
- (NSTimer)_loadingTimer;
- (SATVAirplay2DataSource)_dataSource;
- (SATVAirplay2ViewController)initWithTapToSetupHomeKitInfo:(id)a3;
- (TVSStateMachine)_dataSourceStateMachine;
- (UINavigationController)_childNavigationController;
- (id)_makeHomePickerViewController;
- (id)_makeLoadingViewController;
- (id)_makePickerViewControllers;
- (id)_makeRoomPickerViewControllerForHome:(id)a3;
- (id)_textEntryCompletionHandler;
- (id)completionHandler;
- (id)preferredFocusEnvironments;
- (void)_loadingTimerFired;
- (void)_moveOrAddLocalAccessoryToRoomNamed:(id)a3 inHome:(id)a4;
- (void)_postDataSourceReadyStateDidChangeEvent;
- (void)_presentCreateRoomFailedViewControllerWithError:(id)a3;
- (void)_saveHomeTheaterSpeaker:(id)a3;
- (void)_saveRoomName:(id)a3 inHomeNamed:(id)a4;
- (void)_scheduleLoadingTimer;
- (void)_sendCompletionWithDidSetupHomeTheater:(BOOL)a3;
- (void)_setChildNavigationController:(id)a3;
- (void)_setLoadingTimer:(id)a3;
- (void)_setTextEntryCompletionHandler:(id)a3;
- (void)_showHomeTheaterSpeakerPickerIfRequiredForRoomNamed:(id)a3 inHome:(id)a4;
- (void)_showLoadingViewController;
- (void)_showPickerViewControllers;
- (void)_updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:(id)a3;
- (void)airplay2DataSourceDidUpdate:(id)a3;
- (void)airplay2HomePodPickerViewControllerWillDisappear;
- (void)didEnterStateBackwards;
- (void)homePickerViewController:(id)a3 didSelectHome:(id)a4;
- (void)roomPickerViewController:(id)a3 didSelectExistingRoom:(id)a4;
- (void)roomPickerViewController:(id)a3 didSelectSuggestedRoom:(id)a4;
- (void)roomPickerViewControllerHomeHasBeenRemoved:(id)a3;
- (void)roomPickerViewControllerWantsNewRoomViewController:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setProceedingToNextStep:(BOOL)a3;
- (void)setUpdateFlow:(BOOL)a3;
- (void)textEntryViewController:(id)a3 didEnterText:(id)a4;
- (void)textEntryViewController:(id)a3 textDidChange:(id)a4;
- (void)textEntryViewControllerDidCancel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SATVAirplay2ViewController

- (SATVAirplay2ViewController)initWithTapToSetupHomeKitInfo:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SATVAirplay2ViewController;
  v5 = -[SATVAirplay2ViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    if (v4
      && (v6 = (void *)objc_claimAutoreleasedReturnValue([v4 homes]),
          id v7 = [v6 count],
          v6,
          v7))
    {
      id v8 = sub_10002B004();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18[0] = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Will Use TapToSetupDataSource. TTSUHomeKitInfo=%@",  buf,  0xCu);
      }

      v10 = -[SATVAirplay2TapToSetupDataSource initWithHomeKitInfo:]( objc_alloc(&OBJC_CLASS___SATVAirplay2TapToSetupDataSource),  "initWithHomeKitInfo:",  v4);
    }

    else
    {
      id v11 = sub_10002B004();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v13 = +[SATVAirplay2HomeKitDataSource isHomeKitAvailable]( &OBJC_CLASS___SATVAirplay2HomeKitDataSource,  "isHomeKitAvailable");
        *(_DWORD *)buf = 67109378;
        LODWORD(v18[0]) = v13;
        WORD2(v18[0]) = 2112;
        *(void *)((char *)v18 + 6) = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Will Use HomeKitDataSource. isHomeKitAvailable=%{BOOL}d, TTSUHomeKitInfo=%@",  buf,  0x12u);
      }

      v10 = objc_alloc_init(&OBJC_CLASS___SATVAirplay2HomeKitDataSource);
    }

    dataSource = v5->_dataSource;
    v5->_dataSource = (SATVAirplay2DataSource *)v10;
  }

  return v5;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVAirplay2ViewController;
  -[SATVAirplay2ViewController viewDidLoad](&v7, "viewDidLoad");
  -[SATVAirplay2ViewController setProceedingToNextStep:](self, "setProceedingToNextStep:", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSource](self, "_dataSource"));
  [v3 addObserver:self];

  id v4 = objc_alloc(&OBJC_CLASS___UINavigationController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _makeLoadingViewController](self, "_makeLoadingViewController"));
  v6 = -[UINavigationController initWithRootViewController:](v4, "initWithRootViewController:", v5);

  -[SATVAirplay2ViewController _setChildNavigationController:](self, "_setChildNavigationController:", v6);
  -[SATVAirplay2ViewController tvsk_addChildViewController:](self, "tvsk_addChildViewController:", v6);
  -[SATVAirplay2ViewController _postDataSourceReadyStateDidChangeEvent](self, "_postDataSourceReadyStateDidChangeEvent");
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVAirplay2ViewController;
  -[SATVAirplay2ViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATVAirplay2ViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  11LL,  10LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVAirplay2ViewController;
  -[SATVAirplay2ViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SATVAirplay2ViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _childNavigationController](self, "_childNavigationController"));
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    objc_super v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)didEnterStateBackwards
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSourceStateMachine](self, "_dataSourceStateMachine"));
  [v2 postEvent:@"DidEnterBackwards"];
}

- (id)_makePickerViewControllers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSource](self, "_dataSource"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 homes]);
  id v5 = [v4 count];
  id v6 = sub_10002B004();
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SATVAirplay2ViewController _makePickerViewControllers]";
    __int16 v28 = 2048;
    id v29 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Begin make picker view controllers. number of homes: %lu",  buf,  0x16u);
  }

  if (v5 == (id)1)
  {
    id v12 = sub_10002B004();
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SATVAirplay2ViewController _makePickerViewControllers]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: A single home is available for the data source. Making a room picker for that home.",  buf,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAirplay2ViewController _makeRoomPickerViewControllerForHome:]( self,  "_makeRoomPickerViewControllerForHome:",  v14));

    v24 = v10;
    id v11 = &v24;
    goto LABEL_11;
  }

  if (!v5)
  {
    id v8 = sub_10002B004();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SATVAirplay2ViewController _makePickerViewControllers]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: No homes are available from the data source. Making suggested room picker.",  buf,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAirplay2ViewController _makeRoomPickerViewControllerForHome:]( self,  "_makeRoomPickerViewControllerForHome:",  0LL));
    v25 = v10;
    id v11 = &v25;
LABEL_11:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 1LL));
    goto LABEL_20;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _makeHomePickerViewController](self, "_makeHomePickerViewController"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredHome]);
  id v17 = sub_10002B004();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v19)
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SATVAirplay2ViewController _makePickerViewControllers]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Found multiple homes and a preferred home name. Making a home picker and a room picker",  buf,  0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue( -[SATVAirplay2ViewController _makeRoomPickerViewControllerForHome:]( self,  "_makeRoomPickerViewControllerForHome:",  v16));
    v23[0] = v10;
    v23[1] = v20;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
  }

  else
  {
    if (v19)
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[SATVAirplay2ViewController _makePickerViewControllers]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Found multiple homes with no preferred home name. Making a home picker.",  buf,  0xCu);
    }

    v22 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  }

LABEL_20:
  return v15;
}

- (id)_makeHomePickerViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVHeaderView);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v3, "titleLabel"));
  id v5 = sub_10000D7CC(@"WHA_ROOM_PICKER_TITLE", @"Localizable");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 setText:v6];

  objc_super v7 = objc_alloc(&OBJC_CLASS___SATVAirplay2HomePickerViewController);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSource](self, "_dataSource"));
  v9 = -[SATVAirplay2HomePickerViewController initWithDataSource:](v7, "initWithDataSource:", v8);

  -[SATVAirplay2HomePickerViewController setDelegate:](v9, "setDelegate:", self);
  -[SATVPreviewTableViewController setBannerView:](v9, "setBannerView:", v3);
  -[SATVTableViewController setMaxBannerViewWidth:](v9, "setMaxBannerViewWidth:", 900.0);
  -[SATVTableViewController setCustomContentTopInset:](v9, "setCustomContentTopInset:", 127.0);

  return v9;
}

- (id)_makeRoomPickerViewControllerForHome:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SATVHeaderView);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v5, "titleLabel"));
  id v7 = sub_10000D7CC(@"WHA_ROOM_PICKER_TITLE", @"Localizable");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 setText:v8];

  v9 = objc_alloc(&OBJC_CLASS___SATVAirplay2RoomPickerViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSource](self, "_dataSource"));
  id v11 = -[SATVAirplay2RoomPickerViewController initWithDataSource:home:](v9, "initWithDataSource:home:", v10, v4);

  -[SATVAirplay2RoomPickerViewController setDelegate:](v11, "setDelegate:", self);
  -[SATVPreviewTableViewController setBannerView:](v11, "setBannerView:", v5);
  -[SATVTableViewController setMaxBannerViewWidth:](v11, "setMaxBannerViewWidth:", 900.0);
  -[SATVTableViewController setCustomContentTopInset:](v11, "setCustomContentTopInset:", 127.0);

  return v11;
}

- (id)_makeLoadingViewController
{
  id v2 = objc_alloc_init(&OBJC_CLASS___SATVHeaderView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v2, "titleLabel"));
  id v4 = sub_10000D7CC(@"WHA_ROOM_PICKER_TITLE", @"Localizable");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setText:v5];

  id v6 = objc_alloc_init(&OBJC_CLASS___SATVAirplay2LoadingViewController);
  -[SATVPreviewTableViewController setBannerView:](v6, "setBannerView:", v2);
  -[SATVTableViewController setMaxBannerViewWidth:](v6, "setMaxBannerViewWidth:", 900.0);
  -[SATVTableViewController setCustomContentTopInset:](v6, "setCustomContentTopInset:", 127.0);

  return v6;
}

- (void)_sendCompletionWithDidSetupHomeTheater:(BOOL)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController completionHandler](self, "completionHandler"));
  id v5 = (void *)v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10004B2C4;
    v6[3] = &unk_1000C98E8;
    v6[4] = v4;
    BOOL v7 = a3;
    dispatch_async(&_dispatch_main_q, v6);
  }
}

- (void)_saveRoomName:(id)a3 inHomeNamed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10002B004();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    v14 = "-[SATVAirplay2ViewController _saveRoomName:inHomeNamed:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Saving selected room & home name to user defaults. room=%@, home=%@",  (uint8_t *)&v13,  0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  objc_msgSend(v10, "pbs_setBuddySelectedHomeName:", v7);
  objc_msgSend(v10, "pbs_setBuddySelectedRoomName:", v6);
  if (!-[SATVAirplay2ViewController isInUpdateFlow](self, "isInUpdateFlow"))
  {
    id v11 = sub_10002B004();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[SATVAirplay2ViewController _saveRoomName:inHomeNamed:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: In out of box flow. Setting device name.",  (uint8_t *)&v13,  0xCu);
    }

    +[TVCSLockdownUtilities setDeviceName:](&OBJC_CLASS___TVCSLockdownUtilities, "setDeviceName:", v6);
  }
}

- (void)_saveHomeTheaterSpeaker:(id)a3
{
  id v3 = a3;
  id v4 = sub_10002B004();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
    int v12 = 136315650;
    int v13 = "-[SATVAirplay2ViewController _saveHomeTheaterSpeaker:]";
    __int16 v14 = 2112;
    __int16 v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Saving selected speaker identifier & type to user defaults. uniqueIdentifier=%@, type=%@",  (uint8_t *)&v12,  0x20u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);
  objc_msgSend(v8, "pbs_setBuddySelectedHomeTheaterSpeakerIdentifier:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
  objc_msgSend(v8, "pbs_setBuddySelectedHomeTheaterSpeakerType:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 homePodVariant]));
  objc_msgSend(v8, "pbs_setBuddySelectedHomeTheaterHomePodVariant:", v11);
}

- (void)_showHomeTheaterSpeakerPickerIfRequiredForRoomNamed:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = MGGetBoolAnswer(@"YgC2TeHCEwzJ/ixqmNCzwQ");
  if (!v7)
  {
    v10 = 0LL;
LABEL_8:
    int v13 = 0LL;
    if (!v8) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSource](self, "_dataSource"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 roomWithName:v6 inHome:v7]);

  if (!v10) {
    goto LABEL_8;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSource](self, "_dataSource"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 homeTheaterSpeakersInRoom:v10 inHome:v7]);

  int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bs_filter:", &stru_1000CA6C8));
  id v14 = sub_10002B004();
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v32 = "-[SATVAirplay2ViewController _showHomeTheaterSpeakerPickerIfRequiredForRoomNamed:inHome:]";
    __int16 v33 = 2112;
    v34 = v10;
    __int16 v35 = 2112;
    *(void *)v36 = v12;
    *(_WORD *)&v36[8] = 2112;
    *(void *)v37 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Found home theater speakers in room. room=%@, allHomeTheaterSpeakersInRoom=%@, homeTheaterSpeakersInRoom=%@",  buf,  0x2Au);
  }

  if (v8)
  {
LABEL_9:
    if ([v13 count]) {
      int v8 = _os_feature_enabled_impl("Home", "cce7c4ecef404121ae8971");
    }
    else {
      int v8 = 0;
    }
  }

- (void)_updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:(id)a3
{
  id v6 = a3;
  -[SATVAirplay2ViewController _saveHomeTheaterSpeaker:](self, "_saveHomeTheaterSpeaker:");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSource](self, "_dataSource"));
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___SATVAirplay2DataSourceUpdating])
  {
    id v5 = v4;
  }

  -[SATVAirplay2ViewController _sendCompletionWithDidSetupHomeTheater:]( self,  "_sendCompletionWithDidSetupHomeTheater:",  v6 != 0LL);
}

- (void)_moveOrAddLocalAccessoryToRoomNamed:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  -[SATVAirplay2ViewController _saveRoomName:inHomeNamed:](self, "_saveRoomName:inHomeNamed:", v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSource](self, "_dataSource"));
  id v10 = v9;
  if (![v10 isUpdatingAvailable])
  {

LABEL_5:
    -[SATVAirplay2ViewController _showHomeTheaterSpeakerPickerIfRequiredForRoomNamed:inHome:]( self,  "_showHomeTheaterSpeakerPickerIfRequiredForRoomNamed:inHome:",  v6,  v7);
    goto LABEL_6;
  }

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004BC80;
  v11[3] = &unk_1000CA718;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  [v10 moveOrAddLocalAccessoryToRoomNamed:v12 inHome:v13 completionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

LABEL_6:
}

- (TVSStateMachine)_dataSourceStateMachine
{
  dataSourceStateMachine = self->_dataSourceStateMachine;
  if (!dataSourceStateMachine)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
    id v5 = (objc_class *)objc_opt_class(self);
    id v6 = NSStringFromClass(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10004C090;
    v27[3] = &unk_1000CA740;
    objc_copyWeak(&v28, &location);
    int v8 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v4,  "initWithName:initialState:mode:stateChangeHandler:",  v7,  @"Initial",  0LL,  v27);
    v9 = self->_dataSourceStateMachine;
    self->_dataSourceStateMachine = v8;

    id v10 = self->_dataSourceStateMachine;
    id v11 = sub_10002B004();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[TVSStateMachine setLogObject:](v10, "setLogObject:", v12);

    id v13 = self->_dataSourceStateMachine;
    v30[0] = @"Initial";
    v30[1] = @"Loading";
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10004C110;
    v25[3] = &unk_1000CA3C0;
    objc_copyWeak(&v26, &location);
    -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v13,  "registerHandlerForEvent:onStates:withBlock:",  @"DataSourceReadyStateDidChange",  v14,  v25);

    -[TVSStateMachine registerStateTransitionFromState:onEvent:toState:]( self->_dataSourceStateMachine,  "registerStateTransitionFromState:onEvent:toState:",  @"Initial",  @"LoadingTimerFired",  @"Ready");
    -[TVSStateMachine registerStateTransitionFromState:onEvent:toState:]( self->_dataSourceStateMachine,  "registerStateTransitionFromState:onEvent:toState:",  @"Loading",  @"LoadingTimerFired",  @"Ready");
    __int16 v15 = self->_dataSourceStateMachine;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    void v23[2] = sub_10004C208;
    v23[3] = &unk_1000CA3C0;
    objc_copyWeak(&v24, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v15,  "registerHandlerForEvent:onState:withBlock:",  @"DataSourceDidUpdate",  @"Ready",  v23);
    id v16 = self->_dataSourceStateMachine;
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    int v20 = sub_10004C274;
    id v21 = &unk_1000CA3C0;
    objc_copyWeak(&v22, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v16,  "registerHandlerForEvent:onState:withBlock:",  @"DidEnterBackwards",  @"Ready",  &v18);
    -[TVSStateMachine setShouldAcceptEvents:]( self->_dataSourceStateMachine,  "setShouldAcceptEvents:",  1LL,  v18,  v19,  v20,  v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    dataSourceStateMachine = self->_dataSourceStateMachine;
  }

  return dataSourceStateMachine;
}

- (void)_setLoadingTimer:(id)a3
{
  id v4 = (NSTimer *)a3;
  -[NSTimer invalidate](self->_loadingTimer, "invalidate");
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = v4;
}

- (void)_showLoadingViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _childNavigationController](self, "_childNavigationController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 viewControllers]);
  id v5 = [v4 count];

  if (!v5)
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472LL;
    activity_block[2] = sub_10004C390;
    activity_block[3] = &unk_1000C9468;
    activity_block[4] = self;
    _os_activity_initiate( (void *)&_mh_execute_header,  "show loading view controller",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
  }

- (void)_showPickerViewControllers
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10004C4A8;
  activity_block[3] = &unk_1000C9468;
  activity_block[4] = self;
  _os_activity_initiate( (void *)&_mh_execute_header,  "show picker view controller",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
}

- (void)_loadingTimerFired
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10004C564;
  activity_block[3] = &unk_1000C9468;
  activity_block[4] = self;
  _os_activity_initiate((void *)&_mh_execute_header, "loading timer fired", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)_scheduleLoadingTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _loadingTimer](self, "_loadingTimer"));

  if (!v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_loadingTimerFired",  0LL,  0LL,  5.0));
    -[SATVAirplay2ViewController _setLoadingTimer:](self, "_setLoadingTimer:", v4);
  }

- (void)_postDataSourceReadyStateDidChangeEvent
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10004C684;
  activity_block[3] = &unk_1000C9468;
  activity_block[4] = self;
  _os_activity_initiate( (void *)&_mh_execute_header,  "Data source ready state did change",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
}

- (void)_presentCreateRoomFailedViewControllerWithError:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue([a3 localizedDescription]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  0LL,  1LL));
  id v5 = sub_10000D7CC(@"OK", @"Localizable");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  1LL,  0LL));
  [v4 addAction:v7];

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController navigationController](self, "navigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topViewController]);
  [v9 presentViewController:v4 animated:1 completion:0];
}

+ (id)_trimCustomRoomName:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);

  return v5;
}

- (void)airplay2DataSourceDidUpdate:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _dataSourceStateMachine](self, "_dataSourceStateMachine", a3));
  [v3 postEvent:@"DataSourceDidUpdate"];
}

- (void)homePickerViewController:(id)a3 didSelectHome:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10004C8F8;
  activity_block[3] = &unk_1000C9A70;
  id v10 = a4;
  id v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = v10;
  _os_activity_initiate((void *)&_mh_execute_header, "did select home", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)roomPickerViewController:(id)a3 didSelectExistingRoom:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10004CA9C;
  activity_block[3] = &unk_1000C9A70;
  id v10 = a4;
  id v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = v10;
  _os_activity_initiate( (void *)&_mh_execute_header,  "did select existing room",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
}

- (void)roomPickerViewController:(id)a3 didSelectSuggestedRoom:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10004CC4C;
  activity_block[3] = &unk_1000C9A70;
  id v10 = a4;
  id v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = v10;
  _os_activity_initiate( (void *)&_mh_execute_header,  "did select suggested room",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
}

- (void)roomPickerViewControllerWantsNewRoomViewController:(id)a3
{
  id v4 = a3;
  id v5 = sub_10002B004();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[SATVAirplay2ViewController roomPickerViewControllerWantsNewRoomViewController:]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Room picker wants new room view controller.",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_10004CF6C;
  uint64_t v19 = &unk_1000CA768;
  objc_copyWeak(&v21, (id *)buf);
  id v7 = v4;
  id v20 = v7;
  -[SATVAirplay2ViewController _setTextEntryCompletionHandler:](self, "_setTextEntryCompletionHandler:", &v16);
  id v8 = objc_alloc_init(&OBJC_CLASS___SATVTextEntryViewController);
  -[SATVTextEntryViewController setDelegate:](v8, "setDelegate:", self, v16, v17, v18, v19);
  id v9 = sub_10000D7CC(@"WHA_NEW_ROOM_ENTRY_TITLE", @"Localizable");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[SATVTextEntryViewController setTextFieldTitle:](v8, "setTextFieldTitle:", v10);

  id v11 = sub_10000D7CC(@"WHA_NEW_ROOM_ENTRY_SUBTITLE", @"Localizable");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[SATVTextEntryViewController setTextFieldSubtitle:](v8, "setTextFieldSubtitle:", v12);

  id v13 = sub_10000D7CC(@"CONTINUE_BUTTON", @"Localizable");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[SATVTextEntryViewController setContinueButtonText:](v8, "setContinueButtonText:", v14);

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController navigationController](self, "navigationController"));
  [v15 pushViewController:v8 animated:1];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)roomPickerViewControllerHomeHasBeenRemoved:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _childNavigationController](self, "_childNavigationController", a3));
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)textEntryViewControllerDidCancel:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController navigationController](self, "navigationController", a3));
  id v5 = [v4 popToViewController:self animated:1];

  -[SATVAirplay2ViewController _setTextEntryCompletionHandler:](self, "_setTextEntryCompletionHandler:", 0LL);
}

- (void)textEntryViewController:(id)a3 textDidChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class(self) _trimCustomRoomName:v6];
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v7, "setContinueButtonEnabled:", objc_msgSend(v9, "length") != 0);
  [v7 setNeedsFocusUpdate];
}

- (void)textEntryViewController:(id)a3 didEnterText:(id)a4
{
  id v5 = a4;
  id v6 = [(id)objc_opt_class(self) _trimCustomRoomName:v5];
  id v8 = (id)objc_claimAutoreleasedReturnValue(v6);

  id v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[SATVAirplay2ViewController _textEntryCompletionHandler]( self,  "_textEntryCompletionHandler"));
  ((void (**)(void, id))v7)[2](v7, v8);
}

- (void)airplay2HomePodPickerViewControllerWillDisappear
{
  if (-[SATVAirplay2ViewController isProceedingToNextStep](self, "isProceedingToNextStep")) {
    -[SATVAirplay2ViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL);
  }
  else {
    -[SATVAirplay2ViewController setAnimationStateForType:inResource:]( self,  "setAnimationStateForType:inResource:",  11LL,  10LL);
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UINavigationController)_childNavigationController
{
  return self->_childNavigationController;
}

- (void)_setChildNavigationController:(id)a3
{
}

- (BOOL)isInUpdateFlow
{
  return self->_updateFlow;
}

- (void)setUpdateFlow:(BOOL)a3
{
  self->_updateFlow = a3;
}

- (id)_textEntryCompletionHandler
{
  return self->_textEntryCompletionHandler;
}

- (void)_setTextEntryCompletionHandler:(id)a3
{
}

- (NSTimer)_loadingTimer
{
  return self->_loadingTimer;
}

- (SATVAirplay2DataSource)_dataSource
{
  return self->_dataSource;
}

- (BOOL)isProceedingToNextStep
{
  return self->_proceedingToNextStep;
}

- (void)setProceedingToNextStep:(BOOL)a3
{
  self->_proceedingToNextStep = a3;
}

- (void).cxx_destruct
{
}

@end