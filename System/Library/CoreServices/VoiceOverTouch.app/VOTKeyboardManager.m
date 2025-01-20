@interface VOTKeyboardManager
+ (id)keyboardManager;
+ (void)initialize;
- (AXEventRepresentation)lastDispatchedKeyEvent;
- (BOOL)_dispatchCommandForKeyInfo:(id)a3 isRepeatedEvent:(BOOL)a4;
- (BOOL)_handleArrowKeyEvent:(id)a3;
- (BOOL)_handleBrailleKeyEvent:(id)a3;
- (BOOL)_keyEventShouldGoToFocusedContext:(id)a3;
- (BOOL)_keyInfoIsModifierOnly:(id)a3;
- (BOOL)captureModeEnabled;
- (BOOL)controlKeyToggleSpeakingAllowed;
- (BOOL)explictlyEnabledQuickNav;
- (BOOL)isQuickNavOn;
- (BOOL)modifierKeyLockEnabled;
- (VOTKeyInfo)lastReleasedToSystemKeyEvent;
- (VOTKeyboardManager)init;
- (double)lastDispatchedKeyEventTime;
- (double)lastReleasedToSystemKeyEventTime;
- (double)lastVolumeDownButtonDownTime;
- (double)lastVolumeDownButtonUpTime;
- (double)lastVolumeUpButtonDownTime;
- (double)lastVolumeUpButtonUpTime;
- (double)quickNavDownDurationAllowedAcceptance;
- (id)_characterStringRepresentationForKey:(id)a3;
- (id)_localizeKeyboardString:(id)a3;
- (id)keyDownInfo;
- (id)keyboardEventForKeyInfo:(id)a3;
- (id)singleLetterCommandForKeyInfo:(id)a3;
- (id)testingEventDispatchTap;
- (id)testingProcessEventCallback;
- (id)threadSafe_keyDownInfo;
- (void)_axEndPassthroughTouch;
- (void)_axStartPassthroughTouch;
- (void)_dispatchEventRepresentationIntoSystem:(id)a3;
- (void)_dispatchKeyEventIntoSystem:(id)a3;
- (void)_handleAnnouncementsForKeyInfo:(id)a3;
- (void)_handleCapsLockToggle:(id)a3;
- (void)_handleKeyboardKeyEvent:(id)a3;
- (void)_handleKeyboardKeyEvent:(id)a3 isRepeatedEvent:(BOOL)a4;
- (void)_handleModifierCapsLockBehavior:(id)a3;
- (void)_handleNonPerkinsKeyboardKeyEvent:(id)a3 isRepeatedEvent:(BOOL)a4;
- (void)_handleQuickNavDownArrowRepostPress:(id)a3;
- (void)_handleQuickNavPress:(id)a3;
- (void)_handleQuickNavPressTimer:(id)a3;
- (void)_initializeQuickNav;
- (void)_initializeThread;
- (void)_keyRepeat:(id)a3;
- (void)_postEvent:(id)a3;
- (void)_postKeyboardKey:(id)a3 keyCode:(unsigned __int16)a4 eventFlags:(unsigned int)a5 keyFlags:(unsigned __int16)a6 keyDown:(BOOL)a7 source:(unsigned __int16)a8;
- (void)_processVolumeButtonsForCurtainReset:(id)a3;
- (void)_resetSoundAndScreenCurtain;
- (void)_sendEvent:(id)a3 withKeyInfo:(id)a4 arrowMask:(int64_t)a5;
- (void)_sendEventForCommand:(id)a3 withKeyInfo:(id)a4 arrowMask:(int64_t)a5;
- (void)_speakCapsLockKey;
- (void)_updateConsecutiveKeyCount:(id)a3;
- (void)_updateEventFlags:(id)a3;
- (void)_verifyCorrectThread;
- (void)clearConsecutiveKeyPressCount;
- (void)dealloc;
- (void)handleKeyboardKeyEvent:(id)a3 eventOrigin:(int64_t)a4;
- (void)loadKeyboardMap;
- (void)postEvent:(id)a3;
- (void)setCaptureModeEnabled:(BOOL)a3;
- (void)setCommandManager:(id)a3;
- (void)setControlKeyToggleSpeakingAllowed:(BOOL)a3;
- (void)setExplictlyEnabledQuickNav:(BOOL)a3;
- (void)setKeyDownInfo:(id)a3;
- (void)setLastDispatchedKeyEvent:(id)a3;
- (void)setLastDispatchedKeyEventTime:(double)a3;
- (void)setLastReleasedToSystemKeyEvent:(id)a3;
- (void)setLastReleasedToSystemKeyEventTime:(double)a3;
- (void)setLastVolumeDownButtonDownTime:(double)a3;
- (void)setLastVolumeDownButtonUpTime:(double)a3;
- (void)setLastVolumeUpButtonDownTime:(double)a3;
- (void)setLastVolumeUpButtonUpTime:(double)a3;
- (void)setQuickNavDownDurationAllowedAcceptance:(double)a3;
- (void)setTestingEventDispatchTap:(id)a3;
- (void)setTestingProcessEventCallback:(id)a3;
- (void)toggleVoiceOverModifierKeyLock;
- (void)updateQuickNavState:(BOOL)a3;
@end

@implementation VOTKeyboardManager

+ (void)initialize
{
  if (!qword_1001ACFE0)
  {
    id v2 = [objc_allocWithZone((Class)VOTKeyboardManager) init];
    v3 = (void *)qword_1001ACFE0;
    qword_1001ACFE0 = (uint64_t)v2;
  }

+ (id)keyboardManager
{
  return (id)qword_1001ACFE0;
}

- (void)setCommandManager:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTKeyboardManager;
  -[VOTKeyboardManager dealloc](&v3, "dealloc");
}

- (VOTKeyboardManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___VOTKeyboardManager;
  id v2 = -[VOTKeyboardManager init](&v18, "init");
  if (v2)
  {
    objc_storeStrong((id *)&qword_1001ACFE0, v2);
    objc_super v3 = objc_alloc(&OBJC_CLASS___NSDictionary);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathForResource:@"VOTSingleLetterCommands" ofType:@"plist"]);
    v6 = -[NSDictionary initWithContentsOfFile:](v3, "initWithContentsOfFile:", v5);
    singleLetterCommandsTable = v2->_singleLetterCommandsTable;
    v2->_singleLetterCommandsTable = v6;

    -[VOTKeyboardManager loadKeyboardMap](v2, "loadKeyboardMap");
    -[VOTKeyboardManager _initializeQuickNav](v2, "_initializeQuickNav");
    v8 = objc_alloc_init(&OBJC_CLASS___NSLock);
    keyDownLock = v2->_keyDownLock;
    v2->_keyDownLock = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___SCRCThread);
    keyboardThread = v2->_keyboardThread;
    v2->_keyboardThread = v10;

    -[SCRCThread performSelector:onTarget:count:objects:]( v2->_keyboardThread,  "performSelector:onTarget:count:objects:",  "_initializeThread",  v2,  0LL,  0LL);
    v12 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_keyRepeat:" thread:v2->_keyboardThread];
    keyRepeatTimer = v2->_keyRepeatTimer;
    v2->_keyRepeatTimer = v12;

    -[VOTKeyboardManager setControlKeyToggleSpeakingAllowed:](v2, "setControlKeyToggleSpeakingAllowed:", 1LL);
    v2->_quickNavDownStateTime[0] = 0.0;
    v2->_quickNavDownStateTime[1] = 0.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 preferenceForKey:@"VOTModifierKeyLockKey"]);
    v2->_modifierKeyLockEnabled = [v15 BOOLValue];

    v16 = v2;
  }

  return v2;
}

- (void)_verifyCorrectThread
{
  if (([(id)VOTSharedWorkspace inUnitTestMode] & 1) == 0
    && (-[SCRCThread _debug_currentlyRunningOnThisThread]( self->_keyboardThread,  "_debug_currentlyRunningOnThisThread") & 1) == 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTKeyboardManager.m",  188LL,  "-[VOTKeyboardManager _verifyCorrectThread]",  @"Wrong thread for setting %@");
  }

- (void)toggleVoiceOverModifierKeyLock
{
  self->_modifierKeyLockEnabled ^= 1u;
}

- (BOOL)modifierKeyLockEnabled
{
  return self->_modifierKeyLockEnabled;
}

- (void)_initializeThread
{
  v5 = NSStringFromClass(v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  [v6 setName:v8];

  BOOL v7 = BKSHIDServicesIsCapsLockLightOn() != 0;
  self->_fakeCapsLockOn = v7;
  self->_realCapsLockOn = v7;
}

- (void)handleKeyboardKeyEvent:(id)a3 eventOrigin:(int64_t)a4
{
  id v7 = a3;
  if (!self->_lastLayout) {
    -[VOTKeyboardManager loadKeyboardMap](self, "loadKeyboardMap");
  }
  id v6 = [objc_allocWithZone((Class)VOTKeyInfo) initWithEventRepresentation:v7];
  [v6 setEventOrigin:a4];
  -[SCRCThread performSelector:onTarget:count:objects:]( self->_keyboardThread,  "performSelector:onTarget:count:objects:",  "_handleKeyboardKeyEvent:",  self,  1LL,  v6);
}

- (void)loadKeyboardMap
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace applicationForCurrentElement]);
  Class v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentHardwareKeyboardLayout]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
    uint64_t v8 = AXLoggerForFacility(v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel(2LL);
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = AXColorizeFormatLog(2LL, @"Current Hardware Keyboard Layout: %{public}@");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v38 = v4;
      uint64_t v13 = _AXStringForArgs(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "%{public}@", buf, 0xCu);
      }
    }
  }

  if (self->_lastLayout && (objc_msgSend(v4, "isEqualToString:") & 1) != 0)
  {
    v15 = v4;
  }

  else
  {
    if (objc_msgSend(v4, "isEqualToString:", @"Automatic", v38))
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace applicationForCurrentElement]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v16 currentSoftwareKeyboardLayout]);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
      LOBYTE(v16) = [v17 ignoreLogging];

      if ((v16 & 1) == 0)
      {
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
        uint64_t v19 = AXLoggerForFacility(v18);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

        os_log_type_t v21 = AXOSLogLevelFromAXLogLevel(2LL);
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = AXColorizeFormatLog(2LL, @"Current SW Keyboard Layout: %{public}@");
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v39 = v15;
          uint64_t v24 = _AXStringForArgs(v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v25;
            _os_log_impl((void *)&_mh_execute_header, v20, v21, "%{public}@", buf, 0xCu);
          }
        }
      }
    }

    else
    {
      v15 = v4;
    }

    layoutToKeyboardMap = self->_layoutToKeyboardMap;
    if (!layoutToKeyboardMap)
    {
      v27 = objc_alloc(&OBJC_CLASS___NSDictionary);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 pathForResource:@"VOTLayoutToKeyboardMap" ofType:@"plist"]);
      v30 = -[NSDictionary initWithContentsOfFile:](v27, "initWithContentsOfFile:", v29);
      v31 = self->_layoutToKeyboardMap;
      self->_layoutToKeyboardMap = v30;

      layoutToKeyboardMap = self->_layoutToKeyboardMap;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](layoutToKeyboardMap, "objectForKey:", v15, v39));
    if ([v32 length])
    {
      v33 = objc_alloc(&OBJC_CLASS___NSDictionary);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v35 = (void *)objc_claimAutoreleasedReturnValue( [v34 pathForResource:v32 ofType:@"plist" inDirectory:@"VOTKeyboardMaps"]);
      v36 = -[NSDictionary initWithContentsOfFile:](v33, "initWithContentsOfFile:", v35);
      keyboardMap = self->_keyboardMap;
      self->_keyboardMap = v36;

      objc_storeStrong((id *)&self->_lastLayout, v15);
    }
  }
}

- (id)_characterStringRepresentationForKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 originalCharacters]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet controlCharacterSet](&OBJC_CLASS___NSCharacterSet, "controlCharacterSet"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByTrimmingCharactersInSet:v6]);
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager _localizeKeyboardString:](self, "_localizeKeyboardString:", v7));

  if ([v4 isShiftKeyPressed])
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[__CFString uppercaseString](v8, "uppercaseString"));

    uint64_t v8 = (__CFString *)v9;
  }

  if (!-[__CFString length](v8, "length"))
  {
    unsigned int v11 = [v4 keyCode];
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 eventRecord]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 keyInfo]);
    unsigned int v14 = [v13 alternativeKeyCode];

    if (v14) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = v11;
    }
    switch(v15)
    {
      case '(':

        uint64_t v8 = @"return";
        break;
      case ':':

        uint64_t v8 = @"f1";
        break;
      case ';':

        uint64_t v8 = @"f2";
        break;
      case '<':

        uint64_t v8 = @"f3";
        break;
      case '=':

        uint64_t v8 = @"f4";
        break;
      case '>':

        uint64_t v8 = @"f5";
        break;
      case '?':

        uint64_t v8 = @"f6";
        break;
      case '@':

        uint64_t v8 = @"f7";
        break;
      case 'A':

        uint64_t v8 = @"f8";
        break;
      case 'B':

        uint64_t v8 = @"f9";
        break;
      case 'C':

        uint64_t v8 = @"f10";
        break;
      case 'D':

        uint64_t v8 = @"f11";
        break;
      case 'E':

        uint64_t v8 = @"f12";
        break;
      case 'J':

        uint64_t v8 = @"home";
        break;
      case 'K':

        uint64_t v8 = @"pageup";
        break;
      case 'M':

        uint64_t v8 = @"end";
        break;
      case 'N':

        uint64_t v8 = @"pagedown";
        break;
      case 'O':
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
        unsigned int v17 = [v16 isFNKeyPressed];

        objc_super v18 = @"right";
        uint64_t v19 = @"end";
        goto LABEL_30;
      case 'P':
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
        unsigned int v17 = [v20 isFNKeyPressed];

        objc_super v18 = @"left";
        uint64_t v19 = @"home";
        goto LABEL_30;
      case 'Q':
        os_log_type_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
        unsigned int v17 = [v21 isFNKeyPressed];

        objc_super v18 = @"down";
        uint64_t v19 = @"pagedown";
        goto LABEL_30;
      case 'R':
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
        unsigned int v17 = [v22 isFNKeyPressed];

        objc_super v18 = @"up";
        uint64_t v19 = @"pageup";
LABEL_30:
        if (v17) {
          uint64_t v8 = (__CFString *)v19;
        }
        else {
          uint64_t v8 = (__CFString *)v18;
        }
        break;
      case 'X':

        uint64_t v8 = @"⌤";
        break;
      default:
        break;
    }
  }

  return v8;
}

- (id)keyboardEventForKeyInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTKeyboardManager _characterStringRepresentationForKey:]( self,  "_characterStringRepresentationForKey:",  v4));
  id v27 = [v5 copy];
  if ([v4 isCommandKeyPressed])
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"_command"]);

    v5 = (void *)v6;
  }

  if ([v4 isShiftKeyPressed]
    && (([v27 isEqualToString:@"home"] & 1) != 0
     || ([v27 isEqualToString:@"end"] & 1) != 0
     || ([v27 isEqualToString:@"pagedown"] & 1) != 0
     || ([v27 isEqualToString:@"pageup"] & 1) != 0
     || ([v27 isEqualToString:@"right"] & 1) != 0
     || ([v27 isEqualToString:@"left"] & 1) != 0
     || ([v27 isEqualToString:@"up"] & 1) != 0
     || ([v27 isEqualToString:@"down"] & 1) != 0
     || ([v27 isEqualToString:@"f3"] & 1) != 0
     || ([v27 isEqualToString:@"f4"] & 1) != 0
     || ([v27 isEqualToString:@"["] & 1) != 0
     || ([v27 isEqualToString:@"]"] & 1) != 0
     || [v27 isEqualToString:@"-"]))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"_shift"]);

    v5 = (void *)v7;
  }

  if ([v4 isFNKeyPressed]
    && ([v27 isEqualToString:@"home"] & 1) == 0
    && ([v27 isEqualToString:@"end"] & 1) == 0
    && ([v27 isEqualToString:@"pagedown"] & 1) == 0
    && ([v27 isEqualToString:@"pageup"] & 1) == 0
    && ([v27 isEqualToString:@"f11"] & 1) == 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"_fn"]);

    v5 = (void *)v8;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyChord keyboardShortcutKeyChordWithInfo:characters:]( &OBJC_CLASS___AXSSKeyChord,  "keyboardShortcutKeyChordWithInfo:characters:",  v4,  v5));
  os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[VOSCommandResolver resolverForCurrentHost]( &OBJC_CLASS___VOSCommandResolver,  "resolverForCurrentHost"));
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000C402C;
  v31[3] = &unk_100179B78;
  objc_copyWeak(&v32, &location);
  [v10 setFetchPressCountBlock:v31];
  [v10 setFetchContextBlock:&stru_100179BB8];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000C40B8;
  v28[3] = &unk_100179BE0;
  objc_copyWeak(&v30, &location);
  unsigned int v11 = v5;
  v29 = v11;
  [v10 setResolvingEventOccurredBlock:v28];
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue( -[VOSCommandManager commandForKeyChord:withResolver:]( self->_commandManager,  "commandForKeyChord:withResolver:",  v9,  v10));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString votEventCommandName](v12, "votEventCommandName"));
  BOOL v14 = v13 == 0LL;

  if (v14)
  {
    uint64_t v20 = VOTLogKeyboard();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      unsigned int v21 = [v4 isFNKeyPressed];
      unsigned int v22 = [v4 isShiftKeyPressed];
      v23 = @"NO";
      if (v21) {
        uint64_t v24 = @"YES";
      }
      else {
        uint64_t v24 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      v35 = v11;
      __int16 v36 = 2112;
      v37 = v24;
      if (v22) {
        v23 = @"YES";
      }
      __int16 v38 = 2112;
      v39 = v23;
      uint64_t v19 = "❌ no customized command found for original characters '%@'. Fn-pressed? %@ shiftPressed? %@";
      goto LABEL_37;
    }
  }

  else
  {
    uint64_t v15 = VOTLogKeyboard();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      unsigned int v17 = [v4 isFNKeyPressed];
      objc_super v18 = @"NO";
      *(_DWORD *)buf = 138412802;
      v35 = v12;
      __int16 v36 = 2112;
      if (v17) {
        objc_super v18 = @"YES";
      }
      v37 = v11;
      __int16 v38 = 2112;
      v39 = v18;
      uint64_t v19 = "✅ returning customized vosCommand: '%@' for characters '%@' Fn-pressed? %@";
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v19, buf, 0x20u);
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue( -[VOSCommandManager eventForKeyChord:resolver:info:]( self->_commandManager,  "eventForKeyChord:resolver:info:",  v9,  v10,  v4));
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v25;
}

- (id)singleLetterCommandForKeyInfo:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 characters]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager _localizeKeyboardString:](self, "_localizeKeyboardString:", v5));

  LODWORD(v5) = [v4 isShiftKeyPressed];
  if ((_DWORD)v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 uppercaseString]);

    uint64_t v6 = (void *)v7;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_singleLetterCommandsTable, "objectForKey:", v6));

  return v8;
}

- (void)postEvent:(id)a3
{
  id v4 = a3;
  id v5 = [objc_allocWithZone((Class)VOTKeyInfo) initWithEventRepresentation:v4];

  -[SCRCThread performSelector:onTarget:count:objects:]( self->_keyboardThread,  "performSelector:onTarget:count:objects:",  "_postEvent:",  self,  1LL,  v5);
}

- (id)threadSafe_keyDownInfo
{
  id v3 = -[VOTKeyInfo copy](self->_keyDownInfo, "copy");
  -[NSLock unlock](self->_keyDownLock, "unlock");
  return v3;
}

- (id)keyDownInfo
{
  return self->_keyDownInfo;
}

- (void)updateQuickNavState:(BOOL)a3
{
  self->_isQuickNavOn = a3;
  self->_explictlyEnabledQuickNav = 0;
}

- (void)_updateConsecutiveKeyCount:(id)a3
{
  id v12 = a3;
  unsigned int v4 = [v12 keyDown];
  id v5 = v12;
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[VOTKeyboardManager _characterStringRepresentationForKey:]( self,  "_characterStringRepresentationForKey:",  v12));
    if ([v6 length])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTKeyboardManager _characterStringRepresentationForKey:]( self,  "_characterStringRepresentationForKey:",  self->_lastKeyForTapCount));
      unsigned int v8 = [v7 isEqualToString:v6];

      if (v8) {
        int64_t v9 = self->_consecutiveKeyPressCount + 1;
      }
      else {
        int64_t v9 = 1LL;
      }
      self->_consecutiveKeyPressCount = v9;
      os_log_type_t v10 = (VOTKeyInfo *)[v12 copy];
      lastKeyForTapCount = self->_lastKeyForTapCount;
      self->_lastKeyForTapCount = v10;
    }

    id v5 = v12;
  }
}

- (void)setKeyDownInfo:(id)a3
{
  id v5 = (VOTKeyInfo *)a3;
  -[VOTKeyboardManager _verifyCorrectThread](self, "_verifyCorrectThread");
  -[NSLock lock](self->_keyDownLock, "lock");
  if (self->_keyDownInfo != v5) {
    objc_storeStrong((id *)&self->_keyDownInfo, a3);
  }
  -[NSLock unlock](self->_keyDownLock, "unlock");
}

- (id)_localizeKeyboardString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_keyboardMap, "objectForKey:", v4));
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  else {
    uint64_t v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (BOOL)_dispatchCommandForKeyInfo:(id)a3 isRepeatedEvent:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
  unsigned int v7 = [v6 isSystemSleeping];

  if (!v7)
  {
    if (self->_modifierToggleSpeakingKeyDown
      && ![v5 modifierState]
      && -[VOTKeyboardManager controlKeyToggleSpeakingAllowed](self, "controlKeyToggleSpeakingAllowed"))
    {
      os_log_type_t v10 = (__CFString *)kVOTEventCommandToggleSpeaking;
      id v12 = 0LL;
      goto LABEL_54;
    }

    -[SCRCTargetSelectorTimer cancel](self->_keyRepeatTimer, "cancel");
    if (self->_captureModeEnabled && [v5 keyCode] != 41)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent keyEventWithCommand:keyInfo:]( &OBJC_CLASS___VOTEvent,  "keyEventWithCommand:keyInfo:",  0LL,  v5));
      [(id)VOTSharedWorkspace dispatchCommand:v12];
LABEL_21:
      os_log_type_t v10 = 0LL;
      BOOL v11 = 1;
LABEL_100:

      goto LABEL_101;
    }

    if (sub_1000C2F38(v5, self->_capsLockDown))
    {
      else {
        id v13 = (id)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
      }
      uint64_t v16 = v13;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyboardEventForKeyInfo:](self, "keyboardEventForKeyInfo:", v13));
      os_log_type_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 command]);
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager lastReleasedToSystemKeyEvent](self, "lastReleasedToSystemKeyEvent"));

      if (v17)
      {
        if (([v5 isOptionKeyPressed] & 1) != 0
          || [v5 isControlKeyPressed])
        {
          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager lastReleasedToSystemKeyEvent](self, "lastReleasedToSystemKeyEvent"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 eventRecord]);
          id v20 = [v19 copy];

          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 keyInfo]);
          [v21 setKeyDown:0];

          [v20 setType:11];
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v20 keyInfo]);
          [v22 setModifierState:0];

          v23 = -[VOTKeyInfo initWithEventRepresentation:]( objc_alloc(&OBJC_CLASS___VOTKeyInfo),  "initWithEventRepresentation:",  v20);
          -[VOTKeyboardManager _dispatchKeyEventIntoSystem:](self, "_dispatchKeyEventIntoSystem:", v23);

          uint64_t v26 = AXLogCommon(v24, v25);
          id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            int v62 = 138412290;
            *(void *)v63 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Released our snarfed modifier key: %@",  (uint8_t *)&v62,  0xCu);
          }
        }

        -[VOTKeyboardManager setLastReleasedToSystemKeyEvent:](self, "setLastReleasedToSystemKeyEvent:", 0LL);
      }

      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_axStartPassthroughTouch",  0LL);
      if (-[__CFString isEqualToString:](v10, "isEqualToString:", kVOTEventCommandSimpleTap)
        && [v5 keyDown])
      {
        -[VOTKeyboardManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_axStartPassthroughTouch",  0LL,  0.5);
      }

      else
      {
        -[VOTKeyboardManager _axEndPassthroughTouch](self, "_axEndPassthroughTouch");
      }

      if ([v5 keyDown])
      {

        id v12 = 0LL;
        os_log_type_t v10 = 0LL;
      }

      if (v10) {
        goto LABEL_54;
      }
    }

    else if (self->_isQuickNavOn {
           && [(id)VOTSharedWorkspace allowSingleLetterSearching]
    }
           && (BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v5 eventRecord]),
               char IsVolumeButtonPress = AXEventTypeIsVolumeButtonPress([v14 originalType]),
               v14,
               (IsVolumeButtonPress & 1) == 0))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
      v56 = v55;
      if (!v55
        || ([v55 isCommandKeyPressed] & 1) != 0
        || ([v56 isControlKeyPressed] & 1) != 0)
      {
        os_log_type_t v10 = 0LL;
      }

      else
      {
        if ([v5 isEscapeKey])
        {
          unsigned int v60 = [v5 isShiftKeyPressed];
          v61 = (id *)&kVOTEventCommandEscape;
          if (v60) {
            v61 = (id *)&kVOTEventCommandShowSideApp;
          }
        }

        else
        {
          if (![v5 keyUp])
          {

            id v12 = 0LL;
            os_log_type_t v10 = &stru_10017A920;
            goto LABEL_54;
          }

          v61 = (id *)&kVOTEventCommandSingleLetterSearch;
        }

        os_log_type_t v10 = (__CFString *)*v61;
      }

      id v12 = 0LL;
      if (v10) {
        goto LABEL_54;
      }
    }

    else
    {
      id v12 = 0LL;
    }

    if ([v5 keyUp] && objc_msgSend(v5, "keyCode") == 41)
    {
      unsigned int v28 = [v5 isShiftKeyPressed];
      v29 = (id *)&kVOTEventCommandShowSideApp;
      if (!v28) {
        v29 = (id *)&kVOTEventCommandEscape;
      }
      id v30 = (__CFString *)*v29;
      if (v30)
      {
        os_log_type_t v10 = v30;
        goto LABEL_54;
      }
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
    if ([v31 helpEnabled])
    {
      if ([v5 keyUp])
      {

LABEL_48:
        if (-[NSString isEqualToString:](self->_lastCommand, "isEqualToString:", kVOTEventCommandStartHelp)
          && [v5 modifiersChanged]
          && (([v5 isOptionKeyPressed] & 1) != 0
           || [v5 isControlKeyPressed]))
        {
          lastCommand = self->_lastCommand;
          self->_lastCommand = 0LL;
        }

        else if ([v5 keyCode] != 57)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent keyEventWithCommand:keyInfo:]( &OBJC_CLASS___VOTEvent,  "keyEventWithCommand:keyInfo:",  0LL,  0LL));

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
          id v51 = [v50 copy];

          else {
            id v52 = v5;
          }
          [v49 setKeyInfo:v52];
          [(id)VOTSharedWorkspace dispatchCommand:v49];

          os_log_type_t v10 = 0LL;
          BOOL v11 = 1;
          id v12 = v49;
          goto LABEL_100;
        }

        goto LABEL_21;
      }

      unsigned int v32 = [v5 modifiersChanged];

      if (v32) {
        goto LABEL_48;
      }
    }

    else
    {
    }

    os_log_type_t v10 = 0LL;
LABEL_54:
    v34 = (void *)objc_claimAutoreleasedReturnValue([v5 characters]);
    id v35 = [v34 length];

    if (v35)
    {
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v5 characters]);
      LODWORD(v35) = [v36 characterAtIndex:0];
    }

    uint64_t v37 = VOTLogKeyboard();
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v57 = [v5 keyUp];
      v58 = (void *)objc_claimAutoreleasedReturnValue([v5 characters]);
      unsigned int v59 = [(id)VOTSharedWorkspace allowSingleLetterSearching];
      int v62 = 67110146;
      *(_DWORD *)v63 = v57;
      *(_WORD *)&v63[4] = 2114;
      *(void *)&v63[6] = v58;
      __int16 v64 = 1024;
      int v65 = (int)v35;
      __int16 v66 = 2114;
      v67 = v10;
      __int16 v68 = 1024;
      unsigned int v69 = v59;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "Key State: %d, Character(s): %{public}@ [%d], Command: %{public}@, Single Letter State: %d",  (uint8_t *)&v62,  0x28u);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
    unint64_t v41 = (unint64_t)[v39 modifierKeyChoiceForElement:v40];

    BOOL v11 = !self->_modifierToggleSpeakingKeyDown;
    if ([v5 isControlKeyPressed] && self->_currentModifiers == 4)
    {
      LOBYTE(v42) = 1;
    }

    else if ([v5 keyCode] == 57)
    {
      BOOL v42 = (v41 >> 1) & 1;
      if (self->_currentModifiers != 16) {
        LOBYTE(v42) = 0;
      }
    }

    else
    {
      LOBYTE(v42) = 0;
    }

    self->_modifierToggleSpeakingKeyDown = v42;
    objc_storeStrong((id *)&self->_lastCommand, v10);
    if (!v10)
    {
      if (sub_1000C2F38(v5, self->_capsLockDown))
      {
        if ([v5 keyUp])
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyInfo characters](self->_keyDownInfo, "characters"));
          id v46 = [v45 length];

          if (v46)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent UnknownCommand](&OBJC_CLASS___VOSOutputEvent, "UnknownCommand"));
            [v47 sendEvent:v48];
          }
        }

        BOOL v11 = 1;
      }

      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_89;
    }

    unsigned __int8 v43 = [v5 keyUp];
    if (v12)
    {
      if ((v43 & 1) == 0)
      {
        -[VOTKeyboardManager _sendEvent:withKeyInfo:arrowMask:](self, "_sendEvent:withKeyInfo:arrowMask:", v12, v5, 0LL);
        goto LABEL_88;
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
      -[VOTKeyboardManager _sendEvent:withKeyInfo:arrowMask:](self, "_sendEvent:withKeyInfo:arrowMask:", v12, v44, 0LL);
    }

    else
    {
      if ((v43 & 1) == 0)
      {
        -[VOTKeyboardManager _sendEventForCommand:withKeyInfo:arrowMask:]( self,  "_sendEventForCommand:withKeyInfo:arrowMask:",  v10,  v5,  0LL);
        goto LABEL_88;
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
      -[VOTKeyboardManager _sendEventForCommand:withKeyInfo:arrowMask:]( self,  "_sendEventForCommand:withKeyInfo:arrowMask:",  v10,  v44,  0LL);
    }

LABEL_88:
    -[VOTKeyboardManager setControlKeyToggleSpeakingAllowed:](self, "setControlKeyToggleSpeakingAllowed:", 0LL);
LABEL_89:
    if ([v5 keyCode] == 57 && (v41 & 2) != 0)
    {
      if ([v5 keyDown])
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
        [v53 setCapsLockLightOn:self->_fakeCapsLockOn];
      }

      BOOL v11 = 1;
    }

    if (!self->_currentModifiers
      && (([v5 keyUp] & 1) != 0 || objc_msgSend(v5, "modifiersChanged")))
    {
      -[VOTKeyboardManager setControlKeyToggleSpeakingAllowed:](self, "setControlKeyToggleSpeakingAllowed:", 1LL);
    }

    goto LABEL_100;
  }

  uint64_t v8 = AXLogSystemApp();
  int64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v62) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "VOT requesting system-app wake-up for key dispatch",  (uint8_t *)&v62,  2u);
  }

  os_log_type_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
  -[__CFString wakeUpDeviceIfNecessary](v10, "wakeUpDeviceIfNecessary");
  BOOL v11 = 0;
LABEL_101:

  return v11;
}

- (void)_axStartPassthroughTouch
{
  self->_passthroughStart = CGPointZero;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
  if (v3)
  {
    id v12 = v3;
    id v4 = [v3 windowContextId];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
    [v6 centerPoint];
    objc_msgSend(v5, "convertPoint:fromContextId:", v4);
    self->_passthroughStart.x = v7;
    self->_passthroughStart.y = v8;

    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    objc_msgSend( v9,  "postFingerTouchAtPoint:withForce:withContextId:",  v4,  self->_passthroughStart.x,  self->_passthroughStart.y,  0.0);

    os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidBeginPassthrough](&OBJC_CLASS___VOSOutputEvent, "DidBeginPassthrough"));
    [v10 sendEvent:v11];

    id v3 = v12;
  }
}

- (void)_axEndPassthroughTouch
{
  p_passthroughStart = &self->_passthroughStart;
  if (CGPointZero.x != self->_passthroughStart.x || CGPointZero.y != self->_passthroughStart.y)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
    objc_msgSend( v5,  "postFingerLiftAtPoint:withContextId:",  objc_msgSend(v6, "windowContextId"),  self->_passthroughStart.x,  self->_passthroughStart.y);

    CGPoint *p_passthroughStart = CGPointZero;
  }

- (void)_initializeQuickNav
{
  id v3 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:self selector:"_handleQuickNavPressTimer:"];
  quickNavKeyTimer = self->_quickNavKeyTimer;
  self->_quickNavKeyTimer = v3;

  id v5 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:self selector:"_handleQuickNavDownArrowRepostPress:"];
  quickNavRepostTimer = self->_quickNavRepostTimer;
  self->_quickNavRepostTimer = v5;

  xmmword_1001ACFF0 = xmmword_100132DF0;
  unk_1001AD000 = xmmword_100132E00;
}

- (BOOL)_handleArrowKeyEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isArrowKey] && (sub_1000C2F38(v4, self->_capsLockDown) & 1) == 0)
  {
    uint64_t v6 = *((void *)&xmmword_1001ACFF0 + [v4 keyCode] - 79);
    unint64_t quickNavStateMask = self->_quickNavStateMask;
    BOOL v8 = [v4 keyCode] == 79 || objc_msgSend(v4, "keyCode") == 80;
    unsigned int v9 = [v4 keyCode];
    if ([v4 keyDown])
    {
      self->_quickNavStateMask |= v6;
      if (v8)
      {
        BOOL v10 = v9 != 79;
        if (self->_quickNavDownStateTime[v10] == 0.0) {
          self->_quickNavDownStateTime[v10] = CFAbsoluteTimeGetCurrent();
        }
      }
    }

    else if ([v4 keyUp])
    {
      if (v8)
      {
        double v11 = self->_quickNavDownStateTime[0];
        if (v11 > 0.0)
        {
          double v12 = self->_quickNavDownStateTime[1];
          if (v12 > 0.0) {
            self->_quickNavLastRecordedActivation = vabdd_f64(v11, v12);
          }
        }

        self->_quickNavDownStateTime[v9 != 79] = 0.0;
      }

      self->_quickNavStateMask &= ~v6;
    }

    if ([v4 keyDown])
    {
      unint64_t v13 = self->_quickNavStateMask;
      self->_unint64_t quickNavLastDownState = v13;
      if (quickNavStateMask == v13) {
        -[VOTKeyboardManager _handleQuickNavPress:](self, "_handleQuickNavPress:", v4);
      }
      else {
        -[SCRCTargetSelectorTimer dispatchAfterDelay:withObject:]( self->_quickNavKeyTimer,  "dispatchAfterDelay:withObject:",  v4,  0.25);
      }
    }

    unint64_t quickNavLastDownState = self->_quickNavLastDownState;
    uint64_t v15 = quickNavLastDownState & 0xFFFF00000000LL;
    if ((quickNavLastDownState & 0xFFFF00000000LL) == 0xFFFF00000000LL) {
      uint64_t v16 = 79LL;
    }
    else {
      uint64_t v16 = 80LL;
    }
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", v16));
    if ([v4 keyUp])
    {
      if (!self->_quickNavStateMask)
      {
        if (quickNavStateMask)
        {
          -[SCRCTargetSelectorTimer cancel](self->_quickNavKeyTimer, "cancel");
          -[VOTKeyboardManager _handleQuickNavPress:](self, "_handleQuickNavPress:", v4);
          if (self->_isQuickNavOn && self->_quickNavDidSendDown)
          {
            self->_quickNavDidSendDown = 0;
            -[VOTKeyboardManager _postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:]( self,  "_postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:",  &stru_10017A920,  [v17 unsignedShortValue],  objc_msgSend(v4, "modifierState"),  0,  0,  1);
          }
        }
      }
    }

    if (!self->_isQuickNavOn)
    {
      if (quickNavLastDownState >= 0xFFFF000000000000LL && v15 == 0xFFFF00000000LL)
      {
        -[SCRCTargetSelectorTimer cancel](self->_quickNavRepostTimer, "cancel");
      }

      else
      {
        if (quickNavLastDownState <= 0xFFFEFFFFFFFFFFFFLL && v15 != 0xFFFF00000000LL)
        {
          BOOL v5 = 0;
          goto LABEL_39;
        }

        if ([v4 keyDown])
        {
          if (-[SCRCTargetSelectorTimer isPending](self->_quickNavRepostTimer, "isPending")
            && (-[SCRCTargetSelectorTimer isCancelled](self->_quickNavRepostTimer, "isCancelled") & 1) == 0)
          {
            -[VOTKeyboardManager _handleQuickNavDownArrowRepostPress:](self, "_handleQuickNavDownArrowRepostPress:", v4);
          }

          -[SCRCTargetSelectorTimer dispatchAfterDelay:withObject:]( self->_quickNavRepostTimer,  "dispatchAfterDelay:withObject:",  v4,  0.0799999982);
        }

        else if ([v4 keyUp])
        {
          if (-[SCRCTargetSelectorTimer isPending](self->_quickNavRepostTimer, "isPending")
            && (-[SCRCTargetSelectorTimer isCancelled](self->_quickNavRepostTimer, "isCancelled") & 1) == 0)
          {
            -[SCRCTargetSelectorTimer cancel](self->_quickNavRepostTimer, "cancel");
            -[VOTKeyboardManager _handleQuickNavDownArrowRepostPress:](self, "_handleQuickNavDownArrowRepostPress:", v4);
          }

          self->_quickNavDidSendDown = 0;
          BOOL v5 = 1;
          -[VOTKeyboardManager _postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:]( self,  "_postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:",  &stru_10017A920,  [v17 unsignedShortValue],  objc_msgSend(v4, "modifierState"),  0,  0,  1);
          goto LABEL_39;
        }
      }
    }

    BOOL v5 = 1;
LABEL_39:

    goto LABEL_40;
  }

  BOOL v5 = 0;
LABEL_40:

  return v5;
}

- (void)_speakCapsLockKey
{
  BOOL v3 = BKSHIDServicesIsCapsLockLightOn(self, a2) != 0;
  self->_fakeCapsLockOn = v3;
  self->_realCapsLockOn = v3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  if (self->_realCapsLockOn) {
    id v4 = @"capslock.on";
  }
  else {
    id v4 = @"capslock.off";
  }
  id v5 = sub_10004A988(off_1001AC148, v4, 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v7 speakSimpleString:v6];
}

- (void)_handleAnnouncementsForKeyInfo:(id)a3
{
  id v4 = a3;
  if ([v4 keyDown])
  {
    if ([v4 keyCode] == 57)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
      unsigned __int8 v7 = [v5 modifierKeyChoiceForElement:v6];

      if ((v7 & 2) == 0)
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        v9[2] = sub_1000C54A0;
        v9[3] = &unk_100176D38;
        v9[4] = self;
        AXPerformBlockOnMainThreadAfterDelay(v9, v8, 0.3);
      }
    }
  }
}

- (void)_updateEventFlags:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [v7 modifierState];
  self->_currentModifiers = v4;
  unsigned int keyboardHelpMask = self->_keyboardHelpMask;
  if ((v4 & 8) != 0)
  {
    if ((keyboardHelpMask & 8) == 0)
    {
LABEL_3:
      uint64_t v6 = 8LL;
      if ((v4 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((keyboardHelpMask & 8) != 0)
  {
    goto LABEL_3;
  }

  uint64_t v6 = 0LL;
  if ((v4 & 4) != 0)
  {
LABEL_4:
    if ((keyboardHelpMask & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

- (void)_handleKeyboardKeyEvent:(id)a3
{
}

- (BOOL)_keyEventShouldGoToFocusedContext:(id)a3
{
  return 1;
}

- (void)_dispatchEventRepresentationIntoSystem:(id)a3
{
  id v4 = a3;
  id v5 = -[VOTKeyInfo initWithEventRepresentation:]( objc_alloc(&OBJC_CLASS___VOTKeyInfo),  "initWithEventRepresentation:",  v4);

  -[VOTKeyboardManager _dispatchKeyEventIntoSystem:](self, "_dispatchKeyEventIntoSystem:", v5);
}

- (void)_handleCapsLockToggle:(id)a3
{
  id v24 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
  unsigned __int8 v6 = [v4 modifierKeyChoiceForElement:v5];

  if ((v6 & 2) != 0)
  {
    self->_fakeCapsLockOn ^= 1u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation keyRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "keyRepresentationWithType:",  10LL));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keyInfo]);
    [v8 setKeyCode:57];

    uint64_t v9 = 16 * self->_fakeCapsLockOn;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 keyInfo]);
    [v10 setModifierState:v9];

    double v11 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
    id v12 = [v11 windowContextId];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v24 eventRecord]);
    [v13 setContextId:v12];

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v7 keyInfo]);
    [v14 setKeyDown:1];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v24 eventRecord]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 clientId]);
    [v7 setClientId:v16];

    -[VOTKeyboardManager _dispatchEventRepresentationIntoSystem:](self, "_dispatchEventRepresentationIntoSystem:", v7);
    id v17 = [v7 copy];
    [v17 setType:11];
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 keyInfo]);
    [v18 setKeyDown:0];

    -[VOTKeyboardManager _dispatchEventRepresentationIntoSystem:](self, "_dispatchEventRepresentationIntoSystem:", v17);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    if (self->_fakeCapsLockOn) {
      id v20 = @"capslock.on";
    }
    else {
      id v20 = @"capslock.off";
    }
    id v21 = sub_10004A988(off_1001AC148, v20, 0LL);
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v19 speakSimpleString:v22];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
    [v23 setCapsLockLightOn:self->_fakeCapsLockOn];
  }
}

- (void)_handleModifierCapsLockBehavior:(id)a3
{
  id v5 = a3;
  if ([v5 isCapsLockKeyDown])
  {
    self->_capsLockDown = 1;
LABEL_10:
    id v4 = v5;
    goto LABEL_11;
  }

  if (![v5 isCapsLockKeyUp])
  {
LABEL_9:
    self->_capsLockTap1 = 0.0;
    goto LABEL_10;
  }

  self->_capsLockDown = 0;
  if ([v5 modifierState])
  {
    -[VOTKeyboardManager _handleCapsLockToggle:](self, "_handleCapsLockToggle:", v5);
    goto LABEL_9;
  }

  if (self->_capsLockTap1 <= 0.0 || CFAbsoluteTimeGetCurrent() - self->_capsLockTap1 >= 0.3)
  {
    self->_capsLockTap1 = CFAbsoluteTimeGetCurrent();
    goto LABEL_10;
  }

  -[VOTKeyboardManager _handleCapsLockToggle:](self, "_handleCapsLockToggle:", v5);
  id v4 = v5;
  self->_capsLockTap1 = 0.0;
LABEL_11:
}

- (void)_resetSoundAndScreenCurtain
{
  id v2 = [(id)VOTSharedWorkspace setVoiceOverMuted:0 sendRequest:0];
  uint64_t v4 = AXLogCommon(v2, v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Resetting sound and screen curtain with volume button presses",  buf,  2u);
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v6 voiceOverScreenCurtainEnabled])
  {
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v8 = [v7 voiceOverSoundCurtain];

    if (!v8) {
      return;
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  float v17 = 0.0;
  [v9 getVolume:&v17 forCategory:@"Audio/Video"];
  *(float *)&double v10 = v17;
  if (v17 < 0.25)
  {
    LODWORD(v10) = 0.5;
    [v9 setVolumeTo:@"Audio/Video" forCategory:0 retainFullMute:v10];
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", v10));
  [v11 setVoiceOverScreenCurtainEnabled:0];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v12 setVoiceOverSoundCurtain:0];

  id v13 = sub_10004A988(off_1001AC148, @"screen.and.sound.curtain.restored", 0LL);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  id v16 = sub_10000BBB0(v14, 0, v15);
}

- (void)_processVolumeButtonsForCurtainReset:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C5BA8;
  v6[3] = &unk_100176D38;
  v6[4] = self;
  id v5 = objc_retainBlock(v6);
  if ([v4 type] == 1008)
  {
    -[VOTKeyboardManager setLastVolumeDownButtonDownTime:]( self,  "setLastVolumeDownButtonDownTime:",  CFAbsoluteTimeGetCurrent());
  }

  else
  {
    if ([v4 type] != 1006)
    {
      if ([v4 type] == 1009)
      {
        -[VOTKeyboardManager setLastVolumeDownButtonUpTime:]( self,  "setLastVolumeDownButtonUpTime:",  CFAbsoluteTimeGetCurrent());
      }

      else
      {
        -[VOTKeyboardManager setLastVolumeUpButtonUpTime:]( self,  "setLastVolumeUpButtonUpTime:",  CFAbsoluteTimeGetCurrent());
      }

      ((void (*)(void *))v5[2])(v5);
      goto LABEL_10;
    }

    -[VOTKeyboardManager setLastVolumeUpButtonDownTime:]( self,  "setLastVolumeUpButtonDownTime:",  CFAbsoluteTimeGetCurrent());
  }

- (void)_handleKeyboardKeyEvent:(id)a3 isRepeatedEvent:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ([(id)VOTSharedWorkspace perkinsKeyboardInputEnabled]
    && [v11 eventOrigin] == (id)4
    && !self->_currentModifiers)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
    LOBYTE(v8) = [v9 handleKeyboardPerkinsInput:v11 chordOnly:0];

    goto LABEL_11;
  }

  if (![(id)VOTSharedWorkspace perkinsChordKeyboardInputEnabled]
    || [v11 eventOrigin] != (id)4
    || self->_currentModifiers)
  {
    goto LABEL_14;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  unsigned int v8 = [v7 handleKeyboardPerkinsInput:v11 chordOnly:1];

  if ([v11 keyCode] != 44)
  {
LABEL_11:
    double v10 = v11;
    if ((v8 & 1) != 0) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }

  if (!v8)
  {
    -[VOTKeyboardManager _handleNonPerkinsKeyboardKeyEvent:isRepeatedEvent:]( self,  "_handleNonPerkinsKeyboardKeyEvent:isRepeatedEvent:",  self->_spaceKeyInfoCache,  v4);
LABEL_14:
    -[VOTKeyboardManager _handleNonPerkinsKeyboardKeyEvent:isRepeatedEvent:]( self,  "_handleNonPerkinsKeyboardKeyEvent:isRepeatedEvent:",  v11,  v4);
    goto LABEL_15;
  }

  objc_storeStrong((id *)&self->_spaceKeyInfoCache, a3);
LABEL_15:
  double v10 = v11;
LABEL_16:
}

- (void)_handleNonPerkinsKeyboardKeyEvent:(id)a3 isRepeatedEvent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int currentModifiers = self->_currentModifiers;
  id v22 = v6;
  if (!v4)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v22 eventRecord]);
    -[VOTKeyboardManager _processVolumeButtonsForCurtainReset:](self, "_processVolumeButtonsForCurtainReset:", v8);
  }

  -[VOTKeyboardManager _handleModifierCapsLockBehavior:](self, "_handleModifierCapsLockBehavior:", v22);
  -[VOTKeyboardManager _updateEventFlags:](self, "_updateEventFlags:", v22);
  -[VOTKeyboardManager _handleAnnouncementsForKeyInfo:](self, "_handleAnnouncementsForKeyInfo:", v22);
  -[VOTKeyboardManager _updateConsecutiveKeyCount:](self, "_updateConsecutiveKeyCount:", v22);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  unsigned int v10 = [v9 hasActiveBrailleDisplay];

  if (v10 && -[VOTKeyboardManager _handleBrailleKeyEvent:](self, "_handleBrailleKeyEvent:", v22)) {
    unsigned int v11 = 1;
  }
  else {
    unsigned int v11 = -[VOTKeyboardManager _dispatchCommandForKeyInfo:isRepeatedEvent:]( self,  "_dispatchCommandForKeyInfo:isRepeatedEvent:",  v22,  v4);
  }
  if ([v22 eventOrigin] == (id)4 && -[VOTKeyboardManager isQuickNavOn](self, "isQuickNavOn"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager keyDownInfo](self, "keyDownInfo"));
    unsigned int v13 = [v12 isArrowKey];

    if (((v13 | v11) & 1) != 0) {
      goto LABEL_25;
    }
  }

  else if ((v11 & 1) != 0)
  {
    goto LABEL_25;
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
  unsigned __int8 v15 = [v14 helpEnabled];

  if ((v15 & 1) == 0)
  {
    if ([(id)VOTSharedWorkspace playKeyboardClicksOnHWInput])
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v22 eventRecord]);
      unsigned int v17 = [v16 type];

      if (v17 == 10)
      {
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        [v18 playSoundFast:@"KeyboardClick"];
      }
    }

    -[VOTKeyboardManager _dispatchKeyEventIntoSystem:](self, "_dispatchKeyEventIntoSystem:", v22);
    -[SCRCTargetSelectorTimer cancel](self->_keyRepeatTimer, "cancel");
    if ([v22 keyDown]
      && _AXSKeyRepeatEnabled()
      && !-[VOTKeyboardManager _keyInfoIsModifierOnly:](self, "_keyInfoIsModifierOnly:", v22))
    {
      if (v4) {
        _AXSKeyRepeatInterval();
      }
      else {
        _AXSKeyRepeatDelay();
      }
      -[SCRCTargetSelectorTimer dispatchAfterDelay:withObject:]( self->_keyRepeatTimer,  "dispatchAfterDelay:withObject:",  v22);
    }
  }

- (BOOL)_handleBrailleKeyEvent:(id)a3
{
  id v3 = a3;
  if (([v3 keyCode] != 41 || objc_msgSend(v3, "keyUp"))
    && ([v3 keyCode] == 41 || objc_msgSend(v3, "keyDown")))
  {
    unsigned int v4 = [v3 keyCode];
    unsigned __int8 v5 = 0;
    switch(v4)
    {
      case 'J':
        id v6 = (id *)&kVOTEventCommandFirstElement;
        goto LABEL_15;
      case 'K':
      case 'L':
      case 'N':
        break;
      case 'M':
        id v6 = (id *)&kVOTEventCommandLastElement;
        goto LABEL_15;
      case 'O':
        id v6 = (id *)&kVOTEventCommandNextElement;
        goto LABEL_15;
      case 'P':
        id v6 = (id *)&kVOTEventCommandPreviousElement;
        goto LABEL_15;
      default:
        if (v4 == 40)
        {
          id v6 = (id *)&kVOTEventCommandReturn;
        }

        else
        {
          if (v4 != 41) {
            break;
          }
          id v6 = (id *)&kVOTEventCommandEscape;
        }

- (BOOL)_keyInfoIsModifierOnly:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 keyCode] == 227
    || [v3 keyCode] == 231
    || [v3 keyCode] == 225
    || [v3 keyCode] == 229
    || [v3 keyCode] == 224
    || [v3 keyCode] == 228
    || [v3 keyCode] == 226
    || [v3 keyCode] == 230
    || [v3 keyCode] == 57;

  return v4;
}

- (void)_dispatchKeyEventIntoSystem:(id)a3
{
  id v20 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
  id v5 = [v4 windowContextId];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
  unsigned int v7 = [v6 isItemChooserVisible];

  if (v7)
  {
    if ((_DWORD)v5)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v20 eventRecord]);
      [v8 setClientId:0];
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v20 eventRecord]);
    [v9 setContextId:v5];
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v20 eventRecord]);
  unsigned int v11 = [v10 contextId];

  if (!v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v20 eventRecord]);
    [v12 setContextId:v5];
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  unsigned int v14 = [v13 inUnitTestMode];

  if (v14)
  {
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v20 eventRecord]);
    [v15 notePostedEventForUnitTesting:v16];
  }

  -[VOTKeyboardManager setLastReleasedToSystemKeyEvent:](self, "setLastReleasedToSystemKeyEvent:", v20);
  -[VOTKeyboardManager setLastReleasedToSystemKeyEventTime:]( self,  "setLastReleasedToSystemKeyEventTime:",  CFAbsoluteTimeGetCurrent());
  if ([v20 keyCode])
  {
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v20 eventRecord]);
    [v17 sendHIDSystemEvent:v18 repostCreatorHIDEvent:0 senderID:0x8000000817319373];
  }

  else
  {
    if ([v4 doesHaveTraits:kAXWebContentTrait])
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v4 application]);

      BOOL v4 = (void *)v19;
    }

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v20 eventRecord]);
    [v4 dispatchKeyboardEvent:v17];
  }
}

- (void)_keyRepeat:(id)a3
{
  id v4 = a3;
  if ((-[SCRCTargetSelectorTimer isCancelled](self->_keyRepeatTimer, "isCancelled") & 1) == 0) {
    -[VOTKeyboardManager _handleKeyboardKeyEvent:isRepeatedEvent:]( self,  "_handleKeyboardKeyEvent:isRepeatedEvent:",  v4,  1LL);
  }
}

- (void)_sendEvent:(id)a3 withKeyInfo:(id)a4 arrowMask:(int64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  if (a5 >= 1)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
    [v12 setObject:v9 forIndex:103];
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTKeyboardManager testingEventDispatchTap](self, "testingEventDispatchTap"));

  if (v10)
  {
    unsigned int v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[VOTKeyboardManager testingEventDispatchTap]( self,  "testingEventDispatchTap"));
    ((void (**)(void, id))v11)[2](v11, v12);
  }

  [(id)VOTSharedWorkspace dispatchCommand:v12];
}

- (void)_sendEventForCommand:(id)a3 withKeyInfo:(id)a4 arrowMask:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if ([v10 length])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent keyEventWithCommand:keyInfo:]( &OBJC_CLASS___VOTEvent,  "keyEventWithCommand:keyInfo:",  v10,  v8));
    -[VOTKeyboardManager _sendEvent:withKeyInfo:arrowMask:](self, "_sendEvent:withKeyInfo:arrowMask:", v9, v8, a5);
  }
}

- (void)_postKeyboardKey:(id)a3 keyCode:(unsigned __int16)a4 eventFlags:(unsigned int)a5 keyFlags:(unsigned __int16)a6 keyDown:(BOOL)a7 source:(unsigned __int16)a8
{
  BOOL v8 = a7;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = a4;
  id v18 = a3;
  if (v8) {
    uint64_t v12 = 10LL;
  }
  else {
    uint64_t v12 = 11LL;
  }
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation keyRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "keyRepresentationWithType:",  v12));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 keyInfo]);
  [v14 setModifiedInput:v18];
  [v14 setUnmodifiedInput:v18];
  [v14 setKeyCode:v10];
  [v14 setModifierState:v9];
  [v14 setKeyDown:v8];
  -[VOTKeyboardManager setLastDispatchedKeyEvent:](self, "setLastDispatchedKeyEvent:", v13);
  -[VOTKeyboardManager setLastDispatchedKeyEventTime:]( self,  "setLastDispatchedKeyEventTime:",  CFAbsoluteTimeGetCurrent());
  if ([v14 keyCode] && !objc_msgSend(v18, "length"))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
    objc_msgSend(v13, "setContextId:", objc_msgSend(v16, "windowContextId"));

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
    objc_msgSend(v13, "setDisplayId:", objc_msgSend(v17, "displayId"));

    -[VOTKeyboardManager _dispatchEventRepresentationIntoSystem:](self, "_dispatchEventRepresentationIntoSystem:", v13);
  }

  else
  {
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
    [v15 dispatchKeyboardEvent:v13];
  }
}

- (void)_handleQuickNavDownArrowRepostPress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
    unsigned int v6 = [v5 helpEnabled];

    if (v6)
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent keyEventWithCommand:keyInfo:]( &OBJC_CLASS___VOTEvent,  "keyEventWithCommand:keyInfo:",  0LL,  v8));
      [(id)VOTSharedWorkspace dispatchCommand:v7];
    }

    else
    {
      self->_quickNavDidSendDown = 1;
      -[VOTKeyboardManager _postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:]( self,  "_postKeyboardKey:keyCode:eventFlags:keyFlags:keyDown:source:",  &stru_10017A920,  [v8 keyCode],  objc_msgSend(v8, "modifierState"),  0,  1,  1);
    }

    id v4 = v8;
  }
}

- (void)_handleQuickNavPress:(id)a3
{
  id v4 = a3;
  if (self->_quickNavLastDownState == 0xFFFFFFFF00000000LL
    && (double quickNavLastRecordedActivation = self->_quickNavLastRecordedActivation,
        -[VOTKeyboardManager quickNavDownDurationAllowedAcceptance](self, "quickNavDownDurationAllowedAcceptance"),
        quickNavLastRecordedActivation < v6)
    && self->_quickNavLastRecordedActivation > 0.0)
  {
    -[SCRCTargetSelectorTimer cancel](self->_quickNavRepostTimer, "cancel");
    -[VOTKeyboardManager updateQuickNavState:](self, "updateQuickNavState:", !self->_isQuickNavOn);
    self->_explictlyEnabledQuickNav = 1;
    -[VOTKeyboardManager _sendEventForCommand:withKeyInfo:arrowMask:]( self,  "_sendEventForCommand:withKeyInfo:arrowMask:",  kVOTEventCommandAnnounceQuickNav,  v4,  3LL);
    self->_double quickNavLastRecordedActivation = 0.0;
  }

  else
  {
    self->_double quickNavLastRecordedActivation = 0.0;
    if (self->_isQuickNavOn)
    {
      unint64_t quickNavLastDownState = self->_quickNavLastDownState;
      if ((~quickNavLastDownState & 0xFFFF00000000LL) != 0) {
        uint64_t v8 = quickNavLastDownState > 0xFFFEFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v8 = (quickNavLastDownState > 0xFFFEFFFFFFFFFFFFLL) | 2LL;
      }
      if ((~LODWORD(self->_quickNavLastDownState) & 0xFFFF0000) == 0) {
        v8 |= 8uLL;
      }
      if (LOWORD(self->_quickNavLastDownState) == 0xFFFF) {
        uint64_t v9 = v8 | 4;
      }
      else {
        uint64_t v9 = v8;
      }
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXSSKeyChord quickNavKeyChordWithInfo:arrowMask:]( &OBJC_CLASS___AXSSKeyChord,  "quickNavKeyChordWithInfo:arrowMask:",  v4,  v9));
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[VOSCommandResolver resolverForCurrentHost]( &OBJC_CLASS___VOSCommandResolver,  "resolverForCurrentHost"));
      [v11 setKeyboardMode:1];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[VOSCommandManager commandForKeyChord:withResolver:]( self->_commandManager,  "commandForKeyChord:withResolver:",  v10,  v11));
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 votEventCommandName]);

      uint64_t v14 = VOTLogKeyboard();
      unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v16)
        {
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v10 displayValue]);
          int v19 = 138412802;
          id v20 = v12;
          __int16 v21 = 2112;
          id v22 = v17;
          __int16 v23 = 2112;
          id v24 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "✅ handling quickNav vosCommand: '%@' for keys '%@' info '%@'",  (uint8_t *)&v19,  0x20u);
        }

        unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 votEventCommandName]);
        -[VOTKeyboardManager _sendEventForCommand:withKeyInfo:arrowMask:]( self,  "_sendEventForCommand:withKeyInfo:arrowMask:",  v15,  v4,  v9);
      }

      else if (v16)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 displayValue]);
        int v19 = 138412546;
        id v20 = v18;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "❌ no customized quickNav command found for keys '%@' info '%@'",  (uint8_t *)&v19,  0x16u);
      }
    }
  }
}

- (void)_handleQuickNavPressTimer:(id)a3
{
  id v4 = a3;
}

- (void)_postEvent:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventRecord]);

  [v5 repostEvent:v4];
}

- (void)clearConsecutiveKeyPressCount
{
  lastKeyForTapCount = self->_lastKeyForTapCount;
  self->_consecutiveKeyPressCount = 1LL;
  self->_lastKeyForTapCount = 0LL;
}

- (BOOL)captureModeEnabled
{
  return self->_captureModeEnabled;
}

- (void)setCaptureModeEnabled:(BOOL)a3
{
  self->_captureModeEnabled = a3;
}

- (BOOL)isQuickNavOn
{
  return self->_isQuickNavOn;
}

- (BOOL)explictlyEnabledQuickNav
{
  return self->_explictlyEnabledQuickNav;
}

- (void)setExplictlyEnabledQuickNav:(BOOL)a3
{
  self->_explictlyEnabledQuickNav = a3;
}

- (AXEventRepresentation)lastDispatchedKeyEvent
{
  return self->_lastDispatchedKeyEvent;
}

- (void)setLastDispatchedKeyEvent:(id)a3
{
}

- (VOTKeyInfo)lastReleasedToSystemKeyEvent
{
  return self->_lastReleasedToSystemKeyEvent;
}

- (void)setLastReleasedToSystemKeyEvent:(id)a3
{
}

- (double)lastReleasedToSystemKeyEventTime
{
  return self->_lastReleasedToSystemKeyEventTime;
}

- (void)setLastReleasedToSystemKeyEventTime:(double)a3
{
  self->_lastReleasedToSystemKeyEventTime = a3;
}

- (double)lastDispatchedKeyEventTime
{
  return self->_lastDispatchedKeyEventTime;
}

- (void)setLastDispatchedKeyEventTime:(double)a3
{
  self->_lastDispatchedKeyEventTime = a3;
}

- (id)testingEventDispatchTap
{
  return self->_testingEventDispatchTap;
}

- (void)setTestingEventDispatchTap:(id)a3
{
}

- (id)testingProcessEventCallback
{
  return self->_testingProcessEventCallback;
}

- (void)setTestingProcessEventCallback:(id)a3
{
}

- (double)quickNavDownDurationAllowedAcceptance
{
  return self->_quickNavDownDurationAllowedAcceptance;
}

- (void)setQuickNavDownDurationAllowedAcceptance:(double)a3
{
  self->_quickNavDownDurationAllowedAcceptance = a3;
}

- (double)lastVolumeDownButtonDownTime
{
  return self->_lastVolumeDownButtonDownTime;
}

- (void)setLastVolumeDownButtonDownTime:(double)a3
{
  self->_lastVolumeDownButtonDownTime = a3;
}

- (double)lastVolumeUpButtonDownTime
{
  return self->_lastVolumeUpButtonDownTime;
}

- (void)setLastVolumeUpButtonDownTime:(double)a3
{
  self->_lastVolumeUpButtonDownTime = a3;
}

- (double)lastVolumeDownButtonUpTime
{
  return self->_lastVolumeDownButtonUpTime;
}

- (void)setLastVolumeDownButtonUpTime:(double)a3
{
  self->_lastVolumeDownButtonUpTime = a3;
}

- (double)lastVolumeUpButtonUpTime
{
  return self->_lastVolumeUpButtonUpTime;
}

- (void)setLastVolumeUpButtonUpTime:(double)a3
{
  self->_lastVolumeUpButtonUpTime = a3;
}

- (BOOL)controlKeyToggleSpeakingAllowed
{
  return self->_controlKeyToggleSpeakingAllowed;
}

- (void)setControlKeyToggleSpeakingAllowed:(BOOL)a3
{
  self->_controlKeyToggleSpeakingAllowed = a3;
}

- (void).cxx_destruct
{
}

@end