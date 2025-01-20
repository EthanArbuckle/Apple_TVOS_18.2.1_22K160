@interface TVNPAirPlayRoutingModule
+ (id)availableStyles;
- (BOOL)hasActiveOutput;
- (TVNPAirPlayRoutingModule)init;
- (TVNPGroupableRoutingController)routingController;
- (TVSMButtonViewController)buttonViewController;
- (TVSMCAPackageView)packageView;
- (id)analyticsActionType;
- (id)analyticsElementInfo;
- (id)contentViewController;
- (id)overlayContentViewController;
- (void)_updateRouteDependentUI;
- (void)dealloc;
- (void)dumpViewController;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setPackageView:(id)a3;
@end

@implementation TVNPAirPlayRoutingModule

+ (id)availableStyles
{
  return &off_52ED8;
}

- (TVNPAirPlayRoutingModule)init
{
  SEL v8 = a2;
  v9 = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVNPAirPlayRoutingModule;
  v6 = -[TVNPAirPlayRoutingModule init](&v7, "init");
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = -[TVNPGroupableRoutingController initWithOutputContextUID:allowsRetargeting:initalFetchCompletion:]( objc_alloc(&OBJC_CLASS___TVNPGroupableRoutingController),  "initWithOutputContextUID:allowsRetargeting:initalFetchCompletion:",  0LL,  1LL);
    routingController = v9->_routingController;
    v9->_routingController = v2;

    -[TVNPGroupableRoutingController addObserver:forKeyPath:options:context:]( v9->_routingController,  "addObserver:forKeyPath:options:context:",  v9,  @"systemOutputRouteName",  4LL,  off_5E9D0);
  }

  v5 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  return v5;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVNPGroupableRoutingController removeObserver:forKeyPath:context:]( self->_routingController,  "removeObserver:forKeyPath:context:",  self,  @"systemOutputRouteName",  off_5E9D0);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVNPAirPlayRoutingModule;
  -[TVNPAirPlayRoutingModule dealloc](&v2, "dealloc");
}

- (void)dumpViewController
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVNPAirPlayRoutingModule;
  -[TVNPAirPlayRoutingModule dumpViewController](&v2, "dumpViewController");
  objc_storeStrong((id *)&v4->_buttonViewController, 0LL);
}

- (TVSMCAPackageView)packageView
{
  if (!self->_packageView)
  {
    v5 = objc_alloc(&OBJC_CLASS___TVSMCAPackageView);
    v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    SEL v3 = -[TVSMCAPackageView initWithPackageName:inBundle:]( v5,  "initWithPackageName:inBundle:",  @"controlcenter_AirPlay_active");
    packageView = self->_packageView;
    self->_packageView = v3;

    objc_super v7 = self->_packageView;
    SEL v8 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:");
    -[TVSMCAPackageView setStateName:forPackageViewState:traitCollection:]( v7,  "setStateName:forPackageViewState:traitCollection:");

    v9 = self->_packageView;
    v10 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:");
    -[TVSMCAPackageView setStateName:forPackageViewState:traitCollection:]( v9,  "setStateName:forPackageViewState:traitCollection:",  @"connected",  1LL);

    v11 = self->_packageView;
    id v13 = (id)TVSMDynamicVibrantBlueColor();
    v12 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  1LL);
    -[TVSMCAPackageView setColorOverride:forPackageViewState:traitCollection:focused:filter:]( v11,  "setColorOverride:forPackageViewState:traitCollection:focused:filter:",  v13,  1LL);

    v14 = self->_packageView;
    id v16 = (id)TVSMDynamicVibrantBlueColor();
    v15 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
    -[TVSMCAPackageView setColorOverride:forPackageViewState:traitCollection:focused:filter:]( v14,  "setColorOverride:forPackageViewState:traitCollection:focused:filter:",  v16,  1LL);

    v17 = self->_packageView;
    id v19 = (id)TVSMDynamicVibrantBlueColor();
    v18 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:",  2LL);
    -[TVSMCAPackageView setColorOverride:forPackageViewState:traitCollection:focused:filter:]( v17,  "setColorOverride:forPackageViewState:traitCollection:focused:filter:",  v19,  1LL);
  }

  return self->_packageView;
}

- (id)contentViewController
{
  if (!self->_buttonViewController)
  {
    objc_super v2 = objc_alloc_init(&OBJC_CLASS___TVSMButtonViewController);
    buttonViewController = self->_buttonViewController;
    self->_buttonViewController = v2;

    -[TVSMButtonViewController setStyle:]( self->_buttonViewController,  "setStyle:",  -[TVNPAirPlayRoutingModule style](self, "style"));
    -[TVSMButtonViewController setImageSymbolName:](self->_buttonViewController, "setImageSymbolName:", 0LL);
    -[TVSMButtonViewController setDelegate:](self->_buttonViewController, "setDelegate:", self);
    -[TVNPAirPlayRoutingModule _updateRouteDependentUI](self, "_updateRouteDependentUI");
  }

  return self->_buttonViewController;
}

- (id)overlayContentViewController
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[TVNPAirPlayRoutingModuleOverlayViewController initWithRoutingController:]( objc_alloc(&OBJC_CLASS___TVNPAirPlayRoutingModuleOverlayViewController),  "initWithRoutingController:",  self->_routingController);
  [v4[0] setDelegate:v5];
  id v3 = v4[0];
  objc_storeStrong(v4, 0LL);
  return v3;
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
  v10 = a6;
  if (a6 == off_5E9D0)
  {
    -[TVNPAirPlayRoutingModule _updateRouteDependentUI](v14, "_updateRouteDependentUI");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVNPAirPlayRoutingModule;
    -[TVNPAirPlayRoutingModule observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateRouteDependentUI
{
  buttonViewController = self->_buttonViewController;
  objc_super v7 = -[TVNPGroupableRoutingController systemOutputRouteName](self->_routingController, "systemOutputRouteName");
  -[TVSMButtonViewController setTitleText:](buttonViewController, "setTitleText:");

  if (-[TVNPGroupableRoutingController numberOfExternalRoutesInLocalDestination]( self->_routingController,  "numberOfExternalRoutesInLocalDestination") <= 0)
  {
    self->_hasActiveOutput = 0;
    objc_super v2 = self->_buttonViewController;
    id v3 = -[TVNPAirPlayRoutingModule iconSymbolName](self, "iconSymbolName");
    -[TVSMButtonViewController setImageSymbolName:](v2, "setImageSymbolName:");

    -[TVSMButtonViewController setCaPackageView:](self->_buttonViewController, "setCaPackageView:");
    objc_storeStrong((id *)&self->_packageView, 0LL);
  }

  else
  {
    self->_hasActiveOutput = 1;
    -[TVSMButtonViewController setImageSymbolName:](self->_buttonViewController, "setImageSymbolName:", 0LL);
    v4 = self->_buttonViewController;
    v5 = -[TVNPAirPlayRoutingModule packageView](self, "packageView");
    -[TVSMButtonViewController setCaPackageView:](v4, "setCaPackageView:");

    -[TVSMCAPackageView setPackageViewState:](self->_packageView, "setPackageViewState:", 1LL);
  }

- (id)analyticsActionType
{
  return TVSMClickAnalyticsActionTypeNavigate;
}

- (id)analyticsElementInfo
{
  uint64_t v4 = TVSMAnalyticsElementTypeControl;
  id v5 = -[TVNPAirPlayRoutingModule style](self, "style");
  if (-[TVNPAirPlayRoutingModule hasActiveOutput](self, "hasActiveOutput")) {
    uint64_t v3 = TVSMAnalyticsElementStateActive;
  }
  else {
    uint64_t v3 = TVSMAnalyticsElementStateInactive;
  }
  return +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  @"audioRouting",  v4,  v5,  v3);
}

- (void)setPackageView:(id)a3
{
}

- (TVSMButtonViewController)buttonViewController
{
  return self->_buttonViewController;
}

- (TVNPGroupableRoutingController)routingController
{
  return self->_routingController;
}

- (BOOL)hasActiveOutput
{
  return self->_hasActiveOutput;
}

- (void).cxx_destruct
{
}

@end