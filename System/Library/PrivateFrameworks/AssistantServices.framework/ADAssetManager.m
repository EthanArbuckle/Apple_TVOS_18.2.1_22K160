@interface ADAssetManager
+ (ADAssetManager)sharedInstance;
- (ADAssetManager)init;
- (ADAssetManager)initWithLanguageCode:(id)a3 speechAssetManager:(id)a4 cdmClient:(id)a5 morphunAssetManager:(id)a6 supportsSiriUoD:(BOOL)a7 supportsSiriHybridUoD:(BOOL)a8;
- (BOOL)_shouldLogAssetsPreparedEvent;
- (id)_fetchAssetStatusForLanguage:(id)a3;
- (id)assetsAvailableStatusForLanguage:(id)a3;
- (void)_checkAssetsStatusForIntervalRecording;
- (void)_emitUODAssetPreparedEventWithLanguage:(id)a3 elapsed:(unsigned int)a4;
- (void)_recordAssetsNeededForLanguage:(id)a3 resetPrevious:(BOOL)a4;
- (void)_registerAssetStatusTrackers;
- (void)_registerCDMStatusTracker;
- (void)_subscribeToMorphunAssetStatusForLanguage:(id)a3;
- (void)addAvailabilityObserver:(id)a3;
- (void)assetStatus:(id)a3;
- (void)assetsAvailableForLocale:(id)a3 withType:(int64_t)a4;
- (void)assetsUnavailableWithType:(int64_t)a3;
- (void)attentionAssetStatus:(id)a3;
- (void)dumpAssistantStateChunk:(id)a3;
- (void)fetchAssetsAvailabilityForLanguage:(id)a3 completion:(id)a4;
- (void)languageCodeWasChangedTo:(id)a3;
- (void)notifyObserversAssetAvailabilityChanged;
- (void)notifyObserversLanguageCodeChanged:(id)a3;
- (void)removeAvailabilityObserver:(id)a3;
@end

@implementation ADAssetManager

- (ADAssetManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 languageCode]);
  uint64_t v5 = AFDeviceSupportsSiriUOD();
  v6 = -[ADAssetManager initWithLanguageCode:speechAssetManager:cdmClient:morphunAssetManager:supportsSiriUoD:supportsSiriHybridUoD:]( self,  "initWithLanguageCode:speechAssetManager:cdmClient:morphunAssetManager:supportsSiriUoD:supportsSiriHybridUoD:",  v4,  0LL,  0LL,  0LL,  v5,  AFDeviceSupportsHybridUOD());

  return v6;
}

- (ADAssetManager)initWithLanguageCode:(id)a3 speechAssetManager:(id)a4 cdmClient:(id)a5 morphunAssetManager:(id)a6 supportsSiriUoD:(BOOL)a7 supportsSiriHybridUoD:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___ADAssetManager;
  v17 = -[ADAssetManager init](&v43, "init");
  if (v17)
  {
    dispatch_queue_attr_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v40 = v14;
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v18);
    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);
    v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.ADAssetManager", v21);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.ADAssetManager.delegate", v21);
    delegateQueue = v17->_delegateQueue;
    v17->_delegateQueue = (OS_dispatch_queue *)v24;

    dispatch_group_t v26 = dispatch_group_create();
    group = v17->_group;
    v17->_group = (OS_dispatch_group *)v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 languageCode]);
    currentLanguageCode = v17->_currentLanguageCode;
    v17->_currentLanguageCode = (NSString *)v29;

    v31 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    nlAssetStatus = v17->_nlAssetStatus;
    v17->_nlAssetStatus = v31;

    v33 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    nlRouterAssetStatus = v17->_nlRouterAssetStatus;
    v17->_nlRouterAssetStatus = v33;

    objc_storeStrong((id *)&v17->_currentLanguageCode, a3);
    v17->_supportsSiriUoD = a7;
    v17->_supportsSiriHybridUoD = a8;
    objc_storeStrong((id *)&v17->_speechAssetManager, a4);
    objc_storeStrong((id *)&v17->_cdmClient, a5);
    objc_storeStrong((id *)&v17->_morphunAssetsManager, a6);
    uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    availabilityObservers = v17->_availabilityObservers;
    v17->_availabilityObservers = (NSMutableSet *)v35;

    -[ADAssetManager _registerAssetStatusTrackers](v17, "_registerAssetStatusTrackers");
    id v14 = v40;
    uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    assetFetchIntervalBeginDates = v17->_assetFetchIntervalBeginDates;
    v17->_assetFetchIntervalBeginDates = (NSMutableDictionary *)v37;
  }

  return v17;
}

- (id)assetsAvailableStatusForLanguage:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:
      id v6 = 0LL;
      goto LABEL_5;
    }

    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADAssetManager assetsAvailableStatusForLanguage:]";
    v9 = "%s Input language code is nil. Returning nil assets status";
LABEL_11:
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&buf, 0xCu);
    goto LABEL_9;
  }

  if (!self->_supportsSiriUoD && !self->_supportsSiriHybridUoD)
  {
    v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADAssetManager assetsAvailableStatusForLanguage:]";
    v9 = "%s Siri UoD not supported. Returning nil assets status";
    goto LABEL_11;
  }

  dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100223D7C;
  id v16 = sub_100223D8C;
  id v17 = 0LL;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100223D94;
  block[3] = &unk_1004FBE80;
  p___int128 buf = &buf;
  block[4] = self;
  id v11 = v4;
  dispatch_sync(queue, block);
  id v6 = *(id *)(*((void *)&buf + 1) + 40LL);

  _Block_object_dispose(&buf, 8);
LABEL_5:

  return v6;
}

- (void)fetchAssetsAvailabilityForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 length])
    {
      if (self->_supportsSiriUoD || self->_supportsSiriHybridUoD)
      {
        objc_initWeak(location, self);
        group = self->_group;
        queue = (dispatch_queue_s *)self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100223D20;
        block[3] = &unk_1004F7670;
        objc_copyWeak(&v19, location);
        id v17 = v6;
        id v18 = v7;
        dispatch_group_notify((dispatch_group_t)group, queue, block);

        objc_destroyWeak(&v19);
        objc_destroyWeak(location);
        goto LABEL_12;
      }

      uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 136315138;
        *(id *)((char *)location + 4) = "-[ADAssetManager fetchAssetsAvailabilityForLanguage:completion:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s Siri UoD not supported. Returning empty assets status",  (uint8_t *)location,  0xCu);
      }

      id v15 = (dispatch_queue_s *)self->_queue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100223D0C;
      v20[3] = &unk_1004FC838;
      id v21 = v7;
      dispatch_async(v15, v20);
      id v13 = v21;
    }

    else
    {
      id v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 136315138;
        *(id *)((char *)location + 4) = "-[ADAssetManager fetchAssetsAvailabilityForLanguage:completion:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Input language code is nil. Returning empty assets status",  (uint8_t *)location,  0xCu);
      }

      v12 = (dispatch_queue_s *)self->_queue;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100223CF8;
      v22[3] = &unk_1004FC838;
      id v23 = v7;
      dispatch_async(v12, v22);
      id v13 = v23;
    }

    goto LABEL_12;
  }

  v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(location[0]) = 136315138;
    *(id *)((char *)location + 4) = "-[ADAssetManager fetchAssetsAvailabilityForLanguage:completion:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s Completion block is nil",  (uint8_t *)location,  0xCu);
  }

- (void)languageCodeWasChangedTo:(id)a3
{
  id v4 = a3;
  if (*(_WORD *)&self->_supportsSiriUoD)
  {
    objc_initWeak(location, self);
    p_delegateQueue = &self->_delegateQueue;
    delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
    id v6 = (dispatch_group_s *)p_delegateQueue[1];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100223BF4;
    v9[3] = &unk_1004FBF48;
    objc_copyWeak(&v11, location);
    id v10 = v4;
    dispatch_group_notify(v6, delegateQueue, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }

  else
  {
    v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[ADAssetManager languageCodeWasChangedTo:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Device does not support full Siri UoD or Hybrid UoD, not registering assets change for Morphun assets",  (uint8_t *)location,  0xCu);
    }
  }
}

- (void)addAvailabilityObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100223B8C;
  block[3] = &unk_1004FBF48;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeAvailabilityObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100223B48;
  block[3] = &unk_1004FBF48;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)notifyObserversAssetAvailabilityChanged
{
  if (-[NSMutableSet count](self->_availabilityObservers, "count"))
  {
    id v3 = -[NSMutableSet copy](self->_availabilityObservers, "copy");
    objc_initWeak(&location, self);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100223A44;
    block[3] = &unk_1004FBF48;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    id v5 = v3;
    dispatch_async(queue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

- (void)notifyObserversLanguageCodeChanged:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet count](self->_availabilityObservers, "count"))
  {
    id v5 = -[NSMutableSet copy](self->_availabilityObservers, "copy");
    objc_initWeak(&location, self);
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100223934;
    v8[3] = &unk_1004F9AA8;
    objc_copyWeak(&v11, &location);
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(queue, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)assetStatus:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  group = self->_group;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100223798;
  block[3] = &unk_1004FBF48;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_group_async((dispatch_group_t)group, queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)attentionAssetStatus:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  group = self->_group;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10022362C;
  block[3] = &unk_1004FBF48;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_group_async((dispatch_group_t)group, queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)assetsAvailableForLocale:(id)a3 withType:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  if (a4 == 1)
  {
    group = self->_group;
    queue = (dispatch_queue_s *)self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100223490;
    v14[3] = &unk_1004FBF48;
    id v9 = &v16;
    objc_copyWeak(&v16, &location);
    id v15 = v6;
    dispatch_group_async((dispatch_group_t)group, queue, v14);
    id v10 = v15;
    goto LABEL_5;
  }

  if (!a4)
  {
    id v7 = self->_group;
    id v8 = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002232EC;
    block[3] = &unk_1004FBF48;
    id v9 = &v19;
    objc_copyWeak(&v19, &location);
    id v18 = v6;
    dispatch_group_async((dispatch_group_t)v7, v8, block);
    id v10 = v18;
LABEL_5:

    objc_destroyWeak(v9);
    goto LABEL_8;
  }

  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136315138;
    dispatch_queue_t v22 = "-[ADAssetManager assetsAvailableForLocale:withType:]";
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Unknown NL delegate type", buf, 0xCu);
  }

- (void)assetsUnavailableWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    group = self->_group;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002231A8;
    block[3] = &unk_1004FAF58;
    id v7 = &v11;
    objc_copyWeak(&v11, &location);
    id v8 = block;
    goto LABEL_5;
  }

  if (!a3)
  {
    group = self->_group;
    queue = (dispatch_queue_s *)self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100223064;
    v12[3] = &unk_1004FAF58;
    id v7 = &v13;
    objc_copyWeak(&v13, &location);
    id v8 = v12;
LABEL_5:
    dispatch_group_async((dispatch_group_t)group, queue, v8);
    objc_destroyWeak(v7);
    goto LABEL_8;
  }

  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v16 = "-[ADAssetManager assetsUnavailableWithType:]";
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Unknown NL delegate type", buf, 0xCu);
  }

- (void)_registerCDMStatusTracker
{
  os_signpost_id_t v3 = os_signpost_id_generate(AFSiriLogContextDaemon);
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_BEGIN,  v3,  "RegisterAssetNL",  (const char *)&unk_1004B87EF,  (uint8_t *)&v17,  2u);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___CDMClient);
  cdmClient = self->_cdmClient;
  self->_cdmClient = v6;

  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    id v18 = "-[ADAssetManager _registerCDMStatusTracker]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Registering NL delegate", (uint8_t *)&v17, 0xCu);
  }

  -[CDMClient registerWithAssetsDelegate:withType:](self->_cdmClient, "registerWithAssetsDelegate:withType:", self, 0LL);
  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  id v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_END,  v3,  "RegisterAssetNL",  (const char *)&unk_1004B87EF,  (uint8_t *)&v17,  2u);
  }

  os_signpost_id_t v11 = os_signpost_id_generate(AFSiriLogContextDaemon);
  v12 = (os_log_s *)AFSiriLogContextDaemon;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "RegisterAssetNLRouter",  (const char *)&unk_1004B87EF,  (uint8_t *)&v17,  2u);
  }

  uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    id v18 = "-[ADAssetManager _registerCDMStatusTracker]";
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Registering NL router delegate",  (uint8_t *)&v17,  0xCu);
  }

  -[CDMClient registerWithAssetsDelegate:withType:](self->_cdmClient, "registerWithAssetsDelegate:withType:", self, 1LL);
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  id v16 = v15;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_END,  v11,  "RegisterAssetNLRouter",  (const char *)&unk_1004B87EF,  (uint8_t *)&v17,  2u);
  }
}

- (void)_registerAssetStatusTrackers
{
  if (self->_supportsSiriUoD)
  {
    delegateQueue = (dispatch_queue_s *)self->_delegateQueue;
    group = self->_group;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100222B04;
    block[3] = &unk_1004FAF58;
    objc_copyWeak(&v22, &location);
    dispatch_group_async((dispatch_group_t)group, delegateQueue, block);
    id v6 = (dispatch_queue_s *)self->_delegateQueue;
    id v5 = self->_group;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100222CBC;
    v19[3] = &unk_1004FAF58;
    objc_copyWeak(&v20, &location);
    dispatch_group_async((dispatch_group_t)v5, v6, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
  }

  else
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_DWORD *)__int128 buf = 136315138;
    v25 = "-[ADAssetManager _registerAssetStatusTrackers]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Device does not support full Siri UoD, not registering assets change for ASR assets",  buf,  0xCu);
  }

  if (self->_supportsSiriUoD)
  {
LABEL_7:
    id v9 = (dispatch_queue_s *)self->_delegateQueue;
    id v8 = self->_group;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100222E70;
    v17[3] = &unk_1004FAF58;
    objc_copyWeak(&v18, &location);
    dispatch_group_async((dispatch_group_t)v8, v9, v17);
    objc_destroyWeak(&v18);
    goto LABEL_8;
  }

- (id)_fetchAssetStatusForLanguage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v4));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 languageCode]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[SFUtilities languageStringForLocaleString:](&OBJC_CLASS___SFUtilities, "languageStringForLocaleString:", v4));
  uint64_t v38 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_speechAssetStatusForLocale, "objectForKeyedSubscript:", v7));
  uint64_t IsInstalled = AFOfflineDictationStatusStringIsInstalled(v38);
  if ((_DWORD)IsInstalled)
  {
    uint64_t v9 = AFIsNano(IsInstalled);
    if ((_DWORD)v9 && AFDeviceSupportsFullSiriUOD(v9, v10))
    {
      os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_speechAssetTasksForLocale, "objectForKey:", v7, v38));
      uint64_t v12 = (uint64_t)[v11 supportsAssistant];
      if ((v12 & 1) == 0)
      {
        id v13 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136315394;
          v45 = "-[ADAssetManager _fetchAssetStatusForLanguage:]";
          __int16 v46 = 2112;
          *(void *)v47 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Speech asset for %@ does not support Assistant.",  buf,  0x16u);
        }
      }
    }

    else
    {
      uint64_t v12 = 1LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nlAssetStatus,  "objectForKeyedSubscript:",  v4,  v38));
  id v40 = (void *)v7;
  if ([v14 BOOLValue])
  {
    unsigned __int8 v15 = 1;
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nlAssetStatus,  "objectForKeyedSubscript:",  v6));
    unsigned __int8 v15 = [v16 BOOLValue];
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nlRouterAssetStatus,  "objectForKeyedSubscript:",  v4));
  if ([v17 BOOLValue])
  {
    uint64_t v18 = 1LL;
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_nlRouterAssetStatus,  "objectForKeyedSubscript:",  v6));
    uint64_t v18 = (uint64_t)[v19 BOOLValue];
  }

  id v20 = -[MorphunAssets isAssetReadyForLocale:](self->_morphunAssetsManager, "isAssetReadyForLocale:", v5);
  if ((v15 & 1) != 0)
  {
    uint64_t v21 = 1LL;
  }

  else if (_AFPreferencesSiriXNLAssetOverride())
  {
    id v22 = (os_log_s *)AFSiriLogContextDaemon;
    uint64_t v21 = 1LL;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v45 = "-[ADAssetManager _fetchAssetStatusForLanguage:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s NL asset overriden as available", buf, 0xCu);
    }
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_attentionAssetStatus, "objectForKeyedSubscript:", v4));
  v41 = (void *)v6;
  if ([v23 BOOLValue])
  {
    uint64_t v24 = 1LL;
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_attentionAssetStatus,  "objectForKeyedSubscript:",  v6));
    uint64_t v24 = (uint64_t)[v25 BOOLValue];
  }

  dispatch_group_t v26 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL supportsSiriUoD = self->_supportsSiriUoD;
    BOOL supportsSiriHybridUoD = self->_supportsSiriHybridUoD;
    *(_DWORD *)__int128 buf = 136317186;
    v45 = "-[ADAssetManager _fetchAssetStatusForLanguage:]";
    __int16 v46 = 1024;
    *(_DWORD *)v47 = v12;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = v21;
    __int16 v48 = 1024;
    int v49 = (int)v20;
    __int16 v50 = 1024;
    int v51 = v24;
    __int16 v52 = 1024;
    int v53 = v18;
    __int16 v54 = 2112;
    id v55 = v4;
    __int16 v56 = 1024;
    BOOL v57 = supportsSiriUoD;
    __int16 v58 = 1024;
    BOOL v59 = supportsSiriHybridUoD;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s Retrieved asset status ASR: %u, NL: %u, Morphun: %u, Attention: %u, NLRouter: %u, (lang:%@, uod:%d, hybrid:%d)",  buf,  0x40u);
  }

  if (self->_supportsSiriUoD
    && (self->_speechAssetManager
     || (uint64_t v29 = (os_log_s *)AFSiriLogContextDaemon, !os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
     || (*(_DWORD *)__int128 buf = 136315138,
         v45 = "-[ADAssetManager _fetchAssetStatusForLanguage:]",
         _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s UOD without a speech manager",  buf,  0xCu),  self->_supportsSiriUoD))
    || self->_supportsSiriHybridUoD)
  {
    if (!self->_cdmClient)
    {
      v30 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315138;
        v45 = "-[ADAssetManager _fetchAssetStatusForLanguage:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s UOD or Hybrid without a CDM client",  buf,  0xCu);
      }
    }
  }

  v42[0] = AFAssetManagerNLAssetsTag;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21));
  v43[0] = v31;
  v42[1] = AFAssetManagerSpeechAssetsTag;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
  v43[1] = v32;
  v42[2] = AFAssetManagerMorphunAssetsTag;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v20));
  v43[2] = v33;
  v42[3] = AFAssetManagerAttentionAssetsTag;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v24));
  v43[3] = v34;
  v42[4] = AFAssetManagerNLRouterAssetsTag;
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v18));
  v43[4] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  5LL));

  if (-[ADAssetManager _shouldLogAssetsPreparedEvent](self, "_shouldLogAssetsPreparedEvent")
    && (AFUODStatusSupportedFull(v36, v4) & 1) == 0)
  {
    -[ADAssetManager _recordAssetsNeededForLanguage:resetPrevious:]( self,  "_recordAssetsNeededForLanguage:resetPrevious:",  v4,  0LL);
  }

  return v36;
}

- (void)_subscribeToMorphunAssetStatusForLanguage:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:self->_currentLanguageCode] & 1) == 0)
  {
    morphunAssetsManager = self->_morphunAssetsManager;
    uint64_t v6 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  self->_currentLanguageCode);
    -[MorphunAssets unsubscribeFromLocale:](morphunAssetsManager, "unsubscribeFromLocale:", v6);
  }

  objc_initWeak(&location, self);
  uint64_t v7 = self->_morphunAssetsManager;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v4));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002227A8;
  v10[3] = &unk_1004F6DE0;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  -[MorphunAssets subscribeToLocale:withCompletion:](v7, "subscribeToLocale:withCompletion:", v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldLogAssetsPreparedEvent
{
  return self->_assetFetchIntervalBeginDates != 0LL;
}

- (void)_recordAssetsNeededForLanguage:(id)a3 resetPrevious:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!-[ADAssetManager _shouldLogAssetsPreparedEvent](self, "_shouldLogAssetsPreparedEvent")) {
    goto LABEL_11;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  if (([v7 assistantIsEnabled] & 1) == 0)
  {

    goto LABEL_11;
  }

  currentLanguageCode = self->_currentLanguageCode;

  if (!currentLanguageCode)
  {
LABEL_11:
    id v9 = v6;
    goto LABEL_12;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"_" withString:@"-"]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_assetFetchIntervalBeginDates, "valueForKey:", v9));
  if (!v10 || v4)
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      unsigned __int8 v15 = "-[ADAssetManager _recordAssetsNeededForLanguage:resetPrevious:]";
      __int16 v16 = 2112;
      int v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Saving date when %@ assets are first known to be needed",  (uint8_t *)&v14,  0x16u);
    }

    assetFetchIntervalBeginDates = self->_assetFetchIntervalBeginDates;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSMutableDictionary setValue:forKey:](assetFetchIntervalBeginDates, "setValue:forKey:", v13, v9);
  }

LABEL_12:
}

- (void)_checkAssetsStatusForIntervalRecording
{
  if (-[ADAssetManager _shouldLogAssetsPreparedEvent](self, "_shouldLogAssetsPreparedEvent"))
  {
    currentLanguageCode = self->_currentLanguageCode;
    if (currentLanguageCode)
    {
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByReplacingOccurrencesOfString:withString:]( currentLanguageCode,  "stringByReplacingOccurrencesOfString:withString:",  @"_",  @"-"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADAssetManager _fetchAssetStatusForLanguage:]( self,  "_fetchAssetStatusForLanguage:",  self->_currentLanguageCode));
      id v6 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315650;
        id v13 = "-[ADAssetManager _checkAssetsStatusForIntervalRecording]";
        __int16 v14 = 2112;
        unsigned __int8 v15 = v4;
        __int16 v16 = 2112;
        int v17 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s For measuring asset fetch time, status for %@: %@",  (uint8_t *)&v12,  0x20u);
      }

      if (AFUODStatusSupportedFull(v5, v4))
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_assetFetchIntervalBeginDates, "objectForKey:", v4));
        if (v7)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_assetFetchIntervalBeginDates, "removeObjectForKey:", v4);
          id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v8 timeIntervalSinceDate:v7];
          unint64_t v10 = llround(v9);

          if ((_DWORD)v10)
          {
            id v11 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              int v12 = 136315906;
              id v13 = "-[ADAssetManager _checkAssetsStatusForIntervalRecording]";
              __int16 v14 = 2112;
              unsigned __int8 v15 = v4;
              __int16 v16 = 2112;
              int v17 = v7;
              __int16 v18 = 1024;
              int v19 = v10;
              _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Asset fetch for %@ began at %@ and took %u seconds",  (uint8_t *)&v12,  0x26u);
            }

            -[ADAssetManager _emitUODAssetPreparedEventWithLanguage:elapsed:]( self,  "_emitUODAssetPreparedEventWithLanguage:elapsed:",  v4,  v10);
          }
        }
      }
    }
  }

- (void)_emitUODAssetPreparedEventWithLanguage:(id)a3 elapsed:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___SADSchemaSADUODAssetsPrepared);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uppercaseString]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByReplacingOccurrencesOfString:@"-" withString:@"_"]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"LOCALE_%@", v8));

  id v10 = v9;
  if ([v10 isEqualToString:@"LOCALE_UNKNOWN_LOCALE"])
  {
    uint64_t v11 = 0LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_AR_AE"])
  {
    uint64_t v11 = 1LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_AR_SA"])
  {
    uint64_t v11 = 2LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_CA_ES"])
  {
    uint64_t v11 = 3LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_CS_CZ"])
  {
    uint64_t v11 = 4LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_DA_DK"])
  {
    uint64_t v11 = 5LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_DE_AT"])
  {
    uint64_t v11 = 6LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_DE_CH"])
  {
    uint64_t v11 = 7LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_DE_DE"])
  {
    uint64_t v11 = 8LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EL_GR"])
  {
    uint64_t v11 = 9LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_AE"])
  {
    uint64_t v11 = 10LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_AU"])
  {
    uint64_t v11 = 11LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_CA"])
  {
    uint64_t v11 = 12LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_GB"])
  {
    uint64_t v11 = 13LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_ID"])
  {
    uint64_t v11 = 14LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_IE"])
  {
    uint64_t v11 = 15LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_IN"])
  {
    uint64_t v11 = 16LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_MY"])
  {
    uint64_t v11 = 17LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_NZ"])
  {
    uint64_t v11 = 18LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_PH"])
  {
    uint64_t v11 = 19LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_SG"])
  {
    uint64_t v11 = 20LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_SA"])
  {
    uint64_t v11 = 21LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_US"])
  {
    uint64_t v11 = 22LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_EN_ZA"])
  {
    uint64_t v11 = 23LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_ES_CL"])
  {
    uint64_t v11 = 24LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_ES_CO"])
  {
    uint64_t v11 = 25LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_ES_ES"])
  {
    uint64_t v11 = 26LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_ES_MX"])
  {
    uint64_t v11 = 27LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_ES_US"])
  {
    uint64_t v11 = 28LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_FI_FI"])
  {
    uint64_t v11 = 29LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_FR_BE"])
  {
    uint64_t v11 = 30LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_FR_CA"])
  {
    uint64_t v11 = 31LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_FR_CH"])
  {
    uint64_t v11 = 32LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_FR_FR"])
  {
    uint64_t v11 = 33LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_HE_IL"])
  {
    uint64_t v11 = 34LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_HI_IN"])
  {
    uint64_t v11 = 35LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_HR_HR"])
  {
    uint64_t v11 = 36LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_HU_HU"])
  {
    uint64_t v11 = 37LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_ID_ID"])
  {
    uint64_t v11 = 38LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_IT_CH"])
  {
    uint64_t v11 = 39LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_IT_IT"])
  {
    uint64_t v11 = 40LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_JA_JP"])
  {
    uint64_t v11 = 41LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_KO_KR"])
  {
    uint64_t v11 = 42LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_MS_MY"])
  {
    uint64_t v11 = 43LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_NB_NO"])
  {
    uint64_t v11 = 44LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_NL_BE"])
  {
    uint64_t v11 = 45LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_NL_NL"])
  {
    uint64_t v11 = 46LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_PL_PL"])
  {
    uint64_t v11 = 47LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_PT_BR"])
  {
    uint64_t v11 = 48LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_PT_PT"])
  {
    uint64_t v11 = 49LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_RO_RO"])
  {
    uint64_t v11 = 50LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_RU_RU"])
  {
    uint64_t v11 = 51LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_SK_SK"])
  {
    uint64_t v11 = 52LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_SV_SE"])
  {
    uint64_t v11 = 53LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_TH_TH"])
  {
    uint64_t v11 = 54LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_TR_TR"])
  {
    uint64_t v11 = 55LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_UK_UA"])
  {
    uint64_t v11 = 56LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_VI_VN"])
  {
    uint64_t v11 = 57LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_WUU_CN"])
  {
    uint64_t v11 = 58LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_YUE_CN"])
  {
    uint64_t v11 = 59LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_ZH_CN"])
  {
    uint64_t v11 = 60LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_ZH_HK"])
  {
    uint64_t v11 = 61LL;
  }

  else if ([v10 isEqualToString:@"LOCALE_ZH_TW"])
  {
    uint64_t v11 = 62LL;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  [v6 setLocale:v11];
  [v6 setElapsedSeconds:v4];
  id v12 = objc_alloc_init(&OBJC_CLASS___SADSchemaSADClientEvent);
  [v12 setUodAssetsPrepared:v6];
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v16 = "-[ADAssetManager _emitUODAssetPreparedEventWithLanguage:elapsed:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Emitting asset prepared event", buf, 0xCu);
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v14 emitMessage:v12];
}

- (void)dumpAssistantStateChunk:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100222794;
  v9[3] = &unk_1004FC7E8;
  id v10 = a3;
  id v4 = v10;
  id v5 = objc_retainBlock(v9);
  id v6 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADAssetManager assetsAvailableStatusForLanguage:]( self,  "assetsAvailableStatusForLanguage:",  self->_currentLanguageCode));
  id v8 = -[NSMutableDictionary initWithDictionary:copyItems:](v6, "initWithDictionary:copyItems:", v7, 1LL);

  -[NSMutableDictionary setValue:forKey:](v8, "setValue:forKey:", self->_currentLanguageCode, @"LANGUAGE");
  ((void (*)(void *, NSMutableDictionary *))v5[2])(v5, v8);
}

- (void).cxx_destruct
{
}

+ (ADAssetManager)sharedInstance
{
  if (qword_1005781D0 != -1) {
    dispatch_once(&qword_1005781D0, &stru_1004F6D90);
  }
  return (ADAssetManager *)(id)qword_1005781C8;
}

@end