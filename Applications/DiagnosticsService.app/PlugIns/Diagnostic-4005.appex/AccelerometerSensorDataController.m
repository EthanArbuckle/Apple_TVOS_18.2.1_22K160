@interface AccelerometerSensorDataController
- (DAHIDEventMonitor)eventMonitor;
- (int)accelerometerDataCount;
- (void)finish;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)setAccelerometerDataCount:(int)a3;
- (void)setEventMonitor:(id)a3;
- (void)start;
- (void)teardown;
@end

@implementation AccelerometerSensorDataController

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](&OBJC_CLASS___DAHIDEventMonitor, "sharedInstance"));
  -[AccelerometerSensorDataController setEventMonitor:](self, "setEventMonitor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccelerometerSensorDataController eventMonitor](self, "eventMonitor"));
  [v4 setDelegate:self];

  if ((-[AccelerometerSensorDataController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccelerometerSensorDataController eventMonitor](self, "eventMonitor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", &off_1000044D0));
    unsigned int v7 = [v5 startMonitoringWithHIDEvents:v6];

    if (v7
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccelerometerSensorDataController eventMonitor](self, "eventMonitor")),
          unsigned int v9 = objc_msgSend( v8,  "serviceClientSetPropertyValue:forKey:forHIDEvent:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10000),  @"ReportInterval",  0),  v8,  v9))
    {
      dispatch_time_t v10 = dispatch_time(0LL, 2000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000025F0;
      block[3] = &unk_100004298;
      block[4] = self;
      dispatch_after(v10, &_dispatch_main_q, block);
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccelerometerSensorDataController result](self, "result"));
      [v11 setStatusCode:&off_1000044E8];

      -[AccelerometerSensorDataController setFinished:](self, "setFinished:", 1LL);
    }
  }

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if ((-[AccelerometerSensorDataController isCancelled](self, "isCancelled") & 1) == 0
    && IOHIDEventGetType(a3) == 13)
  {
    IOHIDEventGetFloatValue(a3, 851968LL);
    IOHIDEventGetFloatValue(a3, 851969LL);
    -[AccelerometerSensorDataController setAccelerometerDataCount:]( self,  "setAccelerometerDataCount:",  -[AccelerometerSensorDataController accelerometerDataCount]( self,  "accelerometerDataCount",  IOHIDEventGetFloatValue(a3, 851970LL))
    + 1);
  }

- (void)finish
{
  if ((-[AccelerometerSensorDataController isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[AccelerometerSensorDataController teardown](self, "teardown");
    int v3 = -[AccelerometerSensorDataController accelerometerDataCount](self, "accelerometerDataCount");
    uint64_t v4 = DiagnosticLogHandleForCategory(3LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if (v3 < 1)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100002A20(v6);
      }

      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccelerometerSensorDataController result](self, "result"));
      v8 = v7;
      unsigned int v9 = &off_100004518;
    }

    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = -[AccelerometerSensorDataController accelerometerDataCount](self, "accelerometerDataCount");
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Accelerometer found. (%d)",  (uint8_t *)v10,  8u);
      }

      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccelerometerSensorDataController result](self, "result"));
      v8 = v7;
      unsigned int v9 = &off_100004500;
    }

    [v7 setStatusCode:v9];
  }

  -[AccelerometerSensorDataController setFinished:](self, "setFinished:", 1LL);
}

- (void)teardown
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccelerometerSensorDataController eventMonitor](self, "eventMonitor"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccelerometerSensorDataController eventMonitor](self, "eventMonitor"));
    unsigned int v5 = [v4 currentlyMonitoring];

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccelerometerSensorDataController eventMonitor](self, "eventMonitor"));
      [v6 stopMonitoring];
    }

    -[AccelerometerSensorDataController setEventMonitor:](self, "setEventMonitor:", 0LL);
  }

- (DAHIDEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
}

- (int)accelerometerDataCount
{
  return self->_accelerometerDataCount;
}

- (void)setAccelerometerDataCount:(int)a3
{
  self->_accelerometerDataCount = a3;
}

- (void).cxx_destruct
{
}

@end