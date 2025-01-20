@interface GTMTLReplayActivityPerformFrameTiming
- (GTMTLReplayActivityPerformFrameTiming)initWithIndex:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (unsigned)messageSerial;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityPerformFrameTiming

- (GTMTLReplayActivityPerformFrameTiming)initWithIndex:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityPerformFrameTiming;
  result = -[GTMTLReplayActivity initWithType:](&v5, "initWithType:", @"performFrameTiming");
  if (result) {
    result->_index = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityPerformFrameTiming;
  id result = -[GTMTLReplayActivity copyWithZone:](&v5, "copyWithZone:", a3);
  if (result) {
    *((_DWORD *)result + 10) = self->_index;
  }
  return result;
}

- (unsigned)messageSerial
{
  return self->_index;
}

- (id)summary
{
  return @"Performing frame timing";
}

- (id)jsonObject
{
  v9[0] = self->super._activityType;
  v8[0] = @"activityType";
  v8[1] = @"index";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_index));
  v9[1] = v3;
  v8[2] = @"activityStartTime";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&time_scale * (double)self->super._activityStartTime));
  v9[2] = v4;
  v8[3] = @"activityEndTime";
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&time_scale * (double)self->super._activityEndTime));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));

  return v6;
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    int index = self->_index;
    int v7 = 138543618;
    v8 = activityType;
    __int16 v9 = 1024;
    int v10 = index;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%d", (uint8_t *)&v7, 0x12u);
  }

@end