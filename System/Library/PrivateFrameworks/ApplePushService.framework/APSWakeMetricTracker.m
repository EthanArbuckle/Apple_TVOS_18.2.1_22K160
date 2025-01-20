@interface APSWakeMetricTracker
- (APSWakeMetricTracker)init;
- (APSWakeMetricTracker)initWithOnConnectedInterval:(double)a3 onDisconnectedInterval:(double)a4 metricSubmissionBlock:(id)a5;
- (BOOL)didConnect;
- (BOOL)hasReceivedStoredMessage;
- (BOOL)startedConnected;
- (NSTimer)metricSubmitTimer;
- (double)connectedTime;
- (double)lastSignificantTime;
- (double)onConnectedInterval;
- (double)onDisconnectedInterval;
- (double)startTime;
- (double)tentativeConnectedTime;
- (id)metricSubmissionBlock;
- (unint64_t)state;
- (void)_clearState;
- (void)_fireMetricIfNeeded;
- (void)_timerFired:(id)a3;
- (void)noteDidConnect;
- (void)noteReceivedLiveMessage;
- (void)noteReceivedStoredMessage;
- (void)noteSystemDidFullWakeWhileConnected:(BOOL)a3;
- (void)noteSystemWillSleep;
- (void)setConnectedTime:(double)a3;
- (void)setDidConnect:(BOOL)a3;
- (void)setHasReceivedStoredMessage:(BOOL)a3;
- (void)setLastSignificantTime:(double)a3;
- (void)setMetricSubmissionBlock:(id)a3;
- (void)setMetricSubmitTimer:(id)a3;
- (void)setOnConnectedInterval:(double)a3;
- (void)setOnDisconnectedInterval:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setStartedConnected:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setTentativeConnectedTime:(double)a3;
@end

@implementation APSWakeMetricTracker

- (APSWakeMetricTracker)init
{
  return -[APSWakeMetricTracker initWithOnConnectedInterval:onDisconnectedInterval:metricSubmissionBlock:]( self,  "initWithOnConnectedInterval:onDisconnectedInterval:metricSubmissionBlock:",  &stru_10011EC60,  30.0,  300.0);
}

- (APSWakeMetricTracker)initWithOnConnectedInterval:(double)a3 onDisconnectedInterval:(double)a4 metricSubmissionBlock:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, self, @"APSWakeMetricTracker.m", 59, @"Invalid parameter not satisfying: %@", @"metricSubmissionBlock" object file lineNumber description];
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___APSWakeMetricTracker;
  v10 = -[APSWakeMetricTracker init](&v16, "init");
  v11 = v10;
  if (v10)
  {
    v10->_onConnectedInterval = a3;
    v10->_onDisconnectedInterval = a4;
    id v12 = objc_retainBlock(v9);
    id metricSubmissionBlock = v11->_metricSubmissionBlock;
    v11->_id metricSubmissionBlock = v12;
  }

  return v11;
}

- (void)noteSystemDidFullWakeWhileConnected:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_state) {
    -[APSWakeMetricTracker _clearState](self, "_clearState");
  }
  self->_state = 1LL;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  self->_startTime = v5;
  self->_lastSignificantTime = v5;
  if (v3)
  {
    double v6 = v5;
    double onConnectedInterval = self->_onConnectedInterval;
    *(_WORD *)&self->_startedConnected = 257;
  }

  else
  {
    double onConnectedInterval = self->_onDisconnectedInterval;
    double v6 = 1.79769313e308;
  }

  self->_connectedTime = v6;
  v8 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_timerFired:",  0LL,  0LL,  onConnectedInterval));
  metricSubmitTimer = self->_metricSubmitTimer;
  self->_metricSubmitTimer = v8;
}

- (void)noteDidConnect
{
  if (self->_state == 1)
  {
    if (self->_didConnect)
    {
      if (self->_startedConnected && self->_tentativeConnectedTime < 2.22044605e-16 && !self->_hasReceivedStoredMessage)
      {
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        self->_tentativeConnectedTime = v3;
      }
    }

    else
    {
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      self->_connectedTime = v4;
      self->_didConnect = 1;
    }
  }

- (void)noteReceivedStoredMessage
{
  if (self->_state == 1)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_lastSignificantTime = v3;
    double tentativeConnectedTime = self->_tentativeConnectedTime;
    if (tentativeConnectedTime > 2.22044605e-16) {
      self->_connectedTime = tentativeConnectedTime;
    }
    self->_double tentativeConnectedTime = 0.0;
    self->_hasReceivedStoredMessage = 1;
  }

- (void)noteSystemWillSleep
{
}

- (void)noteReceivedLiveMessage
{
}

- (void)_timerFired:(id)a3
{
  metricSubmitTimer = self->_metricSubmitTimer;
  self->_metricSubmitTimer = 0LL;

  -[APSWakeMetricTracker _fireMetricIfNeeded](self, "_fireMetricIfNeeded");
}

- (void)_fireMetricIfNeeded
{
  if (self->_state == 1)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(-[APSWakeMetricTracker metricSubmissionBlock](self, "metricSubmissionBlock"));
    double v4 = (void (**)(void, void, void, void, void, void))v3;
    BOOL startedConnected = self->_startedConnected;
    if (self->_didConnect)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_connectedTime - self->_startTime));
      if (self->_didConnect)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_lastSignificantTime - self->_startTime));
        ((void (**)(void, void, BOOL, uint64_t, void *, void *))v4)[2]( v4,  0LL,  startedConnected,  1LL,  v6,  v7);
      }

      else
      {
        ((void (**)(void, void, BOOL, uint64_t, void *, void))v4)[2]( v4,  0LL,  startedConnected,  1LL,  v6,  0LL);
      }
    }

    else
    {
      (*(void (**)(uint64_t, void, BOOL, void, void, void))(v3 + 16))( v3,  0LL,  startedConnected,  0LL,  0LL,  0LL);
    }

    -[APSWakeMetricTracker _clearState](self, "_clearState");
  }

- (void)_clearState
{
  metricSubmitTimer = self->_metricSubmitTimer;
  self->_metricSubmitTimer = 0LL;

  self->_lastSignificantTime = 0.0;
  *(_WORD *)&self->_BOOL startedConnected = 0;
  self->_startTime = 0.0;
  self->_connectedTime = 0.0;
  self->_state = 0LL;
}

- (double)onConnectedInterval
{
  return self->_onConnectedInterval;
}

- (void)setOnConnectedInterval:(double)a3
{
  self->_double onConnectedInterval = a3;
}

- (double)onDisconnectedInterval
{
  return self->_onDisconnectedInterval;
}

- (void)setOnDisconnectedInterval:(double)a3
{
  self->_onDisconnectedInterval = a3;
}

- (id)metricSubmissionBlock
{
  return self->_metricSubmissionBlock;
}

- (void)setMetricSubmissionBlock:(id)a3
{
}

- (NSTimer)metricSubmitTimer
{
  return self->_metricSubmitTimer;
}

- (void)setMetricSubmitTimer:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)connectedTime
{
  return self->_connectedTime;
}

- (void)setConnectedTime:(double)a3
{
  self->_connectedTime = a3;
}

- (double)tentativeConnectedTime
{
  return self->_tentativeConnectedTime;
}

- (void)setTentativeConnectedTime:(double)a3
{
  self->_double tentativeConnectedTime = a3;
}

- (BOOL)startedConnected
{
  return self->_startedConnected;
}

- (void)setStartedConnected:(BOOL)a3
{
  self->_BOOL startedConnected = a3;
}

- (BOOL)didConnect
{
  return self->_didConnect;
}

- (void)setDidConnect:(BOOL)a3
{
  self->_didConnect = a3;
}

- (double)lastSignificantTime
{
  return self->_lastSignificantTime;
}

- (void)setLastSignificantTime:(double)a3
{
  self->_lastSignificantTime = a3;
}

- (BOOL)hasReceivedStoredMessage
{
  return self->_hasReceivedStoredMessage;
}

- (void)setHasReceivedStoredMessage:(BOOL)a3
{
  self->_hasReceivedStoredMessage = a3;
}

- (void).cxx_destruct
{
}

@end