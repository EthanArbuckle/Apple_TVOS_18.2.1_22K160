@interface AFAnalytics
+ (id)sharedAnalytics;
- (AFAnalytics)init;
- (AFAnalytics)initWithInstanceContext:(id)a3;
- (id)_ad_contextLoggerWithEventType:(int64_t)a3 context:(id)a4 completion:(id)a5;
- (id)_service:(BOOL)a3;
- (void)_speechIdUpdatedForEndpointUUID:(id)a3;
- (void)_stageEvent:(id)a3;
- (void)_stageEvents:(id)a3;
- (void)barrier:(id)a3;
- (void)beginEventsGrouping;
- (void)boostQueuedEvents:(id)a3;
- (void)configureForDaemon;
- (void)endEventsGrouping;
- (void)logEvent:(id)a3;
- (void)logEventWithType:(int64_t)a3 context:(id)a4;
- (void)logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5;
- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4;
- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4 contextProvidingQueue:(id)a5;
- (void)logEventWithType:(int64_t)a3 contextResolver:(id)a4;
- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5;
- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6;
- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextProvider:(id)a5 contextProvidingQueue:(id)a6;
- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextResolver:(id)a5;
- (void)logEvents:(id)a3;
- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnContext:(id)a5;
- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5;
- (void)logInstrumentation:(id)a3 turnContext:(id)a4;
- (void)logInstrumentationOfType:(Class)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5;
- (void)logInstrumentationOfType:(Class)a3 turnIdentifier:(id)a4;
- (void)setService:(id)a3;
- (void)speechIdUpdatedForEndpointUUID:(id)a3;
@end

@implementation AFAnalytics

- (void)configureForDaemon
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
  -[AFAnalytics setService:](self, "setService:", v3);
}

- (id)_ad_contextLoggerWithEventType:(int64_t)a3 context:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000FB368;
  v11[3] = &unk_1004F89B0;
  v11[4] = self;
  id v12 = a4;
  id v13 = a5;
  int64_t v14 = a3;
  id v7 = v13;
  id v8 = v12;
  v9 = objc_retainBlock(v11);

  return v9;
}

- (AFAnalytics)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"AFAnalytics.m",  41,  @"%s is marked as NS_UNAVAILABLE. Use the designated initializer instead.",  "-[AFAnalytics init]");

  return 0LL;
}

- (AFAnalytics)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___AFAnalytics;
  v5 = -[AFAnalytics init](&v17, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.assistant.analytics.client", v9);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    dispatch_group_t v12 = dispatch_group_create();
    group = v5->_group;
    v5->_group = (OS_dispatch_group *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 endpointUUID]);
    endpointUUID = v5->_endpointUUID;
    v5->_endpointUUID = (NSUUID *)v14;
  }

  return v5;
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5
{
  id v8 = a5;
  if (a4)
  {
    -[AFAnalytics logEventWithType:machAbsoluteTime:context:contextNoCopy:]( self,  "logEventWithType:machAbsoluteTime:context:contextNoCopy:",  a3,  a4,  v8,  0LL);
  }

  else
  {
    v9 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      dispatch_queue_t v10 = v9;
      uint64_t Name = AFAnalyticsEventTypeGetName(a3);
      dispatch_group_t v12 = (void *)objc_claimAutoreleasedReturnValue(Name);
      int v13 = 136315650;
      uint64_t v14 = "-[AFAnalytics logEventWithType:machAbsoluteTime:context:]";
      __int16 v15 = 2112;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Not logging event %@ because it has no associated time. Context: %@",  (uint8_t *)&v13,  0x20u);
    }
  }
}

- (void)logEventWithType:(int64_t)a3 context:(id)a4
{
  id v7 = a4;
  uint64_t v6 = mach_absolute_time();
  kdebug_trace((4 * (_WORD)a3 + 20000) & 0xFFFC | 0x2B100000u, 0LL, 0LL, 0LL, 0LL);
  -[AFAnalytics logEventWithType:machAbsoluteTime:context:contextNoCopy:]( self,  "logEventWithType:machAbsoluteTime:context:contextNoCopy:",  a3,  v6,  v7,  0LL);
}

- (void)logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  uint64_t v8 = mach_absolute_time();
  kdebug_trace((4 * (_WORD)a3 + 20000) & 0xFFFC | 0x2B100000u, 0LL, 0LL, 0LL, 0LL);
  -[AFAnalytics logEventWithType:machAbsoluteTime:context:contextNoCopy:]( self,  "logEventWithType:machAbsoluteTime:context:contextNoCopy:",  a3,  v8,  v9,  v5);
}

- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4
{
  id v7 = a4;
  uint64_t v6 = mach_absolute_time();
  kdebug_trace((4 * (_WORD)a3 + 20000) & 0xFFFC | 0x2B100000u, 0LL, 0LL, 0LL, 0LL);
  -[AFAnalytics logEventWithType:machAbsoluteTime:contextProvider:contextProvidingQueue:]( self,  "logEventWithType:machAbsoluteTime:contextProvider:contextProvidingQueue:",  a3,  v6,  v7,  0LL);
}

- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4 contextProvidingQueue:(id)a5
{
  id v8 = a5;
  id v10 = a4;
  uint64_t v9 = mach_absolute_time();
  kdebug_trace((4 * (_WORD)a3 + 20000) & 0xFFFC | 0x2B100000u, 0LL, 0LL, 0LL, 0LL);
  -[AFAnalytics logEventWithType:machAbsoluteTime:contextProvider:contextProvidingQueue:]( self,  "logEventWithType:machAbsoluteTime:contextProvider:contextProvidingQueue:",  a3,  v9,  v10,  v8);
}

- (void)logEventWithType:(int64_t)a3 contextResolver:(id)a4
{
  id v7 = a4;
  uint64_t v6 = mach_absolute_time();
  kdebug_trace((4 * (_WORD)a3 + 20000) & 0xFFFC | 0x2B100000u, 0LL, 0LL, 0LL, 0LL);
  -[AFAnalytics logEventWithType:machAbsoluteTime:contextResolver:]( self,  "logEventWithType:machAbsoluteTime:contextResolver:",  a3,  v6,  v7);
}

- (void)logInstrumentation:(id)a3 turnContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]( self,  "logInstrumentation:machAbsoluteTime:turnContext:",  v7,  mach_absolute_time(),  v6);
}

- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___SISchemaClientTurnContext);
  uint64_t Bytes = AFTurnIdentifierGetBytes(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(Bytes);

  [v12 setTurnID:v11];
  -[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]( self,  "logInstrumentation:machAbsoluteTime:turnContext:",  v9,  a4,  v12);
}

- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v11 = [v10 isDictationHIPAACompliant];

  if (v11)
  {
    id v12 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
      __int16 v34 = 2112;
      id v35 = v8;
      __int16 v36 = 2112;
      id v37 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Not logging instrumentation event %@ because we have HIPAA On-Device Dictation enabled: %@",  buf,  0x20u);
    }

    goto LABEL_16;
  }

  if (!v8)
  {
    __int16 v17 = (os_log_s *)AFSiriLogContextAnalytics;
    if (!os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    v33 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
    id v18 = "%s Attempted to log nil instrumentation event.";
    v19 = v17;
    uint32_t v20 = 12;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    goto LABEL_16;
  }

  if (!a4)
  {
    v21 = (os_log_s *)AFSiriLogContextAnalytics;
    if (!os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315650;
    v33 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    id v18 = "%s Not logging instrumentation event %@ because it has no associated time. Turn context: %@";
    v19 = v21;
    uint32_t v20 = 32;
    goto LABEL_12;
  }

  uint64_t v13 = objc_opt_class(v8);
  uint64_t v14 = SIReflectionInferEventTypeFromClass(v13);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100214284;
    v27[3] = &unk_1004FD510;
    id v28 = v9;
    id v29 = v8;
    v30 = self;
    unint64_t v31 = a4;
    dispatch_async(queue, v27);
  }

  else
  {
    v22 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      v23 = v22;
      v24 = (objc_class *)objc_opt_class(v8);
      v25 = NSStringFromClass(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 136315650;
      v33 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
      __int16 v34 = 2112;
      id v35 = v26;
      __int16 v36 = 2112;
      id v37 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Not logging instrumentation type %@ because it is of an unknown type. Context: %@",  buf,  0x20u);
    }
  }

LABEL_16:
}

- (void)beginEventsGrouping
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100214250;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endEventsGrouping
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10021421C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)logInstrumentationOfType:(Class)a3 turnIdentifier:(id)a4
{
  id v6 = a4;
  -[AFAnalytics logInstrumentationOfType:machAbsoluteTime:turnIdentifier:]( self,  "logInstrumentationOfType:machAbsoluteTime:turnIdentifier:",  a3,  mach_absolute_time(),  v6);
}

- (void)logInstrumentationOfType:(Class)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002141B8;
  v11[3] = &unk_1004F6B00;
  Class v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)boostQueuedEvents:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v11 = "-[AFAnalytics boostQueuedEvents:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002140EC;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v8);
  dispatch_async((dispatch_queue_t)self->_queue, v7);
}

- (void)setService:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002140E0;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  unsigned int v11 = v10;
  if (v6) {
    id v12 = v10;
  }
  else {
    id v12 = [v10 copy];
  }
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100214094;
  v15[3] = &unk_1004FCB88;
  int64_t v18 = a3;
  unint64_t v19 = a4;
  id v16 = v12;
  __int16 v17 = self;
  id v14 = v12;
  dispatch_async(queue, v15);
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextProvider:(id)a5 contextProvidingQueue:(id)a6
{
  id v10 = a5;
  unsigned int v11 = (dispatch_queue_s *)a6;
  if (v11)
  {
    dispatch_group_enter((dispatch_group_t)self->_group);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100213DD0;
    v18[3] = &unk_1004F6B28;
    v19[1] = a3;
    v19[2] = a4;
    id v12 = (id *)v19;
    v18[4] = self;
    v19[0] = v10;
    Class v13 = v18;
    id v14 = v11;
  }

  else
  {
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100213E64;
    v16[3] = &unk_1004F6B28;
    v17[1] = a3;
    v17[2] = a4;
    id v12 = (id *)v17;
    v16[4] = self;
    v17[0] = v10;
    Class v13 = v16;
    id v14 = (dispatch_queue_s *)queue;
  }

  dispatch_async(v14, v13);
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextResolver:(id)a5
{
  if (a5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100213A28;
    v7[3] = &unk_1004F6B50;
    v7[4] = self;
    void v7[5] = a3;
    v7[6] = a4;
    (*((void (**)(id, void *))a5 + 2))(a5, v7);
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100213AB0;
    v6[3] = &unk_1004FBF70;
    v6[5] = a3;
    v6[6] = a4;
    v6[4] = self;
    dispatch_async(queue, v6);
  }

- (void)logEvent:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100213A1C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)logEvents:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100213A10;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)barrier:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    p_queue = &self->_queue;
    queue = (dispatch_queue_s *)self->_queue;
    dispatch_block_t v7 = (dispatch_group_s *)p_queue[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100213A04;
    block[3] = &unk_1004FC838;
    id v10 = v4;
    dispatch_group_notify(v7, queue, block);
  }
}

- (void)speechIdUpdatedForEndpointUUID:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002139F8;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_stageEvent:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFAnalytics _service:](self, "_service:", 1LL));
    id v7 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
    [v5 stageEvents:v6 endpointUUID:self->_endpointUUID completion:0];
  }

- (void)_stageEvents:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AFAnalytics _service:](self, "_service:", 1LL));
    [v4 stageEvents:v5 endpointUUID:self->_endpointUUID completion:0];
  }
}

- (id)_service:(BOOL)a3
{
  p_service = &self->_service;
  service = self->_service;
  if (service) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    if (qword_100578188 != -1) {
      dispatch_once(&qword_100578188, &stru_1004F6B70);
    }
    objc_storeStrong((id *)p_service, (id)qword_100578190);
    service = *p_service;
  }

  return service;
}

- (void)_speechIdUpdatedForEndpointUUID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AFAnalytics _service:](self, "_service:", 1LL));
  [v5 speechIdUpdatedForEndpointUUID:v4];
}

- (void).cxx_destruct
{
}

+ (id)sharedAnalytics
{
  if (qword_100578178 != -1) {
    dispatch_once(&qword_100578178, &stru_1004F6AD8);
  }
  return (id)qword_100578180;
}

@end