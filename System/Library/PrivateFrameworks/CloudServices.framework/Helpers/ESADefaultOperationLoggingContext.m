@interface ESADefaultOperationLoggingContext
- (ESADefaultOperationLoggingContext)init;
- (NSDate)currentTime;
- (NSUUID)currentBootId;
- (double)activityRecordRetentionInterval;
- (double)operationTimeoutInterval;
- (int)currentPID;
- (unint64_t)operationRecordRetentionMaxCount;
- (void)setCurrentBootId:(id)a3;
- (void)setCurrentPID:(int)a3;
- (void)setCurrentTime:(id)a3;
@end

@implementation ESADefaultOperationLoggingContext

- (ESADefaultOperationLoggingContext)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ESADefaultOperationLoggingContext;
  v2 = -[ESADefaultOperationLoggingContext init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    currentTime = v2->_currentTime;
    v2->_currentTime = (NSDate *)v3;

    id v5 = sub_100005304();
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    currentBootId = v2->_currentBootId;
    v2->_currentBootId = (NSUUID *)v6;

    v2->_currentPID = getpid();
    v8 = v2;
  }

  return v2;
}

- (unint64_t)operationRecordRetentionMaxCount
{
  return 500LL;
}

- (double)activityRecordRetentionInterval
{
  return 604800.0;
}

- (double)operationTimeoutInterval
{
  return 600.0;
}

- (NSDate)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
}

- (NSUUID)currentBootId
{
  return self->_currentBootId;
}

- (void)setCurrentBootId:(id)a3
{
}

- (int)currentPID
{
  return self->_currentPID;
}

- (void)setCurrentPID:(int)a3
{
  self->_currentPID = a3;
}

- (void).cxx_destruct
{
}

@end