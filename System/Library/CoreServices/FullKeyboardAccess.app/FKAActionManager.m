@interface FKAActionManager
+ (void)_accessibilityPerformValidations:(id)a3;
- (AXElement)currentApplication;
- (AXElement)currentElement;
- (AXFocusManager)focusManager;
- (BKSAccelerometer)accelerometer;
- (BOOL)_element:(id)a3 handlesArrowKeyChord:(id)a4;
- (BOOL)_isInTextEditingModeForCurrentElement:(id)a3;
- (BOOL)_isTextEditingElement:(id)a3;
- (BOOL)handleEscapeKey;
- (BOOL)isInTextEditingMode;
- (BOOL)isPerformingGesture;
- (BOOL)shouldAvoidRepostingTextInput;
- (BOOL)shouldRepostForKeyChord:(id)a3;
- (CGPoint)_pointForGestures;
- (CGPoint)_pointForGesturesForElement:(id)a3;
- (CGRect)_referenceBoundsForDisplayId:(unsigned int)a3;
- (FKAActionManager)init;
- (FKAActionManagerDelegate)delegate;
- (id)gestureViewController;
- (int)pidForSuccessfulTypeaheadMovement;
- (void)_moveFocusInsideForward:(BOOL)a3;
- (void)_moveFocusWithHeading:(unint64_t)a3;
- (void)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4;
- (void)activateAccessibilityShortcut;
- (void)activateSOS;
- (void)activateSiri;
- (void)activateTypeahead;
- (void)armApplePay;
- (void)begin3DTouch;
- (void)beginPinchIn;
- (void)beginPinchOut;
- (void)beginRotateLeft;
- (void)beginRotateRight;
- (void)beginSwipeDown;
- (void)beginSwipeLeft;
- (void)beginSwipeRight;
- (void)beginSwipeUp;
- (void)beginTwoFingerSwipeDown;
- (void)beginTwoFingerSwipeLeft;
- (void)beginTwoFingerSwipeRight;
- (void)beginTwoFingerSwipeUp;
- (void)didObserveScreenChange;
- (void)didPerformTextInput;
- (void)didSuppressCommand:(id)a3;
- (void)end3DTouch;
- (void)endPinch;
- (void)endRotate;
- (void)endSwipe;
- (void)endTwoFingerSwipe;
- (void)focusOnSceneForTypeahead;
- (void)goHome;
- (void)goToFirstElement;
- (void)goToLastElement;
- (void)goToNextElementOfType:(unint64_t)a3;
- (void)goToPreviousElementOfType:(unint64_t)a3;
- (void)lift;
- (void)lockScreen;
- (void)moveDown;
- (void)moveFocusWithHeading:(unint64_t)a3 queryString:(id)a4;
- (void)moveInsideNext;
- (void)moveInsidePrevious;
- (void)moveLeft;
- (void)moveRight;
- (void)moveToNextElement;
- (void)moveToPreviousElement;
- (void)moveUp;
- (void)openContextualMenu;
- (void)performDefaultAction;
- (void)performEscape;
- (void)performSysdiagnose;
- (void)press;
- (void)rebootDevice;
- (void)rotateDevice;
- (void)setAccelerometer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusManager:(id)a3;
- (void)setIsPerformingGesture:(BOOL)a3;
- (void)setPidForSuccessfulTypeaheadMovement:(int)a3;
- (void)setShouldAvoidRepostingTextInput:(BOOL)a3;
- (void)showAccessibilityActions;
- (void)toggleAppLibrary;
- (void)toggleAppSwitcher;
- (void)toggleControlCenter;
- (void)toggleDock;
- (void)toggleGesturesMode;
- (void)toggleHelp;
- (void)toggleNotificationCenter;
- (void)togglePassthroughMode;
- (void)toggleQuickNote;
- (void)twoFingerPress;
- (void)willPerformStandardCommandWithIdentifier:(id)a3;
@end

@implementation FKAActionManager

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIScreen",  @"_enumerateScreensWithBlock:",  "v",  "@?",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIWindowSceneAccessibility",  @"_accessibilitySceneDidBecomeFocused",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIWindowSceneAccessibility",  @"_accessibilitySetFocusEnabledInApplication:",  "B",  "B",  0);
}

- (FKAActionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___FKAActionManager;
  v2 = -[FKAActionManager init](&v6, "init");
  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v3 warm];

    v4 = objc_opt_new(&OBJC_CLASS___AXFocusManager);
    -[FKAActionManager setFocusManager:](v2, "setFocusManager:", v4);
  }

  return v2;
}

- (void)setShouldAvoidRepostingTextInput:(BOOL)a3
{
  if (self->_shouldAvoidRepostingTextInput != a3)
  {
    if (a3
      && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate")),
          unsigned int v5 = [v4 actionManagerCanAvoidRepostingTextInput:self],
          v4,
          v5))
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
      [v6 didExitTextEditingModeForActionManager:self];

      BOOL v7 = 1;
    }

    else
    {
      BOOL v7 = 0;
    }

    self->_shouldAvoidRepostingTextInput = v7;
  }

- (void)moveToPreviousElement
{
}

- (void)moveToNextElement
{
}

- (void)willPerformStandardCommandWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  [v5 showDebugDisplay:v4];

  if (([v4 isEqualToString:AXSSKeyboardCommandIdentifierLockScreen] & 1) == 0)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
    [v6 wakeDeviceIfNeededForActionManager:self];
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___FKAActionManager;
  -[FKAActionManager willPerformStandardCommandWithIdentifier:](&v7, "willPerformStandardCommandWithIdentifier:", v4);
}

- (void)didSuppressCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = FKALogCommon(v4);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did suppress command: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  [v7 didSuppressCommandForActionManager:self];
}

- (void)goToNextElementOfType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v4 = FKALogCommon(self);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentApplication](self, "currentApplication"));
        objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleId]);
        *(_DWORD *)v14 = 138412290;
        *(void *)&v14[4] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Command: Move to next element in %@",  v14,  0xCu);
      }

      -[FKAActionManager _moveFocusWithHeading:byGroup:](self, "_moveFocusWithHeading:byGroup:", 16LL, 1LL);
      goto LABEL_15;
    case 1uLL:
      uint64_t v8 = FKALogCommon(self);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v14 = 0;
      v10 = "Command: Move to next interactive element";
      break;
    case 2uLL:
      uint64_t v11 = FKALogCommon(self);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v14 = 0;
      v10 = "Command: Move to next keyboard focusable element";
      break;
    case 3uLL:
      uint64_t v12 = FKALogCommon(self);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v14 = 0;
      v10 = "Command: Move to next section";
      break;
    case 4uLL:
      uint64_t v13 = FKALogCommon(self);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v14 = 0;
      v10 = "Command: Move to next container";
      break;
    default:
      goto LABEL_15;
  }

  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, v14, 2u);
LABEL_14:

LABEL_15:
  -[FKAActionManager setShouldAvoidRepostingTextInput:](self, "setShouldAvoidRepostingTextInput:", 1LL, *(void *)v14);
}

- (void)goToPreviousElementOfType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v4 = FKALogCommon(self);
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentApplication](self, "currentApplication"));
        objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleId]);
        *(_DWORD *)v14 = 138412290;
        *(void *)&v14[4] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Command: Move to previous element in %@",  v14,  0xCu);
      }

      -[FKAActionManager _moveFocusWithHeading:byGroup:](self, "_moveFocusWithHeading:byGroup:", 32LL, 1LL);
      goto LABEL_15;
    case 1uLL:
      uint64_t v8 = FKALogCommon(self);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v14 = 0;
      v10 = "Command: Move to previous interactive element";
      break;
    case 2uLL:
      uint64_t v11 = FKALogCommon(self);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v14 = 0;
      v10 = "Command: Move to previous keyboard focusable element";
      break;
    case 3uLL:
      uint64_t v12 = FKALogCommon(self);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v14 = 0;
      v10 = "Command: Move to previous section";
      break;
    case 4uLL:
      uint64_t v13 = FKALogCommon(self);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)v14 = 0;
      v10 = "Command: Move to previous container";
      break;
    default:
      goto LABEL_15;
  }

  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, v14, 2u);
LABEL_14:

LABEL_15:
  -[FKAActionManager setShouldAvoidRepostingTextInput:](self, "setShouldAvoidRepostingTextInput:", 1LL, *(void *)v14);
}

- (void)goToFirstElement
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: goToFirstElement", v5, 2u);
  }

  -[FKAActionManager _moveFocusWithHeading:](self, "_moveFocusWithHeading:", 256LL);
}

- (void)goToLastElement
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: goToLastElement", v5, 2u);
  }

  -[FKAActionManager _moveFocusWithHeading:](self, "_moveFocusWithHeading:", 512LL);
}

- (void)moveLeft
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: moveLeft", v5, 2u);
  }

  -[FKAActionManager _moveFocusWithHeading:](self, "_moveFocusWithHeading:", 4LL);
}

- (void)moveRight
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: moveRight", v5, 2u);
  }

  -[FKAActionManager _moveFocusWithHeading:](self, "_moveFocusWithHeading:", 8LL);
}

- (void)moveUp
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: moveUp", v5, 2u);
  }

  -[FKAActionManager _moveFocusWithHeading:](self, "_moveFocusWithHeading:", 1LL);
}

- (void)moveDown
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: moveDown", v5, 2u);
  }

  -[FKAActionManager _moveFocusWithHeading:](self, "_moveFocusWithHeading:", 2LL);
}

- (void)moveInsideNext
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: moveInsideNext", v5, 2u);
  }

  -[FKAActionManager _moveFocusInsideForward:](self, "_moveFocusInsideForward:", 1LL);
}

- (void)moveInsidePrevious
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: moveInsidePrevious", v5, 2u);
  }

  -[FKAActionManager _moveFocusInsideForward:](self, "_moveFocusInsideForward:", 0LL);
}

- (void)activateSiri
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: activateSiri", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 activateSiri];
}

- (void)toggleAppSwitcher
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: toggleAppSwitcher", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 toggleAppSwitcher];
}

- (void)toggleAppLibrary
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: toggleAppLibrary", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 toggleAppLibrary];
}

- (void)toggleQuickNote
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: toggleQuickNote", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 toggleQuickNote];
}

- (void)lockScreen
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: lockScreen", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 activateLockButton];
}

- (void)activateAccessibilityShortcut
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: activateAccessibilityShortcut", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 activateTripleClick];
}

- (void)armApplePay
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: armApplePay", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 armApplePay];
}

- (void)rebootDevice
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: rebootDevice", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 rebootDevice];
}

- (void)activateSOS
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: activateSOS", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 activateSOSMode];
}

- (void)toggleControlCenter
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: toggleControlCenter", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 toggleControlCenter];
}

- (void)activateTypeahead
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: activateTypeahead", v6, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  [v5 toggleTypeaheadForActionManager:self];
}

- (void)togglePassthroughMode
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: togglePassthroughMode", v6, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  [v5 togglePassthroughModeForActionManager:self];
}

- (void)toggleGesturesMode
{
  uint64_t v3 = FKALogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: toggleGesturesMode", v6, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  [v5 toggleGesturesModeForActionManager:self];
}

- (void)toggleDock
{
  uint64_t v2 = FKALogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Command: toggleDock", v5, 2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 toggleDock];
}

- (void)toggleNotificationCenter
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v3 toggleNotificationCenter];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  [v4 didToggleNotificationCenterForActionManager:self];
}

- (void)showAccessibilityActions
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  [v3 hideTypeaheadSynchronouslyForActionManager:self];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentElement](self, "currentElement"));
  [v5 actionManager:self showActionsForElement:v4];
}

- (void)goHome
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateHomeButton];
}

- (void)performEscape
{
}

- (BOOL)handleEscapeKey
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  unsigned __int8 v4 = [v3 dismissHelpForActionManager:self];

  if ((v4 & 1) != 0) {
    return 1;
  }
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentElement](self, "currentElement"));
  unsigned __int8 v7 = [v6 performAction:2013];

  return v7;
}

- (void)performSysdiagnose
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000082D8;
  v4[3] = &unk_100020730;
  v4[4] = self;
  [v3 performSysdiagnoseWithStatusUpdateHandler:v4];
}

- (void)rotateDevice
{
  uint64_t v3 = FKALogCommon(self);
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Command: rotateDevice", (uint8_t *)v14, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager accelerometer](self, "accelerometer"));
  if (!v5)
  {
    objc_super v6 = objc_opt_new(&OBJC_CLASS___BKSAccelerometer);
    -[FKAActionManager setAccelerometer:](self, "setAccelerometer:", v6);
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager accelerometer](self, "accelerometer"));
  unsigned int v8 = [v7 currentDeviceOrientation];

  if (v8 <= 6 && ((1 << v8) & 0x61) != 0)
  {
LABEL_7:
    uint64_t v10 = FKALogCommon(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001181C(v8, v11);
    }
  }

  else
  {
    uint64_t v12 = FKALogCommon(v9);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14[0] = 67109120;
      v14[1] = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Device orientation: %i", (uint8_t *)v14, 8u);
    }

    switch(v8)
    {
      case 1u:
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AXPISystemActionHelper sharedInstance]( &OBJC_CLASS___AXPISystemActionHelper,  "sharedInstance"));
        -[os_log_s rotateLeft](v11, "rotateLeft");
        break;
      case 2u:
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AXPISystemActionHelper sharedInstance]( &OBJC_CLASS___AXPISystemActionHelper,  "sharedInstance"));
        -[os_log_s rotateRight](v11, "rotateRight");
        break;
      case 3u:
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AXPISystemActionHelper sharedInstance]( &OBJC_CLASS___AXPISystemActionHelper,  "sharedInstance"));
        -[os_log_s rotateUpsideDown](v11, "rotateUpsideDown");
        break;
      case 4u:
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AXPISystemActionHelper sharedInstance]( &OBJC_CLASS___AXPISystemActionHelper,  "sharedInstance"));
        -[os_log_s rotatePortrait](v11, "rotatePortrait");
        break;
      default:
        goto LABEL_7;
    }
  }
}

- (void)performDefaultAction
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentElement](self, "currentElement"));
  [v3 press];
  -[FKAActionManager setShouldAvoidRepostingTextInput:](self, "setShouldAvoidRepostingTextInput:", 0LL);
}

- (void)toggleHelp
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  unsigned __int8 v4 = [v3 dismissHelpForActionManager:self];

  if ((v4 & 1) == 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
    [v5 showHelpForActionManager:self];
  }

- (void)openContextualMenu
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentElement](self, "currentElement"));
  [v2 showContextMenu];
}

- (void)press
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "pressAtPoint:numberOfFingers:", 1);
}

- (void)lift
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  unsigned int v4 = [v3 isPerformingGesture];

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
    [v5 lift];
  }

- (void)twoFingerPress
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "pressAtPoint:numberOfFingers:", 2);
}

- (void)beginSwipeLeft
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 0, 1);
}

- (void)beginSwipeRight
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 1, 1);
}

- (void)beginSwipeUp
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 2, 1);
}

- (void)beginSwipeDown
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 3, 1);
}

- (void)endSwipe
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  [v2 endIncrementalGesture];
}

- (void)beginTwoFingerSwipeLeft
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 0, 2);
}

- (void)beginTwoFingerSwipeRight
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 1, 2);
}

- (void)beginTwoFingerSwipeUp
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 2, 2);
}

- (void)beginTwoFingerSwipeDown
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginSwipeFromPoint:inDirection:numberOfFingers:", 3, 2);
}

- (void)endTwoFingerSwipe
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  [v2 endIncrementalGesture];
}

- (void)beginPinchOut
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginPinchOutFromPoint:");
}

- (void)beginPinchIn
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginPinchInFromPoint:");
}

- (void)endPinch
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  [v2 endIncrementalGesture];
}

- (void)beginRotateLeft
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginRotateLeftFromPoint:");
}

- (void)beginRotateRight
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "beginRotateRightFromPoint:");
}

- (void)endRotate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  [v2 endIncrementalGesture];
}

- (void)begin3DTouch
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  -[FKAActionManager _pointForGestures](self, "_pointForGestures");
  objc_msgSend(v3, "begin3DTouchAtPoint:");
}

- (void)end3DTouch
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager gestureViewController](self, "gestureViewController"));
  [v2 endIncrementalGesture];
}

- (id)gestureViewController
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 gestureViewController]);

  return v3;
}

- (AXElement)currentApplication
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager focusManager](self, "focusManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentApplication]);

  return (AXElement *)v3;
}

- (AXElement)currentElement
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentApplication](self, "currentApplication"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentFocusElement]);

  if ([v3 hasRemoteFocusSystem])
  {
    do
    {
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 elementForRemoteFocusSystem]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentFocusElement]);

      id v3 = v5;
    }

    while (([v5 hasRemoteFocusSystem] & 1) != 0);
  }

  else
  {
    id v5 = v3;
  }

  return (AXElement *)v5;
}

- (void)_moveFocusWithHeading:(unint64_t)a3
{
}

- (void)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager focusManager](self, "focusManager"));
  [v7 moveFocusWithHeading:a3 byGroup:v4];

  -[FKAActionManager setShouldAvoidRepostingTextInput:](self, "setShouldAvoidRepostingTextInput:", 1LL);
}

- (void)_moveFocusInsideForward:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager focusManager](self, "focusManager"));
  [v5 moveFocusInsideForward:v3];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager delegate](self, "delegate"));
  [v6 didMoveToInnerElementForActionManager:self];

  -[FKAActionManager setShouldAvoidRepostingTextInput:](self, "setShouldAvoidRepostingTextInput:", 1LL);
}

- (void)moveFocusWithHeading:(unint64_t)a3 queryString:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager focusManager](self, "focusManager"));
  [v7 moveFocusWithHeading:a3 queryString:v6];

  -[FKAActionManager setShouldAvoidRepostingTextInput:](self, "setShouldAvoidRepostingTextInput:", 1LL);
}

- (void)focusOnSceneForTypeahead
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[FKAActionManager focusManager](self, "focusManager"));
  [v2 focusOnSceneForTypeahead];
}

- (void)didPerformTextInput
{
}

- (void)didObserveScreenChange
{
}

- (BOOL)_isInTextEditingModeForCurrentElement:(id)a3
{
  BOOL v4 = -[FKAActionManager _isTextEditingElement:](self, "_isTextEditingElement:", a3);
  if (v4) {
    LOBYTE(v4) = !-[FKAActionManager shouldAvoidRepostingTextInput](self, "shouldAvoidRepostingTextInput");
  }
  return v4;
}

- (BOOL)isInTextEditingMode
{
  id v2 = self;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentElement](self, "currentElement"));
  LOBYTE(v2) = -[FKAActionManager _isInTextEditingModeForCurrentElement:]( v2,  "_isInTextEditingModeForCurrentElement:",  v3);

  return (char)v2;
}

- (BOOL)shouldRepostForKeyChord:(id)a3
{
  id v4 = a3;
  if ([v4 isTextInputChord])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentElement](self, "currentElement"));
    if (-[FKAActionManager _isInTextEditingModeForCurrentElement:](self, "_isInTextEditingModeForCurrentElement:", v5)
      && (![v4 isTextInputTabChord]
       || (id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]),
           unsigned __int8 v7 = [v6 BOOLWithAXAttribute:12007],
           v6,
           (v7 & 1) != 0)))
    {
      BOOL v8 = 1;
    }

    else if ([v4 isArrowKeyChord])
    {
      BOOL v8 = -[FKAActionManager _element:handlesArrowKeyChord:](self, "_element:handlesArrowKeyChord:", v5, v4);
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_element:(id)a3 handlesArrowKeyChord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 pid];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentApplication](self, "currentApplication"));
  if (v8 != [v9 pid])
  {
    unsigned __int8 v11 = 0;
LABEL_6:

    goto LABEL_7;
  }

  unsigned __int8 v10 = [v7 containsModifier];

  if ((v10 & 1) == 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uiElement]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayWithAXAttribute:12011]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 keys]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
    unsigned __int8 v11 = [v13 intersectsSet:v15];

    goto LABEL_6;
  }

  unsigned __int8 v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)_isTextEditingElement:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 traits];
  if (((kAXIsEditingTrait | kAXTextEntryTrait) & ~v4) != 0) {
    unsigned __int8 v5 = [v3 isComboBox];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (CGPoint)_pointForGestures
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[FKAActionManager currentElement](self, "currentElement"));
  -[FKAActionManager _pointForGesturesForElement:](self, "_pointForGesturesForElement:", v3);
  double v6 = v5;
  double v7 = v4;
  double y = CGPointZero.y;
  if (v5 == CGPointZero.x && v4 == y)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v3 elementForAttribute:3049]);
    unsigned __int8 v11 = (void *)v10;
    if (v10)
    {
      uint64_t v12 = FKALogCommon(v10);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Trying to perform a gesture using a focus ring ancestor.",  (uint8_t *)&v26,  2u);
      }

      -[FKAActionManager _pointForGesturesForElement:](self, "_pointForGesturesForElement:", v11);
      double v6 = v14;
      double v7 = v15;
    }
  }

  if (v6 == CGPointZero.x && v7 == y)
  {
    uint64_t Center = AX_CGRectGetCenter( -[FKAActionManager _referenceBoundsForDisplayId:]( self,  "_referenceBoundsForDisplayId:",  [v3 windowDisplayId]));
    double v6 = v18;
    double v7 = v19;
    uint64_t v20 = FKALogCommon(Center);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v28.x = v6;
      v28.double y = v7;
      v22 = NSStringFromCGPoint(v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      int v26 = 138412290;
      v27 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Falling back to gesture at center point of screen: %@",  (uint8_t *)&v26,  0xCu);
    }
  }

  double v24 = v6;
  double v25 = v7;
  result.double y = v25;
  result.x = v24;
  return result;
}

- (CGPoint)_pointForGesturesForElement:(id)a3
{
  id v4 = a3;
  double y = CGPointZero.y;
  [v4 visiblePoint];
  double v7 = v6;
  double v9 = v8;
  id v10 = [v4 windowContextId];
  id v11 = [v4 windowDisplayId];
  IsEmptdouble y = -[FKAActionManager _referenceBoundsForDisplayId:](self, "_referenceBoundsForDisplayId:", v11);
  CGFloat v66 = v14;
  CGFloat v68 = v13;
  CGFloat v64 = v16;
  CGFloat v65 = v15;
  BOOL v17 = v7 == -1.0 && v9 == -1.0;
  double x = CGPointZero.x;
  double v19 = y;
  if (!v17)
  {
    BOOL v20 = v7 == CGPointZero.x && v9 == y;
    double x = CGPointZero.x;
    double v19 = y;
    if (!v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
      objc_msgSend(v21, "convertPoint:fromContextId:displayId:", v10, v11, v7, v9);
      CGFloat v23 = v22;
      CGFloat v25 = v24;

      v88.origin.double y = v66;
      v88.origin.double x = v68;
      v88.size.CGFloat height = v64;
      v88.size.CGFloat width = v65;
      v85.double x = v23;
      v85.double y = v25;
      IsEmptdouble y = (id)CGRectContainsPoint(v88, v85);
      double x = CGPointZero.x;
      double v19 = y;
      if ((_DWORD)IsEmpty)
      {
        uint64_t v26 = FKALogCommon(IsEmpty);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v80.double x = v23;
          v80.double y = v25;
          CGPoint v28 = NSStringFromCGPoint(v80);
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          v81.double x = v7;
          v81.double y = v9;
          v30 = NSStringFromCGPoint(v81);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          *(_DWORD *)buf = 138413314;
          v71 = v29;
          __int16 v72 = 2112;
          id v73 = v31;
          __int16 v74 = 1024;
          int v75 = (int)v10;
          __int16 v76 = 1024;
          int v77 = (int)v11;
          __int16 v78 = 2112;
          id v79 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Gesture at visible point: %@, raw visible point: %@, context ID: %u, display ID: %u, element: %@",  buf,  0x2Cu);
        }

        double x = v23;
        double v19 = v25;
      }
    }
  }

  if (x == CGPointZero.x && v19 == y)
  {
    IsEmptdouble y = [v4 centerPoint];
    double v35 = v33;
    double v36 = v34;
    if ((v33 != -1.0 || v34 != -1.0) && (v33 != CGPointZero.x || v34 != y))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
      objc_msgSend(v38, "convertPoint:fromContextId:displayId:", v10, v11, v35, v36);
      CGFloat v40 = v39;
      CGFloat v42 = v41;

      v89.origin.double y = v66;
      v89.origin.double x = v68;
      v89.size.CGFloat height = v64;
      v89.size.CGFloat width = v65;
      v86.double x = v40;
      v86.double y = v42;
      IsEmptdouble y = (id)CGRectContainsPoint(v89, v86);
      if ((_DWORD)IsEmpty)
      {
        uint64_t v43 = FKALogCommon(IsEmpty);
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v82.double x = v40;
          v82.double y = v42;
          v45 = NSStringFromCGPoint(v82);
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          v83.double x = v35;
          v83.double y = v36;
          v47 = NSStringFromCGPoint(v83);
          v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          *(_DWORD *)buf = 138413314;
          v71 = v46;
          __int16 v72 = 2112;
          id v73 = v48;
          __int16 v74 = 1024;
          int v75 = (int)v10;
          __int16 v76 = 1024;
          int v77 = (int)v11;
          __int16 v78 = 2112;
          id v79 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "Gesture at center point: %@, raw center point: %@, context ID: %u, display ID: %u, element: %@",  buf,  0x2Cu);
        }

        double x = v40;
        double v19 = v42;
      }
    }
  }

  if (x == CGPointZero.x && v19 == y)
  {
    [v4 frame];
    CGFloat v50 = v90.origin.x;
    CGFloat v51 = v90.origin.y;
    CGFloat width = v90.size.width;
    CGFloat height = v90.size.height;
    IsEmptdouble y = (id)CGRectIsEmpty(v90);
    if ((IsEmpty & 1) == 0)
    {
      v87.double x = AX_CGRectGetCenter(IsEmpty);
      v87.double y = v54;
      v91.origin.double y = v66;
      v91.origin.double x = v68;
      v91.size.CGFloat height = v64;
      v91.size.CGFloat width = v65;
      CGFloat v67 = v87.y;
      CGFloat v69 = v87.x;
      IsEmptdouble y = (id)CGRectContainsPoint(v91, v87);
      if ((_DWORD)IsEmpty)
      {
        uint64_t v55 = FKALogCommon(IsEmpty);
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v92.origin.double x = v50;
          v92.origin.double y = v51;
          v92.size.CGFloat width = width;
          v92.size.CGFloat height = height;
          v57 = NSStringFromCGRect(v92);
          v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
          *(_DWORD *)buf = 138412546;
          v71 = v58;
          __int16 v72 = 2112;
          id v73 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_INFO,  "Gesture at midpoint of frame: %@, element: %@",  buf,  0x16u);
        }

        double v19 = v67;
        double x = v69;
      }
    }
  }

  if (x == CGPointZero.x && v19 == y)
  {
    uint64_t v60 = FKALogCommon(IsEmpty);
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_100011890((uint64_t)v4, v61);
    }
  }

  double v62 = x;
  double v63 = v19;
  result.double y = v63;
  result.double x = v62;
  return result;
}

- (CGRect)_referenceBoundsForDisplayId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_100029640 != -1) {
    dispatch_once(&qword_100029640, &stru_100020770);
  }
  id v4 = (void *)qword_100029638;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (v6)
  {
    double v7 = (void *)qword_100029638;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    double v9 = (NSString *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
    CGRect v31 = CGRectFromString(v9);
    CGFloat x = v31.origin.x;
    CGFloat y = v31.origin.y;
    CGFloat width = v31.size.width;
    CGFloat height = v31.size.height;
  }

  else
  {
    uint64_t v25 = 0LL;
    uint64_t v26 = (CGRect *)&v25;
    uint64_t v27 = 0x4010000000LL;
    CGPoint v28 = &unk_100017C0E;
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v30 = size;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000098FC;
    v23[3] = &unk_1000207C0;
    int v24 = v3;
    v23[4] = &v25;
    AXPerformSafeBlock(v23);
    double v15 = NSStringFromCGRect(v26[1]);
    double v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = (void *)qword_100029638;
    double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    [v17 setObject:v16 forKeyedSubscript:v18];

    CGFloat x = v26[1].origin.x;
    CGFloat y = v26[1].origin.y;
    CGFloat width = v26[1].size.width;
    CGFloat height = v26[1].size.height;
    _Block_object_dispose(&v25, 8);
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (FKAActionManagerDelegate)delegate
{
  return (FKAActionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (void)setAccelerometer:(id)a3
{
}

- (BOOL)isPerformingGesture
{
  return self->_isPerformingGesture;
}

- (void)setIsPerformingGesture:(BOOL)a3
{
  self->_isPerformingGesture = a3;
}

- (BOOL)shouldAvoidRepostingTextInput
{
  return self->_shouldAvoidRepostingTextInput;
}

- (AXFocusManager)focusManager
{
  return self->_focusManager;
}

- (void)setFocusManager:(id)a3
{
}

- (int)pidForSuccessfulTypeaheadMovement
{
  return self->_pidForSuccessfulTypeaheadMovement;
}

- (void)setPidForSuccessfulTypeaheadMovement:(int)a3
{
  self->_pidForSuccessfulTypeaheadMovement = a3;
}

- (void).cxx_destruct
{
}

@end