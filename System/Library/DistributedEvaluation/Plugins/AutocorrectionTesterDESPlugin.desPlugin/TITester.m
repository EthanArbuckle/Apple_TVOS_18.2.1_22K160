@interface TITester
+ (id)stringByReplacingCurlyQuotesWithStraightQuotes:(id)a3;
+ (void)runTestCasesForSource:(id)a3 options:(id)a4 reporter:(id)a5 reportObserver:(id)a6;
+ (void)runWithTests:(id)a3 inRange:(_NSRange)a4 testHarness:(id)a5 options:(id)a6 reporter:(id)a7 numTrials:(unint64_t)a8 reportObserver:(id)a9;
- (AutofillTestHarness)autofillTestHarness;
- (NSArray)tests;
- (TIReporter)reporter;
- (TITestHarness)testHarness;
- (TITester)initWithTests:(id)a3;
- (id)runTestBasedOnTestType:(id)a3 options:(id)a4 trialID:(unint64_t)a5 withError:(id)a6;
- (void)createAutofillTestHarnessInstance:(id)a3;
- (void)runTestsInRange:(_NSRange)a3 options:(id)a4 trialID:(unint64_t)a5;
- (void)setAutofillTestHarness:(id)a3;
- (void)setReporter:(id)a3;
- (void)setTestHarness:(id)a3;
@end

@implementation TITester

- (TITester)initWithTests:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TITester;
  v6 = -[TITester init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tests, a3);
  }

  return v7;
}

- (void)runTestsInRange:(_NSRange)a3 options:(id)a4 trialID:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TITester reporter](self, "reporter"));
  [v9 beginLogTrial];

  NSUInteger v40 = -[NSArray count](self->_tests, "count");
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"TEST_AUTO_FILL_FEATURE"]);
  unsigned int v11 = [v10 BOOLValue];

  v12 = @"NO";
  if (v11) {
    v12 = @"YES";
  }
  NSLog(@"Are we going to test AutoFillFeature = %@", v12);
  if (v11)
  {
    -[TITester createAutofillTestHarnessInstance:](self, "createAutofillTestHarnessInstance:", v8);
    if (!v40)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[AutofillTestHarness runAutofillTestWithoutTyping:testHarness:trialID:]( self->_autofillTestHarness,  "runAutofillTestWithoutTyping:testHarness:trialID:",  v8,  self->testHarness,  a5));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TITester reporter](self, "reporter"));
      [v14 logResult:v13];
    }
  }

  NSUInteger v39 = location + length;
  BOOL v15 = location >= location + length;
  unint64_t v16 = a5;
  if (!v15)
  {
    id v37 = v8;
    do
    {
      v17 = objc_autoreleasePoolPush();
      NSUInteger v18 = location + 1;
      fprintf(__stderrp, "Testing line: %lu/%lu\n", location + 1, v40);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_tests, "objectAtIndexedSubscript:", location));
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___TTKConversationTest);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TITester testHarness](self, "testHarness"));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 runConversationTest:v19 trialID:v16 withError:0]);

        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v23 = v22;
        id v24 = [v23 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v42;
          do
          {
            for (i = 0LL; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v42 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[TITester reporter](self, "reporter"));
              [v29 logResult:v28];
            }

            id v25 = [v23 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }

          while (v25);
          v30 = v23;
          id v8 = v37;
          unint64_t v16 = a5;
        }

        else
        {
          v30 = v23;
        }
      }

      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue( -[TITester runTestBasedOnTestType:options:trialID:withError:]( self,  "runTestBasedOnTestType:options:trialID:withError:",  v19,  v8,  v16,  0LL));
        id v23 = (id)objc_claimAutoreleasedReturnValue(-[TITester reporter](self, "reporter"));
        [v23 logResult:v30];
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TITester testHarness](self, "testHarness"));
      char v32 = objc_opt_respondsToSelector(v31, "reset");

      if ((v32 & 1) != 0)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[TITester testHarness](self, "testHarness"));
        [v33 performSelector:"reset" withObject:0];
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.05));
      [v34 runUntilDate:v35];

      objc_autoreleasePoolPop(v17);
      NSUInteger location = v18;
    }

    while (v18 != v39);
  }

  fputc(10, __stderrp);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TITester reporter](self, "reporter"));
  [v36 endLogTrial];
}

- (id)runTestBasedOnTestType:(id)a3 options:(id)a4 trialID:(unint64_t)a5 withError:(id)a6
{
  id v9 = a4;
  if (self->_autofillTestHarness)
  {
    id v10 = a3;
    unsigned int v11 = objc_alloc_init(&OBJC_CLASS___NSArray);
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[AutofillTestHarness configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping:]( self->_autofillTestHarness,  "configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping:",  v9));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TITester testHarness](self, "testHarness"));
    id v14 = (id)objc_claimAutoreleasedReturnValue([v13 runTest:v10 trialID:a5 withError:0]);

    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[AutofillTestHarness updateResultForAutoFill:predictionCandidatesWithoutTyping:]( self->_autofillTestHarness,  "updateResultForAutoFill:predictionCandidatesWithoutTyping:",  v14,  v12));
  }

  else
  {
    id v14 = a3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TITester testHarness](self, "testHarness"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 runTest:v14 trialID:a5 withError:0]);
  }

  unint64_t v16 = (void *)v15;

  return v16;
}

- (void)createAutofillTestHarnessInstance:(id)a3
{
  id v4 = a3;
  if (!self->_autofillTestHarness)
  {
    id v10 = v4;
    id v5 = self->testHarness;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TITestHarness testTyper](v5, "testTyper"));
    v7 = NSClassFromString(@"AutofillTestHarness");
    if (!v7)
    {
      fwrite("Error: Unable to load 'AutofillTestHarness' class\n\n", 0x33uLL, 1uLL, __stderrp);
      exit(1);
    }

    id v8 = (AutofillTestHarness *)[[v7 alloc] initWithOptionsAndTestTyper:v10 testTyper:v6];
    autofillTestHarness = self->_autofillTestHarness;
    self->_autofillTestHarness = v8;

    id v4 = v10;
  }
}

+ (void)runWithTests:(id)a3 inRange:(_NSRange)a4 testHarness:(id)a5 options:(id)a6 reporter:(id)a7 numTrials:(unint64_t)a8 reportObserver:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v25 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (void (**)(id, void *, void))a9;
  context = objc_autoreleasePoolPush();
  id v18 = [objc_alloc((Class)a1) initWithTests:v25];
  id v24 = v16;
  [v18 setReporter:v16];
  [v18 setTestHarness:v14];
  if (a8)
  {
    for (uint64_t i = 0LL; i != a8; ++i)
    {
      fprintf(__stderrp, "Beginning trial %lu\n", i);
      uint64_t v20 = objc_autoreleasePoolPush();
      objc_msgSend(v18, "runTestsInRange:options:trialID:", location, length, v15, i);
      if ([v14 requiresMaintenance])
      {
        +[TILanguageModelLoaderManager flushDynamicLearningCaches]( &OBJC_CLASS___TILanguageModelLoaderManager,  "flushDynamicLearningCaches");
        +[TILanguageModelLoaderManager performMaintenance]( &OBJC_CLASS___TILanguageModelLoaderManager,  "performMaintenance");
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue([v18 reporter]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 reportForTrial:i]);

      if (v17) {
        v17[2](v17, v22, i);
      }

      objc_autoreleasePoolPop(v20);
    }
  }

  objc_autoreleasePoolPop(context);
}

+ (id)stringByReplacingCurlyQuotesWithStraightQuotes:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByReplacingOccurrencesOfString:@"‘" withString:@"'"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByReplacingOccurrencesOfString:@"’" withString:@"'"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"“" withString:@"\""]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:@"”" withString:@"\""]);

  return v6;
}

+ (void)runTestCasesForSource:(id)a3 options:(id)a4 reporter:(id)a5 reportObserver:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void *, void))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKey:@"START_INDEX"]);
  unsigned int v14 = [v13 intValue];

  if (v14) {
    signed int v15 = v14 - 1;
  }
  else {
    signed int v15 = 0;
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKey:@"END_INDEX"]);
  unsigned int v17 = [v16 intValue];

  v94 = v11;
  [v11 beginLogTrial];
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 getNextTestCase]);
  if (v18)
  {
    unint64_t v98 = v17;
    unint64_t v19 = v15;
    uint64_t v20 = 0LL;
    id v89 = v10;
    id v90 = v9;
    v88 = v12;
    unint64_t v96 = v19;
    while (1)
    {
      unint64_t v21 = v20++;
      if (v21 >= v19)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v18 records]);
        id v23 = [v22 count];

        if (v23)
        {
          id v24 = objc_autoreleasePoolPush();
          fprintf(__stderrp, "Test case: %lu\n", v20);
          id v25 = [v10 mutableCopy];
          [v25 setObject:@"ACTRecordedActionStream" forKey:@"UserActionStream"];
          [v25 setObject:v18 forKey:@"TTKTestCase"];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"USE_RETROCORRECTION"]);

          if (!v26) {
            [v25 setObject:&__kCFBooleanTrue forKey:@"USE_RETROCORRECTION"];
          }
          v101 = v24;
          v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"USE_PREDICTION"]);

          if (!v27) {
            [v25 setObject:&__kCFBooleanTrue forKey:@"USE_PREDICTION"];
          }
          __int128 v110 = 0u;
          __int128 v111 = 0u;
          __int128 v108 = 0u;
          __int128 v109 = 0u;
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v18 records]);
          id v29 = [v28 countByEnumeratingWithState:&v108 objects:v115 count:16];
          if (v29)
          {
            id v30 = v29;
            v102 = v25;
            v99 = v18;
            uint64_t v100 = v21;
            uint64_t v97 = v20;
            uint64_t v31 = *(void *)v109;
LABEL_14:
            uint64_t v32 = 0LL;
            while (1)
            {
              if (*(void *)v109 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v108 + 1) + 8 * v32);
              v34 = (void *)objc_claimAutoreleasedReturnValue([v33 layoutName]);
              uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString);
              char isKindOfClass = objc_opt_isKindOfClass(v34, v35);

              if ((isKindOfClass & 1) != 0) {
                break;
              }
              if (v30 == (id)++v32)
              {
                id v30 = [v28 countByEnumeratingWithState:&v108 objects:v115 count:16];
                if (v30) {
                  goto LABEL_14;
                }
                int v37 = 2;
                v38 = v28;
                id v18 = v99;
                unint64_t v21 = v100;
                unint64_t v19 = v96;
                uint64_t v20 = v97;
                NSUInteger v39 = v101;
                id v25 = v102;
                goto LABEL_53;
              }
            }

            uint64_t v40 = objc_claimAutoreleasedReturnValue([v33 layoutName]);

            id v25 = v102;
            if (!v40)
            {
              int v37 = 2;
              id v18 = v99;
              unint64_t v21 = v100;
              unint64_t v19 = v96;
              uint64_t v20 = v97;
              NSUInteger v39 = v101;
              goto LABEL_54;
            }

            __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v9 layouts]);
            v93 = (void *)v40;
            uint64_t v42 = objc_claimAutoreleasedReturnValue([v41 objectForKey:v40]);

            v95 = (void *)v42;
            [v102 setObject:v42 forKey:@"TTKKeyboardPlane"];
            id v18 = v99;
            __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v99 metadata]);
            uint64_t v44 = objc_claimAutoreleasedReturnValue([v43 objectForKey:@"displayWidth"]);
            unint64_t v19 = v96;
            unint64_t v21 = v100;
            if (v44)
            {
              v45 = (void *)v44;
              v46 = (void *)objc_claimAutoreleasedReturnValue([v99 metadata]);
              v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKey:@"displayHeight"]);

              if (v47)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue([v99 metadata]);
                v49 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKey:@"displayWidth"]);

                v50 = (void *)objc_claimAutoreleasedReturnValue([v99 metadata]);
                v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:@"displayHeight"]);

                v52 = (char *)[v49 compare:v51];
                v53 = @"Portrait";
                if (v52 == (_BYTE *)&dword_0 + 1) {
                  v53 = @"Landscape";
                }
                v54 = v53;

LABEL_32:
                [v102 setObject:v49 forKey:@"KEYBOARD_WIDTH"];
                [v102 setObject:v54 forKey:@"KEYBOARD_ORIENTATION"];
                v55 = __stderrp;
                v92 = v49;
                unsigned int v56 = [v49 intValue];
                v91 = v54;
                fprintf( v55,  "width = %d orientation = %s\n",  v56,  (const char *)-[__CFString UTF8String](v91, "UTF8String"));
                v57 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
                v58 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
                __int128 v104 = 0u;
                __int128 v105 = 0u;
                __int128 v106 = 0u;
                __int128 v107 = 0u;
                v59 = (void *)objc_claimAutoreleasedReturnValue([v99 records]);
                id v60 = [v59 countByEnumeratingWithState:&v104 objects:v114 count:16];
                if (v60)
                {
                  id v61 = v60;
                  uint64_t v62 = *(void *)v105;
                  do
                  {
                    for (uint64_t i = 0LL; i != v61; uint64_t i = (char *)i + 1)
                    {
                      if (*(void *)v105 != v62) {
                        objc_enumerationMutation(v59);
                      }
                      v64 = *(void **)(*((void *)&v104 + 1) + 8LL * (void)i);
                      v65 = (void *)objc_opt_class(a1);
                      v66 = (void *)objc_claimAutoreleasedReturnValue([v64 primaryIntendedText]);
                      v67 = (void *)objc_claimAutoreleasedReturnValue([v65 stringByReplacingCurlyQuotesWithStraightQuotes:v66]);

                      -[NSMutableArray addObject:](v57, "addObject:", v67);
                      v68 = (void *)objc_claimAutoreleasedReturnValue([v64 layoutName]);
                      unsigned __int8 v69 = -[NSMutableArray containsObject:](v58, "containsObject:", v68);

                      if ((v69 & 1) == 0)
                      {
                        v70 = (void *)objc_claimAutoreleasedReturnValue([v64 layoutName]);
                        v71 = (void *)objc_claimAutoreleasedReturnValue([v70 description]);
                        -[NSMutableArray addObject:](v58, "addObject:", v71);
                      }
                    }

                    id v61 = [v59 countByEnumeratingWithState:&v104 objects:v114 count:16];
                  }

                  while (v61);
                }

                v72 = -[AutocorrectionTestHarness initWithAttributes:]( objc_alloc(&OBJC_CLASS___AutocorrectionTestHarness),  "initWithAttributes:",  v102);
                id v18 = v99;
                v73 = (void *)objc_claimAutoreleasedReturnValue([v99 metadata]);
                id v74 = [v73 mutableCopy];

                [v74 setValue:v58 forKey:@"layouts"];
                id v75 = sub_53C8();
                v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
                if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
                {
                  id v77 = objc_claimAutoreleasedReturnValue( [v74 objectForKeyedSubscript:@"recordIdentifier"]);
                  id v78 = [v77 cStringUsingEncoding:4];
                  *(_DWORD *)buf = 136315138;
                  id v113 = v78;
                  _os_log_impl( &dword_0,  v76,  OS_LOG_TYPE_INFO,  "Running test case with recordIdentifier: %s",  buf,  0xCu);
                }

                v79 = __stdoutp;
                id v80 = objc_claimAutoreleasedReturnValue( [v74 objectForKeyedSubscript:@"recordIdentifier"]);
                fprintf( v79,  "Running test case with recordIdentifier: %s\n",  (const char *)[v80 cStringUsingEncoding:4]);

                v81 = (void *)objc_claimAutoreleasedReturnValue( +[AutocorrectionTest testWithInput:expectedOutput:sourceMetadata:withTouches:andCorpusId:]( &OBJC_CLASS___AutocorrectionTest,  "testWithInput:expectedOutput:sourceMetadata:withTouches:andCorpusId:",  &stru_89E80,  v57,  v74,  0LL,  0LL));
                unint64_t v21 = v100;
                v82 = (void *)objc_claimAutoreleasedReturnValue( -[AutocorrectionTestHarness runTest:trialID:withError:]( v72,  "runTest:trialID:withError:",  v81,  v100,  0LL));
                [v94 logResult:v82];
                if ((objc_opt_respondsToSelector(v72, "reset") & 1) != 0) {
                  -[AutocorrectionTestHarness performSelector:withObject:]( v72,  "performSelector:withObject:",  "reset",  0LL);
                }
                v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
                v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.05));
                [v83 runUntilDate:v84];

                if (-[AutocorrectionTestHarness requiresMaintenance](v72, "requiresMaintenance"))
                {
                  +[TILanguageModelLoaderManager flushDynamicLearningCaches]( &OBJC_CLASS___TILanguageModelLoaderManager,  "flushDynamicLearningCaches");
                  unint64_t v21 = v100;
                  +[TILanguageModelLoaderManager performMaintenance]( &OBJC_CLASS___TILanguageModelLoaderManager,  "performMaintenance");
                }

                int v37 = 0;
                id v10 = v89;
                id v9 = v90;
                v12 = v88;
                unint64_t v19 = v96;
                uint64_t v20 = v97;
                NSUInteger v39 = v101;
                id v25 = v102;
                goto LABEL_52;
              }
            }

            else
            {
            }

            if (v95)
            {
              [v95 keyboardWidth];
              v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
              v54 = (__CFString *)objc_claimAutoreleasedReturnValue([v95 keyboardOrientation]);
              goto LABEL_32;
            }

            uint64_t v85 = objc_opt_class(&OBJC_CLASS___NSNull);
            uint64_t v20 = v97;
            id v25 = v102;
            if ((objc_opt_isKindOfClass(v93, v85) & 1) != 0) {
              fwrite("Unable to find keyboard layout-- layoutName is null\n", 0x34uLL, 1uLL, __stderrp);
            }
            else {
              fprintf( __stderrp, "Unable to find keyboard layout for name='%s'\n", (const char *)[v93 UTF8String]);
            }
            int v37 = 2;
            NSUInteger v39 = v101;
LABEL_52:

            v38 = v93;
            goto LABEL_53;
          }

          int v37 = 2;
          v38 = v28;
          NSUInteger v39 = v101;
LABEL_53:

LABEL_54:
          objc_autoreleasePoolPop(v39);
        }
      }

      v86 = (void *)objc_claimAutoreleasedReturnValue([v9 getNextTestCase]);

      id v18 = v86;
      if (!v86) {
        goto LABEL_60;
      }
    }
  }

  v86 = v18;
LABEL_60:
  [v94 endLogTrial];
  v87 = (void *)objc_claimAutoreleasedReturnValue([v94 reportForTrial:0]);
  if (v12) {
    v12[2](v12, v87, 0LL);
  }
}

- (TIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (NSArray)tests
{
  return self->_tests;
}

- (TITestHarness)testHarness
{
  return self->testHarness;
}

- (void)setTestHarness:(id)a3
{
}

- (AutofillTestHarness)autofillTestHarness
{
  return (AutofillTestHarness *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAutofillTestHarness:(id)a3
{
}

- (void).cxx_destruct
{
}

@end