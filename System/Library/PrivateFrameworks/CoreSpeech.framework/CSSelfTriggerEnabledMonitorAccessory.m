@interface CSSelfTriggerEnabledMonitorAccessory
+ (id)sharedInstance;
- (BOOL)enabled;
- (BOOL)isEnabled;
- (CSSelfTriggerEnabledMonitorAccessory)init;
- (void)_didReceiveSelfTriggerChanged:(BOOL)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)setEnable:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CSSelfTriggerEnabledMonitorAccessory

- (CSSelfTriggerEnabledMonitorAccessory)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSSelfTriggerEnabledMonitorAccessory;
  result = -[CSSelfTriggerEnabledMonitorAccessory init](&v3, "init");
  if (result) {
    result->_enabled = 0;
  }
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences", a3));
  self->_enabled = [v4 isSelfTriggerEnabledAccessory];

  -[CSSelfTriggerEnabledMonitorAccessory _didReceiveSelfTriggerChanged:]( self,  "_didReceiveSelfTriggerChanged:",  self->_enabled);
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_enabled) {
      v6 = @"Enabled";
    }
    else {
      v6 = @"Disabled";
    }
    int v7 = 136315394;
    v8 = "-[CSSelfTriggerEnabledMonitorAccessory _startMonitoringWithQueue:]";
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : SelfTrigger switch, SelfTrigger is %{public}@",  (uint8_t *)&v7,  0x16u);
  }

- (void)_stopMonitoring
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSSelfTriggerEnabledMonitorAccessory _stopMonitoring]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : SelfTrigger switch",  (uint8_t *)&v3,  0xCu);
  }

- (void)_didReceiveSelfTriggerChanged:(BOOL)a3
{
  self->_enabled = a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100102220;
  v3[3] = &unk_10022EB30;
  v3[4] = self;
  BOOL v4 = a3;
  -[CSSelfTriggerEnabledMonitorAccessory enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnable:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"Disable";
    if (v3) {
      v6 = @"Enable";
    }
    int v8 = 136315394;
    __int16 v9 = "-[CSSelfTriggerEnabledMonitorAccessory setEnable:]";
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Set SelfTrigger Enable = %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  [v7 setSelfTriggerEnabledAccessory:v3];

  -[CSSelfTriggerEnabledMonitorAccessory _didReceiveSelfTriggerChanged:](self, "_didReceiveSelfTriggerChanged:", v3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

+ (id)sharedInstance
{
  if (qword_100280080 != -1) {
    dispatch_once(&qword_100280080, &stru_10022D600);
  }
  return (id)qword_100280078;
}

@end