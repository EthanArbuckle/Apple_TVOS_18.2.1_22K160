@interface CSSmartSiriVolumeRunPolicyHomePod
- (void)_addSmartSiriVolumeEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSSmartSiriVolumeRunPolicyHomePod

- (void)_subscribeEventMonitors
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeRunPolicyHomePod;
  -[CSSmartSiriVolumeRunPolicy _subscribeEventMonitors](&v4, "_subscribeEventMonitors");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSHomePodSettingsMonitor sharedInstance](&OBJC_CLASS___CSHomePodSettingsMonitor, "sharedInstance"));
  -[CSSmartSiriVolumeRunPolicyHomePod subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);
}

- (void)_addSmartSiriVolumeEnabledConditions
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeRunPolicyHomePod;
  -[CSSmartSiriVolumeRunPolicy _addSmartSiriVolumeEnabledConditions](&v3, "_addSmartSiriVolumeEnabledConditions");
  -[CSSmartSiriVolumeRunPolicyHomePod addConditions:](self, "addConditions:", &stru_100229FB8);
}

@end