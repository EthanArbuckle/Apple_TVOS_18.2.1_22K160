@interface PTDRootModuleController
- (BOOL)moduleNeedsReload;
- (PTDPrototypingSettings)prototypingSettings;
- (PTDRootModuleController)initWithDomainServer:(id)a3 editingServer:(id)a4;
- (PTModule)module;
- (PTParameterRecords)parameterRecordsOfTunedSettings;
- (PTUIClient)delegate;
- (id)_hardwareEventSection;
- (id)_killSection;
- (void)_sendKillSpringBoard;
- (void)_setModuleNeedsReload;
- (void)setDelegate:(id)a3;
- (void)setModuleNeedsReload:(BOOL)a3;
- (void)setParameterRecordsOfTunedSettings:(id)a3;
@end

@implementation PTDRootModuleController

- (PTDRootModuleController)initWithDomainServer:(id)a3 editingServer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PTDRootModuleController;
  v9 = -[PTDRootModuleController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domainServer, a3);
    objc_storeStrong((id *)&v10->_editingServer, a4);
    id v11 = -[PTDomainServer localSettingsOfClass:]( v10->_domainServer,  "localSettingsOfClass:",  objc_opt_class(&OBJC_CLASS___PTDPrototypingSettings));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    prototypingSettings = v10->_prototypingSettings;
    v10->_prototypingSettings = (PTDPrototypingSettings *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v10 selector:"_setModuleNeedsReload" name:PTUIEditingServerDidReloadDomainsNotification object:0];
    [v14 addObserver:v10 selector:"_setModuleNeedsReload" name:PTUIEditingServerDidReloadTestRecipesNotification object:0];
  }

  return v10;
}

- (PTModule)module
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTDRootModuleController _hardwareEventSection](self, "_hardwareEventSection"));
  [v3 addObject:v4];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PTUIEditingServer testRecipeSelectionModule](self->_editingServer, "testRecipeSelectionModule"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule submoduleWithModule:](&OBJC_CLASS___PTModule, "submoduleWithModule:", v22));
  [v3 addObject:v5];

  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100006268;
  v23[3] = &unk_1000147B8;
  objc_copyWeak(&v24, &location);
  v6 = objc_retainBlock(v23);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PTUIPushViewControllerRowAction actionWithViewControllerCreator:]( &OBJC_CLASS___PTUIPushViewControllerRowAction,  "actionWithViewControllerCreator:",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PTDrillDownRow rowWithTitle:valueKeyPath:]( &OBJC_CLASS___PTDrillDownRow,  "rowWithTitle:valueKeyPath:",  @"Show Modified Settings",  @"showModifiedSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 action:v7]);
  v27 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:](&OBJC_CLASS___PTModule, "sectionWithRows:", v10));
  v26 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[PTModule moduleWithTitle:contents:]( &OBJC_CLASS___PTModule,  "moduleWithTitle:contents:",  @"Modified Settings",  v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule submoduleWithModule:](&OBJC_CLASS___PTModule, "submoduleWithModule:", v13));
  [v3 addObject:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PTUIEditingServer settingsEditingModule](self->_editingServer, "settingsEditingModule"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule submoduleWithModule:](&OBJC_CLASS___PTModule, "submoduleWithModule:", v15));
  [v3 addObject:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[PTModule moduleWithSettings:]( &OBJC_CLASS___PTModule,  "moduleWithSettings:",  self->_prototypingSettings));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule submoduleWithModule:](&OBJC_CLASS___PTModule, "submoduleWithModule:", v17));
  [v3 addObject:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PTDRootModuleController _killSection](self, "_killSection"));
  [v3 addObject:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[PTModule moduleWithTitle:contents:]( &OBJC_CLASS___PTModule,  "moduleWithTitle:contents:",  @"Prototyping",  v3));
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return (PTModule *)v20;
}

- (id)_hardwareEventSection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PTDefaults sharedInstance](&OBJC_CLASS___PTDefaults, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100006484;
  v17[3] = &unk_1000148A8;
  id v4 = v2;
  id v18 = v4;
  id v19 = v3;
  id v5 = v3;
  PTPrototypingEnumerateHardwareEventsWithBlock(v17);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000066C0;
  v15[3] = &unk_1000146B0;
  id v16 = v4;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = sub_1000066F0;
  v13 = &unk_1000148D0;
  id v14 = v16;
  id v6 = v16;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PTSwitchRow rowWithTitle:valueGetter:valueSetter:]( &OBJC_CLASS___PTSwitchRow,  "rowWithTitle:valueGetter:valueSetter:",  @"Multi Window Enabled",  v15,  &v10));
  objc_msgSend(v5, "addObject:", v7, v10, v11, v12, v13);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PTModule sectionWithRows:title:]( &OBJC_CLASS___PTModule,  "sectionWithRows:title:",  v5,  @"Show Prototyping UI"));
  return v8;
}

- (id)_killSection
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006990;
  v6[3] = &unk_100014858;
  v6[4] = self;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PTButtonRow rowWithTitle:actionHandler:]( &OBJC_CLASS___PTButtonRow,  "rowWithTitle:actionHandler:",  @"Kill SpringBoard",  v6));
  id v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:](&OBJC_CLASS___PTModule, "sectionWithRows:", v3));

  return v4;
}

- (void)_setModuleNeedsReload
{
  self->_moduleNeedsReload = 1;
}

- (void)_sendKillSpringBoard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained killSpringBoard];
}

- (PTUIClient)delegate
{
  return (PTUIClient *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PTDPrototypingSettings)prototypingSettings
{
  return self->_prototypingSettings;
}

- (PTParameterRecords)parameterRecordsOfTunedSettings
{
  return self->_parameterRecordsOfTunedSettings;
}

- (void)setParameterRecordsOfTunedSettings:(id)a3
{
}

- (BOOL)moduleNeedsReload
{
  return self->_moduleNeedsReload;
}

- (void)setModuleNeedsReload:(BOOL)a3
{
  self->_moduleNeedsReload = a3;
}

- (void).cxx_destruct
{
}

@end