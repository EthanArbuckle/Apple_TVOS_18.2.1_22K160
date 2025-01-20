@interface TVSettingsResolutionViewController
- (PBSDisplayMode)lastDisplayMode;
- (TVSettingsResolutionViewController)initWithStyle:(int64_t)a3;
- (UIViewController)recoveryController;
- (id)resolutionGroupsForCommonModes:(BOOL)a3;
- (id)resolutionItemConfigurationBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_selectedItem:(id)a3;
- (void)changeModeTo:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLastDisplayMode:(id)a3;
- (void)setRecoveryController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVSettingsResolutionViewController

- (TVSettingsResolutionViewController)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsResolutionViewController;
  v3 = -[TVSettingsResolutionViewController initWithStyle:](&v9, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 currentDisplayMode]);
    lastDisplayMode = v3->_lastDisplayMode;
    v3->_lastDisplayMode = (PBSDisplayMode *)v6;

    [v5 addObserver:v3 forKeyPath:@"currentDisplayMode" options:0 context:off_1001DF278];
    [v4 addObserver:v3 forKeyPath:@"userVisibleSortedDisplayModes" options:0 context:off_1001DF280];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"currentDisplayMode" context:off_1001DF278];
  [v3 removeObserver:self forKeyPath:@"userVisibleSortedDisplayModes" context:off_1001DF280];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsResolutionViewController;
  -[TVSettingsResolutionViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsResolutionViewController;
  -[TVSettingsResolutionViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsResolutionViewController tableView](self, "tableView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  objc_super v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 registerClass:v4 forCellReuseIdentifier:v7];
}

- (void)changeModeTo:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010528;
  v7[3] = &unk_10018EB78;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 updateDisplayManagerWithDisplayMode:v6 reason:@"User selection from Settings" requestConfiguration:&stru_10018EB30 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)resolutionGroupsForCommonModes:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  [v7 localeRefreshRate];
  double v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
  if (v3)
  {
    if (v9 == 50.0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"commonResolutionsModes50Hz",  v10));
      -[NSMutableArray addObject:](v5, "addObject:", v11);

      v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
      v17 = @"commonResolutionsModes60Hz";
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"commonResolutionsModes60Hz",  v10));
      -[NSMutableArray addObject:](v5, "addObject:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
      v17 = @"commonResolutionsModes50Hz";
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  v17,  v16));
    -[NSMutableArray addObject:](v5, "addObject:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
    v20 = @"commonResolutionsModesOthers";
  }

  else
  {
    if (v9 == 50.0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"otherResolutionsModes50Hz",  v10));
      -[NSMutableArray addObject:](v5, "addObject:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"otherResolutionsModes60Hz",  v13));
      -[NSMutableArray addObject:](v5, "addObject:", v14);

      v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
      v25 = @"otherResolutionsModesExact60Hz";
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"otherResolutionsModes60Hz",  v10));
      -[NSMutableArray addObject:](v5, "addObject:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"otherResolutionsModesExact60Hz",  v22));
      -[NSMutableArray addObject:](v5, "addObject:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
      v25 = @"otherResolutionsModes50Hz";
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  v25,  v24));
    -[NSMutableArray addObject:](v5, "addObject:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"otherResolutionsModes30Hz",  v27));
    -[NSMutableArray addObject:](v5, "addObject:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"otherResolutionsModesExact30Hz",  v29));
    -[NSMutableArray addObject:](v5, "addObject:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"otherResolutionsModes25Hz",  v31));
    -[NSMutableArray addObject:](v5, "addObject:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"otherResolutionsModes24Hz",  v33));
    -[NSMutableArray addObject:](v5, "addObject:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  @"otherResolutionsModesExact24Hz",  v35));
    -[NSMutableArray addObject:](v5, "addObject:", v36);

    v19 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController resolutionItemConfigurationBlock]( self,  "resolutionItemConfigurationBlock"));
    v20 = @"otherResolutionsModesOthers";
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v6,  v20,  v19));
  -[NSMutableArray addObject:](v5, "addObject:", v37);

  return v5;
}

- (id)resolutionItemConfigurationBlock
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010C08;
  v4[3] = &unk_10018EBC0;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_selectedItem:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  -[TVSettingsResolutionViewController changeModeTo:](self, "changeModeTo:", v4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsResolutionViewController settingGroupAtIndex:]( self,  "settingGroupAtIndex:",  [v7 section]));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsResolutionViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v7));
  v10 = v9;
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[TVSettingsResolutionViewController tableView:cellForRowAtIndexPath:]";
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: Setting item could not be found at index path. Will return empty cell. Index Path: %{public}@.",  buf,  0x16u);
    }

    id v16 = -[TVSettingsResolutionViewController tableView:cellForRowAtIndexPath:]( &v18,  "tableView:cellForRowAtIndexPath:",  v6,  v7,  self,  &OBJC_CLASS___TVSettingsResolutionViewController,  v19.receiver,  v19.super_class);
    goto LABEL_8;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);

  if (!v11)
  {
    id v16 = -[TVSettingsResolutionViewController tableView:cellForRowAtIndexPath:]( &v19,  "tableView:cellForRowAtIndexPath:",  v6,  v7,  v18.receiver,  v18.super_class,  self,  &OBJC_CLASS___TVSettingsResolutionViewController);
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_9;
  }

  v12 = (objc_class *)objc_opt_class(&OBJC_CLASS___TSKTableViewSubtitleTextCell);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v14 forIndexPath:v7]);

  [v15 settingItem:v10 didUpdateMetadataWithGroup:v8];
  [v10 setDirty:0];
LABEL_9:

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentDisplayMode]);
  -[TVSettingsResolutionViewController setLastDisplayMode:](self, "setLastDisplayMode:", v9);

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsResolutionViewController;
  -[TVSettingsResolutionViewController tableView:didSelectRowAtIndexPath:]( &v10,  "tableView:didSelectRowAtIndexPath:",  v7,  v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001DF278 == a6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = (id)objc_opt_class(self);
      __int16 v18 = 2112;
      id v19 = v12;
      id v13 = v17;
      v14 = "RES: %@: Received KVO notification for current display mode. change=%@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
    }

- (PBSDisplayMode)lastDisplayMode
{
  return self->_lastDisplayMode;
}

- (void)setLastDisplayMode:(id)a3
{
}

- (UIViewController)recoveryController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_recoveryController);
}

- (void)setRecoveryController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end