@interface MonitoredStates
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)isImmersionLevelControllerPresentOnScreen;
- (MonitoredStates)init;
- (MonitoredStates)initWithCoder:(id)a3;
- (MonitoredStates)initWithImmersionLevelControllerPresentOnScreen:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsImmersionLevelControllerPresentOnScreen:(BOOL)a3;
@end

@implementation MonitoredStates

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DEB0;
  block[3] = &unk_100028898;
  block[4] = a1;
  if (qword_100036570 != -1) {
    dispatch_once(&qword_100036570, block);
  }
  return (id)qword_100036568;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MonitoredStates)init
{
  self->_isImmersionLevelControllerPresentOnScreen = 0;
  return self;
}

- (MonitoredStates)initWithImmersionLevelControllerPresentOnScreen:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MonitoredStates;
  result = -[MonitoredStates init](&v5, "init");
  if (result) {
    result->_isImmersionLevelControllerPresentOnScreen = a3;
  }
  return result;
}

- (MonitoredStates)initWithCoder:(id)a3
{
  return -[MonitoredStates initWithImmersionLevelControllerPresentOnScreen:]( self,  "initWithImmersionLevelControllerPresentOnScreen:",  [a3 decodeBoolForKey:@"isImmersionLevelControllerPresentOnScreen"]);
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isImmersionLevelControllerPresentOnScreen
{
  return self->_isImmersionLevelControllerPresentOnScreen;
}

- (void)setIsImmersionLevelControllerPresentOnScreen:(BOOL)a3
{
  self->_isImmersionLevelControllerPresentOnScreen = a3;
}

@end