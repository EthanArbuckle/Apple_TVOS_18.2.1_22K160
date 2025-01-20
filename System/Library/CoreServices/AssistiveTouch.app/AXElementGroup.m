@interface AXElementGroup
- (BOOL)isHandUI;
- (BOOL)isVisible;
- (BOOL)scatAssistiveTechFocused;
- (BOOL)scatBeginScanningFromSelfAfterActivation;
- (BOOL)scatCanScrollInAtLeastOneDirection;
- (BOOL)scatCanShowAlternateKeys;
- (BOOL)scatHidesGroupCursorWhenFocused;
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatIsAXElement;
- (BOOL)scatIsAuxiliaryElement;
- (BOOL)scatIsKeyboardKey;
- (BOOL)scatIsMemberOfGroup;
- (BOOL)scatIsOnScreen;
- (BOOL)scatIsValid;
- (BOOL)scatPathIsInSceneReferenceSpace;
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)scatPerformAction:(int)a3 withValue:(id)a4;
- (BOOL)scatShouldActivateDirectly;
- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement;
- (BOOL)scatShouldSuppressAudioOutput;
- (BOOL)scatSupportsAction:(int)a3;
- (BOOL)scatUpdatesMenu;
- (CGPath)scatPath;
- (CGPoint)scatCenterPoint;
- (CGPoint)scatScreenPointForOperations;
- (CGRect)scatTextCursorFrame;
- (NSArray)scatAlternateKeys;
- (NSArray)scatCustomActions;
- (NSArray)scatCustomHardwareActions;
- (NSArray)scatDrags;
- (NSArray)scatDrops;
- (NSNumber)scatOverrideCursorTheme;
- (NSString)scatSpeakableDescription;
- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager;
- (id)elemLog;
- (id)scatSpeakableDescription:(BOOL)a3;
- (id)scatSupportedGestures;
- (id)scatValue;
- (id)scrollableElement;
- (int)scatPid;
- (int64_t)scatActivateBehavior;
- (unint64_t)scatScanningBehaviorTraits;
- (unint64_t)scatTraits;
- (unsigned)scatDisplayId;
- (void)prepareElementsForScanning:(id)a3;
- (void)scatScrollToVisible;
- (void)setScatAuxiliaryElementManager:(id)a3;
@end

@implementation AXElementGroup

- (id)elemLog
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"{ "));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v4 = self;
  id v5 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        else {
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 scatSpeakableDescription]);
        }
        v11 = v10;
        if (!-[__CFString length](v10, "length"))
        {

          v11 = @"[no label]";
        }

        [v3 appendFormat:@"%@ ", v11];
      }

      id v6 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  [v3 appendString:@" }"];
  return v3;
}

- (unint64_t)scatTraits
{
  return 0LL;
}

- (BOOL)scatPathIsInSceneReferenceSpace
{
  return 0;
}

- (CGPoint)scatCenterPoint
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)scatScreenPointForOperations
{
  id v2 = -[AXElementGroup scatFrame](self, "scatFrame");
  sub_10002ADFC((uint64_t)v2, v3, v4, v5, v6, v7);
  double Center = AX_CGRectGetCenter(v8);
  result.double y = v10;
  result.double x = Center;
  return result;
}

- (BOOL)scatIsAXElement
{
  return 0;
}

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return 1;
}

- (BOOL)scatSupportsAction:(int)a3
{
  return 0;
}

- (BOOL)scatPerformAction:(int)a3
{
  return 0;
}

- (BOOL)scatPerformAction:(int)a3 withValue:(id)a4
{
  return 0;
}

- (CGPath)scatPath
{
  return 0LL;
}

- (id)scatSupportedGestures
{
  return 0LL;
}

- (BOOL)scatIsKeyboardKey
{
  return 0;
}

- (BOOL)scatCanShowAlternateKeys
{
  return 0;
}

- (NSArray)scatAlternateKeys
{
  return 0LL;
}

- (CGRect)scatTextCursorFrame
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSNumber)scatOverrideCursorTheme
{
  return 0LL;
}

- (NSArray)scatCustomActions
{
  return 0LL;
}

- (NSArray)scatCustomHardwareActions
{
  return 0LL;
}

- (BOOL)scatHidesGroupCursorWhenFocused
{
  return 0;
}

- (unint64_t)scatScanningBehaviorTraits
{
  unint64_t result = (unint64_t)-[AXElementGroup userDefinedScanningBehaviorTraits]( self,  "userDefinedScanningBehaviorTraits");
  if ((result & 0x10) != 0)
  {
    CGFloat v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup firstLeafDescendant](self, "firstLeafDescendant"));
    id v5 = [v4 scanningBehaviorTraits];

    return (unint64_t)v5;
  }

  return result;
}

- (BOOL)scatIsMemberOfGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup parentGroup](self, "parentGroup"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager
{
  return (SCATAuxiliaryElementManager *)objc_getAssociatedObject(self, &unk_100157788);
}

- (void)setScatAuxiliaryElementManager:(id)a3
{
}

- (BOOL)scatIsAuxiliaryElement
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup scatAuxiliaryElementManager](self, "scatAuxiliaryElementManager"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)scatShouldActivateDirectly
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v3 switchControlShouldAlwaysActivateKeyboardKeys]
    && [v3 switchControlTapBehavior] != (id)2
    && (CGFloat v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup keyboardContainer](self, "keyboardContainer")),
        v4,
        v4))
  {
    unsigned __int8 v5 = 1;
  }

  else if (-[AXElementGroup count](self, "count"))
  {
    CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup objectAtIndex:](self, "objectAtIndex:", 0LL));
    unsigned __int8 v5 = [v6 scatShouldActivateDirectly];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)scatIndicatesOwnFocus
{
  id v3 = -[AXElementGroup count](self, "count");
  if (v3)
  {
    CGFloat v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup objectAtIndex:](self, "objectAtIndex:", 0LL));
    unsigned __int8 v5 = [v4 scatIndicatesOwnFocus];

    LOBYTE(v3) = v5;
  }

  return (char)v3;
}

- (int64_t)scatActivateBehavior
{
  return 1LL;
}

- (id)scrollableElement
{
  if (-[AXElementGroup count](self, "count"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup objectAtIndex:](self, "objectAtIndex:", 0LL));
    CGFloat v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scrollableElement]);
  }

  else
  {
    CGFloat v4 = 0LL;
  }

  return v4;
}

- (BOOL)scatCanScrollInAtLeastOneDirection
{
  id v3 = -[AXElementGroup count](self, "count");
  if (v3)
  {
    CGFloat v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup objectAtIndex:](self, "objectAtIndex:", 0LL));
    unsigned __int8 v5 = [v4 scatCanScrollInAtLeastOneDirection];

    LOBYTE(v3) = v5;
  }

  return (char)v3;
}

- (id)scatSpeakableDescription:(BOOL)a3
{
  CGFloat v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup accessibilityLabel](self, "accessibilityLabel", a3));

  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[AXElementGroup accessibilityLabel](self, "accessibilityLabel"));
  }

  else
  {
    CGFloat v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup label](self, "label"));

    if (v6)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[AXElementGroup label](self, "label"));
    }

    else
    {
      if (!-[AXElementGroup isKeyboardContainer](self, "isKeyboardContainer"))
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXElementGroup descendantsPassingTest:](self, "descendantsPassingTest:", &stru_100124880));
        id v11 = sub_10002B014(@"GROUP_DESCRIPTION");
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 scatSpeakableDescription]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 scatSpeakableDescription]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v14, v16));

        return v8;
      }

      id v7 = sub_10002B014(@"KEYBOARD");
      uint64_t v5 = objc_claimAutoreleasedReturnValue(v7);
    }
  }

  uint64_t v8 = (void *)v5;
  return v8;
}

- (NSString)scatSpeakableDescription
{
  return (NSString *)-[AXElementGroup scatSpeakableDescription:](self, "scatSpeakableDescription:", 0LL);
}

- (id)scatValue
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXElementGroup;
  id v2 = -[AXElementGroup accessibilityValue](&v4, "accessibilityValue");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)scatShouldSuppressAudioOutput
{
  return 0;
}

- (BOOL)scatIsValid
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = self;
  id v3 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)i), "scatIsValid", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)scatScrollToVisible
{
}

- (BOOL)scatIsOnScreen
{
  double MinX = CGRectGetMinX(v16);
  -[AXElementGroup frame](self, "frame");
  double MaxX = CGRectGetMaxX(v17);
  -[AXElementGroup frame](self, "frame");
  double MinY = CGRectGetMinY(v18);
  -[AXElementGroup frame](self, "frame");
  double MaxY = CGRectGetMaxY(v19);
  -[HNDHandManager screenFrame:]_0(v7, v8);
  double v10 = v9;
  -[HNDHandManager screenFrame:]_0(v11, v12);
  BOOL v14 = MinX >= 0.0;
  if (MinY < 0.0) {
    BOOL v14 = 0;
  }
  if (MaxX > v10) {
    BOOL v14 = 0;
  }
  return MaxY <= v13 && v14;
}

- (BOOL)scatBeginScanningFromSelfAfterActivation
{
  return 0;
}

- (BOOL)scatUpdatesMenu
{
  return 0;
}

- (int)scatPid
{
  return -1;
}

- (NSArray)scatDrops
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)scatDrags
{
  return (NSArray *)&__NSArray0__struct;
}

- (unsigned)scatDisplayId
{
  uint64_t v5 = 0LL;
  CGFloat v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100092FD4;
  v4[3] = &unk_100124908;
  v4[4] = &v5;
  -[AXElementGroup enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v4);
  unsigned int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isHandUI
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  unsigned int v2 = self;
  id v3 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)i), "isHandUI", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)isVisible
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  unsigned int v2 = self;
  id v3 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)i), "isVisible", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = -[AXElementGroup countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)prepareElementsForScanning:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100093260;
  v3[3] = &unk_100122F98;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (BOOL)scatAssistiveTechFocused
{
  return 0;
}

@end