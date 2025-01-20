@interface CLScheduledEventTracker
- (BOOL)didUpdateFireTime;
- (BOOL)getAndClearUpdateNextFireTimeHasFired;
- (CLDispatchSilo)silo;
- (CLTimer)timer;
- (double)nextFireDelay;
- (id)initOnSilo:(id)a3 hour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6 block:(id)a7;
- (int64_t)hour;
- (int64_t)minute;
- (int64_t)second;
- (void)dealloc;
- (void)handleSysTimeChanged;
- (void)invalidate;
- (void)setDidUpdateFireTime:(BOOL)a3;
- (void)setSilo:(id)a3;
- (void)setTimer:(id)a3;
- (void)updateDesiredFireTimeToHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5;
- (void)updateNextFireTime;
@end

@implementation CLScheduledEventTracker

- (id)initOnSilo:(id)a3 hour:(int64_t)a4 minute:(int64_t)a5 second:(int64_t)a6 block:(id)a7
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CLScheduledEventTracker;
  v12 = -[CLScheduledEventTracker init](&v16, "init");
  if (v12)
  {
    v12->_silo = (CLDispatchSilo *)a3;
    v13 = (CLTimer *)[a3 newTimer];
    v12->_timer = v13;
    -[CLTimer setHandler:](v13, "setHandler:", a7);
    -[CLScheduledEventTracker updateDesiredFireTimeToHour:minute:second:]( v12,  "updateDesiredFireTimeToHour:minute:second:",  a4,  a5,  a6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v12,  (CFNotificationCallback)sub_100A69D38,  @"SignificantTimeChangeNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v12;
}

- (void)invalidate
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLScheduledEventTracker;
  -[CLScheduledEventTracker dealloc](&v3, "dealloc");
}

- (BOOL)getAndClearUpdateNextFireTimeHasFired
{
  BOOL v3 = -[CLScheduledEventTracker didUpdateFireTime](self, "didUpdateFireTime");
  -[CLScheduledEventTracker setDidUpdateFireTime:](self, "setDidUpdateFireTime:", 0LL);
  return v3;
}

- (void)handleSysTimeChanged
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_10186A628);
  }
  BOOL v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:system time changed!}",  (uint8_t *)v4,  0x12u);
  }

  -[CLScheduledEventTracker updateNextFireTime](self, "updateNextFireTime");
}

- (void)updateDesiredFireTimeToHour:(int64_t)a3 minute:(int64_t)a4 second:(int64_t)a5
{
  self->_hour = a3;
  self->_minute = a4;
  self->_second = a5;
  -[CLScheduledEventTracker updateNextFireTime](self, "updateNextFireTime");
}

- (void)updateNextFireTime
{
  BOOL v3 = +[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar");
  -[CLDispatchSilo currentLatchedAbsoluteTimestamp]( -[CLScheduledEventTracker silo](self, "silo"),  "currentLatchedAbsoluteTimestamp");
  v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:");
  id v5 = -[NSDateComponents copy](-[NSCalendar components:fromDate:](v3, "components:fromDate:", 252LL, v4), "copy");
  objc_msgSend(v5, "setHour:", -[CLScheduledEventTracker hour](self, "hour"));
  objc_msgSend(v5, "setMinute:", -[CLScheduledEventTracker minute](self, "minute"));
  objc_msgSend(v5, "setSecond:", -[CLScheduledEventTracker second](self, "second"));
  v6 = -[NSCalendar dateFromComponents:](v3, "dateFromComponents:", v5);
  -[NSDate timeIntervalSinceReferenceDate](v4, "timeIntervalSinceReferenceDate");
  double v8 = v7;
  -[NSDate timeIntervalSinceReferenceDate](v6, "timeIntervalSinceReferenceDate");
  if (v8 > v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setDay:](v10, "setDay:", 1LL);
    v6 = -[NSCalendar dateByAddingComponents:toDate:options:]( v3,  "dateByAddingComponents:toDate:options:",  v10,  v6,  0LL);
  }

  -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:", v4);
  self->_nextFireDelay = v11;
  v12 = -[CLScheduledEventTracker timer](self, "timer");
  -[CLScheduledEventTracker nextFireDelay](self, "nextFireDelay");
  -[CLTimer setNextFireDelay:interval:](v12, "setNextFireDelay:interval:");
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_10186A628);
  }
  v13 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
  {
    -[CLScheduledEventTracker nextFireDelay](self, "nextFireDelay");
    v15[0] = 68289282;
    v15[1] = 0;
    __int16 v16 = 2082;
    v17 = "";
    __int16 v18 = 2050;
    uint64_t v19 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:updated scheduled event timer, nextFireDelay:%{public}f}",  (uint8_t *)v15,  0x1Cu);
  }

  -[CLScheduledEventTracker setDidUpdateFireTime:](self, "setDidUpdateFireTime:", 1LL);
}

- (int64_t)hour
{
  return self->_hour;
}

- (int64_t)minute
{
  return self->_minute;
}

- (int64_t)second
{
  return self->_second;
}

- (double)nextFireDelay
{
  return self->_nextFireDelay;
}

- (CLTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (CLDispatchSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
}

- (BOOL)didUpdateFireTime
{
  return self->_didUpdateFireTime;
}

- (void)setDidUpdateFireTime:(BOOL)a3
{
  self->_didUpdateFireTime = a3;
}

@end