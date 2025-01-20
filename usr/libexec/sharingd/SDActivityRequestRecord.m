@interface SDActivityRequestRecord
- (NSDate)requestCreatedDate;
- (NSError)error;
- (NSString)deviceIdentifier;
- (NSTimer)timeoutTimer;
- (NSUUID)requestIdentifier;
- (SDActivityRequestRecord)init;
- (id)completionHandler;
- (id)description;
- (int64_t)timeoutTimeInterval;
- (void)setCompletionHandler:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestCreatedDate:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setTimeoutTimeInterval:(int64_t)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation SDActivityRequestRecord

- (SDActivityRequestRecord)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDActivityRequestRecord;
  v2 = -[SDActivityRequestRecord init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSDate);
    requestCreatedDate = v2->_requestCreatedDate;
    v2->_requestCreatedDate = v3;
  }

  return v2;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord requestIdentifier](self, "requestIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord deviceIdentifier](self, "deviceIdentifier"));
  requestCreatedDate = self->_requestCreatedDate;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord completionHandler](self, "completionHandler"));
  if (v7) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord timeoutTimer](self, "timeoutTimer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord error](self, "error"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"message/requestIdentifier:%@, deviceIdentifier:%@, requestCreated:%@, hasCompletionHandler:%@, _timeoutTimer:%@, error:%@",  v4,  v5,  requestCreatedDate,  v8,  v9,  v10));

  return v11;
}

- (NSDate)requestCreatedDate
{
  return self->_requestCreatedDate;
}

- (void)setRequestCreatedDate:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (int64_t)timeoutTimeInterval
{
  return self->_timeoutTimeInterval;
}

- (void)setTimeoutTimeInterval:(int64_t)a3
{
  self->_timeoutTimeInterval = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end