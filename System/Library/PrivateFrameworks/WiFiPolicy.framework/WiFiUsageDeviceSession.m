@interface WiFiUsageDeviceSession
- (WiFiUsageDeviceSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)displayStateDidChange:(BOOL)a3;
- (void)linkQualityDidChange:(id)a3;
- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4;
@end

@implementation WiFiUsageDeviceSession

- (WiFiUsageDeviceSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageDeviceSession;
  result = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]( &v5,  sel_initWithSessionType_andInterfaceName_andCapabilities_,  1LL,  a3,  a4);
  result->_firstDisplayOn = 1;
  return result;
}

- (void)displayStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiUsageDeviceSession;
  -[WiFiUsageSession displayStateDidChange:](&v9, sel_displayStateDidChange_);
  if (v3)
  {
    if (self->_firstDisplayOn)
    {
      if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
      {
        NSLog(@"%s: device session started", "-[WiFiUsageDeviceSession displayStateDidChange:]");
        -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
      }

      self->_firstDisplayOn = 0;
    }
  }

  else
  {
    [MEMORY[0x189603F50] date];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    if (v8 > 86400.0) {
      -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    }
  }

- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  NSLog( @"%s:%u: isAwake[%u] wokenByWiFi[%u]\n",  a2,  "-[WiFiUsageDeviceSession systemWakeStateDidChange:wokenByWiFi:]",  52LL,  a3,  a4);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___WiFiUsageDeviceSession;
  -[WiFiUsageSession systemWakeStateDidChange:wokenByWiFi:](&v8, sel_systemWakeStateDidChange_wokenByWiFi_, v5, v4);
  if (v5)
  {
    if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
    {
      NSLog(@"%s: device session started", "-[WiFiUsageDeviceSession systemWakeStateDidChange:wokenByWiFi:]");
      -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
    }
  }

  else
  {
    -[WiFiUsageSession systemAwakeDuration](self, "systemAwakeDuration");
    if (v7 > 86400.0) {
      -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    }
  }

- (void)linkQualityDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiUsageDeviceSession;
  -[WiFiUsageSession linkQualityDidChange:](&v9, sel_linkQualityDidChange_, a3);
  [MEMORY[0x189603F50] date];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 > 86400.0)
  {
    -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s - session started on %@ (%fs ago) - ending it and restarting it",  "-[WiFiUsageDeviceSession linkQualityDidChange:]",  v8,  *(void *)&v7);

    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
  }

- (id)metricName
{
  return @"com.apple.wifi.devicesession";
}

@end