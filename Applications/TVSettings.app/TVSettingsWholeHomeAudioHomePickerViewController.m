@interface TVSettingsWholeHomeAudioHomePickerViewController
- (TVSettingsWholeHomeAudioHomePickerViewController)initWithStyle:(int64_t)a3;
- (TVSettingsWholeHomeAudioHomePickerViewControllerDelegate)delegate;
- (id)loadSettingGroups;
- (void)_didSelectHomeItem:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSettingsWholeHomeAudioHomePickerViewController

- (TVSettingsWholeHomeAudioHomePickerViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioHomePickerViewController;
  v3 = -[TVSettingsWholeHomeAudioHomePickerViewController initWithStyle:](&v7, "initWithStyle:", a3);
  if (v3)
  {
    uint64_t v4 = TSKLocString(@"WHASelectRoomTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[TVSettingsWholeHomeAudioHomePickerViewController setTitle:](v3, "setTitle:", v5);
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioHomePickerViewController;
  -[TVSettingsWholeHomeAudioHomePickerViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v4 addObserver:self forKeyPath:@"allOwnedHomes" options:5 context:off_1001DF1A0];
  [v4 addObserver:self forKeyPath:@"localAccessory" options:1 context:off_1001DF1A8];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioHomePickerViewController;
  -[TVSettingsWholeHomeAudioHomePickerViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"localAccessory" context:off_1001DF1A8];
  [v4 removeObserver:self forKeyPath:@"allOwnedHomes" context:off_1001DF1A0];
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  uint64_t v4 = TSKLocString(@"WHAYourHomesTitle");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000B134;
  v9[3] = &unk_10018E670;
  v9[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v5,  v3,  @"allOwnedHomes",  v9));

  [v6 setSortsByTitle:1];
  v10 = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001DF1A0 == a6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allOwnedHomes]);
    id v15 = [v14 count];

    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsWholeHomeAudioHomePickerViewController navigationController]( self,  "navigationController"));
      id v17 = [v16 popViewControllerAnimated:1];
    }
  }

  else if (off_1001DF1A8 == a6)
  {
    -[TVSettingsWholeHomeAudioHomePickerViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  else
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___TVSettingsWholeHomeAudioHomePickerViewController;
    -[TVSettingsWholeHomeAudioHomePickerViewController observeValueForKeyPath:ofObject:change:context:]( &v18,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_didSelectHomeItem:(id)a3
{
  id v4 = a3;
  uint64_t v6 = TVCSHomeLog(v4, v5);
  objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[TVSettingsWholeHomeAudioHomePickerViewController _didSelectHomeItem:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Home picker did select home.",  (uint8_t *)&v10,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsWholeHomeAudioHomePickerViewController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);

  [v8 homePickerViewController:self didSelectHome:v9];
}

- (TVSettingsWholeHomeAudioHomePickerViewControllerDelegate)delegate
{
  return (TVSettingsWholeHomeAudioHomePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end