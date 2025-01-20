@interface UIView
- (AXElementGroup)parentGroup;
- (BOOL)isGroup;
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
- (CGRect)scatFrame;
- (CGRect)scatTextCursorFrame;
- (NSArray)scatAlternateKeys;
- (NSArray)scatCustomActions;
- (NSArray)scatCustomHardwareActions;
- (NSArray)scatDrags;
- (NSArray)scatDrops;
- (NSNumber)scatOverrideCursorTheme;
- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager;
- (id)_axSubviews;
- (id)highestAncestorGroup;
- (id)keyboardContainer;
- (id)scatSupportedGestures;
- (id)scatValue;
- (id)scrollableElement;
- (int64_t)scatActivateBehavior;
- (unint64_t)scatMenuItemStyle;
- (unint64_t)scatScanningBehaviorTraits;
- (unint64_t)scatTraits;
- (void)_axPrintSubviews:(int64_t)a3 string:(id)a4;
- (void)setParentGroup:(id)a3;
- (void)setScatAuxiliaryElementManager:(id)a3;
- (void)setScatMenuItemStyle:(unint64_t)a3;
- (void)setScatShouldActivateDirectly:(BOOL)a3;
@end

@implementation UIView

- (void)_axPrintSubviews:(int64_t)a3 string:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView description](self, "description"));
    [v6 appendFormat:@"SELF: %@\n", v7];
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews"));
  id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v11);
        if (a3 >= 1)
        {
          int64_t v13 = a3;
          do
          {
            [v6 appendString:@"    "];
            --v13;
          }

          while (v13);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
        [v6 appendFormat:@"%@\n", v14];

        v15 = (void *)objc_claimAutoreleasedReturnValue([v12 subviews]);
        id v16 = [v15 count];

        if (v16) {
          [v12 _axPrintSubviews:a3 + 1 string:v6];
        }
        v11 = (char *)v11 + 1;
      }

      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }
}

- (id)_axSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  -[UIView _axPrintSubviews:string:](self, "_axPrintSubviews:string:", 0LL, v3);
  return v3;
}

- (unint64_t)scatMenuItemStyle
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_100157718);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = v3;
  if (v3) {
    id v5 = [v3 integerValue];
  }
  else {
    id v5 = 0LL;
  }

  return (unint64_t)v5;
}

- (void)setScatMenuItemStyle:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  objc_setAssociatedObject(self, &unk_100157718, v4, (void *)0x301);

  -[UIView didUpdateScatMenuItemStyle](self, "didUpdateScatMenuItemStyle");
}

- (id)keyboardContainer
{
  return 0LL;
}

- (id)scrollableElement
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
  id v2 = -[UIView scatFrame](self, "scatFrame");
  sub_10002ADFC((uint64_t)v2, v3, v4, v5, v6, v7);
  double Center = AX_CGRectGetCenter(v8);
  result.double y = v10;
  result.double x = Center;
  return result;
}

- (CGRect)scatFrame
{
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGPath)scatPath
{
  return 0LL;
}

- (unint64_t)scatTraits
{
  if (-[UIView scatShouldActivateDirectly](self, "scatShouldActivateDirectly")) {
    return kAXButtonTrait;
  }
  else {
    return 0LL;
  }
}

- (unint64_t)scatScanningBehaviorTraits
{
  return 15LL;
}

- (BOOL)scatIsValid
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return 1;
}

- (BOOL)scatShouldActivateDirectly
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_100157760);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  double v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (void)setScatShouldActivateDirectly:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_100157760, v4, (void *)0x303);
}

- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager
{
  return (SCATAuxiliaryElementManager *)objc_getAssociatedObject(self, &unk_100157761);
}

- (void)setScatAuxiliaryElementManager:(id)a3
{
}

- (int64_t)scatActivateBehavior
{
  return 1LL;
}

- (NSNumber)scatOverrideCursorTheme
{
  return 0LL;
}

- (BOOL)scatHidesGroupCursorWhenFocused
{
  return 0;
}

- (BOOL)scatShouldSuppressAudioOutput
{
  return 0;
}

- (BOOL)scatCanScrollInAtLeastOneDirection
{
  return 0;
}

- (id)scatSupportedGestures
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

- (BOOL)scatSupportsAction:(int)a3
{
  return a3 == 2010;
}

- (BOOL)scatPerformAction:(int)a3
{
  Class v4 = NSClassFromString(@"UISegment");
  if ((objc_opt_isKindOfClass(self, v4) & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10008E404;
    v11[3] = &unk_100122168;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
    int64_t v13 = self;
    id v6 = v12;
    AXPerformSafeBlock(v11);

    return 1;
  }

  objc_opt_class(&OBJC_CLASS___UIControl, v5);
  if ((objc_opt_isKindOfClass(self, v7) & 1) != 0)
  {
    -[UIView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64LL);
    return 1;
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
  char v9 = 1;
  _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v9,  @"Nothing available to handle activate action on element: %@. trace: %@");

  return 0;
}

- (BOOL)scatPerformAction:(int)a3 withValue:(id)a4
{
  return 0;
}

- (id)scatValue
{
  return -[UIView accessibilityValue](self, "accessibilityValue");
}

- (BOOL)scatIsMemberOfGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView parentGroup](self, "parentGroup"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)scatIsAuxiliaryElement
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView scatAuxiliaryElementManager](self, "scatAuxiliaryElementManager"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)scatIsOnScreen
{
  double MinX = CGRectGetMinX(v16);
  -[UIView frame](self, "frame");
  double MaxX = CGRectGetMaxX(v17);
  -[UIView frame](self, "frame");
  double MinY = CGRectGetMinY(v18);
  -[UIView frame](self, "frame");
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

- (BOOL)isHandUI
{
  return 0;
}

- (BOOL)isVisible
{
  return -[UIView _accessibilityIsVisibleByCompleteHitTest]( self,  "_accessibilityIsVisibleByCompleteHitTest");
}

- (AXElementGroup)parentGroup
{
  return (AXElementGroup *)__UIAccessibilityGetAssociatedNonRetainedObject(self, &unk_100157762);
}

- (void)setParentGroup:(id)a3
{
}

- (id)highestAncestorGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView parentGroup](self, "parentGroup"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 highestAncestorGroup]);

  return v3;
}

- (BOOL)scatPathIsInSceneReferenceSpace
{
  return 0;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)scatIsAXElement
{
  return 0;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 0;
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

- (BOOL)scatAssistiveTechFocused
{
  return 0;
}

- (NSArray)scatDrops
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)scatDrags
{
  return (NSArray *)&__NSArray0__struct;
}

@end