@interface AmbientLightSensorDataController
- (BrightnessSystemClient)brightnessSystemClient;
- (DAHIDEventMonitor)eventMonitor;
- (DKBrightnessResponder)brightnessResponder;
- (id)brightnessFactor;
- (int)ALSDataCount;
- (void)finish;
- (void)handleHIDEvent:(__IOHIDEvent *)a3;
- (void)setALSDataCount:(int)a3;
- (void)setBrightnessFactor:(id)a3;
- (void)setBrightnessResponder:(id)a3;
- (void)setBrightnessSystemClient:(id)a3;
- (void)setEventMonitor:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation AmbientLightSensorDataController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v5 = a4;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessResponder](self, "brightnessResponder"));

  uint64_t v4 = DiagnosticLogHandleForCategory(3LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Using DKBrightnessResponder to increase brightness for ALS",  buf,  2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessResponder](self, "brightnessResponder"));
    LODWORD(v8) = 1.0;
    [v7 setScreenToBrightness:1 animate:v8];
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "No DKBrightnessResponder. Falling back to CoreBrightness",  buf,  2u);
    }

    v9 = objc_alloc_init(&OBJC_CLASS___BrightnessSystemClient);
    -[AmbientLightSensorDataController setBrightnessSystemClient:](self, "setBrightnessSystemClient:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessSystemClient](self, "brightnessSystemClient"));
    id v11 = [v10 copyPropertyForKey:@"DisplayBrightnessFactor"];
    -[AmbientLightSensorDataController setBrightnessFactor:](self, "setBrightnessFactor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessSystemClient](self, "brightnessSystemClient"));
    [v12 setProperty:&off_100008570 forKey:@"DisplayBrightnessFactor"];

    uint64_t v13 = DiagnosticLogHandleForCategory(3LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessFactor](self, "brightnessFactor"));
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Brightness factor is %@", buf, 0xCu);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[DAHIDEventMonitor sharedInstance](&OBJC_CLASS___DAHIDEventMonitor, "sharedInstance"));
  -[AmbientLightSensorDataController setEventMonitor:](self, "setEventMonitor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));
  [v16 setDelegate:self];

  if ((-[AmbientLightSensorDataController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", &off_100008510));
    unsigned int v19 = [v17 startMonitoringWithHIDEvents:v18];

    if (v19
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor")),
          unsigned int v21 = objc_msgSend( v20,  "serviceClientSetPropertyValue:forKey:forHIDEvent:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 100000),  @"ReportInterval",  6),  v20,  v21))
    {
      dispatch_time_t v22 = dispatch_time(0LL, 2000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100006004;
      block[3] = &unk_1000082A8;
      block[4] = self;
      dispatch_after(v22, &_dispatch_main_q, block);
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController result](self, "result"));
      [v23 setStatusCode:&off_100008528];

      -[AmbientLightSensorDataController setFinished:](self, "setFinished:", 1LL);
    }
  }

- (void)handleHIDEvent:(__IOHIDEvent *)a3
{
  if ((-[AmbientLightSensorDataController isCancelled](self, "isCancelled") & 1) == 0
    && IOHIDEventGetType(a3) == 12)
  {
    IOHIDEventGetFloatValue(a3, 786432LL);
    IOHIDEventGetFloatValue(a3, 786433LL);
    IOHIDEventGetFloatValue(a3, 786434LL);
    IOHIDEventGetFloatValue(a3, 786435LL);
    -[AmbientLightSensorDataController setALSDataCount:]( self,  "setALSDataCount:",  -[AmbientLightSensorDataController ALSDataCount]( self,  "ALSDataCount",  IOHIDEventGetFloatValue(a3, 786436LL))
    + 1);
  }

- (void)finish
{
  if ((-[AmbientLightSensorDataController isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[AmbientLightSensorDataController teardown](self, "teardown");
    int v3 = -[AmbientLightSensorDataController ALSDataCount](self, "ALSDataCount");
    uint64_t v4 = DiagnosticLogHandleForCategory(3LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = v5;
    if (v3 < 1)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000065D4(v6);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController result](self, "result"));
      double v8 = v7;
      v9 = &off_100008558;
    }

    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = -[AmbientLightSensorDataController ALSDataCount](self, "ALSDataCount");
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Ambient Light Sensor found. (%d)",  (uint8_t *)v10,  8u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController result](self, "result"));
      double v8 = v7;
      v9 = &off_100008540;
    }

    [v7 setStatusCode:v9];
  }

  -[AmbientLightSensorDataController setFinished:](self, "setFinished:", 1LL);
}

- (void)teardown
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));
    unsigned int v5 = [v4 currentlyMonitoring];

    if (v5)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController eventMonitor](self, "eventMonitor"));
      [v6 stopMonitoring];
    }

    -[AmbientLightSensorDataController setEventMonitor:](self, "setEventMonitor:", 0LL);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessResponder](self, "brightnessResponder"));
  if (v7)
  {
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessSystemClient](self, "brightnessSystemClient"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessFactor](self, "brightnessFactor"));

      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessSystemClient](self, "brightnessSystemClient"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[AmbientLightSensorDataController brightnessFactor](self, "brightnessFactor"));
        [v11 setProperty:v12 forKey:@"DisplayBrightnessFactor"];

        -[AmbientLightSensorDataController setBrightnessSystemClient:](self, "setBrightnessSystemClient:", 0LL);
        -[AmbientLightSensorDataController setBrightnessFactor:](self, "setBrightnessFactor:", 0LL);
      }
    }
  }

- (DAHIDEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (void)setEventMonitor:(id)a3
{
}

- (int)ALSDataCount
{
  return self->_ALSDataCount;
}

- (void)setALSDataCount:(int)a3
{
  self->_ALSDataCount = a3;
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return self->_brightnessSystemClient;
}

- (void)setBrightnessSystemClient:(id)a3
{
}

- (id)brightnessFactor
{
  return self->_brightnessFactor;
}

- (void)setBrightnessFactor:(id)a3
{
}

- (DKBrightnessResponder)brightnessResponder
{
  return self->_brightnessResponder;
}

- (void)setBrightnessResponder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end