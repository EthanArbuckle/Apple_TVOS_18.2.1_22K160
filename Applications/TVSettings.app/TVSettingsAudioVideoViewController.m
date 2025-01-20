@interface TVSettingsAudioVideoViewController
+ (BOOL)_hardwareSupportsAC3Decode;
+ (id)_audioLanguageFormatter;
+ (id)_enhanceDialogueFormatter;
+ (id)_enhanceDialogueLevelsDescriptionFormatter;
+ (id)_multiChannelAudioFormatter;
+ (id)_nativeModeSwitchingOptionsFormatter;
+ (id)_subtitleOptionFormatter;
+ (id)_volumeFormatter;
- (BOOL)_areDisplayFiltersEnabled;
- (TSKSettingItem)displayAdjustmentItem;
- (TSKSettingItem)wirelessAudioSyncItem;
- (TVSettingsAudioVideoViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (void)_handleEnableWiderAspectRatios;
- (void)_promptResetVideoSettings;
- (void)dealloc;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDisplayAdjustmentItem:(id)a3;
- (void)setWirelessAudioSyncItem:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsAudioVideoViewController

- (TVSettingsAudioVideoViewController)initWithStyle:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsAudioVideoViewController;
  v3 = -[TVSettingsAudioVideoViewController initWithStyle:](&v13, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
    [v4 addObserver:v3 forKeyPath:@"currentDisplayMode" options:1 context:off_1001DF9D8];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    [v5 addObserver:v3 forKeyPath:@"audioFormats" options:0 context:off_1001DF9E0];

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
    [v6 addObserver:v3 forKeyPath:@"reduceLoudSoundsIsAvailable" options:0 context:off_1001DF9E8];

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
    [v7 addObserver:v3 forKeyPath:@"enhanceDialogueIsAvailable" options:0 context:off_1001DF9E8];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
    [v8 addObserver:v9 selector:"refresh" name:UIApplicationDidBecomeActiveNotification object:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAudioVideoFacade sharedInstance]( &OBJC_CLASS___TVSettingsAudioVideoFacade,  "sharedInstance"));
    [v10 addObserver:v3 forKeyPath:@"enhanceDialogueSupportsLevels" options:0 context:off_1001DF9F0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_100044A28,  kMADisplayFilterSettingsChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsAudioVideoViewController;
  -[TVSettingsAudioVideoViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
  [v3 refresh];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"currentDisplayMode" context:off_1001DF9D8];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"audioFormats" context:off_1001DF9E0];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
  [v5 removeObserver:self forKeyPath:@"reduceLoudSoundsIsAvailable" context:off_1001DF9E8];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
  [v6 removeObserver:self forKeyPath:@"enhanceDialogueIsAvailable" context:off_1001DF9E8];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
  [v7 removeObserver:v8 name:UIApplicationDidBecomeActiveNotification object:0];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAudioVideoFacade sharedInstance]( &OBJC_CLASS___TVSettingsAudioVideoFacade,  "sharedInstance"));
  [v9 removeObserver:self forKeyPath:@"enhanceDialogueSupportsLevels" context:off_1001DF9F0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kMADisplayFilterSettingsChangedNotification, 0LL);

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsAudioVideoViewController;
  -[TVSettingsAudioVideoViewController dealloc](&v11, "dealloc");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsAudioVideoFacade sharedInstance]( &OBJC_CLASS___TVSettingsAudioVideoFacade,  "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsHomePodSettingsFacade sharedInstance]( &OBJC_CLASS___TVSettingsHomePodSettingsFacade,  "sharedInstance"));
  v7 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v8 = TSKLocString(@"AVAudioSectionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v241 = -[TSKSettingGroup initWithTitle:](v7, "initWithTitle:", v9);

  v244 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LODWORD(v9) = [v10 fileExistsAtPath:@"/System/Library/PreferenceBundles/TVAudioRoutingSettings.bundle"];

  if ((_DWORD)v9)
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PreferenceBundles/TVAudioRoutingSettings.bundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v11));

    [v12 setUpdateBlock:&stru_1001904F0];
    [v12 _preloadViewController];
    -[NSMutableArray addObject:](v244, "addObject:", v12);
  }

  uint64_t v13 = TSKLocString(@"AVRouteVolume");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v14,  0LL,  self->_routingController,  @"selectedRoute.volumeControl.volume",  &off_1001AEC68));

  id v16 = [(id)objc_opt_class(self) _volumeFormatter];
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v15 setLocalizedValueFormatter:v17];

  [v15 setUpdateBlock:&stru_100190510];
  -[NSMutableArray addObject:](v244, "addObject:", v15);
  else {
    v18 = @"AVDolbyDigitalTitle";
  }
  uint64_t v19 = TSKLocString(v18);
  v235 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v20 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v235,  0LL,  v5,  @"audioOutputFormat",  objc_opt_class(&OBJC_CLASS___TVSettingsAudioConversionViewController));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v295[0] = _NSConcreteStackBlock;
  v295[1] = 3221225472LL;
  v295[2] = sub_100046A58;
  v295[3] = &unk_10018ED70;
  id v22 = v2;
  id v296 = v22;
  id v234 = v5;
  id v297 = v234;
  [v21 setUpdateBlock:v295];
  id v23 = [(id)objc_opt_class(self) _multiChannelAudioFormatter];
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v21 setLocalizedValueFormatter:v24];

  -[NSMutableArray addObject:](v244, "addObject:", v21);
  uint64_t v25 = TSKLocString(@"AVLateNightTitle");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v27 = TSKLocString(@"AVLateNightDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v26,  v28,  v234,  @"lateNightModeEnabled",  0LL,  0LL));

  v293[0] = _NSConcreteStackBlock;
  v293[1] = 3221225472LL;
  v293[2] = sub_100046B84;
  v293[3] = &unk_10018E608;
  id v30 = v6;
  id v294 = v30;
  [v29 setUpdateBlock:v293];
  -[NSMutableArray addObject:](v244, "addObject:", v29);
  uint64_t v31 = TSKLocString(@"AVEnhanceDialogueTitle");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  uint64_t v33 = TSKLocString(@"AVEnhanceDialogueDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  uint64_t v35 = TSKLocString(@"AVEnhanceDialogueLevelEnhance");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v32,  v34,  v30,  @"enhanceDialogue",  v36,  0LL));

  v290[0] = _NSConcreteStackBlock;
  v290[1] = 3221225472LL;
  v290[2] = sub_100046BDC;
  v290[3] = &unk_10018ED70;
  id v38 = v30;
  id v291 = v38;
  id v39 = v22;
  id v292 = v39;
  [v37 setUpdateBlock:v290];
  -[NSMutableArray addObject:](v244, "addObject:", v37);
  uint64_t v40 = TSKLocString(@"AVEnhanceDialogueTitle");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  uint64_t v42 = TSKLocString(@"AVEnhanceDialogueDescription");
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v39 availableEnhanceDialogueLevels]);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v41,  v43,  v39,  @"enhanceDialogueLevel",  v44));

  v288[0] = _NSConcreteStackBlock;
  v288[1] = 3221225472LL;
  v288[2] = sub_100046C34;
  v288[3] = &unk_10018E608;
  id v46 = v39;
  id v289 = v46;
  [v45 setUpdateBlock:v288];
  id v47 = [(id)objc_opt_class(self) _enhanceDialogueFormatter];
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  [v45 setLocalizedValueFormatter:v48];

  id v49 = [(id)objc_opt_class(self) _enhanceDialogueLevelsDescriptionFormatter];
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  [v45 setDetailedLocalizedDescriptionValueFormatter:v50];

  -[NSMutableArray addObject:](v244, "addObject:", v45);
  uint64_t v51 = TSKLocString(@"AVLateNightTitle");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  uint64_t v53 = TSKLocString(@"AVLateNightDescription");
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v52,  v54,  v38,  @"reduceLoudSounds",  0LL,  0LL));

  v286[0] = _NSConcreteStackBlock;
  v286[1] = 3221225472LL;
  v286[2] = sub_100046C78;
  v286[3] = &unk_10018E608;
  id v232 = v38;
  id v287 = v232;
  [v55 setUpdateBlock:v286];
  -[NSMutableArray addObject:](v244, "addObject:", v55);
  uint64_t v56 = TSKLocString(@"AVNavigationClicksTitle");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v57,  0LL,  v46,  @"navigationSoundEffectsEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v244, "addObject:", v58);
  uint64_t v59 = TSKLocString(@"AVTransitonSoundsTitle");
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v60,  0LL,  v46,  @"transitionSoundsAndPreviewAudioEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v244, "addObject:", v61);
  uint64_t v62 = TSKLocString(@"AVAudioOutputTitle");
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  uint64_t v64 = TSKLocString(@"AVAudioOutputDescription");
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  uint64_t v66 = TSKLocString(@"AVAudioOutputHighQuality");
  v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  uint64_t v68 = TSKLocString(@"AVAudioOutput16Bit");
  v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v63,  v65,  v46,  @"highQualityAudioEnabled",  v67,  v69));

  -[NSMutableArray addObject:](v244, "addObject:", v70);
  uint64_t v71 = TSKLocString(@"AVAudioLanguageTitle");
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  uint64_t v73 = TSKLocString(@"AVAudioLanguageTitleDescription");
  v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
  v75 = (void *)objc_claimAutoreleasedReturnValue([v46 availableAudioLanguageCodes]);
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v72,  v74,  v46,  @"preferredAudioLanguageCode",  v75));

  v284[0] = _NSConcreteStackBlock;
  v284[1] = 3221225472LL;
  v284[2] = sub_100046CBC;
  v284[3] = &unk_10018E608;
  id v77 = v46;
  id v285 = v77;
  [v76 setUpdateBlock:v284];
  id v78 = [(id)objc_opt_class(self) _audioLanguageFormatter];
  v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
  [v76 setLocalizedValueFormatter:v79];

  -[NSMutableArray addObject:](v244, "addObject:", v76);
  -[TSKSettingGroup setSettingItems:](v241, "setSettingItems:", v244);
  v80 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v81 = TSKLocString(@"AVAutomaticSubtitlesSectionTitle");
  v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
  v237 = -[TSKSettingGroup initWithTitle:](v80, "initWithTitle:", v82);

  v242 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v83 = TSKLocString(@"AVShowForDifferentLanguagesTitle");
  v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
  uint64_t v85 = TSKLocString(@"AVShowForDifferentLanguagesDescription");
  v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
  v87 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v84,  v86,  v77,  @"automaticSubtitles",  0LL,  0LL));

  -[NSMutableArray addObject:](v242, "addObject:", v87);
  uint64_t v88 = TSKLocString(@"AVSubtitleLanguageTitle");
  v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
  v90 = (void *)objc_claimAutoreleasedReturnValue([v77 availableSubtitleLanguageOptions]);
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v89,  0LL,  v77,  @"subtitleLanguageOption",  v90));

  v282[0] = _NSConcreteStackBlock;
  v282[1] = 3221225472LL;
  v282[2] = sub_100046D0C;
  v282[3] = &unk_10018E608;
  id v238 = v77;
  id v283 = v238;
  [v91 setUpdateBlock:v282];
  id v92 = [(id)objc_opt_class(self) _subtitleOptionFormatter];
  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  [v91 setLocalizedValueFormatter:v93];

  -[NSMutableArray addObject:](v242, "addObject:", v91);
  if (_os_feature_enabled_impl("PineBoard", "CaptionsOnMute"))
  {
    uint64_t v94 = TSKLocString(@"AVShowWhenMutedTitle");
    v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
    uint64_t v96 = TSKLocString(@"AVShowWhenMutedDescription");
    v97 = (void *)objc_claimAutoreleasedReturnValue(v96);
    v98 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v95,  v97,  v238,  @"showWhenMuted",  0LL,  0LL));

    -[NSMutableArray addObject:](v242, "addObject:", v98);
  }

  else
  {
    v98 = v91;
  }

  if (_os_feature_enabled_impl("AVKit", "CaptionsOnSkipBackTV"))
  {
    uint64_t v99 = TSKLocString(@"AVShowOnSkipBackTitle");
    v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
    uint64_t v101 = TSKLocString(@"AVShowOnSkipBackDescription");
    v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
    v103 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v100,  v102,  v238,  @"showOnSkipBack",  0LL,  0LL));

    -[NSMutableArray addObject:](v242, "addObject:", v103);
  }

  else
  {
    v103 = v98;
  }

  -[TSKSettingGroup setSettingItems:](v237, "setSettingItems:", v242);
  v104 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v105 = TSKLocString(@"AVVideoSectionTitle");
  v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
  v236 = -[TSKSettingGroup initWithTitle:](v104, "initWithTitle:", v106);

  v243 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v107 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  0LL,  0LL,  0LL,  0LL,  v3,  "presentUpgradeAttemptDisplayAssistant"));

  v280[0] = _NSConcreteStackBlock;
  v280[1] = 3221225472LL;
  v280[2] = sub_100046D5C;
  v280[3] = &unk_10018E608;
  id v108 = v3;
  id v281 = v108;
  [v107 setUpdateBlock:v280];
  -[NSMutableArray addObject:](v243, "addObject:", v107);
  if (_os_feature_enabled_impl("PineBoard", "Werewolf")
    && +[TVSDevice supportsUltrawide](&OBJC_CLASS___TVSDevice, "supportsUltrawide"))
  {
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v110 = TSKLocStringFromBundleCachingKey( @"EnableWideAspectRatiosTitle",  v109,  1LL,  0LL,  @"Localizable-Werewolf");
    v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v113 = TSKLocStringFromBundleCachingKey( @"EnableWideAspectRatiosDescription",  v112,  1LL,  0LL,  @"Localizable-Werewolf");
    v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
    v115 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v111,  v114,  0LL,  0LL,  self,  "_handleEnableWiderAspectRatios"));

    v278[0] = _NSConcreteStackBlock;
    v278[1] = 3221225472LL;
    v278[2] = sub_100046DF0;
    v278[3] = &unk_10018E608;
    id v279 = v108;
    [v115 setUpdateBlock:v278];
    -[NSMutableArray addObject:](v243, "addObject:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v118 = TSKLocStringFromBundleCachingKey(@"DisplayAspectRatio", v117, 1LL, 0LL, @"Localizable-Werewolf");
    v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
    v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v121 = TSKLocStringFromBundleCachingKey( @"DisplayAspectRatioDescription",  v120,  1LL,  0LL,  @"Localizable-Werewolf");
    v122 = (void *)objc_claimAutoreleasedReturnValue(v121);
    v123 = (void *)objc_claimAutoreleasedReturnValue([v116 preferredDisplaySizeOptions]);
    v124 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v119,  v122,  v116,  @"preferredDisplaySizeIdentifier",  v123));

    v125 = (void *)objc_claimAutoreleasedReturnValue([v116 preferredDisplaySizeOptionFormatter]);
    [v124 setLocalizedValueFormatter:v125];

    v276[0] = _NSConcreteStackBlock;
    v276[1] = 3221225472LL;
    v276[2] = sub_100046E50;
    v276[3] = &unk_10018E608;
    id v277 = v116;
    id v126 = v116;
    [v124 setUpdateBlock:v276];
    -[NSMutableArray addObject:](v243, "addObject:", v124);
  }

  else
  {
    v115 = v107;
  }

  uint64_t v127 = TSKLocString(@"AVResolutionTitle");
  v240 = (void *)objc_claimAutoreleasedReturnValue(v127);
  uint64_t v128 = TSKLocString(@"AVResolutionDescription");
  v239 = (void *)objc_claimAutoreleasedReturnValue(v128);
  if (+[TVSDevice supportsUHDAndHDR](&OBJC_CLASS___TVSDevice, "supportsUHDAndHDR"))
  {
    uint64_t v129 = TSKLocString(@"AVFormatTitle");
    uint64_t v130 = objc_claimAutoreleasedReturnValue(v129);

    uint64_t v131 = TSKLocString(@"AVFormatDescription");
    uint64_t v132 = objc_claimAutoreleasedReturnValue(v131);

    v239 = (void *)v132;
    v240 = (void *)v130;
  }

  id v133 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v240,  v239,  v4,  @"currentDisplayMode",  objc_opt_class(&OBJC_CLASS___TVSettingsSimpleResolutionViewController));
  v134 = (void *)objc_claimAutoreleasedReturnValue(v133);

  v274[0] = _NSConcreteStackBlock;
  v274[1] = 3221225472LL;
  v274[2] = sub_100046EB0;
  v274[3] = &unk_10018E608;
  id v135 = v4;
  id v275 = v135;
  [v134 setUpdateBlock:v274];
  -[NSMutableArray addObject:](v243, "addObject:", v134);
  if (_os_feature_enabled_impl("PineBoard", "hydrangea"))
  {
    v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v137 = TSKLocStringFromBundleCachingKey( @"AVDynamicRangeHDR10PlusToggleTitle",  v136,  1LL,  0LL,  @"Localizable-HDR10Plus");
    v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
    v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v140 = TSKLocStringFromBundleCachingKey( @"AVDynamicRangeHDR10PlusToggleDescription",  v139,  1LL,  0LL,  @"Localizable-HDR10Plus");
    v141 = (void *)objc_claimAutoreleasedReturnValue(v140);
    uint64_t v142 = TSKLocString(@"Enabled");
    v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
    uint64_t v144 = TSKLocString(@"Disabled");
    v145 = (void *)objc_claimAutoreleasedReturnValue(v144);
    v146 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v138,  v141,  v108,  @"hdr10PlusEnabled",  v143,  v145));

    v272[0] = _NSConcreteStackBlock;
    v272[1] = 3221225472LL;
    v272[2] = sub_100046F40;
    v272[3] = &unk_10018E608;
    id v273 = v135;
    [v146 setUpdateBlock:v272];
    -[NSMutableArray addObject:](v243, "addObject:", v146);
  }

  else
  {
    v146 = v134;
  }

  uint64_t v147 = TSKLocString(@"AVSDRColorMappingTitle");
  v148 = (void *)objc_claimAutoreleasedReturnValue(v147);
  v149 = (void *)objc_claimAutoreleasedReturnValue([v108 userVisibleSDRColorMappingModes]);
  v150 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v148,  0LL,  v108,  @"selectedSDRColorMappingMode",  v149));

  v269[0] = _NSConcreteStackBlock;
  v269[1] = 3221225472LL;
  v269[2] = sub_100046FD8;
  v269[3] = &unk_10018ED70;
  id v151 = v108;
  id v270 = v151;
  id v152 = v135;
  id v271 = v152;
  [v150 setUpdateBlock:v269];
  v153 = (void *)objc_claimAutoreleasedReturnValue( +[PBSDisplayManager SDRColorMappingFormatter]( &OBJC_CLASS___PBSDisplayManager,  "SDRColorMappingFormatter"));
  [v150 setLocalizedValueFormatter:v153];

  -[NSMutableArray addObject:](v243, "addObject:", v150);
  uint64_t v154 = TSKLocString(@"AVChromaSubsamplingTitle");
  v155 = (void *)objc_claimAutoreleasedReturnValue(v154);
  uint64_t v156 = TSKLocString(@"AVChromaSubsampling444Description");
  v157 = (void *)objc_claimAutoreleasedReturnValue(v156);
  v158 = (void *)objc_claimAutoreleasedReturnValue([v151 userVisibleSDRChromaModes]);
  v159 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v155,  v157,  v151,  @"selectedSDRChromaMode",  v158));

  v266[0] = _NSConcreteStackBlock;
  v266[1] = 3221225472LL;
  v266[2] = sub_1000470C8;
  v266[3] = &unk_10018ED70;
  id v160 = v151;
  id v267 = v160;
  id v161 = v152;
  id v268 = v161;
  [v159 setUpdateBlock:v266];
  v162 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager SDRChromaFormatter](&OBJC_CLASS___PBSDisplayManager, "SDRChromaFormatter"));
  [v159 setLocalizedValueFormatter:v162];

  -[NSMutableArray addObject:](v243, "addObject:", v159);
  uint64_t v163 = TSKLocString(@"AVChromaSubsamplingTitle");
  v164 = (void *)objc_claimAutoreleasedReturnValue(v163);
  uint64_t v165 = TSKLocString(@"AVChromaSubsampling422Description");
  v166 = (void *)objc_claimAutoreleasedReturnValue(v165);
  v167 = (void *)objc_claimAutoreleasedReturnValue([v160 userVisibleHDRChromaModes]);
  v168 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v164,  v166,  v160,  @"selectedHDRChromaMode",  v167));

  v263[0] = _NSConcreteStackBlock;
  v263[1] = 3221225472LL;
  v263[2] = sub_100047160;
  v263[3] = &unk_10018ED70;
  id v169 = v160;
  id v264 = v169;
  id v170 = v161;
  id v265 = v170;
  [v168 setUpdateBlock:v263];
  v171 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager HDR10ChromaFormatter](&OBJC_CLASS___PBSDisplayManager, "HDR10ChromaFormatter"));
  [v168 setLocalizedValueFormatter:v171];

  -[NSMutableArray addObject:](v243, "addObject:", v168);
  uint64_t v172 = TSKLocString(@"AVNativeModeSwitchingFormatToMatchVideo");
  v173 = (void *)objc_claimAutoreleasedReturnValue(v172);
  else {
    v174 = @"AVNativeModeSwitchingFormatToMatchVideoNoHDRDescription";
  }
  uint64_t v175 = TSKLocString(v174);
  v176 = (void *)objc_claimAutoreleasedReturnValue(v175);
  id v177 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v173,  v176,  v170,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsNativeModeSwitchingViewController));
  v178 = (void *)objc_claimAutoreleasedReturnValue(v177);

  v260[0] = _NSConcreteStackBlock;
  v260[1] = 3221225472LL;
  v260[2] = sub_1000471E8;
  v260[3] = &unk_10018ED70;
  id v179 = v169;
  id v261 = v179;
  id v180 = v170;
  id v262 = v180;
  [v178 setUpdateBlock:v260];
  -[NSMutableArray addObject:](v243, "addObject:", v178);
  uint64_t v181 = TSKLocString(@"AVCheckCable");
  v182 = (void *)objc_claimAutoreleasedReturnValue(v181);
  uint64_t v183 = TSKLocString(@"AVCheckCableDescription");
  v184 = (void *)objc_claimAutoreleasedReturnValue(v183);
  v185 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v182,  v184,  0LL,  0LL,  v179,  "presentCableCheckDisplayAssistant"));

  v258[0] = _NSConcreteStackBlock;
  v258[1] = 3221225472LL;
  v258[2] = sub_100047288;
  v258[3] = &unk_10018E608;
  id v186 = v180;
  id v259 = v186;
  [v185 setUpdateBlock:v258];
  -[NSMutableArray addObject:](v243, "addObject:", v185);
  uint64_t v187 = TSKLocString(@"AVTapToZoomTitle");
  v188 = (void *)objc_claimAutoreleasedReturnValue(v187);
  uint64_t v189 = TSKLocString(@"AVTapToZoomDescription");
  v190 = (void *)objc_claimAutoreleasedReturnValue(v189);
  v191 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v188,  v190,  v238,  @"videoTapToZoomEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v243, "addObject:", v191);
  uint64_t v192 = TSKLocString(@"AVRestoreDefaultDisplayMode");
  v193 = (void *)objc_claimAutoreleasedReturnValue(v192);
  uint64_t v194 = TSKLocString(@"AVRestoreDefaultDisplayModeDescription");
  v195 = (void *)objc_claimAutoreleasedReturnValue(v194);
  v233 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v193,  v195,  0LL,  0LL,  self,  "_promptResetVideoSettings"));

  -[NSMutableArray addObject:](v243, "addObject:", v233);
  -[TSKSettingGroup setSettingItems:](v236, "setSettingItems:", v243);
  objc_initWeak(&location, self);
  v196 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v254[0] = _NSConcreteStackBlock;
  v254[1] = 3221225472LL;
  v254[2] = sub_1000472CC;
  v254[3] = &unk_100190538;
  id v197 = v186;
  id v255 = v197;
  objc_copyWeak(&v256, &location);
  v198 = objc_retainBlock(v254);
  v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v200 = TSKLocStringFromBundleCachingKey( @"AVDisplayAdjustmentTitle",  v199,  1LL,  0LL,  @"Localizable-Colorimeter");
  v201 = (void *)objc_claimAutoreleasedReturnValue(v200);
  uint64_t v202 = ((uint64_t (*)(void *))v198[2])(v198);
  v203 = (void *)objc_claimAutoreleasedReturnValue(v202);
  id v204 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v201,  v203,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsColorCalibrationViewController));
  v205 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue(v204);
  displayAdjustmentItem = self->_displayAdjustmentItem;
  self->_displayAdjustmentItem = v205;

  v207 = self->_displayAdjustmentItem;
  v250[0] = _NSConcreteStackBlock;
  v250[1] = 3221225472LL;
  v250[2] = sub_100047410;
  v250[3] = &unk_100190560;
  id v208 = v197;
  id v251 = v208;
  objc_copyWeak(&v253, &location);
  v209 = v198;
  id v252 = v209;
  -[TSKSettingItem setUpdateBlock:](v207, "setUpdateBlock:", v250);
  -[TSKSettingItem setShouldPresentChildController:]( self->_displayAdjustmentItem,  "setShouldPresentChildController:",  1LL);
  -[NSMutableArray addObject:](v196, "addObject:", self->_displayAdjustmentItem);

  objc_destroyWeak(&v253);
  objc_destroyWeak(&v256);

  uint64_t v210 = TSKLocString(@"AVAudioSyncTitle");
  v211 = (void *)objc_claimAutoreleasedReturnValue(v210);
  uint64_t v212 = TSKLocString(@"AVAudioSyncDescription");
  v213 = (void *)objc_claimAutoreleasedReturnValue(v212);
  id v214 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v211,  v213,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsAudioLatencyCalibrationViewController));
  v215 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue(v214);
  wirelessAudioSyncItem = self->_wirelessAudioSyncItem;
  self->_wirelessAudioSyncItem = v215;

  v217 = self->_wirelessAudioSyncItem;
  v248[0] = _NSConcreteStackBlock;
  v248[1] = 3221225472LL;
  v248[2] = sub_100047584;
  v248[3] = &unk_10018E608;
  id v218 = v208;
  id v249 = v218;
  -[TSKSettingItem setUpdateBlock:](v217, "setUpdateBlock:", v248);
  -[TSKSettingItem setShouldPresentChildController:]( self->_wirelessAudioSyncItem,  "setShouldPresentChildController:",  1LL);
  -[NSMutableArray addObject:](v196, "addObject:", self->_wirelessAudioSyncItem);
  uint64_t v219 = TSKLocString(@"AVOverscanTitle");
  v220 = (void *)objc_claimAutoreleasedReturnValue(v219);
  id v221 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v220,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsOverscanViewController));
  v222 = (void *)objc_claimAutoreleasedReturnValue(v221);

  -[NSMutableArray addObject:](v196, "addObject:", v222);
  uint64_t v223 = TSKLocString(@"AVColorBarsTitle");
  v224 = (void *)objc_claimAutoreleasedReturnValue(v223);
  id v225 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v224,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsColorBarsViewController));
  v226 = (void *)objc_claimAutoreleasedReturnValue(v225);

  -[NSMutableArray addObject:](v196, "addObject:", v226);
  uint64_t v227 = TSKLocString(@"AVCalibrationSectionTitle");
  v228 = (void *)objc_claimAutoreleasedReturnValue(v227);
  v229 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v228,  v196));

  v246[0] = _NSConcreteStackBlock;
  v246[1] = 3221225472LL;
  v246[2] = sub_10004763C;
  v246[3] = &unk_10018E9B0;
  objc_copyWeak(&v247, &location);
  [v229 setUpdateBlock:v246];
  [v229 setEnabledInStoreDemoMode:0];
  v298[0] = v236;
  v298[1] = v241;
  v298[2] = v237;
  v298[3] = v229;
  v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v298, 4LL));
  objc_destroyWeak(&v247);

  objc_destroyWeak(&location);
  return v230;
}

+ (id)_multiChannelAudioFormatter
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100047720;
  v3[3] = &unk_100190580;
  v3[4] = a1;
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:v3];
}

+ (id)_enhanceDialogueFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_1001905A0];
}

+ (id)_enhanceDialogueLevelsDescriptionFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_1001905C0];
}

+ (id)_audioLanguageFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_1001905E0];
}

+ (id)_subtitleOptionFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100190600];
}

+ (id)_volumeFormatter
{
  v2 = objc_opt_new(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v2, "setNumberStyle:", 3LL);
  id v3 = objc_alloc(&OBJC_CLASS___TVSBlockFormatter);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100047BC4;
  v7[3] = &unk_100190628;
  uint64_t v8 = v2;
  objc_super v4 = v2;
  id v5 = [v3 initWithFormattingBlock:v7];

  return v5;
}

+ (id)_nativeModeSwitchingOptionsFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_100190668];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1001DF9D8 == a6)
  {
    int v13 = _os_feature_enabled_impl("PineBoard", "Newport");
    if ((v13 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioVideoViewController navigationController](self, "navigationController"));
      v15 = (TVSettingsAudioVideoViewController *)objc_claimAutoreleasedReturnValue([v14 topViewController]);
    }

    else
    {
      v15 = (TVSettingsAudioVideoViewController *)objc_claimAutoreleasedReturnValue( -[TVSettingsAudioVideoViewController presentedViewController]( self,  "presentedViewController"));
    }

    if (v15 != self
      && -[TVSettingsAudioVideoViewController conformsToProtocol:]( v15,  "conformsToProtocol:",  &OBJC_PROTOCOL___TSKSettingItemEditingController))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeNewKey]);
      uint64_t v17 = objc_opt_self(&OBJC_CLASS___PBSDisplayMode);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      char isKindOfClass = objc_opt_isKindOfClass(v16, v18);

      if ((isKindOfClass & 1) != 0)
      {
        id v20 = v16;
        v21 = v15;
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDisplayModeFacade sharedInstance]( &OBJC_CLASS___TVSettingsDisplayModeFacade,  "sharedInstance"));
        uint64_t v27 = v21;
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioVideoViewController editingItem](v21, "editingItem"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 keyPath]);

        if ([v23 isEqual:@"selectedSDRColorMappingMode"]
          && [v20 SDRColorMapping] == (id)538424319
          || [v23 isEqual:@"selectedSDRChromaMode"]
          && [v20 SDRChromaSubsampling] == (id)538424063
          || [v23 isEqual:@"selectedHDRChromaMode"]
          && [v20 HDR10ChromaSubsampling] == (id)538424063)
        {
          if (v13)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioVideoViewController navigationController](self, "navigationController"));
            id v25 = [v24 popViewControllerAnimated:1];
          }

          else
          {
            -[TVSettingsAudioVideoViewController dismissViewControllerAnimated:completion:]( self,  "dismissViewControllerAnimated:completion:",  1LL,  0LL);
          }
        }
      }
    }

    -[TVSettingsAudioVideoViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  else if (off_1001DF9E0 == a6 || off_1001DF9E8 == a6 || off_1001DF9F0 == a6)
  {
    -[TVSettingsAudioVideoViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  else
  {
    v28.receiver = self;
    v28.super_class = (Class)&OBJC_CLASS___TVSettingsAudioVideoViewController;
    -[TVSettingsAudioVideoViewController observeValueForKeyPath:ofObject:change:context:]( &v28,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (BOOL)_areDisplayFiltersEnabled
{
  BOOL v2 = 1;
  if (!MADisplayFilterPrefGetCategoryEnabled(1LL, a2)) {
    return MADisplayFilterPrefGetCategoryEnabled(2LL, v3)
  }
  return v2;
}

+ (BOOL)_hardwareSupportsAC3Decode
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  unsigned __int8 v3 = [v2 isDolbyDigitalEncoderAvailable];

  return v3;
}

- (void)_handleEnableWiderAspectRatios
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TVSettingsDisplayModeFacade sharedInstance](&OBJC_CLASS___TVSettingsDisplayModeFacade, "sharedInstance"));
  [v2 setPreferredDisplaySizeIdentifier:PBSDisplaySizeIdentifierAutomatic];
}

- (void)_promptResetVideoSettings
{
  uint64_t v3 = TSKLocString(@"AVRestoreDefaultDisplayModeAlertTitle");
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v4 = TSKLocString(@"AVRestoreDefaultDisplayModeAlertSubtitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = TSKLocString(@"AVRestoreDefaultDisplayModeAlertFooterSupport");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = TSKLocString(@"AVRestoreDefaultDisplayMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = TSKLocString(@"AVRestoreDefaultDisplayModeAlertCancel");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (_os_feature_enabled_impl("PineBoard", "Newport"))
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v20,  v5,  1LL));
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100048404;
    v23[3] = &unk_10018F4E8;
    objc_copyWeak(&v24, &location);
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  2LL,  v23));
    [v12 addAction:v13];
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  1LL,  0LL));
    [v12 addAction:v14];
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUtilities _attributedStringForAlertDetailMessage:]( &OBJC_CLASS___TVSettingsUtilities,  "_attributedStringForAlertDetailMessage:",  v7));
    [v12 _setAttributedDetailMessage:v15];
    -[TVSettingsAudioVideoViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v12,  1LL,  0LL);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  else
  {
    id v16 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
    v26 = v7;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    id v12 = [v16 initWithTitle:v20 text:v5 footers:v17];

    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100048528;
    v21[3] = &unk_10018E810;
    objc_copyWeak(&v22, &location);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v9,  1LL,  v21));
    [v12 addButton:v18];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v11,  0LL,  0LL));
    [v12 addButton:v19];
    [v12 setPreferredButton:v19];
    -[TVSettingsAudioVideoViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v12,  1LL,  0LL);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (TSKSettingItem *)a5;
  id v11 = v10;
  if (self->_wirelessAudioSyncItem == v10 || self->_displayAdjustmentItem == v10)
  {
    -[TVSettingsAudioVideoViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___TVSettingsAudioVideoViewController;
    -[TVSettingsAudioVideoViewController editingController:didProvideValue:forSettingItem:]( &v12,  "editingController:didProvideValue:forSettingItem:",  v8,  v9,  v10);
  }
}

- (TSKSettingItem)wirelessAudioSyncItem
{
  return self->_wirelessAudioSyncItem;
}

- (void)setWirelessAudioSyncItem:(id)a3
{
}

- (TSKSettingItem)displayAdjustmentItem
{
  return self->_displayAdjustmentItem;
}

- (void)setDisplayAdjustmentItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end