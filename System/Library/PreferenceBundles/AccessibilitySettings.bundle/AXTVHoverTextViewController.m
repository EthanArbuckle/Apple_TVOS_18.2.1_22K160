@interface AXTVHoverTextViewController
- (id)loadSettingGroups;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation AXTVHoverTextViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVHoverTextViewController;
  -[AXTVHoverTextViewController viewDidLoad](&v4, "viewDidLoad");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_20434,  kAXSHoverTextEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSHoverTextEnabledNotification, 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTVHoverTextViewController;
  -[AXTVHoverTextViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  objc_super v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v12 = AXTVLocString(@"AXHoverTextTitle", v5, v6, v7, v8, v9, v10, v11, v142);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v21 = AXTVLocString(@"AXHoverTextDescription", v14, v15, v16, v17, v18, v19, v20, v143);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v13,  v22,  v2,  @"hoverTextEnabled",  0LL,  0LL));

  [v23 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v4, "addObject:", v23);
  [v3 setSettingItems:v4];
  [v155 addObject:v3];
  id v24 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v32 = AXTVLocString(@"AXHoverTextTextGroupTitle", v25, v26, v27, v28, v29, v30, v31, v144);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  id v34 = [v24 initWithTitle:v33];

  v35 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v43 = AXTVLocString(@"AXHoverTextDisplayModeTitle", v36, v37, v38, v39, v40, v41, v42, v145);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v44,  0LL,  v2,  @"hoverTextDisplayMode",  &off_70048));

  id v46 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65F30];
  [v45 setLocalizedValueFormatter:v46];

  -[NSMutableArray addObject:](v35, "addObject:", v45);
  id v54 = AXTVLocString(@"AXHoverTextScrollingSpeedTitle", v47, v48, v49, v50, v51, v52, v53, v146);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v55,  0LL,  v2,  @"hoverTextScrollingSpeed",  &off_70060));

  id v57 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65F50];
  [v56 setLocalizedValueFormatter:v57];

  -[NSMutableArray addObject:](v35, "addObject:", v56);
  id v65 = AXTVLocString(@"AXHoverTextFontTitle", v58, v59, v60, v61, v62, v63, v64, v147);
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  id v67 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v66,  0LL,  v2,  @"hoverTextFontName",  objc_opt_class(&OBJC_CLASS___AXTVHoverTextFontPickerViewController));
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);

  [v68 setEnabledInStoreDemoMode:1];
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils hoverTextFontNameFormatter](&OBJC_CLASS___AXTVUtils, "hoverTextFontNameFormatter"));
  [v68 setLocalizedValueFormatter:v69];

  -[NSMutableArray addObject:](v35, "addObject:", v68);
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:weight:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:weight:",  5LL,  50.0));
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:weight:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:weight:",  5LL,  150.0));
  id v79 = AXTVLocString(@"AXHoverTextTextSizeTitle", v72, v73, v74, v75, v76, v77, v78, v148);
  v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
  v159[0] = _NSConcreteStackBlock;
  v159[1] = 3221225472LL;
  v159[2] = sub_20C20;
  v159[3] = &unk_65F98;
  id v81 = v2;
  id v160 = v81;
  id v161 = v70;
  id v162 = v71;
  id v156 = v71;
  id v154 = v70;
  v82 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v80,  0LL,  v81,  @"hoverTextFontSize",  v159));

  v83 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils hoverTextFontSizeFormatter](&OBJC_CLASS___AXTVUtils, "hoverTextFontSizeFormatter"));
  [v82 setLocalizedValueFormatter:v83];

  -[NSMutableArray addObject:](v35, "addObject:", v82);
  [v34 setSettingItems:v35];
  [v155 addObject:v34];
  id v84 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v92 = AXTVLocString(@"AXHoverTextColorGroupTitle", v85, v86, v87, v88, v89, v90, v91, v149);
  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  id v94 = [v84 initWithTitle:v93];

  v95 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v103 = AXTVLocString(@"AXHoverTextTextColorTitle", v96, v97, v98, v99, v100, v101, v102, v150);
  v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
  v105 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v104,  0LL,  v81,  @"hoverTextTextColor",  &stru_65FB8));

  v106 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils hoverTextTaggedColorFormatter](&OBJC_CLASS___AXTVUtils, "hoverTextTaggedColorFormatter"));
  [v105 setLocalizedValueFormatter:v106];

  -[NSMutableArray addObject:](v95, "addObject:", v105);
  id v114 = AXTVLocString(@"AXHoverTextBackgroundColorTitle", v107, v108, v109, v110, v111, v112, v113, v151);
  v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
  v116 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v115,  0LL,  v81,  @"hoverTextBackgroundColor",  &stru_66058));

  v117 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils hoverTextTaggedColorFormatter](&OBJC_CLASS___AXTVUtils, "hoverTextTaggedColorFormatter"));
  [v116 setLocalizedValueFormatter:v117];

  -[NSMutableArray addObject:](v95, "addObject:", v116);
  id v125 = AXTVLocString(@"AXHoverTextBackgroundOpacityTitle", v118, v119, v120, v121, v122, v123, v124, v152);
  v126 = (void *)objc_claimAutoreleasedReturnValue(v125);
  v157[0] = _NSConcreteStackBlock;
  v157[1] = 3221225472LL;
  v157[2] = sub_21044;
  v157[3] = &unk_65200;
  id v158 = v81;
  id v127 = v81;
  v128 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v126,  0LL,  v127,  @"hoverTextBackgroundOpacity",  v157));

  v129 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils percentageFormtter](&OBJC_CLASS___AXTVUtils, "percentageFormtter"));
  [v128 setLocalizedValueFormatter:v129];

  -[NSMutableArray addObject:](v95, "addObject:", v128);
  id v137 = AXTVLocString(@"AXHoverTextBorderColorTitle", v130, v131, v132, v133, v134, v135, v136, v153);
  v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
  v139 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v138,  0LL,  v127,  @"hoverTextBorderColor",  &stru_660D8));

  v140 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils hoverTextTaggedColorFormatter](&OBJC_CLASS___AXTVUtils, "hoverTextTaggedColorFormatter"));
  [v139 setLocalizedValueFormatter:v140];

  -[NSMutableArray addObject:](v95, "addObject:", v139);
  [v94 setSettingItems:v95];
  [v155 addObject:v94];

  return v155;
}

@end