@interface TITypingLog
+ (id)emptyTouchEventForLogging;
+ (id)typingLog;
+ (id)typingLogWithDebug:(BOOL)a3;
- (BOOL)adjustForContinuousPath;
- (BOOL)isDebugEnabled;
- (NSArray)keystrokesForTokens;
- (NSMutableArray)currentKeystrokeSequence;
- (TIKeystrokeRecord)currentKeystroke;
- (TITypingLog)init;
- (TITypingLog)initWithDebug:(BOOL)a3;
- (id)correctedTransliterationSequence;
- (id)getDebugData;
- (id)getDebugObject:(id)a3;
- (id)intendedTransliterationSequence;
- (void)addDebugObject:(id)a3 forKey:(id)a4;
- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5;
- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5 documentBefore:(id)a6;
- (void)beginToken;
- (void)enumerateKeystrokesAndPathsForTokensWithBlock:(id)a3;
- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5;
- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5 predictionBarState:(id)a6 inlineCompletionBarState:(id)a7;
- (void)logAcceptedCandidate:(id)a3;
- (void)logAcceptedCandidate:(id)a3 intendedTransliterationCandidate:(id)a4;
- (void)logAutocorrectionInserted;
- (void)logRejectedAutocorrection;
- (void)registerPathStringAsKeyStrokes:(id)a3 path:(id)a4 predictionBarState:(id)a5;
- (void)revisitPreviousToken;
- (void)setCurrentKeystroke:(id)a3;
- (void)setCurrentKeystrokeSequence:(id)a3;
- (void)setTokenIndex:(unint64_t)a3;
@end

@implementation TITypingLog

+ (id)typingLog
{
  return +[TITypingLog typingLogWithDebug:](&OBJC_CLASS___TITypingLog, "typingLogWithDebug:", 0LL);
}

+ (id)typingLogWithDebug:(BOOL)a3
{
  return -[TITypingLog initWithDebug:](objc_alloc(&OBJC_CLASS___TITypingLog), "initWithDebug:", a3);
}

- (TITypingLog)initWithDebug:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TITypingLog;
  v4 = -[TITypingLog init](&v16, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    keystrokesForTokens = v4->_keystrokesForTokens;
    v4->_keystrokesForTokens = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    correctedTransliterationForTokens = v4->_correctedTransliterationForTokens;
    v4->_correctedTransliterationForTokens = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    intendedTransliterationForTokens = v4->_intendedTransliterationForTokens;
    v4->_intendedTransliterationForTokens = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pathsForTokens = v4->_pathsForTokens;
    v4->_pathsForTokens = (NSMutableDictionary *)v11;

    v4->_isTransliterating = 0;
    if (v3)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      debugData = v4->_debugData;
      v4->_debugData = (NSMutableDictionary *)v13;
    }
  }

  return v4;
}

- (TITypingLog)init
{
  return -[TITypingLog initWithDebug:](self, "initWithDebug:", 0LL);
}

- (void)beginToken
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[TITypingLog setCurrentKeystrokeSequence:](self, "setCurrentKeystrokeSequence:", v3);

  keystrokesForTokens = self->_keystrokesForTokens;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystrokeSequence](self, "currentKeystrokeSequence"));
  -[NSMutableArray addObject:](keystrokesForTokens, "addObject:", v5);

  correctedTransliterationForTokens = self->_correctedTransliterationForTokens;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", &stru_89E80));
  -[NSMutableArray addObject:](correctedTransliterationForTokens, "addObject:", v7);

  intendedTransliterationForTokens = self->_intendedTransliterationForTokens;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", &stru_89E80));
  -[NSMutableArray addObject:](intendedTransliterationForTokens, "addObject:", v9);
}

- (void)setTokenIndex:(unint64_t)a3
{
  for (i = self->_keystrokesForTokens;
        (unint64_t)-[NSMutableArray count](i, "count") <= a3;
        i = self->_keystrokesForTokens)
  {
    -[TITypingLog beginToken](self, "beginToken");
  }

  unint64_t v6 = a3 + 1;
}

- (void)revisitPreviousToken
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_keystrokesForTokens, "lastObject"));
  -[NSMutableArray removeLastObject](self->_keystrokesForTokens, "removeLastObject");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_keystrokesForTokens, "lastObject"));
  [v3 addObjectsFromArray:v4];
  -[TITypingLog setCurrentKeystrokeSequence:](self, "setCurrentKeystrokeSequence:", v3);
}

+ (id)emptyTouchEventForLogging
{
  return +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:]( &OBJC_CLASS___TIKeyboardTouchEvent,  "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:",  7LL,  0LL,  -1LL,  -1.0,  -1.0,  0.0,  0.0);
}

- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (__CFString *)a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[TIKeystrokeRecord keystrokeRecord](&OBJC_CLASS___TIKeystrokeRecord, "keystrokeRecord"));
  -[TITypingLog setCurrentKeystroke:](self, "setCurrentKeystroke:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystrokeSequence](self, "currentKeystrokeSequence"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v12 addObject:v13];

  if (v10) {
    v14 = v10;
  }
  else {
    v14 = &stru_89E80;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v15 setIntendedKey:v14];

  objc_super v16 = v9;
  if (!v9) {
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[TITypingLog emptyTouchEventForLogging](&OBJC_CLASS___TITypingLog, "emptyTouchEventForLogging"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v17 setTouch:v16];

  if (!v9) {
  id v19 = v8;
  }
  if (!v8) {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[TIPointError errorWithErrorVector:](&OBJC_CLASS___TIPointError, "errorWithErrorVector:", 0.0, 0.0));
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v18 setTouchError:v19];

  if (!v8) {
}
  }

- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5 documentBefore:(id)a6
{
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TIKeystrokeRecord keystrokeRecord](&OBJC_CLASS___TIKeystrokeRecord, "keystrokeRecord"));
  -[TITypingLog setCurrentKeystroke:](self, "setCurrentKeystroke:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystrokeSequence](self, "currentKeystrokeSequence"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v15 addObject:v16];

  if (v10) {
    v17 = v10;
  }
  else {
    v17 = &stru_89E80;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v18 setIntendedKey:v17];

  id v19 = v11;
  if (!v11) {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[TITypingLog emptyTouchEventForLogging](&OBJC_CLASS___TITypingLog, "emptyTouchEventForLogging"));
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v20 setTouch:v19];

  if (!v11) {
  v21 = v12;
  }
  if (!v12) {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TIPointError errorWithErrorVector:](&OBJC_CLASS___TIPointError, "errorWithErrorVector:", 0.0, 0.0));
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v22 setTouchError:v21];

  if (!v12) {
  uint64_t v33 = 0LL;
  }
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_5C74;
  v37 = sub_5C84;
  id v23 = v13;
  id v38 = v23;
  if ((unint64_t)[(id)v34[5] length] >= 0x21)
  {
    id v24 = [v23 length];
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472LL;
    v29 = sub_5C8C;
    v30 = &unk_88CB0;
    id v31 = v23;
    v32 = &v33;
    objc_msgSend(v31, "enumerateSubstringsInRange:options:usingBlock:", 0, v24, 259, &v27);
  }

  uint64_t v25 = v34[5];
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke", v27, v28, v29, v30));
  [v26 setDocumentState:v25];

  _Block_object_dispose(&v33, 8);
}

- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5 predictionBarState:(id)a6 inlineCompletionBarState:(id)a7
{
  if (a3) {
    id v12 = (const __CFString *)a3;
  }
  else {
    id v12 = @"<NoKey>";
  }
  id v13 = a7;
  id v14 = a6;
  v15 = (__CFString *)a5;
  id v16 = a4;
  id v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v18 setTouchedKey:v12];

  if (v15) {
    id v19 = v15;
  }
  else {
    id v19 = &stru_89E80;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v20 setInsertedKey:v19];

  v21 = v16;
  if (!v16) {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TITypingLog emptyTouchEventForLogging](&OBJC_CLASS___TITypingLog, "emptyTouchEventForLogging"));
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v22 setTouch:v21];

  if (!v16) {
  id v23 = v14;
  }
  if (!v14) {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v24 setPredictionBarState:v23];

  if (!v14) {
  id v26 = v13;
  }
  if (!v13) {
    id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog currentKeystroke](self, "currentKeystroke"));
  [v25 setInlineCompletionBarState:v26];

  if (!v13) {
}
  }

- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5
{
}

- (void)registerPathStringAsKeyStrokes:(id)a3 path:(id)a4 predictionBarState:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v15 length])
  {
    uint64_t v10 = 0LL;
    unsigned int v11 = 1;
    do
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", v10, 1));
      -[TITypingLog beginKeystrokeWithIntendedKey:touchEvent:touchError:]( self,  "beginKeystrokeWithIntendedKey:touchEvent:touchError:",  0LL,  0LL,  0LL);
      -[TITypingLog finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:]( self,  "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:",  v12,  0LL,  v12,  v9,  0LL);

      uint64_t v10 = v11;
    }

    while ([v15 length] != (id)v11++);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (char *)-[NSMutableArray count](self->_keystrokesForTokens, "count") - 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pathsForTokens, "setObject:forKeyedSubscript:", v8, v14);
}

- (void)logAcceptedCandidate:(id)a3
{
}

- (void)logAcceptedCandidate:(id)a3 intendedTransliterationCandidate:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"{%@}", v10));
  -[TITypingLog beginKeystrokeWithIntendedKey:touchEvent:touchError:]( self,  "beginKeystrokeWithIntendedKey:touchEvent:touchError:",  v7,  0LL,  0LL);
  -[TITypingLog finishKeystrokeWithTouchedKey:touchEvent:insertedKey:]( self,  "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:",  v7,  0LL,  &stru_89E80);
  if (v6)
  {
    self->_isTransliterating = 1;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_correctedTransliterationForTokens, "lastObject"));
    [v8 appendString:v10];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_intendedTransliterationForTokens, "lastObject"));
    [v9 appendString:v6];
  }
}

- (void)logRejectedAutocorrection
{
}

- (void)logAutocorrectionInserted
{
}

- (void)enumerateKeystrokesAndPathsForTokensWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TITypingLog keystrokesForTokens](self, "keystrokesForTokens"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_6218;
  v7[3] = &unk_88CD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (id)getDebugData
{
  return self->_debugData;
}

- (void)addDebugObject:(id)a3 forKey:(id)a4
{
  debugData = self->_debugData;
  if (debugData) {
    -[NSMutableDictionary setObject:forKey:](debugData, "setObject:forKey:", a3, a4);
  }
}

- (id)getDebugObject:(id)a3
{
  debugData = self->_debugData;
  if (debugData) {
    debugData = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](debugData, "objectForKey:", a3));
  }
  return debugData;
}

- (BOOL)isDebugEnabled
{
  return self->_debugData != 0LL;
}

- (BOOL)adjustForContinuousPath
{
  int v3 = -[NSMutableArray count](self->_currentKeystrokeSequence, "count");
  if (v3 < 2) {
    return 0;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( self->_currentKeystrokeSequence,  "objectAtIndex:",  (v3 - 1)));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 touchedKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( self->_currentKeystrokeSequence,  "objectAtIndex:",  (v3 - 2)));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 touchedKey]);

  if ([v5 length] == (char *)&dword_0 + 1
    && [v7 length] == (char *)&dword_0 + 1
    && TICharIsSpace([v5 characterAtIndex:0])
    && TICharIsAlphaNumeric([v7 characterAtIndex:0]))
  {
    -[NSMutableArray removeLastObject](self->_currentKeystrokeSequence, "removeLastObject");
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)correctedTransliterationSequence
{
  if (self->_isTransliterating) {
    return self->_correctedTransliterationForTokens;
  }
  else {
    return 0LL;
  }
}

- (id)intendedTransliterationSequence
{
  if (self->_isTransliterating) {
    return self->_intendedTransliterationForTokens;
  }
  else {
    return 0LL;
  }
}

- (NSArray)keystrokesForTokens
{
  return &self->_keystrokesForTokens->super;
}

- (NSMutableArray)currentKeystrokeSequence
{
  return self->_currentKeystrokeSequence;
}

- (void)setCurrentKeystrokeSequence:(id)a3
{
}

- (TIKeystrokeRecord)currentKeystroke
{
  return self->_currentKeystroke;
}

- (void)setCurrentKeystroke:(id)a3
{
}

- (void).cxx_destruct
{
}

@end