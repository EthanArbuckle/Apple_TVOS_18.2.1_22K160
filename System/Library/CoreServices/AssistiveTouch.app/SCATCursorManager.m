@interface SCATCursorManager
- (BOOL)isCursorUIHidden;
- (NSString)description;
- (SCATCursorController)containingGroupCursorController;
- (SCATCursorController)focusedItemCursorController;
- (SCATCursorController)menuItemCursorController;
- (SCATCursorManager)initWithDisplaySource:(id)a3;
- (SCATCursorManagerDelegate)delegate;
- (SCATDisplaySource)displaySourceDelegate;
- (id)_cursorPathAndFrame:(CGRect *)a3 forElementFrame:(CGRect)a4 inDisplayContext:(id)a5;
- (id)cursors;
- (id)displayContextForCursor:(id)a3;
- (id)displayContextForCursor:(id)a3 forDisplayID:(unsigned int)a4;
- (id)styleProvider;
- (void)_path:(id *)a3 frame:(CGRect *)a4 isSimpleRect:(BOOL *)a5 forFocusContext:(id)a6 cursor:(id)a7;
- (void)_reorderLayersIfNeededForDisplayID:(unsigned int)a3;
- (void)_theme:(int64_t *)a3 level:(int64_t *)a4 forFocusContext:(id)a5 cursor:(id)a6 options:(int)a7;
- (void)_updateCursor:(id)a3 withFocusContext:(id)a4 shouldAnimate:(BOOL)a5 options:(int)a6;
- (void)_updateZoom:(CGRect)a3 withElement:(id)a4 cursorController:(id)a5;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)beginSelectTimeoutAnimation:(double)a3;
- (void)cancelSelectTimeoutAnimationIfNeeded;
- (void)dealloc;
- (void)hideCursor:(BOOL)a3 animated:(BOOL)a4;
- (void)setContainingGroupCursorController:(id)a3;
- (void)setCursorUIHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaySourceDelegate:(id)a3;
- (void)setFocusedItemCursorController:(id)a3;
- (void)setMenuItemCursorController:(id)a3;
- (void)updateMainCursorWithElement:(id)a3;
- (void)updateWithFocusContext:(id)a3 animated:(BOOL)a4 options:(int)a5;
@end

@implementation SCATCursorManager

- (SCATCursorManager)initWithDisplaySource:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SCATCursorManager;
  v5 = -[SCATCursorManager init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[SCATCursorManager setDisplaySourceDelegate:](v5, "setDisplaySourceDelegate:", v4);
    v7 = objc_alloc_init(&OBJC_CLASS___SCATCursorController);
    -[SCATCursorManager setFocusedItemCursorController:](v6, "setFocusedItemCursorController:", v7);
    -[SCATCursorController setDelegate:](v7, "setDelegate:", v6);
    v8 = objc_alloc_init(&OBJC_CLASS___SCATCursorController);

    -[SCATCursorManager setContainingGroupCursorController:](v6, "setContainingGroupCursorController:", v8);
    -[SCATCursorController setDelegate:](v8, "setDelegate:", v6);
    v9 = objc_alloc_init(&OBJC_CLASS___SCATCursorController);

    -[SCATCursorManager setMenuItemCursorController:](v6, "setMenuItemCursorController:", v9);
    -[SCATCursorController setDelegate:](v9, "setDelegate:", v6);
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager containingGroupCursorController](self, "containingGroupCursorController"));
  [v3 setDelegate:0];

  -[SCATCursorManager setContainingGroupCursorController:]( self,  "setContainingGroupCursorController:",  self->_containingGroupCursorController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager menuItemCursorController](self, "menuItemCursorController"));
  [v4 setDelegate:0];

  -[SCATCursorManager setMenuItemCursorController:]( self,  "setMenuItemCursorController:",  self->_menuItemCursorController);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATCursorManager;
  -[SCATCursorManager dealloc](&v5, "dealloc");
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATCursorManager isCursorUIHidden](self, "isCursorUIHidden")));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager containingGroupCursorController](self, "containingGroupCursorController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager menuItemCursorController](self, "menuItemCursorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATCursorManager:<%p>. HIDDEN:%@\n\tFocusCursor:%@\n\tGroupCursor:%@\n\tMenuCursor:%@\n\t",  self,  v3,  v4,  v5,  v6));

  return (NSString *)v7;
}

- (id)displayContextForCursor:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager menuItemCursorController](self, "menuItemCursorController"));
  unsigned int v6 = [v4 isEqual:v5];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager displaySourceDelegate](self, "displaySourceDelegate"));
  v8 = v7;
  if (v6) {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 scatFrontCursorUIContext]);
  }
  else {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 scatBackCursorUIContext]);
  }
  v10 = (void *)v9;

  return v10;
}

- (id)displayContextForCursor:(id)a3 forDisplayID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager menuItemCursorController](self, "menuItemCursorController"));
  unsigned int v8 = [v6 isEqual:v7];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager displaySourceDelegate](self, "displaySourceDelegate"));
  v10 = v9;
  if (v8) {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 scatFrontCursorUIContextForDisplayID:v4]);
  }
  else {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 scatBackCursorUIContextForDisplayID:v4]);
  }
  v12 = (void *)v11;

  return v12;
}

- (id)cursors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager containingGroupCursorController](self, "containingGroupCursorController", v3));
  v8[1] = v4;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager menuItemCursorController](self, "menuItemCursorController"));
  v8[2] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));

  return v6;
}

- (id)styleProvider
{
  return +[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider");
}

- (void)_updateZoom:(CGRect)a3 withElement:(id)a4 cursorController:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v29 = a4;
  id v11 = a5;
  if (_AXSZoomTouchEnabled())
  {
    unint64_t v12 = (unint64_t)[v29 scatTraits];
    if ((kAXIsEditingTrait & v12) != 0)
    {
      [v29 scatTextCursorFrame];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = (UIView *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager displayContextForCursor:](self, "displayContextForCursor:", v11));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 window]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 screen]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 displayIdentity]);
      -[UIView notifyZoomFocusDidChangeWithType:rect:contextId:displayId:]( v21,  "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:",  3,  0,  [v25 displayID],  v14,  v16,  v18,  v20);

LABEL_12:
      goto LABEL_13;
    }

    unint64_t v26 = v12;
    uint64_t IsPhoneIdiom = AXDeviceIsPhoneIdiom();
    if ((_DWORD)IsPhoneIdiom)
    {
      if (width <= 250.0 || (kAXButtonTrait & v26) != 0)
      {
        if (width <= 100.0 && height <= 100.0) {
          goto LABEL_11;
        }
        double x = AX_CGRectGetCenter(IsPhoneIdiom) + -2.5;
        double y = v28 + -2.5;
      }

      double width = 5.0;
      double height = 5.0;
    }

- (void)_updateCursor:(id)a3 withFocusContext:(id)a4 shouldAnimate:(BOOL)a5 options:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a3;
  id v10 = a4;
  -[SCATCursorManager _theme:level:forFocusContext:cursor:options:]( self,  "_theme:level:forFocusContext:cursor:options:",  &v21,  &v20,  v10,  v9,  v6);
  char v19 = 1;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v18 = size;
  if (v20)
  {
    id v16 = 0LL;
    -[SCATCursorManager _path:frame:isSimpleRect:forFocusContext:cursor:]( self,  "_path:frame:isSimpleRect:forFocusContext:cursor:",  &v16,  &origin,  &v19,  v10,  v9);
    id v12 = v16;
    uint64_t v13 = v20;
  }

  else
  {
    uint64_t v13 = 0LL;
    id v12 = 0LL;
  }

  objc_msgSend(v9, "updateTheme:level:path:frame:isSimpleRect:animated:options:", v21, v13, v12, origin, v18);
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
  if (v14 != v9) {
    goto LABEL_7;
  }
  unsigned int v15 = [v10 shouldBeTrackedByZoom];

  if (v15)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue([v10 element]);
    -[SCATCursorManager _updateZoom:withElement:cursorController:]( self,  "_updateZoom:withElement:cursorController:",  v14,  v9,  origin,  v18);
LABEL_7:
  }
}

- (void)updateWithFocusContext:(id)a3 animated:(BOOL)a4 options:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  -[SCATCursorManager _reorderLayersIfNeededForDisplayID:]( self,  "_reorderLayersIfNeededForDisplayID:",  [v8 displayID]);
  if (v8)
  {
    __int128 v20 = 0uLL;
    __int128 v21 = 0uLL;
    *((void *)&v18 + 1) = 0LL;
    __int128 v19 = 0uLL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager cursors](self, "cursors", 0LL));
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          -[SCATCursorManager _updateCursor:withFocusContext:shouldAnimate:options:]( self,  "_updateCursor:withFocusContext:shouldAnimate:options:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  v8,  v6,  v5);
        }

        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }

      while (v11);
    }
  }

  else
  {
    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    __int128 v22 = 0uLL;
    __int128 v23 = 0uLL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager cursors](self, "cursors"));
    id v14 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) updateLevel:0 animated:v6 options:v5];
        }

        id v15 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v15);
    }
  }
}

- (void)updateMainCursorWithElement:(id)a3
{
  id v4 = a3;
  -[SCATCursorManager _reorderLayersIfNeededForDisplayID:]( self,  "_reorderLayersIfNeededForDisplayID:",  [v4 scatDisplayId]);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SCATFocusContext adHocFocusContext:](&OBJC_CLASS___SCATFocusContext, "adHocFocusContext:", v4));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
  -[SCATCursorManager _updateCursor:withFocusContext:shouldAnimate:options:]( self,  "_updateCursor:withFocusContext:shouldAnimate:options:",  v5,  v6,  0LL,  0LL);
}

- (void)beginSelectTimeoutAnimation:(double)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v5 cursorBackgroundLayer]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"fillColor"));
  [v6 setValue:@"scatBeginSelectTimeoutAnimation" forKey:@"scatAnimationID"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v8 = [v7 assistiveTouchCursorColor];

  id v9 = (CGColor *)AXSAssistiveTouchCursorColor(v8);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(v9, 0.5);
  [v6 setToValue:CopyWithAlpha];
  [v6 setDuration:a3];
  [v6 setDelegate:self];
  [v6 setRemovedOnCompletion:0];
  [v11 addAnimation:v6 forKey:@"scatBeginSelectTimeoutAnimation"];
  if (CopyWithAlpha) {
    CFRelease(CopyWithAlpha);
  }
}

- (void)cancelSelectTimeoutAnimationIfNeeded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 cursorBackgroundLayer]);

  [v3 removeAnimationForKey:@"scatBeginSelectTimeoutAnimation"];
}

- (void)hideCursor:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (-[SCATCursorManager isCursorUIHidden](self, "isCursorUIHidden") != a3)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager cursors](self, "cursors", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) hide:v5 animate:v4];
          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v9);
    }

    -[SCATCursorManager setCursorUIHidden:](self, "setCursorUIHidden:", v5);
  }

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", @"scatAnimationID", a4));
  unsigned int v6 = [v5 isEqualToString:@"scatBeginSelectTimeoutAnimation"];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
    id v10 = (id)objc_claimAutoreleasedReturnValue([v7 cursorBackgroundLayer]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"strokeColor"));
    [v8 setValue:@"scatEndSelectTimeoutAnimation" forKey:@"scatAnimationID"];
    id v9 = objc_claimAutoreleasedReturnValue([v10 restingStrokeColor]);
    objc_msgSend(v8, "setToValue:", objc_msgSend(v9, "CGColor"));

    [v8 setDuration:0.3];
    [v8 setRemovedOnCompletion:1];
    [v10 addAnimation:v8 forKey:@"scatEndSelectTimeoutAnimation"];
  }

- (void)_reorderLayersIfNeededForDisplayID:(unsigned int)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
  v11[0] = v5;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager containingGroupCursorController](self, "containingGroupCursorController"));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager menuItemCursorController](self, "menuItemCursorController"));
  v11[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 3LL));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100095624;
  v9[3] = &unk_100124950;
  v9[4] = self;
  unsigned int v10 = a3;
  [v8 enumerateObjectsUsingBlock:v9];
}

- (void)_theme:(int64_t *)a3 level:(int64_t *)a4 forFocusContext:(id)a5 cursor:(id)a6 options:(int)a7
{
  char v7 = a7;
  id v46 = a5;
  id v12 = a6;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
  unsigned int v14 = [v12 isEqual:v13];

  if (v14)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v46 element]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v46 menuElement]);

    if (v15 != v16)
    {
      if ((v7 & 8) != 0)
      {
        int64_t v22 = 4LL;
        goto LABEL_37;
      }

      double v17 = (void *)objc_claimAutoreleasedReturnValue([v46 element]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 scatOverrideCursorTheme]);

      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v46 element]);
      __int128 v20 = v19;
      if (v18)
      {
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 scatOverrideCursorTheme]);
        int64_t v22 = [v21 unsignedIntValue];

LABEL_37:
        int64_t v39 = 1LL;
        goto LABEL_38;
      }

      uint64_t v40 = [v19 scatIndicatesOwnFocus];

      if ((v40 & 1) == 0)
      {
        if ([v46 selectBehavior] == 4)
        {
          int64_t v22 = 3LL;
          goto LABEL_37;
        }

        if ([v46 selectBehavior] == 1)
        {
          int64_t v39 = 1LL;
          int64_t v22 = 1LL;
          goto LABEL_38;
        }

        [v46 selectBehavior];
LABEL_36:
        int64_t v22 = 0LL;
        goto LABEL_37;
      }
    }

    goto LABEL_26;
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager containingGroupCursorController](self, "containingGroupCursorController"));
  unsigned int v24 = [v12 isEqual:v23];

  if (v24)
  {
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v46 element]);
    unsigned __int8 v26 = [v25 scatHidesGroupCursorWhenFocused];

    if ((v26 & 1) != 0) {
      goto LABEL_26;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue([v46 element]);
    double v28 = (void *)objc_claimAutoreleasedReturnValue([v46 menuElement]);

    if (v27 == v28) {
      goto LABEL_26;
    }
    if ([v46 selectBehavior] == 4)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v46 element]);
      unsigned int v30 = [v29 scatIsAuxiliaryElement];
    }

    else
    {
      unsigned int v30 = 1;
    }

    int64_t v39 = 0LL;
    int64_t v22 = 0LL;
    if ((v7 & 1) == 0 && v30)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue([v46 element]);
      if ([v41 scatIndicatesOwnFocus])
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v46 element]);
        unsigned int v43 = [v42 scatIsAuxiliaryElement];

        if (!v43) {
          goto LABEL_26;
        }
      }

      else
      {
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue([v46 parentGroup]);
      v45 = v44;
      if (v44 && ![v44 isRootGroup])
      {
        int64_t v22 = 2LL;
        int64_t v39 = 1LL;
      }

      else
      {
        int64_t v39 = 0LL;
        int64_t v22 = 0LL;
      }
    }
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager menuItemCursorController](self, "menuItemCursorController"));
    unsigned int v32 = [v12 isEqual:v31];

    if (!v32) {
      goto LABEL_36;
    }
    uint64_t v33 = objc_claimAutoreleasedReturnValue([v46 menuElement]);
    if (!v33
      || (v34 = (void *)v33,
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager delegate](self, "delegate")),
          unsigned __int8 v36 = [v35 cursorManagerShouldHideMenuCursor:self],
          v35,
          v34,
          (v36 & 1) != 0))
    {
LABEL_26:
      int64_t v39 = 0LL;
      int64_t v22 = 0LL;
      goto LABEL_38;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v46 menuElement]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v46 element]);

    int64_t v22 = 0LL;
    if (v37 == v38) {
      int64_t v39 = 1LL;
    }
    else {
      int64_t v39 = 2LL;
    }
  }

- (void)_path:(id *)a3 frame:(CGRect *)a4 isSimpleRect:(BOOL *)a5 forFocusContext:(id)a6 cursor:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v49 = size;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[SCATCursorManager displayContextForCursor:forDisplayID:]( self,  "displayContextForCursor:forDisplayID:",  v13,  [v12 displayID]));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager focusedItemCursorController](self, "focusedItemCursorController"));
  unsigned int v17 = [v13 isEqual:v16];

  if (v17)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v12 element]);
LABEL_9:
    int64_t v22 = (void *)v18;
    goto LABEL_10;
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager containingGroupCursorController](self, "containingGroupCursorController"));
  unsigned int v20 = [v13 isEqual:v19];

  if (!v20)
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager menuItemCursorController](self, "menuItemCursorController"));
    unsigned int v24 = [v13 isEqual:v23];

    if (!v24)
    {
      int64_t v22 = 0LL;
      goto LABEL_22;
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v12 menuElement]);
    goto LABEL_9;
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 parentGroup]);
  if ([v21 scatIsAuxiliaryElement])
  {
    do
    {
      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 parentGroup]);

      __int128 v21 = v22;
    }

    while (([v22 scatIsAuxiliaryElement] & 1) != 0);
LABEL_10:
    if (v22) {
      goto LABEL_11;
    }
LABEL_22:
    BOOL v29 = 0;
    __int128 v25 = 0LL;
    if (!a3) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  int64_t v22 = v21;
  if (!v21) {
    goto LABEL_22;
  }
LABEL_11:
  if ([v22 scatPath])
  {
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithCGPath:]( UIBezierPath,  "bezierPathWithCGPath:",  [v22 scatPath]));
    if ([v22 scatPathIsInSceneReferenceSpace])
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 convertPathToView:v15]);

      +[HNDScreen convertRect:toView:]( &OBJC_CLASS___HNDScreen,  "convertRect:toView:",  v15,  -[HNDHandManager screenFrame:]_0(v27, v28));
      BOOL v29 = 0;
      origin.double x = v30;
      origin.double y = v31;
      v49.double width = v32;
      v49.double height = v33;
      __int128 v25 = (void *)v26;
      if (!a3) {
        goto LABEL_24;
      }
LABEL_23:
      *a3 = v25;
      goto LABEL_24;
    }

    [v22 scatFrame];
    +[HNDScreen convertRect:toView:](&OBJC_CLASS___HNDScreen, "convertRect:toView:", v15);
    BOOL v29 = 0;
    origin.double x = v43;
    origin.double y = v44;
    v49.double width = v45;
    v49.double height = v46;
    if (a3) {
      goto LABEL_23;
    }
  }

  else
  {
    [v22 scatFrame];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v50.origin.double x = CGRectZero.origin.x;
    v50.origin.double y = CGRectZero.origin.y;
    v50.size.double width = CGRectZero.size.width;
    v50.size.double height = CGRectZero.size.height;
    v51.origin.double x = v35;
    v51.origin.double y = v37;
    v51.size.double width = v39;
    v51.size.double height = v41;
    BOOL v42 = CGRectEqualToRect(v50, v51);
    if (v42) {
      __int128 v25 = 0LL;
    }
    else {
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( -[SCATCursorManager _cursorPathAndFrame:forElementFrame:inDisplayContext:]( self,  "_cursorPathAndFrame:forElementFrame:inDisplayContext:",  &origin,  v15,  v35,  v37,  v39,  v41));
    }
    BOOL v29 = !v42;
    if (a3) {
      goto LABEL_23;
    }
  }

- (id)_cursorPathAndFrame:(CGRect *)a3 forElementFrame:(CGRect)a4 inDisplayContext:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v11 = CGRectZero.origin.y;
  CGFloat v12 = CGRectZero.size.width;
  CGFloat v13 = CGRectZero.size.height;
  id v14 = a5;
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  v64.origin.CGFloat x = CGRectZero.origin.x;
  v64.origin.CGFloat y = v11;
  v64.size.CGFloat width = v12;
  v64.size.CGFloat height = v13;
  if (CGRectEqualToRect(v57, v64)) {
    *(void *)&double v15 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATCursorManager.m",  552LL,  "-[SCATCursorManager _cursorPathAndFrame:forElementFrame:inDisplayContext:]",  @"Should not have tried to get the path for a zero frame.").n128_u64[0];
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager styleProvider](self, "styleProvider", v15));
  [v16 cursorBackgroundBorderWidth];
  double v18 = v17;

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager styleProvider](self, "styleProvider"));
  [v19 cursorElementPadding];
  double v21 = v20;

  int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCursorManager styleProvider](self, "styleProvider"));
  [v22 cursorRoundedRectCornerRadius];
  double v56 = v23;

  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.CGFloat width = width;
  v58.size.CGFloat height = height;
  CGRect v59 = CGRectInset(v58, -v21, -v21);
  double v24 = v59.origin.x;
  double v25 = v59.size.width;
  double v26 = (40.0 - v59.size.height) * 0.5;
  if (v59.size.height >= 40.0) {
    double v26 = 0.0;
  }
  double v27 = v59.origin.y - v26;
  if (v59.size.height >= 40.0) {
    double v28 = v59.size.height;
  }
  else {
    double v28 = 40.0;
  }
  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v14 _screen]);
  [v29 nativeBounds];
  double v34 = sub_10002AE8C(v24, v27, v25, v28, v30, v31, v32, v33);
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  +[HNDScreen convertRect:toView:](&OBJC_CLASS___HNDScreen, "convertRect:toView:", v14, v34, v36, v38, v40);
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;

  v60.origin.CGFloat x = 0.0;
  v60.origin.CGFloat y = 0.0;
  v60.size.CGFloat width = v46;
  v60.size.CGFloat height = v48;
  CGRect v61 = CGRectInset(v60, v18 * 0.5, v18 * 0.5);
  CGRect v62 = CGRectIntegral(v61);
  double v49 = v62.origin.x;
  double v50 = v62.origin.y;
  double v51 = v62.size.width;
  double v52 = v62.size.height;
  if (CGRectIsEmpty(v62)
    || (v63.origin.x = v49, v63.origin.y = v50, v63.size.width = v51, v63.size.CGFloat height = v52, CGRectIsInfinite(v63))
    || !CGFloatIsValid(v49))
  {
    v54 = 0LL;
  }

  else
  {
    int IsValid = CGFloatIsValid(v50);
    v54 = 0LL;
    if (IsValid && v51 > 0.0 && v52 > 0.0) {
      v54 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  v49,  v50,  v51,  v52,  v56));
    }
  }

  if (a3)
  {
    a3->origin.CGFloat x = v42;
    a3->origin.CGFloat y = v44;
    a3->size.CGFloat width = v46;
    a3->size.CGFloat height = v48;
  }

  return v54;
}

- (SCATDisplaySource)displaySourceDelegate
{
  return self->_displaySourceDelegate;
}

- (void)setDisplaySourceDelegate:(id)a3
{
}

- (SCATCursorManagerDelegate)delegate
{
  return (SCATCursorManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCATCursorController)focusedItemCursorController
{
  return self->_focusedItemCursorController;
}

- (void)setFocusedItemCursorController:(id)a3
{
}

- (SCATCursorController)containingGroupCursorController
{
  return self->_containingGroupCursorController;
}

- (void)setContainingGroupCursorController:(id)a3
{
}

- (SCATCursorController)menuItemCursorController
{
  return self->_menuItemCursorController;
}

- (void)setMenuItemCursorController:(id)a3
{
}

- (BOOL)isCursorUIHidden
{
  return self->_cursorUIHidden;
}

- (void)setCursorUIHidden:(BOOL)a3
{
  self->_cursorUIHidden = a3;
}

- (void).cxx_destruct
{
}

@end