@interface CLMiLoConnectionSubscriptionAdapter
- (BOOL)valid;
- (CLMiLoConnectionSubscriptionAdapter)initWithMiLoConnectionSubscription:(void *)a3;
- (void)onMiLoConnectionStatusEventUpdate:(id)a3;
- (void)onMiLoDebugResponse:(id)a3;
- (void)onMiLoGenericEvent:(id)a3;
- (void)onMiLoObservationMetaInfo:(id)a3;
- (void)onMiLoPredictionEventUpdate:(id)a3;
- (void)onMiLoServiceEventUpdate:(id)a3;
- (void)setSubscription:(void *)a3;
- (void)setValid:(BOOL)a3;
- (void)subscription;
@end

@implementation CLMiLoConnectionSubscriptionAdapter

- (CLMiLoConnectionSubscriptionAdapter)initWithMiLoConnectionSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLMiLoConnectionSubscriptionAdapter;
  result = -[CLMiLoConnectionSubscriptionAdapter init](&v5, "init");
  if (result) {
    result->_subscription = a3;
  }
  return result;
}

- (void)onMiLoServiceEventUpdate:(id)a3
{
  v4 = sub_100386ACC(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101834BC0);
    }
    v6 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v5[1];
      v8[0] = 68289282;
      v8[1] = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 1026;
      int v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:onMiloServiceEventUpdate, miloServiceEventType data:%{public}d}",  (uint8_t *)v8,  0x18u);
    }

    sub_100386B18((uint64_t)self->_subscription, v5);
  }

- (void)onMiLoPredictionEventUpdate:(id)a3
{
  v4 = sub_100387424(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101834BC0);
    }
    v6 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:onMiloPredictionEventUpdate}",  (uint8_t *)v7,  0x12u);
    }

    sub_100387470((uint64_t)self->_subscription, v5);
  }

- (void)onMiLoDebugResponse:(id)a3
{
  v4 = (uint64_t *)sub_1003875E8(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101834BC0);
    }
    v6 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:onMiLoDebugResponse}",  (uint8_t *)v7,  0x12u);
    }

    sub_100387634((uint64_t)self->_subscription, v5);
  }

- (void)onMiLoConnectionStatusEventUpdate:(id)a3
{
  v4 = sub_100387870(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101834BC0);
    }
    v6 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:onMiLoConnectionStatusEventUpdate}",  (uint8_t *)v7,  0x12u);
    }

    sub_1003878E8((uint64_t)self->_subscription, v5);
  }

- (void)onMiLoObservationMetaInfo:(id)a3
{
  v4 = (uint64_t *)sub_100387A7C(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101834BC0);
    }
    v6 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *v5;
      v8[0] = 68289282;
      v8[1] = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 1026;
      int v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:onMiLoRecordingMetaInfo, event type:%{public}d}",  (uint8_t *)v8,  0x18u);
    }

    sub_100387AC8((uint64_t)self->_subscription, (uint64_t)v5);
  }

- (void)onMiLoGenericEvent:(id)a3
{
  v4 = (uint64_t *)sub_100387D8C(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_101834BC0);
    }
    v6 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:onMiLoGenericEventResponse}",  (uint8_t *)v7,  0x12u);
    }

    sub_100387DD8((uint64_t)self->_subscription, v5);
  }

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(void *)a3
{
  self->_subscription = a3;
}

@end