@interface WiFiUsageApplicationSession
- (WiFiUsageApplicationSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4;
@end

@implementation WiFiUsageApplicationSession

- (WiFiUsageApplicationSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WiFiUsageApplicationSession;
  return -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]( &v5,  sel_initWithSessionType_andInterfaceName_andCapabilities_,  5LL,  a3,  a4);
}

- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[WiFiUsageSession activeApplications](self, "activeApplications");
  uint64_t v9 = [v8 count];

  if (!v6 || [v6 isEqualToString:@"com.apple.PineBoard"])
  {
    if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
    {
      NSLog( @"%s: application session ended",  "-[WiFiUsageApplicationSession applicationStateDidChange:withAttributes:]");
      -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    }

    goto LABEL_7;
  }

  if (v9)
  {
    v10 = -[WiFiUsageSession activeApplications](self, "activeApplications");
    NSLog( @"%s: application session resumed:%@",  "-[WiFiUsageApplicationSession applicationStateDidChange:withAttributes:]",  v10);

LABEL_7:
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___WiFiUsageApplicationSession;
    -[WiFiUsageSession applicationStateDidChange:withAttributes:]( &v11,  sel_applicationStateDidChange_withAttributes_,  v6,  v7);
    goto LABEL_8;
  }

  if ([v6 rangeOfString:@"spotlight" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && [v6 rangeOfString:@".extension" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && [v6 rangeOfString:@".widget" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && [v6 rangeOfString:@"preferences" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:]( &OBJC_CLASS___WiFiUsagePrivacyFilter,  "canPerformActionWithSampleRate:",  3LL))
  {
    NSLog( @"%s: application session started:%@",  "-[WiFiUsageApplicationSession applicationStateDidChange:withAttributes:]",  v6);
    -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
    goto LABEL_7;
  }

- (id)metricName
{
  return @"com.apple.wifi.applicationsession";
}

@end