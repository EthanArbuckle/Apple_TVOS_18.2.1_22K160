@interface VOTCommandHelper
+ (id)commandHelper;
- (BOOL)_commandIsSupportedByTV:(id)a3;
- (BOOL)helpEnabled;
- (CGRect)practiceRegion;
- (VOTCommandHelper)init;
- (VOTElement)practiceElement;
- (id)_keyboardKeyStringForEvent:(id)a3 spoken:(BOOL)a4;
- (id)_stringForBrailleGestureCommand:(id)a3;
- (void)_processFallbackHelpForEvent:(id)a3 command:(id)a4 commandHelpText:(id *)a5 activationSpokenHelpText:(id *)a6 activationDisplayedHelpText:(id *)a7;
- (void)_processHelpForEvent:(id)a3 userCommandContext:(id)a4 commandHelpText:(id *)a5 activationSpokenHelpText:(id *)a6 activationDisplayedHelpText:(id *)a7;
- (void)_updateAccelerometerDataIfNeededAndAnnounce:(BOOL)a3;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)dealloc;
- (void)processHelpForEvent:(id)a3;
- (void)setHelpEnabled:(BOOL)a3;
- (void)setPracticeElement:(id)a3;
- (void)setPracticeRegion:(CGRect)a3;
@end

@implementation VOTCommandHelper

+ (id)commandHelper
{
  v2 = (void *)qword_1001ACF40;
  if (!qword_1001ACF40)
  {
    id v3 = [objc_allocWithZone((Class)VOTCommandHelper) init];
    v4 = (void *)qword_1001ACF40;
    qword_1001ACF40 = (uint64_t)v3;

    v2 = (void *)qword_1001ACF40;
  }

  return v2;
}

- (VOTCommandHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VOTCommandHelper;
  v2 = -[VOTCommandHelper init](&v7, "init");
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___BKSAccelerometer);
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = v3;

    -[BKSAccelerometer setDelegate:](v2->_accelerometer, "setDelegate:", v2);
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTCommandHelper;
  -[VOTCommandHelper dealloc](&v3, "dealloc");
}

- (void)setHelpEnabled:(BOOL)a3
{
  self->_helpEnabled = a3;
  -[VOTCommandHelper _updateAccelerometerDataIfNeededAndAnnounce:]( self,  "_updateAccelerometerDataIfNeededAndAnnounce:",  0LL);
  if (!self->_helpEnabled)
  {
    -[VOTCommandHelper setPracticeRegion:]( self,  "setPracticeRegion:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    -[VOTCommandHelper setPracticeElement:](self, "setPracticeElement:", 0LL);
  }

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:@"VOTHelpEnabledChangedNotification" object:0];
}

- (void)_updateAccelerometerDataIfNeededAndAnnounce:(BOOL)a3
{
  if (self->_helpEnabled
    && (BOOL v4 = a3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance")),
        id v6 = [v5 voiceOverHelpMode],
        v5,
        v6 == (id)2))
  {
    -[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", 1LL);
    int64_t currentTypingMode = self->_currentTypingMode;
    self->_int64_t currentTypingMode = -[BKSAccelerometer currentDeviceOrientation]( self->_accelerometer,  "currentDeviceOrientation") == (id)5;
    if (v4)
    {
      id v8 = -[BKSAccelerometer currentDeviceOrientation](self->_accelerometer, "currentDeviceOrientation");
      if (self->_currentTypingMode != currentTypingMode)
      {
        id v9 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
        id v15 = v10;
        if (v9 == (id)5) {
          v11 = @"braille.table.top";
        }
        else {
          v11 = @"braille.screen.away";
        }
        id v12 = sub_10004AE68(off_1001AC148, v11, 0LL, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v14 = sub_10000BBB0(v13, 0, v15);
      }
    }
  }

  else
  {
    -[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", 0LL);
  }

- (id)_keyboardKeyStringForEvent:(id)a3 spoken:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForIndex:103]);
  objc_super v7 = @" + ";
  if (v4) {
    objc_super v7 = @", ";
  }
  id v8 = v7;
  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    unsigned __int8 v10 = [v6 integerValue];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10009E67C;
    v47[3] = &unk_1001793B0;
    id v11 = v9;
    id v48 = v11;
    v49 = v8;
    id v12 = objc_retainBlock(v47);
    v13 = (void (**)(void, void))v12;
    if ((v10 & 1) != 0)
    {
      ((void (*)(void *, const __CFString *))v12[2])(v12, @"VOSKey.left");
      if ((v10 & 2) == 0)
      {
LABEL_6:
        if ((v10 & 4) == 0) {
          goto LABEL_7;
        }
        goto LABEL_20;
      }
    }

    else if ((v10 & 2) == 0)
    {
      goto LABEL_6;
    }

    ((void (**)(void, const __CFString *))v13)[2](v13, @"VOSKey.right");
    if ((v10 & 4) == 0)
    {
LABEL_7:
      if ((v10 & 8) == 0)
      {
LABEL_9:
        id v14 = v11;

        goto LABEL_56;
      }

- (id)_stringForBrailleGestureCommand:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kVOTEventCommandNextElement] && self->_currentTypingMode == 1
    || [v4 isEqualToString:kVOTEventCommandPreviousElement] && !self->_currentTypingMode)
  {
    id v5 = @"VOSBrailleGesture.space";
  }

  else if ([v4 isEqualToString:kVOTEventCommandPreviousElement] {
         && self->_currentTypingMode == 1
  }
         || [v4 isEqualToString:kVOTEventCommandNextElement] && !self->_currentTypingMode)
  {
    id v5 = @"VOSBrailleGesture.delete";
  }

  else if ([v4 isEqualToString:kVOTEventCommandSearchRotorDown])
  {
    id v5 = @"VOSBrailleGesture.next";
  }

  else if ([v4 isEqualToString:kVOTEventCommandSearchRotorUp])
  {
    id v5 = @"VOSBrailleGesture.previous";
  }

  else if ([v4 isEqualToString:kVOTEventCommandMoveToLinkedUI] {
         && self->_currentTypingMode == 1
  }
         || [v4 isEqualToString:kVOTEventCommandCustomTwoFingerSwipeLeft]
         && !self->_currentTypingMode)
  {
    id v5 = @"VOSBrailleGesture.return";
  }

  else if ([v4 isEqualToString:kVOTEventCommandReadAll])
  {
    id v5 = @"VOSBrailleGesture.translate";
  }

  else if (([v4 isEqualToString:kVOTEventCommandScrollLeftPage] & 1) != 0 {
         || ([v4 isEqualToString:kVOTEventCommandScrollRightPage] & 1) != 0)
  }
  {
    id v5 = @"VOSBrailleGesture.change_input";
  }

  else if ([v4 isEqualToString:kVOTEventCommandCustomTwoFingerSwipeLeft] {
         && self->_currentTypingMode == 1
  }
         || [v4 isEqualToString:kVOTEventCommandMoveToLinkedUI]
         && !self->_currentTypingMode)
  {
    id v5 = @"VOSBrailleGesture.word_backspace";
  }

  else if (([v4 isEqualToString:kVOTEventCommandScrollDownPage] & 1) != 0 {
         || ([v4 isEqualToString:kVOTEventCommandScrollUpPage] & 1) != 0)
  }
  {
    id v5 = @"VOSBrailleGesture.toggle_locked_configuration";
  }

  else
  {
    if (![v4 isEqualToString:kVOTEventCommandTracking])
    {
      objc_super v7 = 0LL;
      goto LABEL_26;
    }

    id v5 = @"VOSBrailleGesture.touch";
  }

  uint64_t v6 = VOSLocString(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
LABEL_26:

  return v7;
}

- (void)processHelpForEvent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (([v5 isEqualToString:kVOTEventCommandIdle] & 1) == 0
    && (![v5 isEqualToString:kVOTEventCommandTracking]
     || -[NSString isEqualToString:](self->_lastCommand, "isEqualToString:", kVOTEventCommandTracking)
     || Current - self->_lastCommandOutputTime >= 1.5)
    && (![v5 isEqualToString:kVOTEventCommandSystemToggleQuickNote]
     || AXDeviceSupportsQuickNote())
    && -[VOTCommandHelper _commandIsSupportedByTV:](self, "_commandIsSupportedByTV:", v5))
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userCommandContext]);
    if (v7)
    {
      uint64_t v32 = 0LL;
      uint64_t v33 = 0LL;
      uint64_t v31 = 0LL;
      id v8 = (id *)&v32;
      id v9 = (id *)&v31;
      -[VOTCommandHelper _processHelpForEvent:userCommandContext:commandHelpText:activationSpokenHelpText:activationDisplayedHelpText:]( self,  "_processHelpForEvent:userCommandContext:commandHelpText:activationSpokenHelpText:activationDisplayedHelpText:",  v4,  v7,  &v33,  &v32,  &v31);
      unsigned __int8 v10 = v33;
    }

    else
    {
      uint64_t v29 = 0LL;
      v30 = 0LL;
      uint64_t v28 = 0LL;
      id v8 = (id *)&v29;
      id v9 = (id *)&v28;
      -[VOTCommandHelper _processFallbackHelpForEvent:command:commandHelpText:activationSpokenHelpText:activationDisplayedHelpText:]( self,  "_processFallbackHelpForEvent:command:commandHelpText:activationSpokenHelpText:activationDisplayedHelpText:",  v4,  v5,  &v30,  &v29,  &v28);
      unsigned __int8 v10 = v30;
    }

    id v11 = v10;
    id v12 = *v8;
    v13 = (__CFString *)*v9;
    if (self->_practiceElement)
    {
      id v14 = objc_allocWithZone(&OBJC_CLASS___NSArray);
      if (v13) {
        id v15 = v13;
      }
      else {
        id v15 = &stru_10017A920;
      }
      id v16 = objc_msgSend(v14, "initWithObjects:", v15, v11, v5, 0);
      -[VOTElement setGesturePracticeInfo:](self->_practiceElement, "setGesturePracticeInfo:", v16);
    }

    if (![v5 isEqualToString:self->_lastCommand]
      || (unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager")),
          unsigned __int8 v18 = [v17 isSpeaking],
          v17,
          (v18 & 1) == 0))
    {
      id v19 = [objc_allocWithZone((Class)VOTOutputRequest) init];
      if ([v12 length]) {
        id v20 = [v19 addString:v12];
      }
      if ([v11 length]) {
        id v21 = [v19 addString:v11];
      }
      practiceElement = self->_practiceElement;
      if (practiceElement) {
        char v23 = !-[VOTElement shouldSpeakHelpInGestureArea](practiceElement, "shouldSpeakHelpInGestureArea");
      }
      else {
        char v23 = 0;
      }
      if ([v19 containsActions] && (v23 & 1) == 0)
      {
        [v19 setGeneratesBraille:1];
        [v19 send];
      }

      objc_storeStrong((id *)&self->_lastCommand, v5);
      self->_lastCommandOutputTime = Current;
      if ([v5 isEqualToString:kVOTEventCommandStartHelp]
        && [v4 isTouchEvent]
        && !self->_practiceElement)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
        id v25 = sub_10004AE68(off_1001AC148, @"stopping.help.mode", 0LL, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        id v27 = sub_10000BBB0(v26, 2, v24);

        -[VOTCommandHelper setHelpEnabled:](self, "setHelpEnabled:", 0LL);
      }
    }
  }
}

- (void)_processHelpForEvent:(id)a3 userCommandContext:(id)a4 commandHelpText:(id *)a5 activationSpokenHelpText:(id *)a6 activationDisplayedHelpText:(id *)a7
{
  id v22 = a4;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v22 command]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedName]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v22 gesture]);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v22 gesture]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedName]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v22 gesture]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 localizedName]);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v22 keyChord]);

    if (!v14)
    {
      unsigned __int8 v18 = 0LL;
      goto LABEL_6;
    }

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v22 keyChord]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v17 displayValue]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v22 keyChord]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 displayValue]);
  }

  unsigned __int8 v18 = (void *)v16;

LABEL_6:
  id v19 = v11;
  *a5 = v19;
  id v20 = v14;
  *a6 = v20;
  id v21 = v18;
  *a7 = v21;
}

- (void)_processFallbackHelpForEvent:(id)a3 command:(id)a4 commandHelpText:(id *)a5 activationSpokenHelpText:(id *)a6 activationDisplayedHelpText:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v15 = [v14 voiceOverHelpMode];

  if ([v13 isEqualToString:kVOTEventCommandTracking])
  {
    uint64_t v16 = VOSLocString(@"VOSPseudoCommand.Tracking");
    id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = VOSLocString(@"VOSPseudoGesture.TouchTracking");
    id v19 = (id)objc_claimAutoreleasedReturnValue(v18);
    id v20 = v19;
LABEL_30:
    id v17 = v17;
    *a5 = v17;
    id v33 = v20;
    *a6 = v33;
    id v34 = v19;
    *a7 = v34;

    goto LABEL_31;
  }

  if ((unint64_t)v15 > 1)
  {
    if (v15 == (id)2) {
      id v17 = (id)objc_claimAutoreleasedReturnValue(-[VOTCommandHelper _stringForBrailleGestureCommand:](self, "_stringForBrailleGestureCommand:", v13));
    }
    else {
      id v17 = 0LL;
    }
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[VOSCommand commandForVOSEventCommand:]( &OBJC_CLASS___VOSCommand,  "commandForVOSEventCommand:",  v13));
    id v17 = (id)objc_claimAutoreleasedReturnValue([v21 localizedName]);
    if (![v17 length])
    {
      uint64_t v22 = VOTLogCommon(0LL);
      char v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000F3E14((uint64_t)v21, (uint64_t)v13, v23);
      }
    }
  }

  if ([(id)VOTSharedWorkspace allowSingleLetterSearching]
    && [v12 isKeyEvent]
    && [v13 isEqualToString:kVOTEventCommandSingleLetterSearch])
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[VOTKeyboardManager keyboardManager](&OBJC_CLASS___VOTKeyboardManager, "keyboardManager"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v12 keyInfo]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 singleLetterCommandForKeyInfo:v25]);

    if (v26)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[VOSCommand commandForVOSEventCommand:]( &OBJC_CLASS___VOSCommand,  "commandForVOSEventCommand:",  v26));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 localizedName]);

      if (![v28 length])
      {
        uint64_t v29 = VOTLogCommon(0LL);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          int v35 = 138412802;
          int v36 = v27;
          __int16 v37 = 2112;
          id v38 = v13;
          __int16 v39 = 2112;
          v40 = v26;
          _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "No help text found for transformed command: '%@'. name: '%@' (actual: '%@')",  (uint8_t *)&v35,  0x20u);
        }
      }

      id v17 = v28;
    }
  }

  if (![v13 length] || objc_msgSend(v17, "length") || objc_msgSend(v12, "isKeyEvent"))
  {
    id v31 = [v12 origin];
    if (v31 == (id)5)
    {
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForIndex:105]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "componentsJoinedByString:", @", "));
      id v19 = (id)objc_claimAutoreleasedReturnValue([v32 componentsJoinedByString:@" + "]);
    }

    else if (v31 == (id)4)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue( -[VOTCommandHelper _keyboardKeyStringForEvent:spoken:]( self,  "_keyboardKeyStringForEvent:spoken:",  v12,  1LL));
      id v19 = (id)objc_claimAutoreleasedReturnValue( -[VOTCommandHelper _keyboardKeyStringForEvent:spoken:]( self,  "_keyboardKeyStringForEvent:spoken:",  v12,  0LL));
    }

    else
    {
      id v19 = 0LL;
      id v20 = 0LL;
    }

    goto LABEL_30;
  }

- (BOOL)_commandIsSupportedByTV:(id)a3
{
  uint64_t v3 = qword_1001ACF50;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1001ACF50, &stru_1001793D0);
  }
  unsigned __int8 v5 = [(id)qword_1001ACF48 containsObject:v4];

  return v5 ^ 1;
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
}

- (VOTElement)practiceElement
{
  return self->_practiceElement;
}

- (void)setPracticeElement:(id)a3
{
}

- (CGRect)practiceRegion
{
  double x = self->_practiceRegion.origin.x;
  double y = self->_practiceRegion.origin.y;
  double width = self->_practiceRegion.size.width;
  double height = self->_practiceRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPracticeRegion:(CGRect)a3
{
  self->_practiceRegion = a3;
}

- (BOOL)helpEnabled
{
  return self->_helpEnabled;
}

- (void).cxx_destruct
{
}

@end