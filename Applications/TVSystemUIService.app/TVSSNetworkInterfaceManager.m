@interface TVSSNetworkInterfaceManager
+ (id)sharedInstance;
- (BOOL)isInternetAvailable;
- (TVSEthernetInterface)ethernetInterface;
- (TVSSNetworkInterfaceManager)init;
- (TVSSNetworkInterfaceManagingDelegate)delegate;
- (TVSWiFiInterface)wifiInterface;
- (void)setDelegate:(id)a3;
@end

@implementation TVSSNetworkInterfaceManager

+ (id)sharedInstance
{
  id v10 = a1;
  SEL v9 = a2;
  obj = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_1000462A4;
  v7 = &unk_1001B6430;
  id v8 = a1;
  v12 = (dispatch_once_t *)&unk_100221C58;
  id location = 0LL;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221C50;
}

- (TVSSNetworkInterfaceManager)init
{
  SEL v11 = a2;
  v12 = 0LL;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSSNetworkInterfaceManager;
  v12 = -[TVSSNetworkInterfaceManager init](&v10, "init");
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
    +[TVSWiFiInterface enableNetworkManagement](&OBJC_CLASS___TVSWiFiInterface, "enableNetworkManagement");
    int v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    v7 = sub_100046448;
    id v8 = &unk_1001B5A60;
    SEL v9 = v12;
    +[PBSSystemStatus addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:]( &OBJC_CLASS___PBSSystemStatus,  "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:",  @"internetAvailable",  0LL,  1LL,  &v4);
    objc_storeStrong((id *)&v9, 0LL);
  }

  v3 = v12;
  objc_storeStrong((id *)&v12, 0LL);
  return v3;
}

- (BOOL)isInternetAvailable
{
  return +[PBSSystemStatus isInternetAvailable]( &OBJC_CLASS___PBSSystemStatus,  "isInternetAvailable",  a2,  self) & 1;
}

- (TVSEthernetInterface)ethernetInterface
{
  return (TVSEthernetInterface *)+[TVSEthernetInterface RJ45EthernetInterface]( &OBJC_CLASS___TVSEthernetInterface,  "RJ45EthernetInterface",  a2,  self);
}

- (TVSWiFiInterface)wifiInterface
{
  return (TVSWiFiInterface *)+[TVSWiFiInterface WiFiInterface]( &OBJC_CLASS___TVSWiFiInterface,  "WiFiInterface",  a2,  self);
}

- (TVSSNetworkInterfaceManagingDelegate)delegate
{
  return (TVSSNetworkInterfaceManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end