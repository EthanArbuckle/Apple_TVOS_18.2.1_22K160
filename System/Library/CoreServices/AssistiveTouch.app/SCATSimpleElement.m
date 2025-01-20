@interface SCATSimpleElement
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
- (id)highestAncestorGroup;
- (id)keyboardContainer;
- (id)scatSupportedGestures;
- (id)scatValue;
- (id)scrollableElement;
- (int)scatPid;
- (int64_t)scatActivateBehavior;
- (unint64_t)scatScanningBehaviorTraits;
- (unint64_t)scatTraits;
- (void)setParentGroup:(id)a3;
@end

@implementation SCATSimpleElement

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
  id v2 = -[SCATSimpleElement scatFrame](self, "scatFrame");
  sub_10002ADFC((uint64_t)v2, v3, v4, v5, v6, v7);
  double Center = AX_CGRectGetCenter(v8);
  result.double y = v10;
  result.double x = Center;
  return result;
}

- (BOOL)scatPathIsInSceneReferenceSpace
{
  return 0;
}

- (CGRect)scatFrame
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPath)scatPath
{
  return 0LL;
}

- (unint64_t)scatTraits
{
  return kAXButtonTrait;
}

- (unint64_t)scatScanningBehaviorTraits
{
  return 15LL;
}

- (BOOL)scatIsValid
{
  return 1;
}

- (BOOL)scatIsAXElement
{
  return 0;
}

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return 1;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 0;
}

- (BOOL)scatShouldActivateDirectly
{
  return 1;
}

- (int64_t)scatActivateBehavior
{
  return 1LL;
}

- (id)scatValue
{
  return -[SCATSimpleElement accessibilityValue](self, "accessibilityValue");
}

- (BOOL)scatShouldSuppressAudioOutput
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

- (id)scrollableElement
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

- (id)scatSupportedGestures
{
  return 0LL;
}

- (BOOL)scatCanScrollInAtLeastOneDirection
{
  return 0;
}

- (BOOL)scatSupportsAction:(int)a3
{
  return a3 == 2010;
}

- (BOOL)scatPerformAction:(int)a3
{
  return 0;
}

- (BOOL)scatPerformAction:(int)a3 withValue:(id)a4
{
  return 0;
}

- (BOOL)scatAssistiveTechFocused
{
  return 0;
}

- (BOOL)scatIsMemberOfGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElement parentGroup](self, "parentGroup"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)scatIsAuxiliaryElement
{
  return 0;
}

- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager
{
  return 0LL;
}

- (BOOL)scatIsOnScreen
{
  double MinX = CGRectGetMinX(v16);
  -[SCATSimpleElement frame](self, "frame");
  double MaxX = CGRectGetMaxX(v17);
  -[SCATSimpleElement frame](self, "frame");
  double MinY = CGRectGetMinY(v18);
  -[SCATSimpleElement frame](self, "frame");
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

- (id)highestAncestorGroup
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSimpleElement parentGroup](self, "parentGroup"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 highestAncestorGroup]);

  return v3;
}

- (BOOL)isGroup
{
  return 0;
}

- (id)keyboardContainer
{
  return 0LL;
}

- (BOOL)scatUpdatesMenu
{
  return self->scatUpdatesMenu;
}

- (BOOL)isHandUI
{
  return self->isHandUI;
}

- (BOOL)isVisible
{
  return self->isVisible;
}

- (AXElementGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(id)a3
{
  self->_parentGroup = (AXElementGroup *)a3;
}

@end