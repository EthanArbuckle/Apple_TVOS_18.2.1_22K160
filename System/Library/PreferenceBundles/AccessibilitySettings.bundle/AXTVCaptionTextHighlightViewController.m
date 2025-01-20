@interface AXTVCaptionTextHighlightViewController
- (AXTVCaptionStyle)style;
- (id)loadSettingGroups;
- (void)setStyle:(id)a3;
@end

@implementation AXTVCaptionTextHighlightViewController

- (id)loadSettingGroups
{
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils captionColorFormatter](&OBJC_CLASS___AXTVUtils, "captionColorFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCaptionStyle defaultHighlightColor](&OBJC_CLASS___AXTVCaptionStyle, "defaultHighlightColor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities defaultValueFormatterWithFormatter:defaultValue:]( &OBJC_CLASS___AXTVCaptionUtilities,  "defaultValueFormatterWithFormatter:defaultValue:",  v62,  v3));

  v4 = objc_alloc(&OBJC_CLASS___AXValueAwareRadioSettingGroup);
  style = self->_style;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils captionColors](&OBJC_CLASS___AXTVUtils, "captionColors"));
  v7 = -[AXValueAwareRadioSettingGroup initWithTitle:representedObject:keyPath:availableValues:]( v4,  "initWithTitle:representedObject:keyPath:availableValues:",  0LL,  style,  @"textHighlightColor",  v6);

  -[AXValueAwareRadioSettingGroup setLocalizedValueFormatter:](v7, "setLocalizedValueFormatter:", v61);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities captionTextHighlightOpacityFormatter]( &OBJC_CLASS___AXTVCaptionUtilities,  "captionTextHighlightOpacityFormatter"));
  +[AXTVCaptionStyle defaultHighlightOpacity](&OBJC_CLASS___AXTVCaptionStyle, "defaultHighlightOpacity");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities defaultValueFormatterWithFormatter:defaultValue:]( &OBJC_CLASS___AXTVCaptionUtilities,  "defaultValueFormatterWithFormatter:defaultValue:",  v8,  v9));

  v11 = objc_alloc(&OBJC_CLASS___AXValueAwareRadioSettingGroup);
  id v19 = AXTVLocString(@"AXCaptionTextHighlightOpacitySectionTitle", v12, v13, v14, v15, v16, v17, v18, v57);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = self->_style;
  v22 = (void *)objc_claimAutoreleasedReturnValue([v8 inputs]);
  v23 = -[AXValueAwareRadioSettingGroup initWithTitle:representedObject:keyPath:availableValues:]( v11,  "initWithTitle:representedObject:keyPath:availableValues:",  v20,  v21,  @"textHighlightOpacity",  v22);

  -[AXValueAwareRadioSettingGroup setLocalizedValueFormatter:](v23, "setLocalizedValueFormatter:", v10);
  id v24 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v32 = AXTVLocString(@"AXCaptionVideoOverrideSectionTitle", v25, v26, v27, v28, v29, v30, v31, v58);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  id v34 = [v24 initWithTitle:v33];

  id v42 = AXTVLocString(@"AXCAptionVideoOverrideTitle", v35, v36, v37, v38, v39, v40, v41, v59);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  id v51 = AXTVLocString(@"AXCaptionStyleTextHighlightOverrideDescription", v44, v45, v46, v47, v48, v49, v50, v60);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v43,  v52,  self->_style,  @"videoOverridesTextHighlight",  0LL,  0LL));

  v64 = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
  [v34 setSettingItems:v54];

  v63[0] = v7;
  v63[1] = v23;
  v63[2] = v34;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 3LL));

  return v55;
}

- (AXTVCaptionStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end