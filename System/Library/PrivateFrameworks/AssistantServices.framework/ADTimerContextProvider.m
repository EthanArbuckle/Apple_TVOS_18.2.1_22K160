@interface ADTimerContextProvider
- (ADTimerContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)clockTimerObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5;
- (void)clockTimerObserver:(id)a3 timerDidDismiss:(id)a4;
- (void)clockTimerObserver:(id)a3 timerDidFire:(id)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
@end

@implementation ADTimerContextProvider

- (ADTimerContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADTimerContextProvider;
  v8 = -[ADTimerContextProvider init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_donationService, v6);
    if (v7) {
      v10 = (AFInstanceContext *)v7;
    }
    else {
      v10 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v9->_instanceContext;
    v9->_instanceContext = v10;

    v12 = -[SOClockTimerObserver initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___SOClockTimerObserver),  "initWithInstanceContext:",  v9->_instanceContext);
    observer = v9->_observer;
    v9->_observer = v12;

    -[SOClockTimerObserver addListener:](v9->_observer, "addListener:", v9);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_donationService);
    [WeakRetained registerContextTransformer:v9 forType:AFDeviceContextKeyTimer];
  }

  return v9;
}

- (void)clockTimerObserver:(id)a3 timerDidFire:(id)a4
{
  id v4 = a4;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    v8 = "-[ADTimerContextProvider clockTimerObserver:timerDidFire:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceProximityManager sharedManager](&OBJC_CLASS___ADDeviceProximityManager, "sharedManager"));
  [v6 performProximityScan];
}

- (void)clockTimerObserver:(id)a3 timerDidDismiss:(id)a4
{
  id v4 = a4;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    int v7 = "-[ADTimerContextProvider clockTimerObserver:timerDidDismiss:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)clockTimerObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315394;
    v15 = "-[ADTimerContextProvider clockTimerObserver:snapshotDidUpdateFrom:to:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s #hal updated snapshot: %@",  (uint8_t *)&v14,  0x16u);
  }

  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v9 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
  uint64_t v10 = AFDeviceContextKeyTimer;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:900.0]);
  id v12 = [v9 initWithType:v10 deliveryDate:v8 expirationDate:v11 redactedKeyPaths:0 historyConfiguration:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  [WeakRetained donateContext:v6 withMetadata:v12 pushToRemote:1];
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, id, id))a6;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___AFClockTimerSnapshot);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
  {
    id v13 = v9;
    int v14 = v13;
    if (!a5 || a5 == 50)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v13 timersByID]);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1000C2D84;
      v29[3] = &unk_1004F9CB8;
      id v30 = [v27 mutableCopy];
      id v15 = v30;
      [v27 enumerateKeysAndObjectsUsingBlock:v29];
      __int16 v16 = objc_alloc(&OBJC_CLASS___AFClockTimerSnapshot);
      id v17 = [v14 generation];
      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 date]);
      v28 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 notifiedFiringTimerIDs]);
      v20 = -[AFClockTimerSnapshot initWithGeneration:date:timersByID:notifiedFiringTimerIDs:]( v16,  "initWithGeneration:date:timersByID:notifiedFiringTimerIDs:",  v17,  v18,  v15,  v19);

      id v21 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
      uint64_t v22 = AFDeviceContextKeyTimer;
      v23 = (void *)objc_claimAutoreleasedReturnValue([v10 deliveryDate]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v10 expirationDate]);
      uint64_t v31 = AFClockTimerSnapshotKey[2];
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
      id v26 = [v21 initWithType:v22 deliveryDate:v23 expirationDate:v24 redactedKeyPaths:v25 historyConfiguration:0];

      int v14 = v28;
      v11[2](v11, v20, v26);
    }

    else if (a5 == 10)
    {
      v11[2](v11, v13, v10);
    }
  }

  else
  {
    v11[2](v11, 0LL, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end