@interface SCATModernMenuItemSettingsFactory
+ (id)_stringForGroupEnabled:(BOOL)a3;
+ (id)_stringForSoundEnabled:(BOOL)a3;
+ (id)_stringForSpeechEnabled:(BOOL)a3;
+ (id)itemDetailsForItem:(id)a3 menu:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
@end

@implementation SCATModernMenuItemSettingsFactory

+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "itemDetailsForItem:menu:", v8, v9, 0));
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue( [a1 menuItemWithItemDictionary:*(void *)(*((void *)&v19 + 1) + 8 * (void)v16) menu:v9 delegate:v10]);
        -[NSMutableArray addObject:](v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }

  return v11;
}

+ (id)itemDetailsForItem:(id)a3 menu:(id)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:AXSSwitchControlMenuItemSettingsSpeedUpDown])
  {
    v32[0] = @"settings_decreaseScanSpeed";
    v31[0] = @"identifier";
    v31[1] = @"title";
    id v6 = sub_10002B014(@"Settings-Slow-Down");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v31[2] = @"activateBehavior";
    v32[1] = v7;
    v32[2] = &off_10012F868;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
    v33[0] = v8;
    v30[0] = @"settings_increaseScanSpeed";
    v29[0] = @"identifier";
    v29[1] = @"title";
    id v9 = sub_10002B014(@"Settings-Speed-Up");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v29[2] = @"activateBehavior";
    v30[1] = v10;
    v30[2] = &off_10012F868;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
    v33[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));

LABEL_12:
    goto LABEL_13;
  }

  if (![v5 isEqualToString:AXSSwitchControlMenuItemSettingsMoveMenu])
  {
    if ([v5 isEqualToString:AXSSwitchControlMenuItemSettingsSpeechOnOff])
    {
      v24[0] = @"settings_speech";
      v23[0] = @"identifier";
      v23[1] = @"title";
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "_stringForSpeechEnabled:",  objc_msgSend(v7, "assistiveTouchScannerSpeechEnabled")));
      v23[2] = @"activateBehavior";
      v24[1] = v8;
      v24[2] = &off_10012F868;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  3LL));
      v25 = v10;
      id v14 = &v25;
    }

    else if ([v5 isEqualToString:AXSSwitchControlMenuItemSettingsSoundOnOff])
    {
      v21[0] = @"settings_sound";
      v20[0] = @"identifier";
      v20[1] = @"title";
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringForSoundEnabled:", objc_msgSend(v7, "assistiveTouchScannerSoundEnabled")));
      v20[2] = @"activateBehavior";
      v21[1] = v8;
      v21[2] = &off_10012F868;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));
      __int128 v22 = v10;
      id v14 = &v22;
    }

    else
    {
      id v15 = [v5 isEqualToString:AXSSwitchControlMenuItemSettingsGroupsOnOff];
      if (!(_DWORD)v15)
      {
        _AXAssert( v15,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATModernMenuItemSettingsFactory.m",  77LL,  "+[SCATModernMenuItemSettingsFactory itemDetailsForItem:menu:]",  @"Unhandled settings menu item type: %@");
        v12 = 0LL;
        goto LABEL_14;
      }

      v18[0] = @"settings_groupElements";
      v17[0] = @"identifier";
      v17[1] = @"title";
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringForGroupEnabled:", objc_msgSend(v7, "assistiveTouchGroupElementsEnabled")));
      v17[2] = @"activateBehavior";
      v18[1] = v8;
      v18[2] = &off_10012F868;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
      __int128 v19 = v10;
      id v14 = &v19;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 1LL));
    goto LABEL_12;
  }

  v27[0] = @"settings_move";
  v26[0] = @"identifier";
  v26[1] = @"title";
  id v13 = sub_10002B014(@"Settings-Move");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v26[2] = @"activateBehavior";
  v27[1] = v7;
  v27[2] = &off_10012F868;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  3LL));
  v28 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
LABEL_13:

LABEL_14:
  return v12;
}

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"identifier"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"title"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"imageName"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"activateBehavior"]);
  id v30 = [v11 unsignedIntegerValue];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"guidedAccess"]);
  id v13 = [v12 BOOLValue];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"assistiveAccess"]);
  unsigned __int8 v15 = v13;
  if (v14) {
    unsigned __int8 v15 = [v14 BOOLValue];
  }
  if ([v8 isEqualToString:@"settings_increaseScanSpeed"]
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager")),
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activeScannerDriver]),
        unsigned int v18 = [v17 driverType],
        v17,
        v16,
        !v18))
  {
    v23 = &stru_100122A68;
  }

  else if ([v8 isEqualToString:@"settings_decreaseScanSpeed"] {
         && (__int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager")),
  }
             __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 activeScannerDriver]),
             unsigned int v22 = [v21 driverType],
             v21,
             v20,
             !v22))
  {
    v23 = &stru_100122A88;
  }

  else if ([v8 isEqualToString:@"settings_move"])
  {
    v23 = &stru_100122AA8;
  }

  else if ([v8 isEqualToString:@"settings_speech"])
  {
    v23 = &stru_100122AC8;
  }

  else if ([v8 isEqualToString:@"settings_sound"])
  {
    v23 = &stru_100122AE8;
  }

  else if ([v8 isEqualToString:@"settings_groupElements"])
  {
    v23 = &stru_100122B08;
  }

  else
  {
    v23 = 0LL;
  }

  *(void *)&double v24 = objc_opt_class(a1, v19).n128_u64[0];
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "updateBlockForIdentifier:", v8, v24));
  LOBYTE(v29) = v15;
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssi stiveAccess:activateHandler:updateHandler:",  v8,  v6,  v9,  v10,  v30,  v13,  v29,  v23,  v26));

  return v27;
}

+ (id)_stringForSpeechEnabled:(BOOL)a3
{
  if (a3) {
    v3 = @"Settings-Speech-On";
  }
  else {
    v3 = @"Settings-Speech-Off";
  }
  id v4 = sub_10002B014(v3);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

+ (id)_stringForSoundEnabled:(BOOL)a3
{
  if (a3) {
    v3 = @"Settings-Sound-On";
  }
  else {
    v3 = @"Settings-Sound-Off";
  }
  id v4 = sub_10002B014(v3);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

+ (id)_stringForGroupEnabled:(BOOL)a3
{
  if (a3) {
    v3 = @"Settings-Grouping-On";
  }
  else {
    v3 = @"Settings-Grouping-Off";
  }
  id v4 = sub_10002B014(v3);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

+ (id)updateBlockForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"settings_speech"])
  {
    v11 = _NSConcreteStackBlock;
    id v5 = sub_10002AB34;
    id v6 = &v11;
  }

  else if ([v4 isEqualToString:@"settings_sound"])
  {
    id v10 = _NSConcreteStackBlock;
    id v5 = sub_10002ABD0;
    id v6 = &v10;
  }

  else
  {
    if (![v4 isEqualToString:@"settings_groupElements"])
    {
      id v7 = &stru_100122B48;
      goto LABEL_8;
    }

    id v9 = _NSConcreteStackBlock;
    id v5 = sub_10002AC6C;
    id v6 = &v9;
  }

  v6[1] = (void **)3221225472LL;
  v6[2] = (void **)v5;
  v6[3] = (void **)&unk_100122B28;
  v6[4] = (void **)a1;
  id v7 = objc_retainBlock(v6);
LABEL_8:

  return v7;
}

@end