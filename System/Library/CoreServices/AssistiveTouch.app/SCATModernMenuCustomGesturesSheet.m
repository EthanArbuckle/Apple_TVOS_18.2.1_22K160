@interface SCATModernMenuCustomGesturesSheet
- (BOOL)shouldUpdateMenuItem:(id)a3;
- (SCATMenuCustomGestureItemsViewDelegate)delegate;
- (SCATModernMenuCustomGesturesSheet)initWithType:(int)a3 menu:(id)a4;
- (id)backTitle;
- (id)makeMenuItemsIfNeeded;
- (int)type;
- (void)_loadGestures;
- (void)menuItemWasActivated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sheetWillAppear:(BOOL)a3;
@end

@implementation SCATModernMenuCustomGesturesSheet

- (SCATModernMenuCustomGesturesSheet)initWithType:(int)a3 menu:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATModernMenuCustomGesturesSheet;
  result = -[SCATModernMenuSheet initWithMenu:](&v6, "initWithMenu:", a4);
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (void)sheetWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATModernMenuCustomGesturesSheet;
  -[SCATModernMenuSheet sheetWillAppear:](&v6, "sheetWillAppear:", a3);
  -[SCATModernMenuCustomGesturesSheet _loadGestures](self, "_loadGestures");
  -[SCATModernMenuSheet invalidateMenuItems](self, "invalidateMenuItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheet menu](self, "menu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 menuVisualProvider]);
  [v5 reloadMenuVisuals];
}

- (id)makeMenuItemsIfNeeded
{
  v3 = (char *)-[NSMutableArray count](self->_gestures, "count");
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v3));
  if (v3)
  {
    for (i = 0LL; i != v3; ++i)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_gestures, "objectAtIndex:", i));
      BOOL v6 = self->_type == 1;
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
      if ([v5 hasLocalizableName])
      {
        id v8 = sub_10002B014(v7);
        uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

        v7 = (void *)v9;
      }

      uint64_t v10 = 2LL * v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"gestures_replay", "stringByAppendingFormat:", @"%lu", i));
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  v11,  self,  v7,  0LL,  v10));

      [v12 setCustomGesture:v5];
      [v29 addObject:v12];
    }
  }

  if (!self->_type)
  {
    id v13 = sub_10002B014(@"ADD_IN_SETTINGS");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    LOBYTE(v28) = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:",  @"gestures_create",  self,  v14,  0LL,  2LL,  0LL,  v28));
    [v29 addObject:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assistiveTouchRecentGestures]);

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    v20 = v18;
    if (v19)
    {
      id v21 = v19;
      int v22 = 0;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (j = 0LL; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v18);
          }
          v22 |= -[NSMutableArray containsObject:]( self->_gestures,  "containsObject:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)j)) ^ 1;
        }

        id v21 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v21);

      if ((v22 & 1) == 0) {
        goto LABEL_17;
      }
      id v25 = sub_10002B014(@"ADD_RECENT");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[SCATModernMenuItem itemWithIdentifier:delegate:title:imageName:activateBehavior:]( &OBJC_CLASS___SCATModernMenuItem,  "itemWithIdentifier:delegate:title:imageName:activateBehavior:",  @"gestures_addRecent",  self,  v20,  0LL,  2LL));
      [v29 addObject:v26];
    }

LABEL_17:
  }

  return v29;
}

- (id)backTitle
{
  return sub_10002B014(@"BACK_TO_GESTURES");
}

- (BOOL)shouldUpdateMenuItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v6 = [v5 hasPrefix:@"gestures_replay"];
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuCustomGesturesSheet delegate](self, "delegate"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contextForCustomGestureItemsViewController:self]);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 customGesture]);
    +[SCATModernMenuItem imageSize](&OBJC_CLASS___SCATModernMenuItem, "imageSize");
    double v11 = v10;
    double v13 = v12;
    [v8 frame];
    double v15 = v14;
    double v17 = v16;
    id v18 = v9;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v19 scale];
    CGFloat v21 = v20;
    v59.width = v11;
    v59.height = v13;
    UIGraphicsBeginImageContextWithOptions(v59, 0, v21);

    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    if (CurrentContext)
    {
      uint64_t v23 = CurrentContext;
      char v49 = v6;
      v47 = v8;
      v48 = v5;
      if ([v18 shouldPerformAtOriginalLocation])
      {
        id v24 = (id)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
        id v25 = objc_claimAutoreleasedReturnValue([v24 scannerBlueColor]);
        v26 = (CGColor *)[v25 CGColor];
      }

      else
      {
        id v24 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
        v26 = (CGColor *)[v24 CGColor];
      }

      id v50 = v4;

      CGContextSetStrokeColorWithColor(v23, v26);
      CGContextSetLineWidth(v23, 5.0);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      id v29 = (char *)[v18 numberOfEvents];
      if (v29)
      {
        for (i = 0LL; i != v29; ++i)
        {
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v18 fingerIdentifiersAtEventIndex:i]);
          [v28 addObjectsFromArray:v31];
        }
      }

      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      id obj = v28;
      id v53 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v53)
      {
        double v32 = v11 / v15;
        uint64_t v52 = *(void *)v55;
        double v33 = v13 / v17;
        do
        {
          for (j = 0LL; j != v53; j = (char *)j + 1)
          {
            if (*(void *)v55 != v52) {
              objc_enumerationMutation(obj);
            }
            if (v29)
            {
              v35 = 0LL;
              LOBYTE(v36) = 0;
              uint64_t v37 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)j);
              do
              {
                char v38 = v36;
                v39 = (void *)objc_claimAutoreleasedReturnValue([v18 fingerIdentifiersAtEventIndex:v35]);
                unsigned int v36 = [v39 containsObject:v37];

                if (v36)
                {
                  [v18 pointForFingerIdentifier:v37 atEventIndex:v35];
                  double v42 = v32 * v40;
                  double v43 = v33 * v41;
                  if ((v38 & 1) != 0)
                  {
                    CGContextAddLineToPoint(v23, v32 * v40, v33 * v41);
                  }

                  else
                  {
                    v44 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:",  1LL,  v32 * v40,  v33 * v41,  5.0,  0.0,  6.28318531));
                    [v44 setLineWidth:2.0];
                    [v44 stroke];
                    CGContextBeginPath(v23);
                    CGContextMoveToPoint(v23, v42, v43);
                  }
                }

                else if ((v38 & 1) != 0)
                {
                  CGContextStrokePath(v23);
                }

                ++v35;
              }

              while (v29 != v35);
              if ((v36 & 1) != 0) {
                CGContextStrokePath(v23);
              }
            }
          }

          id v53 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
        }

        while (v53);
      }

      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v27 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);

      id v4 = v50;
      LOBYTE(v6) = v49;
      id v8 = v47;
      v5 = v48;
    }

    else
    {
      v27 = 0LL;
    }

    UIGraphicsEndImageContext();

    [v4 setImage:v27];
  }

  return v6 ^ 1;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 hasPrefix:@"gestures_replay"]
    && (unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", objc_msgSend(@"gestures_replay", "length"))),
        id v7 = [v6 integerValue],
        v6,
        v7 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuCustomGesturesSheet delegate](self, "delegate"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_gestures, "objectAtIndexedSubscript:", v7));
    [v9 customGestureItemsViewController:self didChooseGesture:v10];
  }

  else
  {
    if ([v5 isEqualToString:@"gestures_addRecent"])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuCustomGesturesSheet delegate](self, "delegate"));
      [v8 didChooseAddRecentInCustomGestureItemsViewController:self];
    }

    else
    {
      if (![v5 isEqualToString:@"gestures_create"])
      {
        v11.receiver = self;
        v11.super_class = (Class)&OBJC_CLASS___SCATModernMenuCustomGesturesSheet;
        -[SCATModernMenuSheet menuItemWasActivated:](&v11, "menuItemWasActivated:", v4);
        goto LABEL_10;
      }

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuCustomGesturesSheet delegate](self, "delegate"));
      [v8 didChooseCreateInCustomGestureItemsViewController:self];
    }
  }

- (void)_loadGestures
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = v3;
  int type = self->_type;
  if (!type)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 assistiveTouchSavedGestures]);
    goto LABEL_5;
  }

  if (type == 1)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 assistiveTouchRecentGestures]);
LABEL_5:
    id v7 = v6;
    id v8 = (NSMutableArray *)[v6 mutableCopy];
    gestures = self->_gestures;
    self->_gestures = v8;

    goto LABEL_7;
  }

  uint64_t v15 = self->_type;
  _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATModernMenuCustomGesturesSheet.m",  258LL,  "-[SCATModernMenuCustomGesturesSheet _loadGestures]",  @"Unrecognized type of gesture %lu");
LABEL_7:
  if (self->_type == 1)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 assistiveTouchSavedGestures]);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          -[NSMutableArray removeObject:]( self->_gestures,  "removeObject:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  v15);
        }

        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v12);
    }
  }
}

- (SCATMenuCustomGestureItemsViewDelegate)delegate
{
  return (SCATMenuCustomGestureItemsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end