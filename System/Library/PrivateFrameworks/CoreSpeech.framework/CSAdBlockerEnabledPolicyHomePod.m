@interface CSAdBlockerEnabledPolicyHomePod
- (void)_addContinuousAudioFingerprintEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSAdBlockerEnabledPolicyHomePod

- (void)_subscribeEventMonitors
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSAdBlockerEnabledPolicyHomePod;
  -[CSAdBlockerEnabledPolicy _subscribeEventMonitors](&v4, "_subscribeEventMonitors");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSHomePodSettingsMonitor sharedInstance](&OBJC_CLASS___CSHomePodSettingsMonitor, "sharedInstance"));
  -[CSAdBlockerEnabledPolicyHomePod subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);
}

- (void)_addContinuousAudioFingerprintEnabledConditions
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAdBlockerEnabledPolicyHomePod;
  -[CSAdBlockerEnabledPolicy _addContinuousAudioFingerprintEnabledConditions]( &v3,  "_addContinuousAudioFingerprintEnabledConditions");
  -[CSAdBlockerEnabledPolicyHomePod addConditions:](self, "addConditions:", &stru_10022A1E8);
}

@end