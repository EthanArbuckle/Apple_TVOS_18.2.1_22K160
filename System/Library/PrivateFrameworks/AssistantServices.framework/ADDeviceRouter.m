@interface ADDeviceRouter
- (ADDeviceRouter)initWithQueue:(id)a3;
- (id)_initWithQueue:(id)a3 deviceProximityManager:(id)a4;
- (void)_fetchCurrentDeviceContextTuplesIfNecessaryWithCompletion:(id)a3;
- (void)_updateContext:(id)a3;
- (void)getPreferredDeviceToHandleCommand:(id)a3 logNearbyDeviceMetrics:(BOOL)a4 executionContext:(id)a5 sharedUserID:(id)a6 completion:(id)a7;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)updateContext:(id)a3;
@end

@implementation ADDeviceRouter

- (ADDeviceRouter)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceProximityManager sharedManager](&OBJC_CLASS___ADDeviceProximityManager, "sharedManager"));
  v6 = -[ADDeviceRouter _initWithQueue:deviceProximityManager:](self, "_initWithQueue:deviceProximityManager:", v4, v5);

  return v6;
}

- (id)_initWithQueue:(id)a3 deviceProximityManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADDeviceRouter;
  v9 = -[ADDeviceRouter init](&v13, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong(p_isa + 4, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
    [v11 addListener:p_isa];
  }

  return p_isa;
}

- (void)updateContext:(id)a3
{
  id v4 = a3;
  if ((AFSupportsHALDeviceRouting() & 1) != 0)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100077E24;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }

  else
  {
    v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[ADDeviceRouter updateContext:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s #hal Not supported on this platform",  buf,  0xCu);
    }
  }
}

- (void)_updateContext:(id)a3
{
  id v5 = a3;
  p_currentDeviceContextTuples = &self->_currentDeviceContextTuples;
  objc_storeStrong((id *)p_currentDeviceContextTuples, a3);
  int v8 = AFIsInternalInstall(v7);
  v9 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
    {
      int v16 = 136315138;
      v17 = "-[ADDeviceRouter _updateContext:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s #hal updating...",  (uint8_t *)&v16,  0xCu);
    }

    -[NSArray enumerateObjectsUsingBlock:]( *p_currentDeviceContextTuples,  "enumerateObjectsUsingBlock:",  &stru_1004EF080);
    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315138;
      v17 = "-[ADDeviceRouter _updateContext:]";
      v12 = "%s #hal updated";
      objc_super v13 = v11;
      uint32_t v14 = 12;
LABEL_9:
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v16, v14);
    }
  }

  else if (v10)
  {
    v15 = *p_currentDeviceContextTuples;
    int v16 = 136315394;
    v17 = "-[ADDeviceRouter _updateContext:]";
    __int16 v18 = 2112;
    v19 = v15;
    v12 = "%s #hal %@";
    objc_super v13 = v9;
    uint32_t v14 = 22;
    goto LABEL_9;
  }
}

- (void)_fetchCurrentDeviceContextTuplesIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self->_currentDeviceContextTuples)
    {
      (*((void (**)(id))v4 + 2))(v4);
    }

    else
    {
      v6 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        objc_super v13 = "-[ADDeviceRouter _fetchCurrentDeviceContextTuplesIfNecessaryWithCompletion:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s #hal context not updated, fetching now",  buf,  0xCu);
      }

      uint64_t v7 = mach_absolute_time();
      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100077BA8;
      v9[3] = &unk_1004EF0A8;
      v9[4] = self;
      uint64_t v11 = v7;
      id v10 = v5;
      [v8 getCurrentContextSnapshotWithCompletion:v9];
    }
  }
}

- (void)getPreferredDeviceToHandleCommand:(id)a3 logNearbyDeviceMetrics:(BOOL)a4 executionContext:(id)a5 sharedUserID:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ((AFSupportsHALDeviceRouting() & 1) != 0)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (objc_msgSend(v11, "ad_requiresDeviceContext"))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000777D4;
      v17[3] = &unk_1004F0EF8;
      v17[4] = self;
      id v18 = v11;
      id v19 = v12;
      id v20 = v13;
      id v21 = v14;
      -[ADDeviceRouter _fetchCurrentDeviceContextTuplesIfNecessaryWithCompletion:]( self,  "_fetchCurrentDeviceContextTuplesIfNecessaryWithCompletion:",  v17);
    }

    else
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v11,  "ad_executionDeviceForDeviceContextTuples:executionContext:proximityMap:sharedUserID:localDeviceIsFollower:",  self->_currentDeviceContextTuples,  v12,  0,  v13,  self->_isLocalDeviceFollowerInStereoPair == 2));
      (*((void (**)(id, void *, void))v14 + 2))(v14, v16, 0LL);
    }
  }

  else
  {
    v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[ADDeviceRouter getPreferredDeviceToHandleCommand:logNearbyDeviceMetrics:executionContext:sharedUserID:completion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s #hal Not supported on this platform",  buf,  0xCu);
    }

    (*((void (**)(id, void, void))v14 + 2))(v14, 0LL, 0LL);
  }
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000776A4;
  v6[3] = &unk_1004FB0E0;
  v6[4] = self;
  AFFetchFollowerStatusInStereoPair(v6, a2, a3, a4, a5, a6);
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000775E0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
}

@end