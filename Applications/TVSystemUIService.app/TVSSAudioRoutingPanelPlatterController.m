@interface TVSSAudioRoutingPanelPlatterController
- (BOOL)allowAnimatedUpdates;
- (MRNowPlayingAudioFormatController)audioFormatController;
- (NSArray)volumeEligibleRouteIDs;
- (NSDictionary)routesByIdentifier;
- (PBSSuppressHeadphoneBulletinAssertion)suppressBulletinAssertion;
- (PBSVolumeButtonEventAssertion)volumeButtonAssertion;
- (PBSVolumeHUDAssertion)volumeHUDAssertion;
- (TVCSAudioRoutingController)audioRoutingController;
- (TVSSAudioRoute)focusedRoute;
- (TVSSAudioRoutingPanelPlatterController)initWithAudioRoutingController:(id)a3;
- (void)_acquireVolumeButtonAssertion;
- (void)_acquireVolumeHUDAssertion;
- (void)_relinquishVolumeButtonAssertion;
- (void)_relinquishVolumeHUDAssertion;
- (void)_updateHeaderWithAudioFormat;
- (void)_updatePanelWithRoutes:(id)a3;
- (void)_updateVolumeRendererForRoute:(id)a3;
- (void)audioRoutingController:(id)a3 didUpdateAvailableRoutes:(id)a4;
- (void)audioRoutingController:(id)a3 routeDidUpdate:(id)a4 withChangedProperties:(id)a5;
- (void)dealloc;
- (void)didPressMute:(id)a3;
- (void)handleVolumeDown;
- (void)handleVolumeUp;
- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4;
- (void)platterControllerDidActivate;
- (void)rendererGainedFocus:(id)a3;
- (void)rendererLostFocus:(id)a3;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)rendererWasUpdated:(id)a3;
- (void)setAllowAnimatedUpdates:(BOOL)a3;
- (void)setAudioFormatController:(id)a3;
- (void)setAudioRoutingController:(id)a3;
- (void)setFocusedRoute:(id)a3;
- (void)setRoutesByIdentifier:(id)a3;
- (void)setVolumeButtonAssertion:(id)a3;
- (void)setVolumeEligibleRouteIDs:(id)a3;
- (void)setVolumeHUDAssertion:(id)a3;
@end

@implementation TVSSAudioRoutingPanelPlatterController

- (TVSSAudioRoutingPanelPlatterController)initWithAudioRoutingController:(id)a3
{
  id v64 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v47 = -[TVSSAudioFormatHeader initWithFormat:]( objc_alloc(&OBJC_CLASS___TVSSAudioFormatHeader),  "initWithFormat:",  0LL);
  v46 =  +[TVSSAudioRoutingHeaderRenderer rendererWithIdentifier:header:]( &OBJC_CLASS___TVSSAudioRoutingHeaderRenderer,  "rendererWithIdentifier:header:",  @"title",  v47);
  v66[0] = v46;
  v45 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"separator",  19LL,  0LL);
  v66[1] = v45;
  id v44 = TVSSLocString(@"TVSSAudioRoutingHeadphonesTitle");
  v43 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v42 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"headphones",  3LL);
  v66[2] = v42;
  id v41 = TVSSLocString(@"TVSSAudioRoutingSpeakersTitle");
  v40 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
  v39 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  @"speakers",  3LL);
  v66[3] = v39;
  id v62 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 4LL);

  v38 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"title");
  v65[0] = v38;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v37 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", v3);
  v65[1] = v37;
  id v36 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"separator");
  v65[2] = v36;
  +[TVSPConstants topSpacerHeight](&OBJC_CLASS___TVSPConstants, "topSpacerHeight");
  id v35 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:", v4);
  v65[3] = v35;
  id v61 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 4LL);

  id v60 =  +[TVSPLayout layoutWithRows:sizeProviders:]( &OBJC_CLASS___TVSPLayout,  "layoutWithRows:sizeProviders:",  v61,  v62);
  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(void *)&__int128 v34 = v5;
  *((void *)&v34 + 1) = v6;
  __int128 v58 = v34;
  *(void *)&__int128 v59 = v7;
  *((void *)&v59 + 1) = v8;
  __int128 v56 = v34;
  __int128 v57 = v59;
  objc_msgSend(v60, "setContentInsets:", v34, v59);
  id v9 = v64;
  id v64 = 0LL;
  v55.receiver = v9;
  v55.super_class = (Class)&OBJC_CLASS___TVSSAudioRoutingPanelPlatterController;
  id v64 = -[TVSSAudioRoutingPanelPlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v55,  "initWithIdentifier:layout:renderers:rendererProvider:",  @"Audio",  v60,  v62,  0LL);
  objc_storeStrong(&v64, v64);
  if (v64)
  {
    objc_initWeak(&from, v64);
    id v33 = v64;
    v48 = _NSConcreteStackBlock;
    int v49 = -1073741824;
    int v50 = 0;
    v51 = sub_100027D08;
    v52 = &unk_1001B6940;
    objc_copyWeak(&v53, &from);
    [v33 setRendererProvider:&v48];
    objc_storeStrong((id *)v64 + 2, location[0]);
    [*((id *)v64 + 2) addObserver:v64];
    v32 = objc_alloc_init(&OBJC_CLASS___MRNowPlayingAudioFormatController);
    v10 = (void *)*((void *)v64 + 3);
    *((void *)v64 + 3) = v32;

    [*((id *)v64 + 3) setDelegate:v64];
    id v31 = v64;
    id v30 = [*((id *)v64 + 2) availableRoutes];
    objc_msgSend(v31, "_updatePanelWithRoutes:");

    v29 = objc_alloc(&OBJC_CLASS___PBSVolumeButtonEventAssertion);
    aClass = (objc_class *)objc_opt_class(v64);
    v26 = NSStringFromClass(aClass);
    v27 = -[PBSVolumeButtonEventAssertion initWithIdentifier:](v29, "initWithIdentifier:");
    v11 = (void *)*((void *)v64 + 5);
    *((void *)v64 + 5) = v27;

    v25 = objc_alloc(&OBJC_CLASS___PBSVolumeHUDAssertion);
    v24 = (objc_class *)objc_opt_class(v64);
    v22 = NSStringFromClass(v24);
    v23 = -[PBSVolumeHUDAssertion initWithIdentifier:](v25, "initWithIdentifier:");
    v12 = (void *)*((void *)v64 + 6);
    *((void *)v64 + 6) = v23;

    v21 = objc_alloc(&OBJC_CLASS___PBSSuppressHeadphoneBulletinAssertion);
    v20 = (objc_class *)objc_opt_class(v64);
    v18 = NSStringFromClass(v20);
    v19 = -[PBSSuppressHeadphoneBulletinAssertion initWithIdentifier:](v21, "initWithIdentifier:");
    v13 = (void *)*((void *)v64 + 9);
    *((void *)v64 + 9) = v19;

    [*((id *)v64 + 9) acquire];
    v17 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v17,  "addObserver:selector:name:object:",  v64,  "handleVolumeUp",  _UIApplicationVolumeUpButtonUpNotification,  0LL);

    v16 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v16,  "addObserver:selector:name:object:",  v64,  "handleVolumeDown",  _UIApplicationVolumeDownButtonUpNotification,  0LL);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&from);
  }

  v15 = (TVSSAudioRoutingPanelPlatterController *)v64;
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v64, 0LL);
  return v15;
}

- (void)platterControllerDidActivate
{
  double v4 = self;
  v3[1] = (id)a2;
  -[TVSSAudioRoutingPanelPlatterController setAllowAnimatedUpdates:](self, "setAllowAnimatedUpdates:", 1LL);
  v3[0] = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "didPressMute:");
  [v3[0] setAllowedPressTypes:&off_1001C8558];
  id v2 = -[TVSSAudioRoutingPanelPlatterController contentView](v4, "contentView");
  [v2 addGestureRecognizer:v3[0]];

  objc_storeStrong(v3, 0LL);
}

- (void)dealloc
{
  double v4 = self;
  SEL v3 = a2;
  -[TVCSAudioRoutingController removeObserver:](self->_audioRoutingController, "removeObserver:", self);
  -[TVSSAudioRoutingPanelPlatterController _relinquishVolumeButtonAssertion](v4, "_relinquishVolumeButtonAssertion");
  -[TVSSAudioRoutingPanelPlatterController _relinquishVolumeHUDAssertion](v4, "_relinquishVolumeHUDAssertion");
  -[PBSSuppressHeadphoneBulletinAssertion relinquish](v4->_suppressBulletinAssertion, "relinquish");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSAudioRoutingPanelPlatterController;
  -[TVSSAudioRoutingPanelPlatterController dealloc](&v2, "dealloc");
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  v14.receiver = v17;
  v14.super_class = (Class)&OBJC_CLASS___TVSSAudioRoutingPanelPlatterController;
  -[TVSSAudioRoutingPanelPlatterController rendererWasSelected:context:]( &v14,  "rendererWasSelected:context:",  location[0],  v15);
  v10 = -[TVSSAudioRoutingPanelPlatterController routesByIdentifier](v17, "routesByIdentifier");
  id v9 = [location[0] identifier];
  id v13 = -[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:");

  id v12 = [v13 route];
  if (v13 && v12)
  {
    if ([v12 selectionState] == (id)1)
    {
      uint64_t v7 = -[TVSSAudioRoutingPanelPlatterController audioRoutingController](v17, "audioRoutingController");
      id v20 = v12;
      uint64_t v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL);
      -[TVCSAudioRoutingController deselectAudioRoutes:](v7, "deselectAudioRoutes:");
    }

    else
    {
      uint64_t v5 = -[TVSSAudioRoutingPanelPlatterController audioRoutingController](v17, "audioRoutingController");
      id v19 = v12;
      double v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL);
      -[TVCSAudioRoutingController selectAudioRoutes:](v5, "selectAudioRoutes:");
    }
  }

  else
  {
    os_log_t oslog = (os_log_t)AudioRoutingLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      sub_100028588((uint64_t)v18, (uint64_t)location[0], (uint64_t)v13, (uint64_t)v12);
      _os_log_fault_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_FAULT,  "Unexpected state in rendererWasSelected. Renderer=%@ Route=%@ TVCSAudioRoute=%@",  v18,  0x20u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)rendererWasUpdated:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = [location[0] identifier];
  if ([v10 hasPrefix:@"Volume-"])
  {
    id v9 = objc_msgSend(v10, "substringFromIndex:", objc_msgSend(@"Volume-", "length"));
    SEL v3 = -[TVSSAudioRoutingPanelPlatterController routesByIdentifier](v12, "routesByIdentifier");
    id v8 = -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v9);

    id v7 = [location[0] content];
    id v6 = [v8 route];
    id v5 = [v6 volume];
    id v4 = [v7 contentPercentage];
    objc_msgSend(v5, "setVolumeLevel:");

    objc_storeStrong(&v7, 0LL);
    objc_storeStrong(&v8, 0LL);
    objc_storeStrong(&v9, 0LL);
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)rendererGainedFocus:(id)a3
{
  objc_super v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = [location[0] identifier];
  char v11 = [v12 hasPrefix:@"Volume-"] & 1;
  char v8 = 0;
  if (v11)
  {
    id v9 = objc_msgSend(v12, "substringFromIndex:", objc_msgSend(@"Volume-", "length"));
    char v8 = 1;
    id v3 = v9;
  }

  else
  {
    id v3 = v12;
  }

  id v10 = v3;
  if ((v8 & 1) != 0) {

  }
  id v4 = -[TVSSAudioRoutingPanelPlatterController routesByIdentifier](v14, "routesByIdentifier");
  id obj = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v10);

  objc_storeStrong((id *)&v14->_focusedRoute, obj);
  id v5 = -[TVSSAudioRoutingPanelPlatterController volumeEligibleRouteIDs](v14, "volumeEligibleRouteIDs");
  unsigned __int8 v6 = -[NSArray containsObject:](v5, "containsObject:", v10);

  if ((v6 & 1) != 0) {
    -[TVSSAudioRoutingPanelPlatterController _acquireVolumeButtonAssertion](v14, "_acquireVolumeButtonAssertion");
  }
  objc_storeStrong(&obj, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)rendererLostFocus:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = [location[0] identifier];
  char v9 = [v10 hasPrefix:@"Volume-"] & 1;
  char v6 = 0;
  if (v9)
  {
    id v7 = objc_msgSend(v10, "substringFromIndex:", objc_msgSend(@"Volume-", "length"));
    char v6 = 1;
    id v3 = v7;
  }

  else
  {
    id v3 = v10;
  }

  id v8 = v3;
  if ((v6 & 1) != 0) {

  }
  objc_storeStrong((id *)&v12->_focusedRoute, 0LL);
  id v4 = -[TVSSAudioRoutingPanelPlatterController volumeEligibleRouteIDs](v12, "volumeEligibleRouteIDs");
  unsigned __int8 v5 = -[NSArray containsObject:](v4, "containsObject:", v8);

  if ((v5 & 1) != 0) {
    -[TVSSAudioRoutingPanelPlatterController _relinquishVolumeButtonAssertion](v12, "_relinquishVolumeButtonAssertion");
  }
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)handleVolumeUp
{
  id v10 = self;
  location[1] = (id)a2;
  id v8 = -[TVSSAudioRoute route](self->_focusedRoute, "route");
  id v7 = -[TVCSAudioRoute volume](v8, "volume");
  location[0] = [v7 volumeLevel];

  [location[0] floatValue];
  if (v2 + 0.0625 >= 1.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = v2 + 0.0625;
  }
  unsigned __int8 v5 = -[TVSSAudioRoute route](v10->_focusedRoute, "route");
  id v4 = -[TVCSAudioRoute volume](v5, "volume");
  id v3 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6);
  objc_msgSend(v4, "setVolumeLevel:");

  objc_storeStrong(location, 0LL);
}

- (void)handleVolumeDown
{
  id v10 = self;
  location[1] = (id)a2;
  id v8 = -[TVSSAudioRoute route](self->_focusedRoute, "route");
  id v7 = -[TVCSAudioRoute volume](v8, "volume");
  location[0] = [v7 volumeLevel];

  [location[0] floatValue];
  if (v2 - 0.0625 >= 0.0) {
    double v6 = v2 - 0.0625;
  }
  else {
    double v6 = 0.0;
  }
  unsigned __int8 v5 = -[TVSSAudioRoute route](v10->_focusedRoute, "route");
  id v4 = -[TVCSAudioRoute volume](v5, "volume");
  id v3 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6);
  objc_msgSend(v4, "setVolumeLevel:");

  objc_storeStrong(location, 0LL);
}

- (void)didPressMute:(id)a3
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] state] == (id)3)
  {
    id v4 = -[TVSSAudioRoute route](v9->_focusedRoute, "route");
    id v3 = -[TVCSAudioRoute volume](v4, "volume");
    unsigned __int8 v5 = [v3 isMuted];

    id v7 = -[TVSSAudioRoute route](v9->_focusedRoute, "route");
    id v6 = -[TVCSAudioRoute volume](v7, "volume");
    [v6 setMuted:!(v5 & 1)];
  }

  objc_storeStrong(location, 0LL);
}

- (void)audioRoutingController:(id)a3 didUpdateAvailableRoutes:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = sub_10002905C;
  id v10 = &unk_1001B61C0;
  char v11 = v15;
  id v12 = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)audioRoutingController:(id)a3 routeDidUpdate:(id)a4 withChangedProperties:(id)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  if ([v13 containsObject:@"selectionState"])
  {
    char v9 = v16;
    id v10 = [location[0] availableRoutes];
    -[TVSSAudioRoutingPanelPlatterController _updatePanelWithRoutes:](v9, "_updatePanelWithRoutes:");

    -[TVSSAudioRoutingPanelPlatterController _updateHeaderWithAudioFormat](v16, "_updateHeaderWithAudioFormat");
  }

  else if ([v13 containsObject:@"volume"])
  {
    int v7 = v16;
    id v8 = -[TVCSAudioRoutingController availableRoutes](v16->_audioRoutingController, "availableRoutes");
    -[TVSSAudioRoutingPanelPlatterController _updatePanelWithRoutes:](v7, "_updatePanelWithRoutes:");

    -[TVSSAudioRoutingPanelPlatterController _updateVolumeRendererForRoute:](v16, "_updateVolumeRendererForRoute:", v14);
  }

  else if ([v13 containsObject:@"nowPlayingInfo"])
  {
    unsigned __int8 v5 = v16;
    id v6 = -[TVCSAudioRoutingController availableRoutes](v16->_audioRoutingController, "availableRoutes");
    -[TVSSAudioRoutingPanelPlatterController _updatePanelWithRoutes:](v5, "_updatePanelWithRoutes:");

    -[TVSSAudioRoutingPanelPlatterController _updateHeaderWithAudioFormat](v16, "_updateHeaderWithAudioFormat");
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)nowPlayingAudioFormatController:(id)a3 didChangeAudioFormatContentInfo:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = sub_100029364;
  id v10 = &unk_1001B5A60;
  char v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateHeaderWithAudioFormat
{
  v38 = self;
  SEL v37 = a2;
  char v36 = 0;
  char v35 = 0;
  BOOL v34 = 0;
  memset(__b, 0, sizeof(__b));
  v23 = -[TVSSAudioRoutingPanelPlatterController routesByIdentifier](v38, "routesByIdentifier");
  id obj = -[NSDictionary allValues](v23, "allValues");

  id v25 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v42,  16LL);
  if (v25)
  {
    uint64_t v20 = *(void *)__b[2];
    uint64_t v21 = 0LL;
    id v22 = v25;
    while (1)
    {
      uint64_t v19 = v21;
      if (*(void *)__b[2] != v20) {
        objc_enumerationMutation(obj);
      }
      id v33 = *(id *)(__b[1] + 8 * v21);
      id v17 = [v33 route];
      unsigned __int8 v18 = [v17 isLocal];

      if ((v18 & 1) != 0)
      {
        id v13 = [v33 route];
        char v36 = [v13 isHomeTheaterRoute] & 1;

        id v14 = [v33 route];
        char v35 = [v14 supportsHomeTheaterAtmos] & 1;

        id v16 = [v33 route];
        id v15 = [v16 nowPlayingInfo];
        BOOL v34 = [v15 playbackState] != 0;
      }

      ++v21;
      if (v19 + 1 >= (unint64_t)v22)
      {
        uint64_t v21 = 0LL;
        id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v42,  16LL);
        if (!v22) {
          break;
        }
      }
    }
  }

  id v31 =  -[MRNowPlayingAudioFormatController audioFormatContentInfo]( v38->_audioFormatController,  "audioFormatContentInfo");
  id v30 = [v31 audioFormatDescription];
  uint64_t v29 = 0LL;
  if (v34)
  {
    if ((v36 & 1) != 0)
    {
      uint64_t v29 = (uint64_t)[v31 bestAvailableAudioFormat];
      if (v29 == 2 && (v35 & 1) == 0) {
        uint64_t v29 = 1LL;
      }
    }

    else
    {
      id v11 = (id)MRNowPlayingBestAvailableAudioFormatDescription(1LL);
      unsigned __int8 v12 = objc_msgSend(v30, "containsString:");

      if ((v12 & 1) != 0)
      {
        uint64_t v29 = 1LL;
      }

      else
      {
        id v9 = (id)MRNowPlayingBestAvailableAudioFormatDescription(2LL);
        unsigned __int8 v10 = objc_msgSend(v30, "containsString:");

        if ((v10 & 1) != 0) {
          uint64_t v29 = 2LL;
        }
      }
    }
  }

  os_log_t oslog = (os_log_t)AudioRoutingLog();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v7 = type;
    id v8 = (id)MRNowPlayingBestAvailableAudioFormatDescription(v29);
    id v26 = v8;
    sub_10001AEB8((uint64_t)v41, (uint64_t)v26);
    _os_log_impl((void *)&_mh_execute_header, log, v7, "Determined current audio format: %{public}@", v41, 0xCu);

    objc_storeStrong(&v26, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  id v3 = v38;
  v39 = @"title";
  float v2 = objc_alloc(&OBJC_CLASS___TVSSAudioFormatHeader);
  unsigned __int8 v5 = -[TVSSAudioFormatHeader initWithFormat:](v2, "initWithFormat:", v29);
  v40 = v5;
  id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL);
  -[TVSSAudioRoutingPanelPlatterController applyContent:](v3, "applyContent:");

  -[TVSSAudioRoutingPanelPlatterController reloadContent](v38, "reloadContent");
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
}

- (void)_updatePanelWithRoutes:(id)a3
{
  v121 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v119 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v118 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v75 = v119;
  v76 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"title");
  objc_msgSend(v75, "addObject:");

  id v77 = v119;
  +[TVSPConstants titleVerticalPadding](&OBJC_CLASS___TVSPConstants, "titleVerticalPadding");
  id v78 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  objc_msgSend(v77, "addObject:");

  id v79 = v119;
  id v80 = +[TVSPRow separatorWithIdentifier:](&OBJC_CLASS___TVSPRow, "separatorWithIdentifier:", @"separator");
  objc_msgSend(v79, "addObject:");

  id v81 = v119;
  +[TVSPConstants topSpacerHeight](&OBJC_CLASS___TVSPConstants, "topSpacerHeight");
  id v82 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  objc_msgSend(v81, "addObject:");

  v117 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v116 = 0LL;
  id v115 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v114 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  int v113 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v84 = [obj countByEnumeratingWithState:__b objects:v124 count:16];
  if (v84)
  {
    uint64_t v72 = *(void *)__b[2];
    uint64_t v73 = 0LL;
    id v74 = v84;
    while (1)
    {
      uint64_t v71 = v73;
      if (*(void *)__b[2] != v72) {
        objc_enumerationMutation(obj);
      }
      id v112 = *(id *)(__b[1] + 8 * v73);
      id v110 = -[TVSSAudioRoute initWithRoute:](objc_alloc(&OBJC_CLASS___TVSSAudioRoute), "initWithRoute:", v112);
      id v109 = [v112 routeUID];
      -[NSMutableDictionary setObject:forKeyedSubscript:](v117, "setObject:forKeyedSubscript:", v110, v109);
      if ([v112 isLocal])
      {
        objc_storeStrong(&v116, v110);
      }

      else if ([v112 deviceType] == (id)4)
      {
        [v115 addObject:v110];
      }

      else
      {
        [v114 addObject:v110];
      }

      if ([v112 selectionState] == (id)1) {
        ++v113;
      }
      objc_storeStrong(&v109, 0LL);
      objc_storeStrong(&v110, 0LL);
      ++v73;
      if (v71 + 1 >= (unint64_t)v74)
      {
        uint64_t v73 = 0LL;
        id v74 = [obj countByEnumeratingWithState:__b objects:v124 count:16];
        if (!v74) {
          break;
        }
      }
    }
  }

  BOOL v108 = v113 > 1;
  if (v116)
  {
    id v107 = [v116 route];
    id v67 = v119;
    id v69 = [v107 routeUID];
    v68 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:");
    objc_msgSend(v67, "addObject:");

    char v105 = 0;
    BOOL v70 = 0;
    if ([v107 selectionState] == (id)1)
    {
      id v106 = [v107 volume];
      char v105 = 1;
      BOOL v70 = 0;
    }

    if ((v105 & 1) != 0) {

    }
    if (v70)
    {
      id v61 = v119;
      id v64 = [v107 routeUID];
      v63 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"Volume-",  v64);
      +[TVSPConstants volumeControlRowHeight](&OBJC_CLASS___TVSPConstants, "volumeControlRowHeight");
      id v62 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", v63);
      objc_msgSend(v61, "addObject:");

      id v65 = v118;
      id v66 = [v107 routeUID];
      objc_msgSend(v65, "addObject:");
    }

    objc_storeStrong(&v107, 0LL);
  }

  if ([v115 count])
  {
    id v53 = v119;
    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v54 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    objc_msgSend(v53, "addObject:");

    id v55 = v119;
    __int128 v56 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"headphones");
    objc_msgSend(v55, "addObject:");

    id v57 = v119;
    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v58 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    objc_msgSend(v57, "addObject:");

    memset(v103, 0, sizeof(v103));
    id v59 = v115;
    id v60 = [v59 countByEnumeratingWithState:v103 objects:v123 count:16];
    if (v60)
    {
      uint64_t v50 = *(void *)v103[2];
      uint64_t v51 = 0LL;
      id v52 = v60;
      while (1)
      {
        uint64_t v49 = v51;
        if (*(void *)v103[2] != v50) {
          objc_enumerationMutation(v59);
        }
        id v104 = *(id *)(v103[1] + 8 * v51);
        id v102 = [v104 route];
        id v45 = v119;
        id v47 = [v102 routeUID];
        v46 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:");
        objc_msgSend(v45, "addObject:");

        char v100 = 0;
        BOOL v48 = 0;
        if ([v102 selectionState] == (id)1)
        {
          id v101 = [v102 volume];
          char v100 = 1;
          BOOL v48 = 0;
        }

        if ((v100 & 1) != 0) {

        }
        if (v48)
        {
          id v39 = v119;
          id v42 = [v102 routeUID];
          id v41 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"Volume-",  v42);
          +[TVSPConstants volumeControlRowHeight](&OBJC_CLASS___TVSPConstants, "volumeControlRowHeight");
          v40 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", v41);
          objc_msgSend(v39, "addObject:");

          id v43 = v118;
          id v44 = [v102 routeUID];
          objc_msgSend(v43, "addObject:");
        }

        objc_storeStrong(&v102, 0LL);
        ++v51;
        if (v49 + 1 >= (unint64_t)v52)
        {
          uint64_t v51 = 0LL;
          id v52 = [v59 countByEnumeratingWithState:v103 objects:v123 count:16];
          if (!v52) {
            break;
          }
        }
      }
    }
  }

  if ([v114 count])
  {
    id v31 = v119;
    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v32 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    objc_msgSend(v31, "addObject:");

    id v33 = v119;
    BOOL v34 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:", @"speakers");
    objc_msgSend(v33, "addObject:");

    id v35 = v119;
    +[TVSPConstants subtitleVerticalPadding](&OBJC_CLASS___TVSPConstants, "subtitleVerticalPadding");
    id v36 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
    objc_msgSend(v35, "addObject:");

    memset(v98, 0, sizeof(v98));
    id v37 = v114;
    id v38 = [v37 countByEnumeratingWithState:v98 objects:v122 count:16];
    if (v38)
    {
      uint64_t v28 = *(void *)v98[2];
      uint64_t v29 = 0LL;
      id v30 = v38;
      while (1)
      {
        uint64_t v27 = v29;
        if (*(void *)v98[2] != v28) {
          objc_enumerationMutation(v37);
        }
        id v99 = *(id *)(v98[1] + 8 * v29);
        id v97 = [v99 route];
        id v23 = v119;
        id v25 = [v97 routeUID];
        v24 = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:");
        objc_msgSend(v23, "addObject:");

        char v95 = 0;
        BOOL v26 = 0;
        if ([v97 selectionState] == (id)1)
        {
          id v96 = [v97 volume];
          char v95 = 1;
          BOOL v26 = 0;
        }

        if ((v95 & 1) != 0) {

        }
        if (v26)
        {
          id v17 = v119;
          id v20 = [v97 routeUID];
          uint64_t v19 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"Volume-",  v20);
          +[TVSPConstants volumeControlRowHeight](&OBJC_CLASS___TVSPConstants, "volumeControlRowHeight");
          unsigned __int8 v18 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:", v19);
          objc_msgSend(v17, "addObject:");

          id v21 = v118;
          id v22 = [v97 routeUID];
          objc_msgSend(v21, "addObject:");
        }

        objc_storeStrong(&v97, 0LL);
        ++v29;
        if (v27 + 1 >= (unint64_t)v30)
        {
          uint64_t v29 = 0LL;
          id v30 = [v37 countByEnumeratingWithState:v98 objects:v122 count:16];
          if (!v30) {
            break;
          }
        }
      }
    }
  }

  -[TVSSAudioRoutingPanelPlatterController setRoutesByIdentifier:](v121, "setRoutesByIdentifier:", v117);
  -[TVSSAudioRoutingPanelPlatterController setVolumeEligibleRouteIDs:](v121, "setVolumeEligibleRouteIDs:", v118);
  id v15 = -[TVSSAudioRoutingPanelPlatterController volumeEligibleRouteIDs](v121, "volumeEligibleRouteIDs");
  BOOL v16 = -[NSArray count](v15, "count") == 0;

  if (v16)
  {
    if (!v108)
    {
      -[TVSSAudioRoutingPanelPlatterController _relinquishVolumeButtonAssertion]( v121,  "_relinquishVolumeButtonAssertion");
      -[TVSSAudioRoutingPanelPlatterController _relinquishVolumeHUDAssertion](v121, "_relinquishVolumeHUDAssertion");
    }
  }

  else
  {
    -[TVSSAudioRoutingPanelPlatterController _acquireVolumeHUDAssertion](v121, "_acquireVolumeHUDAssertion");
    id v13 = -[TVSSAudioRoutingPanelPlatterController volumeEligibleRouteIDs](v121, "volumeEligibleRouteIDs");
    unsigned __int8 v12 = -[TVSSAudioRoutingPanelPlatterController focusedRoute](v121, "focusedRoute");
    id v11 = -[TVSSAudioRoute route](v12, "route");
    id v10 = -[TVCSAudioRoute routeUID](v11, "routeUID");
    unsigned __int8 v14 = -[NSArray containsObject:](v13, "containsObject:");

    if ((v14 & 1) != 0)
    {
      -[TVSSAudioRoutingPanelPlatterController _relinquishVolumeButtonAssertion]( v121,  "_relinquishVolumeButtonAssertion");
      -[TVSSAudioRoutingPanelPlatterController _acquireVolumeButtonAssertion](v121, "_acquireVolumeButtonAssertion");
    }
  }

  id v8 = v119;
  id v9 = -[TVSSAudioRoutingPanelPlatterController renderers](v121, "renderers");
  v94 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v8);

  +[TVSPConstants defaultTitleLayoutContentInsets](&OBJC_CLASS___TVSPConstants, "defaultTitleLayoutContentInsets");
  *(double *)&__int128 v92 = v3;
  *((double *)&v92 + 1) = v4;
  *(double *)&__int128 v93 = v5;
  *((double *)&v93 + 1) = v6;
  __int128 v90 = v92;
  __int128 v91 = v93;
  -[TVSPLayout setContentInsets:](v94, "setContentInsets:", v3, v4, v5, v6);
  char v87 = 0;
  char v85 = 0;
  if (-[TVSSAudioRoutingPanelPlatterController allowAnimatedUpdates](v121, "allowAnimatedUpdates"))
  {
    id v88 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    char v87 = 1;
    id v7 = v88;
  }

  else
  {
    id v86 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
    char v85 = 1;
    id v7 = v86;
  }

  id v89 = v7;
  if ((v85 & 1) != 0) {

  }
  if ((v87 & 1) != 0) {
  -[TVSSAudioRoutingPanelPlatterController applyLayout:animator:](v121, "applyLayout:animator:", v94, v89);
  }
  -[TVSSAudioRoutingPanelPlatterController reloadContent](v121, "reloadContent");
  -[TVSSAudioRoutingPanelPlatterController applyContent:](v121, "applyContent:", v117);
  -[TVSSAudioRoutingPanelPlatterController _updatePlatterSizeWithAnimator:]( v121,  "_updatePlatterSizeWithAnimator:",  v89);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong((id *)&v94, 0LL);
  objc_storeStrong(&v114, 0LL);
  objc_storeStrong(&v115, 0LL);
  objc_storeStrong(&v116, 0LL);
  objc_storeStrong((id *)&v117, 0LL);
  objc_storeStrong(&v118, 0LL);
  objc_storeStrong(&v119, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateVolumeRendererForRoute:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  for (char i = 1; (i & 1) != 0; char i = 0)
  {
    id v12 = [location[0] volume];
    id v14 = [v12 volumeLevel];

    while (1)
    {
      char v11 = 0;
      if (v14) {
        char v11 = i;
      }
      if ((v11 & 1) == 0) {
        break;
      }
      id v3 = [location[0] routeUID];
      id v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"Volume-",  v3);

      double v4 = v17;
      id v20 = v13;
      id v9 = +[TVSPIdentifiers percentageID](&OBJC_CLASS___TVSPIdentifiers, "percentageID");
      id v18 = v9;
      id v19 = v14;
      id v8 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18);
      id v7 = +[TVSPContent contentWithDictionary:](&OBJC_CLASS___TVSPContent, "contentWithDictionary:");
      id v21 = v7;
      double v6 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL);
      id v5 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
      -[TVSSAudioRoutingPanelPlatterController applyContent:animator:](v4, "applyContent:animator:", v6);

      id v10 = -[TVSSAudioRoutingPanelPlatterController rendererForIdentifier:](v17, "rendererForIdentifier:", v13);
      [v10 contentDidChange];

      objc_storeStrong((id *)&v13, 0LL);
      char i = 0;
    }

    objc_storeStrong(&v14, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_acquireVolumeButtonAssertion
{
}

- (void)_relinquishVolumeButtonAssertion
{
}

- (void)_acquireVolumeHUDAssertion
{
}

- (void)_relinquishVolumeHUDAssertion
{
}

- (TVCSAudioRoutingController)audioRoutingController
{
  return self->_audioRoutingController;
}

- (void)setAudioRoutingController:(id)a3
{
}

- (MRNowPlayingAudioFormatController)audioFormatController
{
  return self->_audioFormatController;
}

- (void)setAudioFormatController:(id)a3
{
}

- (NSDictionary)routesByIdentifier
{
  return self->_routesByIdentifier;
}

- (void)setRoutesByIdentifier:(id)a3
{
}

- (PBSVolumeButtonEventAssertion)volumeButtonAssertion
{
  return self->_volumeButtonAssertion;
}

- (void)setVolumeButtonAssertion:(id)a3
{
}

- (PBSVolumeHUDAssertion)volumeHUDAssertion
{
  return self->_volumeHUDAssertion;
}

- (void)setVolumeHUDAssertion:(id)a3
{
}

- (TVSSAudioRoute)focusedRoute
{
  return self->_focusedRoute;
}

- (void)setFocusedRoute:(id)a3
{
}

- (NSArray)volumeEligibleRouteIDs
{
  return self->_volumeEligibleRouteIDs;
}

- (void)setVolumeEligibleRouteIDs:(id)a3
{
}

- (BOOL)allowAnimatedUpdates
{
  return self->_allowAnimatedUpdates;
}

- (void)setAllowAnimatedUpdates:(BOOL)a3
{
  self->_allowAnimatedUpdates = a3;
}

- (PBSSuppressHeadphoneBulletinAssertion)suppressBulletinAssertion
{
  return self->_suppressBulletinAssertion;
}

- (void).cxx_destruct
{
}

@end