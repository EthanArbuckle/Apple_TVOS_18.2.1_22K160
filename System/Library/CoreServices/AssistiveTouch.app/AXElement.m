@interface AXElement
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
- (BOOL)scatIsMemberOfGroup;
- (BOOL)scatIsOnScreen;
- (BOOL)scatPathIsInSceneReferenceSpace;
- (BOOL)scatShouldActivateDirectly;
- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement;
- (BOOL)scatShouldSuppressAudioOutput;
- (BOOL)scatSupportsAction:(int)a3;
- (BOOL)scatUpdatesMenu;
- (CGPath)scatPath;
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
- (SCATElementAutoscrolling)scatAutoscrollTarget;
- (id)elemLog;
- (id)scatSupportedGestures;
- (id)windowSceneIdentifier;
- (int64_t)scatActivateBehavior;
- (void)scatUpdateValue;
- (void)setScatAssistiveTechFocused:(BOOL)a3;
- (void)setScatAutoscrollTarget:(id)a3;
@end

@implementation AXElement

- (id)elemLog
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement label](self, "label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement uiElement](self, "uiElement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringWithAXAttribute:2072]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v3, v5));

  return v6;
}

- (CGPoint)scatScreenPointForOperations
{
  double v4 = v3;
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  objc_msgSend(v7, "convertPoint:fromContextId:", -[AXElement windowContextId](self, "windowContextId"), v4, v6);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  id v12 = -[AXElement scatFrame](self, "scatFrame");
  v23.origin.x = sub_10002ADFC((uint64_t)v12, v13, v14, v15, v16, v17);
  v22.x = v9;
  v22.y = v11;
  BOOL v18 = CGRectContainsPoint(v23, v22);
  if (v18)
  {
    double Center = v9;
    double v20 = v11;
  }

  else
  {
    double Center = AX_CGRectGetCenter(v18);
  }

  result.y = v20;
  result.x = Center;
  return result;
}

- (BOOL)scatPathIsInSceneReferenceSpace
{
  return 1;
}

- (CGPath)scatPath
{
  return (CGPath *)-[AXElement path](self, "path");
}

- (CGRect)scatTextCursorFrame
{
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)scatIsAXElement
{
  return 1;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 0;
}

- (BOOL)scatShouldAllowDeferFocusToNativeFocusedElement
{
  return 1;
}

- (BOOL)scatShouldActivateDirectly
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v3 switchControlShouldAlwaysActivateKeyboardKeys]
    && [v3 switchControlTapBehavior] != (id)2
    && (-[AXElement scatIsKeyboardKey](self, "scatIsKeyboardKey")
     || (uint64_t v6 = objc_claimAutoreleasedReturnValue(-[AXElement keyboardContainer](self, "keyboardContainer"))) != 0
     && (v7 = (void *)v6,
         unsigned __int8 v8 = -[AXElement hasAnyTraits:](self, "hasAnyTraits:", kAXAdjustableTrait),
         v7,
         (v8 & 1) == 0)))
  {
    if (-[AXElement scatIsAXElement](self, "scatIsAXElement"))
    {
      CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement uiElement](self, "uiElement"));
      unsigned __int8 v10 = [v9 BOOLWithAXAttribute:12006];

      char v4 = v10 ^ 1;
    }

    else
    {
      char v4 = 1;
    }
  }

  else
  {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)scatActivateBehavior
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = [v3 switchControlScanAfterTapLocation];

  if (v4 == (id)1) {
    return 1LL;
  }
  else {
    return (int64_t)-[AXElement scannerActivateBehavior](self, "scannerActivateBehavior");
  }
}

- (NSString)scatSpeakableDescription
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement label](self, "label"));
  unint64_t v4 = (unint64_t)-[AXElement traits](self, "traits");
  unint64_t v5 = kAXToggleTrait & ~v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement value](self, "value"));
  v7 = v6;
  if (v5)
  {
    uint64_t v9 = __AXStringForVariables(v3);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:@"1"])
  {
    unsigned __int8 v8 = @"element.on.state";
  }

  else if ([v7 isEqualToString:@"0"])
  {
    unsigned __int8 v8 = @"element.off.state";
  }

  else
  {
    if (![v7 isEqualToString:@"2"])
    {
      uint64_t v12 = 0LL;
      goto LABEL_10;
    }

    unsigned __int8 v8 = @"element.mixed.state";
  }

  id v11 = sub_10002B014(v8);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
LABEL_10:
  uint64_t v13 = __AXStringForVariables(v3);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(v13);

  double v3 = v7;
  v7 = (void *)v12;
LABEL_11:

  CGFloat v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement customContent](self, "customContent"));
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v63 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        if ([v19 importance] == (id)1)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue([v19 value]);
          uint64_t v20 = __AXStringForVariables(v10);
          uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);

          unsigned __int8 v10 = (void *)v21;
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }

    while (v16);
  }

  CGPoint v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v23 = [v22 assistiveTouchScannerSpeechShouldSpeakTraits];

  if (v23)
  {
    unint64_t v24 = (unint64_t)-[AXElement traits](self, "traits");
    if ((kAXSelectedTrait & ~v24) == 0)
    {
      id v25 = sub_10002B014(@"element.selected");
      v55 = (void *)objc_claimAutoreleasedReturnValue(v25);
      uint64_t v26 = __AXStringForVariables(v10);
      uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

      unsigned __int8 v10 = (void *)v27;
    }

    unint64_t v28 = (unint64_t)-[AXElement traits](self, "traits");
    if ((kAXHeaderTrait & ~v28) == 0)
    {
      id v29 = sub_10002B014(@"element.heading");
      v56 = (void *)objc_claimAutoreleasedReturnValue(v29);
      uint64_t v30 = __AXStringForVariables(v10);
      uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);

      unsigned __int8 v10 = (void *)v31;
    }

    unint64_t v32 = (unint64_t)-[AXElement traits](self, "traits");
    if ((kAXButtonTrait & ~v32) == 0)
    {
      unint64_t v33 = (unint64_t)-[AXElement traits](self, "traits");
      if ((kAXKeyboardKeyTrait & ~v33) != 0)
      {
        id v34 = sub_10002B014(@"element.button");
        v57 = (void *)objc_claimAutoreleasedReturnValue(v34);
        uint64_t v35 = __AXStringForVariables(v10);
        uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);

        unsigned __int8 v10 = (void *)v36;
      }
    }

    unint64_t v37 = (unint64_t)-[AXElement traits](self, "traits");
    if ((kAXLinkTrait & ~v37) == 0)
    {
      id v38 = sub_10002B014(@"element.link");
      v58 = (void *)objc_claimAutoreleasedReturnValue(v38);
      uint64_t v39 = __AXStringForVariables(v10);
      uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);

      unsigned __int8 v10 = (void *)v40;
    }

    unint64_t v41 = (unint64_t)-[AXElement traits](self, "traits");
    if ((kAXImageTrait & ~v41) == 0)
    {
      id v42 = sub_10002B014(@"element.image");
      v59 = (void *)objc_claimAutoreleasedReturnValue(v42);
      uint64_t v43 = __AXStringForVariables(v10);
      uint64_t v44 = objc_claimAutoreleasedReturnValue(v43);

      unsigned __int8 v10 = (void *)v44;
    }

    unint64_t v45 = (unint64_t)-[AXElement traits](self, "traits");
    if ((kAXNotEnabledTrait & ~v45) == 0)
    {
      id v46 = sub_10002B014(@"element.dimmed");
      v60 = (void *)objc_claimAutoreleasedReturnValue(v46);
      uint64_t v47 = __AXStringForVariables(v10);
      uint64_t v48 = objc_claimAutoreleasedReturnValue(v47);

      unsigned __int8 v10 = (void *)v48;
    }

    unint64_t v49 = (unint64_t)-[AXElement traits](self, "traits");
    if ((kAXAdjustableTrait & ~v49) == 0)
    {
      id v50 = sub_10002B014(@"element.adjustable");
      v61 = (void *)objc_claimAutoreleasedReturnValue(v50);
      uint64_t v51 = __AXStringForVariables(v10);
      uint64_t v52 = objc_claimAutoreleasedReturnValue(v51);

      unsigned __int8 v10 = (void *)v52;
    }
  }

  return (NSString *)v10;
}

- (BOOL)scatShouldSuppressAudioOutput
{
  return 0;
}

- (NSNumber)scatOverrideCursorTheme
{
  return 0LL;
}

- (BOOL)scatAssistiveTechFocused
{
  return -[AXElement assistiveTechFocused](self, "assistiveTechFocused");
}

- (void)setScatAssistiveTechFocused:(BOOL)a3
{
}

- (BOOL)scatCanShowAlternateKeys
{
  return -[AXElement hasVariantKeys](self, "hasVariantKeys");
}

- (NSArray)scatAlternateKeys
{
  return (NSArray *)-[AXElement variantKeys](self, "variantKeys");
}

- (BOOL)scatCanScrollInAtLeastOneDirection
{
  return -[AXElement canScrollInAtLeastOneDirection](self, "canScrollInAtLeastOneDirection");
}

- (BOOL)scatSupportsAction:(int)a3
{
  BOOL result = -[AXElement supportsAction:](self, "supportsAction:");
  if (a3 == 2010 && !result)
  {
    unint64_t v6 = (unint64_t)-[AXElement traits](self, "traits");
    uint64_t v7 = kAXAdjustableTrait;
    unint64_t v8 = kAXAdjustableTrait & v6;
    if ((kAXIsEditingTrait & ~v6) != 0)
    {
      char v12 = 1;
    }

    else if ((kAXWebContentTrait & ~v6) != 0)
    {
      char v12 = 0;
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement application](self, "application"));
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uiElement]);
      unsigned __int8 v11 = [v10 BOOLWithAXAttribute:3005];

      char v12 = v11 ^ 1;
    }

    if (v8 == v7) {
      return 0;
    }
    else {
      return v12;
    }
  }

  return result;
}

- (id)scatSupportedGestures
{
  return -[AXElement supportedGestures](self, "supportedGestures");
}

- (NSArray)scatCustomActions
{
  return (NSArray *)-[AXElement customActions](self, "customActions");
}

- (NSArray)scatCustomHardwareActions
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement uiElement](self, "uiElement"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectWithAXAttribute:95259 parameter:@"HardwareGestureActions"]);

  *(void *)&double v5 = objc_opt_class(&OBJC_CLASS___NSString, v4).n128_u64[0];
  uint64_t v11 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedArrayOfObjectsOfClass:fromData:error:",  v6,  v3,  &v11,  v5));
  unint64_t v8 = v7;
  if (v11) {
    id v9 = &__NSArray0__struct;
  }
  else {
    id v9 = v7;
  }

  return (NSArray *)v9;
}

- (NSArray)scatDrags
{
  return (NSArray *)-[AXElement drags](self, "drags");
}

- (NSArray)scatDrops
{
  return (NSArray *)-[AXElement drops](self, "drops");
}

- (BOOL)scatIsMemberOfGroup
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement parentGroup](self, "parentGroup"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)scatIsAuxiliaryElement
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement scatAuxiliaryElementManager](self, "scatAuxiliaryElementManager"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (SCATAuxiliaryElementManager)scatAuxiliaryElementManager
{
  return 0LL;
}

- (BOOL)scatHidesGroupCursorWhenFocused
{
  return 0;
}

- (BOOL)scatIsOnScreen
{
  double MinX = CGRectGetMinX(v16);
  -[AXElement frame](self, "frame");
  double MaxX = CGRectGetMaxX(v17);
  -[AXElement frame](self, "frame");
  double MinY = CGRectGetMinY(v18);
  -[AXElement frame](self, "frame");
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
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement uiElement](self, "uiElement"));
  unsigned __int8 v3 = [v2 BOOLWithAXAttribute:2189];

  return v3;
}

- (id)windowSceneIdentifier
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement uiElement](self, "uiElement"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringWithAXAttribute:3056]);

  return v3;
}

- (BOOL)isHandUI
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement windowSceneIdentifier](self, "windowSceneIdentifier"));
  unsigned __int8 v3 = [v2 hasPrefix:@"com.apple.RealityHUD.HandScene"];

  return v3;
}

- (BOOL)isVisible
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement uiElement](self, "uiElement"));
  [v3 updateCache:2025];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement uiElement](self, "uiElement"));
  LOBYTE(v3) = [v4 BOOLWithAXAttribute:2025];

  return (char)v3;
}

- (SCATElementAutoscrolling)scatAutoscrollTarget
{
  return (SCATElementAutoscrolling *)-[AXElement autoscrollTarget](self, "autoscrollTarget");
}

- (void)setScatAutoscrollTarget:(id)a3
{
  id v6 = a3;
  if (!v6 || (objc_opt_class(&OBJC_CLASS___AXElement, v4), (objc_opt_isKindOfClass(v6, v5) & 1) != 0)) {
    -[AXElement setAutoscrollTarget:](self, "setAutoscrollTarget:", v6);
  }
}

- (void)scatUpdateValue
{
}

@end