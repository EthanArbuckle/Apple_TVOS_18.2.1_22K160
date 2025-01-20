@interface SCATMenuHardwareActionsMovementFactory
+ (id)_locKeyForHardwareActionString:(id)a3;
+ (id)_menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5 hardwareActionString:(id)a6;
+ (id)_systemImageNameForHardwareActionString:(id)a3;
+ (id)menuItemsForCustomHardwareActions:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForHardwareRotateCrownGestureWithMenu:(id)a3 delegate:(id)a4;
@end

@implementation SCATMenuHardwareActionsMovementFactory

+ (id)menuItemsForCustomHardwareActions:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v30 = a4;
  id v29 = a5;
  if ([v7 count])
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v25 = v7;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      v11 = @"rotateCrownToSwitch";
      uint64_t v12 = *(void *)v32;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          if ([v14 isEqualToString:v11])
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue([a1 menuItemsForHardwareRotateCrownGestureWithMenu:v30 delegate:v29]);
            -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v15);
          }

          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _locKeyForHardwareActionString:v14]);
            id v17 = sub_10002B014(v16);
            v15 = (void *)objc_claimAutoreleasedReturnValue(v17);

            v35[0] = @"identifier";
            v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"hardwareAction_",  v14));
            v36[0] = v18;
            v36[1] = v15;
            v35[1] = @"title";
            v35[2] = @"imageName";
            v19 = v8;
            v20 = v11;
            v21 = (void *)objc_claimAutoreleasedReturnValue([a1 _systemImageNameForHardwareActionString:v14]);
            v35[3] = @"activateBehavior";
            v36[2] = v21;
            v36[3] = &off_10012F838;
            v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  4LL));
            v23 = (void *)objc_claimAutoreleasedReturnValue( [a1 _menuItemWithItemDictionary:v22 menu:v30 delegate:v29 hardwareActionString:v14]);

            v11 = v20;
            v8 = v19;
            uint64_t v12 = v26;

            -[NSMutableArray addObject:](v8, "addObject:", v23);
          }
        }

        id v10 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }

      while (v10);
    }

    id v7 = v25;
  }

  else
  {
    v8 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v8;
}

+ (id)menuItemsForHardwareRotateCrownGestureWithMenu:(id)a3 delegate:(id)a4
{
  v22[0] = @"identifier";
  id v6 = a4;
  id v7 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"hardwareAction_",  @"rotateCrownClockwise"));
  v23[0] = v19;
  v22[1] = @"title";
  id v8 = sub_10002B014(@"Next");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v23[1] = v9;
  v23[2] = @"digitalcrown.horizontal.arrow.clockwise.fill";
  v22[2] = @"imageName";
  v22[3] = @"activateBehavior";
  v23[3] = &off_10012F850;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemWithItemDictionary:v10 menu:v7 delegate:v6 hardwareActionString:0]);
  v24[0] = v11;
  v20[0] = @"identifier";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"hardwareAction_",  @"kSCATMenuItemIDRotateCounterclockwise"));
  v21[0] = v12;
  v20[1] = @"title";
  id v13 = sub_10002B014(@"Previous");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v21[1] = v14;
  v21[2] = @"digitalcrown.horizontal.arrow.counterclockwise.fill";
  v20[2] = @"imageName";
  v20[3] = @"activateBehavior";
  v21[3] = &off_10012F850;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  4LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _menuItemWithItemDictionary:v15 menu:v7 delegate:v6 hardwareActionString:0]);

  v24[1] = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));

  return v17;
}

+ (id)_menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5 hardwareActionString:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"identifier"]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"title"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"imageName"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"activateBehavior"]);

  id v15 = [v14 unsignedIntegerValue];
  if ([v11 containsString:@"rotateCrownClockwise"])
  {
    v16 = &stru_100122A00;
  }

  else if ([v11 containsString:@"kSCATMenuItemIDRotateCounterclockwise"])
  {
    v16 = &stru_100122A20;
  }

  else
  {
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_100029B24;
    v23 = &unk_100122A48;
    id v24 = v9;
    v16 = objc_retainBlock(&v20);
  }

  LOBYTE(v19) = 0;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssi stiveAccess:activateHandler:updateHandler:",  v11,  v8,  v12,  v13,  v15,  0LL,  v19,  v16,  0LL,  v20,  v21,  v22,  v23));

  return v17;
}

+ (id)_locKeyForHardwareActionString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"pressCrownToSetUpLater"])
  {
    v4 = @"SET_UP_LATER";
  }

  else
  {
    if ([v3 isEqualToString:@"pressCrownToOpenHome"])
    {
      v4 = @"OPEN_HOME";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressCrownToContinue"])
    {
      v4 = @"CONTINUE";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressCrownToBegin"])
    {
      v4 = @"BEGIN";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressCrownToTryAgain"])
    {
      v4 = @"TRY_AGAIN";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressCrownToSelect"])
    {
      v4 = @"SELECT";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressCrownToStart"])
    {
      v4 = @"START";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressCrownToResume"])
    {
      v4 = @"RESUME";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressCrownAfterInsertsAttached"])
    {
      v4 = @"CONFIRM_INSERTS_ATTACHED";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressCrownAfterInsertsRemoved"])
    {
      v4 = @"CONFIRM_INSERTS_REMOVED";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressCrownForMoreOptions"])
    {
      v4 = @"MORE_OPTIONS";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"pressTopButtonToReplayVideo"])
    {
      v4 = @"REPLAY_VIDEO";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"triplePressLockToShowAccessibilityOptions"])
    {
      v4 = @"ACCESSIBILITY_OPTIONS";
      goto LABEL_35;
    }

    if ([v3 isEqualToString:@"doublePressCrownToSetUpManually"])
    {
LABEL_4:
      v4 = @"SET_UP_MANUALLY";
    }

    else if ([v3 isEqualToString:@"doublePressCrownToContinueWithoutLenses"])
    {
      v4 = @"CONTINUE_WITHOUT_LENSES";
    }

    else if ([v3 isEqualToString:@"doublePressCrownToCancel"])
    {
      v4 = @"CANCEL";
    }

    else
    {
      v4 = &stru_100127100;
    }
  }

+ (id)_systemImageNameForHardwareActionString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"pressCrownToSetUpLater"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToSetUpManually"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToOpenHome"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToContinue"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToBegin"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToTryAgain"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToSelect"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToStart"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownToResume"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownAfterInsertsAttached"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownAfterInsertsRemoved"] & 1) != 0
    || ([v3 isEqualToString:@"pressCrownForMoreOptions"] & 1) != 0
    || ([v3 isEqualToString:@"doublePressCrownToSetUpManually"] & 1) != 0
    || ([v3 isEqualToString:@"doublePressCrownToContinueWithoutLenses"] & 1) != 0
    || ([v3 isEqualToString:@"doublePressCrownToCancel"] & 1) != 0)
  {
    v4 = @"digitalcrown.horizontal.press.fill";
  }

  else
  {
    v4 = @"button.horizontal.top.press.fill";
    if (([v3 isEqualToString:@"pressTopButtonToReplayVideo"] & 1) == 0
      && ![v3 isEqualToString:@"triplePressLockToShowAccessibilityOptions"])
    {
      v4 = &stru_100127100;
    }
  }

  return (id)v4;
}

@end