@interface AXTVCaptionEditStyleViewController
- (AXTVCaptionStyle)style;
- (id)_descriptionFormatter;
- (id)_editFontViewController:(id)a3;
- (id)_editTextHighlightViewController:(id)a3;
- (id)_editingViewControllerWithSetting:(id)a3 overrideKey:(id)a4 overrideDescription:(id)a5 availableValues:(id)a6;
- (id)loadSettingGroups;
- (void)setStyle:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXTVCaptionEditStyleViewController

- (id)loadSettingGroups
{
  id v175 = [[TSKSettingGroup alloc] initWithTitle:0];
  id v10 = AXTVLocString(@"AXCaptionStyleDescriptionTitle", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v160);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v11,  0LL,  self->_style,  @"name"));

  id v20 = AXTVLocString( @"AXCaptionStyleDescriptionEditingInstructions",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)v161);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v12 setLocalizedTextEntryInstructions:v21];

  [v12 setUseFormatterError:1];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionEditStyleViewController _descriptionFormatter](self, "_descriptionFormatter"));
  [v12 setLocalizedValueFormatter:v22];

  v196 = v12;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v196, 1LL));
  [v175 setSettingItems:v23];

  id v24 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v32 = AXTVLocString(@"AXCaptionStyleTextSectionTitle", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v162);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  id v174 = [v24 initWithTitle:v33];

  v177 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v41 = AXTVLocString(@"AXCaptionStyleFontTitle", v34, v35, v36, v37, v38, v39, v40, (uint64_t)v163);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  style = self->_style;
  v192[0] = _NSConcreteStackBlock;
  v192[1] = 3221225472LL;
  v192[2] = sub_80E4;
  v192[3] = &unk_65318;
  objc_copyWeak(&v193, &location);
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v42,  0LL,  style,  @"textFontName",  v192));

  v45 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities captionFontNameFormatter]( &OBJC_CLASS___AXTVCaptionUtilities,  "captionFontNameFormatter"));
  [v44 setLocalizedValueFormatter:v45];

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCaptionStyle defaultFontName](&OBJC_CLASS___AXTVCaptionStyle, "defaultFontName"));
  [v44 setDefaultValue:v46];

  -[NSMutableArray addObject:](v177, "addObject:", v44);
  id v54 = AXTVLocString(@"AXCaptionStyleSizeTitle", v47, v48, v49, v50, v51, v52, v53, (uint64_t)v164);
  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  v56 = self->_style;
  v190[0] = _NSConcreteStackBlock;
  v190[1] = 3221225472LL;
  v190[2] = sub_8138;
  v190[3] = &unk_65318;
  objc_copyWeak(&v191, &location);
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v55,  0LL,  v56,  @"relativeTextSize",  v190));

  v58 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities captionTextSizeFormatter]( &OBJC_CLASS___AXTVCaptionUtilities,  "captionTextSizeFormatter"));
  [v57 setLocalizedValueFormatter:v58];

  v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  +[AXTVCaptionStyle defaultTextSize](&OBJC_CLASS___AXTVCaptionStyle, "defaultTextSize")));
  [v57 setDefaultValue:v59];

  -[NSMutableArray addObject:](v177, "addObject:", v57);
  id v67 = AXTVLocString(@"AXCaptionStyleColorTitle", v60, v61, v62, v63, v64, v65, v66, (uint64_t)v165);
  v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
  v69 = self->_style;
  v188[0] = _NSConcreteStackBlock;
  v188[1] = 3221225472LL;
  v188[2] = sub_81B4;
  v188[3] = &unk_65318;
  objc_copyWeak(&v189, &location);
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v68,  0LL,  v69,  @"textColor",  v188));

  v71 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils captionColorFormatter](&OBJC_CLASS___AXTVUtils, "captionColorFormatter"));
  [v70 setLocalizedValueFormatter:v71];

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCaptionStyle defaultTextColor](&OBJC_CLASS___AXTVCaptionStyle, "defaultTextColor"));
  [v70 setDefaultValue:v72];

  -[NSMutableArray addObject:](v177, "addObject:", v70);
  [v174 setSettingItems:v177];
  id v73 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v81 = AXTVLocString(@"AXCaptionStyleBackgroundSectionTitle", v74, v75, v76, v77, v78, v79, v80, (uint64_t)v166);
  v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
  id v173 = [v73 initWithTitle:v82];

  v176 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v90 = AXTVLocString(@"AXCaptionStyleBackgroundColorTitle", v83, v84, v85, v86, v87, v88, v89, (uint64_t)v167);
  v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
  v92 = self->_style;
  v186[0] = _NSConcreteStackBlock;
  v186[1] = 3221225472LL;
  v186[2] = sub_8254;
  v186[3] = &unk_65318;
  objc_copyWeak(&v187, &location);
  v93 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v91,  0LL,  v92,  @"backgroundColor",  v186));

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils captionColorFormatter](&OBJC_CLASS___AXTVUtils, "captionColorFormatter"));
  [v93 setLocalizedValueFormatter:v94];

  v95 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCaptionStyle defaultBackgroundColor](&OBJC_CLASS___AXTVCaptionStyle, "defaultBackgroundColor"));
  [v93 setDefaultValue:v95];

  -[NSMutableArray addObject:](v176, "addObject:", v93);
  id v103 = AXTVLocString( @"AXCaptionStyleBackgroundOpacityTitle",  v96,  v97,  v98,  v99,  v100,  v101,  v102,  (uint64_t)v168);
  v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
  v105 = self->_style;
  v184[0] = _NSConcreteStackBlock;
  v184[1] = 3221225472LL;
  v184[2] = sub_82F4;
  v184[3] = &unk_65318;
  objc_copyWeak(&v185, &location);
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v104,  0LL,  v105,  @"backgroundOpacity",  v184));

  v107 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities captionBackgroundOpacityFormatter]( &OBJC_CLASS___AXTVCaptionUtilities,  "captionBackgroundOpacityFormatter"));
  [v106 setLocalizedValueFormatter:v107];

  +[AXTVCaptionStyle defaultBackgroundOpacity](&OBJC_CLASS___AXTVCaptionStyle, "defaultBackgroundOpacity");
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v106 setDefaultValue:v108];

  -[NSMutableArray addObject:](v176, "addObject:", v106);
  [v173 setSettingItems:v176];
  id v109 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  id v117 = AXTVLocString( @"AXCaptionStyleAdvancedSectionTitle",  v110,  v111,  v112,  v113,  v114,  v115,  v116,  (uint64_t)&v185);
  v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
  id v119 = [v109 initWithTitle:v118];

  v120 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v128 = AXTVLocString(@"AXCaptionStyleTextOpacityTitle", v121, v122, v123, v124, v125, v126, v127, (uint64_t)v169);
  v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
  v130 = self->_style;
  v182[0] = _NSConcreteStackBlock;
  v182[1] = 3221225472LL;
  v182[2] = sub_8370;
  v182[3] = &unk_65318;
  objc_copyWeak(&v183, &location);
  v131 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v129,  0LL,  v130,  @"textOpacity",  v182));

  v132 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities captionTextOpacityFormatter]( &OBJC_CLASS___AXTVCaptionUtilities,  "captionTextOpacityFormatter"));
  [v131 setLocalizedValueFormatter:v132];

  +[AXTVCaptionStyle defaultTextOpacity](&OBJC_CLASS___AXTVCaptionStyle, "defaultTextOpacity");
  v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v131 setDefaultValue:v133];

  -[NSMutableArray addObject:](v120, "addObject:", v131);
  id v141 = AXTVLocString( @"AXCaptionStyleTextEdgeStyleTitle",  v134,  v135,  v136,  v137,  v138,  v139,  v140,  (uint64_t)v170);
  v142 = (void *)objc_claimAutoreleasedReturnValue(v141);
  v143 = self->_style;
  v180[0] = _NSConcreteStackBlock;
  v180[1] = 3221225472LL;
  v180[2] = sub_83EC;
  v180[3] = &unk_65318;
  objc_copyWeak(&v181, &location);
  v144 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v142,  0LL,  v143,  @"textEdgeStyle",  v180));

  v145 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVCaptionUtilities captionTextEdgeFormatter]( &OBJC_CLASS___AXTVCaptionUtilities,  "captionTextEdgeFormatter"));
  [v144 setLocalizedValueFormatter:v145];

  v146 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  +[AXTVCaptionStyle defaultTextEdgeStyle](&OBJC_CLASS___AXTVCaptionStyle, "defaultTextEdgeStyle")));
  [v144 setDefaultValue:v146];

  -[NSMutableArray addObject:](v120, "addObject:", v144);
  id v154 = AXTVLocString( @"AXCaptionStyleTextHighlightTitle",  v147,  v148,  v149,  v150,  v151,  v152,  v153,  (uint64_t)v171);
  v155 = (void *)objc_claimAutoreleasedReturnValue(v154);
  v156 = self->_style;
  v178[0] = _NSConcreteStackBlock;
  v178[1] = 3221225472LL;
  v178[2] = sub_8468;
  v178[3] = &unk_65318;
  objc_copyWeak(&v179, &location);
  v157 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v155,  0LL,  v156,  0LL,  v178));

  -[NSMutableArray addObject:](v120, "addObject:", v157);
  [v119 setSettingItems:v120];
  v195[0] = v175;
  v195[1] = v174;
  v195[2] = v173;
  v195[3] = v119;
  v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v195, 4LL));
  objc_destroyWeak(&v179);
  objc_destroyWeak(&v181);
  objc_destroyWeak(&v183);

  objc_destroyWeak(v172);
  objc_destroyWeak(&v187);

  objc_destroyWeak(&v189);
  objc_destroyWeak(&v191);
  objc_destroyWeak(&v193);

  objc_destroyWeak(&location);
  return v158;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXTVCaptionEditStyleViewController;
  -[AXTVCaptionEditStyleViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStyle name](self->_style, "name"));
  -[AXTVCaptionEditStyleViewController setTitle:](self, "setTitle:", v4);
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  objc_super v5 = (AXTVCaptionStyle *)[v4 copy];
  style = self->_style;
  self->_style = v5;

  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 name]);
  -[AXTVCaptionEditStyleViewController setTitle:](self, "setTitle:", v7);
}

- (id)_editFontViewController:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___AXTVCaptionMainFontViewController);
  -[AXTVCaptionMultiValueOverrideViewController setStyle:](v5, "setStyle:", self->_style);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 keyPath]);
  -[AXTVCaptionMultiValueOverrideViewController setValueKey:](v5, "setValueKey:", v6);

  -[AXTVCaptionMultiValueOverrideViewController setOverrideKey:]( v5,  "setOverrideKey:",  @"videoOverridesTextFontName");
  id v14 = AXTVLocString(@"AXCaptionStyleFontOverrideDescription", v7, v8, v9, v10, v11, v12, v13, v20);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[AXTVCaptionMultiValueOverrideViewController setOverrideDescription:](v5, "setOverrideDescription:", v15);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 defaultValue]);
  -[AXTVCaptionMultiValueOverrideViewController setDefaultValue:](v5, "setDefaultValue:", v16);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedValueFormatter]);
  -[AXTVCaptionMultiValueOverrideViewController setFormatter:](v5, "setFormatter:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedTitle]);
  -[AXTVCaptionMainFontViewController setTitle:](v5, "setTitle:", v18);

  return v5;
}

- (id)_editTextHighlightViewController:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___AXTVCaptionTextHighlightViewController);
  -[AXTVCaptionTextHighlightViewController setStyle:](v5, "setStyle:", self->_style);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedTitle]);

  -[AXTVCaptionTextHighlightViewController setTitle:](v5, "setTitle:", v6);
  return v5;
}

- (id)_editingViewControllerWithSetting:(id)a3 overrideKey:(id)a4 overrideDescription:(id)a5 availableValues:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(&OBJC_CLASS___AXTVCaptionMultiValueOverrideViewController);
  -[AXTVCaptionMultiValueOverrideViewController setAvailableValues:](v14, "setAvailableValues:", v10);

  -[AXTVCaptionMultiValueOverrideViewController setStyle:](v14, "setStyle:", self->_style);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 keyPath]);
  -[AXTVCaptionMultiValueOverrideViewController setValueKey:](v14, "setValueKey:", v15);

  -[AXTVCaptionMultiValueOverrideViewController setOverrideKey:](v14, "setOverrideKey:", v12);
  -[AXTVCaptionMultiValueOverrideViewController setOverrideDescription:](v14, "setOverrideDescription:", v11);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 defaultValue]);
  -[AXTVCaptionMultiValueOverrideViewController setDefaultValue:](v14, "setDefaultValue:", v16);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedValueFormatter]);
  -[AXTVCaptionMultiValueOverrideViewController setFormatter:](v14, "setFormatter:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedTitle]);
  -[AXTVCaptionMultiValueOverrideViewController setTitle:](v14, "setTitle:", v18);

  return v14;
}

- (id)_descriptionFormatter
{
  id v3 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65358];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_8928;
  v5[3] = &unk_653A8;
  objc_copyWeak(&v6, &location);
  [v3 setReverseFormattingBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (AXTVCaptionStyle)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end