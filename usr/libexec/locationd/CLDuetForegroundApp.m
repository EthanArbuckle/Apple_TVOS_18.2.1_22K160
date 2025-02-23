@interface CLDuetForegroundApp
- (CLDuetForegroundApp)initWithBundleId:(id)a3 launchReason:(id)a4;
- (NSString)bundleId;
- (NSString)launchReason;
- (void)dealloc;
- (void)setBundleId:(id)a3;
- (void)setLaunchReason:(id)a3;
@end

@implementation CLDuetForegroundApp

- (CLDuetForegroundApp)initWithBundleId:(id)a3 launchReason:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLDuetForegroundApp;
  v6 = -[CLDuetForegroundApp init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[CLDuetForegroundApp setBundleId:](v6, "setBundleId:", a3);
    -[CLDuetForegroundApp setLaunchReason:](v7, "setLaunchReason:", a4);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDuetForegroundApp;
  -[CLDuetForegroundApp dealloc](&v3, "dealloc");
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
}

@end