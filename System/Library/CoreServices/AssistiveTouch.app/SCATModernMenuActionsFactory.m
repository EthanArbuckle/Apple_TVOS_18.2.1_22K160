@interface SCATModernMenuActionsFactory
+ (id)_additionalMenuItemsForHomeActionForMenu:(id)a3 delegate:(id)a4;
+ (id)_capitalizedMenuTitle:(id)a3;
+ (id)_escapableElements;
+ (id)_fallbackImageForCustomActionMenuItem:(id)a3 charactersInUse:(id)a4;
+ (id)_fingerItemStringForNumberOfFingers:(unint64_t)a3;
+ (id)_imageNameForNumberOfFingers:(unint64_t)a3;
+ (id)_menuItemsForElementSpecificActionsForMenu:(id)a3 delegate:(id)a4;
+ (id)_typingCandidates;
+ (id)itemDetailsForItem:(id)a3 menu:(id)a4;
+ (id)menuItemForTapWithMenu:(id)a3 delegate:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForCustomActions:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
+ (void)_handlePerformEscapeWithMenu:(id)a3;
+ (void)_title:(id *)a3 imageForNavigationItem:(id *)a4;
+ (void)toggleNavigationMode;
@end

@implementation SCATModernMenuActionsFactory

+ (id)menuItemForTapWithMenu:(id)a3 delegate:(id)a4
{
  v14[0] = @"action_activate";
  v13[0] = @"identifier";
  v13[1] = @"title";
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10002B014(@"TAP");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v14[1] = v9;
  v14[2] = @"SCATIcon_gestures_tap";
  v13[2] = @"imageName";
  v13[3] = @"activateBehavior";
  v14[3] = &off_10012FAD8;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  4LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 menuItemWithItemDictionary:v10 menu:v7 delegate:v6]);

  return v11;
}

+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:AXSSwitchControlMenuItemElementSpecificActions])
  {
    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([a1 _menuItemsForElementSpecificActionsForMenu:v9 delegate:v10]);
  }

  else
  {
    [v8 isEqualToString:AXSSwitchControlMenuItemSideApp];
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "itemDetailsForItem:menu:", v8, v9, 0));
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue( [a1 menuItemWithItemDictionary:*(void *)(*((void *)&v20 + 1) + 8 * (void)v16) menu:v9 delegate:v10]);
          -[NSMutableArray addObject:](v11, "addObject:", v17);

          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v14);
    }

    if ([v8 isEqualToString:AXSSwitchControlMenuItemHome])
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _additionalMenuItemsForHomeActionForMenu:v9 delegate:v10]);
      -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v18);
    }
  }

  return v11;
}

+ (id)itemDetailsForItem:(id)a3 menu:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:AXSSwitchControlMenuItemDevice])
  {
    v116[0] = @"device";
    v115[0] = @"identifier";
    v115[1] = @"title";
    id v8 = sub_10002B014(@"DEVICE");
    id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    v116[1] = v9;
    v115[2] = @"imageName";
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSString sc_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "sc_deviceIconNameForIdentifier:",  @"device"));
    v115[3] = @"activateBehavior";
    v116[2] = v10;
    v116[3] = &off_10012FAF0;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v116,  v115,  4LL));
    v117 = v11;
    v12 = &v117;
LABEL_3:
    id v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v12,  1LL));
LABEL_4:

LABEL_11:
    goto LABEL_12;
  }

  if (![v6 isEqualToString:AXSSwitchControlMenuItemEdit])
  {
    if ([v6 isEqualToString:AXSSwitchControlMenuItemEscape])
    {
      v110[0] = @"action_escape";
      v109[0] = @"identifier";
      v109[1] = @"title";
      id v16 = sub_10002B014(@"ESCAPE");
      id v9 = (id)objc_claimAutoreleasedReturnValue(v16);
      v109[2] = @"activateBehavior";
      v110[1] = v9;
      v110[2] = &off_10012FAD8;
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v110,  v109,  3LL));
      id v111 = v10;
      uint64_t v15 = &v111;
      goto LABEL_10;
    }

    if ([v6 isEqualToString:AXSSwitchControlMenuItemToggleDictation])
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue([v7 keyboardApplication]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 uiElement]);
      unsigned int v19 = [v18 BOOLWithAXAttribute:3034];

      if (v19)
      {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 uiElement]);
        id v21 = [v20 BOOLWithAXAttribute:3010];

        v107[0] = @"action_toggle_dictation";
        v106[0] = @"identifier";
        v106[1] = @"title";
        if ((_DWORD)v21) {
          __int128 v22 = @"STOP_DICTATION";
        }
        else {
          __int128 v22 = @"START_DICTATION";
        }
        id v23 = sub_10002B014(v22);
        id v10 = (id)objc_claimAutoreleasedReturnValue(v23);
        v107[1] = v10;
        v107[2] = @"SCATIcon_device_siri";
        v106[2] = @"imageName";
        v106[3] = @"allowsDwellScanningToAbortAfterTimeout";
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21));
        v106[4] = @"activateBehavior";
        v107[3] = v11;
        v107[4] = &off_10012FB08;
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v107,  v106,  5LL));
        v108 = v24;
        id v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v108,  1LL));

        goto LABEL_4;
      }

+ (id)_additionalMenuItemsForHomeActionForMenu:(id)a3 delegate:(id)a4
{
  return 0LL;
}

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"identifier"]);
  unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"title"]);
  unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"imageName"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"allowsDwellScanningToAbortAfterTimeout"]);
  unsigned int v28 = [v10 BOOLValue];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"activateBehavior"]);
  id v27 = [v11 unsignedIntegerValue];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"guidedAccess"]);
  id v13 = v12;
  if (v12) {
    unsigned int v14 = [v12 BOOLValue];
  }
  else {
    unsigned int v14 = 1;
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"assistiveAccess"]);
  id v16 = v15;
  unsigned int v26 = v14;
  if (v15) {
    LOBYTE(v14) = [v15 BOOLValue];
  }
  if ([v9 isEqualToString:@"action_activate"])
  {
    v18 = &stru_100123CE8;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_scroll"])
  {
    v18 = &stru_100123D08;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_home"])
  {
    v18 = &stru_100123D28;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_dismissAutocorrection"])
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10006EB74;
    v36[3] = &unk_100123D48;
    v36[4] = a1;
    unsigned int v19 = v36;
LABEL_16:
    v18 = objc_retainBlock(v19);
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_acceptCandidate"])
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10006EBE0;
    v35[3] = &unk_100123D48;
    v35[4] = a1;
    unsigned int v19 = v35;
    goto LABEL_16;
  }

  if ([v9 isEqualToString:@"gestures"])
  {
    v18 = &stru_100123D68;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"device"])
  {
    v18 = &stru_100123D88;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"settings"])
  {
    v18 = &stru_100123DA8;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"mediacontrols"])
  {
    v18 = &stru_100123DC8;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"siri_shortcuts"])
  {
    v18 = &stru_100123DE8;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"recipes"])
  {
    v18 = &stru_100123E08;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_decrement"])
  {
    v18 = &stru_100123E28;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_increment"])
  {
    v18 = &stru_100123E48;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_alternateKeys"])
  {
    v18 = &stru_100123E68;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_edit"])
  {
    v18 = &stru_100123E88;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_zoomIn"])
  {
    v18 = &stru_100123EA8;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_zoomOut"])
  {
    v18 = &stru_100123EC8;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_escape"])
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10006F09C;
    v34[3] = &unk_100123D48;
    v34[4] = a1;
    unsigned int v19 = v34;
    goto LABEL_16;
  }

  if ([v9 isEqualToString:@"action_toggle_dictation"])
  {
    v18 = &stru_100123EE8;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"action_refinePoint"])
  {
    v18 = &stru_100123F08;
    goto LABEL_17;
  }

  if ([v9 isEqualToString:@"settings_navigationMode"])
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10006F12C;
    v33[3] = &unk_100123D48;
    v33[4] = a1;
    unsigned int v19 = v33;
    goto LABEL_16;
  }

  if ([v9 isEqualToString:@"action_sideApp"])
  {
    _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"kSCATMenuItemIDSideApp not available on tvOS");
    v18 = 0LL;
  }

  else if ([v9 isEqualToString:@"action_itemSpecificMenu"])
  {
    v18 = &stru_100123F28;
  }

  else if ([v9 isEqualToString:@"action_ATVRemoteMenu"])
  {
    v18 = &stru_100123F48;
  }

  else if ([v9 isEqualToString:@"action_lockItemSpecificMenu"])
  {
    v18 = &stru_100123F68;
  }

  else if ([v9 hasPrefix:@"customAction_"])
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10006F228;
    v31[3] = &unk_100122A48;
    id v32 = v9;
    v18 = objc_retainBlock(v31);
  }

  else if ([v9 containsString:@"sideApp_gesture"])
  {
    v18 = &stru_100123F88;
  }

  else
  {
    v18 = 0LL;
  }

+ (id)updateBlockForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"action_toggle_dictation"])
  {
    v5 = &stru_100123FA8;
  }

  else if ([v4 isEqualToString:@"settings_navigationMode"])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10006F4E8;
    v7[3] = &unk_100122B28;
    v7[4] = a1;
    v5 = objc_retainBlock(v7);
  }

  else
  {
    v5 = &stru_100123FC8;
  }

  return v5;
}

+ (id)_fingerItemStringForNumberOfFingers:(unint64_t)a3
{
  id v4 = sub_10002B014(@"FingersFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = AXFormatInteger(a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v7));

  return v8;
}

+ (id)_imageNameForNumberOfFingers:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0LL;
  }
  else {
    return *(&off_100124008 + a3 - 1);
  }
}

+ (void)_title:(id *)a3 imageForNavigationItem:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v7 = [v6 assistiveTouchScanningMode];
  if ((unint64_t)v7 > 2)
  {
    id v8 = 0LL;
    id v10 = 0LL;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  id v8 = *(&off_100124048 + (void)v7);
  id v9 = sub_10002B014(*(&off_100124030 + (void)v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (a4) {
LABEL_5:
  }
    *a4 = v8;
LABEL_6:
  id v11 = v10;
  if (a3) {
    *a3 = v10;
  }
}

+ (void)_handlePerformEscapeWithMenu:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement", a3));
  [v3 systemPressTVMenuButton];
}

+ (id)_escapableElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 elementsForMatchingBlock:&stru_100123FE8]);

  return v3;
}

+ (id)_typingCandidates
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstResponder]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 elementForAttribute:2017]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 typingCandidates]);

  return v5;
}

+ (void)toggleNavigationMode
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unint64_t v2 = (unint64_t)[v3 assistiveTouchScanningMode];
  if (v2 <= 2) {
    [v3 setAssistiveTouchScanningMode:qword_1001180B0[v2]];
  }
}

+ (id)_menuItemsForElementSpecificActionsForMenu:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v8 scatCustomActions]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "menuItemsForCustomActions:menu:delegate:"));
  -[NSMutableArray axSafelyAddObjectsFromArray:](v9, "axSafelyAddObjectsFromArray:", v10);

  id v48 = (void *)objc_claimAutoreleasedReturnValue([v8 scatCustomHardwareActions]);
  v52 = v7;
  v53 = v6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuHardwareActionsMovementFactory menuItemsForCustomHardwareActions:menu:delegate:]( &OBJC_CLASS___SCATMenuHardwareActionsMovementFactory,  "menuItemsForCustomHardwareActions:menu:delegate:"));
  id v51 = v9;
  -[NSMutableArray axSafelyAddObjectsFromArray:](v9, "axSafelyAddObjectsFromArray:", v11);

  id v55 = v8;
  if ([v8 scatCanShowAlternateKeys])
  {
    v70[0] = @"action_alternateKeys";
    v69[0] = @"identifier";
    v69[1] = @"title";
    id v12 = sub_10002B014(@"ALT_KEYS");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v69[2] = @"activateBehavior";
    v70[1] = v13;
    v70[2] = &off_10012FAD8;
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v70,  v69,  3LL));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([a1 menuItemWithItemDictionary:v14 menu:v6 delegate:v7]);
    -[NSMutableArray addObject:](v9, "addObject:", v15);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _typingCandidates]);
  if ([v16 count] == (id)1
    && (uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lastObject]),
        unint64_t v18 = (unint64_t)[v17 traits],
        unint64_t v19 = UIAccessibilityTraitSelectionDismissesItem & v18,
        v17,
        v19))
  {
    v68[0] = @"action_dismissAutocorrection";
    v67[0] = @"identifier";
    v67[1] = @"title";
    id v20 = sub_10002B014(@"DISMISS_AUTOCORRECTION");
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v67[2] = @"activateBehavior";
    v68[1] = v21;
    v68[2] = &off_10012FAD8;
    __int128 v22 = v68;
    id v23 = v67;
  }

  else
  {
    if (![v16 count]) {
      goto LABEL_9;
    }
    v66[0] = @"action_acceptCandidate";
    v65[0] = @"identifier";
    v65[1] = @"title";
    id v24 = sub_10002B014(@"CHOOSE_CANDIDATE");
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v65[2] = @"activateBehavior";
    v66[1] = v21;
    v66[2] = &off_10012FAD8;
    __int128 v22 = v66;
    id v23 = v65;
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v23,  3LL));
  unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([a1 menuItemWithItemDictionary:v25 menu:v53 delegate:v52]);
  -[NSMutableArray addObject:](v9, "addObject:", v26);

LABEL_9:
  id v47 = v16;
  if ([v55 scatSupportsAction:2001])
  {
    v64[0] = @"action_zoomIn";
    v63[0] = @"identifier";
    v63[1] = @"title";
    id v27 = sub_10002B014(@"ZOOM_IN");
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v63[2] = @"activateBehavior";
    v64[1] = v28;
    v64[2] = &off_10012FAD8;
    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  3LL));
    unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([a1 menuItemWithItemDictionary:v29 menu:v53 delegate:v52]);
    -[NSMutableArray addObject:](v9, "addObject:", v30);

    v62[0] = @"action_zoomOut";
    v61[0] = @"identifier";
    v61[1] = @"title";
    id v31 = sub_10002B014(@"ZOOM_OUT");
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v61[2] = @"activateBehavior";
    v62[1] = v32;
    v62[2] = &off_10012FAD8;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  3LL));
    v34 = (void *)objc_claimAutoreleasedReturnValue([a1 menuItemWithItemDictionary:v33 menu:v53 delegate:v52]);
    -[NSMutableArray addObject:](v9, "addObject:", v34);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue([v55 scatSupportedGestures]);
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v36 = [v35 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v36)
  {
    id v37 = v36;
    BOOL v38 = 0;
    uint64_t v39 = *(void *)v57;
    uint64_t v54 = kAXTextEntryTrait;
    uint64_t v50 = AXSSwitchControlMenuItemGesturesTapAndHold;
    do
    {
      for (i = 0LL; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v57 != v39) {
          objc_enumerationMutation(v35);
        }
        if (v38)
        {
          BOOL v38 = 1;
          continue;
        }

        v41 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:@"AXSupportedGestureTypeKey"]);
        if ([v42 intValue] == 1)
        {
          id v43 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:@"AXGestureFingerCountKey"]);
          unsigned int v44 = [v43 intValue];
          BOOL v38 = v44 == 1;
          if (v44 == 1)
          {
            unint64_t v45 = v54 & (unint64_t)[v55 scatTraits];

            if (v45)
            {
              BOOL v38 = 0;
              continue;
            }

            v42 = (void *)objc_claimAutoreleasedReturnValue( +[SCATMenuItemFactory menuItemsForItem:menu:delegate:]( &OBJC_CLASS___SCATMenuItemFactory,  "menuItemsForItem:menu:delegate:",  v50,  v53,  v52));
            id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 firstObject]);
            -[NSMutableArray addObject:](v51, "addObject:", v43);
          }
        }

        else
        {
          BOOL v38 = 0;
        }
      }

      id v37 = [v35 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }

    while (v37);
  }

  return v51;
}

+ (id)menuItemsForCustomActions:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v39 = a4;
  id v38 = a5;
  if ([v8 count])
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v37 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v34 = v8;
    id obj = v8;
    id v9 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"CustomActionShortName"]);
          if (!v14) {
            unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"CustomActionName"]);
          }
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _capitalizedMenuTitle:v14]);

          v44[0] = @"identifier";
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"CustomActionIdentifier"]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"customAction_",  v16));
          v45[0] = v17;
          v45[1] = v15;
          v44[1] = @"title";
          v44[2] = @"activateBehavior";
          v45[2] = &off_10012FAD8;
          unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  3LL));
          unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([a1 menuItemWithItemDictionary:v18 menu:v39 delegate:v38]);

          id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"CustomActionImage"]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
          [v21 scale];
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:scale:](&OBJC_CLASS___UIImage, "imageWithData:scale:", v20));
          [v19 setImage:v22];

          id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 image]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 imageWithTintColor:v24 renderingMode:1]);
          [v19 setImage:v25];

          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"CustomActionImageOrientation"]);
          id v27 = [v26 integerValue];

          if (v27)
          {
            if (v27 == (id)4)
            {
              unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v19 image]);
              unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 imageWithHorizontallyFlippedOrientation]);
              [v19 setImage:v29];
            }

            else
            {
              v33 = v13;
              _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATModernMenuActionsFactory.m",  1303LL,  "+[SCATModernMenuActionsFactory menuItemsForCustomActions:menu:delegate:]",  @"Unsupported image orientation for custom action with dictionary: %@");
            }
          }

          unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "image", v33));

          if (!v30)
          {
            id v31 = (void *)objc_claimAutoreleasedReturnValue([a1 _fallbackImageForCustomActionMenuItem:v19 charactersInUse:v35]);
            [v19 setImage:v31];
          }

          [v37 addObject:v19];
        }

        id v10 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }

      while (v10);
    }

    id v8 = v34;
  }

  else
  {
    id v37 = &__NSArray0__struct;
  }

  return v37;
}

+ (id)_fallbackImageForCustomActionMenuItem:(id)a3 charactersInUse:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 title]);
  id v7 = sub_10002B014(@"DELETE");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned int v9 = [v6 hasPrefix:v8];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage scat_cachedMenuImageForImageName:]( &OBJC_CLASS___UIImage,  "scat_cachedMenuImageForImageName:",  @"SCATIcon_action_delete"));
    if (!v10)
    {
      uint64_t v11 = @"SCATIcon_action_delete";
LABEL_7:
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _deviceSpecificImageNamed:](&OBJC_CLASS___UIImage, "_deviceSpecificImageNamed:", v11));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 imageWithTintColor:v16 renderingMode:1]);

      +[UIImage scat_setCachedMenuImage:forImageName:]( &OBJC_CLASS___UIImage,  "scat_setCachedMenuImage:forImageName:",  v10,  v11);
    }
  }

  else
  {
    id v12 = sub_10002B014(@"MORE");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    unsigned int v14 = [v6 hasPrefix:v13];

    if (!v14)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage scat_singleCharacterImageForTitle:charactersInUse:]( &OBJC_CLASS___UIImage,  "scat_singleCharacterImageForTitle:charactersInUse:",  v6,  v5));
      goto LABEL_9;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage scat_cachedMenuImageForImageName:]( &OBJC_CLASS___UIImage,  "scat_cachedMenuImageForImageName:",  @"SCATIcon_action_more"));
    if (!v10)
    {
      uint64_t v11 = @"SCATIcon_action_more";
      goto LABEL_7;
    }
  }

+ (id)_capitalizedMenuTitle:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedCapitalizedString]);
  if ([v3 length])
  {
    unint64_t v6 = 0LL;
    do
    {
      id v7 = [v3 rangeOfComposedCharacterSequenceAtIndex:v6];
      uint64_t v9 = v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v7, v8));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uppercaseString]);
      unsigned __int8 v12 = [v10 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = [v5 rangeOfComposedCharacterSequenceAtIndex:v6];
        uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v13, v14));

        id v10 = (void *)v15;
      }

      -[NSMutableString appendString:](v4, "appendString:", v10);
      v6 += v9;
    }

    while (v6 < (unint64_t)[v3 length]);
  }

  return v4;
}

@end