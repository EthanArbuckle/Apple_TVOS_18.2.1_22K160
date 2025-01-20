@interface WiFiCloudAssetsClient
+ (id)sharedInstance;
- (BOOL)isWiFiHealthMonitorDisabled;
- (OS_dispatch_queue)queue;
- (__WiFiManager)wifiManager;
- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4;
- (void)runAssetQuery;
- (void)setIsWiFiHealthMonitorDisabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setWifiManager:(__WiFiManager *)a3;
@end

@implementation WiFiCloudAssetsClient

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000782C;
  block[3] = &unk_1001E2620;
  block[4] = a1;
  if (qword_1002197D0 != -1) {
    dispatch_once(&qword_1002197D0, block);
  }
  return (id)qword_1002197C8;
}

- (void)runAssetQuery
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000078AC;
  v2[3] = &unk_1001E2670;
  v2[4] = self;
  +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:]( &OBJC_CLASS___WCAFetchWiFiBehaviorParameters,  "fetchWiFiBehaviorWithCompletion:",  v2);
}

- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4
{
  id v6 = a4;
  -[WiFiCloudAssetsClient setWifiManager:](self, "setWifiManager:", a3);
  -[WiFiCloudAssetsClient setQueue:](self, "setQueue:", v6);
}

- (BOOL)isWiFiHealthMonitorDisabled
{
  return self->_isWiFiHealthMonitorDisabled;
}

- (void)setIsWiFiHealthMonitorDisabled:(BOOL)a3
{
  self->_isWiFiHealthMonitorDisabled = a3;
}

- (__WiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManager *)a3
{
  self->_wifiManager = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end