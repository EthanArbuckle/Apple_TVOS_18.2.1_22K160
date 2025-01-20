@interface GTMTLReplayActivityRestoreResources
- (GTMTLReplayActivityRestoreResources)initWithRequests:(const GTResourceDownloaderRequest *)a3 count:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (void)outputToLog:(id)a3;
- (void)signpostIntervalBegin:(unint64_t)a3;
@end

@implementation GTMTLReplayActivityRestoreResources

- (GTMTLReplayActivityRestoreResources)initWithRequests:(const GTResourceDownloaderRequest *)a3 count:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityRestoreResources;
  result = -[GTMTLReplayActivity initWithType:](&v7, "initWithType:", @"restoreResources");
  if (result)
  {
    result->_requests = a3;
    result->_requestCount = a4;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityRestoreResources;
  id result = -[GTMTLReplayActivity copyWithZone:](&v5, "copyWithZone:", a3);
  if (result)
  {
    *((void *)result + 5) = self->_requests;
    *((_DWORD *)result + 12) = self->_requestCount;
  }

  return result;
}

- (id)summary
{
  return @"Restoring resources";
}

- (id)jsonObject
{
  v10[0] = self->super._activityType;
  v9[0] = @"activityType";
  v9[1] = @"requests";
  id v3 = ArrayFromDownloadRequests((uint64_t)self->_requests, self->_requestCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v10[1] = v4;
  v9[2] = @"activityStartTime";
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&time_scale * (double)self->super._activityStartTime));
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
    requests = self->_requests;
    int requestCount = self->_requestCount;
    v8 = (os_log_s *)a3;
    id v9 = ArrayFromDownloadRequests((uint64_t)requests, requestCount);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    int v11 = 138543618;
    v12 = activityType;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@:\t%{public}@", (uint8_t *)&v11, 0x16u);
  }

- (void)signpostIntervalBegin:(unint64_t)a3
{
  objc_super v5 = g_signpostLog;
  v6 = (os_log_s *)v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    unsigned int v7 = -[GTMTLReplayActivity messageSerial](self, "messageSerial");
    activityType = self->super._activityType;
    int requestCount = self->_requestCount;
    v10[0] = 67109634;
    v10[1] = v7;
    __int16 v11 = 2112;
    v12 = activityType;
    __int16 v13 = 1024;
    int v14 = requestCount;
    _os_signpost_emit_with_name_impl( &dword_0,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  a3,  "Replayer-3-commandQueue",  "%u. %@ x%d",  (uint8_t *)v10,  0x18u);
  }
}

@end