@interface HUDContextUpdater
+ (id)sharedInstance;
- (BOOL)cleanUpExpiredHUDContents;
- (BOOL)isNoTaskPending;
- (HUDContextUpdater)init;
- (NSMutableDictionary)clearHUDRequestDictionary;
- (NSMutableDictionary)hudContentDictionary;
- (NSTimer)updateTimer;
- (id)hudUpdateHandler;
- (void)HandleUpdateAndClear;
- (void)addHUDContents:(id)a3;
- (void)kickOffUpdater;
- (void)saveClearHUDRequest;
- (void)setHudUpdateHandler:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)stopUpdater;
@end

@implementation HUDContextUpdater

- (HUDContextUpdater)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HUDContextUpdater;
  v2 = -[HUDContextUpdater init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    id hudUpdateHandler = v2->_hudUpdateHandler;
    v2->_id hudUpdateHandler = 0LL;

    *(void *)&v3->_hudContenDictLock._os_unfair_lock_opaque = 0LL;
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hudContentDictionary = v3->_hudContentDictionary;
    v3->_hudContentDictionary = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clearHUDRequestDictionary = v3->_clearHUDRequestDictionary;
    v3->_clearHUDRequestDictionary = v7;

    updateTimer = v3->_updateTimer;
    v3->_updateTimer = 0LL;
  }

  return v3;
}

- (void)addHUDContents:(id)a3
{
  p_hudContenDictLock = &self->_hudContenDictLock;
  id v5 = a3;
  os_unfair_lock_lock(p_hudContenDictLock);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_hudContentDictionary, "addEntriesFromDictionary:", v5);

  os_unfair_lock_unlock(p_hudContenDictLock);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[HUDRenderServer sharedInstance](&OBJC_CLASS___HUDRenderServer, "sharedInstance"));
  [v6 prepareHUDContextIfNeeded];
}

- (void)saveClearHUDRequest
{
  v3 = objc_alloc(&OBJC_CLASS___HTHangHUDInfo);
  LOBYTE(v8) = 1;
  v4 = -[HTHangHUDInfo initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:]( v3,  "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:",  0LL,  0LL,  0LL,  off_1000361C0,  off_1000361C0,  off_1000361C0,  0.0,  v8);
  os_unfair_lock_lock(&self->_clearHUDRequestDictLock);
  -[NSMutableDictionary setObject:forKey:](self->_clearHUDRequestDictionary, "setObject:forKey:", v4, off_1000361C0);
  os_unfair_lock_unlock(&self->_clearHUDRequestDictLock);
  id v5 = sub_10000A4EC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    clearHUDRequestDictionary = self->_clearHUDRequestDictionary;
    *(_DWORD *)buf = 138412290;
    v10 = clearHUDRequestDictionary;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, " - clear HUD dict: %@", buf, 0xCu);
  }
}

- (BOOL)cleanUpExpiredHUDContents
{
  os_unfair_lock_t lock = &self->_hudContenDictLock;
  os_unfair_lock_lock(&self->_hudContenDictLock);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_hudContentDictionary, "allKeys"));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v4 = v3;
  id v5 = [v3 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v5)
  {
    id v6 = v5;
    char v35 = 0;
    uint64_t v7 = *(void *)v37;
    while (1)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_hudContentDictionary,  "objectForKeyedSubscript:",  v9));
        uint64_t v11 = mach_absolute_time();
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___HTProcessLaunchExitRecord);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0)
        {
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___HTHangHUDInfo);
          if ((objc_opt_isKindOfClass(v10, v21) & 1) == 0) {
            goto LABEL_22;
          }
          id v22 = v10;
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[HUDContext displayNameForHangInfo:]( &OBJC_CLASS___HUDContext,  "displayNameForHangInfo:",  v22));
          double v23 = sub_100014AF4(v11 - (void)[v22 receivedTimestamp]);
          if (v23 <= 5000.0)
          {
            id v27 = sub_10000A4EC();
            v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              double v31 = sub_100014AF4(v11);
              double v32 = sub_100014AF4((unint64_t)[v22 receivedTimestamp]);
              *(_DWORD *)buf = 138413314;
              v41 = v16;
              __int16 v42 = 2048;
              double v43 = v23;
              __int16 v44 = 1024;
              *(_DWORD *)v45 = 5000;
              *(_WORD *)&v45[4] = 2048;
              *(double *)&v45[6] = v31;
              __int16 v46 = 2048;
              double v47 = v32;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "  ==> keeping hangInfo item %@ since durationToKeepRendering: %f ms < threshold: %i ms where current_tim e: %fms, receivedTimestamp: %f",  buf,  0x30u);
            }
          }

          else
          {
            -[NSMutableDictionary removeObjectForKey:](self->_hudContentDictionary, "removeObjectForKey:", v9);
            id v24 = sub_10000A4EC();
            v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = [v22 hangStartTime];
              *(_DWORD *)buf = 138413058;
              v41 = v16;
              __int16 v42 = 2048;
              double v43 = *(double *)&v25;
              __int16 v44 = 2048;
              *(double *)v45 = v23;
              *(_WORD *)&v45[8] = 1024;
              *(_DWORD *)&v45[10] = 5000;
              v19 = v17;
              v20 = "  ==> removing hangInfo with process name %@ and hangStartTime: %llu since durationToKeepRendering: "
                    "%f ms > threshold: %i ms";
LABEL_14:
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x26u);
            }
          }

          goto LABEL_21;
        }

        id v13 = v10;
        double v14 = sub_100014AF4(v11 - (void)[v13 requestedToRenderTimestamp]);
        if (v14 <= 5000.0)
        {
          id v26 = sub_10000A4EC();
          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 processName]);
            double v29 = sub_100014AF4(v11);
            double v30 = sub_100014AF4((unint64_t)[v13 exitTimestamp]);
            *(_DWORD *)buf = 138413314;
            v41 = v28;
            __int16 v42 = 2048;
            double v43 = v14;
            __int16 v44 = 1024;
            *(_DWORD *)v45 = 5000;
            *(_WORD *)&v45[4] = 2048;
            *(double *)&v45[6] = v29;
            __int16 v46 = 2048;
            double v47 = v30;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "  ==> keeping ProcExit item %@ since durationToKeepRendering: %f ms < threshold: %i where current_time: %f ms, exitTimestamp: %f",  buf,  0x30u);
          }

          char v35 = 1;
          goto LABEL_21;
        }

        -[NSMutableDictionary removeObjectForKey:](self->_hudContentDictionary, "removeObjectForKey:", v9);
        id v15 = sub_10000A4EC();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 processName]);
          id v18 = [v13 exitTimestamp];
          *(_DWORD *)buf = 138413058;
          v41 = v17;
          __int16 v42 = 2048;
          double v43 = *(double *)&v18;
          __int16 v44 = 2048;
          *(double *)v45 = v14;
          *(_WORD *)&v45[8] = 1024;
          *(_DWORD *)&v45[10] = 5000;
          v19 = v16;
          v20 = "  ==> removing ProcExit item %@ and exit timestamp %llu since durationToKeepRendering: %f ms > theshold: %i ms";
          goto LABEL_14;
        }

+ (id)sharedInstance
{
  if (qword_1000364E8 != -1) {
    dispatch_once(&qword_1000364E8, &stru_100028A58);
  }
  return (id)qword_1000364E0;
}

- (void)kickOffUpdater
{
  if (!self->_updateTimer)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100006090;
    v6[3] = &unk_100028A80;
    v6[4] = self;
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:repeats:block:",  1LL,  v6,  0.05));
    updateTimer = self->_updateTimer;
    self->_updateTimer = v3;

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v5 addTimer:self->_updateTimer forMode:NSDefaultRunLoopMode];

    -[NSTimer fire](self->_updateTimer, "fire");
  }

- (void)stopUpdater
{
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0LL;
}

- (BOOL)isNoTaskPending
{
  return !-[NSMutableDictionary count](self->_hudContentDictionary, "count")
      && -[NSMutableDictionary count](self->_clearHUDRequestDictionary, "count") == 0LL;
}

- (void)HandleUpdateAndClear
{
  id hudUpdateHandler = (void (**)(id, NSMutableDictionary *))self->_hudUpdateHandler;
  if (hudUpdateHandler)
  {
    hudUpdateHandler[2](hudUpdateHandler, self->_hudContentDictionary);
    unsigned __int8 v4 = -[HUDContextUpdater cleanUpExpiredHUDContents](self, "cleanUpExpiredHUDContents");
    if (-[NSMutableDictionary count](self->_clearHUDRequestDictionary, "count") && (v4 & 1) == 0)
    {
      (*((void (**)(void))self->_hudUpdateHandler + 2))();
      os_unfair_lock_lock(&self->_clearHUDRequestDictLock);
      -[NSMutableDictionary removeAllObjects](self->_clearHUDRequestDictionary, "removeAllObjects");
      os_unfair_lock_unlock(&self->_clearHUDRequestDictLock);
    }

    if (!-[NSMutableDictionary count](self->_hudContentDictionary, "count") && (byte_1000364F0 & 1) == 0)
    {
      id v5 = sub_10000A4EC();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_100015F2C(v6, v7, v8);
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[HUDContextUpdater sharedInstance](&OBJC_CLASS___HUDContextUpdater, "sharedInstance"));
      [v9 saveClearHUDRequest];

      byte_1000364F0 = 1;
    }

    if (-[NSMutableDictionary count](self->_hudContentDictionary, "count")) {
      byte_1000364F0 = 0;
    }
  }

- (id)hudUpdateHandler
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setHudUpdateHandler:(id)a3
{
}

- (NSMutableDictionary)hudContentDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSMutableDictionary)clearHUDRequestDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSTimer)updateTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end