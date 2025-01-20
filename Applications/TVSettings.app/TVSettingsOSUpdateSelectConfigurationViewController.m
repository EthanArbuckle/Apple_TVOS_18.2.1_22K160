@interface TVSettingsOSUpdateSelectConfigurationViewController
- (NSArray)sortedTrainNames;
- (NSDictionary)trainAudiences;
- (NSString)currentTrainInfoText;
- (TVSettingsOSUpdateSelectConfigurationViewController)initWithTrains:(id)a3 andColors:(id)a4;
- (TVSettingsOSUpdateTrainFacade)currentTrainFacade;
- (id)loadSettingGroups;
- (unint64_t)configurationLoadingState;
- (void)_adjustState;
- (void)_configurationDidChange:(id)a3;
- (void)_configurationMapDidChange:(id)a3;
- (void)_configurationWillChange:(id)a3;
- (void)_selectedConfiguration:(id)a3;
- (void)_updateConfigurationItem:(id)a3 withValue:(id)a4;
- (void)setConfigurationLoadingState:(unint64_t)a3;
- (void)setCurrentTrainFacade:(id)a3;
- (void)setCurrentTrainInfoText:(id)a3;
- (void)setSortedTrainNames:(id)a3;
- (void)setTrainAudiences:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsOSUpdateSelectConfigurationViewController

- (TVSettingsOSUpdateSelectConfigurationViewController)initWithTrains:(id)a3 andColors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSettingsOSUpdateSelectConfigurationViewController;
  v8 = -[TVSettingsOSUpdateSelectConfigurationViewController init](&v20, "init");
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    trainAudiences = v8->_trainAudiences;
    v8->_trainAudiences = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](v8->_trainAudiences, "allKeys"));
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue([v11 sortedArrayUsingComparator:&stru_100193F20]);

    sortedTrainNames = v8->_sortedTrainNames;
    v8->_sortedTrainNames = v12;
    v14 = v12;

    v15 = objc_alloc_init(&OBJC_CLASS___TVSettingsOSUpdateTrainFacade);
    currentTrainFacade = v8->_currentTrainFacade;
    v8->_currentTrainFacade = v15;

    v17 = v8->_currentTrainFacade;
    id v18 = [v7 copy];
    -[TVSettingsOSUpdateTrainFacade setColors:](v17, "setColors:", v18);

    -[TVSettingsOSUpdateTrainFacade setTrainAudiences:]( v8->_currentTrainFacade,  "setTrainAudiences:",  v8->_trainAudiences);
  }

  return v8;
}

- (void)viewDidLoad
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_configurationWillChange:" name:off_1001DFB50 object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_configurationDidChange:" name:off_1001DFB58 object:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_configurationMapDidChange:" name:off_1001DFB68 object:0];

  -[TVSettingsOSUpdateTrainFacade setSortedAudiencesForTrain:]( self->_currentTrainFacade,  "setSortedAudiencesForTrain:",  &__NSArray0__struct);
  -[TVSettingsOSUpdateSelectConfigurationViewController _adjustState](self, "_adjustState");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsOSUpdateSelectConfigurationViewController;
  -[TVSettingsOSUpdateSelectConfigurationViewController viewDidLoad](&v6, "viewDidLoad");
}

- (id)loadSettingGroups
{
  uint64_t v3 = TSKLocString(@"SettingsOSUpdateLocalConfigurationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  currentTrainFacade = self->_currentTrainFacade;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000C692C;
  v26[3] = &unk_100193F48;
  objc_copyWeak(&v27, &location);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v4,  currentTrainFacade,  @"colorValues",  v26));

  [v6 setAutoHide:0];
  id v7 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v8 = TSKLocString(@"SettingsOSUpdateConfigurationTrainTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = -[TSKSettingGroup initWithTitle:](v7, "initWithTitle:", v9);

  -[TSKSettingGroup setAutoHide:](v10, "setAutoHide:", 0LL);
  v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v12 = TSKLocString(@"Train");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = self->_currentTrainFacade;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateSelectConfigurationViewController sortedTrainNames](self, "sortedTrainNames"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v13,  0LL,  v14,  @"currentTrainName",  v15));

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000C6AAC;
  v25[3] = &unk_10018E608;
  v25[4] = self;
  [v16 setUpdateBlock:v25];
  -[NSMutableArray addObject:](v11, "addObject:", v16);
  -[TSKSettingGroup setSettingItems:](v10, "setSettingItems:", v11);
  uint64_t v17 = TSKLocString(@"SettingsOSUpdateConfigurationBuildTypeTitle");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = self->_currentTrainFacade;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000C6B38;
  v23[3] = &unk_100193F48;
  objc_copyWeak(&v24, &location);
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  v18,  v19,  @"sortedAudiencesForTrain",  v23));

  v29[0] = v6;
  v29[1] = v10;
  v29[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 3LL));

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v21;
}

- (void)_adjustState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateSelectConfigurationViewController sortedTrainNames](self, "sortedTrainNames"));
  id v4 = [v3 count];

  if (!v4)
  {
    uint64_t v5 = TSKLocString(@"SettingsOSUpdateConfigurationNoTrainsError");
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[TVSettingsOSUpdateSelectConfigurationViewController setCurrentTrainInfoText:]( self,  "setCurrentTrainInfoText:",  v6);

    currentTrainFacade = self->_currentTrainFacade;
    uint64_t v8 = TSKLocString(@"SettingsOSUpdateConfigurationNoTrains");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TVSettingsOSUpdateTrainFacade setCurrentTrainName:](currentTrainFacade, "setCurrentTrainName:", v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager currentConfiguration]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "currentConfiguration"));
  id v19 = v10;
  if (v10
    && ([v10 isCarryOrLiveOnConfiguration] & 1) == 0
    && (v11 = (void *)objc_claimAutoreleasedReturnValue([v19 trainName]),
        id v12 = [v11 length],
        v11,
        v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v19 trainName]);
    -[TVSettingsOSUpdateTrainFacade setCurrentTrainName:](self->_currentTrainFacade, "setCurrentTrainName:", v13);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateSelectConfigurationViewController sortedTrainNames](self, "sortedTrainNames"));
    id v15 = [v14 count];

    if (v15)
    {
      v16 = self->_currentTrainFacade;
      uint64_t v17 = TSKLocString(@"SettingsOSUpdateConfigurationSelectATrain");
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      -[TVSettingsOSUpdateTrainFacade setCurrentTrainName:](v16, "setCurrentTrainName:", v18);

      -[TVSettingsOSUpdateSelectConfigurationViewController setCurrentTrainInfoText:]( self,  "setCurrentTrainInfoText:",  0LL);
    }
  }
}

- (void)_updateConfigurationItem:(id)a3 withValue:(id)a4
{
  id v10 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager currentConfiguration]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "currentConfiguration"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v10 representedObject]);
  id v7 = v6;
  if (v6 && [v6 isEqual:v5])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 longDescription]);
    uint64_t v9 = 2LL;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsOSUpdateSelectConfigurationViewController currentTrainInfoText]( self,  "currentTrainInfoText"));
    uint64_t v9 = 0LL;
  }

  [v10 setLocalizedDescription:v8];

  [v10 setAccessoryTypes:v9];
}

- (void)_selectedConfiguration:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  +[TVSettingsOSUpdateConfigurationManager setCurrentConfiguration:]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "setCurrentConfiguration:",  v4);

  -[TVSettingsOSUpdateSelectConfigurationViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)_configurationWillChange:(id)a3
{
}

- (void)_configurationDidChange:(id)a3
{
  id v4 = a3;
  -[TVSettingsOSUpdateSelectConfigurationViewController setConfigurationLoadingState:]( self,  "setConfigurationLoadingState:",  0LL);
  -[TVSettingsOSUpdateSelectConfigurationViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  id v17 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:off_1001DFB60]);
  if (v17)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedFailureReason]);
    uint64_t v7 = TSKLocString(@"SettingsOSUpdateProfileErrorMessage");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ([v6 length]) {
      id v9 = v6;
    }
    else {
      id v9 = v17;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));
  }

  else
  {
    uint64_t v11 = TSKLocString(@"SettingsOSUpdateConfigurationChangedMessage");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v10,  1LL));
  uint64_t v13 = TSKLocString(@"SettingsOK");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  &stru_100193F68));

  [v12 addAction:v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsOSUpdateSelectConfigurationViewController navigationController]( self,  "navigationController"));
  [v16 presentViewController:v12 animated:1 completion:0];
}

- (void)_configurationMapDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:off_1001DFB70]);

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:off_1001DFB78]);

  if ([v10 count]) {
    -[TVSettingsOSUpdateTrainFacade setColors:](self->_currentTrainFacade, "setColors:", v10);
  }
  if ([v7 count])
  {
    -[TVSettingsOSUpdateSelectConfigurationViewController setTrainAudiences:](self, "setTrainAudiences:", v7);
    -[TVSettingsOSUpdateTrainFacade setTrainAudiences:](self->_currentTrainFacade, "setTrainAudiences:", v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingComparator:&stru_100193F88]);

    -[TVSettingsOSUpdateSelectConfigurationViewController setSortedTrainNames:](self, "setSortedTrainNames:", v9);
  }

  -[TVSettingsOSUpdateSelectConfigurationViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  -[TVSettingsOSUpdateSelectConfigurationViewController _adjustState](self, "_adjustState");
}

- (NSDictionary)trainAudiences
{
  return self->_trainAudiences;
}

- (void)setTrainAudiences:(id)a3
{
}

- (NSArray)sortedTrainNames
{
  return self->_sortedTrainNames;
}

- (void)setSortedTrainNames:(id)a3
{
}

- (TVSettingsOSUpdateTrainFacade)currentTrainFacade
{
  return self->_currentTrainFacade;
}

- (void)setCurrentTrainFacade:(id)a3
{
}

- (NSString)currentTrainInfoText
{
  return self->_currentTrainInfoText;
}

- (void)setCurrentTrainInfoText:(id)a3
{
}

- (unint64_t)configurationLoadingState
{
  return self->_configurationLoadingState;
}

- (void)setConfigurationLoadingState:(unint64_t)a3
{
  self->_configurationLoadingState = a3;
}

- (void).cxx_destruct
{
}

@end