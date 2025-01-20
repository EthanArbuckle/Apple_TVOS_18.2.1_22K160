@interface CSListeningEnabledPolicyWatch
- (CSListeningEnabledPolicyWatch)init;
- (void)_addListeningEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSListeningEnabledPolicyWatch

- (CSListeningEnabledPolicyWatch)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSListeningEnabledPolicyWatch;
  v2 = -[CSListeningEnabledPolicyWatch init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CSListeningEnabledPolicyWatch _addListeningEnabledConditions](v2, "_addListeningEnabledConditions");
    -[CSListeningEnabledPolicyWatch _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriAssertionMonitor sharedInstance](&OBJC_CLASS___CSSiriAssertionMonitor, "sharedInstance"));
  -[CSListeningEnabledPolicyWatch subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriEnabledMonitor sharedInstance](&OBJC_CLASS___CSSiriEnabledMonitor, "sharedInstance"));
  -[CSListeningEnabledPolicyWatch subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSSystemShellStartMonitorFactory defaultShellStartMonitor]( &OBJC_CLASS___CSSystemShellStartMonitorFactory,  "defaultShellStartMonitor"));
  -[CSListeningEnabledPolicyWatch subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSFirstUnlockMonitor sharedInstance](&OBJC_CLASS___CSFirstUnlockMonitor, "sharedInstance"));
  -[CSListeningEnabledPolicyWatch subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechDetectionDevicePresentMonitor sharedInstance]( &OBJC_CLASS___CSSpeechDetectionDevicePresentMonitor,  "sharedInstance"));
  -[CSListeningEnabledPolicyWatch subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  if (+[CSUtils supportHandsFree](&OBJC_CLASS___CSUtils, "supportHandsFree"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
    -[CSListeningEnabledPolicyWatch subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

    id v9 = (id)objc_claimAutoreleasedReturnValue( +[CSPhraseSpotterEnabledMonitor sharedInstance]( &OBJC_CLASS___CSPhraseSpotterEnabledMonitor,  "sharedInstance"));
    -[CSListeningEnabledPolicyWatch subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);
  }

- (void)_addListeningEnabledConditions
{
  else {
    v3 = &stru_10022BDC8;
  }
  -[CSListeningEnabledPolicyWatch addConditions:](self, "addConditions:", v3);
  -[CSListeningEnabledPolicyWatch addConditions:](self, "addConditions:", &stru_10022BDE8);
  -[CSListeningEnabledPolicyWatch addConditions:](self, "addConditions:", &stru_10022BE08);
  -[CSListeningEnabledPolicyWatch addConditions:](self, "addConditions:", &stru_10022BE28);
  -[CSListeningEnabledPolicyWatch addConditions:](self, "addConditions:", &stru_10022BE48);
  -[CSListeningEnabledPolicyWatch addConditions:](self, "addConditions:", &stru_10022BE68);
}

@end