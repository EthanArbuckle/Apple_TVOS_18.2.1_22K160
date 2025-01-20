@interface FKAEventTap
- (AXEventProcessor)eventProcessor;
- (BOOL)_handleEventRepresentation:(id)a3;
- (FKAEventTap)init;
- (FKAEventTapDelegate)delegate;
- (NSMutableDictionary)keyCodesToBackupUnicodeCharacters;
- (NSMutableDictionary)keyCodesToDownEventRepresentations;
- (NSMutableDictionary)keyCodesToUnicodeCharacters;
- (NSMutableSet)keyCodesRequiringRepostForUpEvent;
- (id)_keyboardEventForEventRepresentation:(id)a3;
- (void)_repostEventRepresentation:(id)a3;
- (void)dealloc;
- (void)repostDownAndUpForKeyboardEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyCodesRequiringRepostForUpEvent:(id)a3;
@end

@implementation FKAEventTap

- (FKAEventTap)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___FKAEventTap;
  v2 = -[FKAEventTap init](&v20, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    keyCodesToUnicodeCharacters = v2->_keyCodesToUnicodeCharacters;
    v2->_keyCodesToUnicodeCharacters = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    keyCodesToBackupUnicodeCharacters = v2->_keyCodesToBackupUnicodeCharacters;
    v2->_keyCodesToBackupUnicodeCharacters = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    keyCodesToDownEventRepresentations = v2->_keyCodesToDownEventRepresentations;
    v2->_keyCodesToDownEventRepresentations = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    keyCodesRequiringRepostForUpEvent = v2->_keyCodesRequiringRepostForUpEvent;
    v2->_keyCodesRequiringRepostForUpEvent = (NSMutableSet *)v9;

    +[AXEventKeyInfoRepresentation prepareForKeycodeTranslation]( &OBJC_CLASS___AXEventKeyInfoRepresentation,  "prepareForKeycodeTranslation");
    v11 = -[AXEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( objc_alloc(&OBJC_CLASS___AXEventProcessor),  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  @"FKAEventTap",  20LL,  0LL,  0LL);
    eventProcessor = v2->_eventProcessor;
    v2->_eventProcessor = v11;

    -[AXEventProcessor setHIDEventFilterMask:](v2->_eventProcessor, "setHIDEventFilterMask:", 2LL);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_1000043F4;
    v17 = &unk_1000206E0;
    objc_copyWeak(&v18, &location);
    -[AXEventProcessor setHIDEventHandler:](v2->_eventProcessor, "setHIDEventHandler:", &v14);
    -[AXEventProcessor beginHandlingHIDEventsForReason:]( v2->_eventProcessor,  "beginHandlingHIDEventsForReason:",  @"FKAEventTap",  v14,  v15,  v16,  v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FKAEventTap;
  -[FKAEventTap dealloc](&v3, "dealloc");
}

- (BOOL)_handleEventRepresentation:(id)a3
{
  id v4 = a3;
  if ([v4 senderID] == (id)0x8000000817319378
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]), v5, !v5)
    || [v4 senderID] == (id)0x8000000817319373)
  {
    BOOL v6 = 0;
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000457C;
    v8[3] = &unk_100020708;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(&_dispatch_main_q, v8);

    BOOL v6 = 1;
  }

  return v6;
}

- (void)repostDownAndUpForKeyboardEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___FKAKeyboardEvent);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  char v7 = isKindOfClass;
  uint64_t v8 = FKALogCommon(isKindOfClass);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Reposting %@", (uint8_t *)&v17, 0xCu);
    }

    v10 = (os_log_s *)v4;
    if ((-[os_log_s isDownEvent](v10, "isDownEvent") & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FKAEventTap keyCodesToDownEventRepresentations](self, "keyCodesToDownEventRepresentations"));
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[os_log_s keyCode](v10, "keyCode")));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

      -[FKAEventTap _repostEventRepresentation:](self, "_repostEventRepresentation:", v13);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s eventRepresentation](v10, "eventRepresentation"));
    -[FKAEventTap _repostEventRepresentation:](self, "_repostEventRepresentation:", v14);

    if (-[os_log_s isDownEvent](v10, "isDownEvent"))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[FKAEventTap keyCodesRequiringRepostForUpEvent](self, "keyCodesRequiringRepostForUpEvent"));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[os_log_s keyCode](v10, "keyCode")));
      [v15 addObject:v16];
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_1000116F4((uint64_t)v4, v10);
  }
}

- (void)_repostEventRepresentation:(id)a3
{
  id v4 = [a3 copy];
  [v4 setUseOriginalHIDTime:1];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
  [v3 sendHIDSystemEvent:v4 senderID:0x8000000817319378];
}

- (id)_keyboardEventForEventRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]);

  if (!v6)
  {
    uint64_t v18 = FKALogCommon(v7);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_100011768(v19);
    }

    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    v10 = 0LL;
    goto LABEL_11;
  }

  if (!v5) {
    goto LABEL_8;
  }
LABEL_3:
  [v5 translateKeycode];
  uint64_t v8 = [v5 keyCode];
  id v9 = [v5 keyDown];
  v10 = objc_opt_new(&OBJC_CLASS___FKAKeyboardEvent);
  -[FKAKeyboardEvent setEventRepresentation:](v10, "setEventRepresentation:", v4);
  -[FKAKeyboardEvent setKeyCode:](v10, "setKeyCode:", v8);
  -[FKAKeyboardEvent setIsDownEvent:](v10, "setIsDownEvent:", v9);
  unsigned int v11 = [v5 gsModifierState];
  -[FKAKeyboardEvent setIsLeftCommandDown:](v10, "setIsLeftCommandDown:", HIWORD(v11) & 1);
  -[FKAKeyboardEvent setIsRightCommandDown:](v10, "setIsRightCommandDown:", HIBYTE(v11) & 1);
  -[FKAKeyboardEvent setIsLeftOptionDown:](v10, "setIsLeftOptionDown:", (v11 >> 19) & 1);
  -[FKAKeyboardEvent setIsRightOptionDown:](v10, "setIsRightOptionDown:", (v11 >> 22) & 1);
  -[FKAKeyboardEvent setIsLeftControlDown:](v10, "setIsLeftControlDown:", (v11 >> 20) & 1);
  -[FKAKeyboardEvent setIsRightControlDown:](v10, "setIsRightControlDown:", (v11 >> 23) & 1);
  -[FKAKeyboardEvent setIsLeftShiftDown:](v10, "setIsLeftShiftDown:", (v11 >> 17) & 1);
  -[FKAKeyboardEvent setIsRightShiftDown:](v10, "setIsRightShiftDown:", (v11 >> 21) & 1);
  -[FKAKeyboardEvent setIsFnDown:](v10, "setIsFnDown:", ([v5 modifierState] >> 6) & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v8));
  if ((_DWORD)v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 unmodifiedInput]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 backupUnmodifiedInput]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[FKAEventTap keyCodesToUnicodeCharacters](self, "keyCodesToUnicodeCharacters"));
    [v15 setObject:v13 forKeyedSubscript:v12];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FKAEventTap keyCodesToBackupUnicodeCharacters](self, "keyCodesToBackupUnicodeCharacters"));
    [v16 setObject:v14 forKeyedSubscript:v12];

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[FKAEventTap keyCodesToDownEventRepresentations](self, "keyCodesToDownEventRepresentations"));
    [v17 setObject:v4 forKeyedSubscript:v12];
  }

  else
  {
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[FKAEventTap keyCodesToUnicodeCharacters](self, "keyCodesToUnicodeCharacters"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v12]);

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[FKAEventTap keyCodesToBackupUnicodeCharacters](self, "keyCodesToBackupUnicodeCharacters"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v12]);
  }

  -[FKAKeyboardEvent setUnicodeCharacter:](v10, "setUnicodeCharacter:", v13);
  -[FKAKeyboardEvent setBackupUnicodeCharacter:](v10, "setBackupUnicodeCharacter:", v14);
  -[FKAKeyboardEvent setIsRepeatEvent:](v10, "setIsRepeatEvent:", 0LL);
  -[FKAKeyboardEvent setIsModifierChangedEvent:](v10, "setIsModifierChangedEvent:", 0LL);

LABEL_11:
  return v10;
}

- (FKAEventTapDelegate)delegate
{
  return (FKAEventTapDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (NSMutableDictionary)keyCodesToUnicodeCharacters
{
  return self->_keyCodesToUnicodeCharacters;
}

- (NSMutableDictionary)keyCodesToBackupUnicodeCharacters
{
  return self->_keyCodesToBackupUnicodeCharacters;
}

- (NSMutableDictionary)keyCodesToDownEventRepresentations
{
  return self->_keyCodesToDownEventRepresentations;
}

- (NSMutableSet)keyCodesRequiringRepostForUpEvent
{
  return self->_keyCodesRequiringRepostForUpEvent;
}

- (void)setKeyCodesRequiringRepostForUpEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end