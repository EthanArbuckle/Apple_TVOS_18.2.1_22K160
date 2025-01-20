@interface VOTTextSearchManager
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)textSearchModeIsOn;
- (NSString)currentSearchValue;
- (VOTBrailleManager)brailleManager;
- (VOTTextSearchManager)init;
- (void)_handleArrowKey:(id)a3;
- (void)_handleDelete:(id)a3;
- (void)_handleLetter:(id)a3;
- (void)_handleRightLeftMovement:(id)a3;
- (void)_handleUpDownMovement:(id)a3;
- (void)_syncSearchBufferHistory;
- (void)_updateBrailleWithBuffer;
- (void)beginNewTextSearchSession;
- (void)endTextSearchSession;
- (void)handleReplaceRange:(_NSRange)a3 withString:(id)a4 cursor:(int64_t)a5;
- (void)handleTextSearchEvent:(id)a3;
- (void)setBrailleManager:(id)a3;
- (void)setCurrentSearchValue:(id)a3;
@end

@implementation VOTTextSearchManager

+ (void)initialize
{
  id v2 = [objc_allocWithZone((Class)VOTTextSearchManager) init];
  v3 = (void *)qword_1001AD060;
  qword_1001AD060 = (uint64_t)v2;
}

+ (id)sharedManager
{
  return (id)qword_1001AD060;
}

- (VOTTextSearchManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___VOTTextSearchManager;
  id v2 = -[VOTTextSearchManager init](&v13, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 preferenceForKey:@"SearchBufferHistory"]);
    v5 = (NSMutableArray *)[v4 mutableCopyWithZone:0];
    history = v2->_history;
    v2->_history = v5;

    if (!v2->_history)
    {
      v7 = (NSMutableArray *)[objc_allocWithZone(NSMutableArray) init];
      v8 = v2->_history;
      v2->_history = v7;
    }

    v9 = (NSMutableString *)[objc_allocWithZone(NSMutableString) init];
    buffer = v2->_buffer;
    v2->_buffer = v9;

    v2->_textSearchModeIsOn = 0;
    v11 = v2;
  }

  return v2;
}

- (void)_syncSearchBufferHistory
{
  if ((unint64_t)-[NSMutableArray count](self->_history, "count") >= 0x1F) {
    -[NSMutableArray removeObjectsInRange:]( self->_history,  "removeObjectsInRange:",  30LL,  (char *)-[NSMutableArray count](self->_history, "count") - 30);
  }
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  [v3 setPreference:self->_history forKey:@"SearchBufferHistory"];
}

- (void)beginNewTextSearchSession
{
  self->_bufferIndex = 0LL;
  self->_textSearchModeIsOn = 1;
  -[VOTTextSearchManager _updateBrailleWithBuffer](self, "_updateBrailleWithBuffer");
}

- (void)endTextSearchSession
{
  self->_textSearchModeIsOn = 0;
  history = self->_history;
  id v4 = -[NSMutableString copy](self->_buffer, "copy");
  -[NSMutableArray insertObject:atIndex:](history, "insertObject:atIndex:", v4, 0LL);

  -[VOTTextSearchManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_syncSearchBufferHistory",  0LL,  0.5);
}

- (void)setCurrentSearchValue:(id)a3
{
}

- (NSString)currentSearchValue
{
  return (NSString *)self->_buffer;
}

- (void)_handleRightLeftMovement:(id)a3
{
  id v4 = a3;
  int64_t bufferIndex = self->_bufferIndex;
  id v21 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]);
  unsigned int v7 = [v6 keyCode];

  if (v7 == 80)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v21 keyInfo]);
    unsigned int v14 = [v13 isCommandKeyPressed];

    if (v14)
    {
      if (self->_bufferIndex) {
        int64_t bufferIndex = 0LL;
      }
      else {
        int64_t bufferIndex = -1LL;
      }
    }

    else
    {
      --bufferIndex;
    }
  }

  else if (v7 == 79)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v21 keyInfo]);
    unsigned int v9 = [v8 isCommandKeyPressed];

    if (v9)
    {
      int64_t v10 = self->_bufferIndex;
      id v11 = -[NSMutableString length](self->_buffer, "length");
      id v12 = -[NSMutableString length](self->_buffer, "length");
      if ((id)v10 == v11) {
        int64_t bufferIndex = (int64_t)v12 + 1;
      }
      else {
        int64_t bufferIndex = (int64_t)v12;
      }
    }

    else
    {
      ++bufferIndex;
    }
  }

  id v15 = -[NSMutableString length](self->_buffer, "length");
  if ((bufferIndex & 0x8000000000000000LL) == 0 && bufferIndex <= (unint64_t)v15)
  {
    int64_t v16 = self->_bufferIndex;
    int64_t v17 = bufferIndex - v16;
    if (bufferIndex >= v16)
    {
      if (bufferIndex <= v16)
      {
        v18 = 0LL;
        goto LABEL_21;
      }
    }

    else
    {
      int64_t v17 = v16 - bufferIndex;
      int64_t v16 = bufferIndex;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](self->_buffer, "substringWithRange:", v16, v17));
LABEL_21:
    id v20 = sub_10000BBB0(v18, 0, 0LL);
    self->_int64_t bufferIndex = bufferIndex;
    goto LABEL_22;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
  [v18 sendEvent:v19];

LABEL_22:
}

- (void)_handleUpDownMovement:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 keyInfo]);
  unsigned int v5 = [v4 keyCode];
  int64_t historyIndex = self->_historyIndex;
  if (v5 == 82) {
    unint64_t v7 = historyIndex + 1;
  }
  else {
    unint64_t v7 = historyIndex - 1;
  }

  if ((v7 & 0x8000000000000000LL) != 0)
  {
    -[NSMutableString setString:](self->_buffer, "setString:", &stru_10017A920);
    self->_int64_t bufferIndex = 0LL;
    goto LABEL_8;
  }

  if (v7 >= (unint64_t)-[NSMutableArray count](self->_history, "count"))
  {
LABEL_8:
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
    [v10 sendEvent:v9];

    goto LABEL_9;
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_history, "objectAtIndex:", v7));
  id v8 = sub_10000BBB0(v10, 0, 0LL);
  -[NSMutableString setString:](self->_buffer, "setString:", v10);
  self->_int64_t bufferIndex = (int64_t)[v10 length];
  self->_int64_t historyIndex = v7;
LABEL_9:
}

- (void)_handleArrowKey:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 keyInfo]);
  unsigned int v5 = [v4 keyCode];

  if (v5 - 81 < 2)
  {
    -[VOTTextSearchManager _handleUpDownMovement:](self, "_handleUpDownMovement:", v7);
    goto LABEL_5;
  }

  v6 = v7;
  if (v5 - 79 <= 1)
  {
    -[VOTTextSearchManager _handleRightLeftMovement:](self, "_handleRightLeftMovement:", v7);
LABEL_5:
    v6 = v7;
  }
}

- (void)_handleDelete:(id)a3
{
  id v20 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v20 keyInfo]);
  unsigned int v5 = [v4 keyCode];

  if (v5 == 42)
  {
    int64_t bufferIndex = self->_bufferIndex;
    if (bufferIndex)
    {
      int64_t v7 = bufferIndex - 1;
LABEL_9:
      uint64_t v13 = 1LL;
      goto LABEL_10;
    }

    goto LABEL_6;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v20 keyInfo]);
  unsigned int v9 = [v8 keyCode];

  if (v9 == 76)
  {
    id v10 = (id)self->_bufferIndex;
    if (v10 != -[NSMutableString length](self->_buffer, "length"))
    {
      int64_t v7 = self->_bufferIndex;
      goto LABEL_9;
    }

- (void)_handleLetter:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 keyInfo]);
  id v26 = (id)objc_claimAutoreleasedReturnValue([v4 characters]);

  if ([v26 length])
  {
    int64_t bufferIndex = self->_bufferIndex;
    id v6 = -[NSMutableString length](self->_buffer, "length");
    buffer = self->_buffer;
    if ((id)bufferIndex == v6)
    {
      -[NSMutableString appendString:](buffer, "appendString:", v26);
      id v8 = -[NSMutableString length](self->_buffer, "length");
    }

    else
    {
      -[NSMutableString insertString:atIndex:](buffer, "insertString:atIndex:", v26, self->_bufferIndex);
      id v8 = (id)(self->_bufferIndex + 1);
    }

    self->_int64_t bufferIndex = (int64_t)v8;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unint64_t v10 = (unint64_t)[v9 voiceOverHardwareTypingFeedback];

    id v11 = [objc_allocWithZone((Class)VOTOutputRequest) init];
    id v12 = v11;
    if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      id v13 = [v11 addString:v26];
      if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
      {
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 lastAction]);
        LODWORD(v15) = 1.5;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15));
        [v14 setObject:v16 forVariant:32];
      }
    }

    if (v10 - 1 <= 1)
    {
      int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet wordBreakCharacterSet](&OBJC_CLASS___NSCharacterSet, "wordBreakCharacterSet"));
      if (objc_msgSend(v17, "characterIsMember:", objc_msgSend(v26, "characterAtIndex:", 0))
        && (unint64_t)-[NSMutableString length](self->_buffer, "length") >= 2)
      {
        double v18 = -[NSMutableString rangeOfCharacterFromSet:options:range:]( self->_buffer,  "rangeOfCharacterFromSet:options:range:",  v17,  4LL,  0LL,  (char *)-[NSMutableString length](self->_buffer, "length") - 1);
        if (v18 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = 0LL;
          id v20 = (char *)(self->_bufferIndex - 1);
        }

        else
        {
          v19 = v18;
          id v20 = (char *)((_BYTE *)-[NSMutableString length](self->_buffer, "length") - v18);
        }

        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](self->_buffer, "substringWithRange:", v19, v20));
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByTrimmingCharactersInSet:v22]);
        id v24 = [v23 length];

        if (v24) {
          id v25 = [v12 addString:v21];
        }
      }
    }

    [v12 send];
  }
}

- (void)handleTextSearchEvent:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 keyInfo]);
  unsigned int v5 = [v4 keyDown];

  id v6 = v9;
  if (v5)
  {
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v9 keyInfo]);
    unsigned int v8 = [v7 keyCode];

    if (v8 - 79 >= 4)
    {
      if (v8 == 42 || v8 == 76) {
        -[VOTTextSearchManager _handleDelete:](self, "_handleDelete:", v9);
      }
      else {
        -[VOTTextSearchManager _handleLetter:](self, "_handleLetter:", v9);
      }
    }

    else
    {
      -[VOTTextSearchManager _handleArrowKey:](self, "_handleArrowKey:", v9);
    }

    -[VOTTextSearchManager _updateBrailleWithBuffer](self, "_updateBrailleWithBuffer");
    id v6 = v9;
  }
}

- (void)handleReplaceRange:(_NSRange)a3 withString:(id)a4 cursor:(int64_t)a5
{
  length = (char *)a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  if (&length[location] > -[NSMutableString length](self->_buffer, "length")) {
    length = (char *)-[NSMutableString length](self->_buffer, "length") - location;
  }
  -[NSMutableString replaceCharactersInRange:withString:]( self->_buffer,  "replaceCharactersInRange:withString:",  location,  length,  v9);
  self->_int64_t bufferIndex = a5;
}

- (void)_updateBrailleWithBuffer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTextSearchManager brailleManager](self, "brailleManager"));

  if (v3)
  {
    id v4 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  self->_buffer);
    unsigned int v5 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    uint64_t v10 = kSCROEditableTextPaddingAttribute;
    id v11 = &__kCFBooleanTrue;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    int64_t v7 = -[NSAttributedString initWithString:attributes:](v5, "initWithString:attributes:", @" ", v6);
    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v7);

    -[NSMutableAttributedString addAttribute:value:range:]( v4,  "addAttribute:value:range:",  kSCROEditableTextAttribute,  &__kCFBooleanTrue,  0LL,  -[NSMutableAttributedString length](v4, "length"));
    -[NSMutableAttributedString addAttribute:value:range:]( v4,  "addAttribute:value:range:",  kSCROCursorAttribute,  &__kCFBooleanTrue,  self->_bufferIndex,  1LL);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTTextSearchManager brailleManager](self, "brailleManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
    objc_msgSend( v8,  "setBrailleString:type:timeout:langCode:brailleLineRange:isBrailleLineRangeKnown:",  v4,  1,  v9,  self->_bufferIndex,  1,  1,  1.0);
  }

- (VOTBrailleManager)brailleManager
{
  return self->_brailleManager;
}

- (void)setBrailleManager:(id)a3
{
}

- (BOOL)textSearchModeIsOn
{
  return self->_textSearchModeIsOn;
}

- (void).cxx_destruct
{
}

@end