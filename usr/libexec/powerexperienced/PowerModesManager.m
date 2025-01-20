@interface PowerModesManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ChargeDurationPredictor)chargingPredictor;
- (DeviceContext)deviceContext;
- (NSMutableDictionary)powerModes;
- (NSString)overridePresent;
- (NSUserDefaults)defaults;
- (PowerModesManager)init;
- (PowerModesService)powerModesService;
- (ResourceManager)resourceManager;
- (id)getModeFromName:(id)a3;
- (id)getSavedExitDate:(id)a3;
- (void)clearState;
- (void)disablePowerMode:(id)a3 withReply:(id)a4;
- (void)enablePowerMode:(id)a3 withReply:(id)a4;
- (void)enterMode:(id)a3;
- (void)evaluatePowerModes;
- (void)evaluatePowerModes:(id)a3 withContext:(id)a4;
- (void)exitMode:(id)a3;
- (void)initializeAllModes;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)restoreState;
- (void)saveState;
- (void)setChargingPredictor:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDeviceContext:(id)a3;
- (void)setOverridePresent:(id)a3;
- (void)setPowerModes:(id)a3;
- (void)setPowerModesService:(id)a3;
- (void)setResourceManager:(id)a3;
- (void)start;
- (void)updateAllowOnCharger:(id)a3 withState:(BOOL)a4 andReply:(id)a5;
- (void)updateEntryDelay:(id)a3 withDelay:(double)a4 andReply:(id)a5;
- (void)updateMaxEngagementDuration:(id)a3 withDuration:(double)a4 andReply:(id)a5;
- (void)updatePowerMode:(id)a3 withState:(BOOL)a4 andReply:(id)a5;
@end

@implementation PowerModesManager

- (void)initializeAllModes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000ACF8;
  block[3] = &unk_1000145B0;
  block[4] = self;
  if (qword_10001B798 != -1) {
    dispatch_once(&qword_10001B798, block);
  }
}

+ (id)sharedInstance
{
  if (qword_10001B7B0 != -1) {
    dispatch_once(&qword_10001B7B0, &stru_100014788);
  }
  return (id)qword_10001B7A8;
}

- (PowerModesManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PowerModesManager;
  v2 = -[PowerModesManager initWithMachServiceName:]( &v18,  "initWithMachServiceName:",  @"com.apple.powerexperienced.powermodes");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
    dispatch_queue_t userQueue = v2->super._userQueue;
    v2->super._dispatch_queue_t userQueue = (dispatch_queue_t)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[ResourceManager sharedInstance](&OBJC_CLASS___ResourceManager, "sharedInstance"));
    reserved0 = v2->super.reserved0;
    v2->super.reserved0 = (void *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[PowerModesService sharedInstance](&OBJC_CLASS___PowerModesService, "sharedInstance"));
    id delegate = v2->super._delegate;
    v2->super._id delegate = (id)v7;

    v9 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.powerexperienced.powermodes");
    state = (void *)v2->super._state;
    v2->super._state = (uint64_t)v9;

    -[PowerModesManager initializeAllModes](v2, "initializeAllModes");
    v11 = (os_log_s *)qword_10001B7A0;
    if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "starting service", buf, 2u);
    }

    -[PowerModesManager setDelegate:](v2, "setDelegate:", v2);
    id v12 = sub_100009834();
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000B0A8;
    block[3] = &unk_1000145B0;
    v16 = v2;
    dispatch_async(v13, block);
  }

  return v2;
}

- (void)start
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager deviceContext](self, "deviceContext"));
  [v3 addObserver:self forKeyPath:@"currentContext" options:3 context:0];

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(+[ChargeDurationPredictor sharedInstance](&OBJC_CLASS___ChargeDurationPredictor, "sharedInstance"));
  serviceName = self->super._serviceName;
  self->super._serviceName = v4;

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PowerModesManager chargingPredictor](self, "chargingPredictor"));
  [v6 addObserver:self forKeyPath:@"predictorOutput" options:3 context:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____PowerModesManagerProtocol));
  [v5 setExportedInterface:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.powerexperience.powermode.update"]);
  if (v7
    && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && [v7 BOOLValue])
  {
    v9 = (void *)qword_10001B7A0;
    if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      v14[0] = 67109120;
      v14[1] = [v5 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "PowerModesManager: listener: accepted new connection from pid %d",  (uint8_t *)v14,  8u);
    }

    [v5 setExportedObject:self];
    [v5 resume];
    BOOL v11 = 1;
  }

  else
  {
    id v12 = (void *)qword_10001B7A0;
    if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_ERROR)) {
      sub_10000D950(v12, v5);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a5;
  id v8 = sub_100009834();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000B39C;
  v11[3] = &unk_100014510;
  id v12 = v7;
  v13 = self;
  id v10 = v7;
  dispatch_async(v9, v11);
}

- (void)evaluatePowerModes
{
  id v3 = sub_100009834();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager deviceContext](self, "deviceContext"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 currentContext]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager resourceManager](self, "resourceManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 resourceHints]);

  -[PowerModesManager evaluatePowerModes:withContext:](self, "evaluatePowerModes:withContext:", v7, v8);
}

- (void)evaluatePowerModes:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v38 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager overridePresent](self, "overridePresent"));

  if (!v7)
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
    id v11 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (!v11) {
      goto LABEL_26;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v45;
    id v36 = v6;
    while (1)
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v15]);

        if (([v17 isEnabled] & 1) == 0)
        {
          v26 = (void *)qword_10001B7A0;
          if (!os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_INFO)) {
            goto LABEL_22;
          }
          v21 = v26;
          v27 = (objc_class *)objc_opt_class(v17);
          v28 = NSStringFromClass(v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          *(_DWORD *)buf = 138412290;
          v50 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%@ is disabled. Skipping evaluation",  buf,  0xCu);

          goto LABEL_18;
        }

        if ([v17 isSupportedPlatform])
        {
          if ([v17 evaluatePowerModeWithResourceHints:v6 andContext:v38])
          {
            [v17 getEntryDelay];
            double v19 = v18;
            v20 = v17;
            v21 = v20;
            if (v19 <= 0.0)
            {
              -[PowerModesManager enterMode:](self, "enterMode:", v20);
            }

            else if ((-[os_log_s pendingDelayedEntryTimer](v20, "pendingDelayedEntryTimer") & 1) == 0)
            {
              dispatch_time_t when = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v19 * 1000000000.0));
              id v22 = sub_100009834();
              v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_10000B8D0;
              block[3] = &unk_1000147B0;
              v40 = v21;
              v41 = self;
              v24 = v40;
              v42 = v24;
              double v43 = v19;
              dispatch_after(when, v23, block);

              v25 = v24;
              id v6 = v36;
              -[os_log_s setPendingDelayedEntryTimer:](v25, "setPendingDelayedEntryTimer:", 1LL);
            }

- (void)enterMode:(id)a3
{
  id v4 = a3;
  if (([v4 getState] & 1) == 0)
  {
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
    id v6 = [v5 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v55;
      id v9 = &OBJC_METACLASS___LongChargingMode;
      v49 = self;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v55 != v8) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
          id v12 = (objc_class *)objc_opt_class(v4);
          uint64_t v13 = NSStringFromClass(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          unsigned __int8 v15 = [v11 isEqualToString:v14];

          if ((v15 & 1) == 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v11]);

            if ([v17 getState]
              && [v17 isEnabled]
              && [v17 isSupportedPlatform])
            {
              info = v9[48].info;
              if (os_log_type_enabled((os_log_t)info, OS_LOG_TYPE_DEFAULT))
              {
                double v19 = info;
                v20 = (objc_class *)objc_opt_class(v17);
                v21 = NSStringFromClass(v20);
                id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                v23 = (objc_class *)objc_opt_class(v4);
                v24 = NSStringFromClass(v23);
                v25 = v9;
                v26 = (void *)objc_claimAutoreleasedReturnValue(v24);
                *(_DWORD *)buf = 138412546;
                v59 = v22;
                __int16 v60 = 2112;
                double v61 = *(double *)&v26;
                _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "exiting mode %@ before entering %@",  buf,  0x16u);

                id v9 = v25;
                self = v49;
              }

              -[PowerModesManager exitMode:](self, "exitMode:", v17);
            }
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v54 objects:v62 count:16];
      }

      while (v7);
    }

    [v4 enterPowerMode];
    if ([v4 getState])
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModesService](self, "powerModesService"));
      v28 = (objc_class *)objc_opt_class(v4);
      v29 = NSStringFromClass(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      [v27 updateClientsforMode:v30 withState:1];

      [v4 getMaxEngagementDuration];
      if (v31 != 0.0)
      {
        double v32 = v31;
        v33 = (objc_class *)objc_opt_class(v4);
        v34 = NSStringFromClass(v33);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        id v36 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager getSavedExitDate:](self, "getSavedExitDate:", v35));

        if (v36)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
          unsigned __int8 v38 = [v36 isEqualToDate:v37];

          if ((v38 & 1) == 0)
          {
            v39 = (os_log_s *)qword_10001B7A0;
            if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v36;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Saved exit date %@", buf, 0xCu);
            }

            [v36 timeIntervalSinceNow];
            double v32 = v40;
          }
        }

        v41 = (void *)qword_10001B7A0;
        if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT))
        {
          v42 = v41;
          double v43 = (objc_class *)objc_opt_class(v4);
          __int128 v44 = NSStringFromClass(v43);
          __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          *(_DWORD *)buf = 138412546;
          v59 = v45;
          __int16 v60 = 2048;
          double v61 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Setting a timer to exit %@ after %f seconds",  buf,  0x16u);
        }

        dispatch_time_t v46 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v32 * 1000000000.0));
        id v47 = sub_100009834();
        v48 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v47);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000BEB4;
        block[3] = &unk_1000143A8;
        double v53 = v32;
        id v51 = v4;
        v52 = self;
        dispatch_after(v46, v48, block);
      }
    }

    -[PowerModesManager saveState](self, "saveState");
  }
}

- (void)exitMode:(id)a3
{
  id v10 = a3;
  unsigned int v4 = [v10 getState];
  id v5 = v10;
  if (v4)
  {
    [v10 exitPowerMode];
    if (([v10 getState] & 1) == 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModesService](self, "powerModesService"));
      id v7 = (objc_class *)objc_opt_class(v10);
      uint64_t v8 = NSStringFromClass(v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      [v6 updateClientsforMode:v9 withState:0];
    }

    -[PowerModesManager saveState](self, "saveState");
    id v5 = v10;
  }
}

- (void)saveState
{
  id v3 = sub_100009834();
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

        if (v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
          if ([v11 getState])
          {
            [v11 getMaxEngagementDuration];
            if (v13 != 0.0)
            {
              [v11 getMaxEngagementDuration];
              uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));

              id v12 = (void *)v14;
            }
          }

          v28[0] = @"state";
          unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 getState]));
          v29[0] = v15;
          v28[1] = @"enabled";
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v11 isEnabled]));
          v28[2] = @"exitDate";
          v29[1] = v16;
          v29[2] = v12;
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));

          double v18 = (objc_class *)objc_opt_class(v11);
          double v19 = NSStringFromClass(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          [v23 setObject:v17 forKeyedSubscript:v20];
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }

    while (v6);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager defaults](self, "defaults"));
  [v21 setValue:v23 forKey:@"modes"];
}

- (void)restoreState
{
  id v3 = sub_100009834();
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager defaults](self, "defaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"modes"]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys", 0));
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v11);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager getModeFromName:](self, "getModeFromName:", v12));
          if (v14)
          {
            unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);
            [v14 restoreState:v15];

            else {
              -[PowerModesManager exitMode:](self, "exitMode:", v14);
            }
          }
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }
}

- (void)clearState
{
  id v3 = (os_log_s *)qword_10001B7A0;
  if (os_log_type_enabled((os_log_t)qword_10001B7A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing state after a reboot", v7, 2u);
  }

  id v4 = sub_100009834();
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager defaults](self, "defaults"));
  [v6 removeObjectForKey:@"modes"];
}

- (id)getSavedExitDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager defaults](self, "defaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"modes"]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"exitDate"]);

  return v8;
}

- (id)getModeFromName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModesManager powerModes](self, "powerModes"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)disablePowerMode:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100009834();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C6E4;
  block[3] = &unk_1000147D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)enablePowerMode:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100009834();
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C83C;
  block[3] = &unk_1000147D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)updatePowerMode:(id)a3 withState:(BOOL)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100009834();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_10000C998;
  v14[3] = &unk_100014800;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)updateAllowOnCharger:(id)a3 withState:(BOOL)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100009834();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_10000CBE8;
  v14[3] = &unk_100014800;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)updateEntryDelay:(id)a3 withDelay:(double)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100009834();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_10000CD20;
  v14[3] = &unk_100014828;
  v14[4] = self;
  id v15 = v8;
  double v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)updateMaxEngagementDuration:(id)a3 withDuration:(double)a4 andReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100009834();
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_10000CE50;
  v14[3] = &unk_100014828;
  v14[4] = self;
  id v15 = v8;
  double v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (NSMutableDictionary)powerModes
{
  return (NSMutableDictionary *)self->super._xconnection;
}

- (void)setPowerModes:(id)a3
{
}

- (DeviceContext)deviceContext
{
  return (DeviceContext *)self->super._userQueue;
}

- (void)setDeviceContext:(id)a3
{
}

- (ResourceManager)resourceManager
{
  return (ResourceManager *)self->super.reserved0;
}

- (void)setResourceManager:(id)a3
{
}

- (PowerModesService)powerModesService
{
  return (PowerModesService *)self->super._delegate;
}

- (void)setPowerModesService:(id)a3
{
}

- (ChargeDurationPredictor)chargingPredictor
{
  return (ChargeDurationPredictor *)self->super._serviceName;
}

- (void)setChargingPredictor:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)self->super._state;
}

- (void)setDefaults:(id)a3
{
}

- (NSString)overridePresent
{
  return (NSString *)self->super._reserved1;
}

- (void)setOverridePresent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end