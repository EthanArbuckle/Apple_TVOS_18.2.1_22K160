@interface CSAssetManagerEnablePolicy
- (BOOL)_shouldCheckNetworkAvailability;
- (CSAssetManagerEnablePolicy)init;
- (void)_addAssetManagerEnabledConditions;
- (void)_subscribeEventMonitors;
@end

@implementation CSAssetManagerEnablePolicy

- (CSAssetManagerEnablePolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAssetManagerEnablePolicy;
  v2 = -[CSAssetManagerEnablePolicy init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CSAssetManagerEnablePolicy _addAssetManagerEnabledConditions](v2, "_addAssetManagerEnabledConditions");
    -[CSAssetManagerEnablePolicy _subscribeEventMonitors](v3, "_subscribeEventMonitors");
  }

  return v3;
}

- (void)_subscribeEventMonitors
{
  if (-[CSAssetManagerEnablePolicy _shouldCheckNetworkAvailability](self, "_shouldCheckNetworkAvailability"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[CSNetworkAvailabilityMonitor sharedInstance]( &OBJC_CLASS___CSNetworkAvailabilityMonitor,  "sharedInstance"));
    -[CSAssetManagerEnablePolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);
  }

- (void)_addAssetManagerEnabledConditions
{
  if (-[CSAssetManagerEnablePolicy _shouldCheckNetworkAvailability](self, "_shouldCheckNetworkAvailability")) {
    -[CSAssetManagerEnablePolicy addConditions:](self, "addConditions:", &stru_10022CA78);
  }
}

- (BOOL)_shouldCheckNetworkAvailability
{
  if ((CSIsIOS(self, a2) & 1) != 0 || (CSIsWatch() & 1) != 0) {
    return 1;
  }
  else {
    return CSIsHorseman();
  }
}

@end