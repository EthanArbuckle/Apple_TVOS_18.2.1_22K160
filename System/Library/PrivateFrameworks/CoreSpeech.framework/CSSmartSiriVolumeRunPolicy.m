@interface CSSmartSiriVolumeRunPolicy
- (CSSmartSiriVolumeRunPolicy)init;
- (void)_addSmartSiriVolumeEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSSmartSiriVolumeRunPolicy

- (CSSmartSiriVolumeRunPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeRunPolicy;
  v2 = -[CSSmartSiriVolumeRunPolicy init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSSmartSiriVolumeRunPolicy queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    -[CSSmartSiriVolumeRunPolicy _addSmartSiriVolumeEnabledConditions](v2, "_addSmartSiriVolumeEnabledConditions");
    -[CSSmartSiriVolumeRunPolicy _subscribeEventMonitors](v2, "_subscribeEventMonitors");
  }

  return v2;
}

- (void)_subscribeEventMonitors
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[CSSiriEnabledMonitor sharedInstance](&OBJC_CLASS___CSSiriEnabledMonitor, "sharedInstance"));
  -[CSSmartSiriVolumeRunPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);
}

- (void)_addSmartSiriVolumeEnabledConditions
{
}

- (void).cxx_destruct
{
}

@end