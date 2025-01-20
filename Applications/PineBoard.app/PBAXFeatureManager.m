@interface PBAXFeatureManager
+ (id)sharedInstance;
- (BOOL)handleAXShortcutEvent;
- (NSArray)pendingUpdates;
- (NSTimer)updateTimer;
- (PBAXFeatureManager)init;
- (TVSStateMachine)stateMachine;
- (id)_currentConfigOptions;
- (id)_defaultTripleClickOptions;
- (id)_handleSetDefaultConfiguration:(id)a3;
- (id)_handleSetSingleAppConfiguration:(id)a3;
- (id)_updatesForConfigurationOptions:(id)a3;
- (id)updateCompletion;
- (void)_applyUpdatesWithOptions:(id)a3 completion:(id)a4;
- (void)_cancelPendingUpdates;
- (void)_initialzeStateMachine;
- (void)_servicePendingUpdates;
- (void)setPendingUpdates:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setUpdateCompletion:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PBAXFeatureManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019DCE8;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471278 != -1) {
    dispatch_once(&qword_100471278, block);
  }
  return (id)qword_100471270;
}

- (PBAXFeatureManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBAXFeatureManager;
  v2 = -[PBAXFeatureManager init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[PBAXFeatureManager _initialzeStateMachine](v2, "_initialzeStateMachine");
  }
  return v3;
}

- (BOOL)handleAXShortcutEvent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  uint64_t v4 = (uint64_t)[v3 accessibilityMenuOptions];

  if (v4)
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
    if (v4 <= 63)
    {
      switch(v4)
      {
        case 1LL:
          objc_msgSend(v77, "setVoiceOverEnabled:", objc_msgSend(v77, "voiceOverEnabled") ^ 1);
          break;
        case 2LL:
          objc_msgSend(v77, "setZoomEnabled:", objc_msgSend(v77, "zoomEnabled") ^ 1);
          break;
        case 3LL:
        case 5LL:
        case 6LL:
        case 7LL:
          goto LABEL_16;
        case 4LL:
          objc_msgSend( v76,  "setPreferSDHOverRegularSubtitles:",  objc_msgSend(v76, "preferSDHOverRegularSubtitles") ^ 1);
          break;
        case 8LL:
          objc_msgSend( v76,  "setPreferVideoDescriptions:",  objc_msgSend(v76, "preferVideoDescriptions") ^ 1);
          break;
        default:
          if (v4 != 32) {
            goto LABEL_16;
          }
          objc_msgSend(v77, "setSwitchControlEnabled:", objc_msgSend(v77, "switchControlEnabled") ^ 1);
          break;
      }

      goto LABEL_59;
    }

    if (v4 > 255)
    {
      if (v4 == 256)
      {
        objc_msgSend( v77,  "setDisplayFilterLightSensitivityEnabled:",  objc_msgSend(v77, "displayFilterLightSensitivityEnabled") ^ 1);
        goto LABEL_59;
      }

      if (v4 == 512)
      {
        objc_msgSend( v77,  "setDisplayFilterReduceWhitePointEnabled:",  objc_msgSend(v77, "displayFilterReduceWhitePointEnabled") ^ 1);
        goto LABEL_59;
      }
    }

    else
    {
      if (v4 == 64)
      {
LABEL_59:

        return v4 != 0;
      }

      if (v4 == 128)
      {
        objc_msgSend( v77,  "setDisplayFilterColorAdjustmentsEnabled:",  objc_msgSend(v77, "displayFilterColorAdjustmentsEnabled") ^ 1);
        goto LABEL_59;
      }
    }

- (void)updateWithConfiguration:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAXFeatureManager stateMachine](self, "stateMachine"));
    v7 = @"Configuration";
    id v8 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

    [v5 postEvent:@"Set Configuration" withContext:0 userInfo:v6];
  }

- (void)_initialzeStateMachine
{
  v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  id v4 = (objc_class *)objc_opt_class(self);
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  v6,  @"Initial",  0LL,  0LL);

  id v8 = sub_100083E10();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[TVSStateMachine setLogObject:](v7, "setLogObject:", v9);

  objc_initWeak(&location, self);
  v20[0] = @"Initial";
  v20[1] = @"Single App";
  v20[2] = @"Default";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10019EDF4;
  v17[3] = &unk_1003D0990;
  objc_copyWeak(&v18, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v7,  "registerHandlerForEvent:onStates:withBlock:",  @"Set Configuration",  v10,  v17);

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_10019EE90;
  v14 = &unk_1003D1740;
  objc_copyWeak(&v16, &location);
  id v15 = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Set Configuration",  @"Applying Settings",  &v11);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v7,  "registerHandlerForEvent:onState:withBlock:",  @"Update Complete",  @"Applying Settings",  &stru_1003DAFC8,  v11,  v12,  v13,  v14);
  objc_storeStrong((id *)&self->_stateMachine, v7);
  -[TVSStateMachine setShouldAcceptEvents:](v7, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)_handleSetSingleAppConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"PBAXSavedKioskConfigurationOptionsKey"]);

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAXFeatureManager _currentConfigOptions](self, "_currentConfigOptions"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v8 setObject:v7 forKey:@"PBAXSavedKioskConfigurationOptionsKey"];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAXFeatureManager stateMachine](self, "stateMachine"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 singleAppModeOptions]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10019F0D0;
  v14[3] = &unk_1003D63D8;
  id v15 = v9;
  id v16 = v4;
  id v11 = v4;
  id v12 = v9;
  -[PBAXFeatureManager _applyUpdatesWithOptions:completion:](self, "_applyUpdatesWithOptions:completion:", v10, v14);

  return @"Applying Settings";
}

- (id)_handleSetDefaultConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"PBAXSavedKioskConfigurationOptionsKey"]);

  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10019F2EC;
    v10[3] = &unk_1003D63D8;
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[PBAXFeatureManager stateMachine](self, "stateMachine"));
    id v12 = v4;
    id v7 = v11;
    -[PBAXFeatureManager _applyUpdatesWithOptions:completion:](self, "_applyUpdatesWithOptions:completion:", v6, v10);

    id v8 = @"Applying Settings";
  }

  else
  {
    id v8 = @"Default";
  }

  return (id)v8;
}

- (id)_currentConfigOptions
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 voiceOverEnabled]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v5, @"VoiceOverEnabled");

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 zoomEnabled]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, @"ZoomEnabled");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"InvertColorsEnabled");
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 preferSDHOverRegularSubtitles]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v7,  @"ClosedCaptionsEnabled");

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 preferVideoDescriptions]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v8,  @"AudioDescriptionsEnabled");

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 switchControlEnabled]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v9,  @"SwitchControlEnabled");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 displayFilterColorAdjustmentsEnabled]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v10,  @"ColorAdjustmentsDisabled");

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 displayFilterLightSensitivityEnabled]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v11,  @"LightSensitivityEnabled");

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 displayFilterReduceWhitePointEnabled]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v12,  @"ReduceWhitePointEnabled");

  unsigned __int16 v13 = (unsigned __int16)[v4 accessibilityMenuOptions];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v13 & 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v14,  @"VoiceOverShortcutEnabled");

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v13 & 2));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v15,  @"ZoomShortcutEnabled");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"InvertColorsShortcutEnabled");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v13 & 4));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v16,  @"ClosedCaptionsShortcutEnabled");

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v13 & 8));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v17,  @"AudioDescriptionsShortcutEnabled");

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v13 & 0x20));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v18,  @"SwitchControlShortcutEnabled");

  int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v13 & 0x800));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v19,  @"PhotosensitiveMitigationShortcutEnabled");

  if (_os_feature_enabled_impl("Accessibility", "HoverText"))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v13 & 0x400));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v20,  @"HoverTextShortcutEnabled");
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v13 & 0x80));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v21,  @"ColorAdjustmentsShortcutEnabled");

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v13 & 0x100));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v22,  @"LightSensitivityShortcutEnabled");

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v13 & 0x200));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v23,  @"ReduceWhitePointShortcutEnabled");

  id v24 = -[NSMutableDictionary copy](v2, "copy");
  return v24;
}

- (id)_updatesForConfigurationOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_10019FDA0;
  v80[3] = &unk_1003D7930;
  id v7 = v3;
  id v81 = v7;
  id v8 = v6;
  id v82 = v8;
  v9 = objc_retainBlock(v80);
  id v10 = [v9 copy];
  id v11 = objc_retainBlock(v10);
  -[NSMutableArray addObject:](v4, "addObject:", v11);

  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_10019FFD4;
  v77[3] = &unk_1003D7930;
  id v12 = v8;
  id v78 = v12;
  id v13 = v7;
  id v79 = v13;
  v14 = objc_retainBlock(v77);

  id v15 = [v14 copy];
  id v16 = objc_retainBlock(v15);
  -[NSMutableArray addObject:](v4, "addObject:", v16);

  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_1001A007C;
  v74[3] = &unk_1003D7930;
  id v17 = v12;
  id v75 = v17;
  id v18 = v13;
  id v76 = v18;
  int v19 = objc_retainBlock(v74);

  id v20 = [v19 copy];
  id v21 = objc_retainBlock(v20);
  -[NSMutableArray addObject:](v4, "addObject:", v21);

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_1001A0124;
  v71[3] = &unk_1003D7930;
  id v22 = v5;
  id v72 = v22;
  id v23 = v18;
  id v73 = v23;
  id v24 = objc_retainBlock(v71);

  id v25 = [v24 copy];
  id v26 = objc_retainBlock(v25);
  -[NSMutableArray addObject:](v4, "addObject:", v26);

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_1001A01CC;
  v68[3] = &unk_1003D7930;
  id v69 = v22;
  id v27 = v23;
  id v70 = v27;
  id v28 = v22;
  uint64_t v29 = objc_retainBlock(v68);

  id v30 = [v29 copy];
  id v31 = objc_retainBlock(v30);
  -[NSMutableArray addObject:](v4, "addObject:", v31);

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_1001A0274;
  v65[3] = &unk_1003D7930;
  id v32 = v17;
  id v66 = v32;
  id v33 = v27;
  id v67 = v33;
  v34 = objc_retainBlock(v65);

  id v35 = [v34 copy];
  id v36 = objc_retainBlock(v35);
  -[NSMutableArray addObject:](v4, "addObject:", v36);

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_1001A031C;
  v62[3] = &unk_1003D7930;
  id v37 = v32;
  id v63 = v37;
  id v38 = v33;
  id v64 = v38;
  v39 = objc_retainBlock(v62);

  id v40 = [v39 copy];
  id v41 = objc_retainBlock(v40);
  -[NSMutableArray addObject:](v4, "addObject:", v41);

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1001A03C4;
  v59[3] = &unk_1003D7930;
  id v42 = v37;
  id v60 = v42;
  id v43 = v38;
  id v61 = v43;
  v44 = objc_retainBlock(v59);

  id v45 = [v44 copy];
  id v46 = objc_retainBlock(v45);
  -[NSMutableArray addObject:](v4, "addObject:", v46);

  id v53 = _NSConcreteStackBlock;
  uint64_t v54 = 3221225472LL;
  v55 = sub_1001A046C;
  id v56 = &unk_1003D7930;
  id v57 = v42;
  id v58 = v43;
  id v47 = v43;
  id v48 = v42;
  v49 = objc_retainBlock(&v53);

  id v50 = objc_msgSend(v49, "copy", v53, v54, v55, v56);
  id v51 = objc_retainBlock(v50);
  -[NSMutableArray addObject:](v4, "addObject:", v51);

  return v4;
}

- (void)_applyUpdatesWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAXFeatureManager _updatesForConfigurationOptions:](self, "_updatesForConfigurationOptions:", a3));
  -[PBAXFeatureManager setPendingUpdates:](self, "setPendingUpdates:", v7);
  id v8 = [v6 copy];

  -[PBAXFeatureManager setUpdateCompletion:](self, "setUpdateCompletion:", v8);
  -[PBAXFeatureManager _servicePendingUpdates](self, "_servicePendingUpdates");
}

- (void)_servicePendingUpdates
{
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0LL;

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBAXFeatureManager pendingUpdates](self, "pendingUpdates"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001A0764;
  v14[3] = &unk_1003DAFF0;
  id v5 = [v4 mutableCopy];
  id v15 = v5;
  [v4 enumerateObjectsUsingBlock:v14];
  if ([v5 count]) {
    id v6 = [v5 copy];
  }
  else {
    id v6 = 0LL;
  }
  -[PBAXFeatureManager setPendingUpdates:](self, "setPendingUpdates:", v6);
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001A07CC;
    v11[3] = &unk_1003D17D0;
    objc_copyWeak(&v12, &location);
    id v7 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  0LL,  v11,  1.0));
    id v8 = self->_updateTimer;
    self->_updateTimer = v7;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBAXFeatureManager updateCompletion](self, "updateCompletion"));

    if (v9)
    {
      id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PBAXFeatureManager updateCompletion](self, "updateCompletion"));
      -[PBAXFeatureManager setUpdateCompletion:](self, "setUpdateCompletion:", 0LL);
      v10[2](v10, 1LL);
    }
  }
}

- (void)_cancelPendingUpdates
{
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0LL;

  -[PBAXFeatureManager setPendingUpdates:](self, "setPendingUpdates:", 0LL);
  id v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PBAXFeatureManager updateCompletion](self, "updateCompletion"));
  if (v4)
  {
    -[PBAXFeatureManager setUpdateCompletion:](self, "setUpdateCompletion:", 0LL);
    v4[2](v4, 0LL);
  }
}

- (id)_defaultTripleClickOptions
{
  return &off_1003FE8F0;
}

- (NSArray)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
}

- (id)updateCompletion
{
  return self->_updateCompletion;
}

- (void)setUpdateCompletion:(id)a3
{
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end