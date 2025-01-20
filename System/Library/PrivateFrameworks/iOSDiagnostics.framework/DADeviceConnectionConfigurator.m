@interface DADeviceConnectionConfigurator
+ (id)sharedInstance;
- (BOOL)isSessionModeOveridden;
- (int)mode;
- (int)overrideSessionMode;
- (void)overrideSessionModeWithMode:(int)a3;
- (void)setIsSessionModeOveridden:(BOOL)a3;
- (void)setOverrideSessionMode:(int)a3;
@end

@implementation DADeviceConnectionConfigurator

+ (id)sharedInstance
{
  if (qword_100022568 != -1) {
    dispatch_once(&qword_100022568, &stru_1000185A0);
  }
  return (id)qword_100022560;
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