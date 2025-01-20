@interface AXTVBrailleSettingsViewController
- (id)_brailleTableIdentifiers;
- (id)loadSettingGroups;
@end

@implementation AXTVBrailleSettingsViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v4 = &AFPreferencesAssistantEnabled_ptr;
  id v5 = [[TSKSettingGroup alloc] initWithTitle:0];
  v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v14 = AXTVLocString(@"AXBrailleChooseDisplayTitle", v7, v8, v9, v10, v11, v12, v13, v122);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v15,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVBrailleBluetoothListViewController));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  -[NSMutableArray addObject:](v6, "addObject:", v17);
  [v5 setSettingItems:v6];
  id v18 = [[TSKSettingGroup alloc] initWithTitle:0];
  v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

  if (VOSCustomBrailleEnabled())
  {
    VOSCrystalMigrateBrailleTableReplacements();
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleSettingsViewController _brailleTableIdentifiers](self, "_brailleTableIdentifiers"));
    id v35 = AXTVLocString(@"AXBrailleDisplaySyncIO", v28, v29, v30, v31, v32, v33, v34, (uint64_t)v5);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v36,  0LL,  v3,  @"voiceOverTouchBrailleDisplaySyncInputOutputTables",  0LL,  0LL));

    [v37 setUpdateBlock:&stru_65630];
    -[NSMutableArray addObject:](v19, "addObject:", v37);
    id v45 = AXTVLocString(@"AXBrailleDisplayInputAndOutput", v38, v39, v40, v41, v42, v43, v44, v123);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v46,  0LL,  v3,  @"voiceOverTouchBrailleDisplayOutputTableIdentifier",  v27));

    id v48 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65670];
    [v47 setLocalizedValueFormatter:v48];

    [v47 setUpdateBlock:&stru_65690];
    -[NSMutableArray addObject:](v19, "addObject:", v47);
    id v56 = AXTVLocString(@"AXBrailleDisplayOutputTitle", v49, v50, v51, v52, v53, v54, v55, v124);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v57,  0LL,  v3,  @"voiceOverTouchBrailleDisplayOutputTableIdentifier",  v27));

    v4 = &AFPreferencesAssistantEnabled_ptr;
    id v59 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_656B0];
    [v58 setLocalizedValueFormatter:v59];

    [v58 setUpdateBlock:&stru_656D0];
    -[NSMutableArray addObject:](v19, "addObject:", v58);
    id v67 = AXTVLocString(@"AXBrailleDisplayInputTitle", v60, v61, v62, v63, v64, v65, v66, v125);
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v68,  0LL,  v3,  @"voiceOverTouchBrailleDisplayInputTableIdentifier",  v27));

    id v70 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_656F0];
    [v69 setLocalizedValueFormatter:v70];

    [v69 setUpdateBlock:&stru_65710];
    -[NSMutableArray addObject:](v19, "addObject:", v69);
  }

  else
  {
    id v78 = AXTVLocString(@"AXBrailleDisplayOutputTitle", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v5);
    v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
    v80 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v79,  0LL,  v3,  @"voiceOverTouchBrailleDisplayOutputMode",  &off_6FEE0));

    id v81 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65730];
    [v80 setLocalizedValueFormatter:v81];

    -[NSMutableArray addObject:](v19, "addObject:", v80);
    id v89 = AXTVLocString(@"AXBrailleDisplayInputTitle", v82, v83, v84, v85, v86, v87, v88, v127);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    v69 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem multiValueItemWithTitle:description:representedObject:keyPath:availableValues:]( &OBJC_CLASS___TSKSettingItem,  "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:",  v90,  0LL,  v3,  @"voiceOverTouchBrailleDisplayInputMode",  &off_6FEF8));

    id v91 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_65750];
    [v69 setLocalizedValueFormatter:v91];

    -[NSMutableArray addObject:](v19, "addObject:", v69);
  }

  id v92 = AXTVLocString(@"AXAutomaticBrailleTranslation", v71, v72, v73, v74, v75, v76, v77, v126);
  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  v94 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v93,  0LL,  v3,  @"voiceOverBrailleGradeTwoAutoTranslateEnabled",  0LL,  0LL));

  -[NSMutableArray addObject:](v19, "addObject:", v94);
  [v18 setSettingItems:v19];
  id v95 = [objc_alloc((Class)v4[300]) initWithTitle:0];
  v96 = objc_opt_new(&OBJC_CLASS___NSMutableArray);

  id v104 = AXTVLocString(@"AXBrailleTranslationTitle", v97, v98, v99, v100, v101, v102, v103, v128);
  v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
  id v106 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v105,  0LL,  v3,  0LL,  objc_opt_class(&OBJC_CLASS___AXTVBrailleLanguageController));
  v107 = (void *)objc_claimAutoreleasedReturnValue(v106);

  -[NSMutableArray addObject:](v96, "addObject:", v107);
  id v115 = AXTVLocString(@"AXBrailleAlertDisplayDurationTitle", v108, v109, v110, v111, v112, v113, v114, v129);
  v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
  v131[0] = _NSConcreteStackBlock;
  v131[1] = 3221225472LL;
  v131[2] = sub_DE78;
  v131[3] = &unk_65200;
  id v132 = v3;
  id v117 = v3;
  v118 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v116,  0LL,  v117,  @"voiceOverBrailleAlertDisplayDuration",  v131));

  v119 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils shortStyleDurationFormatter](&OBJC_CLASS___AXTVUtils, "shortStyleDurationFormatter"));
  [v118 setLocalizedValueFormatter:v119];

  -[NSMutableArray addObject:](v96, "addObject:", v118);
  [v95 setSettingItems:v96];
  v133[0] = v130;
  v133[1] = v18;
  v133[2] = v95;
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v133, 3LL));

  return v120;
}

- (id)_brailleTableIdentifiers
{
  uint64_t v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 voiceOverBrailleLanguageRotorItems]);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userLocale]);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Default"]);
        unsigned int v13 = [v12 BOOLValue];

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"LanguageDefaults"]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v5 localeIdentifier]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);

          if (v16) {
            v17 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v16);
          }
          else {
            v17 = (BRLTTable *)objc_claimAutoreleasedReturnValue( +[BRLTTableEnumerator defaultTableForLocale:]( &OBJC_CLASS___BRLTTableEnumerator,  "defaultTableForLocale:",  v5));
          }
          v19 = v17;
        }

        else
        {
          id v18 = objc_alloc(&OBJC_CLASS___BRLTTable);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"RotorItem"]);
          v19 = -[BRLTTable initWithIdentifier:](v18, "initWithIdentifier:", v14);
        }

        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable replacements](v19, "replacements"));
        id v21 = [v20 count];

        if (!v21)
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable identifier](v19, "identifier"));
          -[NSMutableArray addObject:](v24, "addObject:", v22);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v8);
  }

  return v24;
}

@end