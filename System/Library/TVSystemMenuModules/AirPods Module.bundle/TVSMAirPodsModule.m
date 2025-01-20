@interface TVSMAirPodsModule
+ (id)availableStyles;
- (BOOL)dismissAfterAction;
- (TVNPGroupableRoutingController)routingController;
- (TVSMAirPodsModule)init;
- (TVSMButtonViewController)buttonViewController;
- (TVSMSystemMenuStartupContext)startupContext;
- (id)contentViewController;
- (id)iconSymbolName;
- (id)overlayContentViewController;
- (void)_updateRouteDependentUI;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setRoutingController:(id)a3;
- (void)setStartupContext:(id)a3;
@end

@implementation TVSMAirPodsModule

- (TVSMAirPodsModule)init
{
  SEL v11 = a2;
  v12 = 0LL;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModule;
  v8 = -[TVSMAirPodsModule init](&v10, "init");
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    uint64_t SharedAudioPresentationContext = MRAVOutputContextGetSharedAudioPresentationContext(v8);
    id v9 = (id)MRAVOutputContextGetUniqueIdentifier(SharedAudioPresentationContext);
    v3 = objc_alloc(&OBJC_CLASS___TVNPGroupableRoutingController);
    v4 = -[TVNPGroupableRoutingController initWithOutputContextUID:allowsRetargeting:]( v3,  "initWithOutputContextUID:allowsRetargeting:",  v9,  0LL);
    routingController = v12->_routingController;
    v12->_routingController = v4;

    -[TVNPGroupableRoutingController addObserver:forKeyPath:options:context:]( v12->_routingController,  "addObserver:forKeyPath:options:context:",  v12,  @"currentRoutes",  4LL,  off_5F7A8);
    objc_storeStrong(&v9, 0LL);
  }

  v7 = v12;
  objc_storeStrong((id *)&v12, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVNPGroupableRoutingController removeObserver:forKeyPath:context:]( self->_routingController,  "removeObserver:forKeyPath:context:",  self,  @"currentRoutes",  off_5F7A8);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModule;
  -[TVSMAirPodsModule dealloc](&v2, "dealloc");
}

+ (id)availableStyles
{
  return &off_53480;
}

- (id)iconSymbolName
{
  v6[2] = self;
  v6[1] = (id)a2;
  v4 = -[TVNPGroupableRoutingController currentRoutes](self->_routingController, "currentRoutes");
  id v3 = -[NSArray firstObject](v4, "firstObject");
  v6[0] = [v3 outputDeviceRoute];

  id v5 =  +[MPAVRoutingController _symbolNameForRoute:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolNameForRoute:",  v6[0]);
  objc_storeStrong(v6, 0LL);
  return v5;
}

- (id)contentViewController
{
  if (!self->_buttonViewController)
  {
    objc_super v2 = objc_alloc_init(&OBJC_CLASS___TVSMButtonViewController);
    buttonViewController = self->_buttonViewController;
    self->_buttonViewController = v2;

    -[TVSMButtonViewController setStyle:]( self->_buttonViewController,  "setStyle:",  -[TVSMAirPodsModule style](self, "style"));
    -[TVSMButtonViewController setImageSymbolName:](self->_buttonViewController, "setImageSymbolName:", 0LL);
    -[TVSMButtonViewController setDelegate:](self->_buttonViewController, "setDelegate:", self);
    -[TVSMAirPodsModule _updateRouteDependentUI](self, "_updateRouteDependentUI");
  }

  return self->_buttonViewController;
}

- (BOOL)dismissAfterAction
{
  return 0;
}

- (void)setStartupContext:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_startupContext, location[0]);
  objc_storeStrong(location, 0LL);
}

- (id)overlayContentViewController
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = -[TVSMAirPodsModuleOverlayViewController initWithRouteController:]( objc_alloc(&OBJC_CLASS___TVSMAirPodsModuleOverlayViewController),  "initWithRouteController:",  self->_routingController);
  [v6[0] setDelegate:v7];
  id v3 = v6[0];
  id v4 = -[TVSMSystemMenuStartupContext foregroundApp](v7->_startupContext, "foregroundApp");
  objc_msgSend(v3, "setForegroundAppBundleID:");

  id v5 = v6[0];
  objc_storeStrong(v6, 0LL);
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  objc_super v10 = a6;
  if (a6 == off_5F7A8)
  {
    -[TVSMAirPodsModule _updateRouteDependentUI](v14, "_updateRouteDependentUI");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVSMAirPodsModule;
    -[TVSMAirPodsModule observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateRouteDependentUI
{
  buttonViewController = self->_buttonViewController;
  id v3 = -[TVSMAirPodsModule iconSymbolName](self, "iconSymbolName");
  -[TVSMButtonViewController setImageSymbolName:](buttonViewController, "setImageSymbolName:");
}

- (TVNPGroupableRoutingController)routingController
{
  return self->_routingController;
}

- (void)setRoutingController:(id)a3
{
}

- (TVSMButtonViewController)buttonViewController
{
  return self->_buttonViewController;
}

- (TVSMSystemMenuStartupContext)startupContext
{
  return self->_startupContext;
}

- (void).cxx_destruct
{
}

@end