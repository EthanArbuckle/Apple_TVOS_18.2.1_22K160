@interface VOTGesturedTextInputManager
- (BOOL)_isInHomeScreen:(id)a3;
- (BOOL)_performWordBackspaceForElement:(id)a3;
- (BOOL)_processRawInputEvent:(id)a3 forElement:(id)a4 withAttributes:(id)a5;
- (BOOL)_processSearchEvent:(id)a3 forElement:(id)a4;
- (BOOL)_processWebRotorEvent:(id)a3;
- (BOOL)isActive;
- (BOOL)isBackspaceEvent:(id)a3;
- (BOOL)isNextBrailleTableEvent:(id)a3;
- (BOOL)isNextKeyboardLanguageEvent:(id)a3;
- (BOOL)isNextSuggestionEvent:(id)a3;
- (BOOL)isPreviousSuggestionEvent:(id)a3;
- (BOOL)isReturnKeyEvent:(id)a3;
- (BOOL)isRotorDownEvent:(id)a3;
- (BOOL)isRotorLeftEvent:(id)a3;
- (BOOL)isRotorRightEvent:(id)a3;
- (BOOL)isRotorUpEvent:(id)a3;
- (BOOL)isSelectItemEvent:(id)a3;
- (BOOL)isSpaceEvent:(id)a3;
- (BOOL)isTextSelectionBackwardEvent:(id)a3;
- (BOOL)isTextSelectionForwardEvent:(id)a3;
- (BOOL)isWordBackspaceEvent:(id)a3;
- (BOOL)performCustomBackspace;
- (BOOL)performCustomWordBackspace;
- (BOOL)performNextBrailleTableCommand;
- (BOOL)performNextKeyboardLanguage;
- (BOOL)processEvent:(id)a3;
- (BOOL)processTapWithFingerCount:(unint64_t)a3;
- (BOOL)shouldAllowRotorEvents;
- (NSDictionary)localizedWebRotorMap;
- (NSString)currentInputString;
- (NSString)nameSearcherHint;
- (NSString)pendingInputString;
- (VOTElement)nameSearcherMonitorElement;
- (VOTGesturedTextInputManager)init;
- (VOTGesturedTextInputManagerDelegate)delegate;
- (VOTNameSearcher)nameSearcher;
- (id)_stringByDeletingFromCurrentInputStringIfNeeded;
- (id)currentElementAttributes;
- (id)hintForAppLaunch;
- (id)hintForItemChooser;
- (id)nameSearcherEntriesPassingSearchFrom:(id)a3;
- (id)outputForLatestInput;
- (int64_t)rotorType;
- (int64_t)valueChangeOriginator;
- (unint64_t)_numberOfCharactersToDeleteStartingAtIndex:(unint64_t)a3 toDesiredLength:(unint64_t)a4 fromString:(id)a5;
- (unint64_t)_numberOfCharactersToDeleteToDesiredLength:(unint64_t)a3 fromString:(id)a4;
- (void)_deleteFromCurrentInputStringIfNeeded;
- (void)_prepareNameSearcherForElement:(id)a3;
- (void)_updateLocalizedResources;
- (void)appendString:(id)a3;
- (void)applyNextSuggestionToElement:(id)a3;
- (void)applyPreviousSuggestionToElement:(id)a3;
- (void)clearCurrentString;
- (void)inputSpaceForElement:(id)a3;
- (void)itemSource:(id)a3 didFilter:(id)a4 didSwitchFocus:(id)a5;
- (void)itemSource:(id)a3 didSelect:(id)a4;
- (void)pressReturnKeyForElement:(id)a3;
- (void)sendCarriageReturnForElement:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setCurrentInputString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalizedWebRotorMap:(id)a3;
- (void)setNameSearcher:(id)a3;
- (void)setNameSearcherHint:(id)a3;
- (void)setNameSearcherMonitorElement:(id)a3;
- (void)setPendingInputString:(id)a3;
- (void)setRotorType:(int64_t)a3;
- (void)updateWithString:(id)a3;
@end

@implementation VOTGesturedTextInputManager

- (VOTGesturedTextInputManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VOTGesturedTextInputManager;
  v2 = -[VOTGesturedTextInputManager init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[VOTGesturedTextInputManager setRotorType:](v2, "setRotorType:", 9LL);
    -[VOTGesturedTextInputManager setCurrentInputString:](v3, "setCurrentInputString:", &stru_10017A920);
    -[VOTGesturedTextInputManager _updateLocalizedResources](v3, "_updateLocalizedResources");
  }

  return v3;
}

- (BOOL)processTapWithFingerCount:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager nameSearcherMonitorElement](self, "nameSearcherMonitorElement", a3));
  else {
    unsigned int v4 = [v3 doesHaveTraits:kAXFolderIconTrait] ^ 1;
  }

  return v4;
}

- (void)appendString:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentInputString](self, "currentInputString"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:v6]);
    -[VOTGesturedTextInputManager updateWithString:](self, "updateWithString:", v5);
  }
}

- (void)updateWithString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VOTLogHandwriting();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Update string: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTUserEventManager sharedInstance](&OBJC_CLASS___VOTUserEventManager, "sharedInstance"));
  [v7 userEventOccurred];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager delegate](self, "delegate"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10004E59C;
  v10[3] = &unk_100177E18;
  id v11 = v4;
  v12 = self;
  id v9 = v4;
  [v8 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:v10];
}

- (id)currentElementAttributes
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_10004EB7C;
  id v11 = sub_10004EB8C;
  id v12 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager delegate](self, "delegate"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004EB94;
  v6[3] = &unk_100177E40;
  v6[4] = &v7;
  [v3 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)processEvent:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  if ([v5 isEqualToString:kVOTEventCommandSearchRotorLeft])
  {

    goto LABEL_4;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  unsigned __int8 v7 = [v6 isEqualToString:kVOTEventCommandSearchRotorRight];

  if ((v7 & 1) != 0)
  {
LABEL_4:
    if (!-[VOTGesturedTextInputManager shouldAllowRotorEvents](self, "shouldAllowRotorEvents")) {
      *((_BYTE *)v18 + 24) = 1;
    }
    goto LABEL_10;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  if ([v8 isEqualToString:kVOTEventCommandEscape])
  {
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
    unsigned __int8 v10 = [v9 isEqualToString:kVOTEventCommandBSIExit];

    if ((v10 & 1) == 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager delegate](self, "delegate"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10004ED8C;
      v14[3] = &unk_100177E68;
      v14[4] = self;
      id v15 = v4;
      v16 = &v17;
      [v11 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:v14];
    }
  }

- (void)inputSpaceForElement:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "insertText:source:",  @" ",  -[VOTGesturedTextInputManager valueChangeOriginator](self, "valueChangeOriginator"));

  -[VOTGesturedTextInputManager clearCurrentString](self, "clearCurrentString");
}

- (void)pressReturnKeyForElement:(id)a3
{
}

- (void)sendCarriageReturnForElement:(id)a3
{
}

- (void)clearCurrentString
{
}

- (BOOL)isRotorLeftEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorRightEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorUpEvent:(id)a3
{
  return 0;
}

- (BOOL)isRotorDownEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionForwardEvent:(id)a3
{
  return 0;
}

- (BOOL)isTextSelectionBackwardEvent:(id)a3
{
  return 0;
}

- (BOOL)performCustomBackspace
{
  return 0;
}

- (BOOL)performCustomWordBackspace
{
  return 0;
}

- (BOOL)performNextKeyboardLanguage
{
  return 0;
}

- (BOOL)performNextBrailleTableCommand
{
  return 0;
}

- (BOOL)shouldAllowRotorEvents
{
  return 1;
}

- (id)hintForAppLaunch
{
  return 0LL;
}

- (id)hintForItemChooser
{
  return 0LL;
}

- (id)outputForLatestInput
{
  return 0LL;
}

- (BOOL)_processWebRotorEvent:(id)a3
{
  id v4 = a3;
  if (-[VOTGesturedTextInputManager isNextSuggestionEvent:](self, "isNextSuggestionEvent:", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager delegate](self, "delegate"));
    int64_t v6 = -[VOTGesturedTextInputManager rotorType](self, "rotorType");
    unsigned __int8 v7 = v5;
    v8 = self;
    uint64_t v9 = 1LL;
  }

  else
  {
    if (!-[VOTGesturedTextInputManager isPreviousSuggestionEvent:](self, "isPreviousSuggestionEvent:", v4))
    {
      BOOL v10 = 0;
      goto LABEL_7;
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager delegate](self, "delegate"));
    int64_t v6 = -[VOTGesturedTextInputManager rotorType](self, "rotorType");
    unsigned __int8 v7 = v5;
    v8 = self;
    uint64_t v9 = 2LL;
  }

  [v7 gesturedTextInputManager:v8 moveToElementMatchingRotorType:v6 inDirection:v9];

  BOOL v10 = 1;
LABEL_7:

  return v10;
}

- (void)_deleteFromCurrentInputStringIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentInputString](self, "currentInputString"));
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( -[VOTGesturedTextInputManager _stringByDeletingFromCurrentInputStringIfNeeded]( self,  "_stringByDeletingFromCurrentInputStringIfNeeded"));
    -[VOTGesturedTextInputManager setCurrentInputString:](self, "setCurrentInputString:", v5);
  }

- (id)_stringByDeletingFromCurrentInputStringIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentInputString](self, "currentInputString"));
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentInputString](self, "currentInputString"));
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentInputString](self, "currentInputString"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentInputString](self, "currentInputString"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "substringToIndex:",  objc_msgSend( v6,  "rangeOfComposedCharacterSequenceAtIndex:",  (char *)objc_msgSend(v7, "length") - 1)));
  }

  else
  {
    v8 = &stru_10017A920;
  }

  return v8;
}

- (BOOL)_performWordBackspaceForElement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 selectedTextRange];
  if (v5 == (id)0x7FFFFFFF || v6 != 0) {
    goto LABEL_10;
  }
  id v8 = v5;
  [v4 updateValue];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 value]);
  id v10 = objc_msgSend(v9, "ax_wordFromPosition:inDirection:", v8, 1);
  if (v10 == (id)0x7FFFFFFF || !v11)
  {

LABEL_10:
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
    [v9 sendEvent:v13];

    BOOL v12 = 0;
    goto LABEL_11;
  }

  objc_msgSend( v4,  "replaceCharactersAtCursor:withString:source:",  -[VOTGesturedTextInputManager _numberOfCharactersToDeleteStartingAtIndex:toDesiredLength:fromString:]( self,  "_numberOfCharactersToDeleteStartingAtIndex:toDesiredLength:fromString:",  v8,  v10,  v9),  &stru_10017A920,  -[VOTGesturedTextInputManager valueChangeOriginator](self, "valueChangeOriginator"));
  -[VOTGesturedTextInputManager clearCurrentString](self, "clearCurrentString");
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)_processRawInputEvent:(id)a3 forElement:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!-[VOTGesturedTextInputManager isReturnKeyEvent:](self, "isReturnKeyEvent:", v8))
  {
    if (-[VOTGesturedTextInputManager isSpaceEvent:](self, "isSpaceEvent:", v8))
    {
      goto LABEL_19;
    }

    if (-[VOTGesturedTextInputManager isBackspaceEvent:](self, "isBackspaceEvent:", v8))
    {
      if (!-[VOTGesturedTextInputManager performCustomBackspace](self, "performCustomBackspace"))
      {
        if ([v10 canDeleteCharacter])
        {
          objc_msgSend( v9,  "deleteCharacterAtCursorWithSource:",  -[VOTGesturedTextInputManager valueChangeOriginator](self, "valueChangeOriginator"));
          -[VOTGesturedTextInputManager _deleteFromCurrentInputStringIfNeeded]( self,  "_deleteFromCurrentInputStringIfNeeded");
          -[VOTGesturedTextInputManager didInputBackspace](self, "didInputBackspace");
        }

        else
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
          [v11 sendEvent:v12];
        }
      }

      goto LABEL_19;
    }

    if (-[VOTGesturedTextInputManager isWordBackspaceEvent:](self, "isWordBackspaceEvent:", v8))
    {
      if (-[VOTGesturedTextInputManager performCustomWordBackspace](self, "performCustomWordBackspace")
        || -[VOTGesturedTextInputManager _performWordBackspaceForElement:](self, "_performWordBackspaceForElement:", v9))
      {
        -[VOTGesturedTextInputManager didInputWordBackspace](self, "didInputWordBackspace");
        goto LABEL_19;
      }
    }

    else
    {
      if (-[VOTGesturedTextInputManager isPreviousSuggestionEvent:](self, "isPreviousSuggestionEvent:", v8))
      {
        -[VOTGesturedTextInputManager applyPreviousSuggestionToElement:](self, "applyPreviousSuggestionToElement:", v9);
        goto LABEL_19;
      }

      if (-[VOTGesturedTextInputManager isNextSuggestionEvent:](self, "isNextSuggestionEvent:", v8))
      {
        -[VOTGesturedTextInputManager applyNextSuggestionToElement:](self, "applyNextSuggestionToElement:", v9);
        goto LABEL_19;
      }

      if (-[VOTGesturedTextInputManager isNextKeyboardLanguageEvent:](self, "isNextKeyboardLanguageEvent:", v8))
      {
        BOOL v13 = -[VOTGesturedTextInputManager performNextKeyboardLanguage](self, "performNextKeyboardLanguage");
        goto LABEL_20;
      }
    }

    BOOL v13 = 0;
    goto LABEL_20;
  }

  -[VOTGesturedTextInputManager pressReturnKeyForElement:](self, "pressReturnKeyForElement:", v9);
LABEL_19:
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

- (void)_prepareNameSearcherForElement:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager nameSearcher](self, "nameSearcher"));

  if (!v4)
  {
    if (-[VOTGesturedTextInputManager _isInHomeScreen:](self, "_isInHomeScreen:", v10))
    {
      id v5 = -[VOTNameSearcherAppSource initWithLaunchContext:]( [VOTNameSearcherAppSource alloc],  "initWithLaunchContext:",  [v10 isInAppSwitcher]);
      uint64_t v6 = -[VOTNameSearcher initWithDelegate:itemSource:filter:]( objc_alloc(&OBJC_CLASS___VOTNameSearcher),  "initWithDelegate:itemSource:filter:",  self,  v5,  self);
      -[VOTGesturedTextInputManager setNameSearcher:](self, "setNameSearcher:", v6);

      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager hintForAppLaunch](self, "hintForAppLaunch"));
    }

    else
    {
      id v5 = -[VOTNameSearcherElementSource initWithElement:]( objc_alloc(&OBJC_CLASS___VOTNameSearcherElementSource),  "initWithElement:",  v10);
      id v8 = -[VOTNameSearcher initWithDelegate:itemSource:filter:]( objc_alloc(&OBJC_CLASS___VOTNameSearcher),  "initWithDelegate:itemSource:filter:",  self,  v5,  self);
      -[VOTGesturedTextInputManager setNameSearcher:](self, "setNameSearcher:", v8);

      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager hintForItemChooser](self, "hintForItemChooser"));
    }

    id v9 = (void *)v7;
    -[VOTGesturedTextInputManager setNameSearcherHint:](self, "setNameSearcherHint:", v7);
  }
}

- (BOOL)_isInHomeScreen:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 application]);
  if ([v4 isSpringBoard])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 immediateRemoteParent]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 application]);
    unsigned __int8 v5 = [v7 isSpringBoard];
  }

  return v5;
}

- (BOOL)_processSearchEvent:(id)a3 forElement:(id)a4
{
  id v5 = a3;
  if (!-[VOTGesturedTextInputManager isNextSuggestionEvent:](self, "isNextSuggestionEvent:", v5))
  {
    if (-[VOTGesturedTextInputManager isPreviousSuggestionEvent:](self, "isPreviousSuggestionEvent:", v5))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager nameSearcher](self, "nameSearcher"));
      [v6 focusOnPreviousMatchingItem];
      goto LABEL_5;
    }

    if (-[VOTGesturedTextInputManager isBackspaceEvent:](self, "isBackspaceEvent:", v5))
    {
      if (!-[VOTGesturedTextInputManager performCustomBackspace](self, "performCustomBackspace"))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[VOTGesturedTextInputManager _stringByDeletingFromCurrentInputStringIfNeeded]( self,  "_stringByDeletingFromCurrentInputStringIfNeeded"));
        -[VOTGesturedTextInputManager setPendingInputString:](self, "setPendingInputString:", v9);

        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager nameSearcher](self, "nameSearcher"));
        [v10 updateMatchingItems];

        -[VOTGesturedTextInputManager _deleteFromCurrentInputStringIfNeeded]( self,  "_deleteFromCurrentInputStringIfNeeded");
      }

      goto LABEL_6;
    }

    if (-[VOTGesturedTextInputManager isSelectItemEvent:](self, "isSelectItemEvent:", v5))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager nameSearcher](self, "nameSearcher"));
      [v11 selectFocusedItem];

      -[VOTGesturedTextInputManager clearCurrentString](self, "clearCurrentString");
      goto LABEL_6;
    }

    if (-[VOTGesturedTextInputManager isNextKeyboardLanguageEvent:](self, "isNextKeyboardLanguageEvent:", v5))
    {
      BOOL v7 = -[VOTGesturedTextInputManager performNextKeyboardLanguage](self, "performNextKeyboardLanguage");
      goto LABEL_7;
    }

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v5 command]);
    if (([v12 isEqualToString:kVOTEventCommandSearchRotorLeft] & 1) == 0)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v5 command]);
      if (([v13 isEqualToString:kVOTEventCommandSearchRotorRight] & 1) == 0)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 command]);
        if (![v14 isEqualToString:kVOTEventCommandEscape])
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 command]);
          if ([v15 isEqualToString:kVOTEventCommandNextTextSegment])
          {
            unsigned __int8 v16 = 1;
          }

          else
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 command]);
            if ([v17 isEqualToString:kVOTEventCommandPreviousTextSegment])
            {
              unsigned __int8 v16 = 1;
            }

            else
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue([v5 command]);
              if ([v18 isEqualToString:kVOTEventCommandSelectRight])
              {
                unsigned __int8 v16 = 1;
              }

              else
              {
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 command]);
                unsigned __int8 v16 = [v19 isEqualToString:kVOTEventCommandSelectLeft];
              }
            }
          }

          if ((v16 & 1) == 0) {
            goto LABEL_6;
          }
LABEL_21:
          BOOL v7 = 0;
          goto LABEL_7;
        }
      }
    }

    goto LABEL_21;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager nameSearcher](self, "nameSearcher"));
  [v6 focusOnNextMatchingItem];
LABEL_5:

LABEL_6:
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (void)_updateLocalizedResources
{
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v2 = 0LL;
  id v3 = &_s10Foundation6LocaleV15AXCoreUtilitiesE014minimalCanonicB10IdentifierSSvg_ptr;
  do
  {
    uint64_t v4 = qword_1001327E0[v2];
    if ((unint64_t)(v4 - 39) < 6)
    {
      id v5 = *(&off_100177EB0 + v4 - 39);
LABEL_4:
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3[491] numberWithInteger:v4]);
      [v15 setObject:v6 forKey:v5];

      BOOL v7 = v5;
LABEL_10:

      goto LABEL_11;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTRotor stringForRotorType:](&OBJC_CLASS___VOTRotor, "stringForRotorType:", qword_1001327E0[v2]));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);

    uint64_t v9 = (uint64_t)[v7 length];
    if (v9 < 1) {
      goto LABEL_10;
    }
    uint64_t v10 = v9;
    uint64_t v11 = 0LL;
    while (1)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%C",  [v7 characterAtIndex:v11]));
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v15 allKeys]);
      unsigned int v13 = [v12 containsObject:0];

      if (!v13) {
        break;
      }

      if (v10 == ++v11)
      {
        id v3 = &_s10Foundation6LocaleV15AXCoreUtilitiesE014minimalCanonicB10IdentifierSSvg_ptr;
        goto LABEL_10;
      }
    }

    id v3 = &_s10Foundation6LocaleV15AXCoreUtilitiesE014minimalCanonicB10IdentifierSSvg_ptr;
    if (v5) {
      goto LABEL_4;
    }
LABEL_11:
    ++v2;
  }

  while (v2 != 14);
  -[VOTGesturedTextInputManager setLocalizedWebRotorMap:](self, "setLocalizedWebRotorMap:", v15);
}

- (unint64_t)_numberOfCharactersToDeleteToDesiredLength:(unint64_t)a3 fromString:(id)a4
{
  id v6 = a4;
  unint64_t v7 = -[VOTGesturedTextInputManager _numberOfCharactersToDeleteStartingAtIndex:toDesiredLength:fromString:]( self,  "_numberOfCharactersToDeleteStartingAtIndex:toDesiredLength:fromString:",  [v6 length],  a3,  v6);

  return v7;
}

- (unint64_t)_numberOfCharactersToDeleteStartingAtIndex:(unint64_t)a3 toDesiredLength:(unint64_t)a4 fromString:(id)a5
{
  id v7 = a5;
  if (a4 >= a3)
  {
    unint64_t v8 = 0LL;
  }

  else
  {
    unint64_t v8 = 0LL;
    do
    {
      id v9 = objc_msgSend(v7, "rangeOfComposedCharacterSequenceAtIndex:", a4, v15, v16, v17);
      NSUInteger v11 = v10;
      if (v9 != (id)a4)
      {
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
        v18.location = (NSUInteger)v9;
        v18.length = v11;
        unsigned int v13 = NSStringFromRange(v18);
        unsigned __int8 v16 = v12;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v13);
        id v15 = v7;
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTGesturedTextInputManager.m",  847LL,  "-[VOTGesturedTextInputManager _numberOfCharactersToDeleteStartingAtIndex:toDesiredLength:fromString:]",  @"Somehow got composed character range that didn't line up.  current string %@, character index %@, range %@");
      }

      a4 = (unint64_t)v9 + v11;
      ++v8;
    }

    while ((unint64_t)v9 + v11 < a3);
  }

  return v8;
}

- (void)itemSource:(id)a3 didFilter:(id)a4 didSwitchFocus:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  NSUInteger v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager pendingInputString](self, "pendingInputString"));
  NSUInteger v11 = objc_alloc_init(&OBJC_CLASS___VOTOutputRequest);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentInputString](self, "currentInputString"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager outputForLatestInput](self, "outputForLatestInput"));
  id v14 = v13;
  if (v13)
  {
    id v15 = v11;
    NSUInteger v11 = v13;
  }

  else
  {
    if ([v12 length] && !objc_msgSend(v10, "hasPrefix:", v12))
    {
      if (![v10 length]) {
        goto LABEL_10;
      }
      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%C",  objc_msgSend(v10, "characterAtIndex:", (char *)objc_msgSend(v10, "length") - 1)));
    }

    else
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v12, "length")));
    }

    id v15 = (void *)v16;
    id v17 = -[VOTOutputRequest addString:](v11, "addString:", v16);
  }

LABEL_10:
  if (v8)
  {
    NSRange v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "messageForMatchingItemsCount:", objc_msgSend(v8, "integerValue")));
    id v19 = -[VOTOutputRequest addString:](v11, "addString:", v18);
  }

  if (v9)
  {
    id v20 = -[VOTOutputRequest addString:](v11, "addString:", v9);
    if ([(id)VOTSharedWorkspace hintsEnabled])
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager nameSearcherHint](self, "nameSearcherHint"));
      if ([v21 length])
      {
        LODWORD(v22) = 1061997773;
        -[VOTOutputRequest addPause:](v11, "addPause:", v22);
        id v23 = -[VOTOutputRequest addString:](v11, "addString:", v21);
      }
    }
  }

  -[VOTOutputRequest send](v11, "send");
}

- (void)itemSource:(id)a3 didSelect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [v6 selectSpeechDelay];
    double v9 = v8;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000500F4;
    v14[3] = &unk_100177E90;
    id v15 = v6;
    id v16 = v7;
    id v17 = self;
    AXPerformBlockOnMainThreadAfterDelay(v14, v10, v9);
  }

  else
  {
    NSUInteger v11 = (void *)objc_claimAutoreleasedReturnValue([v6 messageForNoMatchingItems]);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
    id v13 = sub_10000BBB0(v11, 1, v12);
  }
}

- (id)nameSearcherEntriesPassingSearchFrom:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager pendingInputString](self, "pendingInputString"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager pendingInputString](self, "pendingInputString"));

  if (!v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentInputString](self, "currentInputString"));

    id v5 = (void *)v7;
  }

  if ([v5 length])
  {
    id v19 = v4;
    id v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name", v19));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 lowercaseString]);
          unsigned int v17 = [v15 hasPrefix:v16];

          if (v17) {
            -[NSMutableArray addObject:](v20, "addObject:", v13);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v10);
    }

    id v4 = v19;
  }

  else
  {
    id v20 = (NSMutableArray *)v4;
  }

  return v20;
}

- (VOTGesturedTextInputManagerDelegate)delegate
{
  return (VOTGesturedTextInputManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)rotorType
{
  return self->_rotorType;
}

- (void)setRotorType:(int64_t)a3
{
  self->_rotorType = a3;
}

- (NSDictionary)localizedWebRotorMap
{
  return self->_localizedWebRotorMap;
}

- (void)setLocalizedWebRotorMap:(id)a3
{
}

- (VOTNameSearcher)nameSearcher
{
  return self->_nameSearcher;
}

- (void)setNameSearcher:(id)a3
{
}

- (VOTElement)nameSearcherMonitorElement
{
  return self->_nameSearcherMonitorElement;
}

- (void)setNameSearcherMonitorElement:(id)a3
{
}

- (NSString)nameSearcherHint
{
  return self->_nameSearcherHint;
}

- (void)setNameSearcherHint:(id)a3
{
}

- (NSString)currentInputString
{
  return self->_currentInputString;
}

- (void)setCurrentInputString:(id)a3
{
}

- (NSString)pendingInputString
{
  return self->_pendingInputString;
}

- (void)setPendingInputString:(id)a3
{
}

- (void).cxx_destruct
{
}

- (int64_t)valueChangeOriginator
{
  return 0LL;
}

- (BOOL)isSpaceEvent:(id)a3
{
  return result;
}

- (BOOL)isBackspaceEvent:(id)a3
{
  return result;
}

- (BOOL)isWordBackspaceEvent:(id)a3
{
  return result;
}

- (BOOL)isReturnKeyEvent:(id)a3
{
  return result;
}

- (BOOL)isNextSuggestionEvent:(id)a3
{
  return result;
}

- (BOOL)isPreviousSuggestionEvent:(id)a3
{
  return result;
}

- (BOOL)isSelectItemEvent:(id)a3
{
  return result;
}

- (BOOL)isNextKeyboardLanguageEvent:(id)a3
{
  return result;
}

- (BOOL)isNextBrailleTableEvent:(id)a3
{
  return result;
}

- (void)applyNextSuggestionToElement:(id)a3
{
}

- (void)applyPreviousSuggestionToElement:(id)a3
{
}

@end