@interface AirPortAssistantController
+ (BOOL)isAirPlayDevice:(id)a3;
+ (BOOL)isGenericMFiAccessory:(id)a3;
+ (BOOL)isSTAOnlyDevice:(id)a3;
+ (BOOL)isUnconfiguredDevice:(id)a3;
+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5;
+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5 viewController:(id)a6;
+ (id)assistantUIViewControllerWithParameters:(id)a3;
+ (id)sharedInstance;
+ (id)unconfiguredDeviceName:(id)a3;
+ (id)uniqueBaseStationName:(id)a3 withBssid:(id)a4;
+ (void)load;
- (AirPortAssistantControllerDelegate)delegate;
- (NSDictionary)unconfiguredWACDevices;
- (NSString)configuredSSID;
- (id)context;
- (id)viewController;
- (int)configureUIViewControllerWithParameters:(id)a3;
- (int)start2_4WiFiScan;
- (void)setConfiguredSSID:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUnconfiguredWACDevices:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation AirPortAssistantController

+ (void)load
{
}

+ (id)sharedInstance
{
  return 0LL;
}

+ (id)assistantUIViewControllerWithParameters:(id)a3
{
  return 0LL;
}

+ (BOOL)isAirPlayDevice:(id)a3
{
  return 0;
}

+ (BOOL)isSTAOnlyDevice:(id)a3
{
  return 0;
}

+ (BOOL)isUnconfiguredDevice:(id)a3
{
  return 0;
}

+ (BOOL)isGenericMFiAccessory:(id)a3
{
  return 0;
}

+ (id)unconfiguredDeviceName:(id)a3
{
  return 0LL;
}

+ (id)uniqueBaseStationName:(id)a3 withBssid:(id)a4
{
  return 0LL;
}

+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5
{
  return 0;
}

+ (BOOL)launchAUForNetwork:(id)a3 withMacAddress:(id)a4 getAUFromAppStore:(BOOL)a5 viewController:(id)a6
{
  return 0;
}

- (int)configureUIViewControllerWithParameters:(id)a3
{
  return 0;
}

- (int)start2_4WiFiScan
{
  return 0;
}

- (AirPortAssistantControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AirPortAssistantControllerDelegate *)a3;
}

- (id)context
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setContext:(id)a3
{
}

- (id)viewController
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setViewController:(id)a3
{
}

- (NSString)configuredSSID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setConfiguredSSID:(id)a3
{
}

- (NSDictionary)unconfiguredWACDevices
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setUnconfiguredWACDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end