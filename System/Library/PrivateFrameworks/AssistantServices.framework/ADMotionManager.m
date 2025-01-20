@interface ADMotionManager
- (ADMotionManager)init;
- (BOOL)isDriving;
- (CMMotionActivity)_motionActivity;
- (id)motionActivity;
- (id)motionConfidence;
- (int64_t)deviceMotion;
- (void)_setMotionActivity:(id)a3;
- (void)startUpdatingMotionActivityForReason:(id)a3 completion:(id)a4;
- (void)stopUpdatingMotionActivityForReason:(id)a3 completion:(id)a4;
@end

@implementation ADMotionManager

- (ADMotionManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ADMotionManager;
  v2 = -[ADMotionManager init](&v19, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADMotionManagerInternalQueue", v4);

    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    opQueue = v2->_opQueue;
    v2->_opQueue = v7;

    -[NSOperationQueue setUnderlyingQueue:](v2->_opQueue, "setUnderlyingQueue:", v2->_internalQueue);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_opQueue, "setMaxConcurrentOperationCount:", 1LL);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("ADMotionManagerExternalQueue", v10);

    externalQueue = v2->_externalQueue;
    v2->_externalQueue = (OS_dispatch_queue *)v11;

    v13 = v2->_internalQueue;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100300A24;
    v17[3] = &unk_1004FBBD0;
    v18 = v13;
    v15 = v13;
    [v14 addQueue:v15 heartBeatInterval:v17 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return v2;
}

- (void)startUpdatingMotionActivityForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[ADMotionManager startUpdatingMotionActivityForReason:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s reason = %@", buf, 0x16u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1003006E8;
  v11[3] = &unk_1004FD990;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(internalQueue, v11);
}

- (void)stopUpdatingMotionActivityForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[ADMotionManager stopUpdatingMotionActivityForReason:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s reason = %@", buf, 0x16u);
  }

  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100300620;
  v11[3] = &unk_1004FD990;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(internalQueue, v11);
}

- (id)motionActivity
{
  uint64_t v8 = 0LL;
  dispatch_queue_attr_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  dispatch_queue_t v11 = sub_100300464;
  id v12 = sub_100300474;
  id v13 = 0LL;
  externalQueue = (dispatch_queue_s *)self->_externalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100300510;
  v7[3] = &unk_1004FCDB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(externalQueue, v7);
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v9[5];
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[ADMotionManager motionActivity]";
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s motionActivity = %@", buf, 0x16u);
  }

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)motionConfidence
{
  uint64_t v8 = 0LL;
  dispatch_queue_attr_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  dispatch_queue_t v11 = sub_100300464;
  id v12 = sub_100300474;
  id v13 = 0LL;
  externalQueue = (dispatch_queue_s *)self->_externalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10030047C;
  v7[3] = &unk_1004FCDB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(externalQueue, v7);
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v9[5];
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[ADMotionManager motionConfidence]";
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s motionConfidence = %@", buf, 0x16u);
  }

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (BOOL)isDriving
{
  uint64_t v8 = 0LL;
  dispatch_queue_attr_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  externalQueue = (dispatch_queue_s *)self->_externalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100300414;
  v7[3] = &unk_1004FCDB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(externalQueue, v7);
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    if (*((_BYTE *)v9 + 24)) {
      uint64_t v6 = @"YES";
    }
    else {
      uint64_t v6 = @"NO";
    }
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ADMotionManager isDriving]";
    __int16 v14 = 2112;
    __int16 v15 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s isDriving = %@", buf, 0x16u);
  }

  char v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (int64_t)deviceMotion
{
  uint64_t v8 = 0LL;
  dispatch_queue_attr_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  externalQueue = (dispatch_queue_s *)self->_externalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100300380;
  v7[3] = &unk_1004FCDB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(externalQueue, v7);
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v9[3];
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ADMotionManager deviceMotion]";
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #modes deviceMotion = %ld", buf, 0x16u);
  }

  int64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (CMMotionActivity)_motionActivity
{
  return self->_motionActivity;
}

- (void)_setMotionActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end