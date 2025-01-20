@interface WiFiNWReliabilityMonitor
- (WiFiNWReliabilityMonitor)initWithManagerQueue:(id)a3;
- (void)_cleanup;
- (void)_evaluationComplete:(unint64_t)a3;
- (void)dealloc;
- (void)ingestLQMUpdate:(id)a3;
- (void)processRoamEvent:(__WiFiNetwork *)a3;
- (void)terminateNetworkReliabilityEvaluation;
- (void)waitForNetworkToBeReliableWithTimeout:(__WiFiNetwork *)a3 withTimeout:(unint64_t)a4 withMgrCallback:(id)a5;
@end

@implementation WiFiNWReliabilityMonitor

- (WiFiNWReliabilityMonitor)initWithManagerQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiNWReliabilityMonitor;
  v6 = -[WiFiNWReliabilityMonitor init](&v11, "init");
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_sharedMgrQueue, a3), !v7->_sharedMgrQueue)
    || (v7->_metrics = 1LL,
        *(_WORD *)&v7->_isEvalInProgress = 0,
        uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array")),
        sessions = v7->_sessions,
        v7->_sessions = (NSMutableArray *)v8,
        sessions,
        !v7->_sessions))
  {

    v7 = 0LL;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiNWReliabilityMonitor;
  -[WiFiNWReliabilityMonitor dealloc](&v3, "dealloc");
}

- (void)waitForNetworkToBeReliableWithTimeout:(__WiFiNetwork *)a3 withTimeout:(unint64_t)a4 withMgrCallback:(id)a5
{
  id v8 = a5;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  id v9 = [v8 copy];
  id mgrCallback = self->_mgrCallback;
  self->_id mgrCallback = v9;

  self->_isEvalInProgress = 1;
  objc_super v11 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: kickstarting network reliability learning",  "-[WiFiNWReliabilityMonitor waitForNetworkToBeReliableWithTimeout:withTimeout:withMgrCallback:]");
  }
  objc_autoreleasePoolPop(v11);
  v12 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_sharedMgrQueue);
  timer = self->_timer;
  self->_timer = v12;

  v14 = self->_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000063CC;
  handler[3] = &unk_1001E2520;
  handler[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)v14, handler);
  v15 = -[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]( objc_alloc(&OBJC_CLASS___WiFiNWReliabilityMonitorSession),  "initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:",  a3,  self->_metrics,  20LL,  16LL);
  if (v15)
  {
    -[NSMutableArray insertObject:atIndex:](self->_sessions, "insertObject:atIndex:", v15, 0LL);
    objc_storeStrong((id *)&self->_activeSession, v15);
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    learningStartTimestamp = self->_learningStartTimestamp;
    self->_learningStartTimestamp = v16;

    v18 = self->_timer;
    dispatch_time_t v19 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v18, v19, 0x2540BE400uLL, 0xE8D4A51000uLL);
    v20 = self->_timer;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000063DC;
    v21[3] = &unk_1001E2548;
    v21[4] = self;
    v21[5] = &v23;
    v21[6] = a4;
    dispatch_source_set_event_handler((dispatch_source_t)v20, v21);
    dispatch_resume((dispatch_object_t)self->_timer);
  }

  else
  {
    v24[3] = 2LL;
    -[WiFiNWReliabilityMonitor _evaluationComplete:](self, "_evaluationComplete:", 2LL);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)terminateNetworkReliabilityEvaluation
{
}

- (void)_cleanup
{
  if (self->_isEvalInProgress)
  {
    self->_isEvalInProgress = 0;
    timer = self->_timer;
    if (timer) {
      dispatch_source_cancel((dispatch_source_t)timer);
    }
    -[NSMutableArray removeAllObjects](self->_sessions, "removeAllObjects");
    activeSession = self->_activeSession;
    if (activeSession)
    {
      self->_activeSession = 0LL;
    }
  }

- (void)_evaluationComplete:(unint64_t)a3
{
  if (self->_isEvalInProgress)
  {
    id v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: network reliability evaluation complete with result:%lu",  "-[WiFiNWReliabilityMonitor _evaluationComplete:]",  a3);
    }
    objc_autoreleasePoolPop(v5);
    -[WiFiNWReliabilityMonitor _cleanup](self, "_cleanup");
    id mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
    if (a3 != 3)
    {
      if (mgrCallback)
      {
        mgrCallback[2](mgrCallback, a3);
        id mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
      }
    }

    self->_id mgrCallback = 0LL;
  }

- (void)processRoamEvent:(__WiFiNetwork *)a3
{
  if (self->_isEvalInProgress)
  {
    id v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: received roam event",  "-[WiFiNWReliabilityMonitor processRoamEvent:]");
    }
    objc_autoreleasePoolPop(v5);
    activeSession = self->_activeSession;
    self->_activeSession = 0LL;

    v7 = -[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]( objc_alloc(&OBJC_CLASS___WiFiNWReliabilityMonitorSession),  "initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:",  a3,  self->_metrics,  20LL,  16LL);
    if (v7)
    {
      obj = v7;
      -[NSMutableArray insertObject:atIndex:](self->_sessions, "insertObject:atIndex:", v7, 0LL);
      objc_storeStrong((id *)&self->_activeSession, obj);
      v7 = obj;
      self->_isRoamHappended = 1;
    }
  }

- (void)ingestLQMUpdate:(id)a3
{
  id v4 = a3;
  if (self->_isEvalInProgress)
  {
    activeSession = self->_activeSession;
    id v7 = v4;
    if (activeSession)
    {
      -[WiFiNWReliabilityMonitorSession ingestLQMUpdate:](activeSession, "ingestLQMUpdate:", v4);
    }

    else
    {
      v6 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: active session is null, unexpected",  "-[WiFiNWReliabilityMonitor ingestLQMUpdate:]");
      }
      objc_autoreleasePoolPop(v6);
    }

    id v4 = v7;
  }
}

- (void).cxx_destruct
{
}

@end