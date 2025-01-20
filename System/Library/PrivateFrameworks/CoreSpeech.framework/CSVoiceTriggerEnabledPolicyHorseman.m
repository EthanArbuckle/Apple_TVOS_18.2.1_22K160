@interface CSVoiceTriggerEnabledPolicyHorseman
- (CSVoiceTriggerEnabledPolicyHorseman)init;
- (void)_addVoiceTriggerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerEnabledPolicyHorseman

- (CSVoiceTriggerEnabledPolicyHorseman)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerEnabledPolicyHorseman;
  v2 = -[CSVoiceTriggerEnabledPolicyHorseman init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerEnabledPolicyHorseman _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[CSVoiceTriggerEnabledPolicyHorseman _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyHorseman subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CSHomePodSettingsMonitor sharedInstance](&OBJC_CLASS___CSHomePodSettingsMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyHorseman subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);
}

- (void)_addVoiceTriggerEnabledConditions
{
}

@end