@interface IDSServerStorageMetricCollector
- (BOOL)wasPrimary;
- (IDSServerStorageMetricCollector)initWithTopic:(id)a3 isPrimary:(BOOL)a4;
- (NSString)topic;
- (double)endTime;
- (double)startTime;
- (id)awdLogger;
- (id)dictionaryMetric;
- (int64_t)linkType;
- (int64_t)messageCount;
- (void)endCollector;
- (void)incrementMessageCount;
- (void)reportMetric;
- (void)setEndTime:(double)a3;
- (void)setLinkType:(int64_t)a3;
- (void)setMessageCount:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setTopic:(id)a3;
- (void)setWasPrimary:(BOOL)a3;
@end

@implementation IDSServerStorageMetricCollector

- (IDSServerStorageMetricCollector)initWithTopic:(id)a3 isPrimary:(BOOL)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSServerStorageMetricCollector;
  v6 = -[IDSServerStorageMetricCollector init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    -[IDSServerStorageMetricCollector setTopic:](v6, "setTopic:", v5);
    -[IDSServerStorageMetricCollector setWasPrimary:](v7, "setWasPrimary:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v8 timeIntervalSinceReferenceDate];
    -[IDSServerStorageMetricCollector setStartTime:](v7, "setStartTime:");
  }

  return v7;
}

- (id)awdLogger
{
  return +[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance");
}

- (void)incrementMessageCount
{
}

- (void)endCollector
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v3 timeIntervalSinceReferenceDate];
  -[IDSServerStorageMetricCollector setEndTime:](self, "setEndTime:");
}

- (void)reportMetric
{
  double v4 = v3;
  -[IDSServerStorageMetricCollector startTime](self, "startTime");
  double v6 = v4 - v5;
  id v7 = objc_alloc(&OBJC_CLASS___IDSServerStorageStateMachineCompletedMetric);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageMetricCollector topic](self, "topic"));
  id v12 = objc_msgSend( v7,  "initWithService:linkType:wasPrimary:timeTaken:numberProcessed:",  v8,  -[IDSServerStorageMetricCollector linkType](self, "linkType"),  -[IDSServerStorageMetricCollector wasPrimary](self, "wasPrimary"),  -[IDSServerStorageMetricCollector messageCount](self, "messageCount"),  v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v9 logMetric:v12];

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageMetricCollector awdLogger](self, "awdLogger"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageMetricCollector topic](self, "topic"));
  objc_msgSend( v10,  "noteServerStorageStateMachineEndedFor:linkType:wasPrimary:timeTaken:numberProcessed:",  v11,  -[IDSServerStorageMetricCollector linkType](self, "linkType"),  -[IDSServerStorageMetricCollector wasPrimary](self, "wasPrimary"),  -[IDSServerStorageMetricCollector messageCount](self, "messageCount"),  v6);
}

- (id)dictionaryMetric
{
  double v4 = v3;
  -[IDSServerStorageMetricCollector startTime](self, "startTime");
  double v6 = v5;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSServerStorageMetricCollector topic](self, "topic"));
  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v7, @"Topic", v8);
  }
  double v9 = v4 - v6;

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[IDSServerStorageMetricCollector linkType](self, "linkType")));
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)v7, @"linkType", v10);
  }

  if (-[IDSServerStorageMetricCollector wasPrimary](self, "wasPrimary")) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v7, @"wasPrimary", v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)v7, @"timeTaken", v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[IDSServerStorageMetricCollector messageCount](self, "messageCount")));
  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v7, @"totalProcessed", v13);
  }

  return v7;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (BOOL)wasPrimary
{
  return self->_wasPrimary;
}

- (void)setWasPrimary:(BOOL)a3
{
  self->_wasPrimary = a3;
}

- (int64_t)messageCount
{
  return self->_messageCount;
}

- (void)setMessageCount:(int64_t)a3
{
  self->_messageCount = a3;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (void).cxx_destruct
{
}

@end