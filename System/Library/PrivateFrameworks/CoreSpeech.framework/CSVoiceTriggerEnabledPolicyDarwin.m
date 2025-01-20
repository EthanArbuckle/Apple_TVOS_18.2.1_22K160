@interface CSVoiceTriggerEnabledPolicyDarwin
- (CSVoiceTriggerEnabledPolicyDarwin)init;
- (void)_addVoiceTriggerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerEnabledPolicyDarwin

- (CSVoiceTriggerEnabledPolicyDarwin)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerEnabledPolicyDarwin;
  v2 = -[CSVoiceTriggerEnabledPolicyDarwin init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerEnabledPolicyDarwin _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[CSVoiceTriggerEnabledPolicyDarwin _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyDarwin subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);
}

- (void)_addVoiceTriggerEnabledConditions
{
}

@end