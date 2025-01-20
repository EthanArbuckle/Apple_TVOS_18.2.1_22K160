@interface VOTUserEventManager
+ (id)sharedInstance;
- (VOTUserEventManager)init;
- (double)lastEventOccurred;
- (void)userEventOccurred;
@end

@implementation VOTUserEventManager

+ (id)sharedInstance
{
  if (qword_1001ACF60 != -1) {
    dispatch_once(&qword_1001ACF60, &stru_1001793F0);
  }
  return (id)qword_1001ACF58;
}

- (VOTUserEventManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTUserEventManager;
  return -[VOTUserEventManager init](&v3, "init");
}

- (void)userEventOccurred
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
  [v3 userEventOccurred];

  self->_lastEventOccurred = CFAbsoluteTimeGetCurrent();
}

- (double)lastEventOccurred
{
  return self->_lastEventOccurred;
}

@end