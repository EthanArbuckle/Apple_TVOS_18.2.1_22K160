@interface DADeviceConnectionConfigurator
+ (DADeviceConnectionConfigurator)sharedInstance;
- (BOOL)isSessionModeOveridden;
- (int)mode;
- (int)overrideSessionMode;
- (void)overrideSessionModeWithMode:(int)a3;
- (void)setIsSessionModeOveridden:(BOOL)a3;
- (void)setOverrideSessionMode:(int)a3;
@end

@implementation DADeviceConnectionConfigurator

+ (DADeviceConnectionConfigurator)sharedInstance
{
  if (qword_10003A660 != -1) {
    dispatch_once(&qword_10003A660, &stru_10002CFE8);
  }
  return (DADeviceConnectionConfigurator *)(id)qword_10003A658;
}

- (int)mode
{
  int result = -[DADeviceConnectionConfigurator isSessionModeOveridden](self, "isSessionModeOveridden");
  if (result) {
    return -[DADeviceConnectionConfigurator overrideSessionMode](self, "overrideSessionMode");
  }
  return result;
}

- (void)overrideSessionModeWithMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[DADeviceConnectionConfigurator setIsSessionModeOveridden:](self, "setIsSessionModeOveridden:", 1LL);
  -[DADeviceConnectionConfigurator setOverrideSessionMode:](self, "setOverrideSessionMode:", v3);
}

- (BOOL)isSessionModeOveridden
{
  return self->_isSessionModeOveridden;
}

- (void)setIsSessionModeOveridden:(BOOL)a3
{
  self->_isSessionModeOveridden = a3;
}

- (int)overrideSessionMode
{
  return self->_overrideSessionMode;
}

- (void)setOverrideSessionMode:(int)a3
{
  self->_overrideSessionMode = a3;
}

@end