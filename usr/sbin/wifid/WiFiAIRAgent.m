@interface WiFiAIRAgent
+ (id)sharedInstance;
- (BOOL)isInterfaceRankingInProgress;
- (id)_initPrivate;
- (unint64_t)convertFromNWReliabilityMonitorResult:(unint64_t)a3;
- (void)_evaluationComplete:(unint64_t)a3;
- (void)_userInteractivityChangedCallback:(unint64_t)a3;
- (void)ingestLQMUpdate:(id)a3;
- (void)processRoamEvent:(__WiFiNetwork *)a3;
- (void)setWiFiManagerQueue:(id)a3;
- (void)terminateRequest;
- (void)waitForConfirmationWithTimeout:(__WiFiNetwork *)a3 withBssEnvironment:(int)a4 withMgrCallback:(id)a5;
@end

@implementation WiFiAIRAgent

+ (id)sharedInstance
{
  return 0LL;
}

- (id)_initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiAIRAgent;
  id result = -[WiFiAIRAgent init](&v3, "init");
  if (result) {
    *((_WORD *)result + 12) = 0;
  }
  return result;
}

- (void)setWiFiManagerQueue:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)&self->_sharedMgrQueue, a3);
  }

  else
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s without managerQueue" message:3 "%s without managerQueue" "-[WiFiAIRAgent setWiFiManagerQueue:]" 0];
    }
    objc_autoreleasePoolPop(v5);
  }
}

- (void)_userInteractivityChangedCallback:(unint64_t)a3
{
  sharedMgrQueue = (dispatch_queue_s *)self->_sharedMgrQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000071CC;
  v4[3] = &unk_1001E2598;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(sharedMgrQueue, v4);
}

- (unint64_t)convertFromNWReliabilityMonitorResult:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0LL;
  }
  else {
    return qword_10017EFF0[a3 - 1];
  }
}

- (void)waitForConfirmationWithTimeout:(__WiFiNetwork *)a3 withBssEnvironment:(int)a4 withMgrCallback:(id)a5
{
  id v8 = a5;
  id v9 = [v8 copy];
  id mgrCallback = self->_mgrCallback;
  self->_id mgrCallback = v9;

  self->_isEvalInProgress = 1;
  v11 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"AIR agent received a request"];
  }
  objc_autoreleasePoolPop(v11);
  if (!self->_sharedMgrQueue)
  {
    v18 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: managerQueue is not SET" message:3];
    }
    objc_autoreleasePoolPop(v18);
    goto LABEL_11;
  }

  if ((a4 & 0xFFFFFFFD) != 4)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: not a multi-AP environment" message:3];
    }
    objc_autoreleasePoolPop(v21);
    v19 = self;
    uint64_t v20 = 3LL;
    goto LABEL_18;
  }

  v12 = [WiFiUserInteractionMonitor sharedInstance];
  unsigned __int8 v13 = [v12 isRealTimeAppActive];

  if ((v13 & 1) == 0)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: no realtime app active" message:3];
    }
    objc_autoreleasePoolPop(v22);
    v19 = self;
    uint64_t v20 = 4LL;
    goto LABEL_18;
  }

  v14 = [WiFiUserInteractionMonitor sharedInstance];
  [v14 registerStateChangeCallback:&stru_1001E25D8 withCallbackContext:self];

  self->_cbRegisteredWithUserActivity = 1;
  v15 = -[WiFiNWReliabilityMonitor initWithManagerQueue:]( objc_alloc(&OBJC_CLASS___WiFiNWReliabilityMonitor),  "initWithManagerQueue:",  self->_sharedMgrQueue);
  monitor = self->_monitor;
  self->_monitor = v15;

  v17 = self->_monitor;
  if (!v17)
  {
LABEL_11:
    v19 = self;
    uint64_t v20 = 2LL;
LABEL_18:
    -[WiFiAIRAgent _evaluationComplete:](v19, "_evaluationComplete:", v20);
    goto LABEL_19;
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000075A0;
  v23[3] = &unk_1001E2600;
  v23[4] = self;
  -[WiFiNWReliabilityMonitor waitForNetworkToBeReliableWithTimeout:withTimeout:withMgrCallback:]( v17,  "waitForNetworkToBeReliableWithTimeout:withTimeout:withMgrCallback:",  a3,  60LL,  v23);
LABEL_19:
}

- (void)terminateRequest
{
}

- (void)_evaluationComplete:(unint64_t)a3
{
  if (self->_isEvalInProgress)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: AIR agent request complete with result:%lu" message:3, "-[WiFiAIRAgent _evaluationComplete:]", a3];
    }
    objc_autoreleasePoolPop(v5);
    self->_isEvalInProgress = 0;
    if (self->_cbRegisteredWithUserActivity)
    {
      id v6 = [WiFiUserInteractionMonitor sharedInstance];
      [v6 unregisterStateChangeCallback:self];

      self->_cbRegisteredWithUserActivity = 0;
    }

    monitor = self->_monitor;
    if (monitor)
    {
      self->_monitor = 0LL;
    }

    id mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
    if (mgrCallback)
    {
      if (a3 != 6)
      {
        mgrCallback[2](mgrCallback, a3);
        id mgrCallback = (void (**)(id, unint64_t))self->_mgrCallback;
      }

      self->_id mgrCallback = 0LL;
    }
  }

- (BOOL)isInterfaceRankingInProgress
{
  return self->_isEvalInProgress;
}

- (void)processRoamEvent:(__WiFiNetwork *)a3
{
  if (-[WiFiAIRAgent isInterfaceRankingInProgress](self, "isInterfaceRankingInProgress"))
  {
    monitor = self->_monitor;
    if (monitor) {
      -[WiFiNWReliabilityMonitor processRoamEvent:](monitor, "processRoamEvent:", a3);
    }
  }

- (void)ingestLQMUpdate:(id)a3
{
  id v5 = a3;
  if (-[WiFiAIRAgent isInterfaceRankingInProgress](self, "isInterfaceRankingInProgress"))
  {
    monitor = self->_monitor;
    if (monitor) {
      -[WiFiNWReliabilityMonitor ingestLQMUpdate:](monitor, "ingestLQMUpdate:", v5);
    }
  }
}

- (void).cxx_destruct
{
}

@end