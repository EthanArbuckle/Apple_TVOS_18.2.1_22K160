@interface AKProximityController
- (AKProximityController)initWithEngine:(id)a3;
- (AKProximityEngine)engine;
- (BOOL)_isEngineActivated;
- (BOOL)isActivated;
- (double)timeout;
- (id)invalidationHandler;
- (void)_activateEngine;
- (void)_invalidateEngine;
- (void)_prepareEngine;
- (void)_unsafe_InvalidateEngine;
- (void)_unsafe_cancelEngineTimeoutSource;
- (void)_unsafe_resumeEngineTimeoutSource;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)proximityEngine:(id)a3 managerDidUpdateState:(id)a4;
- (void)proximityEngineDidActivate:(id)a3;
- (void)proximityEngineDidInvalidate:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation AKProximityController

- (AKProximityController)initWithEngine:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___AKProximityController;
  v6 = -[AKProximityController init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_engine, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.proximity-controller", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.proximity-controller-engine", v13);
    engineQueue = v7->_engineQueue;
    v7->_engineQueue = (OS_dispatch_queue *)v14;

    v7->_timeout = 300.0;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1001304F0(v4);
  }

  -[AKProximityController _unsafe_InvalidateEngine](self, "_unsafe_InvalidateEngine");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AKProximityController;
  -[AKProximityController dealloc](&v5, "dealloc");
}

- (void)activate
{
}

- (void)invalidate
{
}

- (BOOL)isActivated
{
  return -[AKProximityController _isEngineActivated](self, "_isEngineActivated");
}

- (void)_prepareEngine
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030174;
  block[3] = &unk_1001C7300;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_activateEngine
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003024C;
  block[3] = &unk_1001C7300;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_invalidateEngine
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030314;
  block[3] = &unk_1001C7300;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)_isEngineActivated
{
  v2 = self;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = (dispatch_queue_s *)v2->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000303CC;
  v5[3] = &unk_1001C7A08;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_unsafe_InvalidateEngine
{
  uint64_t v3 = _AKLogSystem(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100130684(self);
  }

  -[AKProximityController _unsafe_cancelEngineTimeoutSource](self, "_unsafe_cancelEngineTimeoutSource");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKProximityController engine](self, "engine"));
  [v5 invalidate];
}

- (void)_unsafe_resumeEngineTimeoutSource
{
  p_engineTimeoutSource = &self->_engineTimeoutSource;
  engineTimeoutSource = self->_engineTimeoutSource;
  uint64_t v5 = _AKLogSystem(self);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_source_t v7 = (dispatch_source_t)v6;
  if (engineTimeoutSource)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1001307EC();
    }
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100130764(self);
    }

    dispatch_source_t v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    if (v7)
    {
      -[AKProximityController timeout](self, "timeout");
      dispatch_time_t v9 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v8 * 1000000000.0));
      dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      objc_initWeak(&location, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100030688;
      handler[3] = &unk_1001C6EE8;
      objc_copyWeak(&v17, &location);
      dispatch_source_set_registration_handler(v7, handler);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1000306DC;
      v14[3] = &unk_1001C6EE8;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_cancel_handler(v7, v14);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100030730;
      v12[3] = &unk_1001C6EE8;
      objc_copyWeak(&v13, &location);
      dispatch_source_set_event_handler(v7, v12);
      dispatch_resume(v7);
      objc_storeStrong((id *)p_engineTimeoutSource, v7);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }

    else
    {
      uint64_t v10 = _AKLogSystem(0LL);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_100130704();
      }
    }
  }
}

- (void)_unsafe_cancelEngineTimeoutSource
{
  if (self->_engineTimeoutSource)
  {
    uint64_t v3 = _AKLogSystem(self);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10013096C();
    }

    dispatch_source_cancel((dispatch_source_t)self->_engineTimeoutSource);
    engineTimeoutSource = self->_engineTimeoutSource;
    self->_engineTimeoutSource = 0LL;
  }

- (void)proximityEngine:(id)a3 managerDidUpdateState:(id)a4
{
  id v5 = a4;
  id v6 = [v5 state];
  switch((unint64_t)v6)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      uint64_t v7 = _AKLogSystem(v6);
      double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1001309CC((uint64_t)self, v5, v8);
      }

      break;
    case 2uLL:
      uint64_t v9 = _AKLogSystem(v6);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100130A80();
      }
      goto LABEL_9;
    case 3uLL:
      uint64_t v11 = _AKLogSystem(v6);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_100130AF0();
      }
LABEL_9:

      -[AKProximityController invalidate](self, "invalidate");
      break;
    case 5uLL:
      uint64_t v12 = _AKLogSystem(v6);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = self;
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@: Manager (%@) reported powered-on state",  (uint8_t *)&v14,  0x16u);
      }

      -[AKProximityController _activateEngine](self, "_activateEngine");
      break;
    default:
      break;
  }
}

- (void)proximityEngineDidActivate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _AKLogSystem(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100130B60();
  }
}

- (void)proximityEngineDidInvalidate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030AB0;
  block[3] = &unk_1001C7300;
  block[4] = self;
  dispatch_async(queue, block);
  uint64_t v7 = _AKLogSystem(v6);
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100130BC8();
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKProximityController invalidationHandler](self, "invalidationHandler"));
  if (v9)
  {
    uint64_t v10 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[AKProximityController invalidationHandler](self, "invalidationHandler"));
    v10[2]();
  }
}

- (AKProximityEngine)engine
{
  return self->_engine;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end