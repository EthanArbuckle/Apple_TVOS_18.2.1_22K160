@interface ADAnalyticsDeliveryBatch
- (ADAnalyticsDeliveryBatch)initWithDeliveryStream:(unint64_t)a3;
- (BOOL)hasFailureType;
- (BOOL)scheduledActivity;
- (NSString)serverEnvironment;
- (NSUUID)batchIdentifier;
- (id)analyticsDictionary;
- (unint64_t)deliveryStream;
- (unint64_t)outstandingCount;
- (unint64_t)payloadSize;
- (unint64_t)processedCount;
- (void)markEndTime;
- (void)markFailedWithType:(unint64_t)a3;
- (void)markStartTime;
- (void)markSucceeded;
- (void)setOutstandingCount:(unint64_t)a3;
- (void)setPayloadSize:(unint64_t)a3;
- (void)setProcessedCount:(unint64_t)a3;
- (void)setScheduledActivity:(BOOL)a3;
- (void)setServerEnvironment:(id)a3;
@end

@implementation ADAnalyticsDeliveryBatch

- (ADAnalyticsDeliveryBatch)initWithDeliveryStream:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADAnalyticsDeliveryBatch;
  v4 = -[ADAnalyticsDeliveryBatch init](&v8, "init");
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    batchIdentifier = v4->_batchIdentifier;
    v4->_batchIdentifier = (NSUUID *)v5;

    v4->_deliveryStream = a3;
  }

  return v4;
}

- (void)setPayloadSize:(unint64_t)a3
{
  self->_payloadSize = a3;
  self->_hasPayloadSize = 1;
}

- (BOOL)hasFailureType
{
  return self->_failureType != 0;
}

- (void)markStartTime
{
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  startTime = self->_startTime;
  self->_startTime = v3;
}

- (void)markEndTime
{
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  endTime = self->_endTime;
  self->_endTime = v3;
}

- (void)markSucceeded
{
  self->_succeeded = 1;
}

- (void)markFailedWithType:(unint64_t)a3
{
  self->_succeeded = 0;
  self->_failureType = a3;
}

- (id)analyticsDictionary
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = v3;
  serverEnvironment = self->_serverEnvironment;
  if (serverEnvironment) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", serverEnvironment, @"serverEnvironment");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_deliveryStream));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"deliveryStream");

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_processedCount));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"processed");

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_outstandingCount));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, @"outstanding");

  if (self->_scheduledActivity) {
    v9 = @"scheduled";
  }
  else {
    v9 = @"opportunistic";
  }
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"type");
  endTime = self->_endTime;
  if (endTime && self->_startTime)
  {
    -[NSDate timeIntervalSinceDate:](endTime, "timeIntervalSinceDate:");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"elapsed");
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_succeeded));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v12, @"succeeded");

  if (!self->_succeeded && -[ADAnalyticsDeliveryBatch hasFailureType](self, "hasFailureType"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_failureType));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v13, @"error");
  }

  if (self->_hasPayloadSize)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_payloadSize));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, @"payloadSize");
  }

  return v4;
}

- (NSUUID)batchIdentifier
{
  return self->_batchIdentifier;
}

- (unint64_t)deliveryStream
{
  return self->_deliveryStream;
}

- (NSString)serverEnvironment
{
  return self->_serverEnvironment;
}

- (void)setServerEnvironment:(id)a3
{
}

- (unint64_t)processedCount
{
  return self->_processedCount;
}

- (void)setProcessedCount:(unint64_t)a3
{
  self->_processedCount = a3;
}

- (unint64_t)outstandingCount
{
  return self->_outstandingCount;
}

- (void)setOutstandingCount:(unint64_t)a3
{
  self->_outstandingCount = a3;
}

- (BOOL)scheduledActivity
{
  return self->_scheduledActivity;
}

- (void)setScheduledActivity:(BOOL)a3
{
  self->_scheduledActivity = a3;
}

- (unint64_t)payloadSize
{
  return self->_payloadSize;
}

- (void).cxx_destruct
{
}

@end