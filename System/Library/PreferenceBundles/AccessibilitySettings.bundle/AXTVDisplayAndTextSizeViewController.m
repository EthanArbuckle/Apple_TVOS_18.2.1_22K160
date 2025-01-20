@interface AXTVDisplayAndTextSizeViewController
- (id)loadSettingGroups;
- (void)dealloc;
- (void)toggleBoldText:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXTVDisplayAndTextSizeViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVDisplayAndTextSizeViewController;
  -[AXTVDisplayAndTextSizeViewController viewDidLoad](&v4, "viewDidLoad");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_31C54,  kMADisplayFilterSettingsChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kMADisplayFilterSettingsChangedNotification, 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVDisplayAndTextSizeViewController;
  -[AXTVDisplayAndTextSizeViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  v199 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v14 = AXTVLocString(@"AXBoldTextTitle", v7, v8, v9, v10, v11, v12, v13, v182);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v15,  0LL,  v3,  @"boldTextEnabled",  self,  "toggleBoldText:"));

  [v16 setEnabledInStoreDemoMode:1];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v16 setLocalizedValueFormatter:v17];

  [v6 addObject:v16];
  id v25 = AXTVLocString(@"AXDisplayTextGroupTitle", v18, v19, v20, v21, v22, v23, v24, v183);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v26,  v6));
  [v5 addObject:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v36 = AXTVLocString(@"AXReduceTransparencyTitle", v29, v30, v31, v32, v33, v34, v35, v184);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v37,  0LL,  v3,  @"reduceTransparencyEnabled",  0LL,  0LL));

  [v38 setEnabledInStoreDemoMode:1];
  id v46 = AXTVLocString(@"AXReduceTransparencyDescription", v39, v40, v41, v42, v43, v44, v45, v185);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  [v38 setLocalizedDescription:v47];

  [v28 addObject:v38];
  id v55 = AXTVLocString(@"AXIncreaseContrastTitle", v48, v49, v50, v51, v52, v53, v54, v186);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v56,  0LL,  v4,  @"increasedContrastEnabled",  0LL,  0LL));

  [v57 setEnabledInStoreDemoMode:1];
  id v65 = AXTVLocString(@"AXIncreaseContrastDescription", v58, v59, v60, v61, v62, v63, v64, v187);
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  [v57 setLocalizedDescription:v66];

  [v28 addObject:v57];
  id v74 = AXTVLocString(@"AXFocusStyleTitle", v67, v68, v69, v70, v71, v72, v73, v188);
  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v75,  0LL,  v3,  @"highContrastFocusIndicatorsEnabled",  &off_70108));

  [v76 setEnabledInStoreDemoMode:1];
  id v77 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_668E8];
  [v76 setLocalizedValueFormatter:v77];

  [v28 addObject:v76];
  id v85 = AXTVLocString(@"AXDisplayContrastGroupTitle", v78, v79, v80, v81, v82, v83, v84, v189);
  v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
  v87 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v86,  v28));
  [v5 addObject:v87];

  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v96 = AXTVLocString(@"AXDifferentiateWithoutColorTitle", v89, v90, v91, v92, v93, v94, v95, v190);
  v97 = (void *)objc_claimAutoreleasedReturnValue(v96);
  v98 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v97,  0LL,  v4,  @"differentiateWithoutColorEnabled",  0LL,  0LL));

  [v98 setEnabledInStoreDemoMode:1];
  id v106 = AXTVLocString(@"AXDifferentiateWithoutColorDescription", v99, v100, v101, v102, v103, v104, v105, v191);
  v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
  [v98 setLocalizedDescription:v107];

  [v88 addObject:v98];
  id v115 = AXTVLocString(@"AXColorFiltersTitle", v108, v109, v110, v111, v112, v113, v114, v192);
  v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
  id v117 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v116,  0LL,  v199,  @"displayFilterCategoryColorEnabled",  objc_opt_class(&OBJC_CLASS___AXTVColorFiltersViewController));
  v118 = (void *)objc_claimAutoreleasedReturnValue(v117);

  [v118 setEnabledInStoreDemoMode:1];
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v118 setLocalizedValueFormatter:v119];

  id v127 = AXTVLocString(@"AXColorFiltersDescription", v120, v121, v122, v123, v124, v125, v126, v193);
  v128 = (void *)objc_claimAutoreleasedReturnValue(v127);
  [v118 setLocalizedDescription:v128];

  [v88 addObject:v118];
  id v136 = AXTVLocString(@"AXLightSensitivityTitle", v129, v130, v131, v132, v133, v134, v135, v194);
  v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
  id v138 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v137,  0LL,  v199,  @"displayFilterCategoryLightSensitivityEnabled",  objc_opt_class(&OBJC_CLASS___AXTVLightSensitivityViewController));
  v139 = (void *)objc_claimAutoreleasedReturnValue(v138);

  [v139 setEnabledInStoreDemoMode:1];
  v140 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v139 setLocalizedValueFormatter:v140];

  id v148 = AXTVLocString(@"AXLightSensitivityDescription", v141, v142, v143, v144, v145, v146, v147, v195);
  v149 = (void *)objc_claimAutoreleasedReturnValue(v148);
  [v139 setLocalizedDescription:v149];

  [v88 addObject:v139];
  id v157 = AXTVLocString(@"AXReduceWhitePointTitle", v150, v151, v152, v153, v154, v155, v156, v196);
  v158 = (void *)objc_claimAutoreleasedReturnValue(v157);
  id v159 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v158,  0LL,  v199,  @"displayFilterCategoryReduceWhitePointEnabled",  objc_opt_class(&OBJC_CLASS___AXTVReduceWhitePointViewController));
  v160 = (void *)objc_claimAutoreleasedReturnValue(v159);

  [v160 setEnabledInStoreDemoMode:1];
  v161 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v160 setLocalizedValueFormatter:v161];

  id v169 = AXTVLocString(@"AXReduceWhitePointDescription", v162, v163, v164, v165, v166, v167, v168, v197);
  v170 = (void *)objc_claimAutoreleasedReturnValue(v169);
  [v160 setLocalizedDescription:v170];

  [v88 addObject:v160];
  id v178 = AXTVLocString(@"AXDisplayFiltersGroupTitle", v171, v172, v173, v174, v175, v176, v177, v198);
  v179 = (void *)objc_claimAutoreleasedReturnValue(v178);
  v180 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v179,  v88));
  [v5 addObject:v180];

  return v5;
}

- (void)toggleBoldText:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSKSettingItem valueForSettingItem:](&OBJC_CLASS___TSKSettingItem, "valueForSettingItem:", v3));
  unsigned int v5 = [v4 BOOLValue];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5 ^ 1));
  +[TSKSettingItem setValue:forSettingItem:](&OBJC_CLASS___TSKSettingItem, "setValue:forSettingItem:", v6, v3);
}

@end