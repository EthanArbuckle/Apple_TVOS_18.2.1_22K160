@interface XADInspectorManager
+ (id)sharedManager;
- (AXAuditElement)_mostRecentElementFetchedVisionOS;
- (AXElement)_currentElement;
- (AXElement)appMatchingTargetPid;
- (AXUpdateElementVisualsCoalescer)_elementVisualsCoalescer;
- (BOOL)_elementTokenIsSumulatorToken:(id)a3;
- (BOOL)_initializeAXObserverIfNeeded;
- (BOOL)_registeredForNotifications;
- (BOOL)allowDeveloperActionsOnElement:(id)a3;
- (BOOL)showVisuals;
- (CGPoint)_lastPoint;
- (NSDate)lastFetchDateForDeviceCoodinate;
- (NSMutableArray)_focusedElementHistory;
- (OS_dispatch_queue)dispatchQueue;
- (XADInspectorManager)init;
- (XADInspectorManagerDelegate)delegate;
- (__AXObserver)_axEventObserver;
- (id)_AXAuditElementFromAXElement:(id)a3;
- (id)_accessibilityNotificationsToObserve;
- (id)_actionSection;
- (id)_auditInspectorFocuseObject;
- (id)_basicSection;
- (id)_developerOnlyAttributes;
- (id)_elementDataFromSimulatorToken:(id)a3;
- (id)_elementSection;
- (id)_generateSpokenDescriptionForElement:(id)a3;
- (id)_hierarchySection;
- (id)_humanReadableStringForAction:(int)a3;
- (id)_inspectorSections;
- (id)_internalAttributes;
- (id)_nextElementNavigationInDirection:(int64_t)a3 forElement:(id)a4;
- (id)addAttribute:(id)a3 toSection:(id)a4 withPrefix:(id)a5 performsAction:(BOOL)a6 settable:(BOOL)a7 humanReadable:(id)a8 valueType:(int64_t)a9 overrideIsInternalWithValue:(id)a10;
- (id)fetchElementAtNormalizedDeviceCoordinate:(CGPoint)a3;
- (id)fetchSpecialElement:(int64_t)a3;
- (id)firstElementInHierarchy:(id)a3;
- (id)frontmostAppForTargetPid;
- (id)lastElementInHierarchy:(id)a3;
- (int)targetPid;
- (unint64_t)monitoredEventType;
- (void)_addElementToHistory:(id)a3;
- (void)_informDelegateOfInspectorFocus;
- (void)_initializeElementVisualsCoalescer;
- (void)_registerForAXNotifications:(BOOL)a3;
- (void)_registerForNotificationsIfNecessary:(BOOL)a3;
- (void)_setCurrentElement:(id)a3;
- (void)_updateElementHighlight;
- (void)connectionInterrupted;
- (void)deviceDidGetTargeted;
- (void)element:(id)a3 performAction:(id)a4 withValue:(id)a5 completion:(id)a6;
- (void)element:(id)a3 valueForAttribute:(id)a4 completion:(id)a5;
- (void)element:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5 completion:(id)a6;
- (void)focusOnAXElement:(id)a3;
- (void)focusOnAXElement:(id)a3 scrollToVisible:(BOOL)a4;
- (void)focusOnElement:(id)a3;
- (void)focusOnElementAtPoint:(CGPoint)a3;
- (void)hideVisualsSynchronously;
- (void)lockOnCurrentElement;
- (void)moveInDirection:(unint64_t)a3 allowMovingToContainers:(BOOL)a4 allowMoveToNonAXElements:(BOOL)a5;
- (void)previewOnElement:(id)a3;
- (void)setAppMatchingTargetPid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLastFetchDateForDeviceCoodinate:(id)a3;
- (void)setMonitoredEventType:(unint64_t)a3;
- (void)setShowVisuals:(BOOL)a3;
- (void)setTargetPid:(int)a3;
- (void)set_axEventObserver:(__AXObserver *)a3;
- (void)set_elementVisualsCoalescer:(id)a3;
- (void)set_focusedElementHistory:(id)a3;
- (void)set_lastPoint:(CGPoint)a3;
- (void)set_mostRecentElementFetchedVisionOS:(id)a3;
- (void)set_registeredForNotifications:(BOOL)a3;
- (void)updateAttributesIfElementIsValid;
@end

@implementation XADInspectorManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002B28;
  block[3] = &unk_100014868;
  block[4] = a1;
  if (qword_10001A2B8 != -1) {
    dispatch_once(&qword_10001A2B8, block);
  }
  return (id)qword_10001A2B0;
}

- (XADInspectorManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___XADInspectorManager;
  v2 = -[XADInspectorManager init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(off_10001A0B0, 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    -[XADInspectorManager _initializeElementVisualsCoalescer](v2, "_initializeElementVisualsCoalescer");
  }

  return v2;
}

- (void)lockOnCurrentElement
{
}

- (void)setMonitoredEventType:(unint64_t)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[XADDisplayManager sharedManager](&OBJC_CLASS___XADDisplayManager, "sharedManager"));
  self->_monitoredEventType = a3;
  if (a3 == 2 || a3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[XADEventManager sharedManager](&OBJC_CLASS___XADEventManager, "sharedManager"));
    uint64_t v6 = 1LL;
    [v5 setSnarfingEvents:1];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[XADEventManager sharedManager](&OBJC_CLASS___XADEventManager, "sharedManager"));
    [v7 setStopSnarfingOnTouchUp:0];
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[XADEventManager sharedManager](&OBJC_CLASS___XADEventManager, "sharedManager"));
    [v7 setSnarfingEvents:0];
    uint64_t v6 = 3LL;
  }

  [v9 setCursorStyle:v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager delegate](self, "delegate"));
  [v8 inspectorManager:self inspectorMonitoredEventTypeChanged:a3];
}

- (void)hideVisualsSynchronously
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[XADDisplayManager sharedManager](&OBJC_CLASS___XADDisplayManager, "sharedManager"));
  [v2 hideVisualsSynchronously];
}

- (void)connectionInterrupted
{
}

- (void)setShowVisuals:(BOOL)a3
{
  self->_showVisuals = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager dispatchQueue](self, "dispatchQueue"));
  uint64_t v6 = v5;
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100002DE4;
    block[3] = &unk_100014890;
    block[4] = self;
    dispatch_async(v5, block);
  }

  else
  {
    dispatch_async(v5, &stru_100014948);
  }

- (id)_developerOnlyAttributes
{
  return &off_100015AA0;
}

- (id)addAttribute:(id)a3 toSection:(id)a4 withPrefix:(id)a5 performsAction:(BOOL)a6 settable:(BOOL)a7 humanReadable:(id)a8 valueType:(int64_t)a9 overrideIsInternalWithValue:(id)a10
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  if (!a10)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _internalAttributes](self, "_internalAttributes"));
    if ([v21 containsObject:v16])
    {
    }

    else
    {
      char v22 = AXAuditAttributeWithPrefixLocStringExists(v16, v18, 0LL);

      if ((v22 & 1) != 0)
      {
        uint64_t v20 = 0LL;
        goto LABEL_8;
      }
    }

    id v23 = v16;

    uint64_t v20 = 1LL;
    id v19 = v23;
    goto LABEL_8;
  }

  uint64_t v20 = (uint64_t)[a10 BOOLValue];
LABEL_8:
  v24 = (void *)objc_claimAutoreleasedReturnValue( [v17 addAttribute:v16 performsAction:v12 humanReadable:v19 settable:v11 valueType:a9 isInternal:v20]);

  return v24;
}

- (id)_internalAttributes
{
  if (qword_10001A2C0 != -1) {
    dispatch_once(&qword_10001A2C0, &stru_100014968);
  }
  return (id)qword_10001A2C8;
}

- (id)_elementSection
{
  dispatch_queue_t v3 = (void *)objc_opt_new(&OBJC_CLASS___AXAuditInspectorSection);
  uint64_t v4 = AXAuditLocString(@"Element", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setTitle:v5];

  [v3 setIdentifier:@"iOS_Element_v1"];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [&off_100015AB8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(&off_100015AB8);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"Attribute",  v10));
        uint64_t v12 = AXAuditLocString(v11, 1LL);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v14 =  -[XADInspectorManager addAttribute:toSection:withPrefix:performsAction:settable:humanReadable:valueType:overrideIsInternalWithValue:]( self,  "addAttribute:toSection:withPrefix:performsAction:settable:humanReadable:valueType:overrideIsInternalWithValue:",  v10,  v3,  @"Attribute",  0LL,  0LL,  v13,  256LL,  0LL);
      }

      id v7 = [&off_100015AB8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return v3;
}

- (id)_basicSection
{
  dispatch_queue_t v3 = (void *)objc_opt_new(&OBJC_CLASS___AXAuditInspectorSection);
  uint64_t v4 = AXAuditLocString(@"Basic", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setTitle:v5];

  [v3 setIdentifier:@"iOS_Basic_v1"];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [&off_100015AD0 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(&off_100015AD0);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"Attribute",  v10));
        uint64_t v12 = AXAuditLocString(v11, 1LL);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[XADInspectorManager addAttribute:toSection:withPrefix:performsAction:settable:humanReadable:valueType:overrideIsInternalWithValue:]( self,  "addAttribute:toSection:withPrefix:performsAction:settable:humanReadable:valueType:overrideIsIn ternalWithValue:",  v10,  v3,  @"Attribute",  0LL,  0LL,  v13,  2LL,  0LL));
      }

      id v7 = [&off_100015AD0 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return v3;
}

- (id)_hierarchySection
{
  dispatch_queue_t v3 = (void *)objc_opt_new(&OBJC_CLASS___AXAuditInspectorSection);
  uint64_t v4 = AXAuditLocString(@"Hierarchy", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setTitle:v5];

  [v3 setIdentifier:@"iOS_Hierarchy_v1"];
  uint64_t v6 = _AXHierarchyElementsAttribute;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[XADInspectorManager addAttribute:toSection:withPrefix:performsAction:settable:humanReadable:valueType:overrideIsInternalWithValue:]( self,  "addAttribute:toSection:withPrefix:performsAction:settable:humanReadable:valueType:overrideIsInternalWithValue:",  v6,  v3,  @"Attribute",  0LL,  0LL,  v7,  2LL,  0LL));

  [v8 setDisplayAsTree:1];
  return v3;
}

- (id)_humanReadableStringForAction:(int)a3
{
  else {
    dispatch_queue_t v3 = off_1000149D8[a3 - 2004];
  }
  return (id)AXAuditAttributeWithPrefixLocString(v3, @"Action");
}

- (id)_actionSection
{
  dispatch_queue_t v3 = (void *)objc_opt_new(&OBJC_CLASS___AXAuditInspectorSection);
  uint64_t v4 = AXAuditLocString(@"Actions", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setTitle:v5];

  [v3 setIdentifier:@"iOS_Actions_v1"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _currentElement](self, "_currentElement"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10000382C;
  v32[3] = &unk_100014990;
  v26 = self;
  v32[4] = self;
  id v27 = v3;
  id v33 = v27;
  id v7 = objc_retainBlock(v32);
  uint64_t v8 = (void (**)(void, uint64_t))v7;
  if (v6) {
    ((void (*)(void *, uint64_t))v7[2])(v7, 2010LL);
  }
  if (([v6 supportsAction:2004] & 1) != 0
    || ([v6 supportsAction:2005] & 1) != 0
    || (unint64_t v9 = (unint64_t)[v6 traits], (kAXAdjustableTrait & ~v9) == 0))
  {
    v8[2](v8, 2004LL);
    v8[2](v8, 2005LL);
  }

  if (([v6 supportsAction:2007] & 1) != 0
    || [v6 supportsAction:2006])
  {
    v8[2](v8, 2007LL);
    v8[2](v8, 2006LL);
  }

  if (([v6 supportsAction:2009] & 1) != 0
    || [v6 supportsAction:2008])
  {
    v8[2](v8, 2009LL);
    v8[2](v8, 2008LL);
  }

  if (([v6 supportsAction:2019] & 1) != 0
    || [v6 supportsAction:2020])
  {
    v8[2](v8, 2019LL);
    v8[2](v8, 2020LL);
  }

  v24 = v8;
  v25 = v6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 customActions]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"CustomActionShortName"]);
        if (!v16) {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"CustomActionName"]);
        }
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"CustomActionIdentifier"]);
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString, v18);
        if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"AXCustomAction-",  v17));
          id v21 =  -[XADInspectorManager addAttribute:toSection:withPrefix:performsAction:settable:humanReadable:valueType:overrideIsInternalWithValue:]( v26,  "addAttribute:toSection:withPrefix:performsAction:settable:humanReadable:valueType:overrideIsInternalWithValue:",  v20,  v27,  @"Action",  1LL,  0LL,  v16,  1LL,  &__kCFBooleanFalse);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v12);
  }

  id v22 = v27;

  return v22;
}

- (id)_inspectorSections
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _basicSection](self, "_basicSection"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _actionSection](self, "_actionSection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _elementSection](self, "_elementSection"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _hierarchySection](self, "_hierarchySection"));
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 4LL));

  return v7;
}

- (id)_AXAuditElementFromAXElement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectWithAXAttribute:5019]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditElement auditElementWithElement:identifier:]( &OBJC_CLASS___AXAuditElement,  "auditElementWithElement:identifier:",  v3,  v5));
  return v6;
}

- (id)_auditInspectorFocuseObject
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _currentElement](self, "_currentElement"));
  uint64_t v4 = (void *)objc_opt_new(&OBJC_CLASS___AXAuditInspectorFocus);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _AXAuditElementFromAXElement:](self, "_AXAuditElementFromAXElement:", v3));
  [v4 setElement:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[XADInspectorManager _generateSpokenDescriptionForElement:]( self,  "_generateSpokenDescriptionForElement:",  v3));
  [v4 setCaptionText:v6];
  [v4 setSpokenDescription:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _inspectorSections](self, "_inspectorSections"));
  [v4 setInspectorSections:v7];

  return v4;
}

- (id)_generateSpokenDescriptionForElement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 label]);
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 label]);
    [v4 addObject:v7];
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
  id v9 = [v8 length];

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
    [v4 addObject:v10];
  }

  id v11 = sub_100006390((const __AXUIElement *)[v3 elementRef], (const __CFString *)0x836);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v26;
    do
    {
      __int128 v17 = 0LL;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v17);
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString, v14);
        if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0
          && ([v18 isEqualToString:@"Static Text"] & 1) == 0)
        {
          [v4 addObject:v18];
        }

        __int128 v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v15);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 hint]);
  id v21 = [v20 length];

  if (v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 hint]);
    [v4 addObject:v22];
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", @", "));

  return v23;
}

- (void)_informDelegateOfInspectorFocus
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[XADInspectorManager delegate](self, "delegate"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _auditInspectorFocuseObject](self, "_auditInspectorFocuseObject"));
  [v4 inspectorManager:self inspectorFocusDidChange:v3];
}

- (void)_initializeElementVisualsCoalescer
{
  id v3 = objc_alloc_init(&OBJC_CLASS___AXUpdateElementVisualsCoalescer);
  -[XADInspectorManager set_elementVisualsCoalescer:](self, "set_elementVisualsCoalescer:", v3);
  -[AXUpdateElementVisualsCoalescer setThreshold:](v3, "setThreshold:", 0.2);
  -[AXUpdateElementVisualsCoalescer setProgressInterval:](v3, "setProgressInterval:", 0.01);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100003F48;
  v9[3] = &unk_1000149B8;
  objc_copyWeak(&v10, &location);
  -[AXUpdateElementVisualsCoalescer setUpdateVisualsSequenceDidBeginHandler:]( v3,  "setUpdateVisualsSequenceDidBeginHandler:",  v9);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003F74;
  v7[3] = &unk_1000149B8;
  objc_copyWeak(&v8, &location);
  -[AXUpdateElementVisualsCoalescer setUpdateVisualsSequenceInProgressHandler:]( v3,  "setUpdateVisualsSequenceInProgressHandler:",  v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100003FA0;
  v5[3] = &unk_1000149B8;
  objc_copyWeak(&v6, &location);
  -[AXUpdateElementVisualsCoalescer setUpdateVisualsSequenceDidFinishHandler:]( v3,  "setUpdateVisualsSequenceDidFinishHandler:",  v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003FCC;
  block[3] = &unk_100014890;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void)_updateElementHighlight
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[XADDisplayManager sharedManager](&OBJC_CLASS___XADDisplayManager, "sharedManager"));
  [v4 setCursorStyle:1];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _currentElement](self, "_currentElement"));
  [v4 setCursorFrameForElement:v3];
}

- (void)_addElementToHistory:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _focusedElementHistory](self, "_focusedElementHistory"));
  if (!v4)
  {
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    -[XADInspectorManager set_focusedElementHistory:](self, "set_focusedElementHistory:", v5);

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _focusedElementHistory](self, "_focusedElementHistory"));
  }

  if (v6) {
    [v4 addObject:v6];
  }
  if ((unint64_t)[v4 count] >= 0x15)
  {
    do
      [v4 removeObjectAtIndex:0];
    while ((unint64_t)[v4 count] > 0x14);
  }
}

- (void)_setCurrentElement:(id)a3
{
  id v4 = (AXElement *)a3;
  sub_100004180(self->__currentElement, 0LL);
  -[XADInspectorManager _addElementToHistory:](self, "_addElementToHistory:", v4);
  currentElement = self->__currentElement;
  self->__currentElement = v4;
  id v6 = v4;

  sub_100004180(self->__currentElement, 1LL);
}

- (BOOL)_elementTokenIsSumulatorToken:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"TokenType"]);
  unsigned __int8 v4 = [v3 isEqualToString:@"AXElementTokenSimulator"];

  return v4;
}

- (id)_elementDataFromSimulatorToken:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"ElementData"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSData, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)focusOnAXElement:(id)a3 scrollToVisible:(BOOL)a4
{
  BOOL v4 = a4;
  -[XADInspectorManager _setCurrentElement:](self, "_setCurrentElement:", a3);
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _currentElement](self, "_currentElement"));
    [v6 scrollToVisible];
  }

  -[XADInspectorManager _updateElementHighlight](self, "_updateElementHighlight");
  -[XADInspectorManager _informDelegateOfInspectorFocus](self, "_informDelegateOfInspectorFocus");
}

- (void)focusOnAXElement:(id)a3
{
  id v6 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _currentElement](self, "_currentElement"));
  unsigned __int8 v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0) {
    -[XADInspectorManager focusOnAXElement:scrollToVisible:](self, "focusOnAXElement:scrollToVisible:", v6, 1LL);
  }
}

- (void)focusOnElementAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[XADInspectorManager _lastPoint](self, "_lastPoint");
  if (x != v7 || y != v6)
  {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[AXUIElement uiElementAtCoordinate:](&OBJC_CLASS___AXUIElement, "uiElementAtCoordinate:", x, y));
    if (!-[XADInspectorManager targetPid](self, "targetPid")
      || (id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIElement uiApplicationAtCoordinate:]( AXUIElement,  "uiApplicationAtCoordinate:",  x,  y)),  v10 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager frontmostAppForTargetPid](self, "frontmostAppForTargetPid")),  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 uiElement]),  v10,  LODWORD(v10) = objc_msgSend(v9, "isEqual:", v11),  v11,  v9,  (_DWORD)v10))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _currentElement](self, "_currentElement"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uiElement]);
      unsigned __int8 v14 = [v16 isEqual:v13];

      if ((v14 & 1) == 0)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement elementWithUIElement:](&OBJC_CLASS___AXElement, "elementWithUIElement:", v16));
        -[XADInspectorManager focusOnAXElement:scrollToVisible:](self, "focusOnAXElement:scrollToVisible:", v15, 0LL);
      }
    }
  }

- (void)focusOnElement:(id)a3
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([a3 axElement]);
  -[XADInspectorManager focusOnAXElement:](self, "focusOnAXElement:", v5);

  if (a3) {
    -[XADInspectorManager _updateElementHighlight](self, "_updateElementHighlight");
  }
}

- (void)previewOnElement:(id)a3
{
  id v6 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[XADDisplayManager sharedManager](&OBJC_CLASS___XADDisplayManager, "sharedManager"));
  if (v6)
  {
    [v4 setCursorStyle:4];
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v6 axElement]);
    [v4 setCursorFrameForElement:v5];
  }

  else
  {
    -[XADInspectorManager _updateElementHighlight](self, "_updateElementHighlight");
  }
}

- (BOOL)allowDeveloperActionsOnElement:(id)a3
{
  pid_t pid = 0;
  AXError v3 = AXUIElementGetPid((AXUIElementRef)[a3 elementRef], &pid);
  BOOL result = 0;
  if (v3 == kAXErrorSuccess) {
    return AuditDoesAllowDeveloperAttributes(pid);
  }
  return result;
}

- (void)element:(id)a3 performAction:(id)a4 withValue:(id)a5 completion:(id)a6
{
  id v15 = (void (**)(void))a6;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 axElement]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 attributeName]);

  if (v10 && -[XADInspectorManager allowDeveloperActionsOnElement:](self, "allowDeveloperActionsOnElement:", v10))
  {
    if (![v11 rangeOfString:@"AXAction-"])
    {
      id v12 = (char *)[v11 length];
      if (v12 == (char *)[@"AXAction-" length] + 4)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", objc_msgSend(@"AXAction-", "length")));
        goto LABEL_10;
      }
    }

    if (![v11 rangeOfString:@"AXCustomAction-"])
    {
      id v14 = [v11 length];
      if (v14 > [@"AXCustomAction-" length])
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", objc_msgSend(@"AXCustomAction-", "length")));
        [v10 performAction:2021 withValue:v13];
LABEL_10:
      }
    }
  }

  v15[2]();
}

- (void)element:(id)a3 valueForAttribute:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 axElement]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _currentElement](self, "_currentElement"));
  unsigned __int8 v12 = [v10 isEqual:v11];

  if ((v12 & 1) != 0
    || (id v13 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _focusedElementHistory](self, "_focusedElementHistory")),
        unsigned int v14 = [v13 containsObject:v10],
        v13,
        !v14))
  {
    id v15 = (const __AXUIElement *)[v10 elementRef];
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 attributeName]);
    __int128 v17 = v16;
    if (!a3 || ![v16 length]) {
      goto LABEL_24;
    }
    pid_t pid = 0;
    BOOL v18 = 0;
    if (AXUIElementGetPid(v15, &pid) == kAXErrorSuccess && pid >= 1)
    {
      mach_port_name_t v52 = 0;
      BOOL v18 = task_for_pid(mach_task_self_, pid, &v52) == 0;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _developerOnlyAttributes](self, "_developerOnlyAttributes"));
    unsigned int v20 = [v19 containsObject:v17];

    if (v20 && !v18) {
      goto LABEL_11;
    }
    if ([v17 isEqualToString:@"Label"])
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v10 label]);
LABEL_14:
      id v22 = (void *)v23;
      goto LABEL_15;
    }

    if ([v17 isEqualToString:@"Header"])
    {
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v10 uiElement]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v29 objectWithAXAttribute:2026]);

      uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray, v30);
      if ((objc_opt_isKindOfClass(v22, v31) & 1) != 0 && [v22 count] == (id)1) {
        goto LABEL_29;
      }
LABEL_15:
      if (!v18)
      {
        uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v21);
        if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0 && (unint64_t)[v22 length] >= 0x41)
        {
          uint64_t v26 = objc_claimAutoreleasedReturnValue([v22 substringToIndex:64]);
        }

        else
        {
          uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSAttributedString, v25);
          uint64_t v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "attributedSubstringFromRange:", 0, 64));
        }

        __int128 v28 = (void *)v26;

        id v22 = v28;
      }

- (void)element:(id)a3 valueForParameterizedAttribute:(id)a4 withObject:(id)a5 completion:(id)a6
{
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
  -[XADInspectorManager setAppMatchingTargetPid:](self, "setAppMatchingTargetPid:", 0LL);
  if (-[XADInspectorManager targetPid](self, "targetPid"))
  {
    uint64_t v4 = AXAuditCurrentApplications();
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
          int v11 = AXAuditPidForElement(v10);
          if (-[XADInspectorManager targetPid](self, "targetPid", (void)v12) == v11)
          {
            -[XADInspectorManager setAppMatchingTargetPid:](self, "setAppMatchingTargetPid:", v10);
            goto LABEL_12;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (id)frontmostAppForTargetPid
{
  AXError v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager appMatchingTargetPid](self, "appMatchingTargetPid"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager appMatchingTargetPid](self, "appMatchingTargetPid"));
  }

  else
  {
    uint64_t v5 = iOSFrontmostApp();
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return v4;
}

- (id)fetchSpecialElement:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager frontmostAppForTargetPid](self, "frontmostAppForTargetPid"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[XADInspectorManager lastElementInHierarchy:](self, "lastElementInHierarchy:", v4));
  }

  else
  {
    if (a3)
    {
      id v6 = 0LL;
      goto LABEL_7;
    }

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager frontmostAppForTargetPid](self, "frontmostAppForTargetPid"));
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[XADInspectorManager firstElementInHierarchy:](self, "firstElementInHierarchy:", v4));
  }

  id v6 = (void *)v5;

LABEL_7:
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _AXAuditElementFromAXElement:](self, "_AXAuditElementFromAXElement:", v6));

  return v7;
}

- (id)fetchElementAtNormalizedDeviceCoordinate:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager lastFetchDateForDeviceCoodinate](self, "lastFetchDateForDeviceCoodinate"));
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager lastFetchDateForDeviceCoodinate](self, "lastFetchDateForDeviceCoodinate"));
  if (v10 && v9 < 0.1)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _mostRecentElementFetchedVisionOS](self, "_mostRecentElementFetchedVisionOS"));
  }

  else
  {
    -[XADInspectorManager setLastFetchDateForDeviceCoodinate:](self, "setLastFetchDateForDeviceCoodinate:", v6);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
    *(CGFloat *)__int128 v17 = x;
    *(CGFloat *)&v17[1] = y;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v17,  "{CGPoint=dd}"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 elementForAttribute:91701 parameter:v13]);

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _AXAuditElementFromAXElement:](self, "_AXAuditElementFromAXElement:", v14));
    -[XADInspectorManager set_mostRecentElementFetchedVisionOS:](self, "set_mostRecentElementFetchedVisionOS:", v15);

    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _mostRecentElementFetchedVisionOS](self, "_mostRecentElementFetchedVisionOS"));
  }

  return v11;
}

- (id)firstElementInHierarchy:(id)a3
{
  AXError v3 = (void *)objc_claimAutoreleasedReturnValue([a3 elementForAttribute:3000]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  unsigned int v5 = [v4 BOOLWithAXAttribute:2046];

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 elementForAttribute:3000]);

    AXError v3 = (void *)v6;
  }

  return v3;
}

- (id)lastElementInHierarchy:(id)a3
{
  AXError v3 = (void *)objc_claimAutoreleasedReturnValue([a3 elementForAttribute:3016]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  unsigned int v5 = [v4 BOOLWithAXAttribute:2046];

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 elementForAttribute:3016]);

    AXError v3 = (void *)v6;
  }

  return v3;
}

- (id)_nextElementNavigationInDirection:(int64_t)a3 forElement:(id)a4
{
  id v6 = a4;
  if (([v6 isAccessibilityOpaqueElementProvider] & 1) != 0
    || (id v7 = sub_100005968(v6, a3), (v8 = (void *)objc_claimAutoreleasedReturnValue(v7)) == 0LL))
  {
    if (a3 == 1) {
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 nextElementsWithCount:1]);
    }
    else {
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 previousElementsWithCount:1]);
    }
    uint64_t v10 = v9;
    if ([v9 count])
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
      if ([v8 isAccessibilityOpaqueElementProvider])
      {
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 elementForAttribute:95226 parameter:@"AXAudit"]);
        sub_100004180(v11, 0LL);

        sub_100004180(v8, 0LL);
        id v12 = sub_100005968(v8, a3);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

        double v8 = (void *)v13;
      }
    }

    else
    {
      double v8 = 0LL;
    }

    __int128 v14 = v8;
    id v15 = sub_100005968(v6, a3);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v8)
    {
LABEL_23:

      goto LABEL_24;
    }

    if (([v6 isAccessibilityOpaqueElementProvider] & 1) != 0
      || (id v16 = sub_100005AE0(v6), (v17 = objc_claimAutoreleasedReturnValue(v16)) == 0))
    {

LABEL_19:
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager frontmostAppForTargetPid](self, "frontmostAppForTargetPid"));
      if (a3 == 1) {
        uint64_t v19 = objc_claimAutoreleasedReturnValue(-[XADInspectorManager firstElementInHierarchy:](self, "firstElementInHierarchy:", v10));
      }
      else {
        uint64_t v19 = objc_claimAutoreleasedReturnValue(-[XADInspectorManager lastElementInHierarchy:](self, "lastElementInHierarchy:", v10));
      }
      double v8 = (void *)v19;
      goto LABEL_23;
    }

    BOOL v18 = (void *)v17;
    double v8 = (void *)objc_claimAutoreleasedReturnValue( -[XADInspectorManager _nextElementNavigationInDirection:forElement:]( self,  "_nextElementNavigationInDirection:forElement:",  a3,  v17));

    if (!v8) {
      goto LABEL_19;
    }
  }

- (void)moveInDirection:(unint64_t)a3 allowMovingToContainers:(BOOL)a4 allowMoveToNonAXElements:(BOOL)a5
{
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _currentElement](self, "_currentElement", a3, a4, a5));
  switch(a3)
  {
    case 3uLL:
      id v7 = self;
      uint64_t v8 = 2LL;
      goto LABEL_4;
    case 4uLL:
      id v7 = self;
      uint64_t v8 = 1LL;
LABEL_4:
      double v9 = (void *)objc_claimAutoreleasedReturnValue( -[XADInspectorManager _nextElementNavigationInDirection:forElement:]( v7,  "_nextElementNavigationInDirection:forElement:",  v8,  v12));
      if (!v9) {
        break;
      }
      goto LABEL_9;
    case 5uLL:
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager frontmostAppForTargetPid](self, "frontmostAppForTargetPid"));
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[XADInspectorManager firstElementInHierarchy:](self, "firstElementInHierarchy:", v10));
      goto LABEL_8;
    case 6uLL:
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager frontmostAppForTargetPid](self, "frontmostAppForTargetPid"));
      uint64_t v11 = objc_claimAutoreleasedReturnValue(-[XADInspectorManager lastElementInHierarchy:](self, "lastElementInHierarchy:", v10));
LABEL_8:
      double v9 = (void *)v11;

      if (v9)
      {
LABEL_9:
        -[XADInspectorManager focusOnAXElement:](self, "focusOnAXElement:", v9);
      }

      break;
    default:
      break;
  }
}

- (void)deviceDidGetTargeted
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000BECC();
  }
  -[XADInspectorManager _registerForNotificationsIfNecessary:](self, "_registerForNotificationsIfNecessary:", 1LL);
  AXError v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAuditAssetManager shared](&OBJC_CLASS___AXAuditAssetManager, "shared"));
  [v3 downloadAssetsIfNecessary];
}

- (id)_accessibilityNotificationsToObserve
{
  return &off_100015AE8;
}

- (void)_registerForNotificationsIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[XADInspectorManager _registeredForNotifications](self, "_registeredForNotifications") != a3)
  {
    -[XADInspectorManager set_registeredForNotifications:](self, "set_registeredForNotifications:", v3);
    -[XADInspectorManager _registerForAXNotifications:](self, "_registerForAXNotifications:", v3);
  }

- (void)_registerForAXNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    -[XADInspectorManager _initializeAXObserverIfNeeded](self, "_initializeAXObserverIfNeeded");
  }
  if (-[XADInspectorManager _axEventObserver](self, "_axEventObserver"))
  {
    unsigned int v5 = (const __AXUIElement *)+[AXUIElement systemWideAXUIElement](&OBJC_CLASS___AXUIElement, "systemWideAXUIElement");
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[XADInspectorManager _accessibilityNotificationsToObserve]( self,  "_accessibilityNotificationsToObserve",  0LL));
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (const __CFString *)[*(id *)(*((void *)&v13 + 1) + 8 * (void)i) intValue];
          id v12 = -[XADInspectorManager _axEventObserver](self, "_axEventObserver");
          if (v3) {
            AXObserverAddNotification(v12, v5, v11, self);
          }
          else {
            AXObserverRemoveNotification(v12, v5, v11);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }
  }

- (BOOL)_initializeAXObserverIfNeeded
{
  if (-[XADInspectorManager _axEventObserver](self, "_axEventObserver")) {
    goto LABEL_5;
  }
  AXUIElementGetPid( (AXUIElementRef)+[AXUIElement systemWideAXUIElement](&OBJC_CLASS___AXUIElement, "systemWideAXUIElement"),  &pid);
  if (!-[XADInspectorManager _axEventObserver](self, "_axEventObserver"))
  {
    AXObserverRef v7 = 0LL;
    if (AXObserverCreate(pid, (AXObserverCallback)sub_1000060C0, &v7))
    {
      LOBYTE(RunLoopSource) = 0;
      return (char)RunLoopSource;
    }

    -[XADInspectorManager set_axEventObserver:](self, "set_axEventObserver:", v7);
  }

  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(-[XADInspectorManager _axEventObserver](self, "_axEventObserver"));
  if (RunLoopSource)
  {
    uint64_t v4 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v4, kCFRunLoopDefaultMode);
LABEL_5:
    LOBYTE(RunLoopSource) = 1;
  }

  return (char)RunLoopSource;
}

- (void)updateAttributesIfElementIsValid
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _currentElement](self, "_currentElement"));
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[XADInspectorManager delegate](self, "delegate"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[XADInspectorManager _auditInspectorFocuseObject](self, "_auditInspectorFocuseObject"));
    [v6 inspectorManager:self inspectorElementPropertiesChanged:v5];
  }

- (XADInspectorManagerDelegate)delegate
{
  return (XADInspectorManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)monitoredEventType
{
  return self->_monitoredEventType;
}

- (BOOL)showVisuals
{
  return self->_showVisuals;
}

- (int)targetPid
{
  return self->_targetPid;
}

- (AXElement)appMatchingTargetPid
{
  return self->_appMatchingTargetPid;
}

- (void)setAppMatchingTargetPid:(id)a3
{
}

- (__AXObserver)_axEventObserver
{
  return self->__axEventObserver;
}

- (void)set_axEventObserver:(__AXObserver *)a3
{
  self->__axEventObserver = a3;
}

- (NSMutableArray)_focusedElementHistory
{
  return self->__focusedElementHistory;
}

- (void)set_focusedElementHistory:(id)a3
{
}

- (AXElement)_currentElement
{
  return self->__currentElement;
}

- (CGPoint)_lastPoint
{
  double x = self->__lastPoint.x;
  double y = self->__lastPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_lastPoint:(CGPoint)a3
{
  self->__lastPoint = a3;
}

- (AXUpdateElementVisualsCoalescer)_elementVisualsCoalescer
{
  return self->__elementVisualsCoalescer;
}

- (void)set_elementVisualsCoalescer:(id)a3
{
}

- (AXAuditElement)_mostRecentElementFetchedVisionOS
{
  return self->__mostRecentElementFetchedVisionOS;
}

- (void)set_mostRecentElementFetchedVisionOS:(id)a3
{
}

- (NSDate)lastFetchDateForDeviceCoodinate
{
  return self->_lastFetchDateForDeviceCoodinate;
}

- (void)setLastFetchDateForDeviceCoodinate:(id)a3
{
}

- (BOOL)_registeredForNotifications
{
  return self->__registeredForNotifications;
}

- (void)set_registeredForNotifications:(BOOL)a3
{
  self->__registeredForNotifications = a3;
}

- (void).cxx_destruct
{
}

@end