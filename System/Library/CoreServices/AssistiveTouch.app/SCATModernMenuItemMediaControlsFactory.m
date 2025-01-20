@interface SCATModernMenuItemMediaControlsFactory
+ (id)itemDetailsForItem:(id)a3 menu:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
@end

@implementation SCATModernMenuItemMediaControlsFactory

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
  id v4 = a3;
  if ([v4 isEqualToString:AXSSwitchControlMenuItemMediaControlsPlayPause])
  {
    v37[0] = @"mediacontrols_play_pause";
    v36[0] = @"identifier";
    v36[1] = @"title";
    id v5 = sub_10002B014(@"MediaControls-PlayPause");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v36[2] = @"activateBehavior";
    v37[1] = v6;
    v37[2] = &off_10012F6E8;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  3LL));
    v38 = v7;
    id v8 = &v38;
  }

  else if ([v4 isEqualToString:AXSSwitchControlMenuItemMediaControlsPreviousTrack])
  {
    v34[0] = @"mediacontrols_previous_chapter";
    v33[0] = @"identifier";
    v33[1] = @"title";
    id v9 = sub_10002B014(@"MediaControls-PreviousTrack");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v33[2] = @"activateBehavior";
    v34[1] = v6;
    v34[2] = &off_10012F6E8;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL));
    v35 = v7;
    id v8 = &v35;
  }

  else if ([v4 isEqualToString:AXSSwitchControlMenuItemMediaControlsNextTrack])
  {
    v31[0] = @"mediacontrols_next_chapter";
    v30[0] = @"identifier";
    v30[1] = @"title";
    id v10 = sub_10002B014(@"MediaControls-NextTrack");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v30[2] = @"activateBehavior";
    v31[1] = v6;
    v31[2] = &off_10012F6E8;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  3LL));
    v32 = v7;
    id v8 = &v32;
  }

  else if ([v4 isEqualToString:AXSSwitchControlMenuItemMediaControlsSkipForward])
  {
    v28[0] = @"mediacontrols_seek_frame_forward";
    v27[0] = @"identifier";
    v27[1] = @"title";
    id v11 = sub_10002B014(@"MediaControls-SkipForward");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v27[2] = @"activateBehavior";
    v28[1] = v6;
    v28[2] = &off_10012F6E8;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  3LL));
    v29 = v7;
    id v8 = &v29;
  }

  else if ([v4 isEqualToString:AXSSwitchControlMenuItemMediaControlsSkipBackward])
  {
    v25[0] = @"mediacontrols_seek_frame_backward";
    v24[0] = @"identifier";
    v24[1] = @"title";
    id v12 = sub_10002B014(@"MediaControls-SkipBackward");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v24[2] = @"activateBehavior";
    v25[1] = v6;
    v25[2] = &off_10012F6E8;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  3LL));
    v26 = v7;
    id v8 = &v26;
  }

  else if ([v4 isEqualToString:AXSSwitchControlMenuItemMediaControlsRewind])
  {
    v22[0] = @"mediacontrols_rewind";
    v21[0] = @"identifier";
    v21[1] = @"title";
    id v13 = sub_10002B014(@"MediaControls-Rewind");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v21[2] = @"activateBehavior";
    v22[1] = v6;
    v22[2] = &off_10012F6E8;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));
    v23 = v7;
    id v8 = &v23;
  }

  else
  {
    id v14 = [v4 isEqualToString:AXSSwitchControlMenuItemMediaControlsFastForward];
    if (!(_DWORD)v14)
    {
      _AXAssert( v14,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATModernMenuItemMediaControlsFactory.m",  83LL,  "+[SCATModernMenuItemMediaControlsFactory itemDetailsForItem:menu:]",  @"Unhandled media control menu item type: %@");
      v16 = 0LL;
      goto LABEL_16;
    }

    v19[0] = @"mediacontrols_forward";
    v18[0] = @"identifier";
    v18[1] = @"title";
    id v15 = sub_10002B014(@"MediaControls-FastForward");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v18[2] = @"activateBehavior";
    v19[1] = v6;
    v19[2] = &off_10012F6E8;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
    __int128 v20 = v7;
    id v8 = &v20;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 1LL));

LABEL_16:
  return v16;
}

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"identifier"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"title"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"imageName"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"activateBehavior"]);
  id v13 = [v12 unsignedIntegerValue];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"guidedAccess"]);
  id v15 = [v14 BOOLValue];

  if ([v9 isEqualToString:@"mediacontrols_play_pause"])
  {
    v17 = &stru_100121DA0;
  }

  else if ([v9 isEqualToString:@"mediacontrols_previous_chapter"])
  {
    v17 = &stru_100121DC0;
  }

  else if ([v9 isEqualToString:@"mediacontrols_next_chapter"])
  {
    v17 = &stru_100121DE0;
  }

  else if ([v9 isEqualToString:@"mediacontrols_seek_frame_forward"])
  {
    v17 = &stru_100121E00;
  }

  else if ([v9 isEqualToString:@"mediacontrols_seek_frame_backward"])
  {
    v17 = &stru_100121E20;
  }

  else if ([v9 isEqualToString:@"mediacontrols_rewind"])
  {
    v17 = &stru_100121E40;
  }

  else if ([v9 isEqualToString:@"mediacontrols_forward"])
  {
    v17 = &stru_100121E60;
  }

  else
  {
    v17 = 0LL;
  }

  id v18 = objc_msgSend((id)objc_opt_class(a1, v16), "updateBlockForIdentifier:", v9);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  LOBYTE(v22) = 0;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssi stiveAccess:activateHandler:updateHandler:",  v9,  v7,  v10,  v11,  v13,  v15,  v22,  v17,  v19));

  return v20;
}

+ (id)updateBlockForIdentifier:(id)a3
{
  return &stru_100121EA0;
}

@end