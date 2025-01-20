@interface CLVisitMonitoringSubscriptionAdapter
- (BOOL)valid;
- (CLVisitMonitoringSubscriptionAdapter)initWithSubscription:(void *)a3;
- (void)invalidate;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLVisitMonitoringSubscriptionAdapter

- (CLVisitMonitoringSubscriptionAdapter)initWithSubscription:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLVisitMonitoringSubscriptionAdapter;
  v4 = -[CLVisitMonitoringSubscriptionAdapter init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_subscription = a3;
    -[CLVisitMonitoringSubscriptionAdapter setValid:](v4, "setValid:", 1LL);
  }

  return v5;
}

- (void)onVisit:(id)a3
{
  if (a3)
  {
    sub_100FC928C((uint64_t)self->_subscription, a3);
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101892D38);
    }
    v3 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#slv Attempting to notify nil visit}",  (uint8_t *)&v5,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101892D38);
      }
    }

    v4 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#slv Attempting to notify nil visit",  "{msg%{public}.0s:#slv Attempting to notify nil visit}",  (uint8_t *)&v5,  0x12u);
    }
  }

- (void)invalidate
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end