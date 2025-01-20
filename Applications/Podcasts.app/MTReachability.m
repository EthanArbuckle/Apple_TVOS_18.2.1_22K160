@interface MTReachability
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (BOOL)hasDeterminedActualGlobalCellularState;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isGlobalCellularEnabled;
- (BOOL)isPodcastsCellularDownloadsEnabled;
- (BOOL)isReachable;
- (BOOL)isReachableViaCellular;
- (BOOL)isReachableViaWifi;
- (BOOL)showInternetUnreachableDialog;
- (BOOL)showInternetUnreachableDialogWithAcknowledmentBlock:(id)a3;
- (ITMReachability)reachability;
- (MTReachability)init;
- (NSHashTable)callbacks;
- (OS_dispatch_queue)cellularQueue;
- (RadiosPreferences)radiosPreferences;
- (id)copy;
- (id)reasonTextForNoInternet;
- (int64_t)networkStatus;
- (unint64_t)reasonForNoInternet;
- (void)_applicationDidBecomeActive;
- (void)_showAlertForInternetUnavailableReason:(unint64_t)a3 completion:(id)a4;
- (void)_updateAirplaneMode;
- (void)_updateGlobalCellularWithCompletion:(id)a3;
- (void)_updateReachability;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setCallbacks:(id)a3;
- (void)setCellularQueue:(id)a3;
- (void)setGlobalCellularEnabled:(BOOL)a3;
- (void)setHasDeterminedActualGlobalCellularState:(BOOL)a3;
- (void)setNetworkStatus:(int64_t)a3;
- (void)setRadiosPreferences:(id)a3;
- (void)setReachability:(id)a3;
- (void)setReachable:(BOOL)a3;
@end

@implementation MTReachability

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100087054;
  block[3] = &unk_100240300;
  block[4] = a1;
  if (qword_1002B6A50 != -1) {
    dispatch_once(&qword_1002B6A50, block);
  }
  return (id)qword_1002B6A48;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance", a3));
}

- (id)copy
{
  return (id)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
}

- (MTReachability)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MTReachability;
  v2 = -[MTReachability init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = _MTLogCategoryNetwork(v2);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing Reachability", buf, 2u);
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    callbacks = v3->_callbacks;
    v3->_callbacks = (NSHashTable *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MTReachability.cellularQueue", 0LL);
    cellularQueue = v3->_cellularQueue;
    v3->_cellularQueue = (OS_dispatch_queue *)v8;

    v3->_hasDeterminedActualGlobalCellularState = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
    v3->_globalCellularEnabled = [v10 BOOLForKey:@"MTGlobalCellularUserDefaultKey"];

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[ITMReachability reachabilityForInternetConnection]( &OBJC_CLASS___ITMReachability,  "reachabilityForInternetConnection"));
    reachability = v3->_reachability;
    v3->_reachability = (ITMReachability *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v3 selector:"_updateReachability" name:kReachabilityChangedNotification object:v3->_reachability];

    -[ITMReachability startNotifier](v3->_reachability, "startNotifier");
    -[MTReachability _updateReachability](v3, "_updateReachability");
    v14 = objc_alloc_init(&OBJC_CLASS___RadiosPreferences);
    radiosPreferences = v3->_radiosPreferences;
    v3->_radiosPreferences = v14;

    -[RadiosPreferences setDelegate:](v3->_radiosPreferences, "setDelegate:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 addObserver:v3 selector:"_applicationDidBecomeActive" name:MTApplicationDidBecomeActiveNotification object:0];

    -[MTReachability _updateAirplaneMode](v3, "_updateAirplaneMode");
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000872DC;
    v18[3] = &unk_10023FF98;
    v19 = v3;
    -[MTReachability _updateGlobalCellularWithCompletion:](v19, "_updateGlobalCellularWithCompletion:", v18);
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability reachability](self, "reachability"));
  [v3 stopNotifier];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v5 = kReachabilityChangedNotification;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability reachability](self, "reachability"));
  [v4 removeObserver:self name:v5 object:v6];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTReachability;
  -[MTReachability dealloc](&v7, "dealloc");
}

- (void)_applicationDidBecomeActive
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000873F0;
  v3[3] = &unk_10023FF98;
  v3[4] = self;
  -[MTReachability _updateGlobalCellularWithCompletion:](self, "_updateGlobalCellularWithCompletion:", v3);
}

- (void)_updateReachability
{
  uint64_t v3 = _MTLogCategoryNetwork(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating reachability", buf, 2u);
  }

  BOOL v5 = -[MTReachability isReachable](self, "isReachable");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability reachability](self, "reachability"));
  -[MTReachability setNetworkStatus:](self, "setNetworkStatus:", [v6 currentReachabilityStatus]);

  -[MTReachability setReachable:](self, "setReachable:", 1LL);
  id v7 = -[MTReachability networkStatus](self, "networkStatus");
  if (v7)
  {
    if (v7 == (id)1)
    {
      BOOL v8 = 1LL;
    }

    else
    {
      if (v7 != (id)2) {
        goto LABEL_10;
      }
      BOOL v8 = -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled");
    }
  }

  else
  {
    BOOL v8 = 0LL;
  }

  id v7 = -[MTReachability setReachable:](self, "setReachable:", v8);
LABEL_10:
  uint64_t v9 = _MTLogCategoryNetwork(v7);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability reachability](self, "reachability"));
    id v12 = [v11 currentReachabilityStatus];
    *(_DWORD *)buf = 134217984;
    *(void *)v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "\treachability status <%ld>", buf, 0xCu);
  }

  uint64_t v14 = _MTLogCategoryNetwork(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v38 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "\tcellular enabled <%x>", buf, 8u);
  }

  uint64_t v18 = _MTLogCategoryNetwork(v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v20 = -[MTReachability hasDeterminedActualGlobalCellularState](self, "hasDeterminedActualGlobalCellularState");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v38 = v20 ^ 1;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "\tis using cached global cellular setting <%x>",  buf,  8u);
  }

  uint64_t v22 = _MTLogCategoryNetwork(v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v24 = -[MTReachability isReachable](self, "isReachable");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v38 = v5;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "\treachability changing from %i to %i",  buf,  0xEu);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  objc_sync_enter(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  id v27 = [v26 copy];

  objc_sync_exit(v25);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v28 = v27;
  id v29 = [v28 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v33;
    do
    {
      v31 = 0LL;
      do
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend( *(id *)(*((void *)&v32 + 1) + 8 * (void)v31),  "reachabilityChangedFrom:to:",  v5,  -[MTReachability isReachable](self, "isReachable", (void)v32));
        v31 = (char *)v31 + 1;
      }

      while (v29 != v31);
      id v29 = [v28 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v29);
  }
}

- (void)setGlobalCellularEnabled:(BOOL)a3
{
  self->_globalCellularEnabled = a3;
  -[MTReachability setHasDeterminedActualGlobalCellularState:](self, "setHasDeterminedActualGlobalCellularState:", 1LL);
}

- (void)setHasDeterminedActualGlobalCellularState:(BOOL)a3
{
  self->_hasDeterminedActualGlobalCellularState = a3;
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSharedUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSharedUserDefaults"));
    objc_msgSend( v4,  "setBool:forKey:",  -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled"),  @"MTGlobalCellularUserDefaultKey");
  }

- (void)addObserver:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  objc_sync_enter(v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  objc_sync_enter(v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTReachability callbacks](self, "callbacks"));
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (id)reasonTextForNoInternet
{
  unint64_t v2 = -[MTReachability reasonForNoInternet](self, "reasonForNoInternet");
  switch(v2)
  {
    case 1uLL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v4 = v3;
      BOOL v5 = @"Airplane Mode";
      break;
    case 2uLL:
      int v7 = MGGetBoolAnswer(@"wapi");
      BOOL v8 = @"NO_WIFI";
      if (v7) {
        BOOL v8 = @"NO_WLAN";
      }
      uint64_t v9 = v8;
      id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v9 value:&stru_100248948 table:0]);

      goto LABEL_10;
    case 3uLL:
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v4 = v3;
      BOOL v5 = @"No Internet";
      break;
    default:
      id v6 = 0LL;
      return v6;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:&stru_100248948 table:0]);
LABEL_10:

  return v6;
}

- (BOOL)showInternetUnreachableDialog
{
  return -[MTReachability showInternetUnreachableDialogWithAcknowledmentBlock:]( self,  "showInternetUnreachableDialogWithAcknowledmentBlock:",  0LL);
}

- (BOOL)showInternetUnreachableDialogWithAcknowledmentBlock:(id)a3
{
  id v4 = a3;
  if (-[MTReachability isReachable](self, "isReachable")
    || (unint64_t v5 = -[MTReachability reasonForNoInternet](self, "reasonForNoInternet")) == 0)
  {
    BOOL v6 = 0;
  }

  else
  {
    -[MTReachability _showAlertForInternetUnavailableReason:completion:]( self,  "_showAlertForInternetUnavailableReason:completion:",  v5,  v4);
    BOOL v6 = 1;
  }

  return v6;
}

- (unint64_t)reasonForNoInternet
{
  if (-[MTReachability networkStatus](self, "networkStatus"))
  {
    if ((id)-[MTReachability networkStatus](self, "networkStatus") == (id)2)
    {
      if (-[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled")) {
        return 0LL;
      }
      else {
        return 2LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  else if (-[MTReachability isAirplaneModeEnabled](self, "isAirplaneModeEnabled"))
  {
    return 1LL;
  }

  else if (-[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled") {
         || (MGGetBoolAnswer(@"cellular-data") & 1) == 0)
  }
  {
    return 3LL;
  }

  else
  {
    return 2LL;
  }

- (BOOL)isPodcastsCellularDownloadsEnabled
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "_applePodcastsFoundationSettingsUserDefaults"));
  else {
    BOOL v4 = -[MTReachability isGlobalCellularEnabled](self, "isGlobalCellularEnabled");
  }

  return v4;
}

- (BOOL)isReachableViaCellular
{
  return (id)-[MTReachability networkStatus](self, "networkStatus") == (id)2;
}

- (BOOL)isReachableViaWifi
{
  return (id)-[MTReachability networkStatus](self, "networkStatus") == (id)1;
}

- (void)_showAlertForInternetUnavailableReason:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_13;
    case 1uLL:
      int v6 = MGGetBoolAnswer(@"wapi");
      int v7 = @"ALERT_TITLE_AIRPLANE_MODE_WIFI";
      if (v6) {
        int v7 = @"ALERT_TITLE_AIRPLANE_MODE_WLAN";
      }
      BOOL v8 = v7;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v8 value:&stru_100248948 table:0]);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PSAirplaneModeSettingsDetail preferencesURL]( &OBJC_CLASS___PSAirplaneModeSettingsDetail,  "preferencesURL"));
      id v12 = 0LL;
      goto LABEL_10;
    case 2uLL:
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"ALERT_TITLE_GLOBAL_CELLULAR_DISABLED" value:&stru_100248948 table:0]);

      int v14 = MGGetBoolAnswer(@"wapi");
      v15 = @"ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WIFI";
      if (v14) {
        v15 = @"ALERT_MESSAGE_GLOBAL_CELLULAR_DISABLED_WLAN";
      }
      unsigned int v16 = v15;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedStringForKey:v16 value:&stru_100248948 table:0]);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PSCellularDataSettingsDetail preferencesURL]( &OBJC_CLASS___PSCellularDataSettingsDetail,  "preferencesURL"));
      goto LABEL_10;
    case 3uLL:
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"ALERT_TITLE_NO_INTERNET_ATV" value:&stru_100248948 table:0]);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"ALERT_MESSAGE_NO_INTERNET_ATV" value:&stru_100248948 table:0]);

      uint64_t v11 = 0LL;
      goto LABEL_10;
    default:
      uint64_t v11 = 0LL;
      id v12 = 0LL;
      uint64_t v10 = 0LL;
LABEL_10:
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[MTAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___MTAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v10,  v12,  1LL,  v10));
      if (v11)
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedStringForKey:@"Settings" value:&stru_100248948 table:0]);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_100087F70;
        v30[3] = &unk_100242B68;
        id v31 = v11;
        id v32 = v5;
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  0LL,  v30));

        [v20 addAction:v23];
      }

      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:@"OK" value:&stru_100248948 table:0]);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100087FC8;
      v28[3] = &unk_100242A10;
      id v29 = v5;
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v25,  0LL,  v28));

      [v20 addAction:v26];
      [v20 presentAnimated:1 completion:0];

LABEL_13:
      return;
  }

- (void)_updateGlobalCellularWithCompletion:(id)a3
{
  id v5 = a3;
  -[MTReachability setGlobalCellularEnabled:](self, "setGlobalCellularEnabled:", 1LL);
  BOOL v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    BOOL v4 = v5;
  }
}

- (void)_updateAirplaneMode
{
  unsigned int v3 = -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
  if (self->_airplaneModeEnabled != v3)
  {
    self->_airplaneModeEnabled = v3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_airplaneModeEnabled));
    [v5 postNotificationName:@"MTAirplaneModeChangedNotification" object:v4];
  }

- (BOOL)isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (BOOL)isGlobalCellularEnabled
{
  return self->_globalCellularEnabled;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (ITMReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (NSHashTable)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)setRadiosPreferences:(id)a3
{
}

- (OS_dispatch_queue)cellularQueue
{
  return self->_cellularQueue;
}

- (void)setCellularQueue:(id)a3
{
}

- (BOOL)hasDeterminedActualGlobalCellularState
{
  return self->_hasDeterminedActualGlobalCellularState;
}

- (void).cxx_destruct
{
}

@end