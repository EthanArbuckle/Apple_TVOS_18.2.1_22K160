@interface SCATMenu
- (AXElement)keyboardApplication;
- (AXElement)textElement;
- (AXUIElement)fallbackScrollDownAncestor;
- (AXUIElement)fallbackScrollLeftAncestor;
- (AXUIElement)fallbackScrollRightAncestor;
- (AXUIElement)fallbackScrollUpAncestor;
- (BOOL)_canPopSheet;
- (BOOL)_isCurrentSheetValidForElement:(id)a3;
- (BOOL)_viewIsSuitableScannerElement:(id)a3;
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)allowsDwellSelection;
- (BOOL)canBeActiveElementManager;
- (BOOL)containsGestureSheet;
- (BOOL)containsSheet:(Class)a3;
- (BOOL)didActivateElement;
- (BOOL)isGroupingEnabled;
- (BOOL)isTransitioning;
- (BOOL)isVisible;
- (BOOL)isWaitingToBePresented;
- (BOOL)popSheet;
- (BOOL)shouldHideMenuCursor;
- (BOOL)shouldKeepScannerAwake;
- (BOOL)shouldNotResetPointPickerRefinement;
- (BOOL)wasPresentedWithTip;
- (BOOL)willScanFirstElementAfterPresentation;
- (NSHashTable)menuObservers;
- (NSMutableArray)menuSheetStack;
- (NSValue)screenPoint;
- (SCATAggregateElementProvider)elementProvider;
- (SCATElement)element;
- (SCATMenu)initWithDelegate:(id)a3;
- (SCATMenuDelegate)delegate;
- (SCATMenuVisualProvider)menuVisualProvider;
- (SCATModernMenuGesturesSheet)gestureSheet;
- (SCATModernMenuSheet)currentSheet;
- (SCATModernMenuSheet)rootSheet;
- (SCATPointPicker)pointPicker;
- (id)_elementProviderForSheet:(id)a3;
- (id)_elementWithRestorationInfo:(id)a3 options:(int *)a4;
- (id)_restorationInfoForElement:(id)a3;
- (id)_siblingOfElement:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5 options:(int *)a6;
- (id)arrayByShiftingItemsInArray:(id)a3 leftByNumberOfPositions:(unint64_t)a4;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)exitActionElement;
- (id)firstElementWithOptions:(int *)a3;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (id)parentSheetOfSheet:(id)a3;
- (id)updateAfterFetchWithCurrentlyScannedElement:(id)a3 options:(int *)a4;
- (int64_t)dockPosition;
- (int64_t)popoverPosition;
- (int64_t)tipObject;
- (int64_t)tipObjectForPresentingSheet:(id)a3;
- (unsigned)currentDisplayID;
- (void)_cleanMenuStacks;
- (void)_flushScannableMenuElements;
- (void)_handleAdjustValue:(BOOL)a3;
- (void)_initializeMenuVisualProvider;
- (void)_notifyMenuObserversWithSelector:(SEL)a3;
- (void)_popToRootLevelSheet;
- (void)_prepareMenuForScanning;
- (void)_prepareMenuForScanningIfNeeded;
- (void)_presentWithElement:(id)a3 pointPicker:(id)a4 useMenuTip:(BOOL)a5 sheetToShow:(id)a6;
- (void)_slideToPositionWithMode:(unint64_t)a3 positionIndex:(int64_t)a4;
- (void)_updateFallbackScrollAncestorsForElement:(id)a3;
- (void)_updateForGeometryChange;
- (void)_updateOptionsIfNeeded:(int *)a3 withResultElement:(id)a4;
- (void)_updateWithElement:(id)a3 forceUpdate:(BOOL)a4;
- (void)alertDidAppear:(id)a3;
- (void)appTransitionDidOccur:(id)a3;
- (void)closeCurrentScanningContext;
- (void)decrementValue;
- (void)didPressScreenChangingButton;
- (void)didTransitionToSheet:(id)a3;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)handleMenuWasActivatedByScanner;
- (void)hideWithCompletion:(id)a3;
- (void)incrementValue;
- (void)menuTipObjectDidChange;
- (void)orientationDidChange:(id)a3;
- (void)presentAutoscrollMenu;
- (void)presentWithElement:(id)a3;
- (void)presentWithPointPicker:(id)a3;
- (void)presentWithRootLevelSheet:(id)a3 useCurrentElementAndPoint:(BOOL)a4;
- (void)pushSheet:(id)a3;
- (void)registerMenuObserver:(id)a3;
- (void)reloadFromCurrentSheet;
- (void)setCurrentSheet:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidActivateElement:(BOOL)a3;
- (void)setDockPosition:(int64_t)a3;
- (void)setElement:(id)a3;
- (void)setElementProvider:(id)a3;
- (void)setFallbackScrollDownAncestor:(id)a3;
- (void)setFallbackScrollLeftAncestor:(id)a3;
- (void)setFallbackScrollRightAncestor:(id)a3;
- (void)setFallbackScrollUpAncestor:(id)a3;
- (void)setIsWaitingToBePresented:(BOOL)a3;
- (void)setMenuObservers:(id)a3;
- (void)setMenuSheetStack:(id)a3;
- (void)setMenuVisualProvider:(id)a3;
- (void)setPointPicker:(id)a3;
- (void)setPopoverPosition:(int64_t)a3;
- (void)setScreenPoint:(id)a3;
- (void)setShouldNotResetPointPickerRefinement:(BOOL)a3;
- (void)setTextElement:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setWasPresentedWithTip:(BOOL)a3;
- (void)setWillScanFirstElementAfterPresentation:(BOOL)a3;
- (void)slideDockToPosition:(int64_t)a3;
- (void)slidePopoverToPosition:(int64_t)a3;
- (void)transitionToMenuSheet:(id)a3;
- (void)unregisterAllMenuObservers;
- (void)unregisterMenuObserver:(id)a3;
- (void)updateMenuVisualsForUpdatedElementVisuals;
- (void)willTransitionToSheet:(id)a3;
@end

@implementation SCATMenu

- (SCATMenu)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SCATMenu;
  v5 = -[SCATMenu init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[SCATMenu setDelegate:](v5, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    -[SCATMenu setMenuObservers:](v6, "setMenuObservers:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[SCATMenu setMenuSheetStack:](v6, "setMenuSheetStack:", v8);

    -[SCATMenu _initializeMenuVisualProvider](v6, "_initializeMenuVisualProvider");
  }

  return v6;
}

- (void)_initializeMenuVisualProvider
{
  v3 = -[SCATModernMenuViewController initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuViewController),  "initWithMenu:",  self);
  -[SCATMenu setMenuVisualProvider:](self, "setMenuVisualProvider:", v3);
}

- (void)setElement:(id)a3
{
  v5 = (SCATElement *)a3;
  if (self->_element != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_element, a3);
    if ((-[SCATElement scatIsKeyboardKey](v11, "scatIsKeyboardKey") & 1) != 0
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElement keyboardContainer](v11, "keyboardContainer")),
          v6,
          v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
      v8 = (SCATElement *)objc_claimAutoreleasedReturnValue([v7 firstResponder]);
    }

    else if (-[SCATElement scatIsAXElement](v11, "scatIsAXElement"))
    {
      v8 = v11;
    }

    else
    {
      v8 = 0LL;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElement textOperations](v8, "textOperations"));
    unint64_t v10 = (unint64_t)-[SCATElement traits](v8, "traits");
    if ((kAXIsEditingTrait & v10) == 0
      && ([v9 containsObject:kAXTextOperationActionCopy] & 1) == 0
      && ([v9 containsObject:kAXTextOperationActionPaste] & 1) == 0
      && ([v9 containsObject:kAXTextOperationActionCut] & 1) == 0
      && ([v9 containsObject:kAXTextOperationActionSelectAll] & 1) == 0)
    {

      v8 = 0LL;
    }

    -[SCATMenu setTextElement:](self, "setTextElement:", v8);

    v5 = v11;
  }
}

- (unsigned)currentDisplayID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));

  if (!v3
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element")),
        unsigned int v5 = [v4 scatDisplayId],
        v4,
        !v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu pointPicker](self, "pointPicker"));
    unsigned int v5 = [v6 currentDisplayID];
  }

  if (v5 <= 1) {
    return 1;
  }
  else {
    return v5;
  }
}

- (AXElement)keyboardApplication
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu textElement](self, "textElement"));
  if (!v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    v2 = (void *)objc_claimAutoreleasedReturnValue([v3 lastKeyboardElement]);
  }

  else {
    id v4 = 0LL;
  }

  return (AXElement *)v4;
}

- (BOOL)isVisible
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  unsigned __int8 v3 = [v2 isVisible];

  return v3;
}

- (BOOL)isGroupingEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (int64_t)tipObject
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  char v4 = objc_opt_respondsToSelector(v3, "tipObject");

  if ((v4 & 1) == 0) {
    return 0LL;
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  id v6 = [v5 tipObject];

  return (int64_t)v6;
}

- (BOOL)shouldHideMenuCursor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
  BOOL v3 = [v2 preferredTipObject] == (id)1
    || [v2 presentationMode] == (id)1 && objc_msgSend(v2, "preferredTipObject") != (id)2;

  return v3;
}

- (int64_t)tipObjectForPresentingSheet:(id)a3
{
  id v4 = a3;
  if (!-[SCATMenu wasPresentedWithTip](self, "wasPresentedWithTip")
    || [v4 presentationMode]
    || -[SCATMenu popoverPosition](self, "popoverPosition"))
  {
    int64_t v5 = 0LL;
  }

  else
  {
    uint64_t v7 = (uint64_t)[v4 preferredTipObject];
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu rootSheet](self, "rootSheet"));
      uint64_t v7 = (uint64_t)[v8 preferredTipObject];
      if (!v7)
      {
        _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Menu was presented with a tip, but its root sheet had no tip.  This may be an error.  Root sheet: %@");
        uint64_t v7 = 2LL;
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));

    if (v9) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v7 == 2;
    }
    if (v10) {
      int64_t v5 = 1LL;
    }
    else {
      int64_t v5 = v7;
    }
  }

  return v5;
}

- (void)presentWithElement:(id)a3
{
}

- (void)presentWithPointPicker:(id)a3
{
  id v12 = a3;
  if (!_AXSInUnitTestMode() && ([v12 hasPickedPoint] & 1) == 0) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMenu.m",  222LL,  "-[SCATMenu presentWithPointPicker:]",  @"Showing the menu with a pointPicker, but picker has no point saved");
  }
  [v12 pickedPointInDeviceCoordinates];
  double v5 = v4;
  double v7 = v6;
  id v8 = [v12 currentDisplayID];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "elementAtPoint:displayID:", v8, v5, v7));

  -[SCATMenu setPointPicker:](self, "setPointPicker:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", v5, v7));
  -[SCATMenu setScreenPoint:](self, "setScreenPoint:", v11);

  -[SCATMenu _presentWithElement:pointPicker:useMenuTip:sheetToShow:]( self,  "_presentWithElement:pointPicker:useMenuTip:sheetToShow:",  v10,  v12,  1LL,  0LL);
}

- (void)presentWithRootLevelSheet:(id)a3 useCurrentElementAndPoint:(BOOL)a4
{
  id v9 = a3;
  if (a4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu pointPicker](self, "pointPicker"));
    -[SCATMenu _presentWithElement:pointPicker:useMenuTip:sheetToShow:]( self,  "_presentWithElement:pointPicker:useMenuTip:sheetToShow:",  v6,  v7,  0LL,  v9);

    id v8 = (void *)v6;
  }

  else
  {
    -[SCATMenu _presentWithElement:pointPicker:useMenuTip:sheetToShow:]( self,  "_presentWithElement:pointPicker:useMenuTip:sheetToShow:",  0LL,  0LL,  0LL,  v9);
    id v8 = v9;
  }
}

- (void)presentAutoscrollMenu
{
  BOOL v3 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuAutoscrollSheet),  "initWithMenu:",  self);
  -[SCATMenu presentWithRootLevelSheet:useCurrentElementAndPoint:]( self,  "presentWithRootLevelSheet:useCurrentElementAndPoint:",  v3,  1LL);
}

- (void)_presentWithElement:(id)a3 pointPicker:(id)a4 useMenuTip:(BOOL)a5 sheetToShow:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  v11 = (SCATModernMenuActionsSheet *)a6;
  id v12 = a3;
  -[SCATMenu setElement:](self, "setElement:", v12);
  -[SCATMenu setPointPicker:](self, "setPointPicker:", v10);
  -[SCATMenu setWillScanFirstElementAfterPresentation:](self, "setWillScanFirstElementAfterPresentation:", 1LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu screenPoint](self, "screenPoint"));
  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));

    if (!v14) {
      goto LABEL_5;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));
    [v13 scatScreenPointForOperations];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:"));
    -[SCATMenu setScreenPoint:](self, "setScreenPoint:", v15);
  }

LABEL_5:
  -[SCATMenu _notifyMenuObserversWithSelector:](self, "_notifyMenuObserversWithSelector:", "menuWillAppear:");
  -[SCATMenu setDockPosition:](self, "setDockPosition:", 0LL);
  -[SCATMenu setPopoverPosition:](self, "setPopoverPosition:", 0LL);
  if (v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));
    if (v16)
    {
      -[SCATMenu setWasPresentedWithTip:](self, "setWasPresentedWithTip:", 1LL);
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu screenPoint](self, "screenPoint"));
      -[SCATMenu setWasPresentedWithTip:](self, "setWasPresentedWithTip:", v17 != 0LL);
    }

    if (!v11) {
      goto LABEL_12;
    }
  }

  else
  {
    -[SCATMenu setWasPresentedWithTip:](self, "setWasPresentedWithTip:", 0LL);
    if (!v11) {
LABEL_12:
    }
      v11 = -[SCATModernMenuSheet initWithMenu:]( objc_alloc(&OBJC_CLASS___SCATModernMenuActionsSheet),  "initWithMenu:",  self);
  }

  -[SCATMenu _updateFallbackScrollAncestorsForElement:](self, "_updateFallbackScrollAncestorsForElement:", v12);
  -[SCATMenu setCurrentSheet:](self, "setCurrentSheet:", 0LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v11));
  -[SCATMenu setMenuSheetStack:](self, "setMenuSheetStack:", v18);

  -[SCATMenu transitionToMenuSheet:](self, "transitionToMenuSheet:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  [v19 willBePresentedWithElement:v12 pointPicker:v10 sheetToShow:v11];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10006A010;
  v20[3] = &unk_100121D18;
  v20[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v20);
  -[SCATMenu setDidActivateElement:](self, "setDidActivateElement:", 0LL);
}

- (void)hideWithCompletion:(id)a3
{
  id v10 = (void (**)(void))a3;
  if (-[SCATMenu isVisible](self, "isVisible"))
  {
    -[SCATMenu _notifyMenuObserversWithSelector:](self, "_notifyMenuObserversWithSelector:", "menuWillDisappear:");
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
    [v4 menuWillDisappear];

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
    [v5 hide];

    -[SCATMenu _flushScannableMenuElements](self, "_flushScannableMenuElements");
    if (v10) {
      v10[2](v10);
    }
    if (!-[SCATMenu shouldNotResetPointPickerRefinement](self, "shouldNotResetPointPickerRefinement"))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu pointPicker](self, "pointPicker"));
      [v6 resetRefinedSelectedPoint];
    }

    -[SCATMenu setShouldNotResetPointPickerRefinement:](self, "setShouldNotResetPointPickerRefinement:", 0LL);
    -[SCATMenu setScreenPoint:](self, "setScreenPoint:", 0LL);
    -[SCATMenu setPointPicker:](self, "setPointPicker:", 0LL);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
    char v8 = objc_opt_respondsToSelector(v7, "setTipObject:");

    if ((v8 & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
      [v9 setTipObject:0];
    }

    -[SCATMenu _cleanMenuStacks](self, "_cleanMenuStacks");
    -[SCATMenu _notifyMenuObserversWithSelector:](self, "_notifyMenuObserversWithSelector:", "menuDidDisappear:");
  }
}

- (BOOL)_isCurrentSheetValidForElement:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
  *(void *)&double v7 = objc_opt_class(v5, v6).n128_u64[0];
  unsigned __int8 v9 = objc_msgSend(v8, "isValidForElement:", v4, v7);

  return v9;
}

- (id)updateAfterFetchWithCurrentlyScannedElement:(id)a3 options:(int *)a4
{
  id v6 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10006A348;
    v16[3] = &unk_100123C88;
    v16[4] = self;
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 elementsForMatchingBlock:v16]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

    if (!v10)
    {
      if (-[SCATMenu isGroupingEnabled](self, "isGroupingEnabled"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v8 firstScannerGroupable]);
        else {
          id v12 = v11;
        }
        id v10 = v12;

        if (!v6) {
          goto LABEL_13;
        }
        goto LABEL_9;
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 firstScannerElement]);
    }

    if (!v6)
    {
LABEL_13:
      -[SCATMenu _updateWithElement:forceUpdate:](self, "_updateWithElement:forceUpdate:", v10, 0LL);
      goto LABEL_14;
    }

- (void)_updateWithElement:(id)a3 forceUpdate:(BOOL)a4
{
  id v6 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));
  unsigned int v8 = [v7 isEqual:v6];

  if (a4 || !v8)
  {
    -[SCATMenu setElement:](self, "setElement:", v6);
    if ((v8 & 1) == 0)
    {
      if (-[SCATMenu _isCurrentSheetValidForElement:](self, "_isCurrentSheetValidForElement:", v6))
      {
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuSheetStack](self, "menuSheetStack", 0LL));
        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            v13 = 0LL;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) reload];
              v13 = (char *)v13 + 1;
            }

            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }

          while (v11);
        }
      }

      else
      {
        -[SCATMenu _popToRootLevelSheet](self, "_popToRootLevelSheet");
      }
    }

    -[SCATMenu reloadFromCurrentSheet](self, "reloadFromCurrentSheet");
  }
}

- (void)_updateFallbackScrollAncestorsForElement:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](self, "delegate"));
  unsigned __int8 v5 = [v4 shouldShowAppWideScrollActionsInMenu:self];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v11 scrollableElement]);
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementWithAXElement:cache:]( AXUIElement,  "uiElementWithAXElement:cache:",  [v6 scrollAncestorForScrollAction:2006],  0));
    -[SCATMenu setFallbackScrollDownAncestor:](self, "setFallbackScrollDownAncestor:", v7);

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementWithAXElement:cache:]( AXUIElement,  "uiElementWithAXElement:cache:",  [v6 scrollAncestorForScrollAction:2007],  0));
    -[SCATMenu setFallbackScrollUpAncestor:](self, "setFallbackScrollUpAncestor:", v8);

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementWithAXElement:cache:]( AXUIElement,  "uiElementWithAXElement:cache:",  [v6 scrollAncestorForScrollAction:2008],  0));
    -[SCATMenu setFallbackScrollLeftAncestor:](self, "setFallbackScrollLeftAncestor:", v9);

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiElementWithAXElement:cache:]( AXUIElement,  "uiElementWithAXElement:cache:",  [v6 scrollAncestorForScrollAction:2009],  0));
    -[SCATMenu setFallbackScrollRightAncestor:](self, "setFallbackScrollRightAncestor:", v10);
  }
}

- (id)_restorationInfoForElement:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));

  if (v6 == v4)
  {
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsMenuElement"];
  }

  else
  {
    if ([v4 isGroup])
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu elementProvider](self, "elementProvider"));
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 elementProviders]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
      objc_opt_class(&OBJC_CLASS___SCATStaticElementProvider, v11);
      char isKindOfClass = objc_opt_isKindOfClass(v10, v12);

      if ((isKindOfClass & 1) != 0)
      {
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu elementProvider](self, "elementProvider"));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 elementProviders]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);

        id v17 = [v16 indexOfObject:v4];
        if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v17));
          v19 = @"MenuRowIndex";
LABEL_9:
          [v5 setObject:v18 forKeyedSubscript:v19];

LABEL_12:
          goto LABEL_13;
        }
      }

      else
      {
        __int128 v16 = 0LL;
      }

      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMenu.m",  471LL,  "-[SCATMenu _restorationInfoForElement:]",  @"Had an element group %@ that was not one of the menu rows %@.  This will need to be handled.");
      goto LABEL_12;
    }

    objc_opt_class(&OBJC_CLASS___SCATMenuItemElement, v7);
    if ((objc_opt_isKindOfClass(v4, v20) & 1) != 0)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 menuItem]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
      v19 = @"MenuItemIdentifier";
      goto LABEL_9;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
    unsigned __int8 v23 = [v22 isElementTopLevelInMenu:v4];

    if ((v23 & 1) == 0) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMenu.m",  483LL,  "-[SCATMenu _restorationInfoForElement:]",  @"Tried to restore unexpected element for menu: %@");
    }
  }

- (id)_elementWithRestorationInfo:(id)a3 options:(int *)a4
{
  id v6 = a3;
  -[SCATMenu _prepareMenuForScanningIfNeeded](self, "_prepareMenuForScanningIfNeeded");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"IsMenuElement"]);
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"MenuRowIndex"]);

    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu elementProvider](self, "elementProvider"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 elementProviders]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
      objc_opt_class(&OBJC_CLASS___SCATStaticElementProvider, v14);
      char isKindOfClass = objc_opt_isKindOfClass(v13, v15);

      if ((isKindOfClass & 1) != 0)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu elementProvider](self, "elementProvider"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 elementProviders]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
      }

      else
      {
        v19 = 0LL;
      }

      id v30 = [v19 count];
      v31 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"MenuRowIndex"]);
      id v32 = [v31 unsignedIntegerValue];

      if (v32 >= v30)
      {
        _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"We tried to restore a row %lu that was not in our list of menu rows: %@");
        unsigned __int8 v9 = 0LL;
      }

      else
      {
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v32]);
      }
    }

    else
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"MenuItemIdentifier"]);

      if (v20)
      {
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 menuItems]);

        id v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v23)
        {
          v34 = self;
          v35 = a4;
          uint64_t v24 = *(void *)v37;
          while (2)
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v22);
              }
              v26 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
              v28 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"MenuItemIdentifier"]);
              unsigned int v29 = [v27 isEqualToString:v28];

              if (v29)
              {
                id v23 = v26;
                goto LABEL_22;
              }
            }

            id v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
            if (v23) {
              continue;
            }
            break;
          }

- (void)transitionToMenuSheet:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
  -[SCATMenu setCurrentSheet:](self, "setCurrentSheet:", v4);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  [v5 transitionToMenuSheet:v4 fromSheet:v6];
}

- (SCATModernMenuSheet)rootSheet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuSheetStack](self, "menuSheetStack"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return (SCATModernMenuSheet *)v3;
}

- (void)pushSheet:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));

    id v4 = v7;
    if (v5 != v7)
    {
      -[SCATMenu transitionToMenuSheet:](self, "transitionToMenuSheet:", v7);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuSheetStack](self, "menuSheetStack"));
      [v6 addObject:v7];

      id v4 = v7;
    }
  }
}

- (BOOL)popSheet
{
  BOOL v3 = -[SCATMenu _canPopSheet](self, "_canPopSheet");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu parentSheetOfSheet:](self, "parentSheetOfSheet:", v4));
    -[SCATMenu transitionToMenuSheet:](self, "transitionToMenuSheet:", v5);
    [v4 setShouldIncludeBackItem:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuSheetStack](self, "menuSheetStack"));
    [v6 removeObject:v4];
  }

  return v3;
}

- (void)_popToRootLevelSheet
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu menuSheetStack](self, "menuSheetStack"));
  if ([v6 count])
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);
    if (([v4 isEqual:v3] & 1) == 0)
    {
      -[SCATMenu setCurrentSheet:](self, "setCurrentSheet:", v4);
      -[SCATMenu transitionToMenuSheet:](self, "transitionToMenuSheet:", v4);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v4));
      -[SCATMenu setMenuSheetStack:](self, "setMenuSheetStack:", v5);
    }
  }
}

- (void)_cleanMenuStacks
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  -[SCATMenu setMenuSheetStack:](self, "setMenuSheetStack:", v3);
}

- (id)parentSheetOfSheet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuSheetStack](self, "menuSheetStack"));
  id v6 = (char *)[v5 indexOfObject:v4];

  id v7 = 0LL;
  return v7;
}

- (BOOL)containsGestureSheet
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___SCATModernMenuGesturesSheet, a2);
  return -[SCATMenu containsSheet:](self, "containsSheet:", v3);
}

- (BOOL)containsSheet:(Class)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuSheetStack](self, "menuSheetStack", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v11 + 1) + 8LL * (void)i), a3) & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (SCATModernMenuGesturesSheet)gestureSheet
{
  v2 = -[SCATMenu menuSheetStack]( self,  "menuSheetStack",  objc_opt_class(&OBJC_CLASS___SCATModernMenuGesturesSheet, a2).n128_f64[0]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &stru_100123CC8));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  uint64_t v7 = __UIAccessibilityCastAsClass(v6);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (SCATModernMenuGesturesSheet *)v8;
}

- (BOOL)_canPopSheet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuSheetStack](self, "menuSheetStack"));
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)menuTipObjectDidChange
{
}

- (void)willTransitionToSheet:(id)a3
{
}

- (void)didTransitionToSheet:(id)a3
{
}

- (void)reloadFromCurrentSheet
{
}

- (void)_updateForGeometryChange
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  char v4 = objc_opt_respondsToSelector(v3, "updateForGeometryChange");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
    [v5 updateForGeometryChange];
  }

- (void)_slideToPositionWithMode:(unint64_t)a3 positionIndex:(int64_t)a4
{
  if (a3) {
    -[SCATMenu setDockPosition:](self, "setDockPosition:", a4);
  }
  else {
    -[SCATMenu setPopoverPosition:](self, "setPopoverPosition:", a4);
  }
  -[SCATMenu _updateForGeometryChange](self, "_updateForGeometryChange");
}

- (void)slidePopoverToPosition:(int64_t)a3
{
}

- (void)slideDockToPosition:(int64_t)a3
{
}

- (void)closeCurrentScanningContext
{
}

- (void)handleMenuWasActivatedByScanner
{
}

- (id)exitActionElement
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
  if ([v3 allowsExitAction])
  {
    char v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 exitActionElement]);
    __n128 v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));
    }
    unsigned int v8 = v7;
  }

  else
  {
    unsigned int v8 = 0LL;
  }

  return v8;
}

- (void)updateMenuVisualsForUpdatedElementVisuals
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));
  -[SCATMenu _updateWithElement:forceUpdate:](self, "_updateWithElement:forceUpdate:", v3, 1LL);
}

- (void)incrementValue
{
}

- (void)decrementValue
{
}

- (void)_handleAdjustValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));
  if ([v5 scatIsAXElement])
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __n128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 menuItems]);

    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      id v9 = v8;
      v26 = self;
      uint64_t v10 = *(void *)v32;
LABEL_4:
      uint64_t v11 = 0LL;
      while (1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        __int128 v14 = v13;
        uint64_t v15 = v3 ? @"action_increment" : @"action_decrement";
        unsigned __int8 v16 = [v13 isEqual:v15];

        if ((v16 & 1) != 0) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }

      id v17 = v12;

      if (!v17) {
        goto LABEL_28;
      }
      [v17 setShouldSuppressAudioOutput:1];
      [v5 scatUpdateValue];
      v18 = (void *)objc_claimAutoreleasedReturnValue([v5 scatValue]);
      if (v3) {
        uint64_t v19 = 2004LL;
      }
      else {
        uint64_t v19 = 2005LL;
      }
      [v5 scatPerformAction:v19];
      double Current = CFAbsoluteTimeGetCurrent();
      v21 = 0LL;
      while (CFAbsoluteTimeGetCurrent() - Current < 0.5)
      {
        +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.05);
        [v5 scatUpdateValue];
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v5 scatValue]);

        v21 = (void *)v22;
        if (([v18 isEqualToString:v22] & 1) == 0)
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v26, "delegate"));
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472LL;
          v29[2] = sub_10006B784;
          v29[3] = &unk_100121D40;
          id v30 = v17;
          [v23 menu:v26 speakAnnouncement:v22 completionBlock:v29];

          v21 = (void *)v22;
          goto LABEL_26;
        }
      }

      if (v21 && [v18 isEqualToString:v21])
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v26, "delegate"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_10006B790;
        v27[3] = &unk_100121D40;
        id v28 = v17;
        [v24 menu:v26 speakAnnouncement:v21 completionBlock:v27];

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](v26, "delegate"));
        [v25 menu:v26 playSoundEffect:1004];
      }

      [v17 setShouldSuppressAudioOutput:0];
LABEL_26:
    }

    else
    {
LABEL_13:
      id v17 = v7;
    }
  }

- (void)registerMenuObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu menuObservers](self, "menuObservers"));
  [v5 addObject:v4];
}

- (void)unregisterMenuObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu menuObservers](self, "menuObservers"));
  [v5 removeObject:v4];
}

- (void)unregisterAllMenuObservers
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu menuObservers](self, "menuObservers"));
  [v2 removeAllObjects];
}

- (void)_notifyMenuObserversWithSelector:(SEL)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuObservers](self, "menuObservers", 0LL));
  __n128 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, a3) & 1) != 0) {
          [v11 performSelector:a3 withObject:self];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)_updateOptionsIfNeeded:(int *)a3 withResultElement:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));

    id v7 = v8;
    if (v6 == v8) {
      *a3 |= 5u;
    }
  }

  else
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMenu.m",  863LL,  "-[SCATMenu _updateOptionsIfNeeded:withResultElement:]",  @"We should be getting a valid options ref to assign to");
    id v7 = v8;
  }
}

- (id)firstElementWithOptions:(int *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu elementProvider](self, "elementProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstElementWithOptions:a3]);

  -[SCATMenu _updateOptionsIfNeeded:withResultElement:](self, "_updateOptionsIfNeeded:withResultElement:", a3, v6);
  return v6;
}

- (id)lastElementWithOptions:(int *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu elementProvider](self, "elementProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastElementWithOptions:a3]);

  -[SCATMenu _updateOptionsIfNeeded:withResultElement:](self, "_updateOptionsIfNeeded:withResultElement:", a3, v6);
  return v6;
}

- (id)_siblingOfElement:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5 options:(int *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  -[SCATMenu _prepareMenuForScanningIfNeeded](self, "_prepareMenuForScanningIfNeeded");
  if (-[SCATMenu isTransitioning](self, "isTransitioning"))
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element"));

    if (v12 == v10)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu firstElementWithOptions:](self, "firstElementWithOptions:", a6));
      uint64_t v11 = v20;
      if (!v8)
      {
        uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 parentGroup]);
        if (v21
          && (v22 = (void *)v21, unsigned int v23 = -[SCATMenu isGroupingEnabled](self, "isGroupingEnabled"), v22, v23))
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v11 parentGroup]);
          uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 previousSiblingOfChild:v11 didWrap:a5]);
        }

        else
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu elementProvider](self, "elementProvider"));
          uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 elementBefore:v10 didWrap:a5 options:a6]);
        }

        v26 = (void *)v25;

        uint64_t v11 = v26;
      }

      *a5 = 1;
    }

    else
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 parentGroup]);
      if (v13
        && (__int128 v14 = (void *)v13, v15 = -[SCATMenu isGroupingEnabled](self, "isGroupingEnabled"), v14, v15))
      {
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 parentGroup]);
        id v17 = v16;
        if (v8) {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 nextSiblingOfChild:v10 didWrap:a5]);
        }
        else {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 previousSiblingOfChild:v10 didWrap:a5]);
        }
      }

      else
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu elementProvider](self, "elementProvider"));
        id v17 = v19;
        if (v8) {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v19 elementAfter:v10 didWrap:a5 options:a6]);
        }
        else {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v19 elementBefore:v10 didWrap:a5 options:a6]);
        }
      }

      uint64_t v11 = (void *)v18;
    }

    -[SCATMenu _updateOptionsIfNeeded:withResultElement:](self, "_updateOptionsIfNeeded:withResultElement:", a6, v11);
  }

  return v11;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return -[SCATMenu _siblingOfElement:inDirection:didWrap:options:]( self,  "_siblingOfElement:inDirection:didWrap:options:",  a3,  1LL,  a4,  a5);
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  return -[SCATMenu _siblingOfElement:inDirection:didWrap:options:]( self,  "_siblingOfElement:inDirection:didWrap:options:",  a3,  0LL,  a4,  a5);
}

- (id)identifier
{
  return off_100157150[0];
}

- (BOOL)canBeActiveElementManager
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
  else {
    unsigned int v4 = !-[SCATMenu isTransitioning](self, "isTransitioning");
  }

  return v4;
}

- (BOOL)shouldKeepScannerAwake
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
  unsigned __int8 v3 = [v2 shouldKeepScannerAwake];

  return v3;
}

- (BOOL)allowsDwellSelection
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
  unsigned __int8 v3 = [v2 shouldAllowDwellSelection];

  return v3;
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  return 0;
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
  id v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATMenu;
  -[SCATElementManager driver:willFocusOnContext:](&v8, "driver:willFocusOnContext:", a3, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
  [v7 willFocusOnContext:v6];

  if (-[SCATMenu willScanFirstElementAfterPresentation](self, "willScanFirstElementAfterPresentation"))
  {
    -[SCATMenu setWillScanFirstElementAfterPresentation:](self, "setWillScanFirstElementAfterPresentation:", 0LL);
    [v6 setShouldPlayMenuSoundOnFocus:1];
  }
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATMenu;
  id v8 = a5;
  id v9 = a4;
  -[SCATElementManager driver:didFocusOnContext:oldContext:](&v12, "driver:didFocusOnContext:oldContext:", a3, v9, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet", v12.receiver, v12.super_class));
  [v10 didFocusOnContext:v9 oldContext:v8];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  [v11 didFocusOnContext:v9 oldContext:v8];
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATMenu;
  id v6 = a4;
  -[SCATElementManager driver:willUnfocusFromContext:](&v9, "driver:willUnfocusFromContext:", a3, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet", v9.receiver, v9.super_class));
  [v7 willUnfocusFromContext:v6];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  [v8 willUnfocusFromContext:v6];
}

- (void)orientationDidChange:(id)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SCATMenu element](self, "element", a3));
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scannerElementMatchingElement:v5]);

    if (v7)
    {
      -[SCATMenu setElement:](self, "setElement:", v7);
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuSheetStack](self, "menuSheetStack", 0LL));
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          objc_super v12 = 0LL;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) didChangeOrientation];
            objc_super v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }

        while (v10);
      }

      -[SCATMenu _updateForGeometryChange](self, "_updateForGeometryChange");
    }

    else
    {
      -[SCATMenu hideWithCompletion:](self, "hideWithCompletion:", 0LL);
    }
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu screenPoint](self, "screenPoint"));

    if (v13) {
      -[SCATMenu _updateForGeometryChange](self, "_updateForGeometryChange");
    }
  }

- (void)appTransitionDidOccur:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATMenu;
  -[SCATElementManager appTransitionDidOccur:](&v4, "appTransitionDidOccur:", a3);
  -[SCATMenu hideWithCompletion:](self, "hideWithCompletion:", 0LL);
}

- (void)alertDidAppear:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATMenu;
  -[SCATElementManager alertDidAppear:](&v4, "alertDidAppear:", a3);
  -[SCATMenu hideWithCompletion:](self, "hideWithCompletion:", 0LL);
}

- (void)_flushScannableMenuElements
{
}

- (id)arrayByShiftingItemsInArray:(id)a3 leftByNumberOfPositions:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 count];
  unint64_t v7 = (unint64_t)v6;
  if ((unint64_t)v6 <= a4)
  {
    unint64_t v14 = a4;
    id v15 = v6;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATMenu.m",  1071LL,  "-[SCATMenu arrayByShiftingItemsInArray:leftByNumberOfPositions:]",  @"amount of shift (%lu) must be less than num elements: (%lu)");
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v7, v14, v15));
  if (v7 > a4)
  {
    unint64_t v9 = a4;
    do
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v9]);
      [v8 addObject:v10];

      ++v9;
    }

    while (v7 != v9);
  }

  if (a4)
  {
    uint64_t v11 = 0LL;
    do
    {
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v11]);
      [v8 addObject:v12];

      ++v11;
    }

    while (a4 != v11);
  }

  return v8;
}

- (void)_prepareMenuForScanningIfNeeded
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu elementProvider](self, "elementProvider"));
  if (v3)
  {
  }

  else if (!-[SCATMenu isTransitioning](self, "isTransitioning"))
  {
    -[SCATMenu _prepareMenuForScanning](self, "_prepareMenuForScanning");
  }

- (void)_prepareMenuForScanning
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___SCATAggregateElementProvider);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu currentSheet](self, "currentSheet"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu _elementProviderForSheet:](self, "_elementProviderForSheet:", v4));
  if (v5) {
    -[SCATAggregateElementProvider addProvider:](v3, "addProvider:", v5);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 extraProviderElements]);

  if ([v7 count]) {
    id v8 =  -[SCATAggregateElementProvider addProviderWithElements:passingTest:]( v3,  "addProviderWithElements:passingTest:",  v7,  0LL);
  }
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu exitActionElement](self, "exitActionElement"));
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu exitActionElement](self, "exitActionElement"));
    uint64_t v13 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    id v12 =  -[SCATAggregateElementProvider addProviderWithElements:passingTest:]( v3,  "addProviderWithElements:passingTest:",  v11,  0LL);
  }

  -[SCATMenu setElementProvider:](self, "setElementProvider:", v3);
}

- (id)_elementProviderForSheet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenu menuVisualProvider](self, "menuVisualProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 elementProviderForSheet:v4]);

  return v6;
}

- (BOOL)_viewIsSuitableScannerElement:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isHidden] & 1) == 0 && (objc_msgSend(v4, "alpha"), v5 >= 0.05))
  {
    [v4 frame];
    BOOL v6 = !CGRectIsEmpty(v8);
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)didPressScreenChangingButton
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenu delegate](self, "delegate"));
  [v3 didPressScreenChangingButtonInMenu:self];
}

- (SCATMenuVisualProvider)menuVisualProvider
{
  return self->_menuVisualProvider;
}

- (void)setMenuVisualProvider:(id)a3
{
}

- (SCATMenuDelegate)delegate
{
  return (SCATMenuDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCATElement)element
{
  return self->_element;
}

- (AXElement)textElement
{
  return self->_textElement;
}

- (void)setTextElement:(id)a3
{
}

- (SCATPointPicker)pointPicker
{
  return self->_pointPicker;
}

- (void)setPointPicker:(id)a3
{
}

- (NSValue)screenPoint
{
  return self->_screenPoint;
}

- (void)setScreenPoint:(id)a3
{
}

- (NSMutableArray)menuSheetStack
{
  return self->_menuSheetStack;
}

- (void)setMenuSheetStack:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)shouldNotResetPointPickerRefinement
{
  return self->_shouldNotResetPointPickerRefinement;
}

- (void)setShouldNotResetPointPickerRefinement:(BOOL)a3
{
  self->_shouldNotResetPointPickerRefinement = a3;
}

- (int64_t)popoverPosition
{
  return self->_popoverPosition;
}

- (void)setPopoverPosition:(int64_t)a3
{
  self->_popoverPosition = a3;
}

- (int64_t)dockPosition
{
  return self->_dockPosition;
}

- (void)setDockPosition:(int64_t)a3
{
  self->_dockPosition = a3;
}

- (BOOL)wasPresentedWithTip
{
  return self->_wasPresentedWithTip;
}

- (void)setWasPresentedWithTip:(BOOL)a3
{
  self->_wasPresentedWithTip = a3;
}

- (BOOL)isWaitingToBePresented
{
  return self->_isWaitingToBePresented;
}

- (void)setIsWaitingToBePresented:(BOOL)a3
{
  self->_isWaitingToBePresented = a3;
}

- (BOOL)didActivateElement
{
  return self->_didActivateElement;
}

- (void)setDidActivateElement:(BOOL)a3
{
  self->_didActivateElement = a3;
}

- (SCATModernMenuSheet)currentSheet
{
  return self->_currentSheet;
}

- (void)setCurrentSheet:(id)a3
{
}

- (AXUIElement)fallbackScrollDownAncestor
{
  return self->_fallbackScrollDownAncestor;
}

- (void)setFallbackScrollDownAncestor:(id)a3
{
}

- (AXUIElement)fallbackScrollUpAncestor
{
  return self->_fallbackScrollUpAncestor;
}

- (void)setFallbackScrollUpAncestor:(id)a3
{
}

- (AXUIElement)fallbackScrollLeftAncestor
{
  return self->_fallbackScrollLeftAncestor;
}

- (void)setFallbackScrollLeftAncestor:(id)a3
{
}

- (AXUIElement)fallbackScrollRightAncestor
{
  return self->_fallbackScrollRightAncestor;
}

- (void)setFallbackScrollRightAncestor:(id)a3
{
}

- (NSHashTable)menuObservers
{
  return self->_menuObservers;
}

- (void)setMenuObservers:(id)a3
{
}

- (SCATAggregateElementProvider)elementProvider
{
  return self->_elementProvider;
}

- (void)setElementProvider:(id)a3
{
}

- (BOOL)willScanFirstElementAfterPresentation
{
  return self->_willScanFirstElementAfterPresentation;
}

- (void)setWillScanFirstElementAfterPresentation:(BOOL)a3
{
  self->_willScanFirstElementAfterPresentation = a3;
}

- (void).cxx_destruct
{
}

@end