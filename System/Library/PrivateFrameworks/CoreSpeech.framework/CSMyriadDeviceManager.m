@interface CSMyriadDeviceManager
+ (CSMyriadDeviceManager)sharedInstance;
- (CSMyriadGoodnessScoreEvaluator)hostDeviceGoodnessScoreEvaluator;
- (NSMutableDictionary)accessoryGoodnessScoreEvaluator;
- (OS_dispatch_queue)queue;
- (double)myriadBoostScoreForAccessoryWithId:(id)a3;
- (id)_accessoryGoodnessScoreEvaluator;
- (id)_init;
- (void)homeHubManager:(id)a3 didActivateEndpoint:(id)a4;
- (void)homeHubManager:(id)a3 didAddEndpoint:(id)a4;
- (void)homeHubManager:(id)a3 didDeactivateEndpoint:(id)a4;
- (void)homeHubManager:(id)a3 didDeleteEndpoint:(id)a4;
- (void)setAccessoryGoodnessScoreEvaluator:(id)a3;
- (void)setHostDeviceGoodnessScoreEvaluator:(id)a3;
- (void)setQueue:(id)a3;
- (void)shouldCancelBuiltInSecondPassWithBuiltInFirstPassScore:(double)a3 includeBoostForBuiltIn:(BOOL)a4 accessoryFirstPassScore:(double)a5 includeBoostForAccessory:(BOOL)a6 accessoryId:(id)a7 completion:(id)a8;
- (void)shouldCancelSecondPassOnAccessory:(id)a3 accessoryFirstPassScore:(double)a4 includeBoostForAccessory:(BOOL)a5 buildInFirstPassScore:(double)a6 includeBoostForBuiltIn:(BOOL)a7 completion:(id)a8;
@end

@implementation CSMyriadDeviceManager

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSMyriadDeviceManager;
  v2 = -[CSMyriadDeviceManager init](&v15, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("CSMyriadDeviceManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(&OBJC_CLASS___CSMyriadGoodnessScoreEvaluator);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    v9 = -[CSMyriadGoodnessScoreEvaluator initWithInstanceContext:](v7, "initWithInstanceContext:", v8);
    hostDeviceGoodnessScoreEvaluator = v2->_hostDeviceGoodnessScoreEvaluator;
    v2->_hostDeviceGoodnessScoreEvaluator = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    accessoryGoodnessScoreEvaluator = v2->_accessoryGoodnessScoreEvaluator;
    v2->_accessoryGoodnessScoreEvaluator = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSHomeHubManager sharedManager](&OBJC_CLASS___CSHomeHubManager, "sharedManager"));
    [v13 addObserver:v2];
    [v13 start];
  }

  return v2;
}

- (id)_accessoryGoodnessScoreEvaluator
{
  return self->_accessoryGoodnessScoreEvaluator;
}

- (double)myriadBoostScoreForAccessoryWithId:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0LL;
  v27 = (double *)&v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  dispatch_queue_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  if ([v6 isMediaPlayingOnAccessory:v4])
  {
    +[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework");
    -[NSMutableSet addObject:](v5, "addObject:", &off_100238F88);
    int v7 = 1;
  }

  else
  {
    int v7 = 0;
  }

  if ([v6 isAlarmPlayingOnAccessory:v4])
  {
    +[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework");
    -[NSMutableSet addObject:](v5, "addObject:", &off_100238FA0);
    int v8 = 1;
  }

  else
  {
    int v8 = 0;
  }

  if ([v6 isTimerPlayingOnAccessory:v4])
  {
    +[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework");
    -[NSMutableSet addObject:](v5, "addObject:", &off_100238FA0);
    int v9 = 1;
  }

  else
  {
    int v9 = 0;
  }

  [v6 getMediaPlaybackInterruptedTime:v4];
  double v11 = v10;
  +[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework");
  -[NSMutableSet addObject:](v5, "addObject:", &off_100238FB8);
  v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316419;
    v31 = "-[CSMyriadDeviceManager myriadBoostScoreForAccessoryWithId:]";
    __int16 v32 = 1025;
    int v33 = v7;
    __int16 v34 = 1025;
    int v35 = v8;
    __int16 v36 = 1025;
    int v37 = v9;
    __int16 v38 = 2049;
    double v39 = v11;
    __int16 v40 = 2113;
    id v41 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Media playback is active = %{private}d, Alarm is firing = %{private}d, Timer is firing = %{private}d, media pla yback interrupted time: %{private}f, accessory id = %{private}@",  buf,  0x32u);
  }

  unsigned int v13 = +[CSUtils supportsSCDAFramework](&OBJC_CLASS___CSUtils, "supportsSCDAFramework");
  v14 = (Class *)&OBJC_CLASS___SCDAGoodnessScoreContext_ptr;
  if (!v13) {
    v14 = (Class *)&OBJC_CLASS___AFMyriadGoodnessScoreContext_ptr;
  }
  id v15 = objc_alloc_init(*v14);
  [v15 setMediaPlaybackInterruptedTime:v11];
  [v15 setReasons:v5];
  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100153F50;
  v21[3] = &unk_10022F088;
  id v22 = v4;
  v23 = self;
  id v24 = v15;
  v25 = &v26;
  id v17 = v15;
  id v18 = v4;
  dispatch_sync(queue, v21);
  double v19 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v19;
}

- (void)homeHubManager:(id)a3 didAddEndpoint:(id)a4
{
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "accessoryId", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  if (v6)
  {
    objc_initWeak(&location, self);
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100153E5C;
    v8[3] = &unk_10022F0B0;
    objc_copyWeak(&v11, &location);
    id v9 = v6;
    id v10 = v5;
    dispatch_async(queue, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)homeHubManager:(id)a3 didDeleteEndpoint:(id)a4
{
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "accessoryId", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  if (v6)
  {
    objc_initWeak(&location, self);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100153DE8;
    block[3] = &unk_10022F0D8;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)homeHubManager:(id)a3 didDeactivateEndpoint:(id)a4
{
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "accessoryId", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100153DA4;
    block[3] = &unk_10022F100;
    id v9 = v6;
    dispatch_async(queue, block);
  }
}

- (void)homeHubManager:(id)a3 didActivateEndpoint:(id)a4
{
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "accessoryId", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  if (v6)
  {
    objc_initWeak(&location, self);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100153D34;
    block[3] = &unk_10022F0D8;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)shouldCancelSecondPassOnAccessory:(id)a3 accessoryFirstPassScore:(double)a4 includeBoostForAccessory:(BOOL)a5 buildInFirstPassScore:(double)a6 includeBoostForBuiltIn:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = (void (**)(id, void, uint64_t))a8;
  if (a4 == -1.0 || v14 == 0LL || a6 == -1.0)
  {
    id v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315907;
      v25 = "-[CSMyriadDeviceManager shouldCancelSecondPassOnAccessory:accessoryFirstPassScore:includeBoostForAccessory:b"
            "uildInFirstPassScore:includeBoostForBuiltIn:completion:]";
      __int16 v26 = 2113;
      id v27 = v14;
      __int16 v28 = 2049;
      double v29 = a6;
      __int16 v30 = 2049;
      double v31 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s accessory id %{private}@, bscore: %{private}f, ascore: %{private}f",  (uint8_t *)&v24,  0x2Au);
    }

    if (v15) {
      v15[2](v15, 0LL, 1LL);
    }
  }

  else
  {
    double v19 = 0.0;
    double v20 = 0.0;
    if (v9)
    {
      -[CSMyriadDeviceManager myriadBoostScoreForAccessoryWithId:](self, "myriadBoostScoreForAccessoryWithId:", 0LL);
      double v20 = v21;
    }

    if (v11)
    {
      -[CSMyriadDeviceManager myriadBoostScoreForAccessoryWithId:](self, "myriadBoostScoreForAccessoryWithId:", v14);
      double v19 = v22;
    }

    v23 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136317443;
      v25 = "-[CSMyriadDeviceManager shouldCancelSecondPassOnAccessory:accessoryFirstPassScore:includeBoostForAccessory:b"
            "uildInFirstPassScore:includeBoostForBuiltIn:completion:]";
      __int16 v26 = 2113;
      id v27 = v14;
      __int16 v28 = 2049;
      double v29 = v20 + a6;
      __int16 v30 = 2049;
      double v31 = a6;
      __int16 v32 = 2049;
      double v33 = v20;
      __int16 v34 = 1024;
      BOOL v35 = v9;
      __int16 v36 = 2049;
      double v37 = v19 + a4;
      __int16 v38 = 2049;
      double v39 = a4;
      __int16 v40 = 2049;
      double v41 = v19;
      __int16 v42 = 1024;
      BOOL v43 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s accessory id %{private}@, bscore: %{private}f (raw=%{private}f, bump=%{private}f, includeBoostForBuiltIn=%d), ascore: %{private}f (raw=%{private}f, bump=%{private}f, includeBoostForAccessory=%d)",  (uint8_t *)&v24,  0x5Eu);
    }

    if (v15) {
      ((void (**)(id, BOOL, uint64_t))v15)[2](v15, v19 + a4 <= v20 + a6, 0LL);
    }
  }
}

- (void)shouldCancelBuiltInSecondPassWithBuiltInFirstPassScore:(double)a3 includeBoostForBuiltIn:(BOOL)a4 accessoryFirstPassScore:(double)a5 includeBoostForAccessory:(BOOL)a6 accessoryId:(id)a7 completion:(id)a8
{
  BOOL v9 = a6;
  BOOL v11 = a4;
  id v14 = a7;
  id v15 = (void (**)(id, void, uint64_t))a8;
  if (a5 == -1.0 || a3 == -1.0 || v14 == 0LL)
  {
    id v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315907;
      v25 = "-[CSMyriadDeviceManager shouldCancelBuiltInSecondPassWithBuiltInFirstPassScore:includeBoostForBuiltIn:access"
            "oryFirstPassScore:includeBoostForAccessory:accessoryId:completion:]";
      __int16 v26 = 2113;
      id v27 = v14;
      __int16 v28 = 2049;
      double v29 = a3;
      __int16 v30 = 2049;
      double v31 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s accessory id %{private}@, bscore: %{private}f, ascore: %{private}f",  (uint8_t *)&v24,  0x2Au);
    }

    if (v15) {
      v15[2](v15, 0LL, 1LL);
    }
  }

  else
  {
    double v19 = 0.0;
    double v20 = 0.0;
    if (v11)
    {
      -[CSMyriadDeviceManager myriadBoostScoreForAccessoryWithId:](self, "myriadBoostScoreForAccessoryWithId:", 0LL);
      double v20 = v21;
    }

    if (v9)
    {
      -[CSMyriadDeviceManager myriadBoostScoreForAccessoryWithId:](self, "myriadBoostScoreForAccessoryWithId:", v14);
      double v19 = v22;
    }

    v23 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136317443;
      v25 = "-[CSMyriadDeviceManager shouldCancelBuiltInSecondPassWithBuiltInFirstPassScore:includeBoostForBuiltIn:access"
            "oryFirstPassScore:includeBoostForAccessory:accessoryId:completion:]";
      __int16 v26 = 2113;
      id v27 = v14;
      __int16 v28 = 2049;
      double v29 = v20 + a3;
      __int16 v30 = 2049;
      double v31 = a3;
      __int16 v32 = 2049;
      double v33 = v20;
      __int16 v34 = 1024;
      BOOL v35 = v11;
      __int16 v36 = 2049;
      double v37 = v19 + a5;
      __int16 v38 = 2049;
      double v39 = a5;
      __int16 v40 = 2049;
      double v41 = v19;
      __int16 v42 = 1024;
      BOOL v43 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s accessory id %{private}@, bscore: %{private}f (raw=%{private}f, bump=%{private}f, includeBoostForBuiltIn=%d), ascore: %{private}f (raw=%{private}f, bump=%{private}f, includeBoostForAccessory=%d)",  (uint8_t *)&v24,  0x5Eu);
    }

    if (v15) {
      ((void (**)(id, BOOL, uint64_t))v15)[2](v15, v20 + a3 < v19 + a5, 0LL);
    }
  }
}

- (NSMutableDictionary)accessoryGoodnessScoreEvaluator
{
  return self->_accessoryGoodnessScoreEvaluator;
}

- (void)setAccessoryGoodnessScoreEvaluator:(id)a3
{
}

- (CSMyriadGoodnessScoreEvaluator)hostDeviceGoodnessScoreEvaluator
{
  return self->_hostDeviceGoodnessScoreEvaluator;
}

- (void)setHostDeviceGoodnessScoreEvaluator:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (CSMyriadDeviceManager)sharedInstance
{
  if (qword_100280270 != -1) {
    dispatch_once(&qword_100280270, &stru_10022F060);
  }
  return (CSMyriadDeviceManager *)(id)qword_100280268;
}

@end