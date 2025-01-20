@interface CSAdBlockerEnabledPolicy
- (CSAdBlockerEnabledPolicy)init;
- (void)_addContinuousAudioFingerprintEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSAdBlockerEnabledPolicy

- (CSAdBlockerEnabledPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAdBlockerEnabledPolicy;
  v2 = -[CSAdBlockerEnabledPolicy init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CSAdBlockerEnabledPolicy _subscribeEventMonitors](v2, "_subscribeEventMonitors");
    -[CSAdBlockerEnabledPolicy _addContinuousAudioFingerprintEnabledConditions]( v3,  "_addContinuousAudioFingerprintEnabledConditions");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[CSSiriEnabledMonitor sharedInstance](&OBJC_CLASS___CSSiriEnabledMonitor, "sharedInstance"));
  -[CSAdBlockerEnabledPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);
}

- (void)_addContinuousAudioFingerprintEnabledConditions
{
}

@end