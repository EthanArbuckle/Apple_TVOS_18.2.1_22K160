@interface ADCompanionServiceRequestTimerInfo
- (AFWatchdogTimer)heartbeatTimer;
- (AFWatchdogTimer)requestTimer;
- (RPCompanionLinkDevice)destination;
- (double)startTime;
- (void)setDestination:(id)a3;
- (void)setHeartbeatTimer:(id)a3;
- (void)setRequestTimer:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation ADCompanionServiceRequestTimerInfo

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (AFWatchdogTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
}

- (AFWatchdogTimer)requestTimer
{
  return self->_requestTimer;
}

- (void)setRequestTimer:(id)a3
{
}

- (RPCompanionLinkDevice)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (void).cxx_destruct
{
}

@end