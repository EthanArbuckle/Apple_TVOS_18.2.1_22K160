@interface SCATElementNavigationController
- (AXElement)firstResponder;
- (AXElement)lastScannedElementCommunity;
- (BOOL)_deferFocusToNativeFocusElementIfNeeded:(id)a3;
- (BOOL)_didFocusLastOnKeyboardElement;
- (BOOL)_isKeyboardContainerElement:(id)a3 allowKeyboardContainerItself:(BOOL)a4;
- (BOOL)_isScanningKeyboardContainer:(id)a3;
- (BOOL)_shouldTrackNativeFocusElement;
- (BOOL)areGroupVisualScrollersEnabled;
- (BOOL)areTopLevelVisualScrollersEnabled;
- (BOOL)isGroupingEnabled;
- (BOOL)isMenuOpeningElementEnabled;
- (BOOL)shouldRescanAfterFetch;
- (BOOL)shouldRescanFromTopAfterFetch;
- (BOOL)shouldScanKeyboardOnAppearance;
- (HNDAccessibilityManagerProtocol)axManager;
- (NSIndexPath)keyboardIndexPath;
- (NSString)startingSceneIdentifier;
- (NSValue)keyboardKeyCenterPoint;
- (SCATElementNavigationController)init;
- (SCATElementNavigationControllerDelegate)delegate;
- (SCATFocusContext)currentFocusContext;
- (SCATMenuOpeningAuxiliaryElementManager)menuOpeningAuxElementManager;
- (SCATVisualScrollersAuxiliaryElementManager)groupVisualScrollersAuxElementManager;
- (SCATVisualScrollersAuxiliaryElementManager)topLevelVisualScrollersAuxElementManager;
- (id)_firstKeyboardFocusContext;
- (id)_indexPathForKeyboardElement:(id)a3;
- (id)_keyboardElementForIndexPath:(id)a3;
- (id)_nativeFocusElementContext;
- (id)_replacementForLastFocusedKeyboardItem;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)focusContextAfterDrillOutOnGroup:(id)a3;
- (id)identifier;
- (id)lastElementWithOptions:(int *)a3;
- (id)nextFocusContextAfterActivatingKeyboardElement:(id)a3;
- (id)nextFocusContextAfterDismissingMenuForElement:(id)a3;
- (id)numberOfItemsInCurrentScanCycle;
- (int)keyboardSelectBehavior;
- (unint64_t)_depthForElement:(id)a3;
- (void)_attemptToRestoreFocusContext:(id)a3 scannerManager:(id)a4 foundNewElements:(BOOL)a5;
- (void)_giveUpWaitingForFetchAfterPause;
- (void)_menuOpeningElementActivated:(id)a3;
- (void)_pauseScanningForLikelyScreenChange;
- (void)_pauseScanningTemporarily;
- (void)_resetFetchFlags;
- (void)_startWaitingForFetchAfterTemporaryPause;
- (void)_stopWaitingForFetchAfterTemporaryPause;
- (void)_trackLastFocusedKeyboardItem:(id)a3;
- (void)_trackLastScannedElementCommunityFromFocusContext:(id)a3;
- (void)_updateMenuOpeningElementEnabledWithFocusContext:(id)a3;
- (void)_updateVisualScrollersWithFocusContext:(id)a3 oldContext:(id)a4;
- (void)alertDidAppear:(id)a3;
- (void)appTransitionDidOccur:(id)a3;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)firstResponderDidChange:(id)a3;
- (void)orientationDidChange:(id)a3;
- (void)scannerManager:(id)a3 didActivateElement:(id)a4;
- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4;
- (void)screenChangingButtonWasPressed:(id)a3;
- (void)screenDidChange:(id)a3 data:(id)a4;
- (void)setAxManager:(id)a3;
- (void)setCurrentFocusContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstResponder:(id)a3;
- (void)setGroupVisualScrollersAuxElementManager:(id)a3;
- (void)setGroupVisualScrollersEnabled:(BOOL)a3;
- (void)setKeyboardIndexPath:(id)a3;
- (void)setKeyboardKeyCenterPoint:(id)a3;
- (void)setKeyboardSelectBehavior:(int)a3;
- (void)setLastScannedElementCommunity:(id)a3;
- (void)setMenuOpeningAuxElementManager:(id)a3;
- (void)setMenuOpeningElementEnabled:(BOOL)a3;
- (void)setShouldRescanAfterFetch:(BOOL)a3;
- (void)setShouldRescanFromTopAfterFetch:(BOOL)a3;
- (void)setShouldScanKeyboardOnAppearance:(BOOL)a3;
- (void)setStartingSceneIdentifier:(id)a3;
- (void)setTopLevelVisualScrollersAuxElementManager:(id)a3;
- (void)setTopLevelVisualScrollersEnabled:(BOOL)a3;
@end

@implementation SCATElementNavigationController

- (SCATElementNavigationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATElementNavigationController;
  v2 = -[SCATElementNavigationController init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    -[SCATElementNavigationController setAxManager:](v2, "setAxManager:", v3);
  }

  return v2;
}

- (BOOL)isGroupingEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (HNDAccessibilityManagerProtocol)axManager
{
  *(void *)&double v2 = objc_opt_class(self->_axManager, a2).n128_u64[0];
  return (HNDAccessibilityManagerProtocol *)objc_msgSend(v3, "sharedManager", v2);
}

- (void)setAxManager:(id)a3
{
}

- (id)identifier
{
  return off_100157148[0];
}

- (void)_menuOpeningElementActivated:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController delegate](self, "delegate", a3));
  [v4 presentPostScanningMenuForElementNavigationController:self];
}

- (void)setMenuOpeningElementEnabled:(BOOL)a3
{
  if (self->_menuOpeningElementEnabled != a3)
  {
    BOOL v3 = a3;
    self->_menuOpeningElementEnabled = a3;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController menuOpeningAuxElementManager](self, "menuOpeningAuxElementManager"));

    if (!v5)
    {
      v6 = objc_opt_new(&OBJC_CLASS___SCATMenuOpeningAuxiliaryElementManager);
      -[SCATElementNavigationController setMenuOpeningAuxElementManager:](self, "setMenuOpeningAuxElementManager:", v6);
      -[SCATElementManager appendAuxiliaryElementManager:withRole:]( self,  "appendAuxiliaryElementManager:withRole:",  v6,  1LL);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuOpeningAuxiliaryElementManager menuOpeningElement](v6, "menuOpeningElement"));
      [v7 addTarget:self action:"_menuOpeningElementActivated:" forControlEvents:64];
    }

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController menuOpeningAuxElementManager](self, "menuOpeningAuxElementManager"));
    [v8 setEnabled:v3];
  }

- (void)setTopLevelVisualScrollersEnabled:(BOOL)a3
{
  if (self->_topLevelVisualScrollersEnabled != a3)
  {
    BOOL v3 = a3;
    self->_topLevelVisualScrollersEnabled = a3;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController topLevelVisualScrollersAuxElementManager]( self,  "topLevelVisualScrollersAuxElementManager"));

    if (!v5)
    {
      v6 = -[SCATVisualScrollersAuxiliaryElementManager initWithMode:]( objc_alloc(&OBJC_CLASS___SCATVisualScrollersAuxiliaryElementManager),  "initWithMode:",  0LL);
      -[SCATElementNavigationController setTopLevelVisualScrollersAuxElementManager:]( self,  "setTopLevelVisualScrollersAuxElementManager:",  v6);
      -[SCATElementManager appendAuxiliaryElementManager:withRole:]( self,  "appendAuxiliaryElementManager:withRole:",  v6,  1LL);
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController topLevelVisualScrollersAuxElementManager]( self,  "topLevelVisualScrollersAuxElementManager"));
    [v7 setEnabled:v3];
  }

- (void)setGroupVisualScrollersEnabled:(BOOL)a3
{
  if (self->_groupVisualScrollersEnabled != a3)
  {
    BOOL v3 = a3;
    self->_groupVisualScrollersEnabled = a3;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController groupVisualScrollersAuxElementManager]( self,  "groupVisualScrollersAuxElementManager"));

    if (!v5)
    {
      v6 = -[SCATVisualScrollersAuxiliaryElementManager initWithMode:]( objc_alloc(&OBJC_CLASS___SCATVisualScrollersAuxiliaryElementManager),  "initWithMode:",  1LL);
      -[SCATElementNavigationController setGroupVisualScrollersAuxElementManager:]( self,  "setGroupVisualScrollersAuxElementManager:",  v6);
      -[SCATElementManager appendAuxiliaryElementManager:withRole:]( self,  "appendAuxiliaryElementManager:withRole:",  v6,  2LL);
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController groupVisualScrollersAuxElementManager]( self,  "groupVisualScrollersAuxElementManager"));
    [v7 setEnabled:v3];
  }

- (void)setCurrentFocusContext:(id)a3
{
}

- (id)firstElementWithOptions:(int *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController startingSceneIdentifier](self, "startingSceneIdentifier", a3));
  id v5 = [v4 length];

  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager")),
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController startingSceneIdentifier](self, "startingSceneIdentifier")),
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstElementInScene:v7]),
        v7,
        v6,
        -[SCATElementNavigationController setStartingSceneIdentifier:](self, "setStartingSceneIdentifier:", 0LL),
        !v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController lastScannedElementCommunity](self, "lastScannedElementCommunity"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 firstItemForScanningWithElementCommunity:v10]);
  }

  return v8;
}

- (id)lastElementWithOptions:(int *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController lastScannedElementCommunity](self, "lastScannedElementCommunity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastItemForScanningWithElementCommunity:v5]);

  return v6;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  BOOL v23 = 0;
  unsigned int v8 = [v7 scatIsAuxiliaryElement];
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementAfter:](self, "auxiliaryElementAfter:", v7));
    if (v9)
    {
      v10 = (void *)v9;
      goto LABEL_16;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 scatAuxiliaryElementManager]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contextElement]);

    if ([v12 isGroup])
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue([v12 lastChild]);
    }

    else
    {
      if (!v12)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
        v22 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController lastScannedElementCommunity]( self,  "lastScannedElementCommunity"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v21 firstItemForScanningWithElementCommunity:v22]);

        BOOL v23 = 1;
        if (v10) {
          goto LABEL_16;
        }
        goto LABEL_9;
      }

      id v13 = v12;
    }

    id v14 = v13;

    id v7 = v14;
  }

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v7 = a3;
  BOOL v23 = 0;
  unsigned int v8 = [v7 scatIsAuxiliaryElement];
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SCATElementManager auxiliaryElementBefore:](self, "auxiliaryElementBefore:", v7));
    if (v9)
    {
      v10 = (void *)v9;
      goto LABEL_16;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 scatAuxiliaryElementManager]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contextElement]);

    if ([v12 isGroup])
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue([v12 firstChild]);
    }

    else
    {
      if (!v12)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
        v22 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController lastScannedElementCommunity]( self,  "lastScannedElementCommunity"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v21 lastItemForScanningWithElementCommunity:v22]);

        BOOL v23 = 1;
        if (v10) {
          goto LABEL_16;
        }
        goto LABEL_9;
      }

      id v13 = v12;
    }

    id v14 = v13;

    id v7 = v14;
  }

- (id)_nativeFocusElementContext
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nativeFocusElement]);

  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v4,  self,  0LL,  0LL));
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)numberOfItemsInCurrentScanCycle
{
  if (!-[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled"))
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 elements]);

    if (v7)
    {
      uint64_t v9 = (char *)[v7 count];
      goto LABEL_14;
    }

    goto LABEL_13;
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController currentFocusContext](self, "currentFocusContext"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 element]);
  unsigned int v5 = [v4 scatIsAuxiliaryElement];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rootScannerGroup]);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController currentFocusContext](self, "currentFocusContext"));
    unsigned int v10 = [v6 selectBehavior];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController currentFocusContext](self, "currentFocusContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 element]);
    id v7 = v12;
    if (v10 != 4)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 parentGroup]);

      id v7 = (void *)v13;
    }
  }

  if (!v7)
  {
LABEL_13:
    uint64_t v9 = 0LL;
    goto LABEL_14;
  }

  uint64_t v9 = (char *)[v7 count];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 parentGroup]);

  if (v14) {
    ++v9;
  }
LABEL_14:

  if (-[SCATElementNavigationController isMenuOpeningElementEnabled](self, "isMenuOpeningElementEnabled")) {
    uint64_t v9 = &v9[-[SCATElementManager auxiliaryElementCountWithRole:](self, "auxiliaryElementCountWithRole:", 1LL)];
  }
  return +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9);
}

- (void)_giveUpWaitingForFetchAfterPause
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(3LL, @"*** gave up waiting for fetch after pause");
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v34 = 138543362;
        v35 = v12;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&v34, 0xCu);
      }
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  if (-[SCATElementNavigationController shouldRescanFromTopAfterFetch](self, "shouldRescanFromTopAfterFetch"))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    unsigned __int8 v15 = [v14 ignoreLogging];

    if ((v15 & 1) == 0)
    {
      char v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      uint64_t v17 = AXLoggerForFacility();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);

      os_log_type_t v19 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = AXColorizeFormatLog(3LL, @"will rescan from top");
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        uint64_t v22 = _AXStringForArgs(v21);
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v18, v19))
        {
          int v34 = 138543362;
          v35 = v23;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "%{public}@", (uint8_t *)&v34, 0xCu);
        }
      }
    }

    [v13 beginScanningWithFocusContext:0];
  }

  else if (-[SCATElementNavigationController shouldRescanAfterFetch](self, "shouldRescanAfterFetch"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    unsigned __int8 v25 = [v24 ignoreLogging];

    if ((v25 & 1) == 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      uint64_t v27 = AXLoggerForFacility();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);

      os_log_type_t v29 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = AXColorizeFormatLog(3LL, @"will rescan");
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        uint64_t v32 = _AXStringForArgs(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v28, v29))
        {
          int v34 = 138543362;
          v35 = v33;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "%{public}@", (uint8_t *)&v34, 0xCu);
        }
      }
    }

    [v13 resumeScanning];
  }

  -[SCATElementNavigationController _resetFetchFlags](self, "_resetFetchFlags");
}

- (void)_stopWaitingForFetchAfterTemporaryPause
{
}

- (void)_startWaitingForFetchAfterTemporaryPause
{
}

- (void)_pauseScanningTemporarily
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(3LL, @"Pause scanning temporarily");
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v24 = 138543362;
        unsigned __int8 v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&v24, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController _stopWaitingForFetchAfterTemporaryPause]( self,  "_stopWaitingForFetchAfterTemporaryPause");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  if ([v13 isActive])
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    unsigned __int8 v15 = [v14 ignoreLogging];

    if ((v15 & 1) == 0)
    {
      char v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      uint64_t v17 = AXLoggerForFacility();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);

      os_log_type_t v19 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = AXColorizeFormatLog(3LL, @"scanner was active; will rescan after fetch");
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        uint64_t v22 = _AXStringForArgs(v21);
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v18, v19))
        {
          int v24 = 138543362;
          unsigned __int8 v25 = v23;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "%{public}@", (uint8_t *)&v24, 0xCu);
        }
      }
    }

    -[SCATElementNavigationController setShouldRescanAfterFetch:](self, "setShouldRescanAfterFetch:", 1LL);
    [v13 pauseScanningWithScreenLockDisabled:1];
  }
}

- (void)_pauseScanningForLikelyScreenChange
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(3LL, @"paused for likely screen change; will rescan from top after fetch");
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v13 = 138543362;
        id v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController _startWaitingForFetchAfterTemporaryPause]( self,  "_startWaitingForFetchAfterTemporaryPause");
}

- (void)_resetFetchFlags
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(3LL, @"reset fetch flags");
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v13 = 138543362;
        id v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController setShouldRescanAfterFetch:](self, "setShouldRescanAfterFetch:", 0LL);
  -[SCATElementNavigationController setShouldRescanFromTopAfterFetch:](self, "setShouldRescanFromTopAfterFetch:", 0LL);
}

- (void)orientationDidChange:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance", a3));
  unsigned __int8 v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v7 = AXLoggerForFacility();
    os_log_type_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = AXColorizeFormatLog(3LL, @"*** Orientation change");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = _AXStringForArgs(v11);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v8, v9))
      {
        int v14 = 138543362;
        unsigned __int8 v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController _pauseScanningTemporarily](self, "_pauseScanningTemporarily");
}

- (void)appTransitionDidOccur:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance", a3));
  unsigned __int8 v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v7 = AXLoggerForFacility();
    os_log_type_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = AXColorizeFormatLog(3LL, @"*** App transition; should rescan from top after fetch");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = _AXStringForArgs(v11);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v8, v9))
      {
        int v14 = 138543362;
        unsigned __int8 v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController _pauseScanningTemporarily](self, "_pauseScanningTemporarily");
  -[SCATElementNavigationController setShouldRescanFromTopAfterFetch:](self, "setShouldRescanFromTopAfterFetch:", 1LL);
}

- (void)screenDidChange:(id)a3 data:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v7 = [v6 ignoreLogging];

  if ((v7 & 1) == 0)
  {
    os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v9 = AXLoggerForFacility();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = AXColorizeFormatLog(3LL, @"*** Screen change");
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = _AXStringForArgs(v13);
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v10, v11))
      {
        int v26 = 138543362;
        uint64_t v27 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "%{public}@", (uint8_t *)&v26, 0xCu);
      }
    }
  }

  if (!-[SCATElementNavigationController _didFocusLastOnKeyboardElement](self, "_didFocusLastOnKeyboardElement"))
  {
    -[SCATElementNavigationController _pauseScanningTemporarily](self, "_pauseScanningTemporarily");
    -[SCATElementNavigationController setShouldRescanFromTopAfterFetch:](self, "setShouldRescanFromTopAfterFetch:", 1LL);
    char v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    unsigned __int8 v17 = [v16 ignoreLogging];

    if ((v17 & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      uint64_t v19 = AXLoggerForFacility();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

      os_log_type_t v21 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = AXColorizeFormatLog(3LL, @"was not scanning the keyboard; will rescan from top after fetch");
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        uint64_t v24 = _AXStringForArgs(v23);
        unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v20, v21))
        {
          int v26 = 138543362;
          uint64_t v27 = v25;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "%{public}@", (uint8_t *)&v26, 0xCu);
        }
      }
    }
  }

  -[SCATElementNavigationController firstResponderDidChange:](self, "firstResponderDidChange:", v5);
}

- (void)alertDidAppear:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance", a3));
  unsigned __int8 v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v7 = AXLoggerForFacility();
    os_log_type_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = AXColorizeFormatLog(3LL, @"*** Alert appeared; should rescan from top after fetch");
      os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = _AXStringForArgs(v11);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v8, v9))
      {
        int v14 = 138543362;
        unsigned __int8 v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController _pauseScanningTemporarily](self, "_pauseScanningTemporarily");
  -[SCATElementNavigationController setShouldRescanFromTopAfterFetch:](self, "setShouldRescanFromTopAfterFetch:", 1LL);
}

- (void)screenChangingButtonWasPressed:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance", a3));
  unsigned __int8 v5 = [v4 ignoreLogging];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v7 = AXLoggerForFacility();
    os_log_type_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = AXColorizeFormatLog(3LL, @"*** Screen changing button was pressed");
      os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = _AXStringForArgs(v11);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v8, v9))
      {
        int v14 = 138543362;
        unsigned __int8 v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController _pauseScanningForLikelyScreenChange](self, "_pauseScanningForLikelyScreenChange");
}

- (void)_trackLastScannedElementCommunityFromFocusContext:(id)a3
{
  id v10 = a3;
  unsigned int v4 = [v10 selectBehavior];
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v10 element]);
  uint64_t v6 = v5;
  if (v4 != 4)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 parentGroup]);

    uint64_t v6 = (void *)v7;
  }

  if (v6)
  {
    while (1)
    {
      os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 elementCommunity]);

      if (v8) {
        break;
      }
      os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 parentGroup]);

      uint64_t v6 = v9;
      if (!v9) {
        goto LABEL_9;
      }
    }

    os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 elementCommunity]);
  }

  else
  {
    os_log_type_t v9 = 0LL;
  }

- (void)firstResponderDidChange:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstResponder]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v10 = AXLoggerForFacility();
    os_log_type_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = AXColorizeFormatLog(3LL, @"*** First responder change: %{public}@ -> %{public}@");
      int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController firstResponder](self, "firstResponder"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v15 elemLog]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v6 elemLog]);
      uint64_t v16 = _AXStringForArgs(v14);
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController firstResponder](self, "firstResponder", v41, v42));
  uint64_t v19 = v6;
  uint64_t v20 = (void *)v18;
  os_log_type_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController firstResponder](self, "firstResponder"));
  unsigned __int8 v22 = [v21 isEqual:v6];

  if ((v22 & 1) == 0)
  {
    -[SCATElementNavigationController setShouldScanKeyboardOnAppearance:]( self,  "setShouldScanKeyboardOnAppearance:",  0LL);
    if (v6)
    {
      if (!-[SCATElementNavigationController _didFocusLastOnKeyboardElement](self, "_didFocusLastOnKeyboardElement"))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController _firstKeyboardFocusContext]( self,  "_firstKeyboardFocusContext"));
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCElementNav sharedInstance]( &OBJC_CLASS___AXSubsystemSCElementNav,  "sharedInstance"));
        unsigned __int8 v24 = [v23 ignoreLogging];

        if (v19)
        {
          if ((v24 & 1) == 0)
          {
            unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
            uint64_t v26 = AXLoggerForFacility();
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

            os_log_type_t v28 = AXOSLogLevelFromAXLogLevel(3LL);
            if (os_log_type_enabled(v27, v28))
            {
              uint64_t v29 = AXColorizeFormatLog(3LL, @"Was not scanning keyboard; will scan keyboard now");
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              uint64_t v31 = _AXStringForArgs(v30);
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v27, v28))
              {
                *(_DWORD *)buf = 138543362;
                v44 = v32;
                _os_log_impl((void *)&_mh_execute_header, v27, v28, "%{public}@", buf, 0xCu);
              }
            }
          }

          [v4 beginScanningWithFocusContext:v19];
        }

        else
        {
          if ((v24 & 1) == 0)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
            uint64_t v34 = AXLoggerForFacility();
            v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);

            os_log_type_t v36 = AXOSLogLevelFromAXLogLevel(3LL);
            if (os_log_type_enabled(v35, v36))
            {
              uint64_t v37 = AXColorizeFormatLog(3LL, @"Was not scanning keyboard; need to scan keyboard when it appears");
              v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
              uint64_t v39 = _AXStringForArgs(v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v35, v36))
              {
                *(_DWORD *)buf = 138543362;
                v44 = v40;
                _os_log_impl((void *)&_mh_execute_header, v35, v36, "%{public}@", buf, 0xCu);
              }
            }
          }

          -[SCATElementNavigationController setShouldScanKeyboardOnAppearance:]( self,  "setShouldScanKeyboardOnAppearance:",  1LL);
        }

- (void)_updateVisualScrollersWithFocusContext:(id)a3 oldContext:(id)a4
{
  id v17 = a4;
  -[SCATElementNavigationController setTopLevelVisualScrollersEnabled:](self, "setTopLevelVisualScrollersEnabled:", 1LL);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController currentFocusContext](self, "currentFocusContext"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 element]);

  if (([v6 scatIsAuxiliaryElement] & 1) == 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController topLevelVisualScrollersAuxElementManager]( self,  "topLevelVisualScrollersAuxElementManager"));
    [v7 setContextElement:v6];
  }

  if (-[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled"))
  {
    if ([v6 scatIsAuxiliaryElement])
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 scatAuxiliaryElementManager]);
      os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contextElement]);
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v17 element]);
      if ([v10 isGroup])
      {
        os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue([v17 element]);
        os_log_type_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstChild]);
        objc_opt_class(&OBJC_CLASS___SCATVisualScrollerView, v13);
        int isKindOfClass = objc_opt_isKindOfClass(v12, v14);
      }

      else
      {
        int isKindOfClass = 0;
      }

      if ([v6 isGroup]
        && (([v6 isRootGroup] | isKindOfClass) & 1) != 0)
      {
        id v16 = v6;
      }

      else
      {
        id v16 = (id)objc_claimAutoreleasedReturnValue([v6 parentGroup]);
      }

      os_log_type_t v9 = v16;
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController groupVisualScrollersAuxElementManager]( self,  "groupVisualScrollersAuxElementManager"));
      [v8 setContextElement:v9];
    }

    -[SCATElementNavigationController setGroupVisualScrollersEnabled:]( self,  "setGroupVisualScrollersEnabled:",  v9 != 0LL);
  }

  else
  {
    -[SCATElementNavigationController setGroupVisualScrollersEnabled:](self, "setGroupVisualScrollersEnabled:", 0LL);
  }
}

- (void)_updateMenuOpeningElementEnabledWithFocusContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v6 = [v5 switchControlTapBehavior];

  if (v6 == (id)2)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 element]);
    os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController menuOpeningAuxElementManager](self, "menuOpeningAuxElementManager"));
    unsigned int v10 = [v9 containsElement:v8];

    uint64_t v12 = SWCHLogCommon(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v23 = 67109379;
      int v24 = v10;
      __int16 v25 = 2113;
      uint64_t v26 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Always tap menu: %d contains element: %{private}@",  (uint8_t *)&v23,  0x12u);
    }

    if ((v10 & 1) != 0)
    {
      BOOL v14 = 1LL;
    }

    else
    {
      id v15 = v8;
      if ([v15 scatIsAuxiliaryElement])
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 scatAuxiliaryElementManager]);
        BOOL v17 = [v16 role] == (id)1;
      }

      else
      {
        BOOL v17 = 0;
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 parentGroup]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 rootScannerGroup]);

      BOOL v14 = (v18 == v20 || v17) && [v4 selectBehavior] != 4;
    }
  }

  else
  {
    BOOL v14 = 0LL;
  }

  uint64_t v21 = SWCHLogCommon(v7);
  unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    int v23 = 67109120;
    int v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Always tap menu: %d", (uint8_t *)&v23, 8u);
  }

  -[SCATElementNavigationController setMenuOpeningElementEnabled:](self, "setMenuOpeningElementEnabled:", v14);
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SCATElementNavigationController;
  id v9 = a5;
  -[SCATElementManager driver:didFocusOnContext:oldContext:](&v22, "driver:didFocusOnContext:oldContext:", a3, v8, v9);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v11 = [v10 ignoreLogging];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v13 = AXLoggerForFacility();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);

    os_log_type_t v15 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = AXColorizeFormatLog(3LL, @"Focused on %{public}@");
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v8 elemLog]);
      uint64_t v18 = _AXStringForArgs(v17);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138543362;
        int v24 = v19;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "%{public}@", buf, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController setCurrentFocusContext:](self, "setCurrentFocusContext:", v8, v21);
  -[SCATElementNavigationController _trackLastFocusedKeyboardItem:](self, "_trackLastFocusedKeyboardItem:", v8);
  -[SCATElementNavigationController _trackLastScannedElementCommunityFromFocusContext:]( self,  "_trackLastScannedElementCommunityFromFocusContext:",  v8);
  -[SCATElementNavigationController _updateVisualScrollersWithFocusContext:oldContext:]( self,  "_updateVisualScrollersWithFocusContext:oldContext:",  v8,  v9);

  -[SCATElementNavigationController _updateMenuOpeningElementEnabledWithFocusContext:]( self,  "_updateMenuOpeningElementEnabledWithFocusContext:",  v8);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 element]);
  [v20 setScatAssistiveTechFocused:1];
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SCATElementNavigationController;
  id v5 = a4;
  -[SCATElementManager driver:willUnfocusFromContext:](&v7, "driver:willUnfocusFromContext:", a3, v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "element", v7.receiver, v7.super_class));

  [v6 setScatAssistiveTechFocused:0];
}

- (void)scannerWillMakeManagerInactive:(id)a3 activeElementManager:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCElementNav sharedInstance]( &OBJC_CLASS___AXSubsystemSCElementNav,  "sharedInstance",  a3,  a4));
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v8 = AXLoggerForFacility();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = AXColorizeFormatLog(3LL, @"*** Element nav controller will become inactive; clearing keyboard state");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = _AXStringForArgs(v12);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        int v15 = 138543362;
        uint64_t v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "%{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController setKeyboardIndexPath:](self, "setKeyboardIndexPath:", 0LL);
  -[SCATElementNavigationController setKeyboardKeyCenterPoint:](self, "setKeyboardKeyCenterPoint:", 0LL);
  -[SCATElementNavigationController setMenuOpeningElementEnabled:](self, "setMenuOpeningElementEnabled:", 0LL);
}

- (unint64_t)_depthForElement:(id)a3
{
  id v3 = a3;
  id v4 = (char *)objc_claimAutoreleasedReturnValue([v3 parentGroup]);

  if (v4)
  {
    id v4 = 0LL;
    id v5 = v3;
    do
    {
      ++v4;
      id v3 = (id)objc_claimAutoreleasedReturnValue([v5 parentGroup]);

      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 parentGroup]);
      id v5 = v3;
    }

    while (v6);
  }

  return (unint64_t)v4;
}

- (void)_attemptToRestoreFocusContext:(id)a3 scannerManager:(id)a4 foundNewElements:(BOOL)a5
{
  BOOL v102 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
  os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 scannerElementMatchingElement:v9]);

  unint64_t v12 = (unint64_t)[v11 scatTraits];
  if ((kAXAutoCorrectCandidateTrait & v12) != 0)
  {
    else {
      uint64_t v13 = 0LL;
    }
    else {
      BOOL v14 = 0LL;
    }
    if (v13 != v14)
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 parentGroup]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 firstLeafDescendant]);

      id v11 = (id)v16;
    }
  }

  if (v11)
  {
    int v17 = 0;
  }

  else if ([v9 scatIsAuxiliaryElement])
  {
    id v11 = v9;
    int v17 = 1;
  }

  else
  {
    int v17 = 0;
    id v11 = 0LL;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v19 = [v18 ignoreLogging];

  if ((v19 & 1) == 0)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v21 = ((uint64_t (*)(void))AXLoggerForFacility)();
    objc_super v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);

    os_log_type_t v23 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v22, v23))
    {
      id v103 = v8;
      id v99 = v7;
      uint64_t v24 = AXColorizeFormatLog(3LL, @"Current element is %{public}@, matching element is %{public}@");
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if ((objc_opt_respondsToSelector(v9, "elemLog") & 1) != 0) {
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v9 elemLog]);
      }
      else {
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v9 description]);
      }
      uint64_t v27 = (void *)v26;
      if ((objc_opt_respondsToSelector(v11, "elemLog") & 1) != 0) {
        uint64_t v28 = objc_claimAutoreleasedReturnValue([v11 elemLog]);
      }
      else {
        uint64_t v28 = objc_claimAutoreleasedReturnValue([v11 description]);
      }
      uint64_t v29 = (void *)v28;
      v96 = v27;
      unint64_t v98 = v28;
      uint64_t v30 = _AXStringForArgs(v25);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 138543362;
        v107 = v31;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%{public}@", buf, 0xCu);
      }

      id v7 = v99;
      id v8 = v103;
    }
  }

  if (!v11) {
    goto LABEL_41;
  }
  if (((v17 | !-[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled")) & 1) != 0) {
    goto LABEL_37;
  }
  unint64_t v32 = -[SCATElementNavigationController _depthForElement:](self, "_depthForElement:", v9);
  unint64_t v33 = -[SCATElementNavigationController _depthForElement:](self, "_depthForElement:", v11);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v35 = [v34 ignoreLogging];

  if ((v35 & 1) == 0)
  {
    id v104 = v8;
    os_log_type_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v38 = AXLoggerForFacility(v36, v37);
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);

    os_log_type_t v40 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v39, v40))
    {
      id v100 = v7;
      uint64_t v41 = AXColorizeFormatLog(3LL, @"Current element depth %lu, matching element depth %lu");
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v96 = (void *)v32;
      unint64_t v98 = v33;
      uint64_t v43 = _AXStringForArgs(v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v39, v40))
      {
        *(_DWORD *)buf = 138543362;
        v107 = v44;
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "%{public}@", buf, 0xCu);
      }

      id v7 = v100;
    }

    id v8 = v104;
  }

  if (v33 == v32)
  {
LABEL_37:
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v11,  self,  objc_msgSend(v7, "selectBehavior", v96, v98),  0));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    unsigned __int8 v47 = [v46 ignoreLogging];

    if ((v47 & 1) == 0)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      uint64_t v50 = AXLoggerForFacility(v48, v49);
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);

      os_log_type_t v52 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v51, v52))
      {
        id v105 = v8;
        id v101 = v7;
        uint64_t v53 = AXColorizeFormatLog(3LL, @"Success: focus context %{public}@");
        v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        v97 = (void *)objc_claimAutoreleasedReturnValue([v45 elemLog]);
        uint64_t v55 = _AXStringForArgs(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);

        if (os_log_type_enabled(v51, v52))
        {
          *(_DWORD *)buf = 138543362;
          v107 = v56;
LABEL_46:
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "%{public}@", buf, 0xCu);
          goto LABEL_47;
        }

        goto LABEL_47;
      }

      goto LABEL_48;
    }
  }

  else
  {
LABEL_41:
    if (!-[SCATElementNavigationController _didFocusLastOnKeyboardElement]( self,  "_didFocusLastOnKeyboardElement",  v96,  v98))
    {
      v45 = 0LL;
      goto LABEL_50;
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController _replacementForLastFocusedKeyboardItem]( self,  "_replacementForLastFocusedKeyboardItem"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    unsigned __int8 v58 = [v57 ignoreLogging];

    if ((v58 & 1) == 0)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      uint64_t v61 = AXLoggerForFacility(v59, v60);
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);

      os_log_type_t v52 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v51, v52))
      {
        id v105 = v8;
        id v101 = v7;
        uint64_t v62 = AXColorizeFormatLog(3LL, @"Found replacement for keyboard item %{public}@");
        v54 = (void *)objc_claimAutoreleasedReturnValue(v62);
        v97 = (void *)objc_claimAutoreleasedReturnValue([v45 elemLog]);
        uint64_t v63 = _AXStringForArgs(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v63);

        if (os_log_type_enabled(v51, v52))
        {
          *(_DWORD *)buf = 138543362;
          v107 = v56;
          goto LABEL_46;
        }

- (BOOL)_shouldTrackNativeFocusElement
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeScannerDriver]);
  BOOL v4 = [v3 driverType] == 1;

  return v4;
}

- (BOOL)_deferFocusToNativeFocusElementIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v6 = [v5 switchControlScanAfterTapLocation];

  if (v6 && -[SCATElementNavigationController _shouldTrackNativeFocusElement](self, "_shouldTrackNativeFocusElement"))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController currentFocusContext](self, "currentFocusContext"));
    if (!v7
      || (id v8 = (void *)v7,
          id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController currentFocusContext](self, "currentFocusContext")),
          unsigned int v10 = [v9 shouldDeferFocusToNativeFocusElement],
          v9,
          v8,
          v10))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController _nativeFocusElementContext](self, "_nativeFocusElementContext"));
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 element]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController currentFocusContext](self, "currentFocusContext"));
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 element]);

      if (([v12 isEqual:v14] & 1) != 0
        || ([v12 scatIsKeyboardKey] & 1) != 0)
      {
        LOBYTE(v10) = 0;
      }

      else
      {
        [v4 beginScanningWithFocusContext:v11];
        LOBYTE(v10) = 1;
      }
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v12 = [v11 ignoreLogging];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v15 = AXLoggerForFacility(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);

    os_log_type_t v17 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = AXColorizeFormatLog(3LL, @"*** Did fetch elements");
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v20 = _AXStringForArgs(v19);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v16, v17))
      {
        int v67 = 138543362;
        uint64_t v68 = v21;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", (uint8_t *)&v67, 0xCu);
      }
    }
  }

  -[SCATElementNavigationController _stopWaitingForFetchAfterTemporaryPause]( self,  "_stopWaitingForFetchAfterTemporaryPause");
  if (!-[SCATElementNavigationController _deferFocusToNativeFocusElementIfNeeded:]( self,  "_deferFocusToNativeFocusElementIfNeeded:",  v9))
  {
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController _firstKeyboardFocusContext](self, "_firstKeyboardFocusContext"));
    if (v22
      && -[SCATElementNavigationController shouldScanKeyboardOnAppearance](self, "shouldScanKeyboardOnAppearance"))
    {
      os_log_type_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
      unsigned __int8 v24 = [v23 ignoreLogging];

      if ((v24 & 1) == 0)
      {
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        uint64_t v27 = AXLoggerForFacility(v25, v26);
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);

        os_log_type_t v29 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = AXColorizeFormatLog(3LL, @"Found keyboard and needed to scan it");
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          uint64_t v32 = _AXStringForArgs(v31);
          unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v28, v29))
          {
            int v67 = 138543362;
            uint64_t v68 = v33;
            _os_log_impl((void *)&_mh_execute_header, v28, v29, "%{public}@", (uint8_t *)&v67, 0xCu);
          }
        }
      }

      [v9 beginScanningWithFocusContext:v22];
      -[SCATElementNavigationController setShouldScanKeyboardOnAppearance:]( self,  "setShouldScanKeyboardOnAppearance:",  0LL);
    }

    else
    {

      if (-[SCATElementNavigationController shouldRescanFromTopAfterFetch](self, "shouldRescanFromTopAfterFetch"))
      {
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCElementNav sharedInstance]( &OBJC_CLASS___AXSubsystemSCElementNav,  "sharedInstance"));
        unsigned __int8 v35 = [v34 ignoreLogging];

        if ((v35 & 1) == 0)
        {
          os_log_type_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
          uint64_t v38 = AXLoggerForFacility(v36, v37);
          uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);

          os_log_type_t v40 = AXOSLogLevelFromAXLogLevel(3LL);
          if (os_log_type_enabled(v39, v40))
          {
            uint64_t v41 = AXColorizeFormatLog(3LL, @"Needed to scan from top after fetch");
            v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
            uint64_t v43 = _AXStringForArgs(v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v39, v40))
            {
              int v67 = 138543362;
              uint64_t v68 = v44;
              _os_log_impl((void *)&_mh_execute_header, v39, v40, "%{public}@", (uint8_t *)&v67, 0xCu);
            }
          }
        }

        [v9 beginScanningWithFocusContext:0];
      }

      else if (v7 || -[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled"))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCElementNav sharedInstance]( &OBJC_CLASS___AXSubsystemSCElementNav,  "sharedInstance"));
        unsigned __int8 v46 = [v45 ignoreLogging];

        if ((v46 & 1) == 0)
        {
          unsigned __int8 v47 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
          uint64_t v49 = AXLoggerForFacility(v47, v48);
          uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);

          os_log_type_t v51 = AXOSLogLevelFromAXLogLevel(3LL);
          if (os_log_type_enabled(v50, v51))
          {
            uint64_t v52 = AXColorizeFormatLog(3LL, @"Will attempt to restore focus context");
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
            uint64_t v54 = _AXStringForArgs(v53);
            uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v50, v51))
            {
              int v67 = 138543362;
              uint64_t v68 = v55;
              _os_log_impl((void *)&_mh_execute_header, v50, v51, "%{public}@", (uint8_t *)&v67, 0xCu);
            }
          }
        }

        -[SCATElementNavigationController _attemptToRestoreFocusContext:scannerManager:foundNewElements:]( self,  "_attemptToRestoreFocusContext:scannerManager:foundNewElements:",  v10,  v9,  v7);
      }

      else if (-[SCATElementNavigationController shouldRescanAfterFetch](self, "shouldRescanAfterFetch"))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCElementNav sharedInstance]( &OBJC_CLASS___AXSubsystemSCElementNav,  "sharedInstance"));
        unsigned __int8 v57 = [v56 ignoreLogging];

        if ((v57 & 1) == 0)
        {
          unsigned __int8 v58 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
          uint64_t v60 = AXLoggerForFacility(v58, v59);
          uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);

          os_log_type_t v62 = AXOSLogLevelFromAXLogLevel(3LL);
          if (os_log_type_enabled(v61, v62))
          {
            uint64_t v63 = AXColorizeFormatLog(3LL, @"Needed to rescan after fetch");
            v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
            uint64_t v65 = _AXStringForArgs(v64);
            v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
            if (os_log_type_enabled(v61, v62))
            {
              int v67 = 138543362;
              uint64_t v68 = v66;
              _os_log_impl((void *)&_mh_execute_header, v61, v62, "%{public}@", (uint8_t *)&v67, 0xCu);
            }
          }
        }

        [v9 resumeScanning];
      }
    }
  }

  -[SCATElementNavigationController _resetFetchFlags](self, "_resetFetchFlags");
}

- (id)_firstKeyboardFocusContext
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstKeyboardItem]);

  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v4,  self,  0LL,  0LL));
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (BOOL)_isKeyboardContainerElement:(id)a3 allowKeyboardContainerItself:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled"))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 keyboardContainer]);
    unsigned int v8 = v7 != 0LL;
  }

  else
  {
    unsigned int v8 = [v6 scatIsKeyboardKey];
  }

  unsigned int v9 = [v6 isGroup] ^ 1;
  LOBYTE(v10) = v9 & v8;
  if ((v9 & 1) == 0 && v8) {
    unsigned int v10 = [v6 isKeyboardContainer] ^ 1 | v4;
  }

  return v10;
}

- (BOOL)_isScanningKeyboardContainer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 element]);
  unsigned int v6 = [v4 selectBehavior];

  LOBYTE(self) = -[SCATElementNavigationController _isKeyboardContainerElement:allowKeyboardContainerItself:]( self,  "_isKeyboardContainerElement:allowKeyboardContainerItself:",  v5,  v6 == 4);
  return (char)self;
}

- (BOOL)_didFocusLastOnKeyboardElement
{
  unsigned int v3 = -[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController keyboardIndexPath](self, "keyboardIndexPath"));
    if (v4)
    {
      BOOL v5 = 1;
LABEL_10:

      return v5;
    }

    if (-[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled"))
    {
      id v4 = 0LL;
      BOOL v5 = 0;
      goto LABEL_10;
    }
  }

  else if (-[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled"))
  {
    return 0;
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController keyboardKeyCenterPoint](self, "keyboardKeyCenterPoint"));
  BOOL v5 = v6 != 0LL;

  if (v3)
  {
    id v4 = 0LL;
    goto LABEL_10;
  }

  return v5;
}

- (id)_indexPathForKeyboardElement:(id)a3
{
  id v4 = a3;
  if ([v4 isGroup] && objc_msgSend(v4, "isKeyboardContainer"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](&OBJC_CLASS___NSIndexPath, "indexPathWithIndex:", 0LL));
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 parentGroup]);
    BOOL v7 = v6;
    if (v6 && (id v8 = [v6 indexOfObject:v4], v8 != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      id v9 = v8;
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController _indexPathForKeyboardElement:]( self,  "_indexPathForKeyboardElement:",  v7));
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v10 indexPathByAddingIndex:v9]);
    }

    else
    {
      BOOL v5 = 0LL;
    }
  }

  return v5;
}

- (id)_keyboardElementForIndexPath:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementNavigationController.m",  857LL,  "-[SCATElementNavigationController _keyboardElementForIndexPath:]",  @"Should not have tried to get the keyboard element at a nil index path");
  }
  if ([v4 length] == (id)1)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rootKeyboardGroup]);
LABEL_9:

    goto LABEL_10;
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 indexPathByRemovingLastIndex]);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController _keyboardElementForIndexPath:]( self,  "_keyboardElementForIndexPath:",  v7));

  if ([v6 isGroup])
  {
    id v5 = v6;
    id v8 = objc_msgSend(v4, "indexAtPosition:", (char *)objc_msgSend(v4, "length") - 1);
    if (v8 >= [v5 count])
    {
      unsigned int v6 = v5;
    }

    else
    {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v8]);
    }

    goto LABEL_9;
  }

- (void)_trackLastFocusedKeyboardItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 element]);
  if (!-[SCATElementNavigationController _isScanningKeyboardContainer:](self, "_isScanningKeyboardContainer:", v4))
  {
    id v9 = 0LL;
    goto LABEL_9;
  }

  if (!-[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled"))
  {
    if (([v5 scatIsAXElement] & 1) == 0)
    {
      uint64_t v27 = v5;
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATElementNavigationController.m",  893LL,  "-[SCATElementNavigationController _trackLastFocusedKeyboardItem:]",  @"For now we shouldn't have any keys that are not AXElements.  If we do, we'll need to make a scatCenterPoint property.  Key was %@");
    }

    objc_msgSend(v5, "centerPoint", v27);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    unsigned __int8 v11 = [v10 ignoreLogging];

    if ((v11 & 1) == 0)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      uint64_t v23 = AXLoggerForFacility(v21, v22);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);

      os_log_type_t v24 = AXOSLogLevelFromAXLogLevel(3LL);
      if (!os_log_type_enabled(v15, v24))
      {
        unsigned int v6 = 0LL;
        goto LABEL_21;
      }

      uint64_t v25 = AXColorizeFormatLog(3LL, @"Keyboard key center point was %{public}@");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v25);
      uint64_t v27 = v9;
      uint64_t v26 = _AXStringForArgs(v18);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v15, v24))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, v15, v24, "%{public}@", buf, 0xCu);
      }

      unsigned int v6 = 0LL;
      goto LABEL_18;
    }

- (id)_replacementForLastFocusedKeyboardItem
{
  if (-[SCATElementNavigationController isGroupingEnabled](self, "isGroupingEnabled"))
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController keyboardIndexPath](self, "keyboardIndexPath"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController _keyboardElementForIndexPath:]( self,  "_keyboardElementForIndexPath:",  v3));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController keyboardKeyCenterPoint](self, "keyboardKeyCenterPoint"));
    [v6 CGPointValue];
    id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "elementAtPoint:"));

    if (([v4 scatIsKeyboardKey] & 1) == 0)
    {

      goto LABEL_11;
    }
  }

  if (!v4)
  {
LABEL_11:
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController _firstKeyboardFocusContext](self, "_firstKeyboardFocusContext"));
    return v7;
  }

  if (([v4 isGroup] & 1) == 0
    && (-[SCATElementNavigationController keyboardSelectBehavior](self, "keyboardSelectBehavior") == 3
     || -[SCATElementNavigationController keyboardSelectBehavior](self, "keyboardSelectBehavior") == 4))
  {
    -[SCATElementNavigationController setKeyboardSelectBehavior:](self, "setKeyboardSelectBehavior:", 0LL);
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v4,  self,  -[SCATElementNavigationController keyboardSelectBehavior](self, "keyboardSelectBehavior"),  0LL));

  return v7;
}

- (void)scannerManager:(id)a3 didActivateElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[SCATElementNavigationController _isKeyboardContainerElement:allowKeyboardContainerItself:]( self,  "_isKeyboardContainerElement:allowKeyboardContainerItself:",  v7,  0LL))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController nextFocusContextAfterActivatingKeyboardElement:]( self,  "nextFocusContextAfterActivatingKeyboardElement:",  v7));
    [v6 beginScanningWithFocusContext:v8];
LABEL_3:

    goto LABEL_23;
  }

  id v9 = [v7 scatActivateBehavior];
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v11 = [v10 ignoreLogging];

  if (v9)
  {
    if ((v11 & 1) != 0) {
      goto LABEL_23;
    }
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v14 = AXLoggerForFacility(v12, v13);
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(v14);

    os_log_type_t v15 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled((os_log_t)v8, v15))
    {
      uint64_t v16 = AXColorizeFormatLog(3LL, @"After activating %{public}@, repeating scan");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if ((objc_opt_respondsToSelector(v7, "elemLog") & 1) != 0) {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v7 elemLog]);
      }
      else {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v7 description]);
      }
      uint64_t v27 = (void *)v18;
      uint64_t v28 = _AXStringForArgs(v17);
      os_log_type_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

      if (os_log_type_enabled((os_log_t)v8, v15))
      {
        *(_DWORD *)buf = 138543362;
        unsigned __int8 v35 = v29;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, v15, "%{public}@", buf, 0xCu);
      }
    }

    goto LABEL_3;
  }

  if ((v11 & 1) == 0)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v21 = AXLoggerForFacility(v19, v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);

    os_log_type_t v23 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = AXColorizeFormatLog(3LL, @"After activating %{public}@, starting from the beginning again");
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if ((objc_opt_respondsToSelector(v7, "elemLog") & 1) != 0) {
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v7 elemLog]);
      }
      else {
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v7 description]);
      }
      uint64_t v30 = (void *)v26;
      uint64_t v33 = v26;
      uint64_t v31 = _AXStringForArgs(v25);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 138543362;
        unsigned __int8 v35 = v32;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%{public}@", buf, 0xCu);
      }
    }
  }

  objc_msgSend(v6, "beginScanningWithFocusContext:", 0, v33);
LABEL_23:
}

- (id)nextFocusContextAfterDismissingMenuForElement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController axManager](self, "axManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scannerElementMatchingElement:v4]);

  if (v6)
  {
    id v7 = v6;

    id v4 = v7;
  }

  if (-[SCATElementNavigationController _isKeyboardContainerElement:allowKeyboardContainerItself:]( self,  "_isKeyboardContainerElement:allowKeyboardContainerItself:",  v4,  0LL))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATElementNavigationController nextFocusContextAfterActivatingKeyboardElement:]( self,  "nextFocusContextAfterActivatingKeyboardElement:",  v4));
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 menu]);
    unsigned int v11 = [v10 didActivateElement];

    if (v11)
    {
      if ([v4 scatActivateBehavior] == (id)1) {
        unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v4,  self,  0LL,  0LL));
      }
      else {
        unsigned __int8 v8 = 0LL;
      }
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
      unsigned __int8 v13 = [v12 ignoreLogging];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        uint64_t v16 = AXLoggerForFacility(v14, v15);
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

        os_log_type_t v18 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = AXColorizeFormatLog( 3LL,  @"Did activate element %{public}@ in menu before it dismissed.  Repeat scan? %i");
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          if ((objc_opt_respondsToSelector(v4, "elemLog") & 1) != 0) {
            uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 elemLog]);
          }
          else {
            uint64_t v21 = objc_claimAutoreleasedReturnValue([v4 description]);
          }
          uint64_t v25 = (void *)v21;
          [v4 scatActivateBehavior];
          uint64_t v22 = _AXStringForArgs(v20);
          os_log_type_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

          if (os_log_type_enabled(v17, v18))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v27 = v23;
            _os_log_impl((void *)&_mh_execute_header, v17, v18, "%{public}@", buf, 0xCu);
          }
        }
      }
    }

    else
    {
      unsigned __int8 v8 = 0LL;
    }
  }

  return v8;
}

- (id)nextFocusContextAfterActivatingKeyboardElement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v6 = [v5 switchControlRestartScanningAtCurrentKey];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v4,  self,  0LL,  0LL));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController _firstKeyboardFocusContext](self, "_firstKeyboardFocusContext"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    int v9 = [v8 ignoreLogging];

    if ((v9 & 1) == 0)
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      uint64_t v12 = AXLoggerForFacility(v10, v11);
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

      os_log_type_t v14 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = AXColorizeFormatLog( 3LL,  @"After activating %{public}@, beginning with first keyboard context %{public}@");
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if ((objc_opt_respondsToSelector(v4, "elemLog") & 1) != 0) {
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 elemLog]);
        }
        else {
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 description]);
        }
        uint64_t v21 = (void *)v17;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 elemLog]);
        uint64_t v18 = _AXStringForArgs(v16);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (os_log_type_enabled(v13, v14))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v24 = v19;
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}@", buf, 0xCu);
        }
      }
    }
  }

  return v7;
}

- (id)focusContextAfterDrillOutOnGroup:(id)a3
{
  id v4 = a3;
  if ([v4 isKeyboardContainer]
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 elementCommunity]), v5, v5))
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATElementNavigationController firstElementWithOptions:](self, "firstElementWithOptions:", 0LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v6,  self,  0LL,  0LL));
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___SCATElementNavigationController;
    id v8 = -[SCATElementManager focusContextAfterDrillOutOnGroup:](&v10, "focusContextAfterDrillOutOnGroup:", v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (SCATElementNavigationControllerDelegate)delegate
{
  return (SCATElementNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCATFocusContext)currentFocusContext
{
  return self->_currentFocusContext;
}

- (BOOL)shouldRescanAfterFetch
{
  return self->_shouldRescanAfterFetch;
}

- (void)setShouldRescanAfterFetch:(BOOL)a3
{
  self->_shouldRescanAfterFetch = a3;
}

- (BOOL)shouldRescanFromTopAfterFetch
{
  return self->_shouldRescanFromTopAfterFetch;
}

- (void)setShouldRescanFromTopAfterFetch:(BOOL)a3
{
  self->_shouldRescanFromTopAfterFetch = a3;
}

- (NSValue)keyboardKeyCenterPoint
{
  return self->_keyboardKeyCenterPoint;
}

- (void)setKeyboardKeyCenterPoint:(id)a3
{
}

- (NSIndexPath)keyboardIndexPath
{
  return self->_keyboardIndexPath;
}

- (void)setKeyboardIndexPath:(id)a3
{
}

- (int)keyboardSelectBehavior
{
  return self->_keyboardSelectBehavior;
}

- (void)setKeyboardSelectBehavior:(int)a3
{
  self->_keyboardSelectBehavior = a3;
}

- (AXElement)lastScannedElementCommunity
{
  return self->_lastScannedElementCommunity;
}

- (void)setLastScannedElementCommunity:(id)a3
{
}

- (NSString)startingSceneIdentifier
{
  return self->_startingSceneIdentifier;
}

- (void)setStartingSceneIdentifier:(id)a3
{
}

- (AXElement)firstResponder
{
  return self->_firstResponder;
}

- (void)setFirstResponder:(id)a3
{
}

- (BOOL)shouldScanKeyboardOnAppearance
{
  return self->_shouldScanKeyboardOnAppearance;
}

- (void)setShouldScanKeyboardOnAppearance:(BOOL)a3
{
  self->_shouldScanKeyboardOnAppearance = a3;
}

- (SCATMenuOpeningAuxiliaryElementManager)menuOpeningAuxElementManager
{
  return self->_menuOpeningAuxElementManager;
}

- (void)setMenuOpeningAuxElementManager:(id)a3
{
}

- (BOOL)isMenuOpeningElementEnabled
{
  return self->_menuOpeningElementEnabled;
}

- (SCATVisualScrollersAuxiliaryElementManager)topLevelVisualScrollersAuxElementManager
{
  return self->_topLevelVisualScrollersAuxElementManager;
}

- (void)setTopLevelVisualScrollersAuxElementManager:(id)a3
{
}

- (BOOL)areTopLevelVisualScrollersEnabled
{
  return self->_topLevelVisualScrollersEnabled;
}

- (SCATVisualScrollersAuxiliaryElementManager)groupVisualScrollersAuxElementManager
{
  return self->_groupVisualScrollersAuxElementManager;
}

- (void)setGroupVisualScrollersAuxElementManager:(id)a3
{
}

- (BOOL)areGroupVisualScrollersEnabled
{
  return self->_groupVisualScrollersEnabled;
}

- (void).cxx_destruct
{
}

@end