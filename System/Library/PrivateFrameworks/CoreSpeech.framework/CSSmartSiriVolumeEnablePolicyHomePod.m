@interface CSSmartSiriVolumeEnablePolicyHomePod
- (void)_addSmartSiriVolumeEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSSmartSiriVolumeEnablePolicyHomePod

- (void)_subscribeEventMonitors
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeEnablePolicyHomePod;
  -[CSSmartSiriVolumeEnablePolicy _subscribeEventMonitors](&v4, "_subscribeEventMonitors");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSHomePodSettingsMonitor sharedInstance](&OBJC_CLASS___CSHomePodSettingsMonitor, "sharedInstance"));
  -[CSSmartSiriVolumeEnablePolicyHomePod subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);
}

- (void)_addSmartSiriVolumeEnabledConditions
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeEnablePolicyHomePod;
  -[CSSmartSiriVolumeEnablePolicy _addSmartSiriVolumeEnabledConditions](&v3, "_addSmartSiriVolumeEnabledConditions");
  -[CSSmartSiriVolumeEnablePolicyHomePod addConditions:](self, "addConditions:", &stru_10022B6C8);
}

@end