@interface AXTVLightSensitivityViewController
- (id)loadSettingGroups;
@end

@implementation AXTVLightSensitivityViewController

- (id)loadSettingGroups
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v11 = AXTVLocString(@"AXLightSensitivityDescription", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v39);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v3 setLocalizedDescription:v12];

  v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v21 = AXTVLocString(@"AXLightSensitivityTitle", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v22,  0LL,  v2,  @"displayFilterCategoryLightSensitivityEnabled",  0LL,  0LL));

  [v23 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v13, "addObject:", v23);
  id v31 = AXTVLocString(@"AXIntensityTitle", v24, v25, v26, v27, v28, v29, v30, (uint64_t)v39);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_326CC;
  v44[3] = &unk_65200;
  id v33 = v2;
  id v45 = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v32,  0LL,  v33,  @"displayFilterBrightnessIntensity",  v44));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils percentageFormtter](&OBJC_CLASS___AXTVUtils, "percentageFormtter"));
  [v34 setLocalizedValueFormatter:v35];

  [v34 setEnabledInStoreDemoMode:1];
  v39 = _NSConcreteStackBlock;
  uint64_t v40 = 3221225472LL;
  v41 = sub_327FC;
  v42 = &unk_65228;
  id v43 = v33;
  id v36 = v33;
  [v34 setUpdateBlock:&v39];
  -[NSMutableArray addObject:](v13, "addObject:", v34, v39, v40, v41, v42);
  [v3 setSettingItems:v13];
  id v46 = v3;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));

  return v37;
}

@end