@interface ADAlarmContextProvider
- (ADAlarmContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4;
- (void)clockAlarmObserver:(id)a3 alarmDidDismiss:(id)a4;
- (void)clockAlarmObserver:(id)a3 alarmDidFire:(id)a4;
- (void)clockAlarmObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
@end

@implementation ADAlarmContextProvider

- (ADAlarmContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ADAlarmContextProvider;
  v9 = -[ADAlarmContextProvider init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_donationService, a3);
    if (v8) {
      v11 = (AFInstanceContext *)v8;
    }
    else {
      v11 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v10->_instanceContext;
    v10->_instanceContext = v11;

    v13 = -[SOClockAlarmObserver initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___SOClockAlarmObserver),  "initWithInstanceContext:",  v10->_instanceContext);
    observer = v10->_observer;
    v10->_observer = v13;

    -[SOClockAlarmObserver addListener:](v10->_observer, "addListener:", v10);
    -[AFContextDonation registerContextTransformer:forType:]( v10->_donationService,  "registerContextTransformer:forType:",  v10,  AFDeviceContextKeyAlarm);
  }

  return v10;
}

- (void)clockAlarmObserver:(id)a3 alarmDidFire:(id)a4
{
  id v4 = a4;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[ADAlarmContextProvider clockAlarmObserver:alarmDidFire:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceProximityManager sharedManager](&OBJC_CLASS___ADDeviceProximityManager, "sharedManager"));
  [v6 performProximityScan];
}

- (void)clockAlarmObserver:(id)a3 alarmDidDismiss:(id)a4
{
  id v4 = a4;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    int v7 = "-[ADAlarmContextProvider clockAlarmObserver:alarmDidDismiss:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)clockAlarmObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315394;
    v14 = "-[ADAlarmContextProvider clockAlarmObserver:snapshotDidUpdateFrom:to:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s #hal updated snapshot: %@",  (uint8_t *)&v13,  0x16u);
  }

  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v9 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
  uint64_t v10 = AFDeviceContextKeyAlarm;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:900.0]);
  id v12 = [v9 initWithType:v10 deliveryDate:v8 expirationDate:v11 redactedKeyPaths:0 historyConfiguration:0];

  -[AFContextDonation donateContext:withMetadata:pushToRemote:]( self->_donationService,  "donateContext:withMetadata:pushToRemote:",  v6,  v12,  1LL);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, id, id))a6;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___AFClockAlarmSnapshot);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
  {
    id v13 = v9;
    v14 = v13;
    if (!a5 || a5 == 50)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v13 alarmsByID]);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1001E7CE4;
      v29[3] = &unk_1004F5F20;
      id v30 = [v27 mutableCopy];
      id v15 = v30;
      [v27 enumerateKeysAndObjectsUsingBlock:v29];
      id v16 = objc_alloc(&OBJC_CLASS___AFClockAlarmSnapshot);
      id v17 = [v14 generation];
      v18 = (void *)objc_claimAutoreleasedReturnValue([v14 date]);
      v28 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 notifiedFiringAlarmIDs]);
      v20 = -[AFClockAlarmSnapshot initWithGeneration:date:alarmsByID:notifiedFiringAlarmIDs:]( v16,  "initWithGeneration:date:alarmsByID:notifiedFiringAlarmIDs:",  v17,  v18,  v15,  v19);

      id v21 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
      uint64_t v22 = AFDeviceContextKeyAlarm;
      v23 = (void *)objc_claimAutoreleasedReturnValue([v10 deliveryDate]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v10 expirationDate]);
      uint64_t v31 = *((void *)&AFClockAlarmSnapshotKey + 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
      id v26 = [v21 initWithType:v22 deliveryDate:v23 expirationDate:v24 redactedKeyPaths:v25 historyConfiguration:0];

      v14 = v28;
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