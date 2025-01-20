@interface TITestTyperDriver
- (BOOL)consumeTestFile:(id)a3;
- (BOOL)consumeTextString:(id)a3;
- (BOOL)handleBoolConfig:(id)a3 withValue:(BOOL)a4 lineNumber:(int)a5;
- (BOOL)handleIntConfig:(id)a3 withValue:(int)a4 lineNumber:(int)a5;
- (BOOL)handleStringConfig:(id)a3 withValue:(id)a4 lineNumber:(int)a5;
- (BOOL)isDebug;
- (NSMutableArray)failedTests;
- (NSMutableArray)syntaxErrors;
- (TIKeyboardTyper)testTyper;
- (TITestTyperDriver)init;
- (TITestTyperDriver)initWithTestTyper:(id)a3;
- (void)handleCommand:(id)a3 withValue:(id)a4 lineNumber:(int)a5;
- (void)handleCorrectionMatch:(id)a3 lineNumber:(int)a4;
- (void)handleDocumentMatch:(id)a3 lineNumber:(int)a4;
- (void)handleNewLine;
- (void)handlePredictionMatch:(id)a3 lineNumber:(int)a4;
- (void)handleTyping:(id)a3;
- (void)printDebugInfo:(id)a3 lineNumber:(int)a4;
- (void)reportFailedTest:(id)a3 lineNumber:(int)a4;
- (void)reportSyntaxErrors:(id)a3 lineNumber:(int)a4;
- (void)selectFromPredictionBar:(id)a3 lineNumber:(int)a4;
- (void)setDebug:(BOOL)a3;
- (void)setTestTyper:(id)a3;
@end

@implementation TITestTyperDriver

- (TITestTyperDriver)init
{
  return -[TITestTyperDriver initWithTestTyper:](self, "initWithTestTyper:", 0LL);
}

- (TITestTyperDriver)initWithTestTyper:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TITestTyperDriver;
  v6 = -[TITestTyperDriver init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_testTyper, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    failedTests = v7->_failedTests;
    v7->_failedTests = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    syntaxErrors = v7->_syntaxErrors;
    v7->_syntaxErrors = v10;
  }

  return v7;
}

- (BOOL)consumeTestFile:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    qword_AA448 = (uint64_t)fopen((const char *)[v4 UTF8String], "r");
  }

  else
  {
    qword_AA448 = (uint64_t)__stdinp;
    self->_debug = 1;
    printf("\n\n****** UNIT TEST CONSOLE *****\n\n==>");
    fflush(__stdoutp);
  }

  sub_556BC();
  sub_526CC(self);
  if (v5) {
    fclose((FILE *)qword_AA448);
  }
  qword_AA448 = 0LL;

  return 1;
}

- (BOOL)consumeTextString:(id)a3
{
  testTyper = self->_testTyper;
  id v5 = a3;
  -[TIKeyboardTyper reset](testTyper, "reset");
  sub_556BC();
  id v6 = v5;
  v7 = (const char *)[v6 UTF8String];

  v8 = sub_554CC(v7);
  sub_526CC(self);
  sub_551F0((void **)v8);
  return !-[NSMutableArray count](self->_failedTests, "count")
      && -[NSMutableArray count](self->_syntaxErrors, "count") == 0LL;
}

- (void)reportFailedTest:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"line:%d, %@",  v4,  v7));
  if (self->_debug) {
    NSLog(@"failed test: %@\n", v7);
  }
  else {
    -[NSMutableArray addObject:](self->_failedTests, "addObject:", v6);
  }
}

- (void)reportSyntaxErrors:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"line:%d, %@",  v4,  v7));
  if (self->_debug) {
    NSLog(@"error: %@\n", v7);
  }
  else {
    -[NSMutableArray addObject:](self->_syntaxErrors, "addObject:", v6);
  }
}

- (void)handleTyping:(id)a3
{
}

- (void)handleNewLine
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper text](self->_testTyper, "text"));
  id v7 = v3;
  if (self->_debug)
  {
    if ([v3 length])
    {
      id v4 = v7;
      printf("text: %s\n", (const char *)[v4 UTF8String]);
      if (([v4 hasSuffix:@" "] & 1) == 0)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection"));
        id v6 = objc_claimAutoreleasedReturnValue([v5 candidate]);
        printf("corr: %s\n", (const char *)[v6 UTF8String]);
      }
    }

    -[TIKeyboardTyper reset](self->_testTyper, "reset");
    printf("==> ");
  }

  else
  {
    -[TITestTyperDriver handleTyping:](self, "handleTyping:", @"\n");
  }
}

- (void)handleDocumentMatch:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper text](self->_testTyper, "text"));
  if (([v6 hasSuffix:v8] & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"expected text '%@' got '%@'",  v8,  v6));
    -[TITestTyperDriver reportFailedTest:lineNumber:](self, "reportFailedTest:lineNumber:", v7, v4);
  }
}

- (void)handlePredictionMatch:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  if (!-[TIKeyboardTyper hasPrediction:](self->_testTyper, "hasPrediction:"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"expected prediction '%@'",  v7));
    -[TITestTyperDriver reportFailedTest:lineNumber:](self, "reportFailedTest:lineNumber:", v6, v4);
  }
}

- (void)handleCorrectionMatch:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v12 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 candidate]);
  unsigned __int8 v8 = [v7 isEqualToString:v12];

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 candidate]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"expected autocorrection '%@' got '%@'",  v12,  v10));
    -[TITestTyperDriver reportFailedTest:lineNumber:](self, "reportFailedTest:lineNumber:", v11, v4);
  }
}

- (void)handleCommand:(id)a3 withValue:(id)a4 lineNumber:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v10 = a3;
  id v8 = a4;
  if ([v10 isEqualToString:@"shift"])
  {
    -[TIKeyboardTyper attemptToShift](self->_testTyper, "attemptToShift");
  }

  else if ([v10 isEqualToString:@"delete"])
  {
    -[TIKeyboardTyper attemptToDelete](self->_testTyper, "attemptToDelete");
  }

  else if ([v10 isEqualToString:@"reset"])
  {
    -[TIKeyboardTyper reset](self->_testTyper, "reset");
  }

  else if ([v10 isEqualToString:@"reject"])
  {
    -[TIKeyboardTyper rejectAutocorrection](self->_testTyper, "rejectAutocorrection");
  }

  else if ([v10 isEqualToString:@"accept"])
  {
    -[TIKeyboardTyper acceptAutocorrection](self->_testTyper, "acceptAutocorrection");
  }

  else if ([v10 isEqualToString:@"sync"])
  {
    -[TIKeyboardTyper syncToEmptyDocument](self->_testTyper, "syncToEmptyDocument");
  }

  else if ([v10 isEqualToString:@"print"])
  {
    -[TITestTyperDriver printDebugInfo:lineNumber:](self, "printDebugInfo:lineNumber:", v8, v5);
  }

  else if ([v10 isEqualToString:@"select"])
  {
    -[TITestTyperDriver selectFromPredictionBar:lineNumber:](self, "selectFromPredictionBar:lineNumber:", v8, v5);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown command %@",  v10));
    -[TITestTyperDriver reportSyntaxErrors:lineNumber:](self, "reportSyntaxErrors:lineNumber:", v9, v5);
  }
}

- (BOOL)handleBoolConfig:(id)a3 withValue:(BOOL)a4 lineNumber:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 isEqualToString:@"wordLearningEnabled"])
  {
    -[TIKeyboardTyper setWordLearningEnabled:](self->_testTyper, "setWordLearningEnabled:", v6);
LABEL_6:
    -[TIKeyboardTyper reset](self->_testTyper, "reset");
    goto LABEL_7;
  }

  if (([v8 isEqualToString:@"usesPrediction"] & 1) != 0
    || [v8 isEqualToString:@"generateMultipleCandidates"])
  {
    -[TIKeyboardTyper setUsesPrediction:](self->_testTyper, "setUsesPrediction:", v6);
    goto LABEL_6;
  }

  if ([v8 isEqualToString:@"usesAutocapitalization"])
  {
    -[TIKeyboardTyper setUsesAutocapitalization:](self->_testTyper, "setUsesAutocapitalization:", v6);
    goto LABEL_6;
  }

  if ([v8 isEqualToString:@"hardwareKeyboardMode"])
  {
    -[TIKeyboardTyper setHardwareKeyboardMode:](self->_testTyper, "setHardwareKeyboardMode:", v6);
    goto LABEL_6;
  }

  if ([v8 isEqualToString:@"usesAutocorrection"])
  {
    -[TIKeyboardTyper setUsesAutocorrection:](self->_testTyper, "setUsesAutocorrection:", v6);
    goto LABEL_6;
  }

  if ([v8 isEqualToString:@"shouldSkipCandidateSelection"])
  {
    -[TIKeyboardTyper setShouldSkipCandidateSelection:](self->_testTyper, "setShouldSkipCandidateSelection:", v6);
  }

  else
  {
    if (![v8 isEqualToString:@"bisonDebug"])
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"line:%d, %@ is not recognized BOOLean configuration",  v5,  v8));
      -[NSMutableArray addObject:](self->_syntaxErrors, "addObject:", v11);

      BOOL v9 = 0;
      goto LABEL_8;
    }

    dword_AA430 = v6;
  }

- (BOOL)handleIntConfig:(id)a3 withValue:(int)a4 lineNumber:(int)a5
{
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"line:%d, %@ is not recognized integer configuration",  *(void *)&a4,  *(void *)&a5,  a3));
  -[NSMutableArray addObject:](self->_syntaxErrors, "addObject:", v6);

  return 0;
}

- (BOOL)handleStringConfig:(id)a3 withValue:(id)a4 lineNumber:(int)a5
{
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"line:%d, %@ is not recognized string configuration",  a4,  *(void *)&a5,  a3));
  -[NSMutableArray addObject:](self->_syntaxErrors, "addObject:", v6);

  return 0;
}

- (void)printDebugInfo:(id)a3 lineNumber:(int)a4
{
  id v5 = a3;
  BOOL v6 = v5;
  if (!v5 || ([v5 isEqualToString:@"all"] & 1) != 0)
  {
    id v7 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper text](self->_testTyper, "text"));
    printf("text: %s\n", (const char *)[v7 UTF8String]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 candidate]);
    printf("autocorrection: %s\n", (const char *)[v9 UTF8String]);

LABEL_4:
    printf("predictions: ");
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper predictions](self->_testTyper, "predictions"));
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v19 + 1) + 8 * (void)v14) candidate]);
          printf("%s, ", (const char *)[v15 UTF8String]);

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v12);
    }

    putchar(10);
    goto LABEL_12;
  }

  if ([v6 isEqualToString:@"text"])
  {
    id v16 = objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper text](self->_testTyper, "text"));
    printf("text: %s\n", (const char *)[v16 UTF8String]);
  }

  if ([v6 isEqualToString:@"correction"])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection"));
    id v18 = objc_claimAutoreleasedReturnValue([v17 candidate]);
    printf("autocorrection: %s\n", (const char *)[v18 UTF8String]);
  }

- (void)selectFromPredictionBar:(id)a3 lineNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper predictions](self->_testTyper, "predictions"));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 candidate]);
        unsigned int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          -[TIKeyboardTyper acceptPredictiveCandidate:](self->_testTyper, "acceptPredictiveCandidate:", v12);
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unable to select prediction '%@'",  v6));
  -[TITestTyperDriver reportFailedTest:lineNumber:](self, "reportFailedTest:lineNumber:", v7, v4);
LABEL_11:
}

- (TIKeyboardTyper)testTyper
{
  return self->_testTyper;
}

- (void)setTestTyper:(id)a3
{
}

- (NSMutableArray)failedTests
{
  return self->_failedTests;
}

- (NSMutableArray)syntaxErrors
{
  return self->_syntaxErrors;
}

- (BOOL)isDebug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (void).cxx_destruct
{
}

@end