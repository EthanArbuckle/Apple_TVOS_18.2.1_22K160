@interface GTMTLReplayActivityLoadArchive
- (GTMTLReplayActivityLoadArchive)initWithPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (void)outputToLog:(id)a3;
@end

@implementation GTMTLReplayActivityLoadArchive

- (GTMTLReplayActivityLoadArchive)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityLoadArchive;
  v6 = -[GTMTLReplayActivity initWithType:](&v9, "initWithType:", @"loadArchive");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_path, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityLoadArchive;
  v4 = -[GTMTLReplayActivity copyWithZone:](&v7, "copyWithZone:", a3);
  id v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 5, self->_path);
  }
  return v5;
}

- (id)summary
{
  return @"Loading gputrace";
}

- (id)jsonObject
{
  activityType = self->super._activityType;
  v9[0] = @"activityType";
  v9[1] = @"path";
  path = self->_path;
  v10[0] = activityType;
  v10[1] = path;
  v9[2] = @"activityStartTime";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&time_scale * (double)self->super._activityStartTime));
  v10[2] = v5;
  v9[3] = @"activityEndTime";
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&time_scale * (double)self->super._activityEndTime));
  v10[3] = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));

  return v7;
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    path = self->_path;
    int v7 = 138543618;
    v8 = activityType;
    __int16 v9 = 2114;
    v10 = path;
    _os_log_impl(&dword_0, (os_log_t)a3, OS_LOG_TYPE_INFO, "%{public}@:\t%{public}@", (uint8_t *)&v7, 0x16u);
  }

- (void).cxx_destruct
{
}

@end