@interface WACUIViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (AirPortAssistantManager)airportAssistantManager;
- (AirPortAssistantUINavigationController)nav;
- (BOOL)hostIsEntitled;
- (WACUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)airPortAssistantCompleteWithResult:(int)a3 context:(id)a4 animated:(BOOL)a5;
- (void)backendConfigureAirPortAssistantWithTargetMACAddress:(id)a3;
- (void)backendStartSearch;
- (void)backendStopSearch;
- (void)cancelActiveConfiguration;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)setAirportAssistantManager:(id)a3;
- (void)setNav:(id)a3;
- (void)shouldCheckWiFiPowerStatus;
- (void)updateState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)wacDevicesAdded:(id)a3 andWACDevicesRemoved:(id)a4;
@end

@implementation WACUIViewController

- (WACUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___WACUIViewController;
  v4 = -[WACUIViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___AirPortAssistantManager);
    airportAssistantManager = v4->_airportAssistantManager;
    v4->_airportAssistantManager = v5;

    -[AirPortAssistantManager setDelegate:](v4->_airportAssistantManager, "setDelegate:", v4);
    v4->_authorized = 0;
    uint64_t v7 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
    v4->_wifiManager = (__WiFiManagerClient *)v7;
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop(v7, Current, kCFRunLoopDefaultMode);
    WiFiManagerClientSetType(v4->_wifiManager, 0LL);
    uint64_t v9 = WiFiManagerClientCopyDevices(v4->_wifiManager);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (v10)
    {
      if ([v10 count])
      {
        v12 = (__WiFiDeviceClient *)[v11 objectAtIndex:0];
        v4->_wifiDevice = v12;
        CFRetain(v12);
        WiFiDeviceClientRegisterPowerCallback(v4->_wifiDevice, sub_100001258, v4);
      }

      CFRelease(v11);
    }

    v4->__debugLog = +[WACLogging isEnabled](&OBJC_CLASS___WACLogging, "isEnabled");
  }

  return v4;
}

- (void)dealloc
{
  wifiManager = self->_wifiManager;
  if (wifiManager) {
    CFRelease(wifiManager);
  }
  wifiDevice = self->_wifiDevice;
  if (wifiDevice) {
    CFRelease(wifiDevice);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WACUIViewController;
  -[WACUIViewController dealloc](&v5, "dealloc");
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WACUIViewController;
  -[WACUIViewController viewDidLoad](&v3, "viewDidLoad");
  if (self->__debugLog) {
    NSLog(@"Plugin: ViewDidLoad");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WACUIViewController;
  -[WACUIViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (self->__debugLog) {
    NSLog(@"Plugin: ViewDidAppear");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->__debugLog) {
    NSLog(@"Plugin: viewDidDisappear", a2);
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___WACUIViewController;
  -[WACUIViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[WACUIViewController nav](self, "nav"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100001470;
  v6[3] = &unk_1000041A0;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:0 completion:v6];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___WACUIViewController;
  -[WACUIViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)shouldCheckWiFiPowerStatus
{
  if (self->__debugLog) {
    NSLog(@"Plugin: shouldCheckWiFiPowerStatus", a2);
  }
  wifiDevice = self->_wifiDevice;
  if (wifiDevice && !WiFiDeviceClientGetPower(wifiDevice, a2))
  {
    if (-[WACUIViewController hostIsEntitled](self, "hostIsEntitled"))
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(-[WACUIViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
      [v4 wifiDidShutdown];
    }
  }

- (BOOL)hostIsEntitled
{
  if (!self->_didCheckedEntitlements)
  {
    self->_didCheckedEntitlements = 1;
    -[WACUIViewController _hostAuditToken](self, "_hostAuditToken");
    if (self->__debugLog) {
      NSLog( @"Audit Token: %x %x %x %x %x %x %x %x",  v11.val[0],  v11.val[1],  v11.val[2],  v11.val[3],  v11.val[4],  v11.val[5],  v11.val[6],  v11.val[7]);
    }
    audit_token_t token = v11;
    SecTaskRef v3 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    id v4 = v3;
    if (self->__debugLog) {
      NSLog(@"Task: %@", v3);
    }
    *(void *)token.val = 0LL;
    objc_super v5 = (const __CFBoolean *)SecTaskCopyValueForEntitlement( v4,  @"com.apple.external-accessory.wireless-configuration",  (CFErrorRef *)&token);
    v6 = v5;
    if (v5)
    {
      CFTypeID v7 = CFGetTypeID(v5);
      BOOL v8 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) != 0;
      self->_authorized = v8;
    }

    if (self->__debugLog) {
      NSLog(@"Entitlement returned: %@, Error returned: %@", v6, *(void *)token.val);
    }
    if (v6) {
      CFRelease(v6);
    }
    if (*(void *)token.val) {
      CFRelease(*(CFTypeRef *)token.val);
    }
    if (v4) {
      CFRelease(v4);
    }
  }

  return self->_authorized;
}

- (void)cancelActiveConfiguration
{
  if (self->__debugLog) {
    NSLog(@"Plugin: cancelActiveConfiguration", a2);
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[AirPortAssistantManager airportAssistantController]( self->_airportAssistantManager,  "airportAssistantController"));
  SecTaskRef v3 = (void *)objc_claimAutoreleasedReturnValue([v4 viewController]);
  [v3 performSelector:"handeImmediateCancel" withObject:0];
}

- (void)wacDevicesAdded:(id)a3 andWACDevicesRemoved:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[WACUIViewController hostIsEntitled](self, "hostIsEntitled"))
  {
    CFTypeID v7 = (void *)objc_claimAutoreleasedReturnValue(-[WACUIViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    [v7 backendFoundNewWACDevices:v8 andRemovedWACDevices:v6];
  }
}

- (void)airPortAssistantCompleteWithResult:(int)a3 context:(id)a4 animated:(BOOL)a5
{
  uint64_t v5 = *(void *)&a3;
  if (-[WACUIViewController hostIsEntitled](self, "hostIsEntitled", *(void *)&a3, a4, a5))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[WACUIViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    [v7 dismissWithStatus:v5];
  }

- (void)updateState:(int64_t)a3
{
  if (-[WACUIViewController hostIsEntitled](self, "hostIsEntitled"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[WACUIViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    [v5 updateState:a3];
  }

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___WACUIServiceProtocol);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___WACUIHostProtocol);
}

- (void)backendStartSearch
{
  if (-[WACUIViewController hostIsEntitled](self, "hostIsEntitled")) {
    -[AirPortAssistantManager startSearchingForUnconfiguredAccessories]( self->_airportAssistantManager,  "startSearchingForUnconfiguredAccessories");
  }
}

- (void)backendStopSearch
{
  if (-[WACUIViewController hostIsEntitled](self, "hostIsEntitled")) {
    -[AirPortAssistantManager stopSearchingForUnconfiguredAccessories]( self->_airportAssistantManager,  "stopSearchingForUnconfiguredAccessories");
  }
}

- (void)backendConfigureAirPortAssistantWithTargetMACAddress:(id)a3
{
  id v4 = a3;
  if (-[WACUIViewController hostIsEntitled](self, "hostIsEntitled"))
  {
    v13[0] = @"deviceMACAddr";
    v13[1] = @"wacShouldHideFindAppUI";
    v14[0] = v4;
    v14[1] = &__kCFBooleanTrue;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
    -[AirPortAssistantManager stopSearchingForUnconfiguredAccessories]( self->_airportAssistantManager,  "stopSearchingForUnconfiguredAccessories");
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[AirPortAssistantManager airportAssistantController]( self->_airportAssistantManager,  "airportAssistantController"));
    [v6 configureUIViewControllerWithParameters:v5];

    -[WACUIViewController updateState:](self, "updateState:", 3LL);
    id v7 = objc_alloc(&OBJC_CLASS___AirPortAssistantUINavigationController);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[AirPortAssistantManager airportAssistantController]( self->_airportAssistantManager,  "airportAssistantController"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 viewController]);
    v10 = -[AirPortAssistantUINavigationController initWithRootViewController:](v7, "initWithRootViewController:", v9);
    nav = self->_nav;
    self->_nav = v10;

    -[AirPortAssistantUINavigationController setModalInPresentation:](self->_nav, "setModalInPresentation:", 1LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WACUIViewController nav](self, "nav"));
    -[WACUIViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v12,  0LL,  0LL);
  }
}

- (AirPortAssistantUINavigationController)nav
{
  return (AirPortAssistantUINavigationController *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setNav:(id)a3
{
}

- (AirPortAssistantManager)airportAssistantManager
{
  return (AirPortAssistantManager *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAirportAssistantManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end