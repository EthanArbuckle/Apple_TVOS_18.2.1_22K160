@interface GTMTLReplayActivity
- (GTMTLReplayActivity)initWithType:(id)a3;
- (GTMTLReplayActivity)previousActivity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (unint64_t)endTime;
- (unsigned)messageSerial;
- (void)outputToLog:(id)a3;
- (void)setEndTime:(unint64_t)a3;
- (void)setPreviousActivity:(id)a3;
- (void)signpostIntervalBegin:(unint64_t)a3;
@end

@implementation GTMTLReplayActivity

- (GTMTLReplayActivity)initWithType:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivity;
  v6 = -[GTMTLReplayActivity init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activityType, a3);
    uint64_t v8 = mach_absolute_time();
    v7->_activityStartTime = v8;
    v7->_activityEndTime = v8;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class(self, a2));
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)v5 + 1, self->_activityType);
    v6[2] = self->_activityStartTime;
    v6[3] = self->_activityEndTime;
    id v7 = -[GTMTLReplayActivity copyWithZone:](self->_previousActivity, "copyWithZone:", a3);
    uint64_t v8 = (void *)v6[4];
    v6[4] = v7;
  }

  return v6;
}

- (unsigned)messageSerial
{
  return -[GTMTLReplayActivity messageSerial](self->_previousActivity, "messageSerial");
}

- (id)summary
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Activity: %@",  self->_activityType);
}

- (id)jsonObject
{
  v8[0] = self->_activityType;
  v7[0] = @"activityType";
  v7[1] = @"activityStartTime";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&time_scale * (double)self->_activityStartTime));
  v8[1] = v3;
  v7[2] = @"activityEndTime";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&time_scale * (double)self->_activityEndTime));
  v8[2] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL));

  return v5;
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->_activityType;
    int v6 = 138543362;
    id v7 = activityType;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v6, 0xCu);
  }

- (void)signpostIntervalBegin:(unint64_t)a3
{
  id v5 = g_signpostLog;
  int v6 = (os_log_s *)v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    unsigned int v7 = -[GTMTLReplayActivity messageSerial](self, "messageSerial");
    activityType = self->_activityType;
    v9[0] = 67109378;
    v9[1] = v7;
    __int16 v10 = 2112;
    v11 = activityType;
    _os_signpost_emit_with_name_impl( &dword_0,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  a3,  "Replayer-3-commandQueue",  "%u. %@",  (uint8_t *)v9,  0x12u);
  }
}

- (unint64_t)endTime
{
  return self->_activityEndTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_activityEndTime = a3;
}

- (GTMTLReplayActivity)previousActivity
{
  return self->_previousActivity;
}

- (void)setPreviousActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end