@interface SPMonitoredProcess
- (SPMonitoredProcess)initWithPid:(int)a3;
- (double)reportTimeThreshold;
- (void)setReportTimeThreshold:(double)a3;
@end

@implementation SPMonitoredProcess

- (SPMonitoredProcess)initWithPid:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SPMonitoredProcess;
  v4 = -[SPProcessEvent init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->super._targetProcessId = a3;
    v4->super._isLiveSampling = 1;
    -[SPProcessEvent setIncidentUUID:](v4, "setIncidentUUID:", +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  }

  return v5;
}

- (double)reportTimeThreshold
{
  return self->_reportTimeThreshold;
}

- (void)setReportTimeThreshold:(double)a3
{
  self->_reportTimeThreshold = a3;
}

@end