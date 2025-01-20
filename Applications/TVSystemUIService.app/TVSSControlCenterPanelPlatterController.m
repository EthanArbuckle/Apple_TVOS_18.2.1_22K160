@interface TVSSControlCenterPanelPlatterController
- (BOOL)canFocusRenderer:(id)a3;
- (BOOL)clearPreferredFocusedIdentifier;
- (BOOL)hasFocusedRendererOtherThanCriticalInfo;
- (NSTimer)countdownTimer;
- (TVCSAudioRoutingController)audioRoutingController;
- (TVSPStylingBlockRenderer)airPlayRenderer;
- (TVSSBluetoothController)gameControllersController;
- (TVSSControlCenterPanelPlatterController)initWithIdentifier:(id)a3 presentationContext:(id)a4 sleepTimerController:(id)a5 criticalInfoController:(id)a6 systemOutputDeviceRouteController:(id)a7;
- (TVSSCriticalInfo)criticalInfo;
- (TVSSDoNotDisturbController)doNotDisturbController;
- (TVSSMenuPresentationContext)presentationContext;
- (TVSSNetworkController)networkController;
- (TVSSRestrictionsController)restrictionsController;
- (TVSSScreenRecordingController)screenRecordingController;
- (TVSSSleepTimerController)sleepTimerController;
- (TVSSSystemOutputDeviceRouteController)systemOutputDeviceRouteController;
- (TVSSTapToRadarController)tapToRadarController;
- (id)preferredFocusRendererIdentifier;
- (void)_prewarmAudioRoutingControllerIfNecessary;
- (void)_updateSleepTimerRefreshTimer;
- (void)bluetoothControllerPairedDevicesDidUpdate:(id)a3;
- (void)dealloc;
- (void)networkController:(id)a3 didChangeNetworkState:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)platterControllerDidActivate;
- (void)rendererGainedFocus:(id)a3;
- (void)rendererLostFocus:(id)a3;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
- (void)setAirPlayRenderer:(id)a3;
- (void)setClearPreferredFocusedIdentifier:(BOOL)a3;
- (void)setCountdownTimer:(id)a3;
- (void)setCriticalInfo:(id)a3;
- (void)setHasFocusedRendererOtherThanCriticalInfo:(BOOL)a3;
- (void)setPresentationContext:(id)a3;
- (void)systemOutputDeviceRouteControllerDidChangeOutputDevices:(id)a3;
@end

@implementation TVSSControlCenterPanelPlatterController

- (TVSSControlCenterPanelPlatterController)initWithIdentifier:(id)a3 presentationContext:(id)a4 sleepTimerController:(id)a5 criticalInfoController:(id)a6 systemOutputDeviceRouteController:(id)a7
{
  id v146 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v144 = 0LL;
  objc_storeStrong(&v144, a4);
  id v143 = 0LL;
  objc_storeStrong(&v143, a5);
  id v142 = 0LL;
  objc_storeStrong(&v142, a6);
  id v141 = 0LL;
  objc_storeStrong(&v141, a7);
  objc_storeStrong((id *)v146 + 14, v144);
  v79 = objc_alloc(&OBJC_CLASS___TVSSBluetoothController);
  id v80 =  +[TVSSBluetoothControllerConfiguration gameControllersConfiguration]( &OBJC_CLASS___TVSSBluetoothControllerConfiguration,  "gameControllersConfiguration");
  id v140 = -[TVSSBluetoothController initWithConfiguration:](v79, "initWithConfiguration:");

  id v139 = objc_alloc_init(&OBJC_CLASS___TVSSDoNotDisturbController);
  id v138 = objc_alloc_init(&OBJC_CLASS___TVSSRestrictionsController);
  id v137 = objc_alloc_init(&OBJC_CLASS___TVSSNetworkController);
  id v136 = objc_alloc_init(&OBJC_CLASS___TVSSScreenRecordingController);
  char v135 = [v142 hasCriticalInfo] & 1;
  id v134 = 0LL;
  if (v135)
  {
    id v133 = [v142 criticalInfo];
    [v146 setCriticalInfo:v133];
    v7 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfoRenderer);
    v8 = -[TVSSCriticalInfoRenderer initWithIdentifier:criticalInfo:]( v7,  "initWithIdentifier:criticalInfo:",  @"critical-info",  v133);
    id v9 = v134;
    id v134 = v8;

    objc_storeStrong(&v133, 0LL);
  }

  id v32 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  +[TVSPConstants controlCenterGlyphPointSize](&OBJC_CLASS___TVSPConstants, "controlCenterGlyphPointSize");
  v31 =  +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:weight:scale:",  4LL);
  id v30 =  +[TVSPImageAttribute applyingSymbolConfiguration:]( &OBJC_CLASS___TVSPImageAttribute,  "applyingSymbolConfiguration:");
  id v164 = v30;
  v29 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v164);
  id v132 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v32);

  id v35 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v34 =  +[TVSPLabelAttribute enableMarqueeWhenAncestorFocusedIfLineCountExceedsNumberOfLines:]( &OBJC_CLASS___TVSPLabelAttribute,  "enableMarqueeWhenAncestorFocusedIfLineCountExceedsNumberOfLines:",  2LL);
  id v163 = v34;
  v33 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v163, 1LL);
  id v131 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v35);

  v44 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v43 =  -[NSBundle localizedStringForKey:value:table:]( v44,  "localizedStringForKey:value:table:",  @"TVSSSleepTitle");
  id v42 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"power");
  v41 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v43);
  id v40 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v39 = +[TVSPLabelAttribute textAlignment:](&OBJC_CLASS___TVSPLabelAttribute, "textAlignment:", 1LL);
  id v161 = v39;
  v38 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v161, 1LL);
  v37 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v40);
  v162 = v37;
  v36 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v162, 1LL);
  id v130 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"sleep",  14LL,  v41);

  id v45 = v137;
  id v160 = v132;
  v46 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v160, 1LL);
  id v129 =  +[TVSPStylingBlockRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPStylingBlockRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"wifi",  17LL,  v45);

  id v47 = v129;
  v123 = _NSConcreteStackBlock;
  int v124 = -1073741824;
  int v125 = 0;
  v126 = sub_100097600;
  v127 = &unk_1001B8FB8;
  id v128 = v137;
  [v47 setStylingBlock:&v123];
  v49 = objc_alloc(&OBJC_CLASS___TVSSDoNotDisturbRenderer);
  id v48 = v139;
  v159[0] = v132;
  v159[1] = v131;
  v50 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v159, 2LL);
  id v122 = -[TVSSDoNotDisturbRenderer initWithIdentifier:doNotDisturbControllerer:overrideStylings:]( v49,  "initWithIdentifier:doNotDisturbControllerer:overrideStylings:",  @"dnd",  v48);

  v158[0] = v132;
  v158[1] = v131;
  v51 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v158, 2LL);
  id v121 =  +[TVSPStylingBlockRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPStylingBlockRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"airplay");

  id v52 = v121;
  v115 = _NSConcreteStackBlock;
  int v116 = -1073741824;
  int v117 = 0;
  v118 = sub_1000979E4;
  v119 = &unk_1001B8FB8;
  id v120 = v141;
  [v52 setStylingBlock:&v115];
  [v146 setAirPlayRenderer:v121];
  id v53 = v143;
  v157[0] = v132;
  v157[1] = v131;
  v54 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v157, 2LL);
  id v114 =  +[_TVSSSleepTimerRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS____TVSSSleepTimerRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"sleep-timer",  12LL,  v53);

  id v156 = v132;
  v55 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v156, 1LL);
  id v113 =  +[TVSPStylingBlockRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPStylingBlockRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"game-controllers");

  id v56 = v113;
  v107 = _NSConcreteStackBlock;
  int v108 = -1073741824;
  int v109 = 0;
  v110 = sub_100097C04;
  v111 = &unk_1001B8FB8;
  id v112 = v140;
  [v56 setStylingBlock:&v107];
  id v59 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:", @"accessibility");
  v58 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", 0LL);
  id v155 = v132;
  v57 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v155, 1LL);
  id v106 =  +[TVSPStylingBlockRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPStylingBlockRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"ax",  6LL,  v58);

  [v106 setStylingBlock:&stru_1001B9788];
  id v60 = v138;
  id v154 = v132;
  v61 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v154, 1LL);
  id v105 =  +[TVSPStylingBlockRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPStylingBlockRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"restrictions",  6LL,  v60);

  id v62 = v105;
  v99 = _NSConcreteStackBlock;
  int v100 = -1073741824;
  int v101 = 0;
  v102 = sub_100098264;
  v103 = &unk_1001B8FB8;
  id v104 = v138;
  [v62 setStylingBlock:&v99];
  v67 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v66 =  -[NSBundle localizedStringForKey:value:table:]( v67,  "localizedStringForKey:value:table:",  @"TVSSSearchTitle",  &stru_1001BDAC8,  0LL);
  id v65 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"magnifyingglass");
  v64 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", v66);
  id v153 = v132;
  v63 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v153, 1LL);
  id v98 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"search",  6LL,  v64);

  id v70 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"record.circle");
  v69 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", 0LL);
  id v152 = v132;
  v68 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v152, 1LL);
  id v97 =  +[TVSPStylingBlockRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPStylingBlockRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"screen-recording",  6LL,  v69);

  id v71 = v97;
  v91 = _NSConcreteStackBlock;
  int v92 = -1073741824;
  int v93 = 0;
  v94 = sub_1000984B8;
  v95 = &unk_1001B8FB8;
  id v96 = v136;
  [v71 setStylingBlock:&v91];
  v74 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"ttr.fill");
  v73 = +[TVSPContent contentWithTitle:image:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:", 0LL);
  id v151 = v132;
  v72 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v151, 1LL);
  id v90 =  +[TVSPRenderer rendererWithIdentifier:format:content:overrideStylings:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:overrideStylings:",  @"tap-to-radar",  6LL,  v73);

  id v89 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v134) {
    [v89 addObject:v134];
  }
  v150[0] = v130;
  v150[1] = v129;
  v150[2] = v122;
  v150[3] = v121;
  v150[4] = v114;
  v150[5] = v113;
  v150[6] = v106;
  v150[7] = v105;
  v150[8] = v98;
  v150[9] = v97;
  v150[10] = v90;
  v28 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v150, 11LL);
  objc_msgSend(v89, "addObjectsFromArray:");

  id v88 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v134)
  {
    +[TVSPConstants reallyShortRowHeight](&OBJC_CLASS___TVSPConstants, "reallyShortRowHeight");
    v27 =  +[TVSPRow rowWithIdentifier:height:]( &OBJC_CLASS___TVSPRow,  "rowWithIdentifier:height:",  @"critical-info");
    objc_msgSend(v88, "addObject:");
  }

  v26 = +[TVSPColumn columnWithIdentifiers:](&OBJC_CLASS___TVSPColumn, "columnWithIdentifiers:", &off_1001C8618);
  v148[0] = v26;
  +[TVSPConstants defaultRowHeight](&OBJC_CLASS___TVSPConstants, "defaultRowHeight");
  v25 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v147[0] = v25;
  +[TVSPConstants defaultRowHeight](&OBJC_CLASS___TVSPConstants, "defaultRowHeight");
  v24 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v147[1] = v24;
  v23 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v147);
  v22 =  +[TVSPColumn columnWithIdentifiers:itemHeights:]( &OBJC_CLASS___TVSPColumn,  "columnWithIdentifiers:itemHeights:",  &off_1001C8630);
  v148[1] = v22;
  v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v148, 2LL);
  +[TVSPConstants tallRowHeight](&OBJC_CLASS___TVSPConstants, "tallRowHeight");
  v20 = +[TVSPRow rowWithColumns:height:](&OBJC_CLASS___TVSPRow, "rowWithColumns:height:", v21);
  v149[0] = v20;
  v19 = +[TVSPRow rowWithIdentifiers:](&OBJC_CLASS___TVSPRow, "rowWithIdentifiers:", &off_1001C8648);
  v149[1] = v19;
  v18 = +[TVSPRow rowWithIdentifiers:](&OBJC_CLASS___TVSPRow, "rowWithIdentifiers:", &off_1001C8660);
  v149[2] = v18;
  v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v149, 3LL);
  objc_msgSend(v88, "addObjectsFromArray:");

  char v86 = MGGetBoolAnswer(@"InternalBuild") & 1;
  char v87 = v86;
  if (v86)
  {
    id v85 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.TVSystemMenuService");
    id v84 = [v85 objectForKey:@"EnabledInternalModules"];
    id v83 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if ([v83 count])
    {
      +[TVSPConstants defaultRowHeight](&OBJC_CLASS___TVSPConstants, "defaultRowHeight");
      id v16 =  +[TVSPRow rowsForIdentifiers:height:columnCount:]( &OBJC_CLASS___TVSPRow,  "rowsForIdentifiers:height:columnCount:",  v83,  4LL);
      objc_msgSend(v88, "addObjectsFromArray:");
    }

    objc_storeStrong(&v83, 0LL);
    objc_storeStrong(&v84, 0LL);
    objc_storeStrong(&v85, 0LL);
  }

  id v82 =  +[TVSPLayout layoutWithRows:sizeProviders:]( &OBJC_CLASS___TVSPLayout,  "layoutWithRows:sizeProviders:",  v88,  v89);
  +[TVSPConstants controlCenterSpacerHeight](&OBJC_CLASS___TVSPConstants, "controlCenterSpacerHeight");
  objc_msgSend(v82, "setRowSpacing:");
  id v10 = v146;
  id v146 = 0LL;
  v81.receiver = v10;
  v81.super_class = (Class)&OBJC_CLASS___TVSSControlCenterPanelPlatterController;
  v15 = -[TVSSControlCenterPanelPlatterController initWithIdentifier:layout:renderers:]( &v81,  "initWithIdentifier:layout:renderers:",  location[0],  v82,  v89);
  id v146 = v15;
  objc_storeStrong(&v146, v15);
  if (v15)
  {
    objc_storeStrong((id *)v146 + 7, v143);
    objc_msgSend(*((id *)v146 + 7), "addObserver:forKeyPath:options:context:", v146, @"currentScheduledSleep");
    objc_storeStrong((id *)v146 + 4, v139);
    objc_storeStrong((id *)v146 + 5, v138);
    [*((id *)v146 + 5) addObserver:v146 forKeyPath:@"restrictionsEnabled" options:0 context:off_10021FEA0];
    objc_storeStrong((id *)v146 + 6, v137);
    [*((id *)v146 + 6) addObserver:v146];
    objc_storeStrong((id *)v146 + 3, v140);
    [*((id *)v146 + 3) addPairedDevicesObserver:v146];
    [v146 _updateSleepTimerRefreshTimer];
    objc_storeStrong((id *)v146 + 8, v136);
    v11 = objc_alloc_init(&OBJC_CLASS___TVSSTapToRadarController);
    v12 = (void *)*((void *)v146 + 9);
    *((void *)v146 + 9) = v11;

    objc_storeStrong((id *)v146 + 10, v141);
    [*((id *)v146 + 10) addObserver:v146];
  }

  v14 = (TVSSControlCenterPanelPlatterController *)v146;
  objc_storeStrong(&v82, 0LL);
  objc_storeStrong(&v88, 0LL);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong(&v90, 0LL);
  objc_storeStrong(&v96, 0LL);
  objc_storeStrong(&v97, 0LL);
  objc_storeStrong(&v98, 0LL);
  objc_storeStrong(&v104, 0LL);
  objc_storeStrong(&v105, 0LL);
  objc_storeStrong(&v106, 0LL);
  objc_storeStrong(&v112, 0LL);
  objc_storeStrong(&v113, 0LL);
  objc_storeStrong(&v114, 0LL);
  objc_storeStrong(&v120, 0LL);
  objc_storeStrong(&v121, 0LL);
  objc_storeStrong(&v122, 0LL);
  objc_storeStrong(&v128, 0LL);
  objc_storeStrong(&v129, 0LL);
  objc_storeStrong(&v130, 0LL);
  objc_storeStrong(&v131, 0LL);
  objc_storeStrong(&v132, 0LL);
  objc_storeStrong(&v134, 0LL);
  objc_storeStrong(&v136, 0LL);
  objc_storeStrong(&v137, 0LL);
  objc_storeStrong(&v138, 0LL);
  objc_storeStrong(&v139, 0LL);
  objc_storeStrong(&v140, 0LL);
  objc_storeStrong(&v141, 0LL);
  objc_storeStrong(&v142, 0LL);
  objc_storeStrong(&v143, 0LL);
  objc_storeStrong(&v144, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v146, 0LL);
  return v14;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSSleepTimerController removeObserver:forKeyPath:context:]( self->_sleepTimerController,  "removeObserver:forKeyPath:context:",  self,  @"currentScheduledSleep",  off_10021FE98);
  -[TVSSRestrictionsController removeObserver:forKeyPath:context:]( v4->_restrictionsController,  "removeObserver:forKeyPath:context:",  v4,  @"restrictionsEnabled",  off_10021FEA0);
  -[TVSSNetworkController removeObserver:](v4->_networkController, "removeObserver:", v4);
  -[TVSSBluetoothController removePairedDevicesObserver:]( v4->_gameControllersController,  "removePairedDevicesObserver:",  v4);
  -[NSTimer invalidate](v4->_countdownTimer, "invalidate");
  -[TVSSSystemOutputDeviceRouteController removeObserver:]( v4->_systemOutputDeviceRouteController,  "removeObserver:",  v4);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSControlCenterPanelPlatterController;
  -[TVSSControlCenterPanelPlatterController dealloc](&v2, "dealloc");
}

- (void)platterControllerDidActivate
{
  v25 = self;
  SEL v24 = a2;
  v19 = -[TVSSControlCenterPanelPlatterController presentationContext](self, "presentationContext");

  if (v19)
  {
    v17 = -[TVSSControlCenterPanelPlatterController presentationContext](v25, "presentationContext");
    id v18 = -[TVSSMenuPresentationContext reason](v17, "reason");

    id v23 = v18;
    if (v18 == (id)7)
    {
      -[TVSSControlCenterPanelPlatterController _prewarmAudioRoutingControllerIfNecessary]( v25,  "_prewarmAudioRoutingControllerIfNecessary");
      v22 = -[TVSSAudioRoutingPanelPlatterController initWithAudioRoutingController:]( objc_alloc(&OBJC_CLASS___TVSSAudioRoutingPanelPlatterController),  "initWithAudioRoutingController:",  v25->_audioRoutingController);
      id v16 = -[TVSSControlCenterPanelPlatterController currentHostingContext](v25, "currentHostingContext");
      v14 = v22;
      id v15 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
      objc_msgSend(v16, "pushPlatterController:animator:sourceIdentifier:", v14);

      objc_storeStrong((id *)&v22, 0LL);
    }

    else if (v23 == (id)9)
    {
      v13 = -[TVSSControlCenterPanelPlatterController sleepTimerController](v25, "sleepTimerController");
      id v21 = -[TVSSSleepTimerController currentScheduledSleep](v13, "currentScheduledSleep");

      id v20 = 0LL;
      if (v21)
      {
        v11 = objc_alloc(&OBJC_CLASS___TVSSSleepTimerCountdownPanelPlatterController);
        v12 = -[TVSSControlCenterPanelPlatterController sleepTimerController](v25, "sleepTimerController");
        objc_super v2 = -[TVSSSleepTimerCountdownPanelPlatterController initWithScheduledSleep:sleepTimerController:]( v11,  "initWithScheduledSleep:sleepTimerController:",  v21);
        id v3 = v20;
        id v20 = v2;
      }

      else
      {
        id v9 = objc_alloc(&OBJC_CLASS___TVSSSleepTimerPanelPlatterController);
        id v10 = -[TVSSControlCenterPanelPlatterController sleepTimerController](v25, "sleepTimerController");
        v4 = -[TVSSSleepTimerPanelPlatterController initWithSleepTimerController:](v9, "initWithSleepTimerController:");
        id v5 = v20;
        id v20 = v4;
      }

      id v8 = -[TVSSControlCenterPanelPlatterController currentHostingContext](v25, "currentHostingContext");
      id v6 = v20;
      id v7 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
      objc_msgSend(v8, "pushPlatterController:animator:sourceIdentifier:", v6);

      objc_storeStrong(&v20, 0LL);
      objc_storeStrong(&v21, 0LL);
    }
  }

- (void)rendererGainedFocus:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] identifier];
  if ([v3 isEqualToString:@"airplay"]) {
    -[TVSSControlCenterPanelPlatterController _prewarmAudioRoutingControllerIfNecessary]( v5,  "_prewarmAudioRoutingControllerIfNecessary");
  }
  if (([v3 isEqualToString:@"critical-info"] & 1) == 0) {
    -[TVSSControlCenterPanelPlatterController setHasFocusedRendererOtherThanCriticalInfo:]( v5,  "setHasFocusedRendererOtherThanCriticalInfo:",  1LL);
  }
  if ((objc_opt_respondsToSelector(location[0], "setFocused:") & 1) != 0) {
    [location[0] setFocused:1];
  }
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)rendererLostFocus:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSControlCenterPanelPlatterController;
  -[TVSSControlCenterPanelPlatterController rendererLostFocus:](&v3, "rendererLostFocus:", location[0]);
  if ((objc_opt_respondsToSelector(location[0], "setFocused:") & 1) != 0) {
    [location[0] setFocused:0];
  }
  objc_storeStrong(location, 0LL);
}

- (BOOL)canFocusRenderer:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = [location[0] identifier];
  char v6 = [v7 isEqualToString:@"critical-info"] & 1;
  if (!v6
    || -[TVSSControlCenterPanelPlatterController hasFocusedRendererOtherThanCriticalInfo]( v9,  "hasFocusedRendererOtherThanCriticalInfo"))
  {
    v4.receiver = v9;
    v4.super_class = (Class)&OBJC_CLASS___TVSSControlCenterPanelPlatterController;
    char v10 = -[TVSSControlCenterPanelPlatterController canFocusRenderer:](&v4, "canFocusRenderer:", location[0]);
    int v5 = 1;
  }

  else
  {
    char v10 = 0;
    int v5 = 1;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v10 & 1;
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  id v82 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v80 = 0LL;
  objc_storeStrong(&v80, a4);
  v79.receiver = v82;
  v79.super_class = (Class)&OBJC_CLASS___TVSSControlCenterPanelPlatterController;
  -[TVSSControlCenterPanelPlatterController rendererWasSelected:context:]( &v79,  "rendererWasSelected:context:",  location[0],  v80);
  -[TVSSControlCenterPanelPlatterController setClearPreferredFocusedIdentifier:]( v82,  "setClearPreferredFocusedIdentifier:",  1LL);
  id v78 = [location[0] identifier];
  id v52 = -[TVSSControlCenterPanelPlatterController contentView](v82, "contentView");
  id v51 = [v52 window];
  id v50 = [v51 windowScene];
  id v77 = [v50 delegate];

  id v53 = [v77 analyticsManager];
  [v53 controlCenterActionSelected:v78];

  if ([v78 isEqualToString:@"sleep-timer"])
  {
    id v48 = -[TVSSControlCenterPanelPlatterController sleepTimerController](v82, "sleepTimerController");
    id v76 = -[TVSSSleepTimerController currentScheduledSleep](v48, "currentScheduledSleep");

    id v75 = 0LL;
    if (v76)
    {
      v46 = objc_alloc(&OBJC_CLASS___TVSSSleepTimerCountdownPanelPlatterController);
      id v47 = -[TVSSControlCenterPanelPlatterController sleepTimerController](v82, "sleepTimerController");
      objc_super v4 = -[TVSSSleepTimerCountdownPanelPlatterController initWithScheduledSleep:sleepTimerController:]( v46,  "initWithScheduledSleep:sleepTimerController:",  v76);
      id v5 = v75;
      id v75 = v4;
    }

    else
    {
      v44 = objc_alloc(&OBJC_CLASS___TVSSSleepTimerPanelPlatterController);
      id v45 = -[TVSSControlCenterPanelPlatterController sleepTimerController](v82, "sleepTimerController");
      char v6 = -[TVSSSleepTimerPanelPlatterController initWithSleepTimerController:](v44, "initWithSleepTimerController:");
      id v7 = v75;
      id v75 = v6;
    }

    id v41 = v80;
    id v40 = v75;
    id v43 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    id v42 = [location[0] identifier];
    objc_msgSend(v41, "pushPlatterController:animator:sourceIdentifier:", v40, v43);

    objc_storeStrong(&v75, 0LL);
    objc_storeStrong(&v76, 0LL);
  }

  else if ([v78 isEqualToString:@"wifi"])
  {
    v74 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=Network");
    queue = dispatch_get_global_queue(0LL, 0LL);
    v68 = _NSConcreteStackBlock;
    int v69 = -1073741824;
    int v70 = 0;
    id v71 = sub_100099940;
    v72 = &unk_1001B5A60;
    v73 = v74;
    dispatch_async(queue, &v68);

    [v80 dismissSystemMenuWithSourceIdentifier:v78];
    objc_storeStrong((id *)&v73, 0LL);
    objc_storeStrong((id *)&v74, 0LL);
  }

  else if ([v78 isEqualToString:@"airplay"])
  {
    -[TVSSControlCenterPanelPlatterController _prewarmAudioRoutingControllerIfNecessary]( v82,  "_prewarmAudioRoutingControllerIfNecessary");
    id v8 = objc_alloc(&OBJC_CLASS___TVSSAudioRoutingPanelPlatterController);
    v67 = -[TVSSAudioRoutingPanelPlatterController initWithAudioRoutingController:]( v8,  "initWithAudioRoutingController:",  v82->_audioRoutingController);
    id v36 = v80;
    id v35 = v67;
    id v38 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    id v37 = [location[0] identifier];
    objc_msgSend(v36, "pushPlatterController:animator:sourceIdentifier:", v35, v38);

    objc_storeStrong((id *)&v67, 0LL);
  }

  else if ([v78 isEqualToString:@"sleep"])
  {
    id v34 = +[PBSSystemServiceConnection sharedConnection](&OBJC_CLASS___PBSSystemServiceConnection, "sharedConnection");
    id v33 = [v34 systemServiceProxy];
    [v33 sleepSystemForReason:PBSSleepReasonUserSystemMenu];
  }

  else if ([v78 isEqualToString:@"dnd"])
  {
    -[TVSSDoNotDisturbController setEnabled:]( v82->_doNotDisturbController,  "setEnabled:",  !-[TVSSDoNotDisturbController isEnabled](v82->_doNotDisturbController, "isEnabled"));
  }

  else if ([v78 isEqualToString:@"game-controllers"])
  {
    id v9 = objc_alloc(&OBJC_CLASS___TVSSGameControllersPlatterController);
    v66 = -[TVSSGameControllersPlatterController initWithBluetoothController:]( v9,  "initWithBluetoothController:",  v82->_gameControllersController);
    id v30 = v80;
    v29 = v66;
    id v32 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    id v31 = [location[0] identifier];
    objc_msgSend(v30, "pushPlatterController:animator:sourceIdentifier:", v29, v32);

    objc_storeStrong((id *)&v66, 0LL);
  }

  else if ([v78 isEqualToString:@"ax"])
  {
    id v65 = -[TVSSAccessibilityPanelPlatterController initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSAccessibilityPanelPlatterController),  "initWithIdentifier:",  @"com.apple.TVSystemUIService.accessibility.item");
    id v26 = v80;
    v25 = v65;
    id v28 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    id v27 = [location[0] identifier];
    objc_msgSend(v26, "pushPlatterController:animator:sourceIdentifier:", v25, v28);

    objc_storeStrong((id *)&v65, 0LL);
  }

  else if ([v78 isEqualToString:@"restrictions"])
  {
    char v10 = objc_alloc(&OBJC_CLASS___TVSSRestrictionsPlatterController);
    id v64 = -[TVSSRestrictionsPlatterController initWIthRestrictionsController:]( v10,  "initWIthRestrictionsController:",  v82->_restrictionsController);
    id v22 = v80;
    id v21 = v64;
    id v24 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    id v23 = [location[0] identifier];
    objc_msgSend(v22, "pushPlatterController:animator:sourceIdentifier:", v21, v24);

    objc_storeStrong(&v64, 0LL);
  }

  else if ([v78 isEqualToString:@"search"])
  {
    v63 =  +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint");
    -[FBSOpenApplicationService openApplication:withOptions:completion:]( v63,  "openApplication:withOptions:completion:",  @"com.apple.TVSearch",  0LL);
    [v80 dismissSystemMenuWithSourceIdentifier:v78];
    objc_storeStrong((id *)&v63, 0LL);
  }

  else if ([v78 isEqualToString:@"screen-recording"])
  {
    if (-[TVSSScreenRecordingController screenRecordingActive]( v82->_screenRecordingController,  "screenRecordingActive"))
    {
      id v18 = -[TVSSControlCenterPanelPlatterController contentView](v82, "contentView");
      id v17 = [v18 window];
      id v62 = [v17 rootViewController];

      screenRecordingController = v82->_screenRecordingController;
      id v19 = v62;
      v55 = _NSConcreteStackBlock;
      int v56 = -1073741824;
      int v57 = 0;
      v58 = sub_1000999A0;
      id v59 = &unk_1001B61C0;
      id v60 = v80;
      id v61 = v78;
      -[TVSSScreenRecordingController stopScreenRecordingWithPresentingViewController:completion:]( screenRecordingController,  "stopScreenRecordingWithPresentingViewController:completion:",  v19,  &v55);
      objc_storeStrong(&v61, 0LL);
      objc_storeStrong(&v60, 0LL);
      objc_storeStrong(&v62, 0LL);
    }

    else
    {
      -[TVSSScreenRecordingController startScreenRecording](v82->_screenRecordingController, "startScreenRecording");
      [v80 dismissSystemMenuWithSourceIdentifier:v78];
    }
  }

  else if ([v78 isEqualToString:@"tap-to-radar"])
  {
    -[TVSSTapToRadarController createRadarDraft](v82->_tapToRadarController, "createRadarDraft");
    [v80 dismissSystemMenuWithSourceIdentifier:v78];
  }

  else if ([v78 isEqualToString:@"critical-info"])
  {
    v11 = objc_alloc(&OBJC_CLASS___TVSSPrivacyPlatterController);
    v12 = -[TVSSControlCenterPanelPlatterController criticalInfo](v82, "criticalInfo");
    v54 = -[TVSSPrivacyPlatterController initWithIdentifier:criticalInfo:]( v11,  "initWithIdentifier:criticalInfo:",  @"com.apple.status.controlCenter.privacy");

    id v14 = v80;
    v13 = v54;
    id v16 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    id v15 = [location[0] identifier];
    objc_msgSend(v14, "pushPlatterController:animator:sourceIdentifier:", v13, v16);

    objc_storeStrong((id *)&v54, 0LL);
  }

  objc_storeStrong(&v77, 0LL);
  objc_storeStrong(&v78, 0LL);
  objc_storeStrong(&v80, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)preferredFocusRendererIdentifier
{
  if (-[TVSSControlCenterPanelPlatterController clearPreferredFocusedIdentifier]( self,  "clearPreferredFocusedIdentifier"))
  {
    return 0LL;
  }

  id v5 = -[TVSSControlCenterPanelPlatterController presentationContext](self, "presentationContext");
  BOOL v6 = (id)-[TVSSMenuPresentationContext reason](v5, "reason") != (id)7;

  if (!v6) {
    return @"airplay";
  }
  objc_super v3 = -[TVSSControlCenterPanelPlatterController presentationContext](self, "presentationContext");
  BOOL v4 = (id)-[TVSSMenuPresentationContext reason](v3, "reason") != (id)9;

  if (v4) {
    return 0LL;
  }
  else {
    return @"sleep-timer";
  }
}

- (void)_prewarmAudioRoutingControllerIfNecessary
{
  if (!self->_audioRoutingController)
  {
    objc_super v2 = -[TVCSAudioRoutingController initWithOptions:filter:sortDescriptors:]( objc_alloc(&OBJC_CLASS___TVCSAudioRoutingController),  "initWithOptions:filter:sortDescriptors:",  7LL,  &stru_1001B97C8,  0LL);
    audioRoutingController = self->_audioRoutingController;
    self->_audioRoutingController = v2;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  char v10 = a6;
  if (a6 == off_10021FEA0)
  {
    -[TVSSControlCenterPanelPlatterController reloadContent](v14, "reloadContent");
  }

  else if (v10 == off_10021FE98)
  {
    -[TVSSControlCenterPanelPlatterController _updateSleepTimerRefreshTimer](v14, "_updateSleepTimerRefreshTimer");
    -[TVSSControlCenterPanelPlatterController reloadContent](v14, "reloadContent");
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVSSControlCenterPanelPlatterController;
    -[TVSSControlCenterPanelPlatterController observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)networkController:(id)a3 didChangeNetworkState:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSControlCenterPanelPlatterController reloadContent](v7, "reloadContent");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateSleepTimerRefreshTimer
{
  id v12 = self;
  v11[1] = (id)a2;
  BOOL v4 = -[TVSSSleepTimerController currentScheduledSleep](self->_sleepTimerController, "currentScheduledSleep");

  if (v4)
  {
    if (!v12->_countdownTimer)
    {
      v11[0] =  -[TVSSControlCenterPanelPlatterController rendererForIdentifier:]( v12,  "rendererForIdentifier:",  @"sleep-timer");
      id v5 = _NSConcreteStackBlock;
      int v6 = -1073741824;
      int v7 = 0;
      id v8 = sub_10009A00C;
      objc_super v9 = &unk_1001B77B8;
      id v10 = v11[0];
      objc_super v2 =  +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  &v5,  0.25);
      countdownTimer = v12->_countdownTimer;
      v12->_countdownTimer = v2;

      objc_storeStrong(&v10, 0LL);
      objc_storeStrong(v11, 0LL);
    }
  }

  else
  {
    -[NSTimer invalidate](v12->_countdownTimer, "invalidate");
    objc_storeStrong((id *)&v12->_countdownTimer, 0LL);
  }

- (void)bluetoothControllerPairedDevicesDidUpdate:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSControlCenterPanelPlatterController reloadContent](v4, "reloadContent");
  objc_storeStrong(location, 0LL);
}

- (void)systemOutputDeviceRouteControllerDidChangeOutputDevices:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_super v3 = -[TVSSControlCenterPanelPlatterController airPlayRenderer](v5, "airPlayRenderer");
  -[TVSPStylingBlockRenderer reloadContent](v3, "reloadContent");

  objc_storeStrong(location, 0LL);
}

- (TVCSAudioRoutingController)audioRoutingController
{
  return self->_audioRoutingController;
}

- (TVSSBluetoothController)gameControllersController
{
  return self->_gameControllersController;
}

- (TVSSDoNotDisturbController)doNotDisturbController
{
  return self->_doNotDisturbController;
}

- (TVSSRestrictionsController)restrictionsController
{
  return self->_restrictionsController;
}

- (TVSSNetworkController)networkController
{
  return self->_networkController;
}

- (TVSSSleepTimerController)sleepTimerController
{
  return self->_sleepTimerController;
}

- (TVSSScreenRecordingController)screenRecordingController
{
  return self->_screenRecordingController;
}

- (TVSSTapToRadarController)tapToRadarController
{
  return self->_tapToRadarController;
}

- (TVSSSystemOutputDeviceRouteController)systemOutputDeviceRouteController
{
  return self->_systemOutputDeviceRouteController;
}

- (NSTimer)countdownTimer
{
  return self->_countdownTimer;
}

- (void)setCountdownTimer:(id)a3
{
}

- (TVSPStylingBlockRenderer)airPlayRenderer
{
  return self->_airPlayRenderer;
}

- (void)setAirPlayRenderer:(id)a3
{
}

- (BOOL)hasFocusedRendererOtherThanCriticalInfo
{
  return self->_hasFocusedRendererOtherThanCriticalInfo;
}

- (void)setHasFocusedRendererOtherThanCriticalInfo:(BOOL)a3
{
  self->_hasFocusedRendererOtherThanCriticalInfo = a3;
}

- (TVSSCriticalInfo)criticalInfo
{
  return self->_criticalInfo;
}

- (void)setCriticalInfo:(id)a3
{
}

- (TVSSMenuPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (BOOL)clearPreferredFocusedIdentifier
{
  return self->_clearPreferredFocusedIdentifier;
}

- (void)setClearPreferredFocusedIdentifier:(BOOL)a3
{
  self->_clearPreferredFocusedIdentifier = a3;
}

- (void).cxx_destruct
{
}

@end