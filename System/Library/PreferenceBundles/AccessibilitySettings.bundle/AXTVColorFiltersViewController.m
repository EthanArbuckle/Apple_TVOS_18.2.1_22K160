@interface AXTVColorFiltersViewController
- (id)_blueColorCorrectionDetailsGroup;
- (id)_colorCellItemWithName:(id)a3 keyPath:(id)a4 updateBlock:(id)a5;
- (id)_enableColorFiltersGroup;
- (id)_greenColorCorrectionDetailsGroup;
- (id)_redColorCorrectionDetailsGroup;
- (id)_selectColorFilterGroup;
- (id)_tintSingleColorDetailsGroup;
- (id)loadSettingGroups;
- (void)_didClickColorFilterCell:(id)a3;
@end

@implementation AXTVColorFiltersViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVColorFiltersViewController _enableColorFiltersGroup](self, "_enableColorFiltersGroup"));
  [v3 axSafelyAddObject:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVColorFiltersViewController _selectColorFilterGroup](self, "_selectColorFilterGroup"));
  [v3 axSafelyAddObject:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVColorFiltersViewController _redColorCorrectionDetailsGroup]( self,  "_redColorCorrectionDetailsGroup"));
  [v3 axSafelyAddObject:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVColorFiltersViewController _greenColorCorrectionDetailsGroup]( self,  "_greenColorCorrectionDetailsGroup"));
  [v3 axSafelyAddObject:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVColorFiltersViewController _blueColorCorrectionDetailsGroup]( self,  "_blueColorCorrectionDetailsGroup"));
  [v3 axSafelyAddObject:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVColorFiltersViewController _tintSingleColorDetailsGroup](self, "_tintSingleColorDetailsGroup"));
  [v3 axSafelyAddObject:v9];

  return v3;
}

- (id)_enableColorFiltersGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  id v3 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v11 = AXTVLocString(@"AXColorFiltersDescription", v4, v5, v6, v7, v8, v9, v10, v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v3 setLocalizedDescription:v12];

  v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v21 = AXTVLocString(@"AXColorFiltersTitle", v14, v15, v16, v17, v18, v19, v20, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v22,  0LL,  v2,  @"displayFilterCategoryColorEnabled",  0LL,  0LL));

  [v23 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v13, "addObject:", v23);
  [v3 setSettingItems:v13];

  return v3;
}

- (id)_colorCellItemWithName:(id)a3 keyPath:(id)a4 updateBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v10,  0LL,  v11,  v9,  self,  "_didClickColorFilterCell:"));

  [v12 setUpdateBlock:v8];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils everythingToNilValueFormatter](&OBJC_CLASS___AXTVUtils, "everythingToNilValueFormatter"));
  [v12 setLocalizedValueFormatter:v13];

  [v12 setEnabledInStoreDemoMode:1];
  return v12;
}

- (id)_selectColorFilterGroup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  id v4 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v12 = AXTVLocString(@"AXColorFiltersDescription", v5, v6, v7, v8, v9, v10, v11, v68);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v4 setLocalizedDescription:v13];

  uint64_t v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_35E2C;
  v74[3] = &unk_65228;
  id v75 = v3;
  id v15 = v3;
  uint64_t v16 = objc_retainBlock(v74);
  id v24 = AXTVLocString(@"AXColorFilterGrayscaleTitle", v17, v18, v19, v20, v21, v22, v23, v69);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVColorFiltersViewController _colorCellItemWithName:keyPath:updateBlock:]( self,  "_colorCellItemWithName:keyPath:updateBlock:",  v25,  @"displayFilterGrayscaleEnabled",  v16));
  -[NSMutableArray addObject:](v14, "addObject:", v26);

  id v34 = AXTVLocString(@"AXColorFilterRedAdjustTitle", v27, v28, v29, v30, v31, v32, v33, v70);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVColorFiltersViewController _colorCellItemWithName:keyPath:updateBlock:]( self,  "_colorCellItemWithName:keyPath:updateBlock:",  v35,  @"displayFilterRedColorCorrectionEnabled",  v16));
  -[NSMutableArray addObject:](v14, "addObject:", v36);

  id v44 = AXTVLocString(@"AXColorFilterGreenAdjustTitle", v37, v38, v39, v40, v41, v42, v43, v71);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVColorFiltersViewController _colorCellItemWithName:keyPath:updateBlock:]( self,  "_colorCellItemWithName:keyPath:updateBlock:",  v45,  @"displayFilterGreenColorCorrectionEnabled",  v16));
  -[NSMutableArray addObject:](v14, "addObject:", v46);

  id v54 = AXTVLocString(@"AXColorFilterBlueAdjustTitle", v47, v48, v49, v50, v51, v52, v53, v72);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVColorFiltersViewController _colorCellItemWithName:keyPath:updateBlock:]( self,  "_colorCellItemWithName:keyPath:updateBlock:",  v55,  @"displayFilterBlueColorCorrectionEnabled",  v16));
  -[NSMutableArray addObject:](v14, "addObject:", v56);

  id v64 = AXTVLocString(@"AXColorFilterColorTintTitle", v57, v58, v59, v60, v61, v62, v63, v73);
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue( -[AXTVColorFiltersViewController _colorCellItemWithName:keyPath:updateBlock:]( self,  "_colorCellItemWithName:keyPath:updateBlock:",  v65,  @"displayFilterTintSingleColorEnabled",  v16));
  -[NSMutableArray addObject:](v14, "addObject:", v66);

  [v4 setSettingItems:v14];
  return v4;
}

- (id)_redColorCorrectionDetailsGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v11 = AXTVLocString(@"AXColorFilterRedAdjustTitle", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v38);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v3 initWithTitle:v12];

  id v21 = AXTVLocString(@"AXColorFiltersDescription", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v38);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v13 setLocalizedDescription:v22];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_360A4;
  v43[3] = &unk_65228;
  id v23 = v2;
  id v44 = v23;
  [v13 setUpdateBlock:v43];
  id v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v32 = AXTVLocString(@"AXIntensityTitle", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v38);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  uint64_t v38 = _NSConcreteStackBlock;
  uint64_t v39 = 3221225472LL;
  uint64_t v40 = sub_360FC;
  uint64_t v41 = &unk_65200;
  id v42 = v23;
  id v34 = v23;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v33,  0LL,  v34,  @"displayFilterRedColorCorrectionIntensity",  &v38));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils percentageFormtter](&OBJC_CLASS___AXTVUtils, "percentageFormtter", v38, v39, v40, v41));
  [v35 setLocalizedValueFormatter:v36];

  [v35 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v24, "addObject:", v35);
  [v13 setSettingItems:v24];

  return v13;
}

- (id)_greenColorCorrectionDetailsGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v11 = AXTVLocString(@"AXColorFilterGreenAdjustTitle", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v38);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v3 initWithTitle:v12];

  id v21 = AXTVLocString(@"AXColorFiltersDescription", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v38);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v13 setLocalizedDescription:v22];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_36400;
  v43[3] = &unk_65228;
  id v23 = v2;
  id v44 = v23;
  [v13 setUpdateBlock:v43];
  id v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v32 = AXTVLocString(@"AXIntensityTitle", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v38);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  uint64_t v38 = _NSConcreteStackBlock;
  uint64_t v39 = 3221225472LL;
  uint64_t v40 = sub_36458;
  uint64_t v41 = &unk_65200;
  id v42 = v23;
  id v34 = v23;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v33,  0LL,  v34,  @"displayFilterGreenColorCorrectionIntensity",  &v38));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils percentageFormtter](&OBJC_CLASS___AXTVUtils, "percentageFormtter", v38, v39, v40, v41));
  [v35 setLocalizedValueFormatter:v36];

  [v35 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v24, "addObject:", v35);
  [v13 setSettingItems:v24];

  return v13;
}

- (id)_blueColorCorrectionDetailsGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v11 = AXTVLocString(@"AXColorFilterBlueAdjustTitle", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v38);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v3 initWithTitle:v12];

  id v21 = AXTVLocString(@"AXColorFiltersDescription", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v38);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v13 setLocalizedDescription:v22];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_3675C;
  v43[3] = &unk_65228;
  id v23 = v2;
  id v44 = v23;
  [v13 setUpdateBlock:v43];
  id v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v32 = AXTVLocString(@"AXIntensityTitle", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v38);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  uint64_t v38 = _NSConcreteStackBlock;
  uint64_t v39 = 3221225472LL;
  uint64_t v40 = sub_367B4;
  uint64_t v41 = &unk_65200;
  id v42 = v23;
  id v34 = v23;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v33,  0LL,  v34,  @"displayFilterBlueColorCorrectionIntensity",  &v38));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils percentageFormtter](&OBJC_CLASS___AXTVUtils, "percentageFormtter", v38, v39, v40, v41));
  [v35 setLocalizedValueFormatter:v36];

  [v35 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v24, "addObject:", v35);
  [v13 setSettingItems:v24];

  return v13;
}

- (id)_tintSingleColorDetailsGroup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVSettingsFacade sharedInstance](&OBJC_CLASS___AXTVSettingsFacade, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v11 = AXTVLocString(@"AXColorFilterColorTintTitle", v4, v5, v6, v7, v8, v9, v10, v50);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v3 initWithTitle:v12];

  id v21 = AXTVLocString(@"AXColorFiltersDescription", v14, v15, v16, v17, v18, v19, v20, v51);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  [v13 setLocalizedDescription:v22];

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_36B70;
  v58[3] = &unk_65228;
  id v23 = v2;
  id v59 = v23;
  [v13 setUpdateBlock:v58];
  id v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v32 = AXTVLocString(@"AXIntensityTitle", v25, v26, v27, v28, v29, v30, v31, v52);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_36BC8;
  v56[3] = &unk_65200;
  id v34 = v23;
  id v57 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v33,  0LL,  v34,  @"displayFilterTintSingleColorIntensity",  v56));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils percentageFormtter](&OBJC_CLASS___AXTVUtils, "percentageFormtter"));
  [v35 setLocalizedValueFormatter:v36];

  [v35 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v24, "addObject:", v35);
  id v44 = AXTVLocString(@"AXColorHueTitle", v37, v38, v39, v40, v41, v42, v43, v53);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_36CF8;
  v54[3] = &unk_65200;
  id v55 = v34;
  id v46 = v34;
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v45,  0LL,  v46,  @"displayFilterTintSingleColorHue",  v54));

  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils colorNameForHueFormatter](&OBJC_CLASS___AXTVUtils, "colorNameForHueFormatter"));
  [v47 setLocalizedValueFormatter:v48];

  [v47 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v24, "addObject:", v47);
  [v13 setSettingItems:v24];

  return v13;
}

- (void)_didClickColorFilterCell:(id)a3
{
  id v9 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v9 keyPath]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:v4]);
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v9 representedObject]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 keyPath]);
    [v7 setValue:&__kCFBooleanTrue forKey:v8];
  }
}

@end