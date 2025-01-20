@interface VOTDirectInteractionKeyboardManager
- (BOOL)inDirectInteractionTypingMode;
- (BOOL)inGestureMode;
- (BOOL)inGestureTypingMode;
- (BOOL)isEmojiKey;
- (BOOL)isEmojiKeyboard;
- (BOOL)processEvent:(id)a3;
- (CGRect)gestureKeyboardRegion;
- (VOTDirectInteractionKeyboardManager)init;
- (VOTElement)keyboardElement;
- (VOTGestureKeyboardDelegate)delegate;
- (void)_handleCommitTyping:(id)a3;
- (void)_handleDelete:(id)a3;
- (void)_handleKeyboardSelection:(id)a3;
- (void)_handleKeyplaneSelection:(id)a3;
- (void)_handleShift:(id)a3;
- (void)_handleShiftLock:(id)a3;
- (void)_handleSuggestionSelection:(id)a3;
- (void)_handleTypingEnter:(id)a3;
- (void)_handleTypingPeriod:(id)a3;
- (void)_initializeDispatchTable;
- (void)_processEvent:(id)a3;
- (void)_updateKeyboardElement;
- (void)_updateTypingMode;
- (void)dealloc;
- (void)screenChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInDirectInteractionTypingMode:(BOOL)a3;
- (void)setInGestureMode:(BOOL)a3;
- (void)setIsEmojiKey:(BOOL)a3;
- (void)setIsEmojiKeyboard:(BOOL)a3;
- (void)setKeyboardElement:(id)a3;
- (void)updateKeyboardElement;
- (void)updateTypingMode;
@end

@implementation VOTDirectInteractionKeyboardManager

- (VOTDirectInteractionKeyboardManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___VOTDirectInteractionKeyboardManager;
  v2 = -[VOTDirectInteractionKeyboardManager init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___AXAccessQueue);
    dispatchAccessQueue = v2->_dispatchAccessQueue;
    v2->_dispatchAccessQueue = v3;

    -[VOTDirectInteractionKeyboardManager _initializeDispatchTable](v2, "_initializeDispatchTable");
    v5 = v2->_dispatchAccessQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C6E1C;
    v10[3] = &unk_100176D38;
    v6 = v2;
    v11 = v6;
    -[AXAccessQueue afterDelay:processWritingBlock:](v5, "afterDelay:processWritingBlock:", v10, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v6 selector:"screenChange:" name:@"UpdateElement" object:0];

    v8 = v6;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTDirectInteractionKeyboardManager;
  -[VOTDirectInteractionKeyboardManager dealloc](&v4, "dealloc");
}

- (void)_initializeDispatchTable
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  dispatchTable = self->_dispatchTable;
  self->_dispatchTable = v3;

  v5 = self->_dispatchTable;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000C71DC;
  v37[3] = &unk_100179C08;
  v37[4] = self;
  v6 = objc_retainBlock(v37);
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, kVOTEventCommandGestureTypingShiftLock);

  v7 = self->_dispatchTable;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000C71E8;
  v36[3] = &unk_100179C08;
  v36[4] = self;
  v8 = objc_retainBlock(v36);
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v8, kVOTEventCommandGestureTypingShift);

  v9 = self->_dispatchTable;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000C71F4;
  v35[3] = &unk_100179C08;
  v35[4] = self;
  v10 = objc_retainBlock(v35);
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, kVOTEventCommandGestureTypingTypeEnter);

  v11 = self->_dispatchTable;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000C7200;
  v34[3] = &unk_100179C08;
  v34[4] = self;
  objc_super v12 = objc_retainBlock(v34);
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, kVOTEventCommandGestureTypingTypePeriod);

  v13 = self->_dispatchTable;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000C720C;
  v33[3] = &unk_100179C08;
  v33[4] = self;
  v14 = objc_retainBlock(v33);
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, kVOTEventCommandGestureTypingCommitTyping);

  v15 = self->_dispatchTable;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000C7218;
  v32[3] = &unk_100179C08;
  v32[4] = self;
  v16 = objc_retainBlock(v32);
  -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, kVOTEventCommandGestureTypingDelete);

  v17 = self->_dispatchTable;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000C7224;
  v31[3] = &unk_100179C08;
  v31[4] = self;
  v18 = objc_retainBlock(v31);
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, kVOTEventCommandGestureTypingNextSuggestion);

  v19 = self->_dispatchTable;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000C7230;
  v30[3] = &unk_100179C08;
  v30[4] = self;
  v20 = objc_retainBlock(v30);
  -[NSMutableDictionary setObject:forKey:]( v19,  "setObject:forKey:",  v20,  kVOTEventCommandGestureTypingPreviousSuggestion);

  v21 = self->_dispatchTable;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000C723C;
  v29[3] = &unk_100179C08;
  v29[4] = self;
  v22 = objc_retainBlock(v29);
  -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v22, kVOTEventCommandGestureTypingNextKeyplane);

  v23 = self->_dispatchTable;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000C7248;
  v28[3] = &unk_100179C08;
  v28[4] = self;
  v24 = objc_retainBlock(v28);
  -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v24, kVOTEventCommandGestureTypingPreviousKeyplane);

  v25 = self->_dispatchTable;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000C7254;
  v27[3] = &unk_100179C08;
  v27[4] = self;
  v26 = objc_retainBlock(v27);
  -[NSMutableDictionary setObject:forKey:]( v25,  "setObject:forKey:",  v26,  kVOTEventCommandGestureTypingNextInternationalKeyboard);
}

- (void)screenChange:(id)a3
{
}

- (void)updateTypingMode
{
  dispatchAccessQueue = self->_dispatchAccessQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000C72DC;
  v3[3] = &unk_100176D38;
  v3[4] = self;
  -[AXAccessQueue performAsynchronousWritingBlock:](dispatchAccessQueue, "performAsynchronousWritingBlock:", v3);
}

- (void)_updateKeyboardElement
{
  keyboardElement = self->_keyboardElement;
  self->_keyboardElement = 0LL;

  -[VOTDirectInteractionKeyboardManager _updateTypingMode](self, "_updateTypingMode");
}

- (void)updateKeyboardElement
{
  dispatchAccessQueue = self->_dispatchAccessQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000C7368;
  v3[3] = &unk_100176D38;
  v3[4] = self;
  -[AXAccessQueue performAsynchronousWritingBlock:](dispatchAccessQueue, "performAsynchronousWritingBlock:", v3);
}

- (void)_updateTypingMode
{
  if ([(id)VOTSharedWorkspace typingMode] != (id)2)
  {
    uint64_t v18 = 0LL;
    goto LABEL_40;
  }

  p_keyboardElement = (id *)&self->_keyboardElement;
  uint64_t v4 = VOTLogKeyboard(-[VOTElement updateWindowContextId](self->_keyboardElement, "updateWindowContextId"));
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = *p_keyboardElement;
    *(_DWORD *)buf = 138477827;
    id v48 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Got keyboard element: %{private}@", buf, 0xCu);
  }

  id v7 = *p_keyboardElement;
  if (*p_keyboardElement)
  {
    unsigned int v8 = [v7 isValid];
    id v7 = *p_keyboardElement;
    if (v8)
    {
      id v9 = [v7 windowContextId];
      if ((_DWORD)v9) {
        goto LABEL_30;
      }
      id v7 = *p_keyboardElement;
    }
  }

  id *p_keyboardElement = 0LL;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 focusedApplications]);

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v44;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * (void)i), "activeKeyboard", (void)v43));
        if (v17)
        {
          id v19 = *p_keyboardElement;
          id *p_keyboardElement = (id)v17;

          goto LABEL_19;
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

- (BOOL)inGestureTypingMode
{
  return 0;
}

- (void)setInDirectInteractionTypingMode:(BOOL)a3
{
  self->_inDirectInteractionTypingMode = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager delegate](self, "delegate"));
  [v4 directInteractionModeStatus:self->_inDirectInteractionTypingMode];
}

- (BOOL)isEmojiKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentElement]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.StickerKit.StickerPickerService"];

  return v5;
}

- (BOOL)isEmojiKeyboard
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 focusedApplications]);

  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend( *(id *)(*((void *)&v9 + 1) + 8 * (void)i),  "isKeyboardEmojiInputMode",  (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (CGRect)gestureKeyboardRegion
{
  id v3 = -[VOTElement frameForDirectInteraction](self->_keyboardElement, "frameForDirectInteraction");
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  uint64_t v12 = VOTLogKeyboard(v3);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    keyboardElement = self->_keyboardElement;
    v31.origin.x = v5;
    v31.origin.y = v7;
    v31.size.width = v9;
    v31.size.height = v11;
    uint64_t v15 = NSStringFromRect(v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = keyboardElement;
    __int16 v29 = 2112;
    id v30 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Gesture KB frame: %@ %@", buf, 0x16u);
  }

  v32.origin.x = CGRectZero.origin.x;
  v32.origin.y = CGRectZero.origin.y;
  v32.size.width = CGRectZero.size.width;
  v32.size.height = CGRectZero.size.height;
  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  if (CGRectEqualToRect(v32, v34))
  {
    -[VOTElement frameForDirectInteraction](self->_keyboardElement, "frameForDirectInteraction");
    CGFloat v5 = v17;
    CGFloat v7 = v18;
    CGFloat v9 = v19;
    CGFloat v11 = v20;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000C7AD8;
    v26[3] = &unk_100176D38;
    v26[4] = self;
    AXPerformBlockOnMainThreadAfterDelay(v26, v21, 0.0);
  }

  double v22 = v5;
  double v23 = v7;
  double v24 = v9;
  double v25 = v11;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)processEvent:(id)a3
{
  id v4 = a3;
  if ((self->_inDirectInteractionTypingMode
     || (_AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTDirectInteractionKeyboardManager.m",  224LL,  "-[VOTDirectInteractionKeyboardManager processEvent:]",  @"Not in gesture KB mode, we shouldn't be getting events."),  self->_inDirectInteractionTypingMode))
    && (CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue([v4 command]),
        unsigned int v6 = [v5 isEqualToString:kVOTEventCommandGestureTypingType],
        v5,
        v6))
  {
    CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForIndex:115]);
    [v7 pointValue];
    double v9 = v8;
    double v11 = v10;

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    uint64_t v13 = -[VOTElement windowContextId](self->_keyboardElement, "windowContextId");
    LODWORD(v14) = 0;
    objc_msgSend( v12,  "performSimpleTapAtPoint:withForce:withContextId:withDelay:forElement:",  v13,  0,  v9,  v11,  0.0,  v14);

    BOOL v15 = 1;
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_processEvent:(id)a3
{
  id v4 = a3;
  dispatchTable = self->_dispatchTable;
  id v8 = v4;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  CGFloat v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](dispatchTable, "objectForKey:", v6));

  if (v7) {
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)_handleSuggestionSelection:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandGestureTypingNextSuggestion];

  if (v5) {
    uint64_t v6 = 2606LL;
  }
  else {
    uint64_t v6 = 2607LL;
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager keyboardElement](self, "keyboardElement"));
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
  [v7 performAXAction:v6];
}

- (void)_handleKeyplaneSelection:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandGestureTypingNextKeyplane];

  if (v5) {
    uint64_t v6 = 2602LL;
  }
  else {
    uint64_t v6 = 2603LL;
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager keyboardElement](self, "keyboardElement"));
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
  [v7 performAXAction:v6];
}

- (void)_handleKeyboardSelection:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandGestureTypingNextInternationalKeyboard];

  if (v5) {
    uint64_t v6 = 2608LL;
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager keyboardElement](self, "keyboardElement"));
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
  [v7 performAXAction:v6];
}

- (void)_handleDelete:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager keyboardElement](self, "keyboardElement", a3));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  [v3 performAXAction:2601];
}

- (void)_handleShiftLock:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager keyboardElement](self, "keyboardElement", a3));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  [v3 performAXAction:2610];
}

- (void)_handleShift:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager keyboardElement](self, "keyboardElement", a3));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  [v3 performAXAction:2609];
}

- (void)_handleTypingEnter:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager keyboardElement](self, "keyboardElement", a3));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"\n"));
  [v3 performAXAction:2605 withValue:v4];
}

- (void)_handleTypingPeriod:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager keyboardElement](self, "keyboardElement", a3));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"."));
  [v3 performAXAction:2605 withValue:v4];
}

- (void)_handleCommitTyping:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTDirectInteractionKeyboardManager keyboardElement](self, "keyboardElement", a3));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]);
  [v3 performAXAction:2604];
}

- (BOOL)inDirectInteractionTypingMode
{
  return self->_inDirectInteractionTypingMode;
}

- (VOTGestureKeyboardDelegate)delegate
{
  return (VOTGestureKeyboardDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (VOTElement)keyboardElement
{
  return self->_keyboardElement;
}

- (void)setKeyboardElement:(id)a3
{
}

- (void)setIsEmojiKey:(BOOL)a3
{
  self->_isEmojiKey = a3;
}

- (void)setIsEmojiKeyboard:(BOOL)a3
{
  self->_isEmojiKeyboard = a3;
}

- (BOOL)inGestureMode
{
  return self->_inGestureMode;
}

- (void)setInGestureMode:(BOOL)a3
{
  self->_inGestureMode = a3;
}

- (void).cxx_destruct
{
}

@end