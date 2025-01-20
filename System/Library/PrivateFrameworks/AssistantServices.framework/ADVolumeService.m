@interface ADVolumeService
- (ADVolumeService)initWithQueue:(id)a3 instanceContext:(id)a4 speechController:(id)a5;
- (BOOL)_fetchSystemVolumeForCategory:(id)a3 andMode:(id)a4 audioRoute:(id)a5 withName:(id)a6 usingSystemController:(id)a7 volume:(float *)a8;
- (BOOL)_updateSystemVolumeForCategory:(id)a3 andMode:(id)a4 audioRoute:(id)a5 withName:(id)a6 usingSystemController:(id)a7 volume:(float)a8 operationType:(int64_t)a9;
- (float)_mediaPlaybackVolume;
- (void)_fetchSmartSiriVolumeForType:(unint64_t)a3;
- (void)_fetchSystemVolumes;
- (void)_fetchSystemVolumesUsingSystemController:(id)a3;
- (void)_handleSystemVolumeChangeForCategory:(id)a3 volume:(float)a4 audioCategory:(id)a5 reason:(id)a6;
- (void)_setNeedsUpdateSiriVolume;
- (void)_startObservingSystemControllerLifecycle;
- (void)_startObservingSystemVolumes;
- (void)_stopObservingSystemControllerLifecycle;
- (void)_stopObservingSystemVolumes;
- (void)_updateSiriVolume:(BOOL)a3 completion:(id)a4;
- (void)_updateSiriVolumeIfNeeded;
- (void)adAVSystemControllerDidChange:(id)a3;
- (void)fetchSmartSiriVolumeForType:(unint64_t)a3;
- (void)getMusicOutputVolumeForAudioRoute:(id)a3 withName:(id)a4 completion:(id)a5;
- (void)getSiriOutputVolumeForAudioRoute:(id)a3 withName:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setClientConfiguration:(id)a3;
- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 withName:(id)a5 operationType:(int64_t)a6 completion:(id)a7;
- (void)systemVolumeChanged:(id)a3;
- (void)updateSiriOutputVolume:(BOOL)a3 completion:(id)a4;
- (void)waitUntilSiriOutputVolumeUpdatesAfterTimestamp:(unint64_t)a3 withTimeout:(double)a4 block:(id)a5;
@end

@implementation ADVolumeService

- (ADVolumeService)initWithQueue:(id)a3 instanceContext:(id)a4 speechController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ADVolumeService;
  v12 = -[ADVolumeService init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    if (v10) {
      v14 = (AFInstanceContext *)v10;
    }
    else {
      v14 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v13->_instanceContext;
    v13->_instanceContext = v14;

    objc_storeStrong((id *)&v13->_speechController, a5);
    v13->_isSmartSiriVolumeAvailable = sub_10033C888(v13->_instanceContext);
    queue = (dispatch_queue_s *)v13->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10033C950;
    block[3] = &unk_1004FD940;
    v19 = v13;
    dispatch_async(queue, block);
  }

  return v13;
}

- (void)fetchSmartSiriVolumeForType:(unint64_t)a3
{
  if (self->_isSmartSiriVolumeAvailable)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10033C87C;
    v5[3] = &unk_1004FD0A0;
    v5[4] = self;
    v5[5] = a3;
    dispatch_async(queue, v5);
  }

  else
  {
    v4 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[ADVolumeService fetchSmartSiriVolumeForType:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Smart Siri Volume is not supported on this platform.",  buf,  0xCu);
    }
  }

- (void)updateSiriOutputVolume:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void (**)(void, void))v6;
  if (!self->_isSmartSiriVolumeAvailable)
  {
    id v9 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[ADVolumeService updateSiriOutputVolume:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Smart Siri Volume is not supported on this platform.",  buf,  0xCu);
      if (!v7) {
        goto LABEL_6;
      }
    }

    else if (!v7)
    {
      goto LABEL_6;
    }

    v7[2](v7, 0LL);
    goto LABEL_6;
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10033C86C;
  block[3] = &unk_1004FCB38;
  void block[4] = self;
  BOOL v12 = a3;
  id v11 = v6;
  dispatch_async(queue, block);

LABEL_6:
}

- (void)waitUntilSiriOutputVolumeUpdatesAfterTimestamp:(unint64_t)a3 withTimeout:(double)a4 block:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    if (self->_isSmartSiriVolumeAvailable)
    {
      id v9 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10033C720;
      v18[3] = &unk_1004FCB60;
      v18[4] = self;
      id v19 = v8;
      unint64_t v20 = a3;
      id v10 = -[AFSafetyBlock initWithBlock:](v9, "initWithBlock:", v18);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10033C740;
      block[3] = &unk_1004FCB88;
      v15 = v10;
      unint64_t v16 = a3;
      void block[4] = self;
      double v17 = a4;
      BOOL v12 = v10;
      dispatch_async(queue, block);
    }

    else
    {
      v13 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[ADVolumeService waitUntilSiriOutputVolumeUpdatesAfterTimestamp:withTimeout:block:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Smart Siri Volume is not supported on this platform.",  buf,  0xCu);
      }

      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
    }
  }
}

- (void)setClientConfiguration:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10033C64C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getMusicOutputVolumeForAudioRoute:(id)a3 withName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADVolumeService getMusicOutputVolumeForAudioRoute:withName:completion:]";
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s audioRoute = %@, routeName = %@", buf, 0x20u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10033C24C;
    v13[3] = &unk_1004FDA30;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);
  }
}

- (void)getSiriOutputVolumeForAudioRoute:(id)a3 withName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[ADVolumeService getSiriOutputVolumeForAudioRoute:withName:completion:]";
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s audioRoute = %@, routeName = %@", buf, 0x20u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10033BE78;
    v13[3] = &unk_1004FDA30;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);
  }
}

- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 withName:(id)a5 operationType:(int64_t)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v27 = "-[ADVolumeService setSiriOutputVolume:forAudioRoute:withName:operationType:completion:]";
    __int16 v28 = 2048;
    double v29 = a3;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2048;
    int64_t v35 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s volume = %f, audioRoute = %@, routeName = %@, operationType = %ld",  buf,  0x34u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10033BA54;
  v20[3] = &unk_1004FCC78;
  v20[4] = self;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  float v25 = a3;
  int64_t v24 = a6;
  id v17 = v13;
  id v18 = v12;
  id v19 = v14;
  dispatch_async(queue, v20);
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10033BA00;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)adAVSystemControllerDidChange:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10033B9B0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startObservingSystemControllerLifecycle
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[ADAVSystemControllerLifecycleManager sharedManager]( &OBJC_CLASS___ADAVSystemControllerLifecycleManager,  "sharedManager"));
  [v3 addObserver:self];
}

- (void)_stopObservingSystemControllerLifecycle
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[ADAVSystemControllerLifecycleManager sharedManager]( &OBJC_CLASS___ADAVSystemControllerLifecycleManager,  "sharedManager"));
  [v3 removeObserver:self];
}

- (void)_startObservingSystemVolumes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  uint64_t v6 = AVSystemController_SystemVolumeDidChangeNotification;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"systemVolumeChanged:" name:AVSystemController_SystemVolumeDidChangeNotification object:0];
}

- (void)_stopObservingSystemVolumes
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVSystemController_SystemVolumeDidChangeNotification object:0];
}

- (void)_fetchSystemVolumes
{
  id v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADVolumeService _fetchSystemVolumes]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ADAVSystemControllerLifecycleManager sharedManager]( &OBJC_CLASS___ADAVSystemControllerLifecycleManager,  "sharedManager"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10033B854;
  v5[3] = &unk_1004FCCA0;
  v5[4] = self;
  [v4 getAVSystemControllerWithTimeout:v5 completion:2.0];
}

- (void)_fetchSystemVolumesUsingSystemController:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[ADVolumeService _fetchSystemVolumesUsingSystemController:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  int v12 = 0;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeCategoryForAudioCategory:@"Audio/Video"]);
  if (v6)
  {
    if (-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]( self,  "_fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:",  v6,  0LL,  0LL,  0LL,  v4,  &v12))
    {
      LODWORD(v7) = v12;
      -[ADVolumeService _handleSystemVolumeChangeForCategory:volume:audioCategory:reason:]( self,  "_handleSystemVolumeChangeForCategory:volume:audioCategory:reason:",  v6,  @"Audio/Video",  @"ClientFetch",  v7);
    }
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[ADVolumeService _fetchSystemVolumesUsingSystemController:]";
      __int16 v15 = 2112;
      id v16 = @"Audio/Video";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Unable to get the volume category for audio category '%@'",  buf,  0x16u);
    }
  }

  int v12 = 0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeCategoryForAudioCategory:@"VoiceCommand"]);

  if (v9)
  {
    if (-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]( self,  "_fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:",  v9,  @"SpeechRecognition",  0LL,  0LL,  v4,  &v12))
    {
      LODWORD(v10) = v12;
      -[ADVolumeService _handleSystemVolumeChangeForCategory:volume:audioCategory:reason:]( self,  "_handleSystemVolumeChangeForCategory:volume:audioCategory:reason:",  v9,  @"VoiceCommand",  @"ClientFetch",  v10);
    }
  }

  else
  {
    id v11 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[ADVolumeService _fetchSystemVolumesUsingSystemController:]";
      __int16 v15 = 2112;
      id v16 = @"VoiceCommand";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Unable to get the volume category for audio category '%@'",  buf,  0x16u);
    }
  }
}

- (BOOL)_fetchSystemVolumeForCategory:(id)a3 andMode:(id)a4 audioRoute:(id)a5 withName:(id)a6 usingSystemController:(id)a7 volume:(float *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v59 = "-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]";
    __int16 v60 = 2112;
    id v61 = v13;
    __int16 v62 = 2112;
    id v63 = v14;
    __int16 v64 = 2112;
    id v65 = v15;
    __int16 v66 = 2112;
    id v67 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s category = %@, mode = %@, audioRoute = %@, routeName = %@",  buf,  0x34u);
  }

  if (!a8) {
    goto LABEL_34;
  }
  BOOL v19 = 0;
  *a8 = 0.0;
  if (!v13 || !v17) {
    goto LABEL_35;
  }
  if (!v15)
  {
    if (v16)
    {
      id v46 = v14;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      id v48 = v17;
      id v50 = v13;
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v17 pickableRoutesForCategory:v13 andMode:v14]);
      id v31 = [v30 countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v52;
LABEL_18:
        uint64_t v34 = 0LL;
        while (1)
        {
          if (*(void *)v52 != v33) {
            objc_enumerationMutation(v30);
          }
          int64_t v35 = *(void **)(*((void *)&v51 + 1) + 8 * v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName]);
          unsigned __int8 v37 = [v16 isEqualToString:v36];

          if ((v37 & 1) != 0) {
            break;
          }
          if (v32 == (id)++v34)
          {
            id v32 = [v30 countByEnumeratingWithState:&v51 objects:v57 count:16];
            if (v32) {
              goto LABEL_18;
            }
            goto LABEL_24;
          }
        }

        id v20 = v35;

        id v17 = v48;
        id v13 = v50;
        id v14 = v46;
        if (v20) {
          goto LABEL_8;
        }
      }

      else
      {
LABEL_24:

        id v17 = v48;
        id v13 = v50;
        id v14 = v46;
      }

      v38 = (os_log_s *)AFSiriLogContextSpeech;
      if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136315394;
      v59 = "-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]";
      __int16 v60 = 2112;
      id v61 = 0LL;
      v39 = "%s Unable to find a pickable route matching audio route %@.";
      goto LABEL_30;
    }

    id v20 = (id)objc_claimAutoreleasedReturnValue([v17 attributeForKey:AVSystemController_PickedRouteAttribute]);
    if (v20) {
      goto LABEL_8;
    }
    v42 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "-[ADVolumeService _fetchSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:]";
      v39 = "%s There's no picked route.";
      v40 = v42;
      uint32_t v41 = 12;
      goto LABEL_31;
    }

- (BOOL)_updateSystemVolumeForCategory:(id)a3 andMode:(id)a4 audioRoute:(id)a5 withName:(id)a6 usingSystemController:(id)a7 volume:(float)a8 operationType:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    __int16 v64 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:operationType:]";
    __int16 v65 = 2112;
    id v66 = v15;
    __int16 v67 = 2112;
    id v68 = v16;
    __int16 v69 = 2112;
    id v70 = v17;
    __int16 v71 = 2112;
    id v72 = v18;
    __int16 v73 = 2048;
    double v74 = a8;
    __int16 v75 = 2048;
    int64_t v76 = a9;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s category = %@, mode = %@, audioRoute = %@, routeName = %@, volume = %f, operationType = %ld",  buf,  0x48u);
  }

  BOOL v21 = 0;
  if (v15 && v19)
  {
    if (v17)
    {
      id v22 = (id)objc_claimAutoreleasedReturnValue([v17 avscRouteDescription]);
      if (v22) {
        goto LABEL_7;
      }
      v38 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v64 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:operationType:]";
        __int16 v65 = 2112;
        id v66 = v17;
        v39 = "%s Unable to find a pickable route matching audio route %@.";
LABEL_31:
        v40 = v38;
        uint32_t v41 = 22;
LABEL_32:
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
      }
    }

    else
    {
      if (v18)
      {
        id v51 = v16;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        id v52 = v19;
        id v55 = v15;
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v19 pickableRoutesForCategory:v15 andMode:v16]);
        id v31 = [v30 countByEnumeratingWithState:&v56 objects:v62 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v57;
LABEL_19:
          uint64_t v34 = 0LL;
          while (1)
          {
            if (*(void *)v57 != v33) {
              objc_enumerationMutation(v30);
            }
            int64_t v35 = *(void **)(*((void *)&v56 + 1) + 8 * v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName]);
            unsigned __int8 v37 = [v18 isEqualToString:v36];

            if ((v37 & 1) != 0) {
              break;
            }
            if (v32 == (id)++v34)
            {
              id v32 = [v30 countByEnumeratingWithState:&v56 objects:v62 count:16];
              if (v32) {
                goto LABEL_19;
              }
              goto LABEL_25;
            }
          }

          id v22 = v35;

          id v19 = v52;
          id v15 = v55;
          id v16 = v51;
          if (v22) {
            goto LABEL_7;
          }
        }

        else
        {
LABEL_25:

          id v19 = v52;
          id v15 = v55;
          id v16 = v51;
        }

        v38 = (os_log_s *)AFSiriLogContextSpeech;
        if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        *(_DWORD *)buf = 136315394;
        __int16 v64 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:operationType:]";
        __int16 v65 = 2112;
        id v66 = 0LL;
        v39 = "%s Unable to find a pickable route matching audio route %@.";
        goto LABEL_31;
      }

      id v22 = (id)objc_claimAutoreleasedReturnValue([v19 attributeForKey:AVSystemController_PickedRouteAttribute]);
      if (v22)
      {
LABEL_7:
        id v23 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v64 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volum"
                "e:operationType:]";
          __int16 v65 = 2112;
          id v66 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s routeInfo = %@", buf, 0x16u);
        }

        int64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName]);
        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:AVSystemController_RouteDescriptionKey_RouteUID]);
        __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:AVSystemController_RouteDescriptionKey_RouteSubtype]);
        double v26 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          __int16 v64 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volum"
                "e:operationType:]";
          __int16 v65 = 2112;
          id v66 = v24;
          __int16 v67 = 2112;
          id v68 = v25;
          __int16 v69 = 2112;
          id v70 = v54;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s route = %@, deviceIdentifier = %@, routeSubtype = %@",  buf,  0x2Au);
        }

        switch(a9)
        {
          case 1LL:
            LODWORD(v28) = 0;
            LODWORD(v29) = 0;
            *(float *)&double v27 = a8;
            if ([v19 setVolume:v15 category:v16 mode:v24 route:v25 deviceIdentifier:v54 routeSubtype:v27 rampUpDuration:v28 rampDownDuration:v29]) {
              goto LABEL_39;
            }
            break;
          case 3LL:
            BOOL v21 = 0;
            if ([v19 changeVolumeForRoute:0 forCategory:v15 mode:v16 route:v24 deviceIdentifier:v25 andRouteSubtype:v54])
            {
LABEL_40:

              goto LABEL_44;
            }

            break;
          case 2LL:
            if ([v19 changeVolumeForRoute:1 forCategory:v15 mode:v16 route:v24 deviceIdentifier:v25 andRouteSubtype:v54])
            {
LABEL_39:
              BOOL v21 = 0;
              goto LABEL_40;
            }

            break;
          default:
            id v48 = (os_log_s *)AFSiriLogContextSpeech;
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              __int16 v64 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:v"
                    "olume:operationType:]";
              _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%s Unsupported volume operation type.",  buf,  0xCu);
            }

            goto LABEL_39;
        }

        id v53 = v19;
        id v42 = v17;
        id v43 = v16;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
        v60[0] = @"category";
        v60[1] = @"volume";
        v61[0] = v15;
        *(float *)&double v45 = a8;
        id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v45));
        v61[1] = v46;
        id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  2LL));
        [v44 logEventWithType:4603 context:v47];

        id v16 = v43;
        id v17 = v42;
        id v19 = v53;
        BOOL v21 = 1;
        goto LABEL_40;
      }

      v49 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v64 = "-[ADVolumeService _updateSystemVolumeForCategory:andMode:audioRoute:withName:usingSystemController:volume:operationType:]";
        v39 = "%s There's no picked route.";
        v40 = v49;
        uint32_t v41 = 12;
        goto LABEL_32;
      }
    }

- (void)systemVolumeChanged:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v25 = "-[ADVolumeService systemVolumeChanged:]";
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }

  uint64_t v6 = mach_absolute_time();
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AVSystemController_AudioCategoryNotificationParameter]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 objectForKey:AVSystemController_AudioVolumeChangeReasonNotificationParameter]);
  double v10 = (void *)v9;
  id v11 = @"Notification";
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  int v12 = v11;

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AVSystemController_AudioVolumeNotificationParameter]);
  [v13 floatValue];
  int v15 = v14;

  if (v8)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[ADAVSystemControllerLifecycleManager sharedManager]( &OBJC_CLASS___ADAVSystemControllerLifecycleManager,  "sharedManager"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10033B50C;
    v18[3] = &unk_1004FCCF0;
    v18[4] = self;
    id v19 = v8;
    int v23 = v15;
    id v20 = v12;
    uint64_t v22 = v6;
    id v21 = v4;
    [v16 getAVSystemControllerWithTimeout:v18 completion:2.0];
  }

  else
  {
    id v17 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v25 = "-[ADVolumeService systemVolumeChanged:]";
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Ignored because no audio category is specified in the notification %@.",  buf,  0x16u);
    }
  }
}

- (void)_handleSystemVolumeChangeForCategory:(id)a3 volume:(float)a4 audioCategory:(id)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v19 = 136316162;
    id v20 = "-[ADVolumeService _handleSystemVolumeChangeForCategory:volume:audioCategory:reason:]";
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2048;
    double v24 = a4;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s category = %@, volume = %f, audioCategory = %@, reason = %@",  (uint8_t *)&v19,  0x34u);
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_volumesByCategory, "objectForKey:", v10));
  *(float *)&double v15 = a4;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
  id v17 = [v14 isEqual:v16];
  if ((_DWORD)v17)
  {
    AFIsHorseman(v17);
  }

  else if (AFIsHorseman( -[NSMutableDictionary setObject:forKey:]( self->_volumesByCategory,  "setObject:forKey:",  v16,  v10)) {
         && [v11 isEqualToString:@"Audio/Video"]
  }
         && self->_deviceSetupFlowSiriVolume > 0.0)
  {
    id v18 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315650;
      id v20 = "-[ADVolumeService _handleSystemVolumeChangeForCategory:volume:audioCategory:reason:]";
      __int16 v21 = 2112;
      id v22 = v11;
      __int16 v23 = 2112;
      double v24 = *(double *)&v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Resetting device setup volume due to %@ audio category volume change for %@.",  (uint8_t *)&v19,  0x20u);
    }

    self->_deviceSetupFlowSiriVolume = 0.0;
  }
}

- (void)_fetchSmartSiriVolumeForType:(unint64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[AFClientConfiguration deviceSetupFlowBeginDate]( self->_clientConfiguration,  "deviceSetupFlowBeginDate"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AFClientConfiguration deviceSetupFlowEndDate](self->_clientConfiguration, "deviceSetupFlowEndDate"));
  int IsActive = AFDeviceSetupIsActive(v5, v6, 60.0);

  if (IsActive) {
    a3 = 3LL;
  }
  -[CSSpeechController getVolumeForTTSType:](self->_speechController, "getVolumeForTTSType:", a3);
  float v9 = v8;
  if (v8 >= 0.0 && v8 <= 1.0)
  {
    self->_smartSiriVolume = v8;
    id v12 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315650;
      int v14 = "-[ADVolumeService _fetchSmartSiriVolumeForType:]";
      __int16 v15 = 2048;
      double v16 = v9;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Smart Siri volume is %f for type: %lu.",  (uint8_t *)&v13,  0x20u);
    }
  }

  else
  {
    id v11 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      int v14 = "_ADVolumeServiceSmartSiriVolumeIsValid";
      __int16 v15 = 2048;
      double v16 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Invalid Smart Siri Volume: %f",  (uint8_t *)&v13,  0x16u);
    }
  }

- (void)_setNeedsUpdateSiriVolume
{
  id v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL needsUpdateSiriVolume = self->_needsUpdateSiriVolume;
    *(_DWORD *)buf = 136315394;
    float v9 = "-[ADVolumeService _setNeedsUpdateSiriVolume]";
    __int16 v10 = 1024;
    BOOL v11 = needsUpdateSiriVolume;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s BOOL needsUpdateSiriVolume = %d", buf, 0x12u);
  }

  if (!self->_needsUpdateSiriVolume)
  {
    self->_BOOL needsUpdateSiriVolume = 1;
    dispatch_time_t v5 = dispatch_time(0LL, 200000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10033B504;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_after(v5, queue, block);
  }

- (void)_updateSiriVolumeIfNeeded
{
  id v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL needsUpdateSiriVolume = self->_needsUpdateSiriVolume;
    int v5 = 136315394;
    uint64_t v6 = "-[ADVolumeService _updateSiriVolumeIfNeeded]";
    __int16 v7 = 1024;
    BOOL v8 = needsUpdateSiriVolume;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s BOOL needsUpdateSiriVolume = %d",  (uint8_t *)&v5,  0x12u);
  }

  if (self->_needsUpdateSiriVolume) {
    -[ADVolumeService _updateSiriVolume:completion:](self, "_updateSiriVolume:completion:", 0LL, 0LL);
  }
}

- (void)_updateSiriVolume:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  __int16 v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
    __int16 v45 = 1024;
    LODWORD(v46) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s forceUpdate = %d", buf, 0x12u);
  }

  self->_BOOL needsUpdateSiriVolume = 0;
  uint64_t v8 = mach_absolute_time();
  float smartSiriVolume = self->_smartSiriVolume;
  __int16 v10 = (os_log_s *)AFSiriLogContextSpeech;
  BOOL v11 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
  if (v11)
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
    __int16 v45 = 2048;
    double v46 = smartSiriVolume;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Cached Smart Siri volume is %f.", buf, 0x16u);
  }

  uint64_t v12 = AFIsHorseman(v11);
  if ((_DWORD)v12)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue( -[AFClientConfiguration deviceSetupFlowBeginDate]( self->_clientConfiguration,  "deviceSetupFlowBeginDate"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue( -[AFClientConfiguration deviceSetupFlowEndDate]( self->_clientConfiguration,  "deviceSetupFlowEndDate"));
    int IsActive = AFDeviceSetupIsActive(v13, v14, 60.0);

    if (IsActive)
    {
      double v16 = (os_log_s *)AFSiriLogContextSpeech;
      if (self->_deviceSetupFlowSiriVolume == 0.0)
      {
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
          __int16 v45 = 2048;
          double v46 = smartSiriVolume;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Setting device setup volume to %f",  buf,  0x16u);
          double v16 = (os_log_s *)AFSiriLogContextSpeech;
        }

        self->_deviceSetupFlowSiriVolume = smartSiriVolume;
      }

      else
      {
        float smartSiriVolume = self->_deviceSetupFlowSiriVolume;
      }

      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v45 = 2048;
        double v46 = smartSiriVolume;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Setting resolved volume to device setup volume %f",  buf,  0x16u);
        float smartSiriVolume = self->_deviceSetupFlowSiriVolume;
      }
    }

    else
    {
      __int16 v17 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Resetting device setup volume", buf, 0xCu);
      }

      self->_deviceSetupFlowSiriVolume = 0.0;
    }

    uint64_t v12 = (uint64_t)-[AFClientConfiguration outputVolume](self->_clientConfiguration, "outputVolume");
    if (v18 > 0.0)
    {
      float v19 = v18;
      id v20 = (os_log_s *)AFSiriLogContextSpeech;
      uint64_t v12 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
      if ((_DWORD)v12)
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v45 = 2048;
        double v46 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Setting resolved volume to client configured output volume %f",  buf,  0x16u);
      }

      float smartSiriVolume = v19;
    }
  }

  if (AFIsInternalInstall(v12))
  {
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    float v42 = 0.0;
    if ([v21 getMinimumOutputVolume:&v42])
    {
      id v22 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v45 = 2048;
        double v46 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Minimum Siri volume is set to %f.",  buf,  0x16u);
      }

      if (smartSiriVolume < v42) {
        float smartSiriVolume = v42;
      }
    }

    float v41 = 0.0;
    if ([v21 getMaximumOutputVolume:&v41])
    {
      __int16 v23 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v45 = 2048;
        double v46 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Maximum Siri volume is set to %f.",  buf,  0x16u);
      }

      if (smartSiriVolume >= v41) {
        float smartSiriVolume = v41;
      }
    }
  }

  double v24 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
    __int16 v45 = 2048;
    double v46 = smartSiriVolume;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Resolved Siri volume is %f.", buf, 0x16u);
  }

  if (!v4)
  {
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_volumesByCategory,  "objectForKey:",  @"VoiceCommand"));
    id v26 = v25;
    if (v25)
    {
      [v25 floatValue];
      float v28 = v27;
      double v29 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
        __int16 v45 = 2048;
        double v46 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Cached Siri volume is %f.", buf, 0x16u);
      }

      if (vabds_f32(smartSiriVolume, v28) < 0.01)
      {
        __int16 v30 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
          __int16 v45 = 2048;
          double v46 = v28;
          __int16 v47 = 2048;
          double v48 = smartSiriVolume;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%s Ignored because current Siri volume is %f and resolved Siri volume is %f. They are close enough.",  buf,  0x20u);
        }

        if (v6) {
          v6[2](v6, 0LL);
        }
        goto LABEL_51;
      }
    }

    else
    {
      id v31 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[ADVolumeService _updateSiriVolume:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s Cached Siri volume is missing.", buf, 0xCu);
      }
    }
  }

  os_signpost_id_t v32 = os_signpost_id_generate(AFSiriLogContextSpeech);
  uint64_t v33 = (os_log_s *)AFSiriLogContextSpeech;
  uint64_t v34 = v33;
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v34,  OS_SIGNPOST_INTERVAL_BEGIN,  v32,  "SiriUpdateOutputVolume",  "enableTelemetry=YES",  buf,  2u);
  }

  int64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[ADAVSystemControllerLifecycleManager sharedManager]( &OBJC_CLASS___ADAVSystemControllerLifecycleManager,  "sharedManager"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10033B090;
  v36[3] = &unk_1004FCD40;
  float v40 = smartSiriVolume;
  v36[4] = self;
  os_signpost_id_t v38 = v32;
  uint64_t v39 = v8;
  unsigned __int8 v37 = v6;
  [v35 getAVSystemControllerWithTimeout:v36 completion:2.0];

LABEL_51:
}

- (float)_mediaPlaybackVolume
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_volumesByCategory, "objectForKey:", @"Audio/Video"));
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
}

@end