@interface GTMTLTelemetryService
- (GTMTLTelemetryService)initWithGuestApp:(GTMTLGuestAppClient *)a3;
- (id)query:(id)a3;
- (id)update:(id)a3;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)notifyStatistics:(id)a3;
@end

@implementation GTMTLTelemetryService

- (GTMTLTelemetryService)initWithGuestApp:(GTMTLGuestAppClient *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GTMTLTelemetryService;
  v3 = -[GTMTLTelemetryService init](&v16, "init", a3);
  if (v3)
  {
    os_log_t v4 = os_log_create("com.apple.gputools.transport", "TelemetryService");
    v5 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v4;

    v6 = (os_log_s *)*((void *)v3 + 1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_debug_impl(&dword_0, v6, OS_LOG_TYPE_DEBUG, "Create Telemetry Service", v15, 2u);
    }

    pthread_mutex_init((pthread_mutex_t *)(v3 + 24), 0LL);
    dispatch_queue_t v7 = dispatch_queue_create("com.app.gputools.telemetry", 0LL);
    v8 = (void *)*((void *)v3 + 11);
    *((void *)v3 + 11) = v7;

    dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v3 + 11));
    v10 = (void *)*((void *)v3 + 12);
    *((void *)v3 + 12) = v9;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v3 + 12), &__block_literal_global_111);
    else {
      uint64_t v11 = (unint64_t)(float)(*(float *)&GT_TELEMETRY_ENV * 1000000000.0);
    }
    dispatch_source_set_timer(*((dispatch_source_t *)v3 + 12), 0LL, v11, 0LL);
    v12 = objc_opt_new(&OBJC_CLASS___GTObservableService);
    v13 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v12;
  }

  return (GTMTLTelemetryService *)v3;
}

- (unint64_t)registerObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_mutex_lock(p_lock);
  id v6 = -[GTObservableService registerObserver:](self->_observers, "registerObserver:", v5);

  pthread_mutex_unlock(p_lock);
  return (unint64_t)v6;
}

- (void)deregisterObserver:(unint64_t)a3
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[GTObservableService deregisterObserver:](self->_observers, "deregisterObserver:", a3);
  if (!-[GTObservableService count](self->_observers, "count")) {
    dispatch_suspend((dispatch_object_t)self->_timer);
  }
  pthread_mutex_unlock(p_lock);
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  pthread_mutex_lock(&self->_lock);
  if (-[GTObservableService count](self->_observers, "count"))
  {
    -[GTObservableService deregisterObserversForConnection:path:]( self->_observers,  "deregisterObserversForConnection:path:",  v7,  v6);
    if (!-[GTObservableService count](self->_observers, "count")) {
      dispatch_suspend((dispatch_object_t)self->_timer);
    }
  }

  pthread_mutex_unlock(&self->_lock);
}

- (id)query:(id)a3
{
  id v3 = a3;
  id v35 = [v3 requestID];
  os_log_t v4 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
  id v6 = -[NSMutableArray initWithCapacity:](v4, "initWithCapacity:", [v5 count]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0LL;
    uint64_t v36 = GTTelemetryErrorDomain;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v9]);

      uint64_t v13 = objc_opt_class(&OBJC_CLASS___GTTelemetryQueryStatistics, v12);
      if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
      {
        id v15 = [v11 requestID];
        id Telemetry = GTMTLGuestAppClient_getTelemetry();
        id v17 = (id)objc_claimAutoreleasedReturnValue(Telemetry);
        id v18 = objc_alloc_init(&OBJC_CLASS___GTTelemetryResponse);
        [v18 setRequestID:v15];
        v39 = 0LL;
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  &v39));
        v20 = v39;
      }

      else
      {
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___GTTelemetryQueryConfiguration, v14);
        if ((objc_opt_isKindOfClass(v11, v21) & 1) == 0)
        {
          id v17 = objc_alloc_init(&OBJC_CLASS___GTTelemetryResponse);
          objc_msgSend(v17, "setRequestID:", objc_msgSend(v11, "requestID"));
          NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
          v41 = @"unknown request";
          v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v36,  1LL,  v25));
          [v17 setError:v26];

          -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v17, v9);
          goto LABEL_9;
        }

        id v22 = [v11 requestID];
        id v17 = (id)objc_opt_new(&OBJC_CLASS___GTTelemetryConfiguration);
        LODWORD(v23) = GT_TELEMETRY_ENV;
        [v17 setReportFrequencyInSeconds:v23];
        id v18 = objc_alloc_init(&OBJC_CLASS___GTTelemetryResponse);
        [v18 setRequestID:v22];
        v38 = 0LL;
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  &v38));
        v20 = v38;
      }

      id v24 = v20;
      [v18 setData:v19];

      [v18 setError:v24];
      -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v18, v9);

LABEL_9:
      ++v9;
      v27 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
      id v28 = [v27 count];
    }

    while ((unint64_t)v28 > v9);
  }

  v29 = (void *)objc_opt_new(&OBJC_CLASS___GTTelemetryResponse);
  id v30 = -[NSMutableArray copy](v6, "copy");
  id v37 = 0LL;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v30,  1LL,  &v37));
  id v32 = v37;
  [v29 setData:v31];

  [v29 setError:v32];
  [v29 setRequestID:v35];
  v33 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v3 completionHandler]);
  ((void (**)(void, void *))v33)[2](v33, v29);

  return 0LL;
}

- (id)update:(id)a3
{
  id v3 = a3;
  id v31 = [v3 requestID];
  os_log_t v4 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
  id v6 = -[NSMutableArray initWithCapacity:](v4, "initWithCapacity:", [v5 count]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0LL;
    uint64_t v33 = GTTelemetryErrorDomain;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requests", v31));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v9]);

      uint64_t v13 = objc_opt_class(&OBJC_CLASS___GTTelemetryUpdateConfiguration, v12);
      if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
      {
        id v14 = v11;
        id v15 = [v14 requestID];
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v14 configuration]);
        [v16 reportFrequencyInSeconds];
        GT_TELEMETRY_ENV = v17;

        if (*(float *)&GT_TELEMETRY_ENV != INFINITY) {
          dispatch_source_set_timer( (dispatch_source_t)self->_timer,  0LL,  (unint64_t)(float)(*(float *)&GT_TELEMETRY_ENV * 1000000000.0),  0LL);
        }
        id v18 = objc_alloc_init(&OBJC_CLASS___GTTelemetryResponse);
        [v18 setRequestID:v15];
        id v35 = 0LL;
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  &__kCFBooleanTrue,  1LL,  &v35));
        id v20 = v35;
        [v18 setData:v19];

        [v18 setError:v20];
        -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v18, v9);
      }

      else
      {
        id v14 = objc_alloc_init(&OBJC_CLASS___GTTelemetryResponse);
        objc_msgSend(v14, "setRequestID:", objc_msgSend(v11, "requestID"));
        NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
        id v37 = @"unknown request";
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v33,  1LL,  v21));
        [v14 setError:v22];

        -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v14, v9);
      }

      ++v9;
      double v23 = (void *)objc_claimAutoreleasedReturnValue([v3 requests]);
      id v24 = [v23 count];
    }

    while ((unint64_t)v24 > v9);
  }

  v25 = (void *)objc_opt_new(&OBJC_CLASS___GTTelemetryResponse);
  id v26 = -[NSMutableArray copy](v6, "copy");
  id v34 = 0LL;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v26,  1LL,  &v34));
  id v28 = v34;
  [v25 setData:v27];

  [v25 setError:v28];
  [v25 setRequestID:v31];
  v29 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v3 completionHandler]);
  ((void (**)(void, void *))v29)[2](v29, v25);

  return 0LL;
}

- (void)notifyStatistics:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  observers = self->_observers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __42__GTMTLTelemetryService_notifyStatistics___block_invoke;
  v8[3] = &unk_20DA48;
  id v9 = v4;
  id v7 = v4;
  -[GTObservableService notifyAll:](observers, "notifyAll:", v8);
  pthread_mutex_unlock(p_lock);
}

- (void).cxx_destruct
{
}

id __42__GTMTLTelemetryService_notifyStatistics___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notifyStatistics:*(void *)(a1 + 32)];
}

@end