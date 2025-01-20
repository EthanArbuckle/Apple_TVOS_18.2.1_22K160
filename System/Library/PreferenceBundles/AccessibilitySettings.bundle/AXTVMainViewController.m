@interface AXTVMainViewController
- (BOOL)_supportsClickpadModes;
- (TSKSettingItem)zoomItem;
- (id)_axMenuFormatter;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (id)rotaryDeviceNotificationObserver;
- (void)dealloc;
- (void)setRotaryDeviceNotificationObserver:(id)a3;
- (void)setZoomItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXTVMainViewController

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AXTVMainViewController;
  -[AXTVMainViewController viewDidLoad](&v14, "viewDidLoad");
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  uint64_t v5 = _UIDeviceRemoteTouchSurfaceTypeDidChangeNotification;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_17390;
  v11 = &unk_65A68;
  objc_copyWeak(&v12, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 addObserverForName:v5 object:0 queue:v4 usingBlock:&v8]);
  -[AXTVMainViewController setRotaryDeviceNotificationObserver:]( self,  "setRotaryDeviceNotificationObserver:",  v6,  v8,  v9,  v10,  v11);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1740C,  kAXSHoverTextEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMainViewController rotaryDeviceNotificationObserver](self, "rotaryDeviceNotificationObserver"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMainViewController rotaryDeviceNotificationObserver](self, "rotaryDeviceNotificationObserver"));
    [v4 removeObserver:v5];

    -[AXTVMainViewController setRotaryDeviceNotificationObserver:](self, "setRotaryDeviceNotificationObserver:", 0LL);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSHoverTextEnabledNotification, 0LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXTVMainViewController;
  -[AXTVMainViewController dealloc](&v7, "dealloc");
}

- (id)loadSettingGroups
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  v359 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v13 = AXTVLocString(@"AXVisionSectionTitle", v6, v7, v8, v9, v10, v11, v12, v335);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v365 = [v5 initWithTitle:v14];

  v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v23 = AXTVLocString(@"AXVoiceOverTitle", v16, v17, v18, v19, v20, v21, v22, v336);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v32 = AXTVLocString(@"AXVoiceOverDescription", v25, v26, v27, v28, v29, v30, v31, v337);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v362 = (void *)v3;
  id v34 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v24,  v33,  v3,  @"voiceOverEnabled",  objc_opt_class(&OBJC_CLASS___AXTVVoiceOverViewController));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  [v35 setEnabledInStoreDemoMode:1];
  [v35 _axSetDeepLinkKeyFromiOS:@"VOICEOVER_TITLE"];
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v35 setLocalizedValueFormatter:v36];

  -[NSMutableArray addObject:](v15, "addObject:", v35);
  v361 = v15;
  if (+[TVSDevice supportsTouchRemote](&OBJC_CLASS___TVSDevice, "supportsTouchRemote"))
  {
    id v44 = AXTVLocString(@"AXZoomTitle", v37, v38, v39, v40, v41, v42, v43, v338);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    id v46 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v45,  0LL,  v3,  @"zoomEnabled",  objc_opt_class(&OBJC_CLASS___AXTVZoomViewController));
    v47 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue(v46);
    zoomItem = self->_zoomItem;
    self->_zoomItem = v47;

    -[TSKSettingItem setEnabledInStoreDemoMode:](self->_zoomItem, "setEnabledInStoreDemoMode:", 1LL);
    -[TSKSettingItem _axSetDeepLinkKeyFromiOS:](self->_zoomItem, "_axSetDeepLinkKeyFromiOS:", @"ZOOM_TITLE");
    v49 = self->_zoomItem;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
    -[TSKSettingItem setLocalizedValueFormatter:](v49, "setLocalizedValueFormatter:", v50);

    v51 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
    -[NSMutableParagraphStyle setAlignment:](v51, "setAlignment:", 4LL);
    v392[0] = NSFontAttributeName;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager bodyFont](&OBJC_CLASS___TVThemeManager, "bodyFont"));
    v392[1] = NSParagraphStyleAttributeName;
    v393[0] = v52;
    v393[1] = v51;
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v393,  v392,  2LL));

    v54 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    id v62 = AXTVLocString(@"AXZoomDescription", v55, v56, v57, v58, v59, v60, v61, v339);
    uint64_t v63 = v4;
    v64 = (void *)objc_claimAutoreleasedReturnValue(v62);
    v65 = -[NSAttributedString initWithString:attributes:](v54, "initWithString:attributes:", v64, v53);

    uint64_t v4 = v63;
    -[TSKSettingItem setAttributedLocalizedDescription:](self->_zoomItem, "setAttributedLocalizedDescription:", v65);
    -[NSMutableArray addObject:](v15, "addObject:", self->_zoomItem);
  }

  id v66 = AXTVLocString(@"AXHoverTextTitle", v37, v38, v39, v40, v41, v42, v43, v338);
  v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  id v75 = AXTVLocString(@"AXHoverTextDescription", v68, v69, v70, v71, v72, v73, v74, v340);
  v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
  id v77 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v67,  v76,  v4,  @"hoverTextEnabled",  objc_opt_class(&OBJC_CLASS___AXTVHoverTextViewController));
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);

  [v78 setEnabledInStoreDemoMode:1];
  [v78 _axSetDeepLinkKeyFromiOS:@"HOVERTEXT_TITLE"];
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v78 setLocalizedValueFormatter:v79];

  -[NSMutableArray addObject:](v15, "addObject:", v78);
  id v87 = AXTVLocString(@"AXDisplayAndTextSizeTitle", v80, v81, v82, v83, v84, v85, v86, v341);
  v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
  id v89 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v88,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVDisplayAndTextSizeViewController));
  v90 = (void *)objc_claimAutoreleasedReturnValue(v89);

  [v90 _axSetDeepLinkKeyFromiOS:@"DISPLAY_AND_TEXT"];
  [v90 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v15, "addObject:", v90);
  id v98 = AXTVLocString(@"AXMotionTitle", v91, v92, v93, v94, v95, v96, v97, v342);
  v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
  id v100 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v99,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVReduceMotionViewController));
  v101 = (void *)objc_claimAutoreleasedReturnValue(v100);

  [v101 _axSetDeepLinkKeyFromiOS:@"MOTION_TITLE"];
  [v101 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v15, "addObject:", v101);
  id v109 = AXTVLocString(@"AXAudioDescriptionsTitle", v102, v103, v104, v105, v106, v107, v108, v343);
  v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
  id v118 = AXTVLocString(@"AXAudioDescriptionsDescription", v111, v112, v113, v114, v115, v116, v117, v344);
  v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
  v120 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v110,  v119,  v2,  @"preferVideoDescriptions",  0LL,  0LL));

  [v120 setEnabledInStoreDemoMode:1];
  [v120 _axSetDeepLinkKeyFromiOS:@"DESCRIPTIVE_VIDEO"];
  -[NSMutableArray addObject:](v15, "addObject:", v120);
  [v365 setSettingItems:v15];
  id v121 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v129 = AXTVLocString(@"AXInteractionSectionTitle", v122, v123, v124, v125, v126, v127, v128, v345);
  v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
  id v364 = [v121 initWithTitle:v130];

  v131 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v132 = AXParameterizedLocalizedString(2LL, @"SWITCH_SCANNING_LABEL");
  v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
  v366 = (void *)v4;
  id v134 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v133,  0LL,  v4,  @"switchControlEnabled",  objc_opt_class(&OBJC_CLASS___AXTVSwitchControlViewController));
  v135 = (void *)objc_claimAutoreleasedReturnValue(v134);

  [v135 setEnabledInStoreDemoMode:1];
  [v135 _axSetDeepLinkKeyFromiOS:@"ScannerSwitchTitle"];
  v136 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v135 setLocalizedValueFormatter:v136];

  v367 = v131;
  v358 = v135;
  -[NSMutableArray addObject:](v131, "addObject:", v135);
  v137 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
  v138 = (void *)objc_claimAutoreleasedReturnValue([v137 pairedAirPods]);

  uint64_t v139 = AXLogCommon();
  v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v385 = [v138 count];
    _os_log_impl(&dword_0, v140, OS_LOG_TYPE_DEFAULT, "Making AirPods AX menu. %ld paired devices detected", buf, 0xCu);
  }

  __int128 v382 = 0u;
  __int128 v383 = 0u;
  __int128 v380 = 0u;
  __int128 v381 = 0u;
  id v141 = v138;
  id v142 = [v141 countByEnumeratingWithState:&v380 objects:v391 count:16];
  if (v142)
  {
    id v143 = v142;
    uint64_t v144 = *(void *)v381;
    do
    {
      for (i = 0LL; i != v143; i = (char *)i + 1)
      {
        if (*(void *)v381 != v144) {
          objc_enumerationMutation(v141);
        }
        v146 = *(void **)(*((void *)&v380 + 1) + 8LL * (void)i);
        uint64_t v147 = AXLogCommon();
        v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
        if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v385 = v146;
          _os_log_impl(&dword_0, v148, OS_LOG_TYPE_DEFAULT, " - %@", buf, 0xCu);
        }
      }

      id v143 = [v141 countByEnumeratingWithState:&v380 objects:v391 count:16];
    }

    while (v143);
  }

  v360 = (void *)v2;
  v363 = v141;

  uint64_t v149 = AXLogCommon();
  v150 = (os_log_s *)objc_claimAutoreleasedReturnValue(v149);
  if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v150, OS_LOG_TYPE_DEFAULT, "All paired devices:", buf, 2u);
  }

  id v151 = -[objc_class safeValueForKeyPath:]( NSClassFromString(@"BluetoothManager"),  "safeValueForKeyPath:",  @"sharedInstance.pairedDevices");
  __int128 v376 = 0u;
  __int128 v377 = 0u;
  __int128 v378 = 0u;
  __int128 v379 = 0u;
  obj = (void *)objc_claimAutoreleasedReturnValue(v151);
  id v152 = [obj countByEnumeratingWithState:&v376 objects:v390 count:16];
  if (v152)
  {
    id v153 = v152;
    uint64_t v154 = *(void *)v377;
    do
    {
      for (j = 0LL; j != v153; j = (char *)j + 1)
      {
        if (*(void *)v377 != v154) {
          objc_enumerationMutation(obj);
        }
        v156 = *(void **)(*((void *)&v376 + 1) + 8LL * (void)j);
        uint64_t v157 = AXLogCommon();
        v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v157);
        if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
        {
          v159 = (void *)objc_claimAutoreleasedReturnValue([v156 safeValueForKey:@"vendorId"]);
          v160 = (void *)objc_claimAutoreleasedReturnValue([v156 safeValueForKey:@"productId"]);
          *(_DWORD *)buf = 138412802;
          id v385 = v156;
          __int16 v386 = 2112;
          v387 = v159;
          __int16 v388 = 2112;
          v389 = v160;
          _os_log_impl(&dword_0, v158, OS_LOG_TYPE_DEFAULT, " - %@. VendorID:%@ ProductID:%@", buf, 0x20u);
        }
      }

      id v153 = [obj countByEnumeratingWithState:&v376 objects:v390 count:16];
    }

    while (v153);
  }

  if ((unint64_t)[v363 count] >= 2)
  {
    v161 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
    v162 = (void *)objc_claimAutoreleasedReturnValue([v161 titleForSettings]);
    v374[0] = _NSConcreteStackBlock;
    v374[1] = 3221225472LL;
    v374[2] = sub_186CC;
    v374[3] = &unk_65200;
    v163 = &v375;
    id v375 = v363;
    v164 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v162,  0LL,  0LL,  0LL,  v374));
    v165 = v358;
LABEL_29:

    [v164 setEnabledInStoreDemoMode:1];
    [v164 _axSetDeepLinkKeyFromiOS:@"HEARING_AID_TITLE"];
    v166 = v367;
    -[NSMutableArray addObject:](v367, "addObject:", v164);

    v165 = v164;
    goto LABEL_31;
  }

  v165 = v358;
  if ([v363 count] == (char *)&dword_0 + 1)
  {
    v161 = (void *)objc_claimAutoreleasedReturnValue(+[AXAirPodSettingsManager sharedInstance](&OBJC_CLASS___AXAirPodSettingsManager, "sharedInstance"));
    v162 = (void *)objc_claimAutoreleasedReturnValue([v161 titleForSettings]);
    v372[0] = _NSConcreteStackBlock;
    v372[1] = 3221225472LL;
    v372[2] = sub_186FC;
    v372[3] = &unk_65200;
    v163 = &v373;
    id v373 = v363;
    v164 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v162,  0LL,  0LL,  0LL,  v372));
    goto LABEL_29;
  }

  v166 = v367;
LABEL_31:
  if (-[AXTVMainViewController _supportsClickpadModes](self, "_supportsClickpadModes"))
  {
    id v174 = AXTVLocString( @"AXPrefersTapsForDirectionalNavigationTitle",  v167,  v168,  v169,  v170,  v171,  v172,  v173,  v346);
    v175 = (void *)objc_claimAutoreleasedReturnValue(v174);
    id v183 = AXTVLocString( @"AXPrefersTapsForDirectionalNavigationDescription",  v176,  v177,  v178,  v179,  v180,  v181,  v182,  v347);
    v184 = (void *)objc_claimAutoreleasedReturnValue(v183);
    v185 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v175,  v184,  v359,  @"appleTVRemoteClickpadTapsForDirectionalNavigationEnabled",  0LL,  0LL));

    v166 = v367;
    [v185 setEnabledInStoreDemoMode:1];
    [v185 _axSetDeepLinkKeyFromiOS:@"TAP_NAVIGATION"];
    -[NSMutableArray addObject:](v367, "addObject:", v185);
    v165 = v185;
  }

  [v364 setSettingItems:v166];
  id v186 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v194 = AXTVLocString(@"AXHearingSectionTitle", v187, v188, v189, v190, v191, v192, v193, v346);
  v195 = (void *)objc_claimAutoreleasedReturnValue(v194);
  id v369 = [v186 initWithTitle:v195];

  v196 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v204 = AXTVLocString(@"AXMonoAudioItemTitle", v197, v198, v199, v200, v201, v202, v203, v348);
  v205 = (void *)objc_claimAutoreleasedReturnValue(v204);
  v206 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v205,  0LL,  v359,  @"monoAudioEnabled",  0LL,  0LL));

  [v206 setEnabledInStoreDemoMode:1];
  [v206 _axSetDeepLinkKeyFromiOS:@"MONO_AUDIO"];
  -[NSMutableArray addObject:](v196, "addObject:", v206);
  id v214 = AXTVLocString(@"AXAudioBalanceItemTitle", v207, v208, v209, v210, v211, v212, v213, v349);
  v215 = (void *)objc_claimAutoreleasedReturnValue(v214);
  id v371 = v359;
  v216 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v215,  0LL));

  v217 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils audioBalanceFormatter](&OBJC_CLASS___AXTVUtils, "audioBalanceFormatter"));
  [v216 setLocalizedValueFormatter:v217];

  [v216 setEnabledInStoreDemoMode:1];
  [v216 _axSetDeepLinkKeyFromiOS:@"BALANCE"];
  -[NSMutableArray addObject:](v196, "addObject:", v216);
  id v225 = AXTVLocString(@"AXSubtitlesAndCaptiontingTitle", v218, v219, v220, v221, v222, v223, v224, v350);
  v226 = (void *)objc_claimAutoreleasedReturnValue(v225);
  id v227 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v226,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVSubtitlesAndCaptioningViewController));
  v228 = (void *)objc_claimAutoreleasedReturnValue(v227);

  [v228 setEnabledInStoreDemoMode:1];
  [v228 _axSetDeepLinkKeyFromiOS:@"SUBTITLES_CAPTIONING"];
  if (MGGetProductType(-[NSMutableArray addObject:](v196, "addObject:", v228)) != 33245053
    && MGGetBoolAnswer(@"s8TgWYc7BjtSNbtuycqauw"))
  {
    if (qword_80560 != -1) {
      dispatch_once(&qword_80560, &stru_65C08);
    }
    v229 = (void *)objc_claimAutoreleasedReturnValue(+[TVSInternationalization region](&OBJC_CLASS___TVSInternationalization, "region"));
    unsigned __int8 v230 = [(id)qword_80558 containsObject:v229];

    if ((v230 & 1) == 0)
    {
      id v238 = AXTVLocString(@"AXFacetimeCaptionsTitle", v231, v232, v233, v234, v235, v236, v237, v351);
      v239 = (void *)objc_claimAutoreleasedReturnValue(v238);
      id v247 = AXTVLocString(@"AXFacetimeCaptionsDetails", v240, v241, v242, v243, v244, v245, v246, v352);
      v248 = (void *)objc_claimAutoreleasedReturnValue(v247);
      v249 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v239,  v248,  v366,  @"faceTimeLiveCaptionsEnabled",  0LL,  0LL));

      [v249 setEnabledInStoreDemoMode:1];
      -[NSMutableArray addObject:](v196, "addObject:", v249);
      v228 = v249;
    }
  }

  if (_os_feature_enabled_impl("CoreAudioServices", "EnhanceDialogue_Accessibility"))
  {
    id v257 = AXTVLocString(@"AXExtendedVoiceIsolationModesTitle", v250, v251, v252, v253, v254, v255, v256, v351);
    v258 = (void *)objc_claimAutoreleasedReturnValue(v257);
    id v266 = AXTVLocString(@"AXExtendedVoiceIsolationModesDetails", v259, v260, v261, v262, v263, v264, v265, v353);
    v267 = (void *)objc_claimAutoreleasedReturnValue(v266);
    v268 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v258,  v267,  v366,  @"extendedVoiceIsolationMediaModesEnabled",  0LL,  0LL));

    [v268 setEnabledInStoreDemoMode:1];
    -[NSMutableArray addObject:](v196, "addObject:", v268);
    v228 = v268;
  }

  if (AFPreferencesAssistantEnabled([v369 setSettingItems:v196]))
  {
    id v269 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
    id v277 = AXTVLocString(@"AXSiriSectionTitle", v270, v271, v272, v273, v274, v275, v276, v351);
    v278 = (void *)objc_claimAutoreleasedReturnValue(v277);
    id v279 = [v269 initWithTitle:v278];

    v280 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v288 = AXTVLocString(@"AXTypeToSiriItemTitle", v281, v282, v283, v284, v285, v286, v287, v354);
    v289 = (void *)objc_claimAutoreleasedReturnValue(v288);
    id v297 = AXTVLocString(@"AXTypeToSiriDescription", v290, v291, v292, v293, v294, v295, v296, v355);
    v298 = (void *)objc_claimAutoreleasedReturnValue(v297);
    v299 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v289,  v298,  v366,  @"typeToSiriEnabled",  0LL,  0LL));

    [v299 setEnabledInStoreDemoMode:1];
    [v299 _axSetDeepLinkKeyFromiOS:@"TYPE_TO_SIRI"];
    -[NSMutableArray addObject:](v280, "addObject:", v299);
    [v279 setSettingItems:v280];

    v228 = v299;
  }

  else
  {
    id v279 = 0LL;
  }

  id v300 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v308 = AXTVLocString(@"AXGeneralSectionTitle", v301, v302, v303, v304, v305, v306, v307, v351);
  v309 = (void *)objc_claimAutoreleasedReturnValue(v308);
  id v310 = [v300 initWithTitle:v309];

  v311 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v319 = AXTVLocString(@"AXAccessibilityMenuTitle", v312, v313, v314, v315, v316, v317, v318, v356);
  v320 = (void *)objc_claimAutoreleasedReturnValue(v319);
  id v328 = AXTVLocString(@"AXAccessibilityMenuDescription", v321, v322, v323, v324, v325, v326, v327, v357);
  v329 = (void *)objc_claimAutoreleasedReturnValue(v328);
  id v330 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v320,  v329,  v362,  @"accessibilityMenuOptions",  objc_opt_class(&OBJC_CLASS___AXTVMenuViewController));
  v331 = (void *)objc_claimAutoreleasedReturnValue(v330);

  [v331 setEnabledInStoreDemoMode:1];
  [v331 _axSetDeepLinkKeyFromiOS:@"TRIPLE_CLICK_TITLE"];
  v332 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVMainViewController _axMenuFormatter](self, "_axMenuFormatter"));
  [v331 setLocalizedValueFormatter:v332];

  -[NSMutableArray addObject:](v311, "addObject:", v331);
  [v310 setSettingItems:v311];
  v333 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  5LL,  v365,  v364,  v369,  v279,  v310));

  return v333;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTVMainViewController;
  id v3 = -[AXTVMainViewController previewForItemAtIndexPath:](&v8, "previewForItemAtIndexPath:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TSKPreviewViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 descriptionLabel]);
    [v6 setNumberOfLines:6];
  }

  return v4;
}

- (id)_axMenuFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65BE8];
}

- (BOOL)_supportsClickpadModes
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  id v3 = (char *)[v2 _remoteTouchSurfaceType];

  uint64_t v4 = AXLogCommon();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3 == (_BYTE *)&dword_0 + 2));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 _remoteTouchSurfaceType]));
    int v11 = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    objc_super v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "supportsClickpadModes? %@. [UIDevice currentDevice]: %@. remoteTouchSurfaceType: %@",  (uint8_t *)&v11,  0x20u);
  }

  return v3 == (_BYTE *)&dword_0 + 2;
}

- (TSKSettingItem)zoomItem
{
  return self->_zoomItem;
}

- (void)setZoomItem:(id)a3
{
}

- (id)rotaryDeviceNotificationObserver
{
  return self->_rotaryDeviceNotificationObserver;
}

- (void)setRotaryDeviceNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end