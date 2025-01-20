@interface AXTVZoomViewController
- (id)_zoomLevelFormatter;
- (id)_zoomLevels;
- (id)loadSettingGroups;
@end

@implementation AXTVZoomViewController

- (id)loadSettingGroups
{
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v12 = AXTVLocString(@"AXZoomTitle", v5, v6, v7, v8, v9, v10, v11, v44);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v13,  0LL,  v49,  @"zoomEnabled",  0LL,  0LL));

  [v14 setEnabledInStoreDemoMode:1];
  v50 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
  -[NSMutableParagraphStyle setAlignment:](v50, "setAlignment:", 4LL);
  v57[0] = NSFontAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager bodyFont](&OBJC_CLASS___TVThemeManager, "bodyFont"));
  v57[1] = NSParagraphStyleAttributeName;
  v58[0] = v15;
  v58[1] = v50;
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  2LL));

  v16 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  id v24 = AXTVLocString(@"AXZoomDescription", v17, v18, v19, v20, v21, v22, v23, v45);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = -[NSAttributedString initWithString:attributes:](v16, "initWithString:attributes:", v25, v48);

  [v3 setAttributedLocalizedDescription:v26];
  v47 = v4;
  -[NSMutableArray addObject:](v4, "addObject:", v14);
  [v3 setSettingItems:v4];
  id v27 = [[TSKSettingGroup alloc] initWithTitle:0];
  v28 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v36 = AXTVLocString(@"AXZoomMaxLevelTitle", v29, v30, v31, v32, v33, v34, v35, v46);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_19080;
  v54[3] = &unk_65200;
  id v55 = v2;
  id v38 = v2;
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v37,  0LL,  v38,  @"zoomPreferredMaximumZoomScale",  v54));

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVZoomViewController _zoomLevelFormatter](self, "_zoomLevelFormatter"));
  [v39 setLocalizedValueFormatter:v40];

  [v39 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v28, "addObject:", v39);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1925C;
  v52[3] = &unk_65228;
  id v53 = v49;
  id v41 = v49;
  [v27 setUpdateBlock:v52];
  [v27 setSettingItems:v28];
  v56[0] = v3;
  v56[1] = v27;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 2LL));

  return v42;
}

- (id)_zoomLevelFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65C68];
}

- (id)_zoomLevels
{
  return &off_70000;
}

@end