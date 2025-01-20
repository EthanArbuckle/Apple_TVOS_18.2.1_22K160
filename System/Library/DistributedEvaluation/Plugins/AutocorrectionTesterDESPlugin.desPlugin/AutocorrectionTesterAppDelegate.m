@interface AutocorrectionTesterAppDelegate
+ (id)reporterWithOptions:(id)a3;
+ (void)setupSingletonMocksWithOptions:(id)a3;
+ (void)teardownSingletonMocks:(id)a3;
- (AutocorrectionTesterAppDelegate)initWithLocale:(id)a3 andText:(id)a4;
- (AutocorrectionTesterAppDelegate)initWithOptions:(id)a3;
- (BOOL)runAndWriteReport;
- (BOOL)runAutocorrectionTester:(id)a3;
- (BOOL)runTestCasesForSource:(id)a3 errorMessage:(id)a4 reportObserver:(id)a5;
- (BOOL)runTests:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6 reportObserver:(id)a7;
- (BOOL)runWithObserver:(id)a3;
- (double)runDslTest:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6;
- (void)resetOptions:(id)a3;
@end

@implementation AutocorrectionTesterAppDelegate

- (AutocorrectionTesterAppDelegate)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AutocorrectionTesterAppDelegate;
  v5 = -[AutocorrectionTesterAppDelegate init](&v9, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v4));
    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;
  }

  return v5;
}

- (AutocorrectionTesterAppDelegate)initWithLocale:(id)a3 andText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AutocorrectionTesterAppDelegate;
  v8 = -[AutocorrectionTesterAppDelegate init](&v13, "init");
  if (v8)
  {
    v14[0] = @"KEYBOARD_LANGUAGE";
    v14[1] = @"SENTENCE";
    v15[0] = v6;
    v15[1] = v7;
    v14[2] = @"USE_PREDICTION";
    v14[3] = @"MAX_PREDICTIONS_REPORTED";
    v15[2] = &__kCFBooleanTrue;
    v15[3] = &off_8FF60;
    v14[4] = @"USE_RETROCORRECTION";
    v14[5] = @"BASE_KEY_FOR_VARIANTS";
    v15[4] = &__kCFBooleanTrue;
    v15[5] = &__kCFBooleanFalse;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  6LL));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v9));
    options = v8->_options;
    v8->_options = (NSMutableDictionary *)v10;
  }

  return v8;
}

- (void)resetOptions:(id)a3
{
  id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
  options = self->_options;
  self->_options = v4;
}

+ (void)setupSingletonMocksWithOptions:(id)a3
{
  id v3 = a3;
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"NAMEDENTITIES"]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"PORTRAIT_NAMEDENTITIES"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"ADDRESSBOOK"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"TEST_AUTO_FILL_FEATURE"]);

  char v7 = [v6 BOOLValue];
  Class v8 = NSClassFromString(@"TITransientLexiconManager");
  if (!v5)
  {
    if (!(v16 | v4) || !v8)
    {
      _TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 0, v7);
      goto LABEL_16;
    }

+ (void)teardownSingletonMocks:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForKey:@"TEST_AUTO_FILL_FEATURE"]);
  char v4 = [v3 BOOLValue];

  _TIEndMockingSingletonsWithData(v4);
}

+ (id)reporterWithOptions:(id)a3
{
  id v3 = a3;
  char v4 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
  v5 = -[TIReporter initWithBuildVersion:](objc_alloc(&OBJC_CLASS___TIReporter), "initWithBuildVersion:", v4);
  -[TIReporter setOptions:](v5, "setOptions:", v3);

  return v5;
}

- (double)runDslTest:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v36 = a6;
  double Current = CFAbsoluteTimeGetCurrent();
  v37 = v11;
  NSLog(@"Current language being tested: %@\n", v11);
  NSLog(@"Current DSL file tested: %@\n", v10);
  context = objc_autoreleasePoolPush();
  [(id)objc_opt_class(self) setupSingletonMocksWithOptions:self->_options];
  id v13 = [[a4 alloc] initWithAttributes:self->_options];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
  [v14 runUntilDate:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 dslTestDriver]);
  [v16 consumeTestFile:v10];

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 dslTestDriver]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 syntaxErrors]);

  id v19 = [v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v19)
  {
    id v20 = v19;
    id v21 = 0LL;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v18);
        }
        id v24 = *(id *)(*((void *)&v42 + 1) + 8LL * (void)i);

        id v21 = v24;
        printf("Syntax Error: %s\n", (const char *)[v21 UTF8String]);
      }

      id v20 = [v18 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v20);
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v13 dslTestDriver]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 failedTests]);

  id v27 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v27)
  {
    id v28 = v27;
    id v29 = 0LL;
    uint64_t v30 = *(void *)v39;
    do
    {
      for (j = 0LL; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v26);
        }
        id v32 = *(id *)(*((void *)&v38 + 1) + 8LL * (void)j);

        id v29 = v32;
        printf("Failed Test: %s\n", (const char *)[v29 UTF8String]);
      }

      id v28 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v28);
  }

  objc_autoreleasePoolPop(context);
  [(id)objc_opt_class(self) teardownSingletonMocks:self->_options];
  double v33 = CFAbsoluteTimeGetCurrent() - Current;
  fprintf(__stderrp, "Testing time: %.2f s\n", v33);

  return v33;
}

- (BOOL)runTests:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6 reportObserver:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  double Current = CFAbsoluteTimeGetCurrent();
  NSLog(@"Current language being tested: %@\n", v13);
  if (v12)
  {
    id v34 = v14;
    context = objc_autoreleasePoolPush();
    [(id)objc_opt_class(self) setupSingletonMocksWithOptions:self->_options];
    id v17 = [(id)objc_opt_class(self) reporterWithOptions:self->_options];
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = [[a4 alloc] initWithAttributes:self->_options];
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
    [v20 runUntilDate:v21];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", @"NUM_TRIALS"));
    int v23 = [v22 intValue];

    if (v23 <= 1) {
      uint64_t v24 = 1LL;
    }
    else {
      uint64_t v24 = v23;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", @"START_INDEX"));
    unsigned int v26 = [v25 intValue];

    if (v26) {
      signed int v27 = v26 - 1;
    }
    else {
      signed int v27 = 0;
    }
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", @"END_INDEX"));
    unsigned int v29 = [v28 intValue];

    if (!v29) {
      unsigned int v29 = [v12 count];
    }
    +[TITester runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:]( &OBJC_CLASS___TITester,  "runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:",  v12,  v27,  (int)(v29 - v27),  v19,  self->_options,  v18,  v24,  v15);

    objc_autoreleasePoolPop(context);
    [(id)objc_opt_class(self) teardownSingletonMocks:self->_options];
    CFAbsoluteTime v30 = CFAbsoluteTimeGetCurrent() - Current;
    fprintf(__stderrp, "Testing time: %.2f s\n", v30);
    BOOL v31 = v30 != 0.0;
    id v14 = v34;
  }

  else
  {
    if (v14) {
      NSLog(@"%@", v14);
    }
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)runTestCasesForSource:(id)a3 errorMessage:(id)a4 reportObserver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  if (v8)
  {
    double v12 = Current;
    id v13 = objc_autoreleasePoolPush();
    [(id)objc_opt_class(self) setupSingletonMocksWithOptions:self->_options];
    id v14 = [(id)objc_opt_class(self) reporterWithOptions:self->_options];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 2.0));
    [v16 runUntilDate:v17];

    +[TITester runTestCasesForSource:options:reporter:reportObserver:]( &OBJC_CLASS___TITester,  "runTestCasesForSource:options:reporter:reportObserver:",  v8,  self->_options,  v15,  v10);
    objc_autoreleasePoolPop(v13);
    [(id)objc_opt_class(self) teardownSingletonMocks:self->_options];
    CFAbsoluteTime v18 = CFAbsoluteTimeGetCurrent() - v12;
    fprintf(__stderrp, "Testing time: %.2f s\n", v18);
    BOOL v19 = v18 != 0.0;
  }

  else
  {
    if (v9) {
      NSLog(@"%@", Current, v9);
    }
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)runAutocorrectionTester:(id)a3
{
  id v125 = a3;
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"WORDS"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"DICTS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"PLAYBACK"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"TEXT"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"TESTCASE"));
  uint64_t v122 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"TYPOLOGY"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"CANDIDATE_SENTENCES"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"USER_DIRECTORY"));
  char v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"CUSTOM_DIALECT_LANGUAGE_MODEL_PATH"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", @"RUN_DSL_TEST"));

  id v117 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"CONVERSATION_TESTS_FILE"));
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"CONVERSATION_TESTS"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"SENTENCE"));
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"PREFERS_TRANSLITERATION"));
  id v11 = v10;
  if (!v10) {
    id v10 = @"0";
  }
  unsigned int v12 = -[__CFString BOOLValue](v10, "BOOLValue");

  v118 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"INPUT_SAMPLES"));
  if (v6)
  {
    id v13 = v7;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"CLEAN_USER_DIRECTORY"));
    unsigned int v15 = [v14 intValue];

    if (v15) {
      sub_2DA48(v6);
    }
    else {
      sub_2D010(v6);
    }
    TI_SET_KB_USER_DIRECTORY(v6);
    char v7 = v13;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", @"KEYBOARD_LANGUAGE"));
  if (v16 && (sub_46010() & 1) == 0)
  {
    NSLog(@"unsupported language '%@'. You must specify a valid language!.\n", v16);
    unsigned __int8 v24 = 0;
    v25 = (void *)v122;
LABEL_38:
    v50 = v117;
LABEL_39:
    v49 = v123;
    goto LABEL_40;
  }

  unsigned int context = v12;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"TOUCAN_LM_MODE"));

  if (v17)
  {
    CFAbsoluteTime v18 = v4;
    id v19 = v9;
    id v20 = v16;
    id v21 = v7;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"TOUCAN_LM_MODE"));
    id v23 = [v22 intValue];

    if (v23 > 2)
    {
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"TOUCAN_LM_MODE"));
      NSLog(@"unsupported value for TOUCAN_LM_MODE option '%@'.\n", v26);
    }

    else
    {
      TI_SET_USING_TOUCAN_LM(v23);
    }

    char v7 = v21;
    uint64_t v16 = v20;
    id v9 = v19;
    char v4 = v18;
  }

  if (v7)
  {
    TI_SET_IS_USING_CUSTOM_DIALECT_LM(1LL);
    TI_SET_DIALECT_LM_PATH(v7);
  }

  uint64_t v27 = objc_opt_class(&OBJC_CLASS___AutocorrectionTestHarness);
  v25 = (void *)v122;
  if (v122) {
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___AutocorrectionTestHarness_Typology);
  }
  uint64_t v28 = v27;
  if (!v16)
  {
    if (!v123) {
      goto LABEL_37;
    }
    contexta = objc_autoreleasePoolPush();
    id v37 = sub_45E54();
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    __int128 v128 = 0u;
    __int128 v129 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(v37);
    id v38 = [obj countByEnumeratingWithState:&v126 objects:v142 count:16];
    if (v38)
    {
      id v39 = v38;
      __int128 v40 = v7;
      __int128 v41 = self;
      id v106 = v9;
      v108 = v40;
      v110 = v4;
      v112 = v5;
      __int128 v42 = 0LL;
      uint64_t v43 = *(void *)v127;
      double v44 = 0.0;
      do
      {
        __int128 v45 = 0LL;
        v46 = v42;
        do
        {
          if (*(void *)v127 != v43) {
            objc_enumerationMutation(obj);
          }
          v47 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)v45);
          -[NSMutableDictionary setObject:forKey:](v41->_options, "setObject:forKey:", v47, @"INPUT_MODE");
          id v48 = sub_450C8(v123, v47);
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(v48);

          double v44 = v44
              + (double)-[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:]( v41,  "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:",  v42,  v28,  v47,  @"Unable to read the dictionary file.\n",  v125);
          __int128 v45 = (char *)v45 + 1;
          v46 = v42;
        }

        while (v39 != v45);
        id v39 = [obj countByEnumeratingWithState:&v126 objects:v142 count:16];
      }

      while (v39);

      char v4 = v110;
      v49 = v123;
      v5 = v112;
      v25 = (void *)v122;
      uint64_t v16 = 0LL;
      char v7 = v108;
      id v9 = v106;
    }

    else
    {
      double v44 = 0.0;
      v49 = v123;
    }

    double v54 = v44 / 60.0;
    if (v44 > 0.0) {
      double v54 = v44;
    }
    fprintf(__stderrp, "Total testing time: %.2f s\n", v54);

    objc_autoreleasePoolPop(contexta);
    unsigned __int8 v24 = 1;
LABEL_47:
    v50 = v117;
    goto LABEL_40;
  }

  if (!sub_46010())
  {
    NSLog(@"unsupported language '%@'. You must specify a valid language!.\n", v16);
    goto LABEL_37;
  }

  -[NSMutableDictionary setObject:forKey:](self->_options, "setObject:forKey:", v16, @"INPUT_MODE");
  if (v4)
  {
    id v29 = sub_44A90((uint64_t)v4);
    id v30 = (id)objc_claimAutoreleasedReturnValue(v29);
    BOOL v31 = @"Unable to read the word list file.\n";
    id v32 = self;
    id v33 = v30;
    uint64_t v34 = v28;
    v35 = v16;
LABEL_24:
    unsigned __int8 v36 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:]( v32,  "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:",  v33,  v34,  v35,  v31,  v125);
    goto LABEL_25;
  }

  v113 = v5;
  if (v123)
  {
    id v52 = sub_450C8(v123, v16);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    unsigned __int8 v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:]( self,  "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:",  v53,  v28,  v16,  @"Unable to read the dictionary file.\n",  v125);

    v50 = v117;
    v49 = v123;
    goto LABEL_40;
  }

  if (v8)
  {
    -[NSMutableDictionary setObject:forKey:](self->_options, "setObject:forKey:", @"YES", @"RUN_DSL_TEST");
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", @"DSL_TEST_FILE"));
    -[AutocorrectionTesterAppDelegate runDslTest:withHarnessClass:forLanguage:errorMessage:]( self,  "runDslTest:withHarnessClass:forLanguage:errorMessage:",  v55,  v28,  v16,  0LL);
    unsigned __int8 v24 = v56 != 0.0;

    v50 = v117;
    v49 = 0LL;
    goto LABEL_40;
  }

  if (v121) {
    char v57 = context;
  }
  else {
    char v57 = 1;
  }
  if ((v57 & 1) == 0)
  {
    id v30 = (id)objc_claimAutoreleasedReturnValue(+[TTKTestCaseReader loadFromPath:](&OBJC_CLASS___TTKTestCaseReader, "loadFromPath:", v121));
    if (!v30)
    {
      NSLog(@"Could not open: %@", v121);
      unsigned __int8 v24 = 0;
      goto LABEL_26;
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"KEYSTROKE_SEGMENTATION_MODE"));

    if (!v65) {
      -[NSMutableDictionary setValue:forKey:]( self->_options,  "setValue:forKey:",  @"alignment",  @"KEYSTROKE_SEGMENTATION_MODE");
    }
    unsigned __int8 v36 = -[AutocorrectionTesterAppDelegate runTestCasesForSource:errorMessage:reportObserver:]( self,  "runTestCasesForSource:errorMessage:reportObserver:",  v30,  0LL,  v125);
LABEL_25:
    unsigned __int8 v24 = v36;
LABEL_26:

    goto LABEL_38;
  }

  uint64_t v105 = v28;
  if (context)
  {
    v58 = v7;
    -[NSMutableDictionary setObject:forKey:]( self->_options,  "setObject:forKey:",  @"YES",  @"PREFERS_PREDICTION_SELECTION");
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"TEST_SENTENCE_TRANSLITERATION"));
    v60 = v59;
    if (!v59) {
      v59 = @"0";
    }
    id v61 = -[__CFString BOOLValue](v59, "BOOLValue");

    v62 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_options,  "objectForKey:",  @"TRANSLITERATE_WITH_SPACES"));
    v63 = v62;
    if (!v62) {
      v62 = @"0";
    }
    id v64 = -[__CFString BOOLValue](v62, "BOOLValue");

    char v7 = v58;
    if (v119)
    {
      id v30 = (id)objc_claimAutoreleasedReturnValue( +[PlaybackTest loadFromSentence:withCatenation:]( &OBJC_CLASS___PlaybackTest,  "loadFromSentence:withCatenation:",  v119,  v61));
      char v4 = 0LL;
    }

    else
    {
      char v4 = 0LL;
      if (!v120) {
        goto LABEL_37;
      }
      id v30 = (id)objc_claimAutoreleasedReturnValue( +[PlaybackTest loadFromTextInputFile:withCatenation:addWordSpacing:]( &OBJC_CLASS___PlaybackTest,  "loadFromTextInputFile:withCatenation:addWordSpacing:",  v120,  v61,  v64));
    }

    uint64_t v34 = v105;
    if (v30)
    {
      id v32 = self;
      id v33 = v30;
      v35 = v16;
      BOOL v31 = 0LL;
      goto LABEL_24;
    }

- (BOOL)runWithObserver:(id)a3
{
  id v57 = a3;
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"STEP_INDEX"));

  if (v4)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[TISweepSource sharedInstance](&OBJC_CLASS___TISweepSource, "sharedInstance"));
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    v5 = self;
    id obj = self->_options;
    id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v66,  v71,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v67;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v67 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", v10));
          unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"[],"));
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsSeparatedByCharactersInSet:v12]);

          if ((unint64_t)[v13 count] >= 2)
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:1]);
            [v14 floatValue];
            int v16 = v15;

            LODWORD(v17) = v16;
            [v58 addValue:v10 withValue:v17];
          }
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v66,  v71,  16LL);
      }

      while (v7);
    }

    CFAbsoluteTime v18 = (void *)objc_claimAutoreleasedReturnValue([v58 debugValues]);
    id v19 = [v18 count];

    if (v19)
    {
      id v20 = v57;
      unsigned __int8 v21 = -[AutocorrectionTesterAppDelegate runAutocorrectionTester:](v5, "runAutocorrectionTester:", v57);

      goto LABEL_33;
    }

    self = v5;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"STEP_COUNT"));

  if (!v22)
  {
LABEL_30:
    id v20 = v57;
    unsigned __int8 v21 = -[AutocorrectionTesterAppDelegate runAutocorrectionTester:](self, "runAutocorrectionTester:", v57);
    goto LABEL_33;
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[TISweepSource sharedInstance](&OBJC_CLASS___TISweepSource, "sharedInstance"));
  unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", @"STEP_COUNT"));
  v59 = v23;
  objc_msgSend(v23, "setStepCount:", objc_msgSend(v24, "intValue"));

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  v25 = self;
  obja = self->_options;
  id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v62,  v70,  16LL);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v63;
    do
    {
      for (j = 0LL; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(obja);
        }
        uint64_t v30 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)j);
        BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", v30));
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"[],"));
        id v33 = (void *)objc_claimAutoreleasedReturnValue([v31 componentsSeparatedByCharactersInSet:v32]);

        if ((unint64_t)[v33 count] >= 2)
        {
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndex:1]);
          [v34 floatValue];
          int v36 = v35;

          id v37 = (void *)objc_claimAutoreleasedReturnValue([v33 objectAtIndex:2]);
          [v37 floatValue];
          int v39 = v38;

          LODWORD(v40) = v36;
          LODWORD(v41) = v39;
          [v59 addValue:v30 withMin:v40 withMax:v41];
        }
      }

      id v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v62,  v70,  16LL);
    }

    while (v27);
  }

  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v59 debugValues]);
  id v43 = [v42 count];

  if (!v43)
  {

    self = v25;
    goto LABEL_30;
  }

  double v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v59 sweepStateHeader]);
  [v44 appendFormat:@"%@results,\n", v45];

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v25->_options, "valueForKey:", @"OUTPATH"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v25->_options, "objectForKey:", @"SWEEP_EXTRACT"));
  id v48 = (void *)objc_claimAutoreleasedReturnValue([v46 stringByDeletingLastPathComponent]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 stringByAppendingPathComponent:v47]);

  v50 = (void *)objc_claimAutoreleasedReturnValue([v49 stringByAppendingFormat:@" %@ > /tmp/sweep_value.txt", v46]);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"sh %@", v50));

  id v20 = v57;
  if ([v59 finished])
  {
LABEL_28:
    v55 = (void *)objc_claimAutoreleasedReturnValue([v46 stringByDeletingPathExtension]);

    v46 = (void *)objc_claimAutoreleasedReturnValue([v55 stringByAppendingString:@"_sweep.csv"]);
    unsigned __int8 v21 = 1;
    [v44 writeToFile:v46 atomically:1 encoding:4 error:0];
  }

  else
  {
    while (-[AutocorrectionTesterAppDelegate runAutocorrectionTester:](v25, "runAutocorrectionTester:", v57))
    {
      system((const char *)[v51 cStringUsingEncoding:4]);
      id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  @"/tmp/sweep_value.txt",  4LL,  0LL));
      v53 = (void *)objc_claimAutoreleasedReturnValue([v59 sweepStateValues]);
      [v52 floatValue];
      [v44 appendFormat:@"%@%f,\n", v53, v54];

      [v59 advanceSweep];
    }

    unsigned __int8 v21 = 0;
  }

LABEL_33:
  return v21;
}

- (BOOL)runAndWriteReport
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_481AC;
  v3[3] = &unk_89990;
  v3[4] = self;
  return -[AutocorrectionTesterAppDelegate runWithObserver:](self, "runWithObserver:", v3);
}

- (void).cxx_destruct
{
}

@end