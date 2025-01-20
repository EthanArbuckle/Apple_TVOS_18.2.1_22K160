@interface AXTVVoiceOverViewController
- (AXSpeechSettingsModelController)speechModelController;
- (id)loadSettingGroups;
- (id)voiceVariantChangedToken;
- (void)_setVoiceNameForSettingItem:(id)a3;
- (void)dealloc;
- (void)setSpeechModelController:(id)a3;
- (void)setVoiceVariantChangedToken:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVVoiceOverViewController

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVVoiceOverViewController voiceVariantChangedToken](self, "voiceVariantChangedToken"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVVoiceOverViewController voiceVariantChangedToken](self, "voiceVariantChangedToken"));
    [v4 removeObserver:v5];

    -[AXTVVoiceOverViewController setVoiceVariantChangedToken:](self, "setVoiceVariantChangedToken:", 0LL);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXTVVoiceOverViewController;
  -[AXTVVoiceOverViewController dealloc](&v6, "dealloc");
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVVoiceOverViewController;
  -[AXTVVoiceOverViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_reloadVoiceName:" name:@"AXReloadVoiceName" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVVoiceOverViewController;
  -[AXTVVoiceOverViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVVoiceOverViewController speechModelController](self, "speechModelController"));
  [v4 refreshAssetCatalog:1 downloadSamplesIfNeeded:1 restartMigrationIfNeeded:1];
}

- (AXSpeechSettingsModelController)speechModelController
{
  speechModelController = self->_speechModelController;
  if (!speechModelController)
  {
    objc_super v4 = objc_alloc_init(&OBJC_CLASS___AXSpeechSettingsModelController);
    objc_super v5 = self->_speechModelController;
    self->_speechModelController = v4;

    speechModelController = self->_speechModelController;
  }

  return speechModelController;
}

- (void)_setVoiceNameForSettingItem:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 systemLanguageID]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 speechVoiceIdentifierForLanguage:v6 sourceKey:AXSpeechSourceKeyVoiceOver exists:0]);

  uint64_t v7 = AXVoiceNameForVoiceId(v9, 1LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v3 setLocalizedValue:v8];
  [v3 setDirty:1];
}

- (id)loadSettingGroups
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v292 = [[TSKSettingGroup alloc] initWithTitle:0];
  objc_super v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v13 = AXTVLocString(@"AXVoiceOverTitle", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v265);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v22 = AXTVLocString(@"AXVoiceOverDescription", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v266);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v14,  v23,  v3,  @"voiceOverEnabled",  0LL,  0LL));

  [v24 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v5, "addObject:", v24);
  id v32 = AXTVLocString(@"AXVoiceOverPracticeTitle", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v267);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  id v34 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v33,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVVoiceOverPracticeViewController));
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  [v35 setEnabledInStoreDemoMode:1];
  v302[0] = _NSConcreteStackBlock;
  v302[1] = 3221225472LL;
  v302[2] = sub_13E24;
  v302[3] = &unk_65228;
  id v288 = v3;
  id v303 = v288;
  [v35 setUpdateBlock:v302];
  -[NSMutableArray addObject:](v5, "addObject:", v35);
  [v292 setSettingItems:v5];
  id v291 = [[TSKSettingGroup alloc] initWithTitle:0];
  v36 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

  id v44 = AXTVLocString(@"AXVoiceOverNavigationStyleTitle", v37, v38, v39, v40, v41, v42, v43, (uint64_t)v268);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  id v53 = AXTVLocString(@"AXVoiceOverNavigationStyleFollowFocus", v46, v47, v48, v49, v50, v51, v52, (uint64_t)v269);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  id v62 = AXTVLocString(@"AXVoiceOverNavigationStyleDirectTouch", v55, v56, v57, v58, v59, v60, v61, (uint64_t)v270);
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v45,  0LL,  v4,  @"voiceOverPrefersFollowFocusNavigationStyle",  v54,  v63));

  [v64 setEnabledInStoreDemoMode:1];
  if (AXIsInternalInstall(-[NSMutableArray addObject:](v36, "addObject:", v64)))
  {
    id v72 = AXTVLocString(@"AXVoiceOverFocusEverywhereTitle", v65, v66, v67, v68, v69, v70, v71, (uint64_t)v271);
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
    id v81 = AXTVLocString( @"AXVoiceOverFocusEverywhereDescription",  v74,  v75,  v76,  v77,  v78,  v79,  v80,  (uint64_t)v272);
    v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v73,  v82,  v4,  @"voiceOverShouldFocusEverywhere",  0LL,  0LL));

    -[NSMutableArray addObject:](v36, "addObject:", v83);
    id v91 = AXTVLocString(@"AXVoiceOverCaptionPanelTitle", v84, v85, v86, v87, v88, v89, v90, (uint64_t)v273);
    v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
    id v100 = AXTVLocString(@"AXVoiceOverCaptionPanelDescription", v93, v94, v95, v96, v97, v98, v99, (uint64_t)v274);
    v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
    v64 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v92,  v101,  v4,  @"enableVoiceOverCaptions",  0LL,  0LL));

    -[NSMutableArray addObject:](v36, "addObject:", v64);
  }

  [v291 setSettingItems:v36];
  id v290 = [[TSKSettingGroup alloc] initWithTitle:0];
  v102 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

  id v110 = AXTVLocString(@"AXVoiceOverVerbosityTitle", v103, v104, v105, v106, v107, v108, v109, (uint64_t)v271);
  v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
  id v112 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v111,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVVoiceOverVerbosityViewController));
  v113 = (void *)objc_claimAutoreleasedReturnValue(v112);

  [v113 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v102, "addObject:", v113);
  id v121 = AXTVLocString(@"AXVoiceOverAudioDuckingTitle", v114, v115, v116, v117, v118, v119, v120, (uint64_t)v275);
  v122 = (void *)objc_claimAutoreleasedReturnValue(v121);
  id v123 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v122,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVVoiceOverAudioDuckingViewController));
  v124 = (void *)objc_claimAutoreleasedReturnValue(v123);

  [v124 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v102, "addObject:", v124);
  [v290 setSettingItems:v102];
  id v125 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v133 = AXTVLocString(@"AXSpeechSectionTitle", v126, v127, v128, v129, v130, v131, v132, (uint64_t)v276);
  v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
  id v289 = [v125 initWithTitle:v134];

  v135 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_initWeak(&location, self);
  id v143 = AXTVLocString(@"AXVoiceOverVoiceTitle", v136, v137, v138, v139, v140, v141, v142, (uint64_t)v277);
  v144 = (void *)objc_claimAutoreleasedReturnValue(v143);
  v299[0] = _NSConcreteStackBlock;
  v299[1] = 3221225472LL;
  v299[2] = sub_13E68;
  v299[3] = &unk_65318;
  objc_copyWeak(&v300, &location);
  v145 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v144,  0LL,  0LL,  0LL,  v299));

  v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v147 = AXTVVoiceVariantWasSelectedNotification;
  v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v297[0] = _NSConcreteStackBlock;
  v297[1] = 3221225472LL;
  v297[2] = sub_13F0C;
  v297[3] = &unk_65A68;
  objc_copyWeak(&v298, &location);
  v149 = (void *)objc_claimAutoreleasedReturnValue([v146 addObserverForName:v147 object:0 queue:v148 usingBlock:v297]);
  -[AXTVVoiceOverViewController setVoiceVariantChangedToken:](self, "setVoiceVariantChangedToken:", v149);

  v295[0] = _NSConcreteStackBlock;
  v295[1] = 3221225472LL;
  v295[2] = sub_13F38;
  v295[3] = &unk_65798;
  objc_copyWeak(&v296, &location);
  [v145 setUpdateBlock:v295];
  -[AXTVVoiceOverViewController _setVoiceNameForSettingItem:](self, "_setVoiceNameForSettingItem:", v145);
  [v145 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v135, "addObject:", v145);
  id v157 = AXTVLocString(@"AXSpeechPronunciationsTitle", v150, v151, v152, v153, v154, v155, v156, (uint64_t)&v300);
  v158 = (void *)objc_claimAutoreleasedReturnValue(v157);
  id v159 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v158,  0LL,  @"Pronunciations",  0LL,  objc_opt_class(&OBJC_CLASS___AXTVSpeechPronunciationsViewController));
  v160 = (void *)objc_claimAutoreleasedReturnValue(v159);

  [v160 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v135, "addObject:", v160);
  id v168 = AXTVLocString(@"AXSpeechRateTitle", v161, v162, v163, v164, v165, v166, v167, (uint64_t)v278);
  v169 = (void *)objc_claimAutoreleasedReturnValue(v168);
  v293[0] = _NSConcreteStackBlock;
  v293[1] = 3221225472LL;
  v293[2] = sub_13F80;
  v293[3] = &unk_65200;
  id v170 = v4;
  id v294 = v170;
  v171 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v169,  0LL,  v170,  @"voiceOverSpeakingRate",  v293));

  v172 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils percentageFormtter](&OBJC_CLASS___AXTVUtils, "percentageFormtter"));
  [v171 setLocalizedValueFormatter:v172];

  [v171 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v135, "addObject:", v171);
  id v180 = AXTVLocString(@"AXUsePitchTitle", v173, v174, v175, v176, v177, v178, v179, (uint64_t)v279);
  v181 = (void *)objc_claimAutoreleasedReturnValue(v180);
  id v189 = AXTVLocString(@"AXUsePitchDescription", v182, v183, v184, v185, v186, v187, v188, (uint64_t)v280);
  v190 = (void *)objc_claimAutoreleasedReturnValue(v189);
  v191 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v181,  v190,  v170,  @"voiceOverPitchChangeEnabled",  0LL,  0LL));

  [v191 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v135, "addObject:", v191);
  [v289 setSettingItems:v135];
  id v192 = [[TSKSettingGroup alloc] initWithTitle:0];
  v193 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

  id v201 = AXTVLocString(@"AXVoiceOverRotorTitle", v194, v195, v196, v197, v198, v199, v200, (uint64_t)v281);
  v202 = (void *)objc_claimAutoreleasedReturnValue(v201);
  id v203 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v202,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVVoiceOverRotorViewController));
  v204 = (void *)objc_claimAutoreleasedReturnValue(v203);

  [v204 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v193, "addObject:", v204);
  [v192 setSettingItems:v193];
  id v205 = [[TSKSettingGroup alloc] initWithTitle:0];
  v206 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

  id v214 = AXTVLocString(@"AXBrailleTitle", v207, v208, v209, v210, v211, v212, v213, (uint64_t)v282);
  v215 = (void *)objc_claimAutoreleasedReturnValue(v214);
  id v216 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v215,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVBrailleSettingsViewController));
  v217 = (void *)objc_claimAutoreleasedReturnValue(v216);

  [v217 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v206, "addObject:", v217);
  [v205 setSettingItems:v206];
  id v218 = [[TSKSettingGroup alloc] initWithTitle:0];
  v219 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

  id v227 = AXTVLocString(@"AXVoiceOverDoubleClickTimeout", v220, v221, v222, v223, v224, v225, v226, (uint64_t)v283);
  v228 = (void *)objc_claimAutoreleasedReturnValue(v227);
  v229 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v228,  0LL,  v170,  @"voiceOverDoubleTapInterval",  &off_6FF88));

  v230 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils shortStyleDurationFormatter](&OBJC_CLASS___AXTVUtils, "shortStyleDurationFormatter"));
  [v229 setLocalizedValueFormatter:v230];

  [v229 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v219, "addObject:", v229);
  [v218 setSettingItems:v219];
  id v231 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v239 = AXTVLocString(@"AXAudioSectionTitle", v232, v233, v234, v235, v236, v237, v238, (uint64_t)v284);
  v240 = (void *)objc_claimAutoreleasedReturnValue(v239);
  id v241 = [v231 initWithTitle:v240];

  v242 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v250 = AXTVLocString(@"AXAudioChannels", v243, v244, v245, v246, v247, v248, v249, (uint64_t)v285);
  v251 = (void *)objc_claimAutoreleasedReturnValue(v250);
  id v259 = AXTVLocString(@"AXAudioChannelDescription", v252, v253, v254, v255, v256, v257, v258, (uint64_t)v286);
  v260 = (void *)objc_claimAutoreleasedReturnValue(v259);
  id v261 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v251,  v260,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVVoiceOverAudioChannelController));
  v262 = (void *)objc_claimAutoreleasedReturnValue(v261);

  [v262 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v242, "addObject:", v262);
  [v241 setSettingItems:v242];
  v304[0] = v292;
  v304[1] = v291;
  v304[2] = v290;
  v304[3] = v289;
  v304[4] = v192;
  v304[5] = v205;
  v304[6] = v218;
  v304[7] = v241;
  v263 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v304, 8LL));

  objc_destroyWeak(&v296);
  objc_destroyWeak(&v298);
  objc_destroyWeak(v287);
  objc_destroyWeak(&location);

  return v263;
}

- (id)voiceVariantChangedToken
{
  return self->_voiceVariantChangedToken;
}

- (void)setVoiceVariantChangedToken:(id)a3
{
}

- (void)setSpeechModelController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end