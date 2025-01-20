@interface CSVoiceTriggerEnabledPolicyAOP
- (CSVoiceTriggerEnabledPolicyAOP)init;
- (void)_addVoiceTriggerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerEnabledPolicyAOP

- (CSVoiceTriggerEnabledPolicyAOP)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerEnabledPolicyAOP;
  v2 = -[CSVoiceTriggerEnabledPolicyAOP init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerEnabledPolicyAOP _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[CSVoiceTriggerEnabledPolicyAOP _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriEnabledMonitor sharedInstance](&OBJC_CLASS___CSSiriEnabledMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSSystemShellStartMonitorFactory defaultShellStartMonitor]( &OBJC_CLASS___CSSystemShellStartMonitorFactory,  "defaultShellStartMonitor"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSFirstUnlockMonitor sharedInstance](&OBJC_CLASS___CSFirstUnlockMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSScreenLockMonitor sharedInstance](&OBJC_CLASS___CSScreenLockMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriRestrictionOnLockScreenMonitor sharedInstance]( &OBJC_CLASS___CSSiriRestrictionOnLockScreenMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSBluetoothWirelessSplitterMonitor sharedInstance]( &OBJC_CLASS___CSBluetoothWirelessSplitterMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSOtherAppRecordingStateMonitor sharedInstance]( &OBJC_CLASS___CSOtherAppRecordingStateMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSHangUpEnabledMonitor sharedInstance](&OBJC_CLASS___CSHangUpEnabledMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v12);

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[CSSiriInCallEnabledMonitor sharedInstance](&OBJC_CLASS___CSSiriInCallEnabledMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v13);
}

- (void)_addVoiceTriggerEnabledConditions
{
}

@end