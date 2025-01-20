@interface WiFiUsageUserSession
- (WiFiUsageUserSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)displayStateDidChange:(BOOL)a3;
- (void)lockStateDidChange:(BOOL)a3;
@end

@implementation WiFiUsageUserSession

- (WiFiUsageUserSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageUserSession;
  return -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]( &v5,  sel_initWithSessionType_andInterfaceName_andCapabilities_,  2LL,  a3,  a4);
}

- (void)lockStateDidChange:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageUserSession;
  -[WiFiUsageSession lockStateDidChange:](&v5, sel_lockStateDidChange_);
  if (!a3 && self->_userInactive)
  {
    NSLog(@"%s: user session started", "-[WiFiUsageUserSession lockStateDidChange:]");
    -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
    self->_userInactive = 0;
  }

  self->_deviceLocked = a3;
}

- (void)displayStateDidChange:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageUserSession;
  -[WiFiUsageSession displayStateDidChange:](&v5, sel_displayStateDidChange_);
  if (a3)
  {
    if (self->_userInactive && !self->_deviceLocked)
    {
      NSLog(@"%s: user session started", "-[WiFiUsageUserSession displayStateDidChange:]");
      -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
      self->_userInactive = 0;
    }
  }

  else
  {
    NSLog(@"%s: user session ended", "-[WiFiUsageUserSession displayStateDidChange:]");
    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    self->_userInactive = 1;
  }

- (id)metricName
{
  return @"com.apple.wifi.devicesession";
}

@end