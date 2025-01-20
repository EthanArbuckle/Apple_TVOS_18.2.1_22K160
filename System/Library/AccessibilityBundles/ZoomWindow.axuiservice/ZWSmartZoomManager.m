@interface ZWSmartZoomManager
- (AVSpeechSynthesizer)synthesizer;
- (AXElement)focusElement;
- (BOOL)isEnabled;
- (BOOL)setNativeFocusOnBestElementNearRect:(CGRect)a3;
- (CGRect)focusRect;
- (ZWSmartZoomDelegate)delegate;
- (__AXObserver)accessibilityRuntimeObserver;
- (id)_accessibilityRuntimeNotifications;
- (id)_elementForFocus;
- (void)_accessibilitySystemServerDied;
- (void)_handleFirstResponderChangedNotification;
- (void)_handleNativeFocusItemChangedNotification:(void *)a3;
- (void)_handleUpdateElementVisualsNotification;
- (void)_initializeAccessibility;
- (void)_registerForAccessibilityRuntimeNotifications;
- (void)_speakFocusedElement;
- (void)_unregisterForAccessibilityRuntimeNotifications;
- (void)_updateApplicationAccessibility:(BOOL)a3;
- (void)dealloc;
- (void)disableSmartZoom;
- (void)enableSmartZoom;
- (void)setAccessibilityRuntimeObserver:(__AXObserver *)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusElement:(id)a3;
- (void)setSynthesizer:(id)a3;
- (void)speakContent;
@end

@implementation ZWSmartZoomManager

- (void)dealloc
{
  if (-[ZWSmartZoomManager accessibilityRuntimeObserver](self, "accessibilityRuntimeObserver"))
  {
    CFRelease(-[ZWSmartZoomManager accessibilityRuntimeObserver](self, "accessibilityRuntimeObserver"));
    -[ZWSmartZoomManager setAccessibilityRuntimeObserver:](self, "setAccessibilityRuntimeObserver:", 0LL);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ZWSmartZoomManager;
  -[ZWSmartZoomManager dealloc](&v3, "dealloc");
}

- (void)enableSmartZoom
{
  if (!-[ZWSmartZoomManager isEnabled](self, "isEnabled"))
  {
    -[ZWSmartZoomManager _initializeAccessibility](self, "_initializeAccessibility");
    -[ZWSmartZoomManager _registerForAccessibilityRuntimeNotifications]( self,  "_registerForAccessibilityRuntimeNotifications");
    -[ZWSmartZoomManager setEnabled:](self, "setEnabled:", 1LL);
  }

- (void)disableSmartZoom
{
  if (-[ZWSmartZoomManager isEnabled](self, "isEnabled"))
  {
    -[ZWSmartZoomManager _unregisterForAccessibilityRuntimeNotifications]( self,  "_unregisterForAccessibilityRuntimeNotifications");
    -[ZWSmartZoomManager _updateApplicationAccessibility:](self, "_updateApplicationAccessibility:", 0LL);
    -[ZWSmartZoomManager setEnabled:](self, "setEnabled:", 0LL);
  }

- (void)_speakFocusedElement
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager synthesizer](self, "synthesizer"));
  unsigned int v4 = [v3 isSpeaking];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager synthesizer](self, "synthesizer"));
    [v5 stopSpeakingAtBoundary:1];
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 application]);

    v29 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 explorerElements]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 label]);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 value]);

    if (v12) {
      [v10 addObject:v12];
    }
    if (v14) {
      [v10 addObject:v14];
    }
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v15 = v9;
    id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        v19 = 0LL;
        v20 = v14;
        v21 = v12;
        do
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          v22 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue([v22 label]);

          v14 = (void *)objc_claimAutoreleasedReturnValue([v22 value]);
          if (v12) {
            [v10 addObject:v12];
          }
          if (v14) {
            [v10 addObject:v14];
          }
          v19 = (char *)v19 + 1;
          v20 = v14;
          v21 = v12;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v17);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v10 array]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 componentsJoinedByString:@"\n\n"]);

    if ([v24 length])
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[AVSpeechUtterance speechUtteranceWithString:]( &OBJC_CLASS___AVSpeechUtterance,  "speechUtteranceWithString:",  v24));
      double v26 = AVSpeechUtteranceDefaultSpeechRate + 0.08;
      *(float *)&double v26 = v26;
      [v25 setRate:v26];
      LODWORD(v27) = 1061997773;
      [v25 setVolume:v27];
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager synthesizer](self, "synthesizer"));
      [v28 speakUtterance:v25];
    }
  }

  AXOverrideRequestingClientType(0LL, v6);
}

- (void)speakContent
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager synthesizer](self, "synthesizer"));

  if (!v3)
  {
    unsigned int v4 = objc_alloc_init(&OBJC_CLASS___AVSpeechSynthesizer);
    -[ZWSmartZoomManager setSynthesizer:](self, "setSynthesizer:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager synthesizer](self, "synthesizer"));
    [v5 setDelegate:self];
  }

  -[ZWSmartZoomManager _speakFocusedElement](self, "_speakFocusedElement");
}

- (CGRect)focusRect
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));

  if (!v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager _elementForFocus](self, "_elementForFocus"));
    -[ZWSmartZoomManager setFocusElement:](self, "setFocusElement:", v4);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
  [v6 rectWithAXAttribute:2149];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  AXOverrideRequestingClientType(0LL, v15);
  double v16 = v8;
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_elementForFocus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 systemApplication]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentApplications]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nativeFocusElement]);
  return v6;
}

- (BOOL)setNativeFocusOnBestElementNearRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  AXOverrideRequestingClientType(18LL, a2);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 systemApplication]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentApplications]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 visibleElements]);
  id v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v38;
LABEL_3:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v38 != v14) {
        objc_enumerationMutation(v11);
      }
      double v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
      [v16 frame];
      v45.origin.CGFloat x = v17;
      v45.origin.CGFloat y = v18;
      v45.size.CGFloat width = v19;
      v45.size.CGFloat height = v20;
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = width;
      v43.size.CGFloat height = height;
      if (CGRectContainsRect(v43, v45)) {
        break;
      }
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v21 = v16;

    if (v21) {
      goto LABEL_22;
    }
  }

  else
  {
LABEL_9:
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v22 = v11;
  id v21 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    uint64_t v23 = *(void *)v34;
    while (2)
    {
      for (i = 0LL; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v22);
        }
        v25 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        objc_msgSend(v25, "frame", (void)v33);
        v46.origin.CGFloat x = v26;
        v46.origin.CGFloat y = v27;
        v46.size.CGFloat width = v28;
        v46.size.CGFloat height = v29;
        v44.origin.CGFloat x = x;
        v44.origin.CGFloat y = y;
        v44.size.CGFloat width = width;
        v44.size.CGFloat height = height;
        if (CGRectIntersectsRect(v44, v46))
        {
          id v21 = v25;
          goto LABEL_21;
        }
      }

      id v21 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

- (void)_handleFirstResponderChangedNotification
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager _elementForFocus](self, "_elementForFocus"));
  -[ZWSmartZoomManager setFocusElement:](self, "setFocusElement:", v3);

  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));
  if (v4)
  {
    v5 = (void *)v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager delegate](self, "delegate"));
    unsigned __int8 v7 = [v6 isZoomInStandByModeWithSmartZoom:self];

    if ((v7 & 1) == 0)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager delegate](self, "delegate"));
      [v8 updateFocusWithSmartZoom:self];
    }
  }

- (void)_handleNativeFocusItemChangedNotification:(void *)a3
{
  CFTypeID v5 = CFGetTypeID(a3);
  if (v5 == CFDictionaryGetTypeID())
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kAXElementKey]);
    unsigned __int8 v7 = v6;
    if (v6)
    {
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == AXUIElementGetTypeID())
      {
        double v9 = -[AXElement initWithAXUIElement:](objc_alloc(&OBJC_CLASS___AXElement), "initWithAXUIElement:", v7);
        -[ZWSmartZoomManager setFocusElement:](self, "setFocusElement:", v9);
      }
    }
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));

  if (!v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager _elementForFocus](self, "_elementForFocus"));
    -[ZWSmartZoomManager setFocusElement:](self, "setFocusElement:", v11);
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager delegate](self, "delegate"));
    unsigned __int8 v15 = [v14 isZoomInStandByModeWithSmartZoom:self];

    if ((v15 & 1) == 0)
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager delegate](self, "delegate"));
      [v16 updateFocusWithSmartZoom:self];
    }
  }

- (void)_handleUpdateElementVisualsNotification
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  [v4 updateCache:2149];

  AXOverrideRequestingClientType(0LL, v5);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager focusElement](self, "focusElement"));
  if (v6)
  {
    unsigned __int8 v7 = (void *)v6;
    CFTypeID v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager delegate](self, "delegate"));
    unsigned __int8 v9 = [v8 isZoomInStandByModeWithSmartZoom:self];

    if ((v9 & 1) == 0)
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager delegate](self, "delegate"));
      [v10 updateFocusWithSmartZoom:self];
    }
  }

- (void)_updateApplicationAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = _AXSApplicationAccessibilityEnabled(self, a2);
  if (!v3 || v4)
  {
    if (!v3 && v4)
    {
    }
  }

  else
  {
    _AXSApplicationAccessibilitySetEnabled(1LL);
  }

- (void)_initializeAccessibility
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  uint64_t v5 = (const __AXUIElement *)[v4 axElement];

  AXUIElementGetPid(v5, &pid);
  accessibilityRuntimeObserver = self->_accessibilityRuntimeObserver;
  if (!accessibilityRuntimeObserver)
  {
    if (AXObserverCreate( pid,  (AXObserverCallback)_handleAccessibilityRuntimeEvent,  &self->_accessibilityRuntimeObserver))
    {
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Failed to create an accessibility event observer: %ld");
      goto LABEL_7;
    }

    accessibilityRuntimeObserver = self->_accessibilityRuntimeObserver;
  }

  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(accessibilityRuntimeObserver);
  if (RunLoopSource)
  {
    CFTypeID v8 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v8, kCFRunLoopDefaultMode);
    return;
  }

  _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Failed to get the observer run loop source");
LABEL_7:
  id v10 = objc_autoreleasePoolPush();
  -[ZWSmartZoomManager _accessibilitySystemServerDied](self, "_accessibilitySystemServerDied");
  objc_autoreleasePoolPop(v10);
}

- (id)_accessibilityRuntimeNotifications
{
  return &off_6F3A8;
}

- (void)_registerForAccessibilityRuntimeNotifications
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  uint64_t v5 = (const __AXUIElement *)[v4 axElement];

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager _accessibilityRuntimeNotifications](self, "_accessibilityRuntimeNotifications"));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        if (AXObserverAddNotification( self->_accessibilityRuntimeObserver,  v5,  (CFStringRef)[*(id *)(*((void *)&v15 + 1) + 8 * (void)i) intValue],  self))
        {
          char v9 = 1;
          LOBYTE(v13) = 1;
          _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v13,  @"Zoom could not register for notification:%ld. Error:%ld");
        }

        else
        {
          LOBYTE(v13) = 1;
          _AXLogWithFacility( 3LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v13,  @"Zoom did register for ax notification: %ld");
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);

    if ((v9 & 1) != 0)
    {
      dispatch_time_t v12 = dispatch_time(0LL, 1000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __67__ZWSmartZoomManager__registerForAccessibilityRuntimeNotifications__block_invoke;
      block[3] = &unk_6CBC0;
      block[4] = self;
      dispatch_after(v12, &_dispatch_main_q, block);
    }
  }

  else
  {
  }

id __67__ZWSmartZoomManager__registerForAccessibilityRuntimeNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForAccessibilityRuntimeNotifications];
}

- (void)_unregisterForAccessibilityRuntimeNotifications
{
  char v15 = 1;
  _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v15,  @"Zoom will unregister for ax runtime notifications now");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  uint64_t v5 = (const __AXUIElement *)[v4 axElement];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v6 setPassivelyListeningForEvents:1];

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSmartZoomManager _accessibilityRuntimeNotifications](self, "_accessibilityRuntimeNotifications"));
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        dispatch_time_t v12 = (const __CFString *)[*(id *)(*((void *)&v19 + 1) + 8 * (void)v11) intValue];
        uint64_t v13 = AXObserverRemoveNotification(self->_accessibilityRuntimeObserver, v5, v12);
        if ((_DWORD)v13)
        {
          uint64_t v14 = v13;
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14));
          LOBYTE(v16) = 1;
          _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v16,  @"Zoom could not unregister for notification:%@. Error:%@");
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
  }
}

- (void)_accessibilitySystemServerDied
{
  char v3 = 1;
  _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v3,  @"Zoom notified that system server died. unregistering ax");
  if (self->_accessibilityRuntimeObserver)
  {
    -[ZWSmartZoomManager _unregisterForAccessibilityRuntimeNotifications]( self,  "_unregisterForAccessibilityRuntimeNotifications");
    CFRelease(self->_accessibilityRuntimeObserver);
    self->_accessibilityRuntimeObserver = 0LL;
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __52__ZWSmartZoomManager__accessibilitySystemServerDied__block_invoke;
  v4[3] = &unk_6CBC0;
  v4[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v4, 0.5);
}

id __52__ZWSmartZoomManager__accessibilitySystemServerDied__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeAccessibility];
}

- (ZWSmartZoomDelegate)delegate
{
  return (ZWSmartZoomDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (__AXObserver)accessibilityRuntimeObserver
{
  return self->_accessibilityRuntimeObserver;
}

- (void)setAccessibilityRuntimeObserver:(__AXObserver *)a3
{
  self->_accessibilityRuntimeObserver = a3;
}

- (AXElement)focusElement
{
  return self->_focusElement;
}

- (void)setFocusElement:(id)a3
{
}

- (AVSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (void)setSynthesizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end