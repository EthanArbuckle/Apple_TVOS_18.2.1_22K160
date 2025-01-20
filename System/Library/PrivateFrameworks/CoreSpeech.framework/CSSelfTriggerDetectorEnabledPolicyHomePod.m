@interface CSSelfTriggerDetectorEnabledPolicyHomePod
- (CSSelfTriggerDetectorEnabledPolicyHomePod)init;
- (void)_addSelfTriggerDetectorEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSSelfTriggerDetectorEnabledPolicyHomePod

- (CSSelfTriggerDetectorEnabledPolicyHomePod)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSSelfTriggerDetectorEnabledPolicyHomePod;
  v2 = -[CSSelfTriggerDetectorEnabledPolicyHomePod init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CSSelfTriggerDetectorEnabledPolicyHomePod _subscribeEventMonitors](v2, "_subscribeEventMonitors");
    -[CSSelfTriggerDetectorEnabledPolicyHomePod _addSelfTriggerDetectorEnabledConditions]( v3,  "_addSelfTriggerDetectorEnabledConditions");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriEnabledMonitor sharedInstance](&OBJC_CLASS___CSSiriEnabledMonitor, "sharedInstance"));
  -[CSSelfTriggerDetectorEnabledPolicyHomePod subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CSHomePodSettingsMonitor sharedInstance](&OBJC_CLASS___CSHomePodSettingsMonitor, "sharedInstance"));
  -[CSSelfTriggerDetectorEnabledPolicyHomePod subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);
}

- (void)_addSelfTriggerDetectorEnabledConditions
{
}

@end