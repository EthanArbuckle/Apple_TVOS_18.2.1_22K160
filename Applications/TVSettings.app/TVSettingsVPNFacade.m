@interface TVSettingsVPNFacade
+ (BOOL)automaticallyNotifiesObserversOfActiveConfiguration;
+ (id)connectionStatusFormatter;
+ (id)sharedInstance;
- (BOOL)includesRelays;
- (NEConfigurationManager)configurationManager;
- (NSArray)configurations;
- (NSMutableDictionary)settingsConfigurationsByIdentifier;
- (OS_dispatch_queue)storeQueue;
- (TVSettingsVPNConfiguration)activeConfiguration;
- (TVSettingsVPNFacade)init;
- (id)configurationFormatter;
- (void)_presentOTAWarningAlertWithPresentingViewController:(id)a3;
- (void)_updateConfigurationsWithNEConfigurations:(id)a3;
- (void)loadConfigurationsWithCompletion:(id)a3;
- (void)removeConfiguration:(id)a3 completion:(id)a4;
- (void)saveConfiguration:(id)a3;
- (void)setActiveConfiguration:(id)a3;
- (void)setActiveConfiguration:(id)a3 presentingViewController:(id)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setConfigurations:(id)a3;
- (void)setSettingsConfigurationsByIdentifier:(id)a3;
- (void)setStoreQueue:(id)a3;
@end

@implementation TVSettingsVPNFacade

+ (id)sharedInstance
{
  if (qword_1001E15E8 != -1) {
    dispatch_once(&qword_1001E15E8, &stru_10018F528);
  }
  return (id)qword_1001E15E0;
}

- (TVSettingsVPNFacade)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsVPNFacade;
  v2 = -[TVSettingsVPNFacade init](&v15, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("TVSettings VPN", 0LL);
    storeQueue = v2->_storeQueue;
    v2->_storeQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NEConfigurationManager);
    configurationManager = v2->_configurationManager;
    v2->_configurationManager = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    settingsConfigurationsByIdentifier = v2->_settingsConfigurationsByIdentifier;
    v2->_settingsConfigurationsByIdentifier = v7;

    -[TVSettingsVPNFacade loadConfigurationsWithCompletion:](v2, "loadConfigurationsWithCompletion:", 0LL);
    objc_initWeak(&location, v2);
    v10 = v2->_storeQueue;
    v9 = v2->_configurationManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100025400;
    v12[3] = &unk_10018F550;
    objc_copyWeak(&v13, &location);
    -[NEConfigurationManager setChangedQueue:andHandler:](v9, "setChangedQueue:andHandler:", v10, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)loadConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  storeQueue = self->_storeQueue;
  configurationManager = self->_configurationManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100025598;
  v8[3] = &unk_10018F578;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  -[NEConfigurationManager loadConfigurationsWithCompletionQueue:handler:]( configurationManager,  "loadConfigurationsWithCompletionQueue:handler:",  storeQueue,  v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)saveConfiguration:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  configurationManager = self->_configurationManager;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 neConfiguration]);
  storeQueue = self->_storeQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100025770;
  v9[3] = &unk_10018F5A0;
  id v8 = v4;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  -[NEConfigurationManager saveConfiguration:withCompletionQueue:handler:]( configurationManager,  "saveConfiguration:withCompletionQueue:handler:",  v6,  storeQueue,  v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)removeConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  configurationManager = self->_configurationManager;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 neConfiguration]);
  storeQueue = self->_storeQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100025918;
  v13[3] = &unk_10018F5C8;
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  objc_copyWeak(&v16, &location);
  -[NEConfigurationManager removeConfiguration:withCompletionQueue:handler:]( configurationManager,  "removeConfiguration:withCompletionQueue:handler:",  v9,  storeQueue,  v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id)configurationFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_10018F608];
}

+ (id)connectionStatusFormatter
{
  uint64_t v2 = TSKLocString(@"VPNInactiveValue");
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v17[0] = v3;
  uint64_t v4 = TSKLocString(@"VPNNotConnectedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v17[1] = v5;
  uint64_t v6 = TSKLocString(@"VPNConnectingValue");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v17[2] = v7;
  uint64_t v8 = TSKLocString(@"VPNConnectedValue");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v17[3] = v9;
  uint64_t v10 = TSKLocString(@"VPNDisconnectingValue");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v17[4] = v11;
  uint64_t v12 = TSKLocString(@"VPNOnValue");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v17[5] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 6LL));

  id v15 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_1001AEB48,  v14);
  return v15;
}

+ (BOOL)automaticallyNotifiesObserversOfActiveConfiguration
{
  return 0;
}

- (void)setActiveConfiguration:(id)a3
{
}

- (void)setActiveConfiguration:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  -[TVSettingsVPNFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"activeConfiguration");
  objc_storeStrong((id *)&self->_activeConfiguration, a3);
  -[TVSettingsVPNFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"activeConfiguration");
  [v7 setEnabled:1];
  -[TVSettingsVPNFacade saveConfiguration:](self, "saveConfiguration:", v7);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNFacade configurations](self, "configurations", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v17 + 1) + 8LL * (void)v13);
        if (v14 != v7)
        {
          if ([*(id *)(*((void *)&v17 + 1) + 8 * (void)v13) enabled])
          {
            [v14 setEnabled:0];
            -[TVSettingsVPNFacade saveConfiguration:](self, "saveConfiguration:", v14);
          }

          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 neConfiguration]);
          unsigned int v16 = objc_msgSend(v15, "tvcs_isAppleConnectOTAConfiguration");

          if (v8 && v16) {
            -[TVSettingsVPNFacade _presentOTAWarningAlertWithPresentingViewController:]( self,  "_presentOTAWarningAlertWithPresentingViewController:",  v8);
          }
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

- (BOOL)includesRelays
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNFacade configurations](self, "configurations", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * (void)i) grade] == (id)2)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)_updateConfigurationsWithNEConfigurations:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v6)
  {
    char v25 = 0;
    goto LABEL_17;
  }

  id v7 = v6;
  char v25 = 0;
  uint64_t v8 = *(void *)v27;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(obj);
      }
      __int128 v10 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsVPNFacade settingsConfigurationsByIdentifier]( self,  "settingsConfigurationsByIdentifier"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      id v13 = (TVSettingsVPNConfiguration *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

      if (v13)
      {
        -[TVSettingsVPNConfiguration updateWithNEConfiguration:](v13, "updateWithNEConfiguration:", v10);
      }

      else
      {
        id v13 = -[TVSettingsVPNConfiguration initWithNEConfiguration:]( objc_alloc(&OBJC_CLASS___TVSettingsVPNConfiguration),  "initWithNEConfiguration:",  v10);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsVPNFacade settingsConfigurationsByIdentifier]( self,  "settingsConfigurationsByIdentifier"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        [v14 setObject:v13 forKeyedSubscript:v15];
      }

      [v5 addObject:v13];
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 VPN]);
      if ([v16 isEnabled])
      {
      }

      else
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v10 relay]);
        unsigned int v18 = [v17 isEnabled];

        if (!v18) {
          goto LABEL_13;
        }
      }

      -[TVSettingsVPNFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"activeConfiguration");
      objc_storeStrong((id *)&self->_activeConfiguration, v13);
      -[TVSettingsVPNFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"activeConfiguration");
      char v25 = 1;
LABEL_13:
    }

    id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  }

  while (v7);
LABEL_17:

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNFacade configurations](self, "configurations"));
  __int128 v20 = v5;
  unsigned __int8 v21 = [v19 isEqualToArray:v5];

  if ((v21 & 1) == 0)
  {
    if ([v5 count])
    {
      id v22 = [v5 copy];
      -[TVSettingsVPNFacade setConfigurations:](self, "setConfigurations:", v22);
    }

    else
    {
      -[TVSettingsVPNFacade setConfigurations:](self, "setConfigurations:", 0LL);
    }
  }

  if ((v25 & 1) == 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);
    -[TVSettingsVPNFacade setActiveConfiguration:](self, "setActiveConfiguration:", v23);
  }
}

- (void)_presentOTAWarningAlertWithPresentingViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = TSKLocString(@"VPNOTAWarningTitle");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"VPNOTAWarningDescription");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNFacade activeConfiguration](self, "activeConfiguration"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 displayName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v8, v10));
  id v16 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v11,  1LL));

  uint64_t v12 = TSKLocString(@"VPNOTAWarningButtonTitle");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  0LL));
  [v16 addAction:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v16 addAction:v15];

  [v4 presentViewController:v16 animated:1 completion:0];
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
}

- (TVSettingsVPNConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (OS_dispatch_queue)storeQueue
{
  return self->_storeQueue;
}

- (void)setStoreQueue:(id)a3
{
}

- (NEConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (NSMutableDictionary)settingsConfigurationsByIdentifier
{
  return self->_settingsConfigurationsByIdentifier;
}

- (void)setSettingsConfigurationsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end