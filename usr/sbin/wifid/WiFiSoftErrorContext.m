@interface WiFiSoftErrorContext
- (WiFiSoftErrorContext)initWithErrorType:(int)a3 deviceContext:(void *)a4;
- (double)detectionTime;
- (id)fetchSoftErrorContextData;
- (int)errorState;
- (void)addStatsRecord:(id)a3;
- (void)setDetectionTime:(double)a3;
- (void)setErrorState:(int)a3;
@end

@implementation WiFiSoftErrorContext

- (WiFiSoftErrorContext)initWithErrorType:(int)a3 deviceContext:(void *)a4
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___WiFiSoftErrorContext;
  v6 = -[WiFiSoftErrorContext init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    v6->_errorType = a3;
    v6->_errorState = 0;
    uint64_t v8 = 3LL;
    if (a3 == 1) {
      uint64_t v8 = 2LL;
    }
    (&v6->super.isa)[v8] = (Class)a4;
    v6->_triggerTime = CFAbsoluteTimeGetCurrent();
    v7->_detectionTime = 0.0;
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    errorContextData = v7->_errorContextData;
    v7->_errorContextData = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    statsRecordData = v7->_statsRecordData;
    v7->_statsRecordData = v11;
  }

  else
  {
    v14 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: super-init failed!",  "-[WiFiSoftErrorContext initWithErrorType:deviceContext:]");
    }
    objc_autoreleasePoolPop(v14);
  }

  return v7;
}

- (void)addStatsRecord:(id)a3
{
  statsRecordData = self->_statsRecordData;
  if (statsRecordData) {
    -[NSMutableArray addObject:](statsRecordData, "addObject:", a3);
  }
}

- (id)fetchSoftErrorContextData
{
  errorContextData = self->_errorContextData;
  if (!errorContextData)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v5 = self->_errorContextData;
    self->_errorContextData = v4;

    errorContextData = self->_errorContextData;
    if (!errorContextData)
    {
      v7 = objc_autoreleasePoolPush();
      if (qword_100219F60)
      {
        context = v7;
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Couldn't allocate contextData",  "-[WiFiSoftErrorContext fetchSoftErrorContextData]");
        v7 = context;
      }

      objc_autoreleasePoolPop(v7);
      errorContextData = self->_errorContextData;
    }
  }

  return errorContextData;
}

- (int)errorState
{
  return self->_errorState;
}

- (void)setErrorState:(int)a3
{
  self->_errorState = a3;
}

- (double)detectionTime
{
  return self->_detectionTime;
}

- (void)setDetectionTime:(double)a3
{
  self->_detectionTime = a3;
}

- (void).cxx_destruct
{
}

@end