@interface SCATElementManager
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)canBeActiveElementManager;
- (BOOL)containsElement:(id)a3;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (BOOL)isAppleTVRemoteElementManager;
- (BOOL)isElementNavElementManager;
- (BOOL)isGestureDrawingElementManager;
- (BOOL)isGestureProviderElementManager;
- (BOOL)isMenuElementManager;
- (BOOL)isPointPickerElementManager;
- (BOOL)providesElements;
- (BOOL)shouldKeepScannerAwake;
- (NSMutableDictionary)auxiliaryElementManagers;
- (NSString)identifier;
- (SCATAuxiliaryElementManager)currentAuxiliaryElementManager;
- (SCATElementManagerVisualProvider)visualProvider;
- (UIView)currentDisplayContext;
- (id)allAuxiliaryElementManagers;
- (id)auxiliaryElementAfter:(id)a3;
- (id)auxiliaryElementBefore:(id)a3;
- (id)auxiliaryElementManagersForRole:(int64_t)a3;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)enabledAuxiliaryElementManagersForRoles:(int64_t)a3;
- (id)firstAuxiliaryElementWithRole:(int64_t)a3;
- (id)firstElementWithOptions:(int *)a3;
- (id)focusContextAfterDrillOutOnGroup:(id)a3;
- (id)lastAuxiliaryElementWithRole:(int64_t)a3;
- (id)lastElementWithOptions:(int *)a3;
- (id)nextAuxiliaryElementManagerFrom:(id)a3 role:(int64_t)a4 excludeDisabled:(BOOL)a5;
- (id)nextFocusContextAfterActivatingKeyboardElement:(id)a3;
- (id)nextFocusContextAfterDismissingMenuForElement:(id)a3;
- (id)numberOfItemsInCurrentScanCycle;
- (id)previousAuxiliaryElementManagerTo:(id)a3 role:(int64_t)a4 excludeDisabled:(BOOL)a5;
- (id)siblingOfElement:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5 options:(int *)a6;
- (int64_t)auxiliaryElementCountWithRole:(int64_t)a3;
- (int64_t)roleForElement:(id)a3;
- (unsigned)currentDisplayID;
- (void)appendAuxiliaryElementManager:(id)a3 withRole:(int64_t)a4;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)hideIfNeeded:(BOOL)a3;
- (void)orientationDidChange:(id)a3;
- (void)presentWithDisplayContext:(id)a3 animated:(BOOL)a4;
- (void)redisplayIfNeeded:(BOOL)a3;
- (void)removeAuxiliaryElementManagerForAllRoles:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3;
- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
- (void)setAuxiliaryElementManagers:(id)a3;
- (void)setCurrentAuxiliaryElementManager:(id)a3;
- (void)setCurrentDisplayContext:(id)a3;
- (void)setVisualProvider:(id)a3;
@end

@implementation SCATElementManager

- (BOOL)isElementNavElementManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager identifier](self, "identifier"));
  unsigned __int8 v3 = [v2 isEqualToString:off_100157148[0]];

  return v3;
}

- (BOOL)isMenuElementManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager identifier](self, "identifier"));
  unsigned __int8 v3 = [v2 isEqualToString:off_100157150[0]];

  return v3;
}

- (BOOL)isAppleTVRemoteElementManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager identifier](self, "identifier"));
  unsigned __int8 v3 = [v2 isEqualToString:off_100157170];

  return v3;
}

- (BOOL)isPointPickerElementManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager identifier](self, "identifier"));
  unsigned __int8 v3 = [v2 isEqualToString:off_100157158[0]];

  return v3;
}

- (BOOL)isGestureProviderElementManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager identifier](self, "identifier"));
  unsigned __int8 v3 = [v2 isEqualToString:off_100157160[0]];

  return v3;
}

- (BOOL)isGestureDrawingElementManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager identifier](self, "identifier"));
  unsigned __int8 v3 = [v2 isEqualToString:off_100157168[0]];

  return v3;
}

- (id)siblingOfElement:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5 options:(int *)a6
{
  if (a4) {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager elementBefore:didWrap:options:]( self,  "elementBefore:didWrap:options:",  a3,  a5,  a6));
  }
  else {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager elementAfter:didWrap:options:]( self,  "elementAfter:didWrap:options:",  a3,  a5,  a6));
  }
  return v6;
}

- (BOOL)providesElements
{
  return 1;
}

- (id)firstElementWithOptions:(int *)a3
{
  return 0LL;
}

- (id)lastElementWithOptions:(int *)a3
{
  return 0LL;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return 0LL;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return 0LL;
}

- (BOOL)containsElement:(id)a3
{
  return 0;
}

- (void)scannerWillMakeManagerActive:(id)a3
{
  id v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager currentDisplayContext](self, "currentDisplayContext"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "scatUIContextForDisplayID:",  -[SCATElementManager currentDisplayID](self, "currentDisplayID")));
    -[SCATElementManager setCurrentDisplayContext:](self, "setCurrentDisplayContext:", v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager currentDisplayContext](self, "currentDisplayContext"));
  [v6 presentWithDisplayContext:v7 animated:0];
}

- (void)scannerWillMakeManagerActive:(id)a3 forDisplayID:(unsigned int)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 scatUIContextForDisplayID:*(void *)&a4]);
  -[SCATElementManager setCurrentDisplayContext:](self, "setCurrentDisplayContext:", v5);

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager currentDisplayContext](self, "currentDisplayContext"));
  [v7 presentWithDisplayContext:v6 animated:0];
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  [v5 dismiss:0];
}

- (void)hideIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  unsigned int v6 = [v5 isDisplayed];

  if (v6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
    [v7 dismiss:v3];
  }

- (void)redisplayIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager currentDisplayContext](self, "currentDisplayContext"));

  if (!v5)
  {
    uint64_t v6 = -[SCATElementManager currentDisplayID](self, "currentDisplayID");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scatUIContextForDisplayID:v6]);
    -[SCATElementManager setCurrentDisplayContext:](self, "setCurrentDisplayContext:", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  unsigned __int8 v10 = [v9 isDisplayed];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager currentDisplayContext](self, "currentDisplayContext"));
  if ((v10 & 1) != 0) {
    [v12 didUpdateWithDisplayContext:v11 animated:v3];
  }
  else {
    [v12 presentWithDisplayContext:v11 animated:v3];
  }
}

- (void)presentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  -[SCATElementManager setCurrentDisplayContext:](self, "setCurrentDisplayContext:", v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  [v6 didUpdateWithDisplayContext:v5 animated:1];
}

- (unsigned)currentDisplayID
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager currentDisplayContext](self, "currentDisplayContext"));

  if (v3) {
    return -[UIView _accessibilityDisplayId](self->_currentDisplayContext, "_accessibilityDisplayId");
  }
  else {
    return 1;
  }
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  return 0;
}

- (BOOL)canBeActiveElementManager
{
  return 0;
}

- (id)numberOfItemsInCurrentScanCycle
{
  return 0LL;
}

- (BOOL)shouldKeepScannerAwake
{
  return 0;
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  return 1;
}

- (void)orientationDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SCATElementManager currentDisplayID](self, "currentDisplayID");
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 scatUIContextForDisplayID:v5]);

  [v7 orientationDidChange:v6];
}

- (id)nextFocusContextAfterDismissingMenuForElement:(id)a3
{
  return 0LL;
}

- (id)nextFocusContextAfterActivatingKeyboardElement:(id)a3
{
  return 0LL;
}

- (id)focusContextAfterDrillOutOnGroup:(id)a3
{
  return +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  a3,  self,  0LL,  0LL);
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
  id v19 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager visualProvider](self, "visualProvider"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v19 element]);
  [v7 updateCustomFocusingViewStateForViewsWithElement:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v19 element]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scatAuxiliaryElementManager]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager currentAuxiliaryElementManager](self, "currentAuxiliaryElementManager"));

  if (v10 != v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager currentAuxiliaryElementManager](self, "currentAuxiliaryElementManager"));
    [v12 willResignCurrentAuxiliaryElementManager];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v19 element]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 scatAuxiliaryElementManager]);
    [v14 willBecomeCurrentAuxiliaryElementManager];

    v15 = (void *)objc_claimAutoreleasedReturnValue([v19 element]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 scatAuxiliaryElementManager]);
    -[SCATElementManager setCurrentAuxiliaryElementManager:](self, "setCurrentAuxiliaryElementManager:", v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v19 element]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 scatAuxiliaryElementManager]);
  [v18 driver:v6 willFocusOnContext:v19];
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v8 element]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v11 scatAuxiliaryElementManager]);
  [v10 driver:v9 didFocusOnContext:v8 oldContext:v7];
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 element]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 scatAuxiliaryElementManager]);
  [v7 driver:v6 willUnfocusFromContext:v5];
}

- (void)appendAuxiliaryElementManager:(id)a3 withRole:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v21 = v6;
    if ([v6 role]) {
      *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementManager.m",  342LL,  "-[SCATElementManager appendAuxiliaryElementManager:withRole:]",  @"Aux Manager should not have a role set prior").n128_u64[0];
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementManagers](self, "auxiliaryElementManagers", v7));

    if (!v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[SCATElementManager setAuxiliaryElementManagers:](self, "setAuxiliaryElementManagers:", v9);
    }

    memset_pattern16(__b, &unk_100118220, 0x10uLL);
    char v11 = 0;
    uint64_t v12 = 0LL;
    char v13 = 1;
    do
    {
      char v14 = v13;
      uint64_t v15 = (1 << v11);
      if ((v15 & a4) != 0) {
        __b[v12++] = v15;
      }
      char v13 = 0;
      char v11 = 1;
    }

    while ((v14 & 1) != 0);
    if (v12 <= 0) {
      *(void *)&double v10 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementManager.m",  350LL,  "-[SCATElementManager appendAuxiliaryElementManager:withRole:]",  @"A role mask of 0 is not allowed").n128_u64[0];
    }
    uint64_t v16 = __b[0];
    objc_msgSend(v21, "setRole:", __b[0], v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementManagers](self, "auxiliaryElementManagers"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v17]);

    if (!v19)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementManagers](self, "auxiliaryElementManagers"));
      [v20 setObject:v19 forKeyedSubscript:v17];
    }

    [v19 addObject:v21];

    id v6 = v21;
  }
}

- (void)removeAuxiliaryElementManagerForAllRoles:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementManagers](self, "auxiliaryElementManagers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A6868;
  v7[3] = &unk_100124CD8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)allAuxiliaryElementManagers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementManagers](self, "auxiliaryElementManagers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A6914;
  v7[3] = &unk_100124CD8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (id)auxiliaryElementManagersForRole:(int64_t)a3
{
  if (a3 == 3) {
    return (id)objc_claimAutoreleasedReturnValue( -[SCATElementManager allAuxiliaryElementManagers]( self,  "allAuxiliaryElementManagers"));
  }
  memset_pattern16(__b, &unk_100118220, 0x10uLL);
  char v7 = 0;
  uint64_t v8 = 0LL;
  char v9 = 1;
  do
  {
    char v10 = v9;
    uint64_t v11 = (1 << v7);
    if ((v11 & a3) != 0) {
      __b[v8++] = v11;
    }
    char v9 = 0;
    char v7 = 1;
  }

  while ((v10 & 1) != 0);
  if (v8 <= 0) {
    *(void *)&double v6 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementManager.m",  387LL,  "-[SCATElementManager auxiliaryElementManagersForRole:]",  @"A role mask of 0 is not allowed").n128_u64[0];
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementManagers](self, "auxiliaryElementManagers", v6));
  char v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", __b[0]));
  char v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);

  return v14;
}

- (id)enabledAuxiliaryElementManagersForRoles:(int64_t)a3
{
  char v5 = 0;
  uint64_t v6 = 0LL;
  char v7 = 1;
  do
  {
    char v8 = v7;
    uint64_t v9 = (1 << v5);
    if ((v9 & a3) != 0) {
      __b[v6++] = v9;
    }
    char v7 = 0;
    char v5 = 1;
  }

  while ((v8 & 1) != 0);
  if (v6 < 1)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementManager.m",  395LL,  "-[SCATElementManager enabledAuxiliaryElementManagersForRoles:]",  @"A role mask of 0 is not allowed");
    char v10 = 0LL;
  }

  else
  {
    char v10 = 0LL;
    uint64_t v11 = __b;
    do
    {
      uint64_t v12 = *v11++;
      char v13 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager auxiliaryElementManagersForRole:]( self,  "auxiliaryElementManagersForRole:",  v12));
      char v14 = (void *)objc_claimAutoreleasedReturnValue([v13 axFilterObjectsUsingBlock:&stru_100124D18]);

      if ([v14 count])
      {
        if (!v10) {
          char v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }
        [v10 addObjectsFromArray:v14];
      }

      --v6;
    }

    while (v6);
  }

  return v10;
}

- (id)nextAuxiliaryElementManagerFrom:(id)a3 role:(int64_t)a4 excludeDisabled:(BOOL)a5
{
  id v8 = a3;
  if (v8)
  {
    memset_pattern16(__b, &unk_100118220, 0x10uLL);
    uint64_t v9 = 0LL;
    char v10 = 0;
    char v11 = 1;
    do
    {
      char v12 = v11;
      uint64_t v13 = (1 << v10);
      if ((v13 & a4) != 0) {
        __b[v9++] = v13;
      }
      char v11 = 0;
      char v10 = 1;
    }

    while ((v12 & 1) != 0);
    if (v9 <= 0)
    {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementManager.m",  421LL,  "-[SCATElementManager nextAuxiliaryElementManagerFrom:role:excludeDisabled:]",  @"A role mask of 0 is not allowed");
      if (a5)
      {
LABEL_8:
        char v14 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager enabledAuxiliaryElementManagersForRoles:]( self,  "enabledAuxiliaryElementManagersForRoles:",  __b[0]));
        if (!v14) {
          goto LABEL_16;
        }
LABEL_13:
        v18 = (char *)[v14 indexOfObject:v8];
        if (v18 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          id v19 = v18;
          if (v18 < (char *)[v14 count] - 1)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v19 + 1]);
LABEL_17:

            goto LABEL_18;
          }
        }

- (id)previousAuxiliaryElementManagerTo:(id)a3 role:(int64_t)a4 excludeDisabled:(BOOL)a5
{
  id v8 = a3;
  if (v8)
  {
    memset_pattern16(__b, &unk_100118220, 0x10uLL);
    uint64_t v9 = 0LL;
    char v10 = 0;
    char v11 = 1;
    do
    {
      char v12 = v11;
      uint64_t v13 = (1 << v10);
      if ((v13 & a4) != 0) {
        __b[v9++] = v13;
      }
      char v11 = 0;
      char v10 = 1;
    }

    while ((v12 & 1) != 0);
    if (v9 <= 0)
    {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementManager.m",  441LL,  "-[SCATElementManager previousAuxiliaryElementManagerTo:role:excludeDisabled:]",  @"A role mask of 0 is not allowed");
      if (a5)
      {
LABEL_8:
        char v14 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager enabledAuxiliaryElementManagersForRoles:]( self,  "enabledAuxiliaryElementManagersForRoles:",  __b[0]));
        if (v14)
        {
LABEL_9:
          uint64_t v15 = (char *)[v14 indexOfObject:v8];
          uint64_t v16 = 0LL;
          goto LABEL_16;
        }

- (id)firstAuxiliaryElementWithRole:(int64_t)a3
{
  char v5 = 0;
  uint64_t v6 = 0LL;
  char v7 = 1;
  do
  {
    char v8 = v7;
    uint64_t v9 = (1 << v5);
    if ((v9 & a3) != 0) {
      __b[v6++] = v9;
    }
    char v7 = 0;
    char v5 = 1;
  }

  while ((v8 & 1) != 0);
  if (v6 <= 0) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementManager.m",  459LL,  "-[SCATElementManager firstAuxiliaryElementWithRole:]",  @"A role mask of 0 is not allowed");
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  char v10 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager enabledAuxiliaryElementManagersForRoles:]( self,  "enabledAuxiliaryElementManagersForRoles:",  __b[0],  0LL));
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) firstElementWithOptions:0]);
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          goto LABEL_17;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = 0LL;
LABEL_17:

  return v16;
}

- (id)lastAuxiliaryElementWithRole:(int64_t)a3
{
  char v5 = 0;
  uint64_t v6 = 0LL;
  char v7 = 1;
  do
  {
    char v8 = v7;
    uint64_t v9 = (1 << v5);
    if ((v9 & a3) != 0) {
      __b[v6++] = v9;
    }
    char v7 = 0;
    char v5 = 1;
  }

  while ((v8 & 1) != 0);
  if (v6 <= 0) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementManager.m",  475LL,  "-[SCATElementManager lastAuxiliaryElementWithRole:]",  @"A role mask of 0 is not allowed");
  }
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  char v10 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager enabledAuxiliaryElementManagersForRoles:]( self,  "enabledAuxiliaryElementManagersForRoles:",  __b[0],  0LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 reverseObjectEnumerator]);

  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)i) lastElementWithOptions:0]);
        if (v16)
        {
          v17 = (void *)v16;
          goto LABEL_17;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v17 = 0LL;
LABEL_17:

  return v17;
}

- (id)auxiliaryElementBefore:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scatAuxiliaryElementManager]);
  uint64_t v6 = v5;
  if (v5)
  {
    char v12 = 0;
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 elementBefore:v4 didWrap:&v12 options:0]);
    char v8 = v7;
    if (v12)
    {
    }

    else if (v7)
    {
      goto LABEL_10;
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager previousAuxiliaryElementManagerTo:role:excludeDisabled:]( self,  "previousAuxiliaryElementManagerTo:role:excludeDisabled:",  v6,  [v6 role],  1));
  if (v9)
  {
    do
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 lastElementWithOptions:0]);
    while (!v10);
    char v8 = (void *)v10;
  }

  else
  {
    char v8 = 0LL;
  }

LABEL_10:
  return v8;
}

- (id)auxiliaryElementAfter:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scatAuxiliaryElementManager]);
  uint64_t v6 = v5;
  if (v5)
  {
    char v12 = 0;
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 elementAfter:v4 didWrap:&v12 options:0]);
    char v8 = v7;
    if (v12)
    {
    }

    else if (v7)
    {
      goto LABEL_10;
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager nextAuxiliaryElementManagerFrom:role:excludeDisabled:]( self,  "nextAuxiliaryElementManagerFrom:role:excludeDisabled:",  v6,  [v6 role],  1));
  if (v9)
  {
    do
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 firstElementWithOptions:0]);
    while (!v10);
    char v8 = (void *)v10;
  }

  else
  {
    char v8 = 0LL;
  }

LABEL_10:
  return v8;
}

- (int64_t)auxiliaryElementCountWithRole:(int64_t)a3
{
  char v5 = 0;
  uint64_t v6 = 0LL;
  char v7 = 1;
  do
  {
    char v8 = v7;
    uint64_t v9 = (1 << v5);
    if ((v9 & a3) != 0) {
      __b[v6++] = v9;
    }
    char v7 = 0;
    char v5 = 1;
  }

  while ((v8 & 1) != 0);
  if (v6 <= 0) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementManager.m",  554LL,  "-[SCATElementManager auxiliaryElementCountWithRole:]",  @"A role mask of 0 is not allowed");
  }
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementManager enabledAuxiliaryElementManagersForRoles:]( self,  "enabledAuxiliaryElementManagersForRoles:",  __b[0],  0LL));
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    int64_t v13 = 0LL;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v10);
        }
        v13 += (int64_t)[*(id *)(*((void *)&v17 + 1) + 8 * (void)i) numberOfElements];
      }

      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v12);
  }

  else
  {
    int64_t v13 = 0LL;
  }

  return v13;
}

- (int64_t)roleForElement:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 parentGroup]);
  unsigned int v4 = [v3 scatIsMemberOfGroup];

  if (v4) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

- (SCATElementManagerVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (void)setVisualProvider:(id)a3
{
}

- (NSMutableDictionary)auxiliaryElementManagers
{
  return self->_auxiliaryElementManagers;
}

- (void)setAuxiliaryElementManagers:(id)a3
{
}

- (SCATAuxiliaryElementManager)currentAuxiliaryElementManager
{
  return self->_currentAuxiliaryElementManager;
}

- (void)setCurrentAuxiliaryElementManager:(id)a3
{
}

- (UIView)currentDisplayContext
{
  return self->_currentDisplayContext;
}

- (void)setCurrentDisplayContext:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SCATElementManager, a2);
  NSRequestConcreteImplementation(self, a2, v4);
  return 0LL;
}

@end