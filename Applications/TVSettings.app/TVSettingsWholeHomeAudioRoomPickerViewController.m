@interface TVSettingsWholeHomeAudioRoomPickerViewController
- (TVSettingsWholeHomeAudioRoomDataSource)dataSource;
- (TVSettingsWholeHomeAudioRoomPickerViewController)initWithHome:(id)a3;
- (TVSettingsWholeHomeAudioRoomPickerViewControllerDelegate)delegate;
- (id)_makeAddNewRoomViewController;
- (id)loadSettingGroups;
- (void)__moveOrAddLocalAccessoryToRoom:(id)a3 inHome:(id)a4;
- (void)__moveOrAddLocalAccessoryToRoomWithName:(id)a3 inHome:(id)a4;
- (void)__removeLocalAccessoryFromHome;
- (void)_didSelectExistingRoomItem:(id)a3;
- (void)_didSelectSuggestedRoomItem:(id)a3;
- (void)_moveOrAddLocalAccessoryToRoom:(id)a3 inHome:(id)a4;
- (void)_moveOrAddLocalAccessoryToRoomWithName:(id)a3 inHome:(id)a4;
- (void)_presentCreateRoomFailedViewControllerWithError:(id)a3;
- (void)_removeLocalAccessoryFromHome;
- (void)_showAccessoryRemoveFailed;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)setDelegate:(id)a3;
- (void)wholeHomeAudioRoomDataSourceHomeWasRemoved:(id)a3;
@end

@implementation TVSettingsWholeHomeAudioRoomPickerViewController

- (TVSettingsWholeHomeAudioRoomPickerViewController)initWithHome:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioRoomPickerViewController;
  v5 = -[TVSettingsWholeHomeAudioRoomPickerViewController initWithStyle:](&v11, "initWithStyle:", 1LL);
  if (v5)
  {
    v6 = -[TVSettingsWholeHomeAudioRoomDataSource initWithHome:]( objc_alloc(&OBJC_CLASS___TVSettingsWholeHomeAudioRoomDataSource),  "initWithHome:",  v4);
    dataSource = v5->_dataSource;
    v5->_dataSource = v6;

    -[TVSettingsWholeHomeAudioRoomDataSource setDelegate:](v5->_dataSource, "setDelegate:", v5);
    uint64_t v8 = TSKLocString(@"WHASelectRoomTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TVSettingsWholeHomeAudioRoomPickerViewController setTitle:](v5, "setTitle:", v9);
  }

  return v5;
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  0LL));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000E55C;
  v19[3] = &unk_10018E9B0;
  objc_copyWeak(&v20, &location);
  [v3 setUpdateBlock:v19];
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  0LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000E810;
  v17[3] = &unk_10018E9B0;
  objc_copyWeak(&v18, &location);
  [v4 setUpdateBlock:v17];
  uint64_t v5 = TSKLocString(@"WHARemoveFromHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6,  0LL,  0LL,  0LL,  self,  "_removeLocalAccessoryFromHome"));

  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_10000EB20;
  v15 = &unk_10018EA00;
  objc_copyWeak(&v16, &location);
  [v7 setUpdateBlock:&v12];
  v23 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v23,  1LL,  v12,  v13,  v14,  v15));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v8));

  v22[0] = v3;
  v22[1] = v4;
  v22[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 3LL));

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v10;
}

- (void)wholeHomeAudioRoomDataSourceHomeWasRemoved:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomPickerViewController delegate](self, "delegate", a3));
  uint64_t v6 = TVCSHomeLog(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "WHA data source home removed, calling delegate. {delegate=%p}",  (uint8_t *)&v8,  0xCu);
  }

  [v4 roomPickerViewControllerDidFinish:self];
}

- (id)_makeAddNewRoomViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___TSKTextInputViewController);
  uint64_t v4 = TSKLocString(@"WHANewRoomEntryTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TSKTextInputViewController setHeaderText:](v3, "setHeaderText:", v5);

  uint64_t v6 = TSKLocString(@"WHANewRoomEntrySubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[TSKTextInputViewController setMessageText:](v3, "setMessageText:", v7);

  -[TSKTextInputViewController setEditingDelegate:](v3, "setEditingDelegate:", self);
  return v3;
}

- (void)_didSelectExistingRoomItem:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomPickerViewController dataSource](self, "dataSource"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 home]);

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10000EDA8;
  activity_block[3] = &unk_10018EA28;
  activity_block[4] = self;
  id v10 = v4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v4;
  _os_activity_initiate( (void *)&_mh_execute_header,  "did select suggested room",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
}

- (void)_didSelectSuggestedRoomItem:(id)a3
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10000EEE4;
  activity_block[3] = &unk_10018E468;
  activity_block[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate( (void *)&_mh_execute_header,  "did select suggested room",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);
}

- (void)_moveOrAddLocalAccessoryToRoomWithName:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v8 = v6;
  if (a4)
  {
    -[TVSettingsWholeHomeAudioRoomPickerViewController __moveOrAddLocalAccessoryToRoomWithName:inHome:]( self,  "__moveOrAddLocalAccessoryToRoomWithName:inHome:",  v6,  a4);
  }

  else
  {
    uint64_t v9 = TVCSHomeLog(v6, v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[TVSettingsWholeHomeAudioRoomPickerViewController _moveOrAddLocalAccessoryToRoomWithName:inHome:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Creating default home.", buf, 0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000F118;
    v12[3] = &unk_10018EA50;
    v12[4] = self;
    id v13 = v8;
    [v11 createDefaultHomeWithCompletionHandler:v12];
  }
}

- (void)__moveOrAddLocalAccessoryToRoomWithName:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = TVCSHomeLog(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[TVSettingsWholeHomeAudioRoomPickerViewController __moveOrAddLocalAccessoryToRoomWithName:inHome:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Creating new room.", buf, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000F2E8;
  v13[3] = &unk_10018EA78;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v11 createRoomNamed:v7 inHome:v12 completionHandler:v13];
}

- (void)_moveOrAddLocalAccessoryToRoom:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  uint64_t v8 = v6;
  if (a4)
  {
    -[TVSettingsWholeHomeAudioRoomPickerViewController __moveOrAddLocalAccessoryToRoom:inHome:]( self,  "__moveOrAddLocalAccessoryToRoom:inHome:",  v6,  a4);
  }

  else
  {
    uint64_t v9 = TVCSHomeLog(v6, v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[TVSettingsWholeHomeAudioRoomPickerViewController _moveOrAddLocalAccessoryToRoom:inHome:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Creating default home.", buf, 0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000F4A4;
    v12[3] = &unk_10018EA50;
    v12[4] = self;
    id v13 = v8;
    [v11 createDefaultHomeWithCompletionHandler:v12];
  }
}

- (void)__moveOrAddLocalAccessoryToRoom:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localAccessory]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 room]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
  uint64_t v14 = TVCSStringByRemovingBonjourSuffix();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  id v16 = [v11 length];
  if (v16 && (id v16 = [v15 length]) != 0)
  {
    id v16 = [v15 caseInsensitiveCompare:v11];
    BOOL v18 = v16 == 0LL;
  }

  else
  {
    BOOL v18 = 0;
  }

  uint64_t v19 = TVCSHomeLog(v16, v17);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[TVSettingsWholeHomeAudioRoomPickerViewController __moveOrAddLocalAccessoryToRoom:inHome:]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Configuring local accessory.", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000F73C;
  v23[3] = &unk_10018EAC8;
  BOOL v25 = v18;
  v23[4] = self;
  id v24 = v6;
  id v22 = v6;
  [v21 moveOrAddLocalAccessoryToRoom:v22 inHome:v7 completionHandler:v23];
}

- (void)_removeLocalAccessoryFromHome
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10000FA10;
  activity_block[3] = &unk_10018E440;
  activity_block[4] = self;
  _os_activity_initiate((void *)&_mh_execute_header, "remove from home", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)__removeLocalAccessoryFromHome
{
  uint64_t v3 = TVCSHomeLog(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[TVSettingsWholeHomeAudioRoomPickerViewController __removeLocalAccessoryFromHome]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Removing local accessory from home.",  buf,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000FB10;
  v6[3] = &unk_10018EAF0;
  v6[4] = self;
  [v5 forgetHomeConfiguration:v6];
}

- (void)_showAccessoryRemoveFailed
{
  v15 = objc_alloc_init(&OBJC_CLASS___TVSiCloudAccountManager);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSiCloudAccountManager activeAccount](v15, "activeAccount"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 username]);

  if ([v4 length])
  {
    uint64_t v5 = TSKLocString(@"WHAAccessoryRemoveFailedDescription");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v4));
  }

  else
  {
    uint64_t v8 = TSKLocString(@"WHAAccessoryRemoveFailedNoAccountDescription");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  uint64_t v9 = TSKLocString(@"WHAAccessoryRemoveFailedTitle");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  v7,  1LL));

  uint64_t v12 = TSKLocString(@"WHAAccessoryRemoveOKButton");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  1LL,  0LL));
  [v11 addAction:v14];

  -[TVSettingsWholeHomeAudioRoomPickerViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v11,  1LL,  0LL);
}

- (void)_presentCreateRoomFailedViewControllerWithError:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[TVCSHomeKitErrorUtilities localizedMessageForHomeKitError:]( &OBJC_CLASS___TVCSHomeKitErrorUtilities,  "localizedMessageForHomeKitError:",  a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  0LL,  1LL));
  uint64_t v5 = TSKLocString(@"OK");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  1LL,  0LL));
  [v4 addAction:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioRoomPickerViewController navigationController](self, "navigationController"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topViewController]);
  [v9 presentViewController:v4 animated:1 completion:0];
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByTrimmingCharactersInSet:v7]);

  if ([v8 length])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10001000C;
    v14[3] = &unk_10018E468;
    v14[4] = self;
    id v15 = v8;
    _os_activity_initiate((void *)&_mh_execute_header, "did add new room", OS_ACTIVITY_FLAG_DEFAULT, v14);
  }

  else
  {
    uint64_t v10 = TVCSHomeLog(0LL, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[TVSettingsWholeHomeAudioRoomPickerViewController editingController:didProvideValue:forSettingItem:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: User provided empty room name.",  buf,  0xCu);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsWholeHomeAudioRoomPickerViewController navigationController]( self,  "navigationController"));
    id v13 = [v12 popToViewController:self animated:1];
  }
}

- (TVSettingsWholeHomeAudioRoomPickerViewControllerDelegate)delegate
{
  return (TVSettingsWholeHomeAudioRoomPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSettingsWholeHomeAudioRoomDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

  ;
}

@end