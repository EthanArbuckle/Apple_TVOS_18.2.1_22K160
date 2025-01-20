@interface CSVoiceTriggerEnabledPolicyNonAOP
- (CSVoiceTriggerEnabledPolicyNonAOP)init;
- (void)_addVoiceTriggerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSVoiceTriggerEnabledPolicyNonAOP

- (CSVoiceTriggerEnabledPolicyNonAOP)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerEnabledPolicyNonAOP;
  v2 = -[CSVoiceTriggerEnabledPolicyNonAOP init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CSVoiceTriggerEnabledPolicyNonAOP _addVoiceTriggerEnabledConditions](v2, "_addVoiceTriggerEnabledConditions");
    -[CSVoiceTriggerEnabledPolicyNonAOP _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriAssertionMonitor sharedInstance](&OBJC_CLASS___CSSiriAssertionMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriEnabledMonitor sharedInstance](&OBJC_CLASS___CSSiriEnabledMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSSystemShellStartMonitorFactory defaultShellStartMonitor]( &OBJC_CLASS___CSSystemShellStartMonitorFactory,  "defaultShellStartMonitor"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSFirstUnlockMonitor sharedInstance](&OBJC_CLASS___CSFirstUnlockMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSBatteryMonitor sharedInstance](&OBJC_CLASS___CSBatteryMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSScreenLockMonitor sharedInstance](&OBJC_CLASS___CSScreenLockMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriRestrictionOnLockScreenMonitor sharedInstance]( &OBJC_CLASS___CSSiriRestrictionOnLockScreenMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSSoftwareUpdateCheckingMonitor sharedInstance]( &OBJC_CLASS___CSSoftwareUpdateCheckingMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechDetectionDevicePresentMonitor sharedInstance]( &OBJC_CLASS___CSSpeechDetectionDevicePresentMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[CSOtherAppRecordingStateMonitor sharedInstance]( &OBJC_CLASS___CSOtherAppRecordingStateMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSBluetoothWirelessSplitterMonitor sharedInstance]( &OBJC_CLASS___CSBluetoothWirelessSplitterMonitor,  "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSHangUpEnabledMonitor sharedInstance](&OBJC_CLASS___CSHangUpEnabledMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v16);

  id v17 = (id)objc_claimAutoreleasedReturnValue(+[CSSiriInCallEnabledMonitor sharedInstance](&OBJC_CLASS___CSSiriInCallEnabledMonitor, "sharedInstance"));
  -[CSVoiceTriggerEnabledPolicyNonAOP subscribeEventMonitor:](self, "subscribeEventMonitor:", v17);
}

- (void)_addVoiceTriggerEnabledConditions
{
}

@end