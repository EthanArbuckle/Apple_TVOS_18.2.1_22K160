@interface VOTRotor
+ (BOOL)rotorIsUsedForSettingAdjustment:(int64_t)a3;
+ (id)rotorTypeForPreferenceString:(id)a3;
+ (id)stringForRotorType:(int64_t)a3;
+ (id)systemRotorTypeForRotorType:(int64_t)a3;
+ (id)systemRotorTypeForSearchType:(int64_t)a3;
+ (int64_t)rotorTypeForSearchType:(int64_t)a3;
+ (int64_t)rotorTypeForSystemRotorType:(id)a3;
- (BOOL)inMisspelledWordRotor;
- (BOOL)rotorTypeIsValid:(int64_t)a3 eventOrigin:(int64_t)a4;
- (BOOL)verifyNoDuplicatesInRotor;
- (VOTElement)currentRotorElement;
- (VOTRotor)init;
- (VOTRotorDelegate)delegate;
- (id)_currentCustomRotorString;
- (id)currentRotorHint;
- (id)currentRotorString;
- (id)currentVisualRotorString;
- (id)customPublicRotors;
- (id)generateRotorTypeRequest;
- (id)rotorItems;
- (int64_t)currentRotorType;
- (int64_t)currentSelectionRotorType;
- (int64_t)customActionIndex;
- (int64_t)customRotorIndex;
- (int64_t)indexOfRotorItem:(int64_t)a3;
- (int64_t)previousRotorType;
- (int64_t)publicCustomRotorIndex;
- (int64_t)rotorCount;
- (int64_t)rotorIndex;
- (void)_moveRotor:(BOOL)a3 didWrap:(BOOL *)a4 userInitiated:(BOOL)a5 eventOrigin:(int64_t)a6;
- (void)clearRotorTypes;
- (void)dealloc;
- (void)decrement:(BOOL *)a3 userInitiated:(BOOL)a4 eventOrigin:(int64_t)a5;
- (void)increment:(BOOL *)a3 userInitiated:(BOOL)a4 eventOrigin:(int64_t)a5;
- (void)incrementDetectionRotor:(int64_t)a3;
- (void)setCurrentRotorElement:(id)a3;
- (void)setCurrentRotorType:(int64_t)a3 saveToPreferences:(BOOL)a4 userInitiated:(BOOL)a5;
- (void)setCustomActionIndex:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setRotorItems:(id)a3;
@end

@implementation VOTRotor

- (VOTRotor)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VOTRotor;
  v2 = -[VOTRotor init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    typeKey = v2->_typeKey;
    v2->_typeKey = (NSString *)@"CurrentRotorTypeSimple";

    v3->_currentRotors = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, 0LL);
    v5 = v3;
  }

  return v3;
}

- (void)dealloc
{
  customPublicRotors = self->_customPublicRotors;
  self->_customPublicRotors = 0LL;

  self->_currentRotors = 0LL;
  customRotorActionCategories = self->_customRotorActionCategories;
  self->_customRotorActionCategories = 0LL;

  customContent = self->_customContent;
  self->_customContent = 0LL;

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VOTRotor;
  -[VOTRotor dealloc](&v6, "dealloc");
}

- (int64_t)rotorCount
{
  return CFArrayGetCount(self->_currentRotors);
}

- (int64_t)rotorIndex
{
  currentRotors = self->_currentRotors;
  v5.length = -[VOTRotor rotorCount](self, "rotorCount");
  v5.location = 0LL;
  return CFArrayGetFirstIndexOfValue(currentRotors, v5, (const void *)self->_currentRotorType);
}

- (id)generateRotorTypeRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTRotor currentRotorString](self, "currentRotorString"));
  if (v3)
  {
    id v4 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v5 = [v4 addString:v3];
    if (([(id)VOTSharedWorkspace isBaseSystemSpokenEqualToLocalization] & 1) == 0)
    {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastAction]);
      objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
      [v6 setObject:v7 forVariant:16];
    }

    if ([(id)VOTSharedWorkspace hintsEnabled])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTRotor currentRotorHint](self, "currentRotorHint"));
      if (v8)
      {
        LODWORD(v9) = 1061997773;
        [v4 addPause:v9];
        id v10 = [v4 addString:v8];
      }
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (void)setCurrentRotorType:(int64_t)a3 saveToPreferences:(BOOL)a4 userInitiated:(BOOL)a5
{
  int64_t currentRotorType = self->_currentRotorType;
  if (currentRotorType != a3)
  {
    BOOL v7 = a5;
    BOOL v8 = a4;
    self->_previousRotorType = currentRotorType;
    v24[0] = @"kVOTRotorChangedNotificationOldRotor";
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
    v25[0] = v10;
    v24[1] = @"kVOTRotorChangedNotificationNewRotor";
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    v25[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000D29FC;
    v22[3] = &unk_100176DA8;
    v22[4] = self;
    id v13 = v12;
    id v23 = v13;
    AXPerformBlockOnMainThreadAfterDelay(v22, v14, 0.0);
    self->_int64_t currentRotorType = a3;
    if (v8)
    {
      id v15 = -[NSString copy](self->_typeKey, "copy");
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000D2A58;
      block[3] = &unk_100176DA8;
      block[4] = self;
      id v21 = v15;
      id v18 = v15;
      dispatch_async(v17, block);

      a3 = self->_currentRotorType;
    }

    [(id)VOTSharedWorkspace setRotorType:a3];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTRotor delegate](self, "delegate"));
    [v19 rotor:self didChangeFrom:self->_previousRotorType to:self->_currentRotorType userInitiated:v7];
  }

- (int64_t)currentSelectionRotorType
{
  return self->_currentSelectionRotorType;
}

- (int64_t)currentRotorType
{
  return self->_currentRotorType;
}

- (int64_t)previousRotorType
{
  return self->_previousRotorType;
}

- (BOOL)rotorTypeIsValid:(int64_t)a3 eventOrigin:(int64_t)a4
{
  return a3 != 0;
}

- (id)customPublicRotors
{
  return self->_customPublicRotors;
}

- (void)_moveRotor:(BOOL)a3 didWrap:(BOOL *)a4 userInitiated:(BOOL)a5 eventOrigin:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v9 = a3;
  CFIndex Count = CFArrayGetCount(self->_currentRotors);
  if (!Count)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTRotor.m",  155LL,  "-[VOTRotor _moveRotor:didWrap:userInitiated:eventOrigin:]",  @"No rotors! what happened?");
    return;
  }

  CFIndex v12 = Count;
  int64_t currentRotorType = self->_currentRotorType;
  if (currentRotorType == 47)
  {
    int64_t publicCustomRotorIndex = self->_publicCustomRotorIndex;
    if (v9) {
      unint64_t v15 = publicCustomRotorIndex + 1;
    }
    else {
      unint64_t v15 = publicCustomRotorIndex - 1;
    }
    self->_int64_t publicCustomRotorIndex = v15;
    if ((v15 & 0x8000000000000000LL) != 0) {
      goto LABEL_19;
    }
    id v16 = -[NSMutableArray count](self->_customPublicRotors, "count");
    if (v15 < (unint64_t)v16)
    {
LABEL_25:
      if (_AXSAutomationEnabled(v16))
      {
        id v44 = (id)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
        [v44 postNotificationName:@"VoiceOverEventOccurred" object:@"RotorTypeDidChange"];
      }

      return;
    }

    int64_t currentRotorType = self->_currentRotorType;
  }

  if (currentRotorType == 48)
  {
    int64_t customActionIndex = self->_customActionIndex;
    uint64_t v18 = v9 ? 1LL : -1LL;
    self->_int64_t customActionIndex = customActionIndex + v18;
    if (customActionIndex + v18 >= 0
      && customActionIndex + v18 < -[NSArray count](self->_customRotorActionCategories, "count"))
    {
      BOOL v43 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_customRotorActionCategories,  "objectAtIndexedSubscript:",  self->_customActionIndex));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 categoryName]);
      unsigned int v21 = [v20 isEqualToString:UIAccessibilityCustomActionCategoryEdit];

      unint64_t v22 = self->_customActionIndex;
      if (v21)
      {
        v22 += v18;
        self->_int64_t customActionIndex = v22;
      }

      BOOL v7 = v43;
      if ((v22 & 0x8000000000000000LL) == 0)
      {
        id v16 = -[NSArray count](self->_customRotorActionCategories, "count");
      }
    }
  }

- (void)increment:(BOOL *)a3 userInitiated:(BOOL)a4 eventOrigin:(int64_t)a5
{
}

- (void)decrement:(BOOL *)a3 userInitiated:(BOOL)a4 eventOrigin:(int64_t)a5
{
}

- (void)incrementDetectionRotor:(int64_t)a3
{
  CFIndex Count = CFArrayGetCount(self->_currentRotors);
  if (Count)
  {
    CFIndex v6 = Count;
    v17.location = 0LL;
    v17.length = Count;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(self->_currentRotors, v17, (const void *)self->_currentRotorType);
    unint64_t v8 = 0LL;
    CFIndex v9 = FirstIndexOfValue;
    do
    {
      if (-[VOTRotor rotorTypeIsValid:eventOrigin:](self, "rotorTypeIsValid:eventOrigin:", v8, a3)
        && (v8 & 0xFFFFFFFFFFFFFFFELL) != 0x36)
      {
        uint64_t v12 = (int)v8;
        goto LABEL_17;
      }

      if (v9 + 1 >= v6 || v9 + 1 <= -1) {
        CFIndex v9 = 0LL;
      }
      else {
        ++v9;
      }
      unint64_t ValueAtIndex = (unint64_t)CFArrayGetValueAtIndex(self->_currentRotors, v9);
      unint64_t v8 = ValueAtIndex;
    }

    while (v9 != FirstIndexOfValue);
    if ((ValueAtIndex & 0xFFFFFFFFFFFFFFFELL) == 0x36) {
      uint64_t v12 = 0LL;
    }
    else {
      uint64_t v12 = (int)ValueAtIndex;
    }
LABEL_17:
    -[VOTRotor setCurrentRotorType:saveToPreferences:userInitiated:]( self,  "setCurrentRotorType:saveToPreferences:userInitiated:",  v12,  0LL,  0LL);
    int64_t currentRotorType = self->_currentRotorType;
    switch(currentRotorType)
    {
      case '/':
        uint64_t v14 = 8LL;
        break;
      case 'T':
        uint64_t v14 = 7LL;
        break;
      case '0':
        uint64_t v14 = 14LL;
        break;
      default:
LABEL_24:
        unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_currentRotorType));
        [v15 setPreference:v16 forKey:self->_typeKey];

        [(id)VOTSharedWorkspace setRotorType:self->_currentRotorType];
        return;
    }

    (&self->super.isa)[v14] = 0LL;
    goto LABEL_24;
  }

+ (id)systemRotorTypeForSearchType:(int64_t)a3
{
  else {
    return off_100179D58[a3 - 1];
  }
}

+ (id)systemRotorTypeForRotorType:(int64_t)a3
{
  id result = 0LL;
  switch(a3)
  {
    case 8LL:
      id result = @"AXCustomSystemRotorTypeHeading";
      break;
    case 9LL:
      id result = @"AXCustomSystemRotorTypeLink";
      break;
    case 10LL:
    case 12LL:
    case 15LL:
    case 17LL:
    case 18LL:
    case 19LL:
    case 20LL:
    case 21LL:
    case 22LL:
    case 23LL:
    case 24LL:
    case 25LL:
    case 28LL:
    case 30LL:
    case 31LL:
    case 32LL:
    case 33LL:
    case 34LL:
    case 35LL:
    case 36LL:
    case 37LL:
    case 38LL:
      return result;
    case 11LL:
      id result = @"AXCustomSystemRotorTypeTable";
      break;
    case 13LL:
      id result = @"AXCustomSystemRotorTypeList";
      break;
    case 14LL:
      id result = @"AXCustomSystemRotorTypeVisitedLink";
      break;
    case 16LL:
      id result = @"AXCustomSystemRotorTypeImage";
      break;
    case 26LL:
      id result = @"AXCustomSystemRotorTypeLandmark";
      break;
    case 27LL:
      id result = @"AXCustomSystemRotorTypeArticle";
      break;
    case 29LL:
      id result = @"AXCustomSystemRotorTypeTextField";
      break;
    case 39LL:
      id result = @"AXCustomSystemRotorTypeHeadingLevel1";
      break;
    case 40LL:
      id result = @"AXCustomSystemRotorTypeHeadingLevel2";
      break;
    case 41LL:
      id result = @"AXCustomSystemRotorTypeHeadingLevel3";
      break;
    case 42LL:
      id result = @"AXCustomSystemRotorTypeHeadingLevel4";
      break;
    case 43LL:
      id result = @"AXCustomSystemRotorTypeHeadingLevel5";
      break;
    case 44LL:
      id result = @"AXCustomSystemRotorTypeHeadingLevel6";
      break;
    default:
      switch(a3)
      {
        case '>':
          id result = @"AXCustomSystemRotorTypeBoldText";
          break;
        case '?':
          id result = @"AXCustomSystemRotorTypeItalicText";
          break;
        case '@':
          id result = @"AXCustomSystemRotorTypeUnderlineText";
          break;
        case 'A':
          id result = @"AXCustomSystemRotorTypeMisspelledWord";
          break;
        case 'B':
          id result = @"AXCustomSystemRotorTypePlainText";
          break;
        case 'C':
          id result = @"AXCustomSystemRotorTypeColorChange";
          break;
        case 'D':
          id result = @"AXCustomSystemRotorTypeFontChange";
          break;
        case 'E':
          id result = @"AXCustomSystemRotorTypeStyleChange";
          break;
        default:
          return result;
      }

      break;
  }

  return result;
}

+ (int64_t)rotorTypeForSearchType:(int64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTRotor systemRotorTypeForSearchType:](&OBJC_CLASS___VOTRotor, "systemRotorTypeForSearchType:", a3));
  int64_t v4 = +[VOTRotor rotorTypeForSystemRotorType:](&OBJC_CLASS___VOTRotor, "rotorTypeForSystemRotorType:", v3);

  return v4;
}

+ (int64_t)rotorTypeForSystemRotorType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeLink"])
  {
    int64_t v4 = 9LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeArticle"])
  {
    int64_t v4 = 27LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeVisitedLink"])
  {
    int64_t v4 = 14LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeading"])
  {
    int64_t v4 = 8LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel1"])
  {
    int64_t v4 = 39LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel2"])
  {
    int64_t v4 = 40LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel3"])
  {
    int64_t v4 = 41LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel4"])
  {
    int64_t v4 = 42LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel5"])
  {
    int64_t v4 = 43LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel6"])
  {
    int64_t v4 = 44LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeBoldText"])
  {
    int64_t v4 = 62LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeItalicText"])
  {
    int64_t v4 = 63LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeUnderlineText"])
  {
    int64_t v4 = 64LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeMisspelledWord"])
  {
    int64_t v4 = 65LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeImage"])
  {
    int64_t v4 = 16LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeTextField"])
  {
    int64_t v4 = 29LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeTable"])
  {
    int64_t v4 = 11LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeList"])
  {
    int64_t v4 = 13LL;
  }

  else if ([v3 isEqualToString:@"AXCustomSystemRotorTypeLandmark"])
  {
    int64_t v4 = 26LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (id)currentVisualRotorString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTRotor _currentCustomRotorString](self, "_currentCustomRotorString"));
  int64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[VOTRotor stringForRotorType:](&OBJC_CLASS___VOTRotor, "stringForRotorType:", self->_currentRotorType));
  }
  CFIndex v6 = v5;

  return v6;
}

- (BOOL)verifyNoDuplicatesInRotor
{
  CFIndex Count = CFArrayGetCount(self->_currentRotors);
  if (Count < 1)
  {
    return 1;
  }

  else
  {
    CFIndex v4 = Count;
    BOOL v5 = 0;
    CFIndex v6 = 0LL;
    while (1)
    {
      unint64_t ValueAtIndex = CFArrayGetValueAtIndex(self->_currentRotors, v6++);
      CFIndex v8 = v6;
      if (v6 < v4) {
        break;
      }
LABEL_6:
      BOOL v5 = v6 >= v4;
      if (v6 == v4) {
        return v5;
      }
    }

    while (ValueAtIndex != CFArrayGetValueAtIndex(self->_currentRotors, v8))
    {
      if (v4 == ++v8) {
        goto LABEL_6;
      }
    }
  }

  return v5;
}

- (void)clearRotorTypes
{
  self->_int64_t currentRotorType = 0LL;
  self->_currentSelectionRotorType = 0LL;
}

- (int64_t)indexOfRotorItem:(int64_t)a3
{
  currentRotors = self->_currentRotors;
  v6.length = CFArrayGetCount(currentRotors);
  v6.location = 0LL;
  return CFArrayGetFirstIndexOfValue(currentRotors, v6, (const void *)a3);
}

+ (id)rotorTypeForPreferenceString:(id)a3
{
  uint64_t v3 = qword_1001AD038;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1001AD038, &stru_100179D38);
  }
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1001AD030 objectForKey:v4]);

  return v5;
}

+ (id)stringForRotorType:(int64_t)a3
{
  id v4 = off_1001AC148;
  BOOL v5 = 0LL;
  switch(a3)
  {
    case 1LL:
      BOOL v5 = @"search.rotor.adjust";
      break;
    case 2LL:
      BOOL v5 = @"search.rotor.autofill";
      break;
    case 3LL:
      BOOL v5 = @"search.rotor.character";
      break;
    case 4LL:
      BOOL v5 = @"search.rotor.word";
      break;
    case 5LL:
      BOOL v5 = @"search.rotor.line";
      break;
    case 6LL:
      BOOL v5 = @"search.rotor.textselection";
      break;
    case 7LL:
      BOOL v5 = @"search.rotor.vertical.navigation";
      break;
    case 8LL:
      BOOL v5 = @"search.rotor.header";
      break;
    case 9LL:
      BOOL v5 = @"search.rotor.link";
      break;
    case 10LL:
      BOOL v5 = @"search.rotor.formelement";
      break;
    case 11LL:
      BOOL v5 = @"search.rotor.table";
      break;
    case 12LL:
      BOOL v5 = @"search.rotor.frame";
      break;
    case 13LL:
      BOOL v5 = @"search.rotor.list";
      break;
    case 14LL:
      BOOL v5 = @"search.rotor.visitedlink";
      break;
    case 15LL:
      BOOL v5 = @"search.rotor.nonvisitedlink";
      break;
    case 16LL:
      BOOL v5 = @"search.rotor.image";
      break;
    case 17LL:
      BOOL v5 = @"search.rotor.statictext";
      break;
    case 18LL:
      BOOL v5 = @"search.rotor.text.operation";
      break;
    case 19LL:
      BOOL v5 = @"search.rotor.zoom";
      break;
    case 20LL:
      BOOL v5 = @"search.rotor.typing.mode";
      break;
    case 21LL:
      BOOL v5 = @"search.rotor.slide.to.type";
      break;
    case 22LL:
      BOOL v5 = @"search.rotor.languages";
      break;
    case 23LL:
      CFRange v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unsigned int v7 = [v6 voiceOverTouchBrailleDisplaySyncInputOutputTables];

      if (v7) {
        BOOL v5 = @"search.rotor.braille.languages";
      }
      else {
        BOOL v5 = @"search.rotor.braille.output.languages";
      }
      break;
    case 24LL:
      BOOL v5 = @"search.rotor.braille.input.languages";
      break;
    case 25LL:
      BOOL v5 = @"search.rotor.auto.advance.speed";
      break;
    case 26LL:
      BOOL v5 = @"search.rotor.landmark";
      break;
    case 27LL:
      BOOL v5 = @"search.rotor.article";
      break;
    case 28LL:
      BOOL v5 = @"search.rotor.button";
      break;
    case 29LL:
      BOOL v5 = @"search.rotor.textfield";
      break;
    case 30LL:
      BOOL v5 = @"search.rotor.table.row";
      break;
    case 31LL:
      BOOL v5 = @"search.rotor.container";
      break;
    case 32LL:
      BOOL v5 = @"search.rotor.searchresults";
      break;
    case 33LL:
      BOOL v5 = @"search.rotor.searchfield";
      break;
    case 34LL:
      BOOL v5 = @"search.rotor.radiobutton";
      break;
    case 35LL:
      BOOL v5 = @"search.rotor.checkbox";
      break;
    case 36LL:
      BOOL v5 = @"search.rotor.exploration.mode";
      break;
    case 37LL:
      BOOL v5 = @"search.rotor.same";
      break;
    case 38LL:
      BOOL v5 = @"search.rotor.allitems";
      break;
    case 39LL:
      BOOL v5 = @"search.rotor.heading.1";
      break;
    case 40LL:
      BOOL v5 = @"search.rotor.heading.2";
      break;
    case 41LL:
      BOOL v5 = @"search.rotor.heading.3";
      break;
    case 42LL:
      BOOL v5 = @"search.rotor.heading.4";
      break;
    case 43LL:
      BOOL v5 = @"search.rotor.heading.5";
      break;
    case 44LL:
      BOOL v5 = @"search.rotor.heading.6";
      break;
    case 45LL:
      BOOL v5 = @"search.rotor.same.heading";
      break;
    case 46LL:
      BOOL v5 = @"search.rotor.different.element";
      break;
    case 48LL:
      BOOL v5 = @"custom.actions.title";
      break;
    case 49LL:
      BOOL v5 = @"search.rotor.math.granularity.1";
      break;
    case 50LL:
      BOOL v5 = @"search.rotor.math.granularity.2";
      break;
    case 51LL:
      BOOL v5 = @"search.rotor.math.granularity.3";
      break;
    case 52LL:
      BOOL v5 = @"search.rotor.math.granularity.4";
      break;
    case 53LL:
      BOOL v5 = @"search.rotor.hints";
      break;
    case 54LL:
      BOOL v5 = @"search.rotor.handwriting";
      break;
    case 55LL:
      BOOL v5 = @"search.rotor.braille.gesture";
      break;
    case 56LL:
      BOOL v5 = @"search.rotor.tracking.detail";
      break;
    case 57LL:
      BOOL v5 = @"search.rotor.media.descriptions";
      break;
    case 58LL:
      BOOL v5 = @"search.rotor.maps.exploration";
      break;
    case 59LL:
      BOOL v5 = @"search.rotor.audiograph";
      break;
    case 60LL:
      BOOL v5 = @"search.rotor.image.descriptions";
      break;
    case 62LL:
      BOOL v5 = @"search.rotor.bold.text";
      break;
    case 63LL:
      BOOL v5 = @"search.rotor.italic.text";
      break;
    case 64LL:
      BOOL v5 = @"search.rotor.underline.text";
      break;
    case 65LL:
      BOOL v5 = @"search.rotor.misspelled.word";
      break;
    case 66LL:
      BOOL v5 = @"search.rotor.plain.text";
      break;
    case 67LL:
      BOOL v5 = @"search.rotor.color.change";
      break;
    case 68LL:
      BOOL v5 = @"search.rotor.font.change";
      break;
    case 69LL:
      BOOL v5 = @"search.rotor.style.change";
      break;
    case 70LL:
      BOOL v5 = @"search.rotor.blockquote";
      break;
    case 71LL:
      BOOL v5 = @"search.rotor.same.blockquote";
      break;
    case 72LL:
      BOOL v5 = @"search.rotor.volume";
      break;
    case 73LL:
      BOOL v5 = @"search.rotor.rate";
      break;
    case 74LL:
      BOOL v5 = @"search.rotor.typing.echo";
      break;
    case 75LL:
      BOOL v5 = @"search.rotor.phonetics";
      break;
    case 76LL:
      BOOL v5 = @"search.rotor.use.pitch";
      break;
    case 77LL:
      BOOL v5 = @"search.rotor.punctuation";
      break;
    case 78LL:
      BOOL v5 = @"search.rotor.sounds";
      break;
    case 79LL:
      BOOL v5 = @"search.rotor.audio.ducking";
      break;
    case 80LL:
      BOOL v5 = @"search.rotor.audio.ducking.amount";
      break;
    case 81LL:
      BOOL v5 = @"search.rotor.audio.destination";
      break;
    case 82LL:
      BOOL v5 = @"search.rotor.navigation.direction";
      break;
    case 83LL:
      BOOL v5 = @"search.rotor.activities";
      break;
    case 84LL:
      BOOL v5 = @"custom.content.title";
      break;
    case 85LL:
      BOOL v5 = @"search.rotor.tv.internation.follow.focus";
      break;
    case 86LL:
      BOOL v5 = @"search.rotor.tv.internation.explore";
      break;
    case 87LL:
      BOOL v5 = @"search.rotor.tv.speak.nonfocusable.elements.after.delay";
      break;
    case 88LL:
      BOOL v5 = @"search.rotor.tv.silence.announcements";
      break;
    case 89LL:
      BOOL v5 = @"search.rotor.tv.explore.focus.affects.native.focus";
      break;
    case 90LL:
      BOOL v5 = @"search.rotor.toggle.live.regions";
      break;
    default:
      break;
  }

  id v8 = sub_10004A988(v4, v5, 0LL);
  CFIndex v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)_currentCustomRotorString
{
  int64_t currentRotorType = self->_currentRotorType;
  if (currentRotorType == 84)
  {
    uint64_t v12 = -[NSArray count](self->_customContent, "count");
    int64_t customContentIndex = v12 - 1;
    if (v12 >= 1)
    {
      if (self->_customContentIndex < customContentIndex) {
        int64_t customContentIndex = self->_customContentIndex;
      }
      self->_int64_t customContentIndex = customContentIndex;
      id v14 = objc_alloc(&OBJC_CLASS___AXAttributedString);
      CFIndex v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_customContent,  "objectAtIndexedSubscript:",  self->_customContentIndex));
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 attributedLabel]);
      id v16 = [v14 initWithStringOrAttributedString:v15];

      goto LABEL_21;
    }

    goto LABEL_22;
  }

  if (currentRotorType == 48)
  {
    uint64_t v17 = -[NSArray count](self->_customRotorActionCategories, "count");
    if (v17 >= 1)
    {
      if (self->_customActionIndex >= v17 - 1) {
        int64_t customActionIndex = v17 - 1;
      }
      else {
        int64_t customActionIndex = self->_customActionIndex;
      }
      self->_int64_t customActionIndex = customActionIndex;
      CFIndex v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_customRotorActionCategories,  "objectAtIndexedSubscript:"));
      id v11 = (id)objc_claimAutoreleasedReturnValue([v9 categoryName]);
      goto LABEL_20;
    }

- (BOOL)inMisspelledWordRotor
{
  if (self->_currentRotorType == 65)
  {
    uint64_t v3 = VOTLogRotor();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000F5870(v4);
    }

    if (self->_currentRotorType == 65) {
      return 0;
    }
  }

  if ((id)-[VOTRotor currentRotorType](self, "currentRotorType") != (id)47
    || -[VOTRotor publicCustomRotorIndex](self, "publicCustomRotorIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTRotor customPublicRotors](self, "customPublicRotors"));
  id v8 = [v7 count];
  unint64_t v9 = -[VOTRotor publicCustomRotorIndex](self, "publicCustomRotorIndex");

  if ((unint64_t)v8 <= v9)
  {
    uint64_t v14 = VOTLogCommon(v10);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000F57B4(self, v13);
    }
    BOOL v5 = 0;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTRotor customPublicRotors](self, "customPublicRotors"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v11,  "objectAtIndexedSubscript:",  -[VOTRotor publicCustomRotorIndex](self, "publicCustomRotorIndex")));
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"name"]);

    BOOL v5 = (id)+[VOTRotor rotorTypeForSystemRotorType:](&OBJC_CLASS___VOTRotor, "rotorTypeForSystemRotorType:", v13) == (id)65;
  }

  return v5;
}

- (id)currentRotorHint
{
  if (self->_currentRotorType == 6)
  {
    v2 = @"rotor.text.selection.hint";
  }

  else
  {
    if (!-[VOTRotor inMisspelledWordRotor](self, "inMisspelledWordRotor"))
    {
      uint64_t v4 = 0LL;
      return v4;
    }

    v2 = @"rotor.text.misspelled.word.hint";
  }

  id v3 = sub_10004A988(off_1001AC148, v2, 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  return v4;
}

- (id)currentRotorString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTRotor _currentCustomRotorString](self, "_currentCustomRotorString"));
  uint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[VOTRotor stringForRotorType:](&OBJC_CLASS___VOTRotor, "stringForRotorType:", self->_currentRotorType));
  }
  CFRange v6 = v5;

  return v6;
}

- (id)rotorItems
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  CFIndex Count = CFArrayGetCount(self->_currentRotors);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    for (CFIndex i = 0LL; i != v5; ++i)
      -[NSMutableIndexSet addIndex:](v3, "addIndex:", CFArrayGetValueAtIndex(self->_currentRotors, i));
  }

  return v3;
}

- (void)setRotorItems:(id)a3
{
  id v6 = a3;
  CFArrayRemoveAllValues(self->_currentRotors);
  id v4 = [v6 firstIndex];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (id i = v4; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [v6 indexGreaterThanIndex:i])
      CFArrayAppendValue(self->_currentRotors, i);
  }
}

+ (BOOL)rotorIsUsedForSettingAdjustment:(int64_t)a3
{
  BOOL result = 1;
  switch(a3)
  {
    case 20LL:
    case 21LL:
    case 22LL:
    case 23LL:
    case 24LL:
    case 25LL:
    case 36LL:
    case 48LL:
    case 49LL:
    case 50LL:
    case 51LL:
    case 52LL:
    case 53LL:
    case 54LL:
    case 55LL:
    case 56LL:
    case 57LL:
    case 60LL:
    case 72LL:
    case 73LL:
    case 74LL:
    case 75LL:
    case 76LL:
    case 77LL:
    case 78LL:
    case 79LL:
    case 80LL:
    case 81LL:
    case 82LL:
    case 83LL:
    case 84LL:
    case 87LL:
    case 88LL:
    case 89LL:
    case 90LL:
      return result;
    default:
      BOOL result = 0;
      break;
  }

  return result;
}

- (int64_t)customRotorIndex
{
  return self->_customRotorIndex;
}

- (VOTElement)currentRotorElement
{
  return (VOTElement *)objc_loadWeakRetained((id *)&self->_currentRotorElement);
}

- (void)setCurrentRotorElement:(id)a3
{
}

- (VOTRotorDelegate)delegate
{
  return (VOTRotorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)publicCustomRotorIndex
{
  return self->_publicCustomRotorIndex;
}

- (int64_t)customActionIndex
{
  return self->_customActionIndex;
}

- (void)setCustomActionIndex:(int64_t)a3
{
  self->_int64_t customActionIndex = a3;
}

- (void).cxx_destruct
{
}

@end