@interface VSAudioSession
+ (id)sharedInstance;
+ (int64_t)_VSAudioCategoryForActivity:(int64_t)a3;
- (VSAudioSession)init;
- (int64_t)_nextActivityForActive:(BOOL)a3 activity:(int64_t)a4 serverActivity:(int64_t)a5;
- (int64_t)_safeServerGeneration;
- (void)_audioSessionInterrupted:(id)a3;
- (void)_mediaServicesWereReset:(id)a3;
- (void)_safeSetActive:(BOOL)a3 withActivity:(int64_t)a4;
- (void)_safeSetBluetoothInputAllowed:(BOOL)a3;
- (void)_safeSetCategoryForActivity:(int64_t)a3;
- (void)_safeSetupAudioSession;
- (void)_setCategoryForActivity:(int64_t)a3;
- (void)_setupAudioSession;
- (void)dealloc;
@end

@implementation VSAudioSession

- (VSAudioSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VSAudioSession;
  v2 = -[VSAudioSession init](&v7, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("VSAudioSessionQueue", 0LL);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_audioSessionInterrupted:" name:AVAudioSessionInterruptionNotification object:0];
    [v5 addObserver:v2 selector:"_mediaServicesWereReset:" name:AVAudioSessionMediaServicesWereResetNotification object:0];
  }

  return (VSAudioSession *)v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  activityBag = self->_activityBag;
  if (activityBag) {
    CFRelease(activityBag);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VSAudioSession;
  -[VSAudioSession dealloc](&v5, "dealloc");
}

- (void)_audioSessionInterrupted:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:AVAudioSessionInterruptionTypeKey]);
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EB5B4;
    block[3] = &unk_1000FAA70;
    block[4] = self;
    dispatch_async((dispatch_queue_t)queue, block);
  }

- (void)_mediaServicesWereReset:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EB520;
  block[3] = &unk_1000FAA70;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_setupAudioSession
{
  if (!self->_audioSessionIsSetUp)
  {
    uint64_t v3 = VSGetLogDefault(self);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "#AudioSession : Setting up audio session",  buf,  2u);
    }

    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    id v11 = 0LL;
    [v5 setPreferredSampleRate:&v11 error:48000.0];
    id v6 = v11;

    if (v6)
    {
      uint64_t v8 = VSGetLogDefault(v7);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v6 code];
        *(_DWORD *)buf = 134217984;
        id v13 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "#AudioSession error setting HW sample rate: %ld\n",  buf,  0xCu);
      }
    }

    self->_audioSessionIsSetUp = 1;
  }

- (void)_setCategoryForActivity:(int64_t)a3
{
  int64_t v4 = +[VSAudioSession _VSAudioCategoryForActivity:](&OBJC_CLASS___VSAudioSession, "_VSAudioCategoryForActivity:", a3);
  if (v4)
  {
    int64_t v5 = v4;
    if (self->_cachedState.category != v4)
    {
      uint64_t v6 = VSGetLogDefault(v4);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = v5;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "#AudioSession : category = %d\n",  buf,  8u);
      }

      if (self->_cachedState.category == 2) {
        sub_1000EB3EC();
      }
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      uint64_t v9 = AVAudioSessionCategoryVoiceCommand;
      id v10 = (void *)AVAudioSessionCategoryVoiceOver;
      if (v5 == 2) {
        id v10 = (void *)AVAudioSessionCategoryVoiceCommand;
      }
      id v11 = v10;
      id v24 = 0LL;
      [v8 setCategory:v11 error:&v24];
      id v12 = v24;
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = VSGetLogDefault(v12);
        v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v21 = (const char *)[v13 code];
          *(_DWORD *)buf = 134217984;
          v26 = v21;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "#AudioSession error %ld setting audio category\n",  buf,  0xCu);
        }
      }

      else
      {
        if (v5 == 2
          && (unint64_t v16 = (unint64_t)[v8 categoryOptions], self->_bluetoothAllowed == ((v16 & 4) == 0)))
        {
          id v23 = 0LL;
          [v8 setCategory:v9 withOptions:v16 ^ 4 error:&v23];
          id v13 = v23;
          uint64_t v17 = VSGetLogDefault(v13);
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          v19 = v18;
          if (v13)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v20 = (const char *)[v13 code];
              *(_DWORD *)buf = 134217984;
              v26 = v20;
              _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "#AudioSession error %ld setting bluetooth allowability\n",  buf,  0xCu);
            }
          }

          else
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              if (self->_bluetoothAllowed) {
                v22 = "en";
              }
              else {
                v22 = "dis";
              }
              *(_DWORD *)buf = 136315138;
              v26 = v22;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "#AudioSession : Bluetooth %sabled\n",  buf,  0xCu);
            }

            id v13 = 0LL;
          }
        }

        else
        {
          id v13 = 0LL;
        }

        self->_cachedState.category = v5;
      }

      self->_desiredState.category = v5;
    }
  }

- (int64_t)_nextActivityForActive:(BOOL)a3 activity:(int64_t)a4 serverActivity:(int64_t)a5
{
  activityBag = self->_activityBag;
  if (a3)
  {
    if (activityBag)
    {
      if ((a4 & 1) == 0) {
        goto LABEL_4;
      }
    }

    else
    {
      activityBag = CFBagCreateMutable(kCFAllocatorDefault, 0LL, 0LL);
      self->_activityBag = activityBag;
      if ((a4 & 1) == 0)
      {
LABEL_4:
        if ((a4 & 2) == 0) {
          return a5 | a4;
        }
LABEL_5:
        CFBagAddValue(self->_activityBag, (const void *)2);
        return a5 | a4;
      }
    }

    CFBagAddValue(activityBag, (const void *)1);
    if ((a4 & 2) == 0) {
      return a5 | a4;
    }
    goto LABEL_5;
  }

  if (!activityBag)
  {
    uint64_t v13 = VSGetLogDefault(0LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = 0;
      v15 = "#AudioSession active count went negative!\n";
      unint64_t v16 = (uint8_t *)&v21;
LABEL_28:
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    }

- (void)_safeSetupAudioSession
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EB518;
  block[3] = &unk_1000FAA70;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (int64_t)_safeServerGeneration
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000EB504;
  v5[3] = &unk_1000FAA98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_safeSetCategoryForActivity:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000EB4F8;
  v4[3] = &unk_1000FA9D8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (void)_safeSetActive:(BOOL)a3 withActivity:(int64_t)a4
{
  if (a4)
  {
    BOOL v5 = a3;
    uint64_t v7 = VSGetLogDefault(self);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      CFIndex v10 = "INACTIVE";
      if (v5) {
        CFIndex v10 = "ACTIVE";
      }
      *(_DWORD *)buf = 67109378;
      int v14 = a4;
      __int16 v15 = 2080;
      unint64_t v16 = v10;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "#AudioSession : activity %d --> %s\n",  buf,  0x12u);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EB1E8;
    block[3] = &unk_1000FAA00;
    BOOL v12 = v5;
    block[4] = self;
    void block[5] = a4;
    dispatch_sync((dispatch_queue_t)queue, block);
  }

- (void)_safeSetBluetoothInputAllowed:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000EB028;
  v4[3] = &unk_1000FAA28;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100102B48 != -1) {
    dispatch_once(&qword_100102B48, &stru_1000FA9B0);
  }
  return (id)qword_100102B40;
}

+ (int64_t)_VSAudioCategoryForActivity:(int64_t)a3
{
  if ((a3 & 1) != 0) {
    return 2LL;
  }
  else {
    return ((unint64_t)a3 >> 1) & 1;
  }
}

@end