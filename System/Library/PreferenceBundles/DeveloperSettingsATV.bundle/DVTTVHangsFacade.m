@interface DVTTVHangsFacade
- (BOOL)errorFindingLogs;
- (BOOL)errorFindingPendingLogs;
- (BOOL)goToNextAppsState;
- (BOOL)goToNextLogsState;
- (BOOL)isEnabled;
- (BOOL)isInternalBuild;
- (DVTTVHangsFacade)init;
- (HTDeveloperAppsFinder)appsFinder;
- (HTDeveloperSettings)settings;
- (HTHangsDataFinder)logsFinder;
- (NSArray)appRows;
- (NSArray)availableThresholdLabels;
- (NSArray)availableThresholdValues;
- (NSArray)logRows;
- (NSDictionary)logsFound;
- (NSDictionary)pendingLogsFound;
- (NSNumber)hangTracerThreshold;
- (int64_t)appsState;
- (int64_t)logsState;
- (void)fetchAllAppsAndHangEvents;
- (void)processNewHangEvents:(id)a3 forceUpdate:(BOOL)a4;
- (void)setAppRows:(id)a3;
- (void)setAppsFinder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setErrorFindingLogs:(BOOL)a3;
- (void)setErrorFindingPendingLogs:(BOOL)a3;
- (void)setHangTracerThreshold:(id)a3;
- (void)setLogsFinder:(id)a3;
- (void)setLogsFound:(id)a3;
- (void)setPendingLogsFound:(id)a3;
- (void)updateDeveloperApps;
- (void)updateHangEvents;
- (void)updatePendingHangEvents;
@end

@implementation DVTTVHangsFacade

- (DVTTVHangsFacade)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___DVTTVHangsFacade;
  v2 = -[DVTTVHangsFacade init](&v20, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___HTDeveloperSettings);
    settings = v2->_settings;
    v2->_settings = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___HTDeveloperAppsFinder);
    appsFinder = v2->_appsFinder;
    v2->_appsFinder = v5;

    -[HTDeveloperAppsFinder setDelegate:](v2->_appsFinder, "setDelegate:", v2);
    appRows = v2->_appRows;
    v2->_appsState = 0LL;
    v2->_appRows = (NSArray *)&__NSArray0__struct;

    objc_initWeak(&location, v2);
    v8 = objc_alloc(&OBJC_CLASS___HTHangsDataFinder);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_C2C8;
    v17[3] = &unk_187C8;
    objc_copyWeak(&v18, &location);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_C2FC;
    v15[3] = &unk_187C8;
    objc_copyWeak(&v16, &location);
    v9 = -[HTHangsDataFinder initWithLogUpdateCallback:tailspinSavedCallback:]( v8,  "initWithLogUpdateCallback:tailspinSavedCallback:",  v17,  v15);
    logsFinder = v2->_logsFinder;
    v2->_logsFinder = v9;

    v2->_logsState = 0LL;
    logsFound = v2->_logsFound;
    v2->_logsFound = (NSDictionary *)&__NSDictionary0__struct;

    pendingLogsFound = v2->_pendingLogsFound;
    v2->_pendingLogsFound = (NSDictionary *)&__NSDictionary0__struct;

    *(_WORD *)&v2->_errorFindingLogs = 0;
    logRows = v2->_logRows;
    v2->_logRows = (NSArray *)&__NSArray0__struct;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (BOOL)isEnabled
{
  return -[HTDeveloperSettings isEnabled](self->_settings, "isEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[DVTTVHangsFacade isEnabled](self, "isEnabled") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsFacade appRows](self, "appRows"));
    +[HTHangsAnalytics sendActivationEvent:developerAppCount:]( HTHangsAnalytics,  "sendActivationEvent:developerAppCount:",  v3,  [v5 count]);
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DVTTVHangsFacade settings](self, "settings"));
  [v6 setEnabled:v3];
}

- (NSNumber)hangTracerThreshold
{
  return +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[HTDeveloperSettings hangTracerThreshold](self->_settings, "hangTracerThreshold"));
}

- (void)setHangTracerThreshold:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsFacade hangTracerThreshold](self, "hangTracerThreshold"));
  id v5 = [v4 integerValue];
  id v6 = [v9 integerValue];

  if (v5 != v6) {
    +[HTHangsAnalytics sendHangThresholdChangedEvent:]( HTHangsAnalytics,  "sendHangThresholdChangedEvent:",  [v9 unsignedIntegerValue]);
  }
  id v7 = [v9 integerValue];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DVTTVHangsFacade settings](self, "settings"));
  [v8 setHangTracerThreshold:v7];
}

- (NSArray)availableThresholdValues
{
  return (NSArray *)-[HTDeveloperSettings availableThresholdsValues](self->_settings, "availableThresholdsValues");
}

- (NSArray)availableThresholdLabels
{
  return (NSArray *)-[HTDeveloperSettings availableThresholdsLongNames](self->_settings, "availableThresholdsLongNames");
}

- (BOOL)isInternalBuild
{
  return -[HTDeveloperSettings isInternalBuild](self->_settings, "isInternalBuild");
}

- (void)fetchAllAppsAndHangEvents
{
}

- (void)updateDeveloperApps
{
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x3042000000LL;
  v5[3] = sub_C5AC;
  v5[4] = sub_C5B8;
  objc_initWeak(&v6, self);
  appsFinder = self->_appsFinder;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_C5C0;
  v4[3] = &unk_18840;
  v4[4] = self;
  v4[5] = v5;
  -[HTDeveloperAppsFinder findApps:](appsFinder, "findApps:", v4);
  _Block_object_dispose(v5, 8);
  objc_destroyWeak(&v6);
}

- (BOOL)goToNextAppsState
{
  int64_t appsState = self->_appsState;
  self->_int64_t appsState = 2LL;
  return appsState != 2;
}

- (void)updateHangEvents
{
  logsFinder = self->_logsFinder;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_C940;
  v4[3] = &unk_18868;
  objc_copyWeak(&v5, &location);
  -[HTHangsDataFinder findEventsFilteringDeveloperApps:completionHandler:]( logsFinder,  "findEventsFilteringDeveloperApps:completionHandler:",  1LL,  v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updatePendingHangEvents
{
  logsFinder = self->_logsFinder;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_CAB8;
  v4[3] = &unk_18868;
  objc_copyWeak(&v5, &location);
  -[HTHangsDataFinder findProcessingEventsFilteringDeveloperApps:completionHandler:]( logsFinder,  "findProcessingEventsFilteringDeveloperApps:completionHandler:",  1LL,  v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)goToNextLogsState
{
  int64_t logsState = self->_logsState;
  int64_t v3 = 1LL;
  if (logsState) {
    int64_t v3 = 2LL;
  }
  self->_int64_t logsState = v3;
  return logsState != v3;
}

- (void)processNewHangEvents:(id)a3 forceUpdate:(BOOL)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  if (self->_errorFindingLogs && self->_errorFindingPendingLogs)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DVTTVHangsRow errorRow](&OBJC_CLASS___DVTTVHangsRow, "errorRow"));
    [v6 addObject:v7];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[HTHangsDataEntry sortedHangIDsByCreationDate:]( &OBJC_CLASS___HTHangsDataEntry,  "sortedHangIDsByCreationDate:",  v5));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)i)]);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[DVTTVHangsRow eventRowWithData:](&OBJC_CLASS___DVTTVHangsRow, "eventRowWithData:", v13));

        [v6 addObject:v14];
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }

  if (![v6 count])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[DVTTVHangsRow placeholderRow](&OBJC_CLASS___DVTTVHangsRow, "placeholderRow"));
    [v6 addObject:v15];
  }

  if (a4 || (-[NSArray isEqual:](self->_logRows, "isEqual:", v6) & 1) == 0)
  {
    -[DVTTVHangsFacade willChangeValueForKey:](self, "willChangeValueForKey:", @"logRows");
    objc_storeStrong((id *)&self->_logRows, v6);
    -[DVTTVHangsFacade didChangeValueForKey:](self, "didChangeValueForKey:", @"logRows");
  }
}

- (int64_t)appsState
{
  return self->_appsState;
}

- (NSArray)appRows
{
  return self->_appRows;
}

- (void)setAppRows:(id)a3
{
}

- (int64_t)logsState
{
  return self->_logsState;
}

- (NSArray)logRows
{
  return self->_logRows;
}

- (HTDeveloperSettings)settings
{
  return self->_settings;
}

- (HTDeveloperAppsFinder)appsFinder
{
  return self->_appsFinder;
}

- (void)setAppsFinder:(id)a3
{
}

- (HTHangsDataFinder)logsFinder
{
  return self->_logsFinder;
}

- (void)setLogsFinder:(id)a3
{
}

- (NSDictionary)logsFound
{
  return self->_logsFound;
}

- (void)setLogsFound:(id)a3
{
}

- (NSDictionary)pendingLogsFound
{
  return self->_pendingLogsFound;
}

- (void)setPendingLogsFound:(id)a3
{
}

- (BOOL)errorFindingLogs
{
  return self->_errorFindingLogs;
}

- (void)setErrorFindingLogs:(BOOL)a3
{
  self->_errorFindingLogs = a3;
}

- (BOOL)errorFindingPendingLogs
{
  return self->_errorFindingPendingLogs;
}

- (void)setErrorFindingPendingLogs:(BOOL)a3
{
  self->_errorFindingPendingLogs = a3;
}

- (void).cxx_destruct
{
}

@end