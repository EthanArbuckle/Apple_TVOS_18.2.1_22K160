@interface CSSmartSiriVolumeEnablePolicy
- (CSSmartSiriVolumeEnablePolicy)init;
- (void)_addSmartSiriVolumeEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSSmartSiriVolumeEnablePolicy

- (CSSmartSiriVolumeEnablePolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeEnablePolicy;
  v2 = -[CSSmartSiriVolumeEnablePolicy init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSSmartSiriVolumeEnablePolicy queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    -[CSSmartSiriVolumeEnablePolicy _addSmartSiriVolumeEnabledConditions](v2, "_addSmartSiriVolumeEnabledConditions");
    -[CSSmartSiriVolumeEnablePolicy _subscribeEventMonitors](v2, "_subscribeEventMonitors");
  }

  return v2;
}

- (void)_subscribeEventMonitors
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[CSAudioSessionMonitor sharedInstance](&OBJC_CLASS___CSAudioSessionMonitor, "sharedInstance"));
  -[CSSmartSiriVolumeEnablePolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);
}

- (void)_addSmartSiriVolumeEnabledConditions
{
}

- (void).cxx_destruct
{
}

@end