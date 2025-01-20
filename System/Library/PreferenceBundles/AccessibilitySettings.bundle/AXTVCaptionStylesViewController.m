@interface AXTVCaptionStylesViewController
- (id)_availableStylesFormatter;
- (id)loadSettingGroups;
@end

@implementation AXTVCaptionStylesViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
  v4 = objc_alloc(&OBJC_CLASS___AXValueAwareRadioSettingGroup);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 availableCaptionStyles]);
  v6 = -[AXValueAwareRadioSettingGroup initWithTitle:representedObject:keyPath:availableValues:]( v4,  "initWithTitle:representedObject:keyPath:availableValues:",  0LL,  v3,  @"activeCaptionStyle",  v5);

  -[AXValueAwareRadioSettingGroup setEnabledInStoreDemoMode:](v6, "setEnabledInStoreDemoMode:", 1LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStylesViewController _availableStylesFormatter](self, "_availableStylesFormatter"));
  -[AXValueAwareRadioSettingGroup setLocalizedValueFormatter:](v6, "setLocalizedValueFormatter:", v7);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_3380C;
  v25[3] = &unk_65228;
  id v26 = v3;
  id v8 = v3;
  -[AXValueAwareRadioSettingGroup setUpdateBlock:](v6, "setUpdateBlock:", v25);
  -[AXValueAwareRadioSettingGroup setItemUpdateBlock:](v6, "setItemUpdateBlock:", &stru_669B0);
  id v9 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v17 = AXTVLocString(@"AXCaptionEditStyles", v10, v11, v12, v13, v14, v15, v16, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v18,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVCaptionCustomStylesViewController));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v28 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  [v9 setSettingItems:v21];

  v27[0] = v6;
  v27[1] = v9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));

  return v22;
}

- (id)_availableStylesFormatter
{
  return [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_669F0];
}

@end