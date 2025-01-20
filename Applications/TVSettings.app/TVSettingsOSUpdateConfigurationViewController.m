@interface TVSettingsOSUpdateConfigurationViewController
- (NSDictionary)colorMap;
- (NSDictionary)trainMap;
- (NSString)lastConfigurationCheckResult;
- (TVSettingsOSUpdateConfigurationViewController)initWithColorMap:(id)a3 andTrainMap:(id)a4;
- (id)loadSettingGroups;
- (unint64_t)configurationCheckState;
- (void)_checkConfiguration:(id)a3;
- (void)_clearConfiguration:(id)a3;
- (void)_configurationDidChange:(id)a3;
- (void)_configurationMapDidChange:(id)a3;
- (void)_configurationWillChange:(id)a3;
- (void)_updateCheckConfigurationItem:(id)a3;
- (void)_updateConfigurationItem:(id)a3 withValue:(id)a4;
- (void)_updateLivAPIConfigurationItem:(id)a3 withValue:(id)a4;
- (void)_updateLocalConfigurationItem:(id)a3 withValue:(id)a4;
- (void)_warnAbout:(id)a3;
- (void)dealloc;
- (void)setColorMap:(id)a3;
- (void)setConfigurationCheckState:(unint64_t)a3;
- (void)setLastConfigurationCheckResult:(id)a3;
- (void)setTrainMap:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsOSUpdateConfigurationViewController

- (TVSettingsOSUpdateConfigurationViewController)initWithColorMap:(id)a3 andTrainMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVSettingsOSUpdateConfigurationViewController;
  v8 = -[TVSettingsOSUpdateConfigurationViewController init](&v14, "init");
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    colorMap = v8->_colorMap;
    v8->_colorMap = v9;

    v11 = (NSDictionary *)[v7 copy];
    trainMap = v8->_trainMap;
    v8->_trainMap = v11;
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsOSUpdateConfigurationViewController;
  -[TVSettingsOSUpdateConfigurationViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_configurationWillChange:" name:off_1001DFB50 object:0];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_configurationDidChange:" name:off_1001DFB58 object:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_configurationMapDidChange:" name:off_1001DFB68 object:0];

  -[TVSettingsOSUpdateConfigurationViewController setConfigurationCheckState:](self, "setConfigurationCheckState:", 0LL);
  -[TVSettingsOSUpdateConfigurationViewController setLastConfigurationCheckResult:]( self,  "setLastConfigurationCheckResult:",  0LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager currentConfiguration]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "currentConfiguration"));
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Current OSUpdate Configuration: %{public}@",  buf,  0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsOSUpdateConfigurationViewController;
  -[TVSettingsOSUpdateConfigurationViewController viewDidLoad](&v7, "viewDidLoad");
}

- (id)loadSettingGroups
{
  v3 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  objc_super v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_initWeak(&location, self);
  uint64_t v5 = TSKLocString(@"SettingsOSUpdateConfigurationTitle");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVSettingsOSUpdateConfigurationManager);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100074010;
  v25[3] = &unk_10018E9D8;
  objc_copyWeak(&v26, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v6,  0LL,  v7,  @"currentConfiguration",  v25));

  [v8 setAccessoryTypes:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000740C0;
  v23[3] = &unk_10018E9B0;
  objc_copyWeak(&v24, &location);
  [v8 setUpdateBlock:v23];
  -[NSMutableArray addObject:](v4, "addObject:", v8);
  uint64_t v9 = TSKLocString(@"SettingsOSUpdateConfigurationCheckTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  0LL,  0LL,  0LL,  self,  "_checkConfiguration:"));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100074124;
  v21[3] = &unk_10018E9B0;
  objc_copyWeak(&v22, &location);
  [v11 setUpdateBlock:v21];
  -[NSMutableArray addObject:](v4, "addObject:", v11);
  uint64_t v12 = TSKLocString(@"SettingsOSUpdateConfigurationDefaultTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v13,  0LL,  0LL,  0LL,  self,  "_clearConfiguration:"));

  -[NSMutableArray addObject:](v4, "addObject:", v14);
  uint64_t v15 = TSKLocString(@"RestartTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v16,  0LL,  0LL,  0LL,  v17,  "reboot"));

  -[NSMutableArray addObject:](v4, "addObject:", v18);
  -[TSKSettingGroup setSettingItems:](v3, "setSettingItems:", v4);
  v28 = v3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v19;
}

- (void)_updateLocalConfigurationItem:(id)a3 withValue:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  if (v9)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 fullName]);
    [v5 setLocalizedValue:v6];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v9 longDescription]);
    [v5 setLocalizedDescription:v7];

    uint64_t v8 = 2LL;
  }

  else
  {
    [v5 setLocalizedValue:&stru_100195DD8];
    [v5 setLocalizedDescription:&stru_100195DD8];
    uint64_t v8 = 0LL;
  }

  [v5 setAccessoryTypes:v8];
}

- (void)_updateLivAPIConfigurationItem:(id)a3 withValue:(id)a4
{
  id v9 = a4;
  id v5 = a3;
  if (v9)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 fullName]);
    [v5 setLocalizedValue:v6];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v9 longDescription]);
    [v5 setLocalizedDescription:v7];

    uint64_t v8 = 2LL;
  }

  else
  {
    [v5 setLocalizedValue:&stru_100195DD8];
    [v5 setLocalizedDescription:&stru_100195DD8];
    uint64_t v8 = 0LL;
  }

  [v5 setAccessoryTypes:v8];
}

- (void)_updateConfigurationItem:(id)a3 withValue:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  if (v8)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 fullName]);
    [v5 setLocalizedValue:v6];

    uint64_t v7 = objc_claimAutoreleasedReturnValue([v8 longDescription]);
    [v5 setLocalizedDescription:v7];

    id v5 = (id)v7;
  }

  else
  {
    [v5 setLocalizedValue:&stru_100195DD8];
    [v5 setLocalizedDescription:&stru_100195DD8];
  }
}

- (void)_updateCheckConfigurationItem:(id)a3
{
  id v8 = a3;
  [v8 setLocalizedValue:0];
  if ((id)-[TVSettingsOSUpdateConfigurationViewController configurationCheckState](self, "configurationCheckState") == (id)1)
  {
    [v8 setAccessoryTypes:4];
  }

  else
  {
    unint64_t v4 = -[TVSettingsOSUpdateConfigurationViewController configurationCheckState](self, "configurationCheckState") - 2;
    if (v4 > 2)
    {
      id v6 = 0LL;
    }

    else
    {
      uint64_t v5 = TSKLocString(off_1001917D8[v4]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    }

    [v8 setLocalizedValue:v6];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsOSUpdateConfigurationViewController lastConfigurationCheckResult]( self,  "lastConfigurationCheckResult"));
    [v8 setLocalizedDescription:v7];

    [v8 setAccessoryTypes:0];
  }
}

- (void)_checkConfiguration:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000744E4;
  v4[3] = &unk_10018E810;
  objc_copyWeak(&v5, &location);
  dispatch_async(&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_clearConfiguration:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager shippingConfiguration]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "shippingConfiguration",  a3));
  +[TVSettingsOSUpdateConfigurationManager setCurrentConfiguration:]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "setCurrentConfiguration:",  v3);
}

- (void)_configurationWillChange:(id)a3
{
}

- (void)_configurationDidChange:(id)a3
{
  id v4 = a3;
  -[TVSettingsOSUpdateConfigurationViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  id v17 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:off_1001DFB60]);
  if (v17)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedFailureReason]);
    uint64_t v7 = TSKLocString(@"SettingsOSUpdateProfileErrorMessage");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ([v6 length]) {
      id v9 = v6;
    }
    else {
      id v9 = v17;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));
  }

  else
  {
    uint64_t v11 = TSKLocString(@"SettingsOSUpdateConfigurationChangedMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v10,  1LL));
  uint64_t v13 = TSKLocString(@"SettingsOK");
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  &stru_100191798));

  [v12 addAction:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfigurationViewController navigationController](self, "navigationController"));
  [v16 presentViewController:v12 animated:1 completion:0];
}

- (void)_configurationMapDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:off_1001DFB70]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:off_1001DFB78]);

  if ([v8 count]) {
    -[TVSettingsOSUpdateConfigurationViewController setColorMap:](self, "setColorMap:", v8);
  }
  if ([v7 count]) {
    -[TVSettingsOSUpdateConfigurationViewController setTrainMap:](self, "setTrainMap:", v7);
  }
  -[TVSettingsOSUpdateConfigurationViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)_warnAbout:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  a3,  1LL));
  uint64_t v4 = TSKLocString(@"SettingsOK");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v5,  1LL,  &stru_1001917B8));

  [v8 addAction:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateConfigurationViewController navigationController](self, "navigationController"));
  [v7 presentViewController:v8 animated:1 completion:0];
}

- (unint64_t)configurationCheckState
{
  return self->_configurationCheckState;
}

- (void)setConfigurationCheckState:(unint64_t)a3
{
  self->_configurationCheckState = a3;
}

- (NSString)lastConfigurationCheckResult
{
  return self->_lastConfigurationCheckResult;
}

- (void)setLastConfigurationCheckResult:(id)a3
{
}

- (NSDictionary)trainMap
{
  return self->_trainMap;
}

- (void)setTrainMap:(id)a3
{
}

- (NSDictionary)colorMap
{
  return self->_colorMap;
}

- (void)setColorMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end