@interface SCATModernMenuItemGesturesFactory
+ (id)_fingerItemStringForNumberOfFingers:(unint64_t)a3;
+ (id)_imageNameForNumberOfFingers:(unint64_t)a3;
+ (id)itemDetailsForItem:(id)a3 menu:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
@end

@implementation SCATModernMenuItemGesturesFactory

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
  if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesTap])
  {
    v57[0] = @"gestures_tap";
    v56[0] = @"identifier";
    v56[1] = @"title";
    id v5 = sub_10002B014(@"TAP");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v56[2] = @"activateBehavior";
    v57[1] = v6;
    v57[2] = &off_10012FB20;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v57,  v56,  3LL));
    v58 = v7;
    id v8 = &v58;
  }

  else
  {
    if (![v4 isEqualToString:AXSSwitchControlMenuItemGesturesTapAndHold])
    {
      if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesForceTouch])
      {
        if (AXForceTouchAvailableAndEnabled())
        {
          v51[0] = @"gestures_forceTouch";
          v50[0] = @"identifier";
          v50[1] = @"title";
          id v10 = sub_10002B014(@"FORCE_TOUCH");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
          v51[1] = v6;
          v51[2] = @"SCATIcon_gestures_3dtouch";
          v50[2] = @"imageName";
          v50[3] = @"activateBehavior";
          v51[3] = &off_10012FB20;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  4LL));
          v52 = v7;
          id v8 = &v52;
          goto LABEL_26;
        }
      }

      else
      {
        if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesFlick])
        {
          v48[0] = @"gestures_flick";
          v47[0] = @"identifier";
          v47[1] = @"title";
          id v11 = sub_10002B014(@"FlickMenu");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v11);
          v47[2] = @"activateBehavior";
          v48[1] = v6;
          v48[2] = &off_10012FB38;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  3LL));
          v49 = v7;
          id v8 = &v49;
          goto LABEL_26;
        }

        if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesPan])
        {
          v45[0] = @"gestures_pan";
          v44[0] = @"identifier";
          v44[1] = @"title";
          id v12 = sub_10002B014(@"PanMenu");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v12);
          v44[2] = @"activateBehavior";
          v45[1] = v6;
          v45[2] = &off_10012FB38;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  3LL));
          v46 = v7;
          id v8 = &v46;
          goto LABEL_26;
        }

        if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesPinch])
        {
          v42[0] = @"gestures_pinch";
          v41[0] = @"identifier";
          v41[1] = @"title";
          id v13 = sub_10002B014(@"PinchMenu");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v42[1] = v6;
          v42[2] = @"SCATIcon_gestures_pinchIn";
          v41[2] = @"imageName";
          v41[3] = @"activateBehavior";
          v42[3] = &off_10012FB38;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  4LL));
          v43 = v7;
          id v8 = &v43;
          goto LABEL_26;
        }

        if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesDrag])
        {
          v39[0] = @"gestures_dragAndDrop";
          v38[0] = @"identifier";
          v38[1] = @"title";
          id v14 = sub_10002B014(@"DRAG_AND_DROP");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v39[1] = v6;
          v39[2] = @"SCATIcon_gestures_drag";
          v38[2] = @"imageName";
          v38[3] = @"activateBehavior";
          v39[3] = &off_10012FB20;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  4LL));
          v40 = v7;
          id v8 = &v40;
          goto LABEL_26;
        }

        if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesHoldAndDrag])
        {
          v36[0] = @"gestures_holdAndDrag";
          v35[0] = @"identifier";
          v35[1] = @"title";
          id v15 = sub_10002B014(@"HOLD_AND_DRAG");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v15);
          v36[1] = v6;
          v36[2] = @"SCATIcon_gestures_holdAndDrag";
          v35[2] = @"imageName";
          v35[3] = @"activateBehavior";
          v36[3] = &off_10012FB20;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  4LL));
          v37 = v7;
          id v8 = &v37;
          goto LABEL_26;
        }

        if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesDoubleTap])
        {
          v33[0] = @"gestures_doubleTap";
          v32[0] = @"identifier";
          v32[1] = @"title";
          id v16 = sub_10002B014(@"DOUBLE_TAP");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v32[2] = @"activateBehavior";
          v33[1] = v6;
          v33[2] = &off_10012FB20;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));
          v34 = v7;
          id v8 = &v34;
          goto LABEL_26;
        }

        if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesFreehand])
        {
          v30[0] = @"freehand";
          v29[0] = @"identifier";
          v29[1] = @"title";
          id v17 = sub_10002B014(@"DrawingGesture");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v29[2] = @"activateBehavior";
          v30[1] = v6;
          v30[2] = &off_10012FB38;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  3LL));
          v31 = v7;
          id v8 = &v31;
          goto LABEL_26;
        }

        if ([v4 isEqualToString:AXSSwitchControlMenuItemGesturesFingers])
        {
          v27[0] = @"gestures_fingers1";
          v26[0] = @"identifier";
          v26[1] = @"title";
          id v18 = sub_10002B014(@"FingersMenu");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v26[2] = @"activateBehavior";
          v27[1] = v6;
          v27[2] = &off_10012FB38;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  3LL));
          v28 = v7;
          id v8 = &v28;
          goto LABEL_26;
        }

        id v19 = [v4 isEqualToString:AXSSwitchControlMenuItemGesturesSaved];
        if ((_DWORD)v19)
        {
          v24[0] = @"gestures_favorites";
          v23[0] = @"identifier";
          v23[1] = @"title";
          id v20 = sub_10002B014(@"CustomGesturesMenu");
          v6 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v23[2] = @"activateBehavior";
          v24[1] = v6;
          v24[2] = &off_10012FB38;
          v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  3LL));
          v25 = v7;
          id v8 = &v25;
          goto LABEL_26;
        }

        _AXAssert( v19,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/SCATModernMenuItemGesturesFactory.m",  146LL,  "+[SCATModernMenuItemGesturesFactory itemDetailsForItem:menu:]",  @"Unhandled gestures menu item type: %@");
      }

      __int128 v21 = 0LL;
      goto LABEL_27;
    }

    v54[0] = @"gestures_tapAndHold";
    v53[0] = @"identifier";
    v53[1] = @"title";
    id v9 = sub_10002B014(@"TAP_AND_HOLD");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v53[2] = @"activateBehavior";
    v54[1] = v6;
    v54[2] = &off_10012FB38;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  3LL));
    v55 = v7;
    id v8 = &v55;
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
  if ([v9 isEqualToString:@"gestures_tap"])
  {
    id v15 = &stru_100124180;
  }

  else if ([v9 isEqualToString:@"gestures_tapAndHold"])
  {
    id v15 = &stru_1001241A0;
  }

  else if ([v9 isEqualToString:@"gestures_flick"])
  {
    id v15 = &stru_1001241C0;
  }

  else if ([v9 isEqualToString:@"gestures_pan"])
  {
    id v15 = &stru_1001241E0;
  }

  else if ([v9 isEqualToString:@"gestures_pinch"])
  {
    id v15 = &stru_100124200;
  }

  else if ([v9 isEqualToString:@"gestures_dragAndDrop"])
  {
    id v15 = &stru_100124220;
  }

  else if ([v9 isEqualToString:@"gestures_fingers1"])
  {
    id v15 = &stru_100124240;
  }

  else if ([v9 isEqualToString:@"gestures_doubleTap"])
  {
    id v15 = &stru_100124260;
  }

  else if ([v9 isEqualToString:@"gestures_holdAndDrag"])
  {
    id v15 = &stru_100124280;
  }

  else if ([v9 isEqualToString:@"gestures_favorites"])
  {
    id v15 = &stru_1001242A0;
  }

  else if ([v9 isEqualToString:@"freehand"])
  {
    id v15 = &stru_1001242C0;
  }

  else if ([v9 isEqual:@"gestures_forceTouch"])
  {
    id v15 = &stru_1001242E0;
  }

  else
  {
    id v15 = 0LL;
  }

  *(void *)&double v16 = objc_opt_class(a1, v14).n128_u64[0];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "updateBlockForIdentifier:", v9, v16));
  LOBYTE(v21) = 1;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssi stiveAccess:activateHandler:updateHandler:",  v9,  v7,  v10,  v11,  v13,  1LL,  v21,  v15,  v18));

  return v19;
}

+ (id)updateBlockForIdentifier:(id)a3
{
  if ([a3 isEqualToString:@"gestures_fingers1"])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100077DD8;
    v6[3] = &unk_100122B28;
    v6[4] = a1;
    id v4 = objc_retainBlock(v6);
  }

  else
  {
    id v4 = &stru_100124300;
  }

  return v4;
}

+ (id)_fingerItemStringForNumberOfFingers:(unint64_t)a3
{
  id v4 = sub_10002B014(@"FingersFormat");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
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
    return *(&off_100124320 + a3 - 1);
  }
}

@end